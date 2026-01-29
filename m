Return-Path: <linux-arm-msm+bounces-91172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABvCE+ZNe2n9DgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:09:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A29B1AFE83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0750303B4C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54C13876B8;
	Thu, 29 Jan 2026 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCerepmt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGPfbDg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2753A37FF72
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688435; cv=none; b=EtZrqum09hcX7/vZlrpvMws1sFnkLlx/rv1IFQRUxEFkF/+VnQQtFqhQHCNHuTi/mpWOHu/DCitdEutGNF0qe2esAWHBQVALVyr760t2sj/3POc8srjTip72tCPJb8EXeNBMmQrzEWIxjB3fW7fuVgcbqyQLDw8Cf8KzJTK5ZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688435; c=relaxed/simple;
	bh=/FN2gJmvIaograWSXFGLckXjDtgnX3X55u+WKcGfkKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVK/vVnv1nuHn6Qw6h98MZtegRafGozaHsdT9yTrADBMiuxZ9t+oRARb5gfn+vY/TQefTE1KUndhSOZaT/FHeyQbu6SZaiSVDTnnnFf3tfTMKTzUhLKtVvCeJoiwDizQguAxTOkXLmZipICwNLprcNXVDP7DLqkfRwnXw5Z2UWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCerepmt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGPfbDg9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAlfsY2953176
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7Li6KID/3Dh8L6Qbt2Wq1rLK1sKxXrcmOphbrAY7mI=; b=NCerepmt2gENzDqX
	qw9feO4auCkha9XUeA4s4wPp1xC3bDMU0Bo/nxsl0B7JaZ6TMODfoBseK9dbAyIN
	XurHHurfI/67zzWbcbiAo2S6A5LhVvYfOyHJmK2xV+lq+HJkA7in7PQKdiMO4Z+R
	dkMKwkxe4xpu2Wf1xbKs+0TWJ0gf6GN/DbvwuAIjnXbFu2A7c5s8VMJEhDnWMccZ
	IswoSTV6jwzAzCG6Khyb75RiT0BhM/MZKT64Hiz7fYtbSOlHSuKzM/FSN5D3KyOQ
	kgJIXNjXCs5AmPLX4XbIDmGrhDJZZM6ASA64ylGCibSmRIM6KLd66GXNrg89Q+FT
	pjwpuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c06420723-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:07:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b48c08deso30790785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 04:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769688432; x=1770293232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7Li6KID/3Dh8L6Qbt2Wq1rLK1sKxXrcmOphbrAY7mI=;
        b=cGPfbDg925EoTzdg3eT7ncJtQlqlhI1tRACXF9NaMic6fiFCm/fmL+cPDVTs+RUF0M
         IXmO26AVc1wMIYjyj3yV9UvJE07dh0RCgVuhHnGTrNfXO/p7ohMdQmx4rUJ4pFVgRcIC
         gpJzYy+08HhL6Zsqn6Z86RwvS4gnE3M9wyKYIaC1cGPTqZ0Pb2TbLBKUanxBnSJ6p0c9
         TQSsxSoNh5jo6ZHDq5hg+reEgZupu9ZOAMAaeU8MqUHB05E65tm1lma7IgWpZ6EZzOu6
         nkioYFFGs8k+xc3zqzc+8b+eI5DfEz5AVngn8ZqRH/PwjoI/EOtLox5RqUcifFZ3u8cR
         d2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769688432; x=1770293232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7Li6KID/3Dh8L6Qbt2Wq1rLK1sKxXrcmOphbrAY7mI=;
        b=luGFsJm62AAKNHdDH+wYwDFo29uXT2prCcyNJ2b1mAAqmw/V+3Cjs33RrAin6tRegY
         VdhpL1s5U0L1GS6WbIekKg9yndBeemKaWLSrhnK5kRWJmH6OYVCGTPgO0rfl1rwT/G4C
         U0/Pn2TxXTtsyicTiFSgFyo8lVDQhzo1RKK2R2z2pyISSv0febbHoW2hQzKHgyxCKSZ6
         3UbRtzlK7F+s5O0FjJkfS7t9PEoC5s4g0+aSN11uRtli7yXK32xJWfyvqlfTtpT7HCyM
         WRN5tirBuQ7eQCosBySZXZAMBt8yi1bH/w/D57R01D2QFzZYNU4fn+NZPBKIfWwxEdCh
         jTuw==
X-Forwarded-Encrypted: i=1; AJvYcCXrQWVSXlEH4yTxdOTwKfhKWq8SxMXNKvV0GliL/mO0UYuuQ3PA57P7t5Kb+bd31wXYrBl3t9rIOJbHCU/7@vger.kernel.org
X-Gm-Message-State: AOJu0YwoeaQBil/sOJueONoVlpyFk9nx4aj4T/2YapZJ9jmApBBBy6U3
	MsJK1oxiTnjqhDvpc9DuNPMqKtD27GLntuQlgaxxXrUNmb72co0uyiRWGfFGvhXwvzLgSYDLEr6
	+YvJUHemiGFD1n1JI0UX17sNOm3fe48OycfKo9EylYi1ykRE5VPFD7eyQ/36wRevKd8ye
X-Gm-Gg: AZuq6aL09gXQ+ehscj5VxF/hTYxRsrUzD5c8cLXeSlkSjmdRgdwkEii3afwtRw431mP
	5lBR/O2G1J5cL6V9VrBMCDapfrfiRc84SmNXPfSbweUbalfB8t8+zyWhhExj6oqEIA1XHrS66t7
	RnjLk2MQvEubtnKiKlBnHRqw9TmJYhcES0MBcouNPbB6Q19z/6zO0hvTgQNxs0fT7qVuxpaRl0F
	ciiP22PQNap9RIj+oDVL1qxP0RW23ADPTCuwHz0bR9uQJ80thXkI3q+jBJOi8e5mvTVhKQ/QqKp
	TQmOCJo1sl4wxLxW9UbwSR0lpHluhYO1Zg5u1b4wb0E5bMqz8Seij9WgycwoVXinz+i8DHwiLbK
	Dzd/rzB7T3p8qrsd6kRAziVQtCwX3t6E3vEHCVyQ9OOnTwvOATMBsBoU0ugixsoj6BDs=
X-Received: by 2002:a05:620a:bc5:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8c71ade7be3mr349557085a.8.1769688432003;
        Thu, 29 Jan 2026 04:07:12 -0800 (PST)
X-Received: by 2002:a05:620a:bc5:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8c71ade7be3mr349552885a.8.1769688431481;
        Thu, 29 Jan 2026 04:07:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ddcf8aa71sm114716966b.14.2026.01.29.04.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 04:07:10 -0800 (PST)
Message-ID: <6d2b92d0-55bb-4ce0-ad5e-316210a3d2c5@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 13:07:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
 <aXtM9vE9y73vnVeA@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aXtM9vE9y73vnVeA@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4MSBTYWx0ZWRfX1dEa4XwJVnyr
 EFRIsJIbcQysNPny8NOXCvdX6PvBp4IfRb0GOggG8eKdSRP+vR37QaQu0OqXMlxNBp+XI2LroAJ
 wZLM1Qq5+LYBqudklUF/Hp9ej/OqWDMakwtYvFcuLtD7I4W+zKizigv/2BIoqCTsr0DzURj4pe0
 VG9kRMj1MaeEzAtLQ5UZHuDgc3JfT/J5TqdO8Nn+csT6v1Nkw2iavT15JCvvnhn4cG7l8pNX1X5
 IwbVtXwC+cVTDS1XqDIA51npYSaQI3j5TTVFUu3ZVfqftjfBeKU6L+rVRYsfJE4oKSvqaXFvlYe
 jMybAJeY+SPH7RMJo4Q9I9TdCtHLuhPHehAH+7FlW9buBdkA+jpkw5EXOK2W4J8cINsFO2q2eEk
 tlQC2wrWIoSTLBDvDYuUoj1mY1s2CKT+2oemVcXwB3IbLCN4DzcyZf9C90gR2DmQix77PUERmHm
 t1ne0vR8BdnGtne6GMg==
X-Proofpoint-GUID: N4FJwx9iT4p5-h3sDDPLJ6bpi00EC5Lr
X-Proofpoint-ORIG-GUID: N4FJwx9iT4p5-h3sDDPLJ6bpi00EC5Lr
X-Authority-Analysis: v=2.4 cv=dpTWylg4 c=1 sm=1 tr=0 ts=697b4d71 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=gEfo2CItAAAA:8 a=1wsREFbI4ITEArB6xhcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91172-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A29B1AFE83
X-Rspamd-Action: no action

On 1/29/26 1:05 PM, Qiang Yu wrote:
> On Wed, Jan 28, 2026 at 07:21:04PM -0600, Bjorn Andersson wrote:
>> On Thu, Jan 22, 2026 at 08:53:57PM +0530, Pankaj Patil wrote:
>>> Introduce dt-bindings and initial device tree support for Glymur,
>>> Qualcomm's next-generation compute SoC and it's associated
>>> Compute Reference Device (CRD) platform.
>>>
>>> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
>>> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
>>>
>>> The base support enables booting to shell with rootfs on NVMe,
>>> demonstrating functionality for PCIe and NVMe subsystems.
>>> DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
>>> TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
>>> thermal management. The platform is capable of booting kernel at EL2
>>> with kvm-unit tests performed on it for sanity.
>>>
>>> Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
>>> SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
>>>
>>> For CPU compatible naming, there is one discussion which is not specific
>>> to Glymur, Kaanapali and Glymur use the same Oryon cores.
>>> https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
>>> We've kept the "qcom,oryon" compatible
>>>
>>> Features enabled in this patchset:
>>> 1. NVMe storage support
>>> 2. PCIe controller and PCIe PHY
>>> 3. RPMH Regulators
>>> 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
>>> 5. Interrupt controller
>>> 6. TLMM (Top-Level Mode Multiplexer)
>>> 7. QUP Block
>>> 8. Reserved memory regions
>>> 9. PMIC support with regulators
>>> 10. CPU Power Domains
>>> 11. TSENS (Thermal Sensors)
>>> 12. DCVS: CPU DCVS with scmi perf protocol
>>>
>>> Dependencies:
>>>
>>> dt-bindings:
>>> 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
>>> 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
>>> 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
>>> 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/
>>>
>>> Linux-next based tree with Glymur patches is available at:
>>> https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_glymur_introduction
>>>
>>
>> FWIW, I applied these patches onto next-20260128 to see if things has
>> improved since Rob's report and I get:
>>
>> $ make qcom/glymur-crd.dtb CHECK_DTBS=1
>>   DTC [C] arch/arm64/boot/dts/qcom/glymur-crd.dtb
>> qcom/glymur-crd.dtb: dma-controller@800000 (qcom,glymur-gpi-dma): interrupts: [[0, 588, 4], [0, 589, 4], [0, 590, 4], [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0, 596, 4], [0, 597, 4], [0, 598, 4], [0, 599, 4], [2, 129, 4], [2, 130, 4], [2, 131, 4], [2, 132, 4]] is too long
>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> qcom/glymur-crd.dtb: dma-controller@a00000 (qcom,glymur-gpi-dma): interrupts: [[0, 279, 4], [0, 280, 4], [0, 281, 4], [0, 282, 4], [0, 283, 4], [0, 284, 4], [0, 293, 4], [0, 294, 4], [0, 295, 4], [0, 296, 4], [0, 297, 4], [0, 298, 4], [2, 124, 4], [2, 125, 4], [2, 126, 4], [2, 127, 4]] is too long
>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> qcom/glymur-crd.dtb: dma-controller@b00000 (qcom,glymur-gpi-dma): interrupts: [[2, 76, 4], [2, 77, 4], [2, 78, 4], [2, 79, 4], [2, 80, 4], [2, 81, 4], [2, 82, 4], [2, 83, 4], [2, 84, 4], [2, 85, 4], [2, 86, 4], [2, 87, 4], [2, 88, 4], [2, 89, 4], [2, 90, 4], [2, 91, 4]] is too long
>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): led-controller@ee00:compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): pwm:compatible: 'oneOf' conditional failed, one must be fixed:
>>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>>         'qcom,pm8150l-lpg' was expected
>>         'qcom,pm8916-pwm' was expected
>>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> qcom/glymur-crd.dtb: led-controller@ee00 (qcom,pmh0101-flash-led): compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>>         from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/led-controller@ee00: failed to match any schema with compatible: ['qcom,pmh0101-flash-led', 'qcom,spmi-flash-led']
>> qcom/glymur-crd.dtb: pwm (qcom,pmh0101-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
>>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>>         'qcom,pm8150l-lpg' was expected
>>         'qcom,pm8916-pwm' was expected
>>         from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
>> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/pwm: failed to match any schema with compatible: ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm']
>>
>> So, we're still missing a few dependencies.
>>
>>
>> Booting the system I get a ton of errors from PCIe in the kernel log:
>>
>> debugfs: 'opp:5000000' already exists in 'soc@0-1c00000.pci'
>>
>> # dmesg | grep -E 'debugfs: .+ already exists' |wc -l
>> 508
>>
>> The system does eventually boot, and I was happy to see that we do end
>> up finding the PCIe devices after all.
>>
> I enabled dynamic debug logs and observed that each PCIe platform device
> probe was deferred approximately 10 times. The probe deferrals resulted in
> additional OPP debugfs warnings being printed.
> 
> The PCIe platform device probe was deferred because the PHY driver was not
> ready - either because the PHY driver was not yet loaded, or because the
> PHY driver's own probe was also deferred due to its dependency (e.g.,
> 1fd5000.clock-controller) not being ready. This is normal behavior,
> correct? I also observed that other driver probes were deferred.
> 
> But I'm not sure why there are more than 300 times probe deferrals on
> your setup.

I think Bjorn is trying to say that the driver is wrong, because it
effectively seems to call devm_pm_opp_of_add_table repeatedly

Konrad

