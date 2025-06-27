Return-Path: <linux-arm-msm+bounces-62813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D5EAEBB1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E5B118980A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BE52E88A2;
	Fri, 27 Jun 2025 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkIDuFUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37C72D9EFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036949; cv=none; b=rzqSsv9rvn6b2WgdqCbjbG3zh9omkoUzm9CH548YAJXOmjHVesTS4f+9m50juOWkuW/NVTUz52ZtkUkLX+DbzGIpXOX9/SlkLEXHw96riLNNQFQ4KnujrmVgWChow6k3LeaHI5MXcpAK+1fmehC2YbIOGeMuXBwCPJ8M/XTHFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036949; c=relaxed/simple;
	bh=iMZn/aTdSGkvKkFlQS1GAGPqfZH8KYUWTWQbWhJrKso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qf/srVeOsOiDSR1lewPxACUa0ZkRwJ2kDpGx5uD+cAVbutAqH1PFoCmhjXIy7y6nCjDZyqTM31p1F8QhgQ2gYnI0/XW2bZrE7ynJ00ETX1l4yzAoW4KzDKh7D35dK6GXj4neCcTmE7OxbnF+t03n+OBOCD2RaooYZp8dAqdefEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkIDuFUu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBRr9w009570
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/fF5SH13vrMw8KXy51ozasVmBjXn9MBTWvPmrdC+UC4=; b=kkIDuFUuZQ5o1xkL
	G+WE+dgI2SllNQ5TJqfxVAZfrOi7ScVO07RCvFz0Jjd4QSzW4CQJqOC0j+Kqmaq8
	8iHWTiRcSJnJa68C0TqIkYa+A5JEto1OWb5iLyfIEogAJ8dq7fcbib5FnYM8i333
	MNrkiu+YSh9z+iv6iStYzYXR/XdiIqBU1P+JCnkkrrAuJJ6qxorta5nCO1N+3T3y
	ZM6eOHpyRmkNT4ayz1ZYE+CEjT724kcQtDP+xBD1rXKOg8Desu8mLbutOsSfS1lA
	QZxAP87BdTcZD96mOW7qSiDhR9o5btMQiqYqeoJuHK3A7vu5bvude+gYqaXVeYA6
	GSNy7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b475p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:09:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso42264485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036946; x=1751641746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fF5SH13vrMw8KXy51ozasVmBjXn9MBTWvPmrdC+UC4=;
        b=PC+KdyKKGGEvF5xXEtLwLja0x7PRfNmjGb0Q/tf/qxO9UIf4siXPXx2wMiTyIUy+Ss
         V3Q0qchkLpZd/85bkahTcoDYR4ESVzg/jj4tM0GngqmYuorjlck+lXKvJ+/W2zRISun5
         H2irYL2DhnzrQ0GMX2kDjvw74dFpMZz2OtYIzDJTotWAvl4CVcZisVeMH0jNqMaEm2bh
         7F40yK2Thl6QWMPsw8Srb/h7MtLa7JGEiK5dgkmBCDvMBrSYDRWw1tRHzY247COjAG2I
         vlkqjP/qz6XDj8OHX8hGAiwYtXywayOqHPUqZzZ2sPw1/ulsm7y1c5yd/Tph9bbX56K4
         3Gqw==
X-Gm-Message-State: AOJu0Yw/WDh+xnXzdSqtg4wJNU7mHuW6rMTGdYN7t1j5Az3XvAN1ZUFv
	NTXMV+Vb7sJIuFW7Oy4taX8bRn9x0Z9ix/ivQHaJQQCDy5G1qIZvCQT1wAPuESRLMYdCLr8nVQG
	PsyV1e6mQNaMwYjfvZwPzmlOyvdl9oBX8YyU2aHS/51Pa2YGFt18aDP4Q9cn7tya+Kn4+
X-Gm-Gg: ASbGncsRd1+pCV8XfMWjtSEe9CdqClcDkxremdIzKxFcFnz7pX2iiLEx9WHt+e16JS8
	L4mYYY5G0IGUe8wOQi/zqf0JLJTHYaMFGCnNG/+jZyoYcz13+zF8d+bp2SOUD3dlrjAfv2jAVMA
	WzlMYP7MQvTeoqAsMGqN6nKLsJrVO94jmgdJ5PNGdaIZ4SWMXvi710ApJkYkxQnS4qD0n4P1vEa
	5grBNZKVnidtiNRbuaXLf4gAsKu6y9jZFZKeNjRN8Gi2tIVU1QZzLFrOq262YHuIiqEomBuORuC
	Yayku+z1GfOknCtMnPRKr04Zn4orZyLY8KqOOvUFhUvz84f4VEUdtcfOjJweV7Yr7RKaPgcOqlA
	AJXs=
X-Received: by 2002:a05:620a:4447:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7d44391f092mr209041485a.5.1751036945719;
        Fri, 27 Jun 2025 08:09:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETw4nn0kGPIiE1WYULEdxyyAO8SokIluvUEsVpj6pE8PQWACUktsCLwBYUcxwsaoA4Q1MI0w==
X-Received: by 2002:a05:620a:4447:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7d44391f092mr209039385a.5.1751036945328;
        Fri, 27 Jun 2025 08:09:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a021sm142492566b.54.2025.06.27.08.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:09:04 -0700 (PDT)
Message-ID: <42dd44ef-cd6f-4dce-bd40-6f5cb32c5fbb@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:09:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: add debug UART pins
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625152839.193672-1-brgl@bgdev.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625152839.193672-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMyBTYWx0ZWRfX5I3P5iIUcOWO
 sjLZP89NbQfrx2eAw9CQPFE+mnkjYYVLZquE4hPMBM+hIkHmNDEhEFS0nuTYYmydElc2bJf6Gw8
 +qw0BHsbxFc/ozir2jjEcuqFDo2pzqwOEUFz5kDPfnpYTAUnLfjS+N5CiSdHkFzNJxgp3SWhRDy
 nxvFtjx2BgK4op6w0euzljP7LAgAUODZ3qrOxYFeMRW7tSGZHCgYnLMXkX5APy6Z+Ru1sAmaN3J
 2PA13jh9o9wqf2ct8U0S3V3bxXu5f49qbbrJEwDJnYJhL2pH1iTmHySYTwTMAmqGI3xyTqFghPZ
 xwfyK9wuW+vCPKrB74vnP+Vg2uURIBoCbKBRJg0gZ26wRly8qYBJKN5u//IqVR/tJdzKiJUkjv+
 KxmBM5ACwOA/vCWtE9qAeDo/+smNLboYkOp38gplrd9DSVXZkeMYmfRqkwk/xZP8HQN9C3J+
X-Proofpoint-ORIG-GUID: YtNuCYscT9Q0JorYBbEnjHrNtmMxcyIF
X-Proofpoint-GUID: YtNuCYscT9Q0JorYBbEnjHrNtmMxcyIF
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685eb413 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Wqh5l9TQGOq_QAyi0ksA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=914 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270123

On 6/25/25 5:28 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We should not rely on the bootloader to set up the pinmux of the debug
> UART port. Let's add pin definitions for uart4 to tlmm and bind them to
> the relevant device node.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

