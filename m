Return-Path: <linux-arm-msm+bounces-46395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8416A20B01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3411D3A54EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 13:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE341A2872;
	Tue, 28 Jan 2025 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cyu9JXmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A4519F462
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738069818; cv=none; b=R6nhjUBPDbte5QYymiOhhu03tpal3fcqHZSkweaQb4NeefGkLURLA87R93av1ytIaTDHunqJbS4dR0hcnTal1IO0bRlqd43gs0kXNQ32tsYYVS5lo7VIGoPcIjkUoJKvRlRdpyrRgKXHQqEAnfON1EcobDo8gmHJDWWfQQtblaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738069818; c=relaxed/simple;
	bh=C9eJdPKQ3DYmqyJ3e2mFtLaMk3r2b+mYc28C9kSYDCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luhg0NHYzlpkRa6poYKGqJRnLaNpUsFnsdv5hl1BjlFt2cZzo4VUqr2BXCVJj7SjKN3hLgCT3zfW3XpuLBVU5Wq1XiVnDshlIe83HrZ+rueV37ijUMZpcg6ItYvCt8XIE/CbrvzY/+oMPGsBbp0ZKwoBo7GTl6kmPzdH1/amq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cyu9JXmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S9lr2O019243
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QaJUNr1HRRotcP4falm1ElQNWfqwO9Kk41jDuSZGXj0=; b=Cyu9JXmrl4Wcxb2S
	qK4H5YPzKcO832p0q5Q06ISAjUj8rv2E3hdwM06rhly6VzG9aBa1gra3fbOT3xWj
	VQhtnLh/yovp5jSri3z/iuyxB1rHxsLAf9no1shRinfd56AmHFq5Ad0JARxSmA6M
	xa0QLtrLGupsEYTC2Qb5KHgWbUgwMSSnLtrpM/wUvwVYFvgKOsp2YVxOyZUGbl+D
	wyBHsXg0Q8kaC/Xx3mlp+KgVph5IRuHd9l6LCJ4mVppfxBQRO5kL0P7lEV4BcdYI
	uNk8NZOCleGnmp2dQxiKIg9Wo+6JfjqGj5tkQmIXyeYGo6hNfXjWhQxTaRitXI19
	c6oB5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44evwugf8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:10:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6f28dc247so114257685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 05:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069814; x=1738674614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QaJUNr1HRRotcP4falm1ElQNWfqwO9Kk41jDuSZGXj0=;
        b=JRU0voWikzAHRL++cPoUgvMx3IPwCPPyytYlhCmnjDJf0cE5ZH6f6SjyBj9dZVhC7f
         lQCHDOd2yDFIYrz+9arZddBjOsP0goaaj2k3cC5pJ920ads7bo3oj9Z2nCHx47LMGi4y
         /dSzaxMFtmvpA39ySHrwMEdt7mXnBrdB7vSGFdeC/HbLHfdFlATqec4NAfRb/G01jvdL
         RhOoD1H9X4kTgdstQ7Twq/Xc3rZPJBmUnSw9cBPtw8drecvjFrU7rAChOEseMwl4Ayr0
         yoi2ZnG/8rACVzffog7tA4jfH2EEYbUoVwlAT6ShIE7wB/wf3/I2dTK7RDZbcLtoMDDJ
         6Vzw==
X-Gm-Message-State: AOJu0YyY+YzXk9xGmJZDlh+Dplk44YSVXlxFCwx0EqQeP/fwhpmibEG9
	+ZBvhmsk8Ot1kSVsS0Z6GWBScDBj+BowFz1+T2ywItu/Hb1H+Olwa34i5/eBKzoFoHDxehzXeKO
	eRspeujlSKUpnKiE0gHbHDLrlBT/00c3Zna81MLVqbZrtslW+1RdzFOFtIuaJuboe
X-Gm-Gg: ASbGnctibmpwHNlwtufNVsIRpPLw64L4gOr6xz6Fi70A9rdzle1q85Dvh3D4S/l6Ur9
	81GLV0ejK1sljGbaByb8Nbdy6+5oM8gW9TqMU4EkMo8BHjZ5b0iGy+pGU4sua6TxaGDrFuQD8kx
	P030AJR+9gYVl0Ujwti6bcOm0Bv+jJTxgoLD2wFOmeL90TlY3OkB21XPWbz/fgrMvNeR2nvF4LJ
	lxzC045XlDXhRI8qh03sxRAxcm9FqZAFBnJ7EWakNIXhwK45WviKEDPdb2gQfwI7s5Pb1Qzu38r
	8cEXgEjmK54nNtiTFlgCKu7VglHCsiRPAc02+USQEQBsC6abtecvFo7H+ok=
X-Received: by 2002:a05:620a:4414:b0:7b6:7133:b8a4 with SMTP id af79cd13be357-7be631f023emr2762218485a.6.1738069814391;
        Tue, 28 Jan 2025 05:10:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWkIlVjPK9TaqHCjHI4paUEgn3Q83dA8c28+FX3LjONMEoBgsAbpKwUEIltymS1oWCXUiFNw==
X-Received: by 2002:a05:620a:4414:b0:7b6:7133:b8a4 with SMTP id af79cd13be357-7be631f023emr2762216485a.6.1738069813982;
        Tue, 28 Jan 2025 05:10:13 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186183eesm7179187a12.10.2025.01.28.05.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 05:10:13 -0800 (PST)
Message-ID: <dccbc4dc-0102-4f46-8e57-17d9dc8e41e7@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 14:10:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sm8650: add UFS OPP table instead
 of freq-table-hz property
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
 <20250115-topic-sm8x50-upstream-dt-icc-update-v1-10-eaa8b10e2af7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-10-eaa8b10e2af7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: avHkz0cdBTeJ7OY5rrq4WeddvbiTp1Jx
X-Proofpoint-ORIG-GUID: avHkz0cdBTeJ7OY5rrq4WeddvbiTp1Jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=919
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280100

On 15.01.2025 2:44 PM, Neil Armstrong wrote:
> Swich to an OPP table for the UFS frequency scaling instead of
> the deprecated freq-table-hz property.
> 
> The Operating Point table will also provide the associated
> power domain level.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

