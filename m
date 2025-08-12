Return-Path: <linux-arm-msm+bounces-68752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FE4B22532
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35D643B204A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECDF2E336B;
	Tue, 12 Aug 2025 11:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiM7eimE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AEA22B590
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996553; cv=none; b=iWQuE3IIU1n33jfG38LTdKcOhIM/4lZcZBLJhuwP56owHLreH3dInsNZPdCUr4Kd+sO7QXT8505u2a8NPBJDw9oelrlFBxUHT7lVZ4yON8P4JLuLFh5bqb06oIqka6Y8EePbxlrbgVstqEWgho4PGwlgQ72J9O/kcsKunxaX4Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996553; c=relaxed/simple;
	bh=oPA/WIMIRpsHMlochGPuYkRjDfhveCKEg3kojHVa9Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TV2ZGAh3fWjK1MfVnIwildNvAVfNFb+zaE/3+m8XoNzmOrDJwrsQsiCENJ3+s7MxeisAB2xgbXGg4qgqHo6+EgSr3DBC7m7LC8MCjwfLgJwslHvmI33RahyiF7Ij2SnLD3akoXGdA8yw0LQ+oqhm5oDZHgSs5voQis3KeXcL4cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiM7eimE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvfsL020363
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3y0mgu29jTmr0+E1IOqpRrcm
	ffDqwIGDsmmzCzXmidA=; b=QiM7eimEMgyF/wGdzqE7oiKjtrt9/yXvV7JyIyBa
	8TYzp41AIqcnRzUHJzTZzpisKmnrWl9bneEJ8M/kEVGbOxDvyi2QgfQpvMHC08oU
	Iyn9S7b0NU3SwfsBae/B7bMMir8t3vKDabmgrZ3BzmI1G/pWxjj+BWWIwx8jHGxo
	gYunr4a2CEYFXu4MbGzzyxfC4rMsq9SH15fxX7znhxwj7axQHmsrK9iDCg8Vf/tq
	OqzCi5LkIZgAdGpEdW4v9c01ph9k/6qhuI5Inj4UMr/vX33X9SkdGLrrN4OanMTl
	LTiRMKvLCl7kffl1wxx0I+vFM5YeMq5B0NSkd3xAJrrGTA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx61by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:02:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4fd9730df28so1439809137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754996550; x=1755601350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y0mgu29jTmr0+E1IOqpRrcmffDqwIGDsmmzCzXmidA=;
        b=Sz7oXURll1esX5TA3nvArd0KKczu1dgNqMeO92LbrreuGnLNHEO8cbytCLXHTOxgRT
         rAUZzqeQ6lbKvQWIiWwjfmOhf9PncoACL/uIPtCX9G8o/piSI18/8ivBhRmiUopFrRfj
         aTrQWJx8CJCaJ9FEIuyz1OYud+24rENkxQ1a8s0VSYO5G/RGiTbkLu/yx2EDwAiI30Hu
         MVB1ukK7DTo485huJo3lSVzf0A2iYTCIyAWlCtDA3qbg9C/Ohc2NH+/FFmFO0q+g+Orh
         5y/57DHqeu1HuA62KkKMWqPY0nHcTcd4glbOGV9tS55RTcG1k4bcJ5N5nFRmYPmKWwR+
         I7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVZUS/2dxjZ0x6ICLWtBhhqdfWkEnYW+WzLLsxj6Pb4mnQ0n8tDlsUOSC7RjIU3MWpmO5WmuAOaK8iLHBHj@vger.kernel.org
X-Gm-Message-State: AOJu0YzDEGIKT/UyA2oq1b2pttQGYc5/yw62tGBVLHqRCvOuHVwDYHta
	7TooMljhzj27sO1VBXno3eZVSudIjlUepGUNSHu66LzSYX4BQp/n9z0mJ5YFmZyD0B06JIEUiNr
	JzyzyTzQmPHQXs0rNLwclZqsSoLjSgkdW+HuT0HCYySr6nksZ5SQJIUStgBbZTQwGktiy
X-Gm-Gg: ASbGnctc6dj3f8KCXfxRYUhA4+uskDfC5QWmZgiuNj4CSGtjhpth53FthFJvnH1ZZFC
	tQXVaKbr9NUV0CjLvB9rVpwe9I3yzjwfFctf57/iHPrjuauNoC6m+YiCz81EtXLuYBsBcKtzskf
	ahzDtRNwwV//R5CMHUvSsxErUOVa2BkASPGKmzTONXzGDVB52UOugWbh5MZt7ioiT5D8MwL/ONk
	GvL+V9+7Xk5JkaJDb/Tn8+L6WI0Y9HtNE9LEIiwLx7i2hRoC6CHo/TuSLE3EKg61tcEu8bMaSof
	+FpaNkmmnKHqrvz8YVWtA+oL16Q7ScpyAg4Cc4kM50h38E3z4tAoGGDcC0kNfdK6W22ehwkYSPb
	2072/t7lhoGevLkqJykGrhX4y6vG+Z/Ur1967uOcAYWNVk5RHPcSL
X-Received: by 2002:a05:6102:5e82:b0:4fb:f2ff:dd16 with SMTP id ada2fe7eead31-5060eae45e7mr5647890137.17.1754996549685;
        Tue, 12 Aug 2025 04:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhJI5O8TpuXn4rIZ5KR3yTu6YjeOYDLPCJ8Rb70BwzgcA7X0ni6OW1bfjYi98omhx9Yi6lcw==
X-Received: by 2002:a05:6102:5e82:b0:4fb:f2ff:dd16 with SMTP id ada2fe7eead31-5060eae45e7mr5647861137.17.1754996549105;
        Tue, 12 Aug 2025 04:02:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238275015sm43684801fa.16.2025.08.12.04.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 04:02:28 -0700 (PDT)
Date: Tue, 12 Aug 2025 14:02:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
Message-ID: <bspec62r6lewqxzq33zbkghun57g3omcllxacieojzakdykcqn@ffixkagm3owu>
References: <20250812-ipq5424_hsuart-v4-1-f1faa7704ea9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812-ipq5424_hsuart-v4-1-f1faa7704ea9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXwQpDh2/72QLD
 WKWGQYsHzpWcKmVNHKwsLfnrzGS0j9nSOfBMyA67ANQ9atGPIwbqOWNQP+eqnJpHl07y0WJ1krY
 xMO3JMcyBqd1NXWmIEbSdCFDULlIQiFkK7c3HM2yFvtgbBMdNAWwTT/3nhTOZBWy3aW67SMLIHw
 G6Fb9Zz5q4myyp9bG8gas7mVjTamqRrbg5od52yInNMj7Y0s7S7XxcC10S6Cu4P4SXoJajCcTxk
 XoO5qPW76+0xOt6EAHQzWLr0hUDU9aPme+HmNozOXDXkSn0kC5zpgAmLefgRuiXggmeCjq6qa+C
 /8wNKa169AWBHsmzJvhtC1Vm5ZG6bTPW9dNEEirU2DflOoUYiKGiqQpCMM+YQuL3elMYaT/0Zb0
 8AJ89prX
X-Proofpoint-GUID: tU1m9xTxZmF_R10Mh-mdCTW3gsJVwSsj
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b1f46 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9lBeFAbR0IUyOWdzi5MA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: tU1m9xTxZmF_R10Mh-mdCTW3gsJVwSsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On Tue, Aug 12, 2025 at 04:02:41PM +0530, Kathiravan Thirumoorthy wrote:
> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
> first SE, which supports a 4-wire UART configuration suitable for
> applications such as HS-UART.
> 
> Note that the required initialization for this SE is not handled by the
> bootloader. Therefore, add the SE node in the device tree but keep it
> reserved. Enable it once Linux gains support for configuring the SE,
> allowing to use in relevant RDPs.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v4:
> - Keep the device in "reserved" state (Dmitry)
> - Link to v3:
>   https://lore.kernel.org/linux-arm-msm/20250630-ipq5424_hsuart-v3-1-fa0866b12cbc@oss.qualcomm.com/
> Changes in v3:
> - Add the pinctrl configuration for the SE (Konrad)
> - Link to v2:
>   https://lore.kernel.org/linux-arm-msm/20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com/
> Changes in v2:
> - Correct the interrupt number
> - Link to v1:
>   https://lore.kernel.org/r/20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com
> ---
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  9 +++++++++
>  2 files changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

