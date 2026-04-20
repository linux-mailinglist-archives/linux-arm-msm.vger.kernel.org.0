Return-Path: <linux-arm-msm+bounces-103737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB/1A88E5mkJqgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:49:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1660842997F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F94D3019FD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3135539B974;
	Mon, 20 Apr 2026 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeQLZ/Oy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tf9DFPjw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB60B386444
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681862; cv=none; b=ofjpBD+DGjKOkfCbolda32JeNq4Cuaez/ub8OwZWyuDmVOkJCGaIzivhSv5xbLqlzG8rCXagK6eSgubkG+cDph5aPORmB4pgNsfHqOX83c8hP/tO0wT74t4sVDdnUxrXXPlJRcnD6g3rnR9JcloyXc8BbNDRTmMjG+9HX3M0MUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681862; c=relaxed/simple;
	bh=+gtalVYpxoENTEE6SD9egGDXV7+Bv1cF4WTpXQvJsoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsNc4WXDTbKBJcJ5kvQ18P1hCSJ5naYve3LVxI4/VWV3fA8JgixgLLadT4yX5CnAYYgrRAb6E7UJhNP3X9fPFeDSxj2TE4+Px2Q2qDUxg9L2dOexbRqr9WmiRVkfxpSEWORK+0zyAxNd05QsURd50lxT2OjcEJrfqD1Q1wYPOXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeQLZ/Oy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tf9DFPjw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97R9m084489
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79QRQYycZQNH3IttWiKNV6WjVrVM0kDMoHd4OWy5lgQ=; b=WeQLZ/Oy+9YqciqT
	PHHRFYVjhJBFG4dG9UN0zRY9pEzE0iAd+DrozzmTBPVQlRari/wuIznHJvgS+TZP
	F6+E8Kz6Sv7lpoCZabWKipY3QwFNVOi2DOQnHlmtJB6Jjn74fVWXmgi+80u/ncJO
	epAOVkASLPCwkP3WlUpJa3Zl9Oqm+V6luIkZUCDZ1QIY7r9EtSSiaxPKfSZzVr27
	uzQC7NMlY2dznGufix+JL/x00OmZQTJgC2AmalFnIG5gcZCExv8yeA3gqiiEXyXJ
	L4Rv/nGmBsr5dk4PTM38Vr+qJ+At0oem/re8I2D2QRX5Ft9m++QN+1585N2G2LmJ
	fXd56Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81gbe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:44:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso5648426a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776681858; x=1777286658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79QRQYycZQNH3IttWiKNV6WjVrVM0kDMoHd4OWy5lgQ=;
        b=Tf9DFPjwdV+diJf7gYR3mtPQKIZgCc50tKVBVYc/wnV9QXERu28dOY5VSHq1ub+4MK
         6p9zQzWmZU0djxPTbNSXiHD+8ehDFWt0IWsrMHjr2kMdSKB4lH1RQWjJNV6t+ujKIJ34
         8fscS0/3fogLiF54oHJVfAze42oEuI817qfrKsPam7SnqU6GV9cXQ8sgJX5hdiWFjtSi
         mOW17RQP96wbpFtPglw9AdrYjqVOWpHB39fcr3zUdX45vNQoMDaZy8fvjgFdQxIfMBO9
         ATy/5O4Da8Xja9gzonCc9AVdoT8o+xo2FtuLBerqEXAkLnG7L7lG5NWjclEhFvei4c4W
         uTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681858; x=1777286658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79QRQYycZQNH3IttWiKNV6WjVrVM0kDMoHd4OWy5lgQ=;
        b=bC0T0Z5PYDJu3n+Cup7pPnYHW55whPlm0+R0txIE9L6TLt1esJV7Uo+8xOFSTVK3lO
         37B5WYAppMpKKl0DhCQfiKL/EYYb1RCLUNz5eEN8Gmdkz2cHpwEjd5hka/MhCB8k+Cbl
         U8Qz8KzzmYumXWOKhKQJR+XDXlbnlLaVaNK+Jaa7WMlxnZIYiYHPmLRMFHbbUOAgQFhL
         KgQhlu2/diEsHH9kcjweMLY1+UAgdLvYTzYIiF14tEi6fCodwi/dsZxai0S03MmBWDl+
         mUKpSdbdLAxWpc1KLCbco06hKh4Kzi9hpLEoKLbsAeQzs20em3pl1f6GBbeqIBFWSbuy
         bDQw==
X-Gm-Message-State: AOJu0Yy/bWNUZwA9PbgLx8mQcBiYc7wxLExafMWnicct7qhwsHWNSG70
	57AB8wGhWug4l1AmrDCq96B/bbIGKImyF1BalagUq4eNXrpMvApWtiT46wyXEN3O3O4TCOYC2Wm
	2evnRkJ4+4Mq9kToH7jyYvJ5XpD8EbTrUIPRi9DlGQSgBMVs4dIhwYUD6rLuKQwCgWYnu
X-Gm-Gg: AeBDietmLmuB0/gScGvWVZ1WxckON3G3QsWel3EgaQqa0a38xWIF8ltEKyafU14y12c
	ELo7eneVa15jtGJHOxEeUZnt304kXxAuDqfl5T488S3H8Z8fZmh8+PKjUniScC/Seg8Cf63zgH+
	92Ixrv2UMTRwONA8yTMQwhzcIoItXtBW7Z3aSMn6fh0FwNURxEPjbK+lyo0A/UUoYVChxABE/F+
	pT00q+j0nKLOwqM8hByLbkSxIkh3aYzZ1o4V4FPfFoIghcCnQPvzuF3zaR4214KfSlLEnjGBVJT
	BM9GUGFbhIQjOebros4Nt+PUjpoD26IfuudJMopC9f7Phz1TiC7dcNGt6/UX2pr+666qMvhqbcQ
	IA+NX4E5yhDcMhTDs7KncuVnXA8aUWnHdgQjZK6UPg9t/28s5J28745rGib4X
X-Received: by 2002:a05:6a20:3943:b0:39f:82eb:88b6 with SMTP id adf61e73a8af0-3a08d283713mr14655095637.0.1776681858455;
        Mon, 20 Apr 2026 03:44:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:3943:b0:39f:82eb:88b6 with SMTP id adf61e73a8af0-3a08d283713mr14655067637.0.1776681858028;
        Mon, 20 Apr 2026 03:44:18 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797704c332sm7619414a12.30.2026.04.20.03.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:44:17 -0700 (PDT)
Message-ID: <e93efcbd-42e1-4f1b-a5cf-c6dc500db63b@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 16:14:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm630: set adsp compute-cbs'
 regs properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
 <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-2-f6c7ab3c889a@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-2-f6c7ab3c889a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwNCBTYWx0ZWRfX6mKZ9lEMuVHo
 ldbbRz8j0eTUHPBzcMEOoDSzZyL2El7QezSYyOXbbf5dPU23SiUWjSK/C+LeZanvZ24Ua03vw4W
 gfsKqAzw8rlLjXRqUOcOsVdXQ7UXW0KKKKi3gl0sJq4EWUUdGnB5W5oGk63raXNxNMSU9a1Yh6R
 t44Al+cw6HaDraRZcgdc4LUrPpOg/9Vl50168cgyVoJxnES17sI1layygXgXZgYzYFXrLmhUh00
 2bm6YdN1u8OM5aLWwYmxr+AY5UZQNz1zzBFbNzEJktJmj9LVtEGT/bZM3PG3UagreCmyaHmHV8e
 i3+YOnWEtbwkOoNsTxA4o1F7P9R77hyWf3Hq204I4b/mHL2Fj2b4XBaRkGCB0OUSWTBpYpkt42O
 uBPXdx35+Bwn8n20sLTObG6JTUuWPhB+kPh8Ise79C9yDHcLPosCOPE43ve9sjzXkP5UPRYzT2V
 hO0Y590noz7uCiR0Sfw==
X-Proofpoint-GUID: fGIT24iYU7ow6gK0SQJBwgjm8Yqz8H78
X-Proofpoint-ORIG-GUID: fGIT24iYU7ow6gK0SQJBwgjm8Yqz8H78
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e60383 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=9x20Oci4SAq0NeVlzk0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103737-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1660842997F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20-04-2026 15:12, Nickolay Goppen wrote:
> Changing FastRPC compute-cbs' reg values to matching iommu streams
> solves SMMU translation errors when trying to use FastRPC on ADSP
> so change FastRPC compute-cbs' reg values that way
> 
> Fixes: af2ce7296643 ("arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index bef3213165d6..4b47efdb57b2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2459,27 +2459,27 @@ fastrpc {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> -					compute-cb@1 {
> +					compute-cb@3 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <1>;
> +						reg = <3>;
>  						iommus = <&lpass_smmu 3>;
>  					};
>  
> -					compute-cb@2 {
> +					compute-cb@7 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <2>;
> +						reg = <7>;
>  						iommus = <&lpass_smmu 7>;
>  					};
>  
> -					compute-cb@3 {
> +					compute-cb@8 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <3>;
> +						reg = <8>;
>  						iommus = <&lpass_smmu 8>;
>  					};
>  
> -					compute-cb@4 {
> +					compute-cb@9 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <4>;
> +						reg = <9>;
>  						iommus = <&lpass_smmu 9>;
>  					};
>  				};
> 
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

