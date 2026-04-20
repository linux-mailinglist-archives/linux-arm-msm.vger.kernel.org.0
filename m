Return-Path: <linux-arm-msm+bounces-103655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GvXCAWap5WkCmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:19:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB381426B37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02650300C038
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84C33815FB;
	Mon, 20 Apr 2026 04:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHDyj9Jh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeFna5QR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7D73815E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776658785; cv=none; b=nFy+8AGvGB4wKDHuZun5P0osGdi6/w31T6G+WZBEwnhOxUqj0vKf5hTNEDLhbRt80xG60/5VrdDeHXLEbP5SPL5MRbPMvYx4hZMVDVvCdC26TawV41VFkIGFgDspL7ADZm3mAckUdFgXBkIAym2dWbG/ocEPgiDUvFWlf7odWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776658785; c=relaxed/simple;
	bh=3m8OEi1Nen5JrUTIx7Hn3xTV4VTySV7tKJw1t7oywNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtnYEWvysSn1wyRJw77sM5F98evnqbaU3sxxcKCOUcCTywQq9Tz+G5Z5eozylo4pqIlIQOwD+9T9MeJTofHmLsXXAt0EvuQGJFFYWpEVJfM4hpoE7B2Z+gxDKdkxttjQAUr/jqpQUnMPYw6EfCvCz7MU9S+fsjiQA7pWtHyJBJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHDyj9Jh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeFna5QR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J805xM3802532
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N93f9sl7+KieV6Dfe8+14y0W
	rMTy8l1cKYpC7g89BPM=; b=jHDyj9JhSYbz8nktg+/SjS1xZq8vbtozVkI3KbNe
	O2BATo0l/CTb2Yzz2HQ6Mv9mp45OtVrQNh0twzbwLrMJ3BiWOK+wJBd3uvu0J5CM
	c1+Ed0KlRl6cLhDJ89fOdRyZ+j+JSEVeiwAlrDzjAiOueU3o1zEgGyoAbo/D54x6
	FMPd02IYlSqgZPTxaYHhmpUkRkirKzde8/5yKzdhWgmCpyx01qSrflpmj1i40vuF
	q24SXRTZyFFe36F/Luqrn/rczP7ESBKwfo0nG4O6ugEC7snJyBOVZQBMxDwj5OnP
	pN5lmTGsa21JjlhD4cGSc/rRV7gpBSDnI8SLFQpIAEWJ+A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b73wm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:19:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2dd1c74508cso5043501eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 21:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776658780; x=1777263580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N93f9sl7+KieV6Dfe8+14y0WrMTy8l1cKYpC7g89BPM=;
        b=aeFna5QRPqEWppkZhDOrO+3RxoHwEzlo47aHbdq4va+FkcCwD1UeQjLzymVt08odT0
         dTRvnkWYuCYtwQBofRcraWFIjeDhQ7f3dKDmyFpc3Bf+o7sNXJCZa8PmjxLa8fgFr67a
         Tuyr07BFti9KJ3Qw09ooyuUxWx8kOV7ImDq8aRJPg82BvNRzSCZhWNqWX5aAIhDNqQxp
         ZnP27aXhezdZxEk8L9KZOftz0xxJ1Qjf6J/fAmBQGTFKRwFC4DXWO0N4g2h64OCckZlz
         DsT9bZKKEvzwKa9AGjVuYmTJlXKXnyGUGU5svLVrJdqio5LeqEXoamXJWFGG5dQguxLt
         9K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776658780; x=1777263580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N93f9sl7+KieV6Dfe8+14y0WrMTy8l1cKYpC7g89BPM=;
        b=FREhmJrCDRCGOJUtoxAoGEcpjvOD7/3h1KyX85GKEYmgcPKP3GziwIi/G/2LI47pCY
         APYUjqUxWLQltAFHGcZojM/xCdlEC+Gsfh3jPicR/yPI4a7z7iAvMpy2hvacTfkIuTsa
         O3Qix741K0aTnnTzDV4Q4PUzuL383Mlu5K6Z1Tp3HwbWe57JjFhbyL6LC9V4Y/odGe5M
         U/qChNXlwOX4ZnSsMxniStLYn6AiwHrK0C4zt3FNjG6QdNE+s6aDQkAH/CO6KrDn+cBm
         BHHNbZ5x92oIkLJflYOsaEYPadZjNLBcK4z/TQ/+BsZdIjbwkeW/j4Nwqv+cwC8HNYg+
         +jpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/AvWjG6grO6rFJ365mCWXjJP+kU/9ey6TSSMFv55CSEPb6C3lRwlpvQks8jxMPkJ6DhKrBpTNwu1SYgBN@vger.kernel.org
X-Gm-Message-State: AOJu0YwwWOt9s7XGk6FRnvC7DclssCnR49fsMlhnmetw49eIiEE+Yydf
	/rKVeBDOqQY3jbCb0gY++M0MoLce4sJ1oIIW9WKBbTNx/ag0Evug7mICPql1hS0BcG/ImnCDJMr
	EeHXljFM5u76uKUvP8fTqyg7sJQMiG6/8AULrKpU6/xJKxdIytYQLmsu1jEuBQbsskuTW
X-Gm-Gg: AeBDievCY8+YUHMXgWYmmFELJ36koccVeVmM2ZtN05AbeU0xALQbVcUKbh7atJlZz97
	2tHVOO4ATXZw6Es463FfeY+scRJJ2IxAK9xCwRyBAr+FLnfCoUBuVOS5+491jliLjT9oBIdO38d
	NkNjMRXRpnzDi8oglFNdFQq0ZdOKNKjT8GZRjQzyHD4eqikJlE5dwE1zBYxFUTP3O6Ropa+VOl0
	akRALCF7G9Rm/noRO6jyJhl0KqcDrbp2h3P2AP7IW59HSm6X49xK6vuQdXOSDjfzTzj+mACUeO7
	jHlUsDIgSQbfBL+u6lU9MnvreREWjxJZ4TXsaXxhe2AbmyRBNN5FZGzBtPZC6ZwibStxPCNYhnF
	Jy3NI3MLQUnZcQsan8HK3XTuCmKuDp2R9JkJsqSHfiE3RvoA/0BaFCdMNgxzcySBUYVxgYWiyqi
	Q=
X-Received: by 2002:a05:693c:3006:b0:2d9:d062:4cb3 with SMTP id 5a478bee46e88-2e478e28c6amr5286130eec.26.1776658780034;
        Sun, 19 Apr 2026 21:19:40 -0700 (PDT)
X-Received: by 2002:a05:693c:3006:b0:2d9:d062:4cb3 with SMTP id 5a478bee46e88-2e478e28c6amr5286118eec.26.1776658779430;
        Sun, 19 Apr 2026 21:19:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e536e54562sm12622006eec.0.2026.04.19.21.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:19:39 -0700 (PDT)
Date: Mon, 20 Apr 2026 12:19:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Message-ID: <aeWpVXMezplE1K96@QCOM-aGQu4IUr3Y>
References: <20260420041318.1247875-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420041318.1247875-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e5a95d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=r8GZQKSaGxLjtLWlYeAA:9 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzOCBTYWx0ZWRfX0K4vtTUnQmmT
 XSXPh9mzqYqWstqydzorKu9r8ngORFjDregHRqERYQq9FqMWd+zPxabxVRdKZrd1Cf2YQFA6/tK
 yucLf83rouxam+tEp0SY4V2zAAgRwkLIwW27RhiXmNuJZYqHP0eNMPp4Qu2v9bI9Hx+XnA8VSWS
 F4FLjTrnoS7McSsuKHQSaAB0duDXes1O8IRtRR7xzfmN1X74iLbpeCgHfBX6cpjUo/ujHCCz3EF
 Hv8Nqz66ZGXEUjahOTfMS5dflN1YTimSaiOPd74UwCxq30zEQZkr1d4W0uY8DJIoDx9hrBMY3nX
 rsIZPNDfv/UzhyN6LJQhyHEpvxpMHDVySp55bhCeNvcNNHS8no1KngV/+PUp5LCWeUPd5pDMkWJ
 qnuhuFlmmvGifDzJqy7Hp5dciRu4TgLR3ecM6YbV3oydaVS8FyjS2v9GWYZotTJG+zXcH6Q/rRm
 S7V/+QU2tWn5sYzOMPg==
X-Proofpoint-GUID: oycAFV0QGOCrAvpTfmTks9LPxSFKmAuz
X-Proofpoint-ORIG-GUID: oycAFV0QGOCrAvpTfmTks9LPxSFKmAuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200038
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103655-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB381426B37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 12:13:18PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Top Control and Status Register controller for Qualcomm Nord
> SoC with a fallback on syscon.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Sorry, but please ignore this one.  I forgot to add my SoB.

Shawn

