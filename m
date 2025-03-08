Return-Path: <linux-arm-msm+bounces-50706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 489ADA57B72
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 16:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C8023AB7EC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F971ACECB;
	Sat,  8 Mar 2025 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm3Q5tMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D3D167DB7
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741446536; cv=none; b=ezHbDb+NhgEHQ8iBaJKdmjfHqfO6Gz5w+1tBL5fOZo5XBrtj4584W3965hQxR8i+hXvhTuhBbMfFFuqnaJHlAgAH3v0TaXrOI0j6M3ubWimzTAt3oA1U4APDIpoPrYrVR3mQw/rgdzmc+BEJ82vMVOpwyHs1d2dGpSLOxGuHvuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741446536; c=relaxed/simple;
	bh=3GFm4luup+pqEjZgGHZ7drgx+phEmjUyO+rtAkf0gdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+wmm+rI9AWk3zJKkHZ1lRJdMdcoh5WHVZ+vjZm/8sRpbt7EUb74pex2PHy5/8AvbFeRdIUSEorDKg3BPA3ShJKeaI3z6+oJFNGRV/xWbRPpuDqpaGFRSyjPiSNQLvMY6miZ1c7ueEa4N1QweGd9Gmr08lV1yuVE9BpupGC/nMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pm3Q5tMk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528CqtSR024373
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 15:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WvEgSQ6fjLHoWS3Q+wrjvW0AGfYG3GKpopCgkxp6Ro=; b=pm3Q5tMk7TXVfjAr
	voItw4cmezcg4cFw7t8NmsUkDERgQUACEOGihn7lbmphMlWl8PPxm/jQPN/kzsxg
	pv2X4eHso0gs6UXwfFIJI2V+L+hpvTSzOMh5tD9PH1Kr7s8JJd3+vbEelu658R/9
	fENn5xZd63C8/+3exPGG2M04E0i2mJJJAdI0BqLAFLaq2ICqCryftaJmioOePiNg
	dDsmDVoeO/M3hjjvFDz7K8MGAkTFlNWei7No7oHiYGse7an6rhiJBM8QKDJ0OUsI
	BmJV4l9rtJJPLtzeUkBw3qRcZDivDihFbLTRXMlQSiecK+WhGQzAsvLR3Zj8R1Sk
	URtFKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk0qrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 15:08:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso6398116d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 07:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741446533; x=1742051333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WvEgSQ6fjLHoWS3Q+wrjvW0AGfYG3GKpopCgkxp6Ro=;
        b=Sw6jR8PAovVNpxoPmRLu+vrdIy0UTyTLsxa7C9OHn67i3dOUZRCm4dEvagPCWLME4U
         UEZkU5BwWLShmeGrrPPLR4Z1SUrqwv6jy6oCvVTDU4RLhHOLSix5nI/W6skDHAeSzqx8
         VefTzjxiuIn/5Vi+lQttI19ReofKvKz0l8bNscz0Jx9CckKAKwedyvUpGzAbPOoV6M11
         7NtZ4HfK/FIXVjkth1m77POOKaJu+UGBTobWwqIEZ1Uv+vjEBPw069R13P7LAmNidMZs
         h8nBhTiooFOhSsKL1A1RHVqcoatSsbly5Z3Q7JiHHS+fEbCuLyKgjKE0NfxrScASQddJ
         UpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbX8hLsOkBhpgVpSbhzXpIAuWFwEjPGcmDe6QYbngDx3ebb5bgGLKN2kq/xYsh6tyg9gvyqK9qUPx7BjZV@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIpvmo/z6IRvIeg0+oHU4p97OhxJSYYjdgXyZfTfUh0T9/0gK
	NtUP4B26oVo/LYmSpGVEouhVVPNRDeD0ksDDa9S6LMRSoZLF6Tg5x46B+rGeTXEDjRwiwVUasj3
	wusEwDaFPWOqJEiAzwLz2eEXooRLy2A5bJafX4EDupNEs0K0uHw80fv0hxxj9LEr/
X-Gm-Gg: ASbGncs6IgoyCS5eB6iEK1lbBJeU+Z0LvaHcsGbh0qFsHkyMkXgKqetujACJRB8Ncnx
	SsHlVAnaJAwsAX2SJ9Sbv1Qh2GXlvQnmRda1yImALbg1/szfRKmCPxXCNEK+zBsj/RW17WNKJ78
	eAa0dWiDGRc26gg7r0q0rMGydoFWXv5MenANr8u0cpkzILVOvSz9cQVTr9RtU6fUiTgvqvvV4HN
	4yyl/AYXDFaDuo+rD2IzWdlIhkg+kScBDFLL0VHn3Ynx7l9OWqRBA4He739byc75dsz4c9oqAcr
	Aj29Nyyc6tbQw2VzSzf+/7fcborM2awAbM6BopvbKHSiuw+e1ooJ+xh/fTzPYyzcAW8rEw==
X-Received: by 2002:a05:6214:5289:b0:6e4:2975:ce54 with SMTP id 6a1803df08f44-6e908cb5248mr17585316d6.3.1741446533297;
        Sat, 08 Mar 2025 07:08:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7VzZfMJABr9wvGjQaN3mynWkb62I3My6wlogqF3sUcltn/eOJ0ALm9h7T2SCMQYhNBFiMvw==
X-Received: by 2002:a05:6214:5289:b0:6e4:2975:ce54 with SMTP id 6a1803df08f44-6e908cb5248mr17585166d6.3.1741446532965;
        Sat, 08 Mar 2025 07:08:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943878csm443575066b.23.2025.03.08.07.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 07:08:52 -0800 (PST)
Message-ID: <aff4fd18-59a2-4378-bfd2-840bcd1a2392@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 16:08:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: ipq5018: Add PCIe related nodes
To: George Moussalem <george.moussalem@outlook.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        andersson@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
        kishon@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        kw@linux.com, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
        p.zabel@pengutronix.de, quic_nsekar@quicinc.com, robh@kernel.org,
        robimarko@gmail.com, vkoul@kernel.org
Cc: quic_srichara@quicinc.com
References: <20250305134239.2236590-1-george.moussalem@outlook.com>
 <DS7PR19MB8883E4A90C8AFF66BCAE14F49DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883E4A90C8AFF66BCAE14F49DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67cc5d86 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=eQ806-ShdUuXvpoWo40A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: XkFv5gSmM2IQYU6vCEBKRzp5lJrmUbbB
X-Proofpoint-ORIG-GUID: XkFv5gSmM2IQYU6vCEBKRzp5lJrmUbbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_06,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=538 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080114

On 5.03.2025 2:41 PM, George Moussalem wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add phy and controller nodes for a 2-lane Gen2 and
> a 1-lane Gen2 PCIe bus. IPQ5018 has 8 MSI SPI interrupts and
> one global interrupt.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 142 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> +					<0 0 0 2 &intc 0 143 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> +					<0 0 0 3 &intc 0 144 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> +					<0 0 0 4 &intc 0 145 IRQ_TYPE_LEVEL_HIGH>; /* int_d */

Please all the comments in this patch, they're not very useful

Konrad

