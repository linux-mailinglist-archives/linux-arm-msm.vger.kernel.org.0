Return-Path: <linux-arm-msm+bounces-108133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JAFAUTNCmq18QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1D1568B61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFA213049676
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC0E3E3143;
	Mon, 18 May 2026 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7PHyemE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdGtsY91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196443E276C
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092514; cv=none; b=oQ3s6dM2MDg21/CLZ2K+R/9ivy24IbjGk1eBIInJIsVau4Nj6wHdI+AIPom44cJECDhYJKutHFG8Qvy/a0/rJQR/SCl4Q6mEfn/Km/FfhaKvjA4rSwS+3cFeaEf89/Y9uXuR65spGkIZcVjxAs13haLPItKRgjhTndICZWqfCIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092514; c=relaxed/simple;
	bh=ragH+UptpsP6ecGfp9Fq31yAcAD4v5jryRmNz5NKeo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cT0ZFN03wpT6QAfRbU+i0fR4qah3LO4Bi6Zp5gtCMZ6YASLH7Ux0Vc29N5vGTqMjZTFxso5KRJ9cyAq84VT68Zg0PZpSs4ji6b57Ro+OQX8XFQkqh0LV3d2Fxqmmxj3zZuYr25F4Iivhz8N+Kqk9wNk/wriq1O2bt3GNHep9q6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7PHyemE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdGtsY91; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5Yt412685335
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqE05k6PQgDXFwB3i3GMPc3Iovi47SmjdbK1gLojyvY=; b=i7PHyemEetV00Dze
	3so9XA2JcitdhOrcg/E92qqFBd+RosIlGs6Z280F2Q1zjybRsBcBDLBaKl5j2Yxv
	FCX3Cxepsov27bO/pHqrhIuSZFuBJ3VeNJhItg+oeNIZQuo3ZOJseOI70ESS+uCa
	z5WO8oDw/C5ZPNXWvFzit8b10k4QSAXy/HZiUeJ5ecZngO4JzxPAMwvQTSnumloc
	d1S3H4mbJWSZM02QynUHwKGY08KcHyc5fbpxvysQfm0zUQohCbYWtFwP23EK2jS3
	bnfp9Grhyww3kT75YSDGFX+p8AIPwztKCOl8CsYNe1lQEDLoHtQTqxJRvMcnGlhy
	w6GGhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbrqyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:21:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb0b93e90so6776221cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092511; x=1779697311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqE05k6PQgDXFwB3i3GMPc3Iovi47SmjdbK1gLojyvY=;
        b=LdGtsY917194P3YBN2dPWLp7Qvs20m0PRFI7dmr/kmjFTbz78kYm05+zoti8ia1Bu9
         k8tyYoFhKqvUKL3pN91DqHtqPTbt+lXsYUrassGurUXTi5P3YTWSp/uqm8uamiazZodx
         d8J2NvpMcelxnXXgeJr37E6HVL0mj9E/TqmPb/eB/9ZzU28sBlNVJeQofTtGdh+8plGV
         dn8nHJEod6/4PHOIVoUsxB92dWGL8R2p/v/poUbBojvUYdXq7vRIQOY68tX1p9hwvmDx
         l0YvVUGnZ7YIxk/IHBIpjvjt7ggkoknFFw15zsfhC0zQLSTD1Ypvg8903OX5p7N9Fb4j
         KInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092511; x=1779697311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqE05k6PQgDXFwB3i3GMPc3Iovi47SmjdbK1gLojyvY=;
        b=LBzpi6CdoyfFI8mUsp5CQl78o5/GrGxcP9JJfSwuyO/QhxbmaNG5/ZZGh7+osWzpnt
         BzHZVQekFSqPnNWeurbu/FsuNPAXJk+ZzSAD3F3qqYxr3syepTP4th8gtrVm+vIjO3GL
         06fZuLr4w/SpfptIdERzmo/YA5XfxkjGgy9gj1tfku+YV20uFnYq6hbMBJLE/pTu8aVG
         bLdKKWopn0A4kLNn0iK9Pzn3WieRKqZjOclITwbKzPWt0fKi7SzUuMbHn1suBqc8SEPE
         ftJlbsuCaX26zQj5DmqIaMrXfjyfZR7JPRV0TwOuqpdHN9OOxRggbnnTyF7j0v37HEFy
         pf/w==
X-Forwarded-Encrypted: i=1; AFNElJ9BuRMGU7oFOmH2FtAk6VTIASAv+6dlzqnDNI203BB7WI/xcpemg7t9eEz+ULs55f3MW8AeWwW2ijdHSQHB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06sSKjWbn+KvLrCGHX7cRDN8+q/v39aIecyGSh97YiGgEneog
	p5s64U7okaupwv3MbdGnDI/znH6iJnVR+dWRGCJ/Lrk9waYON8cQ4RGvBEeyB5vvGq5xz/5c/hl
	YHvFXHKnJVd2iEhFhRQVUT32dHgYmxWs9wzrfz1LyW3AX4vJkEKJRQbK+ZNPg1+H5A5Wr
X-Gm-Gg: Acq92OHNbyNmbpIcqlz6Pq8fDGbX93AMcSlo/PX9zs8/5BS3XjeVwlEK40GaWYUbC3f
	rVhXtOed/G0em2Q0l8R/Vs8yfJPRwh1i0eF9i3q8vIkQrvt3VKSfxQlKIrYHiqBAIWQAP1lxs1R
	CFzzIUXKdr1tU1EPrGjCPSLWVQ+8QF62Vwnd1rwLv8LoEVZ8oQfMZC99uAsjrEbPpIm6PRih87j
	+HeDFXQKtw2HjaHRIdc8/Tq4dJ0szo63k+4z3QRCwuCISIvqudeffhDDv/rkIuyMxfLXHVkFtN/
	neHFkrjCV9Uo1HDzII8rR+s0E2j3IxtbgGPeJMZnPLSdomIZi4UHyrGhLd1T73otpBFGPHAFN75
	Q+88jw0fHdk2af7jRrc8N9kqW4t/V7Mj8+5CcRjloZv7C8WpW+uxQxoaJvM5fEENb3lMMOJGAgG
	GLvvY=
X-Received: by 2002:a05:622a:155:b0:50d:a92e:fead with SMTP id d75a77b69052e-5165a0c1de4mr128792561cf.3.1779092511365;
        Mon, 18 May 2026 01:21:51 -0700 (PDT)
X-Received: by 2002:a05:622a:155:b0:50d:a92e:fead with SMTP id d75a77b69052e-5165a0c1de4mr128792421cf.3.1779092510976;
        Mon, 18 May 2026 01:21:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ed37ecsm538798166b.63.2026.05.18.01.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:21:50 -0700 (PDT)
Message-ID: <c70ae6fc-c10f-47d2-bb38-b01416d9b1e7@oss.qualcomm.com>
Date: Mon, 18 May 2026 10:21:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] i2c: qcom-cci: Remove overcautious disable_irq()
 calls
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
 <20260515234121.1607425-5-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515234121.1607425-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OgLXyU5dG9eRVPpghro_E0qhwC-UraRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfX9oxrd4OOhhUF
 upTLalWhUyPeWa3QtxOj2ly1UNhFAKJPIxm7pkBBUslGwTXufGDs7w0RsP2NVHxGjLxwkdvtKfP
 +8oLFWIa4TPFsIXA6/9txY3qme7E9TZBachFNcRjp5rj7dd+xX5+FnARj4RLoBllPhbBSnBrE0S
 acIMNNeQg3AWC22VQ25nzuT/6CL+ELyntMkT0mAhIa/K9qS2GTPkwM8IlQCdcF9+DcN9CyxWo+B
 T1JM0vPy/geONVwWAAJTKiZiirXnyUMLk0MAM/PLwXDh61kyug8WfXoDbzXN+FiIduG0XkwKlvw
 OarAdgBtUtjX94B0dfs0xAtaZVCEeEYgLai1tz1p+WAzkzceD1r/ju6ytn7/s+lSNLhnNCu0iEm
 uPZUJR2ZhBsZtVzyBcleXACCH1RSYkNiOs1l1fTEHK1vfSTl2TfDGKOLNK96uLB+Z7FrpADebuc
 3mtoUShuBMyWshL4Icw==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0acc20 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FPazOdjXQs3mY34jnjMA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OgLXyU5dG9eRVPpghro_E0qhwC-UraRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180079
X-Rspamd-Queue-Id: 6B1D1568B61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108133-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/16/26 1:41 AM, Vladimir Zapolskiy wrote:
> In cci_probe() the controller's interrupt is requested using a devres
> managed API, and in cci_probe() error path and cci_remove() it'd be
> safe to rely on devres mechanism to free and shutdown the interrupt,
> thus explicit disable_irq() calls can be removed as unnecessary ones.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

I think disbling happens for all IRQs if this was the only/last user,
regardless of whether its requested with a devm_ helper

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

