Return-Path: <linux-arm-msm+bounces-82149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B69DC658DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6943F4E5901
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1FA3093A0;
	Mon, 17 Nov 2025 17:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiFnFGQi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcIHR9T+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706653054FE
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400852; cv=none; b=lheJVG3UkCpYdzf1vzMPQ3zaqIBMOHmYGvtdkGjHI6O44CLTGvPo1WExFEJn8mW4NENt8KhrSTNVzeE5yjpoFFRSJnt02v2z0TKiwUMrwiyfVgrFIP9UkHelEglAH23z4xvGRe0+/CLlRmCljhAQooq7vUdwUa3P9xU9hndxpWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400852; c=relaxed/simple;
	bh=8yj2NWFfiUq9ClohcuciNWOuCOUl6JST1j0gXENO/AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roNhGOh1fLOS8RJoTWZHbXH+YGBWpT9pp1XsugahUgc4BxqdMuSxK8ZWOM/+/jcnRSmyI/JmVc1Kw8kjb+KKo2SQZSerMNl7CDd9Vz/ghUR6TGSU1zk2LEgouHXoryZHMZUYFGTGOYUSxekVMUoS9jxFV+CQkOPdfq4baDZLsmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiFnFGQi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcIHR9T+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHGQRAT027662
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXNAWs0veNCMpMF1G9AV8di1rEToHqTDD5YFdaqlwMY=; b=IiFnFGQiywBZpVzs
	cA4sjNYEfFHU1KqqTSyEeg4BX6I2X+BjALicNIdF0IQMPTIc6eLzW/m9lgFbs4iT
	FFNNBGHlsGq5i1yD/8/PrP6T7o5toASfVM7OmXet2GTofzxmDuWs7A41KaAo+x2w
	QuuztsEizKzPj2W1TNAXMzmn8WXUWEN1ljG1gAgl56BgWveuCaKaxtRiQ3Mc2qao
	N2pR1Ev171k5VKcG91kh/Ljshw31hQU4f6/WOa/84sLeQKJYG74J8XCBQYjrOw9J
	vY7dLlsZvyLoWPPAT6D4heRd76onfKj5FAI14ovpPyTJbsNo4qzuszfX7/6BOv/z
	JTlzTw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t074y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:34:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed7591799eso135792941cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763400849; x=1764005649; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MXNAWs0veNCMpMF1G9AV8di1rEToHqTDD5YFdaqlwMY=;
        b=bcIHR9T+MfQo3ZpH0VmGyrlGI9Wl10wCUEH27Gp47Ea9S1hFW1fne5NhDZOkAggnkr
         W2Xt4mXrpS1+9OdoS+GQHbxrjj4+0HzhzL0n/q1WorHh5jtzT9a3N43ell50Txc6jRDN
         VfgOWLIBU6T5lcRN6YcQfTkbQSZANUQnAONNF9mZCPGvTshSiJcHCtOy8GFP4kyWJUgC
         qdTvmwnWnZoKSNhcmbxJ3bGMw0uqsZkYwBAaEhpvjCZgcO8lysSIdzGcPvy7DItLPTGo
         A9Sa1/LuGgqPMX83fuqyH915uDDuFwS2zIi5wJnr/7mHcOm4cjguXiGyWTFDixxOzd4/
         B4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400849; x=1764005649;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXNAWs0veNCMpMF1G9AV8di1rEToHqTDD5YFdaqlwMY=;
        b=t2/ylN+2vYYQCsWpJ8vFAaLFZsI03Bpl4/g/S0qnYhe74nk1bXJisd4+oh1/967v6J
         X1Ji72x7jAB+JYIwhA4XYS7bXGZaOTIyQpweaTtO4O2xET0qVRsMbmpG9kQ3Ph4k8IKO
         JEnD61DyQKBRe8K/ZgFS+iAttwglOgUHlCQdfJ+oLS1FUP3/3QZaNAEpuiiXn6NC4UuN
         rew9O+DnQwIZxCHefVsGg9W9Kx1akLV0E/DGbSheorn9Z6nKcy6gX7P7s9b5BgfTwsPL
         YWWjQjEOqFB66sXh81TCUCpRqe+ji9PkXDxNy19TcqkxnqgsE8A3nGFixMqWAyu9tSgV
         VPdA==
X-Forwarded-Encrypted: i=1; AJvYcCXE7MGZL4BFahkxytrPvpV09mB2UIJblwiZfNMxMBGCEaMiwVqzQ4eBQYsGqkc5Fs+NnQV9y0IKlAvha8nt@vger.kernel.org
X-Gm-Message-State: AOJu0YxLW9yV7wJhksve/5TkrAIBRbXNz7RB7242NIA1jMn5aUErspGj
	pbeJ0vb44w8kTMzFGYQ3ie56tA+W6GhAiGhefgSIMZafDUe8/omZwtpkcoeq8c+W9wTwtf3hcg2
	c1cstulIevSX7lQHXoJWokpzfpRj2fEsAVUoAhLRVd5jXRlBKWTRbAkdLUGyKgc6qIEgI
X-Gm-Gg: ASbGnctPycUxADwhfHhzZrCtA+kG3IlXDuvUh16qvSHQ8VAk2qPDkM4Lxj+AqkMBFVn
	jvPGaI05wBhPhb/9uANWLD2tQ8I7fuu7JjzpMo3fECDJOaVsDhQdqT6BcKthJcvVnEDCVLqX6RB
	R398hxkV0e3MUEgJUSMZADJmi8zPNlOLnVrVt8CA1556tMvaszIxKxHV6vj+VMvgdCgeoni5jhO
	yL+reXPKDs1t79MQEei/Hd6K4SHZ7/QsvF9P67M4rom0uITIhV/7DnJWqX+BEpeNkEwjYPwfsQa
	Y8PIKHx1H1LthPwYci7x6kKqUdcaIHglg/THCiiAsd38pLDjVb/mkjWgOPedWXciVxsaSO+SXIF
	svA7GNH0+Zbq2b5jRhSkYhjbyr2Wy5X/oZO3Mbc2z/WbGD/975pD4lO+Cp4Q9qx0Px9DPQ7/YpP
	Y5utTmkCJ3JcHl
X-Received: by 2002:ac8:5884:0:b0:4ec:f940:4e55 with SMTP id d75a77b69052e-4edf20ecbc0mr167999001cf.47.1763400849452;
        Mon, 17 Nov 2025 09:34:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAKWaXR45cO/WcFecwUT8UxBmAFO4iHiLPBdjSKS6vZP63OaUJSPm9KsbV7g1BpJVj8ciMxg==
X-Received: by 2002:ac8:5884:0:b0:4ec:f940:4e55 with SMTP id d75a77b69052e-4edf20ecbc0mr167998641cf.47.1763400848951;
        Mon, 17 Nov 2025 09:34:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040595csm3307252e87.94.2025.11.17.09.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:34:08 -0800 (PST)
Date: Mon, 17 Nov 2025 19:34:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8917: add reset for display
 subsystem
Message-ID: <h6lfgajogriesxnthxgz5ofikgwpkd4mh3aakxuzq52spgvxtx@t7d6hyujvxia>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
 <20251117-mdss-resets-msm8917-msm8937-v2-3-a7e9bbdaac96@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-3-a7e9bbdaac96@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0OSBTYWx0ZWRfX+oP31aV4pFkM
 Bi1tJYS+7N25/PbJNqg848rTlwnw49/+FQwYLfjc2Qp+ip6eNhlRuO926bBsRM0RPgVWyhDlX26
 JyHv19aq997bChzUe1JujwUuTWGAsoyi87LcHZEI1SLomc/pl55byi895rWsSvBoGNJJoPpQK9e
 pveoQ8V6fbDi7r/thGs88aImGb1Hb+QT3fvWAbyIEgUmCsSagTZRop9PH43dU0vl1aTe+eYPUBb
 B6Bx3c5Qaem10thjkhxldPab6niWtW0f4QmE1ihs6AEwIrCQxa0x3wMm9IE+LRwk+QftVVM9a2a
 PKzknlZaYzCZVMW09Tngf9e2iFoHcOCCMrSuXl0oJcltP03my85J/2jzDtq9q08blsi9V84Vkn6
 7kwuh+1nU1K+Iinf+mbhbXskfj21+g==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691b5c92 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=4nVcwanjD9Et_E7zVfYA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: sHOfLFpFOp3zSWarv9OFwwi0GaXJCWDp
X-Proofpoint-GUID: sHOfLFpFOp3zSWarv9OFwwi0GaXJCWDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170149

On Mon, Nov 17, 2025 at 06:17:54PM +0100, Barnabás Czémán wrote:
> Add reset for display subsystem.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8917.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

