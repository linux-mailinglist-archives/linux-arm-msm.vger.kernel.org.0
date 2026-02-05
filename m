Return-Path: <linux-arm-msm+bounces-91881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFCJHHxfhGnS2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:14:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4117F06C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99B6E30AB078
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06303A0EBC;
	Thu,  5 Feb 2026 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyfF1qTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Viwjta4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8771034B1AB
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282318; cv=none; b=rcg7R+mrg4mKOpqht5xhy633yrxBVSPjYD+Is4nc6ytM5ac2C+NEP6HyOLA3MjiKaGWJMPKiC4rOG+1TqsGTA8IsvwdwyYhZLilOGioEC4UqAWqoDCNBgXnSzEoz95Q8g78o6E4cIrwgQxE+n5txyDoPOYfECOqeDHY5Beyx4jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282318; c=relaxed/simple;
	bh=anLO55SwKY2JU/D6EdJkspS/WXaI34Yc/1S0BY14WTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7kwwdupvcWufcmOmdtcO3f/FOVmoxUxxvsmKmfH+4AS+5zwgBv+i4x1EoDlO+tg7LaxhyPXLuwAUaHLeVIot8ehyLNt8iSKxkMTtrjN1AxvaIBXQLpFU/ew4+7lqQE26UhHnGl5o0hDeXYv36SNqb7+sdcAmK2hmYTSPvQ50T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyfF1qTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Viwjta4G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61555ofw3047830
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HXzW66qwAeMlnOxMmTGmYciFEyFaFIMfICLtoVtwxos=; b=gyfF1qTVeIUOT0Yi
	7YoAQvAU05QnJNbT3iDy+9DXrtj4d1fMLALepRDkmhzRIW5jW49SGuZejJT/CIL6
	m6Sk8MJcafVXZ55ckI4JGrmADpcdm9x23i1M+sxgTvsRHF2Xd0V6ec5u43t8i2pg
	+LrHC65SjhKhrYQXA7P7WYFfGuhXbiSXYu1OjidCy0CZnuVHkXokLLUq47HCCYyl
	jggT//PkINvk5hL1HPLrfv/CG9P6dv+wYP4SYtalPkkpuPYA/nRp/1GFS0ly/PkQ
	cabG7rt94b03HsyYhvJ69b/fMG5bDVCsooRes5/iuQ/zreeYRgfF63PcqTIsgDbq
	M4B87A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4mrtgpbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:05:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a182d4e1so14357885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770282316; x=1770887116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HXzW66qwAeMlnOxMmTGmYciFEyFaFIMfICLtoVtwxos=;
        b=Viwjta4GR9W+PuXPfmwVDaow6um2fACTDfOG4+h5bj3gRNQHGIoi1jlWE6SBVK+Hr3
         gGCKkr1KT6BosILPh3CUS/2I3aK5zC7sOeB4U9MZvNwNkXWnxu2Nu/vZFJoo7Ao6ApN6
         unND6+xGSP/KMEZJ4iSXar2fUVMrKwQ0BH1NZQPAbgi/ZOfWNb/dTMNdYhGAK88uEdZa
         21NOrSmJQoswl35Lt3vQt/YdlYFOsh4FOYeKf1PjabI7qzGgeKigVuaAQDOBYjS6f+sp
         Ft+xAFK9eYvaDQkErLdMl8PluyIl09Lugt3n+C0UIKz3hHcagzhNiCo7zQP+ZwUx33zX
         fFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770282316; x=1770887116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXzW66qwAeMlnOxMmTGmYciFEyFaFIMfICLtoVtwxos=;
        b=NGu9wxJ2I03xi0vNvFrdt+PGTjdFAEruP6XGygZ5C++og/VB9hSTulDI3frt2TdZ59
         TmunpdbTIVso659N6VII/TDyF1hvexT7PmRpp1GTqRHKnQUU9aXiVlSlavgsc7x70w0D
         XfEjVKeRasDBLjxfcph9riqK6CFYurfS+hu2oK9pr9h7EjQGgEZGqGfyMJGZO5MPUd5C
         LukfSKD7VNmvhmigsb0RzjJs+QOIQbkfJ7XLRHK6LyBB2sBGn4WLcdS/WmqqmPftCZRI
         rjSkpW40FCbaXEWBxHkMOuxvibjmbNeYZDs6gXON+ifm0uK5zRflMISxzsBmSiLbQu/8
         H/xg==
X-Gm-Message-State: AOJu0Ywzr9oNnU7hy65uuDlsVhWRiXUaxtmJ5/ZFjjDjzvoDm0KnnliP
	37bwCGt4i2Wvv59SRUHKTgY/luq5nDUxwdHMBZzbXSXOar44urEWh1MPkdsqkfxLo8HMMHXLzx8
	fVz5Q0Z5BBSPbiLjun+iWnvlmG/GcrwuVciHGFnKeslWfPp9+/uS4uHLGcxnhHMyvhuT7Q16+8k
	iR
X-Gm-Gg: AZuq6aKqTXZhSeiElRg3xaj0Ly63Urq92DI+QHu0bu4TLA9i/29ZFmqjCFWl7wG5Phz
	YkVJCpEeeR4UfTWUrD8+mgCB4V7h+LNoWNH+eo5nvsEbrkc2SXd1w142l4RAw3wY5kIRjb/UXUS
	CU/JcTVhzCEmMnxrh7r+RxowxKSUULO6bV6B/smr/r1aJU1rl/blpxRskRG1exl2MVumBtYwFEU
	hq+xG2XefqxyjlrFq1z4HgVV26AP7PwqnhkgvbmemKXiAgISh3vzj9hsqfycYe1tfTtrhWuNhAQ
	jtm8gGomP1XaEntTV2IMFnxp41wNPV8sgP8tvLTkYbtGDqxMtU0a/fWCNya0BULYv30ToswNJcO
	s37KMi31nZ6FivwKFhnmkmHp4Pdom7uhEc9HJOL6rLEqHwnqp4eeW7WHKsikvp2Me0o0=
X-Received: by 2002:a05:620a:172b:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8ca33156b6emr493912585a.8.1770282316566;
        Thu, 05 Feb 2026 01:05:16 -0800 (PST)
X-Received: by 2002:a05:620a:172b:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8ca33156b6emr493910685a.8.1770282316183;
        Thu, 05 Feb 2026 01:05:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feeff51sm199400966b.39.2026.02.05.01.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:05:15 -0800 (PST)
Message-ID: <d800d5cc-0e57-401a-a62a-42e9c40125f6@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 10:05:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] testing! arm64: dts: qcom: decrease WiFi antenna
 regulator minimum to 3.0V
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260204-oneplus6-wifi-voltage-v1-1-ee6fd47f9d02@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204-oneplus6-wifi-voltage-v1-1-ee6fd47f9d02@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfX+mMQh/LqF40z
 CEaZkPufK8kpYMX+FyaXI4C//fFhabLEfyoEZVeGCetJR2GoAzeaVsABMAO5S2tMVsLj1/oYWZg
 cSBhx7RQ4AV7sn7K8LJZ74Qmxo+mOisnOH3c4eMmzCk8RQwqCI4yiLs5bn2dbobvpOT+ERaQHLL
 F45zuQ6yCarhks8WqYw66OLIZvdQMJcw7rh/eInpSkdHQ+FeZ+22vIvstP4gPm6IZ6KKWTiSzA/
 2/D/8T9OoA2FDApjGTr4EnDDD/4HsS872ID81RJZzXTY/aA73LLlTPKPvwDsAA3qindjchhJv14
 aV9vm3OAt3YN5QsywGgAho4f8fs7rOeilT/bpOrzILaMp9lJ3FoEkRkwoHRpuxW4b+jp1IzdIxq
 hletHKB5I5VgrWgueZBIUDLVFbltsqZTRUPgM7loFXNdd2kzSgnpKlPWvhzT8hhAo/7cykENAEf
 zQe9shijbb4VdaaYYHw==
X-Proofpoint-ORIG-GUID: vsOVzIree6-nRNuc1hlmQhJPJ9QVdfWp
X-Authority-Analysis: v=2.4 cv=UoBu9uwB c=1 sm=1 tr=0 ts=69845d4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=o67kmj3H2-0caDlAT-4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vsOVzIree6-nRNuc1hlmQhJPJ9QVdfWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91881-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4117F06C3
X-Rspamd-Action: no action

On 2/4/26 6:03 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Downstream defines minimal voltage as 3.0 V, while when OnePlus 6 was
> introduced to Linux mainline, the value was fixed to maximum 3.3V.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Tested for ~ 1 month. Seems to work well, no visible issues anywhere.
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 5b121ea5520f5..e950db41ce25a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -307,7 +307,7 @@ vreg_l20a_2p95: ldo20 {
>  		};
>  
>  		vreg_l23a_3p3: ldo23 {
> -			regulator-min-microvolt = <3300000>;
> +			regulator-min-microvolt = <3000000>;
>  			regulator-max-microvolt = <3312000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
> @@ -320,7 +320,7 @@ vreg_l24a_3p075: ldo24 {
>  		};
>  
>  		vreg_l25a_3p3: ldo25 {
> -			regulator-min-microvolt = <3300000>;
> +			regulator-min-microvolt = <3000000>;
>  			regulator-max-microvolt = <3312000>;

A datasheet tells me this is out of spec for this wireless chip

Konrad

