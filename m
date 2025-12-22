Return-Path: <linux-arm-msm+bounces-86199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0691CCD5BA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 12:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD9F03019880
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EEA33439A;
	Mon, 22 Dec 2025 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIIF8/QH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXG2V66w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C078B33375D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398658; cv=none; b=OK/q+z8Zo2x0xlReruhdWXWvpUqEpZnod9jvjDlvrVoo767lIKO2Dv97oneim/+lA9ybfBpuwT/fp6Z00HJOiYxuB1PG6g+WRR2k5+FGG3XpGlV4c+mgzVF9O7K/KruJ4V0rJfGRCXIT1QfeDJszw76kpnDhUgrP6CMOfMtm/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398658; c=relaxed/simple;
	bh=xXZbaRRaVBV4tbxkMrzlNg7kC1b4Tmotuky38v4lGTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmcQHiCkoIRk6OhsvSn8kfAXI8nkB8sYr+3qdiiFDvj4MP67wwp8NJ7ey2uvEtKS/mUu3GMHJe+sEvtAH636UsjoCpgM3/XMWQwXzuF2Gm4kavigAaxv+tq98wV6U2kov6T9UcGRAh69tBJ/g9HAbBX2Qr73lWuNbMlHeTHbcnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIIF8/QH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXG2V66w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8Gwxv3866739
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dbj9Z2sRBrC9i4pAVSuPAM3xhIH7VjDm5nW3cIqJKlY=; b=LIIF8/QHLvcMDoO0
	rTtKyOIZTVezN/TwKYbPNEbjPD4NsBtbIMPG+vyMReSQ3wBesI22ZC+mqg7IAHVn
	OG8ng3cDXYDD6/jRjluxW7yGbNeKrN2DCqrJR7A+INsoSNSkYK72PrHEf7VM1q+m
	PE3Id84pRai2mKtdxdex8lL1XaGYh8nwkbAbGx6do/LwGdQIxeAa2Qs+QTsvvfVN
	RNm9E7n9xmuKPGaXmvd0PcJ+v2jKZxDFyLQJsURBseRfex33OJcsLr9xKSYxs1Ny
	UGJsuVjyniKYPRnHMqUG3PjMfwI8YmdnMAYrTe6l4AN5pqJYIUTlb+Dflo03Bcf1
	O15olA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4mrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:17:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1aba09639so11461181cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766398655; x=1767003455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dbj9Z2sRBrC9i4pAVSuPAM3xhIH7VjDm5nW3cIqJKlY=;
        b=IXG2V66wEXiBgbAiZc9JFU17wI6691MiYVIu/bcaDQHP+SAvMZW024t9W3pWGGbmFF
         4siit1jzPFYN1Wc53Pyb1+HsRuhULembBU90bPL3zA8LeKnAA2hClp5TeeiUZ+0RPKCw
         CXfLA1qc1zl6jRIUCDYSYvDNMi4gB2Vhfq1ybPSEJO2wmDF1RXM7tQQDOewaYBC086v2
         7sIgeXlPiJ8zHbSVTjDtHBy805UzYEuMSgqjvWp63OHyEJSJEpoJe0uHVQSJLXOkkt8X
         xmI7zMl335D00D8zOFDj6C5FafJc/20SmkFqZVX6nQag8o1E927V6PzY7bgcfCbDRGhF
         DxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398655; x=1767003455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbj9Z2sRBrC9i4pAVSuPAM3xhIH7VjDm5nW3cIqJKlY=;
        b=DRaPx6+dJhvnBcJEx0+63mw7IsvO9bmnnJfirshPG0YNxte3NA1WaMfjAXY5wqW887
         OwqpQzvW5nXN7/A7NFQ7o39Pwz0OQs01UIRlTD7MRDqqXCsnbMHSNe0ZgYf+EAOWe/qJ
         l82D1OIwUJK2GUUqK/huDYHhrrvNz4W6plQElZLzEfixBxqF85x1YzkJYrNEP9+/XUsh
         vXVWLYNGdcMj5uNVn+em0+jHtsg4Yw+JbtNcB+G0jG11o+rcWYoCeDff+qLcbCOPj2f2
         Nersc1U98CuO08WsK0u2Nn/llfu71Z+ie9fM5JDxGaWB5SXJ8g/mrszumKJ36FuJuxh4
         cPjg==
X-Forwarded-Encrypted: i=1; AJvYcCWT3oITNH14SEZuXbvflus/LBRPPZfWycxmExRShNWpbT37s5py0lgxAyvuZxEE55LylMrQAUbm0avFdzpg@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0BYQwDS/2StZ+saVDEKlciHT+MWBBJCxY0o1jxOgnV5TDCBq
	JNbF0CYSrgUDdEkabi5yg8M1B3/jssFw8DhHXIBhc04PcSabw7YnvvnH2mP0V0EFMQKVY6W+TQ5
	OvsGzNX1bYjzmI1NvLX9dPOzko5wPmEu3SVjZ7fbKh1eJRAeyHKHXp5EQZwpJXpon/9ax
X-Gm-Gg: AY/fxX4vEJR/p6jTmc6qqjHIPHPHF1DvsimwnJ18Cvb39bLaa/hkuxW2VZZBa0FJAv7
	oGN8Bt/TUOQD5EZoFk+t7WHJS4OvBNe2XgQwmQVlseWzE4AwQCHY43dSx5J+Un7+vgJ2NlxBRKx
	wmgRLP+XSy3k+WUc7jTxlzVAKHGHvXsTI21d01bn1G+D7R6MvxuXP9H26GUdeV5diqlgJ0MaRoD
	sGqN193awP1zbPFgqIAe+nCa2CDg87OOhY6MRfHvbAD88UeTV9L+aYei+w8W1UpPkhRPM+1QN03
	fE5c/GteFiroDCgFcFY5maiWZvpJ1rgukxwROcMpeIXZWmp6nq5HS2P73faZmYy0LzDVOvl3XnY
	KcSJ5oTD6BFIMqsNXds4UhIKLArDi5XsZQJ60g/LreCbkdQ6IBvTruq0RvaCqXZTEXg==
X-Received: by 2002:a05:622a:5c8:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4f4abd173a9mr123973051cf.3.1766398654916;
        Mon, 22 Dec 2025 02:17:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlpAk0bRbTQVcybJQgim4hONTeK4OwTpfgIKCYDa3kRmH0DDmQU9WXzXl/VS5edLANdvVztw==
X-Received: by 2002:a05:622a:5c8:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4f4abd173a9mr123972781cf.3.1766398654442;
        Mon, 22 Dec 2025 02:17:34 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614acsm1053395766b.3.2025.12.22.02.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:17:34 -0800 (PST)
Message-ID: <a1cd5f1b-8b2f-4795-9878-1e61ce0aeb40@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:17:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_
 instance for primary port controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?=
 <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-4-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251220063537.3639535-4-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MyBTYWx0ZWRfXxHHXCQqfOboP
 oy4f3OnoO7/4/xAhQoMmYO6PUQezXCcFCxpRoo4HaKCUTvxgYAqu6glKWQWlicHpobTVPBClCwz
 xjRL1k95PhxN5YZSUdnHgiTA6eTDb6IRm5Pu+fIAM4R6FLfi4odNPRMviweqzHZeU/RRsO1CC2o
 IC7l1tH0i8mLgiRdnmAfbm5dDoLvHD04fiefclFa2vcMeQucEqtULtUQzOqtZtz+VkE+2kwbLJd
 b/5xcOOirqzRA9lK8vrJRpVf6MCz8DbsCJ4E11qFk4T8xcWqpE2XFxI5vvtlX0Vr16uRu9lXqiO
 01ljw3IE8kzixt5z3Oydx5CThBGQwy5t+kBXjbGo0gPUXJydd4Bt3X71MlzJWuDVd7uc7fMQ+6J
 Nq6bLcgn9THaxxwFk40XpP/o7llfE6vkX4KpEzwDhMspjAaUXTOnoSwcFYYVvcNV9CTkn27XRMT
 o4QWv6IwckaZ5tXnLiw==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69491ac0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QSmBtm_2O9qDCKvZU0MA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: uK4ylBh6CfKRua_psMG1Rwxt7C4o48qp
X-Proofpoint-GUID: uK4ylBh6CfKRua_psMG1Rwxt7C4o48qp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220093

On 12/20/25 7:35 AM, Swati Agarwal wrote:
> Rename the hd3ss3220_ instance to improve clarity and simplify usage when
> adding a secondary port controller.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


