Return-Path: <linux-arm-msm+bounces-91406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLbhNl0qgGl73gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 05:38:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F482C8317
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 05:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DA0B3008D35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 04:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80462C08BD;
	Mon,  2 Feb 2026 04:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLDDbgxg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZB5cjjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89C5227B83
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 04:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770007126; cv=none; b=V3I0u2J6bKTwl/4TjyNCg/q8J0WJX8uF19dq6osKVX6/oNnbm9eACAbRNt7ow+RIUfKByTETQyDPxFgUKx4UUmIq9BI+DVmfMhy0mcf7kZ3DbA0UG5AeJmVpaPnYRaWKc0zVEgmiJr0FjZ7NvdT5A2xujQ5zxhokr7ODxARimSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770007126; c=relaxed/simple;
	bh=AbBDoyCZJkgeqMpZdRR1c4G/zye3vMiVKfRu2r37U6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdU++BqroPZJHu6ccy8rdBeNf4+0HvORsDNYNcqp+mVV/fAie172YhDuu6I2K5o8IwXSHS5YkBOXpNx9DYpzXAzajriQYtDH8wDg2Sxlh+DdU/tbCXgV12V7Zm+4KOT5lke/gTsIa7lFinGWPRVTiaxchE0jVmOnngW+rh56398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLDDbgxg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZB5cjjf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611Jpd3E1349755
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 04:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bdv8SP+Zh7Ah46nKMNUboBxhI+Nz5Js+c7TCA65bB+o=; b=kLDDbgxgL9eu1aZJ
	7i9ZU49IlLf6saQWaOYQ9PLfcMEAUR4Ke4nangBG0keBzMSM6+24moF6ETQcDNSE
	W9ERIofTnxvM5pqSt5rDDAPwYFaCmw9ziLwD6xlqWXCHDVHrQ+zYoJvlJLydzbg4
	Vl9FSw/eu0iy1KHBwov8aDv9HDAh9OR9mL//y+rsNlpLtANSKf8m/BiScMxHM2v+
	m15Dxi38FU4LLq8b7YprJOQjTDANPGffmaZ2vNNkRNFfWsEf8U+hA3uTfZMfOfEK
	mF2UHpN3cJOvmjPQWQs8m8dy5pUD1T/r2MENcPuPDnC7fJzQMESZbY8+L0utnWSz
	76YNTQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1hkdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 04:38:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso3302390b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 20:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770007123; x=1770611923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bdv8SP+Zh7Ah46nKMNUboBxhI+Nz5Js+c7TCA65bB+o=;
        b=AZB5cjjfzVw9TV22JxA+/81NmRyVVBN5CFvpAnNE4kpB/1K+9QIkZsXz212R8+KNqf
         gWVqn9858raVN2BUSUZ9Up1a0EYND4rV6VUUxdm1IoL5JfsR9Cx5/03rRaazUBB/zTgv
         Cg2H+SnZw2RlYUsNbM+6eSDJGG+0eIOvZxKRFtj/PysFPI3nAY75aE772lBHHKlXylie
         fWHrr0nOXGMm1XbDgAS/yYgK5fE2/QDHSRo5Iy/zMoedWv6SKcSHW0IqC6PK4nE2A4I2
         fgrd40BIl/mEienNKYBYc77/3X3adm/dw3mjQSpdUMz9hSKo6Rbrs/38LaiBA/q/T3AS
         3uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770007123; x=1770611923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bdv8SP+Zh7Ah46nKMNUboBxhI+Nz5Js+c7TCA65bB+o=;
        b=nbzTV3rth697Fk84+KKq8Z0OtbqPRrznHnUwhnP4lhb+ChhisD/lAIfcsnsMpZbjyf
         nN4qIWDI9fe23PEoK8qe7rOKpbwKfdYreHCmBrwTKRyjhJRAqHou+fD/qKhvl6J+2aAB
         7RXHFCp7peBhM7MIF8PdkUC905wIwF5mSKYZk6nJdPgSuGZFs5RBQnlaNU2RFh397EA8
         heloyqrpdpbml/SYuk6N4p8hjsuMklleC7iA2cVMUORz5B+LTlRDfWnGkp1e2FIUyXf/
         sdgFvp9AZCUNAEwV2E3oRsNcYSWZvirwZeiVM6OZqNXY+XtKlPYoiU0AFP8hJg6sllKK
         u0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB6giCv3SZn4y2aDKmt1Ha8oiqg+9+1iF5DFVlws6vA+TRjpUxmyWSO6wiaf91/JCn2QqAV7BxYfWIQnLI@vger.kernel.org
X-Gm-Message-State: AOJu0YyPSmaP/5/cqNfGjZZEkzOmjhF1R5rhsMG/xOJ5YF73Ghi0Hb2h
	c2p0pYF1PlovXbGFqJouSGATQdDDb5dfhux207pGJdMTLEzMoq3WiaM1EQnWelSKdZmiWhmaZEt
	AbclhmFjus/qSvC+1Vg5NU8Stem6XGfk5cY6wGvXyfY66NAYzWIaZIQaMlTpDoAW2mp8F
X-Gm-Gg: AZuq6aJNW+WcqGbPdToRVc3JGCqfPfXZcxvbyZOWJ0o7ybfrL/XDCHYMUKCfXfPLPsE
	3r/Z7SvnHRVumSZ4jbKZs7HoIwO4Xy3SMuuEH/I5EBzph6xYIJNzpDFF26yQurblZ4lTr9ZLgWz
	9QA1z4Y/ZMZ3lNv+di8HMtLj44seSABl5PFvY2G5gMXdrv0R7PLqdGo1Q0ZCdrcIsWaF3mTr0Qq
	c4OMtgF95vl8MxtK1YJtNV1xErODbCwlzDFZWN2qStU6VSAUjmk40pXVfafF+yCTRAbcXT0oRVQ
	Ak8GrDXRJ6dD/RQqPAZjYCLmRA6gJBx9IEjvE0gFZNRUt5qMOciisFqXYV3nhOu/+vXk0I8BcPL
	aAp18IHlbADGCiLeD1ynMT7nfeU20KKfdfdCX2LUTDEx+JsYF6sx1VicyCN6EDnNkFH99jM3wVu
	sCYjAISUnOZhj7
X-Received: by 2002:a05:6a00:bd93:b0:81f:8084:7ea0 with SMTP id d2e1a72fcca58-823ab65ead5mr9345100b3a.7.1770007123178;
        Sun, 01 Feb 2026 20:38:43 -0800 (PST)
X-Received: by 2002:a05:6a00:bd93:b0:81f:8084:7ea0 with SMTP id d2e1a72fcca58-823ab65ead5mr9345070b3a.7.1770007122644;
        Sun, 01 Feb 2026 20:38:42 -0800 (PST)
Received: from [10.50.45.70] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c53f6bsm17123370b3a.63.2026.02.01.20.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 20:38:42 -0800 (PST)
Message-ID: <b2696068-2e0d-4197-9aff-606fd9d72b7a@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 10:08:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v6-3-245f408ed82a@oss.qualcomm.com>
 <2vqho236mjlsnraqif6ivic6ybblnsmk4litqw2sbfpjvrp2t2@eztnjrlsmrp6>
 <64x5xfzjik4qtvsxqvwqhf5mua3rpvh7nzw67v5sy7afoo5fzv@5vp3uvjk66if>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <64x5xfzjik4qtvsxqvwqhf5mua3rpvh7nzw67v5sy7afoo5fzv@5vp3uvjk66if>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _YyN_woNDuF9gEEtqsHoimrswtwzoc7i
X-Proofpoint-ORIG-GUID: _YyN_woNDuF9gEEtqsHoimrswtwzoc7i
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=69802a53 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Hoo0Bpfwwk8gRiAXly0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDAzNiBTYWx0ZWRfX9bVQ+iHApvt6
 fl25f83AvV9Ti7iqrt3kWSC0V+1T62iXOtTbEsW4ino6j6wALMSITtfMZj9oBjKlj+0x2lSLCwC
 JBXGtodxuRQTN3w2Cq6Rphg9/Iqf9TXU8mS8Ps9GugWMzPZNABe7+KoKkCcW2aEIknHSx09Izl/
 7wmNJBduAWRh2rtBv+ASQVboRlDK4ZeGiQmAWvnna9OHst5GUzwonUfg5jT68osXEukKtjOO/tU
 sS5YwGtFy2Q/xe3m/KHy7ix/L32GznTQ6hJlTQ3KJ49ERH7UzsxMpXCNuTNWPNymKuQ94YpUP2g
 oXH79ME4T7UvPT8tfggVUqIad8pQ1GHnNhhFnQtL9O4v5xnz3GA5s/4nxUz7jhZkqQN1wSvF+qN
 JLALAu+aPPBS8huzmH+KzhIhTp19URB/yCywX0sWBVZnUlKrRZOZNvA/BtmzyzABQsqs68ZOD+Q
 +Le+VKxW+o+7movNiRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020036
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91406-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F482C8317
X-Rspamd-Action: no action

On 1/31/2026 3:30 AM, Abel Vesa wrote:
> On 26-01-30 23:44:43, Abel Vesa wrote:
>> On 26-01-22 20:54:00, Pankaj Patil wrote:
>>> Introduce the base device tree support for Glymur – Qualcomm's
>>> next-generation compute SoC. The new glymur.dtsi describes the core SoC
>>> components, including:
>>>
>>> - CPUs and CPU topology
>>> - Interrupt controller and TLMM
>>> - GCC,DISPCC and RPMHCC clock controllers
>>> - Reserved memory and interconnects
>>> - APPS and PCIe SMMU and firmware SCM
>>> - Watchdog, RPMHPD, APPS RSC and SRAM
>>> - PSCI and PMU nodes
>>> - QUPv3 serial engines
>>> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
>>> - PDP0 mailbox, IPCC and AOSS
>>> - Display clock controller
>>> - SPMI PMIC arbiter with SPMI0/1/2 buses
>>> - SMP2P nodes
>>> - TSENS and thermal zones (8 instances, 92 sensors)
>>>
>>> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
>>> PMH0110, PMIC's along with temp-alarm and GPIO nodes needed on Glymur
>>>
>>> Enabled PCIe controllers and associated PHY to support boot to
>>> shell with nvme storage,
>>> List of PCIe instances enabled:
>>>
>>> - PCIe3b
>>> - PCIe4
>>> - PCIe5
>>> - PCIe6
>>>
>>> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>> Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi         | 5913 ++++++++++++++++++++++++++
>>>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  187 +
>>>  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   68 +
>>>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |  144 +
>>>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |  144 +
>>>  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
>>>  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
>>>  7 files changed, 6571 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> new file mode 100644
>>> index 000000000000..16a3c3ecf97a
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>
>> [...]
>>
>>> +
>>> +	soc: soc@0 {
>>> +		compatible = "simple-bus";
>>> +		#address-cells = <2>;
>>> +		#size-cells = <2>;
>>> +		ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
>>> +		dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
>>> +
>>> +		gcc: clock-controller@100000 {
>>> +			compatible = "qcom,glymur-gcc";
>>> +			reg = <0x0 0x00100000 0x0 0x1f9000>;
>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>>> +				 <&sleep_clk>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <&pcie3b_phy>,
>>> +				 <&pcie4_phy>,
>>> +				 <&pcie5_phy>,
>>> +				 <&pcie6_phy>,
>>
>> I'm afraid these do not match the array from the driver.
>> I think there is one more <0> before the pcie3b.
> 
> Actually, one less.
> 
>>
>> Please double check.

1 clock was removed in v4 to fix the no of clocks, 44 was incorrect
I will update it to match the array from the driver

>>
>> Thanks,
>> Abel

