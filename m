Return-Path: <linux-arm-msm+bounces-72734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF90B4AAA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE3DE3B31D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD02A2D9ECF;
	Tue,  9 Sep 2025 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SukDWI+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CB1288C96
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413783; cv=none; b=dVFivHh8eHvpJm/Yf0VGn70moGrOzR7mk2koN37S5p/q3qgcjBbt5ot9pZVLwDKkllWghpqM1mrL7R+LwxkVFj66fQ8rPDF+CtPH/TIiBjJKFSRu51wNr1637RG+J1ij/ZUDYTOHuL3GckVLmMcIIyrE5gVDVFXPY16xh/Htee0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413783; c=relaxed/simple;
	bh=usm4FdHvUrxmd9nPz9vE9Y9h2MKo8F0CD0Pm4gdOM3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nY2oS9Ku/IUJVieRsen101NRd+jtdJbQC6lzRmVEMjQZQAL2N5AaQRsv2yee9iiDrZHYQf2wNOB7lcrsgfXA9EI6oJt4cFFTdnHAcQFuBCNCuo7L4x53tgU7A5RZ864A0LeR/DZhs00y4xktvOV15WuUvPGqQ/rBGJjVvTTkVTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SukDWI+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LWBP024400
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 10:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBy0MaLLwIMy5hmNCuvVLXpeZyI8/Mf8yaQGjy4D3lc=; b=SukDWI+IENYQRmB+
	xT7tyR+V4I6m4SBnnD/qDnJ/Z620L6GTS4HdZ9XgNEvbyRJiyt8BiWgD9gR40NL0
	wPrTBSLmwtESTV03ElCQuHf7obWaq28R5zgAB4dfl1c6ve3YJ524SrKYvkZvudCW
	F5nDBejDSJDjjosiOjB9+qWxDR/QBFQ9ehpjBOKLYR2ftE0hDFu++JcFUB+uq6do
	zl8krcaI+BKXSMCrjMjbu8a8avZeX69+pVhT01Il5nzkS4vEuO8KajynhzsApbgQ
	6hsY+DJNLsEn5p5etv9zgFI+QXDmvhIGXjGgjTsWg5e7E9O3qqxVxy4G/EbGpeJg
	vpmr4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8yxf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 10:29:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b6023952f6so11852731cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 03:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413780; x=1758018580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBy0MaLLwIMy5hmNCuvVLXpeZyI8/Mf8yaQGjy4D3lc=;
        b=mDbDAjx7TI2RL8xLU+GuEQtoENk3ZCOPf/IHcRJ0ZmTHoAgDCJC+vTFTvoh0LUmCVK
         1IBqEnhfzeIFsvK1C1Z+3b+qLNt+60l+vYmFUdGQxCV/RJbPtih2y5o/2oxB8ZjrpmT7
         qHO/b0/0Jh0Rd2ZFlwN9VxYBOmW3pSE7OlaZ5CaLu1c1Bl2aLGml8sGJF4/OAQh1zvLG
         KzJfOa/I+zSuK1AOpqdPwVEKCrcmFbdVrt2R35x1RugIH417y33+2ZTXT5d4gT/z1db9
         orVzqa8F80XHLyby0Cn9eGuHdS6YWN7wZFMLrfUPXHIkfOmAPv4gf1NBJ0qBgIsQAR4n
         JjIg==
X-Forwarded-Encrypted: i=1; AJvYcCVSNiktlgpJKOitLf1Mmr2Y5OvODfyxHZokne7kkfu7q86DyqPsrEQSN71DoI8SDv0sbGqdv1N6ABNTd2j/@vger.kernel.org
X-Gm-Message-State: AOJu0YxF3ZCZgRLJauWeklyOiec4HCq31NJPKgJwHm4FRa1mwCc6/HFk
	8RZC+X7sPYG8p1PSwYeDKpKELPcOMwLyhjvdiCAoWAYb+ka1SbhN3wrlbtIT0Y8SfdUw0a4d+Fr
	0WHuCbsvgK8ykfEy2EKNqqZIF03JMc/8orzjb5hRYoN4RqVRBjYNPeiEItKfJuAK9Kc09ePh/v3
	HU
X-Gm-Gg: ASbGncuiEEaE8GlvN2qsTwLRcRwymWr2s+6MBqA0BQZSm3MiF2H/Qs5tfdnqgVETf+H
	zuzx01yPZEr8AkLq15Nl4Wdbz7j6DmFOjNR2/nHoW3zrUL5Ra+JkkFju44b8yLtX2piJ9twQ5YF
	QBce3l6fpQigvA55VOKxlXXxD1yBkF/8+8Cm0RyUVQTyUjIf/Q4p4GhaSkvvRU8bsi76Nzb0Lsx
	QVhRgTxKZbZ5ZwfLMAcx89lp3ypY2mUWya0kHr6c1EhNCjLkN6YBghwgDJScjsNcbjt9525AUas
	d1MxhP8jBzMyOdskroIIiBJdtTa4kJ6i6KZs7EhNX9+sZJ/uH2wUXwRS04fMu0XPJAuGxWcpgHh
	cTA8iK6168GhYr22DNabCdA==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b5f847af12mr82535061cf.6.1757413780348;
        Tue, 09 Sep 2025 03:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnb22PJ9048ALlRoPQ81RK5NwZI6keVm8Xomf4IIFy3Ah/BDXmg4UM7UmfQqnov5lleFpFMQ==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b5f847af12mr82534891cf.6.1757413779810;
        Tue, 09 Sep 2025 03:29:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0470f11088sm1406697166b.111.2025.09.09.03.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 03:29:39 -0700 (PDT)
Message-ID: <df9d2328-8d4e-49f6-a8d8-a3385fd3f017@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 12:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, vladimir.zapolskiy@linaro.org
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250909-camss_rb8-v3-0-c7c8df385f9a@oss.qualcomm.com>
 <20250909-camss_rb8-v3-3-c7c8df385f9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-camss_rb8-v3-3-c7c8df385f9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c00195 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4WODJ3-QYr2a6mbQJ8wA:9 a=QEXdDO2ut3YA:10 a=1SaFWpeTM14A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CyDZKIv73wVugUZuAGHxIZyRw_Jq1TXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX+YYguloD7rLt
 N9LxRPFOzjq9jOX5truEZnEXXvgrgFmR4p4VLiYvL2I7rAMLJ9jumpyNzJFUx5AHD7xNPv3nXy5
 wi0t+O/PhLxHCTDi6KdqA1mqODVlSSX5E4fkHbYeUurJpvDd0zhf+yXkuy0TIFr+jGPJyjI9XJ6
 YeKxIVqNXGqoFISTE2C+55IBmz9gcIAFUuTCHx5vXiKoecCla/OX9wUrsDhRoVvRxIwxLhqDO3z
 k2ksulm3K3TmJO0nx7Iaj+ah8jsYOyWVk7wA/7WTnE3r6J2/T2h/4oOkHAI2TcQTPFlDyqfKgLS
 EyyTyDNT9butRks8idU3dNj9ts5d7EJ9U+dJQ/6Exk1ChrHaLVVenWQsSKY3hmJVeMSM18S5unz
 kqUoAq9J
X-Proofpoint-ORIG-GUID: CyDZKIv73wVugUZuAGHxIZyRw_Jq1TXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/9/25 12:21 PM, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on LeMans EVK Core Kit.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

