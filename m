Return-Path: <linux-arm-msm+bounces-40562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB99E5BB7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21F14281F2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FEF21D592;
	Thu,  5 Dec 2024 16:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3LpffG4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73A51DC04A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416978; cv=none; b=Ue7Hcl/y5g5ofgDHzXjLWL6gY38GXiwD8qa9o9k0cdJTYi7/QsYjIu254/EoEVsWhh2rPdwQ9zQ9kLaS2X7wOILT5MYpkpIKLenPaophIohjSNAwDE7B1aJZhpi4wN8G/BFbvxZjAHwkc8wxtQrLfxN68GIe9tkC35EGCWYbU2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416978; c=relaxed/simple;
	bh=1woZyoDF9P0sdHsZk4MkB/fTFaWP7i9Vf+cWCL5tku8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAvMhCTBSgKajFrx63L1BNDAzupYR0XUEotJHZQjaCtAlA8E9sSFdclvo+OCZ3ieuqflJQ5mhXqe/6w9fsA3Xzu5hOH9Uvb5cOeqb8B1pjrk40cWvfyhkbUVZ3nUc7cbvAhfeLHCPnG+amgIRcO1Rbj96ZoK+/QDMaLgT+G2Hh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3LpffG4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5FF60d004368
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UVCkmNVqIcfCWxpUv4lx27vKhXYtKQRJm/QunDoZ8Y=; b=A3LpffG47PZ+FJUl
	U0Vsx58LGu4iEcqPDtXKDpSTAqOBWmpWzKSjuO06qiQh6lLFVxYyKPo6Fhs4+UHN
	+4oLJa/Q3irrwmQ6UcLOOXeG+5D3hqefo/OkVLm0yFFGaxrq6wss/FFBw7g8CHP6
	rVa5lMjqULT/2W78dhnMVdLwT7Prvh49iSP8IdCz/YjQu6k4VABaGc3nlJQ0NyyR
	+0TETRu5hhiCpx1jpGXuPQr4HLkQuTRy1N1TEEddF7K5pOF+LxKYPp5RzcVnKEZM
	H1pHjYyBKEIqGR5Qro1G6oul5O2S9dyaU3vW5ijyRQQKjXA8xCmP7RMnMd4iI/Pc
	ZC5sGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben888xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:42:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b67127ab77so7018985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416975; x=1734021775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UVCkmNVqIcfCWxpUv4lx27vKhXYtKQRJm/QunDoZ8Y=;
        b=lmmta+GquKZhmv08iH7daNsjAedn/B56nhmCwdfKm536aVjP9a06tmKQ21Z9V8xNUD
         cSBkg1LNn7pyqoW+Soc38R5908R0HmzSBzSZ+OGnRTa8tF3yCbkR4GmfoKIPkSu9yNXo
         D50y+9q4YaGPlg7ieScoahCTv+AWJe85wiGRqLBLMbuC7IgOt8Llr04fu2tPckJCIyGL
         wMM4YnUg/CfoCvJMbnETHu0BeZQWVM0wlXI1PVDOGIfdP5WSaZC6rcpMKwG3WtRobzu2
         bkw8fRYFTLUmXmq0PlPsLvwqRvFWnLo6Wmtg9I0w6k22MbN2lorwc+4ClYg2J2w0u/4z
         KNJQ==
X-Gm-Message-State: AOJu0YwCWjSPdqfLubOgcTdNyQje6VptNO+tJ2fhSpWXmsTGEPDN5d7i
	FXsCWpBknOu9T1H9d0o/pEsbuv6t1NM9FG7czb+xyHMLMec2AzcpFHQDVn/NGYFtAueRMvvZkBa
	LXUotTFjTRSOO8VfABDmVb0nYdGiL2nafhNACNl/VXOe7guqDITtPFLHUp8RjPtlP
X-Gm-Gg: ASbGncuGIBtGheSvsOVk7aSeoHGsGBX6fOCVDpZnPxsZOR1YmFpyUl/pr1TD3DJc46i
	GbFVp6eUbwYh72/9V5KYueAMPgB73v4qe4p+tdZeTBFmLgh8LoJmO8YPf9/zKJuzJFMrOFJQzai
	d0+jeRES4gl/dvp2qaD4tG1ghIXH1KE/hPXK6cFXkk8iCViO4N25n4+CYJowPyfK7hKH16EmOFy
	pSy441FvxyUH7uKbIrP/frx/60ABQn5B8Rwvgi3c2/67nKeZbEbshMiULXibAs7i77mKzP1imQC
	lTWGumNxareweHBzgJwQG+Ds34NMbpI=
X-Received: by 2002:a05:620a:4105:b0:7af:cb6b:b506 with SMTP id af79cd13be357-7b6a61c2b40mr640291685a.10.1733416974973;
        Thu, 05 Dec 2024 08:42:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFz4s6BZ/AMqBrX8dAY/bSXYspXdKLNVKImqfKDTHyYmPTqys2RcW8YWgE6HfamzZm127xSQ==
X-Received: by 2002:a05:620a:4105:b0:7af:cb6b:b506 with SMTP id af79cd13be357-7b6a61c2b40mr640290885a.10.1733416974693;
        Thu, 05 Dec 2024 08:42:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4db2dsm113715066b.9.2024.12.05.08.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:42:54 -0800 (PST)
Message-ID: <e9befb17-c225-463a-a7d6-2abb8b88e220@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:42:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/14] arm64: dts: qcom: sdm845-starqltechn: add
 touchscreen support
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
 <20241205-starqltechn_integration_upstream-v7-11-84f9a3547803@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-11-84f9a3547803@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4oKJwJL7abtf-TJP_DtQy7ryi1RyPXBO
X-Proofpoint-GUID: 4oKJwJL7abtf-TJP_DtQy7ryi1RyPXBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=757 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050121

On 4.12.2024 10:34 PM, Dzmitry Sankouski wrote:
> Add support for samsung,s6sy761 touchscreen.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

