Return-Path: <linux-arm-msm+bounces-39893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BF9E0646
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C876B4583B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC931DA5F;
	Mon,  2 Dec 2024 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VquWEe1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADC92040BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149830; cv=none; b=Pxxn5QmH/c/D1dUtuuTs9T3mYrDwOpvglWLAsBaAC9zsnYdv/aMoB+jKHfYo6APRSTPZwTZvtYfqJqoa4iP3iXx9vBBBNB/DNhQw85rVfkccWghwtG+lNL+XiddwOJVvchz0V7OETxM908zKksIYME562QYzwiOLB5DQrhvd0LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149830; c=relaxed/simple;
	bh=JKudxHQZAMvenvuQlThpOxs+MgeFGbhhq/9B/KOCpcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEWdSZD8hgYpZ9ZZj/RLi1Z6jUzIiBfqB5E8upiZwNu99J828utiTHacs//4aF0NQdJrFBAjfeYy91z82mX6AhR20wPZUjIbtKEaNGejigPL0QbmWP0uoFadshLFgBfx3/amG6wivWIW0R3x4qXJUgLrWwvdO//LJ7NAzz5jGKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VquWEe1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28PDWg030509
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Dec 2024 14:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	opJ/u7aIb+6rMXmWGckJvu/bfCwMl33RWOEqNCV31vY=; b=VquWEe1RLGrvadi4
	+COaUnJRyGGhjYHqZppe4bZ3jhOGa3g7ml2a8SJItS7czFte2OnVMCgqstXlugDQ
	K8WV6oj9zg+8cnX6uEe8vYyd+v7XVpD0WeoM86U6l0z+KdpnLwE1PdwwRxyIpIWz
	2lb4jTivnzC/L6WtEc0a0cnM4V4B92QHYZPnsPfwv1dk9Tm1P0CxLAGxT+LVsocC
	43qFwMOpKUhuA46lS57Tk675247+Gwl778zVT+96U94uOpqV4wW5cdUvZZLzESf+
	w3/ci0PcUmLJgijw5td2xAteFTUmsZQhTHTVhj2riitEMatjxOL3eNnho5rc7odE
	Yu2jrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437sq6545r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 14:30:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4668cee0202so6918161cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 06:30:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149827; x=1733754627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opJ/u7aIb+6rMXmWGckJvu/bfCwMl33RWOEqNCV31vY=;
        b=g7wyvVt0JlMgUyfkoKSvWnF1udgSAPRHkyaV4vq/URMh2yTErJbihs2XjwTxC2CqS6
         ieXDxvhE6MXwph3kXCHLl0a7R0PXqqmewEd1L2jxf4U59hucOs0OfwOJsLLKlhqJGkX7
         TNCG45oCsiyYGr3VtLVsn9gFS4v6kqOklhKb8GMZnrrwAotBfIcn+Sok/8VtL7dNfBqX
         b11lAGsAE6xd75p3nMChiJGkPOVfFwL9agHLPqiQh9O/dWQOCS8J5MIwEspudv9tqc+z
         Ze5leB8yRWxEaq7wPs3PX/IMHrR0UDjLU52Y8WlP7OpBK9N2EHJ8zUhRSEqRtJUau6v2
         oEZw==
X-Gm-Message-State: AOJu0Yyem6cG/hOJ+nHA9rBdhefGCuUJ/btquwWRlE/QmqqOGeJrVFol
	wrUtVj5ZRNWfQLDhS5GoqLyH1inPn/8M1xZPkm14Rq9YfA3PWp1dJ5uV344zqp/yTJJUHN3uZPx
	F5/ymis9tikQz45bKfYwSUei2uH64GrUiDoMrlqHy6A7LjzO1zA8cHORBZl1xPCBa
X-Gm-Gg: ASbGncsQ+rJ+LclT3TSLdbxksGlvVKULMh4vY2kftETEs0yiKsCa58CsejeIQCO1O4Q
	3HxaZutaQ03aq3a8fyUV1SsnKZgw7na032JBgeyIBKr7F8mc2TOr7A70K4YXMlceZ/TUAAsydFV
	wuUx0UN1HxBgFVZ3Gyqj8CpgDfxbnFQuZrLJgQaHpDFWHfFqXoH7uyHZ7XGncdPQPxdbfMf2IDJ
	poDxdgT/srn8qRir0rd4LmVzT9rL5AijmjuPQ4pN2VZzb8sZzFrYWaLPgcw+FvACmU0OdIq003v
	bBPfsrRAn+FH8TMqB7V1UOpBFScofW8=
X-Received: by 2002:a05:622a:1a13:b0:460:62a1:70be with SMTP id d75a77b69052e-466b36737d2mr150946491cf.13.1733149827284;
        Mon, 02 Dec 2024 06:30:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyWUKeBXhhoq1965fOPrse19lfgFS9Hoi0RqhL/1OBQ3mXf5NYh73GoEjiIReak/2sYFLgpQ==
X-Received: by 2002:a05:622a:1a13:b0:460:62a1:70be with SMTP id d75a77b69052e-466b36737d2mr150945211cf.13.1733149824157;
        Mon, 02 Dec 2024 06:30:24 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0c04ac64dsm3519962a12.68.2024.12.02.06.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:30:23 -0800 (PST)
Message-ID: <7ae4bed8-c170-411c-8ece-d685271aeeab@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:30:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcs615: add the APPS SMMU node
To: Qingqing Zhou <quic_qqzhou@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20241105032107.9552-1-quic_qqzhou@quicinc.com>
 <20241105032107.9552-4-quic_qqzhou@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241105032107.9552-4-quic_qqzhou@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8qprnaWrC48CFcRLCkv9HQJ3sfeOfRL_
X-Proofpoint-ORIG-GUID: 8qprnaWrC48CFcRLCkv9HQJ3sfeOfRL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=871
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020124

On 5.11.2024 4:21 AM, Qingqing Zhou wrote:
> Add the APPS SMMU node for QCS615 platform. Add the dma-ranges
> to limit DMA address range to 36bit width to align with system
> architecture.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

