Return-Path: <linux-arm-msm+bounces-51306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD5A5F893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 15:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50CCD7A697C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 14:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F06267F5B;
	Thu, 13 Mar 2025 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ni0N1Vw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF7267F4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741876645; cv=none; b=sIS8pKRncdFbns3ScCI6kZq1uMXDENxIvYkGjD2zGvO7T9QZ5DGiSRsfvOxzi2Cl6zB6T96d9Pg2/fIQKygmBEZedlM2exIri6mqNyyn8qolOtZ7BFXVT4JQPeEb8Ny5KawmvFyNiXxuaFw0pFMbmihBxobA8GoSlFXt5umwujA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741876645; c=relaxed/simple;
	bh=+Vnc2/Hj3w94rTEXms9/i3AzD/T69fJGDMl8Wba0QFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZPy92Q1dP582nA4w2JMLRHKjCUSUhSTqqZFCdY+nrzeV7HttOvkj2anD1Y/vWv3t+zJjv7S91YNo6+qo4Voo4YHECc3P5f8MiVd3s98d9VTSLTUR/CzCy7OE9XMobu9ZShw3LkoBEZOle0WHcDB40uGYq8h1x29lUDgTL8TKyjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ni0N1Vw0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DALZQ4003496
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 14:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sihxzLONHjt8Oh4C9n2BqWvtteMvgUGVMwmPo7YJzWU=; b=Ni0N1Vw0FEkaNeqa
	01t5SuczAihq+8ElIa2m22gvmbHoIov0DCEr815mL99SpHG0hxy5xjZjmjfmGTTk
	QUd050uMF333VpBgysp8FrU0L1HxbAjwdFi43wTd1e5ntdJI+YdSz3Rppd4ovdHX
	rBxjhw21Mv0oudq3n/ycSSUtHi8zlYyYJEcdx/yl06eNDfqaxHyceakJAU1hwLUu
	gbVy0tnpmQ9bJYZdxysZW8ntpimTpxZ4vSaapzBN5PpkYNoQdM3dLo2KF90/Bxif
	9vC0N3Gk0+QyNTpn2ZzseZev6Zcujil4jepN/1+T8jP8dQkfMvjr8HM2q2lx7iAh
	QYgoLg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96yc3f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 14:37:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso3367506d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 07:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876642; x=1742481442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sihxzLONHjt8Oh4C9n2BqWvtteMvgUGVMwmPo7YJzWU=;
        b=Y7S77iPfIRW5KkwzTRPfesW1W0tXaEnYYJKI3y82UOriotO9Z7d6Gj0tOdZXBmcpr1
         HSB51SUjQhyon5FXphUlLxRK+RZSzUVNxHuDzi1fNPThLcQUc4ZpWx7XcqEdXFnxdOGy
         kCQtOTimyAqWjS6aEqA0hmQjL3ijptzpLKQM+4N8BbT1rJrb8aDyhOSrJ78AwjZlsMXG
         +PIFI3sO5+c1UOpjjOHnhYC9K6xVob+6DsXRlM2f6SwYhnhmYp7QoEFmE0EdqDQ5VDDM
         u63OQrKo2meoU5puu8Y3IiCYgPxaJ5ZmBjqGKF/W/b/561slgVJvqw9y6JPD2MgekoTa
         KKbQ==
X-Gm-Message-State: AOJu0Yw4rVSHgmr2ycvFitVjsWDGqFJZhs2nTglKhljSJecnIPMOIl8+
	93S+jrgZp9PJn+/4noW9apeNANU0xs/XC5gTFQnGWmWHRlsqPMKrZw4MsP3Nantx2sLvwcLiWwV
	tbKl18rKxwMkbHjZbO8pxe84alUqsRpo4LeuYd8MoWTEvKZ+hp4rTigB0xrje7fK3
X-Gm-Gg: ASbGncuPQoD69ndzbKP7E3TQ2gANISqMoeaF87vt6UunMwjcCe+EWeDRT92mtXVgDC8
	WE/kCvVs4eD+fFmwATu0Uht1lytFxSMJLh8dz5pJTldqrOtJZgfmUsIeCNaU78WJaecQDfduV7z
	Y2azLcXp88yUG+7i617rI9Q6scuFahLDfBAlRBqdhvxmAeqV+nhuwDgFJXKyg9+opGGTkTIqI63
	/k2ki6lcAOdTntWCgDAZgUUjN6VbNGFUIEeBn+BiUTYiHOHp4H6iobGbM3FEyPdkq5t1HbGZw7k
	j4hZsE5RBqGgqdpnGbqZCHaxWqhp08KCFGYWufTUhyv72mp2Vmwq0Xy4ur5RUXrSQwkypg==
X-Received: by 2002:a05:620a:2443:b0:7c0:b7ca:70f6 with SMTP id af79cd13be357-7c55e90cbc0mr638897085a.12.1741876641974;
        Thu, 13 Mar 2025 07:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERjH7r/ky+QJSZhtuQ428edqrYv/ARSPOHHVI70rPypcSuf+ECqANAAhYxQXbXX/WsiqH7zA==
X-Received: by 2002:a05:620a:2443:b0:7c0:b7ca:70f6 with SMTP id af79cd13be357-7c55e90cbc0mr638895685a.12.1741876641593;
        Thu, 13 Mar 2025 07:37:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cf219sm85801266b.88.2025.03.13.07.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 07:37:21 -0700 (PDT)
Message-ID: <d964117a-6e74-42a9-a7fb-c08e3ab84217@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 15:37:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ARM: dts: qcom: sdx75-idp: Enable QPIC BAM support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
 <20250313130918.4238-6-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250313130918.4238-6-quic_kaushalk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9PCDhZrKqQTtYyOTmTxjsfL1TxfsVo5J
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d2eda3 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=eg4k1RuA93h8uGKq0ecA:9 a=QEXdDO2ut3YA:10 a=-9l76b1btMQA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9PCDhZrKqQTtYyOTmTxjsfL1TxfsVo5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=724
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130114

On 3/13/25 2:09 PM, Kaushal Kumar wrote:
> Enable QPIC BAM devicetree node for Qualcomm SDX75-IDP board.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---

There's not reason for this to be a separate commit

Konrad

