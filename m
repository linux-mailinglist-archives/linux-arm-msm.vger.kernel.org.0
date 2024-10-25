Return-Path: <linux-arm-msm+bounces-35958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B89B0D95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52F10281249
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2EC18C01F;
	Fri, 25 Oct 2024 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+3JH4aM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C818BC0E
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729881728; cv=none; b=SNFJ4aGAYu6oW3NGEvUfDKAI518c4cTQbPxdC+dM/7jlPjRprNhnjm6mTb+UKkYU9Hy9RChoZSYG+0YG/lbGAIvRfkh9O12LVacNIWt1zNG75iDGzyoO0rXLNWwm7eGj2hFJo7c58rHo+gy6ZKmtQLBCQjqZ3MxljOUR9lijVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729881728; c=relaxed/simple;
	bh=M5VYWMFQeK8U6JBb1z+bQr4mOznC2Me9nRhBWVcbFuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7Pn8jY5HSXuOoyGXReE7TlC5aCEb2SG9I+276j/g3eQOfQRc8/PXu05T0NHokQrpepBUqYQFzHzFZrBzDxcAMaVciw17Y/frYujbT5neHeL8HhP3eqTwohS7QmHhuChGRLOGq9aWIb//9FgIzvhr159HOPNZVWEgW7IIZqei6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+3JH4aM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB273K001006
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ3FRvP1Zh0KKe4wQOOkZ4FJneCOv5bCiWn6Di39QG0=; b=f+3JH4aM4W4xqfUU
	NkL3e1UnUsJxQAz799JKKH4VU38vbdDeCGYdluoH/jsL2jvW6CivWzqQkjGTIRAu
	6H5JxgcFtbqJpVwALbd7yns4eZpl/R0YQuu0utUxYsOoy3L07+Z/yki+ADYOWSqu
	jnkiU+39UlSwNKSaFaMhrzwkuGyIba70Jv4SaU6Kw+Y8cyLCU7IUtSzp5ItI+54c
	F52wyIDvAk48m4yIQ3MbBw2dbQ67MDcFN2KcHyMraVlDNPaWJ8Q1RHMTbPOsCpfC
	QMWlK1miyKsSa0JaYNcLyBT7/xeXOCMVl+Bb7gb01LtrYUAqwQBK5Je+O+FxyCDh
	UcYsjA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s1bv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:42:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-20c3ad07bc7so3660645ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729881725; x=1730486525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ3FRvP1Zh0KKe4wQOOkZ4FJneCOv5bCiWn6Di39QG0=;
        b=ssX+dwUdlOGsd7nHxd0ZhgD5+gsDsZeQgD4JbjDV7gKmp7x5/KeyTfkRPBMtITf7OS
         2hqrZSIP6k51ByPZpFYJtEIKsK5Ka6UEjMreBYk4OrXKvSmyebENUYWjiqp5EcwS9TJv
         AbIRI4EDeG7noAmw0UrqePNZ2VbqS4o40X7jC5zR8DGCDqa53krQ31EdlWocLPgwYGRX
         aMZ4VDbSKpM6rTDXjUd06qbVL4R6GKOYoj/4wpgtd6vP8C9wiwJSCTxeSlauvoZF8VJY
         S72Cfq7fsjcqtASOyb4l77Aip0PJFatwwvriRq6/+LVlEDVVdXOjRfqXHbLfbg5xMJwu
         cLqw==
X-Gm-Message-State: AOJu0YzmG2Kk86Un7OkjRMSChNZVHy6gR4Yhth/MG8C+u5QgrbmacPFp
	a8+ePnG2JmN2CiZKtSRCU8io8TQBUy1DgCA5Swtqna2P9H2seU+nK1WL+IjCpvhxRURyOoOhgo7
	nQ59ZRndWPv59KIFWDBl6KtlYNEqvCyZJdG6PBEGkfGJT76J20JozmYfXCofS8Xow
X-Received: by 2002:a17:903:234c:b0:20b:80e6:bce6 with SMTP id d9443c01a7336-210c6892c0fmr702365ad.4.1729881724866;
        Fri, 25 Oct 2024 11:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP+EmOV5oTrcfqt2RNx6qYSpSQtYrLfew1alsayN6FOtidh3t+LdPrNE1o9vsl++499tZU5w==
X-Received: by 2002:a17:903:234c:b0:20b:80e6:bce6 with SMTP id d9443c01a7336-210c6892c0fmr702195ad.4.1729881724520;
        Fri, 25 Oct 2024 11:42:04 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f2982c4sm96514366b.102.2024.10.25.11.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:42:03 -0700 (PDT)
Message-ID: <e810ab3d-a225-4c85-a755-3aa18c311cc5@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:42:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sa8775p: Add support for clock
 controllers
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_imrashai@quicinc.com,
        quic_jkona@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20241025-sa8775p-mm-v4-resend-patches-v6-0-329a2cac09ae@quicinc.com>
 <20241025-sa8775p-mm-v4-resend-patches-v6-2-329a2cac09ae@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241025-sa8775p-mm-v4-resend-patches-v6-2-329a2cac09ae@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UY6bDKD85ls2Js8vLrzfLccOkCRHwYeV
X-Proofpoint-GUID: UY6bDKD85ls2Js8vLrzfLccOkCRHwYeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=823 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250142

On 25.10.2024 10:52 AM, Taniya Das wrote:
> Add support for video, camera, display0 and display1 clock controllers
> on SA8775P. The dispcc1 will be enabled based on board requirements.
> 
> Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

