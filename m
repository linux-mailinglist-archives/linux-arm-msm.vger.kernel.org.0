Return-Path: <linux-arm-msm+bounces-28798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCFD954AB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 15:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24201F23538
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 13:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4171B29A7;
	Fri, 16 Aug 2024 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W6/uvAJB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386319644B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813410; cv=none; b=k1SxzS6VKEQyuulazNBfKqQZF79BusPrnkQC2QGi6rHxTqQ3vIPNRW1bO4JrUKcCHY5TdItfVUiie+LeBYaLVoEmzt3KP78BW3qnWnIzKoLZ7/7bsdba7Fo/3syRW1KGflDSndLeIDcxttDOUNHLlSiJhZAZOjRqWeo2nmVzmCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813410; c=relaxed/simple;
	bh=Bhf/LGlbRqZdfgHIrfunXoj04KWXjGQz7oO/HYn1TbA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UvLjQdDNUzvKwRJ2vg33lIiWx1IF08pfFoOX9is+Oevt3gfuAuXcUgYMTQ32WndYq9kAV2uSUpAHQpjx0dRtd1WWohWzWlXLaz1BtxS2w0rT2KI1P1Xl+hgPjmTeyUjF8bu6Uc5hMMOMPt608d36utjw2SuFAT7uCxRVKfJEqr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W6/uvAJB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fd9e6189d5so18092915ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723813408; x=1724418208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OQfaAqpmKipIe2sWzOwLlq2M5dQAOOI2MO8bO5UBdQU=;
        b=W6/uvAJBfigFo2V9hSXMZyVOvdC9T9NC9juVGJGOPDvWb2i3UZxguDwLhSFLvySVgw
         X9BMBbluMbRbPhXVaEEXvseVs+dQ3f+kW/bEZBbQcNzNX+oHu2n7rXmjamGXWVauTj1s
         sS9r9GWduipdC6u6qKUua/9y8Hpzev6Bmo6F2d/Q0M4CUAtdOavdXTCVABpZB94XyzWc
         TTdSbmtpvoVDNHJM4Eh1B58fQI0d1yqqNT9VPPN4RMs3npNiaECfyIedSLlGKwEzrt5b
         g9cBkgDLOLfDA7mJfFErpBg57xT0yfsf1tsv1yVmtHbKgoS+eil3T+DYKePKOc6wnjZD
         t8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723813408; x=1724418208;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQfaAqpmKipIe2sWzOwLlq2M5dQAOOI2MO8bO5UBdQU=;
        b=dVgFQFL6loEeTuc/JYDNXnZ5BdHGUBscyUFoGQiH1cxWS4ywQHc4ZNDyzglJa9+J1m
         +C0P+7A/Do+dzb5UchzRyUQJQjwmc/ZUQeJLvf0aw5F3qe20fFQE9Ii/ofiw4Mv8iLF/
         WO1Tg03j6FhWtvfnpN3oEp3IwLwhdXSdfTfdBzMoN+3oFFMh8WwsGmKRuGlgdJkcb/Cj
         Udr2PsyUzKlnOIiLl+bg96unU3hB9GPlHaeKzhTh1HietvALy0l1TgwZpIU6gtlvQKza
         2e5Dmcq0c9TRqvOymf891eGRJ1jvWX5ExItZwRwWHbt1sFetdIP0tD6fIsSP0yeEVqpt
         7W5g==
X-Forwarded-Encrypted: i=1; AJvYcCUW26cQ+rK3+VCDxDozPUnz/6CW5g8EvzDBxrysl1JCgrQxi/FPeaL3vlUJeYM+I460yrl2Bpze0VXltvITpovGxv/gkS/hxGBD25ZxtA==
X-Gm-Message-State: AOJu0Yxo5D1JVlvmhD4csv2Ln+Ut6G9+LPFOHiR/ZbAKUzxrBIlMFexV
	f0sZaXaPDcrvQyqyqCa2ApPmq4sruRDM9DmwtPiVNlvSopMk8xQXrvQEg0dv4Nk=
X-Google-Smtp-Source: AGHT+IFdUBmRc/DpSnFK/WxuZyxq7bkYwsUpzgm8ThfZ/VGBbZttS6SsyB+sMOcxYseFDz1T1kaWvQ==
X-Received: by 2002:a17:903:32c2:b0:202:26d:146c with SMTP id d9443c01a7336-20203e47f67mr39540595ad.5.1723813407532;
        Fri, 16 Aug 2024 06:03:27 -0700 (PDT)
Received: from [127.0.0.1] ([49.230.136.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f037895dsm25105815ad.155.2024.08.16.06.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 06:03:27 -0700 (PDT)
Date: Fri, 16 Aug 2024 20:03:22 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 quic_jkona@quicinc.com, quic_imrashai@quicinc.com,
 devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/4=5D_arm64=3A_dts=3A_qcom=3A_qcm?=
 =?US-ASCII?Q?6490-idp=3A_Update_protected_clocks_list?=
User-Agent: K-9 Mail for Android
In-Reply-To: <7fda5617-485a-4218-9cd5-bdb9deee0b56@quicinc.com>
References: <20240531102252.26061-1-quic_tdas@quicinc.com> <20240531102252.26061-4-quic_tdas@quicinc.com> <4dvqegoz45ct5rqknf6vgi6rvh4osaecfyp7fcrs26lcsq4npu@dwoyubuqlbss> <3710a210-265c-493d-9d2f-27ebf486d00e@quicinc.com> <qiwy4uyxdrzp2omabh5nacdi37plomua22xsduvpatvb2pcp26@il6ncp7iluj6> <7fda5617-485a-4218-9cd5-bdb9deee0b56@quicinc.com>
Message-ID: <733D0146-BA51-4F4D-A1C3-F3983DB84AD5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 16, 2024 3:34:26 PM GMT+07:00, Taniya Das <quic_tdas@quicinc=2Eco=
m> wrote:
>
>
>On 6/10/2024 11:51 PM, Dmitry Baryshkov wrote:
>> On Mon, Jun 10, 2024 at 03:57:34PM +0530, Taniya Das wrote:
>>>=20
>>>=20
>>> On 5/31/2024 5:34 PM, Dmitry Baryshkov wrote:
>>>> On Fri, May 31, 2024 at 03:52:51PM +0530, Taniya Das wrote:
>>>>> Certain clocks are not accessible on QCM6490-IDP board,
>>>>> thus mark them as protected=2E Update the lpassaudio node to
>>>>> support the new compatible as the lpassaudio needs to support
>>>>> the reset functionality on the QCM6490 board and the rest of
>>>>> the Audio functionality would be provided from the LPASS
>>>>> firmware=2E
>>>>>=20
>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc=2Ecom>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/qcm6490-idp=2Edts | 28 +++++++++++++++++=
++++++-
>>>>>    1 file changed, 27 insertions(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp=2Edts b/arch/arm64=
/boot/dts/qcom/qcm6490-idp=2Edts
>>>>> index a0668f767e4b=2E=2E4eece564331a 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp=2Edts
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp=2Edts
>>>>> @@ -1,6 +1,6 @@
>>>>>    // SPDX-License-Identifier: BSD-3-Clause
>>>>>    /*
>>>>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc=2E All rights=
 reserved=2E
>>>>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc=2E All r=
ights reserved=2E
>>>>>     */
>>>>>    /dts-v1/;
>>>>> @@ -688,3 +688,29 @@
>>>>>    &wifi {
>>>>>    	memory-region =3D <&wlan_fw_mem>;
>>>>>    };
>>>>> +
>>>>> +&gcc {
>>>>> +	protected-clocks =3D <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_A=
UX_CLK>,
>>>>> +			<GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
>>>>> +			<GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
>>>>> +			<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
>>>>> +			<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>>>>> +			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>>>>> +			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
>>>>> +			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
>>>>> +			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
>>>>> +			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_=
CLK>,
>>>>> +			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
>>>>> +			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
>>>>> +			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
>>>>> +			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
>>>>> +			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
>>>>> +			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
>>>>> +			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
>>>>> +			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
>>>>=20
>>>> Is there any reason why this list is significantly larger than a list
>>>> for RB3g2 or FP5?
>>>>=20
>>>=20
>>> Unfortunately these are all protected on the IDP board and any access =
would
>>> cause a NoC error and then board will fail to boot up=2E
>>=20
>> Why? I mean, why does it contain the clocks that are allowed to be
>> touched on RB3g2 and FP5?
>>=20
>
>There are some use case level and board functionality changes between RB3=
g2/FP5 vs IDP=2E Thus these clocks are protected and cannot be accessed=2E

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>


>


--=20
With best wishes
Dmitry

