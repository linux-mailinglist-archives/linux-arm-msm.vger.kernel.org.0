Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9FC219C14
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 11:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgGIJ0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 05:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgGIJ0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 05:26:52 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD6AC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 02:26:51 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s10so1546743wrw.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+1I4jxbnB9+pwYCD3ssRtU/qs6gk1hVZpkfZD/YCMGc=;
        b=r+8IA1u2+7fPZ1dedoERCi3QiSAfaM0+gRSpXR+DH/UDV6OckrN2sWpeiLyd8JDPQq
         Lcv1iefAnqZpljE+b4p/oZgBEof86DD2FyIGQrl4s51ElJiaOrvhe1UauDNrp7dxaozw
         LZTF5M+pwN3OCCHFzZ5Jp7Hkcl3mDQrCXNmSRh2FEM1/GY7y6ijkoEucQ+h1WwV8oVvR
         heeBhuJnyWJMrze7v5lJ2yTMQC+DR8gAd1I94EPDyjuzNL+PpYhElDCqYJLn/c09YyIu
         UGC+AhRNBrtLpBfCJpZCyI77IpfKV83GFNLQh9XTwstaNNLX8iCWSFPWUof/lbg7JB1Y
         jU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+1I4jxbnB9+pwYCD3ssRtU/qs6gk1hVZpkfZD/YCMGc=;
        b=fBN7O8C4mdg8bUM0VFoAn7ZmAMhKzYsC4+d8SHiiBd17GkC1Fmtzq34oUnfENTCt+a
         OHN5wTYuuI2tKGqSIFydIX9yXsKtW4fCnlqnF+1dc17hZSCwvEYvFTOPGOwZD4Sh+VXC
         CZx149qmbLvZ/bRMaY5b0ntOGMSwk+MSHRD/RfN3Iu2HIv1RbAFMhHMeumIlRT6E+T2a
         BK3dyJfsd8nAsI8TyMQ1tf5bb/J8DQSw1NfABWPlMicZkFd/o9Pcx5fkecaycuhqgVYT
         bGOQh+6j4dYYEyyMiRPR8YWkBJCSgJVYpMCzjsxJcN2WKWdDomZ6PzOpferukxcRvS8N
         vfag==
X-Gm-Message-State: AOAM532whYAu8Up5/5B1nmR9HF/cYZVTTcUNcF9dGI7RhxM4YeCIHrEX
        IzrqnWbUqda+sdvy3ZCTIbN+2Q==
X-Google-Smtp-Source: ABdhPJwjQruNF0J+1UG47VW6l2CSzlcWt5uo3fjSlpR7URmTB6krRcG4ZUyPGnTaYu3dCAsJO60xmg==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr59680045wrw.145.1594286810655;
        Thu, 09 Jul 2020 02:26:50 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c15sm3888495wme.23.2020.07.09.02.26.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:26:50 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/8] ASoC: qcom: Add common array to initialize soc
 based core clocks
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-2-git-send-email-rohitkr@codeaurora.org>
Message-ID: <ee41f6f5-8677-5342-166d-1a71471dc178@linaro.org>
Date:   Thu, 9 Jul 2020 10:26:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-2-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/07/2020 06:08, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> LPASS variants have their own soc specific clocks that needs to be
> enabled for MI2S audio support. Added a common variable in drvdata to
> initialize such clocks using bulk clk api. Such clock names is
> defined in variants specific data and needs to fetched during init.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-apq8016.c | 39 +++++++++++++++++++--------------------
>   sound/soc/qcom/lpass.h         | 10 +++++++---
>   2 files changed, 26 insertions(+), 23 deletions(-)

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
