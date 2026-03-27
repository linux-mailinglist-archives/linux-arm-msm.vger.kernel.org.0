Return-Path: <linux-arm-msm+bounces-100283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN6pHuZtxmmkJwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:45:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D428C343B86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BB0B3113A47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEFA373BE7;
	Fri, 27 Mar 2026 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GOpVqoch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GW4qyKVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F733644BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611455; cv=none; b=g7dY8jvU9amjJv6wshLkmoct4WFIiJIiw8yHf1IGH/z3H33D+IthJt/7SBv7tyAXfUXq2FoDqz3mtvc2SsX2FrRI1SmKIKVQqSUEAzNJOWn2+5cP2fAITYz5V2WhLTjVsnH4n0cMg9NqfeYrEGS+9MfrUeYhbW694lVJNiCzAKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611455; c=relaxed/simple;
	bh=ts9DgbabCy9XHy1skgVmnyjgFFlWM6jdVlVOBey1q2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RaCyngCNsXwUlCirX+f2B2Yif++eWmpTz+coXEzwgU4wWtzNj7x7UsL71V9lbrU75Wv5Q9eSIQsvVIoVaYJ5mHeoauY0OOTKV9gfOZhz2tIvnZrcQEyeOErXPmoCV6P7LDholvfZXY6geJJ1TInQH1qjafdP0bE94Pv9Fzvb3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GOpVqoch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GW4qyKVV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vqGm298556
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+a5ZQma2kAd5vKCJCtMoVZAC0VFz4erj2keRHs7f2W8=; b=GOpVqochwzetJKv0
	D+IMNd+m+R/HQJ1Pd/ZtVrnjiD8oFwv0G1cxvl+ThEBLoq+bX1MKZtYKX2bR04/s
	2Jw2Mi2Kkz8m8ifDpUdcxx13JbAnc0TCYgXlyIkrqT+eX5b87D0dWW/gwAas4k1o
	o8mxN9JDg+B5TYaz3EJKWiW0toGP6B7AkjeMN1rSVcpxI40Mjyxul7VucmCWVKFl
	o5G5XTvrk7O1F32ydnIqn6qOv+ldfshU0SfKuw7WoAAkXBCYFxkwaiog+rQjYHkO
	DRW43drsB0oXKNhbi/qaPLcLl9qBXyKlFjUzfLMKgslFyV53kJ4hh+/ZWrXAk+P2
	1t3wrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8twc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:37:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfc4ba4de0so64172085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774611452; x=1775216252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+a5ZQma2kAd5vKCJCtMoVZAC0VFz4erj2keRHs7f2W8=;
        b=GW4qyKVV/HUQYhrZQeF+l9WT3swm4p1KpGqFQtRIWKL9T421pSBEzzKoVGkhfkGx0X
         7S+r+alCE5Lvv40ya/up1SlOfZxGHnAJ43ecdPWVCHE8TlX549NT9o8ehnR8SF4232UZ
         uwxSQN4aRzT66hhuhKxuwMGHveJc7op17NZ8/H1HVpUo/LMnBY5z21o5YP7UItBZzWS4
         ScQwgp5Nyr9ofdWmuYTvxvzymhEfQsZ5tlhAX4hG5+cec+6Be+udVxBw4Ow4qT9jOUQY
         9NX8FmEjyrNyhgGM4pnHgZNZmELLyZbrBi0gs4cTxMq/XwFYR+cv3gosXrV3hvHGhv6W
         g7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611452; x=1775216252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+a5ZQma2kAd5vKCJCtMoVZAC0VFz4erj2keRHs7f2W8=;
        b=Hh+JAmbFU+cDTzJ4uhpxFdog/opR6kHkvZtIz23jpXsjC1eK0dX41KBpDuU94BFs/A
         ERhOu1lh7G70iSPap/EXo2bVQzj0UaTodwr3Esmz8is27uZC5XLxJDgxmgtE43K+GQUH
         IojBqBH+NS1+Ehf4mdAoPrJQceIWqT7Jweop0YMhCyEipJyUPd2QHbYDkSlg2mOK1J7D
         tORuadvzk0ALc6NR+XBI0cwBvXTToqwUXQGaBzN6n5CP+5/yNXuTYjWeS+nHqFitTkPO
         YcyWQmR8CzyEQK953TcNS6Ez0MmAhsLNA2+Ou4fcqNHVlOAkDbVAhg+PfmSNpJ6rGYxp
         5Ulg==
X-Gm-Message-State: AOJu0YyE4NQKe177eb7kCsVvY9LHK+bMyLhl63Yu+nZho9XXwsuLjyYg
	eGGVeRkSC22jYmMcFuT+5r0bzcCbOdgt7BQMVnPFRXcNM7wWKKGtVjoomM4bfSaUrXjQLi6DOji
	giRU26lC+5u2/YbBs4F1XRPl7hiflsPDn6wf/0F4MIMCgm51+065kF54QXKEZyvaLRxz+Yq1im6
	QC
X-Gm-Gg: ATEYQzyNyq3OIoIrI5vggJ+gefr2scu96AkML35TerUTRGAYCOTUtfLbiyRDyeZLqAw
	fKGgga/iOUfne+x4nXBfAx2Gd0oiRzczfv9tUs+VM/MSQ8gS78S8IQxrAw+8nCzyeVp7DCmJG9M
	rc15xFnbBG7kyhG0+m1VS1AWnydx7F5zSMyPIBe2NeCXcph0jzM9pN+nJ6UYOIFjmWzvYQbrIZz
	9gF4bJl7VmV7wIy94tQo8CP6xA5e6pGWUTMgTfUyk36nOa+Y0qDnh/gEC5+AJiJrVadToduIgG5
	kgUVRe7zBD3cba3jMeh/fOq7b5HXwNhYMgr4uMo7D7SayifpojgHILMDiMDg1tSnnHU7+fO0BEK
	pE1OG3SGsRqNLmy86qAINk9I3CZeJWiyaWKtNq1lqrRsqJEKzwJqaMAY1hl3STLmVQSErAsnTSj
	sG0u0=
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d01c82312cmr168556885a.8.1774611451927;
        Fri, 27 Mar 2026 04:37:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d01c82312cmr168554785a.8.1774611451432;
        Fri, 27 Mar 2026 04:37:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6752daesm2132479a12.19.2026.03.27.04.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:37:30 -0700 (PDT)
Message-ID: <438fd5f0-8a03-4d86-bc5a-6fd32c7a6480@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:37:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] drm/msm/a8xx: Fix the ticks used in submit
 traces
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-2-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-2-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MCBTYWx0ZWRfXxML1CXJ7ZRj4
 k6GgGJE6APCP/SD/1NwVXcIx6gAqlbU+LHuovj/s1qMWzJWHcLc7T1ZX5c4hMWlXDzVJT6Vnz7n
 jfHJZ5UiDJM2up2+vjh8CoJ5Uqz1V/UrTjV9xOOj6DdUFbuOv+LMnoRnQ/pojlW/GB37FtJclYi
 03MgFvPDKNc7J+L/6VAPtnha1liwHQ02nWbSA+cv2cLxTqtR2drp2dW6VMYVomZax9uUkSkG7+U
 za5gAu7FrUZ+F+bnH5EsaYldscmKDC5rv5Ociw4HTQH9B6pq3sJQUGjrKxMkpHE4NMsvVtcmk7f
 da8M8A6HFt0mzHTNzNdUw97hMfJ4NCrDX6sAzuXOmsUkLW5eHrL3+LDpRyr/hLx3PNPxQjAerVT
 bbQm4wMVKNu2eJz6nRx1ie+k1nlqQ6ciHTLCzjDwRZ++plZEsNeUnM5E8F3NXASge0wKzjE1leW
 L88hb0IhQb0BkkZ1yMw==
X-Proofpoint-ORIG-GUID: aGDBlPDadkgSS9z5ef2aOGyZe_ivNGu_
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c66bfc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=XWSmCzMQkrl5bhrDGzoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aGDBlPDadkgSS9z5ef2aOGyZe_ivNGu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100283-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D428C343B86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:13 AM, Akhil P Oommen wrote:
> GMU_ALWAYS_ON_COUNTER_* registers got moved in A8x, but currently, A6x
> register offsets are used in the submit traces instead of A8x offsets.
> To fix this, refactor a bit and use adreno_gpu->funcs->get_timestamp()
> everywhere.
> 
> While we are at it, update a8xx_gmu_get_timestamp() to use the GMU AO
> counter.

Which I assume does not need the GMU to be in any particular state, just
have its clocks enabled?

Konrad

