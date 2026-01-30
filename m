Return-Path: <linux-arm-msm+bounces-91260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMIIEuN/fGk8NgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:54:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9AEB9150
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C5583004C7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1588334E75D;
	Fri, 30 Jan 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLZ51zPu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xdhy3R17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E512E9ED6
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769766880; cv=none; b=em1ZqD8hf1PSC4TXRCfIwH+1+5M9bbIHdcZVWb+zwU9de6pMaeCa8VWzm04pnJ0nCFLvnMmHj/37zSQ59v+3ftjoOk6p9U1jlUB7egYRCO4Alwm4t1/XQkEvrpOK8b/6bCnVBXn6u3cOvbgUKIFURHryC7tMcoZXEBMTNzDWdLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769766880; c=relaxed/simple;
	bh=ZJA9kN03DvD07TYAjfnZgouJ+W+OT0ZEDNFcgiOBCLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3JjbHm/KhRFuRt83+EemlOMZ+fj1tGJy6h+TqFWVBDOkc3MBOcKcbkQ0ZTRR8Y2yL92RGAd2IIYmeNnbh8XwvPauuzfWV8o4O6HZV77D+KP5+prG2/A3pxCXw23RepGalJ0Yp1SGf6yRt1xtB2HgEAthayXFgXmOnqPTGhb9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLZ51zPu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xdhy3R17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9V23U2675459
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9+DAV+c/CZgBH4DD2jfZcDSjLwf6jHYApWbhBRrbJ0=; b=FLZ51zPuR2jby4lo
	tSc/czS0eCZMucXmZkjXl5qnsv6WmbE16cUZ52mpGa/Sxugkrc5PaaX/2RXQrHuw
	u8Tc6iX13mX8/HzCRPT04lmZmIcZLU/Pz/buKEQ2ob/CDqO2fHsNZ3rxdtS2nxSG
	9+VGQwtAEljGwZoJB0furVt/tZvLzrb6n9cmUHdS5v8FonBYU/m/tQDCUQCBQJ/N
	9CP7wgwSu3VYumGEkIw73KXSFn5ymPLypP9fire8+a/inRKIeziUf0ZOxi55g8iC
	6b8cIcTijbYjrw1x8NTlh5s8Cp9vVYad71hF5yrLfzUrn9pKtd/i+pOVJogW3z70
	KM+ZzA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t3402tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:54:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946586903dso1576536d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 01:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769766877; x=1770371677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9+DAV+c/CZgBH4DD2jfZcDSjLwf6jHYApWbhBRrbJ0=;
        b=Xdhy3R17Ehz8DG5qBx9X7lb05PUudEsMylAcDq93FYhZYZXLidiDGgjRHA7LfohcUm
         f6AIv95mOjJrlYBxMAH7c8Aw5pM1qv9TnzlsfBM4PxDmpb5MpriKy83uErx3ESqwqzpC
         1yrs7Q1Ik/QA/jRoaRoj1XCg5VhepJ9RLnqvqDQAj37qPgtgrYp2w4xiPRxQPfYIAWnP
         uUmSrCyxoQ5OlG0MLLXUDX48PkOmEy+DIJP1Nl40cPMZfTzu4LQoUYq+TS1J/dGvzFnV
         1zefmoXgilfMcQnm5vTKSOertl8RESUij448G5rGLWnhzLMbFBHssLFV+3dDLTNY6eaC
         dz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769766877; x=1770371677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9+DAV+c/CZgBH4DD2jfZcDSjLwf6jHYApWbhBRrbJ0=;
        b=hww1w+wqAX/X2frKocs0bjYZkDVbfAYWCbAo4mv/dfzAoreIITRi+Km86VdGT1snrM
         sYhnac0WyKxHFr3C7r1XYwnKu8AOnkObXHVjh4T/boPWwhYtvXdfgg0kuNM7gyMiOXin
         rDjjt64RU2x2Jn21j3OxpDuVFCaGCWgCH2gbZOIz4Uw63xkUZlbE2Lx7zGAzVIRjYcj7
         lWtBbXqDOLexPDGcBOgvE+p966cHS0cjEJXzjGFSBAQm/r9s8tEmmjw8d9VfLy/APg/d
         8XQkXHqDcqjOIZO60RuVccoi7UWLqZhcsFrTCuZzd/aJKqNXodnG1vvYhh4IxFOZ4SwT
         AlGA==
X-Forwarded-Encrypted: i=1; AJvYcCXLgF+djAgx+Xz6Vp/RUubH/jQL9QSPU84awlP8eZiCSUoCv9LykKs5NUYFqxbVREB9tIglM9gNCU/1lLU8@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3xcnTEOjawgUrqRzetjZlnRvDCV6Q1NmW1bR1/Vd5PACbiwY
	q3Y9nW6tJXAMoOFZxQbT1v7ZhO9Orh6dpoTl3l081ZPO058Ayh2qY++9rysT+Nb62fjGuRPMgYU
	pxefGuLUHQn233s34pjHkeRS+LSVtB9TYwBJ8w57SE0DqFA0L6oeWy+PrmcwjGdFQrf21
X-Gm-Gg: AZuq6aIzGs3h0+2YwUuCEDUPLYT74WrWtGdBgvh/NpvtIo9gIh6R8xfzRO+rFY7eYIr
	4nS12JsmR6nyB3/9U7IT3BGQZscSZxb5lfsCNISX5gTRnsH5foD/lx+pjPYLneDKI8ZX6nQUhfk
	1IxoLsk4RxW5kZv77NoNx9GYTKxdf6FEDu7yabmZxAME3AwyEWNkZFbR0fknAfHpNe2I7p1IxM4
	y1Usf01agLYBYR3ykjDOwXATUAlwegdND6XEk39FXfNqjdvbfK5qqM9oK+AF+7yYFWxei8ZtLtG
	7BHL1MLhuibMpEYokpruVIWmxbAVpZt4DebyRXca0QY9bIQPnpAQYQ+2c5O2/ZgJMGdweLTQ7jV
	6GW+b0L64cs3qwc0aHazphcbvdUst3H7MGytSZNhruIaNdZnJFKpHsBejO/0uvX+lm04=
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr239893385a.0.1769766877061;
        Fri, 30 Jan 2026 01:54:37 -0800 (PST)
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr239890885a.0.1769766876599;
        Fri, 30 Jan 2026 01:54:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86deesm399356666b.3.2026.01.30.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:54:35 -0800 (PST)
Message-ID: <5a70d411-e0fc-45a5-829a-c20fa02317cb@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:54:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: glymur: Add ADSP and CDSP for
 Glymur SoC
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NiBTYWx0ZWRfXw3G3a6hfdwsW
 ESJVOPRHdK3uwAN3Q0qi/BKzVkypYBkSQKYlmMYgHO9VA43QI/JIcL8bkWXNYoWp51ZT/emWXAc
 ceYU/dtuEkFHhDyy2eLfF65UsgqmO4krJZzPQFuOvZXk+8MzcWqFbdJHcv91/Ui0J7AIH5D/8DG
 1f+Hp37BOzFy+6Ho/TPF214nbBRaM62uvuVqbi0l6nShw88gzjQCnBwJFb2JWafTScMCRGMqt/C
 JS1Og3qf20dyxsTREiKiIMBipkYQ0evLode0QOEm4x4snoda4lHiPjVPeIB72c3BYH+ROVIV/mI
 4iT94CH1Fk9ReplDHsmL67ljHjkuOQnYD2NXPWzc9noJf5ltRAUpNZ9NmEl5Fnt/imamY3LA79m
 w7pNkg17jhpTsZjw5i0afLiEQjLt4Lwnm5O/VdD/zjkopPpcfOQKIffiTUjLpON+mDsGg8b+vzL
 wZNquxy8jusnf7M6wng==
X-Proofpoint-ORIG-GUID: 6rgUxs_hwtLJ37lTjn5nyJMyaDsnA-ZH
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697c7fde cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WPoQd7O3gY_o9P5QeXMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 6rgUxs_hwtLJ37lTjn5nyJMyaDsnA-ZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91260-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,320c0000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,1.236.219.224:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A9AEB9150
X-Rspamd-Action: no action

On 1/29/26 1:13 AM, Sibi Sankar wrote:
> Add remoteproc PAS loader for ADSP and CDSP with its fastrpc nodes.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---

[...]

> +				fastrpc {
> +					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +
> +						iommus = <&apps_smmu 0x1003 0x80>,
> +							 <&apps_smmu 0x1043 0x20>;

0x104x -> 0x106x for all children here, the result is the same but let's
match docs so that no one has questions down the line

[...]


> @@ -4692,6 +4808,176 @@ nsp_noc: interconnect@320c0000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		remoteproc_cdsp: remoteproc@32300000 {
> +			compatible = "qcom,glymur-cdsp-pas", "qcom,sm8550-cdsp-pas";
> +			reg = <0x0 0x32300000 0x0 0x10000>;
> +
> +			iommus = <&apps_smmu 0x2000 0x400>;

0x2400 (same reasoning)

[...]

> +				fastrpc {
> +					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "cdsp";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +
> +						iommus = <&apps_smmu 0x2001 0x440>,

0x200x -> 0x240x (again)

Otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


