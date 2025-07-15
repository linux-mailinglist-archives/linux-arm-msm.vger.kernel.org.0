Return-Path: <linux-arm-msm+bounces-64966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E60DB0555D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B293BCBD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83052D46BF;
	Tue, 15 Jul 2025 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjhZXFKk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AC32D46CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569386; cv=none; b=E/mC2116ke1+SOH4RQ1v+nTev5Vav7iOBN+XzhnLkgnIAo1LtCORppi2Oo684reQ3E4nWWOD91W5txPCGxtc533rvSddMeC+FsDs1gpgDYFZbVIod2ubaF61ukJ/jvGoT7VVBFVNmNpBAvHJ+4HJiRp9jmwZNwIA/ekPnVCrsEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569386; c=relaxed/simple;
	bh=GlAt2WfKVaLh1TkDGADzmwTqzS0q/wurKHhPiKHGGOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZGZI7ptB27LXHr7zm5oZnkh6t6A3yk2JPHt7kJuISlUcXbZziucKhVf0yS5jzylOgryrd8/3ZSlUaMbC2JdL0isePnLV2FuxPwpe0IgYC1BTVUItzfZM4JxubdkZ1i7l47+ZSI3yDJ0YBwWebY6kPJLPlMaRxVUupGKPFEPG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjhZXFKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5sPxZ007463
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	265FELEVBu6UARMHr66KFfjOqCpQWvhTrGBSX/cuubI=; b=JjhZXFKkHN6yP3wI
	p5nmqbAe9ZvzpID2bDTFLC3mjN0awo7ogAPpalB/NDNG+uhbTvtqIMC7o+vAIsW5
	SngWkeUFsh9Ze2v0HnFmom5Ee4jhNEV4SMDCq824yzUAZLsTfocNw96kJZyn4/lD
	cVHacdtviKp3OlP7qYHSifPCuIdL8PLbhpyNG8+8uDtuV9rA65BGMAQYvteURSTD
	BMjX1cu4DYs2PSSAY+CzPJRkLyqgb16pm+jIuUsIjRcBdx4rLn9fnP8TIWIh+nLB
	erVg7eO81U7DiD+E7MXseGRRx2gfFh/KG2MJao7HWGj5WWqAB4E+IawdLYMO0zHC
	XEw8Ww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58yjb5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:49:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dfeacb6dbdso21352985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 01:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752569383; x=1753174183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=265FELEVBu6UARMHr66KFfjOqCpQWvhTrGBSX/cuubI=;
        b=R+Nh8LVjYPgkNTpdaOGUBj8Wxyb0zWqBcO1wQyjEY3/61682lzEiULBkhAcrZbvNtz
         nJAgF+WJ5Ghd5osoN8tBZ3fqThfvnj8fVVFj3d71HIWZ0DsuuZ1ax9EmwCAfCEc5oK+P
         eyFO4jJTJGnQzD04FaHqkCZKrdRadgSOwkhAWgjFuZT/tVvO3//kBxHfKGGqZLC5jXzw
         tXay2OurfcTcLkWbUTEQJ2NixKJTy2P2oDJuC7/TFBpPy8jhb/j+fd+93JyebFrMo1lK
         RQqpJEyGInknoCHiSEIEXJeJtJCtv/U0/gvXpgUI5jCC4Dbnyqm4UI4U+1cUiwZVfYvX
         mCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Pnv6bFGIgX5L/EHNAdI6WRC919NdeNZeSxZqf4HwfDY2R+gNJjbTOsNeTqoV7VQqwBQYAcK6miWmx8zj@vger.kernel.org
X-Gm-Message-State: AOJu0YzeFURMtrKFo/ah9EYHLE4ebCjDv60MNOqLdBOn4oRh2LF50YFO
	EYGO6F+CEEU+8AWcGiA30GKs2cBma9MhtGvEAZvyhcNMrxOJeZwDSmpoMbfUO9Pq2yIYCFvxS+8
	PDCDFj/opBGcliObLsnjlLk/FL5aILbvqQMu1bu68ik4TZbKTzCoaE1JdEJMJPssgujsA
X-Gm-Gg: ASbGncuV40JG7tsUes0c/w9k+XAIoEJXpPt0xLSgalMuNdVe6Za8T7dhaYp46EPdVzP
	Fn+KlJnRiMBsnrQTiZkS4p8JmuQbLY9ShO3VOlR67Y2UZo7w0wzP1bg2pwEGgaLdQnYuIT/u9lm
	z5u3kEsQDA5kZToCO7Nd1rlGYfVIrEJcvEmRmhnAw+mR4bDyhaaWFf4f/0ajHZR6YLYGM+GLEYw
	1Hnbj89fEyKxebMiqP63Y9dT5irpMY04GrRjUs+uhIkJk6aJiefrgT9pLus4gL/Sy6IvzJ5NM+s
	XZ8mDgi5y6NAfZEPbPDq5+uSqyMPtxfoD13kIYKP4s5kn1gk3KvuV34a4zRnu6xDA+Guu5vycTN
	H/yvWnPofv3i8DmMdEfde
X-Received: by 2002:a05:620a:45a2:b0:7e1:6d46:9bde with SMTP id af79cd13be357-7e33c77c561mr33584085a.11.1752569382685;
        Tue, 15 Jul 2025 01:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHONjuWDLBX/meg+vZxl3dvOyT6rlLcHZrwGStEZGnqSxFx27i2hWHIFBHZRanIBHg+1eTfhw==
X-Received: by 2002:a05:620a:45a2:b0:7e1:6d46:9bde with SMTP id af79cd13be357-7e33c77c561mr33582785a.11.1752569382288;
        Tue, 15 Jul 2025 01:49:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8313c93sm952819066b.183.2025.07.15.01.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 01:49:41 -0700 (PDT)
Message-ID: <c7479bc2-20c4-42b5-bb9c-0a401bce0494@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 10:49:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] media: i2c: IMX355 for the Pixel 3a
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714210227.714841-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3OSBTYWx0ZWRfX/gfky9cnTvnp
 ussetrjX/jbm3dOJzAKc5bkyOJ5xJt4stqDhZA9nl7rzpQwlqDfYMsyROjpR5UYh0txufznZzUN
 QY1nRni9snwsfWcnRdoA4j/gGWuT6pTZ057SkvcGnXEQNJRlDqYEpirM7prTG6h2GBlV+QXyap2
 ETUlnxv7xHfvUHR2JlXCseXxj8sFpBcqCdcODt8q3q25Hn1XFoy6H03UqSJqMIm1qs0OFujFBsb
 FhrjdmH+N8ZatRznJ994076Neh510XqF4WJMmVY3W17NARoTbXljkaPWwqt9/gNFgFQH2Acuzt8
 m3Z4OUiEX8HcdMFUKULuTfN4WPZFi8Byrc6/7gVt9ZNBipQHymzK2qcfaF6NFI9jDAKCHxvdO7O
 VusFDW7N9dGwFN+s083rk5f0kVXHoIu0InJpQCPxI2/L7+rfOLPA9tKBDhf90zDGqdUcPuZ2
X-Proofpoint-GUID: YM4wHOa404narcPACFFhDLOeZzGvJRQE
X-Proofpoint-ORIG-GUID: YM4wHOa404narcPACFFhDLOeZzGvJRQE
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=68761627 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=cssea-Id4SAgXxmdXaYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=850 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150079

On 7/14/25 11:02 PM, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.
> 
> This depends on https://lore.kernel.org/r/20250630224158.249726-2-mailingradian@gmail.com
> because the GPIOs would go right next to the charging, if sorted
> alphabetically.
> 
> Changes since v1 (20250630225944.320755-7-mailingradian@gmail.com):
> - too much to have a complete list (1-4/4)
> - squash camera orientation patch (4/4, previously 5/5)

if the patch indices changed between series, it may be easier
to refer to them as e.g.:

dt-bindings:
 - changed a to b
 - moved x to y

sargo dts:
 - pet some dogs
 - drank some water

Konrad

> - squash driver changes (2/4, previously 3/5)
> - remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
> - change init sequence to match other similar drivers (2/4)
> - retrieve clock frequency from devicetree-defined clock (4/4)
> - remove clock-frequency from dt-bindings (1/4)
> - remove redundant descriptions of child nodes (1/4)
> - switch initial drive of the reset GPIO to low (2/4)
> - set mclk frequency to 19.2 MHz (4/4)
> - add vdda-pll supply for camss (4/4)
> - use common power on and off functions (2/4)
> - use devm_clk_get_optional (2/4)
> - remove extra layer when describing mclk pin (4/4)
> - rename regulators (1/4, 2/4, 4/4)
> 
> Richard Acayan (4):
>   dt-bindings: media: i2c: Add Sony IMX355
>   media: i2c: imx355: Support devicetree and power management
>   arm64: dts: qcom: sdm670: remove camss endpoint nodes
>   arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
> 
>  .../bindings/media/i2c/sony,imx355.yaml       | 108 +++++++++++++
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 116 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm670.dtsi          |  12 --
>  drivers/media/i2c/imx355.c                    | 143 ++++++++++++++++--
>  4 files changed, 355 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> 

