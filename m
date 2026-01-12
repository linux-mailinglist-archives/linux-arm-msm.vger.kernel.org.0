Return-Path: <linux-arm-msm+bounces-88515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 624FED11F54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF0EE300B90B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E08F264609;
	Mon, 12 Jan 2026 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTqzfv/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZYtQ+qe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0903731AA9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214393; cv=none; b=q+QVyJbpm0uZys2kFhCd5kQa9fRV0n3O+QLY2U+t8DFg/tUImE+lJFLky5c8ZSyWfzfBYEmuHYm0V0OVWPlHwDP8hADZqv38nekDsiky0wbmztDUR0lYULYp56jDk676w3kuThtK0QmRKJye/N1f1LStcf1fCh1MQIQDcgZYM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214393; c=relaxed/simple;
	bh=SPJAGtGEK/wn7mFPBz7KJ/KdS5pMMKTA8tZdkPMoknk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwKVfL4LlrfUxoNC7UuPvYYZr1dPG/6KBXIzQUeLvAfM7NzCS5zc3SR4xGz6T8+nKgbykASAlEs4YzFcQ10RNQSiwAJM5OM39/9sjsu7PMtRwPiO8SEaeziGsB2Y+v9eMG6WNrwj/iszQlEBMGEw9Yz5F95aA1g4ZfYAnOHA0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTqzfv/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZYtQ+qe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C852Vo138153
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1Pcfs8LIWxYtndG8Wu8PCtxklxzAXaNdXIRBJQNvLg=; b=BTqzfv/UbYP9jl49
	zOBMYQ6xz2oTwLT7bv82WMz3KziI6pDlEqcyb+eL1yeAxngdFQgnKkPQHbr4anEL
	1Ps3ceGp1rms/hjtZELpuIsvw5Z85TRDafvBKACVwimpgJIjgAVCm6e7BJc4VNrE
	Ybml/Kp3PSmp51TUWn+6KrryRsz7S4CA+5PFd2bF/P0qtXElvxwCIYSC2HcIGkGk
	oh+Y+hpqbFsFiGa65QaMR6pDPwm5HmKqw/uZmy2djvX8f0Y9NQQexz2ZZFY1FjhZ
	fpLp0hYq/QDrEm74U0OU7CRyyDYvU4qsNqE5Qk4Vg+5pYHkZzC1vbEfkLVOSG2Ai
	BXD38g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kytn7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:39:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1be0fdfe1so210955685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214390; x=1768819190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/1Pcfs8LIWxYtndG8Wu8PCtxklxzAXaNdXIRBJQNvLg=;
        b=UZYtQ+qexm0NmqLGytbl+sl+43eclw5IV1X+a6JbGgIhIlUcl0TeWexTtdaVJPn+fk
         6zKlszcGeRSySSs7xS/CQPwNUF8ua28JJnsraTCK8LGYVh3YJK8I5yu35F/qufRsCnMD
         AYRxSR4khqyD4jvuBesS1QlVtAbuviVz6V9psxmxkHVI+7IKizYxiy2/jnLExBY30leg
         TWtBNbsCaOtIS/L+sF4+5pJ+NddrBlltrHyuqHFhGkNZUHjnVaRPY2EePvLD/pcc4COO
         auuySl6hcGzyeppU1L2m6lktCZyNr+FU8pz/oWgdmKd1DRtjkyLOiamV36tBvFS1UeX3
         gDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214390; x=1768819190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1Pcfs8LIWxYtndG8Wu8PCtxklxzAXaNdXIRBJQNvLg=;
        b=u57Q7RCclEET432bmWaplCqiM2atm+QCrjBMqX52a5NayQ5YZPwDIHKZIz5Gg2PaCh
         qpvW2JA+1fT+qQbLFtVlLvAZtz8xP75i4Xhx+eoIxLCSrDQR2IcHIh5zSnIMm+O/i+9H
         2587bBqafxKjnHTal3iwQufX86AtR9HJnT02uSznTV54q9yugt8+0p1zfvbhtUuLBV4o
         7/R5rFYNT/j7ddU/FG/Rb5p1Q7o7iangwSSFembrwEIzrP6okw3KyEaFCAclo8C6BB8D
         ydzhesS+hbGxS5oFVbnqVdsYozYJiIjMWqQLXDt09S++wwkVDZO7hmjfOGEk+P6YPwFt
         0jIw==
X-Gm-Message-State: AOJu0YwPcaGKEWUjPgZwUw0IlvrgmSdet2FBBl+8KpUugZMkog3fH5tV
	62BOb47eEFN4s2DB0LVCU544p58LS9gUlxldM3+q6cRQz3xcdwnASw5KpDHa5/LmXphbO3nNp1K
	rLKQi36sAyyf/g+YJAPA+mPU92zTZ69n0ir8u4StqoYzHRxds2tN++mTt6LchnP7+O4Rz
X-Gm-Gg: AY/fxX7/BoE8vPC37r5zEmDYBXCPMMpJmmWiJF0XojFu/DtfCwE4Apj/3Cv/ugUlHMi
	zdZAx7KszJ9LOa5aLDlzoCn2ylcxbmRXrq9me4tn5FEP9RMFmdn26goKkr4k0rm3D2rN6MG08ae
	0dLkDORZHCaWmgJO/IT6NUczgCBleFd4FQGSBhfm0dDMYhdp1h+XHUX/5KBvVoae9JryglXudpA
	k+2ij+vD9LOEeRCG6swhh+kQjCS03IOxw4RNP4N3onin2QsMCUth/oPCeSUxlT4A2yNE34+pk5P
	T1Q2JN2Z6YbFll+Czv2mQuNmdOz5lAOU5QCT/RDWBNmdRqoTmnAI5ngCBNc7ueSYIPODlohcJwD
	497na1PN8J9D8wex8HthPXa41RQJjC6gpRUBRwoBLbIz3j43hKvHJfpLXpZXOiFSsFAU=
X-Received: by 2002:a05:620a:bcd:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c3893fd8femr1623429285a.9.1768214390261;
        Mon, 12 Jan 2026 02:39:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTzAYtpC2cSPBdhiG8xAL2LeFlMuyEiLPv5FEEGMQs15OwjI8yh40BYj7IqfWlhVdBqPsNxg==
X-Received: by 2002:a05:620a:bcd:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c3893fd8femr1623427785a.9.1768214389771;
        Mon, 12 Jan 2026 02:39:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5e0sm17150793a12.31.2026.01.12.02.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:39:49 -0800 (PST)
Message-ID: <260d91ba-9e99-4f3a-a284-0b93d65050cc@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:39:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Add ECS LIVA QC710
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-3-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260111085726.634091-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ilZdyoi05uhRVO2cN8OE1Jw-MS8rV4Dv
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964cf76 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=I98pwoj1LBkpB9kWyQoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ilZdyoi05uhRVO2cN8OE1Jw-MS8rV4Dv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NCBTYWx0ZWRfX9hyEyCrwh4tY
 l8qgiyl8GBiqM2LeucXijd1L75UdMNhHUix6P/Qfnp7kUMxoa5a1NCoUuHhJnRdajzt9TGmscuV
 6Dn1Mxatdl6MaVTusvTd1wSWCURyVQDtU8EPB6XmxxggBSWYQrs5DBBEWg4XmfshVo/Ie6MbtDF
 QFuY19rXUoiWaGXWTL1YSPSO6Cyc/fUW927lS7qm7CICU6k9mnwlcbxESFFviiilvMjTo0Hr7/W
 YOV34F3BuJjyfocSnkn/Qe1jhNTkVx0SqEYtYVcVXXQ6XaW/OoRSGO0arV0S+EqftTTqniVOPG7
 td+pk5SaAQQPMWZLFAIA7TV0pF/AZT9Nl7hSTmhINkSbpmQRlerRXnJZT1EcKuuov/5ZPoLm2K9
 9R8IUMmhj1yUAY+CWwj2k1QWLpBaTb4+xYkqZimZfo/5v2OQw3f0889I6LpLZbGVLnvQ1/q74mN
 cheB350syrRO0y8TWjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120084

On 1/11/26 9:35 AM, Val Packett wrote:
> Document the SC7180 (Snapdragon 7c) based ECS LIVA QC710 mini PC/devkit.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d48c625d3fc4..54750b11895f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -385,6 +385,7 @@ properties:
>        - items:
>            - enum:
>                - acer,aspire1
> +              - ecs,liva-qc710

You'll need to patch Documentation/devicetree/bindings/vendor-prefixes.yaml
with this one too

btw only patches 1,4,5 arrived to linux-arm-msm (and my inbox) - please
consider using b4, which will grab all the right Ccs for you

https://b4.docs.kernel.org/

Konrad

