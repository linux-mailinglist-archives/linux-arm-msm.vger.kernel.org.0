Return-Path: <linux-arm-msm+bounces-76531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 399C3BC75ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 06:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E84133BC224
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 04:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B4F25392D;
	Thu,  9 Oct 2025 04:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWNcWVEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1131424E00F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 04:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759983747; cv=none; b=mMTHmdBzPcc9c9s5SwTyu0A/lXGFq+p+QA1ZKH0rmh3yf+hTM/C3wG5xFrlYVsV3cdoqI/IhCAwLMRj9D4gkTjKk7bljlyTHqXYx9UoC8CuG4Cy90QDoAG/nChzIeutx1vgbW4Y/XDMGRQuidnS9WHakv0AggrfxLcZYUjZ90ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759983747; c=relaxed/simple;
	bh=Eo4C5n8uEjYaAZCAKX4oEdTIX64ErZL8st6VyhbQRHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRh0Ia5yLSImeN7plOwNCJJ00tUwySbPG1oW+ANtr43M7H7k30iouGOYDZKnTfmpzqfimd3OLoRGB9xsiB9TuunKoNbvcNW2qnvRI+9yc5kS2rEJOrxT0acKJzSG5y235TkXL+6Ib6tyAhcafIayJsPYE6+AhHoINIlzow+KFws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWNcWVEV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5H4q029165
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 04:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlweRxCTHiY0YNBpwrVUh6GPJlyv1DhtLQrioAbjk3s=; b=CWNcWVEVDsQ+ClgV
	zlyDNpdTEBS3kZfrjZd6A/OgTa6sIqrnwumKMkF618GVbNK00PTAKOu04GtZb1Df
	YsWKkKCuyYV8AZfL9OoE3jgUcV+LfpHttV1DU8Dje6TQG7SeDpldfLp6vz2yp2l0
	3OsQNVwNyKYR+w1E+sFykxIzba7cWZnkyz0ZwQBBUlcsXjelSFSipa+TgWzPYdkc
	uUo32xyxeOgPvOUm0WEi7+SvHdaFjpSZCOGcjXqXQB/Xjpt7FPNdoGBRLXsxaqfq
	o6+iE/axr8kEAdaml/TLY2xsMhA4wP+fu0iRPymE7mD8fividjPbJQk09M09d+JT
	6RNQuQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4shdwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 04:22:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27eed7bdff0so9762555ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 21:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759983744; x=1760588544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlweRxCTHiY0YNBpwrVUh6GPJlyv1DhtLQrioAbjk3s=;
        b=WQsqC2NQEg5lXsO91vyTz7m5C2dqU655klwIZdo++jUmFy2acCcs99DjXwaAxhpLb9
         Z6Em3Y56epcljAB5wlEX00otCa+8DKDLwEmyjpWKCwTNomoKPMNl+dtqWr0R2ZiJlhT8
         BDJGyuK68g8Qutc5pZuuq1uaJctGaGq1RENevFQJxTScxEmK6/55nYuqmYm4S6BhoWwd
         uqcslw5358EE2YkLuHlkQdLdg9kaomAaOO55mXW7P7ArQbq4OmI+kT1aRhwrV6FprHu4
         /+tQVavdvpFw3Fx4C9f2LADfJypf5z48tisuPk/XbZEOYQOdGy+NioLMcWaB3iew+YJf
         8lzg==
X-Gm-Message-State: AOJu0Yw0M6NYuJj2ThweWYx/RVn59gGH2y+X/E7h0KqoV45ksc0OAZRt
	GoocHSKkVdQMBvQLJ0KFkqtKjdt62+m3gAd+yS0IP6rKhsH0/OUHWlMq35jVak5IEFXJrQVjGnv
	hSYtRgpyVSzuWgc6sMsVn3hR+Fkr8zm+YtjaZoF2R6sUYwYPhEC+I9/Y6StDroba3Xt25
X-Gm-Gg: ASbGncve/WoLCdg/Pd3bdxs98RRxP+MtrIhK8VQd4wUoWPZpdIo6Qe06nSOqDWUmqe3
	Rtb/qRwIKUwstHS1CQhrbbW+xY5BxF/+4Oczx9nf6Ksq9WuW+d4S/GQTddXcouwRocUAIAWdP9L
	xJRnX4Nn/LysBqAuI9OrySWhgpJTBMJ5dg2aUpa/FRaxpmqNrIJYgkC9fVpmPk5A5tXSVg1/4AJ
	9+graNlionveeOZ9Wokqu8azXSUsiy5CpgnmMK+vUv6w682dagjSUimZ6bf8Fo2xJcAOHKGxNpo
	1plPIS3bLo4p29002wrRKtaAVULipe89aLeRUJOkKjpZfHh7htdsQe3L7a/2dBWBKnBLdo4UaQ=
	=
X-Received: by 2002:a17:903:2405:b0:262:f975:fcba with SMTP id d9443c01a7336-29027e77f4amr67045895ad.9.1759983743569;
        Wed, 08 Oct 2025 21:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyThAq1dvMXcqDn90WzxANwfN1ADcD9benUwSZiVNbSywnIE1WHXCuErABq45wMS4n1iN74Q==
X-Received: by 2002:a17:903:2405:b0:262:f975:fcba with SMTP id d9443c01a7336-29027e77f4amr67045535ad.9.1759983742996;
        Wed, 08 Oct 2025 21:22:22 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1ccc4sm13599145ad.42.2025.10.08.21.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 21:22:22 -0700 (PDT)
Message-ID: <5b9ccd6a-2911-49ac-beea-b37c701bdd53@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 09:52:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-x1e80100: Add missing USB4
 clocks/resets
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
 <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sSWYZCsa4d-O94jlT8qUTyuen07LZXGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4RBgPSL8VI0+
 fqIVpRuwdUTFny3TE4EtFHtFfIU7z9VeYRyHXHUqqaR/qHm1qW5fOYQ2ph6iSMMJsv56MUknCXL
 DY3F4WYvTYHn7GoW/ZHmrBgffngVlNeIA9Yle8mJO0dw15PVCJEWTZDRiESWTt+W/Cawg5rONGR
 n+pRF1CsZ2gEjiNZiXdrwhRZXIvRhh2rwfPib1BdqF9oEcxDTxNiPPkUWQwXzdw7ThBEJQpqpDr
 ZC3eTKNLbZTkO/41cRt9HElCr0DOClbjk+TinCCodC4HYzQdEd8812Ny8a2KHqF9XxKi6iAQRBx
 CWD9CHpIusbvhO+20dmP/IVl6f3FQF74xc/15AUPVbyjYfRqoaNER26OUXcyH7pkmi+wTkSNiLM
 CEU8cjHFfXq8P9TnmorL4kS229Worw==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e73880 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=vYJjhQUXXu9twL9fmf8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: sSWYZCsa4d-O94jlT8qUTyuen07LZXGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/3/2025 11:44 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, some of the USB4 clocks/resets are described, but not all
> of the back-end muxes are present. Configuring them properly is
> necessary for proper operation of the hardware.
> 
> Add all the resets & muxes and wire up any unaccounted USB4 clock paths.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


