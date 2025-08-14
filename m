Return-Path: <linux-arm-msm+bounces-69186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6308B26151
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DFD57A5918
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F0D2ED17A;
	Thu, 14 Aug 2025 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9eY5ndQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA2A2ECE90
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164788; cv=none; b=HEtW4Gpdhrzn2hHlly0Mx6Q6E1+ImkEKTSVbxzZhkyubRJ9x5fWJg7UujHoezA3h+g/w9szHPn8snVepfqN6hjwczbNzQusylbpMi4r5fJRregMq2K7iz+ODrS0FF5I2ldFuIS+HQxW/0a5Ri24oZgbYSJ2dbiZDmb9W+7ZXSh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164788; c=relaxed/simple;
	bh=YOPD3+ykr9tdg4N+rbw3pZv9DIXcmhCUR349Ger2yqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXdbO078hAo2ei6eF0VzWpnt+nKWpQtsEorbajl/t/0Qxv8Lw05uPnEpJI4PcJjiuOHz1/T3KTfVu/pfAm4ovrHYgWeeAdcnuPT2NUDB1r+772RMA0VLRuKSyc8iR+5CBGRchdtB6Ep5mCgjJYrewujSvuR3bEslO0Vmp7KFeCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9eY5ndQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8vVBI020683
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rVPjIP0yMiJ7161uXl004pucArZ7+8ApLEfvy0PWY6o=; b=c9eY5ndQYYjG1LG/
	VQqkz+NqQ5jhHWTTWOyo/HM4SjxUobms1lyhpK2O1059TiCKB//N7pDBZ33+oPT2
	Drd0U3QTKyVSM38U+fg4x80SR/FN5SCrunHeNm9IEXKXTyp+qCePCXZjjtxLG4Wu
	SgvPWZjjSmpJUXh9KylUW870Q44N6+/6W2RQffWcv7vGfBKPUFNUd413ks9isQzh
	YWyns9OQkfx8QoArw1FpwOOafGqH4AXIXCeDedAjANYWtMg0jYoxJPWWO4T9zDZF
	ZVNLOy/+GWePxJ9OF2gjqdv+Zn2SbmLQehyHQ8NDQK3G44pRmFNQlUK7oHHx3NzT
	/G0lpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmf69m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:46:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e87031ebf0so20573985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755164785; x=1755769585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVPjIP0yMiJ7161uXl004pucArZ7+8ApLEfvy0PWY6o=;
        b=sZoXOR+khU7+iRhBHoVhDZADXc+XXexyKFjKnRkEjbJ2jx2v2SKqQZRwoTNIUygn8a
         XqSRHNEqPkFhfnSf1Yk1Xzj2AtEIwI3U9NsqR7+wXE2YabrejGpayiZwxlSpwszZBr/H
         Qg5PRUPIIpgcnBxMHqil503qrSUX2qzWJru6G8f+bdOVUSWQyDIZrxhflLx4yd4DYe+M
         zRXbH/56sNOdJ1si7bvdVmoxRxpICEZHZBPchKl/HX07nMjzhD6JqLVgV2r8RG2c94lD
         M9m8848J28w11JqxM8MNs39TCBrOm0oOSSCo5dbzeQd01hT4awtMIkiZrT+me75wKabx
         3Pqg==
X-Forwarded-Encrypted: i=1; AJvYcCUEXdx0pGnEH6WswG5hK//bET1Gs3ENXoOR/OA6iRufpmVQAiD9JsSj7E53FicjucNxrE84H4YpU0+Lds57@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6ziyniztbURLME+3v0VPfYNzq3JotW1N8MHhwBS9h4hwfCEn
	JrBPeo+6yF7TchgGU3d4kQpcJkhNwTJZNcU4JA9oHHG5/Wykas9DNa9aPiJbFXAbXIAy/dvH3+u
	SJfJlDqyBC2s7jRrIy2gOz0ElRbFH0Fm3PT5ku5mYrjXt3avw97yxht2EuNwgI3Pn5Lvo
X-Gm-Gg: ASbGnctbC8XnVaqG1NTVtfi5goTyzZL8SDaSFFT8s7qykBzN/ARXWjc6WGoOrApQm3s
	BHdc9wlekYGRf4RROCrLJ/zUz/nGZJaoywJwDpdhMs5aKmUspZSvuK2aQvKgDD0EPOyLpJqOGEx
	+U7NqImD+iRryuTEs9GIQu33PR/h48Uy+61/nUzkx/9r1bkcBfepcFFgIDIqc3K9tmFRG/8euhx
	lgvneP49vbRqYZeLG8YbLBZiPSp+3waVIHJoMG1fgyzKgGMsKfdSMGzWEy0k9GXk0Dqw2Pmv4qn
	UtCFVla/g38DEIO/LG6BowOsokwwSKeTcM/hamLVlMwZ0Afm0zQ42oBbKzHb7dXB+hU91jXn9wR
	9t52MhL4KtFNUoGGUVg==
X-Received: by 2002:a05:620a:4009:b0:7e8:239:f842 with SMTP id af79cd13be357-7e870476a4dmr154620285a.11.1755164785005;
        Thu, 14 Aug 2025 02:46:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk+rLGT+zfHa/tgAexCcnh+96WIw8Fih6tIlfDVR70Fu5cDFYRswuXAwehpEUOb+at3084kw==
X-Received: by 2002:a05:620a:4009:b0:7e8:239:f842 with SMTP id af79cd13be357-7e870476a4dmr154618585a.11.1755164784511;
        Thu, 14 Aug 2025 02:46:24 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e833dsm2550194466b.64.2025.08.14.02.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:46:23 -0700 (PDT)
Message-ID: <aa0ed59a-4eb6-4f7f-b430-4976ee9724d8@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:46:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dts: describe x1e80100 ufs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: marcus@nazgul.ch, kirill@korins.ky, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
 <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
 <tlkv63ccpnti367am47ymhaw3agjnyuonqstgtfaazhhptvgsp@q4wzuzdph323>
 <57ce520f-a562-471f-b6b4-44f0766a7556@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <57ce520f-a562-471f-b6b4-44f0766a7556@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX0twYhrumzAog
 TR+V59hDlqWG3hXJFW1UeLNmiJwBOXL56rLE0JnuYOvxZgvDwwEbHCWAhgKiUF/562uJipfKLek
 WK+10cxu+23ztnFTctT8c20qj9TdWbORp1WO05dRQBU1jjYo9z/51WkWyDAkPU20QRlcMYaZfXz
 KkNnRW2EizUF6w6+EwrDbxPJZKlHA3DuU0QCcGg0Ips0x33o0lzDabQYKJbfdAD9ooJqekD/MNq
 lY67nMq1dLYLLqgqZQfvAws+4xYprED6aBq9hK7zQaCuOgCXb65kfN3N9ZnQvDR4rAgGos4G6IS
 QP/6Se6g0i538ZvxKjakuBCqkora8Y9Fkq8nOpvMQIA5hMKt0/hPoSmrApu0qv+d6qUDMQ/D6Bw
 3SLwt6mh
X-Proofpoint-GUID: GS3Dc_RsXdqUoVwow9-WvIHVFUrFIN9l
X-Proofpoint-ORIG-GUID: GS3Dc_RsXdqUoVwow9-WvIHVFUrFIN9l
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689db071 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=tbUJWSx7DgQPHehloyQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

On 8/14/25 8:59 AM, Krzysztof Kozlowski wrote:
> On 14/08/2025 04:42, Bjorn Andersson wrote:
>> On Thu, Aug 14, 2025 at 10:59:04AM +1000, Harrison Vanderbyl wrote:
>>
>> Welcome to LKML, Harrison. Some small things to improve.
>>
>> Please extend the subject prefix to match other changes in the files of
>> each patch, e.g. this one would be "arm64: dts: qcom: x1e80100: ".
>>
>> "git log --oneline -- file" is your friend here.
>>
>>> Describe device tree entry for x1e80100 ufs device
> 
> This is duplicating earlier patches:
> https://lore.kernel.org/all/szudb2teaacchrp4kn4swkqkoplgi5lbw7vbqtu5vhds4qat62@2tciswvelbmu/

(that submitter clearly expressed lack of interest in proceeding)

Konrad


