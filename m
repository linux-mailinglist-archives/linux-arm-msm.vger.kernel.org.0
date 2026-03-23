Return-Path: <linux-arm-msm+bounces-99206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJDGKecdwWmTQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:03:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B97FE2F0C37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26D843031454
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF3A390CA2;
	Mon, 23 Mar 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INiS6Jpb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdkNg5J9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111636E473
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263077; cv=none; b=lbGNVD0FBni7nEY+QEyT0r/Ub/4RYdShtvS08zHo3DuShRq39X32DbBX6mLxU8tRxbk+r2l3O/n7Sa/TO7XH+Toq1xRrq4YPB6jpyobZSGzZjNczW5C1Kb3XZTg5dNPgGxmDQHQgK+Aa5emUmmCTUSOs6W0IowWf4MTrJ0MUz+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263077; c=relaxed/simple;
	bh=WetkROzsCjHpZW29EE7hjoK851wNICws5WgeWcD5Q+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dL5dPo/YKVMgaRQBKeA8j5XXXtSWQD0igEIBzixQd5lglR8VSGRxN3M4wWJA5aBqZtS9p0SqIfoXznpe8HOpGjZUa2AdiIzPtN9B3KzB4tRMYkedITRvoZ8ugtTaivo8T+pQtlcq+2ZsstGVwsLYODt4OgfmtS8qFJ8WmlRztIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INiS6Jpb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdkNg5J9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9uGYh745170
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvVAGvQ8HRCve2hdxj2jFpuQ0wBfMspeRR4KB+mva4w=; b=INiS6Jpb21ZJDnxE
	4HuYuZj91w75Gwq7tLzdpN+MWixjGblUjMhSms2Gt1ac8wWXpBvVkZQZLah1PuiW
	LCUKIru0YGIrgIWQhIj1NTlsaD15aOpJszlbtwiRjfYgPMi9TCa3ourj3xMZbN/D
	2I740LZay/0JA/2EghXmpC1O7nc8xEixmoREHQNIA/JZLgsZtlIuaUl0OCSU8hKT
	Oc1uB5Di8UQigDSRxwkidKFu3e1YZNeU0DXY84q0v0y7/qYUoSPp6ivy5ayQxV1E
	bSZx0kdVu0Ed4ejcCkToCEGCFFoXwNuoJZTN8vADLtB6xkpVDmB+R51FDa2YKibe
	lISv5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5n3uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:51:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b68af943eso1314001cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263075; x=1774867875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nvVAGvQ8HRCve2hdxj2jFpuQ0wBfMspeRR4KB+mva4w=;
        b=hdkNg5J9XjgWs6vByw1nG/82gBsdNEoljrNeu1m9nf4JfVRVfz7iLgTjOuqJp3zBnx
         jTDE+ZGIxaNx5BWOsHbQxGjQmC6/ud+FVz4pUI9+sW+J5pSWSs/HpuYFRGG5kyhUMj4b
         YF+c8iLrozfd/0JmyHcd6F8SeQTgH2x5wiU4FKKHsD07NSVGALzRpViZgED3yWeUDW7b
         u6tZIrjXeTXXkSGR+tx6X2hSNXsQjcmgIHeRnRk/ovP4P7/Eq/cGDxnxCGm+XfozVzas
         h2L3kihj7WHwy9ydm2n6K0Ye18hDYXnYe6iq6SwiGzZaqMri2ri4OqqLLlXNKVcJ4XO7
         WEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263075; x=1774867875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvVAGvQ8HRCve2hdxj2jFpuQ0wBfMspeRR4KB+mva4w=;
        b=rT+argtNsLuk4gJT8GH7ZLPySOp67FwNWCsFplsIuJtcpRl19ShkjQLBK1FAiDwlwY
         b0bYGQRAjghY6JybDhO9+lUEh+CFOoNDFK9Byv2RSD9lq+fwrYoiQKJOSb1XM6VH9TZw
         AnNKSFgi7okjpuAjF2h70hyagi/65ZaAPlnxUeIcH2jKPtrCl1lLTSaWXT1zPfOUS6Sw
         31OmFrH1ulR/uymoURVo+CWWa0vyRyLxSE8NUKfYeCiVpEHcLvk4p+vSSM+R7wHDiXew
         XOGUOiw07UPcB9GvIbY3zPJW5zfcxufdzov/P8NJ494gO1hfPVW5ksBdZbnxXh+T1e/U
         R3DA==
X-Forwarded-Encrypted: i=1; AJvYcCXZEWoWjZHHK5zPZ3rgB8jfCZSN6lpOpMTezpjCMMvHX/rHnkVpODWN/A3aHO51ZTiKJUyYxiaNSxDz7Q4t@vger.kernel.org
X-Gm-Message-State: AOJu0YyvG/ZeZygwJCfne9WPqCfF0vLf0uwSvrB6PE+u/xDX1Liqz21u
	kHOWRuGDgkN9k1JjYjCWVMwBRfitZCzQIMjfrq2mjT/nKsX0WYWLLnoKn6IsjY9GwS6fzLBNo1C
	I6iO6bsNo+a3eDjAw0x+k4JKIqdUakUavYWzFahcqn4e5Xza9LdKDNu4NhfdGSr2t2uPB
X-Gm-Gg: ATEYQzzacxYr0q/adHKOi1nagIVfE4mR4YVCHFpxE+VwP4dkJ9RFlhwRWke7pnc3t2v
	H1HduMrcySPlQdX63PQcwdRJBexUKpumqWzOA2rMJVw91NI0tHVOgGJA6HnD1PefSC6oGZnBtlj
	ZJyo8Cvd8V7EO3bqzPIxrZor+Lr0c88Zloz0NHV9SUY+OLw0r1iud8jx1vRCR9t7RF4XVmt99yA
	cAPofQc7VkF2lnGq5auPnVBKeD1othQiAbIRbHOI/cEzfCNjqNBNPq8xICYN7MkFhyrA1kkks+Z
	8UK0YtKUVMBWAa1KSLzCCYASYD8p59oDeOBy+qwmjMTHUYRiqzyF/HV3nf1YgaRTz6oVd3Q8Hnw
	fJFVret/ziLsS/HuIKvOvslUjivYDbmWMkueCBN2e37ZZwDzYz8o+XjNG/ZF8m3YnXd13esFJ8/
	x80vc=
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr44693861cf.9.1774263074646;
        Mon, 23 Mar 2026 03:51:14 -0700 (PDT)
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr44693741cf.9.1774263074179;
        Mon, 23 Mar 2026 03:51:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de182sm472066666b.38.2026.03.23.03.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:51:13 -0700 (PDT)
Message-ID: <f32a09b3-6d9a-4bdc-aff1-0097531b4f48@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:51:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c11b23 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nub5c3HCzl6ex5IZEPsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pbxnBOXfKV6J7JsGkjE6cq-UHACRY5S7
X-Proofpoint-ORIG-GUID: pbxnBOXfKV6J7JsGkjE6cq-UHACRY5S7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfXwUibIGM+BS6y
 D5l9DyAvtkzxOntEzmGZ+AyUTVTYFctjD4qRMIN6AYtDm6rYNhc7cFl9v950dvh0SDCDk24UtOF
 Z7S5h1Gt38whW9+J+ZzHdFPVfDKp6Xl6mv5vyOIZ4KX3/7Zikj2RcPj7QtFozwck/QXaGU97HUN
 kuJGaHPDo44tb0/WXFAQKXQMrJ4oUM9HRAmqBjFrucc//TfJhB/lM3un8ECnkuWAk2puQxxd8XH
 j/JBfTtz86aJcigf/yhEAf8Ulbuyq5Z0gIQIbQHxYUn4S59nJTNzYHil/YmSLnfP5PNVZQ0s3Ls
 BDE7xXcvUgSgQsQ50YL2kbpfixGaDtJPjfC/aDNYiJUi/ry77Oe/VkZojmMJM1IExTzsvTXwCKf
 T6GZjT5Aj9pcLvm2RKYW20SCCi3O0p4TmL4aQP+DPVi/ldEdPEYAKiYr3fWJfXym13KFENFHmyf
 1rUlLaWWNVB9ZU/ug7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-99206-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,1d84000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B97FE2F0C37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/22/26 5:08 PM, Abel Vesa wrote:
> The UFS MCQ mode is currently not functional in the driver. Eliza is
> the first platform enabling it, which results in UFS failures at runtime
> with errors such as:
> 
>   ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
>   ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00
> 
> The failures occur when accessing the UFS device, while the controller
> and PHY initialize correctly.
> 
> Disable MCQ mode by removing the corresponding register range. This can
> be reverted once MCQ support is fixed in the driver.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

+Mani any idea?

Konrad

>  arch/arm64/boot/dts/qcom/eliza.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index fab603cd8e42..60a3c861a5c0 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -743,10 +743,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,eliza-ufshc",
>  				     "qcom,ufshc",
>  				     "jedec,ufs-2.0";
> -			reg = <0x0 0x01d84000 0x0 0x3000>,
> -			      <0x0 0x01da0000 0x0 0x15000>;
> -			reg-names = "std",
> -				    "mcq";
> +			reg = <0x0 0x01d84000 0x0 0x3000>;
> +			reg-names = "std";
>  
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>  
> 

