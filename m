Return-Path: <linux-arm-msm+bounces-60990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD47AD580C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 16:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9500F3A66E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 14:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D06128CF51;
	Wed, 11 Jun 2025 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/radQfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FEC294A02
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650944; cv=none; b=mom6Rt5RIzdfyKbIBufMEmbk0pv92Mbw3pISQMuVRJkm7TGvkeApX1mWmL4kUDxQ6UfdKcl8dVub0aKTHB3lI9t4zjpla1ZfARFpXJZLH+q/PcAzYny8Jw4H/6tWqpLk3ZvxqhbV+toilTnR/6ESsF2qc+5oGztci0KQ6R4GBpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650944; c=relaxed/simple;
	bh=8umeUY4xnAvrUdO79d9nFVuoRb0TW5UYKKfEdyqbmqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPiTWRYAtndBKgcD8SLS1xP62KIBQWqEJ3Tn/UiDzPref1/094tEzh6MIEhRRhuxN5gGndtnFp3JcBAxseDgCFNuDaJNipegPN8Lf6JY+2s5sbDthfx+U/XLfoltKS21yxuiwSZalX89+wYxEvKF3MGEz8+v1+jJX1XWXHtq+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/radQfO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEXn027189
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmeztB2LHDf8SBdCFz8cnXw9fFkHuSmFpu3b1oz+irc=; b=S/radQfOA1lnYWMC
	umTVhVPTtpR/WYV3I7GbshcAF6+vvSO/5+HvxkoJ6UpnlyLpaVqlUvNfehxsTloP
	JIOqMpoYSMPCLi2CTRONkZUsbYp0bus0xN5WnDAO67wBlKDFkk7+a6iEgRsn0gqh
	ZEq684Z0zlMjyQpBjnLQn7foY+N1p1WovErPDYuiOmTqi4Lg2oMJbLgF4ogbgxYL
	Md7urulqHWZOixgJUq3EafRt03r5JK2KByQaCWl9oXWuByi+EZSCAe/kXYxAIu9/
	Hd4bklruTlMnevr4A2rlhuoVrMLRDnG7ymFHdKyG0OJkJoPRvBP3h6ZrtGFhSvDW
	FshRSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvd4h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:09:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0a9d20c2eso19952185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650940; x=1750255740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmeztB2LHDf8SBdCFz8cnXw9fFkHuSmFpu3b1oz+irc=;
        b=EUtc3J774o+iVQJ3oBxV7TXWPrcerubQ/ztIE9akfdC+aEVtQs+cG+ie8rBmkXWq2+
         Mc1mLVmmtHRl2IMphNRC9B0KboQxnsXNrsEZImYACCnpZmymCY5z97IRgseCkkdnP3cC
         bkkwa/g+HClUBveJipqfcQTkIfegjWWDWjPmjuxE0VnpSQpCCZyAfDrGA0RcmFSX/j5B
         k6iX/ySuTxLetEtQnDSBKbJZVwR+P0OqI+J2y2W/QKwBc+PFy/AAsQKco5twlZqBcAeV
         jN5A/gj27HeIqWcBjsB5z4qeaQTe6G5tfn9dPhKKM1SNVS1LSuKXBgLedVWEUd/mDpo+
         PQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk5itXbA31P9u1B1randq9uwzpJMFy1c5tAQweupqAITugVi7oimqh1+Y/nvYDF7SanRExw8AqH3RtIKPU@vger.kernel.org
X-Gm-Message-State: AOJu0YzuVpTvIzrZAC9sTtgX+1gvrKXb/hh3gXDtpgOGjSkQl8/S1WK8
	ac+Z4HPYne3Jc9rlSt38Vqr49OLaPULGQK6mv9hIbA8/9qn9BrKYY2MvehaG/REV2P6JSLO47wr
	SBiaMVTWWhe8U90QABRJHEEz509bQ5lThfetr1W2KOvGhDLa11yRNQNIDNykQp/0pF8i7
X-Gm-Gg: ASbGncuYVrB20AeB/iVTdM12XXDZpFQYgDWiYBcCOwhvDy+PWqqcIlAZVm6NGlG2+k+
	bcyMJPSI7fwM/9C2wniWBJja+CU5T2e85CmrUt3SFbo1Yh7L5mxiNR2QwCDMQpClOXcFh08vvAf
	ZqQvqMWZEQ8Lw1KMYggCum8fYVtNQSwlF2a94YKwa3oQlZBoM4G3YjK813KMSPAbtg8ydUXP1ax
	fWu2+KCxdzfK4qEEt0kVuViPDQJuEEU15LxzFJooCR3uP8Yip/aVUM5/kmLwQJL+PSuuKzpiPua
	tdSFlNNv4M7Xs6H7MxpmiiOsQ/sRlsmBXIKw35uzxiqkseETvH5R3QmdlZy/k0Wzbu5qCBwYCYl
	RCZc=
X-Received: by 2002:a05:620a:2a04:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d3a87bfb10mr197099085a.2.1749650940495;
        Wed, 11 Jun 2025 07:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9WowvqmmYPKWaY8pD6n8uaOQ+TKS/kPAXsLiaAzSif3KtKbjRfbYePG427VC/sE9AJip0tQ==
X-Received: by 2002:a05:620a:2a04:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d3a87bfb10mr197097685a.2.1749650940051;
        Wed, 11 Jun 2025 07:09:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc76feesm892015366b.147.2025.06.11.07.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:08:59 -0700 (PDT)
Message-ID: <74b017c2-7144-4446-969c-8502fb2cb74b@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <cover.1744955863.git.gkohli@qti.qualcomm.com>
 <1758b5c2d839d40a9cb1dd17c734f36c279ac81c.1744955863.git.gkohli@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1758b5c2d839d40a9cb1dd17c734f36c279ac81c.1744955863.git.gkohli@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FHOG2IvdtOgeb75LqpPVL9widVM6eyDw
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68498dfd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EH_knqGQgeMXXTF48UIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FHOG2IvdtOgeb75LqpPVL9widVM6eyDw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExOCBTYWx0ZWRfX1BpqvMDaENlR
 /Ins+6ivoGP4fbt/wmLpgq0i/AdcaQoO6P+rXgiyqEwctI9fYfyb1QE+S91UyXVO7OEXii6U/Ea
 d1DbOX0AE1YN5gdpbp1/rL7zLCFKmY5kFL035S8b0+WBjCtaJBFNuHlyLOcB42zzxkBZZFT4n+g
 1vPeZfObxKAF3YyNDw29nFWjQU4xvqitTEhRfRBDNZywhX4GWv8l+NGL5S9BwY7DY/xeBlKxGPE
 l59GIvsyAdCDYsGf8/+xj74eqbmZPCKbYaihnLJ55i/QV/l88En7cZuho82Ln9cuLG9xtvGUppP
 jXfBMfJDvRJFmjD6oitDiRpyMGsfc6bLiJhmlQSteeKbOvTIb/X7rKzuWGZny94OuROM4pFYPFg
 UV2krcUPLMYrHEiO1EAXw754H0RHA9E7AimkjWKweMf0H0A6IuK4mhVSS9fNP6KPLim56l4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=868 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110118

On 6/11/25 8:37 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---

[...]

> +	thermal-zones {
> +		aoss-thermal {
> +			thermal-sensors = <&tsens0 0>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature = <110000>;
> +					hysteresis = <5000>;
> +					type = "passive";

All of the passive trip points you added that aren't bound to any
cooling devices should be critical instead (otherwise they're not
doing anything)

otherwise, looks good

Konrad

