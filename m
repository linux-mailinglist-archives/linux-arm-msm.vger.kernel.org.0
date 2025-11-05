Return-Path: <linux-arm-msm+bounces-80409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A5C349B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 09:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4F021920072
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 08:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9712ECD21;
	Wed,  5 Nov 2025 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MacXn/Ie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKrVDJ9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C002ECE9E
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332704; cv=none; b=F94QGH2r1MLYGuVDvvtlg06lrn+EgunMm9cHKcx59fmriUQcH0gFCcoUKADBPZdlFHNv2B7vbVSSnLuUW1n6xZmjkhqayIiyw5/+VPsEaBUehnnkVEE5NNeJ90kxJN5JD69Fb1VclJMIGT871FB5Wa0b7kYGZUAn6RCYVK+TMK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332704; c=relaxed/simple;
	bh=d0bMgwYGLUbWwQ5ERkqkhDZb1LoSzCYkR7394pA0AiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIQHOyTE8lUQprhz87GamxzfZ0yrLb2zW3Fkpu1jC/MuRjsVyr9iE31vKp/hMZTCgDKRmSam325GRvS1S8LDXWfjy6rdZJmTGeHgjMLILNOEtnzCjJxDaes0MiGaJBAZYUJe0IxkKQMqRA9UDEls5RWnv1OSM6FRKo/5BmQ8Vhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MacXn/Ie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKrVDJ9N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58K3U43164678
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 08:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9izaKi/37YdD7Vt7gQGjGwEAmilLW9eyuUU4XYRPOw=; b=MacXn/IeuGbJuE4j
	wckOCLXMyzABVkYtoQlcbXbl2LnAPJk/bvrxciicyLWj5ArsPqgZIt1W3r8r2eSo
	Wz+Q+IkcH/FCoVOEC8udC1ZMQVyFbeKZmgu1J8Twqdx7vrC4YZQZRStUVdebPLhR
	jjZ0TtnzxIu3jAHHnSGoBQ9acGkb7byqmo/GnwAUhHC49myHK/tl5gecgeWaw0pp
	6wLOJ4M30EGW8jDTRgsszA1EDgJk3eiNZpGqQm/ueBxi5KSHb5XguQqni/Njmgm1
	/bNrJL/2OJOOxt4oR1svKMIPG5SCOVE00lQLSFFuvAhAabS4YtnLmd3tDhi+YP2+
	GVVmMA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ketjysh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 08:51:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8804372387fso17242396d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 00:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762332701; x=1762937501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d9izaKi/37YdD7Vt7gQGjGwEAmilLW9eyuUU4XYRPOw=;
        b=dKrVDJ9NXBbwE6+SrWXIXWgF+b3dDyWiQ+W5mXKcoiyawKH1ErjfFil1+UatoAm8EW
         53v+cMFblPLjrp1k7BAgDfa0R7rIn8coOiHDAkG4nSr6dvcohDBXwHmQ38yBFoH/8vSH
         8ilfhJarcDTxO/kg/IOKWQeumKs5DNj8GMwwbqLvZ4zc4hG7C5iqI5a9bSo7O/XZEMzE
         GzZt/ZGEogEQQJ3OJlpZdmJeb2KRcFOnvKdBohb703g+8CibabA+t/YTmcuQRV7EnMzQ
         /U3Aimt03yAza0bP5LOR9dH9c+4LzdNHjVcVLMGd0NBvkHLDv6xEF9J117bmMicBgbaz
         Jgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762332701; x=1762937501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9izaKi/37YdD7Vt7gQGjGwEAmilLW9eyuUU4XYRPOw=;
        b=hFEp2PpthDfZmmMlnNqzsYF7hRjNWuV3au/jZi/EZD5leDzzQDtmuoL6nkZSx4MymX
         X1CF68boz/3SZOgG1izb4/M6w5muGhiGSpJh67usxCcRbwi/ufRbdmcC/Mn4cv5kbPA1
         bZR7YvpZbM5S3I1K6ikdNu6yKiH3Jd4WbJR88iCH4v3cLhJwVpkqWzHTmImVQvjhnU73
         Namx0bAnJSg4HLK6/NgxFNuJLaVJg6SURK2mQzzz4+zCtuFQBI2XpAa8m/f+zDDvzMGC
         05LUXodIBSmhXAt0jD87CdJPx+31pX+OA40/0sKnVBa+pbQ/i1utTvk5gw5NFyTpRJt+
         zxhQ==
X-Gm-Message-State: AOJu0YyVPqVm9duPR3GZDVzq12TRR3LhjjKH3MyrqU62spAYV/gaxynI
	FeceiUS7Yp0aqApcS30LMvxZa0CCSvJliKdbRPmkoiHyDKxQu55utCe52OOx7aw05ehHeZmzx4n
	oksh3Y/OSPDhONSzw5c4ECLKpSxuhf1K/6VHo7WOG1JYJ8ba4jvqItE2OWCkDp680QN3g
X-Gm-Gg: ASbGncvAgn/kG1JH9DexVKc2LmTutd+jm6Zytx2WaYQbiHTPAcXGLA5G7Sya7VqTG/t
	kzFKOfFXTIKnQE0FxHCgCua4YnnqrsjaLWM1W9DEUbTXtkR8PUE/zdEo02ORjTpNq0Bk9Ml7fGv
	AHVznNPmzofQJUFQN2Jeyr8nqHc8C/Zw5kkeIdnIz9zQxNe2ZEourYUx9j7n3yN1Dx9Flxhz+ln
	35g0ZcfipVYjdaTm7jnEjU201vvqMxclhf6R4g+VhZGOgUGybIVIwV0Y6qCtfKzYMnynLVzpzQs
	i0+gygChkPql4Dg4nZoghUcVDAE0SCi71wuNs/LK+Nef/IrVe+ilsgvdinMRVwO0WkAPDN83JkJ
	pnr7MJeOrVA5Q2cSxKkZufjYFpVmccbgGBJRmqER2dUuWiVIqf6MCl1Jk
X-Received: by 2002:a05:622a:1a9f:b0:4ed:4369:f3c5 with SMTP id d75a77b69052e-4ed725ee834mr21592661cf.12.1762332701117;
        Wed, 05 Nov 2025 00:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8BF9xVY6+n2uyxJUIST3H7zllQ3FZVT76UKK8QHLabE8qTZfJdc6qVuYCZ3/l7BmrDK1mmA==
X-Received: by 2002:a05:622a:1a9f:b0:4ed:4369:f3c5 with SMTP id d75a77b69052e-4ed725ee834mr21592561cf.12.1762332700558;
        Wed, 05 Nov 2025 00:51:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a5c773sm4092065a12.18.2025.11.05.00.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 00:51:40 -0800 (PST)
Message-ID: <40bde143-fc3c-41b0-8861-9c856d52bc8d@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 09:51:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno
 driver
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2NSBTYWx0ZWRfXylPy6DEO+yRA
 3/flZycwU0syFlopzdk6odSBEMDhlFf7rhKP0Tq17u8ySiNPNBzy6pEKppeEYyK/ItcFhINMTOY
 l+S7F+RalNmV7i/zY7tqUDb5WzdyCnFKvSdF65oH48SErq1uFo31jVnEVtx+1/P6ET/givmPmaE
 4AhPL9NMuEF0HWAhsyF9dJzK3RxVTN4o6sOj0kWzd/yT73S7tnwSS84rMrqBGZLhVpz7xSGCuVP
 i0ZwlnLsYVOm/k5yVi60GZWHtDg0iVRFRFMrxjAH2Seu60TuO3ZZcwTI8cVObBx4hgumpGYPqfh
 qfNC7ENSE9vLUyXDw3DQOqR0y4IoX5Y7lLqMEjZQixvMOJC9dm+SX3tQQIqFZ14D921hH+jGQir
 4sw3D2hmk4NqeAQRtJSWVzYKxma/8g==
X-Proofpoint-GUID: lQiwwshoDVBDaqxIZN9Am8y_HX-P3gik
X-Authority-Analysis: v=2.4 cv=IdSKmGqa c=1 sm=1 tr=0 ts=690b101d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V8cJkdWAq56nonIdhLQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: lQiwwshoDVBDaqxIZN9Am8y_HX-P3gik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050065

On 11/4/25 11:02 PM, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

About time!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

