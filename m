Return-Path: <linux-arm-msm+bounces-61310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBBDAD9F93
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7B673A97CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C232E3385;
	Sat, 14 Jun 2025 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAFi5kK1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04580148830
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749930864; cv=none; b=RoCU88A9/0ZxktPOn+okLwx09Ayjod8UocgU5XncNtlhG82jpaVxnPpPkxg3+J/cgY5XY6bIv+EIl24bD0fvVh/xSHei60ISfNHlvCJBl542jymJt3c95clKKnAInMWDKkP2X/+BtWFYwlEiAqO2yhUIj+BBeQXlnFr5KKwvBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749930864; c=relaxed/simple;
	bh=dkojOmJxr5zlSsVyIjL1aFGE71TCfhlwwA0JPuvDwxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5QqHen7YIqBjCIq/2zJcyWnHKApb4PJxcz7MysTvxj+oy+rGqkmKCUg9/tDNXHTpsBBaQnYCEcGGnPjC6OkcjsT5AerSAewPQnCWeegIF77JxrkmjDSeIm2idov82PEwsP3JWk34fk0QcOgN0QI1iCecqmRxZF5r7AK5o588ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAFi5kK1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EJfZRG017746
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxFuTlLUJL74lCTydZFM1J9TTXFA3EkUjAUJE8RBdOg=; b=nAFi5kK1gJ4y9AJk
	hV6AGURdqH0M/uCSTEN5aLxDIDacO3Ffc3bzhvjRQQt454rLOIGYBTW56DYu5iRP
	m3uS/flgBC8IS2XJZYc+t0H0DUgLMiSHIuwdrd/2pt83tXjRrUVWT6z3GR8TkZp/
	9ZvzqN2KsBEa2pt/Z1Je3P1Ahl8s4gq75GVghywJlfoNw2KgOucz1FFucD9/bOFZ
	BtUEB53y5Jk8S3Bd/0M9T3e19O4Udu1bxoUvgmVXsJRq8NNMdeRZ8i+LKi39A5eZ
	RSNArIVSvXBi3tXI+g5vAlZG/AHbwY+KaBQfGc8RW4o9HC1tH2T/O40FqitYqw0u
	WAxeVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crgxsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:54:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so6259771cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 12:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749930848; x=1750535648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxFuTlLUJL74lCTydZFM1J9TTXFA3EkUjAUJE8RBdOg=;
        b=emuwuLVQqPGI21lFRWWXaUyVGUAgBRX/zOSRN6mFcU99pH4aThKjwkDg5wYpyWnp8B
         HnR6kgFffJ3+6AqmtrfReR2Zw4wQKr91izDrSo0wKvB9S1RR/9GPNseIjxvgTqYe3PQM
         A9YltaA9Xi7Yy3BnknflDa/Bjq/8HfdD+MpbnXKL/ClwplJeVh1TaPftnx7CjDNHa5y7
         symaKxVu+Izfw++qRzBeHWZcGq08d5TMZtRnZPXFO0vuyQaE3oNITuQSX4AaI81fuI5z
         BzudfxfAwkyauiE329cnMA1BQWJ9RHbD+5f1X3aQu0BzwkmXu8UqozhEB2qrYWcEMF5E
         iNCw==
X-Gm-Message-State: AOJu0YyBLuW1BrLCNmG/Hx7F7sHQZDrA9nwCJOxauOE4jiTRnwLTdnue
	qEocZGYWdRqjB2SjpmSuI7ehbnG/1HlK8QHyJlhMMXxXRIAi9ekzN8PPR/5AuZ6w3u8JfV95JOB
	v835R6VoBzq8eSbX4VLrf4BSrxVgiM93o2wGgcTdwDjS2F3jB1wKCYA6JeD9SeQiT98I2
X-Gm-Gg: ASbGncu3QxoV1aBhXDwqXSQ5NAHmfqaR5GsUv2bvn8rzFs5hNLswE9nxTerCW/ipDLg
	UUE4mvKhlMc8bY3RIUxzKcT4xvrCEPijUzLEchnZNE3hEDotga64omqkRmApDDAC3NpNI+eaIBJ
	KGizMceq4Azo/qA1tzxW14NIs1ilAUx3DIwbU0TQ0IIbF/NzFx8dOba0QaQJQsIX3hAhbRqhPrt
	9KZZH5zJlROZRUKNtJTgNkfDClX7hmNkLifhrmt+6dlhLv0A/pFf6qICuaa1LGLufY+UnKrzLUr
	PhEpSJCVtQHmgSZSEgTCV/oZGBxnpVn2dAEktzleYGrm1XCg20QkfOG1ACRcAHDIWR6lLlG0NGS
	gBeY=
X-Received: by 2002:a05:622a:199e:b0:4a6:fd26:45de with SMTP id d75a77b69052e-4a73c5c1cbfmr23618631cf.12.1749930848320;
        Sat, 14 Jun 2025 12:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpYLl1OjQ8NY63WwPuMd6FHnvexEg1pNbcnCIaqlxdYhOPswPO6imf7MUgR6eBjDMKpzS3Pw==
X-Received: by 2002:a05:622a:199e:b0:4a6:fd26:45de with SMTP id d75a77b69052e-4a73c5c1cbfmr23618431cf.12.1749930847930;
        Sat, 14 Jun 2025 12:54:07 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88feb23sm355867266b.96.2025.06.14.12.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:54:07 -0700 (PDT)
Message-ID: <fbedfcb3-a326-4357-8d10-3be925e5df8f@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:54:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Anthony Ruhier <aruhier@mailbox.org>
References: <20250610-slim7x-bt-v2-1-0dcd9d6576e9@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250610-slim7x-bt-v2-1-0dcd9d6576e9@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fWGiBQB8xL47cfuTiuNXVh8HBcrVecPC
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=684dd36d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=gxl3bz0cAAAA:8 a=b3CbU_ItAAAA:8 a=gXSpMBu-KZCXFNnvIZ4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=kiRiLd-pWN9FGgpmzFdl:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-GUID: fWGiBQB8xL47cfuTiuNXVh8HBcrVecPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NiBTYWx0ZWRfX+JVRH3ZnGatU
 TFeCRT8Vq+vz8JMz28q8PLm1O6rgPeaGDJwngi2ZygH6mWoIj40tF7AtIXvQlAaViLDIc9sG5my
 H16HJqnJqv/CrKrddf4ZkIU8UQ4ffIa67NopKO8Eoq6EMer/tkmn+yHGS90XR6fNWxF++Z7C4Yd
 RLyHzvL+jxwlk1sadl9fc8VIxE+5HwilmrOE2PEII5voifuIBJS3kj3Cn4/357znuIgUIMoHkez
 hER+vW3WMec+ke+OG4oTDFE0ltrI6fAO9T5aaZx2qzeFvYp86OA/NW//NfXtGqEOl7UoCt9DX/X
 J7WG6hopLD2y5boJkB9p8rT2sc9g+mqv4FoVzhhjOcQbUnFkOLUOGWsGRCQ8N+zTSQ0CLVnFiam
 7vultRkjvZLP41fTE0K0dN/MI4QrNnzdLZxGo+GkyLPTdknkExeQbJdnLxq69FECIFd8W5t6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140166

On 6/10/25 6:59 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> To enable Bluetooth pwrseq appears to be required for the WCN7850.
> Add the nodes from QCP.
> Add uart14 for the BT interface.
> 
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> This patch adds the Bluetooth support for the WCN7850 card on this laptop.
> Since WCN7850 is supposed to need pwrseq, also added this from the QCP.
> 
> This is also part of my tree [1] for the Yoga Slim 7X.
> definition for the pwrseq and regulators.
> 
> [1] https://github.com/jglathe/linux_ms_dev_kit/blob/jg/ubuntu-qcom-x1e-6.15.0-jg-6/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts 
> ---
> Changes in v2:
> - rebased to next-20250610
> - added tested-by from Anthony Ruhier
> - Link to v1: https://lore.kernel.org/r/20250426-slim7x-bt-v1-1-d68f961af886@oldschoolsolutions.biz
> ---

I'm mildly confused given the multitude of options - but does this
check +Stephan's M.2 description appropriateness check?

Konrad

