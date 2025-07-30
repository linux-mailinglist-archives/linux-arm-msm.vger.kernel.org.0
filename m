Return-Path: <linux-arm-msm+bounces-67135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD849B15FE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03DB718C3D88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3A51624C5;
	Wed, 30 Jul 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crORyQp4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7007C1D799D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753876745; cv=none; b=hdUFJqAeb03w/LpYIwMUKpQ0nZxKBSv4LyuWreHVmSXgZ4RUZFfU4/t8ApXZA6z8jR+A45dZhM/TwAe2R++qoIlvH3VDP/mLuXA7uul7pr/dNDSiFryiQy3FXzsmP98wp41d6IM8CDeAbNc3wjA5gTJjeGE6klTOVoIQ80SYV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753876745; c=relaxed/simple;
	bh=HQDIFLaL7om6a5f7K5WAYN1xBKXB6S74doNDZJgGVJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBPaYvEjeSQwilHo5xKDrarhEyxIA4Q4zlUjj+QIGwQP3jxzEZ82q4f2b9odJq8meGpqi8PJ2xxKEWZLL0F+NsorWuvnq3cfbRJxE0kL0rXnIaR0SytxJk7FRKS7tNfGfb02CPqgoHW823kfZCCISNTwxXPKpmJ6WO9POJdAdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crORyQp4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U5sPB5028520
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gk5vGXil7RKOKTWhaZMiJw3ByMsUyxc9oWInTblZhxs=; b=crORyQp4VZYYq5OJ
	vXVC7Wpf33iPtrORDiTeGescorvgBNvzaX4JO8AvZP8vQDXOCg/Ow3SnuduUbFNz
	5lDV1TGFjX5DcZ5nsVlQrUMDFdelzDcKVx67ta3K2GGceIKhf68wIH6yE5v7Jssl
	vhr5j5BcVHsX7UVDX0w2HFlTruIJOVRDdbXUq64BVvHHNliW41/NnqWfsvvzDHom
	rTUCBP2VIvo7Y5edUNpOZAKSZRS4mM8ICO7mr6sLV78K2xWxEl0gsz2xVIoeYN3R
	D8Q+xHdxpbPFgeoFoqx4iVrQwUtpQKOnAws3Cr5yn0m6Ray+fyJpKE5sGd0vwHS+
	doS0Eg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2kjf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:59:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab716c33cdso30357971cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 04:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753876742; x=1754481542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk5vGXil7RKOKTWhaZMiJw3ByMsUyxc9oWInTblZhxs=;
        b=al/ygDUnY/Ad3cAbbPHvF1Kd5CCVQ79Q9ZO1hytDSwu7g6Dn9rkD/FZhLJxvu5sED5
         iyoMW6fScxXQADcijJY02G1475aBAPIOcj48K/txF+cdMF2Yxnf1UJPPeSRS+37AQ32l
         CHO2rDGaDUxYDvAlo6fLXKiyEV5N0jumvus4sZXXBM+gHltxWuKuSTmqvXVdM2IrZWfC
         kCVZtw0tLOEWSOXwsTUft/JA3srt3/ea8LGoKe5twbfE88rsp6VV9IDHYR4PaKG5V2mL
         7Uyi2duEpYxzpHFN1h50/ppK3d4c2yl1NbskInT45g9fO3CcExXXk+mlZDZ5Q785KiUT
         hMmg==
X-Forwarded-Encrypted: i=1; AJvYcCW8fC0qGJv4QacZN7OgIizTNC/BkAxVueDv6DbouQwtsNQxBs/agvGr7IcVlRRX3GCehOA8kegIFY7CDOjl@vger.kernel.org
X-Gm-Message-State: AOJu0YxdfWOIgJ2KQk/I69wSCj9iOdJxJ0UsqcrYnTPhItaXL71wwhFk
	ghnGJeJDgdtMdSX8D2/Ol1clYZU4QpTR1QDY34Sb3y7+/xpcvK6v285VAg6hMzc2XcgtAfWB7fH
	5dal9I4RYbUPdipdrgUQRbHVtlBodl/lLkx2TuSYc/NeQjfAL2XS423YFjhA8vxtyi832
X-Gm-Gg: ASbGnctKAeQMuHqun0XKCncNQ8NgphriyIT2X0ENe9eKJVeG+j5ESkjfz2iSqQ6+S9w
	V88vrwRkvJbLY/x2NZAXWwLgz57nneajDM8Vqv8eWmk0MhK20RVEq2xFkqr+Vmnv+yKxRD7u5nw
	duv7FD+Oar54jidqwphobgXzGaQN/1uI71Q8rxQzSKsWctJRjDx6ZHZXzvw6iKr3e45BKrPq6M1
	bZDXgWUAJU9WKvikDF2W8oQK3Ebtj2wRxCQDhf3gojmrsAfpkLCnZV4RXBsh1i+Gk96Oh9eFtE/
	rVY5d7w5IJhJQpWjhdjFxzpB1gknMQuuRbxBsSiwu3lAOEB6pLhaHxJwKa2ep20kE0dVhzaRCVL
	kug0HcoylaOOWcWsITg==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id af79cd13be357-7e66ef831b1mr218066085a.1.1753876742519;
        Wed, 30 Jul 2025 04:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy3Ac2RJmbNiBhetSgsrV4zyrjPh4J4l/19B5GXz/9xAxchLE62srybp1Dcr/TAc04N6REnA==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id af79cd13be357-7e66ef831b1mr218063685a.1.1753876742082;
        Wed, 30 Jul 2025 04:59:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635ad9cb9sm741180666b.123.2025.07.30.04.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 04:59:01 -0700 (PDT)
Message-ID: <e7952a9e-23db-45fc-9abf-0373fa26f2ee@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 13:58:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom: edp: Add missing refclk for X1E80100
To: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org>
 <20250730-phy-qcom-edp-add-missing-refclk-v1-2-6f78afeadbcf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730-phy-qcom-edp-add-missing-refclk-v1-2-6f78afeadbcf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _5lt_M_SSR4LkKGQJkrMxMX8lzDkm4By
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4NSBTYWx0ZWRfX4Li3t32356t/
 OjajaCYcf6P9412T4o/9/wMPGAuQpYWoss2tIkmCeZ3Bz+Fb+4sqhbfmL3WqtfFb6/g6Dg4QGlh
 ZXkdp8krllDuNFLWfSJzahbwYE9/L+dSIIinzncN5ONogSEHMZPkbE3ibWeehwFAlsLPTxNjbZV
 IkPfe6wHs4nY/PmYRkB8Wn9mWEOwsvOZnmTOAU9IZuxVdkEYYvVVtiKY8ytej2OLyZlmjml6ASY
 gK2OazV98Wi7WRMMZj16dXcWXr1FCHnDwkdzaDZg5fGIMt9I8Z4ML7wmB0a3E3Bue+wDZMmHXkZ
 /ijQWp/zERm6YdKWo9mHQY3xsEQCR6yUKJIIEgecA9L2KRVS9PyYsYIAd+3qg7v2n+Dmn9gxVnC
 A6ksf+fdM63CkVkSeoCPrQ/txsGRCGVD697jeFCz+myk3u1/tRrP4j0lN33X+R+qk1jprWsg
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688a0907 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=C9jaBoPFOhspESL_4l8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _5lt_M_SSR4LkKGQJkrMxMX8lzDkm4By
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=762 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300085

On 7/30/25 1:46 PM, Abel Vesa wrote:
> On X Elite, the DP PHY needs another clock called refclk.
> Rework the match data to allow passing different number of clocks and
> add the refclk to the X1E80100 config data.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: db83c107dc29 ("phy: qcom: edp: Add v6 specific ops and X1E80100 platform support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]

> +	edp->num_clks = edp->cfg->num_clks;
> +
> +	ret = devm_clk_bulk_get(dev, edp->num_clks, edp->clks);

Go with devm_clk_bulk_get_all() instead, no need to be so stringent

Konrad

