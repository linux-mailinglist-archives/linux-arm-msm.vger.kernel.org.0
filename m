Return-Path: <linux-arm-msm+bounces-87265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F2CEEBB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 15:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B228300093E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 14:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BC43101A8;
	Fri,  2 Jan 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gp/t4rNJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+DoG85k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676BF30F547
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362754; cv=none; b=rqdd+ZUsIF6MyBlQpIg80oQqgrPrwzE2WZmWwYr1kW4HW61odSxYGQmQNoabf+iSiBccO2XbHyWvSR3v2soZgejVXHxkF97KOp7LChwgGFVsFfsDsj2ztw/44/izwJAHOpPXKMvEg99SGLrhuwPTT+VwhRe9gfXeUzclp8Julg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362754; c=relaxed/simple;
	bh=fIAsJm88rdZT+4c/pwiqrmBcXCTPv4zP0IARgBg/i40=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p+4PeV2Ay8kjHBS0I1NExFFrdNB8Q5piFe3HK+X4SrDhQAg/m0OHG1OvAnzuivJLMjEo6OaSG+Owsx9hMY5YVY5S0VQV9HkHz8R/nppXOyJu3flchChO0ui7wb4lYMl/Y+chdA2leElgiTY5xwHGfgxuWnIV4A68Oa63TcaM3LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp/t4rNJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+DoG85k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwHY2310152
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 14:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=gp/t4rNJTeHYaLXS
	r/aON5l/KJXOfgVUHGel9MdiD77nu3z75PPbsamCbsTKqaYOKHcXsLjxo17ptTEO
	IsTZgkcmPuGgbvOYefHQNctgxKTogYy5wUZnSHm56XwfPiz/KPv2/ykCWQ65iF0C
	Y1JxlTqFreKr0qy4ioVzeOToPkVf0XwAZx/tCigtYgNm96kdI9G2IhcB1dk0kGo7
	CODVjPpFHC99wiClNOUDGGa/ij/PFvp9t2ve5dQW6KUOh+D95MxhtPtErbZNWcjV
	Mp8WTJSOn3l+99fuCBXnZIO5s5RtBABehHAog7yfHgjpxWwtKC3ix8K3WY1xl/o1
	BENKng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9t5w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 14:05:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88fce043335so34702346d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 06:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362752; x=1767967552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=C+DoG85kJuXQG7du8MMCqoVVUP5fdv/MuGXJzHPpdJoa0vRChkZ8xH8JMc0dwJpLO9
         B5PdtuQoUkx/Qiwd2cZpSDATYJUoHU0Sax3Oc/IrEPdWVkhuoMETiCLwcJpGLTbFabLW
         BEAo+dOiKgv0PP50TC7YA+9AFmEaqMTKuBzwaAse7V55ITT1YG7YLaoC/+hA9xs7Jova
         s89z9QHsPdAaSkH3dD19+pZnzJvNKs0j4SmByzzwJE5S2TXyCWVuIpJk141yBlOWEOzI
         hxR+yclstQnGz7s0fKsEAOqsUnxjhLaGynhkHtDRTRQofG/Nf7EsX6iqB0dOxPzspIg2
         2Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362752; x=1767967552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=bptOIAl7wyF3zZxY+1LTrzLQatlyKxXvIrIURTnCjbXbaKr60qk6QMcuC1dnod8CgU
         0XNqIEV8/1FsfdgxEFO244vrxiaF9Gjk8pnV8zOSE6ApcSdSU1rPnyCC+ctUlPazxsLc
         rNAjXsdbqx4CTrthNgbqXA7yCwhqGpyCbT2KPlLoeGn4wcbqRKFSxIBwrlQIsTN2LFQ0
         ehILKvknvCFxLsx16rPsPyELL1S0JW97Epa5ifTDUDQ5HKjUJrWmGft/L/hPRWeSK+eC
         uvoB9w4cRZe7n8JZSTScV3cr/BJVOciHybH/IUJAoRcuZ/9E+jOposu9KzlQrV8hUeK4
         pQEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzQQD69hyyf1PkHc0AxSPpUpzpEmIgWGu5GopUqvyZwZ7QIWmKgCTBvgLWqNbQZp25t2NSFcyEopbagCW5@vger.kernel.org
X-Gm-Message-State: AOJu0YxnfkeKUZTQ5ol92+qLkdZ96bLGrXcgwArViB7MAKY1vnZwlcKq
	hw9x1WxT22bbkH9gHKLhnjJLzHiiE4Vz2uiy94TJ/HP8SrtfQ3eLhILwk2SC0SYDdZyBeRojYZv
	Fi6N/4mWMhjxHy30yOPMaDKPVBwF+WWQh/ft6APDuSgug1uvtJqSpIetIBMxjizemi0jb
X-Gm-Gg: AY/fxX7FtRb82zidoyrEGfGENnAQx33EkFuXMmnAt9aSHXVEZmoIq9tMuJAG0ghSL6v
	nlYmkXkba87uDyayCI6HqxZQoZGWBuHBu95Du6OGQGn0xaejHJA+OVCRUXazcmjZx19icS/pXDt
	TJM8Lu1bn8DPCdCsUvL2Qha/dl3xT4+ydyHqXq2GaMmlNUefPJqxA3kQ4ZMinHeAvua6AY4Muii
	EASvUvzS8HraSnE7Oe9kzIsOGFyTZBoycnuKTx94CFuACywxi5QPHpV1DWSFta0ok3M3VmGfEvP
	8eJWgOEWxcDLXzIsugvdwoKogozT0KTeB/8Mcr5jY1+PS7JR4ze34f1irKWDJ45GFImvMvHDyUh
	95Ex+nAg5JJyM3KbglXp2F6isWZwoLEQqTUJS40+3YvoEQdxpnhIvxC1/9nmGplmSaQ==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr392952751cf.5.1767362751602;
        Fri, 02 Jan 2026 06:05:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvPcr+EyW78LnxZztu6gmFgyoAOWuar2cL8fl5R9dQjwJN8gd7F8C+4SSN+nYk+ChCz+Yvow==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr392952151cf.5.1767362751086;
        Fri, 02 Jan 2026 06:05:51 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f13847sm4429125666b.57.2026.01.02.06.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:05:50 -0800 (PST)
Message-ID: <237b8ced-7d93-4229-b1bf-f6993c25dd5c@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:05:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: arm-smmu: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mf9Uwn_pgsoYUNNC5HA7xotvJFQ5kdkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNiBTYWx0ZWRfX0eineilxB/98
 0Rzlr1akT4d1vPG26Ve9xPUrzLRulZszq6vTvg7ly80avuxK86aF3kgPFnMHUnntXpyD9+rYx9Q
 wG7+OIE05jI4voKE4X6j1VGFwf8Cip/sWq8Nf/sGtKt1CafKFWQDbKCYSUuMztNjc/bpa2qK0RR
 zNaAsUi+jvWPbEbz4tngpbCiT3syDNbuTyCuI11qz9FC1mnu1YurTT/CFd/KXFMN66IicH9PB7Y
 yZxpWF0vTtNLj6gCz+8UJLedtLTxGAM95vmBBJfno8ibFj3TMfuGAsYsDaHDqm3/UkBy5cnRqay
 Ip0PbappCzijaK7apgzlBl4xzNdC0f0upCCydoxOkqhcHrlW7G3PBKdNUQNzS18LoB3taOtNpfK
 pxNFuZboZYLHUdl3JhBr4IhEjg9MvECZTISoEpr6vWRJCF5Dvk2R7YE0Xl5wZPbY3F/7n6jFLJ/
 ZSAI+d1eRWQaCtMptrA==
X-Proofpoint-GUID: Mf9Uwn_pgsoYUNNC5HA7xotvJFQ5kdkN
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=6957d0c0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020126

On 1/2/26 1:50 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

