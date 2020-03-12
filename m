Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF6FE18288F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 06:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387837AbgCLFqz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 01:46:55 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37816 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387811AbgCLFqz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 01:46:55 -0400
Received: by mail-pj1-f66.google.com with SMTP id ca13so2169693pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 22:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HdLQClxtUdSKaPYPUuDw8hsXm01ozTjM22vd2TlllWY=;
        b=IboB44Xv4A4qjCH+4o4oeBZWNlCYG/ByHae4lTJdqvMyNBfaB60Yong+zCaWJGc5pD
         u5BJpY7WgaiMw7Ktx+zZDDybj85pjdn0/kXGiTEUaE8n3bD92Dqt5FdHk5vhvbgWPuN2
         AvsWdo9mT1BFwuH3FFGtyvj+iufWkZ+3MmHFccjCzC8FGN3fu4353OEipnJwkHtDYRB0
         QKGNyFqIlYiqYGKBcGfbQZUQVDaTJFs+D/E4QY6EIsuhO2Dd1srPIufHIOWVDUyy+/bl
         O97lE45PwOXOTzOz9HIyN6eiodf2dGy5Ipk3XWm16CSwCplm8891M4r65yWbG0uEnql8
         DXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HdLQClxtUdSKaPYPUuDw8hsXm01ozTjM22vd2TlllWY=;
        b=X22sRn85R0c0Rac0B4sqZHI9jxueW4Y3ZdFg8Dy/oUI+V0nXYdAnPGSOTUOydXZPzO
         gAqF9JkR/KJCTMtUO5PzzYZxWabLegdga3tuJSPf97XSe59JLWGfE9QFfe+YYSBjMpYY
         FbGIDz/3YnQ0RZBRCOKFT2bvCeey7nfiowUcI58veJQ3Ecv8fTHMrLyd8V4r5iSXTePn
         7bKJrk+91VbaYvi+JQpmTTpHF8qlT4euOGzbzXkosoURt0Ao/Te9jCPtEci0+1xSo9V+
         Ztv+L0Jiv9eJowTkdH5OaT1VWXAFMbfQ6xweIMAVrAZfzcztdHlpv9FpJa41PjZo1WUf
         0Muw==
X-Gm-Message-State: ANhLgQ2FoypJYHSBH9s+B6u/A4QYVfoMnJ3rN/ekUf9OOyK6ulV65EHZ
        IWHg5+y1iFV6QmTRFLWp9RFclw==
X-Google-Smtp-Source: ADFU+vvBWNdJZkvEkCv0nI8YzvJVVKiWy4ls6Cvv+ZJy9fEmA1IbQaWDjbdzG87HHLDEiZZTB4J7JA==
X-Received: by 2002:a17:902:b090:: with SMTP id p16mr6000674plr.274.1583992011924;
        Wed, 11 Mar 2020 22:46:51 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z20sm23161331pge.62.2020.03.11.22.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 22:46:51 -0700 (PDT)
Date:   Wed, 11 Mar 2020 22:46:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     agross@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: qcom_scm: add ipq806x with no clock
Message-ID: <20200312054649.GG1098305@builder>
References: <20200311130918.753-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311130918.753-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 Mar 06:09 PDT 2020, Ansuel Smith wrote:

> ipq806x rpm definition was missing for a long time.
> Add this to make this soc support rpm.
> 

I merged the dt-binding patch, but please update dts to use:
	compatible = "qcom,scm-ipq806x", "qcom,scm";

instead of adding the platform specific compatible in the driver.

Regards,
Bjorn

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/firmware/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 059bb0fbae9e..d13ef3cd8cf5 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1144,6 +1144,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
>  							     SCM_HAS_BUS_CLK)
>  	},
>  	{ .compatible = "qcom,scm-ipq4019" },
> +	{ .compatible = "qcom,scm-ipq806x" },
>  	{ .compatible = "qcom,scm-msm8660", .data = (void *) SCM_HAS_CORE_CLK },
>  	{ .compatible = "qcom,scm-msm8960", .data = (void *) SCM_HAS_CORE_CLK },
>  	{ .compatible = "qcom,scm-msm8916", .data = (void *)(SCM_HAS_CORE_CLK |
> -- 
> 2.25.0
> 
