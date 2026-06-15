Return-Path: <linux-arm-msm+bounces-113172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i1sZHaDuL2oUJQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:22:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B068626A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:22:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NoxiD0B3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=koMLwF7H;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113172-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113172-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97AD23081289
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626183E8340;
	Mon, 15 Jun 2026 12:19:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2351F3E7BA0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:19:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525966; cv=none; b=HVePS70v/qm0WV2GIwwnS74rRscMPopsXpk2dzkGj26f79+L5TmpQvKiq1U4gUAtdw85M8zBouJIefUOX7HfhHT2qzGgzvM6D5xQCb3U7KXxpN0lzAp8cw61VSnqLRqL+9AXyIY/iSF/sD6jR6ccC5C5fYUGAEc5HmN7y1wc8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525966; c=relaxed/simple;
	bh=7FmCLHeh58sbTqDhyFlCcWfDhpGagE0jiv3A7Fg0eVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjVFA2VwHNn9n64SB35Inq9IPiUK/6k3pyWGOqVOAdJUX7cOIjeH9bOw+8e8NN0UNUgFqjdCDwbWGh4k1U4YXqTZie0z/tImSOivvbB89HU7B9887s5xHZJKFg/Pfq7nuSlx9bviJPPRA+MK0YEtWlUk1DPu4r76OlKQh9vV5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoxiD0B3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=koMLwF7H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoNb23956025
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KIiam3l7WE9M0XsEr+loFMQinsori3CfSieNhHYSGg=; b=NoxiD0B3gaaM5ukL
	HOJoThSpC4ViINmRuVTI1X7MHmQgJYvpI5Z3lIOJhUeMEfq6A6pi/ZfM+qq7/0zY
	L6kXnoNxNzd2Djyo4bC3lBRLgUuosf2lk1uSmTIexGJr8ioJEm77gX6h6UwkQ04s
	Q9RQAthFcftNoRix4fKaBROeyoKO5rXrfq27YfHXu9xno2dTDImMxA54TT+qqbCF
	+SC9w5fpYJXSmRV3POQ39wGZhzY3IZvlxZAX9cM2k7z8qtD1ubzIwbZFAx6RiN2u
	k1F79Xnfnp6sS1vztunGg642vbmeZplU0XuR+UPuB3PvCqjFoCq4noFUYeI8XjlY
	ZyD9KQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter00kvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:19:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd9683350so13403506d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525963; x=1782130763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KIiam3l7WE9M0XsEr+loFMQinsori3CfSieNhHYSGg=;
        b=koMLwF7Hc9o9Hf5DtwTF+gwgdMF1ZGxaePw85o90owT1BWtOmOYEmwaacsbjZS+b/U
         sVYP8IcnFvdTNp617EgGBMN4cwXpEw1O1bctpDC7qYZd+qQoIe0dslhvzXIjuq0f9HTU
         /HMrorvb2jVL8jww6LV4a82uXeS6VoMODmLHxQmQvZDkMWB0GzJkGUhUNuDbn+8SJBNs
         o/yJslIK00vA1Dt8Eu3pW9N/8mUmRm+0zUFCTxJeBOHqcMsDt/eRQBdqpuNNqLXfB7zt
         gj79hdNlEPly3A44WuiF+dl8N2SXAFBTp1rLDIP0lb/VqdPQa0qmIAaxDgoz7A3jk8XQ
         bNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525963; x=1782130763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KIiam3l7WE9M0XsEr+loFMQinsori3CfSieNhHYSGg=;
        b=GhIKravRvvuwMuySWFxaiRyEwfbECxugcy2aEftjMn+Wby/l/rbtkAzqYONN2qbgjN
         DHjfQjbcu+fba4oG0wyWHBtoK3A+CtRIKV2aD0uKinn7QTpXTTRD9XYqQ/pkSpzo/ZQv
         jwLouEDP90vNDCXJJKUuz80jxWN/N+Tyd+q39zVY2COkUxZkQVl//31QyTSoxPYFWC3P
         4bovTHHMGGgOWlG6MRrMwL0MdOYcVHk/CjBKy7xqaR64kJ7LZrOuz/Pr+i8tsN3TJ6n7
         gG/oy9Nyy0I1Ks0RdDDOH5p7vEYNuClfEUYoP8hpi/8VzkpJgg7W+YT7utiKhZsJNEgA
         YKsA==
X-Forwarded-Encrypted: i=1; AFNElJ95U/3xoVFdKC3a0jsDsFXW+wzwBXmFvkZpBN8wJxGLv58HqSj1COfhVPuJu8FUG0WkOAm6XsuvcgfsSQhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7h1w8/OReRtqTDwPgl9Xka0FQj6o41MHqDmIu4/sjoupfVgOi
	hGDRIkdHKKTcdaligrD+yyJ1FN/eZ9bAV1T98K2CXYcNj1XXs33NMsJ+FMu0dkpxBPNyyNFtboG
	kPFtzYAnPmBoOCLkHa3LXi7z2eOlW1lOU9EI0Bgxn+DoWVry8wgkdz1+LVuCUibRdGIGl
X-Gm-Gg: Acq92OHKGKev7a6gTl7z0e/3JreiJqdn6Hh5aGNj9eFV1Mon4E22HsNgwFbSc5QcjRX
	vQNcgKBUcAMh7fTk6BKmuJD+pKl9+KszqGy2rretsHBt9ExmJsd7oVtULGZtLLWyRHjpbTAH2sb
	Ts6s7ZT1SXcs1450EzG1LQZayMOp7DJggpt8GpMbx1sBN1WMqnwYGagAnCzEmbmRLzzWDWAHpYo
	iXfZ6LZE2IW8py1qbYS516x2eJQUWO4NkMT/hDefjAc5ElrMF0Sn7Iz6xtjKsV5H4pUXLGZHt9Y
	mD34cIZnaEW3w0X/0+S5WGFBlOIL5u83P518jLFCWHe0fpGGufMiZRgLj3LujQ+cepoKHl7xDxu
	ERKZRZT6DWXyP8pPb4Fx/izBvqpmJpJ2loVqUT/KHSFZk4A==
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1242973985a.7.1781525963335;
        Mon, 15 Jun 2026 05:19:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1242969885a.7.1781525962763;
        Mon, 15 Jun 2026 05:19:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f1esm2770733e87.2.2026.06.15.05.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:19:21 -0700 (PDT)
Message-ID: <ea441f1c-6426-47e1-bf6c-7c7f2d8058e1@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: fix PCIe SMMU interrupts
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260611-glymur-pcie-smmu-espi-v1-1-5effbaa3e1af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-glymur-pcie-smmu-espi-v1-1-5effbaa3e1af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Pm-fkpzW-ONAnMXF8dDZOLlnAPMDPk33
X-Proofpoint-GUID: Pm-fkpzW-ONAnMXF8dDZOLlnAPMDPk33
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a2fedcc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NAC2ETaABoKmWdFWtrwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMCBTYWx0ZWRfX+43GODLufgXX
 pL6zy4UBtiz/q0UjN2IgET4cl5BOP9xTQavDbZtesXU9r3khaDTr71yqzkDF+rRdfndTx7JQI1g
 tCA3LGMkkK7d/fp19UoTckfnL8pUQ0/2699RxI2kCwkdpW1B3sYePRt+IUrs27D29VUoLl54PAT
 ccjntLb6jt/SZiF3YwN0Kxcc+DUaSaYC0fY2qVO2Rb5LX2l0cnNvPgmW1Djy3fbkqgKmOIeNqvs
 Nykw89Ik6AiNLSLmrnMF+THfGM7a6Xf9G64EXAbLT1dZJCr2sGmFWI8rHo+gaMgPnIzX7R+CAdl
 STh+66p+JUDcNnNTvEZvydlFyP4ZA5mOjm67I8SBdwjvDml/su8aA7OzbUgfiGN/TFv5CeiqVIC
 QdbLZxJWy/ow06tEHORFL5hCcJ59xPBSI+WzHQRIiyzaXzsQwyj7QonZ/+sN1q9FemArNQLbvd6
 rLEjHOtkTFYk8vCI+Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMCBTYWx0ZWRfX+aXRBLKqQfSC
 3c3H3MPADqee3RDZoISgTeIqjmM8ET1jo/ahNBTnyCzG5/nu4JccqGDQAwnupCiKaFFyt4/vFgy
 ASge1IwccUWlm/h9y5ddZt/D6Kwu9YA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113172-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:qiang.yu@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB7B068626A

On 6/11/26 9:00 PM, Bjorn Andersson wrote:
> The PCIe SMMUv3 wired interrupts are routed to GIC extended SPI INTIDs
> 4100, 4098 and 4096. Describe them as ESPIs with the ESPI-relative
> interrupt numbers instead of regular SPIs 964, 962 and 960.
> 
> Assisted-by: Codex:GPT-5.5
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

