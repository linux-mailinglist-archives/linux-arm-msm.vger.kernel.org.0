Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894AB2E9268
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 10:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbhADJQ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 04:16:27 -0500
Received: from mga06.intel.com ([134.134.136.31]:20029 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbhADJQ1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 04:16:27 -0500
IronPort-SDR: zHbpo+yy1yx8S6yMJ23uwwiK4ahoATJ+NWZJCmS/wpugeI9ewfnZTHCfXKc2rfrzLlmPPZ7cbT
 2kwp6SGDBFZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9853"; a="238480473"
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; 
   d="scan'208";a="238480473"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 01:15:45 -0800
IronPort-SDR: b7X9+Jo+qFrJ1FgbRx9pH3NHIwGowsTxAjKIdaJ0mMTFSovdQ5+zqmk7fLyfZbmcMG0sDkIDUa
 T5szOEwBfyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; 
   d="scan'208";a="349833423"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94]) ([10.237.72.94])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jan 2021 01:15:37 -0800
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
To:     Ziqi Chen <ziqichen@codeaurora.org>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, cang@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        kwmad.kim@samsung.com, stanley.chu@mediatek.com
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Satya Tangirala <satyat@google.com>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
Date:   Mon, 4 Jan 2021 11:15:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/12/20 3:49 pm, Ziqi Chen wrote:
> As per specs, e.g, JESD220E chapter 7.2, while powering
> off/on the ufs device, RST_N signal and REF_CLK signal
> should be between VSS(Ground) and VCCQ/VCCQ2.
> 
> To flexibly control device reset line, refactor the function
> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
> new parameter "bool asserted" is used to separate device reset
> line pulling down from pulling up.

This patch assumes the power is controlled by voltage regulators, but for us
it is controlled by firmware (ACPI), so it is not correct to change RST_n
for all host controllers as you are doing.

Also we might need to use a firmware interface for device reset, in which
case the 'asserted' value doe not make sense.

Can we leave the device reset callback alone, and instead introduce a new
variant operation for setting RST_n to match voltage regulator power changes?
