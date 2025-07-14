Return-Path: <linux-arm-msm+bounces-64797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8BB03C7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 903B317EB56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 10:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D407246774;
	Mon, 14 Jul 2025 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjgikyEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7F3246326
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752489962; cv=none; b=h6BINhUUwtDEQvsSDDh463ZQXVrYcw03yEYcNNB8bS2jc//299xTs9Rro1FUzn/WJ5RPXDnFtbYKr2wZP/sJ1uMr6C+IVk1I61j+3+bVL/P1plgZ5l1NOd0UIcjtlg6Fk/XGAQURk4Tndnlr9+dCNPOGDOlSsVlu4bBT8C3jrJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752489962; c=relaxed/simple;
	bh=GsngcRU9ghE95V5sobt8zThiAoxS3bXWswd84ZP946Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHokOTmqlkvP35si1MXvRyd95A7sYUTz6O99360zDQY8WbsTcjNBtl8hMj7N6ZGzalqmpZgsJT6lfv0rcgJ7mI5P6C/Py5I0d47VGRQYKLssZcvf+M/n0gwhIWRUOhICHLlCpka51c1cZXiKBkc+t7GZUhnfCC3dW4dDLg/3+To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjgikyEb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9Up72031774
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvkMX/SfCrQy1ThgqRjv/mjGrsXTIeTx9QKU6pkfYrU=; b=OjgikyEb1mjfDte1
	wtP/hpabasFr7CEflySVgYGJm5q0nSReES76WtUDsAjuVaGWqBaidYYc+ixjFAyW
	B1c+hS+/h5RiQtj9mbC1P/SNWh13uGAsktQ+25BjHlJO2Yp713g1b5IHML/EBtSm
	7GzjdcMCTjs4eqzESvGMBglzsukbovmXSYVcRUR95hJqGozKR0o4Tq+VKiIzkcFL
	d2fSI2y5SYSoWoqem9sJnwPZTiCFACI19+lhnsk1Jfkwn0Ld6LVvaYjNUlAeoL8U
	XKNcKYWWEsO5Gslfhw/4ku1cVVXMLjTp13cMhyuFWE+l4Q/IgOCH250QMqJZNIJm
	+gON1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a2xw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:45:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab77393308so1040161cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 03:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752489957; x=1753094757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvkMX/SfCrQy1ThgqRjv/mjGrsXTIeTx9QKU6pkfYrU=;
        b=TR7sOkCnfOatWXnGVJrWW21x+wmgTrkTvxPqkPWOndt2d8n/jgej5xIO3B9vR5XRIR
         MTiID2vGxkKCpw9tDoW+J44KXYUHpOjqYLwzotbC6IukFOS4ukNlVqPy7Nm4aJ3fXwo7
         2qEtksrgZsumZu8VWFU28JnNCHbuzw53EqDRl0mPwypG8JhPbvaX2amq1XRarOJ9HzRM
         ByJkln9BpJTbc5L9aca/3RaoQGrqmIvrwno3+5BOAxBBG2C67DRyFgZ6UOrWWgpVlZAn
         f1eOoqDDmKafKxvNhJSc7oz5LWlxhevcd7QEXVI9NfF5YkZhke1BZevQIOlLq2AyW2gm
         q8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXe5Qb2uxx156Z723Z+BvD1f2r/m4cMKJ7dpOcoxqldb77UtvxAxGgANXci8J4SsUxYmOc/8ID0zX/ReEXt@vger.kernel.org
X-Gm-Message-State: AOJu0YzT0K4wNrF0D2s8GfySunWXDALhx4K1QDTFV1AkxLTTq1J8MKp4
	hptlhz3+mmhWBM2WB3f6Za5IShCl42MBB9NqWCn3SH5VmzRj8StcwZDcS84YT2tvZ1Jq/0z/Dy9
	oVj6KL5w5DX8MuyjNLIvXQMv/EQ+ksJoA9/EWUG9kFh/gf76wVjTwpFibW7Xt26hP18l1
X-Gm-Gg: ASbGncvy4A9eGLBDJrP6nw40brB+WUEalfBJS1TGWWDOK50hhBPiDbUaOFFw3LypOL/
	qUw2jWzmJOeQkJNW/R3S3S+zvLLwhervWDQTbYLh7pSjsTOr/SaBStH8xZgpXh94hBIQ0ChphQu
	2WXzn4d2OdESAb8tuH8Nlnk693md0QAPzFc0gALKcbKw28fb6joYx7vfUTVNGQYnTCv2MFbYe8b
	fbvTUgXpcs0veUhOZ2EIMW6Vi4rwgh4Pg//LTY3mtsT7X21hwrSooc/YLSINpka5bKl9Tf49NZk
	xt51wMiGykT7yDn+bphhKQs6AX5MT4vrwmz1SqdoLCxA+sUqSoujSi/wNYcyXQYsduMdOWSyEoN
	mmAiTYJ7nAXpOZc/vKHPr
X-Received: by 2002:a05:622a:2308:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4a9fb85981emr61407261cf.6.1752489957167;
        Mon, 14 Jul 2025 03:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELfiE1hbm9W21cfQCQReZLaomvmcfube3hO9vSP/hdiOgPjCPkHWjuKc+mXLxmKJJITonrVA==
X-Received: by 2002:a05:622a:2308:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4a9fb85981emr61406911cf.6.1752489956642;
        Mon, 14 Jul 2025 03:45:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c15sm803864866b.117.2025.07.14.03.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 03:45:56 -0700 (PDT)
Message-ID: <e2b92065-e495-465c-957c-ac10db8fec09@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 12:45:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pm8550vs: Disable different
 PMIC SIDs by default
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-13-e8f9a789505b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-13-e8f9a789505b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hRTGwx3iVNIxB6oPv0syqT-qV5eXUhmD
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=6874dfe6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=yhMgBbtfkmf45w4ReXcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: hRTGwx3iVNIxB6oPv0syqT-qV5eXUhmD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2MyBTYWx0ZWRfX4B9sQL+gwHYZ
 H3KrHafuhngemuXu/JnBVpokxN84dvtH3LXC3XhajE9jEQ9effy+6g2wkqDzcwu10LAfd7ypUYZ
 o1CS8S7cATqdrO8OWBoZK/GPbu3GDepvanXs1/QrxdARQhlEy3be421vzjN29/VWfX8aab0JvWP
 LDXnoNzTdcnyQ7xx0rJ8YIp17Nat5Gsy1p79dwReGipzNng9fyOVDAS72UnvtiK5RRJXQCfy7VU
 42ZrohmXOinTgVhxW8CN10Ia7LAVyihc8i1BEcaGvQSC/BeXsrEWGRt2OdArmRB5sjQyiOEqAxC
 KDR8Dr5NojI3axZs7xEqvrkhtQa1Eh0hPj7C86U9FitskAtJJMUUutH6N3DI54jN/KXW4GV1w0O
 biG2q4a/EWnt+NqtL9WyPjffoUIg/OCbS5o7CMjDPE2545+5YujWlmvRLhSqUz/sUx9BV2Br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=694 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140063

On 7/13/25 10:05 AM, Luca Weiss wrote:
> Keep the different PMIC definitions in pm8550vs.dtsi disabled by
> default, and only enable them in boards explicitly.
> 
> This allows to support boards better which only have pm8550vs_c, like
> the Milos/SM7635-based Fairphone (Gen. 6).
> 
> Note: I assume that at least some of these devices with PM8550VS also
> don't have _c, _d, _e and _g, but this patch is keeping the resulting
> devicetree the same as before this change, disabling them on boards that
> don't actually have those is out of scope for this patch.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

