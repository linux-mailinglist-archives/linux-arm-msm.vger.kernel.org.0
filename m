Return-Path: <linux-arm-msm+bounces-44788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8D5A0A29F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 11:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 715577A3581
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 10:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D99C18C932;
	Sat, 11 Jan 2025 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfjDSllm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F5B189F45
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736590240; cv=none; b=EymxFKLiDS+tGhqlq8F9GMK0CpRmzPsKJccPBu/Jq100wYGhGFZGpNKjJ9Vtr23kzxJzG44ROibLlrVInhLsPpFj1SdYHkRCk+j3i1zMqer9hIvfOhV8kpX1M17mlvHH3vG+immRvBswvAQRFQDRADyPI53qNrY74MzdFk/DrKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736590240; c=relaxed/simple;
	bh=DYzIpi1FWSZxqOT+AYt7RbuggU4pbUUYliGCU5/t3Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzLZI/7vVRZBuvaxU4ZKL9z/TbQxRlRDW78CLHw0804aOYMKnSi2pEKjyQOr2TKkPWlExDs0K0M79AOT7jxB56N1a/zBZLuRgZgpnSa49XFa42Ky49UTPcBg78Q37XkJwDg8idlnQ77pvSqWQUANWTlXMdma2PIs0Bqzv2FDsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfjDSllm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50B8PfTn007393
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 10:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnuxgClvjFozbsOT8sqLKWU8TGvu4hTXJy0x3/m7Hho=; b=cfjDSllmuVFRGGqZ
	XiAV1LPcn34HsONZgLFmiXRjEvnfMiVLkmc6UJYKHQ+1jS0vFZ0rnN/YcV52VHG1
	s5rBbqXhbnNxGG+TzU07ZtbAT+K25X6gM3vRjf+FgWFRwehZyDz0nKb+XiB90lqR
	F/F/ZXanzt0iMwtWbPM3UvwEaVS0rWlHEkRzCwrnrIpUM1p4q4mhQcU/u6O+9cfN
	3ueaZd+4byjfhsj/idPsxxJG9C3a9oIe7vdwDoItNUP0kcZtiK0VQwDuH5f29Hnj
	xkYBAtw9IJ3HKCUixNACB0Yc29q/M2j0P/K9AAsLmE30fHud8dqVcbcR839A2tAR
	sxhQXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hn1rccw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 10:10:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d880eea0a1so8152946d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 02:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736590237; x=1737195037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnuxgClvjFozbsOT8sqLKWU8TGvu4hTXJy0x3/m7Hho=;
        b=VHTVsMr3PjmlwodQCH08LfxuijZxxWihJr8i7RmoCLBT10HulhXjPcDQn5/Hov+Mv/
         i4rFEwTe6WAdFrTSEnEYoiniuf5D/bDU/oiUZajuRUZulmaUhtXXUTSHabS2wau3yYzB
         MJVxOwlB2iKogtCfjNGXq5mubZUpnOQMvPB2xg4zwR7nRFAYn5PsrshSA3C4OdDwKC2I
         WV6jbezpCSzuYThkrcQ8OB/H65HfAQPdzMgHTvRnrumncX69vM0fRFJWNcLjwQYAW270
         DLTK0hn+EnLSZaT86qSNxFGBncOE5ReO9AYipbBVxLHujmKv1OxMXuut9sK7ra6RBR85
         f34Q==
X-Gm-Message-State: AOJu0YzSVz7io+o7tPkEH/w5/uQCzbqasfUisOez9JBlcmTUBN44r70A
	4qbh460cJsSWU44sXlRLJlk5tmdZX97H7kNKFMZsRcTRHXeiwhPrBpwrxbkFwBBmzqLMz9BdO8J
	k8IkPJ4IKqvplqzIPu/23NQyycvr6nQ2PVIL2hW5b+doMwEqIYzMeMFLPOsCAsIcL
X-Gm-Gg: ASbGnctryTHeXApD+84wxOhL2WMw+f7Vb5FjhrBfQ8slSsq9078vo4nqwzP/t6+hsTV
	p2/Y74YmYxOCcN8krYhRIxPMaUwBD4UsVVFDgxQi9YTp+Zw4PgVWL/861n3rnm/QY5kr6f8OXtR
	kQJV+AYTdjEyQYMNc/btprM6TOkoyGLnU2LB4htkt9UwL/34ahQUTrqQ31VtU3b56HVBtVWT02J
	Xt8b5pYpn+mfGPV88q2D4CwNxiXcVIa2lz3pe4hoUAtri/ypFxH3y+ICu6EKXDFoyYtWZaV/VQ/
	vW/DxoBcp6aZCZw44mlMd+4KXdmnoTUvarQ=
X-Received: by 2002:a05:622a:1182:b0:467:692b:754f with SMTP id d75a77b69052e-46c711051c3mr84288051cf.13.1736590236840;
        Sat, 11 Jan 2025 02:10:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWNijq2qxmRNwN9ql3ZkxBrVgNr63OfXmOG8JAG7lEy/29NQAfBFoNCZY6LEzRTJKWyLoeLA==
X-Received: by 2002:a05:622a:1182:b0:467:692b:754f with SMTP id d75a77b69052e-46c711051c3mr84287931cf.13.1736590236458;
        Sat, 11 Jan 2025 02:10:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c371sm2566118a12.11.2025.01.11.02.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2025 02:10:35 -0800 (PST)
Message-ID: <bbcd9275-02ef-4c40-98b9-c85de9c19d86@oss.qualcomm.com>
Date: Sat, 11 Jan 2025 11:10:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-pmics: Fix slave ID in
 interrupts configuration
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250111083209.262269-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250111083209.262269-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cGdnrdUtcOCGjUwz4Fq-CNutGVRkiTeG
X-Proofpoint-ORIG-GUID: cGdnrdUtcOCGjUwz4Fq-CNutGVRkiTeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501110087

On 11.01.2025 9:32 AM, Pengyu Luo wrote:
> According to the binding for qcom,spmi-pmic-arb, the cell 1 should be
> slave id, the slave id of pmc8280_2 is 3.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

