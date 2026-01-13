Return-Path: <linux-arm-msm+bounces-88858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59901D1AB8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CE2830478D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398C03939B2;
	Tue, 13 Jan 2026 17:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oar8G33g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCrmyVT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CF338FF01
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326414; cv=none; b=ZfcMInlNEF3R3J62B3BP22BlZyCUcg8cnCGxGY/Y0g8XlmUk+V+wZ8Xg9o1woz5ElHuc/ctxYwyqIfWZToCZQTZpWUOJ6puWNv7E+REhTKKzNEsjqR9IdyeGRYBBDwD4xLujMyvNBeTHRnT4VwyfeUhBHd7DleSsjX+4jaM/Pa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326414; c=relaxed/simple;
	bh=kAm150RBe+Ve/uG5CPwxyZ1geCYlVSsPBaYdKA/Ie8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E79GrlsyVdDqCqCeDOzfLgy7ENf17mJkNaBa6ftmeGb9HN+Hh7WYKKhZi1zZ2c5ZqFAqIMK3REgGvYVseTxwDiGOLDgPlJkf8ZWJ3WiYdAiFG9Ytsh/8Ewfwm/I1ziI6bObrKvQHQNQK6/sRyRc6j1xBKZGp4GahbI7Wcjdt+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oar8G33g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCrmyVT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DGrOkU027637
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c0Rmdrq5iPGvDKU3Zgg5zT1L
	t9NNiWFpzo/icT2F5vw=; b=Oar8G33gVCvJsGFYXPPZ5rou3AMynNwQyDELaouu
	854wRQY2/XMFDi/Pk4SW87Xi9u1WsJgzltJI9t++JF/HwIrMVDIqcdNu9veI6WKF
	t974Fh9fsCioCE3gZCXMmDvL06acqBirn1uY8AZASUyVto4RJMVlXQZkt42eP5o2
	aKT0ELIzZgjWY+0cxIvqlXQJWfhS9YbA61W1f/LbJOWBafn11FzLF1dD7bGVv42Z
	Hi2stKaSDUxEnR/QTicAjJPKFSWNEkILR6Kclvwp8KfYFCgpYTMJ63dJxvdsyU/8
	14GaLM0ns4w9UH/FuzRMnhSmhLf0LJeqlvuNtMMOLNDZOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnsyb86ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:46:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0c495fc7aso82539345ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768326410; x=1768931210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c0Rmdrq5iPGvDKU3Zgg5zT1Lt9NNiWFpzo/icT2F5vw=;
        b=WCrmyVT0AuwU36CwpgQrwuAsqDWxv927X9GTJt2uY5HJwH8jmSNdhs7DTPqa+3XVXl
         dQZAAGWt4aJslS7Sb6ZsgUY7M1IG9RJ7t/5WlMYdUsqm5Viw0TfeW2Z8CsZ9pXduE4MJ
         gPcBuQaxfT4Q6LH863544Xb1Z7teTafmat4dCDsGbr65/MY5wuKKg8Y2/TkKgftHmGX7
         266P0DLrLBc4FgUAPiBTLy6hWei7XvyaG6TH0EOlgvloNXwEtllZnN1zTXqIV9ehL3QQ
         7v3IjaahSGqSLMY2ezN/C2fQPDSxhUJC5nqiJUq71HLKBp2ZsCq9dtdeWnhBMvXj25xk
         O1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326410; x=1768931210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0Rmdrq5iPGvDKU3Zgg5zT1Lt9NNiWFpzo/icT2F5vw=;
        b=BII+Q8nQLrZe35KihxMJ0/Lus7lYPGchfE4JWHoYj5ElEQ/IC8VF1ctSLb9bvTEFmY
         jH4sDp26cK3Jy6kXV4KHo73MMJoBmZgMsLNWcrI1cRfQGWUd5p763zmOasviCZJPniKQ
         4StMw7JcBvadBKMmgYHJ5y8jwEAcKtTg/oGa7BAzbDBL4K+Jix4vzKjdt1o8+2U8Hdwl
         vxJiWJ9F0dGmhV/1tKOfKc6BpkUVsBImSP6yWTYt8aht0cMIRuIztpxVcBOYIV5W5QQF
         oUb8p3lU3N6a2syS2TiI+bQGT//9/YcMwLBIDNzKxhfU7Jg1s+qHNHdBHJDzhT9dqtZ+
         PLXA==
X-Forwarded-Encrypted: i=1; AJvYcCWJMVZB7qm6JYL8Jo332ka0OD3emA3cUZ4yK5nu5KFzcx0oCcAvA9zojgDvJDAq32Ij44HR7TYgV3nvZH20@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+KJP+4Dr/2FHDg/a96ZM1jQhxwRa2PqYusVsNL7cW7dwzyJrS
	+NH+amh4rL87SZGsagRClz7jrJ2z8YSv4/iygxex57a2MGzSv1lb2VM6xUWS0pw5go3ZUgH35W/
	if5zzpCCEHTUnT5hPCghitJ3i9zl7S26WzzOt08u9gzpGMX2lUuAgrE0km1V3lVi7eCK3FAMM/O
	v/
X-Gm-Gg: AY/fxX6xr6DhWyplUjJx5XKyj3ISjCO9cLM2pWPDmM4OEnVCgbQyLNV3s5kUzYv2fNz
	citBkucFaIBLDyn1IcRPQKt2H4K8ZF7LGBDMOynGzgCMCw8qHcNfakB8RQBU/Jwrw8J00QoIrZD
	55nuaJJgojj+6SZecDeXQhZutWFH6ykmhDMNAzCI+REDPayLOsRZFNGYtG1Q0c6/rTJeau+HtXc
	1zVaW+bQJe+yjcbkO6Yag/ER3KJFckL4HTbij0ozZ8zSB280sR8j1IQz+z/dOu+R48IaiQT6Db6
	YVuSH8tuJCUZ4sOePsqjxYmPWPWGCtLUWf4rV2EZCRHk4BDg10wSHyTNs9uCMi/ozZpuxhhjKfJ
	KVikd7gvsWJ9TEg/S5iAgbFv/Tk1q6YLdX1ox
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr213954955ad.10.1768326410264;
        Tue, 13 Jan 2026 09:46:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjmaUwHmPjmnYmFWIlrdB/0BkZOSrvnSsyk0caCsNdSxAUjH1er6rZGGT7crdmlI15yfv2oA==
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr213954565ad.10.1768326409700;
        Tue, 13 Jan 2026 09:46:49 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2e1bsm208755305ad.60.2026.01.13.09.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:46:49 -0800 (PST)
Date: Tue, 13 Jan 2026 23:16:42 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <20260113174642.eba7zkptqnmrp6nm@hu-mojha-hyd.qualcomm.com>
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
 <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com>
 <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me>
 <ee448445-8a6e-40ea-9464-1c2ae52b84cd@oss.qualcomm.com>
 <pquvJnlBgedyrF5RUTrHBUoqCIR7sQMWjwvcpm-5MuqAOxcbLg7i4H2RkuI27usOGZO000h3c90TM_kr6c5UFfViPCzGXX5MNWKFHugevXE=@pm.me>
 <20260113155821.7iesxxuf74ncr7ue@hu-mojha-hyd.qualcomm.com>
 <a7RkLrctXwaW1s2WCUMkvMMk8imG2fGJBHbdsrljwgzYuSEpgRXlSRLrF4ONtCMxlT6hkHsvALfEOps7KBZWX1oIEMh-b9PHEFLqeC1CTI0=@pm.me>
 <20260113164744.6lwz6oox6pdlxn7z@hu-mojha-hyd.qualcomm.com>
 <tKcoAs2SS60FpZ7kb5BZTDoNFMgIBPe3Lvu59uksDQNhOoXPrF7bsvp7rs-s63V_xbnmqV0_nGXa-OiFW6V9a5waP3VK9lLxv30mxSayfF0=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tKcoAs2SS60FpZ7kb5BZTDoNFMgIBPe3Lvu59uksDQNhOoXPrF7bsvp7rs-s63V_xbnmqV0_nGXa-OiFW6V9a5waP3VK9lLxv30mxSayfF0=@pm.me>
X-Proofpoint-ORIG-GUID: e1WrOLyk210P_6ZaiNNr398z38r-I_jN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0OCBTYWx0ZWRfXyiR/RpNEkLdl
 9G3py4Tfx76pPc65uB+l17XqYsUa/JhKme6/p+27iXVpv0EQJPZpwiZjih0jF8U45kSn/BzJgBO
 S8fqnNmRr/7XjLrwNXBVj+FqwgjXBsmGdokPRBZFIpg7SqPQb/fIgWXxHea2v9gLb8IFKN4mAei
 uOXfxx+hXDh9SllmCNkFAxNyFxs49G7TDAarkBVtWmnl8mkllVzLZT4Xumn59X5Sta/HEUTlVer
 PMTQaUlE7yQrH6kc4eV0vsNqzZZCdS6qSSRcJRPu8xjeZiQ+YT5UjpsYtmAS7nkSjheh6I2d4y3
 j0qL0G3PLBAsNyCKKosDrOBQhXljvVbKCxHfu9tmCxR9sZ4p59oITHMS8R+wP6+bO0EW7DID4Qm
 fLG2jW95TLK+QX9xzq4jySL7hO4cwGM5MR6sfRELbcuuDTRXtEkGMtGRDdo166vAp3ZoE7yJ6NG
 5K4tWx+xV4TKbChFSJg==
X-Proofpoint-GUID: e1WrOLyk210P_6ZaiNNr398z38r-I_jN
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=6966850b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=k3Xfc6bkAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nV5-Ws2sAuVwJ0BKl64A:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=vs4QOAmQMkZ3NkxV1SYa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130148

On Tue, Jan 13, 2026 at 04:55:56PM +0000, Alexander Koskovich wrote:
> 
> 
> On Tuesday, January 13th, 2026 at 11:47 AM, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> 
> > Just to clarify you said, there is no issue if you just use dtb and not use dtbo ?
> > And issue happen when you start using a dtbo, even a dummy one, right ?
> 
> Yeah, the cases are as follows:
> 
> dtb only (no arch_timer label) = boots
> dtb (no arch_timer label) + dtbo = fails
> dtb (has arch_timer label) + dtbo = boots

Yes, this is expected..some nodes in dtb is expected which
gets patched during boot up.

https://gitlab.incom.co/cm-ayn/android_kernel_ayn_kernel/-/commit/7ae6565108654991aaac9b73a2221509511e59d3

One of the reason, you will see below change to fix one of the expected
name qcom_scm in the downstream.

https://lore.kernel.org/lkml/20251217-multi_waitq_scm-v11-1-f21e50e792b8@oss.qualcomm.com/

> 
> Alex

-- 
-Mukesh Ojha

