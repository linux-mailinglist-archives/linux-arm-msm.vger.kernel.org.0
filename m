Return-Path: <linux-arm-msm+bounces-103370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKPIAKa34GlYlAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:19:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 554AB40CD49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92BB1300A606
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED7F39E17C;
	Thu, 16 Apr 2026 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pkJEoBWA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmtVliuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADA739BFF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334752; cv=none; b=lR8rWyRQ2YIS3YHl2E9BJzsPsN5pfeK5RSBeZYkbjfVQW9zABEA02QpIAtSTpR9R4wKgU0DasBdnrCBLigq+8r3ie21e8yJ0nlpNB/J9bYIpcET6XAhc1bnmsNvvHIkAwAeg7tEYTjHJblkIzoDAxWwNeq3c4hNJD+6505qMYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334752; c=relaxed/simple;
	bh=c4VwJZZHiqwxKGTlSxAgPZPW7B67LXDA2lbH5JvoZQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nz5S6bi7GqV4A2kuRKpjGdl7841PRiv9aoGjj9b+yL1mcKqmWlpEkcvWn1qbnGbAH39yYsuAR6P4VPOK56Foxu7y4iGW6B6NcLWkHUMDA7smDLUGxecvDX5djjxHnkjQrYdspVJxDjiedfd0TfbUYRQx1XGuI3I+2xjE9Doa+70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pkJEoBWA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmtVliuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6oqA6219273
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USAa8uvL+7TxJfOHDwWP43QFuij6Xcb+8SFcS6Gw118=; b=pkJEoBWARd3zf4Xi
	OuK3RNT0dnzJWi2v/O4rs2nVilwtdaJ1Kho4r9FymB9V6bBRLmOblMYYJ3AQ3VDp
	vdNDHLNGVlrScdLvJmIt26TOIDtk5Rdd2e1KGETxxzBhT4UGqPjt8JSWiT8ai/Ft
	Zsxq7DU2NfH1lj/7FgU2D1FnvQwsI3B9Z6CKAHY+lbpMxIm9cGoKKWhS+HkrFLS/
	OeGokXDa2xy5+4YGHrdQiI1r6aiaZhhf0Y4pbdFxvLDoXiK8wEhavbTX/7gpyTaQ
	mHEPGDldrPDQub6bhdsc2VpWUE9XBIbcOuNygBieUckV8fBPYuwIzZciv+SXoYDf
	5xbbiQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuygsxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:19:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca8a79f42so10638296d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776334749; x=1776939549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USAa8uvL+7TxJfOHDwWP43QFuij6Xcb+8SFcS6Gw118=;
        b=NmtVliuUntsO4b3+/YNH/PG7tuQAQ31/egpbLBc3a9oVlvOQxlLlEdeGLEojXDlAd4
         m5tbTA9g7E/AKmAJpTuuiK0Ioskd7CS4IkQd286voazLftJ/lP7+JR6QPk5O4n72qfZF
         glvmrdpMv9sY+8XMM1sFNG+4TaShGeTamTwMI1hML4pIzK+kHL6IEeZ7pdeBODHhTBLd
         49s50Q+nQgcVgW2POzH5p3xUpdF0FHpUTcm4IshzG3MgRNtp2tFTlJFrLGmusnrpsSTS
         2/18Ounopdbgk74YGh41oxEbDeuQPFgtyiYAPil1llBjPW6MRl2wMWXw2SX/xPITMWkq
         JNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334749; x=1776939549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USAa8uvL+7TxJfOHDwWP43QFuij6Xcb+8SFcS6Gw118=;
        b=j4AfdKcTdFyIk4VI52N1BkUUTuc+vS/ylwG48XO+vxzTocI7mkCsBHiOiuIH+sA6cR
         lDgrrpBdi9eZ8rWEqFKaWuneKbAuWp344quYHfv4PI+4THSDpq6962P/TguoztTNw5hj
         EXuo164xLYLULx5rIyte4j0+UAKykDZ63Vuqrao7+e+dxoj0/U7J8Ab4pGJeszL7W3dS
         IdClWIMYtPdGbT1DCfwG7bRtm5AcMhRM/uEr/aZ4/xY3BLQrucRfppRBxT4SQ1Y1nFTb
         ePWjuZgS9XoCYrZnTQgtdnuin5YQP8nxgaoixTAt/hVi111zJXZ1PMhylxtuL/VWpj4v
         KonA==
X-Forwarded-Encrypted: i=1; AFNElJ9EEu3I+ycvYH9Ac05o5vGAs/JW3YEc/nIKe4Bh6n6s4tCEtj1TToOuX1TlnJpvfznVEONEYi3AMxo60geX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8X4LIpVMUG3obDt4FkHdo1t/jNvyloWJ23yLlg7pRsgfTU634
	orZGdIGjlHYn8ACQzieH0mZFtx6VfBly10sqvVLQICNF4DD5UlF8ieVFLgWVRVi6OMk+dlJEms2
	aU/IfB+D4/96hXDXA11McHtrGgYjp776ZRnTE31XJqZBxbGQjx28ZopOO87b1d0gowS4y
X-Gm-Gg: AeBDies3ZJZ8oDVwkg+RQyjU/my2mXfQ2kz7vVqMLAmXXhpipEGTwEr0I3qn8TA7ERb
	DfnU/UU4vzl0eN4XS1kmXMmLmGMYz1fQBB8e1T/QmDPIuPJfWWoMZhEq6m6SwZuvm+KwoxYD6wf
	0aLEdcpwZX0IKcCOyli1zN+dHRn1o29pc4tTnuZiZLXEEYUVZES3py4OqXxO9053Lo8uZzhG3hf
	ax0dKdvaTsXiVVrYn8fmiEr6K+hdrQC8rzvul/o0HPa2L4LjckJdS5QNBVHDfZ5t80s4ti8KVJg
	7l3el1UZD/hOGmEpXvIZBAJ49MoQ2SmTDr/Eo8G+q+aOuYx1B16903qO0hPI728ExmFVqSsHpjx
	eI4mv950zaY4Leqlml3aVoWnapcU3vO/1Gm4pGbsE3e3KC/j/0xCvpfqPL1OcEbEwpp3MWqA4R5
	ZWp/Lk1SA7AI783w==
X-Received: by 2002:ad4:5c81:0:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-8af6b781bb4mr19991166d6.8.1776334749402;
        Thu, 16 Apr 2026 03:19:09 -0700 (PDT)
X-Received: by 2002:ad4:5c81:0:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-8af6b781bb4mr19991016d6.8.1776334749019;
        Thu, 16 Apr 2026 03:19:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba334539fc7sm27136866b.11.2026.04.16.03.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:19:08 -0700 (PDT)
Message-ID: <098ad1e8-1ad3-458e-93dd-859457cc58c9@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 12:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add IMEM node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
 <20260416-eliza-imem-v2-3-fb7a71123451@pm.me>
 <9592f205-7467-462b-874e-7fc599e5277a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9592f205-7467-462b-874e-7fc599e5277a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5NyBTYWx0ZWRfX0eIeWJN2nNXq
 /FHpidKJOi3AGxNBTLicPDAyVv/C3vNCqDNxgTBbDcBgjU32z/qDCg3eWXWXWlu2vCZP6RtBDe9
 8TpBOi8ZLW37/yWtbnAje4QP3ePuwKNae2cSzvEX4aCoFVC66wRhjWjaYdPQtc+bbHlwp5hK6zc
 Po+4et4idcgdflhVHZik3JUzmnl+9KIxlngPbXkc+Qz5VrW6wbvkcvHrzrntol6LCL53/34nhq+
 MHzfONgHkjhi2bFkDOAK0CA6sfb7v/bsHH9PRR99jAZDEISJaKKTxlyaIXMWpllvMZZztpg89Cr
 LXAlCz1xH4N2/bnWxtkHPzYIwez6sJRp7qI+eZRjyQXJ73kQ7YUyBT+4C+YYMGNOTGPRDEikOHm
 RzW6UvPT77Z0/FeTc2OnMSnb7wbQgCWUQGsoAHChrBhS3dCD7o+SuMA+86srFMYvrq1EVKWheiw
 lP3ZRVnoUI4t+N+dULA==
X-Proofpoint-ORIG-GUID: bDSUMqLBWLly5th4KSzZpp4zyVcPi6Ck
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e0b79e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=44A4ohInunnxtq6OaqkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: bDSUMqLBWLly5th4KSzZpp4zyVcPi6Ck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103370-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,94c:email,pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.223.255.192:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.11.184:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 554AB40CD49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 12:09 PM, Krzysztof Kozlowski wrote:
> On 16/04/2026 11:40, Alexander Koskovich wrote:
>> Add a node for the IMEM found on Eliza, which contains pil-reloc-info
>> and the modem tables for IPA, among others.
>>
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index 6fa5679c1a62..551df07e44c6 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> @@ -1029,6 +1029,26 @@ qup_uart14_default: qup-uart14-default-state {
>>  			};
>>  		};
>>  
>> +		sram@14680000 {
>> +			compatible = "qcom,eliza-imem", "mmio-sram";
>> +			reg = <0x0 0x14680000 0x0 0x2c000>;
>> +			ranges = <0x0 0x0 0x14680000 0x2c000>;
>> +
>> +			no-memory-wc;
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			pilreloc-sram@94c {
>> +				compatible = "qcom,pil-reloc-info";
>> +				reg = <0x94c 0xc8>;
>> +			};
>> +
>> +			ipa_modem_tables: modem-tables-sram@3000 {
>> +				reg = <0x3000 0x2000>;
> 
> I don't think these two should be in the main SoC DTSI. The non-modem
> version obviously does not have modem-tables.

That's not quite right, IMEM is partitioned to have it either way, even
if it stays unused. You'll notice this slice is there even on platforms
that were designed with no modem in any SKU

Konrad

