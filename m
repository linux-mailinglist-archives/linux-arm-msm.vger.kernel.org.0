Return-Path: <linux-arm-msm+bounces-46393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCDA20AF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E689B3A6E99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 13:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0491A256B;
	Tue, 28 Jan 2025 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0o5qczS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062318D626
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738069634; cv=none; b=J2Wr4QKRkB/P9e5rOiDH1JswSrB0ii9+qN/lV7WLBUwZoy0XTLh9Oev1LuHPZBNSVyqrirazLyZGyqf5ChAKtre6u3233XCshsn/m8Y+fbJOTaEE9F9n5WqnfaIIQw30sSadPxqt55/EoCAQ5eoCW1Hc+bOD9kqsRa2ip+X2sDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738069634; c=relaxed/simple;
	bh=GDaU32EvRHRK9wGedA+BAdNlFaX1nqXnybQQ8LCDip4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJj8hkuWRwbvOYHlD4VXUbJRpC89ZOwFqUwFNy0ekkQ0rGZ3ILdoq6vZTDgtjXF3p999aTNP4ed6QrejFuIYrPDEUdBJ+Vlnkn30+059i8bf6zDKE6eIgvm6TyzRa/NMw039PgDtPZQtZPJQiH2DWtyTeizV0LjMTPRYMF/B2d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0o5qczS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S9lbPi018376
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZoFWNZjjtn3S0JbX52k/k5VcMwMNPQrO6WGv7ON35pI=; b=h0o5qczSW4IJ0rxT
	hp+1T8/r+Iq+y2+mZwBOx6sdZE1HedPB2AeEGxB+f7n1YapRKRppFS5meyFQEXCc
	YPJA8tNpMtz6txtM5I4ktRmEsK5EOyTubiWyYU0hCVk/PO7z+wyPrXR/u8VgRrWl
	EtN5AWI0ZVucZCwdtFTH8KUCoB4s6GlUGECUyNxi/wshTwfupvtTU+08+DSBX+w4
	/qHZw+fTemVvpoUPTsN/p5M7R2CwldxO0aC3pe43Q5nx14ohyDpoC4sAMY0nU6hx
	wFicjF9c/fr4zFHhuwZ1cYxxDP+DUiUdSiNHiTzybeUdp/vXm4/7paTQyzVazJY1
	aR5jVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44evwugf1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:07:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b71321b993so81504385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 05:07:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069631; x=1738674431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoFWNZjjtn3S0JbX52k/k5VcMwMNPQrO6WGv7ON35pI=;
        b=c80StUgFVTR8WTPmJR7r5TPGKojCbMtlqaERm2J7rE7uRx5BhNwpG8etpiMzRK2TpO
         k7EW/X4k8/unycj+HBXU9Iizlpe62GoQga4K2FjWQnXKBZYVQuJuZ8QS5uAhajpjY9Nv
         eY7hdjis5G8Q/AydgeeBwAOekIez/pPiXvag161riBJr4ex5K/BcvXqhzkYIajsd0gPT
         UQYmo8YKRaNdu/f3TUMgPR4FiGfL5FEjE3Qp0/Mjy6tk6SaJfhnlOAKM4ez5mwowmU6T
         VADtOigM5eBKvtFIvEB+J+mXVfn+zQVGxjsg/RQdVQciy9gA4lqAuE+30fv8UZCX3d4N
         P3Cw==
X-Gm-Message-State: AOJu0Yxp0Gti6sCOiBNpaYbjqC/hjHTDjYTxyanb8NewWbwccbbgv8LA
	LRe+2UMyPFpu1jcBZCaJVn19Nhh6w5aQaYkr5oQOHAABlmVv8Mv73GZDHn5DG5pBrlo6ESzHzAT
	wUciwW8FEoSYlJjpAwo9pwujILzCGPjaHNF5U7z4R3DnND/PdCKwz6wfZJbCDgXSirhQRBUga
X-Gm-Gg: ASbGncuKUUiuAuPfjNu4AHcgUmkRElGEW8BiI/9t6FTRBk1MFUKKffxtqkn3ZYOb0M2
	kSqM6cFhag2yeLUIcnKoIiK4QdTSJock5p8R78c7/tE+p1I6sHxjdaQ9QIsyQZcRZuz2fPN0yM7
	q4IXAI3DQkKyY8wOZakvGdPQL+SpJPUG/pW2K7WWUdnIIwsYdiqH12c1My8U580cHwFV499LO0n
	XnmkXkPNrkm1FGxLAaWOURiRrwv7mZ8BG/9pscsxIdrusPIWp/fi+BLzBbNtjHy9U7I2NLeGS6u
	Xg8OOvRC++ctz1rO4/0tdkQnqtfPB19459gEATEmMUzR2QdJlbH8e8Hly/c=
X-Received: by 2002:a05:620a:254f:b0:7b6:d089:2749 with SMTP id af79cd13be357-7be63208909mr2288222785a.7.1738069630850;
        Tue, 28 Jan 2025 05:07:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJcXi/KqHTxoK0sFEd+b2WX0zBTMQypEIaYX0c3DTXdvotIgOtYQR6qy7LV9eSiuhMmxo2Gg==
X-Received: by 2002:a05:620a:254f:b0:7b6:d089:2749 with SMTP id af79cd13be357-7be63208909mr2288220885a.7.1738069630448;
        Tue, 28 Jan 2025 05:07:10 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676116951sm768227866b.169.2025.01.28.05.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 05:07:09 -0800 (PST)
Message-ID: <d855adaa-7670-41ea-b8d3-a117c06190cf@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 14:07:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] arm64: dts: qcom: sm8650: add USB interconnect
 paths
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
 <20250115-topic-sm8x50-upstream-dt-icc-update-v1-7-eaa8b10e2af7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-7-eaa8b10e2af7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bFFKdJE8M7jMKKC5va5jR2cX9fsG1VK9
X-Proofpoint-ORIG-GUID: bFFKdJE8M7jMKKC5va5jR2cX9fsG1VK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=634
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280100

On 15.01.2025 2:43 PM, Neil Armstrong wrote:
> Add the interconnect paths for the USB controller.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

