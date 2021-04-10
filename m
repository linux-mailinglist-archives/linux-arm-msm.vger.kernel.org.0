Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD18F35AC0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 10:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234180AbhDJI5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Apr 2021 04:57:18 -0400
Received: from mga09.intel.com ([134.134.136.24]:62656 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhDJI5R (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Apr 2021 04:57:17 -0400
IronPort-SDR: kDlqONX5av6UGb9bkJlGDPYPQTq7f7eXowsLnx2+p6pBy7asJQmW+0D+E/Qpd1rTYfyegcm5zV
 6rp3GgbOW9Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="194017797"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
   d="scan'208";a="194017797"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2021 01:57:02 -0700
IronPort-SDR: UNAyZXiPJr5/1H27ai/RqICtqNQlQe19jgPWiHQfvM3tSHgjNkdgKG02aLFmOw4lAVw0BgSRZF
 e+bzSof/vO/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
   d="scan'208";a="520554761"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2021 01:56:56 -0700
Subject: Re: [PATCH v17 2/2] ufs: sysfs: Resume the proper scsi device
To:     Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1617893198.git.asutoshd@codeaurora.org>
 <3f005b59d9d83c8a5cc7cb77b0c5b27c807d7430.1617893198.git.asutoshd@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <6784a588-b9ff-ebc5-8b34-785f5d3b04c5@intel.com>
Date:   Sat, 10 Apr 2021 11:57:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3f005b59d9d83c8a5cc7cb77b0c5b27c807d7430.1617893198.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/04/21 5:49 pm, Asutosh Das wrote:
> Resumes the actual scsi device the unit descriptor of which
> is being accessed instead of the hba alone.
> 
> Reviewed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-sysfs.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
> index d7c3cff..fa57bac 100644
> --- a/drivers/scsi/ufs/ufs-sysfs.c
> +++ b/drivers/scsi/ufs/ufs-sysfs.c

<SNIP>

> @@ -899,11 +899,15 @@ static ssize_t _pname##_show(struct device *dev,			\
>  	struct scsi_device *sdev = to_scsi_device(dev);			\
>  	struct ufs_hba *hba = shost_priv(sdev->host);			\
>  	u8 lun = ufshcd_scsi_to_upiu_lun(sdev->lun);			\
> +	int ret;							\
>  	if (!ufs_is_valid_unit_desc_lun(&hba->dev_info, lun,		\
>  				_duname##_DESC_PARAM##_puname))		\
>  		return -EINVAL;						\
> -	return ufs_sysfs_read_desc_param(hba, QUERY_DESC_IDN_##_duname,	\
> +	scsi_autopm_get_device(sdev);					\
> +	ret = ufs_sysfs_read_desc_param(hba, QUERY_DESC_IDN_##_duname,	\
>  		lun, _duname##_DESC_PARAM##_puname, buf, _size);	\
> +	scsi_autopm_put_device(sdev);					\
> +	return ret;							\

I am not sure why this change is needed.  It it is needed, please add
a comment explaining.

