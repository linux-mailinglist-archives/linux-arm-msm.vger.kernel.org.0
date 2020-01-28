Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B56E14C1AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 21:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgA1UkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 15:40:08 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43933 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbgA1UkI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 15:40:08 -0500
Received: by mail-pf1-f193.google.com with SMTP id s1so6657025pfh.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 12:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2i3ifj+o7a56Ej6B9maiwsFtxZ+qZn9EVpxFQulwzyI=;
        b=Oe0Deoml28uBRBuJGwSYnMX4gjeW08RPDQPW1p9i/uhQqlnGChZF22DGhZYBwL7qNu
         nGzDMvsDqIjQm5sW4u42/ryWYW2uLjdypkNR59DAfrWdRa4YSZH9CmBbGqg2dXyEVXX/
         wEn4suIUo2Hb9TqHuzqhMbTqpQacXNSJsvVKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2i3ifj+o7a56Ej6B9maiwsFtxZ+qZn9EVpxFQulwzyI=;
        b=gMgJxPHZPBoBuiNz5rzABOlAR8AQSlQ60/W9wwbWhFHO7zkf/fIYt0m9RzEOzwQI04
         tPFADOLhSQBWBTtPUqMSBZ6n/8wBVR2DvGeks/3cv3TWmV1cX9ggmYrrMWFLAChsWB4T
         3mD0vnf9hDg0Z4C105u+Z2mhWnwL0j46BC0czrazM8n3VsatueZWv7Sw4J1OxzDCrCIY
         1erobsFumgM7//FEkZkigkAYbSeGpwhF96cceM9MrUzD5FogLnXvA622LPzlk3LBgVy4
         RNzqcX+nGFCSKtM75VMxCzOZdfUzrMKTgUwwVbPwKnj1CvKkIpnAwwb0ADqkTT5Y/JiC
         FNoQ==
X-Gm-Message-State: APjAAAWutANHdDlqXFJYbIF5Nr3pSsM/n4QjQ5+D0m7gTqz7Ju9o6Rhn
        MqeLzRi5IZvVeGuRlrqM/5iGag==
X-Google-Smtp-Source: APXvYqwMQdKxHn6Q4Ri/enHwlEiGz4BaCFfgC4w0rKZoFtqzu009EY6UmncTFq6yvHoRzxcL6hMY2A==
X-Received: by 2002:aa7:84c6:: with SMTP id x6mr5442136pfn.181.1580244007783;
        Tue, 28 Jan 2020 12:40:07 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z19sm20419043pfn.49.2020.01.28.12.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 12:40:07 -0800 (PST)
Date:   Tue, 28 Jan 2020 12:40:05 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, saravanak@google.com, nm@ti.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        ulf.hansson@linaro.org
Subject: Re: [RFC v3 01/10] arm64: dts: qcom: sdm845: Add SoC compatible to
 MTP
Message-ID: <20200128204005.GE46072@google.com>
References: <20200127200350.24465-1-sibis@codeaurora.org>
 <20200127200350.24465-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200127200350.24465-2-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

On Tue, Jan 28, 2020 at 01:33:41AM +0530, Sibi Sankar wrote:
> Add missing SoC compatible to SDM845 MTP board file.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 09ad37b0dd71d..54087847794aa 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -13,7 +13,7 @@
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. SDM845 MTP";
> -	compatible = "qcom,sdm845-mtp";
> +	compatible = "qcom,sdm845-mtp", "qcom,sdm845";

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Since this is v3 already I think you can omit the RFC tag in the next
revision of the series.
