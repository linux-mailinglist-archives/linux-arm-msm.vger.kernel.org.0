Return-Path: <linux-arm-msm+bounces-54356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D00A898B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 11:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D87EA3B276A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 09:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEB728937B;
	Tue, 15 Apr 2025 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7Rsj/zA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF0288CB7
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710839; cv=none; b=hxvWcQ0OXrCP47cQk064KvBc9zj2xrksz4QFT21oiG4YXeFvw2TYj3pBsv6MCzlztd47h9zzjYjDamjgXvJWkygnRWwntVz+Ty4aN7cI67hdEBFHgH+L6Ra7ZeyJ9Q9yrK43MYtkh7aq4Dkgewp1Ofs+w7OtjQSEuP2cHu0A0HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710839; c=relaxed/simple;
	bh=nfB4gqLyqc0cGgmDvW8mT61CF98kw+LFnPgIxUoqozQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBHupUU2aV9asIeyNt8Be/8u0KEZuwoRMRzJ//0kM5zKEBTN0H0hYGyIkThUJXT75iaOYEcA/bsWyKHsmGB+TLMFmaG7qfTkErWsY2gMKeWL/hNv7KdjgSVIdSeJ6dbNclVtbcTzkNf/K/PHQgRbmfOIEOezc75F1zvl08XXtuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7Rsj/zA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tLBM005405
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxeuE2eVL5Eoo29xjyLgJecbYqVi8+nNdiHJPQLgII4=; b=o7Rsj/zAPhupkj9v
	IGCH94/ff7yFpwjI2gpAfE8QGpx3kwHZDwAS5MXs/SXf0DpFAxaTjzM0oLBVgMq2
	ptXqv4ku56/vrPfk0xRA1LH/NSdEA7Un30R1sBs1dHdLBAcIPE2zP9faNY+7zvG7
	lFOsezFz5NG7J6fXs9lrLhtTpDRcArRxfPfekByzCw9k1md2DlkA0DL76H2E7Qhz
	YAkZLxDWldSx0HdYEYp9GP+upHc14UTKK+DpX5BrEHqddo4NpTJckqO938Dv4CSl
	gB0ussQi7u3O9XF6NJJpEytyWt4U42J/btVyx3tXhGY1I/EmdnZVDmIInlqa3uS9
	G/MLCw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqcsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:53:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so16614786d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 02:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710834; x=1745315634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxeuE2eVL5Eoo29xjyLgJecbYqVi8+nNdiHJPQLgII4=;
        b=MrVg3QZ1mK0+7UKb60/JPjEjZTFDv68sZv1xIWmtQa9ZfBfxcFbewwljNxnQrllz6X
         fq6BFNa2ZNWGQnAzFaVkYURjgNMfj/6slJt8ip36jhnOM26mw7LyH2+vbDnxZ0KFr60N
         3OFoM9/fAk3op9dm8wBAu9st5TpVOtMD+e5uFLohRP/lHPUBJXA1Wm2QAIskBxA/8OU1
         fiXAl2KNwsJu6FBujL9SRXGLpbXwBGE1aAWwEgqi67A/guHeipNTr5M1vok3YnBuB/0p
         WQv3x53YF7bmU6BDjAnREGucm0O+XwGvnmnZG6hk1B02+XGebgd1IG+1iQIv3bFMHwfp
         8tWA==
X-Gm-Message-State: AOJu0YxqLNPBYfo3ya1RQG9nOjWoyWHi/TMuB5giFftOwnHcPYQfcsrF
	40xUlczLIhHNuf70jLtssbJ+pFAMCO/XYNCgCS24o/kZbCT20arU/teVupMKbMheciZdmyvET4N
	Noj/zuN+pb/i5kIV5hSIv/HLBCDkOkDUr/eLUblvRBsEWc0U7GKcE+vJJbn94PiBM
X-Gm-Gg: ASbGnct7u1YRITV33Kf973YRtkxLfiiAbljL4z2l1T/IAup+oQoryovUAdht6U+jIwH
	nWEpnqIegl/1Nd1fF4KQjOjDdUSWfRXOrZUyZ4caHa85lTw7cIp6udijLCgbbVDnPlZqWr0fljl
	sqKVHWh0zOmn1+va4+XBExmrADoNabbiAy0z1DAZmnPn0xG+xPtUUUHzXDEbvgUcGo16KpxFezx
	5NwhrUEw1i8R6g+skwY2rg4gBpCXS/7yxwYbBbEluFXJ6//5W85yc9armaIZiwGNk61PFDctmPq
	XV3Bb+QGzLY3jRYBxXF31ba8h5CHpvPZq1VCfGIf3yp5NSwA5sfivmntxcaAC/Z9wgU=
X-Received: by 2002:a05:6214:20cc:b0:6e8:f019:af59 with SMTP id 6a1803df08f44-6f230cb9754mr96287806d6.1.1744710834367;
        Tue, 15 Apr 2025 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgaJX2J+7JlHuueBHmISXlo1aK9U92F4gsipjLZi1j7TSnpCxzm7LQz4Rmzpb9J06CEF1Qug==
X-Received: by 2002:a05:6214:20cc:b0:6e8:f019:af59 with SMTP id 6a1803df08f44-6f230cb9754mr96287716d6.1.1744710834041;
        Tue, 15 Apr 2025 02:53:54 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3120sm1049550566b.1.2025.04.15.02.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:53:53 -0700 (PDT)
Message-ID: <4c57a98f-045f-4487-8354-807b647b2040@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:53:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdx75: Add QPIC NAND support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-5-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415072756.20046-5-quic_kaushalk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rG4a-9SmpvNZC-0FOGHtWnvg6VENv_G9
X-Proofpoint-GUID: rG4a-9SmpvNZC-0FOGHtWnvg6VENv_G9
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe2cb3 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=HfTDXfZYWx141HAPJAYA:9 a=QEXdDO2ut3YA:10
 a=-9l76b1btMQA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=760 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150069

On 4/15/25 9:27 AM, Kaushal Kumar wrote:
> Add devicetree node to enable support for QPIC NAND controller on Qualcomm
> SDX75 platform.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

