Return-Path: <linux-arm-msm+bounces-103371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK9MNQq44GmIlAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:20:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A340CDA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E6103017796
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C720139EF14;
	Thu, 16 Apr 2026 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzV8JbIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0qaqJzc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F9D39DBC9
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334809; cv=none; b=ico9pdWtzUu7NPgW3AjZRo3EBRZEx8OeANFj1UAEDo86KvkWCCnqruFmy0fmzts776jl1hjQEbzupRO3RoStSII8qAPca14ShD8ZK+ImMD0eUxKPhP58HaMv6DNXy5m35Oz3j4vJRYXiJVBla7n5mbCud2rSoeq4clntE4/m8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334809; c=relaxed/simple;
	bh=ML2htv29V005SfDSW9eTtfi4NMeYSdVZ5DYRjltftQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FySGJ5CniyVlj1g9tR5ndfoXa8zyXuNDnvOylMhYHPVMS1wLwrUvWOyDtmeq8BvqAYURdPWH3sqL4E5S5ed8ajLnr9NXiHDwIsjadGYIsJLL9LxD4BipE5V1xhmTvV9f+r3XgiEiDmBIwcIZ05ehxdbBIw+mBCJg8oSI4tpXtz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzV8JbIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0qaqJzc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8SPi72834976
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEAsEf/mEHAEKtROzGpkn9Ajx/ckmkSc552LIlFmuOg=; b=BzV8JbIAB6VHIB/a
	6AQvWvhn8cD92mqA8vzU7NcwI0ai4gbvdCF47zuEv18L43WS0n8sJEAbr04enCL9
	uqp/v2AmG/Uit4sG/aSkNCvMbR0TSfUjj53fd0hD3fb8u00KlnHVVDhxY8ktSxA/
	Z8o92TIQNwiREC0ePE/icAM2DuLH1kQQu67gLNWqlGZSmOZUTu909Uh2jzJbUWlE
	VBUUzcl6QSFxHCXLyXCbwAxf/33EaHGiCY/PpfBdS88pyZguSjAiuTsaA7NaaFzO
	mo+KxbrQ+GhhTC4PcMYTBMhZC+bEfMEekPMmpW+PXae+3CMT27ORDVRiMiO9QcYL
	Rx2v0A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcsvkfpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:20:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so24398966d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776334806; x=1776939606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEAsEf/mEHAEKtROzGpkn9Ajx/ckmkSc552LIlFmuOg=;
        b=G0qaqJzc8ZZ3g3tRl+tlc5FSv38amT7DmNdZw5E0ciAl9isk79+4hVM9Qa+Ff+7Ci3
         nL/Czh6vt1V0nFTN85/d1g6RnVgkobGmk6H0pwWN7eyNtNvc6XmFIqBcLn+dTE0wvRCR
         gsrmvwZl+TCKJVNlas9jwEToci2vc6kgx3F6tLAFJ7bItb5bs54pirtZEwiqKOl5LCdg
         J9QZG7sIvKNLpNB2oyZ+l7hC3UK3qCpuF6REPS19NZY4WXNTx8g4EyFiHN30O29ScQh2
         S9/gl7bAEJeo0xcF9r+iiFTJH611M01stKUv8fdLLyEXjwI7MAQ1ud4CeWHLnQYfNX/A
         mOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334806; x=1776939606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEAsEf/mEHAEKtROzGpkn9Ajx/ckmkSc552LIlFmuOg=;
        b=EwKJKzrJcSwzGxtT9BgRKDjZR/hN4/SMfSxcxB/rJDRJHFDrq/6MJMR/zgONZHY7gn
         P8oTtA2tsDfAcfETpVauREAr3oWzGFQg5HIGG4C0940i60tuuktf0nxXyqb4X7r95l39
         Q+L2sq1rDUwRSieOrOLzXsdIQMOnMc7oWn+tTZ8mFRLyHcZVknOJORUWhvwjMXjtNCI+
         0H21MI0c7Gjl2wkqj0wsWH+qtgg3FypZHKtI24lCmmNxKs8mCzddXiYEGHeT4I1SRLRV
         XBYc7n0doE8GKeyimMc56d6QkGqsH6QUYWr70CDVY/Y3Hg9DUdnyjXz4QBgq4bQUhdN/
         rAjA==
X-Forwarded-Encrypted: i=1; AFNElJ8V15bTHYO3uNsK9Rjn5ZOzVFqqMPF7Vvdq20ITWQvmjcOd75jxGhoKb45qIYbe6zI/fUFxbk/mBRV2fC5i@vger.kernel.org
X-Gm-Message-State: AOJu0YymOVxWwbhjHIAkSdng6HIyJ8KIs/2TkT1+wSrO5LiF4CqHjEOo
	SFT2//+hSFqLHPA8MFqPhDFO2porSoCtVvTYcPRXJrXTGk4CADoqLeO8+h+yeO9H55XbYzLw6QM
	RHX972nhkbqXkQsTO3UfmVM0fa/lTf3qFu1MBWqZ7KmOacXKtP4zMPVPPR/nOxpRiqWm0
X-Gm-Gg: AeBDievdXonWil2Qs37MWzFDf15sah8MsK+yfZi9IWWbiU5Sw2nF51EgLKgrX9ceNhJ
	+CGCErdCYTOdWgddtSAludPLXlpsJHxjZmZ76Dpt6Df16w00blNC7N2kRGN/EHNk6VCQOZu0NLK
	4Y7XGoIVmvAlAyjTySXJUHDzx/tRBxOhGpCAbyc/7HUyXOA1DL1LkS5tMQt6uDMkElsu/Zlckmc
	4Y/HurNNE/0XrHtuYaTCrcw2/xzsKwlvYWuSf/iuotBG17CPXzgpAC6yVVfRidc0YbIc69ZUb6e
	8Rz/GP6ovnIonHTLEcDHhfWQfcBbh5w6vVTmRpSrvnSKyS0DS/M4MMTQXmq+m8SV71lf947rRkK
	pA093ObLsTbi0FdRudSYNOm7zlWPlSiHumzZPH2S7m0KMhGcp61BT4K7JrC2PxtlyGUxhYG5I+L
	73TAqgLEXZKUVWTA==
X-Received: by 2002:ac8:5a55:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50e2913a2f2mr14490991cf.7.1776334805969;
        Thu, 16 Apr 2026 03:20:05 -0700 (PDT)
X-Received: by 2002:ac8:5a55:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50e2913a2f2mr14490761cf.7.1776334805541;
        Thu, 16 Apr 2026 03:20:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c2013sm147935866b.34.2026.04.16.03.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:20:04 -0700 (PDT)
Message-ID: <d50ae707-7382-4d9f-ac07-38cd9ac13293@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 12:20:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add IMEM node
To: Alexander Koskovich <akoskovich@pm.me>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
 <20260416-eliza-imem-v2-3-fb7a71123451@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-eliza-imem-v2-3-fb7a71123451@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vQBj3vLzj7nFoUESlr9bYmZmmwaEBCxN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5NyBTYWx0ZWRfXyfIXvfEK8b6x
 ef88Q4yHBb9FdDuYBu5nUCjQNl2heFdXkdbDKtSqyXtmPLx+WV0fzrj57tONbGUph0hoP5TbT0L
 kLlMRI+0N7dPbRMf3FOHxKfHiTzPA5svorCgyowKP7356IOHoB99btpNNxQ5zT/jruiH2oC5hCZ
 GRUIB0rtdo7eD1JM0QknIGyS6VEVZAQSViNmVnged3i5H7e5fPQVk3IJcitqdPd6adwQukLH8wN
 SQhybW7Bj4LQ0xcr6anxzoli2jxbxgySt9bASxWv9ANAC/6BFWGIKETMOgGF+QPVKOOlghwqBYj
 mLKcPNNPtrhRlMgSC14A1Mgp2WsSfD2JBaQuX9I4vqWS8oBM3G/kgA98JwO+YsChkDcrCl8hnhj
 /lm+emcijTIcBKPWkkb/aHlAS65qxw44Pt9R+fSq1Uz0lK68KhaQMuBDN47cg9UTT1YO4byyTKm
 AFjWEtAVIiJ4a1861eQ==
X-Authority-Analysis: v=2.4 cv=Iby3n2qa c=1 sm=1 tr=0 ts=69e0b7d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6ofop3_kVoDNpCCVtgYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: vQBj3vLzj7nFoUESlr9bYmZmmwaEBCxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.223.255.192:email,94c:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,pm.me:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103371-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E1A340CDA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 11:40 AM, Alexander Koskovich wrote:
> Add a node for the IMEM found on Eliza, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index 6fa5679c1a62..551df07e44c6 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -1029,6 +1029,26 @@ qup_uart14_default: qup-uart14-default-state {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,eliza-imem", "mmio-sram";
> +			reg = <0x0 0x14680000 0x0 0x2c000>;
> +			ranges = <0x0 0x0 0x14680000 0x2c000>;
> +
> +			no-memory-wc;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pilreloc-sram@94c {

Since the node below has more than one dash, I'd expect this name
not to be squished too

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

