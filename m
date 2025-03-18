Return-Path: <linux-arm-msm+bounces-51666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C800A66966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60F73188C1F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 05:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C611A256E;
	Tue, 18 Mar 2025 05:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C4x5QfnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE0F1A264A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742275868; cv=none; b=fSdEKfCdZLq5E7MjNYeH9t7jT8ImSd6KUwk1lbKLW/iiUax5pCZmme8HH5nN4VKOGQ6Vi0BOfqeqd77IetfxrWTnvIFjALZU9rTozmAO0nxFf0Et2d45Y8w3OzojyltzQRtYW7AfnVoqhqM9T7Mm/HQQZU2UlXHwEsWgmszwoto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742275868; c=relaxed/simple;
	bh=uc0nqUy8n6Lwy/VSv9TAgXJgTNY7busrfcgDDejJjrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZ3d60HEAmYnAHMv36A0Wz82+5qIfPiDkafXFgjQ5BnDZvDur/X2h4rJ6ZK08E5IvNKRZFJRF8l7jumWrAGeRAZFu1PJQLi8a5f93POaIGras9jqpvhL2fLQuDZ5ywtWmiHhMoEgBIY7acEObaodJzLmnX+48WC5kyZD7acS1q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C4x5QfnQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225a28a511eso86503455ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 22:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742275866; x=1742880666; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZOO6fXLUM5QQ6l+FSRSueHWGfAmK/qcP1DtlCjY8Js=;
        b=C4x5QfnQHvohKSaOJtlIvFHlPp/GGUhkytSkRerthYH9tDzm4NUFRTiSqZxngKOMTs
         ErT/dlUGXy2fuZbBQh+EFlC/2myqdIgNRQ/Mea7o7VzBdgFzxSXUMU4K9xTUO6RSb6BY
         PfBFJFpjSbtoYEeyD0o5cIzuSOfLbWpTZotxRAvkBhBhemdZu38Fn6jk3v5Q5ftMumwg
         i+kf/xcy6LRJ/VgPtYIAdKy1hZil6Omr1JXsHbb4CqW79jT+BWZc6gqAiZd5EtF7PDD0
         /qoJ9UJMJ3LIAKUQWzpnOja5b+MeFtC/9NpfSrAmMBLVD7pEVpULirTViEehTHMtkYxs
         heFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742275866; x=1742880666;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZOO6fXLUM5QQ6l+FSRSueHWGfAmK/qcP1DtlCjY8Js=;
        b=GSaqBB1kztR3rAiGKgikZADLJZonOgE3bl1Du/EU09KwxHcLy0lcce0fMjP5XOnnRf
         lSR2dKszT0Fey4ZWuaEGF1hVjNGHu7p+sbsfcV1wbCT5engaTPaEmBEmFckki+HWkeGv
         W4M700mWb+sIW2f7dmD9vPGEZIeW8j1fqp3roqI/rrgY5JfZ2x5VDpxnYRwiFh5cH1T/
         C3tlxm4HPf72cOGYkz2eVbLvcv+MfDhVSaRr+lPx1TlfVOxsYK5xN2YTwlh1IU9hojDq
         EHIaC5LPglX5uUhxydaqo17+fk6MSlruqCqiQuvZGXfuFrqNFIsQvsuoGzfA3FqQ7mTD
         BkXA==
X-Forwarded-Encrypted: i=1; AJvYcCVK/nxpwMUIhCfBLGxVtPXYXEM3ognUa7pmxWt2duBk1xNnWPtQpA8hXuTikibKK/5cNjBu1smsYNdTCnrz@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLD2BjfKWrKTGaG8oOTf6etuFVaYN/Y7s/IlO1qTealHHXLj+
	/RTTWXSProWSKe7ygMD0vG6GnYx3iSlNrmf2gzHxjWMXf76a97ptXVI6YK/1Qg==
X-Gm-Gg: ASbGncvKPX+vicHgC3sNlM8rPWOpD2zCOdhe0Q4HGSsAMJ5kowQwfVeqnEt+jcPvyAk
	WmXb68azTn3v9UqO7YN++/pBlrWvDiW3C2yoT1FBfJBOqOm8lZqRD94TW80EAoAXXWCswSnh+9s
	Zx2GtkArPX+CWrcbxmDZUhD829KQNqr58BEx5UbZAnYKXmQPZtoCLo0ORPU2RLHpOiXMoMzuevy
	m3cmagCFuhT/kvCiRyWlt0+MNr2DLlOtk0fESdwZ/uNj5LRuA2FSjfRbym5EinsMbPfn9IUDM+0
	U2wv3aCbnXjCAlRVr6NDxJ8GSmbrkkb1tL/oGc6pMzua/ed0tuC2wE81
X-Google-Smtp-Source: AGHT+IHLYD5fTKzDENoVI+mnh+1/mTxdSkdiF0on8Wov7vEkkGeSNfMXP1QSWphdwBuAx/8LoGtLHg==
X-Received: by 2002:a17:902:ce84:b0:220:ca08:8986 with SMTP id d9443c01a7336-225e0a6c2ddmr176694025ad.22.1742275866087;
        Mon, 17 Mar 2025 22:31:06 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe5a2sm85314025ad.196.2025.03.17.22.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:31:05 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:00:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manish Pandey <quic_mapa@quicinc.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sm8750: Add UFS nodes for
 SM8750 QRD board
Message-ID: <20250318053058.ddhzbilbtenglfy4@thinkpad>
References: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
 <20250310-sm8750_ufs_master-v2-6-0dfdd6823161@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310-sm8750_ufs_master-v2-6-0dfdd6823161@quicinc.com>

On Mon, Mar 10, 2025 at 02:12:34PM -0700, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Add UFS host controller and PHY nodes for SM8750 QRD board.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> index f77efab0aef9bab751a947173bcdcc27df7295a8..8dd82494ba5aea6e6b5ddafc9299ec68dfb84bcd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> @@ -790,3 +790,21 @@ &tlmm {
>  &uart7 {
>  	status = "okay";
>  };
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1j_0p91>;
> +	vdda-pll-supply = <&vreg_l3g_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 215 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l1d_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.46.1
> 

-- 
மணிவண்ணன் சதாசிவம்

