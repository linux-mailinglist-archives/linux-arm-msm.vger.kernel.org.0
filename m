Return-Path: <linux-arm-msm+bounces-53259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AAEA7C4E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 22:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2272B3AFCF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 20:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AC021CFFD;
	Fri,  4 Apr 2025 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEtxvX0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6CA14B06C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798653; cv=none; b=ftyJVU7kPyij61X6rP5QoK7z+AtPYQD+F0kJpqO2yvEIz3fa/fWtMCKzPS4hM5qHrNMRzbPf+nM7I+wB1NCMgegLevnH3L/olIuiO8DlcfhYx+zCjLy/BTJVAbDJ24gHK7OzvNHLPXf3BLMII37WrvIPR0UhdozLWkaq4Q8rR+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798653; c=relaxed/simple;
	bh=oBT4dqU35i3jNYaDg/R08akXO2az0Oc76Luk1EkR+II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMOjLmaw/jeSGoD/qTyrBO9UxE4ujqD9goPHo/0hVZoKFwsD0tue0xY+TQwwwbH7GyJBiFD/B+bFPyJDSdqM5VDceijmV4zaqMC4j03P1zExnJfD/M68e1uN9IGDb7W+Aa4xg8UaIxYAWafwS6LCVwOWKh/Ir9y77lCTjQGgaHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEtxvX0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JElvr014178
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 20:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hWRzIPdUXdKBlWVaK7wwLn27NVVJ/zKlX8uz3CkEsU=; b=VEtxvX0y4phHJf4s
	ehGLNsWkMXWxhM24EkpJXM1djb9W9Wd/DqXBlImXSexeCSqf0aHinkAWtpXeOUhm
	T+bWRnySeVvjcmTbRvIJomfylivgX/XwN/q3x4eAIK9k4UaX83gwQivU0WML71ri
	uFCGE35Hcpe1+xzY3YzLhY2hpPMu3O7nqNlV4ZL258Gxr+ppYvexR29GlatgQ0sD
	7hYD1Gz4H4T4IIH/iI7zM9TDUKiPJxWmkmlOgCw/HyhoKDcF2jHiWzj94JFbf2dG
	q5YHPB+Jn3QTgI3w5YXw0TPSfNoPfRjQr/xuuyhR2pi32nZy1WHUqP8XyES3Pwhj
	MYhTyA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2datw9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 20:30:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476a4a83106so1028671cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 13:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798650; x=1744403450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hWRzIPdUXdKBlWVaK7wwLn27NVVJ/zKlX8uz3CkEsU=;
        b=HxF8SLIflad2bwLbc7fQMq8sQanMkGDBtKKJ922njpUD6+ok5xQClJFCKNHgvfsvpp
         kQacXA8O6jMxQh+c+BTiUdQX0UYoyBssdoaKYz86o+AxcO5g9Lr3/4YAjIDpF3qw5+KD
         O232WwdZkTGdjTJwPnrnNfXunt/VIQFUOgocat06kPb+1MoIoLOqoh0CUChb+MsAnELU
         7IokEodPCuKJY458d47ggAWkhzVHuNZjvs6tjOsSLXU5CJznCa0y6yAKIz/c2/slR867
         Rlv8hQjjyENXtFjXBkffZKC6+OJMz0hFM+VKtbK9fvYPXauHHl56keOhNe2Awj4eBBFs
         9fkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3uCrGbTx7hgNthluUuNTUXNcBtY5fLsYPBKYB7szzdjfdITmGKP2AxXRQKBeHhM/F1u7VqyZ3aawkYYin@vger.kernel.org
X-Gm-Message-State: AOJu0YyHDJCXyF1xT8dtfZ3A25TIdnPnZoR2H9/6a5THPLuKnjRkUgj9
	rrfCzaXdcHyt2XdZboLz9A7udD9D8jRjlGXsU03+ywJoqyHq8V/PYPDnfhgReinAfdLqAhTFP1U
	G8g68bcxTIM67Sxsbsc/jCYJsuUFAUuxuB5cdnzQEivDDpArfhVztrTbPDGWMpud/
X-Gm-Gg: ASbGncty0ZfxQS17bsjva1W4XS9smpfoKt3gWNh6XhYgX4Z4LGvap1i9PGqe9hLq92B
	+EfGn+vVkEVyT3by8Q5B1vpiufRAlXnFZU8wj9Ul+kLw3cMAPmb7cveU0rBkhV5/LdDVlvPq4JB
	knpwMBDfoWESgOLXFjXiDtlApEdT54dRtiyQNd32JLGAXkgnQFoAkpSfDZqFID0Mfa4kGIfk0T+
	WXx9vWBpnPB93amgwlFf5WokgJz4rihQalJxi8L9GYQ6s8H0R9qTPCysfRSga+t0v1Odm366I5O
	iyyR+6qlWj6j61QSFJ6ZfWQby3c+WwVKmgzVMPTGmoiReildPUXTsrkz90fXNq7DaSvwTg==
X-Received: by 2002:a05:622a:2c3:b0:474:e4bd:834 with SMTP id d75a77b69052e-4792490427fmr26497431cf.2.1743798650342;
        Fri, 04 Apr 2025 13:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuSVd6Czwiac8qs9SQtzY9AT0v4N+1AWxlKTXMwazPDheG9mDDd7uUgjlpULwCLJqJUrfzww==
X-Received: by 2002:a05:622a:2c3:b0:474:e4bd:834 with SMTP id d75a77b69052e-4792490427fmr26497151cf.2.1743798649900;
        Fri, 04 Apr 2025 13:30:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a4027sm2911588a12.73.2025.04.04.13.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:30:48 -0700 (PDT)
Message-ID: <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:30:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm64: dts: qcom: msm8992-lg-h815: Fix CPU node
 "enable-method" property dependencies
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
 <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DpQGNK_mqufuOHDYbo4ZLQJ9KbEoNSWO
X-Authority-Analysis: v=2.4 cv=MqFS63ae c=1 sm=1 tr=0 ts=67f0417b cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=HGLQH7UMpQlDbUUNBC0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: DpQGNK_mqufuOHDYbo4ZLQJ9KbEoNSWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=741 clxscore=1015 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040140

On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

This looks good to me without knowing any better about the specifics
of this device..

+Alexander - does the bootloader you use take care of this? Otherwise
we can just do what Sony devices do and stop on removing the psci node

Konrad

