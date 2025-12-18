Return-Path: <linux-arm-msm+bounces-85685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6DCCBCA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB7F53031CDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AA6330640;
	Thu, 18 Dec 2025 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlQkp9Mw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4FdA4Zl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C0832E6BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061004; cv=none; b=EcVqwMkHznHQdJ5cOyWfY05cM+5o2FdTeykvEAco40oDJBJ1KUJTdEFhH+DCDU44ZnYA3zKLSTXRNWuYpxXY/iolgR+aPIlyJ81z4MYi6u3GQdgQXedejl+btXCkWCgqiitcw+Njd8GEnpyua/WVb4qo2IUNPZdhqSD7913xN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061004; c=relaxed/simple;
	bh=Z3GYlgaczE1QLRU5rK6i6GanndeMW8eYR6R7LlT8Fg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZk952Zrtv13quh/lmCyJkJKETjLIkxcdYBPhy3vnkqMNFtyUfntHUrTG27vXkOBXwinWdjKVPYv7PU93avHKzvndiKq1QAu2Kq138A9t78E/vlKd5TsAuAs42pCByM9xrzBXJMnlBcKpnuKj/KOTZasqKALqoyywtCjGEvg3vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HlQkp9Mw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4FdA4Zl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI99w2c167313
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JBSuSadJBaxbqho0TQsSNgCNangw5M6GIUZheKLo+8=; b=HlQkp9Mwv6HrjkGw
	QOMVBG4/cfwtUddvSfQVmmSuZj+0ZTByBXTgnKA8VcSk3ZvU57Ca/8rSoKvdO60A
	7xd9tLIfqUqBkd8RdjElGfMoKZjtNQyWbzJoD/ktjW61AL7ySi2IO0CuYo4hmQQI
	y2gxVNJRdaxgEXYaZSr/y48OeZ48rzVuCn3KrjXjoZpIjtr1ISZnqGiTNPlkf7UP
	faK0muE6Fy82pUSY2WCknQoXPLLiofwjVidV8x5IVgwZsckwlRb0eVoGmges+dsy
	v8th21EKANfBai38DPX9zekjmWAjTfXrRMjL4a/QSNTyZzrz4mv6PZ4nmgTkbRGp
	RDlfXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45w527qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:30:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f357ab5757so2025081cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766061001; x=1766665801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JBSuSadJBaxbqho0TQsSNgCNangw5M6GIUZheKLo+8=;
        b=M4FdA4ZlVj3VyHR0qu60H9/+hlUdUEQVrtiNRRmB/5F6T0EIdnxybtKmrd1DY1PtVt
         Z06EYuVwcvPUc+gA1BlUXumZdC/r254DHdltAZTfy1xTnxDVfuiTSXJvEkRRy8iBco+8
         FUiTYtJvhN7B3GAfViZiT6CSwGIpkhdhCDXG0k4rI9ZQyvFSMYUhbbzUDWHhECQ7bh03
         iHKd7t9KiCGgWwcQd4cqkHlGwT95R54agx/evWLqIXQIx+M5i+z/dajETqACpCvTy9qM
         Rq9rjRUJf7dalR9SC/OlM5jNC3F4O14xLZPZq1wqFthClgJw7W+0Wx8bpL6gtg12g1ZP
         zKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061001; x=1766665801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JBSuSadJBaxbqho0TQsSNgCNangw5M6GIUZheKLo+8=;
        b=LoGD2clGM4F1wzOcuRzhtIue3Kk9XD7drmzMVRWaO/mtwum3E2Juoc0hMmMQ3c+R4R
         K66jgaFanS/XZOFNHHKJcbk8nzgYsflXcviYxkUo2LnPYphvPXbGrZAunu6yxwvNp23f
         KHsaO06x4KiIt8QTiZSA6XoNyC8RfDhQfKuEQ/gSmFiiiCOFujbV5BREx3Nh/Xgi6LGZ
         8pBPMlKh3AFUFgG7SEcog4mw6LIhojSQXX+GmTIPlK/uVhQ2/TtePPl8LAubeagU5NsD
         OB2OI2NxT5TYI+NBIBvOAyro6yTuZPkvjDYpo3IkBUi3+psMkIGMXHSZlFXl0QtaZz3M
         MydQ==
X-Gm-Message-State: AOJu0YwRzYULrghTjCuS1E+898UsJyVULSV536Ivh70NxDnDAVapDKHI
	JYCod/4F61t6SVnwVOh1JhFOiyNysd9vvSXoardiclIyUF59gEoXGjLJW6OEwJ0fj46EgHXsaPX
	jb8ETwwu1ezKSrgBiCQ9N7lm6u0eQrMFEG99sSCuiSei0p7qscOICvIB0FIj0dIEni4kPWGA0fx
	/+
X-Gm-Gg: AY/fxX5m9ejkI2eee3NWantcY1pH4xkljeOjbJqvZ5mn/0LDbV7k1Hu+LU2bdY0mPVA
	LDwBoRaSMqBTjgKWgVKStAByjv/h+yWxN0FeCXrJYmjgcqbkBUivxjH28Z6idQpGH/iU0q35dLA
	RIg2VxX5LYcH6nf44lM866gwEagvx2WVEmYMYF5GmQ1QVaqQYWcY5eM7vHxSRIT76Toejf4FKiy
	Orj/0FDjU4BUyaHCP5tRnRguO2kWxa7Oyf4WSPdjJ91ytDgt/73Lt8IreuLqJyRA//TGorz4kq7
	0B1GoPybm7mJINIek+HLCJW7zlShMKzIEukU+VENuoseFe4npg9jNv/CThyj3WIGUUXtYgvT8/6
	SCJdDueAZONSv7G/2QN021DPJMubXP+GiPzbVx/5sUS+gj0DX24vZw+xAbGKIMK7HNA==
X-Received: by 2002:ac8:5d07:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f3610a9089mr19063001cf.3.1766061000531;
        Thu, 18 Dec 2025 04:30:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDcXtxXI+nmW4Iy4S8rIekI1G8iOdyV/+bKzZkbm3P2+fhPZyOem3P5hy+luahFwZYOHcZjg==
X-Received: by 2002:ac8:5d07:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f3610a9089mr19062731cf.3.1766061000037;
        Thu, 18 Dec 2025 04:30:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f93e99sm218890366b.2.2025.12.18.04.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:29:59 -0800 (PST)
Message-ID: <c47ab448-7091-4c42-842e-12ae88bc8de4@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:29:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
 <20251208-b4-battery-hall-v3-1-84e2157705a4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251208-b4-battery-hall-v3-1-84e2157705a4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8LUSWFavE4aujtHJgUWjbSJLP-LErq_G
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=6943f3ca cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69Il93vAAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=XMUF6w0cWkiwYonXWGYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 8LUSWFavE4aujtHJgUWjbSJLP-LErq_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwMyBTYWx0ZWRfXx7wzmFM4jMsR
 GnUU6SIZ0p8iThFAWevvpLdv4aX7VxvzqFDvvNGY0eR1LAhQ3f8fQNAXNEJNrohlKZQEPOZcYe7
 N2Rb+vUkCtb25L0LEWLefvnitR639LGX++owMTRQ3CA0ngrJM3lVg6hb7HJhMJQxybj/8VNkknK
 uwhn1Q6y8SABScjZ8FQOy+XxVpbnaVoAD58MfSA334FMN8+ABnDih5mG3fsoDfY9Tjk7cmCcLka
 rMVZctNHz5hr8Kle6Hw6+FBQ8Iyta6Wf9MgbzKFibejFMVELD3SiYCtZ3qRywG3bY5tOBbgi8iX
 a2yrOJfAjxl4zUy9hGJToGXglOuxEIT5SiPGeOwwZJBKV72JJS0uP+f8Ygf7byH1ZVTi2jpQ3Gy
 v8ABzXWOVHmlbTdWeH8FvuHpzNdwMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180103

On 12/8/25 3:59 PM, Erikas Bitovtas wrote:
> This device tracks remaining battery capacity percentage using voltage
> mode BMS. This commit enables the pm8916_bms node and adds a battery
> node to track its capacity. Battery properties were taken from the
> information printed on the battery itself and downstream device tree
> for a battery named "nvt+atl_3000mah" [1]
> 
> [1] https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_1936167_3000mAh_3p4COV_VBMS_Final.dtsi
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

Amazing, thanks

I checked a couple values and don't see any immediate issues

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

