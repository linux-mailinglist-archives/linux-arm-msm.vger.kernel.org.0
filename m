Return-Path: <linux-arm-msm+bounces-58734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D32CEABDF41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221458A4BDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866F425EF94;
	Tue, 20 May 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEhVCghx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A76288D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755437; cv=none; b=kIHHB7H/adGF6G9jZTG4VnsSFyF+O3GB+eFlNIxIz5i4Vhl0IQldEiSK6ielqeBCCuPJzyItX1N2T1ERc6MQmoP3WKe7UBCrjHcjNX9Vgc2jq0vWClZU+zvxXceYOywcgTJNuJlDPm8kZ+EmLwDNA3FOWFl38ZitmQ4gq/fokNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755437; c=relaxed/simple;
	bh=ELBPuQq50T/PZTUbYhxSitilB0Te7fVHk6fN2KTVz+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cT9Pi7t1kU7RtnBpmA21Qv5rKHRDkuQQ1sw0ExSPlU1FfM7rIsMkNYVxnhNCNWsIHGWXhy+iMSoctdZVIi9Ksy9ZTmwNPz0DnRnFNl1NSIkFf9/IrVWBhQQVD6zFX0T+9U9a9zTKQl/o3Z8onC6x4GJxj35Kv3OC7k6BhMebJtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEhVCghx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KCxQr8023259
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 15:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhEAo2ohpYy+s9p58ERnvB+5oPpd7tVavgY4j/ZM8Ck=; b=cEhVCghx7L+QW5Dr
	I9grPLQylJ9mG9uNLscznPh9dAnY6EeJLSuLtnzVCuSWQCbvSnvyGbJJGWSSP1td
	dHCWQRe1R2F5Y42lY/CHooNo1LF6sZqjL9IHMroEZu7gSNUSZOAmvEM5vQ5+VUUG
	eJoj738U1E/3Uq2HLi+sLqif6pBGC3pYl7gAfQICQihMsn7k7RJgAW6LC62ClAMi
	wrSPE7HRN8XW3L32KNfG31pzuY2LoFTbbtu/DWZxqkfyjqtEeTXfVDNHhWOr0IVI
	/yARk/gZMWf6hBuE2QP4e/cJAX26xGHxnDImu+SkXp/7cdAQGnC/XSlL/n8fBIYi
	Y793nQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041vuf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 15:37:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c0e8a5e3so8363406d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 08:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747755433; x=1748360233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhEAo2ohpYy+s9p58ERnvB+5oPpd7tVavgY4j/ZM8Ck=;
        b=pklqXtEI1ZwUBiRKNsFUVsVb3jnTr0sHbl3NFGLhEDamvXGWLiMBZ3r+prcHETNuA6
         cVxhTHmk4d7AfF5QM/cQ4CruS0mhbKYqYXvalzKNPyp/nLluEJYEHGe+gJl30182RH/k
         AI3u47o2qWrWoTNT/PsO7HjtYaYbj0lEgvZqIz/7ueWjW9y3R4gk4ZjCBOaaZtthnzRa
         7XXb5imnSbYgt1Ftb3eNPZmX20ny+RXr6fTERYtJFKHkyzO0e3yfcR1MXE8iCuOPFBIQ
         Ldav8P3jB+yBJVl3wkTEyxh4CZm71Nq44C2z/6+ORN3bwzn/f8jVSbD4CKNot3MqJW4v
         i85g==
X-Forwarded-Encrypted: i=1; AJvYcCXxF2g8QfzLPR2K5GjlguXTmrJthBKtdzUbgrE8MDmxeOQ5b5InnMpF7gMqEzpadRtfbMgZun8t+xfpS+k4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dbcHNJVrIBzPTodTE7A31nMu0AxUUpnjnCqIvnf+wiRigbfT
	OTiYXiDtFqO2VqHiFAmdw/c9H0NxrW1vB118XqLn/2HJnH92Y3YUuguPKOmf9V5RyBZrXCJ+fdP
	dFuKxRYvofF6YzCDJW6QSNWzM7Lw3XYIa+or/sgAecg/risf/nwzdgl60vybXMd9Dg6mo
X-Gm-Gg: ASbGncuAnHsjx64LacW9BFs1aun2YeGSHGrpHE36WkoWuOp+kjwRczXrbvvDxW3Rk9a
	vy6Zbrsi3fgRRS+M3LBlEK90ziOc5pEuUCVsTDBd3KUtPOUM4FlAAqJ/UJeNdEmFNdclKPo1vKx
	wD8m5oO++CCtSOB+obLhxBtr2/6TYUuUttD17eHleneWGI4F7ccp73k+0LNK0i2RtgFwplQXWdU
	3glINnIYBUUL0eA9aDPsVO7pYPVhR+D6fVuQvvV6UWFN9rosshJFEwBedaKYtQqvahDkc1TGO0l
	7r7XxJv9xESTOIeJAFtkDeeRMT+15JO/Vbgu5zDat41RaNQKuPIeG9923w/mONGo6w==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr69651371cf.12.1747755432670;
        Tue, 20 May 2025 08:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET1f9uwcNCHTx/i/nFsTl8x+YLo02Ldn6Gbz+flNBJJyuFT6UR2fkNYRpveilNC0PD34sd+A==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr69651171cf.12.1747755432336;
        Tue, 20 May 2025 08:37:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d501f7asm7319908a12.19.2025.05.20.08.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:37:11 -0700 (PDT)
Message-ID: <1cecd74a-2711-4c29-ba39-b4cd1d4d70bb@oss.qualcomm.com>
Date: Tue, 20 May 2025 17:37:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <20250520062618.2765109-2-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520062618.2765109-2-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEyNyBTYWx0ZWRfXwuXUlycPZoFo
 p5/6/oPNjRVs4ULL3HV0/xQBOtzTkPu/mfDogZW0sNtUYiZdS3ixsTC0nGMLbBuMo4vSwO36aZP
 hbyMnukD40EHaYcYudrK9w4cRYb2qdqXfSk5hEjdNbZ2R/OSvRFfENlNwe9RbS/VAPOoVbJu2+X
 XkGIuXHZCorBbKpLQeGDr1Zr9Y9cxWr0eZnyRoZtj9xpWdB/8vCKZg0W2CvfI2g/imKXgXinojo
 ASnaLS34u3gEKjKWE3M5dKsdxXNVzYUl+i3HgKknuucwnBG9trRbL4m2O+h17/8Rn1gNUV2osNz
 q1vaYpigrUz5u/+YphDTZ3qPA8/pKJk6kqBqZfmN8ZxJVHD3q0QZ5rSBRq8+SOfiMAP9YFc8ZWR
 iTcjeE96dzqlcoJl/bPMMKHSnv4ycZ4ToOgX2XB8lfP2kRixoSgXam7ENlsTIPhdriYdoJuB
X-Proofpoint-ORIG-GUID: HNZiqShLkPU4-9PLjGhCfomuQ1mWB1xR
X-Proofpoint-GUID: HNZiqShLkPU4-9PLjGhCfomuQ1mWB1xR
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682ca1aa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ftiIbRw9aD-W0CiJHUEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=798 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200127

On 5/20/25 8:26 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

