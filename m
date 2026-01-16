Return-Path: <linux-arm-msm+bounces-89345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B47E9D2E280
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EB433003BCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832713009D6;
	Fri, 16 Jan 2026 08:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZChx+WEV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRdBmqtk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA33081BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552820; cv=none; b=b0NmLdZ/JwZKPJR7DSNqooJ8tzWK0RudMFjI8QqxKf1rZNgCdoGcLcnhPvqBhPzcKZSBbTHntlRL+LrOsDNf7AREXXauNsoPYaCIH2JW0v4LhmbD1m9+0dj5kHojgbgkfTSZt+zhBtXbnYc1VJ50QvRAsfCrjdxgPwtGUTM8/As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552820; c=relaxed/simple;
	bh=fqUwRFzeUjEFczFejVS+bnwpgTgDWhuY45iRib24h7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9d5wmmdkVSw+b7gDDWeIeT4fLFy7ikKj7EYewmB18tmXoJzaWe6dCuqVibChDhzgtd0pkWozSaPSZ+L9JWnjzna1oJUBE/bZLb0DJgYWyzIrnhd2H03LLaoMMcb5X1BkxFmgZcry8I91uztuNLlRSl30gCkpABbv6b+t9hqzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZChx+WEV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRdBmqtk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G83RCb2615451
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Txy8J4Vb0aQWuZ4JXQ5+k5jz
	A1F4Z/Pr8YK+encIf14=; b=ZChx+WEVyhXWBobvRYZu7VdvnMt6gk08vAUzSajc
	gGworwx8E5ZF//Rq6VvUiCfSGTYUCCz89uL+EDyqbY7OIlM9pS9+m1+Afbu6nc92
	KAttgr/b67OUaYsD6CuC96ppfKZTe3f4ooRHrsW4uijMwFKVOwsC67wGxUflgko0
	N0es5q0fccQKAOjKZdrkbnqtZsZSiTk/Kv5Kdf4lfoAqTlmguMuG3oTyX/3CN0b6
	IQtO41P0IGnushMvj3qsmbttM5gM83ynhq/4HTI5fZF6ZlVVhwnNDqOAYO96RNN/
	4+smK8AHUWwmx9ltHtRBcZ1PZzNIY+JrLuhsL6u0/xKchw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977sfqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:40:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a87029b6so105190585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 00:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768552817; x=1769157617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Txy8J4Vb0aQWuZ4JXQ5+k5jzA1F4Z/Pr8YK+encIf14=;
        b=KRdBmqtkgI4Y0WcZAcPUiEtjjSKR14Ja3k7JKzFyv8d2h9asn5eCpgIltK1IPeI8K/
         vzXE0mubzXMJ+ZyevQhI72/HG3nyQOeQf1N7jktmDnfDfpcXQlaIj1WBtjYQDb1cLfOz
         PdGMJaH1gYc4cGcR5GcLJR7MusRuqxZrDHXO6vwrn2bbxpTbugfOpCi578RGjx+I5fWN
         rG7VYFdb5kdHxMd2AgZ1nNRI0mU5IM8wXd4ol3vsVGTBu9kus2FH1kiPpLBqSBrBIQMX
         05Av0VlNLorIlj13F83gGa2g9enXjl4jbr8qZ7IG+YCCN0BhOw4aJ4qOo6Al8+cFQAoq
         NjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768552817; x=1769157617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Txy8J4Vb0aQWuZ4JXQ5+k5jzA1F4Z/Pr8YK+encIf14=;
        b=mTIjLiZKnAUG0Xui0pdpJONNf7bKL7w1tp0NJUtoZzB+cMfEkh31bsfdPNAlPT638Q
         5/X/Cjf/ApNqLM9E1fN6fJQDnrdnKVhWB7A0nCtJE5Gp7UB1mwffpqC9bVFKHI14il6v
         jWcf/JCrT+GvGCIBgKEO/aXSXBxJ6AZoW82465nMjf6bWIqSW7004LAcd7ggedcD4EVL
         ltOjdWrImcS7G08fTHndSYSMrVsvblU0xQP5l0W4K7HdrLQ5gAFa8YpXaV/VrEFJgyAX
         kAG4vs5z3ljLyqCBaBKge/cad0hbfBpF8OOOTXQE80nnb7+7EbZziEcCPikyYYqP7jLx
         1NpA==
X-Gm-Message-State: AOJu0YwTplNGsy4e5vBecSC50bBmoeggWkL8T9iEEteE3as32h32Z4HZ
	IDDzyQ9uMCPhkMgzWdTzL5YqVIaZ6N1udRoiDMrTFmcR+WmQbILH9/eNZptiERsMKc4pcQiVkfd
	+0tvLOZ7hkt41/EGJABqzjUPzXeyKxwA/BxIHeh4LWdjM37LpYlEpYPQRoowUxAwiVFkz
X-Gm-Gg: AY/fxX77JRO9pXSvhLaCtFtRdnpEGNnHkLWBUPgF0B/nbCtiun47eH+WkYOppPWeoyw
	cfiSaUgig8Cb0XY1zTRyAjL6GWZddEoVyPn6i8M8oJ7iDn5RSIKpwx7Mgv7xFpxfv6TOWLpGIE1
	wkNfYXMMdgJKOBRYz03Fmza11N5AmG6JjB3zk8WUZKPcjbQo9PUq2Fbm3QYESowKuYxkKI5QsM7
	h+s7uwH4UzhSmBk9IEbh0YNJPAOo6KAQnqm3a3uGCKeF2Albop/GEWiIhAvHxAGC+xG2s7jtJBB
	6Dcl04WK6ZcTNucaEybG2qIcFTTu8zmYL06BrhHLanE5Vesd95vxkuZThih5PsIVl+yqVnjQ9xe
	XytCZEYWEWrfecRPN/poJc/llsR4Q0XETlQDFVj1k0SpAGLep2l/adbVZmO+qIfQ0KZOA2btZ5V
	DydhJkmw0YfDMeUNOrCbOe5Rc=
X-Received: by 2002:a05:620a:4721:b0:8b2:ffe7:42fe with SMTP id af79cd13be357-8c6a671612amr320811385a.32.1768552817309;
        Fri, 16 Jan 2026 00:40:17 -0800 (PST)
X-Received: by 2002:a05:620a:4721:b0:8b2:ffe7:42fe with SMTP id af79cd13be357-8c6a671612amr320808285a.32.1768552816771;
        Fri, 16 Jan 2026 00:40:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d3dc57sm5614851fa.10.2026.01.16.00.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 00:40:16 -0800 (PST)
Date: Fri, 16 Jan 2026 10:40:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        loic.poulain@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Prakash Gupta <guptap@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <inqfbz3tlmwtvco3k5zhyy5wtskvgzorbr5am6rmeajlwrcphq@l55h2bmanvvo>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
 <20260116062004.237356-4-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116062004.237356-4-sumit.garg@kernel.org>
X-Proofpoint-ORIG-GUID: -upLurHRd-rhRmwi0qIU9ZKWHTK18vbt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MiBTYWx0ZWRfXyHGSQ8IMTXNL
 PxTZ3urWjgarUiC5lrYuoqCQw/+e0pXrVD9GH2Bljl7Z7P16fGbiFALLU5HIX/Uu5/DLYKBoBWy
 hTC9PxeBdVy6rbskg9Q5Wd4Nxn3bGl9j5Rmy3QPN49V5TVl5gSU8WbG2rheMCUNZ2twicxMGdEN
 fzUvoveRLsbPqPZ5wGtkySrjx52fGHlAk18wCWhSCo4AhUhvlQYJK54TN0dJdtXxQSNmftZyaAY
 bWAY+1h3oXapH+totK6enCedwRsiV2WQRBkbqBms5XgJiIdbISR9QSRKt8O/HYGkZmIa7O+z2SG
 yEU668NLuq2/5adBpvclfnTbq6F260JnITBFbbMAk5iweIMqGfhaTsiCnHGOZyi+VMHg6JieLWJ
 WCOHHWYaSGai6QV3NOn1qDe/JSfvOxkURTiMs2qorV9Sfrcz7cBloZq2OQ81zZDa3mv5x0KhMha
 jHZJyIAoaLog9ETuu1g==
X-Proofpoint-GUID: -upLurHRd-rhRmwi0qIU9ZKWHTK18vbt
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6969f971 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bOYGGiuWuQYoMkP4NjYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160062

On Fri, Jan 16, 2026 at 11:50:04AM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propeties for GPU, display and video peripherals via
> dropping SMMU stream IDs which relates to secure context bank.
> 
> This problem only surfaced when the Gunyah based firmware stack is
> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> as a fault by Gunyah hypervisor which were previously ignored by QHEE
> hypervisor.
> 
> The DT changes should be backwards compatible with legacy QHEE based
> firmware stack too.
> 
> Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

