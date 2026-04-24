Return-Path: <linux-arm-msm+bounces-104456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPHNK0RY62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:47:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAFC45DF99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14DB3300DD56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7986B3BED2B;
	Fri, 24 Apr 2026 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1XgbVFz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfRytoEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E966846F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031233; cv=none; b=EReZdrc79HSuuE+w+5gW73BHveT+1dZUEYhc8RFKw8k/o0SICD7wU/qFtf3uoLzqLpxk0XHA9KnJcz83hlpcqZ6l3h4Y1uR9VewG/leJyTKSG4fLxkAIzHpy7Yyt18FFGwD3yZn/abNsbmfwCSotUjrdp/ITxDN8djEI2xViVng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031233; c=relaxed/simple;
	bh=hsfN9zqUQQPVY6wVotmB/RKKneXRti3CposjCB6+Lgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oN7EqOu7Z8O4463w3QfKjrkZAFMDLCpXW3xkI63bJ645z7n0VkkarnSkLx5m3NhrLAg8qf2zLev/vkukf+W9Y0+YjAK19z/30VLK2zpnHnWPwiuZQSqMf2BKZbhJdsyF0u39kt0kLUYG4Kvvc6GtoZNpGerBbSSjy23dYVJ2Fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1XgbVFz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfRytoEb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9YLmC518505
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xp0jm1bju2i0TWQ0regUkm9kkI1kpmGQXqWOuUWnLw=; b=Y1XgbVFzfWFRWnRK
	ko8fbb3Ty60dIncQWfDCy/pVT6J4J78HVlXDawSUNgAmwBIPMBSSrxLt8hIpfv3u
	A9eQPnt7lp7LUy57ZIaGoVpzZgOttCjUfXZ5QLlVcdcsVQDrZqX/Xg03wHE6X9Y4
	CFkl5FzcPeJUmmzmFV0WWIHBIXYnxdCZv1fWwpEVYbm3/0V9t9kNsg4zQ5vaVKBy
	oX13LH/bLGDNwf7IM/77tfh4+jwcSrPcUI4upGvm1TK2zBX2HgjxH7Mp/LrVwMkS
	tu/0efujFZiAYjm2wWEwhJqkfLE7wEcMTRXIKpqTJ0oBgl2LpEI5GZIHIbIqt75F
	oXZ1hg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnhyxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:47:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d076d88so13812811cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777031230; x=1777636030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xp0jm1bju2i0TWQ0regUkm9kkI1kpmGQXqWOuUWnLw=;
        b=VfRytoEb1y+eHdaCLpMfidME9z/dedkno404OWx1kX7XdmUJKB/l5BZapJVDtdG94x
         blBKDx+bEotYRoBVCeY1eCfLrw+GrZC49zt3ZlQK0eI1i9R9NawbkCd1QdcxD/jZ6T/j
         3hi0m7co3jP32WsSH8fAw5xkKUDZQ2uPTVRumvytP9M19HOpxAFVppHmdDsi/Qh3mTZo
         mG1qHn3hz6Mr0QR2XPF7jTYLlgC3sXnjkrcggiU31AzIE/MHjmA32i/6bINkIT3+QUOc
         sklxC0uldQ84Oo/0tGgEqlyKDVjMdR3tRsmrLKXh1QlQgaPSSyo5g+QGktsZYeMgeRCY
         f/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777031230; x=1777636030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xp0jm1bju2i0TWQ0regUkm9kkI1kpmGQXqWOuUWnLw=;
        b=YftoKg/owIvJPDhb1SDXc++XvDciRpfUMU4c/yy5jJH2DFaHvCcgQb6NNAdNr9bsRU
         2LabyD/Q8+KgjoOOApOIfdJ9FMXMAaFJRB/M/1hl5GFiDdS4kadCArAdUXklC6Q1yzgO
         VPY3v3b90fuopFAD1c/azFBdvQ/rhuk+VnA0ONqD/VB0/2SCZy2ZppBCIw+ki4ETDsoL
         bL5BSsX5kgO1WnMCIEPv/0O9q1e8/aMs5hmO9kZ6l1IfGkqLzfyot8lAWtqDN7ElhvwG
         TunrcDSpFnYNNzUtylpKo4weYR9zjUZaKMyzujo1KTv4oMo7qUjFXAKdGw8x7XRVt6wN
         YkXA==
X-Gm-Message-State: AOJu0YxthT+Ws+DU4rNtE2WbC9yPqG0STMdfe5mq2Z/jm3yb5RAIEdMP
	/Ic+anNDgvCjewsNKcZyifDkeXrfnFEZIBKV4QpvNu0bUswhYmbMfN58ctQ30j6Ts4rG7F15tJx
	QCE/z2odqaYOqJPIlEWfrPMFAZqcA0W9mg63O7oTtoeSY3r/2P/SzBRcVri8N5zH0Z8YY
X-Gm-Gg: AeBDiesmS7oVmOLjDyuETOSm+Vs2n3zMsHLGsVvSO2etzn8tdfkvk+yIKTMJ4pPonnm
	tAEU1cQYlwAhxkcR0nlS0ueZBDMJNSJ5XUFOm0U3qjtSNSSN+FlFF9YoTva6Yzvo+LhpYziD7tv
	tPpqyNIJHjxWg0mqBnFaTlPdW9EXfdLmi6OYpbnqOvMPb6HCS9sptClrI9vE2JWv0HCDqJHu6+U
	v6Lzg6gHlNiDYAZ9//746Oh5ZwT2rVFMZBvSQo4t0M9v+gXNGcy50U/HffSZChNW+kqdRWXbiL6
	OYge1A2hOisU+gHwIeR3DKTGjuuiutACUcoETi8wEmnsfCu9ioglELRo00Zy3//Yk0iUcCzNWan
	NfFzNPK/4g3FAGFPq7JXv/KwPEHEKJrsGcwpdOPTvzfn3g+iqVLVVffDO4nLw8CkTkMZBC4F+jU
	8zexzp9GcT/HtaoQ==
X-Received: by 2002:a05:622a:4645:b0:50f:ae67:96d5 with SMTP id d75a77b69052e-50fae679915mr135702661cf.4.1777031230605;
        Fri, 24 Apr 2026 04:47:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4645:b0:50f:ae67:96d5 with SMTP id d75a77b69052e-50fae679915mr135702411cf.4.1777031230164;
        Fri, 24 Apr 2026 04:47:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c435sm768221466b.43.2026.04.24.04.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:47:09 -0700 (PDT)
Message-ID: <73cd6f96-07ea-46c3-8f6f-1cc8086a28fe@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:47:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org, val@packett.cool
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260417084749.253242-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb583f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=yr-2ec9jEi1U7REnfNwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMiBTYWx0ZWRfX1z/PBgfDxH/o
 9V+qfT5cHk/QEhzyaLCMpC8e2+iAqE6RPE5wLnKGe8c11/zzm3cnEeXlT6ftoSGheBGpAK0z8kh
 YnxfWLYwmkr0rJei9hgpnbm9rG2knSuSOHkcq/9lGLVt4saxXnX9Zv+DhTCCJSwBnd+/Cb2ygxa
 LNJ4RI+2gBNC4hPY40AIpGAO+1eI6Fr1IDACaRJlYPzJVC1JcorOrfhHOuCSWbmiIji7SP9r1Ql
 /wOYE/gDvEtZ9Ef7DM988Pyh5Qi08uC6Z55gvBgXhOLfrhy8M48N1ILN/zil9ICljpaJ+tg2YbX
 r5sGWz+jlJHiamNpbBGjdFKzFA1a95VzPAmj81lnhROt2/aedYmoWJ0ToTT1Tt8RmQEOgYFNNRW
 Rb2UeWMVNX3y/JQpW/zVW4H8AAD4guFHM8DXblIOP4WaXy6afp4+M+dG6QtfTaVFhiw2eN22hJ5
 0/i5JW4PB6ArWbq2UTw==
X-Proofpoint-ORIG-GUID: cq0DyEEMxMzqm6ZDL0OoPJcRJAB7PfxL
X-Proofpoint-GUID: cq0DyEEMxMzqm6ZDL0OoPJcRJAB7PfxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240112
X-Rspamd-Queue-Id: 2FAFC45DF99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-104456-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/17/26 10:47 AM, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

[...]

> +	hst_bt_en: hst-bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		output-low;

You shouldn't need this property, since the driver will control the
pin

Konrad

