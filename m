Return-Path: <linux-arm-msm+bounces-80601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12113C3ADD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 13:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45513AA657
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 12:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBDF3191B1;
	Thu,  6 Nov 2025 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HamTd/yp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcGDDnWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E942DE6E3
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762431296; cv=none; b=I/e1W46TDmzIZC0LGNnvJGerKJTMuf0EtJ82YZfh239fCXPfHcyMvye0AbetP2QYVhXTaoEsmR/9L/9y4Df4sy3q9PAMtjRMl0a6w5WtHuUktNc33YDDwrX/L9gaZ35AyKF8NA0kywYFr0w5aCAGPJ1niSqduuL2BQv2YcqL1Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762431296; c=relaxed/simple;
	bh=ekKRVsIQk2yTIi2O6W8XgAImjp0Xet2F/XBpm8Quheo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEbv99U2lJdQt0ZQRinRGB2JbuCM4CZEJnLUREXJ2Vt7tG4ICPY0bmFV3AFopLNBDEt0OSvk+g2s652KZf6VCvAE6Y8sLoKXYSq5AS1WWs8/xOiIPhYMPbWXC2d4agJ0eSaIOx3Wtli9HvN7as+UfidpaHb7f8DTeO5fQrbDADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HamTd/yp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcGDDnWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A686VYf2164514
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 12:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLXA08kPYaUwpSm1uwFgestSzsTRbCn2xW73c/Hiq4g=; b=HamTd/ypDv1PDxKs
	pTU3tAaf9V1Ft9XKoViWk4FUJ5JCFMbLTXfB0UeUVZT0AbcKDYneC1JNm35wfX40
	1AgbJ9QO3cR3ieqm3NMzddD/eOcfW5UQG4ROgN1CP1YUBoM8VWgAx+LqJ071Zou4
	1BWV45APvi/ciEblgvYuNgapYbrT9KJFj2qlA1yYSEodUFN5Cj2rkD3SyCN1oLgC
	pUnGQqwjLrtR2ZshJOF/eOmSmF1tVrGcvCYj4LYAvRUGqMq9aTWzRS84eymC01BQ
	tulALSEutN2ULunCHNv6PBGYQe84KlvzSsIBy8ingQakUb57Jxt1lHv2G1zcM8XC
	shr5JQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8g6eswwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 12:14:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1f633955cso11010685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 04:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762431293; x=1763036093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLXA08kPYaUwpSm1uwFgestSzsTRbCn2xW73c/Hiq4g=;
        b=hcGDDnWHmZefrNjC53xCdzaHy97XchqWMc75ggWypX5NQY/JsQT1OMKYoTUj8k1Pw3
         HrvvokPsA6dFmClxhZgTF7utxajfU0sXTj72sQ7Z3cf+nzI2WlT0uT4uXNqrsTwW+gcv
         v9WqkgdcrAwNzJHUsJtv6hiZ5cBHxkScabDCsGjMCCxaMbmRdC/4Ls0i6CVmfgC/xbhy
         HbXigdd2I2PvwkrXBnKmyrfaIb0fMlWvebHDtnl5wLVhoJNEgLhIpxbYO564yyfupXEi
         oR4nTx8gr+Q/t4ndZ9JOFuQTxWNaN0KyIbT2K0e/2XR7yRWvln8orxIR0Vfj+Fhhg9zN
         5TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762431293; x=1763036093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLXA08kPYaUwpSm1uwFgestSzsTRbCn2xW73c/Hiq4g=;
        b=AAoSdgKt6Dy9Csaj/GczlqjS9cQH9hdAAEBatBA8U6xbBf0HiVLr9v5VyXYiZRwAQ9
         2ADn8263aJO3ADKboVcWbVFg9utmwN5+FxFum6K7+3eAm27fUDCbmHmnGt7JABK6Kr29
         AMdsCgGJb1GJSbXjzhuMqti4LiQz7CsTA5yi6qi8R8wiHVt9XRVhmCfm0I7IAr77ZPsU
         k0bnOO5TR/QOlPIfvnv5HD6rvXu/xFEJAll2fRyVQczg5Glue8AGc7zgeYUgtWp9BU9p
         F80hoCzuftjjPMm2H220eJh9ubbDOdVg4FyHpRsWvCJoFGgDKECq/w8Ov2M++DSDBVdV
         yYrg==
X-Forwarded-Encrypted: i=1; AJvYcCWfRKkV86ziRYiIdhLE03OOAY9J2ZB8NKcMErEBkXZLtVkfokoABDKKQbr6otyiil5a0fup+xyqhf5U7l19@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1F5oBNiVxBBPwqClDdorV4sTNt+PIAuER0VxqtgV8Z3qciPCH
	rwh2O91I7wtAw34oJtcDlnYVFpOiTFfzC9RWgB9DW74ioNZs2LDFbMUbmFzG44Ssa2kcpzGk4Tu
	s+Z5+vHBV6NANlKcAu+RA6EtYGSIKZg+ep30pEa8TSW+GI7CC7fslNQDB0/9oIgOEOCJp
X-Gm-Gg: ASbGncvjuPPZczkQC0dnTKLUqvJnDqCfy5B+IslIZkXXlOJSS2/vsb7oU7ti7fbpuBG
	XpQ2iyIY+rMBE6eWfKunGmGyrGRBDpgsPOIdQzFW9Z/vnHg4ju6ks6jv1erCNd8MA40FQID+4rh
	iSDbP48J6SWomA3e2KdafVvPboYeoVTlP0wEnKNKXA6qJOOjMja+DgERaN52jYEZ5bSm54lT6c7
	QHYWVtT++FbxzXbKOxCDiV5Go0vGPU8nHoXVv7C4MwBNizFMQBbySByzdcvPmwWItPZZ0rdfszT
	DnIy9XxjIqRjoJS6pWPB63Uu+/ZVAZ6DFPV7XHmc7dGyc3rT1fAdK2Lh2PX2Hzhb3B2rDD88U8p
	y3lfUIIyt6ZVcmFf3Mm3p0hIVl3tMZU+KGI9+Z8SHmXq0wEWK/mayUcBC
X-Received: by 2002:a05:622a:1190:b0:4e8:9bf5:5ecd with SMTP id d75a77b69052e-4ed7212ab6bmr51316601cf.1.1762431293007;
        Thu, 06 Nov 2025 04:14:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbHbT2S5J7YWDZlDRXl3mXy5NvTvkRuByNb/uQnt5fhSTJ+xry+0wZ84KARasofcaWgtF/dA==
X-Received: by 2002:a05:622a:1190:b0:4e8:9bf5:5ecd with SMTP id d75a77b69052e-4ed7212ab6bmr51316331cf.1.1762431292468;
        Thu, 06 Nov 2025 04:14:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72896c7e39sm202861366b.72.2025.11.06.04.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 04:14:51 -0800 (PST)
Message-ID: <ed1e6e3f-946b-481b-a183-c39771686c10@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 13:14:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] PCI: qcom: Treat PHY as optional for the new
 binding
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251106-pci-binding-v2-0-bebe9345fc4b@oss.qualcomm.com>
 <20251106-pci-binding-v2-2-bebe9345fc4b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106-pci-binding-v2-2-bebe9345fc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5NiBTYWx0ZWRfX8cWnXKjU5mO0
 hOPQeWkpeW8qIdKsqpbYCpSN/epEP7nkvDQ3n9vqFTnm9qJ0/QQRsxNkTNn/168fEi2f/41kjg4
 M1THQk9f9K+uS88vCLoyvHjFnW2ZriKw3yZDy03Ui8vGKbN179nMg1kv5ONGpfPPTIt7UmdZafU
 QfjO4ZGoJHayeleFr7PUSlRyBpYvisZaL5vfnKAQG69CVn5r/xBhmOQ8J1KZLiUs21csvTP2qrH
 6BrfiDNt7XOImfBfT6UNJF42YTjsDoFuA6zOu+nsxsPjUFZSt3N2stuDeqp4fgtersP5Ec3vPQG
 LTdEZcUqo49laqoO3ZnBp85dW3BMvMAc91BzBNtehq9wwPlUK9AvC3ofSfUfzAAzBvfRGjwTGPH
 qACiLQG2KTyh9d3e0GAIV/OpvO7LAQ==
X-Authority-Analysis: v=2.4 cv=D5FK6/Rj c=1 sm=1 tr=0 ts=690c913d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kYxvmccDk0iZALW1rmwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: WfEt81znfSZmRzv4AdCFqxAJWzYHlaqR
X-Proofpoint-ORIG-GUID: WfEt81znfSZmRzv4AdCFqxAJWzYHlaqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060096

On 11/6/25 12:27 PM, Manivannan Sadhasivam wrote:
> Some platforms like the old ARM32 IPQ/APQ platforms do not supply the
> 'phys' property in devicetree. Hence, treat the PHY as optional in
> qcom_pcie_parse_port(), so that they can work with the new binding model
> of specifying PERST# in Root Port node.
> 
> Fixes: a2fbecdbbb9d ("PCI: qcom: Add support for parsing the new Root Port binding")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Hm, I suppose they must rely on the PHY being pre-programmed then

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

