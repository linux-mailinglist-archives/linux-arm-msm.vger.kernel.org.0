Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236AF3B221A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 22:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhFWU73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 16:59:29 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:44694 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhFWU73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 16:59:29 -0400
Received: by mail-pl1-f176.google.com with SMTP id x22so1793275pll.11;
        Wed, 23 Jun 2021 13:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dCbNvB195lzRxEPacx+kghC6AqDatShZ2Iju3tl1niA=;
        b=fiE+kApE680QUkP/hL3nRF9kqIDAsjcA/JDRoCrZWrvur8eevMlETM0bn5ttdIZ2hZ
         RHudf/nvTy1D//f6EVXntrFsBKC2WPJoifsHnz1+uFMSFZ6dLKPJ43PFpVtfwgoDD6nD
         aP8G9n8+XTGqV2HipZHPzFKUaG9t1XiZDtv4vOGykgP9DRlZZSYWU/czBcG4kEluqgSC
         8g2V9zcsI/mpcGobcWHtMVp1Fs5fDK28ro/ocR4x11vZ6/7b3NHkZI8o9hp30HmlqWA4
         mEj5rqFKk1L/qDOetPyh3JX2nfm5eH9BMqI4Fu1vZ/qgUGzCTp0VVebHvSJ7YcKRN8Xc
         0jJA==
X-Gm-Message-State: AOAM533dgMC6BmqvISw0QVK2HBLm6+EYNOkkl5WjRFs8Onn60Aufsmcp
        fJ+oHAVkkXnX1+hpFG7ztlcPmb8B8HRThQ==
X-Google-Smtp-Source: ABdhPJzphgwLtLF53pRxpj+Fy/zlEYFmNS9KazvNDNJqMwpPnzGiDUn3/HKrqclmto6rplIehLPQXA==
X-Received: by 2002:a17:90a:8d83:: with SMTP id d3mr1564809pjo.226.1624481829139;
        Wed, 23 Jun 2021 13:57:09 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id o34sm34910pgm.6.2021.06.23.13.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 13:57:08 -0700 (PDT)
Subject: Re: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and
 is_sys_suspended
From:   Bart Van Assche <bvanassche@acm.org>
To:     Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, hongwus@codeaurora.org,
        ziqichen@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Satya Tangirala <satyat@google.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1624433711-9339-1-git-send-email-cang@codeaurora.org>
 <1624433711-9339-2-git-send-email-cang@codeaurora.org>
 <1c5db457-ee87-2308-15f5-5dad49508f10@acm.org>
Message-ID: <c7c5d95e-8a69-dfef-44ea-bfcadd6ea5d5@acm.org>
Date:   Wed, 23 Jun 2021 13:57:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1c5db457-ee87-2308-15f5-5dad49508f10@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/23/21 1:05 PM, Bart Van Assche wrote:
> On 6/23/21 12:35 AM, Can Guo wrote:
>> Rename pm_op_in_progress and is_sys_suspended to wlu_pm_op_in_progress and
>> is_wlu_sys_suspended accordingly.
> 
> My understanding is that power management operations must be submitted
> to one particular UFS WLUN (hba->sdev_ufs_device). That makes the "wlu_"
> part of the new names redundant. In other words, I like the current
> names better than the new names. Unless if I missed something, consider
> dropping this patch.

Hi Can,

Reviewing later patches in this series made me realize that there are
two families of suspend/resume functions. One family of functions
operates at the platform level while the other family operates at the
SCSI LUN level. My comments about the suspend/resume functions are as
follows:
- It seems redundant to me to have system suspend support at the SCSI
  LUN level (__ufshcd_wl_suspend(hba, UFS_SYSTEM_PM)) and also at the
  platform level. Since the platform device is a parent of the SCSI
  WLUN, can system suspend/resume support be left out from
  ufshcd_wl_pm_ops (or in other words, remove the .freeze and .thaw
  callbacks)? Do we really need two calls from the power management
  subsystem into the UFS driver for every system suspend and every
  system resume?
- Because of the device links (device_link_add()), the ufschd_wl_*()
  RPM callbacks are invoked after all LUNs have been suspended. I would
  appreciate it if the "ufshcd_wl_" prefix would be changed into
  "ufshcd_lun_" since that would make it more clear that these callbacks
  are associated with all LUNs and not only with the WLUN through which
  power management commands are submitted.

Thanks,

Bart.
