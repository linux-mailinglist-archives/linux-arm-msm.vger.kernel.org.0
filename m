Return-Path: <linux-arm-msm+bounces-61772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FF3ADF7BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 22:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B97B41BC14CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 20:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CCF21B9D8;
	Wed, 18 Jun 2025 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtBzThqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C8921885A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278735; cv=none; b=bd5LqoXmMdRxzjfeCs6xt6u+HQZDKrKzDuhmUobt0TVBiNXKEdiL/chZZ8x59krZjowtWwvU4pu/XaUcWM2gf6mTb9Eq0j0swOqoJc+WFpH9J+1IRGWQBy+2ypsqvYp21MFV0DGGIuaRQ9/o6ngNeEo1xIaxtY56hkAa2hgtcAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278735; c=relaxed/simple;
	bh=O8JroxGk+Jl47yBcZyk/78kA/+EH2JyBWKCuffMf9Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVFrrdUtkIxP381pR9kyKe8+lU9QbwFBWtWVXAAgAgmcpdljWqjejcL9C47AfjJWfDsmCOIQkjbyFB+Qk7WMgEFLxw+JKcDitaxDU7VrwBQe12ancSdEpQ1Wnesz66zN0cSJ1387H032Hz09Mfo7ClgQIgFx/SJLnNggyjqGPCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtBzThqj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IIcFTd027542
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 20:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMKZ3B/JFyMsqt76FuJhG6cvTI0uCazGHj/jsvOr3G8=; b=DtBzThqjAAGEydAA
	4yOm0mXb5jy69JUxdDEGkGv8z+tEbEEtYbkZkns6WF7FIfOw0xUc2szZ3eqBNVrX
	ggrbdMDtWe02i+argYLRiSN1PJHJ1vqO5ZV2yf1x2xdqE7z7BfEvnXqxJ1dq1kZg
	BGSnev3ZIWRilKIgD2rbcq32hM7Dh1uTfefIPLm4iO6CEm59luN+n2c1QzBtOr23
	NHenCZhycNgI2GLOAQCLv0fxOo+M4qNJYwlZwi+qjzMU8jd6OuM+UkEkZXRmtPw1
	DlMhjdw5JPF35Gnpe+x04kToPvNGlR9ae0lgoT3l0m2r4J6qME7n9mQ460oyCuM+
	TIuuKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd5njp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 20:32:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so2021685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278732; x=1750883532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMKZ3B/JFyMsqt76FuJhG6cvTI0uCazGHj/jsvOr3G8=;
        b=Swy5lo4O4hSeWweSq+sBPS4f8lnfEQRhlP51tmP7WO1eUM9F0lxPMoX95c9LIqVWm1
         SrjzwnB9YzYwcVia6hJwYV6zuZOQnsoXR9wFtydsaRjK3nu8QBmnf8EjRl3KMexLMSo0
         2A2ugnUo7bNjlXeR88X2SLfo6hCgMWTE8qXyFH9DrXpvybcNEw7BSlwQsNGrJmAgu9lF
         TcSRcfVx5wogq3R8tutvDRWC+IATuyHj7FhhJcd31iTk6l/gWCZ/Q9GzMFDm5BPdiwd3
         F/cYaHljc4vg9vXSWr+TTBTWgvVFJSVSG7gHDOCx1DXauWrThWkCv2qhK9G0JCcExp3N
         W8tA==
X-Gm-Message-State: AOJu0Yyts/hZO13RttJg0qWR5pYu04WWUuKG5s8F8Nd02OVgQRt69Baa
	4VIY0KkzZPH1Hu5hn4uJMb+hVxkfVjtGIQp3p5L0FAOqd1L38TAt6V5HKWiddTNgqYRzSO4/5I6
	3XyTti13Cymf08/NJOIkQLZTauKOg2Wsh0Nfbf9q890hnFEn+irvWEtJMMLeTRWkxQqAM
X-Gm-Gg: ASbGncuAUoQgn/waQQRYXXEUzoxe5Il1mA5rt8rhJ5sGjuylcoa7QNcv1UMlaus6Mw/
	9Gq47LIACnD0J6KvGEODZk9JmkxaBXxk1cjwS5lspYOlzX4cPAau36mPOk9droTPZYLbgKUbMb+
	J8HoGYFwVIpdjMgw+GpbOTBFx9DUxGMlcxxhRPifvBCe+uGEHwaPJwpEeWMAO49Rm6evonsHZLZ
	BszLJ+8L6CqSlhenLEWYNdV/bzOCQH8+CLrs2jJKeOPaIYe1ojTwSc46XO0rvcg3SOKFCG+U3bX
	lJHh1P/ds5O+w70/NlLXbUqH6HJZb6AU5l6QQ1U8bams2Fw29zOgjX1PYRciKtYzQwPC5iLMBzA
	8Yr0=
X-Received: by 2002:a05:620a:430c:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3f1bde64amr37693585a.11.1750278732210;
        Wed, 18 Jun 2025 13:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/MIIbr9GmTJBVslf38SMQbyK7FgY0tGiofcr+MItIMPe4cF4Dwk6UkUrq/85UyafeLZyU7Q==
X-Received: by 2002:a05:620a:430c:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3f1bde64amr37692285a.11.1750278731799;
        Wed, 18 Jun 2025 13:32:11 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d4dsm1101150666b.28.2025.06.18.13.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 13:32:11 -0700 (PDT)
Message-ID: <57267306-1dc1-476c-8e4d-02e75b1b79d9@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 22:32:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: use 'pcie' as node name for
 'pcie0'
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        devi priya <quic_devipriy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250618-ipq9574-pcie0-name-v1-1-f0a8016ea504@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-ipq9574-pcie0-name-v1-1-f0a8016ea504@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE3NSBTYWx0ZWRfXzDaX3STO9Uc9
 6YNU0EUBThZA3BoqTKDoNrCDQIohCY2oxBLumbrrlS0atgoCCcLztGJqhXOtKXQUMvGlVazRocm
 8jkA2PHQEI1GKMWCG5WV/3tNWfjqCCG2MVMLn3yj/k2YCJIfR/d1C+Sn6cWjq3NVyDnXGWkhlFy
 TWxAUu2VWKPW0xYL+a+cO3rfeqDOsPcWzuQ5PMogNwFckl4dS3+K2VcCcesDF+rrzlJbUpjMegg
 gE0CWpXNcwXQvcPEioHsN0o0x6W/5yv35WBLNzda+NJOm7j4UOkvc3jZJ+ND4sSf2PXrX5cuCwv
 vb91kGhzeTiHUTRTQSc/GcvpDmeqeQ1KW7oAd5W0e+cRNhXWyQjr3pgsJov+VIr96karFU4/6lj
 51qIt48jEAaNQlVj1Jg4pyL4CNspeNSw83BZlyzYeh9XFL9fc9/6doEefJ2jtk7KmNWwr8FH
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6853224d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lyYUHkD2rfw9A82K8kH1QYe52WqMo6h9
X-Proofpoint-GUID: lyYUHkD2rfw9A82K8kH1QYe52WqMo6h9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=821 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180175

On 6/18/25 10:14 PM, Gabor Juhos wrote:
> The PCI controller at address 28000000 supports PCIe only, so use 'pcie'
> as node name for that. This ensures that all PCIe controller instance
> nodes are using the same name.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

