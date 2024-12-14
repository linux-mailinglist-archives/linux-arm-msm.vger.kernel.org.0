Return-Path: <linux-arm-msm+bounces-42243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E819F2143
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 23:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0C7D7A0FBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 22:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029341B21AD;
	Sat, 14 Dec 2024 22:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrfvVctE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D741B392F
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734215235; cv=none; b=Pgg22QXWNS+5SLLIYmDcAFqbgHeKxM9axTM7pwO1tEQEguqAO2vFZzDlkgsNKC/ikD1v+s1dT1mfpH3wyueYe467rkBYZ/CzuoGQ9/pk4YC83UUbhRHoIjhc9slnAslgOCm6oHfUOebaXdvWFvX8mggCzrHMfNXeQgenvjLuF64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734215235; c=relaxed/simple;
	bh=4sVDpVE/Y9aJqvtHiq3xY3rKoZ6SRs2KeWCOfv+kYWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CrrqJAYRQD6mCfABaFu7Pr0SjUbuNQIoFx9ZdE7TgLcT1goMIpyP7caBoTe3BVT9ZrISClwtqAroIST22NWiIZqjO0KXTGhXU5rU5dFNDZq99tz738GomDGyeGiMMMqgk6OMPsk65BTn1oQ9RWhiqg0Gi9ljXr8CDreM4MtMXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrfvVctE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BELtSdh027548
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUyEk9N0WDqw2fKvVZTkA/HKuvY5U21X3H3Z5ETR4eA=; b=KrfvVctEe4AEIYJG
	TpS7TtytxPjWgaXF8S8/0lvnvn1BmMySPmAQmDoT+qPl6eI2WgMg6DWsxpez+OP8
	0CXNwgdfGXXWo9N2d2knS+pjKjB7NSr9HIcYgfjvbpzTmqCtGisuYlOwkzb0jaw6
	qrF7nD/cCQUIhwAu8Xv0Jxevdn0nl25JEljxd6uNlM6f99M8DG/zk2vsaT15nynj
	gE6Cg7iNOFjq6N4kDJLmFiy2aC6xwzghNzNN8jQC3aWJs572pCQi72C2WskslAeE
	Juhx9wAFDsGXmoQ5zA2amT2S//s4adKQ9tx+5RTcQ6PgXYSG/zYUApn7bp4KQE+I
	+DZWjg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43hjc28131-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:27:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d881a3e466so7895306d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 14:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734215227; x=1734820027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUyEk9N0WDqw2fKvVZTkA/HKuvY5U21X3H3Z5ETR4eA=;
        b=w5YM6r9IVDGVGjjxlCp74cTKc0fmIBaSaIpMag6+Ms+4rQVRouO61CisOfDw9jQ5l3
         lzWCzud3/M2PuwvuOz0BaGYclIPYykUthbLL89ZYRBon4Nvfrw7P/4+DG+flscNadVAc
         XVJACSKxrsQBd4ucQPPKfnXU5fay1dYW5GMbHE7z7WpIO0FBUPM4N1ykKIBFk7Ke0iIl
         gGo5yyo3GBrbRfJ9560tOeOKiLJGNU5633WI8qbiFvzABnnKkl3fEySlgh511Vm2dqp1
         GQvXZ7KX7qhfmQBKzctj0QAJBshoI+5/4uXBLWESYPCEKzrlzu+wPaD09xpewuBpNZAE
         mwmw==
X-Forwarded-Encrypted: i=1; AJvYcCVL5W9q62VzxQ9e2saQneUSW5kLOM1ab4d9rofzcBp8IdwwWUE0pbp6e3cN9JWrVwFp01kfBkOrS5kXJ1Rg@vger.kernel.org
X-Gm-Message-State: AOJu0YxM4IB6Vp/vmVg+yGc04ohkl4iVY5R0VloWBWNnatcYc4b70B/E
	sSDfsVnvRW0y6xCsBMlRq2O00EIYhwxQW2EEGLeMmckd5S5xxz5iBTmPNZ8GrqKaVFEc6S4MgZK
	YRH5Y0B7rbInmS7VuknK6dZAs6vT4VIUje3veyApLvPAzAMKUjRu65cPlgxfpOwNLm/7KVb4D
X-Gm-Gg: ASbGncuek7iRU0Bbzw+q7j/4dPJo2cVYisOFj3NKi1emRxvj73u/YdzJXi5gTOV25pn
	6YeV2tz4XrDC6tkHi17o53Gn3fau77Tsnuyq68nU5AMZeafqhdaB7utZ/yAOqKOnFVVlN8H8uun
	OiFYquIsulPgmGbrgrXmgazwxKezGdSlyu1O4vKEgGOgI3Lpwg80b1CojcWoX6ud+PtrGKRb3iW
	+O99S41JXxmR7XyQkN2RAbnQ052/WDdbilL3YRZyGc8Qaee/OS8cFXfAEOkHXdtlQqbTFjSf98G
	0gC17q0uOoc53RUclfQhY8aGqY1kxar5Wpg=
X-Received: by 2002:ac8:570e:0:b0:467:54b3:26f9 with SMTP id d75a77b69052e-467a5748aebmr46264861cf.5.1734215226772;
        Sat, 14 Dec 2024 14:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/+/MeuL56FY9YXxGv3jp5sajc9lZ2F4Si/Byr9CgGpkIT6bqlx8CUjJl9OlwGEkZEomusnA==
X-Received: by 2002:ac8:570e:0:b0:467:54b3:26f9 with SMTP id d75a77b69052e-467a5748aebmr46264761cf.5.1734215226377;
        Sat, 14 Dec 2024 14:27:06 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963b4edasm139441266b.182.2024.12.14.14.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 14:27:05 -0800 (PST)
Message-ID: <81fb8975-3b27-4d4a-b04c-3535b7447408@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 23:27:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-serranove: Add display
 panel
To: Jakob Hauser <jahau@rocketmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20241114220718.12248-1-jahau.ref@rocketmail.com>
 <20241114220718.12248-1-jahau@rocketmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241114220718.12248-1-jahau@rocketmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8i-67UPa4IuekMXI19YI9XX9KA6gKPKM
X-Proofpoint-ORIG-GUID: 8i-67UPa4IuekMXI19YI9XX9KA6gKPKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=816 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412140186

On 14.11.2024 11:07 PM, Jakob Hauser wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add the Samsung S6E88A0-AMS427AP24 panel to the device tree for the
> Samsung Galaxy S4 Mini Value Edition. By default the panel displays
> everything horizontally flipped, so add "flip-horizontal" to the panel
> node to correct that.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Co-developed-by: Jakob Hauser <jahau@rocketmail.com>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

