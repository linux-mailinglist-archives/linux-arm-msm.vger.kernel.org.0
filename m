Return-Path: <linux-arm-msm+bounces-76262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2175BC2953
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 22:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CC3844E05EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 20:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7883021E091;
	Tue,  7 Oct 2025 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKLFS8nv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F781E32A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867485; cv=none; b=JPiRZmCW05/1rBmzGqSxulYvMJ+xY0NUGO8i67G3u1j1bUNB0dywt9f5SY90I+3EzqzfPWNtglqrII49QF3TrP/lpE4Y/nnSs5zZiwurbnozeSjcMWDoiZl7F3Y2SCN+nBqzQ0mt6vHfCU8u64Tc5gAhVAt6WvjWxj6UE/cCWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867485; c=relaxed/simple;
	bh=IMsuE3oKs1X9cgHV0+3EF1wV+TDn7sSA4pSrSdB1dGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TleESRaux8GD0igrjpyOkZ+Ldnfb+Ygk3U9R758wu6eBaAsEsIl1T43D+rJOSbEwtf33CRPBP689vbRW+zpYGDnJ/YANTmuMblLdKCQEaQGJM8DFXHq6whqoey7/jiEYMaMZjlVsEMPs1y/7KbF3iZ3pgQMnEgxWHQNGh5j3Bc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKLFS8nv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETRSM028132
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 20:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Abil9l8066GokHuKaozU7cavk7jEryoaV8J4jfhSxoE=; b=MKLFS8nvsvfEhmJa
	A0PvcZNIc1kCIQvFUr9S/SU8SbVXvClU+xB19S2aPd6wE7CPmqUMp9GJ2zGyilMk
	w+6GvA0m9Nkto4LyYgMC03jrgTh2GEvHVxa6T1YTWvcb75E62G3zLLOJyif9e5iE
	e/eSJ40hg8xoCTd6JyskxnvDm+VCiIlKsUC27m7eFMfDo+0ZEsY0fcPguuNXm9pw
	h/g7Q+V/qCo81Ze4/xwDiPnMQTTw8+h3o5WRMijnh6BjO+A6qj9R+aXmMA/1Eg39
	EgNQqNmvWrsYIAREarlPfBIB2j0KOozRUYA7oRMTWHzer1LYZDogCu+HCtg6fd3v
	ab93Bg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0m6eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 20:04:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f64c5cf62so5068416b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759867481; x=1760472281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Abil9l8066GokHuKaozU7cavk7jEryoaV8J4jfhSxoE=;
        b=muJ4+nL9E2xj0sWBDbf2Eio/NUG4ZP7BnUTadYi418bSfs+52tA6jBsp4tJKuoEEKc
         vurgI4BIMoCM5HTURdx4+DI+KAKy6IKF7rqor+y/rq2Zwudw2jZz5hSNYooqs72vbtgV
         xcl+AhlA6Np/1f3fu44G/7n8CUsfwpaGs0EAW6glub1iNOx155LoRSHuiJZzN6HpJgZt
         zx+UBhDcXczwdYIYvJRASzF4N9jeQDgXNz7Oqm6vpqaebDMb9X8o/0rnWVUKBLReBgoA
         Hn2EIZVkGrl0vFX6ecoI/SwNwKjxhimCUThCmYaqV7UnYPLRfsyndkspYtcYYiMb0XRd
         t/7w==
X-Forwarded-Encrypted: i=1; AJvYcCWKXSIzo0KiqFD2vgARiLNIrxYsmt8CTjZyzuvt9bvdZ/pqOhV+NQWGAkjJJmnFku71IZh3gGJJQIftfxkX@vger.kernel.org
X-Gm-Message-State: AOJu0YxFUBL/NgPGA6YT2gOX+QetwJuwYcL4tESTlQGZy0XEbdGZKZLs
	IMWmioCJ/e4XVULsjoOi1LaKOzmNgoEeYeDj2b6uIUqR0PAZEy1b8Ks+iKe/z/2BXuFmwBFALIL
	uGSpemwf4eJCKm+9o6WkU7f/O/1xHv+IjOFh4uJDJnjNzNlZ2/C2boYkjQMOEWGhhoqiQ
X-Gm-Gg: ASbGncv4TOJx7nSGQF9BOtQN4n3pKsQ+0D1s7iixu+qJvV3t4OGSixCUbbakKHjsRJM
	UdmH9jRHedGZAvy5imuhL3XTqNrxME1Df6FNKFNhNdZ1fT0PEpyGqgMha/rOe4qHCyWfppk8nkw
	M5FL1ILDMvprytly46mlxJe+Xj4D2z17jD1yILPZPyJeZwBd2qXRYtSrXBhN7Vjj8SxQByXJ76R
	sg+Xl/OEZ8OTbDY7jqygPUERHfAKFSlTDfFhORtMmGOtrOKWMvw6tZmWMLG7c72cKRohOL12569
	v5kynLkB4uaBzcN9lJfIhH+mEM0/AiWb1gc9/JkDnIoWA+WWa2kwe4ZYOVeTvRyiFey4eGH31vK
	GR75Nsd7uvxN6jMjAf38=
X-Received: by 2002:a05:6a20:258b:b0:319:c639:8855 with SMTP id adf61e73a8af0-32da80bc6f7mr783660637.9.1759867481199;
        Tue, 07 Oct 2025 13:04:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb5aCauV3NchB/JImGIr3TASAhAneGzvWzLKzB2WODW9O16LNteFKnwm1qlXMXDPLuE2tSIg==
X-Received: by 2002:a05:6a20:258b:b0:319:c639:8855 with SMTP id adf61e73a8af0-32da80bc6f7mr783628637.9.1759867480701;
        Tue, 07 Oct 2025 13:04:40 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206ea2fsm16261097b3a.66.2025.10.07.13.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 13:04:40 -0700 (PDT)
Message-ID: <d2efc416-5d51-4dd7-8441-49e40bd1dc47@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 14:04:38 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add tz_qti_config.mbn entry for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xSBuqO7mfLcTn1OsizFmDE7gteTSTgpB
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5725a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1Z0hDCcGVLcS_5OZC2MA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xSBuqO7mfLcTn1OsizFmDE7gteTSTgpB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX8UEAa6KInE3o
 7vUKBsjsOJmMB+DGmVKm4PWFEqlw3o3pEy5uEl1VizlWFCmwOgv/IeOmKhgDd6zT/Fbkt+prGZ7
 jN7VL+/ROGGqkKXz7AwLDc+flOdVHfFZXoB3XtyAKKFromFml0x/rux7HPyzy98FYwhq9UKiXFh
 fcTYiMiHxj6aFZo0SVShbVJR1oGNP/fADz2K1YBYDXLRkQuNZPfmWDGP503Wtj4vMScDj6z4IJW
 lVb73hDg4npnESJX8gtuTuKGU6AyVlRANCyELtrjE+jYLY/OP49FfKlq8lRkLLoUQFs/khae2zh
 oCkhJxs+NloB0yP9iAW7NSY6KIOgq9xniru5eyBw5a7lBN3CUaJCp1dzaSgHAD/YY9YpUasg2zm
 3PIusUQqNtiZSMYHnOqw1ASBx7iyYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 10/7/2025 10:19 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Update the Sahara image table for the AIC200 to add an entry for
> tz_qti_config.mbn at id 76.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

