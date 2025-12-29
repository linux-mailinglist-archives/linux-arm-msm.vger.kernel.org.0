Return-Path: <linux-arm-msm+bounces-86856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C1CE6D96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D94A0301D5A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8B42DAFA8;
	Mon, 29 Dec 2025 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZft5VBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLJTPEQ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E4921FF33
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013985; cv=none; b=DNHk0PLG/r6K6aXkKR/63ipmO6ebKYyWgkdTt5foxxctg2U9xpt9FyvPafkfwoXjEtpRKI8iF69feqRLeu6YTwTBzBv/WlI7s3Hntuv7mumZBU4OvKpjPadboNgtqiISNyovWPwySH3Q22lMoisT8QkNprgH8c6nyUCJ7fuIyB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013985; c=relaxed/simple;
	bh=E/bisYtOoEPj+6S6bzBKmYyiaTmZPOlKnVuOd5lIB+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHS02loNUYPXvKnwaxQ3efu6mYh0R4JMT0pDoCoBphDU7/va23vBu2NQNacd14B0vS6hH0V1PxbCua4t7yTPiwpyGCM7M1lecm6UlGvLAf3mBdIoRdNcWtGHmbTUZbI7KLUv+y4Dv9Oz+MGKKa1Q/D9V9uIWZxtbsZfg4G7qDSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZft5VBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLJTPEQ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAPwUu3328630
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e69xSxQvulgfNxdWCTlGEzi6b6EHFcp/O+JNQzRpdDk=; b=KZft5VBgzZj07XcS
	zeVSMY234N17gYGkXcr2nl5IVJzC1FQpmbruQmcQo/gYodut/C1rIXhDBwB3p3k4
	wZDLa6H0FvfmM5zo+Ze0/NxzTQiqlUr409kjV/eKaYrLd1VoxivBRahBizyGPRFr
	mKcrroHBMatAYtVl5n2TQFNfNHEchLEXrjb6FjaXzjOl5yf6coWnWZZc30nhN4VZ
	djptQBdD7OLfdnMNV6Ykm9axgVTqHIxiN0tS/Iuc8HMD4x/sktVNzzeAR8RzdDCa
	VKubxp4GhQfyA1ZUT4nqYid9JjgOoRtXR35lYTCve+w7UJUNl/z/QlUCui5t5srI
	laZItw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6cafg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:13:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1e17aa706so53390301cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 05:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767013982; x=1767618782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e69xSxQvulgfNxdWCTlGEzi6b6EHFcp/O+JNQzRpdDk=;
        b=fLJTPEQ1aN+KgPnr/HDz3zI0BJKWlKVvDxMQK1+VraLxTD8joWCKM2Sk5bzbPeaHJO
         2EJkkyMbigof0LgG6NPiCfoZOWf4BbCp0VQZ7MtofmCqYdLTAFg9M55TXlhp4WWH8VXu
         RdSTCDzAjcchj6W4+dXbC62om187tlduiMFKsKuX17kn47jojeNQvxyN2+EEbhxoZVx3
         KxZne61hLKTG8nGle3Ix9fnDiKbSHP7gYrGnBWSeoDaAvxDSRWGEL4r6lJdl2xMCCuyh
         +NA4cWWnuicetEUNBUP7mv3XTG4MXIVytlflSvefGyl5Qk5QoNXUGE3smh7JU7qJcpEo
         JMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767013982; x=1767618782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e69xSxQvulgfNxdWCTlGEzi6b6EHFcp/O+JNQzRpdDk=;
        b=tYmx5fkzodnIpYLQJX9CQgFtuNS59CFh1OsoPVMcd834pa7H7wdi6YBX0+obBwKmX5
         waYsmOKTSOEMN+nSlQaofzGvXhlVuh7UBh7T2ua3hm059+kv+BBdWNWMkvDsN16js5/Q
         bquFUahoKuwsc3la4FqJYSAUCC7x2bfsplWOJAguO02ogVvk+iTjuS43Eo7hBsRBIXm9
         EhabwCGm8SnHelpCV8EOBxitN1r8WJmHEmI0M0EZ2P6tsJMMFASgiK25W2a9FasNU7+I
         JY9YSmSMcwTDN+9It/saGow8stvZmwbYnr9orxZr9Pa/8YtEEFv6af1OLFLmeNBhtA1w
         THyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE7T0IMOHFIJF2OUwe+FANFww6aFHLXC06OeEv6DMrV+C14mD3c8/7mBb9epB6tvmpDLreZAG56/TYxgzN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rrMNFppMFDODGv/gNnUfOwXfpNSEFCVSQgebg9NgW9hvgPAw
	yD+yqUBJbtkAtrKMkl7wf6dAQJyfKJRF/5vFnqbK5nqfr+zL87EKzp3o9cuDlFdzCM/fpzQWSra
	DH8Z6Dfy+SRhIvxdtepDRcDiaiICfjpyvb34BpHbrFEfhbFp1l8Toyndm4MWMxloYP/LD
X-Gm-Gg: AY/fxX6HEQMeXyK+a4aH4/q1kKygfq6RTfTxefCI+xZ9ODDHgQ6noELLpiUNt9MO5Dn
	OkpRKy4WEV8bT6ARiqwHhjWLk9FmzbldG/PNeQyZlSn4dVj9V6lOfvSGFeQhuTAM8hdmT4L5qa2
	vYv6uyheEchEl+CtmcW+MuehzpGY08K4qU8gFk+0IpzyLXGEjFY8kRes1ed/75t2ZSdzEiQrifK
	rwHExuyNRNOZjWpdhf0OKOewp9hk31pth2B3Xkap/X6HE7c1yAp31hTb+NyAx91TtX1hsfOOHv0
	CfBQ/SYDRsrzBe8DrOWDDBGEAQQP6feWKvNZ48icFtd7OQlIgfHwDZRiJLuVbDFr5qi6i4qx0Z5
	Qb/RI3dQ4IQMajg+9sW4pF5ov/IewfUnKKiV973I90w+21KBMRIjf73Oznb5nxnXYFg==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr306807541cf.6.1767013981864;
        Mon, 29 Dec 2025 05:13:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa0WDk6M+E2E0p+ji2/14sAt3YcclQ3VxdiLhW7OHrRPpy/15RJNGau2EsYGGr0bZ5cuCDLQ==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr306807251cf.6.1767013981451;
        Mon, 29 Dec 2025 05:13:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599605sm31456963a12.23.2025.12.29.05.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:13:00 -0800 (PST)
Message-ID: <fc67634b-d47e-452b-bbad-35884b75d0b7@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:12:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: Add TSENS and QUPv3
 serial engines
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
References: <20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com>
 <20251225-knp-dts-misc-v2-2-a8a8a31fd528@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251225-knp-dts-misc-v2-2-a8a8a31fd528@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=69527e5e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TRgJCNjEZve3GQbn5gEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: aLQQDFx2A_s0MehkVdtuXhhIRkJ0L_xs
X-Proofpoint-GUID: aLQQDFx2A_s0MehkVdtuXhhIRkJ0L_xs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyMiBTYWx0ZWRfXwwrXjKNqe8sU
 6dRigsGNfq/s1YB/4Qrdy1VBZyw7LMzzafFZhrcl+qED6xaIleMw7eoEyHCua8iVqRB8bGpI1oK
 pWXSFdpoPdt52VazRKE7Bt9WbP7URwK0LYgxz0MfJ+1xSdCAQcR4TQbYyQJj8TPGHXWECoHsjpX
 Yii7FV4c09aHei0zwr1e6a90ma9OfYQCGTLsOjN8oSBy/2yvnVZy8WdpoUvDjqFvyuY8+aXKys4
 fljtzvWNqQu2WQYaB2ZV7LCfP2hGXByJBcgzw8v2Z3LwlIE/MQ6t+XYUDLzXFlNXl+wzva4/XIF
 oIdd6rUaJ8vJyDNkOGjbksAX3p4VQaNm3DnmHiYmuvA1ZIKOmLKG+xYzM/zxWAcpOPMj/mP7+ro
 owzYITuvOeAheR+PgIo/9UOE5syCkLihTJ08B7AVIh/IUhDR0JHrIAyKRDWvkqYJx9Z/gS+3bt9
 0TW3oZaH8DYU1rdnRcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290122

On 12/26/25 4:06 AM, Jingyi Wang wrote:
> Add new features on the Kaanapali Platform including:
> 
> - Temperature Sensor (TSENS) and thermal zones
> - QUPv3 serial engine protocols with 5 I2C hubs and 24 QUP serial engines
>   across 4 QUP wrappers, each with support of GPI DMA engines.
> 
> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Since the base DT is now merged, all subsequent patches are
supposed to be patch-sized, i.e. usually scoped for one feature that
makes sense. This one happens to be an arbitrary concatenation of two
separate ones. Were they separate, the original authors would benefit
from the full attribution and they would be easier for us to review

Konrad

