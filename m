Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37B3415D1A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 06:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgBNFbg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 00:31:36 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38584 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgBNFbg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 00:31:36 -0500
Received: by mail-pj1-f65.google.com with SMTP id j17so3443144pjz.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 21:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YdqrLZVIKkHcEkn+zhvQwPNs8H6GA9I6SUHidN4E340=;
        b=Ci47GPh4Cs+sq3SNG5sbvk0b3C1x2gsg/VKR5MjnIsgZAFd+aCcm7tjveuVzwDpQtr
         LHnevje4mPZsv+muBZCNruOAyiGHhSimhKO4PS3kc0LUbbCYgzL8KFOU0x3qUjeGU3Kf
         0y/eHfQBzb7a6MIbbz8XOy+suHzKZxYx5C6B7lgM1K1Q6TtaIYykGpjGwb5aZ6NPEmqc
         patkW8o/aBYaTwkdqH6o0Oo5NUj4yzCwZecduucHqQbKHEGGFwsegSok/DDBRmNgZapW
         pT+rvYEVS69CP63n+xf33k4FmO9z3fP+zp0h8i4xGYNJ2yivPgX8TAj42dLyNkJ1RBtz
         dJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YdqrLZVIKkHcEkn+zhvQwPNs8H6GA9I6SUHidN4E340=;
        b=R/HhV48AIh1ywsodNItsXAHl6G1QN/A/gLowx0GBFErqV/DY2LfjajLvIaxZbqsqYC
         Ubaq6MqtYTvZwXYn3W8vud5QfaZtGlVeNde0Ctx+f51nMtR1Rpx62rRBD8DzAXdg9jyx
         MgozNj9MxqIF5RTWr94+vC7v4SiNMu9wgWVCOPp8X+ZOV4CO3eVV/3wzcCmriGW/BwnR
         eeFG9hRLUZBK8fyh9xWI9P2TN+gFgYK3/U42LOBZSBI8gZf9oVuvJZFlwbYwEkuITW9S
         Sw+O0ahr6zyIiLaprpCDZ4WoZiDMj3yDQi5BiZK56XugyC24bElBxBh/WUMY/FLQgTsG
         X8zg==
X-Gm-Message-State: APjAAAU+vAJfLQ0Gkv9fGnFyEH3cGL/6oHNiwKchmRdSmv01PYUqmFDq
        MG5cg7yPyg3HVW8kF8JatHYhurEnygw=
X-Google-Smtp-Source: APXvYqysymrbCVfw+33GsQE95mppqlPT8olpDd2YiCPAlZ81G3bDAgPaNfEXQdRpmnJUNYDGFxv6mg==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr1575102plz.269.1581658295695;
        Thu, 13 Feb 2020 21:31:35 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k9sm4313340pjo.19.2020.02.13.21.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 21:31:35 -0800 (PST)
Date:   Thu, 13 Feb 2020 21:31:33 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: msm8916: Properly deal with ETMv4 power
 management
Message-ID: <20200214053133.GW3948@builder>
References: <20200211183011.24720-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211183011.24720-1-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 11 Feb 10:30 PST 2020, Mathieu Poirier wrote:

> Properly deal with ETMv4 power management by adding the
> "coresight-loses-context-with-cpu" property.  Otherwise tracer
> configuration is lost when CPUs enter deep idle states, resulting
> in the failure of the trace session.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Applied

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8686e101905c..846c5b4a53e8 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1363,6 +1363,7 @@
>  
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
> +			arm,coresight-loses-context-with-cpu;
>  
>  			cpu = <&CPU0>;
>  
> @@ -1381,6 +1382,7 @@
>  
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
> +			arm,coresight-loses-context-with-cpu;
>  
>  			cpu = <&CPU1>;
>  
> @@ -1399,6 +1401,7 @@
>  
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
> +			arm,coresight-loses-context-with-cpu;
>  
>  			cpu = <&CPU2>;
>  
> @@ -1417,6 +1420,7 @@
>  
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
> +			arm,coresight-loses-context-with-cpu;
>  
>  			cpu = <&CPU3>;
>  
> -- 
> 2.20.1
> 
