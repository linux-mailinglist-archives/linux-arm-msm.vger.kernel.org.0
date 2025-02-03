Return-Path: <linux-arm-msm+bounces-46755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2BCA25B33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30FB21881A40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC38204C2F;
	Mon,  3 Feb 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BICG5pGZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3851E87B
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590221; cv=none; b=sd/BsY+QP9GfDZMiQvu/EZsZTL2mKT2/XoqgnCCIkJEq4C6JFsFFDEs6lS44iqn3Eyhff2tKarn5uRWdvhNk/WVAajud9xsBB5vK0vtNzXVGiwoc/stlxFo+RUJhSWTzhSlwjQWLiHlOtymC5JsJ/JHCwMpRSEPFhotMKKfQuiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590221; c=relaxed/simple;
	bh=8i3q6T18h+V0jXJztN3xrYKixRjlzGe0Iti+1JurmOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9DL5j0eHKYPEaRvxMj+Q/M0nLMEdoQMXsJkfMN79DxqVspliqPRNyh0ZkhIU1LVR9lBbyiYhWVX5cUZw3URmj/9T8ksCopnYdD8O8j+03lL/KhwLAL/fyrvYNI1/isK0+teikqeLY+Neq8D6N6uKXjQHnLX+d8XPPL0lwhU3vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BICG5pGZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135kxvd006993
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 13:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2l6eXMWFs+Hsqn7k3FNi/+Jn6QrNV3T7693vimG88s=; b=BICG5pGZiAaiDdL+
	DO8Ph0gwRoPZuwdDXmsym0fMPFErRQdcbspC7lXhed9B3GzARMOKnKgOZ/eBGBTr
	HZy2MRfMZ4BQeQRV6Q5RHBpCJJMgIO9ip1uSiHENesOCD582jWyLYsXFVqY5a23G
	BaBiX+CdanlL0AY2yXlxbvlvwiKu3VOOKkg/EvNiUwU9hS1gOOJlvsBRTREtCjLN
	qoSgVWjHpoCLyMNvy2bHBCl0e90J773MfAXiGKwsNuASzPsRTeFs7GXdN5OsLBfd
	mbSuzA3PJY9k/qk3/k67L9lULz0laVzMvfMzJGq06WAc9iuU+Nmgnpr+uNmKyip+
	S46cBg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqxw187g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 13:43:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6dfba8de3cdso15190106d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590218; x=1739195018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2l6eXMWFs+Hsqn7k3FNi/+Jn6QrNV3T7693vimG88s=;
        b=nrTZc3SWTUvYRlRnqTCLTBQduNThfNgc+yhW08m738YOUasDy8GnbLSjceZWkhvkrC
         RJ9VvF6of0qwtNpVEOMvt481IUQoXBrCGAKgbovpeXy+rrxAAkZdY1vUiTbm3Vyjquzg
         /2b/aSYYoN6UqOz6fU/a2PrXX6wG1WNO+EoNShWWv+T4K97WvaAxBzEtJxWwPnMKe5rb
         ynooLasks/wefd/8Su/mEUOLz0qF7pdNiph36S1lomR4NnlDDp8vOqMfZ5L4mmxqSJfT
         hYcjO8ZBc3UYU4jX5rSsLOX+CV4FbjbCxTPSkQ/Sw5qaKowQ48Ed3dXZ21eUhmk3wU1w
         99lw==
X-Gm-Message-State: AOJu0Yx8gIlVZipAIVuongktitRwmJ0DKyjbNXv7t2nQq67gabWO4M47
	bnOHOcMicyXcYbnpS8bQR4eOuyLLWQHnSj4RzGMP3Cwy9swI9hh1pALdZ6oTpi5/wZRircfs3C7
	kIwBeOarczPffuoav1kByIbYsOchE7g+p7GhuCdGSlMV49fE3liLXzR5nLn/tulIG
X-Gm-Gg: ASbGncsE/UGnZeRAc17Z5XBqZaW7TvvIMIPsem4HPgS+PwMxP0NY4vWy49coloKF8m5
	zxPcoB63xXO1uNH/MSzEcfF/FgXBfSrgKgRq/pASAQJA75/6LTH8xiuaa3NTmdthBtH+2KKVjUp
	q/iw61nGkTEJ5rYjof3VTNas07Dm8VSWfiLxnRRcIXM9mz03Y5S27iVZd0kdHJyC6lV0AnhuDCM
	H1YFQfMXm1RjHTcc6NHqi1tlJQmDxdxWEX19vj2pFm8p42KtBjgn9haJ6M9ipyBUNee8bKCMCXa
	DqYnwpqOiwgA8oUMuhagEMHXrXBfgwNLa7/IolELr7MtyLHYVzHJl2Aqn1E=
X-Received: by 2002:a05:620a:f06:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7c00982326cmr938631885a.0.1738590218058;
        Mon, 03 Feb 2025 05:43:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGET6XktZXKiPlCUHTPdv/fi548A0ODFJnb0FsGPdB69ZYd6e7Ne1QAh6OTPInD+Wckda+Bog==
X-Received: by 2002:a05:620a:f06:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7c00982326cmr938630685a.0.1738590217652;
        Mon, 03 Feb 2025 05:43:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9da7sm7741943a12.79.2025.02.03.05.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:43:37 -0800 (PST)
Message-ID: <e66dd1b2-3257-448d-9c41-9be643652962@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:43:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com>
 <20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y1eIFgneWXVksPlNu_4DUZYvlRbX9i0w
X-Proofpoint-GUID: y1eIFgneWXVksPlNu_4DUZYvlRbX9i0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=868 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030101

On 14.01.2025 7:59 AM, Yongxing Mou wrote:
> Add devicetree changes to enable MDSS display-subsystem,
> display-controller(DPU), DisplayPort controller and eDP PHY for
> Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

