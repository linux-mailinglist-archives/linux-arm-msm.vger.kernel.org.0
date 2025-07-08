Return-Path: <linux-arm-msm+bounces-64048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB60AFCC38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 159AE1AA160A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64709217722;
	Tue,  8 Jul 2025 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxpQsEDs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909117B402
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981726; cv=none; b=oE2fifJ0a0lxPZwcnz81HtD5Kpa9jhKoIbcaAD3PAjmVJE2+TMpmT+ORVnL6M8XvJonEISp6gKcn2dTaTAfUtqOkTZgHj7nG7qSRjob0Fp9/X3PV/eEjqM0hIsh2UAVy//eLGzHMDXGzWCEc5ngHksS0HvNmx0GO9uRHJ9cToHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981726; c=relaxed/simple;
	bh=sdwE2TVMETQv0lnaZK8FIqzkA22DNUIr0KqoTetmc4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAJB3M6dQ0qqu8uoVPNDg0Ije19OmjNE4Do4Un3OB59aIXgwhYWhitaS9hv8QUGAU7md32XzesEr1tm2zMn9tNH2yyKoEIgo0YiaSYe/iNImT8HeezALTbMYhGkYbuSihOaKPBfRKPT/VzXZDOiwrwIfwtD8sEUnDTlgY/luZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxpQsEDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAO4Y012125
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 13:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au7Gd+bh35WYq3bg+QnE4G6bdktpjK9eW4ZKsorDzos=; b=lxpQsEDsgkgHIcp2
	nBDQhPovOPOmc//dR3UxhpWsvKPQhJuAQps5rKJeX1W1c4e/Oe90WSJbR1IdSp3C
	Xi8G/9kuQtX/0kHYQhYiwGWDhwmysmqTc+cCLFJn0cPmCNCJtUf4qeoZyVfFxvEf
	LwyEVuf1aYw5XfBIpWgsNgSvTJuqPkHuYUMp2Tf/EpDG9xxfHPXeZiyHJt34rUbh
	AcbCB5hsuC7mg0CAP4OtdRfdL4lQ1w6lNvVY6ISP1MqoAEYP/2h6T0Fq7cZ8nZfA
	M6ta3Kj/X9YGhCWxjlQGU86jSPQXdrCAaM4qad4qvlyAHgSoxGCa6zrCXd2kSx1D
	1XSf1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97nm9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 13:35:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a9a8841a85so5649621cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 06:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981723; x=1752586523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=au7Gd+bh35WYq3bg+QnE4G6bdktpjK9eW4ZKsorDzos=;
        b=oGQFmLJrPvA7v1JAalqkxnwTHQmBaLXRk/zKBuig+SisihVEd1pTJJDvZ3W855Vw85
         Ct9LbI7wRw7i6T3r9QUhn6ic0tXGohlq4BcR2lYDY2ncmfMsGACooMAZPoW+1jhAvy+V
         5b5VmGEoxxU4zXpZtg5e7ck1xh5UO4jyR31fgG3HYbxji24ianLWb0ZJLy/mWTQH4S6J
         teTcEqeWZeuJ+pr9uixrO2FpSMUHuUwr0UWyuHNVBX+OiIv4umoZDW4Yjtb00S0ISctZ
         h/9T0cwtDFsWchmwfRxfvi4gOW6mtI2QLyuDz4+OEPcXEJlttII/xRQhkjfGZ2ZxyLKx
         VuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfjnauCxCCOyUmuoQewfD5xCEOsOnwWF/KF9tq7AEfhxUqJ9Jmk3TrCLs5cjHyJiNeSHdxdBjNTdFlKHPT@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7Spx3E/63ifSnHqFDcCZH3YODo5E+xDHOolcKfGilbXfXGqU
	wE9mNtshUbbkjeE2W2uMjVIAmMOVmNM2f0PuI/Hf8ssdMiLHb+MZvCfppbBI/RlTtq1AklToZBx
	xbp5xvq/lrmRnPhVRFBGN27KlV0I+7+TUwEkPgI6RlApg7r52sZpAFzCQnOy6o5wOFDGm
X-Gm-Gg: ASbGncvtlPj2qkrT2C7lQmjr+KDRl9CM/t5InESQ587WPZrrliXCiE4k457LNwaSjxZ
	h3ryI6cG3ipsMXNUYyBRw2mILQqp68sUm6UBpmaZXnK/a9bdSZtET9h4GoOj1IF4MIWGs3pn0tj
	0EI+7IeImTtpPA1kYmI4abrSDoPn8EPjoUNGFCNJzeed5j3UHJ9ZeJy9UWxZP6ufAQlBPDCSPHE
	i7ITFAfYG+1ho76Ct8rs2CwGd3i5m7qGp1VV+VcyPFVTaRbl/ZI/FdfF0UiP46vY3WhS44ACXeO
	e8qokIwn4XEwzUHGvXo9qZb1khElmDfQR6d2yrzDIClzxeqLKbUvcvTkGsWWNPdaeY08exPb19Y
	Kw1Y=
X-Received: by 2002:a05:622a:13cf:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4a99779aa26mr87767081cf.13.1751981722819;
        Tue, 08 Jul 2025 06:35:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX1XpFgWzBh5b3kelydKCB/xI5OEVjo9gU67wYMsPaB750Y8UR7hb8TdcGBNORBgDHXBEW1Q==
X-Received: by 2002:a05:622a:13cf:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4a99779aa26mr87766791cf.13.1751981722380;
        Tue, 08 Jul 2025 06:35:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6958586sm891855266b.72.2025.07.08.06.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:35:21 -0700 (PDT)
Message-ID: <048c4cdf-8942-4250-bbfb-3f6a255a5e30@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:35:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc8180x: Add video clock
 controller node
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
 <20250702-sc8180x-videocc-dt-v3-2-916d443d8a38@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-sc8180x-videocc-dt-v3-2-916d443d8a38@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686d1e9c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=gRvX9a0DaF5FQXGff3AA:9 a=QEXdDO2ut3YA:10 a=pgX1na8PQfsA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDExMyBTYWx0ZWRfX5bxpt4+cfbHW
 GUuriI7+glRHP/si/pCKFSUvrhtHq2ictdWTMM9FQs7vwIUubTFA5umbJ/EeTcvnvLf96Gsia+k
 SJwpJ4EnCPbgyIkWf5n7su3K+cc35oZjZ5cJPdWKoFIkzgB7sSxDkMw1dVZxEoJT48/NYwueT0M
 GRf+ZApE4QAh/v1Pqnor4WmujjZQGvn/Hzqo8Og9Gl35HYm5FFhtbXNRsfnTCsGLRLj5+0oAxxm
 OzYGs/RtaTGR0ufBbzFgXmHhNbexQX2qVmLCrx1ZDAkNSCBz63rXJd5XbH0sFF4k+mYOrLn7ZUL
 4TW5EwuHwd834an+0yAe+MKWd/At9QsNzEKJtT2Vb//CPMKF5xTxEpsW75CHqoER3YUabg1pCal
 0vWTbXcxeR43s/+GYWnKzMH9lH445ZcGGLZmTZhEwbeb+gUix0FsbgNILUpikRhF9njleazN
X-Proofpoint-GUID: Qm0A1PZoEAB8ny7Syy29Rt4FT8Tb4FZk
X-Proofpoint-ORIG-GUID: Qm0A1PZoEAB8ny7Syy29Rt4FT8Tb4FZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=850 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080113

On 7/2/25 5:13 PM, Satya Priya Kakitapalli wrote:
> Add device node for video clock controller on Qualcomm
> sc8180x platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

