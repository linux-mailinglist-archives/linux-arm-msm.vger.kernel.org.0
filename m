Return-Path: <linux-arm-msm+bounces-78616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779EC02031
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 17:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66BF21A6689A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 15:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E5A2FD1DA;
	Thu, 23 Oct 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YthVC6E+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DCA26AEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761232224; cv=none; b=erBBWhWex/Vv0YWiid60OqiZmysYD76Oz9TV6V3JTHsiE47ob7AWVvDM6rxGiuuxt2wOpnEZCkqqz5/JS/UW0Pd71OZTDWYpl8y9vFBBWAhKlZbrQIFkH28QhxQeZSZg0FB2SIt3beUNpO5ghhc0/2fOq28wAtBQfxy9VTDdSdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761232224; c=relaxed/simple;
	bh=jS/tl8GejEKZt6RyRUeLjGioEbGfBS5hy+RYopZnbH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOeZ/4MP1L8+Kxjd63DVU8Qcwy6UuElP3+kXE9Bzhi1ysC0H3auuCIjGsbFJHTOfKYHee6NGWI3z3GPsZivz01GaEKUAU2lbmKbYVwcs96AcyGtddCAAmdA1R3Unx/PwZIhFRU8mLu+mFjgHU06xX6GQG3rJl6k2pwU0FSKzb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YthVC6E+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b4736e043f9so183463066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761232219; x=1761837019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rn4sIRMonqJS565U5gIq1HXLsQ6UCMJF5mc7AD7v/+c=;
        b=YthVC6E+XJBfmhpTNYVH+33wa1xEx6g5KnF1E0293MtkhXYDJ96Pe/ZkmEFcF/jFSc
         4sBLje/SBuguemJHF6/+Ru0THsc5a+KAeaeTsNdra/EAG4pXNH1OxvN1gGPHzc6FVamy
         a24Y6XFVCnmlTnw92cvtXG6jb6b9SamLyxmBRXuNPh55EnwbMujkhXtKD05C4SyUYRSJ
         XkgTFg9AiTWeGHvX6v9f3m1ciIfrZr83cSA41i07sxlGVM27xQg/cc0VvO638z18ZTJx
         uFLi1f6plFEcSDZwBfPHvyOMvxNLnvjnD6P79Dl0ZFajOg4G46yXzCcP/Oq1vDoulG0Z
         /0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761232219; x=1761837019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn4sIRMonqJS565U5gIq1HXLsQ6UCMJF5mc7AD7v/+c=;
        b=X8rSw5+9lF1f1hmkgsFhhCCIpkUw5dCBEYT7ZzBS+tT8c2l/09Wy7zk6frFD1P8G6E
         /QbZiYF4QcnivrdF+/7F59QLjmQlTeupOIxx9foU04K4O14PtckX7GjmDM9kkyB6KwNa
         +MEP/tuLbRJwb8seAagZPdtKyPJiCyhzO/xwyd0L8/jzk7LS9gk+xpJ6/EM2nRNGYfBE
         m1/L3KLnOrFOVjgQNV+MTL0TEeBEeH3PjNHSv5Si6FhBV3bjgkhzbWVHh4PTUod03kIM
         GXHhHniuazNGz1aEKAFlB4HBHDG13S/qn/w4/Mn47ws6kaPO4L8YyYX9cX8BmO+0zOEf
         6qWg==
X-Forwarded-Encrypted: i=1; AJvYcCU8uC7wZzjPXemRWJdmeS6gM2z6FhBUNT2pV8skHmiUfN1E2PvxGrYDRRCgnWLIJLb6X8L8tZm78tsBu86I@vger.kernel.org
X-Gm-Message-State: AOJu0YxN/jO/X3acufClIpDu6qlFZsqriYQgHJ0dueYw2abbIvAwoBUa
	Jgc0KqsSy+CKTPpdJ2pwcBfglC7CSxMNhNPSSiFuMOg3DxdGhwn2b5UlgclvHG8DkoY=
X-Gm-Gg: ASbGncsmBSeh/iBKAtCc9YYODPuOHt4HChuE6wr7Ct4hPrxCA3sHiCrlj3E7W1Dys8R
	k+uPyB/6Q+1gTSJQnVjbVylGp6Y0t+DlSKq5am218fiFxjzwO46iBDBDaGZbv6FFVp/AtRrpYEr
	JP8e9Ws/WJX4fIlLlPWeDrjnJx+5zppTqJRn0TZB+RGVQDnlZR260b68mQMu1KSG5O/HHssGErI
	79JwHRLQUNDaIDI8CedFd7kn8Gzlr6Y609MtJ+Kz4WiCdHgXMxNI0+M790tZ2z0TErzZa2HuuuD
	/UNsjVMo06/eFbJ3OM1bUSVKZN2SbHb8WgwoxS/NTGx/k4dCaVWO6zhxp6A09jP7cm1h8UYPuAH
	/k+xb5C771+6mNc6xkQ3dSS3n1Z2SJcUCaa75wCCmYLDGsufoHNNHkwDM/Pog3VDx0cP1DYp4ik
	VbKtuqJ6nkjxRPGUcVw0TtJCYstqPjfMjyS4Jur9SGFXI=
X-Google-Smtp-Source: AGHT+IFCmGOkZ9Z+BeKuh3wMEq5lW31iuMhm0nrc+NyVReMq7zk49cFcweQ3qmk3B8MHXsNho8LhKw==
X-Received: by 2002:a17:907:720b:b0:b54:981c:405c with SMTP id a640c23a62f3a-b647482e031mr2643427666b.65.1761232218798;
        Thu, 23 Oct 2025 08:10:18 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144e4acsm236078366b.63.2025.10.23.08.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:10:18 -0700 (PDT)
Message-ID: <65afd3b4-180b-47b1-b62a-69c3d5711de0@linaro.org>
Date: Thu, 23 Oct 2025 16:10:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: qcom: camss: Add Qualcomm SM8650 CAMSS
 support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
 <sdAbU8fmsm0UsL9ngXMIEFZLkR_xsHeFW5dZ9qTPiJvQMxT1VFzibK3U8IcFz-8i8Z_WVkrH_5q1gn6qozlYAg==@protonmail.internalid>
 <20251017031131.2232687-3-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017031131.2232687-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 04:11, Vladimir Zapolskiy wrote:
> Add the basic support of CAMSS IP on Qualcomm SM8650 SoC powered boards.
> 
> SM8650 CAMSS provides:
> - 6 x CSIPHY,
> - 3 x CSID, 2 x CSID Lite,
> - 3 x VFE, 2 x VFE Lite.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>   drivers/media/platform/qcom/camss/camss.c     | 326 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   3 files changed, 329 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index dff8d0a1e8c2..f76bcf69159a 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -348,6 +348,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8650:
>   	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		switch (sink_code) {
> @@ -1995,6 +1996,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8650:
>   	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		ret = 16;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2fbcd0e343aa..06a184fb9ae3 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2617,6 +2617,317 @@ static const struct resources_icc icc_res_sm8550[] = {
>   	},
>   };
> 
> +static const struct camss_subdev_resources csiphy_res_sm8650[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy01-0p9", "vdd-csiphy01-1p2", },
> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = {	{ 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdd-csiphy01-0p9", "vdd-csiphy01-1p2", },
> +		.clock = { "csiphy1", "csiphy1_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdd-csiphy24-0p9", "vdd-csiphy24-1p2", },
> +		.clock = { "csiphy2", "csiphy2_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = { "vdd-csiphy35-0p9", "vdd-csiphy35-1p2", },
> +		.clock = { "csiphy3", "csiphy3_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.id = 3,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = { "vdd-csiphy24-0p9", "vdd-csiphy24-1p2", },
> +		.clock = { "csiphy4", "csiphy4_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.id = 4,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY5 */
> +	{
> +		.regulators = { "vdd-csiphy35-0p9", "vdd-csiphy35-1p2", },
> +		.clock = { "csiphy5", "csiphy5_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy5" },
> +		.interrupt = { "csiphy5" },
> +		.csiphy = {
> +			.id = 5,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_sm8650[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = { },
> +		.clock = { "csid", "csiphy_rx" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = { },
> +		.clock = { "csid", "csiphy_rx" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = { },
> +		.clock = { "csid", "csiphy_rx" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID3 lite */
> +	{
> +		.regulators = { },
> +		.clock = { "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 400000000, 480000000 },
> +				{ 0 } },
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID4 lite */
> +	{
> +		.regulators = { },
> +		.clock = { "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 400000000, 480000000 },
> +				{ 0 } },
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +};
> +
> +static const struct camss_subdev_resources vfe_res_sm8650[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "camnoc_axi", "vfe0_fast_ahb", "vfe0", "cpas_vfe0",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = {	{ 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 466000000, 594000000, 675000000, 785000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "camnoc_axi", "vfe1_fast_ahb", "vfe1", "cpas_vfe1",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = {	{ 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 466000000, 594000000, 675000000, 785000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* VFE2 */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "camnoc_axi", "vfe2_fast_ahb", "vfe2", "cpas_vfe2",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = { { 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 466000000, 594000000, 675000000, 785000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe2" },
> +		.interrupt = { "vfe2" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "ife2",
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* VFE3 lite */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "camnoc_axi",
> +			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = { { 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* VFE4 lite */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "camnoc_axi",
> +			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = {	{ 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +};
> +
> +static const struct resources_icc icc_res_sm8650[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,

This value looks dubious.

Not worth holding up the set for though.

> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8300[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -4452,6 +4763,20 @@ static const struct camss_resources sm8550_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_8550),
>   };
> 
> +static const struct camss_resources sm8650_resources = {
> +	.version = CAMSS_8650,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_sm8650,
> +	.csid_res = csid_res_sm8650,
> +	.csid_wrapper_res = &csid_wrapper_res_sm8550,
> +	.vfe_res = vfe_res_sm8650,
> +	.icc_res = icc_res_sm8650,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
> +	.csid_num = ARRAY_SIZE(csid_res_sm8650),
> +	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
> +};
> +
>   static const struct camss_resources x1e80100_resources = {
>   	.version = CAMSS_X1E80100,
>   	.pd_name = "top",
> @@ -4480,6 +4805,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
> +	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>   	{ }
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index a70fbc78ccc3..1875f145995b 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -88,6 +88,7 @@ enum camss_version {
>   	CAMSS_8300,
>   	CAMSS_845,
>   	CAMSS_8550,
> +	CAMSS_8650,
>   	CAMSS_8775P,
>   	CAMSS_X1E80100,
>   };
> --
> 2.49.0
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

