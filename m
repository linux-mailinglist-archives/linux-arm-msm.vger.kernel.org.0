Return-Path: <linux-arm-msm+bounces-47467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1259BA2F69D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D25B13A6B9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE452566C4;
	Mon, 10 Feb 2025 18:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k98TtJxG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64908255E24
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211356; cv=none; b=FUg1/DTpdG9yMVOXR6uLtNzDT5maExVyMA+kzFTeYmP+Ss4GG5ygXncx2ho5RXQ1Osqszcr1CZ1qbR0M2DOIhM2ATB+8zYmwk0cogVSQ/aj8HetLFC6IvIMPuiLMskBjlH4VYnXIwIS7PXqrgHKBK5sNG/tyh56+gwpllxlkc3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211356; c=relaxed/simple;
	bh=DEygm5HWW7X1xdGiLNElosyRq33AJuWmRSE4tqMOcIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gT6cfirHireEvNpFroZzzfKLxgZmb4Ae+KSGqokWC3JHHug/1GqPaRGz8aZ+NxApx1rpD1nQ+etG8F61h5Gxjn6KXSSa2u2ukZpVj4YEvuyCheO1ktTXt2h/PZNKeWvtDjC+E+58ZZmOl+9AW5nSgLhdmQXA3SsQRutx2lfSoTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k98TtJxG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9VveK008646
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCHZNtni/CSZJ0FFRkrYJ71iWbDqICIFGe1C4Jypxx0=; b=k98TtJxG9YSJjlkz
	AZn4RsntfJ37bbMCwWkkY6LGBUw+WXm0i23q95qFfFBG9wSOxFzQ7aQaN1vLHXTc
	t16eCKLZcEd9Ng3RlWoINgr4B+0iu3EmsBXovO5HGRPRM76udX/swr8InhRYzYM3
	qYnKXvuvldCKB8tuL6lCSgs8yqklbLHdBFPdtyKW5TZ/JrfZ6Cvx6b/hZLoZWaqj
	ICqGUL4Edn/+pVeq0nvdeyfFlAsFa/bqwea3trGlIlbuFTFh7zu29JDM3BpyONdB
	XWT0mlS5euFx8RvxLJY01O72MUSsjzb8cnXLoduwp9bOvuTzJ/SmaPj1SOjKnXuj
	EXff7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh1ea2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:15:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e456cecdddso1339596d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 10:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211351; x=1739816151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCHZNtni/CSZJ0FFRkrYJ71iWbDqICIFGe1C4Jypxx0=;
        b=c1XMCvS4aShqMAHfc2BcW9lOEpf7/fx9ZE7Jim2RMIlzjYGxPvlYyKG1DT6on+65/V
         6QzCAT6XCHoT7f6ahKdGSGRSG0oIqdSW4GqpCcTvEKDaouh867OB2RgWbQOPcE9phN/5
         fa8SJW6/sQbiDEzmhOGBoUuOdbrwMNeMggE2olvKHkQZOXXV5UI8iUhCHVCs0XtYrP+P
         HHCA/7Q6lrqBv7fDczScASF21FHIiUbbXXL4hutKzY/ipUTYnM8FJlp6W8wUSfzAd6G5
         10mHKIuq32DeyvahfXFFB9BjaABK5GkaG3AVbzQrNoPUkX2i/HOvxwVIkhmZujoyGIYQ
         8HNg==
X-Forwarded-Encrypted: i=1; AJvYcCXsjndQVVbi052HjyHVm5HMX1uwTrCyU2TMOeySozTg2NXEQSwhJHjZrMAtn+NBLiot5GaOwn6PiVT6XXeD@vger.kernel.org
X-Gm-Message-State: AOJu0YwczJsjMZi2cGMCVvvqzmAs/pM8QTnBpUS8iKg3uoBsMxPV3S6v
	mCE/3p6Ic2iRV1DqpF81wcXIW57YUm4WHaFCSt4Xw5QWlfEoDN5AqOagdzbOcpAby805v2zLFnf
	VvxsOP1zxZiBm0c0dLcLvTNE54uaZCcIC+DJtHTVc/nxo/R4Wrg2mUT4Chb06511o
X-Gm-Gg: ASbGncueHWXnN7oXZX3zlfDNxGN91JYMuePZszPLvK7ZGiF/dWqBnE+WZhaBOfpCYtS
	SDNLcE9ndwSF8Vir70xdHYQj1hXoS5jbEmmRGCNpe9UJ2udSqJFbdNt3OAzCUjYQETU+5PF92zS
	Js/BqSL4BHyx5NfTEBm+STIaxkt4hsEOA7QLijuGB0dYomvyoZEwOls/+2cAApszYvFNWfKF2r2
	fqjZ55NN0UW2794DIoQ2jRie4y8D3JtIM9Z8T7l3srwl9f//YFtlkXiLSJp/KdHzL2cD+Aikgdn
	t88vSwlwaTxxq/IY8H8lBTM2MKX0W7ysYWbFXYXfvxaVR8FdT+0OlX8UTEw=
X-Received: by 2002:ac8:5fcc:0:b0:467:672a:abac with SMTP id d75a77b69052e-471679dc26amr71995141cf.4.1739211351343;
        Mon, 10 Feb 2025 10:15:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+wRXNnWRPbq293evDdIvEhGqEHzq1kYbvdr3w/KyUUAyfZrYq8rC1dDpVfln5xyQdRsb5ew==
X-Received: by 2002:ac8:5fcc:0:b0:467:672a:abac with SMTP id d75a77b69052e-471679dc26amr71994941cf.4.1739211350986;
        Mon, 10 Feb 2025 10:15:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6c77esm8235727a12.69.2025.02.10.10.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:15:50 -0800 (PST)
Message-ID: <0a1735a3-b57e-4a98-a3c8-46e92b5cdf0f@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, ebiggers@google.com,
        ardb@kernel.org, ross.burton@arm.com, quic_anusha@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
 <20250207073926.2735129-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207073926.2735129-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3Jxf8oY0C87Q3GTq56msubMn9C1aBCm_
X-Proofpoint-GUID: 3Jxf8oY0C87Q3GTq56msubMn9C1aBCm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=706 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100148

On 7.02.2025 8:39 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add Networking Sub System Clock Controller (NSSCC) driver for ipq9574 based
> devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Thanks for getting this buttoned up all the way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

