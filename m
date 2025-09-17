Return-Path: <linux-arm-msm+bounces-73930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177EB7F868
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159874A38F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E732FF678;
	Wed, 17 Sep 2025 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjg/lh2C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD32FBDF5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116461; cv=none; b=pRibLDgqMkdqqoso2prraS/YlDoq4btSHK8iJyMnRWnbA52IshDc0sCsrPxxak8zDoiOb6vdGcl+oHt1eNhxj95ih1COLL1Yakfm2ffClMGk37F9/09HINZbbtY5mWDMhJqVjZ7ls/ngdV85MKtsOlkiuHbU5ZAAHNJYsbY5fCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116461; c=relaxed/simple;
	bh=EGQp1MRtDaRdckxs+Agp0v3ZnZQQydi1Ok1ET00C9Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXp4K28kPFs6hGv+iDEE3p4fNTZe+13m/c/UxEn5C7eH9cColrdvFfmCzHkUYHZcDiQ5wE0eQsGaQcMn3HMss2VEkju+9RyJEnknGEUPmQAjhHC0YKDpLBuhjuEjPcr6o0saFUxbWkhPnIXtpkAeuITP/Jwo+MuHrEec/6iq3pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjg/lh2C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XelQ010820
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZP2ryaTODrIgPU66w8ts5GJRn4q2asi0s3U67c1cuM=; b=hjg/lh2CTsnrdijW
	6F4PyhE9Gun6SYCCnH1eNSAo8BCAi5zfd9rbVj0kQtiXuGYhAOPfXxzhYIWNKkVH
	rNoyKYf8d/xAHhqNBgTezT4aSqxJFS+4/tipE6o8W34nz1d1g/9L3ZM3lcszhRQ1
	sHULb9pfbwNn216Io07Ka/7+6mUzX0bo9ZTHKW4KojJ5M+s5bjh1X2Awwq+nHwUH
	ZQ4pwqL0YxrkAld37EmwnUuSQFSF9RB6h7YCGc3AB5TUnNN+ePzGQjlLYynyRAw1
	rUAxhobXeguLVYEenmxWoKXTBt01yzVaeEPf3hCyNycr2b2JkYn7OZgLes1Z49YT
	TZr+vw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxth62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:40:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b79d4154c9so14426621cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116458; x=1758721258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZP2ryaTODrIgPU66w8ts5GJRn4q2asi0s3U67c1cuM=;
        b=Yfn1EWjRF7059bdWy6yfSHBRSL6IT0XzKW7m4muoOvQGIEJF5y4zXfkOfLGYxhViAe
         P814Uc0dFX62WoPhdFHelGnZEDyK28zWpLy/DPQLY07fXlieAo//uqEgIvQ6CI2jKMw2
         L7p5vPlE8jPyiuCHuqq5j/NOqnQMwGOSSHq9IJj++3PsryprdGu9YYg+Z8AORP0f/FuS
         lGkSBWIwWbzWzO552/yoiNsKdn2SDn+tJYb7NEiF2HVAH400SOmRhRZ/A3iuJHZ2HHCf
         LEtMEdhWVt7IoFX7c030qijf6T4BC1S4EQmgbk5CAlXKXV3GxjJYjkLrooUFJ3GQZGnb
         xhtA==
X-Gm-Message-State: AOJu0YwnSwUJ7feHqAiGH4MMw2hxBkBplcMyTLaKct9dCYrVf4/3OPCk
	wjbXWDlc21y/85kCvBd7JFOa7+zZhEbbPv3dpcc9zvwDmfbaRg30x93Q8H3n1iWeaWXjupihbhK
	o6m+Eo7XdWazppZnKvmPVhKEeMpWNCZ/0iXfugg/cPPZOdC+rp4PgRWaUFwPwlj+Z17gT
X-Gm-Gg: ASbGnctAfB6s2IFE3kNVg5/cVcDX1pHju/EL2sfkWaJ+qFmJA8bbgah68o6XEup3e5V
	tHeaPZmYhjW96BIs9ewqVxLk9MO8MEvEURZ+J1fmKoyUO5Rh6fbdFRaFYHPa0HAedPEHfwY/3nS
	sD5DAa6dU7LkkY6Eu9dv9A7SC+WLHKZgVPe5syjQIXxLgv7nCaK/nx0xSrMeyBVeWXjP7R91CyG
	jE4HHn5/KwR97eAiBdOGBoWZlZIatRP79hC6Wj5vsgATrY0nI0Cg8lO4CnQ55Zx7RXzwxkvEgRa
	KoGwi/0/MoJo2/fFkQRuyIXAicxNK+xBMd80t5NUrg2eB0cMmu9LePm5vUx/eMbQOPwt4wNAcGf
	t9PRJNpyIAGL6LTucGXpGVA==
X-Received: by 2002:a05:622a:1393:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4ba6ae98dcbmr15404991cf.8.1758116457885;
        Wed, 17 Sep 2025 06:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn9y6LGOJWtKLeHHI/lFu4DzeuqWqApyHZRrv7JcmDAID8zEmPUkQuNhNoUxGWDZ5xZBVV7g==
X-Received: by 2002:a05:622a:1393:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4ba6ae98dcbmr15404561cf.8.1758116457196;
        Wed, 17 Sep 2025 06:40:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f482a3153sm5597320a12.0.2025.09.17.06.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:40:56 -0700 (PDT)
Message-ID: <4428ea30-7324-4faf-98a6-b18eb16f9fc8@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:40:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] arm64: dts: qcom: sdm845-lg-common: Add uarts
 and Bluetooth
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-2-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-2-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9H3UYgmgGKVt
 FffdLuHwDL4zf3uzMqJmvpdFsjJJM9e6/F5ztJIkKn5RGspMZ+T9qdg3cw14EyhK4EPw1vvivzK
 K7IKl6nTBvT1pAqcgMpeduIztFs13N748v86O4glHBB/7NxqXGJUcRgfa5tvuzTmGmNqBcyAK2e
 U2T2wCYlwwvTG6+SXqPV+JkLff6t3sG4dpjrk2dHgOgOWCkSuXzgPMES0AkDvaQMuK3yoAkxc2w
 0s8TfuvbuYZXonfp1hKSiqclFXMdDEZT7uVIG+9n15eHH2od47V9pbp3wpewPXbsN7vLc4iwy+c
 6mSce8ilXaVUEExHgnpV9O59d/dkUpsCOYLKusdiQOaZT71lpcQ9W/5r7k8LXBmHFBI7OGgcHBT
 y/l15yg2
X-Proofpoint-ORIG-GUID: hEtmF7mjHC6ArfrEvo5qbuoD-nGEtuxr
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68caba6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=BZiE_1MFHw7nqvKuBP8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: hEtmF7mjHC6ArfrEvo5qbuoD-nGEtuxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> uart9 is debug serial on USB SBU1/2
> uart6 is bluetooth
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

I would imagine the SBU uart requires a jig or some other config..

Could you put that information in the commit message?


[...]

> +&uart6 {
> +	bluetooth {

It'd be better if you introduced a new label for the bt node and
referred to it by that label here

> +		/*
> +		 * This path is relative to the qca/
> +		 * subdir under lib/firmware.
> +		 */

This comment is a little redundant

> +		firmware-name = "judyln/crnv21.bin";

Is that fw different to other SDM845 LG firmwares?

Konrad

