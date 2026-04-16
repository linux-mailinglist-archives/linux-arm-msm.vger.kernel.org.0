Return-Path: <linux-arm-msm+bounces-103409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNIgM1LX4GlymgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:34:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D142040E471
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB5CF301F276
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C893B8BCC;
	Thu, 16 Apr 2026 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTZM4pfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnRJqnSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F93890E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342816; cv=none; b=n5MwMQOVc/IffswCCOTDHKMD5fkv+zD1lIcVi0c4UhlWle1HWbb0SFCFngebrPxY2rkfnt8tCrGvZVrA3UBOzBJ0JceayBrmqzmLSeUmU+UNvESRS27PFn/n0bEwncpLYvd4cXuCG4XZQbk+v0A/WX0MgO6y1A59GEQDp3GfTIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342816; c=relaxed/simple;
	bh=WPSs3cMf16X5/TvEN56VuiGb0TDRAm1CjS6Ltw/i7eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/Q5N/srAvDfuRW2lXJtcCQxU5lx2KaDLxvAkDCq/BYmTVx43VF/2BedNeq4ddNjTCkiwy6wqxMqUK25Kz+iQkAGKRBHxhzFL/5A+N4cY1IPbuIASPzXnn/gnaMad930AJ09yd2yRBF2Xu6dCMaHEFqdREHR98mfq7SrsOgG7vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTZM4pfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnRJqnSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8CTwj2576005
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csr7RGPlrUusrxVMW9J1fA3qg5w8Sk/3ed0IXgH2GWM=; b=dTZM4pfO4ImZIYX/
	R3pmtLNgaUyevEUnCZap5wtSktjVG20Y0iougVL0TjUdbuW2ZVXevKhr8UaBGN3h
	WGcK2pMakvVxPnzN3tZlwgteV9ZxZmY/yjTy3Q1UCumCoa4jvafQW1KXG3M6032h
	oVDjdMTLaMtMtQgQ9/noG59HhAgg5zUjCH2JMljZIxcg9HqI1sjMYevMZ8Q3wJ04
	vOpw4nzafgZYVhtToxcpxF8l6NeP6HLKtm61vdDBA2n/rjHDk0jEJxD3+6Jf2Jyb
	rJkxJkbWqEHLePzDm++azzzEyHVsJxJ9pKSPvuCnJiZkkDkZE/5ggj2enPtLcpp7
	x5F/1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27gxdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:33:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50de490b092so6909091cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776342814; x=1776947614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csr7RGPlrUusrxVMW9J1fA3qg5w8Sk/3ed0IXgH2GWM=;
        b=fnRJqnSX4xup+vZjZG/OgtSJARkfggcTZ70MpCXtcgoxmIMxsAn09eny6V8MsQoQ4E
         4YeYRBrbQd/9U7dN67T5N8lTQ9MRGTxFYIUeaxHq/gR5SWQQebPuE6nu1dXwd0WkICzz
         uLh0Atr9plNK05fQDXcgH4iRKQuEusN646flK3yZQHi1PWxePoRgupWfY/K9ggZJ+1eL
         QHhvkSzlqxSKu3scs7AMAJu8kTfh7smzslCvYA5ND9flL0pVKeKC78C731oa2gIo0TtI
         A1mFTZ4MeAnxy7XRLHc8aiXY7/Sfq5nWA3ShWhtz+L95aRgFLqKLMHLBW2Mfx57JNqNA
         dN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342814; x=1776947614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csr7RGPlrUusrxVMW9J1fA3qg5w8Sk/3ed0IXgH2GWM=;
        b=MH+WnfQ1daQFai3wk693tr+Ofavc3HHLiHYdvSPiJqX3nHwBy5RQSG09j3f5Sx81zp
         9+9pZ973Q/eERp/FKLh1vzsEEBmGxBksgENDmXW4TCXXIMDnMUW7KIlRKgVfTJKJVoal
         737TTA9SNuLSkukj9D0opk27v9O0no21T4GjgssW3aQZYz0T85OMELJ8SN16HzIWQQL0
         QHdpE8WQBPtcurwN4snwdM7IZvA6noJWGEtHMr305TndcXZmvJNTOhNgaFudw4CcqYtT
         0EwKj33VLygtwK+wkfZYh/DoYxkIXlVnMV6jHiP40Es69N4oFvVRPHaMLBWdZhEXquDx
         X1tA==
X-Gm-Message-State: AOJu0YyYJ/qFT2cW9B1Rpw1Cgpu0wQ1/I6TjpcLMzIpOCb8XAfy8WDur
	cLe6763iog0j8onWoijR9bYqRhV+qU1soQvSF9m7k3/8yhatw6BkKLIPDmqjFHfrv22ubZO6Tk7
	pXEX7vpb4xWqVEbOFH0G3Cqnd7/NHYu+L6uo/zK7Auygq1NqloVfya9DeZXa/PkIfuCfSP+TYZC
	o2
X-Gm-Gg: AeBDieukZVB5p0TPIO4KqMdV8fZcxBPa5xXEbw9xOhTxafUT9BGNGujhBt/BuY6x1ja
	PSs3cqWdJIVuKFeL1cL5Tsq/w9Oq93xUwal0U2s+syMgw8js5DOne0fv0vxZFZpGY/LwerEurP9
	OvnDbSpk2wvi17qFgze1YvK9Eh7b0WpYs7IL1WZxvgQoiQ7uyIQi+ORDRDIEZtyYrck0Hgjh7tt
	xUPjCFi0fVFfm73+UwME4RzASZm6RycPSPAiUdnIK0NA09uthrtdRkyhahoQGKItQv2RaJF2dxA
	XfgSmECgpiZySRqWdshZq3cWZnsAPa7NQTaebmO0EqgAkA9bAQW7X4cXf3U+MTB8SDGUfw+5aqF
	kWBMjs7awIBSzKl2dpu1G9Pgeabzxyn4Ney9oEMjOgVMsjsh3mlS4rbMDeMUdIERzvPJ8LCsHBv
	YtPmtuhB5c/haW/g==
X-Received: by 2002:a05:622a:1145:b0:50b:2875:5782 with SMTP id d75a77b69052e-50e2911356emr19909281cf.6.1776342813618;
        Thu, 16 Apr 2026 05:33:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1145:b0:50b:2875:5782 with SMTP id d75a77b69052e-50e2911356emr19908881cf.6.1776342813209;
        Thu, 16 Apr 2026 05:33:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba24865492asm107031766b.24.2026.04.16.05.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:33:32 -0700 (PDT)
Message-ID: <28108ec6-2b06-4b63-8e41-fa75b7858acf@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 14:33:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
 <20260416-glymur_trng_enablement-v1-2-60abcfd45403@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_trng_enablement-v1-2-60abcfd45403@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0d71e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GutRjl6PLZtdpyDJDqIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ME8HbzqadrJ6Nd2sCe6JSLOl7xxt5HkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX//++cQAm8Cex
 77u4epqvGY9Ub5vh4xXe18fZPqMO021pIl3c9UFsc/gbKMVyAbeuSIbS9/PCJ0xFw1NaroOaRtF
 XIBbMtEgW9knkKAYF15i0GswWKzqjQucDSy5WxLjLMFCFgCyzL8pkiWqN5AsT4YLbK0aBpGYOxT
 Ucoi4t/TugN93bHkPQdk4RItbHKnzcYY77iqm6YQImJ8t/Ss8waT1+DncXrsxJ5Pm+58lYL19Ao
 TLQ6+S7p6E4nHXYwGqVcCaf+Ctqdj0n1lOAmBihgj0moYyOEuXESpYRQdHIXIS5hC7zhLprVaWg
 Gx1opokx9RdvMFsDdHo9GKrfyEoh/kU0QEYdR4dYDnJ3KRM5TEUoTNJ4AkHO6aUb0h2ORJE4lbC
 XiIony/KSuMeyD5Nh/vEkoS097Tri/PPSqyekWTmKlqYQGZALdvHnBqRVlFfY2RaLVQBfWQcBSo
 vzVgOWqIg8c982y9kkA==
X-Proofpoint-ORIG-GUID: ME8HbzqadrJ6Nd2sCe6JSLOl7xxt5HkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103409-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,10c3000:email,f10000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D142040E471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 2:26 PM, Harshal Dev wrote:
> Glymur has a True Random Number Generator, add the node with the correct
> compatible set.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c9d46ec82ccc 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>  			status = "disabled";
>  		};
>  
> +		rng: rng@10c3000 {
> +			compatible = "qcom,glymur-trng", "qcom,trng";
> +			reg = <0x0 0x10c3000 0x0 0x1000>;

Please pad the address part to 8 hex digits with leading zeroes

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

