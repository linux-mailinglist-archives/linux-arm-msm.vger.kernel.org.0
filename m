Return-Path: <linux-arm-msm+bounces-40590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB29E5C60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C19B1287F07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BCD222590;
	Thu,  5 Dec 2024 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nA+oCSMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0560221477
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417938; cv=none; b=BoGul3VLG2IwROqSXcigKr7FSs5SIEq1kGba2jnzkPMmtuGcpvV8Ym8tFPk9vdtubRb/f2OPXWLrPZzaAkddGMgdR3onsnMtAJetdWBXSdd7rRknGG399aHqkqvJR7qQeIzPnyiCNFzYpnwBozR4m5DwoQWxZSV536zypCGkReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417938; c=relaxed/simple;
	bh=29LB2PMCJTqg6yaaSPjNIptSdWN5G/aO+7nwXHFP66E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BiDMfNZuqmfW2g1b4TM3JKDFh8udl+W3nMJe+TuOlbEa6Qk6dePIufbRaylXtDTecXsh32FlB6TPdlvd2CDYLRlaspkg7aIGFN/1BkGabUPFg+8LiMfbbNVIgObFEwBCfA6IMcfkRCQDPo4UmJRAagTwW2I4c7c+Q29TBrQ1FAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nA+oCSMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59x9mN031438
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29LB2PMCJTqg6yaaSPjNIptSdWN5G/aO+7nwXHFP66E=; b=nA+oCSMh4jchwVni
	RSHAfSeWqiZFtvavwFwCEDRSpwg+QzKYPVmowHEl9wIGzr1Tm1xoVIr+rbGlwOqv
	zDs3/cxXNd4DBCZYY9XlJ1qdDLhevKbLjzCJQbghWntsu1gZTxU8abzsvynthvCF
	niHKoqDIBkkoQb7Js67T423mJWBsW0hvybopO2i3W8FYs9nn3IPnae/ZG+1vnXbS
	s1KmUqwI1d6wHdnL0bwpPZgpBXfj+TaNclXbJPrikKJdhXBn553DqT1lN41BZ7aw
	esVExIR5Tnxh1jJLU27E1WSvDRH+Ce3SMwGr6xuPcIE05y28Bo3qnoatxIML9OFN
	Wl/X8Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba14153h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:58:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d88b9b62ebso3386976d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417935; x=1734022735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29LB2PMCJTqg6yaaSPjNIptSdWN5G/aO+7nwXHFP66E=;
        b=OZ7VJQsHx6RwIxAJcK/vvI3BmLrAZVOK0JJED1K/w5IZjAooq64LeReDQ5fCDcnOCh
         YA7GRtMnpl0A8ePMVXj7WZ9Mp/cV1E061lQI/3yJJoqlwYgnAs9c5Xdt94zHp1+tAYlB
         12EkuMy1edeNsJtfc/xRtZqUWmWpNvaKrXTXeTtiMLHlyRlnbCNBNPwDzZSp1yFdxFxd
         kagS9ET0SgL3ROIJv/hpq8ja2szvI8Hip8NXTHMuced2IfJeERctViKE1VNMCBB36jxa
         SvMGBnINsHrEQrSG9VhdMPHlqF7PJFz2XZ7YTgp4DlXCTtMZATnu1lFaxWPHK9ADMYRb
         cdbw==
X-Forwarded-Encrypted: i=1; AJvYcCUktpKKANm+YOVgEUCnw4kjaBPD2XxtTI6fN/NLLPuQU7adAXFYmEWNlzx2IbwjMtJNa9/wkB7fD/voALXj@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtAtepuecspGogE8DaLMfi4a51cqIKizfTRa4hEVzSEh29vMf
	+85TXbd35rXzL3VvZQRrbC0KiCP3rJ+scpGtSTq1mHxv19yKfIFiIjrKNoLlfmacSWF3nXpGo1b
	3dsf2vl3nCWaK0Oi1AUq29/wpfBTHtsKMD7GCm44KoINyJF/VP5XSnC5SE9XS5ikx
X-Gm-Gg: ASbGncsH3oc64rkN7j4nnJjTAmPnsoJSjYtHDNraPJmvCGIJ5nRKYoRFaieNTd+ASs8
	1yIW69YboRNKi2jKBR7C0t86oGhRS8AMf5q4+scZ/Sf+niaZoOAwiIYpPxEMGViUkAh2aPsVGec
	EUlTYTrmfzy7KGhnuHtV9MWajA/ghO0RJmB8CVvGg6tEW51ZRw9NCrpN65p3QwlWvHAHJf9JMQA
	HOfBZ2uKI4TXXMocZOip3KKK8hgaoRkzbQTP2fUT5UM1k5M8UPK0Sg6K5FHCa55aGwoUba46Gle
	ZG0U1rsPCrHKsF0UYUSJ6Kx8ovLNmLs=
X-Received: by 2002:a05:6214:224d:b0:6d8:7d84:a4fe with SMTP id 6a1803df08f44-6d8b740269bmr66744176d6.11.1733417935123;
        Thu, 05 Dec 2024 08:58:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHONcwWmMF297h6ReXiuQIfs1VJfMAMwnr4Li/G53W2Qo/RcNGYjv5W4a29cWUw0S2dbXt6Pw==
X-Received: by 2002:a05:6214:224d:b0:6d8:7d84:a4fe with SMTP id 6a1803df08f44-6d8b740269bmr66743966d6.11.1733417934782;
        Thu, 05 Dec 2024 08:58:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e0389sm115040066b.174.2024.12.05.08.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:58:54 -0800 (PST)
Message-ID: <724bf111-ae58-4986-aacc-3db3230a7a36@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:58:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: ipq5332: Enable PCIe phys and
 controllers
To: Varadarajan Narayanan <quic_varada@quicinc.com>, lpieralisi@kernel.org,
        kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
        bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, p.zabel@pengutronix.de,
        quic_nsekar@quicinc.com, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc: Praveenkumar I <quic_ipkumar@quicinc.com>
References: <20241204113329.3195627-1-quic_varada@quicinc.com>
 <20241204113329.3195627-7-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204113329.3195627-7-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zkvPfQWGuZwiHss626QbhNqxlJ240gDC
X-Proofpoint-ORIG-GUID: zkvPfQWGuZwiHss626QbhNqxlJ240gDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=698 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050124

On 4.12.2024 12:33 PM, Varadarajan Narayanan wrote:

Subject:

arm64: dts: qcom: ipq5332-rdp441: xyz abc

Konrad


