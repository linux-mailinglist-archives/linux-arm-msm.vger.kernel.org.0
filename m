Return-Path: <linux-arm-msm+bounces-42012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C94E9F0CA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EFA6169F40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F0C1DFDA1;
	Fri, 13 Dec 2024 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niipu787"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C4B1DFDBC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093908; cv=none; b=KvyfaFSI03SRKszmVv9KwZ2LHcOnwugxUwDwNbHvqoU+h52tuT1PXSAX9xzhrjb27Qf6ppNsIA9nFZGCEVsKg1nmXVVGGMsNTXqRpbsDM5CZbUq4z01fCli6XZRV9M737NXtFueIsxMDSl9z3ZCj7C+/PCVhyiq8LiE+vaVR1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093908; c=relaxed/simple;
	bh=JYpFD2JTyAPHJh0LcGmkihjMxrYJLIJGHzffjuy4Oh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/vNm6Tf2NSduO9GahAQcca7+G+LRslaHv9U7era50QIEI98hINEboYpppg8raIOzL9Qcw0Sfs59XFHSmnTdkYjX4w5692H3/quBzz7BHYYggjHFcjhrh/6lpHE57gk9QyAMc2Xf848zCzUTyFxwbwcGnXkadj/PmluxEOrMO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niipu787; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9sDE7030156
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+py4yuAWBmdgeW1jPtgIlP3H1NVXLVQsrI1tZ7iOqmo=; b=niipu787Rs0b8dCX
	0NQOz72fcxoh6msFFF4aZASD9R/vn6eKHtZU9OmNgmgH53G/UoLz2BfjNGuHZ5Cq
	PL2c8YOumVhZ31YOCMIxeUsDrEAf+ny/8rf30IatXI/oijdsQT8Nlw7bX6WTTHpc
	z+Kfds7klzn+OSscqid69ObgI4nylWOYkmkSlgTv0SZ6LLJAKzo8uBgqG+VexCOn
	dcWFUvJWBBcCK516Md7HACL/ePoU7Q6u+orZw7YJ8EG7CHSRBUVQTOhq5gUT6gWE
	jo/+dhxCsqRCMrpnnm0gl/7oy2as+TyZ1MWTm0c5LRpClYkudCnkv4LhbaqkU7L+
	/3ygMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgekv87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:45:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467a437e5feso2090801cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 04:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734093905; x=1734698705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+py4yuAWBmdgeW1jPtgIlP3H1NVXLVQsrI1tZ7iOqmo=;
        b=DC7V87jsVSguCjKgivcR1nf8Z9lzXKu5p0dwvg8pMBxxShn6Uit1krWp+L3dKiF3Cw
         LKgjCWx6HeizBBGKlG+xRwkXBYZVhfXq1EfYMZc5za7KIypEvs4GGHttgVwTPOeT10iL
         TJdTw65RyC2OB+YywACnKc9b02FpD43rOnCq1ReilpjYd/U05W7/29NhzdHpMFvZCS3J
         5QpwBABgwMWPBIAPnfgJHwwOmdHig7hrHosARugVfQLsZ8bUdV7wDGZVA+B4NIB/qB2r
         +RLdWkDNQJZILvKG/W2zlX0LRzN18KZSDcNNdu0ckpyF8gSXtTeS3AhaRtzjhtiQA4mp
         OiHg==
X-Gm-Message-State: AOJu0YzE2cofjpXhOtFQfqqSB2Oxu999oGzaPgeJSIaAnC1oPsNP6AxC
	FhQgGKKKB0nVDx0OBq7zKZBlMxVC3IdDIIUgwoz7lD2P1bTB/I1Qlh4oIABLMToF+mSYeb2KxxN
	UslXOmWpX1ZP32xUK/lQg4RibWfBuSz+q/3oUy9P+RT1wyq3oJO4sxENavLo12yzo
X-Gm-Gg: ASbGncsgDcxtdmt4zvCoYcyZjZuYJ98W/P4HuO2NrqH8j6R8oYI5D9Gw2zNmV1Y9ivX
	5DYiQIBUvKoiTU6xPqm0iukdCEYF6cbNIL8G3EoEC4ke+0KMvcFoJJUwoswzyWlG2E5xr6kbIjQ
	kCDVnUjsJinvN3B5Chj5PYuTdHXbNG6wnaA06KzhQq7ugNvLUXmJgc6YyAB3p135Rc2UkpwlncK
	6toYLj4cceyFKmsyPMNG2DtXxBU5ED3mxOHQcPephPXBFYvFuwYNv8hv+cN7mX+dcTQnydxTB/m
	SJUArmsV4gD2RVjZ8oB8zM93Souaw+9Semjq
X-Received: by 2002:ac8:5dd4:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-467a580084dmr15700681cf.10.1734093904703;
        Fri, 13 Dec 2024 04:45:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWpBo8jDKAUGFcsAt5h3utlrt4X9Lyu++J7Nctz8IrQCa+saJdAY2YnvB6PCnanR2c4n+x3Q==
X-Received: by 2002:ac8:5dd4:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-467a580084dmr15700481cf.10.1734093904269;
        Fri, 13 Dec 2024 04:45:04 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699487854sm592175166b.13.2024.12.13.04.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 04:45:03 -0800 (PST)
Message-ID: <3d54859a-0f10-4e67-a05d-be5546a949f0@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 13:45:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 add touchscreen related nodes
To: Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Joel Selvaraj <foss@joelselvaraj.com>
References: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
 <20241208-pocof1-touchscreen-support-v2-2-5a6e7739ef45@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241208-pocof1-touchscreen-support-v2-2-5a6e7739ef45@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C4_8cgrK3Lu-vZ-77ZikGsUlxXm85l25
X-Proofpoint-ORIG-GUID: C4_8cgrK3Lu-vZ-77ZikGsUlxXm85l25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=767 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130089

On 8.12.2024 4:23 PM, Joel Selvaraj wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> Enable qupv3_id_1 and gpi_dma1 as they are required for configuring
> touchscreen. Also add pinctrl configurations needed for touchscreen.
> These are common for both the tianma and ebbg touchscreen variant.
> In the subsequent patches, we will enable support for the Novatek NT36672a
> touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
> Tianma and EBBG panel variant respectively. This is done in preparation
> for that.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

