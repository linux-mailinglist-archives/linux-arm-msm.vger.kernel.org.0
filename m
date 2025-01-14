Return-Path: <linux-arm-msm+bounces-45029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021CA10DFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 18:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AD313A00BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 17:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427AD1F9AAB;
	Tue, 14 Jan 2025 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O57KyK3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F222418952C;
	Tue, 14 Jan 2025 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876570; cv=none; b=mI4VMCvimNI5K5/gYTqniDqhRjYQx5z3DM3MV4rsA6z9ffaUBe0a3DLJpHQPi4EXYZBHuw9Ge3skNGw1kXb+2J1h/2FE0lut+7q64Cdp2fyAMbzFHVgLp1VQiojLUu7J8meiaxT9nun6FyFr5CWeMRlwNkpeper1DsYgMPw7T6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876570; c=relaxed/simple;
	bh=yOkvEIkygUac4d+YxTebB6bbLqFJL8zjUGkETc++2cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkYb+rpsPy8hGoS3C6pYCSn1NKfzSpSTnmG0JAacjyt1uKUpls7FDF1zLPi+ZYdbpkk5UE+izgdynWYckIfH9m5TDGNq595YRy/yk8xdEOYhnSbYCyqIK4kO5+CBsCe41CAh2DNgGcuKEWc++lkghd/DH2XJy6LpL0S2cY7A0CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O57KyK3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4B1C2BCB7;
	Tue, 14 Jan 2025 17:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736876569;
	bh=yOkvEIkygUac4d+YxTebB6bbLqFJL8zjUGkETc++2cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O57KyK3aGCVIiHnJ+R9wkCYgeK07fssDhwxu63CzPo3hX9MuWBbnPm6CymU4Byhpj
	 s3KYnNcP+xlzrlPg7FXGcHiSs8ne4qhG3Y+x8BEzgMcJpsXAkaRTciusvZB3vKwJWR
	 tvFP8SW93d8YK4/ZxCtkRlbm3TSF2r3Rz2i/MSoTjKTXdtv7Ja/AdECvqQRPvma1vu
	 rRAzvVuNGQEqgEkBChOzJQ0yTncsmDvFQLNIBXk6+YrTlg7PptXAbpbQW4V+IjstvX
	 U825qkq8pMSeiU+Rljl+uzgqgG+43iAciZxFElXFmgXzGW4RGKkVkE9nnVShG/Brn3
	 fn8SoJ8acEd2w==
Date: Tue, 14 Jan 2025 11:42:48 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/12] of: overlays: dwc3-flattening: Add Qualcomm
 Arm64 board overlays
Message-ID: <20250114174248.GA1414434-robh@kernel.org>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <20250113-dwc3-refactor-v3-6-d1722075df7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-dwc3-refactor-v3-6-d1722075df7b@oss.qualcomm.com>

On Mon, Jan 13, 2025 at 09:11:39PM -0800, Bjorn Andersson wrote:
> Introduce the overlays necessary for migrating Qualcomm Arm64 boards
> currently present in the upstream Linux kernel.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/of/overlays/dwc3-flattening/Makefile       |  84 +++
>  .../of/overlays/dwc3-flattening/dwc3-flattening.c  | 588 +++++++++++++++++++++
>  .../of/overlays/dwc3-flattening/dwc3-flattening.h  | 168 ++++++
>  .../overlays/dwc3-flattening/dwc3-qcom_apq8094.dts |  32 ++

.dtso is the preferred extension.

>  .../overlays/dwc3-flattening/dwc3-qcom_apq8096.dts |  60 +++
>  .../dwc3-qcom_apq8096_inforce_ifc6640.dts          |  58 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts |  28 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts |  32 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts |  58 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts |  54 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts |  58 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts |  29 +
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8953.dts |  32 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8992.dts |  32 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8994.dts |  32 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8996.dts |  58 ++
>  .../dwc3-qcom_msm8996_oneplus_oneplus3.dts         |  56 ++
>  .../dwc3-qcom_msm8996_oneplus_oneplus3t.dts        |  56 ++
>  .../dwc3-qcom_msm8996_sony_dora_row.dts            |  57 ++
>  .../dwc3-qcom_msm8996_sony_kagura_row.dts          |  57 ++
>  .../dwc3-qcom_msm8996_sony_keyaki_row.dts          |  57 ++
>  .../dwc3-qcom_msm8996_xiaomi_gemini.dts            |  56 ++
>  .../dwc3-qcom_msm8996_xiaomi_natrium.dts           |  56 ++
>  .../dwc3-qcom_msm8996_xiaomi_scorpio.dts           |  56 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8998.dts |  34 ++
>  .../dwc3-qcom_msm8998_fxtec_pro1.dts               |  35 ++
>  .../dwc3-qcom_msm8998_oneplus_cheeseburger.dts     |  32 ++
>  .../dwc3-qcom_msm8998_oneplus_dumpling.dts         |  32 ++
>  .../dwc3-qcom_msm8998_sony_xperia_lilac.dts        |  35 ++
>  .../dwc3-qcom_msm8998_sony_xperia_maple.dts        |  35 ++
>  .../dwc3-qcom_msm8998_sony_xperia_poplar.dts       |  35 ++
>  .../dwc3-qcom_msm8998_xiaomi_sagit.dts             |  32 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_qcm2290.dts |  32 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_qcm6490.dts |  63 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_qcs404.dts  |  56 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_qcs615.dts  |  62 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_qcs8300.dts |  62 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_qdu1000.dts |  38 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_qru1000.dts |  38 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sa8155p.dts |  71 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_sa8540p.dts | 129 +++++
>  .../overlays/dwc3-flattening/dwc3-qcom_sa8775p.dts |  90 ++++
>  .../dwc3-flattening/dwc3-qcom_sar2130p.dts         |  39 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sc7180.dts  |  39 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sc7280.dts  |  63 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_sc8180x.dts | 109 ++++
>  .../dwc3-flattening/dwc3-qcom_sc8280xp.dts         | 129 +++++
>  .../dwc3-qcom_sc8280xp_microsoft_blackrock.dts     | 121 +++++
>  .../overlays/dwc3-flattening/dwc3-qcom_sda660.dts  |  59 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm450.dts  |  33 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm630.dts  |  57 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm632.dts  |  32 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm636.dts  |  59 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm660.dts  |  57 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm670.dts  |  36 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm845.dts  |  64 +++
>  .../dwc3-qcom_sdm845_lenovo_yoga_c630.dts          |  67 +++
>  .../dwc3-flattening/dwc3-qcom_sdm845_lg_judyln.dts |  67 +++
>  .../dwc3-flattening/dwc3-qcom_sdm845_lg_judyp.dts  |  67 +++
>  .../dwc3-qcom_sdm845_qcom_sdm845_mtp.dts           |  67 +++
>  .../dwc3-qcom_sdm845_samsung_starqltechn.dts       |  67 +++
>  .../dwc3-qcom_sdm845_samsung_w737.dts              |  67 +++
>  .../dwc3-qcom_sdm845_shift_axolotl.dts             |  67 +++
>  .../dwc3-qcom_sdm845_thundercomm_db845c.dts        |  67 +++
>  .../dwc3-qcom_sdm845_xiaomi_beryllium.dts          |  67 +++
>  .../dwc3-qcom_sdm845_xiaomi_beryllium_ebbg.dts     |  67 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_sdx75.dts   |  36 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm4250.dts  |  37 ++
>  .../dwc3-qcom_sm4250_oneplus_billie2.dts           |  35 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm6115.dts  |  37 ++
>  .../dwc3-qcom_sm6115_lenovo_j606f.dts              |  35 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm6125.dts  |  36 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm6350.dts  |  39 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm6375.dts  |  36 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm7125.dts  |  39 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm7225.dts  |  39 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm7325.dts  |  60 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8150.dts  |  67 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8250.dts  |  67 +++
>  .../dwc3-qcom_sm8250_xiaomi_elish.dts              |  64 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8350.dts  |  67 +++
>  .../dwc3-qcom_sm8350_microsoft_surface_duo2.dts    |  67 +++
>  .../dwc3-qcom_sm8350_qcom_sm8350_hdk.dts           |  69 +++
>  .../dwc3-qcom_sm8350_qcom_sm8350_mtp.dts           |  67 +++
>  .../dwc3-qcom_sm8350_sony_pdx214_generic.dts       |  67 +++
>  .../dwc3-qcom_sm8350_sony_pdx215_generic.dts       |  67 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8450.dts  |  39 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8550.dts  |  39 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8650.dts  |  39 ++
>  .../dwc3-flattening/dwc3-qcom_x1e80100.dts         | 153 ++++++
>  .../dwc3-qcom_x1e80100_hp_omnibook_x14.dts         | 149 ++++++
>  91 files changed, 5782 insertions(+)
> 
> diff --git a/drivers/of/overlays/dwc3-flattening/Makefile b/drivers/of/overlays/dwc3-flattening/Makefile
> index 248ddabd424e..afc509d97d1b 100644
> --- a/drivers/of/overlays/dwc3-flattening/Makefile
> +++ b/drivers/of/overlays/dwc3-flattening/Makefile
> @@ -2,9 +2,93 @@
>  
>  obj-$(CONFIG_OF_OVERLAYS_DWC3_FLATTENING) += dwc3-flattening-overlay.o
>  dwc3-flattening-overlay-y += dwc3-flattening.o
> +dwc3-flattening-overlay-y += dwc3-qcom_apq8094.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_apq8096.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_apq8096_inforce_ifc6640.dtb.o
>  dwc3-flattening-overlay-y += dwc3-qcom_ipq4018.dtb.o
>  dwc3-flattening-overlay-y += dwc3-qcom_ipq4018_8dev_jalapeno.dtb.o
>  dwc3-flattening-overlay-y += dwc3-qcom_ipq4019.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_ipq5018.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_ipq5332.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_ipq5424.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_ipq6018.dtb.o
>  dwc3-flattening-overlay-y += dwc3-qcom_ipq8064.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_ipq8074.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_ipq9574.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8953.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8992.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8994.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8996.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8996_oneplus_oneplus3.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8996_oneplus_oneplus3t.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8996_sony_dora_row.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8996_sony_kagura_row.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8996_sony_keyaki_row.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8996_xiaomi_gemini.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8996_xiaomi_natrium.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8996_xiaomi_scorpio.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8998.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8998_fxtec_pro1.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8998_oneplus_cheeseburger.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8998_oneplus_dumpling.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8998_sony_xperia_lilac.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8998_sony_xperia_maple.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8998_sony_xperia_poplar.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_msm8998_xiaomi_sagit.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_qcm2290.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_qcm6490.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_qcs404.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_qcs615.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_qcs8300.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_qdu1000.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_qru1000.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sa8155p.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sa8540p.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sa8775p.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sar2130p.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sc7180.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sc7280.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sc8180x.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sc8280xp.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sc8280xp_microsoft_blackrock.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sda660.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm450.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm630.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm632.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm636.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm660.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm670.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_lenovo_yoga_c630.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_lg_judyln.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_lg_judyp.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_qcom_sdm845_mtp.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_samsung_starqltechn.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_samsung_w737.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_shift_axolotl.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_thundercomm_db845c.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_xiaomi_beryllium.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdm845_xiaomi_beryllium_ebbg.dtb.o
>  dwc3-flattening-overlay-y += dwc3-qcom_sdx55.dtb.o
>  dwc3-flattening-overlay-y += dwc3-qcom_sdx65.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sdx75.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm4250.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm4250_oneplus_billie2.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm6115.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm6115_lenovo_j606f.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm6125.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm6350.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm6375.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm7125.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm7225.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm7325.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm8150.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm8250.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm8250_xiaomi_elish.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm8350.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm8350_qcom_sm8350_hdk.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm8450.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm8550.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_sm8650.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_x1e80100.dtb.o
> +dwc3-flattening-overlay-y += dwc3-qcom_x1e80100_hp_omnibook_x14.dtb.o

Some of these platforms are quite new. I think they could tolerate a 
flag day. It's your fault for knowing this is a problem and continuing 
to accept new users...

For the ones we do maintain compatibility, I would like to define some 
timeframe for doing so. This would be a lot of stuff to keep forever. I 
suspect the ABI gets broken anyways and/or there are new features 
enabled.

> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
> index 0a3a31c5088b..d33cdf6661c0 100644
> --- a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
> @@ -21,6 +21,24 @@ struct dwc3_overlay_data {
>  	const char *migrate_match;
>  };
>  
> +static const struct dwc3_overlay_data dwc3_qcom_apq8094_overlay = {

Can't all these be init section? It's a lot of bloat for everyone else 
otherwise. Same issue for the overlays themselves. The one that you 
apply should be copied out of init.

> +	.fdt = __dtb_dwc3_qcom_apq8094_begin,
> +	.end = __dtb_dwc3_qcom_apq8094_end,
> +	.migrate_match = "qcom,dwc3",

This is the same everywhere AFAICT, so why do we need it?

> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_apq8096_overlay = {
> +	.fdt = __dtb_dwc3_qcom_apq8096_begin,
> +	.end = __dtb_dwc3_qcom_apq8096_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_apq8096_inforce_ifc6640_overlay = {
> +	.fdt = __dtb_dwc3_qcom_apq8096_inforce_ifc6640_begin,
> +	.end = __dtb_dwc3_qcom_apq8096_inforce_ifc6640_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
>  static const struct dwc3_overlay_data dwc3_qcom_ipq4018_overlay = {
>  	.fdt = __dtb_dwc3_qcom_ipq4018_begin,
>  	.end = __dtb_dwc3_qcom_ipq4018_end,
> @@ -39,12 +57,372 @@ static const struct dwc3_overlay_data dwc3_qcom_ipq4019_overlay = {
>  	.migrate_match = "qcom,dwc3",
>  };
>  
> +static const struct dwc3_overlay_data dwc3_qcom_ipq5018_overlay = {
> +	.fdt = __dtb_dwc3_qcom_ipq5018_begin,
> +	.end = __dtb_dwc3_qcom_ipq5018_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_ipq5332_overlay = {
> +	.fdt = __dtb_dwc3_qcom_ipq5332_begin,
> +	.end = __dtb_dwc3_qcom_ipq5332_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_ipq5424_overlay = {
> +	.fdt = __dtb_dwc3_qcom_ipq5424_begin,
> +	.end = __dtb_dwc3_qcom_ipq5424_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_ipq6018_overlay = {
> +	.fdt = __dtb_dwc3_qcom_ipq6018_begin,
> +	.end = __dtb_dwc3_qcom_ipq6018_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
>  static const struct dwc3_overlay_data dwc3_qcom_ipq8064_overlay = {
>  	.fdt = __dtb_dwc3_qcom_ipq8064_begin,
>  	.end = __dtb_dwc3_qcom_ipq8064_end,
>  	.migrate_match = "qcom,dwc3",
>  };
>  
> +static const struct dwc3_overlay_data dwc3_qcom_ipq8074_overlay = {
> +	.fdt = __dtb_dwc3_qcom_ipq8074_begin,
> +	.end = __dtb_dwc3_qcom_ipq8074_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_ipq9574_overlay = {
> +	.fdt = __dtb_dwc3_qcom_ipq9574_begin,
> +	.end = __dtb_dwc3_qcom_ipq9574_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8953_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8953_begin,
> +	.end = __dtb_dwc3_qcom_msm8953_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8992_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8992_begin,
> +	.end = __dtb_dwc3_qcom_msm8992_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8994_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8994_begin,
> +	.end = __dtb_dwc3_qcom_msm8994_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8996_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8996_begin,
> +	.end = __dtb_dwc3_qcom_msm8996_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8996_oneplus_oneplus3_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_begin,
> +	.end = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8996_oneplus_oneplus3t_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_begin,
> +	.end = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8996_sony_dora_row_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8996_sony_dora_row_begin,
> +	.end = __dtb_dwc3_qcom_msm8996_sony_dora_row_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8996_sony_kagura_row_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8996_sony_kagura_row_begin,
> +	.end = __dtb_dwc3_qcom_msm8996_sony_kagura_row_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8996_sony_keyaki_row_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8996_sony_keyaki_row_begin,
> +	.end = __dtb_dwc3_qcom_msm8996_sony_keyaki_row_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8996_xiaomi_gemini_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8996_xiaomi_gemini_begin,
> +	.end = __dtb_dwc3_qcom_msm8996_xiaomi_gemini_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8996_xiaomi_natrium_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8996_xiaomi_natrium_begin,
> +	.end = __dtb_dwc3_qcom_msm8996_xiaomi_natrium_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8996_xiaomi_scorpio_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_begin,
> +	.end = __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8998_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8998_begin,
> +	.end = __dtb_dwc3_qcom_msm8998_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8998_fxtec_pro1_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8998_fxtec_pro1_begin,
> +	.end = __dtb_dwc3_qcom_msm8998_fxtec_pro1_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8998_oneplus_cheeseburger_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_begin,
> +	.end = __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8998_oneplus_dumpling_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8998_oneplus_dumpling_begin,
> +	.end = __dtb_dwc3_qcom_msm8998_oneplus_dumpling_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8998_sony_xperia_lilac_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_begin,
> +	.end = __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8998_sony_xperia_maple_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8998_sony_xperia_maple_begin,
> +	.end = __dtb_dwc3_qcom_msm8998_sony_xperia_maple_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8998_sony_xperia_poplar_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_begin,
> +	.end = __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_msm8998_xiaomi_sagit_overlay = {
> +	.fdt = __dtb_dwc3_qcom_msm8998_xiaomi_sagit_begin,
> +	.end = __dtb_dwc3_qcom_msm8998_xiaomi_sagit_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_qcm2290_overlay = {
> +	.fdt = __dtb_dwc3_qcom_qcm2290_begin,
> +	.end = __dtb_dwc3_qcom_qcm2290_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_qcm6490_overlay = {
> +	.fdt = __dtb_dwc3_qcom_qcm6490_begin,
> +	.end = __dtb_dwc3_qcom_qcm6490_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_qcs404_overlay = {
> +	.fdt = __dtb_dwc3_qcom_qcs404_begin,
> +	.end = __dtb_dwc3_qcom_qcs404_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_qcs615_overlay = {
> +	.fdt = __dtb_dwc3_qcom_qcs615_begin,
> +	.end = __dtb_dwc3_qcom_qcs615_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_qcs8300_overlay = {
> +	.fdt = __dtb_dwc3_qcom_qcs8300_begin,
> +	.end = __dtb_dwc3_qcom_qcs8300_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_qdu1000_overlay = {
> +	.fdt = __dtb_dwc3_qcom_qdu1000_begin,
> +	.end = __dtb_dwc3_qcom_qdu1000_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_qru1000_overlay = {
> +	.fdt = __dtb_dwc3_qcom_qru1000_begin,
> +	.end = __dtb_dwc3_qcom_qru1000_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sa8155p_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sa8155p_begin,
> +	.end = __dtb_dwc3_qcom_sa8155p_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sa8540p_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sa8540p_begin,
> +	.end = __dtb_dwc3_qcom_sa8540p_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sa8775p_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sa8775p_begin,
> +	.end = __dtb_dwc3_qcom_sa8775p_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sar2130p_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sar2130p_begin,
> +	.end = __dtb_dwc3_qcom_sar2130p_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sc7180_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sc7180_begin,
> +	.end = __dtb_dwc3_qcom_sc7180_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sc7280_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sc7280_begin,
> +	.end = __dtb_dwc3_qcom_sc7280_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sc8180x_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sc8180x_begin,
> +	.end = __dtb_dwc3_qcom_sc8180x_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sc8280xp_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sc8280xp_begin,
> +	.end = __dtb_dwc3_qcom_sc8280xp_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sc8280xp_microsoft_blackrock_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_begin,
> +	.end = __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sda660_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sda660_begin,
> +	.end = __dtb_dwc3_qcom_sda660_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm450_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm450_begin,
> +	.end = __dtb_dwc3_qcom_sdm450_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm630_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm630_begin,
> +	.end = __dtb_dwc3_qcom_sdm630_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm632_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm632_begin,
> +	.end = __dtb_dwc3_qcom_sdm632_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm636_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm636_begin,
> +	.end = __dtb_dwc3_qcom_sdm636_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm660_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm660_begin,
> +	.end = __dtb_dwc3_qcom_sdm660_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm670_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm670_begin,
> +	.end = __dtb_dwc3_qcom_sdm670_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_lenovo_yoga_c630_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_lg_judyln_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_lg_judyln_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_lg_judyln_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_lg_judyp_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_lg_judyp_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_lg_judyp_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_qcom_sdm845_mtp_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_samsung_starqltechn_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_samsung_starqltechn_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_samsung_starqltechn_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_samsung_w737_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_samsung_w737_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_samsung_w737_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_shift_axolotl_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_shift_axolotl_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_shift_axolotl_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_thundercomm_db845c_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_thundercomm_db845c_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_thundercomm_db845c_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_xiaomi_beryllium_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_begin,
> +	.end = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
>  static const struct dwc3_overlay_data dwc3_qcom_sdx55_overlay = {
>  	.fdt = __dtb_dwc3_qcom_sdx55_begin,
>  	.end = __dtb_dwc3_qcom_sdx55_end,
> @@ -57,13 +435,223 @@ static const struct dwc3_overlay_data dwc3_qcom_sdx65_overlay = {
>  	.migrate_match = "qcom,dwc3",
>  };
>  
> +static const struct dwc3_overlay_data dwc3_qcom_sdx75_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sdx75_begin,
> +	.end = __dtb_dwc3_qcom_sdx75_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm4250_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm4250_begin,
> +	.end = __dtb_dwc3_qcom_sm4250_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm4250_oneplus_billie2_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm4250_oneplus_billie2_begin,
> +	.end = __dtb_dwc3_qcom_sm4250_oneplus_billie2_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm6115_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm6115_begin,
> +	.end = __dtb_dwc3_qcom_sm6115_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm6115_lenovo_j606f_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm6115_lenovo_j606f_begin,
> +	.end = __dtb_dwc3_qcom_sm6115_lenovo_j606f_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm6125_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm6125_begin,
> +	.end = __dtb_dwc3_qcom_sm6125_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm6350_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm6350_begin,
> +	.end = __dtb_dwc3_qcom_sm6350_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm6375_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm6375_begin,
> +	.end = __dtb_dwc3_qcom_sm6375_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm7125_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm7125_begin,
> +	.end = __dtb_dwc3_qcom_sm7125_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm7225_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm7225_begin,
> +	.end = __dtb_dwc3_qcom_sm7225_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm7325_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm7325_begin,
> +	.end = __dtb_dwc3_qcom_sm7325_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm8150_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm8150_begin,
> +	.end = __dtb_dwc3_qcom_sm8150_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm8250_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm8250_begin,
> +	.end = __dtb_dwc3_qcom_sm8250_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm8250_xiaomi_elish_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm8250_xiaomi_elish_begin,
> +	.end = __dtb_dwc3_qcom_sm8250_xiaomi_elish_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm8350_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm8350_begin,
> +	.end = __dtb_dwc3_qcom_sm8350_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm8350_qcom_sm8350_hdk_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_begin,
> +	.end = __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm8450_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm8450_begin,
> +	.end = __dtb_dwc3_qcom_sm8450_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm8550_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm8550_begin,
> +	.end = __dtb_dwc3_qcom_sm8550_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_sm8650_overlay = {
> +	.fdt = __dtb_dwc3_qcom_sm8650_begin,
> +	.end = __dtb_dwc3_qcom_sm8650_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_x1e80100_overlay = {
> +	.fdt = __dtb_dwc3_qcom_x1e80100_begin,
> +	.end = __dtb_dwc3_qcom_x1e80100_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
> +static const struct dwc3_overlay_data dwc3_qcom_x1e80100_hp_omnibook_x14_overlay = {
> +	.fdt = __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_begin,
> +	.end = __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_end,
> +	.migrate_match = "qcom,dwc3",
> +};
> +
>  static const struct of_device_id dwc3_flatten_of_match[] = {
>  	{ .compatible = "8dev,jalapeno", .data = &dwc3_qcom_ipq4018_8dev_jalapeno_overlay },
> +	{ .compatible = "fxtec,pro1", .data = &dwc3_qcom_msm8998_fxtec_pro1_overlay },
> +	{ .compatible = "hp,omnibook-x14", .data = &dwc3_qcom_x1e80100_hp_omnibook_x14_overlay },
> +	{ .compatible = "inforce,ifc6640", .data = &dwc3_qcom_apq8096_inforce_ifc6640_overlay },
> +	{ .compatible = "lenovo,j606f", .data = &dwc3_qcom_sm6115_lenovo_j606f_overlay },
> +	{ .compatible = "lenovo,yoga-c630", .data = &dwc3_qcom_sdm845_lenovo_yoga_c630_overlay },
> +	{ .compatible = "lg,judyln", .data = &dwc3_qcom_sdm845_lg_judyln_overlay },
> +	{ .compatible = "lg,judyp", .data = &dwc3_qcom_sdm845_lg_judyp_overlay },
> +	{ .compatible = "microsoft,blackrock", .data = &dwc3_qcom_sc8280xp_microsoft_blackrock_overlay },
> +	{ .compatible = "oneplus,billie2", .data = &dwc3_qcom_sm4250_oneplus_billie2_overlay },
> +	{ .compatible = "oneplus,cheeseburger", .data = &dwc3_qcom_msm8998_oneplus_cheeseburger_overlay },
> +	{ .compatible = "oneplus,dumpling", .data = &dwc3_qcom_msm8998_oneplus_dumpling_overlay },
> +	{ .compatible = "oneplus,oneplus3", .data = &dwc3_qcom_msm8996_oneplus_oneplus3_overlay },
> +	{ .compatible = "oneplus,oneplus3t", .data = &dwc3_qcom_msm8996_oneplus_oneplus3t_overlay },
> +	{ .compatible = "qcom,apq8094", .data = &dwc3_qcom_apq8094_overlay },
> +	{ .compatible = "qcom,apq8096", .data = &dwc3_qcom_apq8096_overlay },
>  	{ .compatible = "qcom,ipq4018", .data = &dwc3_qcom_ipq4018_overlay },
>  	{ .compatible = "qcom,ipq4019", .data = &dwc3_qcom_ipq4019_overlay },
> +	{ .compatible = "qcom,ipq5018", .data = &dwc3_qcom_ipq5018_overlay },
> +	{ .compatible = "qcom,ipq5332", .data = &dwc3_qcom_ipq5332_overlay },
> +	{ .compatible = "qcom,ipq5424", .data = &dwc3_qcom_ipq5424_overlay },
> +	{ .compatible = "qcom,ipq6018", .data = &dwc3_qcom_ipq6018_overlay },
>  	{ .compatible = "qcom,ipq8064", .data = &dwc3_qcom_ipq8064_overlay },
> +	{ .compatible = "qcom,ipq8074", .data = &dwc3_qcom_ipq8074_overlay },
> +	{ .compatible = "qcom,ipq9574", .data = &dwc3_qcom_ipq9574_overlay },
> +	{ .compatible = "qcom,msm8953", .data = &dwc3_qcom_msm8953_overlay },
> +	{ .compatible = "qcom,msm8992", .data = &dwc3_qcom_msm8992_overlay },
> +	{ .compatible = "qcom,msm8994", .data = &dwc3_qcom_msm8994_overlay },
> +	{ .compatible = "qcom,msm8996", .data = &dwc3_qcom_msm8996_overlay },
> +	{ .compatible = "qcom,msm8998", .data = &dwc3_qcom_msm8998_overlay },
> +	{ .compatible = "qcom,qcm2290", .data = &dwc3_qcom_qcm2290_overlay },
> +	{ .compatible = "qcom,qcm6490", .data = &dwc3_qcom_qcm6490_overlay },
> +	{ .compatible = "qcom,qcs404", .data = &dwc3_qcom_qcs404_overlay },
> +	{ .compatible = "qcom,qcs615", .data = &dwc3_qcom_qcs615_overlay },
> +	{ .compatible = "qcom,qcs8300", .data = &dwc3_qcom_qcs8300_overlay },
> +	{ .compatible = "qcom,qdu1000", .data = &dwc3_qcom_qdu1000_overlay },
> +	{ .compatible = "qcom,qru1000", .data = &dwc3_qcom_qru1000_overlay },
> +	{ .compatible = "qcom,sa8155p", .data = &dwc3_qcom_sa8155p_overlay },
> +	{ .compatible = "qcom,sa8540p", .data = &dwc3_qcom_sa8540p_overlay },
> +	{ .compatible = "qcom,sa8775p", .data = &dwc3_qcom_sa8775p_overlay },
> +	{ .compatible = "qcom,sar2130p", .data = &dwc3_qcom_sar2130p_overlay },
> +	{ .compatible = "qcom,sc7180", .data = &dwc3_qcom_sc7180_overlay },
> +	{ .compatible = "qcom,sc7280", .data = &dwc3_qcom_sc7280_overlay },
> +	{ .compatible = "qcom,sc8180x", .data = &dwc3_qcom_sc8180x_overlay },
> +	{ .compatible = "qcom,sc8280xp", .data = &dwc3_qcom_sc8280xp_overlay },
> +	{ .compatible = "qcom,sda660", .data = &dwc3_qcom_sda660_overlay },
> +	{ .compatible = "qcom,sdm450", .data = &dwc3_qcom_sdm450_overlay },
> +	{ .compatible = "qcom,sdm630", .data = &dwc3_qcom_sdm630_overlay },
> +	{ .compatible = "qcom,sdm632", .data = &dwc3_qcom_sdm632_overlay },
> +	{ .compatible = "qcom,sdm636", .data = &dwc3_qcom_sdm636_overlay },
> +	{ .compatible = "qcom,sdm660", .data = &dwc3_qcom_sdm660_overlay },
> +	{ .compatible = "qcom,sdm670", .data = &dwc3_qcom_sdm670_overlay },
> +	{ .compatible = "qcom,sdm845", .data = &dwc3_qcom_sdm845_overlay },
> +	{ .compatible = "qcom,sdm845-mtp", .data = &dwc3_qcom_sdm845_qcom_sdm845_mtp_overlay },
>  	{ .compatible = "qcom,sdx55", .data = &dwc3_qcom_sdx55_overlay },
>  	{ .compatible = "qcom,sdx65", .data = &dwc3_qcom_sdx65_overlay },
> +	{ .compatible = "qcom,sdx75", .data = &dwc3_qcom_sdx75_overlay },
> +	{ .compatible = "qcom,sm4250", .data = &dwc3_qcom_sm4250_overlay },
> +	{ .compatible = "qcom,sm6115", .data = &dwc3_qcom_sm6115_overlay },
> +	{ .compatible = "qcom,sm6125", .data = &dwc3_qcom_sm6125_overlay },
> +	{ .compatible = "qcom,sm6350", .data = &dwc3_qcom_sm6350_overlay },
> +	{ .compatible = "qcom,sm6375", .data = &dwc3_qcom_sm6375_overlay },
> +	{ .compatible = "qcom,sm7125", .data = &dwc3_qcom_sm7125_overlay },
> +	{ .compatible = "qcom,sm7225", .data = &dwc3_qcom_sm7225_overlay },
> +	{ .compatible = "qcom,sm7325", .data = &dwc3_qcom_sm7325_overlay },
> +	{ .compatible = "qcom,sm8150", .data = &dwc3_qcom_sm8150_overlay },
> +	{ .compatible = "qcom,sm8250", .data = &dwc3_qcom_sm8250_overlay },
> +	{ .compatible = "qcom,sm8350", .data = &dwc3_qcom_sm8350_overlay },
> +	{ .compatible = "qcom,sm8350-hdk", .data = &dwc3_qcom_sm8350_qcom_sm8350_hdk_overlay },
> +	{ .compatible = "qcom,sm8450", .data = &dwc3_qcom_sm8450_overlay },
> +	{ .compatible = "qcom,sm8550", .data = &dwc3_qcom_sm8550_overlay },
> +	{ .compatible = "qcom,sm8650", .data = &dwc3_qcom_sm8650_overlay },
> +	{ .compatible = "qcom,x1e80100", .data = &dwc3_qcom_x1e80100_overlay },
> +	{ .compatible = "samsung,starqltechn", .data = &dwc3_qcom_sdm845_samsung_starqltechn_overlay },
> +	{ .compatible = "samsung,w737", .data = &dwc3_qcom_sdm845_samsung_w737_overlay },
> +	{ .compatible = "shift,axolotl", .data = &dwc3_qcom_sdm845_shift_axolotl_overlay },
> +	{ .compatible = "sony,dora-row", .data = &dwc3_qcom_msm8996_sony_dora_row_overlay },
> +	{ .compatible = "sony,kagura-row", .data = &dwc3_qcom_msm8996_sony_kagura_row_overlay },
> +	{ .compatible = "sony,keyaki-row", .data = &dwc3_qcom_msm8996_sony_keyaki_row_overlay },
> +	{ .compatible = "sony,xperia-lilac", .data = &dwc3_qcom_msm8998_sony_xperia_lilac_overlay },
> +	{ .compatible = "sony,xperia-maple", .data = &dwc3_qcom_msm8998_sony_xperia_maple_overlay },
> +	{ .compatible = "sony,xperia-poplar", .data = &dwc3_qcom_msm8998_sony_xperia_poplar_overlay },
> +	{ .compatible = "thundercomm,db845c", .data = &dwc3_qcom_sdm845_thundercomm_db845c_overlay },
> +	{ .compatible = "xiaomi,beryllium", .data = &dwc3_qcom_sdm845_xiaomi_beryllium_overlay },
> +	{ .compatible = "xiaomi,beryllium-ebbg", .data = &dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_overlay },
> +	{ .compatible = "xiaomi,elish", .data = &dwc3_qcom_sm8250_xiaomi_elish_overlay },
> +	{ .compatible = "xiaomi,gemini", .data = &dwc3_qcom_msm8996_xiaomi_gemini_overlay },
> +	{ .compatible = "xiaomi,natrium", .data = &dwc3_qcom_msm8996_xiaomi_natrium_overlay },
> +	{ .compatible = "xiaomi,sagit", .data = &dwc3_qcom_msm8998_xiaomi_sagit_overlay },
> +	{ .compatible = "xiaomi,scorpio", .data = &dwc3_qcom_msm8996_xiaomi_scorpio_overlay },
>  	{}
>  };
>  
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
> index 57d7dbc94980..bc897db4dd1e 100644
> --- a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
> @@ -4,17 +4,185 @@
>  
>  #include <linux/kernel.h>
>  
> +extern u8 __dtb_dwc3_qcom_apq8094_begin[];
> +extern u8 __dtb_dwc3_qcom_apq8094_end[];
> +extern u8 __dtb_dwc3_qcom_apq8096_begin[];
> +extern u8 __dtb_dwc3_qcom_apq8096_end[];
> +extern u8 __dtb_dwc3_qcom_apq8096_inforce_ifc6640_begin[];
> +extern u8 __dtb_dwc3_qcom_apq8096_inforce_ifc6640_end[];
>  extern u8 __dtb_dwc3_qcom_ipq4018_begin[];
>  extern u8 __dtb_dwc3_qcom_ipq4018_end[];
>  extern u8 __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_begin[];
>  extern u8 __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_end[];
>  extern u8 __dtb_dwc3_qcom_ipq4019_begin[];
>  extern u8 __dtb_dwc3_qcom_ipq4019_end[];
> +extern u8 __dtb_dwc3_qcom_ipq5018_begin[];
> +extern u8 __dtb_dwc3_qcom_ipq5018_end[];
> +extern u8 __dtb_dwc3_qcom_ipq5332_begin[];
> +extern u8 __dtb_dwc3_qcom_ipq5332_end[];
> +extern u8 __dtb_dwc3_qcom_ipq5424_begin[];
> +extern u8 __dtb_dwc3_qcom_ipq5424_end[];
> +extern u8 __dtb_dwc3_qcom_ipq6018_begin[];
> +extern u8 __dtb_dwc3_qcom_ipq6018_end[];
>  extern u8 __dtb_dwc3_qcom_ipq8064_begin[];
>  extern u8 __dtb_dwc3_qcom_ipq8064_end[];
> +extern u8 __dtb_dwc3_qcom_ipq8074_begin[];
> +extern u8 __dtb_dwc3_qcom_ipq8074_end[];
> +extern u8 __dtb_dwc3_qcom_ipq9574_begin[];
> +extern u8 __dtb_dwc3_qcom_ipq9574_end[];
> +extern u8 __dtb_dwc3_qcom_msm8953_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8953_end[];
> +extern u8 __dtb_dwc3_qcom_msm8992_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8992_end[];
> +extern u8 __dtb_dwc3_qcom_msm8994_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8994_end[];
> +extern u8 __dtb_dwc3_qcom_msm8996_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8996_end[];
> +extern u8 __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_end[];
> +extern u8 __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_end[];
> +extern u8 __dtb_dwc3_qcom_msm8996_sony_dora_row_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8996_sony_dora_row_end[];
> +extern u8 __dtb_dwc3_qcom_msm8996_sony_kagura_row_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8996_sony_kagura_row_end[];
> +extern u8 __dtb_dwc3_qcom_msm8996_sony_keyaki_row_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8996_sony_keyaki_row_end[];
> +extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_gemini_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_gemini_end[];
> +extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_natrium_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_natrium_end[];
> +extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_end[];
> +extern u8 __dtb_dwc3_qcom_msm8998_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8998_end[];
> +extern u8 __dtb_dwc3_qcom_msm8998_fxtec_pro1_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8998_fxtec_pro1_end[];
> +extern u8 __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_end[];
> +extern u8 __dtb_dwc3_qcom_msm8998_oneplus_dumpling_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8998_oneplus_dumpling_end[];
> +extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_end[];
> +extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_maple_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_maple_end[];
> +extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_end[];
> +extern u8 __dtb_dwc3_qcom_msm8998_xiaomi_sagit_begin[];
> +extern u8 __dtb_dwc3_qcom_msm8998_xiaomi_sagit_end[];
> +extern u8 __dtb_dwc3_qcom_qcm2290_begin[];
> +extern u8 __dtb_dwc3_qcom_qcm2290_end[];
> +extern u8 __dtb_dwc3_qcom_qcm6490_begin[];
> +extern u8 __dtb_dwc3_qcom_qcm6490_end[];
> +extern u8 __dtb_dwc3_qcom_qcs404_begin[];
> +extern u8 __dtb_dwc3_qcom_qcs404_end[];
> +extern u8 __dtb_dwc3_qcom_qcs615_begin[];
> +extern u8 __dtb_dwc3_qcom_qcs615_end[];
> +extern u8 __dtb_dwc3_qcom_qcs8300_begin[];
> +extern u8 __dtb_dwc3_qcom_qcs8300_end[];
> +extern u8 __dtb_dwc3_qcom_qdu1000_begin[];
> +extern u8 __dtb_dwc3_qcom_qdu1000_end[];
> +extern u8 __dtb_dwc3_qcom_qru1000_begin[];
> +extern u8 __dtb_dwc3_qcom_qru1000_end[];
> +extern u8 __dtb_dwc3_qcom_sa8155p_begin[];
> +extern u8 __dtb_dwc3_qcom_sa8155p_end[];
> +extern u8 __dtb_dwc3_qcom_sa8540p_begin[];
> +extern u8 __dtb_dwc3_qcom_sa8540p_end[];
> +extern u8 __dtb_dwc3_qcom_sa8775p_begin[];
> +extern u8 __dtb_dwc3_qcom_sa8775p_end[];
> +extern u8 __dtb_dwc3_qcom_sar2130p_begin[];
> +extern u8 __dtb_dwc3_qcom_sar2130p_end[];
> +extern u8 __dtb_dwc3_qcom_sc7180_begin[];
> +extern u8 __dtb_dwc3_qcom_sc7180_end[];
> +extern u8 __dtb_dwc3_qcom_sc7280_begin[];
> +extern u8 __dtb_dwc3_qcom_sc7280_end[];
> +extern u8 __dtb_dwc3_qcom_sc8180x_begin[];
> +extern u8 __dtb_dwc3_qcom_sc8180x_end[];
> +extern u8 __dtb_dwc3_qcom_sc8280xp_begin[];
> +extern u8 __dtb_dwc3_qcom_sc8280xp_end[];
> +extern u8 __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_begin[];
> +extern u8 __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_end[];
> +extern u8 __dtb_dwc3_qcom_sda660_begin[];
> +extern u8 __dtb_dwc3_qcom_sda660_end[];
> +extern u8 __dtb_dwc3_qcom_sdm450_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm450_end[];
> +extern u8 __dtb_dwc3_qcom_sdm630_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm630_end[];
> +extern u8 __dtb_dwc3_qcom_sdm632_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm632_end[];
> +extern u8 __dtb_dwc3_qcom_sdm636_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm636_end[];
> +extern u8 __dtb_dwc3_qcom_sdm660_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm660_end[];
> +extern u8 __dtb_dwc3_qcom_sdm670_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm670_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_lg_judyln_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_lg_judyln_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_lg_judyp_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_lg_judyp_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_samsung_starqltechn_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_samsung_starqltechn_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_samsung_w737_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_samsung_w737_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_shift_axolotl_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_shift_axolotl_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_thundercomm_db845c_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_thundercomm_db845c_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_end[];
> +extern u8 __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_begin[];
> +extern u8 __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_end[];
>  extern u8 __dtb_dwc3_qcom_sdx55_begin[];
>  extern u8 __dtb_dwc3_qcom_sdx55_end[];
>  extern u8 __dtb_dwc3_qcom_sdx65_begin[];
>  extern u8 __dtb_dwc3_qcom_sdx65_end[];
> +extern u8 __dtb_dwc3_qcom_sdx75_begin[];
> +extern u8 __dtb_dwc3_qcom_sdx75_end[];
> +extern u8 __dtb_dwc3_qcom_sm4250_begin[];
> +extern u8 __dtb_dwc3_qcom_sm4250_end[];
> +extern u8 __dtb_dwc3_qcom_sm4250_oneplus_billie2_begin[];
> +extern u8 __dtb_dwc3_qcom_sm4250_oneplus_billie2_end[];
> +extern u8 __dtb_dwc3_qcom_sm6115_begin[];
> +extern u8 __dtb_dwc3_qcom_sm6115_end[];
> +extern u8 __dtb_dwc3_qcom_sm6115_lenovo_j606f_begin[];
> +extern u8 __dtb_dwc3_qcom_sm6115_lenovo_j606f_end[];
> +extern u8 __dtb_dwc3_qcom_sm6125_begin[];
> +extern u8 __dtb_dwc3_qcom_sm6125_end[];
> +extern u8 __dtb_dwc3_qcom_sm6350_begin[];
> +extern u8 __dtb_dwc3_qcom_sm6350_end[];
> +extern u8 __dtb_dwc3_qcom_sm6375_begin[];
> +extern u8 __dtb_dwc3_qcom_sm6375_end[];
> +extern u8 __dtb_dwc3_qcom_sm7125_begin[];
> +extern u8 __dtb_dwc3_qcom_sm7125_end[];
> +extern u8 __dtb_dwc3_qcom_sm7225_begin[];
> +extern u8 __dtb_dwc3_qcom_sm7225_end[];
> +extern u8 __dtb_dwc3_qcom_sm7325_begin[];
> +extern u8 __dtb_dwc3_qcom_sm7325_end[];
> +extern u8 __dtb_dwc3_qcom_sm8150_begin[];
> +extern u8 __dtb_dwc3_qcom_sm8150_end[];
> +extern u8 __dtb_dwc3_qcom_sm8250_begin[];
> +extern u8 __dtb_dwc3_qcom_sm8250_end[];
> +extern u8 __dtb_dwc3_qcom_sm8250_xiaomi_elish_begin[];
> +extern u8 __dtb_dwc3_qcom_sm8250_xiaomi_elish_end[];
> +extern u8 __dtb_dwc3_qcom_sm8350_begin[];
> +extern u8 __dtb_dwc3_qcom_sm8350_end[];
> +extern u8 __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_begin[];
> +extern u8 __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_end[];
> +extern u8 __dtb_dwc3_qcom_sm8450_begin[];
> +extern u8 __dtb_dwc3_qcom_sm8450_end[];
> +extern u8 __dtb_dwc3_qcom_sm8550_begin[];
> +extern u8 __dtb_dwc3_qcom_sm8550_end[];
> +extern u8 __dtb_dwc3_qcom_sm8650_begin[];
> +extern u8 __dtb_dwc3_qcom_sm8650_end[];
> +extern u8 __dtb_dwc3_qcom_x1e80100_begin[];
> +extern u8 __dtb_dwc3_qcom_x1e80100_end[];
> +extern u8 __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_begin[];
> +extern u8 __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_end[];
>  
>  #endif
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8094.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8094.dts
> new file mode 100644
> index 000000000000..8ca699460ec3
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8094.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@f92f8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8994-dwc3", "qcom,snps-dwc3";
> +			reg = <0xf9200000 0xd000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096.dts
> new file mode 100644
> index 000000000000..f05d6c905e85
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096.dts
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@6af8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x06a00000 0xd000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";
> +			phys = <&hsusb_phy1>,
> +			       <&usb3phy>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +			extcon = <&usb2_id>;
> +		};
> +	};
> +
> +	fragment@1 {
> +		target-path = "/soc@0/usb@76f8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x07600000 0xd000>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq";
> +			phys = <&hsusb_phy2>;
> +			phy-names = "usb2-phy";
> +			extcon = <&usb3_id>;
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096_inforce_ifc6640.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096_inforce_ifc6640.dts
> new file mode 100644
> index 000000000000..1b9ae360f1ce
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096_inforce_ifc6640.dts
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@6af8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x06a00000 0xd000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";
> +			phys = <&hsusb_phy1>,
> +			       <&usb3phy>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +		};
> +	};
> +
> +	fragment@1 {
> +		target-path = "/soc@0/usb@76f8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x07600000 0xd000>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq";
> +			phys = <&hsusb_phy2>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts
> new file mode 100644
> index 000000000000..44266816a50b
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@8af8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,ipq5018-dwc3", "qcom,snps-dwc3";
> +			reg = <0x08a00000 0xe400>;
> +			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "hs_phy_irq";
> +			phys = <&usbphy0>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts
> new file mode 100644
> index 000000000000..6e6699e4f859
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@8af8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,ipq5332-dwc3", "qcom,snps-dwc3";
> +			reg = <0x08a00000 0xe400>;
> +			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq";
> +			phys = <&usbphy0>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts
> new file mode 100644
> index 000000000000..e14dc85d8b39
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb2@1e00000";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		__overlay__ {
> +			compatible = "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x01e00000 0 0xe400>;
> +			interrupts-extended = <&intc GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "dm_hs_phy_irq",
> +					  "dp_hs_phy_irq";
> +			phys = <&qusb_phy_1>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +
> +	fragment@1 {
> +		target-path = "/soc@0/usb3@8a00000";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		__overlay__ {
> +			compatible = "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x08a00000 0 0xd100>;
> +			interrupts-extended = <&intc GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "dm_hs_phy_irq",
> +					  "dp_hs_phy_irq";
> +			phys = <&qusb_phy_0>,
> +			       <&ssphy_0>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts
> new file mode 100644
> index 000000000000..14e7fa720831
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@70f8800";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,ipq6018-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x07000000 0 0xd100>;
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy";
> +			phys = <&qusb_phy_1>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +
> +	fragment@1 {
> +		target-path = "/soc@0/usb@8af8800";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,ipq6018-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x08a00000 0 0xd100>;
> +			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "ss_phy_irq";
> +			phys = <&qusb_phy_0>,
> +			       <&ssphy_0>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts
> new file mode 100644
> index 000000000000..169da32fcd24
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@8af8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
> +			reg = <0x08a00000 0xd100>;
> +			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "ss_phy_irq";
> +			phys = <&qusb_phy_0>,
> +			       <&ssphy_0>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +		};
> +	};
> +
> +	fragment@1 {
> +		target-path = "/soc@0/usb@8cf8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
> +			reg = <0x08c00000 0xd100>;
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "ss_phy_irq";
> +			phys = <&qusb_phy_1>,
> +			       <&ssphy_1>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts
> new file mode 100644
> index 000000000000..ba644dde4845
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@8af8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		__overlay__ {
> +			compatible = "qcom,ipq9574-dwc3", "qcom,snps-dwc3";
> +			reg = <0x08a00000 0xd100>;
> +			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event";
> +			phys = <&usb_0_qusbphy>,
> +			       <&usb_0_qmpphy>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8953.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8953.dts
> new file mode 100644
> index 000000000000..2c2d8e00ab78
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8953.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@70f8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8953-dwc3", "qcom,snps-dwc3";
> +			reg = <0x07000000 0xd000>;
> +			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "ss_phy_irq";
> +			phys = <&hsusb_phy>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8992.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8992.dts
> new file mode 100644
> index 000000000000..8ca699460ec3
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8992.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@f92f8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8994-dwc3", "qcom,snps-dwc3";

Should be 8992? If not, this is the same as the next overlay.

> +			reg = <0xf9200000 0xd000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8994.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8994.dts
> new file mode 100644
> index 000000000000..8ca699460ec3
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8994.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@f92f8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8994-dwc3", "qcom,snps-dwc3";
> +			reg = <0xf9200000 0xd000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996.dts
> new file mode 100644
> index 000000000000..1b9ae360f1ce
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996.dts
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@6af8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x06a00000 0xd000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";
> +			phys = <&hsusb_phy1>,
> +			       <&usb3phy>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +		};
> +	};
> +
> +	fragment@1 {
> +		target-path = "/soc@0/usb@76f8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x07600000 0xd000>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq";
> +			phys = <&hsusb_phy2>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3.dts
> new file mode 100644
> index 000000000000..7a583de320cf
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3.dts
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@6af8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x06a00000 0xd000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";

No SS phy, so should be dropped? OTOH, less variation if you keep it.

You can utilize includes in overlays just like base .dts files. So this 
one really just needs to include the previous overlay and override phys 
and phy-names.

> +			phys = <&hsusb_phy1>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +
> +	fragment@1 {
> +		target-path = "/soc@0/usb@76f8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x07600000 0xd000>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq";
> +			phys = <&hsusb_phy2>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +};
> diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3t.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3t.dts
> new file mode 100644
> index 000000000000..7a583de320cf
> --- /dev/null
> +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3t.dts

This looks pretty much like the prior one?

> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	fragment@0 {
> +		target-path = "/soc@0/usb@6af8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x06a00000 0xd000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";
> +			phys = <&hsusb_phy1>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +
> +	fragment@1 {
> +		target-path = "/soc@0/usb@76f8800";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +
> +		__overlay__ {
> +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> +			reg = <0x07600000 0xd000>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq";
> +			phys = <&hsusb_phy2>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +};

