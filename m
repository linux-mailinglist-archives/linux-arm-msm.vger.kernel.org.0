Return-Path: <linux-arm-msm+bounces-39890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8923D9E04E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA908168225
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3E5204F95;
	Mon,  2 Dec 2024 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akdzHQk2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE11FF5F9
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149579; cv=none; b=qKlSmxFdEkgvlx+CEu1EWlb61jzOrKWvlj/frVgqau1DRyfspwE45o7pOYAqQ8US8DTQazWcNZjyfQO04mBW9nvmNyWQKbh2IoXJC+8A2IHJ7RWbDg/K9GUNnmqi9Yy3A0VRsgkz0grLepYwJIn2SLr5btPgxWsQTN0Iikh5GQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149579; c=relaxed/simple;
	bh=U5V8w3BHhDumOMT4/n+/DHbu+Z9WvE7y+HF6Y3k+6k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jpzw5D/wwz/iBBlIh2zulYtpI7ShwiR/m/ETMfDkHBjLaTMKrq78gDr4pKQyzdkt3ReGsbOmySqHWW4wwngiY5P78u8CNEICOKjoXZhXTHFw6JejUA5ioxgS5YXu1vRSAEP4jtQXaL7uccYp3HxKC2hRcZVF+bQ+m3YPXExI2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akdzHQk2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28IZrA019784
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Dec 2024 14:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9+aPPZFAJemDOGMrrzpUMQVAlKiCGsFemq1XONcpZk=; b=akdzHQk2JJvu6c+o
	cnFE7I42krUUOtwqd6rQMddEcSyZd066KzphvS2c5B8jHDcf8YX5ToDEA/uDVnt6
	hWGds3Ugt3t7R9qfBjptMG7h2noyxlp4Ese/lk4TC5iDt1Ip7ZaqZ3Dbd1uwVSNe
	Yf1fdh74no9Uc3h98tFdTt3NSQws5xi5geUPf1pDYGD4MoUONLk60xfR8bfHfKmQ
	KmZzIRxZfUeG+UQLOB3XBC3owX97GqPJjTarEcsQ/PRE3ZaY7Syg3kkCXqo7ztCC
	4WWR5SAGdxobqnE6fC50Fciu8kPSLUJCtWLZh0uayWxFFcQUvBYOThAWt0Ocdf7q
	YDzpmw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437v07my65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 14:26:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d885b3003cso7994326d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 06:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149575; x=1733754375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9+aPPZFAJemDOGMrrzpUMQVAlKiCGsFemq1XONcpZk=;
        b=e4tnaVZIFPfWLBwFG3HSNE2mA0vAxzyychvrysBphUmth9FQb5TRX4jt1V+uzevvVp
         IXEFlYo7Ct4MnWcvFI47r3yXZnCzp4LkNf3Y+kjf/H6tzln8VUmINx5Qk3FNbP3ZeUJT
         JZFlF+Tf8UZzISWno0i3bfAGBB2lYsq1AlUEOMXcFZNbB+ZwigjJNq+ay/l3DQqGU/Vr
         UVvPsmXKObeSGBouUGTI+rLoF9DDONhaeOUDprcprnJUUFaRMKrdSEWY3wwA26HVJ8/P
         VeE2/pidhLfC6ZTYDtJegZoXcs6mI+NCLVxzEoLFpqi5lf693r/brknTrB5dLSsxmeQV
         yoaw==
X-Forwarded-Encrypted: i=1; AJvYcCWIz44f7lOOjLYUsAxzD1McCEPHbQZ54fcDpP6Xp0GALdFLRIstMnHCNheldgC4edh+asi3GDJpnRySG858@vger.kernel.org
X-Gm-Message-State: AOJu0YyXI9wdlcuGBlCyAxeZ58tPexzu+A2Zi8qPEfTpNw5G/HSffXlL
	CA6bfEYUpN8mzX0bmNILQlYHzWw/CBdr6AkV9qKK2gD7xtjEOeCsTB7drIStCAkLNObZzadWenV
	xQGK+8UUQXryy4Lq+6R6Y1ClXSLGfroMwclXms6Qq1l7vqXo57sHYvvt2wLG1f3nG
X-Gm-Gg: ASbGncs0bT8AO6HzsiZirqgYrGvp0qGwJaIJuu4YNWPn4K+dOjomZ7UVGFIGYlG6chk
	4r0RqeP3b6cCOtfn7wc1RBmRP68uVYkc7MkGLcxRxVjAu6go3h5Qhp0NAUN/A1qgP3C9Fa74INL
	MMvQpzpDshc9YNx0JRUReez0kgFsXaBSOF9h1j0zVN9IeWl6cvFnupyjofO85jxBnO+InVzVyuM
	wa6i+O0Wzrj41iipFm7NxSm8fqXG3VPzhxyVqoxDueZAV/NYYOLeG4s5CH/16q96Z3MM7B2DS3g
	rhMkcEJE5VZhAqm2djtZbQaLDf9XzCU=
X-Received: by 2002:ac8:5f46:0:b0:466:85eb:6114 with SMTP id d75a77b69052e-466b34eb098mr142606471cf.4.1733149575108;
        Mon, 02 Dec 2024 06:26:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEks5Q89gw/Ra65Tb+SUhB7kvtV72Gy/kgkC1JbMoRUkpqIZ4f3DHNc/WA4iENdSFUUHOA4+w==
X-Received: by 2002:ac8:5f46:0:b0:466:85eb:6114 with SMTP id d75a77b69052e-466b34eb098mr142606291cf.4.1733149574666;
        Mon, 02 Dec 2024 06:26:14 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa599800a6dsm515436666b.90.2024.12.02.06.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:26:14 -0800 (PST)
Message-ID: <25873cef-2871-46c0-a764-9b5ee85e9a58@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:26:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs615: enable pcie for qcs615
 platform dts
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20241122020305.1584577-1-quic_ziyuzhan@quicinc.com>
 <20241122020305.1584577-7-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122020305.1584577-7-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mgCbR2GeUeQoszmJoE0Hq36hPZ5PAgyC
X-Proofpoint-GUID: mgCbR2GeUeQoszmJoE0Hq36hPZ5PAgyC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=734 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020124

On 22.11.2024 3:03 AM, Ziyue Zhang wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Add platform configurations in devicetree for PCIe, board related
> gpios, PMIC regulators, etc.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

