Return-Path: <linux-arm-msm+bounces-58730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D936AABDDF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D68C84E506C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 14:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81680335C7;
	Tue, 20 May 2025 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bAwQZIKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA322DA15
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752337; cv=none; b=p5J8CgfCTR0LvLf80lnSgMFJylWY8+s6lgsmw7zL34JAZTKj4WFYRzBS+4xjE+sfJwUzD/BzGYDnhkCGVpnI9xwvzAthn/SXeJuBasfQAhOARrM9paL88A4GYCGos60JhN5TLLw6Jr3SbAjvGSVtF6AhFel27rhmCp7i9zH3aW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752337; c=relaxed/simple;
	bh=AhpNTohfkxb/6HCtk/2e1VKzunmWW2d5HeDbWYTrHCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoYW/dNGcNO6VMWlq/T71uhI9wSkooVOWvk72Zf39VkGL+HWKym0WkPNoZp6WzmGYsjs9Say9YBxIqhHwIPa06uY1zdtf3dv9xl2eKaUFIPYpaNrNTKGIH7EuHpSoXeR3mf6cENfCrnHD4nJADybqDzGmGPJCkndLFV+wy//x3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bAwQZIKV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6HY4c005909
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+UYVkRq7QWAvs/4Psl68WMbM9V3F5w7kl8Oo8qj3QE=; b=bAwQZIKVGRjy+y08
	agztzhNXUygFJYKi4dG8FcP9GA08H7BOQZ3vuq4x83WynM52cZoMHGcIJoFUvYXP
	OX6kv0tSz9WkFavzxTVAq+CYQk+LBPxWQRVbPCEa0hB9pKib201ZVygkmTYSYdeJ
	lLuyMjdqx5FVe0ilJ8H/6ORr6k4UMfIxgV37qr7lmmSvGw+K+7SvtgI368pit6lE
	DXEwLlW0qZdCzKKRIJLpU90C5ZTjoRkf8xR87TglFqQROazOvhHAi+fmKlKoJCRr
	kyeoC0femN2IUnupGSlgaOjUWS1Ko1qwvlaT5wbMYGmXUyGkb8BluDa/FyEQ8dd9
	Y7zdRQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm50547-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:45:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d448a7f3so41623946d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752333; x=1748357133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+UYVkRq7QWAvs/4Psl68WMbM9V3F5w7kl8Oo8qj3QE=;
        b=tZtSbGV7Agf0oSrDSZctJVTH81HNBFogF+aXSOleon4ctqOULG3aHk7M73vBHrwaFQ
         xloHsE0VMu0HuU7Xm54Q3TI3yZt736YwiytBB+xK8xePLd0J1fmbm3YJMOCeLajfyJZW
         AlHZzPVQzCEJZbIEc3y0CQ/es06H90Tpr2J5spYUGDkH1R8RflG+rw0yptI+VsZVefga
         b1k4H7DZC3UCpudb5nt8yfeMHNetPdj22zc/dm5UB1ftM9PP2/Aq75+xtnUYFL8VI9Id
         asNXM71d+6/gwEYlqUryHX7W6Fu6eEqQGWXgTEMqy1PdFldBid7cypughuZV2BZc0oAu
         RaGg==
X-Forwarded-Encrypted: i=1; AJvYcCUIGiY8Wsu0GU64GN+eKodsVKpwTUhDaSpgy7YNjfDG/cCRSUll/YKqrAKj4Nr8lZ/U4vT8FdlmMXrsaPD4@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8TeqG5aMu6T8UP8ixEjUEBYK7ukne3A+Dvqcm4AfaW3JcAyG
	xhvsliZphjdkYaSkF7HknHpCKSfzL/7NuSYzssbEZPE41v8nd3WuUWepJtkF2Dl6YRo6yltWas7
	1xv/asCw/r+hcv3oHVWKFCCAZcs0wLF8MAH998PMSDTEufBjTFWhehjI7OyHfPJ9TPY8c
X-Gm-Gg: ASbGncsD4lbSfmRa1Yg51vA6QzouUiI/sMtc4eZES0owPVD31PQR+njm6fH2WXShGFn
	O8REgAZkvDJ0Luq7R4fANp9HpklUhBC4gcThYzoDsBagLYN0FeC+dSgHO3/MxJH0roHn7OFCmMf
	LW2Ck7Rhrili1ai3uT8t5v259jh7/52SXueMnXCP59/mFLhmRHjEQf2RCbKA+6As2KSzzzMTcHc
	lsOcbzFMvBLDl+J51wlYvuQ99fYPdQOz/fFJA/nW1BfeBSVutifICKKs1yOIrbJFNluLWBWHDmt
	uRckiuKv9PeckQ9uctINInIIrHv4xYgiMCmcalF+eqLF4sV2HZj/ZHqQYut41DuP0i2A
X-Received: by 2002:a05:6214:21a5:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f8b08cfaf2mr302480786d6.38.1747752333389;
        Tue, 20 May 2025 07:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgeJAE3OlzT6P01yBXck+LegPxtMNuwI1oL+8K4BLsmkQnugoNimzkxj/J7I7mt6VdI/ZWFw==
X-Received: by 2002:a05:6214:21a5:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f8b08cfaf2mr302480276d6.38.1747752332995;
        Tue, 20 May 2025 07:45:32 -0700 (PDT)
Received: from [10.153.41.224] (176-93-133-115.bb.dnainternet.fi. [176.93.133.115])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085d0dafsm23934011fa.109.2025.05.20.07.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:45:32 -0700 (PDT)
Message-ID: <22c32283-768d-441e-b392-bd59a102f000@oss.qualcomm.com>
Date: Tue, 20 May 2025 17:45:31 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] SC8280XP SLPI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
 <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682c958e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wJfVPMc1y4yLOrLMgEZDyw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=6qslIKx09P05B-qpR40A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: AD65r1u7i_z2Iefaz1clsyipTzyQvvb4
X-Proofpoint-GUID: AD65r1u7i_z2Iefaz1clsyipTzyQvvb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExOSBTYWx0ZWRfX+NhI689U68Ib
 ZdRy4a/TvVPwiQQTBqshA2+J13nMsc8LDLjjbW8RP6Twc8/iJRGOhugV/1V+7wrma8lG//jZGLw
 oE2VO8PSFdL7cCGrzsOnpV2piFUmGYMGwr7CF1xayScxxqiDEosAPWJTfxn3rSouSsJoFGtcYoY
 kpVhZf4eRus4nJu2OXjabbOZaa+bs8vAJut13q64B9d2OEkx37oVzpyb20NroDPPnnkCeMcqUkt
 sAgD0+KPEhBnv768y/vzbJSy4fFmCiQDDxeEcoP0CGtJzFGKkiryvRRoVJR7I0l7sz99B8A4Jcn
 x8fPjLLCuicHph0N1B0pbZH+o+0//JTX8jCh6ItNgV69bhI0XJbiUliy0Dlm3d0iNj+rDnCSres
 en7TJPDHmugLEF6yd8YMJ2V2cDE/kXyXH1iYrnKjETOxQt8b+r9y/d8hu/TPJ5QIBw+MUqSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=833 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200119

On 20/05/2025 17:29, Konrad Dybcio wrote:
> On 5/19/25 11:35 AM, Johan Hovold wrote:
>> On Sat, May 17, 2025 at 07:27:49PM +0200, Konrad Dybcio wrote:
> 
>>
>>> Konrad Dybcio (4):
>>>        dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>>>        arm64: dts: qcom: sc8280xp: Fix node order
>>>        arm64: dts: qcom: sc8280xp: Add SLPI
>>
>>>        arm64: dts: qcom: sc8280xp-crd: Enable SLPI
>>
>> Without firmware this results in errors like:
>>
>> 	remoteproc remoteproc0: slpi is available
>> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
>> 	remoteproc remoteproc0: powering up slpi
>> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
>> 	remoteproc remoteproc0: request_firmware failed: -2
>>
>> but enabling for the CRD reference design and requiring users (read:
>> developers) to copy it from Windows should be OK.
> 
> We shouldn't expect non-developers to have the CRD on hand, right? ;)

Non-developers without Windows can extract the firmware from the 
corresponding cabinet file.

-- 
With best wishes
Dmitry

