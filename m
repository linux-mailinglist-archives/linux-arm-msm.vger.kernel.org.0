Return-Path: <linux-arm-msm+bounces-65552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61EBB095FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F52EA44911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A5C22A4F6;
	Thu, 17 Jul 2025 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnjB3q+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C67EEBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752785480; cv=none; b=dCGtIk9skNM5fip++hWIcpEj2guJNIhPSjq+bqKjHjRzqwLuMu/VZWzxyC5fHz3904G7vWdQshQzggVptplxH+35ObOCGsB4LVsbV6/9m7380eyriEkMNlWZYXEs0cU+9A7wsj17ZdxWG0gngdsMHi5sjZgWG6y67sO2x2+Mdes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752785480; c=relaxed/simple;
	bh=ZzdB0c9lS+Bqc6XkxukHQJDk6iL7AEBq0SCr9kWt5Ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAE6M8jtCrKMXUeDuoeT/3mP8JxNPjpo5ChyTB11dbLQBy89kHAr6Djdzyykgf8NbjNIwF+m8lk4B+GfJF4eLVNQwJ7QIXxf1wZQQ1QtI0Vi4Ok7UtmR9COPaAr5Caw32e+WvheTlYeEB9Y08q3qVicOV7xdXKsPOQ4AkcBQroU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnjB3q+z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJjgt9000567
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zI1GQsP3FtlWSvO2Fv/8SUzJeJc5OU5sQJ2EHFJlKCw=; b=PnjB3q+zCE/jGSpK
	vqHLp8hghvN2yGoF9XpPQXcjYL2X4IpoEK9Zg0W7DNfTwXFXP9mqfm7JchXSknT4
	oqlkwiUQQr1cx0F5L2DlhiPR2rE56Kb9MvKw0uyWUpHOjyB6jWT15Elms/N4rsJJ
	f+JY2CkGQCiVbxHlAUSTgjbd8Ec9J8w4vtskDWm2WIBcymwzvumavq2zxEnH0vBQ
	cl7XzMq1hMaU9ySLSelSDJ8iHPeW9c29RBFQ18YRvBIwnVhCsODBr5uPdvnbXs/W
	dU28SqxQGMZGU7fMVAjNfQEGTtbrbauPA7rRc+dfeUg8Q/hiECZmSTKjneIb+fU8
	+xSJYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drv71w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:51:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7df5870c8b1so28396685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752785476; x=1753390276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zI1GQsP3FtlWSvO2Fv/8SUzJeJc5OU5sQJ2EHFJlKCw=;
        b=IT6dCR/amJ5aUaBNequHljQ81JGzrG88AxTA6justdM41vUn4Z0rvCL8YUW5C57xcy
         fWeqD7wFyCPdtCt2cmtBU541ztTQkMjDmFc4OCvgbnuLYt3PGLN0zKx9/3wHZXJsr8Uj
         sZaHmXZRxcCZZq0dUrXlfcQmLF5hncHQngsB24SZT02sZkJtHsHzG2psKQCYfVJPLtTe
         3H7j0LBrcQWe1as/Wvv/gHG0g1sp1LknwRlEpGNr6/fcw6DD+/qPALqpbY/py1yniPAo
         OSF50W612NU+zqAeb/7o2pP/IoFnuJJCr1Wb8UBwOafs95e0ZFSpgGH3ebsPQONK3HOM
         gIpg==
X-Forwarded-Encrypted: i=1; AJvYcCWXUJCTW4Aj5/f/KbcZRn6owG/MsQYSPMLINQnw9YavQXMqjAjh/igI/KLv+GwlziIoQ5QwDWAm1Y+6Mnhq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6YcigYv4sw0a1Ereuz05hMStC/RfzZzom+eNc2EtV2QGpNRPj
	M70l9FtWQ/fvNKxuYQMNrYRzfEiZ5WrMwfrtdzLXcEyltz24fe6qiF4fDxOBXtMIP9GvZnbAj8z
	6x7SSffssN5sbfDivWH0wtZD6EY/VdhxxAeMdv08MJT4CPQdymXsMPl41F91hOh3lh9bk
X-Gm-Gg: ASbGncuJ45vzS1I+iZs/RyaqBvVatgIgMe6fYF5jBjISQ6biwHmd0zZFN5J3yhohYH5
	1tasn4+s9vqj3NKUCQ3JOQMXt6kXjjTb/i7CYX57hlOP6ksy5h41eejVyZCz2wip8vWYLGXZjIJ
	WZt7qIzxsOeA7IuUZx8uqJ1v6OjtU4sZpeL4/DerWgU4A1R9Vxy8xqhufseilScNfqtIdW2DIPc
	d/MxXc8omO2BCK2LQ/++bRvNcJGgnP1wx0l3fRGTbX9DMbR1qu0GeKex5IaRlbK0eXtlRuW5NWM
	/OjYKcPeuzrfSW1qwER2AUtaSsQ/Q7Ydybmr8mTfX0/5Q8yvrnS8Quqt4sLgM4aHeHFOTbdPK+N
	fxzrzL6GXVauNoxSLEl1H
X-Received: by 2002:a05:620a:288a:b0:7e2:5349:7da1 with SMTP id af79cd13be357-7e342ada387mr512191585a.7.1752785475675;
        Thu, 17 Jul 2025 13:51:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1oOZ0EIsupcE2PuNyin2lTsXVWnKq+kC+fhAHB0zn97Fx4BA87XhhMZqt3iqSgMkwZ2vC5Q==
X-Received: by 2002:a05:620a:288a:b0:7e2:5349:7da1 with SMTP id af79cd13be357-7e342ada387mr512188885a.7.1752785475094;
        Thu, 17 Jul 2025 13:51:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df540sm1406774066b.163.2025.07.17.13.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:51:14 -0700 (PDT)
Message-ID: <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:51:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A2fPXCctobdW22h8VA-GrVtJ0h9xWE8g
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68796245 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=JRR-jv_DfJOeuxYAjpkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: A2fPXCctobdW22h8VA-GrVtJ0h9xWE8g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MyBTYWx0ZWRfX8wDkkFnLIk96
 WEB4oVzdmSvuktBc0HYD8fSwQE/aR/mQ6Y0Hbc+stC3r27RbHwUIf1QRIHBoHd8PQGkp8iBRlu1
 xK7Zvr20vbq5QTJIHvzS5gzBL02UymGVDvV8O0IPa+ogJCOoj+NBUFan3/RnAU7U370wtlk6w/G
 V+Wrrz4y91hxl88PDC37VnFUKNYPkNrwSYcET8Lw5ZVE82egwaSUAq6gzLl0pTeCOBxfnTjuMsT
 KpE2Jjt4XUEDmzv6d4RHZXhHkSjScg7N3KBajXNq+dhs0A4tLsFTp1A9DQ47AxOumG8mY5NN7AP
 sx5JL3zt22TnBPJeGeVV5RMZJluBlBzVzB3vUql891EEt5p2BKLciZygy/TDgQpBPutdlHzZVES
 GzWyIP6gLVtCUS3mpKMoLpB7D1DkRFkCkIAREZt1jZj9Yhrg/SgSfkpVyYwzfNfOodMX3byV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170183

On 7/1/25 9:18 AM, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[...]

> +properties:
> +  compatible:
> +    const: qcom,geni-i3c
> +
> +  reg:
> +    maxItems: 1

In another patchset, you expanded 'reg', can you coalesce that change
into here, so that we don't have to worry about backwards compat?

Konrad

