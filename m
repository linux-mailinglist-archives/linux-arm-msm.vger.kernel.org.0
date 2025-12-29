Return-Path: <linux-arm-msm+bounces-86842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E3CCE6BC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B22930123CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5A331063B;
	Mon, 29 Dec 2025 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1V8Wyhx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyTjcnje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA24829A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012117; cv=none; b=SPWb7lYT83WkjjBAr/gmKnRmTvD7HhmAjRnKoo5q95g0PWfxrgOCdxq9nWr8siiNXU1zJy3eAxzbXraonw9d0t4//VpSHRFuFRCXi2T3tTVRwkabgrs2h71mPnx5GhS8yG8+ov4iSWA6iuabQ42DNLGctUolyBEPpP61tFqsP3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012117; c=relaxed/simple;
	bh=ySJSaV/TP0anY8fc1zVTn1lt2YQBIWDmDxnI9r9VWkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8hAc+XNvYCPbwGR9/fIWjmM8jpZ7EKuhNKs2/ZuFekb1hs/5yf2YfZUhkPgVHNwDfTZkr04nXuPHN5Ru2Mbps+wRCp1vV+vBI2idIxH2DCjVSO0Zj9UPO2TC7gQABh/QnqeoJzpOgmzzBU+IAnEVqclmDX9M8txccqXASdeMsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1V8Wyhx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyTjcnje; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9UTVB1459065
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5AX8MkJVQzhBiutF+PoBNDlofSHRgFBzjF/RjLrZRw=; b=G1V8WyhxOl7F+OEZ
	rJJO60qNcMRmeTVjM5IgrO1od1LSgBoyTdFU/YU+Pht3deAeVQspfowyWGFXC041
	EGL1QeD+cAo3BwEoIGcb6kc6XvD+own8zTClxB1phFxFi/KFVmcwdxQXv+BzSB7R
	jXjZitp6rQ9fxOPLoZxYa/oMVK9Jeq9fFUzI45kUyUMVb5n+dhpbFN3zx5iD62tf
	ZPPIMMeD6KDxn5Ax3RvrSUbLM56o1vD5JkQOfsNwwVkFxkpdMkz13NStGAOK9tYz
	rmSKNLaPTR+q7U/GJQfmqSQjWl7sQR3X0anp5nD8inmQi1UrdLEGQDAFT3tiWejz
	S442YQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj2ssf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:41:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f34c24e2cbso30743961cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767012114; x=1767616914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5AX8MkJVQzhBiutF+PoBNDlofSHRgFBzjF/RjLrZRw=;
        b=GyTjcnjeH7jOqVEkWYe2KFggemQcwN9lZ3zNBdlCkeYmBEZw6wYtdxPor/lZajtwMW
         1eZXX6PpDOl+HG4cNGjuYhtmnQTHLPkXiZ/LK0sXloZkCltY5oPrtbw9LUCPlXnf8Q21
         oOMG3xOCJ+N+5XOh05ARtiHBCzRmx8ElaWiPPk09S8W69hy1ua415xMA0rW35PjI8ZTo
         sCHGpdwFXleJNFYhWDgMEuff/WSev0emH6F5g3W8auX+1QDl2zQ2aqNiRXMGi42G3PCM
         cyolT5k5DLRisnkJxRMEIaoE95BEEURZJd19kLeiWGliMBp+YUvYO8C1WQsG8Igp3pYY
         MEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012114; x=1767616914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5AX8MkJVQzhBiutF+PoBNDlofSHRgFBzjF/RjLrZRw=;
        b=YFISbHio+FBBiO3E1B4r90lPL/XWhuAr0Bz0f61OS8nJVLMdYgpXqdNDePrGtW5sOe
         2/xI/pka8OmTebfT78BKBkbHoFs0jDSntcR0MvAqkrfVQlyb3vEFrIYnYuQmrb6oY8Fj
         l8ytpt2UL9Z/3vVcrVM1QjsQwR3tgzruug6G+qDqpCz0ec3wyIgVCmRlylo3ZKcBo9iT
         zrwhhZKnLRJJ6TQdaiC1RmCDdTNy6YcYfawJbJ598MNmfCHoELX6cbyRX/KmvH75vTNw
         cCiGcz+m1WVhgFE/hKX+H4AgbKryeqn9fNqH3KDBu6yUlwe+VcsPsCl9VJOwMGB7WfT0
         oHkg==
X-Forwarded-Encrypted: i=1; AJvYcCX9lvsSbJeiGGX3vm4tdA7RvZft6coTjataLr6NfUTkOG6xTckj4IFHwzdr4/yisdwuMVIIqPtxI0POTU3D@vger.kernel.org
X-Gm-Message-State: AOJu0YwiynaQlER+WLFUlqtjhVFGA15CYAMZQ0N8pd/rXrhMyZudmsq5
	pY9uJ/gSFRnfXUgIQig6iS4a2c4qitH4cH+89RfGQWq9mDz40kwFvZIFvcjV667UAQOqVieOOoS
	rR2blyCdIvxlL51X4f0amGGbmn92ucP7mBnux1Vfc3UE3X3nVSBMh2HOlnOQ8AIycWYOO
X-Gm-Gg: AY/fxX5eMsRLF3+JFEu22QdT1hZ73AyHilAV1C0QTb1SLds9wQH1D92Ng/zZqqAp6d2
	X5lfdUoGKgMzflG7Do7hsr5Rn6sHL8GKESxCeTMyjuRuRITofLAsTreGaDGY46b7YK8/ykFz2Xa
	bJxKw/k3K5p48czSx2Ep9g1aLbOkC0LdpN+DFETZMpkCQhQx6qGcd+ukRxRGPgHwzfgPT1Q+N6X
	35udogGglam00art4r2cd+NZaalRp0rchwca5mKtjRV83yj5wd0NWps25C6vp0FKneE0FKtlSvC
	D//syzhUx+eQk9Wtj4skNk7zQ58NbB+TqkK5YzamHz43UHsiiaiEPKN5//83ufZBlYfShS9ZOsq
	DI5e+HjZUq4rO4pKRJg01ncaxwTDdSeExHBgIkw8N3CRprQDqvihHfeoVMG3wrbW6yQ==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr322148291cf.0.1767012113926;
        Mon, 29 Dec 2025 04:41:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn3sDmK0QlQaht4qLbDuOtAHjPWD06bERWul/rbCDqBGD+bR43zWzYFNogbwkjzmKnxOAdsg==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr322148061cf.0.1767012113429;
        Mon, 29 Dec 2025 04:41:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad1e6dsm3364893666b.21.2025.12.29.04.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:41:52 -0800 (PST)
Message-ID: <e2f0b92b-d880-4de7-a708-c0de00ec69bd@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:41:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Prakash Gupta <guptap@qti.qualcomm.com>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229071258.456254-1-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WeiKFmqN_Af16sUTVwE3cQy8a4Mp-SmS
X-Proofpoint-GUID: WeiKFmqN_Af16sUTVwE3cQy8a4Mp-SmS
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=69527712 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gEHfgoT47xnI8piDJ0QA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExOCBTYWx0ZWRfX1SmWZXBq/Mcp
 bxlpiWl8JZhpi4jrbaxWpTAbRylIc+zooRKN+Z/yc58EMbYCwe1XVGpvagBt7i5yE3NjPcyyF7N
 VZQX85ZpaG4uROQ+aKHXvY87Fr+Wk/qWCMHFB4vjcNUG9kYV/xLFWdInSADdU+SKh6NzWSiVRub
 4jxqh4nhg9gRsVWT2C6vjH5qd1tMEjv8JQKnWCZyg4sqJO3lefNLlxfy2bgs+sn/LEy7v/HeRGe
 eextRk88ACaJjyhSAIIznkRfOlvjPH/F5DrD7ZFgpZJwtftPil2vwijkrX0gcGLVIfpy1oYvkCP
 yAzMITV/cuuM5Z38trkqXQnojJfq1r4z5TAUvTb8DZdRKubsimNKfoRweHx8ECpJfjEMNCBvvvV
 c/sKR6a9IoMzTH8R5kYCFQbShvXArbEeeMl0rmEp2ac3eiZ+QO0AaiQa+Ttc0TcIv1V2vvbqhOd
 AVVBObds7lhDyCruSyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290118

On 12/29/25 8:12 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propeties for GPU, display and video peripherals via
> dropping SMMU stream IDs which relates to secure context bank.
> 
> This problem only surfaced when the Gunyah based firmware stack is
> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> as a fault by Gunyah hypervisor which were previously ignored by QHEE
> hypervisor.
> 
> The DT changes should be backwards compatible with legacy QHEE based
> firmware stack too.
> 
> Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

This will need to be resolved by something like iommu-map anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

