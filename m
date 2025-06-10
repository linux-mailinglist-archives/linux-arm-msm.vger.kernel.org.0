Return-Path: <linux-arm-msm+bounces-60768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F403BAD358A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B534C1897D1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5849128A1E9;
	Tue, 10 Jun 2025 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSnuf/B0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF91C25A62B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557089; cv=none; b=F5SkxoRginrw2bOA+5dah8aFALC5AAKI6pmNlgCZOc6AhcTy9Twa+yEKnBVLXaCiOwFwz9rkfbEOf+tpmsrafV6EVgzgxnx//++6/0uV9ab2pb0kd2Oo+i3Gy6T6rqg8SQfeGEOpBlMglkeQqJL4UTmgHLY7jfGq6WXg2IeZIUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557089; c=relaxed/simple;
	bh=Pz9YSXQGmxj6awXsekNSy3wPHB8djwYyC3iwLF0clFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUot8NUwnbbbsU5BjooBfUCfTpq66YewXWxEDF8kvCwO2tF/vNhgiIpLfKPKG/Re56HubmF4F1f3tayLSYMFloJW1qc6l5pXa4FLEHn99+35RNAZyCirIYIpO5AvDFhcBdY3yM1GdWu15l+iNSgfn4beyk4ZKUsSQI4Xej9ZznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSnuf/B0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A7Cx7E000710
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8e9pBVilrcDDWGOOeYxVUGMngrXaogSlGUikyjYrFg=; b=eSnuf/B06nneIVJE
	F349OyUQDOqvbMjA9zYt8XFiDbCTDWSnpP4NzpjHjfyQsxJtvvLw2naoL/5S/ggE
	CYYfFDE0GkUwsM/RVXXyQ6KwYsQQvv2J+MRvx6wjt41zXYLCiGdhTsdnJHXSelGy
	A2uzMNXOBFRKQwFRkhe6RRXX6aYRSwFHioYVVYxZDsRMDu1rEOg4GOz3Fcm95kJd
	x/L7NMk6Rcreqwsd84vLQSQqgbtVbpn/9UDkiZaXyTFk9qvnMWELpoN+eUvI2U0I
	kdicBFycXtzn+XNVOCKwHmsNDgDdJ59hZdMwW5Fge59dsCvXFzIEGaSEgrW/+KO6
	sE3IFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tc17v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:04:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a517ff0ebdso15351461cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557086; x=1750161886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8e9pBVilrcDDWGOOeYxVUGMngrXaogSlGUikyjYrFg=;
        b=LxwNMaMOHkPrDsLMQ4q7rVazF+8XYlru673dF5yj7rEeW4mlhGU0A34vWCoPcos79+
         EdkFkqFarAxulBbKHj2UuOQhBpzZJmBQskJdr+WCpx12zwzodErVlfG8ijvr+UNFY8QL
         BrR4M7ItHvCyIQjGqtO203HRbT5Qg3ZRkd6ZRBU3KfLtJ2foXr/kwvxwI91hpSuOox7x
         NWycv9CLVzDJ8ZbbT702wRBIu37w+yl0ydislDd8YNcuLtVuL4y6IBAsVh8SFYIsadXt
         GIKxgk9/WeyY0ZNJF2l9ukdaetfoFbRirQaQoK+20NWDNrWaqUEp97Ub2gE3RJKLnGJI
         hJQg==
X-Gm-Message-State: AOJu0Ywi823+AHX1f8J8SaRYv8kLCKabG+zvud5NCwsZgfBJNLxXWeO8
	NfAPBnEAnS43j1ySyLVL9C/+spn37zjgXU5vvZQ4fYQIL/fXciRT+zi31bU1RzUYXgkYa+yMGuq
	kRzqChYh1WMZKpzlqJ1YfjN0JmVPjc2W0rzb5GbY/a2KxiltnXCVdGmgJEs2nVU/yTS6F+1rSxd
	Gz
X-Gm-Gg: ASbGncugc58Jwkb/0fuN4nNZBdNvnSNIhfDCoppX+iSKURvrIl+8p5d7urZcZk5nhhi
	1oL53g/zPs0DINTq0msp4mh6rBh9QF5hKyIs5ABYZL0KEXaiSBYSN5le7666y5l5gs4aj0Vudiq
	dR+1OrGby3KIhFWWnMERAwt66XobD3xa9D0RSBeGyJVaOqc1aQw856XzEBXvnLAhPYwweAKmqCn
	FNTYOUOHzsZnzlXNhAprIRJ97F55DX3Zpl3M8uksrcxyzFm5slkzoc6Wdpw+3ccOb9rk223+X4M
	vZHrOhoemE+i5GAp4sjQIIjVb6TEu1XdVpWkpxBBoB2M+oyF8z8DePmdEwtLRcbfVUYJA6cCZNF
	4
X-Received: by 2002:a05:620a:2415:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7d331c39745mr940880785a.6.1749557085676;
        Tue, 10 Jun 2025 05:04:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn+kVYUHownToraRB4x79Lj/LDy5BQWP5oLehzUWRuKEmhnjzEYNAZC1MqSF2HBbw4/JUKNA==
X-Received: by 2002:a05:620a:2415:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7d331c39745mr940879185a.6.1749557085314;
        Tue, 10 Jun 2025 05:04:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d75467fsm722593266b.14.2025.06.10.05.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:04:44 -0700 (PDT)
Message-ID: <945c432c-68ab-46ff-93a7-c60d300aed13@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:04:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: add routing
 for second USB connector
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250608-c630-ports-v1-1-e4951db96efa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250608-c630-ports-v1-1-e4951db96efa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cvK3yLze1A0Qa6LAgZyb_KlM59aHF-Ga
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=68481f5e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=l5u_8PGahEuQ0IlyzxkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cvK3yLze1A0Qa6LAgZyb_KlM59aHF-Ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NCBTYWx0ZWRfXyFeZFse1x4IS
 VV94FuQ1mwNyAIqwgyY5C+A/o3zDsnrAZeM58B7w2xCK5uh9PkCmr1iHDZdqocKbo0Ul2QFnlnV
 PUt4Hw0411ByFutF3fjB7I5lvGiGD4y+4hPiO446Sb9oPbsHBJYnY5FPebCv1W1f4cn99ztolnw
 16/YtT/q3vCr4quRX6nhLBkgyUiSHm4psGn9rLCpH7DiI9oPNMMzRvwXc63+cRUhGvvnFbBB7j8
 /ySUzZ518d6S1sXvtfxNFrBfRxYgsDh6Moq9sG1TP8AjazlQOZKNlejj4nyMUXtLA94jbbnCpZ1
 pynoVVRbrt3s7YTaAGl+IPi1FY/utkNNXAzoIhuRM03Ws+3RZ16P/NpqMlUOVXlYiI8ZT6dUSLX
 dyx6GulSRrOyqlmzk6T9MAO2H98Dbe/zLzEKkjQiU2aUkyZjE5uFMJ7HYBmO6xvtLaS2HJVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=661 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100094

On 6/8/25 6:16 PM, Dmitry Baryshkov wrote:
> On Lenovo Yoga C630 second (left) Type-C port is not connected to the
> SoC directly. Instead it has a USB hub, which also powers on the onboard
> USB camera. Describe these signal lines properly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

