Return-Path: <linux-arm-msm+bounces-49012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF57A40599
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 06:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E344C19C0B0B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 05:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7001FF605;
	Sat, 22 Feb 2025 05:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yG/wPTH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF3E1F0E5C
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Feb 2025 05:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740201276; cv=none; b=DVN3UOdQ2KeGxcO/8IeRQ2/JivZyEbPWVRoRN5BH2LITxI5tAU4FqUJjiuZiJ+tcGORUGkQMvVVegaaTLhMC0hNdppSepYQz6s9synXLpCR+yR+m0qJvd3e7QcO8i3A0fYLNuTMjmZej9bPt/fJ1NTwb/CegbB1+FwIqWCXFPhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740201276; c=relaxed/simple;
	bh=TpojuggT6feRpdZSXMpgkLbae6U6/9sUNlc8HBVpQNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0SZLMn66bnMUaXxNMk4K4BiTb8OLxaJS3Z77f7WSyvr9eh6bseAzujHqgbwBVH6SVfoA0FlSZ/rmsbLLnkOP0WkvnQVUeGkhr5wSw9lGfrI/LmeQSMAT+KPbwAf/Qm2sx9YrQ3tEwgaTIzjPv31nZTIYa6YwlfYL7zeAJXrXvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yG/wPTH6; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6fb9388f9f8so28770597b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740201273; x=1740806073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RwvbWHHETKK51FixReBj+oJDEXTCnpFZVoOS2S1OW8=;
        b=yG/wPTH6J+btCy//KpdAdO3YnJQzm6pPRNebGcbVY0NvEMG76eFFlxGlILklIlqTXp
         oTMz0z+w4zlMGhwzA3YvcohRCH5eU/0qlEofvuMFCEA5/7lDB9g3RE8nSgA2OTSJnKAD
         ru4u9aOJrjrWnsHxR/1mYRs799BpI4koZa+h0X2M9t0Qjfzgvqm+RnntvFY7yusy+ZTA
         441bn/4H0Xq2X/H3b/F6JEbq9A3MJVNGK7uimjAJ6HJgzevxHB6ddvdt4dV/LQNdqVS/
         HyUOM/airgIbVjLV996pZdPr9upcZQaLh8bDy8a6zNHEERFKToKjRpaU8ZcIC1meKBC0
         uynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740201273; x=1740806073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RwvbWHHETKK51FixReBj+oJDEXTCnpFZVoOS2S1OW8=;
        b=w6vusQBoT0LsrR5pLgCYJGqz7ZuJOw1vbKS9144nQH4YmBkMyk2hc0WwZJ68nFt4Eo
         8yVbGwIzd5dnvKCAvIhhP1/5UeJ2P1P0ipmpc62ohknum2x9GqP/ZoVVgfYZ92hLbSB5
         xcZUE/89RKZBy0oNHfe7jUfB76FGzD6ETWu2gJ29cIiPX6lsMSlu9XPdnh7fh0c0zLMV
         PB8h44BqpQF4fVXoe4wmv3iDkG2W1ecBHQmXEj24BoIkg5B1NjE0lZyjGmv2epxISJgz
         LnYlReGbshhUElLxvSGFFT/tEeIuBPV197tfHIXzRan/gXrABpgD/lgV0N4eYIH2QURl
         IqJw==
X-Forwarded-Encrypted: i=1; AJvYcCXq2xbR0fGxsIbT9FPiE7+WtRmrQ+dKgHDYKPAqTbgggj6q6DrDlwpBEG4zOxvUVmD/j2Cyk09mpOwOZObn@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuubBOcIakl+XY1AacRRf/eOMj5Fycjm497EandhP+u6PejmJ
	7bA5/AGcdg0v5hTJ53v2n8Y60njM2crjJDmXwY2fPFZBoKZ7rrfj3X2r2/4ddVNmc4Wk4vDp/1L
	TDGbUCYiupk6FLcbNH8wKkMZEQdVdam6ou0qOrw==
X-Gm-Gg: ASbGnctMYw0wF6XYBbiQvxmGjhFUhbYyg4pdG8pc36vqth/GzRSs3B5WaF0IWcbXeIX
	GBoPYddLXTm50zv0MlUGeO+38zImLQt+Q3DoLZsmwlxyFddc06U/VAvr+0McyKv/SjiNEXFkk2v
	dCd2dHNI1Z/lds0quC1Tg10A==
X-Google-Smtp-Source: AGHT+IGQ/KDfElGvmhXzkExKjHk2cNCssJrpvCzkIdV66lfJ6iHkLOurmTN6M3RYaA42R4m5UEil7RWRi+/OxN7VaZA=
X-Received: by 2002:a05:690c:4587:b0:6ef:60f4:3d41 with SMTP id
 00721157ae682-6fbcc7805f5mr53359567b3.16.1740201273393; Fri, 21 Feb 2025
 21:14:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-4-09afe1dc2524@quicinc.com>
 <tcm2hn7rpzaazntp5r7ag466ynacexnke43e6ypm4q5mrrlkdb@nem3gzib2l2v>
 <0ec95cca-45ed-4805-8ebd-03563d55627e@quicinc.com> <ofaioilki5qxdq2x5fpbpuk6mid6i6slpyqzwol4e2s4cwdwsf@lgpqy2zil4j6>
 <8c48de90-3dda-40c8-8f7a-01102f7360a3@quicinc.com>
In-Reply-To: <8c48de90-3dda-40c8-8f7a-01102f7360a3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 22 Feb 2025 07:14:22 +0200
X-Gm-Features: AWEUYZm-KOty3ecyZHdCAcNlwh-Kws5SWY_GBymMAYd9Ar5b7QNW2Z98djrEc3Q
Message-ID: <CAA8EJprT5cz=tpSpMVAk7HQwTf8V4BdRuaoZPfdObfxwTjnKzw@mail.gmail.com>
Subject: Re: [PATCH 4/7] phy: qcom: qmp-combo: Add new PHY sequences for SM8750
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2025 at 04:43, Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>
>
>
> On 2/4/2025 6:59 AM, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 07:31:29PM -0800, Wesley Cheng wrote:
> >>
> >> On 1/14/2025 2:23 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Jan 13, 2025 at 01:52:10PM -0800, Melody Olvera wrote:
> >>>> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>>>
> >>>> Add new register offsets and PHY values for SM8750. Some of the prev=
ious
> >>>> definitions can be leveraged from older PHY versions as offsets with=
in
> >>>> registers have not changed. This also updates the PHY sequence that =
is
> >>>> recommended after running hardware characterization.
> >>>>
> >>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 198 +++++++++++++++++++=
+++++++++++
> >>>>  1 file changed, 198 insertions(+)
> >>>>
> >>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy=
/qualcomm/phy-qcom-qmp-combo.c
> >>>> index b09fa00e9fe7db8d97b7179ee15d3f07fe578b0c..823a60029ea6acbd1f0f=
8c7d27aaa58de39ed758 100644
> >>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >>>> @@ -1471,6 +1471,139 @@ static const struct qmp_phy_init_tbl x1e8010=
0_usb43dp_pcs_tbl[] =3D {
> >>>>    QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG5, 0x10),
> >>>>  };
> >>>>
> >>>> +static const struct qmp_phy_init_tbl sm8750_usb3_serdes_tbl[] =3D {
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x16),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x41),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x41),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x00),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x75),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x25),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c)=
,
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f)=
,
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c)=
,
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f)=
,
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x08),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x1a),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x00),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x75),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x25),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0c),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x14),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x20),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),
> >>> The only difference from sm8550_usb3_serdes_tbl, it has 0x37 here.
> >> Not sure what the suggestion is here.  I think in general I would want=
 to have a separate table for each chipset, considering that settings may c=
hange/evolve.  Currently, if you're asking to re-use the sm8550 table to av=
oid re-defining this sequence, I think it'll be confusing to folks when the=
y refer to this SOC's PHY settings.
> >
> >
> > No suggestion, merely a question if both tables are correct or not.
> >
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC, 0x0c),
> >>>> +};
> >>>> +
> >>> [...]
> >>>
> >>>> @@ -1781,6 +1914,22 @@ static const struct qmp_combo_offsets qmp_com=
bo_offsets_v5 =3D {
> >>>>    .dp_dp_phy      =3D 0x2200,
> >>>>  };
> >>>>
> >>>> +static const struct qmp_combo_offsets qmp_combo_offsets_v8 =3D {
> >>> Why is it v8? Is the actual PHY also v8 rather than v6?
> >> Yes, actual QMP PHY major rev is v8.  If we want to, I can generate a =
separate v8 based header files if that is better.  However, most of the off=
sets for the registers we're taking advantage of in the actual driver has t=
he same offsets as previous revisions.
> >
> > If all registers of a particular set (QSERDE, TX/RX, PCS) are the same,
> > then it should be fine to reuse those (although it creates some
> > questions). If the majority is the same, but there are some differences=
,
> > please create new header file. It is definitely easier to verify that
> > the patch is correct if every piece has the same version.
> >
>
> Hi Dmitry,
>
> I reviewed the differences in the register sets, and there are new addtio=
ns
> in the v8 QMP PHY, however, we do not use or program those registers as o=
f
> now.  I noticed as well in previous versions, we only capture register
> defines if they are used in any of the init sequences.  Assuming this
> applies in this scenario, its probably ok to keep the v6 version until we
> actually need to add any settings for the new registers.

And when we actually need one of those registers, there will be a
confusion because some of the tables for sm8750 will have V6 and some
will have V8. In the worst case the table will have V6 and V8
registers interleaved.
Please provide a new set of defines for V8 registers.

--=20
With best wishes
Dmitry

