Return-Path: <linux-arm-msm+bounces-36919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 822239BB309
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EEB11F21C18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5731D47C0;
	Mon,  4 Nov 2024 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfRDemp9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3262F1D47BD
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718713; cv=none; b=Vsbgx1zKYXH43krsz0HzYI+HWUSp7RX8ZQSHGXrJ7I7uaDQT2SA0GR7U5v1YnhoR5Z+z5p2kMV91VVBi0E7d3mAXsQE00TCnT1H6a5so3WOTXFk2tSV3CBjH0Ku8VP9fZTjfEyRfDa1/FFPNg0pHsp7OueGnfIleo3Klhi93br0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718713; c=relaxed/simple;
	bh=QF5qeqPKv1tyCvIMTbga0xwDQ0otiI62wU1788A6G4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E91W3vxnpxPOPhUooI1sZY/NG69IIn63I0hiRLnCbWBQH8bG/NDJX/uAc+sG1VFjObLs9gGEaPpC92RHyRc5XjVQSV8RmSadQVsOCLr1TouX0yAx4wFWbjb/lMdL9Fb1rzsl6xtYUcUh3v2a63nOQKubz9CML69wyDLkKJkY96o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfRDemp9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3McGkR001294
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 11:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FnLOBHCGGtHyCjziPaoUnh3eyHhBuYonYqV3aXjJRbw=; b=nfRDemp9yCbyjxxm
	sJEPwdHKuno8l4+TcI1JntZ/pZL78aWE+QPPhK6oUOyslqJWEeH3X3p8DHDgXkNp
	ZdUABjrVfAlfatS80imq4hmQNr3CgL6q63gi14eI1gR/TJtez7Jz8nL8AnJd/o3v
	J3wlB66R3sYf9EpOHCeCmqE4dtRjoOCPHbmPbDaSz0BsRRm6tI9pSOspQdbi+o0p
	DbnRmBMcEOdspcss16d83esFb2nrVZXREPAoEU8sAu+mlMQAdKPCaISoQibY6x4s
	Hm9431xz1Lrk2uZEpqBtLZRHCAzta/49lXaqhgfNP6JeqxHnpViuXRwYRcSib3Vd
	cBeekQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42p5ye21pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 11:11:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe149b1cfso14581116d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718710; x=1731323510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnLOBHCGGtHyCjziPaoUnh3eyHhBuYonYqV3aXjJRbw=;
        b=B9YXMVFhP+GSTkuoYuYtFzn4Fd3mYyQex4AN4uxCqDwAcWGmqOCP7vDeFlY0guNUxg
         ZtvJCMCMg0DcTOtroK63JzmLjnfEnJqHubYvPcOn153gG2sz3VLa6CJAPqawHL4mf2/d
         oGrxDcUKxHMgo8Xz+ALufXNF2faEmHS8c7hm/eJYpSVuRDuCOWpQRN4DXCvCNieqUseC
         opEnJPxEC68m7MW4SiAY36EdscO9us+DoJbYI2ZriTHmulFhDCnFdhdYuUFqfCOpxsph
         DvDpFpcKrzzdkdG03fkEZhAwSJUHyui+YQnuUaxv5061/ImFrGD+VzaNzPLjkafRP1LD
         m5YA==
X-Forwarded-Encrypted: i=1; AJvYcCV9HuaAnCx1SImoRAnUEdwSxY2RrltpVY4dV0XCYCKE/lRaSJbaS4kvCU7qPOlYSnca4XBAAYQ6RRtXbkpt@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ4TIqK7cExv2RgSrHelKTh1u8vmkPuj9j82oBNJ/tR0BGlrmu
	CCou72gDC53S8ypODL35TKGx1A9axbfwb274qI1BW9OFFHtAcJCtDFHMNwkRTHGms4zietAVFUL
	ITuXXwH6G2l9UnwFDKjL4b9p8H7p7ZoGxowxcx2Wc2YrxHFjVQQZ6plNOPfVUtinw
X-Received: by 2002:a05:6214:234d:b0:6c5:3338:2503 with SMTP id 6a1803df08f44-6d1858886d8mr235370756d6.11.1730718709862;
        Mon, 04 Nov 2024 03:11:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEthW7hWd0uAwrn8o30FFKo+68/sUmkTx97LA8okPZrmjtw/NrlKbGtAzwGCR1uo9lHM4+CfQ==
X-Received: by 2002:a05:6214:234d:b0:6c5:3338:2503 with SMTP id 6a1803df08f44-6d1858886d8mr235370556d6.11.1730718709555;
        Mon, 04 Nov 2024 03:11:49 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565dfa8bsm541905066b.103.2024.11.04.03.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:11:49 -0800 (PST)
Message-ID: <350c6332-e6c3-4d8c-b147-36fba68b3190@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 12:11:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add PMU support for QCS8300
To: Jingyi Wang <quic_jingyw@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241101-qcs8300_pmu-v1-1-3f3d744a3482@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241101-qcs8300_pmu-v1-1-3f3d744a3482@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ozo9Ko3TGtE_-Icd1icrAOut-QbCNOZI
X-Proofpoint-GUID: ozo9Ko3TGtE_-Icd1icrAOut-QbCNOZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=798
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040099

On 1.11.2024 7:44 AM, Jingyi Wang wrote:
> Add Performance Monitoring Unit(PMU) nodes on the QCS8300 platform.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

