Return-Path: <linux-arm-msm+bounces-118830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uIHoFaAYVWqdjwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:56:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6D774DC73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:55:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VqQgExBO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b3UsKqdY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118830-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118830-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B04A3013253
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2DE32F757;
	Mon, 13 Jul 2026 16:55:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835472F6596
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:55:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961757; cv=none; b=MsWd7uqLD2NF1D5KtQqIrSlSAqkhZulUd8rtGk1NRBMyQZ5Tc6Ike+U1AuLiY2JT5NRfmAJAkEnicS2NpWhncQtR5Fbi0D3sNmJvAhhFZ6lvHNcsd0X5FWC12uKD07S4ReAppr6PYVqgT0DqYS8+ZHkHaAYzJxIGLIEqhscqOBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961757; c=relaxed/simple;
	bh=3N0ABRarTdfq54f1BH3wC39dBAKNrx/Lg+8U/uI7/mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYQy04MJiMTGcFX23cJdkCLXRVl5Rcv8FM8luvXwuSii8Jc2OYjsbym1q7DeDkIUmKPYUAIxm30dg5ZMEP19JNPdG5Pv6Qstb3AMDRReeFLg+6xNjcGDqQY5W/I/WEZL3sdZrkiSax0wmJ/qhsjQ5V1h8+NXhuBw7+AtrH/026g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqQgExBO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3UsKqdY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8CS81968360
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2l5AlR95TaD7LKI1gelB+DwJJ4uQc1DBAVxbTpujtI=; b=VqQgExBO2ziP4XXl
	LxBo0E/0b747DcAle8B0dbc0WkvL8drMvHnEqh9Q3gKBKfaTEIrPCNGMpkaTfEKB
	OVeY064Nx3a2PkiqsMVVaSePwnK0TQx9YHyCCi/TH7304L0xolX1Sp7deLkiBSK/
	7IJEg+ktDj0SdU01Q8zOFAR/zgbO4b0dQDtEwnBgdylwbzLYYxMDe+DE4IGCFudl
	S9IbOmNEhUlzMR+0N4w73ZCboDFyUcKTBU606dlc4pMHKt6ryRpH942izoXhvxcO
	4ut/aWwQxIsEYbzmQqrGnQDRvK5+linr2e7qpo6Qr88VHyTWra/6QvpYT0Vq8mfw
	Zlx+qQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3bn3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:55:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so5046259a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783961755; x=1784566555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2l5AlR95TaD7LKI1gelB+DwJJ4uQc1DBAVxbTpujtI=;
        b=b3UsKqdYy2TjBiShZaJzrBoCJgI+hyWRfaR+xe/87Kem74jAzuiFkSeKeJmzTmmGl+
         4VX2Y3dcPVi0uPM9mSBAUtz6sN7qdksrUFZTd2F+GpUXY1Ton1tpLcDgWqc1huL5Zyl9
         05hQjr9mu2qxnsxG7hKY9ZIqlMTa+V/KY47oCoAkyyqlKwDsVM8IiPKWS/TRmnPKQfA+
         vvdMnL1VfybOyhexBaGoD5gIiJqHU2IDTLGtxvfK/xgLI9lv/0wih7A0fPX6bq9XJXSU
         D4i8Wr4C+EHEFvFyX7fjGz1+ZzRH63C6tmZMXeLAjbuJItQX5dWFMSPO5iESiHsu4Yme
         8WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961755; x=1784566555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2l5AlR95TaD7LKI1gelB+DwJJ4uQc1DBAVxbTpujtI=;
        b=J9RYztCiu2gWWXxxXFV3ansqcyLnA7nx8ePOIbH4MFhBGAbM2WU60q77k0ja0ysAff
         TerBK+WVorK6QcaszNtXXxl91D+pBttQxt6mdz/mTs5cRFHil1EzaxKc3QAnTTUNpPpN
         kTDarI3iub1m38f1okesgvBlM1+RGKx9yE4ahCtQAXIivOy6bAlEbKaWNWLP5KN+kDZU
         vUOqn7GCQ4zJL33EWjQd/bmQaCAe/Biocl5lN+wKuScU4tGLM5dpIsNnFjrB70FC8ESq
         +SMKXB3HDfthW0WJAvd3Mxq370F98g5elYZaeUhM2d/Y7G92o/Czgm5BxGhA45XhaclZ
         jleA==
X-Forwarded-Encrypted: i=1; AHgh+RrT+DTulIk0vM1HFKEOoxYZAMgO3nCZ4mTLwvSCqS8ZqNAntbAQD0Clxi7L3cLVKokwPv6j+06zaABVbmBO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxug5058q1q3qn5hUGZOBdxnEapJTux2c2pGdySjO4fLztLQaLi
	72j3sOzdA3O8DHhMYPyemp83tQGYtNffEikfGGoE5/d6voT6cypwmmp9MNJgjNnrb5kcR4H5uQv
	fpsQioOuqisQJNSkojcqgMZ4qLb2bx+dcnDiC66y9ojfsQQxw1ZRsg9GRQdVBfuXDZizN
X-Gm-Gg: AfdE7ckXM6WrGAxWDMa9NddFla4WJ+6B18usvTmocjzRWIwRgc/E0TQgwuVe3Tgj2+0
	H5B46jMQ6WDR2L320h1recsHYFUa5mA5ZloSRtd2SQp4ijLCT/VhSvXXSTY8bJ62GEQRkx93Oim
	75jV37Af6xGY4fO1ZXK3tFvxCWo49jrFnyRbKsDcbToVxw1U5bEJNpju20UtZAPt1qaoBAPt8BC
	hp4fEEbklWCQvviKJH/UqTwphEqlV21EY2iP7rp/ZFogtd8sKmAD+2AwGZFKUgQYPlHNVYvbybL
	j2HtaYkEMV/yVFM8StQvssNW8rorTR7QRRKJnD0srqDiIsvJrS5tZJVsA15wqPBKR9wxKrRtC85
	XgabuF2QjLzNuc+IzYw+A5GAtzSOou4cWWrWS9rqurBuv4g==
X-Received: by 2002:a17:90b:2750:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38dc75ebea3mr9509019a91.16.1783961754974;
        Mon, 13 Jul 2026 09:55:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38dc75ebea3mr9508992a91.16.1783961754510;
        Mon, 13 Jul 2026 09:55:54 -0700 (PDT)
Received: from [192.168.1.100] ([157.48.180.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm71653953eec.18.2026.07.13.09.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:55:54 -0700 (PDT)
Message-ID: <d47c822a-8219-482e-921d-f129e6dc5c84@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:25:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] iio: adc: qcom-spmi-adc5-gen3: Remove an
 unnecessary print
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
 <20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>
 <aktArynt5xftgij1@ashevche-desk.local>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <aktArynt5xftgij1@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE3NSBTYWx0ZWRfX+JDU6/63+bPX
 cPl6QaBVrxekfsKoCIlbUPxQ4HjQWSH/Z+fgVxe01Vk/sJTUZY4+BG+9laq1QPJSKxHcy30cUOD
 jEyt2HuB1LAtrNQznBrbwQUYXUw8HTZW2AaVs/xrX4jRqZ74utH1jTKhJxHrSoaWxICyZCXqe9a
 ZNcfdZJ1vT6haWzU0FYlsNQSrzDvAAAkJFpjmSMZdsTmaz0bnBhUTbbyjnqYEAUGZa1Hlw+bJpW
 +jzrBH+qgBwMzQDGerPQ3UYI3Dot73LJlR8InV3zPWfxee5s1Ek9JbVsSVaXHGfehhFkpmYrBHc
 UVprOx5Rj1Izz/X5M8WfHQ65AIyNqgV9XiLeOrLNKrAsb395OwzTXoTkl6ov5WulRIVEXFCyJuf
 gRSYYX2XQ+c6l7J5EnzSqv43dhWkkyx81H3uXWjhQ+I+CgqscehOMbBXBswXprNHvb/GlMQcht5
 ZsSa9xuhZdCeGKBATLQ==
X-Proofpoint-ORIG-GUID: OzByO6SPse-kpcJC-T4HjOm2xTC7PFUj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE3NSBTYWx0ZWRfXz392TqCwzbXz
 igvfZ2YFUMITU0PHxvxYDLlk2Swzl31ZezAH2fpPUoChcPkev30Cw57CmCmrTkDIC/u2ZjbgVhE
 9e1k1nLCKQmkSoMs7au3z7ZW009yrLo=
X-Proofpoint-GUID: OzByO6SPse-kpcJC-T4HjOm2xTC7PFUj
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a55189b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=62VzjLAzdHZQ3L95IMgkXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QyXUC8HyAAAA:8 a=aSuIdP_MvOpnUHuhdBcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-118830-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,intel.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E6D774DC73

Hi Andy,

On 7/6/2026 11:14 AM, Andy Shevchenko wrote:
> On Sun, Jul 05, 2026 at 10:23:34PM +0530, Jishnu Prakash wrote:
>> devm_request_threaded_irq internally prints an error message using
> 
> devm_request_threaded_irq()
> 
>> dev_err_probe in case of any errors. Remove the error print in the
> 
> dev_err_probe()
> 
>> devm_request_threaded_irq failure path as it is not needed.
> devm_request_threaded_irq()
> 
> This patch should go first. The patch 1 is not marked as a fix and we don't
> need this message to be printed even before the patch 1 of your current version
> of the series.
> 
> With that being addressed,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 

Sure, I'll put this patch first and fix the function names when pushing the next
series. I'll also add the Suggested-by tag as you mentioned in another mail.

Thanks,
Jishnu


> Also note we refer to the functions as func(), id est mind the parentheses.
> 


