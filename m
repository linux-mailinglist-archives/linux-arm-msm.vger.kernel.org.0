Return-Path: <linux-arm-msm+bounces-62210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214AAAE6594
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 14:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AAD73A701D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC79829993A;
	Tue, 24 Jun 2025 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4tnesdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3D427BF85
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769638; cv=none; b=sd8zN7/qKxBSoaD471vKTMsSE5uWd9yabSHnngCaQeTHTB7rucIP78ap4VGUU9cOGNF+Pjip019OWiioYl2+HEHBd23edqGMwV8n3F+NsiYM/6agHY5p6cfI13aP0cG18Acn7HlU6/ytxihXaoKTxAgJqkjg0laPsuWHWRH8TFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769638; c=relaxed/simple;
	bh=tNIhnvuJL34DWyW0/9wKkWvSs2dn5yOqIFqGyBcGiyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=df/JuXP2kp9wrxwLXqXl5OMkceXiYER5sdPX/4Xz3rDtp8E8UA5aNPDWQLwKqvBIHxm/KfIkYmhIJ5n+FQdNKrBxw3djG/X4ocrJ574kL8R7LkDVNwnzDh7inJSKtzRG7rRI4XIrg60QrN/4IsMOl2EOxtOqNl3a1xLJJ/1pMu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4tnesdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6vZEu032752
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeRBeFnF4lcno5Yc+pip1PsV/E+s7JmR6bAmZl2QfIw=; b=o4tnesdlmoD3y7mR
	b6XNGNjqo0V7b/+TfJAN+ogKd3ncfjFkTcV15lfI3p9oIMlYcQIUK86QLPJ+TJT4
	8Q1UpadV094/L0EcG+k2MxAR+dmqUN1bfngUhDMHwMluNioGvcgDWnHeOPkObIBO
	TaKiTdtyp4gCQNnA+Vd3jtLnrixgtxaUlN+reItPQHSKLk0OIpWrvEylFNnHeQFN
	icUGN6iRk6xrQ30gHkx5FmiT/eQuZfx5NQS+5u4HVaapNtqaO0ILpQLEtFioDsES
	VkDZ2FbUJgPRkUAh65jOHiUCkNycO2vcvRiBvLMYp1uN9Q8fXAlOnzHz+7Hazp38
	SobelQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1tnr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:53:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso139739585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 05:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769635; x=1751374435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeRBeFnF4lcno5Yc+pip1PsV/E+s7JmR6bAmZl2QfIw=;
        b=tj4oiqosbXcjXZh9e2PonDu61lwbaPMtlSx+7pQtD+fMKkGe1E+H3UQ8bvc1adUr/1
         RyCQPjtNJF1VhAXY6rO29Oxtyj3+d/kaSh4q1jfIp4PwQlu9ZOMTEkNF24QhpmLQGeVL
         /nexL7Rrc6VI0xFEic5vS2i4ZLArCH7ImDySFTdzqMG6BFmGMOcOE5jhWYNiw63LzwVQ
         MAsl2oX94u62UtJ2XPLhz4m5COBhUnKVWmZlQVxU1gTvT1UO0WMVp22LGImIr5f4QXfN
         mA6lH3n3aA/O3vRV06wZM0OHIUZc1dPtY5/YK/JQ+uWcS7QjRF9MIynhAHhTHJYBGWQx
         VL/A==
X-Forwarded-Encrypted: i=1; AJvYcCXDW/lCYpv8CE6uSEjNEE5x+FgZdbEJIYfIbqPE/S6flwUhMnOLrT7+C0FPRgvWVp1PeJm+mXbC3j/JoAo2@vger.kernel.org
X-Gm-Message-State: AOJu0YwNdLx4/YmHDcv9fqqSaVfgQyXDsc57UD6E7FLd7kCQB9SOHHq7
	CB6x7TC/Cb1m4oWodHsWTUm2Qs7ESKVavLh5iooEuPZkOKey1ic8cMuMlDFp/lVZpF+7u5Le3cv
	sTjzZwdX6uOquXK6vWj1CYTs7jvNAb6f+LVFM8w1STwcHHLhwIwuGr4CfhD8y1ayCHPzA
X-Gm-Gg: ASbGncsvmSTt8gjoS3DGtH6xhJKFLUjBnqk/x11cw4CvHA2utnOx0J56Q5K9yBv5UjN
	e/cQ/VcxnpT8F2hVq+2GyPh+kZgos+LlL0/swjrY5f6p32FTQEUNJDV5lU6ihYZ3Nklsydq+gTt
	NAyQfwlc6Uy++ovl4G8Q9AGWfkv7lR3LzyRcKxNXBEcdqNIvidj1N7vcvbL1pzL7yTL3vAQ+ETf
	vo4eFPTEJ0ORDd9KoQN7tYyq4X5Z2EksKOQMxb+jQyjy/w9fYG8tuOP2+s5YB06CxeHkWESyarX
	vW7BmRO6b+XjB5vaV1X4ULxNvBPs2DgFK3EU+WXfWPS07Od7eMIM4wRyTbbMZVHwk2bCKqAg6zI
	rETQ=
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr757962485a.6.1750769635201;
        Tue, 24 Jun 2025 05:53:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm26Atmzo8lMPkhFJw/P2Xp8LDJYbWX062GO4T8ZPwBCNOZSuvof419wfPyXwFJWWZBsaOMQ==
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr757961685a.6.1750769634731;
        Tue, 24 Jun 2025 05:53:54 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4975a1sm1007741a12.68.2025.06.24.05.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:53:54 -0700 (PDT)
Message-ID: <9012d2f2-b9b0-4fca-a047-5b5adb921ccb@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:53:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
 <20250624-more-qseecom-v3-3-95205cd88cc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-3-95205cd88cc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a9fe4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=aztlNrSj1wai7b1BO2MA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 9Rqn7-6E-rPQ2UChi236cIjOgkY_UrSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwOCBTYWx0ZWRfX8tXwrn6tV1MR
 PqZ5Snu4imXho7X0M+sluNRDLpAZ3j/Wud7YYXuFoUv1nKO3GsSpdvWedu79uyNgy3lsbjZ/1eZ
 hRONG7OZeV1EakswYGDNQZc9whDIOd6xs2xChqnHamdmHaG2iu6Wxp9c+jvRggta3PTojPhPo3d
 /MEvJncBF98hQBuopP5sIFAXfvHI8YirNq7GDFG3bflAAGqcDvaVJ2m/mjkavqyTbzLhS+Gasdj
 QhzcVU/KI8aaNBX9hPnpR2uqpgEPdgZ0r5ie1NPkL/eCDxHuvO/S7N5cojYosty3Z873qm/+gmB
 hXd6JsipmauQeheYlHgq1skouhbIPf61mN6dRC7EqvqpQs4AfUk1f0U2zaT5gzhxb3rDTVSqCQ1
 MoaoM13hg+K5k4nYT84x5By/1azA0zczaJ8Mro0JWRWUJoQmQMwKHMP04OJH4Dq378ueC1Yd
X-Proofpoint-ORIG-GUID: 9Rqn7-6E-rPQ2UChi236cIjOgkY_UrSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=935
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240108

On 6/24/25 4:13 AM, Dmitry Baryshkov wrote:
> For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
> update variables in the permanent storage. However being able to read
> the vars is still useful as it allows us to get e.g. RTC offset.
> 
> Add a quirk for QSEECOM specifying that UEFI variables for this platform
> should be registered in read-only mode.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

