Return-Path: <linux-arm-msm+bounces-35959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD49B0D9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 693211F253AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D89820D516;
	Fri, 25 Oct 2024 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kx8P3c1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3904220D507
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729881783; cv=none; b=Dvf3wvgcIXalceXSOpwulNvx/bvK+TGasZd1uCphwh6+ZMnEHJS6tZS8m5EKYSflX7JAJeMg6wgvxL0Y2T0uRMLITXdOMgw0hha2uxxDFzIfntQhfACAdTvo3QSoxxshnW2EAOnYa0tFg5GtIf+28QDEHeNPYjzcYF9aO8mezLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729881783; c=relaxed/simple;
	bh=sXpVGo1H7dGGXwCO8hvCponjq9q0Fo312durYrLhaJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mj28JUaT0cCFV+RlF1UTRrpOewRHumFhAaMFJAXpf/HR6q4hSdGCpStKqZspGSohGZqbNGeIdTfZ1n4ii9MnqzlJ9HyyQ2Jr3Ti71pHMlxWqSa1sAu2ZS+jWLqlbRZ6POmVZnV0laEcTOG85zufzjNiHCSCJ1FqVV9afFSnGzMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kx8P3c1w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAocTq007706
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CftwoMsXWNDvdSWjKSB8oIIniikESu+F6kHXU+lmiTE=; b=kx8P3c1wxhhCFCeU
	0VCAPF+87wcNkF5nuNJT7QZ4sBx8FPeCU4Y2W/BkjzWdC6NtwzngCeBriCRqc1CF
	Uz4zB6lflWm0y2NpNLkRkC3aAhlzSg2lpbro/z5lGQhImCnzn3HhSYe/w0h6a9dt
	G4Hv6mwy6I2FYMK+jfzcYB9gGQ0xh85N57QV08bknX7p+En9ilFX9zBQRx3yyuF8
	NucwgyMUOFvmAVGaJ7P4+uWz1tnxqntxYVADZr7FRMntJDaYx3dKvVy6ZRMlSoq+
	qPWa9iW66tJ9UcAdmA8HPFXtDnkcPWdHOundEgF90m8l9AAQPVkF3X5kbynngTCK
	SQThgQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g9x6hed4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:43:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-20c772e9092so2974025ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729881766; x=1730486566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CftwoMsXWNDvdSWjKSB8oIIniikESu+F6kHXU+lmiTE=;
        b=ST4yLZFhAUx95s5c0Od+6c0B62qJwPM15G+kduNHyEAlZMwWzx+ZHoRYdq0SAmM0LZ
         evdIz0WHCVU46FECEOMV+at28fRG3hEMZtDX4Ifj55YHO0I6/MOi/UXIUSo944xdrkVy
         GXQnFwT3lEYg4V0D2WLGNymqje8KNxGI1UJ0b61O3b5r2Q3Vfcut+KyJFvazY7PGWbQt
         sR1nw92GZumbuItxKAtDMdhR2OLcK8HiE7/w9jps9XNKZ9t/JCa9HbpyRdmU09n9idwN
         0Nn6tdOuMDWNqalXI1JHb+JOaNVkgNA7Ji7xv2yw7ZX5bbzEaTkTkKQb6dsdKOi6bF3U
         8Eqw==
X-Gm-Message-State: AOJu0Ywxb4gYjUvjpe8sX/sMLl/HABM4O3wWTPmUE5BukqC+yZWG8pKH
	Gd45owO45h0Rmnv9tnJhIdi7CJgPNnOLFgfa+mAbGRyR2YAyeHQ7zYXnJMfyWZY4pPO0hF+sKLE
	bs+Fq40MVflzhyay5QJSC8NSBlZdX7Km4K+Pe2CRqooKl9BnJfzC/OlmKC5celgSJ
X-Received: by 2002:a17:903:244b:b0:20c:a97d:cc6d with SMTP id d9443c01a7336-210c6d2da27mr402835ad.14.1729881766644;
        Fri, 25 Oct 2024 11:42:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWkKLr4ZwAHpej1ExoPooP2vHAOpOPuW/UAfIFlsj7x1W8eddwvRzMSNmaPvr3Dqx1X2lzAw==
X-Received: by 2002:a17:903:244b:b0:20c:a97d:cc6d with SMTP id d9443c01a7336-210c6d2da27mr402635ad.14.1729881766328;
        Fri, 25 Oct 2024 11:42:46 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a08a70fsm96210266b.224.2024.10.25.11.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:42:45 -0700 (PDT)
Message-ID: <9e0f200b-53dd-4dbf-8b0d-1a2f576d3e3f@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sa8775p: Add support for clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
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
 <e810ab3d-a225-4c85-a755-3aa18c311cc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e810ab3d-a225-4c85-a755-3aa18c311cc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O4hgnCpEICyTiTzWHLr3hkfLq6OIxmDp
X-Proofpoint-ORIG-GUID: O4hgnCpEICyTiTzWHLr3hkfLq6OIxmDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=668 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250143

On 25.10.2024 8:42 PM, Konrad Dybcio wrote:
> On 25.10.2024 10:52 AM, Taniya Das wrote:
>> Add support for video, camera, display0 and display1 clock controllers
>> on SA8775P. The dispcc1 will be enabled based on board requirements.

Actually, why would that be? CCF should park it gracefully with
unused cleanup

Konrad

>>
>> Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

