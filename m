Return-Path: <linux-arm-msm+bounces-116885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +qGLBk6/S2puZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:44:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B5712217
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:44:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kqUAEoMQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FjGCgzlY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116885-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116885-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9899317FC83
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7893769EA;
	Mon,  6 Jul 2026 14:02:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D12D27F728
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:02:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346522; cv=none; b=W9ENiquIB+Hf6n6UwMauB7v6443o94MnfqICnW1mvH+PyGMYS4TSr78vMtou5rEAOh0v++kCIBYdV77p07bFUIcNxJnI2LOW1NYTMbJHgCG0K41wkcLdwPBGvFAiMOgstP/r9Xz1sdEZuRZA6Eih/xM9g0gGVThhkEXTFOwCxS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346522; c=relaxed/simple;
	bh=Q4NF35YjcGaZ1qiI2gAwTlaeT8DyWjM7S9YOGEGRCBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHUn98oJu04EveRUo10T2B4O65T978sb0lgRhh+NDyrOV7Jk9P5uC/Zz4h24yYrj8h+3yyPpwZet7hLMaJOBmZX5XTJ/Dr5srqSImoWL8YmypILEl9In3/LlCuTkSd+NOGYqmqJV39I5Wr+UAp0u4iNg0bthp+bJIbl9uG91+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqUAEoMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjGCgzlY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOpD369506
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBqCbBRgcsL1MB8uxQkpdIk+cpXeJ+5dOiAooqaaFlI=; b=kqUAEoMQJxRM2hhX
	iBs7jjS2FheG8635qyX0M44bmv23d5h0JNNPwu7757h+FnZR5SoB/rCykQ2Xnfzs
	eIGQaTZF4JZdMcIgR8mF18ZPbgpXWXDYRPpUcu0fvWabrlBbMY14LRX+6m7b7Wnn
	o+E7KRpGsPxjcWycwkKMFo60h4YyI965NJS7TvigXNl88PORoQOCs5WA4RTf0wDy
	KtoePdXtwBjdvq/gtn+sQod4LkTOtlzAmlzdHl55OHQCRUgD1/eP4uHG+75ARhDg
	s3Xum65aIv3vPXIWHdPm1DcRjbXeUiulrRkla1sPddo+yrbkDUnVkEzbF17wvLrh
	g/zkIg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h99egu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:02:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bdda66a906so4364761e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346519; x=1783951319; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aBqCbBRgcsL1MB8uxQkpdIk+cpXeJ+5dOiAooqaaFlI=;
        b=FjGCgzlYIefAeKOMezpAqt7Dcdnqay/DRduDFcpEl4yuCjGfePYqpG+eX/pTA3sBcN
         5HUI4LTb65zrfdaq2ImOdMDISHr/rh0RSgGiLWy5JUhZJyAbw3MNlVBssQw3Po7L/Hn+
         qPBRQiD/TnRgZwbCqv6n2CcFfgGkPK3YJvDicBkv6ET3c9ELP/UJXyusb2n8OTLiPFhj
         4UXQE2i7875C90M64dzf5ZEZv3Sa/XePnkSMGadqzSWU2uAkA5J3FTQLJ4ocQERLIRhF
         +sN/RvPV/8WpijiUaPVXCkAVIrnJOVFJChoTMBLTHSZiS907rCjKGhFrIB+Gh1NkuxTE
         +XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346519; x=1783951319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBqCbBRgcsL1MB8uxQkpdIk+cpXeJ+5dOiAooqaaFlI=;
        b=X03RhuNIFRKDQHni2cXw+MSV16ToFdoJ85tAleo3MbsktiYYeLpYFeehWXz2RneNC5
         taRyKJrEgL63iIYoJnpgFsQ6Nz8EXY14UQMDl2cckKYwczDbXN+SL1sg7fLgEC9wwwel
         bFsrEEAf+dag9tL8G7Tv4kyJ28BK021apFtUN+L/4EgAqZ6yyk3mbE2qr/6SFuZYVKjf
         niWY+ng7SiXaYMdd6Av3VJ1wChxVIQxXtkTnlPL9vxzmY7/GOoKSAq2+JsRhNax/yYLD
         5oVZOVIB9KWm4BxPQWc36H1t3CINBqHGQSzqhYShVUdWg6CQAJjLbFFBh3O99D6bl6aU
         C2IQ==
X-Forwarded-Encrypted: i=1; AHgh+RrElvFFy6wdbVKMLeog183nQdEgwcHk3XPPuPgTkRQJnKTFhuVv7rBtWS5clovjairryTW8DigaTk542atI@vger.kernel.org
X-Gm-Message-State: AOJu0YztS8dTzSb54DpAQ7GBTdGQPDvkZFeFj0g/Da0nzGwFm66/NjTV
	9jGYtZTbJoQH0PG7Sky3UHL9uGB/R0EB3EsgjejUFV6XJyhwqYenyIHnWXzEDRA3k0JFrOXNHYr
	hsZPj1u+BvEfcclUCEUnk4+9SLGBOpER+OyLXCKH2wWAtQHLWQvPLPKHVYtgJkTPbVpm/
X-Gm-Gg: AfdE7ckBZbCK0jnUJveVvlvu/tUlYHvQZCzUOZaBBr3WOFFr+Hck5n8ld47q8H772Ut
	UBLglCkRx+QFHm9gLI/kfyvpFQHTvaz7MGEIRQqLKyW9eyjlPfIffq9M3grX72jSkOP9FooROSo
	f3nnv0AH63UwnIIW97Ngauoz+oZLqm3hD9vpCy/P3dOLH32fYCl5MfKBGcSTOB+HtM7vtdns/3m
	s2V4uGtEieZE4yZMHvMjnleCZNL5h1xkt5bBkcgANRRNqCL8UvkjPifG4obIfPkbF/hGWzMfPPl
	RnBexfjtrR0wLu4jEMXyJ3F3bYFMLWiSskOJHZfbVazkGAZfR2kW5EMElRKaBF2Ru6le/zTZfYJ
	eOvdr5nxinjebk4jUKZIvFYZ1re/GpZp3r6jhvfW5cIjaIexdg9ZCipZqktiSOmvjbQGC/1TXWw
	S4YLYzGuciWFeOKzaa/cW4Khoe
X-Received: by 2002:a05:6122:791:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5be98955cdbmr332952e0c.14.1783346515938;
        Mon, 06 Jul 2026 07:01:55 -0700 (PDT)
X-Received: by 2002:a05:6122:791:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5be98955cdbmr332384e0c.14.1783346511346;
        Mon, 06 Jul 2026 07:01:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1383a29sm2898513e87.36.2026.07.06.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:01:50 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:01:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Add support for the Iris codec on Milos
Message-ID: <2eguh5xk7ykfbpwnjly7e5gkupxgteqimdnpbxdddvs5zfhu6s@orfjibovsg3x>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
X-Proofpoint-ORIG-GUID: sfdxNLwRvD3huci9zH1BGvbBwvDlQONI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX8UJq8jJIDBYP
 acV8IyyPZ6mSzWKMxsQgJ6nYzEQ6S9ugf4QcBQ/rvhstkt+ODfNNpCbiAJMYV53RiwGluDo3C0i
 ceciNNZIh5KF7PGNSJNur4pF6SV+G6M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfXx3RoQyVtEQUP
 hd/7FqSXimIHa1yVqMcRNK0fsumDd0B0oJT8ji7VpkkkQ+eAz3TazcEMX56GdAQpVFJAUVnV5Xv
 ypDaAvwX4mpubm4hZxYefguRVmTxygEyljHDCCLEo1S8IYiZYqARS8jw9kBMuiUfpJl3/4Vn8Tj
 xU1MwBVSIX+IlWFDI87ajT5paSRCPWGqRMyoVVXupRzC6nuvBY569TmIZOLdAEu0oEL1VmWQ9M+
 4F1D5c18znW06co4sez5Ua1Ss1n64BbPqheAzCGqsLlENcj3tNwjGoSBM4rz3hjGx4IN10Bs97l
 FPFWqDveBUxbNTSfQ7eSRH+HqYkA1IAxSEKzLASL6+rBkIKdf9EDh8RDnwOukFqgyQIx63rQ2C6
 LYAWtX3KdZoZ3L0XO0/i2Tt+KoLt0g56gPKXpuT+ZL/6NXA5MWidM4x3mg+isH4Q4OETRHrXxKh
 aBd732zgSmC2rmhvqww==
X-Proofpoint-GUID: sfdxNLwRvD3huci9zH1BGvbBwvDlQONI
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bb558 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=s7MOqckuTC5V7MsndsAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116885-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,orfjibovsg3x:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 299B5712217

On Sun, Jul 05, 2026 at 10:10:18AM +0000, Alexander Koskovich wrote:
> This series adds the bindings, nodes and platform data for the Milos platform
> for the Iris video codec, allowing Milos to use hardware‑accelerated video
> encoding and decoding.
> 
> Ran v4l2-compliance and some fluster tests, though a concerning amount of them
> failed. Attaching v4l2-compliance output and the full fluster results below.
> 
> nothing-asteroids:~$ v4l2-compliance -d /dev/video1 -s
> v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
> 
> 
> nothing-asteroids:~/fluster$ ./fluster.py --no-emoji run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2

Could you please run the tests against the full test suite and submit
the results to https://github.com/linux-msm/fluster-tests ? There is a
script to run the tests.

> ****************************************************************************************************
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2
> Using 8 parallel job(s)

-j1 might also be nicer.

> ****************************************************************************************************
> 

-- 
With best wishes
Dmitry

