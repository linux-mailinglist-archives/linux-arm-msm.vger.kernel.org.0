Return-Path: <linux-arm-msm+bounces-67307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1667AB17E45
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67B731C80144
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7D421A449;
	Fri,  1 Aug 2025 08:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BxIVFVQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EEF21146C
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036891; cv=none; b=kBUpcFstvkxCwtaV0LJ63aKIanDI1q0aX/mLk1B+CL/AQmJwUx+ZvmdBAw7QdD34t7Tix8tkr/dTL/r4M6pDkA7B4Y0YVl6UiVHN0HEKWl4ns258AnJAbzIz+43eA46fU8cZB/zmeHC6CbxD/K6uU5v7ipkKFFEao2+OrxO/tGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036891; c=relaxed/simple;
	bh=n21FYt0R2MUIO2Qf1PzQwL42JjC+OUvtksC+UTS2eYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLXz111Gtw9595SIU4FyKzHJs91YYA28AW2ctrVBWaCbCOL26bB9rtOeSYqONUDOhiS1EhDA/ZD8sybphzx6bomZmO3BlsUjDqlgrtnqZK0r1qcMcaLx/AM50an4we7yMEBDC1Acbb2OeQK2E9+r4xVdWR2HBvfF/R/Ro/7H9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxIVFVQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VNsWev001318
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 08:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maSw2CmMyXYMAvKmdoOc+yYzrI3pcEaJZUjifnEuM/o=; b=BxIVFVQuqV0jyujy
	yHXB+wfkRrSKT9aqMVbG1hqlQELgHhIU31sT9BQBmkigZh8NjIwCOHnODCmxojIY
	Gfy2ZJPhYzSTY3CRBhu9ZbavBhYXZa8QcaqBE2pfcfjfvgbUePgFM1I7cMpPt1tw
	zytn4BNQ6goS4nTh1UZ0W7CrGekoKs8dbm2Ch9fQsgIC90gKTCj4Wb5MSSuoD0+N
	tKHXl/Q7dpaHp5IFWzq8rcv1U33Pd4/W81yOWNiH/bK3MvUH8eYdkxmVDr9ltYfM
	nULozSQZwOj6UluFGaBsoZrYYqmNp21Th9zb9KOAUvMs3iCZtXgoaSZZyNGoaZxz
	r9WgIQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyubh4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 08:28:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31f112c90aso1657216a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 01:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036888; x=1754641688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maSw2CmMyXYMAvKmdoOc+yYzrI3pcEaJZUjifnEuM/o=;
        b=Hbq6iE9GH+BOwxE5rbnOAYVNDwM/SsmU/LtHuOCT/W09cdBCmq30nSm47IgY1F/9F3
         Fv3PuM9Doe4F+fnLPwaTW0VtG91EKbL5+IyLbDILA1OCWO8/kbBacCpwPANlwVeQnQ0O
         cRJ/12yGcOvge1r3QYiHlCY5Rx8GBk4yNAiQ1S/0I1g/goXZTO8pexhDXCgkMfmrf5rE
         91noWclspjyTR7n5vitTHSwTsy2+ikRTL3QEC+IQ6wXf0W7T7MN3sb5UVq8ABEw6DrDB
         KsnHq+EXIU23hcw69cdPRDzTuAZiiG8PWi00+ED7RLmy6WNvlu9nVxXhbxY/FJ6FyMlP
         R9Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWr7IDIEpVKSnOLe615bGKsD9nnoYT8Y/0C5vRgmJie91RJt3fHENbBLnwTyZ6J7qdqwCf0rR3EZlqRvHwk@vger.kernel.org
X-Gm-Message-State: AOJu0YwMuqowDAfWPEb1Aw3QskjTGBCAHhV9OshQHZHEaIy+FhBo521+
	04brovlgSGdpcoIIwhWpm/E1zCqOEKmw3Zz4pQ6B0fkTmLpm99gnezYCCwnouP2lRg08c/t+11D
	4HlGDkdlPwbXsQo3OpK6VEBi5sKkciUzOICGkxljs41tF1uV67XdGv+osL284VA1D9oxs
X-Gm-Gg: ASbGncvSTcQpghy4pnoxzdokaxVP4Z6w8R0FVvTY68LWx8U7/ZDktTbZiCr5jN6caGC
	vaCuBB4ww7MtncxsjwYjYf6UPpIqq8SvgtRfAeTHG6zL0RMft0P2WWiV87i/7P73BwyqAaKA0r4
	ZBgitzmYm/uiORRVo4BbUw3uz3TYHVuq1oJ7AhMV8OQr5lGvpW+u/ctr8MSWsC2NWea3bhXo6iy
	fHYq+1kkNiVtlugTX6DawBswFln5j1A5SSk3IbhueEiaD8+fyiexoAcgG3Ga6X/NuMGbpmJrgnN
	eTBkasRfUpTwlP5tHXB84d4uXtmRBaDfUjXrQEn9k34b59UXZvYkt0YoNHWJ3REikBPU6KTLDQ=
	=
X-Received: by 2002:a17:903:283:b0:231:c3c1:babb with SMTP id d9443c01a7336-24200b0f9f0mr71691955ad.18.1754036888084;
        Fri, 01 Aug 2025 01:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXzVMpoNTOUr+QJdVXJ84SNHSBTQYxIJbq36BDLV4wmlovxf8sqtvX2B9vl9qw1lN1AHJg7w==
X-Received: by 2002:a17:903:283:b0:231:c3c1:babb with SMTP id d9443c01a7336-24200b0f9f0mr71691545ad.18.1754036887597;
        Fri, 01 Aug 2025 01:28:07 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89a3acfsm37009225ad.146.2025.08.01.01.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 01:28:07 -0700 (PDT)
Message-ID: <7bac637b-9483-4341-91c0-e31d5c2f0ea3@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 13:58:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] opp: Add bw_factor support to adjust bandwidth
 dynamically
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250717-opp_pcie-v1-0-dde6f452571b@oss.qualcomm.com>
 <0dfe9025-de00-4ec2-b6ca-5ef8d9414301@oss.qualcomm.com>
 <20250801072845.ppxka4ry4dtn6j3m@vireshk-i7>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250801072845.ppxka4ry4dtn6j3m@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FowG1hI6fzpAc9G0oTMDw95gFHZo900n
X-Proofpoint-ORIG-GUID: FowG1hI6fzpAc9G0oTMDw95gFHZo900n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA2MCBTYWx0ZWRfX0FTgeYJ2qxra
 zjIqgCsHxLWlhInF5R4u0Yj3188jb27iekyWUfqFWvuOTVs9wjcHzTRooOGMN1T9NYZQsfXiFz+
 aIeej/EDq9Zg9UheR0HV94b9kQHbHws2I92zK8THc+9PHy8d/B8DVYEq4i0z8Wh6rubSviA46Wo
 7VA7e/04nJF2f/S07+uZ+yhr4kW82l/e8rj4ZV5G7D4wo5NCqx0ZPrm8642opaUVC5Kkit+OPsR
 jicWbezN1P3criInKQfYe5IHbKabzDCoOEiiSif3LCWWgpVgQu29H5E5R1uFjVq0SihrPjsa7HQ
 cmpMLx+xjD4pSCXkDs/yeyiuPAMd1cm3hnu6taLds8LtLNhFdqwbxk/Y7c7Giw/uRY5z6JhHE8c
 bWeAO4Ww9qjwxBAwspksRyN5IdfNJ5yn812x6/qWsolNilq+A6RJHKkSTYS/P/gbEngzmDyB
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688c7a99 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=9P8yD98ns4tQo_T1VPoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=799 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010060



On 8/1/2025 12:58 PM, Viresh Kumar wrote:
> On 01-08-25, 12:05, Krishna Chaitanya Chundru wrote:
>> Can you please review this once.
> 
> Sorry about the delay.
> 
>>> The existing OPP table in the device tree for PCIe is shared across
>>> different link configurations such as data rates 8GT/s x2 and 16GT/s x1.
>>> These configurations often operate at the same frequency, allowing them
>>> to reuse the same OPP entries. However, 8GT/s and 16 GT/s may have
>>> different characteristics beyond frequency—such as RPMh votes in QCOM
>>> case, which cannot be represented accurately when sharing a single OPP.
> 
>  From the looks of it, something like this should also work:
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 54c6d0fdb2af..0a76bc4c4dc9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2216,18 +2216,12 @@ opp-2500000 {
>                                          opp-peak-kBps = <250000 1>;
>                                  };
> 
> -                               /* GEN 1 x2 and GEN 2 x1 */
> +                               /* GEN 2 x1 */
>                                  opp-5000000 {
>                                          opp-hz = /bits/ 64 <5000000>;
>                                          required-opps = <&rpmhpd_opp_low_svs>;
> -                                       opp-peak-kBps = <500000 1>;
> -                               };
> -
> -                               /* GEN 2 x2 */
> -                               opp-10000000 {
> -                                       opp-hz = /bits/ 64 <10000000>;
> -                                       required-opps = <&rpmhpd_opp_low_svs>;
> -                                       opp-peak-kBps = <1000000 1>;
> +                                       opp-peak-kBps-x1 = <500000 1>;
> +                                       opp-peak-kBps-x2 = <1000000 1>;
>                                  };
> 
>                                  /* GEN 3 x1 */
> @@ -2237,18 +2231,12 @@ opp-8000000 {
>                                          opp-peak-kBps = <984500 1>;
>                                  };
> 
> -                               /* GEN 3 x2 and GEN 4 x1 */
> +                               /* GEN 4 x1 */
>                                  opp-16000000 {
>                                          opp-hz = /bits/ 64 <16000000>;
>                                          required-opps = <&rpmhpd_opp_nom>;
> -                                       opp-peak-kBps = <1969000 1>;
> -                               };
> -
> -                               /* GEN 4 x2 */
> -                               opp-32000000 {
> -                                       opp-hz = /bits/ 64 <32000000>;
> -                                       required-opps = <&rpmhpd_opp_nom>;
> -                                       opp-peak-kBps = <3938000 1>;
> +                                       opp-peak-kBps-x1 = <1969000 1>;
> +                                       opp-peak-kBps-x2 = <3938000 1>;
>                                  };
>                          };
> 
> The OPP core supports named properties, which will make this work.
Hi Viresh,

When ever PCIe link speed/width changes we need to update the OPP votes,
If we use named properties approach we might not be able to change it
dynamically without removing the OPP table first. For that reason only
we haven't used that approach.

Correct us if our understanding is wrong.

- Krishna Chaitanya.
> 

