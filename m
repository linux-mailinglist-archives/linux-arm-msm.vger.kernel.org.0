Return-Path: <linux-arm-msm+bounces-63920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B34AFB24C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 13:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F24A617F17E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B85202C45;
	Mon,  7 Jul 2025 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CV28eBDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D01FF1C7
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887894; cv=none; b=Bh1wYSjx0zkiFfFJNIHfVLEBmE8PFA1CTE0bSOA1S63/ml6VaJJFKtLHy8fW4SZSs83oCknyN3hYdLYMCrzTGKsGp41IBNyiaMnagzOLoQmjCd9CNcjtIYKIWvOjWBQl3Nr3ljKOtaL6U+xW8bRXMa8Y2Vv17kHdk9mC+DVgtSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887894; c=relaxed/simple;
	bh=EHqNUQU89R3sore7iAI2H4xqVvujymPymPAR6GGY8Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nGPJIpz+YKP1NKcrgZkJj7DBjzhgt/cKSg+whUeTJKlSb7a7pbuExC4s995LGs4K2gr6pcgoi0WDvJsRmPckT2obHcaLjWah9VcSKQLhJEo5WXmFR2/PnxIfIGDuLs2hpU4SOnOC2R+j1g56Rgf9bZ5AXO5B5Z4/yo1aOCy0IQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CV28eBDt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679kQdQ014843
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 11:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWTeIruv+S7Tt3sFAKNHbEJ7BbFsYXgmX08CqCNfWkQ=; b=CV28eBDt1MmHCUvz
	9jfUSDayPh7r516Y9xM0ovaJvXwfZ78AeFUW87DjxUISO96qc4qOkzO/iS9hrR18
	9he3jmNF9p4jwQxpzHpsjGC2ZcTB5MpDLDnflcqdCtXonL50RWaFLMX3WrKMDLLb
	jl/3own5ZwFZk1Qp0c7NYX+nZMqiNwb71cIEa/wEheS1tTdSV5CJvYjmD/GA/aRr
	ATwdeekTIOwv4+tj8DwiYJgoo3w9/v8XNsYx5FDTzLYOZM3kzJ2LBD7jFLlpzJbz
	jPEoIn4XjnmGFEV1I3TNboGsm7xsVBSNTTzQuyS3v//hAW7shmIEf8cjgpwQwNQH
	PaMk2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkckbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 11:31:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafb22f5daso9181956d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 04:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751887877; x=1752492677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWTeIruv+S7Tt3sFAKNHbEJ7BbFsYXgmX08CqCNfWkQ=;
        b=PAat1KYJFeTXWyh5zaCXeKigYv6D/I5CnPrJQPX9xJmjDXonYWffWecWpQCiNrr1Jo
         0GNaxD3xPFeIx3SAOJlvsdgdkr09wTmP4sM+FXq1TFCmEbtxm61Q+a4RSdOqDHQfMS+B
         5FLWw2/o+TWranCLv2mlr7wMt0NOiEmNr4hF0m8DVB+Sk4L+x812SVjkEYZ8qimJW1DX
         DES3iCu830oVNyRjHMdD+NyCciNAq6JzIIerk6KS8/XIlfbuCLRrxVE+ZH/wZqxaysBR
         Soa7BWKT0oqj07UhuVbsBkNLmxLVn1A1G4xX1nE6qnHw/KctO5qC15oudMxbzLj2i1AZ
         +8/w==
X-Forwarded-Encrypted: i=1; AJvYcCXM3bkEKphRKEhZu+q3bwXr4xrY9BQOOExLb+t1luIRC7jZalsG0Be+lD/mhCGDmuqTOnBx3ZcMauI8xF1t@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSuZbAv3lSQbMmDYUCcrBnpggo3enubW79OGJ2ILRl3g7JHZC
	K5+YTjiJ4jpU8eXsuHsBMutdUcSFN1WoBxPohZPUNYYSqhF6Y1MuV2rq7XMAoEh8abQ7DuKYAyH
	xRrqJGEmPKP9U1J9GtGSwQoJok2OPwgxfadjwuFUO45RuI5954nI1aWNTGutu5UKFsPqg
X-Gm-Gg: ASbGncuZvqLtbK3Rb4DFLfs/TFGS+UHYHe7JHAyp+UIXRlxHC6IBUtzUdPlihfqEpaf
	CPSvMYV/igknpdA+QSCM+o3PgxDoxZitei5GsFerv+lso6Su5qdPfcdf1Hbjuk1MD2DFnvcaHNL
	4JNS0AJhsBQbOFE4LwR+HJXr8L3wSFMXgkJvrdo/JbIG16MsH2wwmqGICKLGZIG+oYL+Op3RwyR
	hpRil1LHnGvMDhqfqTMntYg/RMlv4Kl+B/KNVsVId8mp0+Besdry8KbHfsOUoQkIDsB2UUrDAea
	+Vy2f5yXTQCgj1nH4j0aK00E5o0W7eHhFm8i7wRVBFKfyUXj+bSLqhYIdZCsRWcT7ayf4nsJnha
	326s=
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr594386085a.13.1751887876790;
        Mon, 07 Jul 2025 04:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpaw9CJeuBmYG3lV7sOgssLhggh0DGHOI8ZYixyktqQXpKdT92pvO9ZNob3HUzwHwWW0HtQg==
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr594383685a.13.1751887876211;
        Mon, 07 Jul 2025 04:31:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93c8sm699187866b.11.2025.07.07.04.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:31:15 -0700 (PDT)
Message-ID: <f2793909-4210-4ea0-9f26-af03e0200c5b@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:31:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add Milos power domains
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
 <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: isuAtVGti0sFjkoVNTHqGzYT3-pdsrSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2NyBTYWx0ZWRfX1hTFEYJak1Gc
 2WfGOZlDiGQ4PwMvgF9118YTnricyO/UWbTMbkNEaLfUuXIo5fYkIKiYmwI5E9qFXgujlRUvkUD
 fBDCHbRYu5zkGhYznyjGgUWmjIYl8LkFVZgq8S2Du+2DGJzkpII8KDjGRdUMHZ4lCQODqrqYmAz
 HdP5LapI75ZakM45KnfqXsFGIRokI3OO+sNeu0FNXXNwwMGqL0/LGJy6ujdeV2RPvDS05AR9EMJ
 O0oyN8CvPZjnclauGoGerzRKcwM1StU5T7uZ8sO2oD/C1srXGyxx2oo/bcha9O3LZ4mmg2YvmGl
 eTLkAR7GCzihx1YKFEPRWe5tRGPbC9U54awspBAq96tKK13VrwuNLeakiMQwbRVIIMeBvHDIo0n
 Qgq5xynYK8m2qG+sbz4JZ+yZQYteZVsry+5UupSoHmS2u6woUwXzikzfx6oB6lJt9Oa5MceM
X-Proofpoint-GUID: isuAtVGti0sFjkoVNTHqGzYT3-pdsrSs
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686bb012 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=924 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070067

On 7/7/25 12:18 PM, Luca Weiss wrote:
> Add the power domains exposed by RPMH in the Qualcomm Milos platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

