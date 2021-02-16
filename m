Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC2931CF30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 18:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhBPRj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 12:39:28 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:19299 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229913AbhBPRj1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 12:39:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613497146; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=dHSm7vvwLQgIxBTKqi4LaoYnmAC8Gq0ayiqNbTZxQok=; b=tWXN9NA4bVFBJbhNhgptM+DjXcD7ZscwMZLpjkKgWf9ZlUuQgkrph1OVC77uu4M1KknNXG6p
 sK+QP+dw+Dtqdpj0yUZ+hQC5hBp+mzY0TouOsVWd7eAZSvjHbyrvuDQeHTstJlHRbQvuUffc
 4B9UAh1Y5Z8Fv22Tbao0vhNZU2I=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 602c031906bddda9df22eec2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 17:38:33
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92211C433CA; Tue, 16 Feb 2021 17:38:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B38A5C433CA;
        Tue, 16 Feb 2021 17:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B38A5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Tue, 16 Feb 2021 09:38:29 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stern@rowland.harvard.edu, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v3 1/1] scsi: ufs: Enable power management for wlun
Message-ID: <20210216173829.GB35819@stor-presley.qualcomm.com>
References: <cover.1613070911.git.asutoshd@codeaurora.org>
 <eed327cdace40d1e1d706da5b0fa64ea4ee99422.1613070912.git.asutoshd@codeaurora.org>
 <29fcd3c1-72c7-1191-ec03-aea1b0c6b8c9@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <29fcd3c1-72c7-1191-ec03-aea1b0c6b8c9@acm.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 12 2021 at 19:25 -0800, Bart Van Assche wrote:
>On 2/11/21 11:18 AM, Asutosh Das wrote:
>> +static inline bool is_rpmb_wlun(struct scsi_device *sdev)
>> +{
>> +	return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
>> +}
>> +
>> +static inline bool is_device_wlun(struct scsi_device *sdev)
>> +{
>> +	return (sdev->lun ==
>> +		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
>> +}
>
>A minor comment: checkpatch should have reported that "return is not a
>function" for the above code.
>
>>  /**
>> + * ufshcd_setup_links - associate link b/w device wlun and other luns
>> + * @sdev: pointer to SCSI device
>> + * @hba: pointer to ufs hba
>> + *
>> + * Returns void
>> + */
>
>Please leave out "Returns void".
>
>> +static int ufshcd_wl_suspend(struct device *dev)
>> +{
>> +	struct scsi_device *sdev = to_scsi_device(dev);
>> +	struct ufs_hba *hba;
>> +	int ret;
>> +	ktime_t start = ktime_get();
>> +
>> +	if (is_rpmb_wlun(sdev))
>> +		return 0;
>> +	hba = shost_priv(sdev->host);
>> +	ret = __ufshcd_wl_suspend(hba, UFS_SYSTEM_PM);
>> +	if (ret)
>> +		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__,  ret);
>> +
>> +	trace_ufshcd_wl_suspend(dev_name(dev), ret,
>> +		ktime_to_us(ktime_sub(ktime_get(), start)),
>> +		hba->curr_dev_pwr_mode, hba->uic_link_state);
>> +
>> +	return ret;
>> +
>> +}
>
>Please remove the blank line after the return statement.
>
>Otherwise this patch looks good to me. Hence:
>
>Reviewed-by: Bart Van Assche <bvanassche@acm.org>
>

Done.

Thanks,
-asd
