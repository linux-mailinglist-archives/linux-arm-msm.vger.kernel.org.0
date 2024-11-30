Return-Path: <linux-arm-msm+bounces-39721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E374B9DF136
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 15:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A4A9B20ED2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 14:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D641C198E78;
	Sat, 30 Nov 2024 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIz4yTwl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653F719B3C5
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732977463; cv=none; b=M90pvP5IPcSVYRZvGv6lAIUe0N7dHdubfG78kcRc74kgMAChLJHlZhgrjy6S0HVn82HdMdrbbmwUiyPYq1MN1uYz2HP6yMdy9scIu3NWef11oiYvYlQJrSpwnraX9lP21iiEsa+pEJ5nYSiQFobBbDtI/W5GbXAfq8SFSCcwbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732977463; c=relaxed/simple;
	bh=XlerfwT7ACCmj60OnxH1yPhA5IycPklSL9ghjbIpc9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j3qqm0pvqglw5L8ejFe8DIlRh1W6IpbGYrXlWBau4cRijnZaZN/Z+5SKe92EpLQDercCuvHuYKWT7e6fMWdcVrgwOK1Gt7N+JHOAXB/tymcSdDK1vGlJGYcVEc39UwD8kK5hXr/OAi8RpWSdw0HLSe3kfVHu9Hpnc8eB0PQSzfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIz4yTwl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AU4wsqY023870
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJ2Q5rORK7KeOCcHWC0ExE9h6K0BZReZVvR4BwSVNjw=; b=QIz4yTwl43bj85Fn
	VdZlofOKqY3qBjyMV1fqbKcVGBRwm59yyk8d5BT+mKVPONAKr2hAk6kAGPWhALKX
	+HlpnapCCK+IKa80rqDGaFZCHx1xCLxVGd6mVdOXhjxyWMARfwEG2WqyUPWauWBu
	NTzasq3dZYROVeEneg9/1EyTgMZv9IDQcnkltuZBbZO/2cCxcqEmqUx7AC7EEkbE
	nFKT2XDCVl8U1PlwJKJkYrVWjHSrgUGynQKeixV0M/n7iCo6KAE8mGUccXczFM95
	+FiWDinpiOaOTfHx1X+tfBwRpt32qx6tVQxGkjF3PSWxPjn/BN3w2BYA7QZEQ86v
	IxtzcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u368u0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:37:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46692fb862bso3634111cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 06:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732977460; x=1733582260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJ2Q5rORK7KeOCcHWC0ExE9h6K0BZReZVvR4BwSVNjw=;
        b=YKDeI7KHnqnBuDm/EQgTq56Y4252VLpr9yreFMeAonWpgSnRqYbO+PJsKJfez+QWzz
         cSfwxG9cOrlQ/uoYG0o1XUm5MmR/XK7If9T00mrKdIjHuAGPxXt2a3TEldmYM27X+spv
         G2GUqKS7tvlIgvven6Ww93Y6+lePaAqgzDJyIX3MQxOXV+ES7FcpCN0LnVtACYAOxVeY
         PNWYLrWK7HXAr8nJVS5uMLX581a2fXizuoq8HfQA1jW9Qh9i+1N32PwPerpZcTu++zvi
         CAXd6DoiIjfCFVa6PeWtm9/AK4Y4zX/55Lwv+SOmnnI4XAOfsNS5ynX6v+9dOau7CyFo
         THIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMHvs1gd9L9l27fwWEeoZ4oJGXtR2kgS9x8OcFV0QrCZSslTMbmMYJ1JKqLdH84kkVtxAlws89016e0V4U@vger.kernel.org
X-Gm-Message-State: AOJu0YwxinylkjdFt1cJsgXhGIksXMmao0bQTZA3PQRHNI3PII/JnarL
	Fh6wJQD0UBG0KJpfAMHjn/WzjZyMLz5alJw20ndvsIDeoRTmXvrFZ//YevSdLYzpqzdeS/NaGiN
	bc+1GtSgEpFVnboeAa3tdHfU68uPGE3bw5uhZ1SznKpxKdvWVhv9yx6q5UG0ZcfJM
X-Gm-Gg: ASbGncv0Uppfj323+jWGnSmEAAk9uxfVYbu+TrbJsmBk5z3mqwnWlzi5y9Idohpk0XA
	Z3TVjO6fDIr0JNyYyh5TwavczM6l1NLJRu7xZDpgzz5rZhI5HqL/WdwPkaoIuJbvyEcChl7hSdA
	OrEfpe3NfUpUqNmW52He8JjDBGO+tQpaStsi2vGpCjqULc8h0m6Wl+lA8dkeObTRsZ6EpMbM51z
	bVxKfL4xzxs4A4jN9j2zcib32BS871TUIfoZPyjB1lnFx7+UoLbj94fr5KNeL/5hRUWwmBwuJa0
	ZCF206vvvU6FS8ri1tQN7xxCiB9wPJM=
X-Received: by 2002:a05:620a:3953:b0:7b6:6f16:6a7 with SMTP id af79cd13be357-7b67c2eb7d5mr866137185a.7.1732977460509;
        Sat, 30 Nov 2024 06:37:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEP/xAOmC1n/MVB09uhz2gEDd39MWfZL9YCMGqCPueRaE4NlvBGy4IDfLO6XvSYqDEqzl/cA==
X-Received: by 2002:a05:620a:3953:b0:7b6:6f16:6a7 with SMTP id af79cd13be357-7b67c2eb7d5mr866135585a.7.1732977460127;
        Sat, 30 Nov 2024 06:37:40 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6d96sm289262266b.126.2024.11.30.06.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 06:37:39 -0800 (PST)
Message-ID: <21ed0f90-297b-48b0-8ae6-f394936f41a7@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 15:37:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670-google-sargo: add flash leds
To: Richard Acayan <mailingradian@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <20241112024050.669578-6-mailingradian@gmail.com>
 <20241112024050.669578-9-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241112024050.669578-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0d15K_IJNGD6VngZUxiZ4uLIYxDGU0dc
X-Proofpoint-ORIG-GUID: 0d15K_IJNGD6VngZUxiZ4uLIYxDGU0dc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=515 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411300121

On 12.11.2024 3:40 AM, Richard Acayan wrote:
> The Pixel 3a has two identical flash LEDs. Add them together.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

