Return-Path: <linux-arm-msm+bounces-87115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89DCEBFE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED7763009C77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1587F26C3AE;
	Wed, 31 Dec 2025 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbRba3N6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IowXsizc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD7919F12A
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184781; cv=none; b=NUSRdkrIY0npFyDToScsgoyYTerhKAfGd6il0XNy3em0k6QsZihHS+BIC0RvN6nvKjTGK5rz9RVz6gBuV2CMtPGr/2w+GBx2BCFtSrFTib6Z9Fv+5ux/K8OAbeewMYGwBRljRjC3NC9tNT3gajICIRbbQ5bgcAqY0ceV/LMsOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184781; c=relaxed/simple;
	bh=Wlrlfu2YTdD8PQ/c2tTQBlsYkTuPM0FJ3svYOahlrVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxAessGYHi1Uh+d6Kj0otEZS2cqQEOqVJ66K7PzeXz0Nw2TRhH3Pva0vGx4PIwCXyuQ4zgfPSyuG0UNYOuio2/a6EjoAG7tQgYnQWtXXOkq7v4ndG2Q7ek/LADKv+vgR19HVf48QBdf6B2deOtNeRztw+ne/nX3fz3nC1TSluj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbRba3N6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IowXsizc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV5uZDH3539553
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	47O5xcRNENwAOvhXbRu1HtwDpL1j8cM/FYt+5+oZE5Y=; b=WbRba3N6Vpuo9L9S
	hKPWFvsJ6wJKW3y7k1TfiwusBIsSddo0gT86Q7kVoIlqKpOv5WxeW0/IalDa0/V+
	TaNHOyGxgjkAnfqAiF4b1md8YqqPqfHUlm6vEsNuWMFlI2FY5RS56MNyS1VDEvTc
	4+7qBHBh4oOG1kVCDU4nJYnAP0cPF5Jq5t1VY9ixeLtYwB1ZQCOJz9efpe/PkCfP
	nuU39cV5+8GvI6K/WiLhwzToFd/eYDu5CfzmmeJ57/zzMzIzSThUjeowCzx7w/Yc
	29zkZnVDGdL6zLnBv1HGpDWbrA4tYIQ7S4WnwpRTMnwtZKaMhOxYWb/hBLh/fEqM
	8ztk4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88ykj40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:39:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee07f794fcso42628261cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767184778; x=1767789578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47O5xcRNENwAOvhXbRu1HtwDpL1j8cM/FYt+5+oZE5Y=;
        b=IowXsizcZU3g81NpcnFi8JWUST+H//kvtPnBRwHMZgqQasVT/pCV6cgovfP1ynSxm1
         I+2tW7WSBXlLqb/CWuGza/ErlxpQJ49eZNeR3vcxMWRKzCp6wIZcxpEenNHQ3bbAP9R+
         gjCLP/WDXoqkKVAJD7UaDAHC820Exwa/vAIwNIaSw8HCETbG+yJ4uu+DbyKxZCMC6qcb
         ydQFbKMfBj5X703X5OiIq84rHuMqS/AegYMRS5HOOh5a9ZcvTiOC0wrXboP5pBszzZwp
         DRWBDwnniIMxZfLedyiTJ4EtNdxUXv0rOWRRhyv/ImxgQWLoMn1qzWuSHXzu4UqCq9vV
         76Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184778; x=1767789578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47O5xcRNENwAOvhXbRu1HtwDpL1j8cM/FYt+5+oZE5Y=;
        b=hcQTX5yumBghCYcYEsMaTcftdAm7mgXrSztKFOF/GNajOcFlcU3QJE8GuM/KNeHJ5g
         51Upz989pavSWwIHt0zGdPjJBvED0uQ1hzbuHO/F9muXUFUzjKQDnJMJMlfhTVzqZcHq
         nM/VYb0IXmcQF57f4yAzz30U51FPx3nZJUG38Q5yycrLUXgrJ+g+YIMXwYPfO0rWz6pg
         eMasoDKulH0u1wydWsGXJ9Ft/PaIyovGPMbxBl59XwXSjvahvjJ6tq8Pnmgs4WNHLzl4
         EQh6u8//iLI6O4u+TlIKQmPzkQaHa+Wryr0eojuyT6o1Y95HvHj3Z0ckZOksIUpDDerV
         LWBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRsXY8ezbCOUqQ1FODXJAwuIx3A6hva6Llq4KP5GCG5FJ/jznF8IIw6xXRz90LdM4TRbOqYLnWDYuoYORQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwcgbsrQfQHbG4ldaxLErcRVzcDk8cXd6kNTl93RzX4smanykzO
	5YBfiWqHOrN39ZFuVv9iHIX1k9EoaMgS56hWD0ivC5NQrjumf+z4bChJGbyu38FbKOj8jsgRDTJ
	Dtks27pwPr5CdvUgLzsW43RZP07e+STl372HHXjdq0QUlCQbfDM7ndMbAmrJgFu8XYpKa
X-Gm-Gg: AY/fxX6y+gw8oGacSdLKTawEisoxNM60B0729aG3PS4EDurBx92xD/7dbpN5XtSpa1Z
	ydMGrvOwiWUS1dTwvT9SCeGfkvhK983uU6BL4fowG2o3N9HYl2f7FSxF1gKntBhxpvCeDSURBYu
	pP1gNMLXa8H1gcI4CVz8XSazW9C0Dildif7gFcZPAuTgNvz5wNcCA2tIU5NFxxA8mSNmqXUOAgP
	Y5thXCk5xte27bCfOLTZ5QANdeH0DhEHWkjGDziXFIMs/uYYyCdymyA91W2EHTigp6ySAZ998Ga
	3u91uKvlOULnzGaUOuh+OsM4JTTDksAWpW1BnVaKwIXd629Rh5PMUViRwEqawU87eoB9dMMqJ76
	ve/CZJdkCoooCBHmFhFsF+p5mCTdL53vJWANhMR9gm7HjYmXAGup8i+RjORkNAwHQTg==
X-Received: by 2002:a05:622a:1646:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f4abdfa25amr415081561cf.10.1767184777996;
        Wed, 31 Dec 2025 04:39:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHjVdYJnT0HRGh9oRatSQOBcjo6QGysu+6XQ2ucO8k216zp4Y/XHei4Vt3/Qm/DIWf32pYSQ==
X-Received: by 2002:a05:622a:1646:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f4abdfa25amr415081351cf.10.1767184777632;
        Wed, 31 Dec 2025 04:39:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b3b35sm38527531a12.30.2025.12.31.04.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:39:37 -0800 (PST)
Message-ID: <a8d4c77e-6155-45af-9ed3-30c796354fa7@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:39:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8650: Add description of MCLK
 pins
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
 <20251204041505.131891-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204041505.131891-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6955198a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hvIJpKUeI51vVs_MJNsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wFlIylCc4JQdG8gx2sJSjoVRL8yddbdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDExMCBTYWx0ZWRfX0rW7dn34ipLY
 575sJ9spfIPjv9K2BA+nP8rC5ku7bxCkpgdxOirjvoK7wNZ9U1cWF/NFv+w53IukYwMGnCTK0LN
 P9J0eMQINeYi39XAJLA42clcf96gX0Zy8NiHdZ99a8PX3Q9cTPa2dL71C26ixZ8qnzOp22vo8mh
 I+kHvY/zFU26HV7Rrue4sgMTe5vJYOlSuDOWg8ltBuPdUyKR15BbgpybB0XJS8j5T8MKh/Tk6NQ
 hYwjAHzQLjrqbMNIUbwtrdfK2ZdMbGD4hwUQMN4ctdHWBbiIeb+GvobKayRVC/vZ+oNavqDjdda
 912raGrBTF1d2jTDvnoOiuHTqNHXJPge/C9tlsQ22bVhDnfs65AKCgTVPPhbD4JUNDidGRPc+dH
 5oPcRm4KDR2b6+nAMva6HBK3qRZdEkgYIn41BQqtYmgeKe9CxuzrrQfNWqJpI2RtoD1wy9Q4gm5
 fzLIkTqGcfzydzdCgQg==
X-Proofpoint-GUID: wFlIylCc4JQdG8gx2sJSjoVRL8yddbdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310110

On 12/4/25 5:15 AM, Vladimir Zapolskiy wrote:
> Add fixed MCLK pin descriptions for all pins with such supported
> function.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

