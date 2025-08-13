Return-Path: <linux-arm-msm+bounces-68981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43233B2492A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 14:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4500580F04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA072F83C3;
	Wed, 13 Aug 2025 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATDUyWH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A742D542A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086883; cv=none; b=cqjNSaBh2Vx4HIz1p3QhbFccr7Zdiw4Pvu4mF6nkLCr3FFUoJQT7zhkHG/zIMiuQJkaLXdLTzk4WAf3Rf30ZlfZhT1k5hh8RDl6dR4Bg5LXiou8CBTxxR1D8gpC9LUoi8hxlmpst2oB7s7NLQ5j+3FqXiCet2h+VXQd/K9H5XvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086883; c=relaxed/simple;
	bh=ZS6H/U2iVvTT4oqkdcvirLtWbkeN2nTPuzUh5AfAwbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMXDOU98H0EcGB7VOR5DNVHIKLMBAU4vdLzeiZdXRv7/BqYI+4xpycNYd9xROtsPlS4VKbPITa89hfCdzioYaku+oQIvxe86Wn32AFqNW5BVo1wK1lr/upruJvetLO0h6OEu8BOxkjyYKa1/WeYPWvK1/SRXjZfPSMCw/qV9ayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATDUyWH3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLdkA031942
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYuk5iUWeR2SGqulBnQ8ep9aCOz5ejprTcm8gj33WEM=; b=ATDUyWH3/asPohwk
	JlYKEMfgF9tDUQkDHOdgtOHJUBPvGZDlokp810W6KwmX8G4lXnsDH7Kn1PVsto27
	ZI5c7g8NFP/7dgsIK+M7/G8l+fc3Nv5JmFIpeU2zVAMDUdSyk20R4HhA80jmF+ts
	99lmUQa6knjZAt2pLCz8/YoKVIf9kR58Fc5FCRSqb6Ok0mXdi2KE16lygQ/ZQj3L
	HsE4Njey0HImOaDkvVxaOukG3tb51yvz47wSVUjborALpKFhiQuDQ2AKMWNjoC90
	xy6+XakTCVzPTrwhLlJDhz8VhZZ1cSP0uVMiRGIaIOQNgEPBqmJAUSjwIKRhUApQ
	oFsGog==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4fp3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:08:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7073ec538e2so20696786d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755086879; x=1755691679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MYuk5iUWeR2SGqulBnQ8ep9aCOz5ejprTcm8gj33WEM=;
        b=QCzniHynMgvb+2560LPQ+yLXSwdqZej0HdODZ8hgPF85vjEotSodj1cWIa4MTbCNjJ
         eFWp725Xtk7C0AhqrhjQcOB1rET3CCW0+6l0CxtPDDNYqdOnV60cUQn4FK0flz/1wNi7
         kp+odnANnCJhkAI3+zfncbzNOUWvSzrY6g1LQ7/dP583elwNSVCk/NJ7IioclqozoNBS
         BvoSUWhof6iT3p+TMDzREdVpIzK3Gl5AEFaGaX5ujG6grpoL+a8rXRoUB5iulA5rIdDz
         aB85bbddoZ+ybi1B4xN85fxxLfUF6woxnU3JzcZdOE5SvW2IcTvyiDZuTFuZUX8Jzg91
         zZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBN1iLYEx5NGgxAakybE2LRlVXMYjDxXqNDDFuQGI+PTsaa3TLdXidbh25Gx4FRYFLJmu9AolX28JaR876@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl1/6gP9h+MiSc4ZgZz7bvfY8x15zIU7s4AvU4f0O87RkJSnrE
	Two9dApFLG6r4E5WKpH0ymsM56VoiTLsJk69WHHah+gcejv0QvoI3QPIUfU6RufsFDOz82DifOZ
	0+h301/FM01mfa5uiYYrJ1a4vbw+RWnkl98li2uxfzE7SFujg9d926DMxWWtcIfv7WEr4
X-Gm-Gg: ASbGnctYJN8I2t+XzbkiKky/7uIL/JAIzWn1unr6FZHBXeEs78LFfjb41KkK0wvCz3P
	H9Wkedja7K9AquI6fO71Akd1iN5Nejiva6l+lnQoQI2/NKIcp809tiiqqHZk5o4GO2vj54gUbNK
	fcKCtTxOYnO2my7deZuBrtxE3DrwQf/FGR4eCivLspnmJuEOZlRR8OnvYfoGBU18nJOaDdWtcpg
	B6894GgiV/+SWEr15tIjkwa8bp0G+RcVHjRd7HzbV/b6HPunwJJbFsZrf1hWOsm78fcKQbeaaU0
	iiJ667YWFY9JHaaoMTR65Djh7r/Xo2gvQ5JcmFGfM/Kd8wpKsnOMzVHJQvCA7w+soFO7GRwHTqr
	o7bkC8jZeqenFhxSPEw==
X-Received: by 2002:a05:620a:7114:b0:7e8:deb:2b88 with SMTP id af79cd13be357-7e8652610cdmr181571385a.5.1755086879142;
        Wed, 13 Aug 2025 05:07:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeo3D6ZsWLZnPQmHQAdZlqxDwmN73bz1qqHROe9TiS+lFeRiG0UWTDISGp7c/KcY3g6+XW/A==
X-Received: by 2002:a05:620a:7114:b0:7e8:deb:2b88 with SMTP id af79cd13be357-7e8652610cdmr181567185a.5.1755086878508;
        Wed, 13 Aug 2025 05:07:58 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af93ddf5b48sm2115023066b.49.2025.08.13.05.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 05:07:57 -0700 (PDT)
Message-ID: <3ad5abef-9fcd-4dbd-babd-3820f6915a52@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 14:07:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-pcie: Fix PHY initialization when powered
 down by firmware
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Wenbin Yao <quic_wenbyao@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
References: <20250812-phy-qcom-qmp-pcie-nocsr-fix-v1-1-9a7d0a5d2b46@linaro.org>
 <f44beed6-72c3-4e86-834b-ac522c786bc7@oss.qualcomm.com>
 <aJx_KjWFxeYE5U81@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aJx_KjWFxeYE5U81@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NPM9WSZoHz7fvOyA9u4mZAhvbUqctAfn
X-Proofpoint-ORIG-GUID: NPM9WSZoHz7fvOyA9u4mZAhvbUqctAfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX8JISi9irzMV1
 ICYlOVMCCrf3jp2Rei7I+fWiey1UVBJ8+CynSCzXL2zUlIhv7yKw42jlNTQkHMln1FMNDJJoNYY
 x5Qa9+w9+Y99Y8PnBSM1D06vAV10T6s43y8jFuZToZ1gywsrG8a1DG7WDa+A8cXHzGJS4kMrMmx
 M1XsdT8QA0t+zg6R/1PCTCzqGl+pKvm3PAbwNawFwQTmOxLIKFqrP2MuOV1HinP63gN+D/66VYQ
 8cQk3kHb6SLO/tGTALBpwEcZdnqnaC+xCpxIrKTPmZa+66bgxzl/FpQUBw68cYLA648pZzvlh2i
 hVxBZJsluWniqaFfiryTHloANQII1eO6dxU6XJVbIItd1NAIy9O8/lzBhb8awmNPc8442+S6oh/
 lZTH/Kx+
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c8020 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=dMwzMeVDXUTiNa__XesA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/13/25 2:04 PM, Stephan Gerhold wrote:
> On Wed, Aug 13, 2025 at 12:13:31PM +0200, Konrad Dybcio wrote:
>> On 8/12/25 6:30 PM, Stephan Gerhold wrote:
>>> Commit 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention
>>> support") added support for using the "no_csr" reset to skip configuration
>>> of the PHY if the init sequence was already applied by the boot firmware.
>>> The expectation is that the PHY is only turned on/off by using the "no_csr"
>>> reset, instead of powering it down and re-programming it after a full
>>> reset.
>>>
>>> The boot firmware on X1E does not fully conform to this expectation: If the
>>> PCIe3 link fails to come up (e.g. because no PCIe card is inserted), the
>>> firmware powers down the PHY using the QPHY_PCS_POWER_DOWN_CONTROL
>>> register. The QPHY_START_CTRL register is kept as-is, so the driver assumes
>>> the PHY is already initialized and skips the configuration/power up
>>> sequence. The PHY won't come up again without clearing the
>>> QPHY_PCS_POWER_DOWN_CONTROL, so eventually initialization fails:
>>>
>>>   qcom-qmp-pcie-phy 1be0000.phy: phy initialization timed-out
>>>   phy phy-1be0000.phy.0: phy poweron failed --> -110
>>>   qcom-pcie 1bd0000.pcie: cannot initialize host
>>>   qcom-pcie 1bd0000.pcie: probe with driver qcom-pcie failed with error -110
>>>
>>> This can be reliably reproduced on the X1E CRD, QCP and Devkit when no card
>>> is inserted for PCIe3.
>>>
>>> Fix this by checking the QPHY_PCS_POWER_DOWN_CONTROL register in addition
>>> to QPHY_START_CTRL. If the PHY is powered down with the register, it
>>> doesn't conform to the expectations for using the "no_csr" reset, so we
>>> fully re-initialize with the normal reset sequence.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention support")
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>> ---
>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>>> index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..6a469a8f5ae7eba6e4d1d702efaae1c658c4321e 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>>> @@ -4339,10 +4339,12 @@ static int qmp_pcie_init(struct phy *phy)
>>>  	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>  	void __iomem *pcs = qmp->pcs;
>>> -	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
>>>  	int ret;
>>>  
>>> -	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
>>> +	qmp->skip_init = qmp->nocsr_reset &&
>>> +		readl(pcs + cfg->regs[QPHY_START_CTRL]) &&
>>> +		readl(pcs + cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]);
>>
>> I think it would be good to ensure the value matches platform config
>> expectations, i.e. !(val & cfg->pwrdn_ctrl)
>>
> 
> I think ((val & cfg->pwrdn_ctrl) == cfg->pwrdn_ctrl) is what you want,
> to check if all the bits we would set are actually set? That sounds
> reasonable, I'll send a v2 with that soon.

We can do that, currently the register (at least on 8750 that I randomly
checked) doesn't have any other bits..

> I'll make the same change for QPHY_START_CTRL, to have it consistent
> (checking for SERDES_START | PCS_START, which is what we would set).

Sounds reasonable

Konrad

