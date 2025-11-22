Return-Path: <linux-arm-msm+bounces-82976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD0C7D209
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 14:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E529E3AA2F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 13:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AC11D6DB5;
	Sat, 22 Nov 2025 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkHHBHDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TyEFL1/A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C56260566
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763819992; cv=none; b=CasX3rDc4bO9zzaysX6OpkA8uKt4xXwRrKAACdrCUxY1vyiTf0TxK3GXkzZUUMjG0qsMcpIQhsCpMAmu9vamEAl0LChtRLl2jUKMwnqgUnMGs1KdF3E/narJ/PVbyLuSRafy92H7f6Hg13lw95l8l2GUo9qbStVD52yiMcHQHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763819992; c=relaxed/simple;
	bh=EaGOTqboQEXrohWb4N0dM9ebND+TAA5iiSXQGxAjd4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/bwQy36YR+Gk04NiJxJkKLtPYIvORoJ0DVT/8z1Pt1W+MsuMuqAAcGPfnKEsjklk1qiTVRu4jXRkP2AOK5HSzmYJ6Yrrnf5T0ZqodHjYsNaHlSXh4M4qKX5QrjhtgK09cgbGPdsiImxlp6PHjnrGLj33HK8XdJGoUAbqd+dSKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkHHBHDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TyEFL1/A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMCbw4t2480396
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPiNAw1Tt7RvkHyG8Y7Sk3PFLPISpHRMaZn89Q+0vA0=; b=CkHHBHDFmKRJetWF
	BTF5P9rQP8repvG6d0gkqwZWg0dTXYONHjh1vx3a4x0EqrffPCCl3Z91MoVbvluz
	ckzFVa1prFWXIFOAN6QGQkOb2FbpT8+e/4eN+vVglmyqwYAkS6KiSekpYCG6PwMW
	1JXTf8KzbIUlivIeDFQnjIrTVyNaGMEChpsVq9uefFKNugW87CkYxf/tf95+NsTS
	WIM2NEFmhcNj11cX4uCuBmMnV0p09/6snnaJTo6jtH+NJGczOkySWgxgRy5kxtfk
	dFL/orxmn4e1ghReTFTHJHKh9L8z1VkMWyfjrcVlHP6r3dcA3qMbYejtAdo8k5kH
	DjX2QQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak68drr7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:59:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso10276161cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763819986; x=1764424786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UPiNAw1Tt7RvkHyG8Y7Sk3PFLPISpHRMaZn89Q+0vA0=;
        b=TyEFL1/AgV0pca70944UUBPLQcEsOKBpUht16/InSEkEGJHg8OYdpW1nu3Ak1mh7Ge
         5IgVNDhEu/r+Lhc+zgeQvfmbGZUjiNIO+XfRHvx/Hf7DUM7qCNFRkeIMdLq066MFkOjG
         aa0XxbhcKRFjsDhZJzi2b7cfMvFkkjTd5oAkqGVnAWlgb20QX7n73j4MZ6tu+wgUOrok
         DNXFYeSykMqwHvixeaiir9duGPwCVzUwcdhiz0QCoP1CcsRK60fYiao/HI8ei6sDv/jN
         WosstvyrBRoALc1WgEdA27gTU0ykxSLZd8TsSwBUxalUfqtqRnxvVrHdvr1BJdD4KNg4
         K5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763819986; x=1764424786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPiNAw1Tt7RvkHyG8Y7Sk3PFLPISpHRMaZn89Q+0vA0=;
        b=AqfT0xVeJWP1SRbD5lcdOeZaKgsBxDDlPklCfrhLIzQ/LN2ANBrlDEXXFRS4qTejDE
         josgPxuZh5KjBiiL/lVNUnLwzQpG9D66Qc/i1potz/HxCzf0g1zanDdIwpDFMNwi0unx
         Anfr48SKfFkryDUYnzZycbc4JGQ/GbTIc2A0qpe8X0kA77Mq2r9tCXtrYYL1wmvuNi+g
         ZAoaLWXUmU+PHJ8+rhnbOBbU/Iiz2oc1mBHH2UCLb0uoElTXgxwFb7PmQF3PAv6S/Th/
         0mdOMBkQCY/XXCnIEEoTlRy5cuzCrpkaf68BTxAlvuG+ucmhb+7dgMP1nRTqPyG2wV6Q
         4lGw==
X-Forwarded-Encrypted: i=1; AJvYcCVmuvzKjejMNs3/B0Lkn22xxb17aGCCE/rqHj3bGeWfz9LDRKhJDKvMgUA6IoZ7D5PM4OePB4yKKfTJoxo7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2pO0GelOvTzaXDfwu7FKDmhM1JrsVAXgcKhwuoMWSF5BEWA81
	c2RCAd6neDzpEpAJZNqujfGjkEABTAF7rdBrk6EohfvcC/Baks6OkxbRRhpDZO+3uFTSZIMRDJS
	u/6JqXa3AbxSSsfSMujIaufYhMDCbEfuVWy3TZcevlKZXl2erGUkO0HRAbx+hFlIkfcKt
X-Gm-Gg: ASbGncubcimbP6hNj6fAqUYAixTG94IN3ZvKoyTl1cc3O4htuWsJOV30adKH4+3CxCI
	g1+6MHdEac2jTqISqmuywwfSbjAwmpi3C8QuwI9ugXxdcWaaJz0JEtqxdoJq2hffjXsenVGjbsb
	RjL2c9OyVkcvv8bCPYGzlDHkV6KHghNs96YEmjlbew1OAnLN1DbfrePkc2afhAvQf3zHwCofdXI
	kvHzHg//1UMxbQsUsbMLVAqx3alI6kryhcJYIst1pTQegkPDgPPYxNUc0SvSNNzk5A5U23ua+7a
	awY3YDivgpxQQ0TadesOm+zS41igauvSC1Dy/tv4pqHewg8Uts+zRAqkERdWH7fXsLd+h2tDKD8
	RG+sZ8EanPXmoPcD70/54AQ0PWPzFQupyor2wjiGm62kyoO8RpkfFS6QpuT+G2YM6TXQ=
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr57660321cf.4.1763819986390;
        Sat, 22 Nov 2025 05:59:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIJN+vL5B0qzR53Fu8tdU0kJslcRoEiovdfi/oC99Dchs3yUA9islhgT15c7fVbBvVSSpozg==
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr57660091cf.4.1763819985888;
        Sat, 22 Nov 2025 05:59:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655038011sm737185266b.62.2025.11.22.05.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:59:45 -0800 (PST)
Message-ID: <039dd3f2-3ea1-4dbf-81a4-ef1690c9236b@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:59:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExNCBTYWx0ZWRfX4yAxbF+AWSfv
 1BQ6IdtA9XCOm8RauWa0tieC4c5hbaeYMS3mWZUw6Qm6MRsrDsd2DeF5WChbcHix+llOzMKtpfG
 9UIUw/7o3g+bRCF/eH6n7ADgkE6y2AezEkWCX9a+8eMyJMbho1XpzfggcKSvYs4V1rXqKNCn9W1
 rcjECJOgdLDWTx35yQF4+4c3fDsVRPQe5OlRzCu3WdHHmTxnhPHFNs6nRmJ6zC3sb+h2gorPHeF
 smBAe2yIyc4b5ahJawbRz13owePMskKkDjARP/2sLp7E1jTcjkFYIvcbP2M1TONrQac/XOuKJ4h
 gX6nuIvEtYJTSkup/cy41M5Ik4cIqEVrwlutDjaJmMta7pPTcDUe/SEwHFInNFoOPtYEZLxQPZy
 HjNKPxDZ9VhxRRLAdGanT5e/108LXg==
X-Proofpoint-GUID: CMUs6pjVsnb7i9rWVJlBqDE5SsoaHcWF
X-Proofpoint-ORIG-GUID: CMUs6pjVsnb7i9rWVJlBqDE5SsoaHcWF
X-Authority-Analysis: v=2.4 cv=UsBu9uwB c=1 sm=1 tr=0 ts=6921c1d3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220114

On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

