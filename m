Return-Path: <linux-arm-msm+bounces-63054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88945AED9F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CE2D1896134
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 10:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81522475CB;
	Mon, 30 Jun 2025 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myknMIRL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381792459C8
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279834; cv=none; b=vBltdqGuo4IaZqvHtyX4HwwygmcqqOa2uaLklB9xzILaxFwPHxVzaac08wsVLFcgNUycgzBNYpb6L9sgSOYy0sf7+xm9IczjEVUHujDhAEnwaDb3THAPoP62ohf2cXJ/hlDIIZI82NFOGVmj4EKexSo+ZRrpR4fmixXr530dJdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279834; c=relaxed/simple;
	bh=0f52qohZfhQFKtLyzx2hd9c5RiVAiaxNXfQ12Lv3IAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pt7xoY4m9pggkQUUxyv3YGMlJlld7G5teHeOCqS5mEBi3xpwn446ipM7plcNURylSB49khakFX4105xO7alKy6ffhl+t2SfIsKMA2fDxG8g2gxOAHwoE2h7XoQdnlxyz0WoYsFPRrKaZy2F/OqgTZeWlwNlFvft24zkABNaU3H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myknMIRL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DNV8024791
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chQsJ4qdSF7F+EHHfxbJYAztwZBfL+CDuaIhJc5vZW8=; b=myknMIRLEcQ7/yes
	WtpXZ3URf2iLaegN/xE0HfVhnGxNdbya1BgJlfsCC0go4GO7wst+AbE/XFK0MYvy
	GnujcTKh/iXj/vR2TCQZQDrJSPKpjeMPk0iPBJuy60D+kieAH44yQwMAWyIi4gee
	50BiWHNkNKVHv8FwXPav97Wu7H29YdQb04mA71Gm0DoOEr0rYU5d9uBs7GJjPw7c
	pPji9iyKfv97e/bLNOCeJsyrYdUjX2VL8RAiMeZVPL98Caf8RKL+g+AzFD0tn+ro
	y80qjkwwpv+276VusWCEjEyu6E3V/wgb6+Xe9ihpCw+3A1038A/HoJEdbkaKfQl3
	BTsRXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9cb1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:37:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d440beeb17so29780685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 03:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279831; x=1751884631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chQsJ4qdSF7F+EHHfxbJYAztwZBfL+CDuaIhJc5vZW8=;
        b=W/g0VUCl/8yyoXl+IF5/8KzNrofov9spo4YJnTdg/OADP9RLdXP0iaKSLwiIKDYJWe
         VYSVtaGaL/8hBlF1sE3ajOn87nhMKEmREgOJ7ugIMxKS860jCx36VgSHspHLNlGAqXYG
         Dt5gwp3+UOATBTcq1uq/c4hZXO3TXYQOeHh7W2khXn6CCT3WX7bDcxQhDUDYcE7vFvJX
         0VuzKLNcIlZG4SER9vNRSAJ1HIFXhKYvrEk4YzDd8N3nP2LUqiPQxuMs+pMs+DxXFkLu
         4JOE9iTil9IHxLIm+cEiQtBIL/4qoSD033QmcNlWWiiAJF7qOjHnVZgrBDFebbDAsG1G
         97cw==
X-Forwarded-Encrypted: i=1; AJvYcCUAQH4vhtj6O74e+FQpFet8l/sBHir5rCykix3Q2Dy2MbaOw1uuZxszmGUoMp/G6aRc+8TGxm3AjPlFr5EZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDbvDmrYWahZzFyL0HOsMGF46XIj4d+cGvmBHWgOE7oqWbp8NL
	ZrGUR6uKNZzBUrk7T3H2poDkXlx56OLcjjhf2jtaSgt8t5G7tOuRA6m8Kzu2Eoeo0W7uR7xZTnG
	MT6AmE+PuPWeRMxgtugGlF2jUcyDYTwFFqrYZXzH7AB8pxeSRfW7YWUZ6+SVh0xtXIUqg
X-Gm-Gg: ASbGnct2argIP2hzKAEkoig/5+AMVq4yenBq6fyI2/nmTkFxXRWezMhF4vNrixh41jy
	9z+DwDT5LfaG4gHEOS80ja4TYDSwMmqnrlKwz+X53eMSvqNNFKfGGwjc/DJsDzH4/HL3jI9uLQW
	KuuEXkcndn/6TljAbjGDZ18886zTJT91QWA3Q9fZp1kKKoehvycuwU0oT3eKabw25ZZyb0uqhYn
	2bQpZhyFOOFYkd1vL3JFf8+jxhldcaTvZuySTgsojSM5fUPxmfuB0ZnbYz4UKtwGiGxVfqqFCyu
	UjBfYjh5MK+fq1cO2r8RYIrRkO9PCnARRCNi7HhsBVbxJ52rNad6CDEXn7mCQypcPYyFXfhEwVn
	e72ZmbPUx
X-Received: by 2002:a05:622a:8e0c:b0:4a8:83c:3fd0 with SMTP id d75a77b69052e-4a8083c4046mr31804971cf.8.1751279831177;
        Mon, 30 Jun 2025 03:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVTE4gfc2xS7ZFMYXNiDjrAAjdrlg3gSjjHLpNFckqEJ2em8WfYVERrLqJ1eKY9ndnkmrDCw==
X-Received: by 2002:a05:622a:8e0c:b0:4a8:83c:3fd0 with SMTP id d75a77b69052e-4a8083c4046mr31804761cf.8.1751279830634;
        Mon, 30 Jun 2025 03:37:10 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ccc90sm5470940a12.56.2025.06.30.03.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:37:10 -0700 (PDT)
Message-ID: <cb863e23-79c9-444d-8511-033dd75c02e6@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add initial device tree for Billion Capture+
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686268d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8
 a=ezlFQH_qwS-UVO2EMFMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: XWJDtVgQJYGwKm5UJoKxmdtag5-bYh1d
X-Proofpoint-GUID: XWJDtVgQJYGwKm5UJoKxmdtag5-bYh1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4OCBTYWx0ZWRfX45U+JsghsjWA
 KnxEJXMRYg13U8f4zx3++Tt6WTcfi9suNbjXelN3COMMW2xZ4HpkqMCBfn+HB5xYN/ePLjPDNb6
 j/spClra049inddj5Mi6bzOVLcEZztmHZK//BKmD7kBA15YsBhteHBPeZjGn4lrdXjR+nLpuBzP
 mjjBewYpTGxqMLFGSFcxfwFoaFziKE4ccfL6jmvdAcczb31UOPGbex3WnpCqbKu9a7PVmFVZ2D0
 HX6r4QR6geM6q23gPminIJnCCFa5Sqzm16nYNQD3gdl0CE7eblVbHzkodJ8hhPN3o0gL8Y9j1c/
 UpGODecnutkqUOdC1b1FPnP6wq+ih3yPYfxXumpFUM5eRJJUFMLE+DukGdkKlaQQ7Kg15EKuPd+
 AWprXCxKcM6+1QOvTi+aa7hWlXtIKrvTWQdr3Wowmq+u+13LSaOUkEwIvYve1yM4DiMYKC/R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=763
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300088



On 29-Jun-25 08:44, Cristian Cozzolino via B4 Relay wrote:
> Billion Capture+ is a handset using the MSM8953 SoC released in 2017
> and sold by Flipkart.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
> Changes in v4:
> - pick up tags (Rob);
> - Link to v3: https://lore.kernel.org/r/20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com
> 
> Changes in v3:
> - (patch 3/3): pick up tag (Konrad);
> - Link to v2: https://lore.kernel.org/r/20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com

Resending just to pick up tags is not necessary, maintainer scripts
take care of grabbing them

Konrad

