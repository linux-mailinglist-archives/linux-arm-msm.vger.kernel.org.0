Return-Path: <linux-arm-msm+bounces-66584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B89BB10D3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91CFB03C52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FE6254844;
	Thu, 24 Jul 2025 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRZcdVsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904732B9A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366675; cv=none; b=D/TdCbJwQwdOKlhFqUDJhkMRiZbiAcsahsoNtjW1+AvMlWrqbKaYkGAP6BtgUmgE/fxvABMXWpuF5bLqovBKqwo7EVfDl4mKSi0nULvmzy31PRVBv1KxSj+xd3l7/qTzpVxbZ0RM37sgmSgmbVZuxMNo6AdPcs8pT2Sg6gU4iqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366675; c=relaxed/simple;
	bh=M9qIGBMwsRvsee/Aa2Kvz9A+15R7AKW1pzGk8f83Gkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXwd+BRpLA1SoQnJARWIB7d/Y3uYxw7cswNG44qqzS3y6ZOIBaYXm9GAJe9LbzdR5B4LD6k/AJGlQYo/ySnd1NN5B94m3LCmYg94EdgiInqxIDspF3jjswopk/fIbLV7EIiaO9To1qWuHCpCixCM0R0+fY93D+/wBV4/zhtZK2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRZcdVsx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9ZoP5028548
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9qIGBMwsRvsee/Aa2Kvz9A+15R7AKW1pzGk8f83Gkk=; b=DRZcdVsxwlDA5ZnZ
	VOXeELOmCkMFzq9wj3KtErgPnXhdH9tpZYpwv9nKdjfctExQZkJHIaW5WWgMtPya
	v1mGx4LFXJV/GNtAbzRvLQ0gvZ+N0wi37POn7cTZt8d2zHAINzYm+wLIKL/huLA+
	0cU0k8fDxSBKrn5rCLkWpqqhADyLSghK8V4Bcfh3Gp3FbuDlKjMY62OXPEh4HPpL
	5RhdYZhCHboBOs6VAKGgUyspgptdsqgOyBF6AojJeDsj3BLjUWsUsppYMTmdmf9b
	Fvsr/Ppe9R/BU/Dg8KGAknnlWvCfGSxXUF5Bvpuc8Tbxj5WDwZfyRNVYWWt2dboU
	R/PeJA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1gb2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:17:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234f1acc707so10690715ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366661; x=1753971461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9qIGBMwsRvsee/Aa2Kvz9A+15R7AKW1pzGk8f83Gkk=;
        b=EgISJJFqbRvU76qghiA8awfQaG+dm2keXPf1Ley+23ajqgCAJoDqo/7E7o9lmyovG0
         Z47oowxCEOdWeKcDPKj/LUdxLcNHO1RfNtz+sNcbAvcx6UY4fwHJxzuZX8JGzDjCYD+L
         ShuiqY1GEUzyqPXpjSxwbhyxPyvvMR17FfmcIK9eHKbDJuX7c+Gi4wghIxu2EsMJy4IQ
         38XKpQWR07nYxvTd0/2xpa2uEeTQGjzUCCTJS/IqFFvyACZ2ZIshNfnbA+BZHHWcoN6z
         Ej0L+nwUh+KMAjnSqaDCtaggzRGRhubdVesFIdOSVyozW1F1y1MrlAlGPMlILgjTQYNt
         CNTg==
X-Forwarded-Encrypted: i=1; AJvYcCXiVf5joRnFx0YLgVet19Vy8TSMqlL/xL4F6fLEC8OQ4Bmu9RfoVRUkVkOfq5vc6vhfS4es3uzeZRosLONP@vger.kernel.org
X-Gm-Message-State: AOJu0YzpARd9uhU6DtbVrQvwcE3IUdb01VAwvbbja5MA0Qf4qlM+SAMc
	jPuZe65Qt5/rKOuBCNq/zs10lNj2ibrbERn58CvHvg7863c4uO1UT8o9/mIzRB4nDy0mBVJoWvL
	DvLVJP8PAaEEsJ6z9USAfDODgmtASOA+qf4F+cp9DmiRvuyHBxn4Yxe6J0B8YWIAh8QCU
X-Gm-Gg: ASbGncsQuNWPjRGTpfFBEsc2vX/9md1eckP+2zHBlHLpNW1H4Ux9nMUBWCGmQgbKmDt
	YxjFWTtmkGze71IB7nUS1uqLamAEaMouw/5dxzhoJBibqDJg4V+0Fv8KUp33gJnPY3N2NroroPz
	d8f6fQN7oDJXMr2/gcm4FKZa4F+ikeabjIPJ9phijQ8UmirCc8ja3kZSdWy4U5eE6Qlhv9wbBox
	0CIFyz+xEmqTYYLaL4GerkGaE2sqDy9CXalH2PAZv9bvRhz6cIB3ng/Ajfw2E0FxHiVd9tL5kXh
	kUnxa3TJa4tCC83QLWodacx1y/v4FQikQcaGCY5myB5x7esq2TuxMf+4P36SoiP024UpHSSJ8Kk
	3fjFjc8FS
X-Received: by 2002:a05:6a20:734a:b0:231:6ba:881c with SMTP id adf61e73a8af0-23d48fe3d5bmr10681866637.6.1753366660611;
        Thu, 24 Jul 2025 07:17:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhvtFG0W6tRYiyGDcyMpsBo+LUbFikSwfNcVBQeALnG8xoshy53s7tiH9UcHqZ0iY3/+7/5w==
X-Received: by 2002:a05:6a20:734a:b0:231:6ba:881c with SMTP id adf61e73a8af0-23d48fe3d5bmr10681794637.6.1753366660018;
        Thu, 24 Jul 2025 07:17:40 -0700 (PDT)
Received: from [192.168.1.6] ([122.164.87.238])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761adb7876dsm1830391b3a.6.2025.07.24.07.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:17:39 -0700 (PDT)
Message-ID: <807d50c4-5ee7-43d6-beab-7ce220911d41@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 19:47:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250630-ipq5424_hsuart-v3-1-fa0866b12cbc@oss.qualcomm.com>
 <kad3hqxufsdescelmjhwy45ggnukh435wmo5wbbl6pfz2gq5ge@ycfsgtuwdkcl>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <kad3hqxufsdescelmjhwy45ggnukh435wmo5wbbl6pfz2gq5ge@ycfsgtuwdkcl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XEGM8y1xtQFSb8CWJrMIO8GkjqTErGdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX3tKlar0MKHm9
 5nPxChHXwrrkqw0LtTXn2TyZp1Ksr78CGX+k+M3nj6vd+C1iax53oN0XWxGJwumMe7Fb2imkhQp
 FjEeNBEkUKVzV1jhysf//vyUW/tJL5DCUMc/o+t1v+6CHeswrhVR3+Jfz96fRMEhUEnNN03iVKc
 cYF5ls5tewmMDOBokD2kVRf/mAfrmGTv01XI7doqSNGOZIEanUh/B/YdAYXSy/uDFVVAyKYrJ1b
 RNshnRC3kbpSx2wunnGW6dmTJY86fZo1YZoePg9ZhksiyAnSwh/k9rMOtcNqGkdIHp6ekIqxLiw
 55+VdlpQURPNiKtBFU9N4XgXD+Qj7zGU6oK0hUd/TGhE60vCv7UFKAFqn+H6GhrEAwjPylcnxYD
 5p2h0v93MPAVftCHjM872VGV04qMjlROiKLdjDIEywwenVVSAqprJBY+yhAdvkO85G71PDMV
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=68824090 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JWbiWFiXhu80OzE02/OSSw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Xs_gmOcz2JqXoP2f-ooA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XEGM8y1xtQFSb8CWJrMIO8GkjqTErGdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=578 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240109


On 7/23/2025 5:00 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 30, 2025 at 02:20:15PM +0530, Kathiravan Thirumoorthy wrote:
>> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
>> first SE, which supports a 4-wire UART configuration suitable for
>> applications such as HS-UART.
>>
>> Note that the required initialization for this SE is not handled by the
>> bootloader. Therefore, add the SE node in the device tree but keep it
>> disabled. Enable it once Linux gains support for configuring the SE,
>> allowing to use in relevant RDPs.
> What about documenting it as status = "reserved" + comment and then
> enabling it once QUP patches land?


Sure. Let me update it in the next spin.


