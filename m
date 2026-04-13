Return-Path: <linux-arm-msm+bounces-102946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cERNJm7d3GnrXgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:11:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7353EBBB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C44530523E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BECE2D3A69;
	Mon, 13 Apr 2026 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaidiXAD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBJX52+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B103C198A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082005; cv=none; b=cpaBTsFwE66lRIX2bigdHBW4ADiE0yzf0XD0CXq51r+yIxdifztG320NdEPYxHIYliUzRD0RxT7BcwBPYqMRSJAoZPJRyVD66YNnytM1s/ImssR1GRT0+lEq2ePkDsZF8DTZtdlLqRTv6mOFtHIvfSrIdnYG8ruAW0vPRsHbtSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082005; c=relaxed/simple;
	bh=JjOuypucc+oAH9f3I54PR6Y2kju5pK0Ot9QKV6MQZBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBx9fDWhFxbS8ER/gV1RAaU2oMNeAhCwKSEa5iPSrG+OivAFuayPR78Dg7GpwIJtNtPEzLA0HaNqSstLBghzgnJv6d32EI1OCjuEv/Y/MYZqEUTw8gd/Zz9SPO5bz56ZDDI4Q1QbKuYVRVi1gKcOYYNT6J2zD8kK7Xzsbt1plLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZaidiXAD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBJX52+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DBV0x83560518
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Y9946GL2rljH3xCRftmtO5s
	cdnSGW8EjB0hBdNVjE8=; b=ZaidiXAD3zZ7CIDtNU8+XV8Qpf6+5eHj+1GvOE+1
	Ln1Nb5ARJOswX3IvEBYm3Wrz0yGOJ93UIXwXQE8xQiQlpXt1wTI9npI4rYvkAFZ6
	HmPU2eUtu3rGDWukkWOAoqYhwcPZu/domyBkxLyH98lxayLo9pH6qsSgjVbLVNdA
	OluqSheqGsd56ppcXxxgcKsSrCCEd3KAAfgNRbT4JOZ4gzrq+qN1SUUIJsbQZgME
	9NcTigZGYxNeTjYvz5nef+IpSDQYWOyMcaQR1atgZqkFpMpByI5TN2w/p1gERIEH
	blzhY/265zkvg93x9G+IneEawSI4UIhNRRL6g/z8uwfoYA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0n597-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:06:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so5830552eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082002; x=1776686802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y9946GL2rljH3xCRftmtO5scdnSGW8EjB0hBdNVjE8=;
        b=IBJX52+Y2vIvvOG+u+Y0O/gCjQDcdzo6FHKfkTUft/OgrC+yGL2bX7DR5ja4GHEGHL
         xxaykuJuUG3aYg0ALHmKu2FHNpOh+34JV13LB1WOqQyLJ9UJCwAzuA0OcST6J98DDC1e
         WsGHvhqGCS52y2RoZqF/8FQOAaVOj6o8HBF+ZKADkvRl0TJ9ziNLiY1jWrN5PnLSSdKy
         SF6KLGIaZFc+RHRN12i51jOE84ejhoUNkunuzHwM1Vdp7g3dsliipZOMvFMJGZ6naEq+
         pkGhZ8y/g1mhpY84zLiz8NXCgjoWv54D2CHkA7e+gyvWMzIZIanOmeLxgxLHVaylc0iE
         Zr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082002; x=1776686802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y9946GL2rljH3xCRftmtO5scdnSGW8EjB0hBdNVjE8=;
        b=mWE2ZxFBtUMCG1nkv0NScTfTaf0QsqnFMoS2fx/xOWFZ7nk+MsBpQ1plr/CXcZfnc+
         Tr5qh/645PUqiLHUXGL9Y2YZzEaWMEeL1DLkdy9G9WMgdeSwoib+pRWxVgRWOAFAaLlF
         4MQ+lCRK+y5Kb3BJHN7rjvIbUP/SitubkRdsBCcODid8os0iTVH6M8fQcwizCl6ZwGcg
         /XqQpvYCQWyvVwmqjcI2MjOXytnlkj0RN2czM4cybDV9icivqIKBiaSWLPpJWGKWa95F
         BF2AvGCTl020Fxgb7JAYwvkHG5tcUFIRTnJmRvpiYqf1gkQpqZQdLNtkqA/VlYW2QA1J
         WxDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JBnpnffNCH/AG3XNwCprO3gSaosv9n6Hbyc4b+rlpFup68DoBpFOReMLQrSZc1OU5HeNzfAvUgNeeWEiv@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8ziIsCCbc5ouYEQMDcPCoqxG7Dn/gaQIaimEu47L8O5xFURI
	w02gtde5iWqmrbEulrOLT+wArLli5Wagb6tybg1VXsePfRfjCdXSBhGwvjIpIiE0c/t3JYXROgJ
	oYkv4QYKyShiJUyO2H6rZAnle332n5Mpj0+MqJzDF2ooh+ziG4L3REyVuwEqeoQk0f1ic
X-Gm-Gg: AeBDieuCcbh20G5TaIHhlorbphmEDBr+rG1CL6ApJqcR86VYx7ycdfSX1x9l4i74kQs
	QVtSW7YSOaotdG99A/goluZw+NEVzVLw0/mxlVnFPaihVPZzShMpAq70Ej/XfbaHxi3lNNUjj1F
	y+XErMf8bbEc6+oAFTs0S1cp7F8F0ll3IzSGxxNfNmUA7KCjkZu+lLsPP0qsSAMa37KVnvVf/Yp
	h1dGx5095Aiw4g+Kyr8CjJ7R/rLBqqABM2/5rFUXkakhHwnXww5d5Qmnx/Z+4fGzG+aqzyHAZmC
	GE9TMcGGZBaEVaEKGk3D1szAV/0dzDSAM6Q5zQuY5OM67ERu1HdF5eHmB1iyMgNJS2hsckD8Z49
	phvLxyi3tneIGe7VBE3VTSmSgAtk51CLHu6UHMevyIKP3mSkO8a1P1txmQuVCrRVk
X-Received: by 2002:a05:7301:1e85:b0:2d9:6373:ad09 with SMTP id 5a478bee46e88-2d96373b0e4mr1468017eec.25.1776082002066;
        Mon, 13 Apr 2026 05:06:42 -0700 (PDT)
X-Received: by 2002:a05:7301:1e85:b0:2d9:6373:ad09 with SMTP id 5a478bee46e88-2d96373b0e4mr1467997eec.25.1776082001418;
        Mon, 13 Apr 2026 05:06:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm16163467eec.14.2026.04.13.05.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:06:41 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:06:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: cpus: Restore qcom,oryon-1-4
 compatible
Message-ID: <adzcS4loKKXGBbga@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-2-shengchao.guo@oss.qualcomm.com>
 <21b3eca0-c8a3-43c3-ad61-f15abedf5c7e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21b3eca0-c8a3-43c3-ad61-f15abedf5c7e@kernel.org>
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcdc52 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8ZdYE9b5z-9qtW5Q9UwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExOSBTYWx0ZWRfXzC/heQQfFNne
 QRyhfXz9CUyp/xznWBR6cWnTokP0BN+lKCwYay7DmwvcVhSeqGdlT17IVGeH6g8VJvfvXfJT5oF
 Fh/CC914dqJ8eu3IgvxwIzIe3vzTjGFYKCKHHKK4AiouKxsEyDN2uO62JaOoCoqCgf7hiUwuuVD
 cSnkJfEqzh0aHGULdeTzvPj124nfIwgTG9a3BEmK41cVA/EL1pwNSMPwutC8EnZ8gbHF2aKe/4m
 HPuV9AxHSNYyyuQqReKmSnfXpu9/iNOthA04h/lQPisT7AfIfWJ94zYPLoV42XSEQpPG2ULqnC0
 QSbTSO/QwQbn6Pt7bwJs0R8rHptNyQuWAoB5WQwYGrOJ009vea6l7ofLY+tc/ylLMa7uhIWmKKp
 LBBSVIhWLhhb8I9Al9U76f5X09RasTDmObjE8XeaVdV8pXGDIwfeTx5iKLz7fv8+4PmNmRXHLZG
 Y6AmiMX9pppBm5QLNhQ==
X-Proofpoint-ORIG-GUID: mcng4iiuaYB1T2oRwbSR9Tu2aRewp1tZ
X-Proofpoint-GUID: mcng4iiuaYB1T2oRwbSR9Tu2aRewp1tZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130119
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102946-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 2B7353EBBB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+ Mark

On Mon, Apr 13, 2026 at 12:01:06PM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 11:16, Shawn Guo wrote:
> > It seems that compatible qcom,oryon-1-4 was accidentally dropped during
> > the conflict resolution in commit f6935ae6147b ("Merge branch 'for-next'
> 
> Don't reference commits which will never make to Linux kernel.
> 
> > of https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git").
> > Restore it.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Well, I said that merge will be difficult but Mark was sure merge is
> trivial, so here we are.
> 
> Anyway, this cannot be applied. How do you exactly see it? Which tree?
> Try yourself...

Ah, right!  This can be applied nowhere, as it only fixes Mark's merge
commit on linux-next instead of mainline.

Mark,

I should have copied you from the beginning, but could you take
the patch [1] as a bug report and get linux-next fixed?

Shawn

[1] https://lore.kernel.org/all/20260413091625.607976-2-shengchao.guo@oss.qualcomm.com/

