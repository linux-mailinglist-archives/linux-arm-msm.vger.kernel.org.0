Return-Path: <linux-arm-msm+bounces-104111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLnMD2i66GkHPgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:09:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A47445B8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CFC4300DD5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AD13B2FD8;
	Wed, 22 Apr 2026 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7ZzoD4i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUHU377+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F71E5724
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859748; cv=none; b=rZBlUs8LdbrvV7IsX/n3wHuFQbBA9+GhhoLRZcxrwcCWKt1lShWTamrqWBquzK52PoFfZwnlbDR+TK5EPRjHPybf0GO3qykZcuRp6jqihqaOMhyH99Z8buWO02ANMecn2nAc8VvQOpZmkU3whvd37kvQvUFnbSzWGeCZEB/2kJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859748; c=relaxed/simple;
	bh=rkpzELTHSMQVWEDTS/DB8PCFWa4LcrJoQ1walneRFuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6nooA5YTydpU1ippDy4iPK9i945Lde0RmISOX1SS33JU+gd3E/nWh0tiRNO3KLIZ10G6kQ197Nb5bwGAaWO5psTvIFPm3uOPRusgkvbkZlizDsqrj7mEOQ3+e9js95bq4FwX+nYh1z+xgN+aLy/tY5TTNEnRz0DuvEEYSGa9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7ZzoD4i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUHU377+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAjWF52000974
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNk4QN3YW6vbU0Ii//q4orZgJmHzUebQDz2tV23pLlM=; b=C7ZzoD4i+iCJeGr3
	EyxoR5zOMV1FGS757/lXb4BGExSEINUIRCqojtJhS/8AUAwZVjUXdt8PTBCLWQEC
	bRUmojTFWldy0DJtgQNWXEy4qz9l/zGIMPHIAhJFj7FWiVUaaFShg01yWHTsT3vq
	O7jQg3twxfpH6N2AUuR4doDTt6BfFybH6s6kQGx2YYkhjCo9qpiyeg+elR3LlLD5
	a9w1DJWMbKn9ZCven2YxisPBlx2mRdycqxeZXC4e+uzDw6DiVIOa9OmHT5SR/M5b
	G2RDh14QTIn3nA3onOLH6aVSOizzlSo5sKWRY+US4ztt5bd1hdImU1yOhz1erHCa
	Kana0g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfbbrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:09:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so242520137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776859745; x=1777464545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNk4QN3YW6vbU0Ii//q4orZgJmHzUebQDz2tV23pLlM=;
        b=LUHU377+btEXE8jcD9/+Mzfc8rJ48E9BGXdoyjTHAoinl2krvP8fnJ+YNBhub/MwOM
         stK8rJharA9G0B/7rA4i4FLd6u1kIgUp7JJXx+X/PHq7LvFcvaQfa8LXYPVBhy2wrjp+
         WVH1VmfXTh6bGg6ltdn+6210cS8xyOXLhSOMCSgU3W38tQXkLie7e0E1eNzm5+tZ2As3
         bxI2qO7Cn7NWks2Toee9dIY3zS03G05JEPZny/1u4yR7/sIqct2nf49BQwdqJL3B1i9A
         hbX6RLT0050KzJsx80Cirfvzttl3YPDNqCofdkj58JKlT/9Dlm+S+KakWqLFzG14RMgy
         +NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859745; x=1777464545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNk4QN3YW6vbU0Ii//q4orZgJmHzUebQDz2tV23pLlM=;
        b=lF20ZbmH8ZZbRtOYMKPhgbw12mzzXHbhD4QlWm3PdQzIDhMafsy9CKqqsWEVz1ecu9
         Iy+azLy97pNwkx5ko6K2RHSj3dKhvSazZ7gWfACP9754J/wgjgzCTcbaYHTba71Den5l
         XKE4Beb4nsXvs2MOD96xuIWko9swln9JhcKmCo+4HtLQK/7PaqPXsd7ddm4PSdGCEVvD
         6cZQ2beuyDKf+59ta1i9gF/17pxxB7N5Owr5nEFlf2kEyUCbS4q8U/CuJ+oR3kDYGxgl
         4zGpMyqQeHgtaaS1c6Nlr6mXiXpZDtfv7t0weDANISQuqGVpL2QAApfL81aEQZHl/kHt
         +g+A==
X-Gm-Message-State: AOJu0YwMSDVRYT1pe+oLEH7wxjkB9aTrRaT5ZDCjjbLfrXj2rHYJMUpw
	cbnFr3+44N3NKO+RBq7Z/6se9i5kiMZf7haPF+93FXudhTbFM326f61E7o8Mjm0RWcuI6vG92So
	rk4sLws1NfxjFO/x+/eZh6I0JmchdI4uPgx2m4srGMwvZlKDuHeEx2HXx7LVmdM+yCUat
X-Gm-Gg: AeBDievTXcbuWQb7419C+B632IUXHJTItn6XIlqiYaDACVdoSYxs5IGF9r1i8NGlmeW
	CPZ3NJyvns20R9/J/6nUj7/cbdOWYYSj1oMka224MLsVFWrV+XCpu1VyigTdzvukPPfmJOU8eBM
	OK9i1wwT9yoQqxgcGdz7iVoBZAsv/MLBjACRcrLTSj2AHNxDtg+WYaiBkwJxY1rgt+u4/CKftcI
	Rn1oN6u/UE0c6nzzJEUDucKkeu6Iiiy09E/ocICzs0E4tsGu69+/shqmCOoYZ02CvDGxUaKtC59
	VI3d056J1FEMLxFfXSM/SdA1LA8CPGpn7K7j2G1nYuesEPXwcthLe3D36X1PBDHFRULmq6xxNx6
	1bfN3Gjg1ZVrNtZ2YI6/CuKitcxIUkmiaIFuxVHJ2ve2hcrVHzfBTTiS4k8VeGPCQMuC2EK+J8C
	ZP33YowPop+DazlQ==
X-Received: by 2002:a05:6102:2274:b0:611:5761:a3dc with SMTP id ada2fe7eead31-616f70f119emr3302733137.5.1776859745395;
        Wed, 22 Apr 2026 05:09:05 -0700 (PDT)
X-Received: by 2002:a05:6102:2274:b0:611:5761:a3dc with SMTP id ada2fe7eead31-616f70f119emr3302720137.5.1776859744984;
        Wed, 22 Apr 2026 05:09:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046429sm538380666b.50.2026.04.22.05.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:09:04 -0700 (PDT)
Message-ID: <a50ad3be-a4d4-42d7-8680-0e7fdf01443f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add memory-region for audio
 PD
To: ekansh.gupta@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260419-talosaudio-v2-1-3a3b5dd67dd4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419-talosaudio-v2-1-3a3b5dd67dd4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UZ4SYecP8bz8o8LeRB5ULZjAhGKhQorC
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8ba62 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3lRBOYp6YGeNuEZCnNoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExNiBTYWx0ZWRfXxw7KIPExlFQo
 LpMPlJuoy9OxhFt3JojKONyPLxT5QCux9FtJMGlcrikOY68ds0a7MLaQKXhV6at+rlH5VvOWg/e
 ZL00adrZGKZeI1dEMmWhTIJPW1DlFlK1Nk0ZEgK9VwboW6aL7y2ZY00LT4HghaO8x6ze0FIJSWB
 DsxbhPit41kZbNcmRc/+y6APVq1/vJkFYqWAhj7ao72gtdQt0bBLyXJ38jY4RY+0cgEZvP9ZU2G
 9S8jKuWUJaBq2KWuoJgWUOS0pBfrMk1yqJNI3O3i22plAXAyqjJzihxdPIR6t/c7/3otig3u6Gl
 iSWAiUVqJxQKGGMMs2QrRQLBGODa7VKxDUxmms3zO6Clr27DSPIBGukLQHhaI7hpZR/b345jB9p
 WNwIMPFWCoxFdi98ld3H8vVpte6pD0iMEZSbIQ9a4B4x65axXwvaC31zDPSOO7THuxU7xr7dawO
 EyfUpV8a5MGwGUt9ifQ==
X-Proofpoint-GUID: UZ4SYecP8bz8o8LeRB5ULZjAhGKhQorC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220116
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
	TAGGED_FROM(0.00)[bounces-104111-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,5.211.3.56:email,5.211.11.8:email];
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
X-Rspamd-Queue-Id: A6A47445B8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/19/26 9:41 AM, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index ff5afbfce2a4..f71b327c7ddf 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> @@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
>  			reg = <0x0 0x97715000 0x0 0x2000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
> +			reg = <0x0 0x97717000 0x0 0x800000>;
> +			no-map;
> +		};

Is this for the QLI-QCS615 memory map, or LA-SM6150? I think it's
right for the latter, but I'm not super sure.

Plus, like we talked in another thread, I'm not sure this matters (dep
on whether UEFI reserves it?)

Konrad

