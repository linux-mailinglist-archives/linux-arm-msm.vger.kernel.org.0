Return-Path: <linux-arm-msm+bounces-73424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A928B56941
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 15:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C6A3B6689
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 13:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B73242D80;
	Sun, 14 Sep 2025 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pipUxAyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A51D6194
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757856066; cv=none; b=I/Xdxg+/oxBIzdsUex4Cn23RZseyVMDJTJQOLR+YuCtYlSCRVMRQVXC/YfZbUUot5fjdCOGlBRHddB8p8ajnRU9VfZX1kpD0Qamxmq6x13knk4TOoIMurYLI5c1nClCt3UTCThFnyIiOf42u8w18ysJRo5xpWW5aIuN8+pZ8uds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757856066; c=relaxed/simple;
	bh=FHRGm7LXfDWxk3h6js0O3WyYp7ia2gmJ2X8rfluSTRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mh752X4TQ8KABS4u3vTXJIQCtRsbo/t+wn8x28mzW3D2z2jJwx9qZErQ0GMs0TrePs15sVRwC6aGS7jlOCu00+Df0ZwNZhAIw0UX6wlhRu6m3ilTAdpvrq60GpxqfSm8HYeMJKxlwps/cbpIhpuXjXxUQ9s+HqEQGmxn7JzPUQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pipUxAyu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso25737005e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757856062; x=1758460862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+GK7SXOR7eYPYSb3rZX+Z9MMo2wc8zU01qlT09Kxeb8=;
        b=pipUxAyuqNUWuA1Ga05hUOnaXY3TMCUFJQum+4Wa/K9XYSAGP9TSNlAdPb2f2LVDVQ
         haIEH5XbNLYnTrXWa4WvPiQObfPbcK5Z+HuAn2hIyRitWJ4f9ImZuqzpFo/JLxztbCx2
         b6PeTrek309s/G9XSSZdrp20ayPdaX/SOiMBniGhjTGrl9yVRbsRuTtwhVtkIf7qDlvR
         6GLsJHnU2sRar6Dq5HgTcR/Qn5pEN9y7GFQi5+zDxrLfMkS6kPO3QfiBX0bUVF/mEn0G
         5UxW5Dt+Aakhjs5jfNzRdbzR6mU9I1E7F1/114HiX9iZ2/9s8It15X4piDd9+z1H1qJW
         jz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757856062; x=1758460862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GK7SXOR7eYPYSb3rZX+Z9MMo2wc8zU01qlT09Kxeb8=;
        b=Ui//vnKELD4Oy7gSPMuShSNPP7xaJDZMSFfMEiqsL8nPSUnZX4PB4T9UPK2nRMtcAD
         onRTHq4W5RsQ03zj1BlOh3r2TdAmRWS6p7zvhyBgyHOLWYNxkKFuGjdyrigCGASA5f+W
         QJw/BWhDrEGC6dMhcZ1IfT9mkbqBxOnxnJdeIYQavG3aqKWlKau6vcIGEgyekoMdUDOe
         HmGhg7hLUyPZjbgDZSZAJdaBjiJUsFNOhKylZ/vCRhEJqYfGFwoipydBb9mo7ip9wSNg
         rBWcQ4kHlVqMwOpbx7+wuzd4+IB3MFWDERR38VGpnSnVejnKjnu1CUl6mzOpWUnULQvx
         TKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyxLgnYfvcpqBe2UjBK+M976MU2cP6EN1N+PcVmmIUOjRZ+mtMDHCOPuHPrs+jaxMrKpYD6iS1AhKBwPXM@vger.kernel.org
X-Gm-Message-State: AOJu0YxWUH7vgGTbfAHr+xrMOiEKT065IpzZOtog7nPKu+WkDbG9vfkj
	hkOyqKoqfXCd2jC/lLcx78LaN+ZTAIMwXIMdPpKe7LhBcAfWQ3VKpw1dWrGNl8Tzd1o=
X-Gm-Gg: ASbGncu9HD6SbwVzuGfbex7TaI2+SP21hOBGf00x2+YTcTlIXeF2ai6gXu4xe6hSxG6
	UJKsCgj8nUG4IUu/KbDxkmJ24MD7uMXFLIpFMffehYivoa+VN2mnKca9W+Po29v5ikpb/jYk4Pr
	XNB3xlnMQtrQHsbj5KJ+nxzDDIC0MKZnok+qQuT/YXTHhww7aV706+v+e1ARV52qBjOqJLQ3MHI
	JX7Ad1u4d/C7C2rk2sVN8bvT3i8lLQQUC16Qo5OKI5Exm3CYq5Q3+0AOk6vF7WvmvtE4wJIoU1G
	E+1zS+kjOCODYoT+vS+OkBEpqk3Dseef2BrR9F3r2mv1qRg7o5xuFjpB3WoATeauHbUj9o+bJ3G
	wJ9oAoHlVsjy0vwG8FcTqlsnS92V2nnbZR9mJTgbHwA==
X-Google-Smtp-Source: AGHT+IHdgLvDTL4KVtGGIiFe+3oBC8tJ3o8FsHsupq0zhyzo+pH1R1CU6WA9dvqZ9/RfqTpJ+CDSUw==
X-Received: by 2002:a05:600c:1f8c:b0:45b:64bc:56ea with SMTP id 5b1f17b1804b1-45f211f8841mr78216515e9.23.1757856062040;
        Sun, 14 Sep 2025 06:21:02 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:52cc:acc0:aba:120d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c9d91sm133143445e9.20.2025.09.14.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:21:01 -0700 (PDT)
Date: Sun, 14 Sep 2025 15:20:58 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook
 X14 device tree structure
Message-ID: <aMbBOgNc-382vwMY@linaro.org>
References: <20250909-hp-x14-x1p-v8-0-8082ab069911@oldschoolsolutions.biz>
 <20250909-hp-x14-x1p-v8-2-8082ab069911@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-hp-x14-x1p-v8-2-8082ab069911@oldschoolsolutions.biz>

On Tue, Sep 09, 2025 at 07:02:34PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Extract common elements into a shared .dtsi file for HP Omnibook X14 to
> support both Hamoa (x1e*/x1p6*) and Purwa (x1p4*/x1*) variants.
> Required because the device trees are not compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  ...hp-omnibook-x14.dts => x1-hp-omnibook-x14.dtsi} |   48 +-
>  .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1606 +-------------------
>  2 files changed, 48 insertions(+), 1606 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
> similarity index 97%
> copy from arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> copy to arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
> index 716205b437df55489cfb7d29846cdaf8e403cf72..e6851dbaba121029bde926310616169e319cf5e3 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> +++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
> [...]
> @@ -1028,6 +1015,7 @@ &mdss_dp0 {
>  };
>  
>  &mdss_dp0_out {
> +	data-lanes = <0 1>;
>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  };
>  
> @@ -1036,15 +1024,13 @@ &mdss_dp1 {
>  };
>  
>  &mdss_dp1_out {
> +	data-lanes = <0 1>;
>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  };
>  
>  &mdss_dp3 {
>  	/delete-property/ #sound-dai-cells;
>  
> -	pinctrl-0 = <&edp0_hpd_default>;
> -	pinctrl-names = "default";
> -
>  	status = "okay";
>  
>  	aux-bus {
> @@ -1061,13 +1047,19 @@ edp_panel_in: endpoint {
>  			};
>  		};
>  	};
> -};
>  
> -&mdss_dp3_out {
> -	data-lanes = <0 1 2 3>;
> -	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +
> +			mdss_dp3_out: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  
> -	remote-endpoint = <&edp_panel_in>;
> +				remote-endpoint = <&edp_panel_in>;
> +			};
> +		};
> +	};
>  };
>  
>  &mdss_dp3_phy {

Please review the resulting diff carefully when you rebase changes with
conflicts. You're reverting other changes (4 lane DP, eDP HPD pinctrl)
here. :-)

Thanks,
Stephan

