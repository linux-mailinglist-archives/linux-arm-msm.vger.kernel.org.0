Return-Path: <linux-arm-msm+bounces-84030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC82C9A149
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 06:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C10BE346671
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 05:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC94A2F7459;
	Tue,  2 Dec 2025 05:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+nd2SlU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUTfvELI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6232F744F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 05:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764653089; cv=none; b=dHIO0BK5i7m/pi3DrREjl8ViPRv7E6xKC23qSm5rAnr0mYTZN8jqyNjEAUpELZ+aq7rVskyPSQYEwDYcIbDrumTdq2nr6TxvkYpYxj3ZBleG/BYgvlEFwuA28v5BRkTAcztWq2hxL0fCNJlD8s8f72KZZQrlvvvATSrtWMM6xzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764653089; c=relaxed/simple;
	bh=sMAQFH9T3y7cqTIPU4FyAwKgTxv5reibEhMNkhL0W0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8MDJ8p1GVa47DgUzm1IpX2W2VCcsglDKn/K+Yk5i+uaE1UXJc9fZ4+mNIiyh+53DkOEARWx6jGFpLQUfveWcaUITb0dvKEngQL/wl4Q3LrKETm8OV1OBJ3A633fJkrNMXSfSyHZjrPxXoMTTEBhpNUrBMlL0q1EVD92tqZdxyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+nd2SlU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUTfvELI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B22klpr1093016
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 05:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGOKj+IpPr9kgfuB7fmrBnwFZOVXU/LLUPAP6NBz7xI=; b=f+nd2SlUDZEDgRaR
	00ERgxCiuMZwjsO6DAJb7YRkC6HBC2KpekRIPXXvqIL1RFqxP+uMLENChio3Rr6V
	3DKkBOC8kiaHYyGc0svmUwwv0ZdVb/4DRYWtfXLotc6Li17mqyp5BikIJ74TWyRd
	AVutewBV6w0gKdu1rxfpmeUD35D2H0jHUqqnD6zVz0xLfyvunX3cchi1lNDiD5Cx
	+2uRbbFKX++EjoaF10y1XHCUjy8iEbA/gunChA46bwQ6/XGWjsin4vN5HshhXUtu
	4EVi4Hj2ywvl+kIGLKN360NcjWSWoeIEbjJGyz/GUl6Qxh7gQi0adaXLoJPsYQyr
	7hJ0lg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asfu11xy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 05:24:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956a694b47so67024735ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 21:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764653086; x=1765257886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGOKj+IpPr9kgfuB7fmrBnwFZOVXU/LLUPAP6NBz7xI=;
        b=hUTfvELI9wnkLRF8aZo4CKH9NcMlL9LDGMm3mcYFa9/aUX/uyKxPtpRvBpCvX24/yV
         HBR5oxlbLtXI/KpuFmuBJOtcSyEJkaVtGEcYOt9iwioRv5M2K0ZlmDj7VadXsaWs9UmO
         JoU2TEMBTkmgAJfaZ9Kh22K9iRUXWiW9ckrMnqQ8dPlp/rv9LO6JDGZt8quDv9b50PX/
         HqOguog6D8oRxKrOXaL0FFiVJdjKYrnSkkBanoKi3wSwDNC9Xk65xoYbO9mx4dwLsbSi
         zD0k5KAiwdLxN9F6Y6OByhOSC1rOrC0u7M4qY/ApJlDdNnG0pE/oP3Sa+PDyBhNwmPA2
         55sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764653086; x=1765257886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGOKj+IpPr9kgfuB7fmrBnwFZOVXU/LLUPAP6NBz7xI=;
        b=wwH2/PVDmvJnljqnhjLB4fgIqELsN3azoew/VdbC1k+na7fjMoeyqFChuc/tm6rayF
         xOMf2ctWH479mHkDNfQyJRggHJI+lpEgQabKDkXEz6BUSCUmC97h8MlnxxNfx5Qf843C
         BL1sJ1bFMBfhAdUcGlizmVQsJyE5qUhG3bZ5DBa/1KWxthKq3KMVEKqC9j5JZ1sqa8h1
         UHFmsTf0I0nA76T4ivglt6nTw84cZAsjRbUWiyevic2iHFByjHx5wqiwoFbawdzFCdri
         5JRB560WFmJyGvKvB+oK018PRNN1b33wDKo2D9ZM0JFDIhsqb+X3GZivsD9EwAllEMLw
         Zi4w==
X-Forwarded-Encrypted: i=1; AJvYcCVLG7zFQznui3AFcpo1hUql7EWzL/C2AyL+keh+Ca7/OomDMFdEYS9CGbDwgyegEkAn4SWrJ4lv4L0x34hy@vger.kernel.org
X-Gm-Message-State: AOJu0YwOik4dTFvgTzPvzxmAWkzCPvItt9ADCBmK/gO/FuALQ45vj0Hg
	JA/H6dTxS2ZAe0bbR19+kBMnvwJUaTXUJtm79NRhhAG0Z0Wg62d+02wXM7b/A4u+VukvHyo8Dm4
	Ol4e9liIxcJ2RiSRsihQQsWDBFMsmnTxuCcpNPn1OQ9qGybVpeo9unhtAIIh/Xwar704L
X-Gm-Gg: ASbGncsgasjsKOBnWRUiXS2LDULDFjEOeoiJfpmOuaIi6xTx9XJ8Kq+ZzRLQytBJyc1
	o6QC2aAAV/9uz61/RPt9j0GwuOBl/QrJAz/vgk1CrEvFB0NWcB2rdnAdeS1s65VqFqD4yJc4kMT
	GdezGfJ+V6wQer9t4G9tyzjs8cn+mzYI0eAy7gmoQ8v/PabNmHF0Ow+tunfTlZMCyGgz5H+Nq/u
	xN1Dr+GVQVzoKz9olzX8ylcEZ74iArMeiUyzTetEkueKe9bmXJwCQb4wyYNQYQjAS6WS78kmh8q
	6pAbQJuc1PwDLtLz3dpKuWpfUyTP9EVQfB8fT+3ER5sphz+UawFzfTxa8t/5jI1kWzTEXvKQBkp
	suI7w8q4djkDLZKy23toczIFd+pivecF38a+zBdcn
X-Received: by 2002:a17:903:4b47:b0:295:738f:73fe with SMTP id d9443c01a7336-29bab167de2mr339040205ad.30.1764653085783;
        Mon, 01 Dec 2025 21:24:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2u+kk0lx9QjdKmPw63AUmE+//BtRpagGxZVyUTpm7aV61e0ljRt/FouY6IS9t2SvBQ9OMvg==
X-Received: by 2002:a17:903:4b47:b0:295:738f:73fe with SMTP id d9443c01a7336-29bab167de2mr339039935ad.30.1764653085233;
        Mon, 01 Dec 2025 21:24:45 -0800 (PST)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce2e676esm138657005ad.0.2025.12.01.21.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 21:24:44 -0800 (PST)
Message-ID: <dcf552d6-dc1e-493d-9039-b7531ebb6a7f@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:54:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
 <20251128050534.437755-4-ekansh.gupta@oss.qualcomm.com>
 <60fe241d-276f-489e-9c74-677dd154b454@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <60fe241d-276f-489e-9c74-677dd154b454@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0MCBTYWx0ZWRfX1Sn5ReDhtM6f
 RiG5qZFAh/uxfLtHv4+5nERYiYZWu0wUtYh/cc6KiW6qqExs4uFVXUYVrn4OzvJhu2D3mPRK67z
 so9TLjm+eS17MW4AOWpjM6KkJMani6c4c9FYRu81VkK7kFSwVoTxuPtayPt8jxYDTsHDBhOWFo8
 7OjPc68aOk24PL8YUZ8qdEfKq7nHsobUskqGfrcqBeyOq3E0EbfS8ljx4xUtbhzu3w0Yl4rhSl8
 H2iTuMjCS7yiCMa63ocrNIfKnram0Lx3eRGF7Qzgv880uABNjGgJn6uaAwnpEkebhVqm0icTf9Y
 wwKbV5hKGE/PZEVNE4PZ0w+Enw1bn7EEV+6VFdsBOC0oVcbvSFc+SGBHnzDqNSyqbF0F4nnqjQi
 PI4Lh0h5u6ZnGs0F8TUwXQ8CTHN8/Q==
X-Authority-Analysis: v=2.4 cv=BJW+bVQG c=1 sm=1 tr=0 ts=692e781e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fmXLCqvIAgF-KMdjZlUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qAHIuZIBUr-QGc9QZTpWutjcd79LsmD1
X-Proofpoint-ORIG-GUID: qAHIuZIBUr-QGc9QZTpWutjcd79LsmD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020040



On 11/28/2025 5:21 PM, Konrad Dybcio wrote:
> On 11/28/25 6:05 AM, Ekansh Gupta wrote:
>> Current FastRPC message context uses a 12-bit mask where the upper
>> 8 bits represent the context ID from idr_alloc_cyclic and the lower
>> 4 bits represent the PD type.
> <newline>
>
>> This layout works for normal FastRPC
>> calls but fails for polling mode because DSP expects a 16-bit context
>> with an additional async mode bit. 
> <newline>
>
>> To enable polling mode support
>> from DSP(DSP writes to poll memory), DSP expects a 16-bit context
>> where the upper 8 bits are context ID, the lower 4 bits are PD type
>> and the 5th bit from the end denotes async mode(not yet upstreamed).
> <newline>
Ack.
>
> so we get
>
> 1
> 5	       0
> CCCCCCCCxxxAPPPP
>
> where C is context ID, A is is_async, and P is PD type
>
> are the x bits reserved, or do they serve some purpose?
x bits are reserved.
>
>> If this bit is set, DSP disables polling. With the current design,
>> odd context IDs set this bit, causing DSP to skip poll memory updates.
> <newline>
>
>> Update the context mask to ensure a hole which won't get populated,
> "to avoid erroneously setting that bit"
Ack.
>
>> ensuring polling mode works as expected. This is not a bug and the
>> change is added to support polling mode.
> I think the main question that remains unanswered here is that you alter
> the non-polling mode mask to become compliant with what polling-mode
> expects.
>
> Is that intended? Will this still work fine without patch 4 and the
> new FASTRPC_IOCTL_SET_OPTION?
Things works fine with or without patch 4. Patch 4 is needed only to
enable polling mode option.

I'll rephrase the commit text to include this information as well.

//Ekansh
>
> Konrad


