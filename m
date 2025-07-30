Return-Path: <linux-arm-msm+bounces-67160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA365B161A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3172E7A66CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02C42D6624;
	Wed, 30 Jul 2025 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjxE+z2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532102D640F
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882641; cv=none; b=eJUWLk1VCtE297gir2O0a/+PcnoZC5h1RaEeDjXdtu0OLCOaakpCKiRUT6f32Ei0jAi/rKJbBaX25DIptLP9s8HaUB8b/tc7/jUPJx0FNYEE6WqmBuw4nnVuWqS3rSyxr0ZMOIb0SOOYditN+xjiNavMXNO/iTKEEo3rt+GS6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882641; c=relaxed/simple;
	bh=UnGEp/P/b1gtgq5NHRnGprOfMT8kawtFXgke6jFNnTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3TvPOsFtAlwoNuM6zy/smNfM6kWa0tUuLmqmbQ/sb0M+dI4oHTsDe6c2DyfqAMCGDbMBkf7w/5JzDJNS2U97l/4fAsg66Ou8IFcCvKj5OE34HXWeLVAGHIgETsN5bA5khmUgs8cGPgizexxF6cyCdaaknAOhahuQwB22SpsDM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjxE+z2k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb7VS030215
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaYzJi77qoY0VmQGa6ne9vwLY2SP/8VbDbQMvWMF+cI=; b=BjxE+z2krMPHv9mC
	nZ/HdkNRxQL85QbmrzQOXo/2TpAXFokT0ecefclEGDouYYouViGAIHDi7pokR2Mi
	0LRDl5N2uBJGliTzH/CgG9QjRnrNA+ZQsy+oCnmSALfTarN03ZazfPsSSAwEv3Lu
	/xOZRAadmJzKnE16ktOY512JmbFsZADelgJpGw3RL4JtbOsi5bGMvOq1EtV3a176
	Mv2mLEJ+LHCQLq2caKw4Yg6FBNov0crdZFNOmGzgR7F/KuKx9VTGgVtBGyu7JV+b
	p1dqRTwUBUIoZKha5cQWFzfsMyWTpQYv6b7ZW+cZiQSsr45mYmAfh6pN37mZuUlY
	+Sv5DA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwer9eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:37:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e34ba64a9fso51845085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 06:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753882637; x=1754487437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eaYzJi77qoY0VmQGa6ne9vwLY2SP/8VbDbQMvWMF+cI=;
        b=emCTPWTJFMiIJ4EV0+SwQOMK9wPKDxxzpT1imBo6GSjSEp85O0CfHxy1dz67/OodvS
         IiQl8zASOz0BwPsFh0RAkH5SI1tEfosJ/B2QQhN9QTyCc9PLCMu0NQFJVS8JiKVVMcF6
         sHHnvLP5yLogY1Z7Djz3xLJu8EyO7hGM+BoThUaoi8pM8dKYlEGAeTV3W3xiNT8drGvP
         i/kRdZ1dIAp+RxA5y8pz2WoG6a95qFnSLz7XfMt+3dJWf9Y7WrRm8glMISjNZcan0Kwu
         KqTIor301+eVRSvTIXW0X+YreiU9EbZBeaeoWeaVf/Ogu/3+Vr4sTvwSt4Jq9myXyxi5
         49ow==
X-Forwarded-Encrypted: i=1; AJvYcCVgsfmH6BLL9KTW5ziM0nyehuRHadWb/vdp/TFmM4JI7GTYEHEDyRXmrkqlgP0Q0gX0+XL9AP9gSOMYLonP@vger.kernel.org
X-Gm-Message-State: AOJu0YygNJ8bdhJdKDsSCGOOF1dzqoXyeKL8KnDsTNUPneLFGPczl+Ly
	scSPkfFk2hdCo66VXV/8Aa9jXZxGzQCsvRQ45Fj/KrLj7oftwDtMe0I5DdFUEEm1wXT8vZdpngc
	UwSMwS2dmEmHg0IVsUwun1TzTK08zWCjYBHHv6yp5BwlLDv09w+xlgrVf6zlLvnzPTcB4
X-Gm-Gg: ASbGnctkauaK/ot4zaFKl3sODvvB+naK5mGRbPdvEzCYS/msaLR5tHPwKVbCPS4jNbw
	R2h4zinEHzNoMx7HztlunXv2qwMjj9Ze1kqv3TF0TIrnxtRqSOpXQpx8ikA60mhAevEPvs4xDxw
	Hz8fbBXRzAjP4lvednxEAOBQDv71/Qn61WK4PiVOZlAnj2iGnlx8C0ER27bRgPKyPNlXE1ob3d1
	USn11HidDoluPSHkFzV2WH/bYjMvBtQIC5UzSmmaw3G3sL0rpYSmP47KJuq6EeBDfKZm0ZEERJk
	WBDn/ECU6qzwRzdEnvEJdYLZO13uC0kcWNl7FQKZi8ovv5hbFZXVKhoY94U+oO2vJxLpuvc+h7a
	PIR9pGjpzCuq2MuWbOA==
X-Received: by 2002:a05:620a:2544:b0:7e3:512b:97f4 with SMTP id af79cd13be357-7e66ef809f9mr252141685a.3.1753882637218;
        Wed, 30 Jul 2025 06:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGZha2wMgFradgQDb9BJZKrBTTWzQSZkHlvvJvibbYOb1WpJSfTIlhyvZmnFC6wRLBq3+92Q==
X-Received: by 2002:a05:620a:2544:b0:7e3:512b:97f4 with SMTP id af79cd13be357-7e66ef809f9mr252138485a.3.1753882636620;
        Wed, 30 Jul 2025 06:37:16 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6157dc6b61fsm1525857a12.3.2025.07.30.06.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:37:16 -0700 (PDT)
Message-ID: <ff6eee04-d191-4dfb-82e5-7e3a6c896025@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 15:37:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250702-qcs615-mm-cpu-dt-v4-v5-0-df24896cbb26@quicinc.com>
 <20250702-qcs615-mm-cpu-dt-v4-v5-2-df24896cbb26@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-qcs615-mm-cpu-dt-v4-v5-2-df24896cbb26@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WCjA-b49GT6hBSPOLCmJxFF0cnyTwtfQ
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688a200e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=vwtPc_hCN_QQCO2tyN8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WCjA-b49GT6hBSPOLCmJxFF0cnyTwtfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5OCBTYWx0ZWRfXwA5AWQSbQh/l
 TE4w4aRXG9WYZGvu4F+GijaQWhaCH9FyDdbg+ZSlhnoVF+Tff1KNwGWk7bff/KBksvSs4VmLX+T
 c/9WciuwZy6aTEykHd4ZHwy6Q2BGt2v/SmG5LQqJfDzbuuILyVjrSHK78Kmsk+OuEXkkU1TAXDE
 oJAwSbzkXSUzq+0xXP/V6lXyz2oN1XKCz4Cz0st/1IjFDJ4MmRNssrxU94ZLYRJk92tsNF4rVtF
 Mu5YqvvM3bwHG4Hp/rfOUoJ8VTRBwflLp/QjlgruPKcADEeJwZL+JNJedxlEDhC9s9Camwut2CN
 zkl9ev4tcYoOzJBauX7qFhgOf8Qjh/+9hsbuRxQ7ZgX7o2+jw9oQr5dnlBw/LhpLWbLOo30Xp13
 e4tHa2YqEeh8KMpwrrhySapQsTzsx2TdrPAkgxwGF4bgMrRURdbwxinAkT8BLv8dAmkGhoml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300098

On 7/2/25 11:13 AM, Taniya Das wrote:
> Add support for video, camera, display and gpu clock controller nodes
> for QCS615 platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Bjorn mentioned offline that these controllers should
probably have power-domains attached to them (perhaps bar
GPU_CC, that's under discussion..)

Konrad

