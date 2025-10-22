Return-Path: <linux-arm-msm+bounces-78371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A328ABFD028
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 18:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312563AA332
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F9426ED52;
	Wed, 22 Oct 2025 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtU6Ht5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF3C26E6E8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761149039; cv=none; b=KvyURTPg2S0f7O6QMm3PT/9yn8fuQ6qP0ILcmJ9s0fZ1/0qO1WuUxBTBfbgFSPESQ0okcoCSrxMQXRNIRbnwjPDodOyMCcI/tqoBskhUGZtOQiCVvrQzMlsWH/4K4DrAscx7VOI5nv+xKhHmeHZ+PaiLNcNL3GW/GMkMTrniCvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761149039; c=relaxed/simple;
	bh=J/wCqWtHt58YfyLb4QUj/7BrwElWYVGb0TdLeuRZrkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdvqRdSCDvacgQ62AvWJ6xb9on8k+Tga7HSWF5fP/MhyGlm4DWS8UMwRTzJ/AZYgK8hiuGwgU3ltTVPlH2HIDaD5MDZwQHlQ9SmT15RwrDLyHWkzzIlkkeDxXrAIVYt3YDQFi/WmAJfvfRES5a2ivDg5Z8UajGIxd3vghalNg9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtU6Ht5E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MG0JdW004936
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bkJ6jeJ29nnDrwRLI2RJgTF7Qjpy+xqM2cBm1hyQ0c=; b=KtU6Ht5Et70lZips
	F43ZCf0jMKmu+sRb8LUDfiRWCnzjKRJNUt2jZEjn2f84EhFC8h8DWq5UC6pXL8qZ
	MqgCSLOc8w3cCucqmoEnfKLj6O06XPPqTR7+n+OvDTsNMqfuWP0NeAmliorDQyQ3
	urNizChjr2tZ4RBLb9iGKpgxGYJX0S7OkOy1+h6CBsCLGP5RXVU9x+9YZfzXxLkf
	bdrr2gByXUhpI3NIA12wx2CaDTQyXA6iDn9JiRRIyAGzhOrGX4ih0qFD0Dcn6j2Q
	u2T5iIPH9LcU1JzhTI1umNAs3mAARkMazs05jauJPKr3+i1enkKK9tS7XB8Zhv7U
	RjNo1g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsav3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:03:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5db22173f9fso148754137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761149036; x=1761753836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bkJ6jeJ29nnDrwRLI2RJgTF7Qjpy+xqM2cBm1hyQ0c=;
        b=RX/PTN4i8au5jwKaf6Xx1TtPaJbXY8Vm3UK8wG7k9bDOUBZruP/aHsG2Nqq+fhbFO8
         k9EgGQ9/kdMtUKKrfG0aHpOh4nW5ePR+AAQpu/Kv8+ayUvyJmug2ZfYZ/maqGTS+soZB
         mjEEO7+4ivgwHfES/b4tT6WiwhNR9FM1xBuJU9osKIaYt3U8xtp8TzOnUUcCS7o580ml
         1DcCH7R3Cyu9IsQosmZGXi9Rpvp2Td4lBX59qIK7ErAb7L1aHKU+69PPkxZn5aFqBzuH
         dWGGpC8t2N79ZgREvhKyROejHubp82ON3as2R+yKjF9MppPCtaiDyfT+kIZJMma8DrS2
         T8JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr/gQU1OyE8KXaiz8MQ7jLCqpyoRh9M5YOqS+zjcokPf+KNkNUofLgTlBMq8VSqbrswW+8NYGXiMqONaFa@vger.kernel.org
X-Gm-Message-State: AOJu0YyxeDBT6Mnv8ULlN7F584GoEKGD2iny3TBqOyZ/dhctC+7iBmL0
	rsIAAxZdgxfE51jgga9gjfxA2StmAS4XEGnhnlXuAK5g+gkDLerrUCYZWNz/EYnb0NZD7Wm6c7f
	4eYzccgEw8MYT7oJ1Ykicmie4qJsmL63yR7ITf/JSqoHoolK/Yn/oX3YJ5wQ3CpusQmYk
X-Gm-Gg: ASbGncuOdpGCB9C7GZYgeOdDopbuybSflZleIb4g1SLF1OlPp7prihSkfOd1EwDJV9U
	97VCW1KjlMIZv20N7hQelABzmn3oIDy6hk57lCPEK5sSAwBqeimpvlwWbVE+2f6OfZ9n0AvQRLh
	1/8zOSBbbaZA1+soc02wbCtMZyqw+y4EoClY7B+66R4sQcUa73gAlhE+cQbpKUWUkFRaCtGjErz
	19lc2fMyNjcJVpe3RyNoCtO99jXuYKPxYKrBTItjpGPkEBRbcT+qR458TGM/p83hmObWLEk5hMb
	HSFLpTPplJalSJyfxxoTXY9kX5EpUCX+hNtgLY3l1NlUmW8RX1Gf4+mdp2/PHsrQ3cXFfAEHQ2I
	WiuK6V3CQxNUiwXWGweymN2Nh/MFVvi3OhInCVuW6qlE8t8iQ0eAFMysl
X-Received: by 2002:a05:6122:e053:b0:557:4f6:869f with SMTP id 71dfb90a1353d-55704f68872mr121497e0c.2.1761149036425;
        Wed, 22 Oct 2025 09:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz2OIzuiv802LcnLiAEsfb0ojC3aqzoP2E8vJYUz3+oYqqjTF4SM4lmLudV7C3wmo90WcQyQ==
X-Received: by 2002:a05:6122:e053:b0:557:4f6:869f with SMTP id 71dfb90a1353d-55704f68872mr121463e0c.2.1761149035929;
        Wed, 22 Oct 2025 09:03:55 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d40790b88sm30479166b.25.2025.10.22.09.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:03:54 -0700 (PDT)
Message-ID: <77abcd1d-ce69-42c8-9608-4a9557613d21@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:03:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX9nY1/zPB+6HJ
 D3klC1xvjSTc8Hn5i/RpCmwHFIE/gnKeC7xp7u0J5xGzg2KeJFvRqyPgZYfrMkxqb5dPFB0j7eQ
 5qCUZq08iID6KB9zjId3jrm9vB/9hmgQX7Xi+OlD3NqciyAFfJG5uO2rvb9riSb4Y1qgMLXxTJj
 LsMeEKKCSQyhPjL8uvnkeT0Aooj38/GkZLZ4/CTStPYLWtHIC1HnR5Wa/c3w5/tLOnodNYOL/R7
 EvFyAuS1JQxXK59uqPqcdbzfiOArYB7x/5OiVyRSCpPLPoG7IAQfmRsZwSpEPAgtHOScVzP/jdX
 20VaFdM0u2UknF4XSnGDCET4ZUsfOJKuvb++epkSFXeIGKMJrAGKoPxx5EiCiZ0Px47Uq0cAJ4A
 Jq+CgbXvYhJ6G4an+vpq+6Lc99NC+Q==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9006d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hMcU9Fbdl6L4-kwaL4sA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: pBn4CPzB-V02uj62NH8BG-HNlueZVzlJ
X-Proofpoint-ORIG-GUID: pBn4CPzB-V02uj62NH8BG-HNlueZVzlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On 10/8/25 12:40 AM, Youssef Samir wrote:
> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> AIC200 uses the newer "XBL" firmware implementation which changes the
> expectations of how READ_DATA is performed. Larger data requests are
> supported via streaming the data over the transport instead of requiring
> a single transport transfer for everything.

tldr just like reading/writing images in 'raw_mode' up until now?

Konrad

