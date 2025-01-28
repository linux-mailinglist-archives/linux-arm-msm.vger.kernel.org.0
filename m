Return-Path: <linux-arm-msm+bounces-46366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F850A20955
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 618EA1693DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55A819F487;
	Tue, 28 Jan 2025 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8zQu5Tt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7919F41B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062822; cv=none; b=j5FzBOIWgf3hqEZTaqXN+xXsBlcnj/88CLGTihfSlVTMpHJ3Uv7Sy73uHU4RV7jG4Z5OofZu7YijcGQZml19DySATw90fxUJ+tzwmxBQErChVBw9XQ4CyfC8IhCPjny8FqymPJpxGfUqn0TgB6pDJHSu6DXqQV6YpG3GEmgZWkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062822; c=relaxed/simple;
	bh=VhMH2nygLaTG7mc/nW//k6R9Kfgy0BdrogZyfC03hPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InepoNummJwtrizI+eV1Z3lMl5psd/l2oFLHmGQN4ROh2n8yRbpLmi/GYZWe7/UyhDLsHBerAjWqsdsx4QtX7AnJzY6tt9PUkySuCLJm5u6lznZM1jX3z1oI6dEDHx6B18G0kWXgOaYwtTCyOI93DHmJkTZwn85npdS+i4A0gnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8zQu5Tt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1rXVI030333
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DF4cChWUCVUfCwvnacvCOrX60QCJzf28MqWHnByY88E=; b=A8zQu5TtMCn6TfmQ
	wnVhTiTE+5JkVeV/UPhTR7IvX7/hYP2auLIeYUe6akEr9f1oLEwsoMvAN6Y9TI3g
	6O+/LxfrMH8gfUb17BraQR1rYSdPxFDc+/jfRjoGzmkAFTbNGz7lpbU0o70OV/an
	pWrK6JbXQF2xjNACP5G3DcWDY4cAI63BvMVFof0dmFSkhU7ulXHpJNXgoPoYaVn9
	uusgP3fdIwXqtIwhZdCPxKCTphopWr6fa4tpmIqAvktaA9V6/jSoD73iDf9DT9OG
	DfPTuBLCSVM0iEOycarLHphnuJyvwvDObd2WTgqTQdaBT4W67PNI6LPDKVoQZBo1
	MV+7yA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enyq111m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:13:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7be6f20f0a4so81293985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062819; x=1738667619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DF4cChWUCVUfCwvnacvCOrX60QCJzf28MqWHnByY88E=;
        b=PuhNDMfU6EgCRPtEibbCqHeIETihtn41dwGEKj2SyMZo4zLnfEMVY33k7M4gCXkZFy
         cqdKKWnmAZWYsPsjUty2hs/hMb+yGAjpOqh23n5yBrvKbwZv6VoG/QYPy/IbClR4sLLk
         MPki1BDi0fbDQ4KzrdouWAe0TFUcA3+zE2j5t08+zAIXEkPDnJ+Ts+bBJ3H8Zh5f1kQ2
         PMVV9URfIzWRuv2fSs8GFr1xdXm/qd+IHjK/lME/cHEznPZ0pfMTTomPEEYvRrn79qWT
         wze8KrN9JbS17KlKMTpBkFPTVyTunVqTHs0++jG/UDRUro3BQkcy0+3PhC7WuDm46U8T
         3Cow==
X-Gm-Message-State: AOJu0YxK4193MrKvdNbdu5nk23JvK4qzR2YFlbB/KC62qoX95GxhbA8H
	EtyZvFV39sGk04SWrGDnYHIUsZirSX/rW93L4FSX+cg75Z4ZOeVLPsAsvmuSJcYoe8ly1YfkfC8
	q8h3/KcybUADZqzx9jNnX2eO0q58gaHijoRo7INYGJN3cKsvNmrzDeC/r/D26jovC
X-Gm-Gg: ASbGncszKrPAa6qDeR+NPghaSsoFhD9ktxR/qvpPLH/s+zictp1t56QigCm9ppXTEZM
	eMEnT8hQNBO/jxSNitVH+PJSA9a7IXfhNC3JsE8Zyr40jqmTWO8xDYcnOEYsTQcCQsnfZzirYxx
	nzuyX9QZyShG1CpQgT2ews8QM4DQC4PhE4zEHLQLIvshDXE+CYfuWOZpcGyGNsiJYvC0//IJBdE
	eufOuXC7dIZ2N1w7XAFjHATjce2wJTlPcIMsL2IPCQwVQ42RBJBOtBVasYXR5ufuDEA/cF186X7
	uWHEbf3Jm2CIEsXIUnQiosn5yV77uZrkrmuKYr0UQHLxRsBsIq1VrDu6xm0=
X-Received: by 2002:a05:620a:43a4:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7be8b2eb172mr1598262185a.5.1738062819190;
        Tue, 28 Jan 2025 03:13:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ1h7uf+LMhsXH4VhM6mHS1CLjA6Tpc20KWyM0RAcBNkCaIf1DJHDqGaYa5IelQE34WvcvZA==
X-Received: by 2002:a05:620a:43a4:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7be8b2eb172mr1598259585a.5.1738062818767;
        Tue, 28 Jan 2025 03:13:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863af41sm7222946a12.44.2025.01.28.03.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:13:37 -0800 (PST)
Message-ID: <f3dd3500-d07c-4231-a0df-cb4812ee0bca@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:13:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] ARM: dts: qcom: Introduce dtsi for LTE-capable
 MSM8926
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UsJtlk9vACHrI85wGN6u-oAJgD2JOXqC
X-Proofpoint-GUID: UsJtlk9vACHrI85wGN6u-oAJgD2JOXqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280086

On 27.01.2025 11:45 PM, Luca Weiss wrote:
> MSM8926, while being 'just' an LTE-capable variant of MSM8226, the dts
> needs to slightly change since the modem doesn't use the ext-bhs-reg and
> needs mss-supply, therefore it gets a new compatible.
> 
> Since we already have two -common.dtsi files which are used on both
> APQ8026/MSM8226 and MSM8926 devices, change the setup a bit by removing
> the SoC include from those and requiring the device dts to pick the
> correct one.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

