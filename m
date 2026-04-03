Return-Path: <linux-arm-msm+bounces-101698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCn+Ci7zz2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:04:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5CD396BD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BA843055E50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0498331691A;
	Fri,  3 Apr 2026 17:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrYh9aAP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wkaz9Hmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A972B3CF031
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235731; cv=none; b=o4eb4jjuUqjZVoHi3zGhZNgDFU8X3nYURqy9Yz5O+JLw2K2TB/NcNUtHTwWutT315UtFVzFl5M66RxsKzgfSStrZJiq23wM9PdD8270QUYkd3JCfCGIKOhn9mZLCVZyRl6w2S5OX2BP5de5oC74EDwm8Yu+826nB3Q9Yr7Lb9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235731; c=relaxed/simple;
	bh=QiLY+xxac/YWjtxxUGACk94lTSCH8UUN52DiOquCS2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqqv3LRlPnL8LFUH/PdGY+UKjVoPf2bwtuWKvhRwS76sHETjLdQEjobt/Wu0xCZrrg7EBdUflA7WJ0Utn6boJZd7zzYQ2ShzQ4/hijG1gJB6ipo0ngN681kyevCCr1AKRPU60ZQuvkoARYzJQFvr0FBEmxMW5pPltTwSB0fp2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrYh9aAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wkaz9Hmf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1dfL1453174
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 17:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awOCeH+YVJIXJ4ufb2mnxlNn72BnJEWkkGCu4Oy4aWs=; b=IrYh9aAPvinVM8i8
	fFsY3Hdvbv3/tqz6BB5kOBT9n9UHBOsL44z1ncYO7GDMveuJhd0LwgvJ19rQvshX
	Uwy2eYRhnoRwn6WxrgM+gcBxwsxZTXO7RZvtAi9IbMVbArAjEGX/oD399fe/ugWB
	tZcMM0RzCyTJqBOt6/S71o+u1J2u3WCmPua6TUtvdiMCMhDdkoCJ6TF41HVJwa10
	7yHGYXi0Hi0DkGzzUp7QvRZnybw+wbRjrGkqNOf8/Cyo1IFUqWdjkV6IuO9khaoI
	F8oHvGRnRe0sOR2ZVhkAy0vSkOhvVUFr3CD/sp/9O4mswkxJznAp4enijmpneDIP
	tiCBWg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam900g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 17:02:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c741f038f7cso1075474a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775235729; x=1775840529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awOCeH+YVJIXJ4ufb2mnxlNn72BnJEWkkGCu4Oy4aWs=;
        b=Wkaz9Hmfbly50aSNxO8QQ5vFupGGDmZLGXp3bsYuoi6+oeIpdAr4Nmws++CtN/0gHx
         a5u4VvVa0Dt/pFEB4MlBf9wd5p/1LOftJ4Ur3ufo16ZnDky7gvBHgKqTv7p5rNObkblo
         ZFWmz4M1dziEetjPJoKYwem64pwRV9LLIsAmaOybIgIwIMyo5PBkTNd/XhVJDYyOxibg
         YO+Pv2xDJAs8aDiMBK/se7KijQfHVuQaWteyBA4RYNBXclo7MCEGfrqLh9AFv/mQwqR3
         9CtIrzr3VhzUNNldwMKIMaER93NoqJgjmqMt8DKgHTzxJNsmqNxjv28R1kmeB4QzDJX5
         FhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775235729; x=1775840529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awOCeH+YVJIXJ4ufb2mnxlNn72BnJEWkkGCu4Oy4aWs=;
        b=cWRDrZZtmyjGnmSalW0Y/vAzlhp/Dwg8kDYadKRxCLBsIYYLdjzsJFXbQ/uweevMne
         Ny3aQwhiEv5OyCkCewVj2NxSfmz/LwOcOunLqseVdweJl1vh/P+kqlH+oFJDwQyYNI9l
         eBgZcIL6WcDkxWNy/hGtXjeBnIq7zD6JILZ7uEkLJQ16M6M6H3k7nNbICJh8L6HrLafV
         b47QjPXXeeYZ+FTc18I6nMdnPGEv/nRvKWjzWE5KAWE7yJYkR6pXhwiWi780YU5V55do
         cexvZAihfYVkTy/zGdjPn4/fUbqre9UacHk2S3J3b6lrhrFx+xL+9tPokSN+68D43eWg
         cjHg==
X-Gm-Message-State: AOJu0Yx4gReb1vVQbZPixwS4Mbh/sBx7BP/N6lwyuZ+AXA46Cm7/LJg+
	cZoD0XjTsosssaHo/7rQJvdLKbiM3FrXLkVugbvNl+cZ+B0F5xjMRNsfyfTwkqhRKO+ZLswdLPv
	WWcR9N4kcGn1VHRbfvgwiCIibXkfsXDx9VVsYelz6NkhbI1QJPRRQjdevPoHDSfqm5NSb
X-Gm-Gg: ATEYQzxHZGL4mol60j2/2J8lkDgRYRgI1bi1+g3rvhCFHEtcn/Kd8doClT4LTS5A9La
	mIGeu02TfUgtrtBQ/XWbgR4PMW6N9NGRr+xhwIGtHC0BBjh/BHW9RV2VMvz14WusQilsgtdsmB3
	bFYWiY/azgLZ/Kmo09SDte5ahrVd1hO+zufHI+mpQaF3gr1OF+MdKY06fkngC/l6K2flBkDTXHp
	GEVp3C2XnlH1p9l5vcnajOJbzdAdQ/Tb1WZEHW5N1fUvkIyjGzIv9kDTG+rp226tlBvKPBQAwLZ
	mVyWuDKaGTtWYWFsoi4iHTzxTDxVMsJFDklNPD6lyF3zRWTZry/X6cOtagxoe9/S8RJFJDxKY3K
	kUje/e9OmT0TqDRLw3YToTXwADVtBglBszYJH1+Xxe4FUSRwkGho=
X-Received: by 2002:a05:6a20:3d23:b0:398:98f2:744b with SMTP id adf61e73a8af0-39f2f0cc6ecmr3431468637.56.1775235728441;
        Fri, 03 Apr 2026 10:02:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d23:b0:398:98f2:744b with SMTP id adf61e73a8af0-39f2f0cc6ecmr3431426637.56.1775235727815;
        Fri, 03 Apr 2026 10:02:07 -0700 (PDT)
Received: from [192.168.29.116] ([49.37.147.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a6b1esm5496843a12.32.2026.04.03.10.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 10:02:07 -0700 (PDT)
Message-ID: <48955ab8-4479-4f77-a926-ef325c7275fa@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 22:32:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8450: Fix ICE reg size
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
 <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ym3WCK0MzEwY__7zoPHec2WSG1GPQSjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1MiBTYWx0ZWRfX5ioIhpPflsPT
 olp/H765ORixYt1XaCmGIZXJePE4vsjqXsXQO1/sx7CFTrvt/hCqL53Qq8ArfTYU78a05ulPlzF
 U/1NB5tarC++5dqSspHZg0DOD6ku2SjvjPokJGbkUJjrHHoGOPvCHiyVrdYWrPStSP731yjBad/
 eF67mQhfvCb8ID5RNBweuwmfnVqfbqw8lvzkAWUyTr+gdvf5X8j4ORYRuAORg766HaGJmaozOUO
 cTswhusCmnWoseBeVXLC6s1GRZVvWcB7XSaonvIy2Gfi5z6easQkKZtjKAslWEwFP6+7EXsmGRn
 W+uecoCOCubUvb7GT9TEIkLjBPY+s4DFQuMliQPmtN/YoMY9kBNysSabwjyH5KYhNwrBvvxDguO
 4YybAI8m+sBqv5bPyiyfU8MrQrJLtR2EkySQjCAu63HLV6k4ktFqe0be4L9aMP810uVVDfh8NZU
 LDBeTnq3m7OGNuKHgtw==
X-Proofpoint-ORIG-GUID: ym3WCK0MzEwY__7zoPHec2WSG1GPQSjS
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69cff291 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=pj5RAjPJ5lVSI15MjsbsBQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vvlqyfryR4XdNjQMODcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030152
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d87000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101698-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B5CD396BD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/2026 12:05 AM, Kuldeep Singh wrote:
> The ICE register region size was originally described incorrectly when
> the ICE hardware was first introduced. The same value was later carried
> over unchanged when the ICE node was split out from the UFS node into
> its own DT entry.
> 
> Correct the register size to match the hardware specification.
> 
> Fixes: 276ee34a40c1 ("arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 920a2d1c04d0..3984d6f8932d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -5373,7 +5373,7 @@ ufs_mem_phy: phy@1d87000 {
>  		ice: crypto@1d88000 {
>  			compatible = "qcom,sm8450-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
> -			reg = <0 0x01d88000 0 0x8000>;
> +			reg = <0 0x01d88000 0 0x18000>;
>  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>  		};
>  
> 

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

