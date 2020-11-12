Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B5B2B0BFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 19:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgKLSAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 13:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgKLSA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 13:00:27 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36807C0613D1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 10:00:27 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id t143so7320835oif.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 10:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uNJ5eMTuI/eF0JED79RYDzkiBDvoiLGjhKrBZ4BVH/g=;
        b=bpKjXi1W+7OBeRaFRnHuyva7vt7de03EhDO4l1KRgRfsi4PR8atG2KPUgUW0C3S+P2
         4Fc3rBhV60E4AART4sG84XPoyL02q2a51kJsRXE9ay5zj7XqXvm33BgwFm1bD5mJ+jIw
         ML/xM/X4NqJH2p6C4rDMO+0tUliuifjXr54gXESFza2avo4Fyiw0V6VvrpThJNObWwUw
         nblbiFSFY1pQ6VmkB5QKgtA0J9nikuLzCAcRxhXf7zVieYUvpEcluI4AL/UpA30s5+eQ
         DxQYMvxZG+32e3Xkqtsf7QNfdTHCUwgttkjFYReNs+f2IUzE927yxatxZDrEhwhPQ/tt
         1A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uNJ5eMTuI/eF0JED79RYDzkiBDvoiLGjhKrBZ4BVH/g=;
        b=r/2pB+BHPZq1+UBRvkHoI6JoAFw9dyYXswE5Wo+EIAbA08DPylBFX8/qecyeUaR57V
         ZD77rRyXR2bof6wwx7TgoNpHovS+T72KoPJDpMwE8c8CYB+R27Lplc+kj7jwNtrZUjwU
         QRlUOG1VfEWkgQbR+JESGPInFQkCsOO4SSO/qMlPzkg8j6yK42jSAjR2ZAtgca4rKMTt
         dkiXl/oPqHI9wosrbdZuHlRyahwgb4HZYz5FKcU2lbSt2PPI8h4VhOtcYyL0BqudA1Kk
         iuWnKnegwfSuhZRdhY+v0FUR91fS3wtvCmxx8kJFXn+npm8HEnNTQtnuHuni1CgKlkxT
         FExg==
X-Gm-Message-State: AOAM533ccmUV7JirVjZv1jAtgrUGlLr2s8YeyTbucT6CNg5zXNyDQPEy
        6C4pXInrd9zx7dDdKHTokOCftk+j6R7quLNg
X-Google-Smtp-Source: ABdhPJzmasViwKQcggqVMiR+zuDeXJk1dwXzg05U2KJzVyPiW8p1HperM2EU+rRnO+PKHbvjs4NXUw==
X-Received: by 2002:aca:6004:: with SMTP id u4mr703107oib.8.1605204026605;
        Thu, 12 Nov 2020 10:00:26 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id k13sm1397131ooi.41.2020.11.12.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 10:00:25 -0800 (PST)
Subject: Re: [PATCH v2 0/4] remoteproc: Improvement for the Qualcomm sysmon
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <71bd287c-a48a-11db-354f-0aee07ba2eeb@kali.org>
Date:   Thu, 12 Nov 2020 12:00:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/4/20 10:50 PM, Bjorn Andersson wrote:
> The core part of this series is the update to the sysmon driver to ensure that
> notifications sent to the remote processor are consistent and always present
> valid state transitions.
>
> In testing this I finally took the time to fix up the issue of the SMP2P based
> graceful shutdown in the remoteproc drivers always timing out if sysmon has
> already successfully shut down the remote processor.
>
> Bjorn Andersson (4):
>   remoteproc: sysmon: Ensure remote notification ordering
>   remoteproc: sysmon: Expose the shutdown result
>   remoteproc: qcom: q6v5: Query sysmon before graceful shutdown
>   remoteproc: sysmon: Improve error messages
>
>  drivers/remoteproc/qcom_common.h    |   6 ++
>  drivers/remoteproc/qcom_q6v5.c      |   8 +-
>  drivers/remoteproc/qcom_q6v5.h      |   3 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c |   2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  |   2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  |   2 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c |   2 +-
>  drivers/remoteproc/qcom_sysmon.c    | 121 +++++++++++++++++++++-------
>  8 files changed, 109 insertions(+), 37 deletions(-)
>
Entire series tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

