Return-Path: <linux-arm-msm+bounces-75657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 844CBBAFC1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A05E3B2DFD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946122D8DD4;
	Wed,  1 Oct 2025 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCcdx13r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2642D876F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309381; cv=none; b=sMDD+r36wAIq82SCz1fIJmhYAo8CPjIXTTbDyRS4KP3t4LcYCWI8l2CfYpnDglh76Yee8WXGpW/eX5ptOfYyGXRzG5bqBFdOAVsLG+L65NCcqD84SefCmDXNsAKr5fwjOKGqx1udu6UkKA4AJ+vB6RyTDUYqJC7wNbhLiKG9Icg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309381; c=relaxed/simple;
	bh=rz85/arNz6RsO3g0zililQ8uETwv+F0iyZRoWVQC+EE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=an2b+pCBTn5QzMwy114NrKEXF5oNar58hD5nBr8T431HFJ6gQaUn7NDJHvB8DYhNh0+57Sh0UGyJ0OFwV8OSX4Dduxu+DeRoNCf6c2NArwmiODIa7HzY7hq92FtmM/Osbyb5SGOSvHZZqTnwJFrtGsU+uyCtJ0jAK5IpKLiWSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCcdx13r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918vNbd001149
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPfFz+jJCaCOBtaru36gwrt+7dEJBz4BRIuDpZVmIA8=; b=BCcdx13rnITI8ibx
	ZWmYphcSmweMZGvlDEINVH610zwPBu3VzVjK01VAhTl0Ov3bPR315XcEEH7e9IjQ
	nHmRXKVFyeUVIR65WC3gJ/mOhlld3Qo6x6zhPGKCiZYhUDc8CGscbnhBiuLYjYA9
	uwQXEvAgoJUSW3+QXp+WcJWFyvQjG+QyshfqvfzaAjcbII5zbaqxkd0AIr3ZwIsB
	IYw37j5gO038nJuXYQNFRvzNxUABAD6tX3KWmogw6wH/z58M+ueS2KlmYoAhdbxU
	sGGckbI3XAHV1nNvO70PYnMkGFKUZ28QzU2jeElyiLhRPr8Tt8C30ZCZ7VwORBA7
	7xW+3g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr7e79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:02:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e4b4e6f75fso710701cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309378; x=1759914178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPfFz+jJCaCOBtaru36gwrt+7dEJBz4BRIuDpZVmIA8=;
        b=tP8CcMLwRJ4riHWMoxIafCcu3yb6W2k3hF8AmKrOVOB7TleOOWCD2vbRRcPNLIEBIp
         Sjmh7wpkEgbdhBPLlQ+V/qxAiet0ZjDj1NqXeygZRdO5wc/3dpfttUrCqUsZkZoZJUvj
         sPK7BCiAnRK8uZuq88dfMy7NFGI+it2d+HpG3JhresOD9gQPglRZvivlpRwXeUa9CGFD
         LNd6We2vAUabIC1pi8iSCsc2kjTdJwm+UpcCuUkWBy3FakIXSak0+5nXZizzReqBfUfu
         t7/TuI0Hvxj0NG22V+eQks+8LjfXbnwHJNoTq0R71fSbZg0IGFdn+on70TWns5DFXMIX
         YdTQ==
X-Gm-Message-State: AOJu0YzHkgBnGHUG5kpGbjTKVNkt2piHTMX9k+FjAVMyYEm+dCrpFl+k
	70iD53ROsj++UJvYPPbj6rEdr7QWM0CeV/bLPj5f1vp3eapyUJfz/FXDRHyqyrVM7GZMAxfIbCd
	oi7UFjXXA7RDp9ryvN+5H26ZJ4BMkA/Dno+bAYTKoxQ+Wu9whzQ5aN16UCv1raPa8PbQ/
X-Gm-Gg: ASbGncuYGm7QZAp13Xlz8KX5yhZqq62Dn0xikUC1+0aZaZaQXBqnJmSamTKQ90UPtRc
	crBrq+Q3xbHrlkc/jCS/Hy9bK/cFlxqMNYZTiw84EDira1wBV0lU/1yjOUtcOxUREZLFyLQRkDs
	aWPTt/8Z5Fh9wV54GMGdT8uyznoC0Qdh8G7/TangNu0mEf9flCdZl1ffcimt8z4VfelgJjfa3+p
	F1FVkpErHZsH1jHpmp6Fqf70/VZvUQ8T4iEyZzufzJ84BmjFZujndHx9huPxXQS/15LEGA6SlLa
	u6tTBsOnEGrBsyIyW5m2TSu5Hma1pn6yz0ld+DnrIMFlZelpzafwAdtmqFNu2UTdq+2TeVkDgUE
	Jq4Pkyr1AU5NiofSfyZKp7HmDzFg=
X-Received: by 2002:ac8:5a06:0:b0:4b7:7dbf:9a81 with SMTP id d75a77b69052e-4e41c1605aemr23476271cf.1.1759309377519;
        Wed, 01 Oct 2025 02:02:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU9Szphg/SN7TMvpOPbN0MRBm6lNfueGopwk8fIzSbGuR1BhVcLsJaaOfRkusSv6notyn1SQ==
X-Received: by 2002:ac8:5a06:0:b0:4b7:7dbf:9a81 with SMTP id d75a77b69052e-4e41c1605aemr23475831cf.1.1759309376823;
        Wed, 01 Oct 2025 02:02:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae2cd7sm11618651a12.31.2025.10.01.02.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:02:56 -0700 (PDT)
Message-ID: <c0567a7c-9d21-4fd4-8140-99e72184dc2e@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:02:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX3YM+qdXEoM6a
 dRlozanX1geLegu30gM168I08YFB1D2loyDQ9VJQD0/WixzVaIdypnSx5D9BHxstTXsM01fxPZ+
 KKhYDcxy5E8QHI5FrNRxAV5+eKzZQenPplFWol6FstjruZdEGEDe9CnjkfF+yYd+KHP2wYUN7Qe
 ets6OOe0xaILdYdc0/QXh9G3ezCF/HzviCDBI4AQ84zsrxe4Y+mts7SoQiQQrgiLJVTWor1yXMc
 TRdzFySu2gTMAYrlJYX4dp5GvjkzCuHRLY7pelTosXaqn3AMcyIbNymAcvNysi3syldHyNShhD7
 y7vQmtoD2rHboYGirmFt2Cvev3xY6xrXn9O424JnK/Rc5+lx3VRG0cY9dJgoAkKv/fbVO9Gp76p
 s0aWvY/yzgUuWpAgvzQ+UlLLpte1lA==
X-Proofpoint-ORIG-GUID: pixogD-yjFKG42x0Gc069cMfQCU1PwQ0
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dcee42 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8
 a=sfOm8-O8AAAA:8 a=pGLkceISAAAA:8 a=bvKeCVLL_wdwnHjQap0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: pixogD-yjFKG42x0Gc069cMfQCU1PwQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082

On 9/29/25 7:05 AM, Paul Sajna wrote:
> Rollup of improved hardware support via devicetree for LG G7 ThinQ 
> (judyln) from sdm845-mainline kernel fork
> 
> Notably, this patch-series enables full DRM acceleration and wifi,
> among other small improvements in individual commits
> 
> after this patch-series the main things that remain to be worked
> on include touchscreen, audio, and modem.
> 
> Depends upon panel driver patch-series https://lore.kernel.org/all/20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org/T/#r9a976ca01e309b6c03100e984a26a0ffc2fe2002
> 
> Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
> Co-developed-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
> Changes in v3:

Please run `b4 trailers -u` before resending to pick up any tags
you received in review

Konrad

