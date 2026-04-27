Return-Path: <linux-arm-msm+bounces-104706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGAuKJ5O72kEAAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:55:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F64472206
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B8DE302E92D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056CA317146;
	Mon, 27 Apr 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5SieLbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSMNr4NJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935C30F924
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290605; cv=none; b=EbW6F+Dzbv0uFMJypQMCizanwG9brcY8ZvLOcHMW3Xj6F9wfYeJcrlLUTCm6GUTQkgm+B76T3ukZmUcmuWN1JRSHcMWWQBiROL2b1Nj07Igq3xn36m6k5FY8fdCkEwR/AilGpeIEMRhpgkuDKEpQu8szEJOKC8jcjQGPwvTc+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290605; c=relaxed/simple;
	bh=sCsBnvpoC0EZUtGC3Hj6tVJSiZqQQpcGMtowAvh/1Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5anYsTmvkZfjYzHoxK8qTk0D7Xp1F0QU6F1AyipvnMDFuqYYLBsYs+R648EbwunWuZPXYicres1iR2Vosxe0CnJsBCj0kO0IvvBHwQlX1WUwMZzn8CZU56XAORcNmHQLZBruiN5mUr0YYx6jBr3+Cx2JbkFnBMBRA80kqmudgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5SieLbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSMNr4NJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9NB2913817
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7ZhwAWmcOH0SM+sKrOOb1vCtR9oVbMGw7WZvBcy5og=; b=g5SieLbvpieLC+00
	EmPZR7McDiBE8evlYtHaEljwYaDQTDvcJGAXEjzVsOCuv/G5OrmyFBk6510p/SUk
	ro5tCHzzcHRO0mr+gW9jetjsFi/cRHjsaSOg4WdyHvYjD746NUDj9QzxFCQx0hCU
	2YdV76BRr4RO4En93tsYQ+QX16uwiIgEPkHVRTdgZ0PqmXmni0oL/j5sQqB8AO/M
	nJmjcedU29umNaCRh5WpLnZ1GYK5EtDajO1U+AAAh2A1JWq4GbS4fxe/JsDFCdeE
	CMCJIVOXaUhxlGo31mvLu7mILzxHYPYU73FJRozGGNhmJmql+2URnXaLFPHGSVKk
	RazwQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xha2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:50:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso96266731cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777290603; x=1777895403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7ZhwAWmcOH0SM+sKrOOb1vCtR9oVbMGw7WZvBcy5og=;
        b=HSMNr4NJpA6ITukKcFWEjD1E03sdUjk3zgCwHaOkDwE1UqCBPYvjyzQdC1A6B4cpAV
         Dxvls6Bo1PP/4O9Y+CXbSS707GSSRGL6vNKlI1saQWHd7NE7GJUvnD7DLUrMe0iWTk+u
         bPSfGBoFQFsYLy0cC+hvffTbcA+9enLAJyeNJkU4w1XQBdYZRdUb1Jn0w2kJfRAfpjfY
         6TqeP+w2yFzvsLpIs0YoUQTxxOq7XePqIZWGjzoPrDyLs3YdMIQPSR4NLvp3u21oIgUQ
         I/+mRrdNEcvedZlTNrsSdYRLNkfC5MlhlZ8rqzwoNld57adM1C9hIMvwj9TD5oQIcnHn
         AlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290603; x=1777895403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7ZhwAWmcOH0SM+sKrOOb1vCtR9oVbMGw7WZvBcy5og=;
        b=kGQNH+CzaitFlnWN+Cnq5a1zYcIB/ThF3Ff5X4s0o+NgeGaEJM9AN5nJUZiq//+cr/
         wfFIM3H+6r2q0LK9vK08rFCjM2iCWaUg6SGQXlGNS9Ha0piaz+bjJFTGd0FaEO6lN0Bw
         UXBtNG/WK/Axw7EjSMGZN0itMB/mbsnAqHZaw6dSgFbpKIq2ILzv0Hr2/+kVKpT2tt6l
         sfENDAAV9vYdKLpaUA6BPVFPOogwhc0iQ1bBLwbbngek5KQZQhhGemqTdFLX3PV/+LZn
         CeswoKNmOsz14zRZ3jauWajPSb7/Rq/KQsvogftcwFQHsH1AQvAK+XWGJ/kVN8r+MXAF
         gQFw==
X-Forwarded-Encrypted: i=1; AFNElJ91S/inlMb4RnEZXfUhtZOAHpm+7k72wCf38CY52TAsIg1Sn17nR9c4Hy1EXIfOX32CjCyeCytIuFkmIRhU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy/T9n2SaskGtSf4ao8woWyahhDLczr3tgCcY6ZjSxRLe/rtnu
	aYQt+gmO6YmXLawmaLG+4EF59JtAAbBBa1UMwqjmsDHJyBC3OAQSKeJHqaLe1uxTgz5ODBTXs1G
	4RfduuXcXS/6SZkcmD1G7IUIOdzV2VPP6MEJw7q+4ciqJrwmc7Lj02AejQd88JVnCSEQ+
X-Gm-Gg: AeBDies3WXoI417gifoXU+FuRyxfFznZCi585fl2ln+tzGKuo9WUbA4K2KzYus6Q9j9
	uWl78BVC48Tba+RPiWwQvNfZctgula2QZu1GfcnwmSM9KnmI25cEdwoGDKx+Jhd5dJ1Z/8xiXv3
	EYMv/wZuj3BHVzj0uFqVfxboxJoCXtBeWllM/97G9tTV4gkAamqKf0eYyyAS+YgplndKKUWgD8V
	mjjliwxaSg0BTJ4UTS1HuZ1GDg4pFdyP43zU8dVPaz61UkRozyCjWns3p3H0TUCkqxlN9Kg7Mbk
	dXg+bWogCppunUT+hh7RZ3v3JZz4TG5/FXZOt6DT6EgpDXL8fe++eqww+pf8C1u2zSK9LhgQXLw
	kqKcvzAU5rmO6JVrwYsb8kWGqfhPz6Qw0G1filM6yOaMvbQzKEES4e6Oit2AqMvXd8REdNKCI1+
	Gw1WWtPMKBVsoh3w==
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr441504891cf.8.1777290602828;
        Mon, 27 Apr 2026 04:50:02 -0700 (PDT)
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr441504571cf.8.1777290602315;
        Mon, 27 Apr 2026 04:50:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d455ddsm6986567a12.18.2026.04.27.04.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:50:00 -0700 (PDT)
Message-ID: <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:49:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oge29auh5VKdxucH6QVHNsDzLCIiUG22
X-Proofpoint-ORIG-GUID: oge29auh5VKdxucH6QVHNsDzLCIiUG22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNSBTYWx0ZWRfXxKkHI6gZcY1x
 y7y/QLOguieM4m1mlTxtt6GS1sA7eAVHZQwcipBywtcQxDbpaJY/hrVBp29RMFJnMM4rF01UlX5
 W/I18+Jy1LHQSddrlTE4JrfbAzipXoxqa55fMcExSqGf0fj+KdXvBMqG/DHaLYlbK8yMCI3jxkv
 tk010ojCGqUF8ihnoc/B0yMhVD3OGty2dK3AT3/uMkrlgPcwNOOJtY0jPe2ASQkNftWy0bzOq58
 6d1f2IzAqdnoVPRysdL/0amFgauUVGi9N7wL4L3IVgOytwIggJ0VKb73scOS/iNQlFjUE3/MZZH
 gTiLmtoLd/+I3Nik/rvPtAb5HcYhwXzGBYH6/nyNR7ZEGOo1YV13ZbUlM2wUKZIfJrB15lh/Lqp
 jFwT8C3zjghYAp7Yo+hGjx3Jn5KXRTpoQhQUol3wPW7AYrkWC5RNBUsR1WZDzPsQCy8CCvneBKS
 ww/gV0uskCXY3RV7zDQ==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef4d6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=8KgiVX8ZtaUODci2sxMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270125
X-Rspamd-Queue-Id: D5F64472206
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[9f800000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mainlining.org:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104706-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/22/26 5:39 PM, Nickolay Goppen wrote:
> Downstream [1] this region is marked as shared, reusable and dynamic so
> describe it that way.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..36b419dea153 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>  			no-map;
>  		};
>  
> -		adsp_mem: adsp-region@f6000000 {
> -			reg = <0x0 0xf6000000 0x0 0x800000>;
> -			no-map;
> +		adsp_mem: adsp-region {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
starts at 0x80000000

Konrad

