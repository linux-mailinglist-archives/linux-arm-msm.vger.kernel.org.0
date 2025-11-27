Return-Path: <linux-arm-msm+bounces-83601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2FEC8E8DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3442E3ACE63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6917287507;
	Thu, 27 Nov 2025 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkGUGSGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I37/4jB/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EEA270565
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251011; cv=none; b=lm0s3qiTiGLfNVrIX2bG/kbaIYuN1EgTbq0TPiNnful6hIlstpJOqgMhxFaVgMSQx69js1fCf+pUtwp3Mwiy4p8yCA/h4O/fA6C0VTd0vStUln08wc7UTTDTXIivCYcgNGbbe4wfn2w8GSPZoZWv0RrfWQq9c9HNhMwxYmM7Fm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251011; c=relaxed/simple;
	bh=XC3PcKyN6lE+xY7TGg6f8KwAd2G6p4h/XFdpBuFhxX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHk0jcfNoK38hrjehoWg8M1SkeJ9/nyk34skZQSZ5MfqZDtdQBgIr9tuGqTlB4CzqGGelGAaHJAF4iuhgt64ieaU0YNvI36tbivIoJEtnoK9JMItGywiaCuA/LSx5AMt8HkzNzpz84QkawvdXujBt2JEGQ0r+Q7SGOLbHMdgvh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkGUGSGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I37/4jB/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR7fdJI2388022
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EN5LMTtLX0rr8Dqvylr0yX611kKTGrG6FHULOeZJCrk=; b=kkGUGSGGLIRHpDM7
	LJgCYiGcJt006p1I3/DKMYTNgQH5eJ6pHlt5bpdr/fdYqapap5gPSQiGXg5o+k40
	7eCZ5P+3VjKmamEkg8tqqS2RYYg1oC2zmlZlbEr84MNEu460bB9o20qhq3/3DkQO
	BOpepZy+9bVEoRHH9Us2ZoEX12goFqY1qR7BiRL8cmd8q89818REKlb89e7L/L7M
	2/nm+cLP4R85bJH68/kmHYbl8eaS5BN2i8SvqxqkXsRCsm9XMZTMMlDf7rKzUdJx
	rLk/5Gj8GRKIfVav6yhwUyX6U2TYK6BllOfYNM2MemOwhhUDXRTKkPwTQOJsYTB5
	Rm3BiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8jjd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:43:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b10c2ea0b5so28646285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 05:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764251009; x=1764855809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EN5LMTtLX0rr8Dqvylr0yX611kKTGrG6FHULOeZJCrk=;
        b=I37/4jB/jThIkoWjZQc+iZ7M6zq0pK2Ye+aQvUk4e7ORJIBP9ZDxrj5H/kJsBDlHZX
         q5Sob4yDcBDsgJm+REpo+4tDv/ZpOMqfe3Vw+F4br1n/lCiTe4xB8RtcFUm4b3egch2w
         ewMYJXeofKWYEBGa0BqUwrQudYAWk9yS7aayKyBDClWLUY5dZYDQB1SBVQCNxMEsz2tY
         dfTa5v2rDqiGWS4pQkeqlswWgd2M5vZCth4aFEz/PxKeYmRAp3kgP1QxLUttExOkmoEY
         n2jYXjJhzDBe/LLTKcJDT4uRqyPA6IbXWz5WBd8CAHRUt6DVzgWZ4/fJ++ZA5YYfU7E0
         FAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251009; x=1764855809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN5LMTtLX0rr8Dqvylr0yX611kKTGrG6FHULOeZJCrk=;
        b=m0K7ADOHkzXoAnbhY1QLYtOx+I+0dLNUl7gtMB5VILdcevplKVJURfacvW8TIylAEU
         9OmPdpD7kk+qruDJ4fQyzmgYJGLYly422+qaEJoW4HpPsePyiXA7BF/vXXr6ALizIaK4
         /iPoiM+OhyUHoKaynD3GQLmIjXFXWnFzcZhji/ISIPJvJwr/B9LPan8OPM8/lnyiRRaX
         iHQxBSCgP2533kDZWOHPwy0a5LjY27drIYh/NTkt00HopOAPjbkJ2fxAQ+TIAUKipkAs
         LasqqLO60kaZS+hzAFBsjdEMWIRzG4PSNdyDxKSEPVtroTlmPMgxZkqNWPOouDyJPmCp
         6FRw==
X-Forwarded-Encrypted: i=1; AJvYcCVarMFsj698xO7EjAAtyOCzXCfa9JTHy+2TmhPfShdvKDqS+59NszYh6ZH69h/zoTFhyUXIggkH5vEE+d+8@vger.kernel.org
X-Gm-Message-State: AOJu0YyVfzDxvTkbBhuLwobuhAgjtH0QAkB6+UpeBGI6Eo0wC/I4NbxU
	6Hhwe8fJ0X0/IUa0EZbT53aMpY6Z2dmnWCtLbpd0UyUisny3J+IbcxivMjeeDN/2j5IsZ1tlxWl
	ywhTxFTop3NYOx3ntdaanBAjJA5FoN9T4jmCp7VCqZYoRP5PQqijeKLY91Agtjcj40v9D
X-Gm-Gg: ASbGncvr8kIt3wn1w4w/dy2FdIS5Lsy/olmASJy5kDmWCPjJ6AYf5swRPkxs9GbMirM
	EZKFdaYXViP81YnSLLBdGBijALmCw07amhplhdprZSEw5nz/LK+P2h8vWWAkXCg0rs65KH+tAW0
	CaCOcCxnLFEXhO5swt2NXP0KJILasrCv7KVB/1WdRMB9p+ii7uXSmsUFLeSS5z4dQ0eKGbFlOpp
	L/AXK8E3hyd/AUTaLwGJuH74umtYYBFhlaUzuWpNA5DTQN/i5biD3D5TaqRJ69YmJzNj+0e4qxC
	UvYuk76L67QjXHd5LS0Hx94EjrfVfIfO9QcU1ekWqFaXGtEDeVZ1i8smNxeTCG3hbKE7TDURFuH
	btKXnbCUzACX9m/E/uSuN8m9yHPvgevKRe9dMMnloTr0raqLYf4kmmetxqp1IU8wfEpA=
X-Received: by 2002:a05:622a:1803:b0:4ee:1815:18cc with SMTP id d75a77b69052e-4ee5b4068a3mr227427651cf.0.1764251008658;
        Thu, 27 Nov 2025 05:43:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq/jUkcBGrGYZq0In5AtZVzbzI+9SdutRA1QIGeDHezVh4kKBWEs2AnuRgQ6E27j0Czio4og==
X-Received: by 2002:a05:622a:1803:b0:4ee:1815:18cc with SMTP id d75a77b69052e-4ee5b4068a3mr227427391cf.0.1764251008194;
        Thu, 27 Nov 2025 05:43:28 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062709sm1595947a12.35.2025.11.27.05.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:43:27 -0800 (PST)
Message-ID: <0ba15c78-2a12-4fc8-9620-11aa2b6c8d28@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 14:43:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <20251126012043.3764567-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126012043.3764567-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: csyH7e3684J4PljiARfJj2YTG2ZwCB7m
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=69285581 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cAEWcgKeei3UT0ZJEeAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: csyH7e3684J4PljiARfJj2YTG2ZwCB7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwMSBTYWx0ZWRfX7cbB26gVDONb
 ft6RswpiarASvNJ1/a0psjPA2v1mf6daqRLOPiVO0Eo20OEFL5qETlBwuDqGFps2Svvv/KNswm2
 KV2wrns4xCfMvML5gJogq05UJDYrFuj8n0jzpQs141fVRFZF/qvrBnMz7T4BAWUJ92TdlrnamZS
 cjo1vu5x5YkesXr839MbnD6vUvSoOAg1znzjUvElzGgS/TSu4Dr+BMqMXf7FsrEg+daxZIYS1p5
 4HFxwqExjNksemEGxcVA3e5VvNIeFtoKJ+SP97804axriYEypBtY0zQfFL9OhqFvtGF6n6xcr5e
 hRzqPSUA82U6a/K+dRa8KuuaYsjaoTw4Te9qm2Crpxz/pnadSpqiz57p0BBZ8nUky8mvbBb0vpi
 rv3jGI2GMQPr4bcgb4iFrI/Wd9V8Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270101

On 11/26/25 2:20 AM, Vladimir Zapolskiy wrote:
> The reported problem of some non-working UHS-I speed modes on SM8450
> originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
> for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
> platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
> SDHCI SDR104/SDR50 on all boards").
> 
> The tests show that the rootcause of the problem was related to an
> overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
> ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").
> 
> Since then both SDR50 and SDR104 speed modes are working fine on SM8450,
> tested on SM8450-HDK:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

