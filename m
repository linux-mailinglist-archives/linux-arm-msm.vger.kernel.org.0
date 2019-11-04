Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E776EEA00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 21:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbfKDUm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 15:42:26 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46465 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfKDUm0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 15:42:26 -0500
Received: by mail-pg1-f193.google.com with SMTP id f19so12217710pgn.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 12:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6/9m8wELRRDxWE7OlbiB0B3Q1hTAzR2tNA33WCbLmsw=;
        b=OdxYxVSVQHvqXu5SKnoyvE3TkGJTpN2Vz+UnWjjn6DRcm3LgmX/pGG5UeLpbYSsuH5
         sjmJDv0xugSDXNI5icN693KOUFS2fW+0XEnH6GmbSDhGM4UHGaLSBXobpqbr8SmHgOUw
         a15pVeYOelcGy3ooGUKqHFSgex9wrO8LG4rtKaA+Pq5CGR6HLDkpMXxxkfnMeo//19Ie
         GUMTOwi5j9JgFxFqlOq0BcYdnAOkq63bdLD9GBo28GZFCaJPE7xoYjB2FGQkjVD1MUv/
         US6oSbBDXgWvqPoPdDVu0YDBOYPkM1JLN8c0JOKcgBlj1RMm4m9hSGsxyYxSuqydHLlv
         42Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6/9m8wELRRDxWE7OlbiB0B3Q1hTAzR2tNA33WCbLmsw=;
        b=GcwbgIArxzbmHVM4DOykpwEh9EjxEEPRs9FpRXFfNqiNuuyvOAsXyCFVne0xH7WylE
         3B1oPbScoZRsqAKWpP5MBhfaoVTJDQj1f28O3TvUk3KTVtZtHwJCeFf4ISIaSKFYK/l/
         5pwgxIqr+1FktWg7iyJW247STua5wikjn9VTn4G+rPCVkrKo+NLZk1hN6SxHuxF9VA5o
         5J6W/fQ3ZR4SCsfUC+pmaizJp6LTNqpeh0QfcOKEa5irRctIdyjrdxKjG4CaYI7NsLme
         K78OVXA4ucmBVwJxVj8LHNjsym092u7Q39u3bYLtJwEa8mJW7olmL63FYNA/h/si/vFY
         e8VQ==
X-Gm-Message-State: APjAAAXHwUDzjmzNKPIyjrTWM/e42X/CfTuSBnWW70HvD2blyoKfB7Df
        iYigCLn2utynmD9paUzN4rC3ug==
X-Google-Smtp-Source: APXvYqxKo9EGtLoPwts9dEnyGmVK3HmiyacvdHbMr4orZaBYx4eTzyEWx4c8n8FjfAnxRZ1deQ1UBw==
X-Received: by 2002:a63:ec4b:: with SMTP id r11mr31741370pgj.147.1572900143578;
        Mon, 04 Nov 2019 12:42:23 -0800 (PST)
Received: from tuxbook-pro (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id n8sm8714053pja.30.2019.11.04.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 12:42:22 -0800 (PST)
Date:   Mon, 4 Nov 2019 12:42:20 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com,
        tglx@linutronix.de, jonathan@marek.ca, georgi.djakov@linaro.org,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 5/7] dt-bindings: msm/dsi: Add 28nm PLL for family B
 compatible
Message-ID: <20191104204220.GB586@tuxbook-pro>
References: <20191031104402.31813-1-kholk11@gmail.com>
 <20191031104402.31813-6-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031104402.31813-6-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 31 Oct 03:44 PDT 2019, kholk11@gmail.com wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> On family B SoCs, the 28nm PLL has a different iospace address
> and that required a new compatible in the driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index af95586c898f..d3ba9ee22f38 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -83,6 +83,7 @@ DSI PHY:
>  Required properties:
>  - compatible: Could be the following
>    * "qcom,dsi-phy-28nm-hpm"
> +  * "qcom,dsi-phy-28nm-hpm-fam-b"

Wouldn't it be preferable to use specific platform numbers here?

Regards,
Bjorn

>    * "qcom,dsi-phy-28nm-lp"
>    * "qcom,dsi-phy-20nm"
>    * "qcom,dsi-phy-28nm-8960"
> -- 
> 2.21.0
> 
