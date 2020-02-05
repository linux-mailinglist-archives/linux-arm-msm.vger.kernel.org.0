Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2C5153B3F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 23:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgBEWp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 17:45:26 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51281 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727565AbgBEWpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 17:45:25 -0500
Received: by mail-pj1-f65.google.com with SMTP id fa20so1597124pjb.1;
        Wed, 05 Feb 2020 14:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0bcRadV2UJTOgRUGh5EQgbkbXanJFAz0E1VJFEcU0fA=;
        b=nL19jTnr+UtIZUrUyh1qfCHUlc3mGJQzrBFaOFL7s0FKvVw0AAcZMWETyJu9M44+Fc
         Z0U/W1IoFAcyx7HwZD1hb+k35lW2DNEh+Yh1FsyuQlv+fd3gZAwNnA16Gg3PePBaex3d
         Xa40SjUp5d0r3AxwaLgrptYEYycKIVSjwogwwMpZ4/y0R7ADRWsTdmMTxa7+PzmwpsKc
         L05i9OTo9MKvCd9+mdV5PSMM8XKypyUnqRlsZ1l/TzGhKwcm9+fB+qx0NtnqRgopwGGV
         xUZkAy/7lpb9gNhvI9rzeEoOoInGn2ZtxbzNKEyOxHyvDFwvFYCl/kx94e1TBt4d98r/
         y4uQ==
X-Gm-Message-State: APjAAAWUTQxx771OjIwcvpvQ+MWe3YcKva0MF5EsydA/Wfx0irm6mHMj
        Ms2ChOaVyQKSwHZmop2HmoYbF/34NUs=
X-Google-Smtp-Source: APXvYqy2Be4/PSxc5lyGQOYsxvsoLyc1S9eltGyYFdxnWDALqWHhsNkTXSBAtsvN6XPP9vluDg6QHw==
X-Received: by 2002:a17:90a:7781:: with SMTP id v1mr538716pjk.108.1580942724481;
        Wed, 05 Feb 2020 14:45:24 -0800 (PST)
Received: from desktop-bart.svl.corp.google.com ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
        by smtp.gmail.com with ESMTPSA id f18sm796557pgn.2.2020.02.05.14.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 14:45:23 -0800 (PST)
Subject: Re: [PATCH] scsi: ufs: Fix registers dump vops caused scheduling
 while atomic
To:     Can Guo <cang@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1580882795-29675-1-git-send-email-cang@codeaurora.org>
 <3e529862-7790-c506-abaa-9a6972f5d53c@acm.org>
 <749a1db94df00278ec9f5c121cd937fe@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <7931a786-8e2c-1529-8910-3d4f6c816580@acm.org>
Date:   Wed, 5 Feb 2020 14:45:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <749a1db94df00278ec9f5c121cd937fe@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/4/20 10:31 PM, Can Guo wrote:
> Do you mean by splitting ufshcd_print_host_regs() into two functions?
> One behaves identically same to the current function, another one called
> ufshcd_print_host_regs_nosleep(). No?

Hi Can,

Not really. I had something else in mind.

Having taken a closer look at ufs_qcom_dump_dbg_regs() I started 
wondering why there are sleep statements in that function. Is the goal 
of these sleep statements perhaps to reduce how often printk() is 
called? Has it been considered to remove all sleep calls from 
ufs_qcom_dump_dbg_regs() and instead add something like the following at 
the start of that function:

	static DEFINE_RATELIMIT_STATE(_rs,
				      DEFAULT_RATELIMIT_INTERVAL,
				      DEFAULT_RATELIMIT_BURST);
									
	if (!__ratelimit(&_rs))
		return;


Thanks,

Bart.
