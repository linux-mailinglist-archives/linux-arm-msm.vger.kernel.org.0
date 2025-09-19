Return-Path: <linux-arm-msm+bounces-74231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70769B8AAD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 19:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 257C07E797A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE1431E8AF;
	Fri, 19 Sep 2025 17:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7e06cpu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0B263F34
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301300; cv=none; b=i3mzgBe1KOK0h0HzB+UTZIMgmWf6riMEbI99Z84m03RNIB4TvEv8Q8X0QZ/6wFAQgkkVBUbj5wWl7lMuMMU9iqYR2cvZo32v4d1+aPj/qQquK7xqBWDez6Ocu8UumKGHUQ3rd+9a6EtvpbZQ/5jbzyZuQoatKiYNLbtN9Gloo0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301300; c=relaxed/simple;
	bh=trDFBwc1oiaJoVJrQfez6m7oAuetfw6BHTNzouIaVYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DriRw9j29J0hEzGHEaRch8nrNaaQ4LDQyBv0uzHuzD0A7K9NXWbk0ifBkXmKEqoorNTQ8zMddEUnEwPopiFMnkudvMbdkIycm2WG+33h8adYXtntlD3rO4lwX3S6hfUrk049j/58vv7ifKof2W0EsImnrDX82izxR1FYqjmGYIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7e06cpu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JBc3Ou013713
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/GJuqjnHkULWUhGDoYaDaK5l
	06w+po27C73CLRMK/x8=; b=U7e06cpuONegCJPqkZYtg4UUJJ3u5dYyrZVSO9mv
	ELIRgnZlemXDNkiJem8hUC9qqsqQHeul2tSlOAixcWaZ9BEWp+D26kpmx6QJizvb
	3BASD7r2p8JrVEMo6ok508AyBmMoxc9ebaA+eYmR9xF5gHyNIIoRh/Pg0OgoJpsp
	GzNk50xwDnhk60IkNeQikoAQ6cLjMGVR25M1d9C1rwt7pl9NxOaPjLOHIyz/TWi8
	aAU0s/mipFfhHQ1LVDpwr0+8mz9fy/BJXezvcaBw3JaFfvE0Js61HH5buv6n8qHU
	I3ZxhjRpDWBsvZhyKTt88C6d93rSWE5BoRu65iXNd4D5rw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyu6fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:01:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-54a903388c6so270289e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 10:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758301297; x=1758906097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GJuqjnHkULWUhGDoYaDaK5l06w+po27C73CLRMK/x8=;
        b=Bq8LwZKeqGA/hfSPr6q7PZLH9dhtA/irPLn9cYDiJ+2FqSW5YrucLQSU6G1dXG7rrA
         VRijBY9pUAjDU+q0e9DECi6p3KolK+pCB0p1w8rkZR9oL4hufqIh3HeXQgn8tYUWfxft
         rmVuQfJt8t5rRn96x7OfpBBrB4APMJ/MmQSIQYQ58Mlql7jZWYYIDKcgGmr3We5M8TeD
         5rJyAECmFcUU+QV7/RFQON3O35X/7mWy6MLFQmXlSu339xg6HmM3Ifdup1ZoWeLWVJm1
         RTeAu1kHx8xHr6ecljzmKeywSwqSzrZPsV0XEW274G+FhtC4F7gsR6h54zTJ5J1uDh7p
         0j3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoIY4myrjlua1rRM/nbBL8j2LPBsaeZHLFfsq5WQLQYR4b44riqaF0hQcULnPUZMXgJWdtP4+J6Ws4jPTb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy08yc5TL2LoNKaj9hCaSEstwOtiX3sAgpEno6e1ZLObvgnj29b
	E3HjP/5j1iGSsFt3hD+8MF8qfOcy7Do6Eayr2y6iN2XoqSXdIGPYhennaOBLTqvd+TASQHxN0nb
	gF6J+boDRA5nQQLIf6bDH7VVWzUTmPWxDNgToRMLFZ9W9aweGaSeR3vqDaSx/AVZEb5Yw
X-Gm-Gg: ASbGnculDZhJs+14NFxk195Hiu61ZvliAWnaz40pTlL919tBNWGMTY4xnixjsbHblYN
	8LXTg0g04TXtoA2zPdYsZoXqenWkFZFldP7OqEbsy7bhdgW/AdJb3idqoTtuuIiSvM1O4GLRJFa
	+/7zEnVJaRzex+3yAz2UI9z0yXu50ks7KTZDyKPD+YWa9yyjAr+ainR/3axovrBCi7M+q2Q64+T
	FO87iTGrxQdSOIGDZClJ5GgRH5wP6makgj6jsBV8TxST4JZfTrsnb64mEqZZ25s7c8GGNRQhyYb
	xVgpMYJ4fMe9h4ebvXkGPvbuJ1tNdEe/QbUrlatHYH0PVG3nN2lmiy/Yr7dpXdolWTM9iQi2DNO
	1NFqKuL3DhhpavCN/ufhZyBV2BLMWKBYLy/8HHo5tR7PktxFM1dx4
X-Received: by 2002:a05:6122:8c02:b0:544:a84d:d3ac with SMTP id 71dfb90a1353d-54a837797c7mr1542736e0c.5.1758301296814;
        Fri, 19 Sep 2025 10:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRMwUFcNmD6+H4WWbQh7maNAmSeRlq1FmZoBVrzLMBe9fiOHdTW1rugEpaVEScuqRpuuBjoQ==
X-Received: by 2002:a05:6122:8c02:b0:544:a84d:d3ac with SMTP id 71dfb90a1353d-54a837797c7mr1542622e0c.5.1758301296167;
        Fri, 19 Sep 2025 10:01:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44823sm1510808e87.6.2025.09.19.10.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:01:35 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:01:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Reidel <adrian@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <david@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sm7150: Add MDSS_CORE reset
Message-ID: <rxjhl4t22x4472x7qjxe5nq4uwoogkuyqzqz4imdtnmeibucp4@yesphve6yat4>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
 <20250919-sm7150-dispcc-fixes-v1-2-308ad47c5fce@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-2-308ad47c5fce@mainlining.org>
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cd8c72 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=1MwS7L9duvxXQ3yU_sEA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: N1bdvX-vMKQLELlO7Q9xqxRFd2ulzMv5
X-Proofpoint-ORIG-GUID: N1bdvX-vMKQLELlO7Q9xqxRFd2ulzMv5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0bgWf/NfAEr9
 BKJ0TG5m95HZO+dR94JBQKlVN8oYwLFwllVTdVXOGCNMaWwjNEJPrXe0fcpBcpYxJwMasNBHj4v
 l7GCpYrd82tSs9z0leH9YN1khAEJ8Ph92HWeXGzTFlpMmM7TuZE+B/AoPTTc/xYnRdkfubf/lQd
 3VyXdbILLhnS0AuSoHWo7bsZZjF3yTJy0GIAkqfm+hyVFw4AKz6G43biRt6Oo6Kc67hejGJXjFW
 r1FJ782CuSZjQ2i897/k2tRpBV2LmlaiMpP+Wj1xeaig8X9stx7TMSAv0PHMin7xz7OJHnCA/Gq
 jINhvR0awc8y10iqB98ctM857L9npB81Z1tCfN+/3LtPoPgd2gq2E2pzU0w81zyL1F0MLfa3Kqf
 HIumNoTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Fri, Sep 19, 2025 at 02:34:31PM +0200, Jens Reidel wrote:
> Add the offsets for a reset inside the dispcc on SM7150 SoC.
> 
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> ---
>  drivers/clk/qcom/dispcc-sm7150.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

