Return-Path: <linux-arm-msm+bounces-84314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758DCA2DDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 09:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA6CC300807C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 08:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB97332EA7;
	Thu,  4 Dec 2025 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajDm1ADD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PI/UdHLg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D9327C0F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764838557; cv=none; b=ZSoIE506ARoNyU7BpUp1SfgQ09X6q6XBsZLAwPAO6OEIYMpmNmSUcIs3fqv8qmuR+BbL5BQ2p+ya/lzpTVmegq3vwuaxZHICbkM9sL2BTuE48j7KyUXAd7t9GImt8OCJSszkUJo6WXFYyrpsdeMe5dME3syVGMo2yCE/Dbnsp0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764838557; c=relaxed/simple;
	bh=4iuHROEak871swX8Lrj4bGhhwPF9+vlcElBJeTvOuI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZ7c9wHGQ8lBKF3p2OYO6wJZPncsLMp6nCoRA8CYSZp5YChUJUfQvCYTs+7omFBGgk9fiZjGjZ2xEe+FXuAjMIgmrJOYxwtaFTmvcFSExvjrdDNFpXhMJl7Nn6R53j8Kjelxs2CuJfceZME+69UgyAk7D5e7XWpSfRZDoeY5aZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajDm1ADD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PI/UdHLg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4693gl4174353
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 08:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lVyrTYU81hL3VTWZlMKWhfdj
	L7QRH6PnVBeS23BWFYk=; b=ajDm1ADDDQ2eEr7ubLAkxGXiM6AX7DNcTxkoO1L6
	tLS4jHW8b+2n7ytxqS5Bs7/JwII2UPUXwj4kLan4xeAyqkDUSwsWcoqqebG992Pb
	Ye9eKFrqFJMsTIQixUJeyGIPe298Y3y/pMXFsgBK4Kid9XWpYfdhx8YK1VINVGsR
	ntzIzJJrFIazuv7F8G4zA0p3vB01z1HEK/p9bJ19P/lLtZNh6lmaQqj+1irQTcXz
	6LLG2zTzkTUABq6xBzw5lYB3UO008cFPnHGOOa3iIcOVFnrDiAtz8tYUV+g+gRS3
	60QwA7NT6PbIyEDTvEfRs6B0uzrLEUaJ0bMjF8iteDb4Ww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0bbg77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 08:55:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88044215975so17004406d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 00:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764838554; x=1765443354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lVyrTYU81hL3VTWZlMKWhfdjL7QRH6PnVBeS23BWFYk=;
        b=PI/UdHLgrc0VYPAsywjYTj4298JjbusQ7ccbMraI6AXIq9HPN+4a+QcrMbuFjSan98
         E6xYNysf+aRrj9mzh3nIleSG75lWjzh9GSb3uuvE/5V55WX7bF9qMkKE9cBIABHZy2cI
         b5wWzuCqhYTaohcm3nhEjHwvrThHNfoZCCrTzNHjxn5vDB/vfuOvRYgGOJozRlSqIJRH
         oh9I/I6Z63peZYPHUdSjkTzng5DEvaVB4p4e2ElrgPG5O+bt4tqkokmMjR6GsPEHEKxI
         xZuguL9TIqAfsqswdSb0Rlg9cbMMOSN83FlBTgQ0y5Ewd3ODmNEi4QhJyPqxs35jRK+A
         S8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764838554; x=1765443354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVyrTYU81hL3VTWZlMKWhfdjL7QRH6PnVBeS23BWFYk=;
        b=w91a8EyiPbB1mbIh7qUh65ySc4QwcYAaU+vvCnQ6/XNc/3C5xNdmEXzpOTJuhrsg70
         gRB9XAZEOFD2SIVhjiUC4HDVzTKJQuK6hJOyeckKQ4RimeWKiVvvzrzN7irboTm3GWeJ
         oyHOe+4y6c1j5XGdwg3M7uVns2noqwn7mjYM36ccAR3h5yy9FDTXArQXQUPY/bpFXN40
         F+z9C65/mUKiyWq4au1DDDCozLOsO7/2Rwn32Z7IXPifLWOp7tb5yrMkjmsyAEe3ExbR
         quKvWbKcH8NFxM8EHd32bVF+XxBknLpv8SXs6B1zHVG/IiuNY2YeoWdcLe728bOFKoQp
         pBlg==
X-Forwarded-Encrypted: i=1; AJvYcCXW0LHaPdGyl6mSCpLeQibC7BPNjcNHIytir/szZ5hwt71RlC5vpnz0XluifLDlDyHcQ1afg7bby0vvjtcV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Z5uGIYvh6OhWLmSX4o6lkVeVCnJbWBFC1oggp+5/lbXLOSWJ
	cXIS6LwWPUysNkAkYDY0CR5ezxw/9FfCPp8Bb4gqnC56jBmcwzOVYUjPyqih0vRK/C2XyCKw/VA
	hS+d821NsdVzadc9OvZTTXEFfATLABu7MP/KfUALnF+rfugisc4XbNqwOaynm5bBjZ2xM
X-Gm-Gg: ASbGncsZs+GBDjFjyv7jxy9WGUdaYvXLcMQb2vKQisMgZY+itjmeaFpCge4krBz55mH
	N0eUNVTAV0s9hLWI+LSEiFiafNLB1wyj3vWwD2jdtVu1wIZVTkzaWrXhmdi4X5uig7lFl/Jw7eq
	yWSVtFD02cF1MnOMp9U8BR7GmAcGv/GdUvr9XN55cMr4wZ8JGzk1voNGPq0O1QXw5izybveRHOP
	iKPCsOIDR5JpOVI1Csj5+UamQ2YrpsOtw5Qp6IvKs94tqwTKfNWQwxnPGv9jns9WkdavvldPeK7
	N4ppPtZq9SzaRbdswqa/QId8jUbls6+eu/e1Zh+VftaupV/JCnGFghG5AMvmpDJlFEtJCIZSu7o
	nOCCO6oc=
X-Received: by 2002:a05:620a:4088:b0:892:eeb9:4def with SMTP id af79cd13be357-8b5e6c851bdmr732207985a.49.1764838553579;
        Thu, 04 Dec 2025 00:55:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3aMX7sQTlgLJAAvh6lOIQsPmJ0UfemPHarT/wW2H0vj3b2gdf96N6jbTOI/7ld+oredQsQA==
X-Received: by 2002:a05:620a:4088:b0:892:eeb9:4def with SMTP id af79cd13be357-8b5e6c851bdmr732206785a.49.1764838553028;
        Thu, 04 Dec 2025 00:55:53 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe8a7bsm1979480f8f.4.2025.12.04.00.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 00:55:52 -0800 (PST)
Date: Thu, 4 Dec 2025 10:55:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater
 tuning parameters
Message-ID: <nkh5hmppf7wlvlxfwoneceaggodbj6mz2zuajoo2uqpg5ebxqx@mzmh3afhpnjo>
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-4-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204044644.3072086-4-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69314c9b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=l7HdKJapEFYTXkbJdyEA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: rvIN8-CeCgGB-TDBQQBUiF7PkzBXdEaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3MiBTYWx0ZWRfX1QI9JLWEZQ7b
 WfVHgKfDjb71y14GF2Gay1N5XRClSNgorZgExJNOuToimJgSgLh4QlV8bhHTYArYL/6ENyYsgMy
 Sw2Q+8a8LKMa5hcs9YbxOWj2rTIK5tMb3CG2t2rJeDspR1gv83HIiXdCy5Ci8wCfnNn+2gyoioA
 HBY4Epg9uNsUSMY1d9hQO3Jn9Tu8rSi+/Kw5eLhuEEo5zKIcx1B90qhloZ6nzYnOJ8TazgpVgqv
 TttE9W+4jnWQFGME+FqJIrDUC80yQwQ+6CY6i3ldz1JkdmlLoNOc6qed86kP4bc4jF0l6kbjS73
 PMvWm8OyNWd9UTBmzref1mr99s+u9ruHqQ9Qt6gsiwKOY1Q9vEwSPwmEMHSknoLBCpccuCED7L9
 oEVCHdCeYJdxI/oK72l7OS1oR0yjcQ==
X-Proofpoint-GUID: rvIN8-CeCgGB-TDBQQBUiF7PkzBXdEaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040072

On 25-12-04 10:16:44, Krishna Kurapati wrote:
> Add eusb2 repeater tuning parameters for MTP platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

