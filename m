Return-Path: <linux-arm-msm+bounces-87930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E6BCFF0E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 18:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B91836CEA82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 17:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6E0366DA2;
	Wed,  7 Jan 2026 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqJT1EKH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7nrgsEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8660E3557F9
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 16:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802643; cv=none; b=ETdAOAay2yz0bkHFsK68z/shFdTrampiHhvxJRRYRjQCsMhvodxxJrH89tLYOEL11DGfmxFhg+eI9kRUuBPK3pU9mTGi9LpiwBhQFc2YCHsmOEmomRR+3syeDy+enIzG3yEh3/u6bDeRccjLqtLO7Xn3UMeEK1UCkELB6PYcvFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802643; c=relaxed/simple;
	bh=517oGs9FsEfTu6NOn7JGse+olEGHedN/noc2azRQxP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ0U4Pv+CrD4O3derBAL7JJqxHMweTbQ5v8LoYsrOyoVmU0Df1ydepxxe4wi/hgpsVUpfF0lMGVbdYQN0nnqauvZO5n8Jr47xeCKJ56JPJp8Hx0BJDD0VOacjEPYPEQSyV+QpFept8pchGhIrAZUy1Wca3oS/01ra5WV9+OYT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqJT1EKH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7nrgsEM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078gxjA1980411
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 16:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pNn2hydp6mFmiGWfG0RE3hVW
	bp3VHRZ/n5+RMle+1R8=; b=MqJT1EKHl9gRMK8gc0rPEEOryXVHNkKqHzOPhh/n
	AKEEjEqLEKTW2bGKBRI06bwASHx6DmgC1ikIzDdo7anBNcZ5nmByjlDBoE8wIxNV
	+qN2hpoZ7gwmTY6KSu0q6Pf4wE8zoHUNLC4X9c4L03FSu1IyrVpPQ8MJfDfJ0BxP
	JlfcRMskQheJx3n0Ayixqm/1rzn3HG8yNxshkN2Vuew7aB5yQgQmTG2ciXHcKFc5
	qZm3c85gkUlgOELx3bCYSq48So95d7h4f/ckw3AO3Myt+rakPPYY8a/OvLQAtatW
	Wz/OFC7xxjapfrQeP3diKItz8xhCoNAaIoK5tBrS5BdLzg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavjrqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 16:17:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f5e6c2110so3005910241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802627; x=1768407427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNn2hydp6mFmiGWfG0RE3hVWbp3VHRZ/n5+RMle+1R8=;
        b=J7nrgsEMUZQ5sdgDMSgZTGrtml4TAa4Hhb1oVU09UFsGz23HbxYDeNHKrDX3jWaJ68
         C25MMNTkXW8YUkw0Nqm1XLmAXEn+XxMstnvDNkuemOsuXbmsXftArtGTcwvpRJnBE30i
         +L7Wo4qvRztcU0i02Y/QlDkN9uNL034zhCLMNAZOa0Ia5h9XyfJBQ2GnJ83EUnlzwaKh
         I8GnxOGXjOG+uW2W0nVActWQ5b6CNm1DZmjdACO0ksHsBEXtjs7eEWCet1dY3z1nARUi
         b654TFSovUjW6H8jD9w4YlA6KLCZBEkW2/2RorrCt1ZjBsm0Xmglneeqs3rBKvyyvcy0
         EBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802627; x=1768407427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNn2hydp6mFmiGWfG0RE3hVWbp3VHRZ/n5+RMle+1R8=;
        b=EvrAIysJuighCdJBBERU1tMc25mpoSf6VdUVdqxWYK7i/mgLJOEP2+Hvk0L+eO+BQm
         c3fphxFeoQeIYM2dCO7hvqGFfLreVvIpcruQKSwjLcrwJ/TEMM7aWumIcCWgCaThmnb/
         2FST2xuQwizVKxoLWK/4cbUTiiZCrjcE0VBsToOif4ci6EoqZ/2XvBcioicl1z7DUGmw
         YIEBAvAHMzMHZP/T5+hmSw7n3sdQMT3Sfh6eRbpjPf+hZr3hexz79W1uSVvRPkYh+9j5
         i4I1mOrOD+XKCyxeeBsSsOQU2hA7yKEYa8MUl2Z+7MrcI+iFIZbjfNo9bDMOBUhrVtyb
         Afzw==
X-Forwarded-Encrypted: i=1; AJvYcCVzdvSaP1PTK0bW3gpNx3dzSZkRBesyBa7xDKhTaI17dNOW6dBw73LMi97ieUEGpBipWDUUis6wqw1MWSBA@vger.kernel.org
X-Gm-Message-State: AOJu0YwBBhcAcPlDUfrWHn0yYU1QpQaG07PA2tEXlNm3NYvXESsuTqQ3
	4ZW2N7O67V2ejH1AASeX/laMI20cZQI55GJT/mC7FZ46nqHp4anXKH6UrAki5bd1ypjYq+l4U4B
	0q+sb/nuOZ7ESVlOzMjM+/g990AT0bd5oChiZmjzcRTgETEVlQqdeG/Z4fkdXBUaPfJYB
X-Gm-Gg: AY/fxX6WJCIBUcx2TCLB/w32gbX3mlkb+c9BqSZWnKnzeDEBPs4wUvpeW3yIK8ogZgS
	3Oo2yRJP3XzfrwH5nOV57EJeW2gpOIs+KXJWQfPOKHXTIOw3KQT2vF31OajBo1e0CxIFchgB6Nq
	iHK/mHH6bqFBzFK/WbdLh1wk7kYyBHOS1FK5LC6Z/7GuXToDSoHhaH6FXg2vwEM/YtVA2r54lMl
	s7Ov95ZupnEemlGHFjwK0Hq+OWpI53/JpVqnpkPax9W9EF5n1WKmRBYe/h6jbtAZsd7Zl0mfLr8
	YkgAocnra5EooRXd3jQySFS9Mv5grFpnkE3K2qisQPRdmVRaxfP28ni2ho2+NqFngXucuRjkcut
	EhoO84RElF0j61VDC6s2hcM8QqwvR9RhLO1yGHn+E0cVLBfXzOYEvBkboDL+paM2TpBu/dHUZC3
	cgCHWFMwENUhd3+9WT317D7DM=
X-Received: by 2002:a05:6102:c50:b0:5d7:dec5:b6a7 with SMTP id ada2fe7eead31-5ecb65744b9mr936527137.7.1767802626962;
        Wed, 07 Jan 2026 08:17:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWo7kmpZp++avSupk4Uz/4kHmAaLqQIgTBTPz0DzPK5KyO/RxzYBCX2g8LY9QhwFIztQxq7A==
X-Received: by 2002:a05:6102:c50:b0:5d7:dec5:b6a7 with SMTP id ada2fe7eead31-5ecb65744b9mr936476137.7.1767802626202;
        Wed, 07 Jan 2026 08:17:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea872sm1384019e87.2.2026.01.07.08.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:17:05 -0800 (PST)
Date: Wed, 7 Jan 2026 18:17:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/11] clk: qcom: dispcc: Add support for display
 clock controller Kaanapali
Message-ID: <3sbqfijv6b2lxvx3kwcu67a233d7xcpvc5x7ysc6ktk2o3d4qx@6eagaimfqd44>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-8-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-8-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX3hbLFf2HTnPe
 Acg8nq2qLG1kM4jHJ6gVXKXNyYmUMifcB7h//ZMM1HEBPjj5LdOerGs4R82qZ7n41yDGVJbYJDS
 5OvEAg22ZhtdfstLQjtqu1bRK55YZMcsmMh89kZB/L72tHmBhbtqoXr8rqAmRjQok8/aO4nsowx
 48BEWVx0nGHiC00gDlA0+GbP4omHJjtF+Y7XmVfQ0uJzFl/0Jzj/82RyZ9Rtt0u64V0gL5DSKm/
 bbriDIhx5OEHurkZML/BJiqwyye9JwQg/6PKcEk2ph/65afbkufWIOw6JlsMw4YGkE8+MKuWPZ1
 WM7eGq98deqDB5eEYZ40uVD/ouNM5etako3F/BFdOSbEPX8e73MMwR0E+9l1KwmG+B3oGNfaM+x
 y58AJie15De2njOUJKic4pz0J7ZcVdSflwdrZX5LVnt1vDVbTZ2Q9u/crg2TA0E6HIpbZj+I8xz
 FHikuJnLzuw/CIvmh2w==
X-Proofpoint-ORIG-GUID: 36i5CaiezOE0oYYovjoKgHaIZl7GiXoa
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e8703 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gpaIcbXCgmfx5VOTBCIA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 36i5CaiezOE0oYYovjoKgHaIZl7GiXoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070127

On Wed, Jan 07, 2026 at 03:13:11PM +0530, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   10 +
>  drivers/clk/qcom/Makefile           |    1 +
>  drivers/clk/qcom/dispcc-kaanapali.c | 1956 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1967 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

