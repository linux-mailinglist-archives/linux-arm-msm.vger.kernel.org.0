Return-Path: <linux-arm-msm+bounces-82844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C48FEC79155
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id CED9F2A758
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1552D3EE4;
	Fri, 21 Nov 2025 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmtO4nFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fce15ato"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C921C5D77
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763729669; cv=none; b=X03bW/Tm/Bv/IWXJi33ESHb2kcMHoSr2x7gI8jAhZ+aMUjrBeexqHg4xIHXPfxkGr2d9EfIqSMeZraq8RIXeh5OUWg0ogV3drUZEQoQ4udg4+xekh0A12SjqqgxUA4slB4X6Rhp5DvolmvTfwUDg9zKzICGabFjdVgyj59aezjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763729669; c=relaxed/simple;
	bh=jVuZeqIJPuRY69ksXZnPJ5l8CQoYNnbXfkb2TdQRDb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lEwwfSt0MXVHpLlLgCNw+yeM8hsWP6V8x6azmrvJuM7I5hCfyPthmNmz5Cn+2jlidnkpuzcP2DE+zaUaXlerV1fQzI7KjYN89dIdu7EJi09UUea9LotZdcThksicnq/Tjut0kV9DPXDIVUGjpn1SGVB5EFiu+xeGDpATvwdsaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmtO4nFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fce15ato; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALCd45Z2831879
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FhMPoxdlez4+CWrNaVQRl/0LbheuMl4b2SYASS4lzbE=; b=YmtO4nFwPBX2XSU/
	ZILUVU8ID0v538HSRbI7nTfpnPqYA404x2kbrAWTaXcZ3ZaZUsC/nFZBOQ5RGG8/
	j1lrWi4Q2UhvhLKJJDKRIKOxIo8TBPgYnIfv0W9ZhVUvaEY9GrV6tSXQyJ/YdC6l
	TRalHDUc/rFznt1ZN344idQAlelIx+7CDxXbwiN2bzk3vaXMx88XoWMmBqzP9VBw
	FWls9DjncRH/s/Xam7lsJpLrO4N2zx9Dd/S2LmF0BNdtugr2YSFBqAN//j8hGoLW
	Ghgb/eh67IYSIR0E1cksa/ECfE7F9Ovr9Zhv9MDAQiGmAiG+dwyiscTcX69f6DnM
	vle9sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq1e6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:54:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b29f90f9fdso50773285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763729666; x=1764334466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FhMPoxdlez4+CWrNaVQRl/0LbheuMl4b2SYASS4lzbE=;
        b=Fce15atoFKnGdDRW2Tioe0vGe4D3J2mjpAQLp8VIY+io5lq6DiHaAcMlGXSgCW8DLD
         uX2fsuAGDVqxMk6omhzZtLEXYw4cnChKHXb7GY2IYPPwJJESTiNR3NE6EOBSB7afMTKC
         3yJwC5IT4Ws8Fpv7iaQtzl5qd7JFhCBAmGEMbUSyNOw1R2Uv0f/+CLkI7EjV6WS+/Gi5
         N5bUjHnfrFkfbWSjs4ZGxZEfjPRpFIkQdPqK8dtBhYT7/3+SZurosWWOySpEzF5pE5wL
         vWRfUQjgu6V/blEExW+xzoy+QsHYUwgfxrPTMIsmaWuw9d6wr0OJmQgGj6O2wnY1WjNi
         9YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763729666; x=1764334466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhMPoxdlez4+CWrNaVQRl/0LbheuMl4b2SYASS4lzbE=;
        b=eK7BHqjqaR+XYndh6ddK8SSjfwXDz4hrb5A3iGEfh2kShHYSAp8SUNuqSydRecDGKX
         SHncK5YaDSvR4h2QQJG5lEV2HnJMMqL7BoJ3VADUzTsT8HJtTd4Th8tScT+xpxrxYxO0
         G2ZS8M3d+I6+l8uoXKXww3sFBy/xETY5QwCRUS3YUafk5Qh5F52URUryVgsft7W7EWF0
         Fe45hozyBgalP8pYce1Mbnxq59H6Wz+peBhDYir0J6m9nVeuYUMLidSdozsJyQDrhhpH
         rJ46iammBmW3hRqVHEqUQ28XsOR91+OZ4oFDo7sOzSQo1+XUmzVqquo9XpcqajaO/8Q5
         XmVQ==
X-Gm-Message-State: AOJu0YyK7D5vhFUmydWTcT/JB6gjl1CPeEYCGMJtPTLAvPZSAGvCWLKL
	E0I4CK1eJWjOnl6xeTfkstUerKXj+EMF24mYCa1e6B3xyXNuelPoAGoO/52IgBqKPxGzHDnWQbM
	sLcp6wPAOHUfUDlWUaV3KrYBvSCvMoWRLhBch/jIIRl8MRtTXK3izlmSlWMKetKQJ7+tZ
X-Gm-Gg: ASbGncs6LoRD6aBa6szmFA0M9Pe+kh+36UnoJuQCVCaQGzMGOBTCrBwhaRZl13UGnnf
	P/TIl3At29UtPCo+uz+BG8x71b2NWenhlFWQ2ZGLgYCeBIGzmd6CB7it64jw1tGRPth2KoYBYXB
	0cbNqaTyvaaRROPB03ieHA8/DCG4+FdC5fGEfIOIal0cGp/Yz3niJfwOkaikirCHruHyqrWV3U9
	dw+nb96m89iuLNGAC04yW0DCAnIn9Myo4t/uOdIPmhM0YewMMA6OZE480214nkTALEt2ssH3jqF
	+bP1gqw9LDg5kJ1S5bky1aSk243HXzYrtARaQ3pQ94mm7rhqaDz0NK/xP4covuK6Ho+wnc6QzhV
	CyI5YOukaF7lMsT7+72x2OQBf02e0QrdyJ2jK3xf2KPUuPXeAkvOiiVAJuCrwc2UHF5U=
X-Received: by 2002:a05:620a:472a:b0:8b2:9aba:e884 with SMTP id af79cd13be357-8b33d27431fmr154633385a.6.1763729665820;
        Fri, 21 Nov 2025 04:54:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFECWM61gzenA8R/lneHEi9wkcYGYwMMT59QCQAJgcn3io65I7+1WxrqvoG4Nc9mitfbMTCDg==
X-Received: by 2002:a05:620a:472a:b0:8b2:9aba:e884 with SMTP id af79cd13be357-8b33d27431fmr154629985a.6.1763729665256;
        Fri, 21 Nov 2025 04:54:25 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363ac9a2sm4514512a12.6.2025.11.21.04.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 04:54:24 -0800 (PST)
Message-ID: <340f121f-e217-40fd-9a84-68896d15fa65@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 13:54:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
To: Rudraksha Gupta <guptarud@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
 <20251119-expressatt_nfc_accel_magn_light-v1-3-636f16f05cf4@gmail.com>
 <161da2d4-3306-4251-addb-cc9822a112c0@oss.qualcomm.com>
 <573b2293-7b39-4c68-a51b-ecd5b62b0ec1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <573b2293-7b39-4c68-a51b-ecd5b62b0ec1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qnSdWxSXkOAj-_hGykAYeKoEsL71uCna
X-Proofpoint-ORIG-GUID: qnSdWxSXkOAj-_hGykAYeKoEsL71uCna
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=69206102 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2dWhQ9a6AAAA:20 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=szdtHcNGJkfY_GhBz5sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5NSBTYWx0ZWRfX+QlhjqeA6Iz1
 wDj6t4+pSKeUc8CvV9WPPlqrTFbJSs3YmhmZFznMYn4nYSN6/KzxpI2OXipUVovtKsnv7VPwzNU
 JMUtEaJDkzZFrM702/u+LRTp8db9ANYxrczBfFom0BJXsxxzen7T7u0Gt8mQIdGkbVBYvD/E2TX
 rMPCCzH1XLD+9+IbPRFk/N2ckEoQn2ZuP2ROEeBl+eI0QPysY/PG3dNSUm8vzWjIIbjSd0eFgxN
 8B50HGI0jqVdd3VjNp8Fgek7BWqptTKxrjPbKUrVGnBQ59fc64c2KsrDuxNF3v3S5x36Fld/26a
 rcmXVui2RT1WYZZnnaM/5cXHCF81iR2QSxr1FgOe6EumB407oxVHco7wiY/uSHitf9pTBK/LyX2
 Yd9HnoWIJJFsD7fIkrqkyRrQ3KDnlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210095

On 11/21/25 12:35 PM, Rudraksha Gupta wrote:
>>> +        iovdd-supply = <&pm8921_lvs4>;
>>> +
>>> +        // TODO: Figure out Mount Matrix
>> pmOS wiki has this:
>>
>> https://github.com/SiddharthManthan/accelerometer-mount-matrix-generator/blob/master/rotation_matrix.py
>>
>> but for accelerometers.. shouldn't be too different, I would assume
> 
> Unfortunately this seems to generate a broken matrix for me for the accelerometer. Downstream is also useless here as I believe Android does something slightly different.
> 
> I have been trying to upstream the pinephone pro's accelerometer and magnetometer as well ( https://lore.kernel.org/all/20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com/ ), but I'm just not sure if what I'm doing is right. I think the easiest solution for me right now is to get the screen working and use GUI programs to figure out if the mount matrix is right. If you have other suggestions, please let me know. I'm all ears.
> 
> But since I have your attention for now, I had a couple questions on trying to get the screen to work:
> 
> - The pipeline is MDP4 <-> DSI <-> Panel, right? Any information you can give me so that I can try to get this working faster?

Yes that's the pipeline

Unless the MDP4 driver is missing something (which it may as well, all
hw since ~2013 has moved on to MDP5/DPU), you should just be required to
come up with a panel driver (DSI init sequences, poking at regulators,
reset GPIO(s) etc.)

> - Is IOMMU broken? It seems like I can use APQ8064's implementation, but that's broken since at least 5.10. Should this be reported, and if so where?

I don't know, this platform uses its own arcane driver.. +Dmitry?
If you have a bug report, please send it to linux-arm-msm

> - I see Adreno 2xx, but seems like there is not Adreno 225 DTS compatible? Any insight here?

Adreno is a separate HW block, you can/should get software rendering to
work first

Konrad

