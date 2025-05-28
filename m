Return-Path: <linux-arm-msm+bounces-59646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A4AC60D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 06:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 388671BA1CFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 04:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB971F0E3A;
	Wed, 28 May 2025 04:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKj+9jHe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9B61E9B1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 04:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748407835; cv=none; b=es6ilrVIvzcENScimmpbabbKGmpMzBApQbC5N6vylvLUgpkN7Ii/HbsLpBELz7J+cd6Nx2HqxsqV/I32VmabLRLGH5HmzwI+A0+vBUtRxU8/DkdM2+b9s1K0rDACXannVh625kUCdOm3pmupex5JHHXbX4aZct1T00yJzRgWWIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748407835; c=relaxed/simple;
	bh=SZWThzxP/87c9R8Huv4SM4sfI7oqi1K0BFXylxM1JU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GC4napa0GRKIOCqZUXF53zei4ywChKUGQl3cwhv1LYuAnohE7zMZLcxa+J5uT1h8WLd3TvrvfT8IDcUjTAJftIYxQ78DDgtuZAUNxZ6tZYiR/oH0wkOSTbcbaJQtrhd70N0CvVx95+eN9cTJXahNNSTuraFKaEDxTJoX6/Vggm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKj+9jHe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S2EZMS003683
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 04:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C371pGRBLlC9/Ts/1/jUakLqagSQGyt7TnsvkA6tdNk=; b=hKj+9jHeGOhW/Gks
	yXFQh9JQ/nI3lxr41HFcgwujHhEbY4VHaT5BN50hK4Paak/TjehifWN25MryCa5X
	EDWNK6aA5kIdiAAVQWoy+BgHq4m0LlGnUbLUfG7ypazFT19F0gdqeesUoFgQa3A1
	qmBCOqZIRPmIVBaTly8I/j0bS8T+S9IRLSeYNEq8H94llSluD0Xy9f/EO2uSQgMs
	+shH65aJyhTgowiW6MTPzOQ+QWzO8QlcHoq6Z0MDSCQi9TMcqVHw2VxvSqzjXJpC
	JCaJcXAZap1X3E0zDr4OfmziJfCOBOSCFC/HZpewM4EbU5IrgH58Uol2R3IqFZh2
	+KmVMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek1081-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 04:50:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-233e462f57fso46889585ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748407831; x=1749012631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C371pGRBLlC9/Ts/1/jUakLqagSQGyt7TnsvkA6tdNk=;
        b=NCgo+dXEgA3dQ6DNH9XtfcYsH26gNzvX8EI21XvicW/PdvJvm84GjtNSpTIKsoSp+K
         vvpOFjSV9DyhR81/j1waaQ6UhAyfqvIPmCJ87a6PDjF8A/IK5W+wsyBwl2l6lLRLRkfK
         6KcwlT8FVNWcFUSpVzyHj1ZLKCLCSOxM6ZHCt35/gUWqVnOsbIMZXr0L/gyX6nDDNUlX
         IwqMT7gqwkh5fFxZxyOpCdRtgSqgzJx9AWvryZzPmQNlwLMHqAdV1wE3zEF/6K5A8BGe
         IK1DnQL52JFmtFyBOofHO570/Y2mjbVHLp3ra3uLtbmCowi+il52W35oSjCr8eivWLfi
         20IA==
X-Gm-Message-State: AOJu0YzsEsp+DkoEhxpvc+PnbbDg5esgKHiMtE/1+kOKWOsUANl8UboR
	m00LD5qRmOJYj4zcHIFibZ3nuKogydMZ8zJXAzLZPrb19yQ6gUmjeoJZomM4DU4bcazZUm+l8RQ
	gaaJy6Uy1uDZwwyT/gK2khTT3MKLIKaVxfgQ0nd2wflrY39KAjMAqeukr8mPUodje46TS
X-Gm-Gg: ASbGncufagnU4grLYvLQirKE+CY/2qWRV9F/vuU0X4PCT7btv7sl1k/va7sVAlPZps1
	brdJvi5zFmjYgBhGJdIXRyJCcYTpzctSVCrNAHev0SL/lCbgNnS4nuxwtfoLjuIZ+Jm9Lv4Ky3G
	Ek1SBtpF16UKxzy9lqfeZGIk0kQWyPE0PUs6rqEgPD+5z6TKWY3k75j0nEhwFEkFIlxQipKvQfg
	0mg5LUnV+bKNXOIjS3bzGMoYCUfF1reVQ6ZRQNGDbWB//KXoP5D7QPrxhdx21mLOFTq1aLG7Iy+
	LHYy9wt1ycOdveW6GhXs2UrW1rm4DfEcjVU4cE70Qw==
X-Received: by 2002:a17:902:f54e:b0:234:8ac5:3f31 with SMTP id d9443c01a7336-2348ac53fd2mr99050865ad.23.1748407831001;
        Tue, 27 May 2025 21:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN9b4dZ+vQIgVSTiIeC0tbTS9PKLkg/kjNaPF3ZRn8W94d6lAt9Br08fffh0W92jG9c6SL4A==
X-Received: by 2002:a17:902:f54e:b0:234:8ac5:3f31 with SMTP id d9443c01a7336-2348ac53fd2mr99050685ad.23.1748407830642;
        Tue, 27 May 2025 21:50:30 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fd229dsm3131465ad.34.2025.05.27.21.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 21:50:30 -0700 (PDT)
Message-ID: <e840e6b6-f2c1-9e85-bfb3-fba1471dad32@oss.qualcomm.com>
Date: Wed, 28 May 2025 10:20:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] schemas: PCI: Add standard PCIe WAKE# signal
To: robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, helgaas@kernel.org, krzk@kernel.org,
        manivannan.sadhasivam@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, lpieralisi@kernel.org, kw@linux.com,
        conor+dt@kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
        quic_vbadigan@quicinc.com, andersson@kernel.org, sherry.sun@nxp.com
References: <20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68369618 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=8Attb8s4RaY3mnNPeTUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ikvzwAlMg8kcD3ZZ-ALpQFC7nLwgC52A
X-Proofpoint-GUID: ikvzwAlMg8kcD3ZZ-ALpQFC7nLwgC52A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA0MCBTYWx0ZWRfX0Enxj9L/DBuG
 lGNYfslnAI7s4zITOOI/J97y8BphauTWp49RlWg5uYQjumdwYev+wCW4uPZvo0iNsHTECM6JwZC
 3zWj4jlAUQwf9Gd/gZ7dBkp9KFskZvSFWwnosmqGCWFcpNceiffgCT4ExX4mwYF5KfnPFeVNvwA
 dauI6/NGs5keguMp3EGBg0/XQW6Y0kZfSwzXDhTSfhgf+SCEBIu1NiWQ/JvuHyFuQaXdwLhPdcT
 vTLnsxtSWqPbTGmA7vzTgimDQ4IVwXM/w+mCoamJNoK8GAJYJ5eUp2/mEf+VOXFvo0JkP30+LKT
 1faWt5TWwr34bu1siPLxkDEKItbmLZNAvhbrgfbWF4Tbf3Ayy8WPItSQdmhIIxjBrwhP/+lL2Sc
 P/bTMT0/SSczFxXJRk/d88I34QEHKy2hkWu8DJcCTbXb1b8MqSVSI5p0E6PDaihVnuyJfUL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=818 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280040


On 5/15/2025 2:35 PM, Krishna Chaitanya Chundru wrote:
> As per PCIe spec 6, sec 5.3.3.2 document PCI standard WAKE# signal,
> which is used to re-establish power and reference clocks to the
> components within its domain.
> 
Hi Rob,

can you check this patch once.

- Krishna Chaitanya.
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   dtschema/schemas/pci/pci-bus-common.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
> index ca97a00..a39fafc 100644
> --- a/dtschema/schemas/pci/pci-bus-common.yaml
> +++ b/dtschema/schemas/pci/pci-bus-common.yaml
> @@ -142,6 +142,10 @@ properties:
>       description: GPIO controlled connection to PERST# signal
>       maxItems: 1
>   
> +  wake-gpios:
> +    description: GPIO controlled connection to WAKE# signal
> +    maxItems: 1
> +
>     slot-power-limit-milliwatt:
>       description:
>         If present, specifies slot power limit in milliwatts.

