Return-Path: <linux-arm-msm+bounces-66524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5443B10A1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAF4B4E5BFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79902D131A;
	Thu, 24 Jul 2025 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mfr1dc8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1062D12EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753359926; cv=none; b=WkWik0Y7Qqe7TILWzzcFm1eifi7ICZardSFnHxoDyDsVGWiwLffsVun6Ljcv+D+B6ML/kpeq4UA4spzjp9HPxaymU7N9G3ZqeX/FPyEugM9sgo2A35hr7A+TjG6WQZGsNJ3MTugVtKExHCNZegpbJ8LaJRa1lGabnfGcVW4rtt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753359926; c=relaxed/simple;
	bh=m7mnvsvZsHXBpWj7n28YYrnKFs2IYeSdflZGX9/AAqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsJU8+/JlhK+/LiWh70FS8y4DLI8GrtYocC7a0KpzTCF0z8S8vwmPsbw8x9cQCDb8VdewicZWQO56WO/iX9LMiSWqCPznC/7O2SK//PXnrJx3/pIf6RUy/vY5cdUOOwTOFDkD0hDXXPGwG1P1gJfp/DEOpHdIcmQe4aYdXuP8Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mfr1dc8a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9iu8U029489
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	616i8C2JxPPICwxxSnMg22TWk26CQbgVBwMD64cTZdQ=; b=Mfr1dc8aR7HOqg8f
	g76ke8SbLoNMiTccOAkKmI5QJH+wm9+MTfcbcIMA038PYN4gtttN8znq57+zH6zH
	6YJaQt7kWWaVir5sYQyI01qovePtvFueTA+qMG6jXIFe/XC+jWIGGnMiute9g9kV
	qu/vDSQ/JH8urSJmuyUPuxQMrDbe3hjOjEVxm5bJZPqBSRXYteRnZZNwoX8lTxDE
	bbkPs6EUxgXcFZB+y/+0mT4w7ylRAGEy2tyzuSXE4T67g6md2g6fob6Ax85w8W3p
	R9fNytR0uGmGQnGvZFcygzuiIlSEnHCpDSa2XNwa+55N7omxpVE2QPiKTa2DU312
	AWqSFg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1g0u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:25:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab5e4f4600so2554451cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 05:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753359923; x=1753964723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=616i8C2JxPPICwxxSnMg22TWk26CQbgVBwMD64cTZdQ=;
        b=sEVvDsE/BGPIh5p6CMkkV0FKcAfDph9plQSgi6qXiZzlusfJ1iiRYK5ClHX+l/9evy
         xTQplcpoxREvs3cctIUrU0pIsAHokebe32RQaKS7uxWdN2+HN8avt0bIn5snkrIZICAe
         kT4V2kgiNfc6nRiUV+QyZcnoX7iQOL1tsY5IFEj+Iy75u3jBdVrcLcXstKt9hmCNZbzy
         wEgHK0+3rRxXav9SIGPTepwMcXB9ee8+FeEepTPEjSZ49BQbjnhP156zK2piXKj2hsuR
         noj95RHnyd4n0JSl3WMTNpxc8Bk+MnMf5vrERM2oK+tkw811Ss8g0xdv3r1+DqkR1Vps
         Ry2Q==
X-Gm-Message-State: AOJu0Ywvv8b0fRA5LNidtu8eHCftun5kPF8g7TZ0IQxIeeU3GThST/wz
	DcbCtYB6VvjMsKIQQ54/3OS24IPb5P08d6CqANuz79I+7hufwsNrmwMmEfpftVLC3Zl3Nr9P2ii
	n3ysodmsQnCqO0qeV44V+GNeiMi/87x0Rx18j24c0ShVx2i3k0UYR1iSDc5wG5cpV7ANY
X-Gm-Gg: ASbGncuxRzfX2Z//zwjLAddBBoBZfoX1TATjRYsTspYf0BdWAi8C+ftLz6ppbHpzB1J
	rTGAlFNsqxg505w/jMBRVEsCJV3Sz3d7cYYB/ExjVMtcaNRIYJDtqrkNxKBEClhXaO2ajJzEqZN
	IYEB0b18HhMbUvtRnX4NGOgX/eDCEfbXAfj2aJy8qMGP4rk8TjKpbjwhplijcM/fiqvTOtcIEJE
	OnWF2tRQ+w8T5DMrT0WPfypRZ0vQP7fuDziS6WXwR7v3Dip7suVpiF1cQnjoDE8lML5x4cnkj7H
	BFdjP2rtSHJ7cx+UYPzXBS08OslSs5N3Wx81mVASo6CC4PMVcg+Z83AOqPCy2jmsdKiUlD+v2PX
	ZArZWlMYndLWIv6sdBQ==
X-Received: by 2002:a05:622a:189f:b0:4ab:8107:6c0f with SMTP id d75a77b69052e-4ae6df46e42mr41888691cf.10.1753359923191;
        Thu, 24 Jul 2025 05:25:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvftYunv/MazVjRvCSyIsGgRpyDGuWrEWabff4oLUu1zX3oYTlb9qbheMaUUAmqLP6+s54Qg==
X-Received: by 2002:a05:622a:189f:b0:4ab:8107:6c0f with SMTP id d75a77b69052e-4ae6df46e42mr41888391cf.10.1753359922601;
        Thu, 24 Jul 2025 05:25:22 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47c58b3c4sm106943666b.10.2025.07.24.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 05:25:22 -0700 (PDT)
Message-ID: <8a55bcae-46ec-4a2b-8e2f-041c3a358d9d@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:25:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sc8180x: add empty mdss_edp_out
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
 <20250724-move-edp-endpoints-v1-1-6ca569812838@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-move-edp-endpoints-v1-1-6ca569812838@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZvuPmpUQiKrwijjmUZNlm6bk05t6GwHe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5MyBTYWx0ZWRfX0dKSQcKNrFqh
 Fr6CK0jBeXfrnvlHkNpF6vmV1oMSuCupPyuKRihPgtcEEhcXBwhekzdm2UowVcQemhJr01yi8Or
 qtVK08wa9ymOsd/Z16sDpm0zKIHW+d2NalspM/xhrJIJ+8lLrAXDCYpsT5wzzp3lNkI5nlmQCQl
 5iQrTUqq36qCD5p4wrnSaaqVZPbz/QiJT5zDpbAZr6pT42K8/PpDkx56/brEEV6ys9sevLYnYRp
 eN1bz/Ckd4bPj0c926PiGzqIjapmkFPXJG/t19Hd62ZiVAMzfBiPJSnQBYUHRuFL2xYWn4G7Xv9
 YB/RaPCXiw9XDJn7G+t0x1K7LuTnpamtwf7IsDUsv7Hjebq5KifiVZdENG9jFFqtg2zAwhL+2gb
 G4XwPUQaWLh5vA2LoyQ4l8B94SWJoIL7CqFMzFJjWGFgfp5KjRiKovMJyRSBLlGgMMMoOQDS
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=68822634 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=B7dxrb8V9Gn_lHFWds8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZvuPmpUQiKrwijjmUZNlm6bk05t6GwHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=743 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240093

On 7/24/25 2:23 PM, Dmitry Baryshkov wrote:
> Follow the example of other DP controllers and also eDP controller on
> SC7280 and move mdss_edp_out endpoint declaration to the SoC DTSI. This
> slightly reduces the boilerplate in the platform DT files and also
> reduces the difference between DP and eDP controllers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

