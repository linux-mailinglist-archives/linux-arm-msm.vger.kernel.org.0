Return-Path: <linux-arm-msm+bounces-47946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2D9A34F9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 21:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEB227A462F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 20:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB82B266B64;
	Thu, 13 Feb 2025 20:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qz71s5t/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420882661AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 20:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739479398; cv=none; b=jZlmecRPETtN0jyNLBC2BBFEmmkTWZIdkwTsF4QhI4/71nlALHX9Tf7KBI0q/QIxYK3kN9HRGW+7SCBPs7Id2TKjWcE5yBU91Wk0vpIwDI5HOEKLSiGAG+spvdjYf62LKdTrw0k00LaMLdF0Hzx0eIoh2oOc4JCbG9PA/iYKn1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739479398; c=relaxed/simple;
	bh=WiBletC+NiNFsqmtrCg8eDB6LgIxSryVCtxHFdD/nWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5h4A2HPR3sKVWBv5+osHozvXn4f8FwsKofV1f/A4ln+Lu7KbuRNAP2jnL5rd6RYtjgZmqf481kfoWoqBsazX45raENJRpN3J3cr8aGcUy9ho145NhKiwKsL3NP2hIy75yx2KL+1pcljpiNGsZTzF/KGqFEFSBEQvY1fIqckc7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qz71s5t/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DJkU5j027728
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 20:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bz2r04m4kWn3VX27WbdcYvPpU6RebAFsusUlr8Tu+1U=; b=Qz71s5t/JyZM1XqA
	955HMXFuAC9MNF49UetlRm88X8pdfSvmDrpJBr0DCgs1YQQz4djkvW9jbVHmsSnw
	0A/udbKGsjM7QGEVWoBvLR6hA8kOBktdbEn2Svt+XbGX2xO81SrdY1OgN0uNg944
	DeKk6lv9AiNEQ4ptKIcue24WiSda51jgpCLRyn9/va29SngBeCT5HrInTd5UqieL
	+o/kJQVdERn6czElQbCD4VAzub1YaHxoXn5V2QNR4rbHecFWbwWYvoCKaJw3TH2+
	7wiaNzIP6m2eKRTXrKI6oOGFmUowYpVA+0/1ViuuIYHhdrZx+k56BWCpJUQdEmXP
	wIfnzQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebn9pfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 20:43:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e422f1ceadso3619246d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 12:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739479394; x=1740084194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz2r04m4kWn3VX27WbdcYvPpU6RebAFsusUlr8Tu+1U=;
        b=So2E/BPicjvjjGUVa099HMWjQyd8xTA0cgJ8d4LKWm1TLF+YcnorYW6R659G8u1xDc
         RCqEi40yAMaHvWjIsHJ1+Da6cl12wCYJia1lnTwC1rTH+iPBESHju4tJYUBj0Na80Ku8
         xSapcWmTj1eO/WpQwH9ijYaTgJfFoNSjHuuXYycJmO/8xPKGpTpOUE9vT/LgbRDqgWWd
         ETPRtoJEsIH3jQ/p00P0P1Dm+McuK5LJNl/vC+LCPHOKfN/e0r/a92cBR43WB310EADz
         6KypdiLE0fI2637Rb+il1HFL2Cj0ua5WetUv1zuUbZx8zM8dbnOAnHSv0LBxFE+JJbOK
         4XJQ==
X-Gm-Message-State: AOJu0Yz1Bhu+MWpnets5LDRbbGjAGng8JiuAiAUSI5lnHiBhttWySVp6
	FVwCt/ONCIelccQitVZE8zj+hawWQiQcJf9Kn50l+Uav0lxcUtz1OFQ6bcgWiVJxuFHZLFVhIYT
	19rMde7RLf4r7ktMpqkJYTYLzSK4H3SQfvD4R0q90/yiQEncrT3NdgMItDNVPpt4K
X-Gm-Gg: ASbGncu59JalW5as7hQFxAM2/NCWOqE57VM0SXHoAK67lUm237TElCtp/5RqvMU0FZ2
	eq8M53td4X3WtyQ1OoY3W2PjZrHmlb/MlOikDkjX+YyfrrrN+Qzo+XDR+wwyOeueU+39H9Yy7sd
	vvXvbSsQvFWHwLkYPruDqEIcPVW/MWrNi28MsEoZbEpVNcgq0sUIdwlprIpmHFXfilI9BdFlh5g
	a7zXRzD6vjiuzyjOy/whLvMSc2LfWNg0JDh9OYEqAlJ5fRPqWrVAIJsu6NxrI1ZPy0COs2p9NSW
	cjPPfJ82pBp/7xk4fOg18JRaKURZt1NgMU5mn3xhVeLiTzxHSpsKFKD/p24=
X-Received: by 2002:a05:6214:509e:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6e665191646mr2097606d6.5.1739479394089;
        Thu, 13 Feb 2025 12:43:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+X4L2atIc1ejv/4MkKqLGB1bWWF18lelzFgw1/WdffsckmQCjOSwKqdJAIJqhaOly9cD/wA==
X-Received: by 2002:a05:6214:509e:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6e665191646mr2097426d6.5.1739479393797;
        Thu, 13 Feb 2025 12:43:13 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bce23sm195258766b.161.2025.02.13.12.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 12:43:13 -0800 (PST)
Message-ID: <5501041d-750a-465a-9558-203188758e90@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 21:43:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: pm8937: Add LPG PWM driver
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Daniil Titov <daniilt971@gmail.com>
References: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
 <20250213-pm8937-pwm-v2-2-49ea59801a33@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250213-pm8937-pwm-v2-2-49ea59801a33@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cDZ9MxgmLWUuPTFLiN32kSN4kaevX87H
X-Proofpoint-ORIG-GUID: cDZ9MxgmLWUuPTFLiN32kSN4kaevX87H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=651 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130145

On 13.02.2025 8:54 PM, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Add PWM/LPG node to the PM8937 dtsi so devices
> which use this block can enable them.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

