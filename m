Return-Path: <linux-arm-msm+bounces-47902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD9A34169
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 15:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0CFA164991
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 14:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBAC21D3FC;
	Thu, 13 Feb 2025 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EG8tf6P9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3A2139C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455393; cv=none; b=cW7VuB5md2zCix7wUf63ACaq4RUQV6BenYWI5NKBXJ9LNNkJ3e8xmrPvdHKVXo4Fl9HdqWzq8h1DM9aRfyREgjZCvorAQpIcgxlLf12gIZ1JFKPOkuVE1EFtJUAu/Lji6A2nVRg3Ac/U4qXQKr4PZe83p7fUdLdHAWwMXAnYCmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455393; c=relaxed/simple;
	bh=vwkpPEmLKeMcnDl78At5FuWa/pfr0trYWV5OyOQucs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3j6L9gx01RSHAcqnddJT56ii54mqu/PhC+12DX4Eui1KhJdV/y3xG97i3biRxzUHFJtPKOqJMbR5bIi8GffRUHJWNUFjzudO205M9xWTA2Tci7A3zA7nJ2hMC0oo3VaT30O4Rw8wispAmj8qXt8iHCiaBYmomAzMpsD5RsYNV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EG8tf6P9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA6wj8031727
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 14:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5VpsuLdCAZU3fZXBzng72UGalOx6ElpR1QJjGggFtY=; b=EG8tf6P9m//EdFgr
	f/qOTfQ1kGjAC2FUACXqIFFRgpklnI9Uk6Ac2/Fglgw6v9S2T8ZhdLuqWkRLiIBW
	0zaQNskQ+VsH7+zFZfbC6a0BY7Z4++yHW6cDKJ6g3frKcyLynjLnYwQeZqFLvgi/
	9qiR2npHSocJVAZPQNC/7hUow9p+QF1Aasr0g5nzUr2nAksYHTmRm9mPouxn/5q4
	/gPHMudKHtm5lUs3FKRke9/G3WghBoRCkTaSD37Zw5EvmQ6e+hST9bs5jnoaCzjU
	0Pq2bGcseD9+YtozyVDkBMaQQvVpOqgwswsfOGb0kdYANWDXB6h1mmcuy5JkomaX
	Dzkg+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq00ke3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 14:03:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-471b9ad3f10so1932271cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 06:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455389; x=1740060189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5VpsuLdCAZU3fZXBzng72UGalOx6ElpR1QJjGggFtY=;
        b=Z8YKV9xiL1IUq+c6ayUJd8YfM20w2kWXKqU14DvvVVk+HaVz96wnoK23HE1cP9UzaR
         XQUOtpov6Frh2lLxZWnqgi5BQ/R3SqIljHbUsSDlJ6xo/Yu4cT/qGweL0Qo+uID2pzDi
         M4h3VH6ASCOZviaDFWT3/Akpj/EbZw7Ro1esQSeAwqgBD8V4WtQRviLZU1ecA0J+syxN
         Z2n8XoQP4RPMm9UPwQCcXN8vw0q35WkCUJBIQte2quN9lBuQbSPB6lmZxdMMcprCOIK8
         7Sd7VkSkDgfA6pgOZtRlkxbWo8nfPXDC9Ln6s78XWrXhNkk2JECJpF6xIRgaYf9J2pfz
         0J2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfdv6BSRm0ySTGSOf/y/ifsc+c/+0+fy5PqOD/rRR0QnQtFF90XPl0dXlnu/n2hQKrbvaps7sHxm+zI2YU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5/LgpEmKhZhKzaTyivKgJq0fjkKDk0j8q3v1O44MzB2WUe/Xu
	464W2Ob305YNf+pXg5LLpu6HSEIAANpcBNuIV8GRuucFsXTWEbKYZutiUMkfjLdczQrlhx7KBNk
	QuzD4hc6MVPGh2AjstdwZnM1di+zv9b0MWBEysBC8TrTlQ+KVrRC/nDaKW0Ul0gNA
X-Gm-Gg: ASbGnctFfw2XI79Sy0ndMkyIGXprKLVIsME/Drq90FIBCpyNeAhY/ECN8N+TADxGjxa
	kEgt/TQIRaGk915XiBzj+dSZ12NEwEJwfAvizk/4PyrqDfRuPt/4+EQNY2FLPyNm/FpDxTJX+ey
	eucMGS41MC1Fj++TikMrDwM9nk8LkWoCkLAl6SKsKI1gvktwjo1W6BWQC5td/p87TDNT0bB2q+I
	LQ54/FbHsUgdIv27D9tp1LVfHjyfo8ApgX7XAopBl7SWrMFt8Q+18IFIN81EKxwr1Y/Euxm/tDM
	WdsCWK+ln4CnhaXVs3fj2zL/pBe9irKj+7li6DfU/JUqZTBGySpIB1NWcmM=
X-Received: by 2002:a05:622a:4292:b0:471:bb0e:8084 with SMTP id d75a77b69052e-471bb0e80e4mr28606891cf.8.1739455388773;
        Thu, 13 Feb 2025 06:03:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF42JZXUGu/JVphxOuwa5AUtM/bnsNKkcUPYqVDmecZDBrVQKesnXrSST6fw5mgPmfKdh/e8Q==
X-Received: by 2002:a05:622a:4292:b0:471:bb0e:8084 with SMTP id d75a77b69052e-471bb0e80e4mr28606761cf.8.1739455388421;
        Thu, 13 Feb 2025 06:03:08 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bee9dsm136345466b.173.2025.02.13.06.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 06:03:07 -0800 (PST)
Message-ID: <a77fa0a6-c9d7-4454-ad47-d03a3026e104@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 15:03:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: ipq5424: Add PCIe PHYs and
 controller nodes
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250213071912.2930066-1-quic_mmanikan@quicinc.com>
 <20250213071912.2930066-2-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250213071912.2930066-2-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QxXjQ3-FgbnGFXSFdyUaXNKMv5wo-h3i
X-Proofpoint-ORIG-GUID: QxXjQ3-FgbnGFXSFdyUaXNKMv5wo-h3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_06,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=927 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130106

On 13.02.2025 8:19 AM, Manikanta Mylavarapu wrote:
> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
> found on IPQ5424 platform. The PCIe0 & PCIe1 are 1-lane Gen3
> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

