Return-Path: <linux-arm-msm+bounces-95129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PVbHezVpmnHWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:37:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9D01EF8E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D22F43048B27
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 12:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B781311975;
	Tue,  3 Mar 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PG9Dix3f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGWCBIpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1125F7A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540582; cv=none; b=TfdUzfPD0xgNhL8ux9Bols4G9ixGppxbEl+/ttxVMXCnfoWyQ2u+LZhS1mIzDEJwq11ScLURG4LFn5ALqplOLRebwIPfRosZbzmr5HRqUciwK5Z8eT/ToXml6zE2coM79O4/YsahQ5pFauGByEptzc3tvl/gR+Ef8dUojdScpbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540582; c=relaxed/simple;
	bh=VvxYTeIvPLpVtqGD+EY5ebTRepGYdg/KIqQJzYbzm0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6LYgTd98Z4vgyXkXRt4J0PNh+ACCikqL7YcDc68GoQOyPtPtz/Hiu/nU07tfz0CiYTHfR5KiE5JL6S+bE3kSc3SF0Do9tryclynw9XKuow1VM4RsqQlLFWesm3kOVbbOOcrlF8QUGf1DAuH349wAD22VB0C8cM5EhDOEinC+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PG9Dix3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGWCBIpc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mu4b2736083
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 12:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEGP2dOfPj1nq0zREG6nvoCUy0/w/6KgW1uW03KjAaw=; b=PG9Dix3f7vzDplNg
	nKD+D3LvjBR10pCeF283Z+TO2L1RvIp9FyxMl8NqMLnqfye3hKHnckRngP3Esx4q
	JV4Htl17ko+GMQvZaDMMA08SYhMA56O7h+r66qHo7LhRLtqCzrx1lj8TaInPgRPB
	ALkhqNBo6u8Ox4pyyM6wYbl5yYRGfYnn0LK8ZhhhDj89wW5aEbb+RtaRHVD0NYuz
	RxagV7rAcBLtArujwuMXcToyr3Y7EYRnLicFdQ/Ko0kJ81TxrGaDrsWZKosVnem8
	NkKEs48hPZSDK0fH9hWUifjVCglH2eF1Bm1fRQdgNu4+I8b4rm4zir8jeZEDykDw
	USSyAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe189g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 12:23:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae405e95f5so30583285ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772540580; x=1773145380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gEGP2dOfPj1nq0zREG6nvoCUy0/w/6KgW1uW03KjAaw=;
        b=RGWCBIpc24hXjGEashNl3ljlPHqVkc5SOP/35apocg/Nkc0FxsBtTvbb/kRTY3jeG4
         X3gfUucDmKpF4cetB2ZbgBeYoUMGWqbAN5slXUkUwhwr6ew/MuHX3u8N+jtBgAGWrrXm
         MdDmkpK+A7GujrJq6HBi3bRd0syGLLNN7OMiBLwdYqFlEZ6UM5ZvbcYdrUUBIl0Vee+B
         9KJuZU0HHwOxcZ9OG6B77j8crYI4cn+8MRoONF5lgjjHwxV0Psme7tzrZPO0iJgSYopb
         F3SceLyxaIypRfE8Y6VQ/SWrbpEAhb+teAVPtbpXEyy/sajBEGciacnS5nOibowJUFAP
         uRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540580; x=1773145380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEGP2dOfPj1nq0zREG6nvoCUy0/w/6KgW1uW03KjAaw=;
        b=Zq3mNrfOmSc/ZrVujl2hrGniPwsIyO5uXL8DqpE5F007/FY45bqvIjTlZ0lHybAfKz
         pwfsU095siLLWZYqUPrHL167EeAYCo31IT+pKsJDF7HGhWnfcFd9hHFa7LTTen+XEnAl
         pFo+86+ds0nXA9z3o632LkalepLyisCpRNk55VK0ZFbU1OmPHGs0kr1asEFnwb3CvfLZ
         MUWVOo4hQSs/kHFvdM/p9YYqyNYJm5b0urrZVHJknTp0dIwvzpRfyh6hucEIQo3NAFSa
         jB1otH33jWXi7RdO+prAOnlIUiQT1vw4iVxFnVlqvy5IrlBOVAuPAxnnvF2VfaqsEVEs
         j7uw==
X-Gm-Message-State: AOJu0YwGLk9MPzLZ/UT0K8dAHkSub0MF76nKuFbyAUztWfnEAr8hMzGn
	D/U29Jj+6nvL433I5Kj2mPp4nRkxI35uoyBxSsExfeU0d7/0B0S9euwP1TTP1sjE6G/EW7z6pNk
	jDwOKnr3qjXMEgnxESoGsJYbtNX0NmGkeSXjaR4r2xIOa+g73dcH+13QV4ZNoIEdCgzC4
X-Gm-Gg: ATEYQzwMKvLv8qWmlbw2tZ64h2amrMxJkXS538S9r/LfJaKhRnSEQ65EPmupxW/McIB
	tXyzzbZpcvKZhtpEcM7dRqd0K+f1kZ9hxUu1LX/jjxsWew7enHn58J5a/SqLh++XCI6T8RDdx5/
	xlgqEoptDEeAmQDrKkn2c+r+GDcp2yfufRXXo/MW96IJpYhyP0Kxngrt6pzeFX9eyC5f1cLRfCX
	NgA1IrRiY/iY6a1vElvM2G3lS8BAD3i4yTlkmXb5gMh7PjYmD+1MZGZ9cfOVHRS2mZSLb1Sxz4o
	lSEugT+IvJVM/YdGLsle6oL2yvF9HaY4Gspov4o++pk6QMqPooy4r17SY7ifw7h/QahURx37KRd
	mKRfRD3bPxfxbjT+43InlGRkaCXbrO7dJlkRC851d/6YGcK8I41uKlKFNvzHzWrYCHfy0buU4w0
	qgSXEFPEIa+iaTHg6BqlelPQYvfrbSF+i9Jsn2PALp5klvIec=
X-Received: by 2002:a17:903:41cb:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2ae2e3f1170mr176070525ad.38.1772540579802;
        Tue, 03 Mar 2026 04:22:59 -0800 (PST)
X-Received: by 2002:a17:903:41cb:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2ae2e3f1170mr176070125ad.38.1772540579300;
        Tue, 03 Mar 2026 04:22:59 -0800 (PST)
Received: from [10.190.201.204] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b53f4sm163133075ad.18.2026.03.03.04.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 04:22:58 -0800 (PST)
Message-ID: <2d6d813b-b2e7-408c-bf58-86d25859bb40@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 17:52:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add glymur BWMONs
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
References: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
 <fcd9de7f-b65f-4a30-a74b-57bdd690422f@oss.qualcomm.com>
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <fcd9de7f-b65f-4a30-a74b-57bdd690422f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: etxO-a8s91d0INt9hU4lCrANrXIZmseb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NiBTYWx0ZWRfX0LsoilmkMPpH
 hzyXRDe+ryOmUEQhWtvvVWUDCo3lvN8nwySH9CWKPCYz4iOuRlNfEBTOsLeHrXxqWrqGTjB1N4W
 KL32BDo+i5Egc2prHpTSorzeyPbFCNr+SL5c8qcgyZE+57J1tFRWnC40IaoPtsHl71kO/vfXTrO
 xn/FcSlx2XwEhZvsufZl1ROY4weTClwnCgQyNbq5dMzVV5GkFxACjdmpHPi//76TC0TInIw7gGh
 prqatbGY8p7bbeRI9BO9XqkS3FdzF6UVjHNzyNmAlIr3qzZmTzWn50whGue1JVt8kqhtfQuy0Qj
 TGPcYYI3JgZpeJW0js5jAQ6e3vKJD+QR7OEpQt4DR156BFBR5e4jlaUykCms3E5G8mNN9dMMP+W
 8+CwY04wlYnTYsjp90djBjtGCLFib42WpqxscFUeC3Gy/OBmRZP9koisjtlbr61WGS7jYN7f3SZ
 HJdrJp4+oeoBrs0Tnlw==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6d2a4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2zOTDtPhI6Hq2gsOaQEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: etxO-a8s91d0INt9hU4lCrANrXIZmseb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030096
X-Rspamd-Queue-Id: CE9D01EF8E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95129-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,100c400:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/2/2026 6:27 PM, Konrad Dybcio wrote:
> On 3/2/26 12:46 PM, Pragnesh Papaniya wrote:
>> Add the CPU BWMON nodes for glymur SoCs.
>>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 87 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 87 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index e269cec7942c..fd947b1a17dd 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -2264,6 +2264,93 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>>  			};
>>  		};
>>  
>> +		/* cluster0 */
>> +		bwmon_cluster0: pmu@100c400 {
>> +			compatible = "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";
>> +			reg = <0x0 0x0100c400 0x0 0x600>;
>> +
>> +			interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +
>> +			operating-points-v2 = <&cpu_bwmon_opp_table>;
>> +
>> +			cpu_bwmon_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-0 {
>> +					opp-peak-kBps = <800000>;
>> +				};
> 
> Can these values remain unchanged vs hamoa? Glymur has more memory
> channels (as reflected in the icc driver) so the values send to rpmh
> will be a third lower
> 
> Similarly, hamoa has roughly the same values as kona, which has half
> the channels
> 
> Konrad
opp-peak-kBps is proportional to bus_width and is calculated as follows:
 
opp-peak-kBps = (Hz * node_bus_width)/ 1000
 
All the existing targets do the same, since bcm_aggregate() in 
bcm-voter.c divides max_peak with buswidth.

-Pragnesh

