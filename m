Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0053B218A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 22:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFWUIF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 16:08:05 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:39885 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWUID (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 16:08:03 -0400
Received: by mail-pl1-f170.google.com with SMTP id d1so1102022plg.6;
        Wed, 23 Jun 2021 13:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jZtnIba38VOxOdV7QZ8WCZ06ktsu2UfEmSyMUoRu06c=;
        b=pXXLN67faVkdwas1SiGqGAFbOG5A2cta+W2saEHzE8Ldmj6sZ01FnNa6n6LXUjn7Qf
         WlyzHomBSjZaJUZoiSoLJkYG2hCzAGtx8D56lvNUIz3IsaUpK5TrBDYeWsYuMTPKqoLN
         hIxu7K/U0UZBCiVdZTT6XiosLcgyiVHPclMdQ/WITSJa5m1C9tBoDI7PMe5TzGSnd3W8
         0r2twGwsXD9caPF+TZv/cTzRxUbuedLonbiQweckztmSq0J6Lnip+/tphbknl5XoSGxd
         Au0IqYtf1+P8ItO/UrEvrr8vI3XUXvy/rEgHCqG7hruQzDUOMXKd1I8+9O8I8bM29kKh
         QKfw==
X-Gm-Message-State: AOAM5309roVKf9jQbC6ktKT/hSboXP5V1NeNuMTkiwn/mdUeBDgwLZP7
        TbgtepOZ8J/DQgR8T7phCfZo/QBH0/DHTQ==
X-Google-Smtp-Source: ABdhPJxFJRcqIyn4UQMocls0xkI6Mw83I6DBWbP8KaU8RdegyB0vkglpuB4i7OLpIunQ4ajlspzbRQ==
X-Received: by 2002:a17:902:7241:b029:126:aa2b:a0d1 with SMTP id c1-20020a1709027241b0290126aa2ba0d1mr1287075pll.51.1624478744120;
        Wed, 23 Jun 2021 13:05:44 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id h27sm655632pfr.171.2021.06.23.13.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 13:05:43 -0700 (PDT)
Subject: Re: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and
 is_sys_suspended
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
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <1c5db457-ee87-2308-15f5-5dad49508f10@acm.org>
Date:   Wed, 23 Jun 2021 13:05:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624433711-9339-2-git-send-email-cang@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/23/21 12:35 AM, Can Guo wrote:
> Rename pm_op_in_progress and is_sys_suspended to wlu_pm_op_in_progress and
> is_wlu_sys_suspended accordingly.

Hi Can,

My understanding is that power management operations must be submitted
to one particular UFS WLUN (hba->sdev_ufs_device). That makes the "wlu_"
part of the new names redundant. In other words, I like the current
names better than the new names. Unless if I missed something, consider
dropping this patch.

Thanks,

Bart.
