Return-Path: <linux-arm-msm+bounces-38841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A67219D5F3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67DA12832FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 12:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4908B1DE2B8;
	Fri, 22 Nov 2024 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agfKauXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44D1AB6FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279766; cv=none; b=h0/jUxU4zhZV0baUV8KPQBWHm5bi5me4nMwpwmQSEz45m5+KuHUB20Ygiz1uoaltxQvmQWJiffIkJGEqTHi1SMdsyhJR+u1BrGwpk+Vzw+11Sem2phQ9MuwBwjO5saVw6+5IyWdNJt3/0tSOuTmdy7Vd5Sf+I2oTVCfue4G4XQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279766; c=relaxed/simple;
	bh=xTRCGfdo9Stp0wOOB5Wca2fRGwtlSue6W54YyXL4pLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udm8NSRa7+pgMsDIkQFdb9YGuE7/m0Pmix1ywJPIS3CHpM41SBh5SfIPoW38235ErBzVXY7QpO24VZRr6OOhkuyJfM4m83UNjM5tNbgbPFOqFQSAd3p9uzos0j45bszCCgYFitR3Kp/xheMxeZ93ZE2h/C4h2PbjclBweucC3Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agfKauXL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMCHG8S029251
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REhoF/nwIa3Kpo75R8zIL3UghWzoKNPJpxarEg/VIoQ=; b=agfKauXLW0yly76D
	6AU7ux7+iO0SQeiCkJSz3+m03P6/GwZVsdX+u+0siJUmCefobw0EcT+HI526zqui
	TXXcYKa/0RCGx5YxIG/9CwSV5EjhBwOJ/X6OyMDQzyeLdqrzgg+2VFLlRgi7ygjA
	HZVW5y9zZYKKOszkALtU7Mvzr+qTVZY/B+kNpfZ0GcGkIwYS2E8KuXb9REQd8+L0
	FPNyhP9Ap9W9hEguiYZVjWdt9vN3D4a5V4zyTD/NbpJ0IbW5pPCkZkqlh+2ueyFJ
	nOT5ReU2o+DonEU4FiLreGwZ/E+0PT2REqofFwcNmA8wFB0iHU566sgvKP9078n9
	713VAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432h4dse77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:49:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4638321d431so895761cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 04:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732279763; x=1732884563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REhoF/nwIa3Kpo75R8zIL3UghWzoKNPJpxarEg/VIoQ=;
        b=hZyqOVZAPwZEEyYUEIJVepH5yD9iGUGjudxGpaZl9/0df0iSHUY8WUad2PGMLK6Sq0
         lRCam1QvR5AY8MtMx0LLsfHghGyvZ9D0PB/Ssqfhr15vdYL/smg22aTMieqPGL5SclLM
         0IAgygHajR0N4F9U3hJAvBwaqq5+oTf7zrB7vnRJdecjwZ4XT9AMQ8xw+nzeckZOZpXX
         iNB20YxqgbE0P3R6NMvJ8EVsFn51Q2/ADxl+/g8Gt4fd/3uk7t1cOYvOc0PQKPi5VWEh
         KcLjsZSTQV+oDoZJUkyTmTpFz+SWROjfEUJNkFHzBkI2KCLbyhLenu4zeu9Nb5g0Exne
         UNgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUonwivjBVVwOcbKGNUorGZtTV/rIl8rquRyPNP7sBWh6Pd8nmTcgjDIA9nCaYBzmVuWbTjZbLIEaA4aHCq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1yM/ReuWVsHpXqMDh1GomuCXc7vn8gTDqI8F+1ySU/x5bqTn3
	fXbGeFXeMFppy+7y6196nSE9/vv/qYwlPhPkIiUYUDQS63wiNgmbljQK/qIIgJQcrtYX+nXcsi1
	N2r5q0lMEKoCzZUmFdZGsC0tFXRXd1eF0BI1WayJLk5zgSSdVPvqPRD5diGW/urD/
X-Gm-Gg: ASbGncv1pARhL2tpQXUGLgBfqRrGFUBTGDh537HwfxTrmExi4hBJQ7aEVM+z+LmdW+l
	+5V4vNBqy/Ufm9TjqSShkRxRTaLcliEMrW5hW9WFdWGUObNJAyezJKa7EkFmz7tm3MWLyDFYlno
	MzdfUa2BnllU3MBks/HhZQDthgXJeXxYlSntL6KS26R0IrHFGj4BGLSu6FzwFwflvBS1EwPRALB
	7qKL2zKnsrBL9oRM8GyQ+H7CDS3egLhxk2uZ/ArRJlueprKOUT9CsAH+N0GKE6SbSE4VG59lR5T
	ZLgRzakPiDyjxaH+wj1pfkWb7NThXFg=
X-Received: by 2002:a05:622a:11d2:b0:462:fb51:7801 with SMTP id d75a77b69052e-4653d5abc5cmr15544951cf.8.1732279762597;
        Fri, 22 Nov 2024 04:49:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvTuofNSWDF4XHyk9KPOXen13nDRCblVw4oh2lWtCdhH+Pocb6lLIp0CaDfGr+jmXsdDiKKg==
X-Received: by 2002:a05:622a:11d2:b0:462:fb51:7801 with SMTP id d75a77b69052e-4653d5abc5cmr15544761cf.8.1732279762160;
        Fri, 22 Nov 2024 04:49:22 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b28fd44sm97378066b.26.2024.11.22.04.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:49:21 -0800 (PST)
Message-ID: <083d53c7-58d9-4e36-93b1-36e5696dd495@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 13:49:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: bluetooth: add 'qcom,product-variant'
To: Cheng Jiang <quic_chejiang@quicinc.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_zijuhu@quicinc.com
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_mohamull@quicinc.com
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-2-quic_chejiang@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241120095428.1122935-2-quic_chejiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZxGS-kEw056OFv58YsPFlXOo7zipeWT9
X-Proofpoint-GUID: ZxGS-kEw056OFv58YsPFlXOo7zipeWT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=987 spamscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220109

On 20.11.2024 10:54 AM, Cheng Jiang wrote:
> Several Qualcomm projects will use the same Bluetooth chip, each
> focusing on different features. For instance, consumer projects
> prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
> SINK feature, which may have more optimizations for coexistence when
> acting as a SINK. Due to the patch size, it is not feasible to include
> all features in a single firmware.
> 
> Therefore, the 'product-variant' devicetree property is used to provide
> product information for the Bluetooth driver to load the appropriate
> firmware.
> 
> If this property is not defined, the default firmware will be loaded,
> ensuring there are no backward compatibility issues with older
> devicetrees.
> 
> The product-variant defines like this:
>   0 - 15 (16 bits) are product line specific definitions
>   16 - 23 (8 bits) are for the product line.

Product lines don't exist in the kernel. Please describe the actual
differences between those files instead.

Konrad

