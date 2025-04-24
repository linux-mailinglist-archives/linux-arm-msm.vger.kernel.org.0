Return-Path: <linux-arm-msm+bounces-55526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3D4A9BADF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 00:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D743A1BA3EBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 22:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C4828936F;
	Thu, 24 Apr 2025 22:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P07HF/qD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1540528A1F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 22:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745534304; cv=none; b=sbH8JzGWAVgcGal43DXWcCHP+i1d4odQVkoklvsHd/rVB8A4LgcHX+fMmpSiGPWClYrbWcTWYDW/4vOarSER5SosDvjR0dQVy5s1HXxlPY/fwXU4cj3nJBm9M6dakof3zuxhQ3oydo18ei1H+q8e42lrqyK0TbPqSsp6Yo3f5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745534304; c=relaxed/simple;
	bh=YASiGHmvo1dkCsOSPLfYfWjcuIDKkcNJSpmxA0yfcN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opVz9IdFKtQvX1E/aITrcuWa8NFKBHeBjs2aAKcDzU62vXCzmSZHWgAAs2zerdSK+hKPLw9R8nJHM2DE8iSrIdzWQsXcwg0o5hbvhq05EPHynhJ1DGYqyasI8tZx8yACIsg3/NdjBwV6/JuOoQs0OKErDPOxKslEhLanSHgMTlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P07HF/qD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmrfR006098
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 22:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VO0P6koeDq+kVP7alQq90MZIDPbXyDlhqYhjlTwlapE=; b=P07HF/qDFKW8WQGW
	LxnjKWJpaq0LEF39oUy2HzdItT9tVPn3XxNo2kHbMst9Us65Oj3g+7s68fAIHn55
	2dp6r4L5Ciz9OrAcV99pcrUQ8Od4+hG9vQRZpHyo/Ym34+uuajk2d8G7n7/k9IbY
	KjQyr82wh6SEeBjvZbc0D3KyjI2g1E/Z3+0804LKKhLaz2iwBIZBTLvDM1syGMNV
	Y+Mu6d1dmRddnN0mnLd4PLptkvy6iwDTdEB8FSSf7OkiMkuYqv0iJvDyyttzFyze
	sWc8QdOX4BxyQs1k7TQBLk7BQyITUjfCju6u6JV7sN5oRsahOeONb9Vqu799n+oE
	Scy5tQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3f1xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 22:38:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so31001285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 15:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745534301; x=1746139101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VO0P6koeDq+kVP7alQq90MZIDPbXyDlhqYhjlTwlapE=;
        b=IJFcrq5Jd2Ft/gdEvHNPGW4XeseL3MxxPZw5PhlRNVgp4iB0r2pqeZEn3LuFhiJaFr
         Jp17OPGEYB1IFg07jZZY7J2fHepTJY/rtfegjbXfe3hCNsPipE8VDtascNVMiNas4/ec
         hFeTyAeecJ+qKWjR5yRcTJR4RBRLpz2Ez4FV8//Melrq2HNjG4KZ+VmZZPdhgTQlcRei
         3KyI15+RSWeqsYzMC6bFk9LugRwNWgyh/Bkgmnt8Hd9I703l3HfmpU29ZldA816TqNyA
         1siQLXO780exTSn4EH7cvXewqdna5Du3uD1jVRk4T5bOP5m5jZupPrm8HCIljjxvglbC
         yFMg==
X-Gm-Message-State: AOJu0Yw2EYN60u12aaKScXXwJMbNGhTSfQpqGFy3Li5Lfc6zAfnfYdDN
	2KysOPAqIWUAR6zYYEURi9aFW43EHNB3bIRAJ0CqSbSJ7Q+AKtrAJvwb2Ze/EaQyKtnuC0yy+1N
	yCN/K+SxXYI/WpPG8vFr+9P7hN3m9+NUcAf7DM2ClWchX9X+QF8qZ9hDifZyFieXQmNbkUCM7
X-Gm-Gg: ASbGncs8TjfUI8RIgIKk2eDeTeUD77IzT39bhe1NOs8LS+O9rD1e8/p8dBVZZFizR7k
	ATX+yU2awogP5ueCmYIOqRhJ1+ccifkdSVxL2M5+ZC2RfL4nVdm2JOMyNKbeS643eJ6tydUqtaV
	4rEKSppRWmbM4g74zw4uv8RJiSqDE00jYaSVswpPgWBOwGjhFiKoqaX9QL0HZdU1e6HJ/JZj2Q3
	T/mbFCGH2PfdZlVwFnu7PQ/ss/yA6OzWD9u06JWKFDQEfRFEalTbGIuHxRG/DMLFN57dthjizoK
	mrb0nEb1TXtjE1WAEVho9OSw2Xc7XgQ2QMaymQ8I0zpQCV+WKM5bTx8bSvyTxfOgm48=
X-Received: by 2002:a05:620a:4250:b0:7c3:c814:591d with SMTP id af79cd13be357-7c9606a87famr18232385a.1.1745534300653;
        Thu, 24 Apr 2025 15:38:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdSEfC2tUZIeMvunU+zV//B0FYwap4WH72HWhBRmzeTqU/zKLbRBRM2A/LRS5lfaqzdf5/7g==
X-Received: by 2002:a05:620a:4250:b0:7c3:c814:591d with SMTP id af79cd13be357-7c9606a87famr18231585a.1.1745534300272;
        Thu, 24 Apr 2025 15:38:20 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed71fe7sm27695566b.134.2025.04.24.15.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 15:38:19 -0700 (PDT)
Message-ID: <9fcc70da-f3fa-4619-806c-f9557f280086@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 00:38:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <6a4ec36c-c003-4ce8-9433-8c12ed3188ee@linaro.org>
 <d97194a7-2b7d-4a76-998b-92da495e8bd2@linaro.org>
 <d0958f7e-db81-4e4f-93e5-24ba0cd853fd@oss.qualcomm.com>
 <e7a229f9-b02a-4979-b609-ef5e478fe9c6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e7a229f9-b02a-4979-b609-ef5e478fe9c6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BRThvIt9VR51l5hHzNUMwfl3u9Bt1kW8
X-Proofpoint-GUID: BRThvIt9VR51l5hHzNUMwfl3u9Bt1kW8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE2MCBTYWx0ZWRfX8QBZ7mGPcfR2 NSkW6xnEetUwEocug7htesUMkEO33ye/hONG8UBLHaw1WS2G/smgfmwTi7I0KMKMSNh0gxZ448h u6UjuUV8E8e0ER2xDegS8IAy5/DiuIjLpjAwAQqrPiArwEIZMlbOP0kmtHIpQUSab+lV/DhBU84
 l5uUqyZ3/EIJo9OsHBqvTxgPsr0w5s7ANjfUBQqWx5o2yQ2oHUWds8i9Ik1RFdMeOdcXHdID6eJ urqTkpHJW8Qre57o7GajwUb86W69QqJn5IQrH8PhviYgXBoN+2GvYXLIBbrVRrgZKFr4i59M2E7 PFGijJ0EfLPzje0SjUwC/4k6mVbXx2MhMjNBjkWVYW1N1cpJVDK7j5YDx70ZkG73QnGZjnAOeDP
 WMaBQJuG6nEeZd33DzNJ9Tg6MkLl5i5skWQRhUPiFJRAu//PBGsymH0PIzpKgwi1NOomuL4l
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680abd5e cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=BmogGf2FdBIqpyDm8IMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=705 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240160

On 4/24/25 11:10 PM, Bryan O'Donoghue wrote:
> On 24/04/2025 21:08, Konrad Dybcio wrote:
>>> The Test Pattern Generators - TPGs would then also fit into this new model for the PHYs.
>> Maybe we could consider modeling various camss subdevices as separate DT nodes,
>> perhaps on some sort of a `camss` simple-pm-bus or something alike
> 
> I hadn't though of that specifically, call it option 0.
> 
> I had been thinking of
> 
> 1. Doing like venus with a subdevice based on a compat
> 2. Doing it like DPU PHYs and just moving everything into drivers/phy
> 
> The fact that the CSIPHYs are technically inside of the CAMSS collapsible power-domain seem to mitigate against option 2.

Option 1 sounds just a little horrid, I'd be interested in something that
combines 0 and 2..

We may either repeat the power domain everywhere (meh), or model camss
as a bus, (see e.g. agnoc@0 in msm8996.dtsi) and focus on other resources
required by specific blocks (e.g. CSIPHY clocks for the CSIPHY)

Konrad

