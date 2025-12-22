Return-Path: <linux-arm-msm+bounces-86181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B09ECD552C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38CFB3008D70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7A131079B;
	Mon, 22 Dec 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CC8OcIe/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejeg0sNk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C6730AD02
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395752; cv=none; b=mymlTCktYuCOBLJwsTDhr8JHfgP/WejFeXqt66L6E40HdIio6jkP+cbImTxA00/2KV2lPUpS6HVBVqBm+ZwHtnROuEVAzmioqdncWQBsNMS0MGVRniyjg4E5AroEPw9D2ARpKzBRYIE+Gm+IXpEzWjZm1CGB6U6bbeFqg2s+790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395752; c=relaxed/simple;
	bh=TTbyAUX46eVxv/TLQ2Gev8TLZhOiaZlPocsSc0WpOaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpWy1wsInl8rMlm+PPtuLK4DRXGjLaTocyskaeXO5YnbcNKMvVQ/2YkN2NyqFywYM5Fnnx2Jq9+zcVdUFKBHvqUKqN4Ye+H1ozHyfuYzAePpoheNBY7i8MfeayDY1Jct8cjVsLoZPH2VXYGVBUif4MCiQS3WNEZNGO95upwKZ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CC8OcIe/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejeg0sNk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8Jf3A204326
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/HKOtVoIv512INV2o3xK4Mpp
	F5CVLf2Qs0cmzl3CXhA=; b=CC8OcIe/eBFs0D9yPL8Ar+IdX67S6PCJNDs0rMYV
	2kRQiEovNkSYuFNdK4ox0PoGYY1t/JN3pUVKLRc1BYYChJ7221OWw0mHpYVzYAzE
	Jh9f7/d8byyrA+YYCzxqM/3ZKIjcCKsMcxnSFgVUvl8seYJfTHvzD/qrLbi8H1/i
	bnfcrd3DiIvuuxg9VUkoeLZoPkeGsS+1Z7y9WjHFQ8ladJANYx3/SxplvDKfbgXY
	nvT1sBz1J6HYWH4hnYooVbeEBdz1HHqT8664gxUsRusYFCz7eqTDAtMOug8uBw/z
	JU+KNt4OnHSim9r29MrdFlh5WEm8Vmvj1PsaOednyUJDpg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mracfqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:29:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so91661701cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766395749; x=1767000549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HKOtVoIv512INV2o3xK4MppF5CVLf2Qs0cmzl3CXhA=;
        b=ejeg0sNkI2lu0tNDb7RC4HBAVtjH5mc4cjWGi4M2PywL2ubLLTkK88IBpYxDroyOqW
         YtH2CPpOfhebA6pnqhvKVvDannawvvmN+E927clgM4JIr9Igdx2zZoc13htn/jpfcdCB
         96SZ3mZ64jSwYxmITxqgVQUvi2bHLmAqeKf3zwWgiZmBiiyKZZ7eLngI9GS+eV3efZlE
         UAzEbCacYBDu5kJuXoFqSqZzuKFn9Ovscmek+c96pTWLU+XMU3MM9/DP6gn34SiJ+i1+
         c71gpewwvuh3JBgW77PQNc4PblxX3VI8+wPeMgKLRo/aUdtz/VEAsEOFoRNZRw6XXt0t
         wqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395749; x=1767000549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HKOtVoIv512INV2o3xK4MppF5CVLf2Qs0cmzl3CXhA=;
        b=ifI1o1axyEHDk1PM40j1QiIZ1OlBR2CgK0AulclpCOtTnF5Z23hRkxOXzPm7sRT2bi
         XxuUgJpnoUDJCxjU6pMr7JtTTufGhoDFyG5OnZBKzZwHfcFY6z4hn0pFFExK3foghOx2
         RtZW4/2WfBzYRfW/5TNv3ONXf+dD1aWqWo/ZJ9+p1z15+vFh4RSu4So6RGAGU2YTPUqq
         iKvxUJIVET1ZcaLbuRJ0DRsEH1ovhxWABWHoN16ed7tznLWxrQfcHnNLx6BfWcNafLms
         6DySB8+1W9Jm5XNLv6DrlTXY/VX7jRaHzfEdjsmNb8Z4nXdsGEvuj1EKExaS1yTZP6xm
         nFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxKlZFqlShXeuztFh3eDr+lCHHanURb9MKQnMfDpry6ZlVgEB3jA8PxWh7xPYY9RE61hfRxdd6VwyHbAEa@vger.kernel.org
X-Gm-Message-State: AOJu0YyW1q25PF7hqCwfKw840EXQBwrg63sj0p+Ljdd9aFy9zbzCxMFu
	kg+Ybk07mhPBRuRQZBRwVAVA0BuF25mfk/0hjp86OhZ8ANVP9sR5cyGtpQBEwsfcO9eyNoP/obo
	HObPUqTMYhKs9La+5sJQx0dSt23ewO8/HpCqbvobo617ZFHa4P8jRFZXLP2FB74znUJ44
X-Gm-Gg: AY/fxX5jdih5mq8mXLBA+SRXvD7HuPDR83YIjR3ssM9VfcPonkN9ywrBPqMjbAJTRNJ
	Jw7IxsQrjbIXwyh2ym32ls7blQqor9rGyhRNQCB9Qgi9La4AMkrnRlZB0QrJQQBWrVFv7k+HFqE
	sWY21k7V7UuTT1b1NQmIY9VJPXy0gQQtye3BhH+I2MtB+Ifl8iHE9u/JK2KhLNPN1EtmGwhOY0P
	6B7esVMtbPdrEUFrN5T9svP7cY7Ym71iZu7RYMhDhxvxuu9s6UREuF2EfIoIg6lSXyrGPIuT9wl
	XlcsKGQ5pnZhGPdiNDYQhc5NiMk11KvV3pcdS4YHVZf+9TTw6z9vDtl493qHOS43R1GZrtKNPZz
	JW9IUAkab1tK7D8B+tWee/LSCO25JL4By2UNltsLvKpvYvKS5dGlVWtk+15mjFqGcmp4Xky3SR5
	2mwmC7hcAtShnQhoFgAXTPSHg=
X-Received: by 2002:a05:622a:1f1b:b0:4ee:1920:2b1c with SMTP id d75a77b69052e-4f4abcce8cfmr159380901cf.2.1766395749244;
        Mon, 22 Dec 2025 01:29:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwSlYOymNGy0LLuxJ1FptuNgkHLS+Be3MfFgWzX6IAexjMV23f+6YZgHpqSQNwf/zv07YI/Q==
X-Received: by 2002:a05:622a:1f1b:b0:4ee:1920:2b1c with SMTP id d75a77b69052e-4f4abcce8cfmr159380681cf.2.1766395748868;
        Mon, 22 Dec 2025 01:29:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812267a438sm26255481fa.41.2025.12.22.01.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 01:29:08 -0800 (PST)
Date: Mon, 22 Dec 2025 11:29:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add QCrypto node
Message-ID: <sbfaknkaha6hb7wl5vceyswkdz4ptsay3aw3evwcgjtfpto7am@v5ezpvy2xuj6>
References: <20251222-enable-qualcomm-crypto-engine-for-monaco-v1-1-06741d6ea66a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-enable-qualcomm-crypto-engine-for-monaco-v1-1-06741d6ea66a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4xKRUzU9AvWOWsOItYwaRDMLdih-_OdR
X-Proofpoint-GUID: 4xKRUzU9AvWOWsOItYwaRDMLdih-_OdR
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=69490f65 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_OpZ_5cEmvcoVn8VV1UA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NSBTYWx0ZWRfX0ycUSd3wyzD/
 lWsnIm+lv3Uw7/hHm7Yk5A3Pk4ozogfsZtMPXLIN1hjrtHnvgVnIWWmZF0z+LeNCf+FK8rRjIL3
 8O3wMLgcPjO0Vvqwe7MMVloX5s/vn/ZMWCjf8NwG1VnakzltAIldbwIes1B8JpVd8/sHqNN8OEf
 GlqtjJM6HeOZGme6182jtgIdvx2CpJc5Sh6rkgIr6vtutoc/ymNQSIsA0+RuL2+qxJmR8RaKmq6
 bWZ85mjTEMvAPewwF8xfQoLA/NsbHmnnnQ6KbqR2e2YzaJUhB8F1oh/diIG3ipkxxOtKwwlh6wA
 1cypenr3JoqtzS7/2AkyFrTLuc4g5D9Xxht8slIwr6uHEn8ie2+CjdzSBgaxCPi6sKl2zbrNYMq
 A6pTefKXVSEkkmt3pI/PrYOimXXngc8ktI7xwRg6x+4u97l24FLKk1pVA01jCMGQzGEEAZShQwY
 DOFDlV2xcG8D/5np/kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220085

On Mon, Dec 22, 2025 at 01:00:19PM +0530, Abhinaba Rakshit wrote:
> Add Qualcomm Crypto Engine device node for Monaco platform.
> Bindings and Crypto DMA nodes for the same platform is already
> present in the tree.
> 
> QCE and Crypto DMA nodes patch was applied as part of the
> commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
> however was reverted due to compatible string being miss-matched
> against schema.
> 
> Resubmitting the enablement of QCE device node for monaco platform
> with compatible-string being aligned with qcom-qce schema.

This part will not make any sense in the commit message, once the
patch gets applied.

Please put it under the three dashes at the end of the commit message,
after the SoB (or into the b4's cover letter, it will also be properly
included here). Or, better, rephrase it in a way that makes sense for
the applied patch.

> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

With the commit message fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

