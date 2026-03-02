Return-Path: <linux-arm-msm+bounces-94923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIf4NbGKpWk4DgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:03:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 274721D9699
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A47CA3008895
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4AE3BA234;
	Mon,  2 Mar 2026 12:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3ZIAXTU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mvl1Vcu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531873630B1
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456281; cv=none; b=EkJ/OqX9IaHZ+ji8UsICqM+VH3GteXvOg8J+mBVHIQTKhICiNHLoy48j4RaHYZ+ftYo4ROhj0NxkoPvqrce3AT6qoS/+ian0YG/mGyyJG6Y5xTOd+BRD+HweBVxkeMGO9LtKgcgD0juHLjiC7tbqcFZpOQ8fS18IENT/hPFEFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456281; c=relaxed/simple;
	bh=RT5M8GsY7mFn9Ym5AKFV0q1YsiuItnA6BMw4wY/VHuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHUfeiCEgTlq3jjvdwiBQAm8520TXOSdX1s5yaHIvfVy6QUO7jQNstV9yKj2rnRYKaITDzqfElsyGxVaeWWaifFag52cWjiGP1fHf8Y3QFwvf39xBY31FBj5a8h+tATufagBTAPE4bWaosXoqezoD8tglczmzon9C4svwhVFiHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3ZIAXTU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mvl1Vcu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62288JQv191536
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpDXZ/Xjmg1opisOrU4PVUYgVyNpXhEk1eJi6YrUxjo=; b=S3ZIAXTU7x7xPpqf
	eFqjM+vudUsDGDiNk2kq13Y0LRY2f2X/9Q1yJKieXBUza8qdU/1bWqDdgcQkqCSZ
	11Wlrxm22/V2Fq0nC8HDM/uyJS/7s3MbkuCkl4LwA/hc6NtfDeQMUyFC9EVmOesL
	YaQrdemvSKKp8wZ3aGKVr16aiMAd9OvoE7eb6LucOb5BtDzGhJmgoraVwCSAHWBx
	IH9VGNrIHzYzjszSf5GXiBavzHaLZxhjfE8+8A88ApQSgzLUhGx+31t6HGWXz/6P
	izOO6FTI5uuXCWt3JifxJh37btRip3DQCnXi3kSCIWyx0fs0gySFdj+I/ut0+whg
	6PJiZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64adm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:57:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a012f8ab7so3191846d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772456278; x=1773061078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpDXZ/Xjmg1opisOrU4PVUYgVyNpXhEk1eJi6YrUxjo=;
        b=Mvl1Vcu+gB2keKi6g4TAuWQct5F2w4eN88ou9hERwq3IeScs3XLKQVxKnwLh6SEdg2
         pvPDPBh8U9wenceNP+0VWc63JynCdQ88UvbuPqUK3ylz9Be9ABrqutTjxyJqDxCS1LdP
         JRXVWWH5pHQSL6T1CXPwJj2G2hA/wzylL/18yutLMgukVfQD68cSfWK1DskVCWjE1uMg
         Mb7B/g6J1vYmB7W6H9fHclcz3jLuSybq/y1IV7IExsroUDD8iXGdGbxOzheQVHZMkmvU
         e4CesjlXha/heOjOyKP2nzXXAEUizQWjMHb0lZf8aauKHFNH04WuxTK8x5oslrClwt9v
         8DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456278; x=1773061078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpDXZ/Xjmg1opisOrU4PVUYgVyNpXhEk1eJi6YrUxjo=;
        b=C34ruxbX5lYmxuxNhQ6Pah89rdcwcw0KTso38/a0Lx8zF16xEd9syFsOkU94GD0CKS
         Hh/JthUc+7aX5c3zRoRJktSV9CteHjOXSu3PdPpzxAMwCndoyF8aPS4I8Uz0oVqbfZQ1
         LLrOMsQPTfXJWwNYKQJX7CF0OiuHGaOwEFW+zaXXJdpxQRqbV3rvvIZ7RnAx1y5oIwPT
         r4EognGlXp1i1TdZDz9eNehNbYwtuVO+wYxLSxuz6BUI+pSJMBPGaGO73VYrFVsckW8x
         pDsqfOZtycwmF+MeLs7IRFWmaohO1oBwhtLKkZUSAdg7K5cPlN2G/F6h16irrevATrow
         NCkQ==
X-Gm-Message-State: AOJu0YxHCWFVvImn4F4C2wFhKNqQy24LNbwwq41oBrwwWbX2zoAiVTSJ
	QWtfNbMDW3mzawhAYWmL2KFqYO13ynh2hh0Ms1PdP8+7qdq8hC/XybSq5IqSj8I/K2x04n+NTGr
	QF+UpcWIoO7jVsIFCsyDaOO8NFtVYyaZt+Cm5QckDnOl4lVFbNVtoCjr8bP9t6FNClHTz
X-Gm-Gg: ATEYQzwmb4tvn1VoZ4YoC9q2HXZLjy+ahZzvO2SSoovuQ61M0b5kc8foY2akz4u+N/V
	nIEbM9S1QGjC86fSzRlWCwOgykqx+5Wwk9D8cDDDvAEDnqg6ubtHsB5+1/PC+QLBqemjjI03xNS
	WzUDxtTHyNIG7OL4PUUWQCTzhL+r41YrxOCbhGPHtQ6rfqYuVsIVqES885GnZtc7esL8YHDoh3L
	JF/6yXQKnup8a89ru7IR7LvD5PB+P+IOnozanHecCMA//kvu2w68GEXAptPCCkMJVEMJBIR9FS6
	KllGqBGsOTyx8FuwLDlaJI1K9aJq3gNyzs1UMquk1JRdJNV57Sg6ets1/Bnr3g1wmnrn6E5KR7g
	w6xZZdtSjM7acpwFHAVc/VrWNY7ulmk4bFTWT3KjP3too5VrdKUgcCGe33u0jvqGk0SQB/11eeF
	K/Y8U=
X-Received: by 2002:a05:6214:6106:b0:896:fd66:a084 with SMTP id 6a1803df08f44-899d1ee3349mr96986556d6.8.1772456277739;
        Mon, 02 Mar 2026 04:57:57 -0800 (PST)
X-Received: by 2002:a05:6214:6106:b0:896:fd66:a084 with SMTP id 6a1803df08f44-899d1ee3349mr96986366d6.8.1772456277366;
        Mon, 02 Mar 2026 04:57:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac70b01sm465622066b.23.2026.03.02.04.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:57:55 -0800 (PST)
Message-ID: <fcd9de7f-b65f-4a30-a74b-57bdd690422f@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:57:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add glymur BWMONs
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
References: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rBd0hJSYmheWDIwlQwhEhhRlHSGMPgWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwOSBTYWx0ZWRfX9bAAiEHQOzG8
 sM+zWzFbANV/x+WWzkCg4dINLH1wq48MBV9659exlKjI/0f20EkEI0y260sSbEhWVGr4ri0e+an
 O9GKYnhbAV+H8RIqFyMANj+3fexIo/HneS3uQG4ZkXb1bml8GbSSH2AMv99XTclNnMCOaFNAFSm
 BtbMJzkbDs01jHtdOsPOAQzdDxVB4VVETkLtjhwGDaV+E9sLfl82w02vLeKhWWapSEapNQoYq3l
 aw39nLamhzGZdkOA7GKpP6/CZtmrZTLlEcS69EZqqkj4D2PhOglgjxcEUAhTjr8foUm809gl0N8
 ATpMcx1P7CSX8f0ZCa4+yUP5NaHmBdVVNpOxwN5pJbNM3UHo94LO0VdVbLahZH3eDH7nZ48GWc7
 t3stukl2lY2OWVm96vzN9l0TtPPDzVlVmcfmap2oO92JYzGEeZvvPh1Pw/v8lnk05mvm4cTWfPf
 dJBdb6SFDCDdiW3IG0g==
X-Proofpoint-ORIG-GUID: rBd0hJSYmheWDIwlQwhEhhRlHSGMPgWt
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a58956 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cC3VdhgI2v16QeH5KSQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-94923-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 274721D9699
X-Rspamd-Action: no action

On 3/2/26 12:46 PM, Pragnesh Papaniya wrote:
> Add the CPU BWMON nodes for glymur SoCs.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 87 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e269cec7942c..fd947b1a17dd 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -2264,6 +2264,93 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  
> +		/* cluster0 */
> +		bwmon_cluster0: pmu@100c400 {
> +			compatible = "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";
> +			reg = <0x0 0x0100c400 0x0 0x600>;
> +
> +			interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +
> +			operating-points-v2 = <&cpu_bwmon_opp_table>;
> +
> +			cpu_bwmon_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-0 {
> +					opp-peak-kBps = <800000>;
> +				};

Can these values remain unchanged vs hamoa? Glymur has more memory
channels (as reflected in the icc driver) so the values send to rpmh
will be a third lower

Similarly, hamoa has roughly the same values as kona, which has half
the channels

Konrad

