Return-Path: <linux-arm-msm+bounces-56222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A8AA486C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C91F1890127
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4CB25A341;
	Wed, 30 Apr 2025 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iM4E/UQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC525A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009016; cv=none; b=P3IOpOz4Y6Fx15KTboBA8zrOlyPMHAyjgYxRghMCvBrjikLlCW7+U4S4aHRKenJdWr0w98/Ou2LcFqqP3x5OTXCkNptgjkeJU2fgOUVJdVWb6/ViWvD9dQ1tTDnUJdo0+d+4rImxpkFMi2TguyyRMk2aQ1EcqVZ6k3uCGnqDt18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009016; c=relaxed/simple;
	bh=1Q2QXKXdAqsuyBrrruUAb/meNWYdaQZckDHeqG5YaDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzrnvTMCB550oUqKNcebLNfqu2Ba3fS+wBUk7t7Ip9TRb4Q8TVJIHl8rlVh6v7dwWdog5U/G86+saE+F/rqrzy/zkqGSfgsUCGa3/vrorf2W3DKjQKTC/6gt97jGSrTLANpoLNyRthyWvGLAVam3L9UIpkzeMsH0a6TgIHEOdCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iM4E/UQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9MJ0Z021334
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=; b=iM4E/UQS/KtzSS/x
	SNEBJUQZCYLdSbL+r6w4OmeuO/tsWg85XMKWTJ1Cu9C7v9mMRp2Llw+UpfEtgI1M
	laid5A33cbbFEmqupnRbfVAywzml/Xichfm18kL6J7E5brVhvZtS5/G6G6QsAChG
	Ki7Lnxm4d7CDIXGGc8Fp5SCOCHFThyzJtFpCU7BP9m752hN7ayMB5lXZZtbGRe2K
	CMu2azS1sj9o2y2/9uPI21IxsZeXqZ6vaFVw7ExrtY1W9sbLsh05uYXxlCfI/X+V
	Sk0/C2cysih+EkpqlHpeGmbwYPlVM7+daW120GqDqm6rlfcqCsmIlhOqSe7S3h3Y
	h7kfpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u71srk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:30:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47ae9ed8511so13746971cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 03:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009011; x=1746613811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=;
        b=TjhpJE63moIInpFQU8eJrXJxH+jCNQPjjTgiEpRfZR2sj0dhx8lBxVcoISclymuGfz
         /dx/Epy69B0gxH0knwHMmT61OYI8EZKqMrsbAf1LqiOeYgX0XdKbIOAmMc1YnAgqArYE
         IugtvqtVYv44H6JDfsEWSwSlVRRegdNEGFYERieG6oXuVrPEhQkB8ycqqAS5ts00HQ6R
         9r/SIJyYOdfO9GuMtH8fYuUp6E+Mb8Q0cUdb6LAL1w1TzPB49Ndk8msUojmpu3rN7BYb
         bhcBQwQitAMsypUNegSKnp7WnF1Vb+R+Pc9zbTZhc2KNOA6pUZADvkABCKq15h0M7N0I
         uiwA==
X-Forwarded-Encrypted: i=1; AJvYcCWwKRXCkqlbSCPwyAqu+xWLKYo78ufsBy2YK9uCgxKugQ+3lxOEtpzfTM5/YP7FoipOSASdpDaythxQrVDo@vger.kernel.org
X-Gm-Message-State: AOJu0YwINlC1gynzYJrDMI+8anrxbjwJzKFxLzAJxS3IJ3NagOA0G1Ic
	Kf2hL33sZsTc3y0vpX8Wp+G/aYDOwWORIQMNeZXpFaLvY7fIaWFAwdj72wWiTvkFUk83E56J4d3
	NnGkeBa/eBtOeWc4ciZwaNdgXHzd5li1FGnyyDhti9CFQFer7cBpBFPrYrYdI1sRn
X-Gm-Gg: ASbGncsWSg1XQcQTllTaplgSm1OQRybTorn87ap3olcwOOeI4+8/Zq/+sOIcWX7+NfS
	xrzir5OCGyJbaZXtzKR/d1fJJH3/SMuXcraPkSRgWxHl/YC70w+Tzkc2m5aMMGb+cT0wnFTKtVK
	uFKWC2U4OCgCWQxPnKqf8dCM8NWUtRHklslh6JnschwlW556PXFZJlM9m2qzxs4zi/AvWoVt7f4
	yzsJd4Qwn5BRFxwfGXPZQRZNiZN5flzXPFfQNHhlz68ISjTCpFOWIP+wYYR9LZ+iW0M/M5Loq4m
	UOJ4AgrhujeySq+P/u0IE66clPCvQs/Frpa3RXxMwsHSG5ZiT21By062XSECQwSVcIQ=
X-Received: by 2002:ac8:7f8f:0:b0:472:165e:91db with SMTP id d75a77b69052e-489e498d781mr11827851cf.4.1746009011539;
        Wed, 30 Apr 2025 03:30:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7lXha6b1LXm4abb6t1fB1qndIV4/7aB6CwAhaxwGXUOPktd72Ez4ObW6QEnJdW84G7irwCg==
X-Received: by 2002:ac8:7f8f:0:b0:472:165e:91db with SMTP id d75a77b69052e-489e498d781mr11827621cf.4.1746009011151;
        Wed, 30 Apr 2025 03:30:11 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acecf27a79esm205373466b.24.2025.04.30.03.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:30:10 -0700 (PDT)
Message-ID: <8ec19cb6-bf74-452a-8a82-285b2acd90ed@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP v2 4/9] arm64: dts: qcom: sa8775p: Add support for
 camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3MyBTYWx0ZWRfX3x/Bm/44VLTD h3WahUGVcNqTDe32ZFOk3O4xW2bR2eyLuY5KWTZFvfYWrVq7PhgJKWkJPYZDeJnWTmnkUPfGecu 1HbnXrWS6ks1VKCTM3g1K/sXsh8tmtqM9GbHmXuDzX4ZObM2zgjvImWUEzLHZlMO08SwO+w8wf8
 pRg05+pph3Zp1SamKxhIjCNpO5za8vOedyoSWBGFoe8lh/R6AMqnPGUBEG0Vc+gGQsuMUIAPMQP jDpuHmceLqvXxdol+ZeI80bQ88atjNIiULPS2dCJDTSUDQPZKf5GLmkjnXJayNatrqYJ6DkO2nZ 5GrRcEdFXCAn3v6hzSlhjo91NdKqU4nHNlBZjgBcV1fkg/SN/5X7EfxpL7R8LjYB71GSEs44yFW
 Ue4pj0+ZYI6o5JRRmHTJISAqea8iKR+8ftENWnvjis8B+fqXfHLqpTuLbP4kpmTjaH3f8f2V
X-Proofpoint-GUID: ogPlnvDiXT-hdwLYq0JZs_houuxMkWLO
X-Proofpoint-ORIG-GUID: ogPlnvDiXT-hdwLYq0JZs_houuxMkWLO
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=6811fbb4 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=J3B29TH01z4cvqQAex8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300073

On 4/27/25 9:01 AM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {

a newline between properties and subnodes would be good to have

otherwise, modulo the ongoing discussions that the folks closer to
camss are having in parallel:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

