Return-Path: <linux-arm-msm+bounces-41259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B20909EAEA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 11:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C4C18896D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23372080FF;
	Tue, 10 Dec 2024 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtE9uQW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBEC23DE8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827700; cv=none; b=n1pTMeFIFz7rnb4PEua74t2fznH6gXt2W+EBr1LYkLThfnI1291fbOX9Twr28w0lm6wEw1KGeonTCUlqxdkgh1wCTbF5vvL2gSTaRkjBrKMISDERlTO43kZw4UeHSrKMu8/EQKk+ZfClLxDcIA7/hCZxDspOOAKj2MUgrls4vXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827700; c=relaxed/simple;
	bh=yg6mqnRnjya98cIEcHfmAv/X4rPVtV86GGq0D+perBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnklKT0VDTedzUl6qWJHsAJDtjmrSev+btGfRInBjkmQzvrc7BazJ8JXZUVuh1MKumC+0mgies3Ji6ryge51QfrYBOZlyoRDHp5Dh5jMJwqy7l4dVYYQW9wsgYWcRhrWCl5rtxNcQzMhPVxsNFCh+pqG6qPbecUVw5VnuNnJEkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WtE9uQW+; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df6322ea7so6265540e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 02:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733827697; x=1734432497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTm9JpbxLTN9ernGYfcdV8cr+yCRX12AUqwg0JNmPOg=;
        b=WtE9uQW+M+JpIweDKNPjpbCer3lOURkVHd8RBAo9RlcT8rQNPnmK1u1zsiqXDsy+E9
         PgRJNNQwDbyH0tk9wjDyNPANzuKv5JBdL0QlGs6SLk+s9VuMHqfHr45BH530SLwEODEj
         ayCgxMJu08BxsuM7H5FCC9wAQLBI6g9jmwiur0aNZ6Eb2Xys70sDqtDr+QPt8EdjNZ5U
         HIFP78Y1J7eD8wOcuJ5mvAL1PWp327D5g//NB8Du78503/eD0Jnz1hb2KzUsJGFrkaoS
         Z9aE6eTTyUFRhszsMoL1hVDxPy0fl4wUsMwRaXExtb/W4m4mgX42ReEDjQqsLIIwBcTz
         dXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827697; x=1734432497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTm9JpbxLTN9ernGYfcdV8cr+yCRX12AUqwg0JNmPOg=;
        b=EiYafPSzoIAmpzkmhsqoprlm4VKD7XQZgbBJZJgSsrBOpJRyMipwVsVEwJonTWEWqg
         V22Jnl9omkZUL75VX/Gzko4WXA/46y8xXkqTXWptEWVjE9TTchSD3hWJgD+sw7xMl3hz
         at1dx/9iytA3WBqOkHQ+amX4kvPvmy0OQFUZ9dxHbLg0tIDhn5IRZy/qHdk+pezXKdKx
         ZTOwBQERQnoIDThrcH2m0j6ICEu5/BW+UmsUCr/VLlrED7dhIQdnNw2/GFVvynKjab4f
         R0sCUoGMVjkrvQeHW/3XBe1UQyT6j+CX7usVp9959/IgJJ1MWN8SUQU4cZQRFNsJMzgF
         Qb3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcP6Vm8DkJv4wXfpECYeB7b/0wmKN5jlipyGGYyvXcwUU+X2zw+WaNYO4ZIgFyeR7UVqBtaq+2jGNd6K2f@vger.kernel.org
X-Gm-Message-State: AOJu0YwvhCB/GkJEa5C4YkEhyBXxxjXIOqk8w5GLL4Be8AJy8a91o64t
	jOOjLbYXwBb3ytM82ZA21lLubC829h1OnNCQbRUq9eJPEKVnUeoXv5WDwYz7964=
X-Gm-Gg: ASbGncuINQ2VPFemalkv3rIIIhIwJ9ojOZ2MSrywwn3KZyZQc1IcPFxmGke1LRWJJrV
	IqOd4eON6oIrx1E79DWMgTABu4zarsiL55zWYUJDIde0FkEeaBXt0QblUR0gZMIALshcdrhp93D
	E3t0UeRvY+f5E1anG1273TGJWpUQFi59CbUV4tpPPo0ed/Tf8asPtoaLBPH7pbJaAaLcUzVoKlG
	yMZieWe5ck2E7EEmxAiCwEv8uzNK2tjcspRtzgXox6+6p1l/DJTLy79Uo2/kx16gux+mkPo35Y2
	HBFJnBZRvErj8lCAfSWl6KtXvX483gY1ew==
X-Google-Smtp-Source: AGHT+IEYIG0BNjT2FuP4i1xockiULg5HGcfkNFZZ/rLtudxr0/2wNLHD2/ZqAkMAF7rMzr2LwBYpsQ==
X-Received: by 2002:a05:6512:6cc:b0:540:2257:22ab with SMTP id 2adb3069b0e04-540240cd641mr1438417e87.27.1733827697306;
        Tue, 10 Dec 2024 02:48:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53f22fa81a8sm995927e87.91.2024.12.10.02.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:48:16 -0800 (PST)
Date: Tue, 10 Dec 2024 12:48:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fange Zhang <quic_fangez@quicinc.com>, Li Liu <quic_lliu6@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Enable DisplayPort on QCS615 RIDE
 platform
Message-ID: <qwx6ieolctmsmlruku2bmxv2ufd3soa64ygsjjzt5b6ntweoan@tpv7w73utvmm>
References: <20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com>
 <20241210-add-displayport-support-to-qcs615-devicetree-v1-2-02f84a92c44b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-add-displayport-support-to-qcs615-devicetree-v1-2-02f84a92c44b@quicinc.com>

On Tue, Dec 10, 2024 at 05:11:06PM +0800, Xiangxu Yin wrote:
> Enable the DisplayPort node, config related regulator, lane mapping,
> hpd-gpios on the Qualcomm QCS615 RIDE platform.
> 
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 694719a09ac46bfa2fe34f1883c0970b9d0902be..0ac543577ec1850d6e4f19ff1d64252b00fffae3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -44,6 +44,20 @@ dp_connector_out: endpoint {
>  			};
>  		};
>  	};

You mentioned v3 of the display support series. However v3 doesn't
contain dp_connector_out label.

> +
> +	dp2-connector {
> +		compatible = "dp-connector";
> +		label = "DP2";
> +		type = "mini";
> +
> +		hpd-gpios = <&ioexp 8 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			dp2_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -291,6 +305,22 @@ &mdss_dsi0_phy {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <3 2 0 1>;

This hasn't been agreed upon yet. Please abstain from using the
configuration bits that are still in discussion.

> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +	remote-endpoint = <&dp2_connector_in>;
> +};
> +
> +&mdss_dp_phy {
> +	vdda-phy-supply = <&vreg_l11a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

