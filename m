Return-Path: <linux-arm-msm+bounces-66526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC56B10A28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 344A74E8379
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62502D12EB;
	Thu, 24 Jul 2025 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZ/bUx0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3E7272813
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753360100; cv=none; b=RCI9EsjdHoaYMsHGN6nslhqhpF74X87X6Ssi77Ks2zY3Ldsaj+/xexgofEqbTE87SBU2AJUNgZ8n6Z3zrrCKtGnAsF/Xbryco4DLDWqJnxXCm5EhHcSgicXlheKCoxVJVK8hLepfvAqiIieQLkWSZ/M5jHPW5vVBB4FSNXEz3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753360100; c=relaxed/simple;
	bh=PS/lPEJP/kn60OGyrwca/Om4b/q/eKQQkvFZLz9f3ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIpSxqYd+ZUNrnl63Wo0LXDfWFUyV+nkTpCs82yZv+7Pr4RI5qC3go/XfFEnIWCwyFMn3HklhLufiLBpWh9aO78vm7fR+bAV/aPwTs8MxpQLjffMRmMN+iq/4ALQ6qGu59vRr6zzzBMVwsbHNtXg0tGxsdsx3cNP87pg6OB5OSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZ/bUx0L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9egZf031272
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3ZLo2+2fJPY4hyQo6fk0rzcySBaD74Pvdlk+MHH6/U=; b=pZ/bUx0LPrL2GdhO
	LGFAos+lPY+CucStSNNS0Q0QtErvK1AMHffPLteTAo6QOHMDrCmEHKrGX2H4f0J2
	Jwa2Kpoe11XAnXRUDD85F1bnXabd11GGSjuC36nAtKHXW1z2LpGPWVDjtMYHEPOt
	VxOEfbPWkChvXQb56bG9pHcLOHSYFpO646b2EuWCLU+gXxUiLW4wfXQP8M86Hq20
	XZukhASBRyMlsJqFWVgRVn86bEmwD3N+58nFWjlyzejzvOe19muWqOLdNrNv73vK
	meC2cSzHSfwA0zgwQqycn5l3/5xyv3j/OiGk2Vr/gr2do1zSls54VapgoWnjzMBP
	h5LWKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vf1y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:28:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4abdc49ce0dso1905301cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 05:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753360097; x=1753964897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3ZLo2+2fJPY4hyQo6fk0rzcySBaD74Pvdlk+MHH6/U=;
        b=eshzg/jjbLSgvetWmKfW+ZQ73k/wOAL1fyEAHFFaHbpiyH17h+yQ6Djg0pDuoPnBzB
         rvKRVK2exhJFklIa4VJI+t0DZqyk3Q2Y3c+DGDWQh4JgXBvMY3ilmwOSbmZhOqUqsY/X
         Yj2F7SVpwdPChZ8gfYxvnFI8JBDaSUJjOa70OIy21tsyBJgGMA2ypdKyli+IN+FYWapi
         xS3umHLZpL5Iab0ZdOv1cGGzc3ofr21KIoRzfTUONkLf9GNYJ0WAPhgybMVuQX+uuSyD
         wkWs9I6SG5vF6KlmW9w4L2gUHh+AOgxqcplDB9BUHdNdvqvoZpaWIjdPcZOg3+GWDcKi
         364w==
X-Gm-Message-State: AOJu0YykbgtdkN3JAMVCm+v5TD1y7/1jXhLtfd3fAqS6z7lSOkWP3GwQ
	0Hlulg0q3zOVmQ9XYHWADaCNaSdpLJmFZ2/7YXrDmH90jYzrrmX3g8huzemlJmElzP4XjEJzh0O
	7zQ5JyVrYtmb2lw9oqpZF7HgJjl2cvaaN6z5dnvfc3nJ9pxSzotpBGkXdUVgLIF4ML9+0
X-Gm-Gg: ASbGncsUo7LTpif8buigmy7QcykG4epX1/AGxQULQHefmILUVt7eDFL8eRcn/rIKNiW
	bFsXCR9xJISGU4zYBu2N1rCWryIMmgo0XnjTdFJA8Sv/dTS68nLKurQm0Sn8SYWVR9MAD3oFCji
	tDm6fWD7zTW/2ecvrG0uGfRbUkM3qTnzH2PGpB97Ao+mSC/4PWRKXvVKOYZGxnezbaeKJvYH8dX
	Zjcq60Lp4mWTkAjV+KKjLwXIA9zqGHbHGYbkJM0CGNgu4vjPTDPkLRIv+oMnxxxg8AkRn5jnOUu
	YKKeBzDc4lML+Cze+ETWBkNX83fBn6/kwaF/rdyDEy1iJI68eKY2UwGETRJE+rZn41wz+gF4EMg
	W3hX3VUZCaHA9kuG1NA==
X-Received: by 2002:a05:622a:1485:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4ae6df19501mr42399401cf.10.1753360096927;
        Thu, 24 Jul 2025 05:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG04/Btn8OG5XttwObKWzhY9/1kfcycD5C2rV8n13Z+RV0wFel9k+duC5TJvgsreuW5Pjh9YA==
X-Received: by 2002:a05:622a:1485:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4ae6df19501mr42399071cf.10.1753360096374;
        Thu, 24 Jul 2025 05:28:16 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff439aesm104487066b.150.2025.07.24.05.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 05:28:15 -0700 (PDT)
Message-ID: <91857a0f-f21a-44b8-ac50-a551abe7c5e6@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: x1e80100: add empty mdss_dp3_out
 endpoint
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com>
 <20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r4eZQqiXAQ1TICYPDcaU_xb4A0gOoYzd
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688226e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=6j0C0c8BI2W-d_oQNA0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5NCBTYWx0ZWRfX1hbd9vBBmLeb
 zo2/+a1kWhP1vZOvtGwp/+QHGPxIeGIAhesps0KCercErzjc3+rxAN1oSdzTrjMDB+yeFiehZdD
 FSTEGOKVQ5b+a6ys25JE16u8eKZ34Jv+lkDrxOJwsfS2J5KrytLNXDpe7HLbJYU92x6vFfORDv1
 ndUXpqeAg3/RS1UZorQjNFs8u8s/rbmUK5SlNuEY4PzvGpiS2fSafqBaJVCBwnCJe8PvvoXAivf
 4+lmoQbFuBRPchKq7ZhZIDyk7LVMMdlk6Uvc1CtUNwyzYoDZGUB8t7YoW1XdZ/CEraMweKjDAqk
 Q/8jlyKj0dYlB618g7KrOpgHsQ1C18Q2DMoxahH6+Ysvk/9Q6aFvRhr4jz+Tg6cstaMlg4yTLg1
 zY6DMu0Nvz+p8jOCAc4U6Az8UiygrkTfT8oMgRQfSq/KchIKH7B/DzBA6KGV5FLCladyCHZJ
X-Proofpoint-ORIG-GUID: r4eZQqiXAQ1TICYPDcaU_xb4A0gOoYzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=740
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240094

On 7/24/25 2:23 PM, Dmitry Baryshkov wrote:
> Follow the example of other DP controllers and also eDP controller on
> SC7280 and move mdss_dp3_out endpoint declaration to the SoC
> DTSI. This slightly reduces the boilerplate in the platform DT files and
> also reduces the difference between DP and eDP controllers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

