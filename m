Return-Path: <linux-arm-msm+bounces-75235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE09BA249F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 05:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 097C8326924
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 03:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75C8266EE7;
	Fri, 26 Sep 2025 03:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY0hQEii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188F523B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 03:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758856624; cv=none; b=IzQtPPD994Ph2CugHjpttT1wD1vc6O9fYa0a9ybN/dWPxZiZnWpm0pxmYRaTyxeAYJV91gg5mRRDclKR6nor4Jsu3eSQYDUt2R7Arx5kkDeTxcBld2buL0ZgDJle2lOtCAgJ9Yb1GBiTsQruP9tgf7w6GozmmKKv4SG2kRrHlF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758856624; c=relaxed/simple;
	bh=M2cMozZeB8nC9X8dnmwplIBPaVCtjwjIuAhM0d49Oaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M714RHM2IZUroCN5VQJPYVtyLQHG/K1NPMOnm8uJPLdpAmeHi8/vFYQlWhQfs33ceRY913nHtAF+I+MEv5SSk1G0rB8E8IqrZkvFTYE0Ot0HVXKhcC9bsqPe9yivdRX5MZD1npSAc+9Dezv5pWGpVnxNc4YNQOpBTqmnC+yQf0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IY0hQEii; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUkfY024718
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 03:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9f6LSM6OdZg1tUtjh3SpMPAi8kke+aQ/eiH9bqFrAoc=; b=IY0hQEiiUKjWIxlz
	GvvGIamAvxkoqk3lbTXoYxuP4aHFIE9UWsA7aAy+slvo7FTwMZd3gfWIg6hU/9VH
	wCBQjhDxjZIfKR9tKWr8OvDiGSauCiuPczfoMhEFmBnozzfPhq4j2UPHP1DECSgH
	0CtqodR7Aw/J+D9RB/cNu9rjWTofNI91RD6xrxELmyKZV1W1xobgA6xhH3P/owRc
	wRFheeh/xVhRrPERbBtch9dShWYLyr3b7eUeta6VVLFMWKWZKhQLn4nUzGPAQXyG
	aUg0r9zWQebI/yZVwWdcfHA0TwlBrpRt7u46cG0HTs2ZaP2tcs9n9mJyb1762b4M
	C/+Zyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34h54j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 03:17:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33085281806so516410a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758856621; x=1759461421;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9f6LSM6OdZg1tUtjh3SpMPAi8kke+aQ/eiH9bqFrAoc=;
        b=JNhV3mW2uRRtwBGyVwBK9Ljqzlbd3lRHoTHuqVDbPl0LPjYIaUqNMnXLtGml1VyUap
         tgMDjcfvRmjdhUmP7W/8Vu/2iNvBUMl4WWVPWfjV1lYv6TPJdLopg2e7bzxsPSarzu6H
         IxyF/2RYTVjdVfhnvlcIYlQwZJAcTOt8KkdBAVy+34Aamz55hqlQa0z7y+XTH3fG9+PD
         ENZqIRDnYaRInFUP9qEyVSaz9EiKIP7sQ6rN9Dg2hE+j7Kz41JiLtcHbjnhvkwnRG0Fx
         ZsULP5MXUtucrCo/4FB/WY7Mju9SIVgdmaM7lZmIfBT6Mduvh9nNF45HBasALLIYD80D
         GtvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+W9K9UBE1+GvVXVVK/vbf5iMAWr2GVx4nNfixTVT1A6FyiXUPMHqBFyOk0ZdCj3jJaWlz5p6nBFHUeJh/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp9BA4rmf/tRFlGi+8SPQXuMt0M941Udk+TJ9K6RulOlwL+NIq
	Ttm01hR9d+VdDxV4xjETP4A0IpwySaj+5mYFuOON1pTe0NT9Z/HpZgK8Ok5Ysvi7drMMG4llzlb
	yeieacgr/ZVSbqOb3DIarNixy2rTsx/SuvGiJVlwYoIXbmjqE/OaoRJRlJKGgYhx+o+4R
X-Gm-Gg: ASbGncsaEz74aiwi68UmGBY1XAKBNSx+lMW4577ctyqK/ala2QKgbVhiMCqMohKOzpF
	LTkeIK5s2wxfu7dYy3b+cZ+Yb7uWlJEuZytPcg393wxbC7Zf3yNHem94KRzmz6JwqztwYuu/qjO
	G0MYn2iydIpgm+nQ7Du9tcUAxUf2fX9EcROSumiSUDbr4/o2/et6Fs8NPC/5z3O5qZjZvOzqOET
	AaPG9nXWJysA9Fc69WBHQinki8Un3tvJ7X9KSzBvU1VYqVf7xGIFbtNe41tIGDSoY1b0jRT/cpL
	m4uJ859OEPhfp2/UhhbBkdcaVJrW4aXxb3MkZ/k0QhLDX1nsUEKbPxTMiscRi/SL6SY451l41/x
	3+UiKpyES+mNQJ6RVAHukE24bgfmdYAcyxlA=
X-Received: by 2002:a17:90b:3b48:b0:32d:e980:7a70 with SMTP id 98e67ed59e1d1-3342a17d006mr3998879a91.0.1758856620641;
        Thu, 25 Sep 2025 20:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiqzLmVD4byJpS81rkUiJ1Icsy/ExxJQYHMvD+WEtpM3r1cCrKQQ5MrCKcNruiodugOB5rJQ==
X-Received: by 2002:a17:90b:3b48:b0:32d:e980:7a70 with SMTP id 98e67ed59e1d1-3342a17d006mr3998835a91.0.1758856620082;
        Thu, 25 Sep 2025 20:17:00 -0700 (PDT)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023c203dsm3184336b3a.22.2025.09.25.20.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 20:16:59 -0700 (PDT)
Message-ID: <2577fb3e-96bb-4f2e-871d-27395065ef4b@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 11:16:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
 <5dtlqq7x36gb7cmiunoreoe2vftq46pusb75sbol47ceazefpf@lxrx3hhcwhju>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <5dtlqq7x36gb7cmiunoreoe2vftq46pusb75sbol47ceazefpf@lxrx3hhcwhju>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX4Rjmr+G/9GkT
 Oee6MkF94sXBw6WkwVMNYqPiVV+Mbc3sN2Vg0Fwu2W1bXWcMrsQIt/JA/25P8cmO5KRrnmGXwXm
 OH4rXeHQWYfj+XXLpvVF3ZKdj77BAEpJVgk5z+5u89oKIyXkq6a9VgoGKcbPOU/w59tUYMYAwO+
 eHyemOkV+N7kAfTj4WY1Shepfm4wWlo4PIT7aq4Z4fXCD9BsfXWvSJUNgAa/bLQBmXJcuIeEgiW
 sKt8LysFySLPGWHWyclJUsWCZ/BPlEGv4kazIP3Km+f8frnOpkOHBBGzRHFcRToZ4+WWcx9Ae2R
 Hxncbk+/KNiaTYpwUAiPlHgBXvtcYTsRPk1k2kWRxoRiEw9hUkI3HgUaRxLmvPv2hI0DFU6sx0u
 Lq0K3W+iDlwwkBrd6mwbDf9wAWdDzA==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d605ad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DA7DBj9iRjnvuWfEG8oA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: sSaMjKx46ZRbTG_Ju0-gQr4O5OVNW6tX
X-Proofpoint-GUID: sSaMjKx46ZRbTG_Ju0-gQr4O5OVNW6tX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172


On 9/26/2025 5:57 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 03:04:58PM +0800, Xiangxu Yin wrote:
>> Add QCS615-specific configuration for USB/DP PHY, including DP init
>> routines, voltage swing tables, and platform data. Add compatible
>> "qcs615-qmp-usb3-dp-phy".
>>
>> Note: SW_PORTSELECT handling for orientation flip is not implemented
>> due to QCS615 fixed-orientation design and non-standard lane mapping.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 407 +++++++++++++++++++++++++++++++
>>  1 file changed, 407 insertions(+)
>> +
>> +static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_rbr[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE_1, 0xc6),
> Hmm, I just noticed. This register belongs to a _different_ space. As
> such you can't have it in the COM table.


Thanks for pointing this out. It likely worked before because the default
value (0xc6) was sufficient during validation.

I'll move this configuration into configure_dp_tx() and set it based on
link_rate.


>> +};
>> +

