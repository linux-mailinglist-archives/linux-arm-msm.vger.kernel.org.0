Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C31CF17CC8E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 07:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgCGGsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Mar 2020 01:48:25 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46841 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgCGGsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Mar 2020 01:48:24 -0500
Received: by mail-pl1-f193.google.com with SMTP id w12so1784339pll.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 22:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qllPESSc2Lk51pmSOF1Cje56g6TCrSuyTFey48WdPLA=;
        b=oYj04wtyq2tI/CyhVx89yOKNdUBywh3PV+ap2B3yqZcF+9f8ekTJjite0emNQOKlzO
         ui3U9hoReI9QegstBbtvspLU2iGu16gclFh39UCOuUl5o9ZviyN8ui0VcbiyFHqZyMUL
         k0O88vqLnqirtieUgTUVaS4RPPapD6wRD2+96X8saRElV0N1ftDLhz1xe5wsquWiAL8a
         NGJUkh8QKpJn3CIERa7dOP+qCjBx45IVguLmGe6F93N9ge1F/3Pb2uppXIzm0DRKrolX
         rOSIgkOqPj35dPCrhBG4q46GwvoQRXMdaJz6QlNKWkcIYALNnNmKNfAJKXV5ZauWzayR
         AhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qllPESSc2Lk51pmSOF1Cje56g6TCrSuyTFey48WdPLA=;
        b=sW25nEjXzyGkQp15lyxHzEU5qh/qUp7/e2CfkWkf5m51VCZIXCaFggtqTsZWC0wdJH
         7njEyzJNah7ggGm9SS7dpvRhT/7ym+yQbgsq1zbX/SRdGBvPrHeZfDJnWLph+g1hYtU6
         EQI5DoLC/LI+oHiOB3RIAq6YW30yoLkiidaWXifrXnAjC7ZV3C6zJoJg8HnrKpLWJA24
         EZTgzITFmrQJCTcAunj3+Go6qCGLN+QJ0o4uOMNyXogV+WrBeVIjlpChiJB9c1Ux/qZB
         ucVlfEoWrAyw0U3BOjY7rTL5Z64ZP7gf4rK8lyTlzhyh55cNxcdBx4Jfh5scIRBQY8NW
         nPbw==
X-Gm-Message-State: ANhLgQ0ARqe+5jtbia9MDsPHXiWBiNMT9W+GK9mjLPs32voytrO9nsb8
        pNZy7nmtPpnp8mmSfPRKl/ihbQ==
X-Google-Smtp-Source: ADFU+vs/Ut0Bo1SjS+PWqL3kvYRpVqLtaXfMl7A/GAt0IPidZkuHuUzW4rpYuRO8I8A5ILvqT5lX6g==
X-Received: by 2002:a17:90a:3188:: with SMTP id j8mr7337615pjb.82.1583563703667;
        Fri, 06 Mar 2020 22:48:23 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z3sm11460708pjr.46.2020.03.06.22.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 22:48:23 -0800 (PST)
Date:   Fri, 6 Mar 2020 22:48:20 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
Subject: Re: [PATCH v3 4/4] arm64: defconfig: Enable SoC sleep stats driver
Message-ID: <20200307064820.GH1094083@builder>
References: <1583479412-18320-1-git-send-email-mkshah@codeaurora.org>
 <1583479412-18320-5-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583479412-18320-5-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 05 Mar 23:23 PST 2020, Maulik Shah wrote:

> Enable SoC sleep stats driver. The driver gives statistics for
> various low power modes on Qualcomm Technologies, Inc. (QTI) SoCs.
> 
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index a8de3d3..2dd543b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -793,6 +793,7 @@ CONFIG_QCOM_SMD_RPM=y
>  CONFIG_QCOM_SMP2P=y
>  CONFIG_QCOM_SMSM=y
>  CONFIG_QCOM_SOCINFO=m
> +CONFIG_QCOM_SOC_SLEEP_STATS=m
>  CONFIG_ARCH_R8A774A1=y
>  CONFIG_ARCH_R8A774B1=y
>  CONFIG_ARCH_R8A774C0=y
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
