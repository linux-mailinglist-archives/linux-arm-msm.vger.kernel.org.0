Return-Path: <linux-arm-msm+bounces-90919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGMsF7jKeWkezgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:37:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 713949E47B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A468300370D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9E1337686;
	Wed, 28 Jan 2026 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRLAm4O+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HIoQgsyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6067338599
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589417; cv=none; b=PccsbhPmgqQ7A+Sikp0ojDiCDV4tgTWY1E5QI3MrmPCjGpzVMllnSeac4EfrwQMja1nlgOe5B9D/aDNtMrF+buczFQDdgmOhgfdxwIb73oj+Hw4U8ipIrDmXY+VP4WqCpZmQBC2t1x60fDacHXA6F58qKSNXoBeFxvSj2QaQLDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589417; c=relaxed/simple;
	bh=47Mn6mq1ytbRVibgE8EfASIujzxl0MKCAsPSwk4uvSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBka5ZRKbqFa3uQyRYAEzuGDBGOKywpYRW8IPzQCBGROOjCVbA/eLjUHm4iF4F1+aZG2OmH7FxJLCLW9PE18JvHZ5f1xnrhKROu0/WsPwFlrw/kkoepMaigMkIOhJR4/rrsDRktvSAVonb5vbyFBthhGOZUhXj76zmG16XyYYfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRLAm4O+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HIoQgsyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S3d1C11952868
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OgXHG/pztr3Fd40q9Ravm6Vn
	ha8yrUNEpvKhL4JAxfk=; b=RRLAm4O+80P620y67pooU0pxkrWvEKo5NBhUNAnN
	0lps7S4h4PbTf2aqpBuG4x3KKSQDt6iZ+Ij0sHYBGlCM55UEcD5Ch9uRhJZ8T6zx
	WJ62AMoyZ1v/1ZPCXAPLyzY9/HF5McELUybGJlbNbgc5ShXreQ1bWl59r4r9oeLv
	6NzOxPW9An4ZqAFZFqNvDoNwIDv5zo6cuprhoW4/v1X2KshGw+07tsNQf9FDbXwc
	34B+VAI/pH8mxjeQJMRwaAwX2wAD8V1wazvONZQKKSp/gHZ6VQ4MyxeqsQ3Bv27f
	1+ZvzaxJ0Dv6pt6I/lSp9RhNt4YugNzoukRRL9AqYi0A6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211ah2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:36:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71655aa11so76819385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769589413; x=1770194213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OgXHG/pztr3Fd40q9Ravm6Vnha8yrUNEpvKhL4JAxfk=;
        b=HIoQgsyRe3vW0afUgaShU0agfGZM1zNC61RpV8fhGVsYHprS5hurr62gXm0PjoBbb9
         T55yg/25o5uPaFfdAnUHi/9ra53JD6lQix04MzN/5isRL7SOqMxQBlWGY0FUhlU9X1LQ
         tKpfuhXi9rGdNAzWZ/+G42kSNC5tFxufHA5NTVdn3ozJZJeeNb/RE/2IyF1iforl/TiS
         S6HM/e/BkWe0ZVTrNPtHnKajMsd9Il/9xrNNF8IkE8pejYH9pvkE+rQdg2A6xWU15rbx
         /Dd3ULZYTpPIjPTlIzqu9n46Albak9Xqmi5INDJ4y8Vjp6oq/9xXqTwcCYo8VDiEdqdo
         uJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769589413; x=1770194213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgXHG/pztr3Fd40q9Ravm6Vnha8yrUNEpvKhL4JAxfk=;
        b=SjfvtyKNjEE65xFAIoHiUxGlhQ7oIliJhxAMrH1ab6qxMiEtRTWRhjcpZje4SW3A3s
         O5eGtt8HnzPxXZ8R+eA5pauK6B0PSy9Sy9Um/GXPqT4nTFbCLkdEb7Vu9VyS4HXfmnVq
         QsQsg0ZdcoVmasAwSn3O/k+21QRRWG1E2+v5Aok9Y5I6wZaRZ1tsD/j/OD1+Y6HXB/so
         bzOHQLbmVfOVYkxImfq0qfP2bzjORBu5vemZbV9jqJ7hpnjNW+oz12caswVmKVBrvxVc
         cel9syi+jebmLCiDtMP+0IHj5aHpy83Ao/kj0UfaNXEH5OBHPnlb5DxhFLZPS2ksjpKR
         ZClg==
X-Forwarded-Encrypted: i=1; AJvYcCUm/9a4XbWmqE6JKltNzx3x8csPdtV9icGGguFVFv/8JYS0/khI72WimI8WJovuHs5T3eKeiT6883dUdDVT@vger.kernel.org
X-Gm-Message-State: AOJu0YyyX9N+ek9IzR+/T3m37mxl/eK9VdgzaHCoc3Lq5PIvax5H90oc
	QN2t1IZ3jr0IZG3BnzGoCf3zng9P6Omtjop+dUIe16xFgzCa5xxl8gEUTxhs6iADuoMvG1hJdP0
	S3NpUj3u7ZILWZCkGK3C6kr+H4C869TOcluS5Y6etfxOsHjihbxbLKFrT2Nti5wjbtcaa
X-Gm-Gg: AZuq6aKWWOMXu+F9lJUKWubZlQ1BxLhkmI272k5f4zrF2S8tb2VT20GKKICOeA80h8Q
	dhbvT35/pTDE9m40lc9Uvc8JgJpF19UCehlEw1T2mrMtgGyTZe6KSwrqVUyn+lYdGuN04p2dMSU
	lSwEc/fardu/zGavOL/ONBumNn9IvqbakpyyfH+oC7XsUZ4xUHaPEXFJzVbAR1em9dc9gp5EOJO
	1d2nuNQQti05eCrN8i1ZnD89FrBoNW6LGWOc4617jvvaC+h/3NYu9z+o+MzDXQKI2H7pV9SBzwA
	PqhWlTJVc4KijoMj2T9OtGjXeBUTIELAt8HnJzStaxi7HR1Keg/A9RGPr5hBqXFN6k+kUQrhrl9
	wJ0oZiNmg0gh11s52mqpuj+yl
X-Received: by 2002:a05:620a:d89:b0:8c6:b425:4779 with SMTP id af79cd13be357-8c70b84a4c8mr577481285a.7.1769589413019;
        Wed, 28 Jan 2026 00:36:53 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8c6:b425:4779 with SMTP id af79cd13be357-8c70b84a4c8mr577479085a.7.1769589412435;
        Wed, 28 Jan 2026 00:36:52 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806d584563sm3897695e9.1.2026.01.28.00.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:36:51 -0800 (PST)
Date: Wed, 28 Jan 2026 10:36:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: add ETR device
Message-ID: <2n2dwqrafwv2y2owszygbc6x35qn4qlwob36eipfeifkplqg4i@2sfnvzt3slbj>
References: <20260128-enable-etr-on-talos-v2-1-ba77063d6b62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-enable-etr-on-talos-v2-1-ba77063d6b62@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2OSBTYWx0ZWRfX8VtN7q5Qe5gw
 nHI4gh0uIgDp8OjTikKKAvPvIdytp+ypkn8AB+r4Et4EGvlm9/cLAAAfz2pjNHdnpSz+90797bU
 6qFj6iyFBe2S1yetY+zQ1KF5wf8Rn6fJ9dg0ejUA/TF6jXp6vV6pN+gepoaglTcHLe4ybGNhA12
 wjVzIzFXoucKHsFHyBboMGuHWzRr1EVuHTb8CPmzs4f4yS2Rq5E7dsPqeztqN8Xr8kiNuJ3paVL
 vFmVZBkeMAo9jFwUvAcXWULebkmsMEdhe8lLSPlhtMFVqLKgSOvGpSneNSHkTDXSHGXaDstH/ox
 HhlVsCABtMjxW27vU01e41DLPsY7vWBPhGJbRuDqmRLOzu0BVMqPlkBNjR6jv/qqYb/hmjiehm0
 n1xs1gZ7vfIN/n3pqLT4SeipXzvnbFXJErlIS3gMwulN4eB1eoyf9lV3lGheRDjrm75yH5PP9dW
 7CRqDzjkKQaBNLJblYQ==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=6979caa6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gWZq2N21oRNzLp9EvjUA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: K878ITJ-Ilp6GsMNLzO2tgduATGWIxX0
X-Proofpoint-ORIG-GUID: K878ITJ-Ilp6GsMNLzO2tgduATGWIxX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90919-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 713949E47B
X-Rspamd-Action: no action

On 26-01-28 09:25:34, Jie Gan wrote:
> Add the TMC ETR device to store collected trace data in DDR memory.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

