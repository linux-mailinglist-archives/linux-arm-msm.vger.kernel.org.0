Return-Path: <linux-arm-msm+bounces-70257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB80B31029
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D788189CD3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 07:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6F72E7BAD;
	Fri, 22 Aug 2025 07:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvgaS3E/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE8E2E1EFB
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 07:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847270; cv=none; b=jXny1Jtr0wWtknNYaBQU49hBvD0dRuj1AgHsqW2CTD+MwKBmX9QaWJjNxlhSrmdRaqzV7XhYSlOiRzUhDal8jM+3KqtcF2WkzLEAKxllzIrxNC4O1175qpjagmQYvFOBLm2fgs6hgj7BBOTDz4xsUyHNKcYvNzp38QRUmgexhgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847270; c=relaxed/simple;
	bh=Z0+SwSQNEOMbZHJy5OhSbEyuKZGHmonxKEQSsM2fhpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unfSBCHPsyyjWMQ210UTHiwtNrqxjHLoVwwZX31AWO4oICGWc0uJC5iTnbGDhNJ8x0IZo+ZVJDSiS9Upd81dYAoaMesQh/kzCcfoj9U5+9m3cZ5Utx1Gv1tXINvrJsig6Di7Day6moqZLvFR5aXrW2XWpSNSC98Hohjptxhzoxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvgaS3E/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uTVp029461
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 07:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImGhpDuxFOdCpj6FL5zsXgN4VeAkZyyrarFsrBei76o=; b=KvgaS3E/Lt9MS3O6
	7hWVXSobYXDo6BGn3yNaVXBPV9vzEUghgSp9HItmLap8Ntt43iPvglHC/5Q1kCXt
	7DCZfk7aIGfR14asnQzHXZWj94DQ3wIyIAKd1DfQq/KitAy+RjY3QYQLZoUOCGtT
	l3Uueb5hRaBmapCAD82Tpk/2S8+VFQhD2NI0yFGGa5kyCCi0dRf4sFNe/lT1icAn
	oCbiEOcqiQXCMQUG76HzjXGiqicHkQ0Z1/8qiNfdflzsRFXnlacqt4G+bskQ9H1m
	iSAycp3cXTysWszTi8vYjB0wKb27Vfk4de0oDc+356d2ilV1aHYwAcKrZgybUAbG
	EgwhzQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdp2ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 07:21:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32502839f85so342345a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 00:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847267; x=1756452067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImGhpDuxFOdCpj6FL5zsXgN4VeAkZyyrarFsrBei76o=;
        b=MLJyHWGgCwSP6Kz4r1dA1Jiq0ZSso1QJ+CaD+0ww3g6/npT8rZKutMldlAd1Bzkepc
         qC/nwP0qj6c6NfUfBoiv58IB4eA2jq0il/SGF85DbXKi2BqLhDQADNFVZ7YAknB9JXLP
         S/rgrK+IMTPu0vcTt2uiDVe5C3UFUPkZR/Y4ZT/Kqmqy1Qy7mKiCf4aWVrnrEVzSEZgU
         b2Zqs73lD3LSIBCgVBFFRq+SEnS8MGgCU1rrcRFh8iKp4/LLXJGXx7/gpwhHr1pERbRF
         j9uCRnqujqdjfnDMXzqTD/FS2ov2HrI+FKUD/OE2tmvZGYfrgnRyXhwbBUDC2Sk47MDK
         dWfg==
X-Forwarded-Encrypted: i=1; AJvYcCWvvYsDR0YcO9acXfi2tQZbIQF85phoDGEklyV/93yWR63mYuvEZcU8sXoNxdNC05o6makztpvOQqXyArax@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw9udq8tzctiu/qd7hEtpT99q246C3YVVGiu4+sGDd9eGCY1rJ
	RDwUW4FC392Wg33Wz/a8CWZjwNH414gWmnSVmIy7Z9wB6W6sr2+em8yCZyXr7nBQkafUBm14Yvr
	G9JNyVqp7qvS8K3r1qn4AnagK/HX94imJR/0sqxmbnPdaSm5lwBbiZt+wdSi7oX2bRV3T
X-Gm-Gg: ASbGnctpqqPbqCyoNzMWFV0zQcYaXumcAfDmp1KGk1KxEUCCaCnVglb0NLTDjF8uUgY
	pb4TcF8r3b3t8dKFbnPt5aiyf0R+ZSPUmMKfriEMbKtZZ2e4zbQlQ02Q19I1HlAI/6Eek1XDdiB
	eX/2T1tjh1eJYS/PPGUmFoxmYVie2zBaFqGMfL8EChkwV6U91KH//ZxDHI0endKztP4qR+2WSJO
	HPQURgnyp6tlgrXhcgtPml4pYL9IwENkmmuIJGh1fCWnzNBY2PZHMNlQjTUBz45XY0K1P91Cq2X
	bGQGfOPP8muDz3HR27fP5bMRa61AqGxAf71kyXzuSftkVcFA7/ilkDb7iptbm+1y7mUFwEMJw4u
	HjG0/chxR8FCFVrXpDlsqlEAB7Am8fA==
X-Received: by 2002:a17:902:cec3:b0:246:4df9:f63b with SMTP id d9443c01a7336-2464dfa1134mr2105595ad.8.1755847266990;
        Fri, 22 Aug 2025 00:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSWdZW0zZ6t/zVxusBsVUXuEAw3kOdKb6PHoaWrR1AfwMdSJKy4A+BerChkkW0gKyQEhOJRA==
X-Received: by 2002:a17:902:cec3:b0:246:4df9:f63b with SMTP id d9443c01a7336-2464dfa1134mr2105365ad.8.1755847266468;
        Fri, 22 Aug 2025 00:21:06 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53e94esm74784355ad.162.2025.08.22.00.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 00:21:06 -0700 (PDT)
Message-ID: <1a2c38c6-0d49-4c47-9cc2-014b71e1e81e@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 15:20:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-6-a43bd25ec39c@oss.qualcomm.com>
 <bx3cumx7ej7taour6zhqufrzjdxuhvlx23ga3vmvokrlekayem@e5rfjbcwle2r>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <bx3cumx7ej7taour6zhqufrzjdxuhvlx23ga3vmvokrlekayem@e5rfjbcwle2r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a81a64 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=sVqeHFWDZcW2eLg-V-AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: QrrccTPEF2yEZHQfad8-XHEnLPVpNehg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX11imzXlUPgx9
 EhU+LSGcBGfjt/kzMDPPjIDOq2wtIBMIYuUtyR9SkzqJzCtAG0+x7bx9YMB50g0GrF7fLdfIovS
 iipGjjcaFwLcks93QeiNa2EI+rj7SI75wWoZ39iLVJ7ba9rdy6HVQHW5uKjiJ5PgxSG8zYoTs/G
 p2PEivg3LmC7mJ+xXfspitmJkaD5JIfsA9BQiUjaZggVqjtY+w25Y1ELClmCXqOIYoYvnj8QiYP
 0V8LkZa8GZt2fUpiBNvke6AkFuZwQ+2xe9gZwDMDjwldZ+SfosRYZ6A80a7DQRHNU5BKSS7myMZ
 pHwoUAKXTYPl1kQKgKBX8nltZHnQkq/tf/m8RPd40K1OXI2imn6k3Yjezhy/HmVWeVtL3dA08OR
 xjYBEtjmXmqLYnu69LiilS6xHkZPpw==
X-Proofpoint-ORIG-GUID: QrrccTPEF2yEZHQfad8-XHEnLPVpNehg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135


On 8/20/2025 7:25 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:48PM +0800, Xiangxu Yin wrote:
>> Introduce QCS615 hardware-specific configuration for DP PHY mode,
>> including register offsets, initialization tables, voltage swing
>> and pre-emphasis settings.
> This will trigger unused warnings. Please squash this into the patch
> adding compat string to the driver.


Ok,

Will squash the compatible string addition into this patch, 

as the following callback functions would also trigger similar unused warnings.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 139 +++++++++++++++++++++++++++++++
>>  1 file changed, 139 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 6b0e86ec43ded3d850f68f248a74c39f74ecb5bb..61128d606238321d1b573655b3b987226aa2d594 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -284,6 +284,86 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>>  };
>>  
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x37),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x0e),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_CTRL, 0x0f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x40),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x08),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x05),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x0f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x02),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_rbr[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc6),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x24),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x3f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x38),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr2[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x20),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x8c),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x0a),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x7f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x70),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_tx_tbl[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRANSCEIVER_BIAS_EN, 0x1a),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_VMODE_CTRL1, 0x40),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_INTERFACE_SELECT, 0x3d),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_CLKBUF_ENABLE, 0x0f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RESET_TSYNC_EN, 0x03),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRAN_DRVR_EMP_EN, 0x03),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_INTERFACE_MODE, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_EMP_POST1_LVL, 0x2b),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_DRV_LVL, 0x2f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_BAND, 0x4),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x12),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x12),
>> +};
>> +
>>  enum qmp_phy_usbc_type {
>>  	QMP_PHY_USBC_USB3_ONLY,
>>  	QMP_PHY_USBC_USB3_DP,
>> @@ -449,6 +529,34 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
>>  	.rx2		= 0x800,
>>  };
>>  
>> +static const struct qmp_usbc_offsets qmp_usbc_usb3dp_offsets_qcs615 = {
>> +	.serdes		= 0x0,
>> +	.pcs		= 0xc00,
>> +	.pcs_misc	= 0xa00,
>> +	.tx		= 0x200,
>> +	.rx		= 0x400,
>> +	.tx2		= 0x600,
>> +	.rx2		= 0x800,
>> +	.dp_serdes	= 0x1c00,
>> +	.dp_txa		= 0x1400,
>> +	.dp_txb		= 0x1800,
>> +	.dp_dp_phy	= 0x1000,
>> +};
>> +
>> +static const u8 qmp_dp_pre_emphasis_hbr2_rbr[4][4] = {
>> +	{0x00, 0x0b, 0x12, 0xff},
>> +	{0x00, 0x0a, 0x12, 0xff},
>> +	{0x00, 0x0c, 0xff, 0xff},
>> +	{0xff, 0xff, 0xff, 0xff}
>> +};
>> +
>> +static const u8 qmp_dp_voltage_swing_hbr2_rbr[4][4] = {
>> +	{0x07, 0x0f, 0x14, 0xff},
>> +	{0x11, 0x1d, 0x1f, 0xff},
>> +	{0x18, 0x1f, 0xff, 0xff},
>> +	{0xff, 0xff, 0xff, 0xff}
>> +};
>> +
>>  static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>>  	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
>>  	.type			= QMP_PHY_USBC_USB3_ONLY,
>> @@ -500,6 +608,37 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>>  };
>>  
>> +static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>> +	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
>> +	.type			= QMP_PHY_USBC_USB3_DP,
>> +
>> +	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
>> +	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
>> +	.tx_tbl			= qcm2290_usb3_tx_tbl,
>> +	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
>> +	.rx_tbl			= qcm2290_usb3_rx_tbl,
>> +	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>> +	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>> +	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>> +
>> +	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>> +
>> +	.dp_serdes_tbl		= qcs615_qmp_dp_serdes_tbl,
>> +	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl),
>> +	.dp_tx_tbl		= qcs615_qmp_dp_tx_tbl,
>> +	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_qmp_dp_tx_tbl),
>> +
>> +	.serdes_tbl_rbr		= qcs615_qmp_dp_serdes_tbl_rbr,
>> +	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_rbr),
>> +	.serdes_tbl_hbr		= qcs615_qmp_dp_serdes_tbl_hbr,
>> +	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr),
>> +	.serdes_tbl_hbr2	= qcs615_qmp_dp_serdes_tbl_hbr2,
>> +	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr2),
>> +
>> +	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
>> +	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
>> +};
>> +
>>  static int qmp_usbc_com_init(struct phy *phy)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>>
>> -- 
>> 2.34.1
>>

