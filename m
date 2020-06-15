Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9121F9E46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 19:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgFORSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 13:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729772AbgFORSA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 13:18:00 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEF4C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 10:17:59 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z63so7165462pfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4tBg685n+rvOlJARxC/GZpj7s58rUY4EPS7OgTBXC28=;
        b=qMf5OWp/BZGBVGr6GzBckHt7yZutPv6Ww0rfvb7z0X6LV4pWqnPy6J1A3STjwKZMWi
         nVBys61Vt7LoY86iMXOZtz8Cac6wHUA2uwAWybbItiJy9TChYqMS/gjHJq7rL09/sOEt
         OesmI/6d7jNHv1UL/WtnVV2TkJ1V58mZCeuO+YMK4uWp9VM1H30g9Bn3c1JbNohJWFSI
         csKqKPb8i+P6Mgo+G2Y4CwGRgBi6Vh+Y2RfjP2BhRdNoVTapT7y0zBIe3Ub5RALjtJkc
         SQzsXAoZWDnwZnBThFKWfsLfnuezFzF4YfSabLLP3QzLPYn8qzqhyspUwgqqPjxetusa
         4fHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4tBg685n+rvOlJARxC/GZpj7s58rUY4EPS7OgTBXC28=;
        b=mzOeNJ3MF9nIRHClbRj8tEvvMzx3aMV3zwFiQKuUC3IuBPmSsO9SxwKZNeGaexx4Sz
         GfSIXKOheYWNUx4ABVliovYuO8yDjvXzSwaPK696+a0cl3qBK1ApX385WqYD2i/ReahW
         i7ubF6Vh+A4ada4ghDOxKj4t+Jfo9XtHpwpDuKYlKVlMv49WKKli8THp81pF/zR2HDdF
         8XKqpR95kpnPyjaLrFw1LCdRO34ZZDXh4KJMe3RL/bDkTjImoo+hnKAwLW5h+cwKDrim
         ExQNrqI1/puzln966y7l2UeyA4zw9mfe+0OBYj90wMljDwWLOaOiVmRXNK0I1l7ohh86
         gCWQ==
X-Gm-Message-State: AOAM533JNz29+AMb8dymZ+327926e8jrcbkJlu02TCDxx94K2CfDdHxf
        aK7a/jtY2kE8+PVVUyknXSk/TA==
X-Google-Smtp-Source: ABdhPJzDcXoNX77HGgl+fpRA2bt04/aYiGdDfkkyODxwlkE3OkNhPp/3uUdSH5iaHvmi/LICqc75gQ==
X-Received: by 2002:a62:640b:: with SMTP id y11mr23794549pfb.195.1592241478412;
        Mon, 15 Jun 2020 10:17:58 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i22sm14310258pfo.92.2020.06.15.10.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 10:17:57 -0700 (PDT)
Date:   Mon, 15 Jun 2020 11:17:55 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7180: Add support to skip
 powering up of ETM
Message-ID: <20200615171755.GA225607@xps15>
References: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <8c5ff297d8c89d9d451352f189baf26c8938842a.1591708204.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c5ff297d8c89d9d451352f189baf26c8938842a.1591708204.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 09, 2020 at 07:00:28PM +0530, Sai Prakash Ranjan wrote:
> Add "qcom,skip-power-up" property to skip powering up ETM
> on SC7180 SoC to workaround a hardware errata where CPU
> watchdog counter is stopped when ETM power up bit is set
> (i.e., when TRCPDCR.PU = 1).
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
> 
> Depends on ETM driver change here:
>  - https://git.linaro.org/kernel/coresight.git/commit/?h=next-v5.8-rc1&id=159e248e75b1b548276b6571d7740a35cab1f5be 
> 
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 7c2b79dda3d7..f684a0b87848 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1810,6 +1810,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
>  
>  			out-ports {
>  				port {
> @@ -1829,6 +1830,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
>  
>  			out-ports {
>  				port {
> @@ -1848,6 +1850,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
>  
>  			out-ports {
>  				port {
> @@ -1867,6 +1870,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
>  
>  			out-ports {
>  				port {
> @@ -1886,6 +1890,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
>  
>  			out-ports {
>  				port {
> @@ -1905,6 +1910,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
>  
>  			out-ports {
>  				port {
> @@ -1924,6 +1930,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
>  
>  			out-ports {
>  				port {
> @@ -1943,6 +1950,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  			out-ports {
>  				port {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
