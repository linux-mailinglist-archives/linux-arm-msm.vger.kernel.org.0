Return-Path: <linux-arm-msm+bounces-83352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ADAC87B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 02:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 070FC3B32F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125092F3623;
	Wed, 26 Nov 2025 01:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1m1kcoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/NDR2Sa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED001E1DE9
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764120986; cv=none; b=dbusz8PatIeG5uojIvwXS8QWGK9Wc9gYzBQur1xVixtrPEpNto8z+LUNqwzSTU906BER4CYB66I83iWpKmJY8AsHhUzk+nmYsFshqCid21VhZVFp/S5ZBFpXAaB2BbHSi01b8izchHxlL3TJ4HuNNIrE7o13f5sYLGhJATY8e74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764120986; c=relaxed/simple;
	bh=5nxFjc0sHR8+o/Crg4to4Kyd3oL6uwnMXC49BEMnnzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwKp+Phe8tZlnMnAxqOUFt/aD7+qFmm93sese6FEZIIzHPCHql3ZVpx8M/p0CZhOlb+9rWIZO1mtN0HVCT7dTVDniQep6h/APwXSSzzaqUQ1Xswyp9Nn3Gd8sehIK19fJuUWbuVpAHlbjfxkZ50YVKFFypEDjZWwS7qOp0ahHbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1m1kcoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/NDR2Sa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APIbNFx2659054
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JR8co6q7+nFf+m5fF38AXna1
	AqxUc5bFRHQ6sjd97l4=; b=b1m1kcoRr7gBpPUEfpf2MUJZ4Fa4mz4BABevyi4V
	08G0XMdNdchhves9ujEWecsxzWYzPXfnj3coRv2v9kMnV+iOxJ2GP4RlqmrRUFyJ
	333uILLO2jrB0yEe+sZtHU8jrRiYKW0riWj2pCnYlxokdX42xIVPJWZzUrQ84GNb
	6fXOwXyU3yDFBae3eq7Cwk5+wEuWz6GnlH7eZNRBE2Ji7CdBXfH/MQ8gNLieGmbi
	MQ/Sz3HB9VTe6BTsoxM+t6fKM+JlrujXrpGMoBWmZqY2pITl9pvgPiEBXHnyE2Ba
	I4jDoLp0osSQDbzi3iN1Qj1yUaHfXtndc4mXZ2Fv31e5Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9xabys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:36:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a1c15daa69so565949685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764120982; x=1764725782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JR8co6q7+nFf+m5fF38AXna1AqxUc5bFRHQ6sjd97l4=;
        b=F/NDR2SaKRL1x2ZAZK9zfAyXJ9yMecjHF/0NCRfU7tqqtI/qLLEmxAO5zcZ+/mc8NP
         xKYICLv9IUbVF27pluuBiXXHKaaqDB0pJlBrNTJTeWK0PoU/3+ezWBZ++XLHdr1dJk8E
         TOGczsF0gG7rsEaTLX/mgpI6wILQA8Sydb8HAneJMHpS9PKA4uQdoHFDHRKCMYZiBCeC
         tsm3qN2miXp1NmIzG/HnzsRDO4VT9msOPLg57XMl8khPFvoZdkuF5OFkZRpc9Q4EotUK
         bIv1KmAvvd4SejKe6DCrqZGrXobuXkyfFjlJGf0QVwiUzhUoYxiwp+b4iwxHCqdpI241
         EyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764120982; x=1764725782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JR8co6q7+nFf+m5fF38AXna1AqxUc5bFRHQ6sjd97l4=;
        b=E5EUuVkHF1Ls1XvC0oe/O9U69dc/T4zp/CmRnaTqJuZH3OLqU1eBtqgD3VuafZpAcv
         ZWNAnk1h2h4KCbcw+0kotU0gOkzDZ+0Cf+0lshKwXC0ai9SI5z8cITAf5O6gmgyF89FK
         prjJRCXszllbnq0ZSSPlavYETDfqqYFg90kjSPMn1iP0Ay6179ezb66tuaBfQqcOL/QH
         H7eMc9VNApwsDiV0rJzIFbWs5NgUnOrnm7e+JDWibMvrHQECcKVXZtU/VqI3su1dNfth
         DzWcWgniLcECzHnStj/iNVmcYUc+XjDNasGMczFESSRtMI56WE1YOJt/xROzyLY17auo
         rfYw==
X-Forwarded-Encrypted: i=1; AJvYcCVkNZMYn5wu9ATdKg72dzH0Btq7NtDPMz5mq9F2yPVJJosjijuDoMktPit/Rc0uPvof33au3GHEDkCq68bu@vger.kernel.org
X-Gm-Message-State: AOJu0YxFSJUb500gLEXMDx8jlAEqAMAF5txMXmMoY51q77JZjUtgWbzV
	ZU3GuIWIEN1llooIXxjZUCCwWGGsRzWs/Iosz+vVz7nkBrEOEQSy1BhCjf4EpjlnrKUB+yBgqno
	y/+JWj+bqJwd/EePtM+N9zcrCpjX5xtHPT1BWddwjZaIuyO9zE5G87QRdDy69ib7TdLI7
X-Gm-Gg: ASbGncvnqNkIIg/kzf9QG+uPV3Pbl8Gd5lVW1p33Vl5ETz+54DMlyxRRkkr8OxsYNnz
	BQ5vOy2bXmKM7cP6lNF/4zsFyyDSMB3IkEFV/8N5knt/10W1Lfy+ZoqfartWjtQTtgiwFCE79W/
	rghGEBSqPq9EotSDS5ocqgIJYqTZWsm9esfq0U/1nR9sn1qPolDDsQJqgrRO21jj4M9tE8uCf3N
	2fCP258HFJb7e8DhYClDv6g2i84q9Rs1j5poFPipkxFPUTK+tsHj7tv2L7bZn7W+imol8+/pv09
	Q1em09VlpQRvPo5BOpCgqt1163J02xdSzLP6jqGEFiNBJqxtu6mqgPlIhyJ5XCpBlDufKcAHXjv
	BdGaAIVWk5YNlUBx2XEn+vgGvmW00dp+7O3SsnsMHIqdXjHQ1wg5AY1gA38uMboLHJuoDcKGzxs
	bl8BoypzRHLVKaMsB4q2W+YE0=
X-Received: by 2002:a05:620a:3f85:b0:8b3:19dd:46ea with SMTP id af79cd13be357-8b4ebdbebb6mr675906285a.72.1764120982598;
        Tue, 25 Nov 2025 17:36:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZqMmHNCGd63AwXsQLn7Ik0qDiC/u/CEwulFZwrLtXGsLoqnKqjaj/y7rHroR9hMGl3FhDIw==
X-Received: by 2002:a05:620a:3f85:b0:8b3:19dd:46ea with SMTP id af79cd13be357-8b4ebdbebb6mr675903585a.72.1764120982186;
        Tue, 25 Nov 2025 17:36:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59744sm40049251fa.11.2025.11.25.17.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 17:36:20 -0800 (PST)
Date: Wed, 26 Nov 2025 03:36:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: add TRNG node
Message-ID: <ygpjsoxhpigj4t7bcphzhrkjljqermm7rte5gyxtcjelgtete2@65mzcqwakgcp>
References: <20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com>
 <20251124-trng_dt_binding_x1e80100-v1-2-b4eafa0f1077@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-trng_dt_binding_x1e80100-v1-2-b4eafa0f1077@oss.qualcomm.com>
X-Proofpoint-GUID: qbA-9MBtUroU9t2Fsx8V_EHMDBmdhypI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAxMSBTYWx0ZWRfXxaJlXXKEbilu
 EnY6MMrRRMkioOMzI0BC2JV2Hflug7PBM3+5IQYoM9MVcjpDBkWU3zGW7rX4fB5PX8R7jBv00G9
 VwOquDZD5NfZ7cuZgnRT0TbkJ3qjpbS35ZX9wdw+NeBXGMFvHAAR9DoF4oXE8KwvD5SscvwE3re
 lU/FVrmYSTPHMWemI4vb2p2Z+O45A1XOYwu1pFXqkSyPcKTjC++1uRSucc+yxLsHB5q9AyXUZQL
 MJs6vuDOGos8JHQESe3nErpqfpYS8Xf3Nt8UWbU5UTsFPXZG9ZER1v1R9aPMzLflLGO1D0485Xh
 q9OQItVUY/MqcAxi+Ix8xSkUH8g5J9yO7D84ST9k2x0kq3zRJiYY8TtwO4mxA5VnZl9S9yQqH/9
 JD92aHEsQhujbr8TZoKh0B7fdgvSUg==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=69265997 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WmeePSlto-DxRHfBUH0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qbA-9MBtUroU9t2Fsx8V_EHMDBmdhypI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260011

On Mon, Nov 24, 2025 at 10:38:50PM +0530, Harshal Dev wrote:
> The x1e80100 SoC has a True Random Number Generator, add the node with
> the correct compatible set.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

