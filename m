Return-Path: <linux-arm-msm+bounces-55769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB1AA9D2F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 22:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E41851C006D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FB9221DA3;
	Fri, 25 Apr 2025 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRJBMi8s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAD2218AAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612868; cv=none; b=Rvllr2fzZH72rRwHQHd8ttEsEx5aeC1ap6KVcB/nBT8b4FCJCWUTILdQbzAuqRK5UzSeWSyd5U9fOjcG+vq3IaeWnk03vhGVHr62ZD7Uh5ZqpXhfZ2Nz0NWpEQBaCJCcJHwT/B9EtCFQBQOqvQmHGuLWrD2rAwJgFz0GqOzBBw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612868; c=relaxed/simple;
	bh=Bp/8yYVQpxs9p48lraKkfl/ZtzLHL9fRJ4OuscV0zs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kw+E2lpVVnuZahe1OeVUf6MhlCopuA4JOtWSvGjEcDHh+L2/uRCIJ9joK7slgaM/U8w+t7BkHa9gZdtkOCQjiJCV8A+Od/+1IXXx27ndf29GaQnURWxqa96x0wSg+PonmhRyZt4O5NnpSLWBZm2/FlMJ4IUyqd3G0Dl8y3x0PU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRJBMi8s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqfp012793
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4EcgRHPewAtUtbp4yexVOTr9c6zfgS93HtWDULPfMI=; b=QRJBMi8sa3zWTigD
	39mttphbK/k+wvwm0n6lPmmuITeJjueN2GI0How103pLDSpS9XqzjiTyju3X3Ced
	2vwqcC+RA5nQe3i+3xLdb+wNIObwgHZPd6UEcphfkshaXkvF1bwT9U4BJpcAtQok
	GZbOUWLTp385m9I1O6TuWWNV+/jASkShpMlwYR2PCNNpvjI1qQmYVG+T/UZ+mX7u
	FrPmRsYtAXEB4FcaXuuT+q3sF/2BTOZVYO+VOpVnhnJvqcD1D4yAduRNZe8gWQGs
	CjmLYSZ/qHgNVFgU7ElZUSfsMHegMUaof05RYSYEhiRhikhiEosnpKNvg/sTUVl6
	tzO+7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1t96a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:27:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476a4a83106so2065451cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 13:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745612865; x=1746217665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4EcgRHPewAtUtbp4yexVOTr9c6zfgS93HtWDULPfMI=;
        b=RUsj96qSyrGG8yarbXEzy0BaXbB7S/TNDPdiL6GYhRYsW4Ax2BSnkNgbjcQ363eGOJ
         LOuaY2JRJ0H5Q70H4QxcE8NOv6OudS7YyFuyjR2pplIJHQAANRdjQJZz24rTuonImcbC
         iYuHfP55Z5t0wpmZ2CsiOzXX1ZOGXbQ+cGHdm4hh+FRm5Wd9DN+qQdxJaMVw36c564Wm
         r3FaMNR+61n/8Iz7MvkEEodX2dZpc61gi/RTHUOCFrj+WExjjyiLOOwZZTEyocYibtgV
         JKDS9Q97z7wW58JhP3hHxTE8iyM33QASfrksCQ4LYBHNPjN9YrrjzHz54U+S81qDKxU/
         cFDw==
X-Forwarded-Encrypted: i=1; AJvYcCVqqkga6Y0ytsG4fURPJ0/8umLcphvExRWGgXBCa2iZuRs+CFDdM6piTyWHyp5iWTGdr2eyVYotDSdszh1A@vger.kernel.org
X-Gm-Message-State: AOJu0YyAeEn2Soix6WVWJXzqHgZhIzxSmcxHX+BXrRX3FrTLSfgQT/Vb
	qKaRwkZ+qypQtH87gcs9Cfo1t0fepxnV5tiMQh1M7Hunl2xa8qv4As4lGdVqHptZD2O1NQL7ycL
	2iPEyExUbSLd7ug+Zheihv6om2/31ln1LBIMrdgiVqXEGkqKzYXWv4+A0yr+deZmH
X-Gm-Gg: ASbGncv9Gy9XLm0bqdsAwrytJMNJIjJVJRsDiEQiabiA4SZQG99XWme9mFd8x5kwh1U
	txTUteOYKZS6wNTPv4LUbiyPqWz45G85ISp9i4tH4kcUz0jGw5Hu7wdoc1ind/c3k05oDVG/KcD
	h22UQpxedsiM/uPkStwEycxzxTYdYKBG/zxagTXCuevNBlC5QyEvoj4rn8cR8RnhXGGxHs0Q4Hb
	vSzsyLwI1HefDPjMNtMhtn00zZazYe41LmXoPIeHo0OMWaecE7xZCkRFTEaF8rSPbWu2Y51nVC4
	8KwMv7IVSD+J8J6h/acPE0v3MloeJSsivWMGRRZeqgn8SsHwfFyCfLILrPHn3nilojk=
X-Received: by 2002:ac8:7d8f:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-48019432c87mr22456191cf.0.1745612865006;
        Fri, 25 Apr 2025 13:27:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9v1JisejrtijwP5qeW5Pm0wWfpGfc5yQL9pJrWn69TJ9TdWlr4f7hVwQdgScSmqEqvvXw/w==
X-Received: by 2002:ac8:7d8f:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-48019432c87mr22456041cf.0.1745612864720;
        Fri, 25 Apr 2025 13:27:44 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1d34sm183290666b.185.2025.04.25.13.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:27:44 -0700 (PDT)
Message-ID: <5a17d866-a459-40c8-9e3f-90bb1cdbd846@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:27:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 5/6] arm64: dts: qcom: ipq5424: add nodes to bring up
 q6
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-6-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417061245.497803-6-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KUzU3hwDGuDs3-Dl15isYEydNjbkkjCN
X-Proofpoint-ORIG-GUID: KUzU3hwDGuDs3-Dl15isYEydNjbkkjCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NiBTYWx0ZWRfX7Qu5mUBaQw88 u416lYgzFn0tQgJtGgNCjRUlfiFN7WzyKKlrfvow3wGwh+3dmPDhCZPdbXNLHbBLNYR66qzLl90 OWpGgHmY0cXjydc5gZDjASA6wvhovFwRsKSkS6BtIzaM0V0rtTSIFM4kouMvmfKOJkHodowsgZF
 So2IMz6smi6des/xF3xbqrPWi3pp5kwFK4m8syhkdln2Q6lzktKDFg4ZqIybfPkSyK4M2rmg68m itJFTVrRAHbLWYLLUYGnyUtX0uzR1ADlFXBEJx9w0v75Ww1V6yRzrBJhf97qBml8T9vZuUduPh2 nO9Dz+iG7mqeJIj9NCOYkqY3NoF8juUJHmCIlFeYVnl6iIXIpRzaDj6naXcNpIoac7MEFuQQixB
 qhRzyh06uRUqX7OavvuleBpUxbIwHsOyR2lDY8tPuF30LlMWvtc/xczRQjf79I1gtnscvtLo
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bf042 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ngdhHd9oJ9b5tb6U8IEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=758 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250146

On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---

[...]

> +		apcs_glb: mailbox@f400004 {
> +			compatible = "qcom,ipq5424-apcs-apps-global",
> +				     "qcom,ipq6018-apcs-apps-global";
> +			reg = <0 0x0f400004 0 0x6000>;

So either the offset in the driver is wrong, or the base here
is wrong

The IPC register is at 0x0f40000c

+ length is 0x10_000

[...]> +			#clock-cells = <1>;
> +			#mbox-cells = <1>;
> +		};
> +
> +		tmel_qmp: qmp@32090000 {
> +			compatible = "qcom,ipq5424-tmel";
> +			reg = <0 0x32090000 0 0x2000>;

0x4000-long, this should be much later on (sorted by unit address)

> +			interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;

I'm not a 100% sure this is the right interrupt, but I'm not saying
it's necessarily wrong

The rest looks ok

Konrad


