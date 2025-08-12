Return-Path: <linux-arm-msm+bounces-68689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B40B22180
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67FC3562B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D259A2E613F;
	Tue, 12 Aug 2025 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rl5PFVLI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F4B2D6E4B
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987575; cv=none; b=Qw9nskA+UTfrsBtGQBbTX8rwnoow8uBcgdSaSrm4qI77IMm/lh6+3Ycou4xOc0jiHGZ0jcsxTWjL9vYAjJudxVdB6LedvxF4e977tranTtcD41w9vBYMwvMLzoZg3tVm12r9ufUu/yzUZc90Lir5mWX7H2qc1hEQ6XZs6YjJ3L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987575; c=relaxed/simple;
	bh=QbklMDS4M+7Gy4dzmg7gInkywpUCJli+ww3SGtE3dOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtDcH7gVjWI4BU1N3GH3ncwnZkmry556ueLCobSWsSwNLkwKDqD1MkRtLtPMBdZrF2iQ3mcUfUcoLwVmsagB1Un+LJbwIRZMQfltoHHum8tDYbOLMHog/qZHn1Oo/llaRRIP9AsmoNljRuYp4HvGUCRpE3qBWTmVHRM4JwYdXaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rl5PFVLI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5nTE0023741
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IsGAhOBPhH6jXb8JLaEGyYLWirWIfQYG+A75B8KfNqM=; b=Rl5PFVLIMkTwvV2G
	PNL46chUp4em0p4sYF7iQMs1xSk6nkmQTeIq7r0ptsLXeHFe0tA7AAmBb7HdJmqF
	clp5vz1RZfP/9d61Sc9pZkS3iQrZ+DREH6wE0o0HGdnJw0sSkVdtHdkK/da0UQHv
	ARtzYFDB1W9IXZ9QNC19i18bvBo4uPPJcK8H7pQteADuYqzv4l+qSGnq4s8sI1gG
	xWhhimG27HE7NgWH9/s9zetMMjgQRYBO8EEM8Oh5qEUCRny6O3wwLLlc4SAIIFZ6
	7F8kHu73KJZMOpaUUAyaztcYjPOuf8OyZ6oZMfXnxCEjWLkOzftOTOkpzzxg1Aai
	Mb4mkw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4bds8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:32:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76b857c5be7so5058134b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987571; x=1755592371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsGAhOBPhH6jXb8JLaEGyYLWirWIfQYG+A75B8KfNqM=;
        b=Mk8XtyHxjhLn/sF3LTEU13e+CIs6fJCcr9G1zRZiMg+DPNAlOfRxrspDzi6CnOMVFC
         u+JQ/OER92GoSYbfQndqLkXSUW4dUQPqAi6ODXfyhNfiz+mWaJwRWbhOW5TDEIjZICsl
         tAwFHdCCjPNEb1DLyaP3M7sbtXo1T/9APl06cFG0fObRyMCNHXSJygHdlXF6SQlJVmUw
         SQqqfGwDqilT6d7Pvcq9N7/PYFVJbmaOOh6phk1sNeQ0N3HVNpV2QOCN9B/HE11xk/f9
         77L0weq6M+qIya216foilLZLx2dpAcvEiWxdDkpjjXMUL491AFxAD2VwcApoiKMlwteg
         bTnA==
X-Gm-Message-State: AOJu0YwVuHYpYoF3jZNUjq9DnWeiXB3Jfc7btYBMDD4ICCrwx5zWvHCV
	DTWiHT1zz9NjaBA4Jq2mo/rZqdEihT8jkYZuWdQ089JfwC+y45aJZLDi0OMs4NB7nWT74o8+b9/
	aa+iLXZ2AFNBPbuXlwJgMRfgWoMMlaL2RKZkihH0kA9Q9/vIaMAeqqdD/6lp7VBw4Ql+a
X-Gm-Gg: ASbGncvDLUeFzHAjHdZVimwBscYP+de/krrEuprJFl/neJ2rRALte7GNNJ8P7omRUKG
	j1Z3i9o64SFjeOHWMjumbh+WH5o/hlF/hbdX8vbOsRH5m3+sIF6RcPyYb4oKpYZoIZIXJurGEF7
	n1dZoJIIwNaoMloJEeDmK/KDTFubLhZJFcdrtGp64jbP9pOUbpInh+ap/pX2NFmOk0mlpkyxjti
	JsJgKvbkQ4Wyppz4fCT3j+IYGl9ZssI7T5Z6MSIcrjiI5cql5LUhmiAVYgLMJAsSaEC2nKSpjHu
	4VPkcHDJTjbclNCqFOuVfr3PYwbQfKtfB6lJRnsSkXJNKZtULobu0JMRICU5SlEs+t+qylcvj7x
	Hab9cxegzMI/QGF3ov9Qk0O75Nbl5
X-Received: by 2002:a05:6a00:4b14:b0:76b:dee5:9af4 with SMTP id d2e1a72fcca58-76e0def6cd0mr3811784b3a.13.1754987571242;
        Tue, 12 Aug 2025 01:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhR2w6toMfJEA5k8DSMBAr+Hp2gto1dAdBDOIUnY9c0thK8wCmrUNrTBbF64qPxgnoUtOIGQ==
X-Received: by 2002:a05:6a00:4b14:b0:76b:dee5:9af4 with SMTP id d2e1a72fcca58-76e0def6cd0mr3811751b3a.13.1754987570792;
        Tue, 12 Aug 2025 01:32:50 -0700 (PDT)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcceab592sm28864985b3a.58.2025.08.12.01.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 01:32:50 -0700 (PDT)
Message-ID: <23e28eba-3c7e-439e-88d8-998decd2b285@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 16:32:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add Equalization Settings for 8.0 GT/s and Add
 PCIe Lane Equalization Preset Properties for 8.0 GT/s and 16.0 GT/s
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250714082110.3890821-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <20250714082110.3890821-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q3OcWyO7sc3fV7brv4miA_D6TBs8omAc
X-Proofpoint-ORIG-GUID: q3OcWyO7sc3fV7brv4miA_D6TBs8omAc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXzqA7wcMVglbn
 xPSsKgkt+STBQ/kTYHw2o+hLKSMH4X0HLnr3CyTTuCYT9SEka4s5hRbHbaGb1ZlPjbZHwjlpt/t
 j6xW9TbslSmAm0LLpkULxlP230fRssCdkjVzl2Ne+Mx9ZY3Q5oED2uuCNccROCi3LDyaluIB6Nv
 TcfNGm05dwccnjFHKeBStK6PgpwKgtmYfy28SwijVKIGtJzP4WAisJlyhoIlz3FT5OSM9PQHLaq
 uLtUvMt5MA7ambWSRdIeHeGBY6xuKZ0NZcFa2OSm8CooqhL4VD9yiQxbJ/0jkrXcpmBZUh9yC7n
 nv2TSc75VY1FEYWure6qZXI1IAb1ZeapoavSvcqZw3nBemtxH5QUJAoBU3a5Mr6rM73zS49K4u6
 1g0P+eIO
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689afc34 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=JG0w1mhhnlL07z4zywYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068


On 7/14/2025 4:21 PM, Ziyue Zhang wrote:
> This series adds add equalization settings for 8.0 GT/s, and add PCIe lane equalization
> preset properties for 8.0 GT/s and 16.0 GT/s for sa8775p ride platform, which fix AER
> errors.
>
> While equalization settings for 16 GT/s have already been set, this update adds the
> required equalization settings for PCIe operating at 8.0 GT/s, including the
> configuration of shadow registers, ensuring optimal performance and stability.
>
> The DT change for sa8775p add PCIe lane equalization preset properties for 8 GT/s
> and 16 GT/s data rates used in lane equalization procedure.
>
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
>
> Changes in v4:
> - Bail out early if the link speed > 16 GT/s and use pci->max_link_speed directly (Mani)
> - Fix the build warning. (Bjorn)
> - Link to v3: https://lore.kernel.org/all/8ccd3731-8dbc-4972-a79a-ba78e90ec4a8@quicinc.com/
>
> Changes in v3:
> - Delte TODO tag and warn print in pcie-qcom-common.c. (Bjorn)
> - Refined the commit message for better readability. (Bjorn)
> - Link to v2: https://lore.kernel.org/all/20250611100319.464803-1-quic_ziyuzhan@quicinc.com/
>
> Changes in v2:
> - Update code in pcie-qcom-common.c make it easier to read. (Neil)
> - Fix the compile error.
> - Link to v1: https://lore.kernel.org/all/20250604091946.1890602-1-quic_ziyuzhan@quicinc.com
>
>
> Ziyue Zhang (3):
>    PCI: qcom: Add equalization settings for 8.0 GT/s
>    PCI: qcom: fix macro typo for CURSOR
>    arm64: dts: qcom: sa8775p: Add PCIe lane equalization preset
>      properties
>
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  6 +++
>   drivers/pci/controller/dwc/pcie-designware.h  |  5 +-
>   drivers/pci/controller/dwc/pcie-qcom-common.c | 54 ++++++++++---------
>   drivers/pci/controller/dwc/pcie-qcom-common.h |  2 +-
>   drivers/pci/controller/dwc/pcie-qcom-ep.c     |  6 +--
>   drivers/pci/controller/dwc/pcie-qcom.c        |  6 +--
>   6 files changed, 45 insertions(+), 34 deletions(-)
>
>
> base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
Hi Maintainers,

It seems the patches get reviewed tag for a long time, can you give this

series further comment or help me to merge them ?
Thanks very much.

BRs
Ziyue

