Return-Path: <linux-arm-msm+bounces-53262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7959EA7C518
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 22:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A810F7A858A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 20:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6E222068B;
	Fri,  4 Apr 2025 20:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsllvDr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DDD21E0AC
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799345; cv=none; b=O99Pk130d5NvYB/ebG0ofYDdqaC8pMW+xjvAkqo8VodCsE6wEbGr3n2fZ6ZZk+IJ2e9sDdxKiX55ty3tGcaTljteNr1SsAZvfL1Nz5x01f5qbJsLH6U1H7DDImPNqR2sS65sDNUlDnexfY9tM87e3r68PKiIehPj0lz97gTNc4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799345; c=relaxed/simple;
	bh=p6LZnYfwuVevib83X2fj2dIlaEtzYIiTJ1wKXc6z23U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7z5W+PoVT4iJtLaaj2vCjLvMyf/D/F71oE1TA0eXYBoEd/el+zRhRHlEm+2RN38/pS6Kz19cqCkuqkZCb/TvAMz0ahpyzOkl7xtK7ghSiwiFjNoisNjZJ3VeqgfdoAaW6rQcqV8DswQmC7K8M2G5DYiHWjWWv+PXs7sqV5Yg4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsllvDr7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEo8o000787
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 20:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dvhmq4YEot5WzH3QxroXInz9L/fpcl+l6rHMMX3PtHk=; b=UsllvDr7X0dVrVbg
	KZrNk15XTlIpsHlSLRUHo1Rjd3mfVeLUdGKHjVPPT5oOtoD+m/7gYsxr82zV892q
	b7DDA2z8RHrrKZPaefDEmcOzeLnzA/lFvL5E+X69QLvc+QhNryoD3SpGeyVat7A0
	l7g8KWHIdbS8b8uQKBh4BbQqAUDVJHYqq5HvXdC6gjCVWJ9VCosCJBQDi43vBsmH
	GoBGnTtv+L6v4/5iXkHEKdSOpElOzwzfnUz/k8AoMoGiD4+1akr5kALv4pZKHFDM
	PDQPTTo607hZqu+RzrP4NeG19lbnkHE5lUaymOg4HAIwKg/Z1ceaJG4sp9s4dZoX
	29V1lQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8tvc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 20:42:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4766654b0c3so4208621cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 13:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743799342; x=1744404142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dvhmq4YEot5WzH3QxroXInz9L/fpcl+l6rHMMX3PtHk=;
        b=RxFezKV0Uk8yQ3GyFS9NrprWe61MbhKmMzk7pGLLh2lFcjS+drYs+E/5JFCGFCn7h5
         XuyQ5P3RPLW/dl6QKf6VK1Gb9UklWt83XXnKj87oCX2hsrcSlCMdFnB1EEO1Q8J5OfKU
         OKbiy5ud7J6oRPkVIHZzkOlPYr3rdUUmE+th2cxovUuLC3tHRW3WeNR4s6TrwYW/Eb09
         NwR5VV4Wj6Tfi+AqCyQDMNHE83YEE461Qzhso0NixxIbT8qVH/GITAX5ALsSF8TkKyw3
         T14FCYzOK668JCTepgmPrOKZmrMnY2ZLVk8VuNXdIAq6TlKhalso9S3bozahRI0ls5Tu
         cSbg==
X-Forwarded-Encrypted: i=1; AJvYcCXuS/D1JyVvBpLaHIBMrzBbfyMPSQUeOXc1L3d693EVPnNjD4zJ2cyiz6nsdDVzerISfKOW8vfYYmyB3cK1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/fDdjJvelY+WiOAb1TP75vyBT6cI+WJqQHpbqw4HiVvS8dAD
	aIcj9ox8erjoAkIs2RXu/gA0xbmW/hMhvpXUIkwRR1kUqelLOHLpWQFnf5bs0pUzSjLM42vH+NW
	CyXpHnX+iz7abUcYpxRmjmzTOW6G0uFVijpMGkKKy/u5b/0I+v33AwMSB/PkV1iXM
X-Gm-Gg: ASbGncuuKJYzv2D4T2jNQeaOwOIbUlW7+jnlqxOBAK8HibKX1G1lRY669SeSzBeVeSr
	Z2qqm3J/JfTH6hZOu5enFJyvQFQav0y0f5di9nHPvtR7sSfvpePfzd9fMwk/GvA9zG8Mz6s7h8g
	xMdC7OA6LaMKatk7uJScJ9ydbRLRl8M379nXDLtBkrBUGaqJZWmIB2nX5BBpKFoNdHcwEsUxkdW
	ssjxYSN5Q9OwxREzuCPIojWlXPdn5nSs6I2G2QWqpFNfgT0KwydpagDqcH/s+tk0NprKsQQPCFF
	CGu3DRGuBLlGRwAFafXKjUJntCxriP6+9mfM0gQLNOIliGQxW7sZtz6V29EESsQQn4BFUQ==
X-Received: by 2002:a05:620a:2890:b0:7c5:c5cd:7599 with SMTP id af79cd13be357-7c774d0f248mr242297285a.3.1743799341861;
        Fri, 04 Apr 2025 13:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+SWzK4xJTznItCy4yyRIatUgCtVJCf8ZO8c+GM8oZYtvMasi6TSfEl5lIgHq+ml10q5QRWA==
X-Received: by 2002:a05:620a:2890:b0:7c5:c5cd:7599 with SMTP id af79cd13be357-7c774d0f248mr242292385a.3.1743799341449;
        Fri, 04 Apr 2025 13:42:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d442sm310126866b.26.2025.04.04.13.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:42:20 -0700 (PDT)
Message-ID: <beb1e6a1-8fdf-451c-9c48-bb3abff89226@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] arm: dts: qcom: ipq4019: Drop redundant CPU
 "clock-latency"
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Conor Dooley <conor@kernel.org>,
        Nicolas Ferre
 <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-11-076be7171a85@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-dt-cpu-schema-v1-11-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q4UUnr-R1TfKB5IeXsJJbZ9biC7cyphT
X-Authority-Analysis: v=2.4 cv=IeOHWXqa c=1 sm=1 tr=0 ts=67f0442f cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EKXQiu_l0foPX_vtw34A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: q4UUnr-R1TfKB5IeXsJJbZ9biC7cyphT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=748 spamscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040141

On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> The "clock-latency" property is part of the deprecated opp-v1 binding
> and is redundant if the opp-v2 table has equal or larger values in any
> "clock-latency-ns". The OPP table has values of 256000, so it can be
> removed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

