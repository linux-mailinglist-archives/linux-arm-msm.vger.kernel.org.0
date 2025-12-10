Return-Path: <linux-arm-msm+bounces-84884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4EBCB225B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 08:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A43A3027DB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 07:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4F12D9482;
	Wed, 10 Dec 2025 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pby8F+tb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5NfMvsv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA6A2D47F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765350434; cv=none; b=Oww5+7r0aaCfqRvnSL3w43OCrUKtx7EtFyjLB9DoFNe/nHCs5R/LSOBRmXG0CfnmYWKtzTOYQmt1G9QHv0A0PhfFu5TCSJIYRu0J5d2F7mjy78/m/we+6H265NLHSuHN6Eml7aiN2sMAdUFmG8eCaKPPpD05c5jOAuwqFS4PtZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765350434; c=relaxed/simple;
	bh=NiyXanpsfhVgv6gz073g8MPx/HCF0VxoJePYwihCCmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3wnP3bWQMh+UuQFbDI/Ov+lzPJn7NoLRwSDClI1kUl5rAjZ2rJ5yG+ELQXuZ82Aa8nyMJBQKH1QIS6ydO1NOFI108Q2hl7Kp4wkOyEc7ZpZdQ3giiWJ3/kPpGpGqxPm1M8SBkKaj226YkAdjphOpAMmsqgajtDXx6Mwnrd7x84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pby8F+tb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5NfMvsv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Detj2175104
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NiyXanpsfhVgv6gz073g8MPx/HCF0VxoJePYwihCCmU=; b=Pby8F+tbBD4W+B/M
	QMCm33WmbSt4cUDwzauZKq2Q7zt27elELK8RIV9QmEcZdTEOKQY4kCk/nKlKVqQ4
	fznD3zEegvHAGoM5ijTFFvNTxSmZRa+Cw6Wr/hV+JmWQWy+yOli+Ak3kMtTLWHCh
	JBbdNamYbgezPpsw4XeAIOXPSBeg+3uecKIbUh2eE9aZoix+tyrEG3JMdjIZMeCD
	tFr12FCuSNWeH53bScaVsF57ldjtd14uGZ2aupqv489eTbEQYS1iXkpzSwue7tM4
	P15N4znFPnKrKQGF+P55TRGPa/9yXz20xZJGorgB56W30ioTvpEnZr1gzLR6YDLt
	ofp86w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xwrcsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:07:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so11424480b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765350431; x=1765955231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NiyXanpsfhVgv6gz073g8MPx/HCF0VxoJePYwihCCmU=;
        b=T5NfMvsvDTQ4q4B+Jlu0TO4tLJnj0lg+kCgPQy3JJR5JZ8MNsUxHuRGrBBpxkI22LR
         tNBmlI6xePTss0FiO8g9w2OAZNCeXEh4rhtfI7uppbNlU3O5cdZlcvlVjrkjW6GPUKJN
         xB19Q+P6hUwogks79PH4zgN5fhI6yJoOvl/MjPHMKencqAT5Fpg3hqonfmswMqC2CWGP
         0vavs/eqq27WBnhllJ7hiMOz+7PiyWCwnbZ1DDnz+xRME4J9ZGnlicPgUtAK7BNq0s/0
         51of1T47ga+F//OmEFYWLQr/zzATwJzD0RC4v06JtazD+YDQBKhKDleoph3PdVRupEoV
         RJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765350431; x=1765955231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiyXanpsfhVgv6gz073g8MPx/HCF0VxoJePYwihCCmU=;
        b=fa3MVySiQRBb9SctVM4sm4Oa9syYIt2TaSrLSsMgOO3dy7aG2+WbbT4wBr3Bn9D+js
         gl94BkefQu4BXHnl4Y2HE2wtu7WhXufuuz41mrh4ueRjHYgdr0bCx80SqO3EkyXWagvM
         scw4pMmQiJ3tha19jZ9l3e8GbWxVaJZvid1xFy5KrtGsjv/D/5UTutA3oJ8vKJMBRPU9
         W9K5Kw3Gurr7iFqsvJkiLPMHekEqg+qd5hcsohchYggvkDG0w/vL+R22GlzZy/mcV6Gq
         B+nfGZ3Fo8UNggioBDzBvkk0CUIi4Nez8fbTFcXAglL2U745k5wlnfzPJ7mhPD8wSJ91
         LuWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcSZnFM795958WtwY3PdLCwVCOEcG0vsQwLId/DBwfJD1lHk+MJnb5TMKIkVh8fpazGPEcR1ftoydchwaD@vger.kernel.org
X-Gm-Message-State: AOJu0YxKaDNKneeMNjQTj9ajSH5tgBY8Ycn1f50NlzXdRpJbCmQypvFw
	BlAxMBqaeaEkYbpZG/FVcH3XDnGl8Vd9LyNRYM2ibAeZJk2oktY77wUWnuMdLqAyw54dlWbaUj4
	2mxjDnnv4Bdu0t48FSkMrzQbv3TlsCj5/+H2yIaKLKdBFUJ2CyNtwVC6fvyb/y7Emlj29
X-Gm-Gg: ASbGncsEfcEgA5Eq6d6Xhg5vHZ4K0dJ94L7LB2kErRr3QUzsGa4cvv6qBpEIRmYij9a
	ENuarn6pkgJM7sR5eRP8uUuP/SMsCFLfZMa7o9+tAxZnIOBFu7S2UY0/o3dJzZFqg89HY55rENy
	HUIuULpPDmZyrCKzBwS2NjH2ebQ/3K0ReOerXIKfOoMAnFK27Fxj+llRDKbQXx5ZQa8YC9rIAQY
	jOckdtpuzlcGv4vuwzPx59dGklFNGJrH8kcIwzGAnHUUKVfa+G0PYY8Lfd/wyBEoLcDgVQG1AG3
	e0hni2f6P2+3XORlV9Kslod81D84xIvPN39JY4ofotJyo/TF4gDMnA7/J098GnwyvU+4y1xm8lv
	Ogxfuqjep21v8kskJvmECIA1I3Mpafo5CdMMHWNyY
X-Received: by 2002:a05:6a20:72a1:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-366dfdcdcbbmr1403376637.12.1765350430625;
        Tue, 09 Dec 2025 23:07:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJOdoKhw+chafPNDZ6WC4Wy5WqdXiFGHDwU35IE0le7EkyzbFaI+NXUGJ34EBRL0gaSMjKiQ==
X-Received: by 2002:a05:6a20:72a1:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-366dfdcdcbbmr1403343637.12.1765350430189;
        Tue, 09 Dec 2025 23:07:10 -0800 (PST)
Received: from [10.217.199.111] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf68155047asm16694655a12.7.2025.12.09.23.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 23:07:09 -0800 (PST)
Message-ID: <87454dcd-9eac-47a9-9d0f-e2e10791bc6d@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 12:37:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Enable cpufreq cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251208114558.2343462-1-gaurav.kohli@oss.qualcomm.com>
 <a3mzhjs3kl7yfrar3gh6p3benvfa5bx22xwuznaqlhyytlyxkj@r5p3vfd3ykde>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <a3mzhjs3kl7yfrar3gh6p3benvfa5bx22xwuznaqlhyytlyxkj@r5p3vfd3ykde>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA2MCBTYWx0ZWRfX9MiRXpygkyGH
 nW4HZem0awR/ft1VcqjUm0wwj5t+5kDuMDrgUh0396fx07s1zeIUdZ8qSBKWdwBq2502g3uQvqT
 lrhQmG/5WH6MYqM9hTNhFj2v0NUDNO/O5JCvai3ju/5SmlQwbLPvDEykF/gyWB0amO5sBJCy4GT
 1nrKuG74AzRy9gWlg9A7yrLLzyWtMeGOU7qOsbrkrFSLfNYaFM+LsoK9lEPp0lYrO+MoqOJhO0g
 tS0squXtvr3bnlDtzJ8CQvnRLfBU8mnwtSvZC8E7DsIPVObrAfJU3uzx3825lRNDAid1n65AJcF
 cCURAhc9eSvtzNgfP2LUCE43RBFL8L7+WdLOSZW5xm3AMVS84NQzL40+FoXKKBU0n+vove/DGJp
 clysZ9Khd/1v5WJttzNkoAZGlSgRyQ==
X-Proofpoint-ORIG-GUID: olcqetmMI7nTlba4nwTaeloEBWO1zYkR
X-Proofpoint-GUID: olcqetmMI7nTlba4nwTaeloEBWO1zYkR
X-Authority-Analysis: v=2.4 cv=F/lat6hN c=1 sm=1 tr=0 ts=69391c1f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=D3e1WIiYQBwYsdH1qrMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100060


On 12/10/2025 1:38 AM, Dmitry Baryshkov wrote:
> Are there any cooling maps to be defined?


We need it to configure from userspace daemon.


thanks

Gaurav


