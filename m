Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F843B6749
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 19:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbhF1RKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 13:10:15 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:45986 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233015AbhF1RKK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 13:10:10 -0400
Received: by mail-pl1-f173.google.com with SMTP id i4so9283758plt.12;
        Mon, 28 Jun 2021 10:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5cLxTwDsCSrtdWkFMbm5QuhzGbb4I7nKkvY0D1dGHlY=;
        b=AJBJ3mfSjL64Qqz2CblyDXlAvB6NAh/WN9jGvW8MLpb5HMe/HZV26LaRMaR3FJ0co4
         SsaoyEASviUEjdU2lVF9h32EIjiLvknQ8A8GcDJIJkuYPeg3QwzvXyENPN0uFwTKs/2X
         NX3PC/7rexJBT73ho+EeUejp7pHyboNv9IQNhz2Gx4dNqsso46UPjebnmzvuqGg0EoDV
         lzG4cVXMuJDmJXtsn24iEGH8/oEY1sOKmo+s6/NkOiI5cgMKb5UEx8+MEu0zJJaiFSyg
         MOt+B2sfLr/vKb2WtkA9FA2m5bFjOVSvRtAorQvMJaeadXjYuvIuhMqZcEG1p9kuhirM
         CKJA==
X-Gm-Message-State: AOAM532ESK0HPWGiYLa3J8x+GMBRYT7SBeKRryfIvw6Sn/4iYxh5eMEd
        3Af9HNozU0zpN84v0Ogn5HcS+KrjzqQ=
X-Google-Smtp-Source: ABdhPJzftsh0Nqv/HqgGTQbkic+FQnrxH2nrmHfzLcH8UeToPUbzrrLGPV9EGzpZWjBv9BAGAhkAJw==
X-Received: by 2002:a17:90a:ea88:: with SMTP id h8mr7952693pjz.147.1624900064200;
        Mon, 28 Jun 2021 10:07:44 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id v9sm14732437pfn.22.2021.06.28.10.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 10:07:43 -0700 (PDT)
Subject: Re: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and
 is_sys_suspended
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, hongwus@codeaurora.org,
        ziqichen@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com, Andy Gross <agross@kernel.org>,
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
 <cb39c5d7-c21d-66b1-0a86-f9154f73a94e@acm.org>
 <b7562bc820fc712196104a5eae30e2e4@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <50023fb6-7b61-e5dd-9fac-e0be3adbbadc@acm.org>
Date:   Mon, 28 Jun 2021 10:07:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b7562bc820fc712196104a5eae30e2e4@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/28/21 12:01 AM, Can Guo wrote:
> On 2021-06-25 07:42, Bart Van Assche wrote:
>> On 6/23/21 12:35 AM, Can Guo wrote:
>>> Rename pm_op_in_progress and is_sys_suspended to
>>> wlu_pm_op_in_progress and
>>> is_wlu_sys_suspended accordingly.
>>
>> Can the is_wlu_sys_suspended member variable be removed by checking
>> dev->power.is_suspended where dev represents the WLUN?
>>
> 
> No, PM set dev->power.is_suspended to "false" even the device failed
> resuming,
> while is_wlu_sys_suspended can be used to tell that.

(+Rafael)

Hi Rafael,

In drivers/base/power/main.c we found the following code:

 End:
	error = dpm_run_callback(callback, dev, state, info);
	dev->power.is_suspended = false;

Is it a bug or a feature that dev->power.is_suspended is set to false if
dpm_run_callback() fails? I'm asking this because only clearing
dev->power.is_suspended if dpm_run_callback() returns 0 would allow to
simplify the UFS driver. It can happen for UFS devices that runtime
resume fails and if this fails we need to track this.

Thanks,

Bart.
