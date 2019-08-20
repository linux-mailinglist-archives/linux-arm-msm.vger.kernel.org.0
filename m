Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D94B195E5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 14:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbfHTMYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 08:24:47 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37259 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfHTMYn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 08:24:43 -0400
Received: by mail-lf1-f66.google.com with SMTP id c9so3972291lfh.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2019 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qnQT2VO/UfzzWNTJKUXiXaHap91CIA8e3KNko4MXs8E=;
        b=s3VHbmPh3r/Pl7PBGh7SPQZ/gdBo/iJ9UGyjYCF45A1XKVIyKtGv7JI424Pm3YrEUi
         wI+M5eEwZBJBTX5kclowPc/6DPEu5Zeef9JlJ/c+ZrNcjb5NQVvrtqh/cGiQej4r7yhu
         4dyRnmImXti2rB6JdbCy5mmXPnO5OFJJmB/UdPNzRcjllU+9g7g6c7VHN7gJR0mOg3i0
         VVUeFq/MJGIOxCni4DUMufKYRdhCvWChF6YvxLpCRHFajQ0l8c20unuiiMht5ARllVyR
         nMA7xpDHidZQqe5/vVpM+oc08cp/I/b4KLZd41JWUO86N1VMZLV9WSsQ3eqmuH+vdeUW
         dRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qnQT2VO/UfzzWNTJKUXiXaHap91CIA8e3KNko4MXs8E=;
        b=Vp1bi/w8d2Ym65/OHQ5t4VpXTk2Allm8QQW7dM9eiR6mM4kFoHqxV8kFCB/DVbrejQ
         cPktFtm4F+Zq/VJLAKYq5GXxKCgS3MUTy/N5HYRjPNPRQv/MAIFg1Ytsxn/sNpCX04M+
         arPUO8E4TW9LtZmAZ093pJNFlpMnjYmCFuNIHkNfxm2SPTZK3qluPpFl1ZSUWiIHCsHh
         Jr66xxGypIKn1h891AybxLt1tcxn3g7bLwIt1rwr5VEOMX4OGJ8JKcglfpr5z/mLJgk1
         SPQOvuFHEQbVYiJleEkfNdxaogtXctxuP1VvlHQZmQ3H4vbjOaRMSSe4BqELMNFzdtwu
         mBCw==
X-Gm-Message-State: APjAAAVLIPESZEVIlZEj+6Y61hsMhHy7HgbStT4Yxd9u6uW9cr213d31
        vn0mFH1WXQdf+ksKIMzDV2uPwA==
X-Google-Smtp-Source: APXvYqwKxR4XbALZiA/omMyruSpeDhqssOvOJoEZ5jMPcX/3fGpjb30uNU7sPF+dSIFPR9nmg30itQ==
X-Received: by 2002:ac2:5094:: with SMTP id f20mr14504741lfm.53.1566303880587;
        Tue, 20 Aug 2019 05:24:40 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id j4sm2791862ljg.23.2019.08.20.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 05:24:39 -0700 (PDT)
Date:   Tue, 20 Aug 2019 14:24:37 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm8150: Add reserved-memory
 regions
Message-ID: <20190820122437.GA28228@centauri>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-8-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820064216.8629-8-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 20, 2019 at 12:12:15PM +0530, Vinod Koul wrote:
> Add the reserved memory regions in SM8150

Is there a reason not to squash this this patch 1/8 ?

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 111 +++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index d9dc95f851b7..8bf4b4c17ae0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -153,6 +153,117 @@
>  		method = "smc";
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		hyp_mem: memory@85700000 {
> +			reg = <0x0 0x85700000 0x0 0x600000>;
> +			no-map;
> +		};
> +
> +		xbl_mem: memory@85d00000 {
> +			reg = <0x0 0x85d00000 0x0 0x140000>;
> +			no-map;
> +		};
> +
> +		aop_mem: memory@85f00000 {
> +			reg = <0x0 0x85f00000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		aop_cmd_db: memory@85f20000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x85f20000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		smem_mem: memory@86000000 {
> +			reg = <0x0 0x86000000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		tz_mem: memory@86200000 {
> +			reg = <0x0 0x86200000 0x0 0x3900000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: memory@89b00000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0x0 0x89b00000 0x0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
> +		camera_mem: memory@8b700000 {
> +			reg = <0x0 0x8b700000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		wlan_mem: memory@8bc00000 {
> +			reg = <0x0 0x8bc00000 0x0 0x180000>;
> +			no-map;
> +		};
> +
> +		npu_mem: memory@8bd80000 {
> +			reg = <0x0 0x8bd80000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@8be00000 {
> +			reg = <0x0 0x8be00000 0x0 0x1a00000>;
> +			no-map;
> +		};
> +
> +		mpss_mem: memory@8d800000 {
> +			reg = <0x0 0x8d800000 0x0 0x9600000>;
> +			no-map;
> +		};
> +
> +		venus_mem: memory@96e00000 {
> +			reg = <0x0 0x96e00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: memory@97300000 {
> +			reg = <0x0 0x97300000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@98700000 {
> +			reg = <0x0 0x98700000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: memory@98710000 {
> +			reg = <0x0 0x98710000 0x0 0x5000>;
> +			no-map;
> +		};
> +
> +		gpu_mem: memory@98715000 {
> +			reg = <0x0 0x98715000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		spss_mem: memory@98800000 {
> +			reg = <0x0 0x98800000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@98900000 {
> +			reg = <0x0 0x98900000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		qseecom_mem: memory@9e400000 {
> +			reg = <0 0x9e400000 0 0x1400000>;
> +			no-map;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -- 
> 2.20.1
> 
