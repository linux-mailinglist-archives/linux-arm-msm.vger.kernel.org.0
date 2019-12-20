Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8088D127280
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 01:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfLTAk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 19:40:26 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34650 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfLTAk0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 19:40:26 -0500
Received: by mail-pl1-f196.google.com with SMTP id x17so3342546pln.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 16:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jRdtiusu+beWJmpVDOcRJ7adeaD2r8nAbkaw7dnEM3o=;
        b=IiSA+8Zu5xMGrVWMYcIurnZ+82iGEVaMNMAYiegms9yncV4Odo6L5M/TGQpyIezn8m
         tV4zwJ4ShOl3QB4MLIww8dJAE8GgAtN7bg0I0FblsIfNchewk13zr9OCsk24esyGcjqe
         CeGtVcnpDJB1UcX3MdrZrffNlHFR9DBIuVtsQScHTeosd/J4UpJWV4sVJUWxuiyyXFQU
         usb0+ndwgbW0KJE1z0Nad/3t/NOHqyRlRhrJe85j6rweybaBMTQABri1nG5ZdcejyZTZ
         Yyv5+xScQSwEnGQiQDlpr+SiYIO0C+ZYrWJ42h1joK3SUIkhf0UQcgqSZAIkbCqAZ3pP
         EReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jRdtiusu+beWJmpVDOcRJ7adeaD2r8nAbkaw7dnEM3o=;
        b=tJFfCl5EVcJ5RqW2EqH35yl4t8M9YaAmLscNzMQPoFpRAgh9/ehh/XHL19/g2gI1kC
         iZaxwY1e7QWx5xa7v8RmciqYIpLDhf9ZR9ONsSpqmnVxCP5vDpsvt55CvRCvWIQlfxyQ
         7vh1EI2G1wKTTBTfiPTa3PB0Ez9WXhaasaWWF6TUuSKhSKavW5lQWNKclUsQ2+0uKtHg
         ZqtHWUpPp++haYwe0BKZ2St7Y4wGuhELMAdI6KmtVcW5/uNgXZmY6kVp/ooqynvAUY5+
         DB7cy54SzX9/SIyzVYf9LNvD3PydHZH7PRsEqPuX/18tqz1fSDvXmpZhO+H/Gxb7EMua
         aGpg==
X-Gm-Message-State: APjAAAV2mvhkTyYhvlBGaTtATnQ1Y/2HJjNsAi/ITZaKv67XBxVSBBEx
        EeZGdIosTWaGuHNQ4LhT0DU2ug==
X-Google-Smtp-Source: APXvYqyXI07TRonse1dFs0JYqbSY6q5JMDHO4GTlLVXHf3CyrogLeSTQza7mciIV4JED48jdhYeetg==
X-Received: by 2002:a17:902:59c9:: with SMTP id d9mr11951312plj.184.1576802425465;
        Thu, 19 Dec 2019 16:40:25 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o16sm8713462pgl.58.2019.12.19.16.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 16:40:24 -0800 (PST)
Date:   Thu, 19 Dec 2019 16:40:22 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs404: Update the compatible for
 watchdog timer
Message-ID: <20191220004022.GE3755841@builder>
References: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
 <757995875cc12d3f5a8f5fd5659b04653950970a.1576211720.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <757995875cc12d3f5a8f5fd5659b04653950970a.1576211720.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 12 Dec 20:53 PST 2019, Sai Prakash Ranjan wrote:

> Update the compatible for QCS404 watchdog timer with proper
> SoC specific compatible.
> 

Applied

Thanks,
Bjorn

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index f5f0c4c9cb16..c9e8e629045b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -905,7 +905,7 @@
>  		};
>  
>  		watchdog@b017000 {
> -			compatible = "qcom,kpss-wdt";
> +			compatible = "qcom,apss-wdt-qcs404", "qcom,kpss-wdt";
>  			reg = <0x0b017000 0x1000>;
>  			clocks = <&sleep_clk>;
>  		};
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
