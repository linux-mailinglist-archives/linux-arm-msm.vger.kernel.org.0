Return-Path: <linux-arm-msm+bounces-85705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 267B0CCC3B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91A1730275DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDB027F195;
	Thu, 18 Dec 2025 14:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDwRztqx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PP5bIoQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03F1ADFE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766067337; cv=none; b=afvAJ4YtPFClSy/cFOxN64bi2LtytlxHGARdmqAX6y4zRcl4ezIQyYbQm3tMoOoivpK3sGDJdSGAOE+1nNsVsqlmR17KgZU1VsjcjO+5lL8HtvHrv4CrTvzd87nmtGsgC01muL+JUiHasfG9FzdVuO39ELls3gJlHFcBvUn9VU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766067337; c=relaxed/simple;
	bh=AUlZo7y3Dg30huPVj+URSjyAVJ4n77mqF8dsg1J3LRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTm3Kp4pz1Tg3A0SQhN3kFPr+ilbNw1O8/ZYKE2qsTxQ86G2QfUVF91pO6d3ZdBP2hbA2KuvWJIeC6vYE5odUFOaZ0JPXSFKmV+8nPgro9v9Ntw5SjVfA06iVan4V3FzfIwsa+t7jV52QG+JRulFYmntyjHPAXm0ZjCqOsH3YY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDwRztqx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PP5bIoQV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8swUu680488
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=; b=hDwRztqxKISaGMoK
	Gf/dG1ZiXry4Ut02D7xPZxZliCA5o2rPP6mrOrfgywuAbbdGterfOx1VngHkTpAe
	5uf1hoAodELF4k4ZDZQZMTB0eXdpY3kAsX8ETVwJH25vrMuMfNB0fVJLZs9RUkRb
	FJAk4K+mVSQhMO5hdG5dvfEHcWHSAEWXKQO6nSQjHJDNFovy2hGh72VdrQTBtF6Q
	Hn4R3vRKxqSi2Y1T8T+uwGPQGioDrRibn6jO/pp4PHtggIcVKAoYEYaQlnP4VBJY
	gV4emCWXWVUGkIQslXi5A/dzgq8vEkAVLK3udcGNwZ+43P3NJelxm/4QE5EeKeQw
	xRTxhQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhjhvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:15:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso1701251cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766067332; x=1766672132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=;
        b=PP5bIoQVunweuw3+h/CgdgmxYUQ1CIIaDDPV+eZ/yV5UhFzVvwF96usS8wOC7rekKt
         HCHkwWOcMVqfrnKzJD29j/ZfVYBiEkL12y3JM+hHYMNdHWCHFHmmrADrEMzTQ850Nzwa
         hd1O4eZFdoKE0jd7XPJ39biMUxVA8DmsB5Sj4YlzkcuSGd7djRFAy7UjQU7MR6y0BEzd
         +7qvqnLY5iZJIlGLSJlIqsf3/ZoaraP2P8AYbSJWt3w3pgeNf7/A1vfjoGOH95ey2Xzo
         df9/UrIM7FSCOjieDclcpf1/Qf/6rJb86SD3DNwcgQ1CS7F0fxfeGLoDeN9gC1S0L4Sz
         FlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766067332; x=1766672132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=;
        b=kdLU+kD6WNskkBGqZpXMjmVN9aagO5zyozSu1SXvaNMsQHtDWNGZ6ttU3LsJ43rKHW
         Z+P8Rc87VJTGLuSrzMbuTju4/jl911odKA9y4QG+mSFvHRCdhEqA2f94ioYkzPK3evwD
         vM7zxlvJAZ8AOsVkLIiu88fewzJmtFWCscVNtR4ywoLBB3SHvGnsn2PQan1ZJEnlovv+
         RNj/Ex32+d2bYZvoxDF8M0mHh09rZpUYJ2QQoNhyOTZ4qYJeb/zcZ+I4vurtXu3oFf6S
         t9xGMbTy3/7ReWPDLS9Gr1JXFPRle5Pplyv3qJP/+HUvyeLPZb5AzJu9VrbySgOOWWg/
         BzqQ==
X-Gm-Message-State: AOJu0Yx4CSjx9WyGYPQF+Cis5pVkxeW3dWbxHGO+V83uK3PZX+XCCVFm
	78m1QOTy1Zjy+zZJqxHF0gzUgkMdtMfw/3XTmGBy+d0vSMFe6h3zMwL36xAIIpCtTt8kcESV9dI
	uFxpdTBQyPyj9KW+FL8yjXPPdLJzoxUlljrWnZwXBxG5+VXjx88VCSmOs69Gt68uxGOBk
X-Gm-Gg: AY/fxX5xzy6fY37UvnfqbuD+HehN+bVN0PxHQw4vpU9/v+ne8UhE8cCcpzZoOwZ60F6
	vtqIBYBoc9u8aWm8Ihc8iaIJry6kFsH7Hw5CLEmuNLT6WMy0KoJs9MJThscJXxW0DoecuyM+9MN
	BLyYLtl9RkMHXqOKPyNhOvgH0uAtFefOtCRBihPFVavCqMxSQy3VHqcaBldcGDoB+BprrjODCzY
	H8W7abbhcHAfL2694jZUsV9yZpPvt+3t0Y3MjF8L1f7/JDNZwaUttYq+54MWmXaNGZAicOUpjBo
	O0n59gOGLAmwgmCIqLSpOzXQkIr+jPp9wgH+h6kxF7zCMWmtbRsLOiVtbyDchVF4/FY7Oo+QrJP
	R+IVOlNKISqF7A4gv/t3VdAlA199xpvnHhm3RUgzgcRQDjUqUcSyTPyPBqpX+DQSeNA==
X-Received: by 2002:a05:622a:1b90:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f361189f54mr21475761cf.10.1766067332136;
        Thu, 18 Dec 2025 06:15:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbKcPhLTi95myOrrgVwOR7cxMWFybCHxSy+FkHP4hhMqvQyasR8A0JUNadn/IEP58AaOumew==
X-Received: by 2002:a05:622a:1b90:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f361189f54mr21474891cf.10.1766067331395;
        Thu, 18 Dec 2025 06:15:31 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80230d0e11sm241715966b.16.2025.12.18.06.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 06:15:30 -0800 (PST)
Message-ID: <438a352e-5174-4361-b6e5-6ff5fe1ce0c0@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 15:15:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
        Dale Whinham <daleyo@gmail.com>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9pvgPs-hArH3mmD8TMNdq8z7AZp2KrtP
X-Proofpoint-ORIG-GUID: 9pvgPs-hArH3mmD8TMNdq8z7AZp2KrtP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExOCBTYWx0ZWRfX7Y/bsbn+krIu
 0i17WI6tbbM52ql0TZYyBusL4Z1IO21ycDfK4B9X6wT+ufzYtmw9Fbq3bIUzISFYuhfz+MMYbSX
 dy6cc9nDqgokSH1I+0fpjCy4IfHFZYkmsQF71RbnXIcqP01L95XURRyhwNmIcM4lu9PrHuYLTPi
 S1Cmg+U4E2xP6jjzaBuzDyeYz7s5rqrzzR8OqV8ci4HEoafbpisUn9hDJoo1kfFV/IymQvd0dhD
 2M0Yi93mTqnr+JvN8vOSSSIFzkiaAKw9psPmkx0EUkH7AvTLH/BJTgxVb0hpbHyWE2zTAYEtaV6
 Vz2L2CPsqARyVfOgkMdwaHh1Lmu6erPfhZhTCJXbpNAiis7cTiYTkTDJFpn5jSvWEoNYrdnWg7K
 4AxCCp/+K2yBpE/0/blzMKAJ04Q3dQ==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=69440c84 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=Os-eGSRfLiUiT30J7OMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180118

On 12/18/25 12:56 AM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
> using its Denali codename.
> 
> The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
> the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).
> 
> Due to the difference in how the built-in panel is being handled
> between the OLED variant and LCD one, it is required to have two
> separate DTBs, so document the compatible string for both variants.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d84bd3bca2010508a8225b9549d8c634efa06531..7c99bc0d3aae3dc6e9c08fef0a535e114a3297a8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1067,6 +1067,14 @@ properties:
>            - const: qcom,x1e78100
>            - const: qcom,x1e80100
>  
> +      - items:
> +          - enum:
> +              - microsoft,denali-lcd
> +              - microsoft,denali-oled
> +          - const: microsoft,denali
> +          - const: qcom,x1p64100
> +          - const: qcom,x1e80100

As the bot pointed out, this is valid, but not what you want:

This expects

"microsoft,denali-(lcd/oled)", "microsoft,denali", "qcom,x1p64100",
"qcom,x1e80100"

whereas you're looking for 2 entries:

- items:
	const: microsoft,denali-lcd
	const: microsoft,denali
	const: qcom,x1p64100
	const: qcom,x1e80100

- items:
	const: microsoft,denali-oled
	const: microsoft,denali
	const: qcom,x1e80100

Konrad

