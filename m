Return-Path: <linux-arm-msm+bounces-103519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPIDK00O4mkg1AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:41:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE341A52B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00A41305E8DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D382D372B31;
	Fri, 17 Apr 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFsS/5I+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2CUFShR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188B23B5319
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422235; cv=none; b=qRyBnop1P1Exjt/Bgh0xe/MY1yMys3pnwAtRWzEvskWJxq8dWqCSRjwJdItqGl3MMefbFDqXdVEueBkv/IA5IMPyVGJ10OYLsLyffQ+ifmM8ia4KGozDSApkgKrg0945SQQqnsUC2RPAEhdeR74Ay3RyRNwiIB6i/kQqnkazdvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422235; c=relaxed/simple;
	bh=MYSiSy3TLpr967fACvfJ6lKduBOAVdEqNTQv2zr1eBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rf+e8B8fw/X4tV+uKk0CsgRwpNUw85PuNIALbf+OKvzOWVdkvFy2yKsDXIIw9319J75SXpldFgmJwj919QR2yHv/FVc9QbJN1V7J57/j+r/cVIeOMRzVwoyI5zKRAmSx+lqJIeg12qTOcy4soXpPL0i8ouFyExLMakA7e7tmHt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFsS/5I+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2CUFShR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H9kf8n1042312
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 10:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+5fI7PyXIOAzC1lNbEuxp0GF
	uwqkspsKYeKdIowaHCE=; b=IFsS/5I+3ly5+yNo2xsWxElhzx7hAmtF+5h98je5
	8sJCqp0v9eBS+ExwE4lnpne77uMcw5hZNNZkm8suTWy4PHUsbde7uoZpMCgl37IJ
	v+JAQXBJrzzRbBxpYLRu0Q7iyRmfDAbhMXk1moMR0BAfSWepuBKmNmN4xq/xMVPq
	O2yKHreS1lPz3jWSIXfXovZvW5w/8ccZ9ThbdLKNixqygamGOFq90CbLsd8Jfo3D
	AfTFhho/fqdw1BcdhfnEJL5MOqlbQ/kbTlesBe/m5GkKaSBV02BWbXnCn4SC8C8m
	HUwNobYbMPTHJG45YIqM1LjasOyDYFQEKu/gG/1mQifeEA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkjhdr711-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 10:37:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso646271eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 03:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776422233; x=1777027033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5fI7PyXIOAzC1lNbEuxp0GFuwqkspsKYeKdIowaHCE=;
        b=F2CUFShRV3NE1YJsyPVsJaREfhWnyMsrNKYkFJRETGteARB188f8XBkQyjwMznfe7A
         F1xRQQl33ZBnI6zKfVUd4Hv/fNVz/b1fFtrQqirXosc9P6SyDFTD3TSOeZlZsglp7YBV
         7kdzA++HDVa6pg1D3yizV0qaEL3t/tr0gleI6A9l5FanJ+WZJ7EOc7hIaLM1DdE+rrx9
         pUAWZ5YMmHESZtYMVHkZ7dtc1sGszJvqV3CLXx13wbrRnzg5zPMJUBukhss0YBf7w0kK
         vqK3oUgvkGH/HYzpS3QeUg4iRyT8ckLV92LOn6q2DJXmU3ORBn8YnIciRrORkvjP3B2N
         VgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776422233; x=1777027033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5fI7PyXIOAzC1lNbEuxp0GFuwqkspsKYeKdIowaHCE=;
        b=AOF89uA4VQ7I/kqOjU7/dA+goP+2e/UpoxX6PyvZXENbqvPdbTuQWHwXYZ8liYf/yi
         kNN4lQ5fo28p98OspT8Ff1LL44+FZqbHJZt8mB9aDo3q4G0h6ypaxFKjLFMRXabNt4cz
         hDPkWIKcWCIvHCqDQc146aYnCjb1Hu52FUGuqZUXb+LbEvpNJrd8/+l6k6Gxun1wqJ8j
         /P8KVVPfppC1Z4iUGCNXGS8XViLgDCYxNUdJkrI1esoDec62P9aKZ4Lu3oNvu3TTOkEs
         nDGLTQr6X8mkcVQRpISht8kI/DghirTzqHf8TZwFBZ4oBIMcEK089pHKusJTUxJf7r58
         rSLg==
X-Forwarded-Encrypted: i=1; AFNElJ83V0cYS2CAMsKKlHH3nYDipAGrfTM/X5R8Cdihf1LwCbg8bFjyA1Wij/v9mSK7qtc3bYp7G2hbTrPvYxhr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2mkI618At0tc+u0UOcJRbw5D5Cpgrugsrt7OzHZmIKHZDqQS6
	CHMW27qmjhKO5IoUDOfC2pc6XzP6F/EcP5IKaqPgLXg1eb5Oth+EhHwarLapyv8CIDGYPFq1ItC
	y3QmjnKc3gUR6LbizafqEyrppDbPUsRyTejQUzicwXAgmBjx1h3s8LpKPqhHLlFQWoflj
X-Gm-Gg: AeBDietU++uRwpUw6sLKrtIWpl/9RzPR24TIAIS6rMk6NfiQ0cMNVm1RLDSqmpg6v2F
	FhSVMh9lGM3yJIwJjTD6VbNXbKcLwIkqPIyfPkszS7D6t8LZayo8ne0M6cTLGEKw7jUiKCsLIOh
	IMsQ1bS9dIB9PociwaORvwQhvp67SRawhBfEC4vP+6m6nvvtYozuf8FnG/ZTLFLKDHLD6giVx5w
	eDRN2Rrh1LCshk9m3h56nkjiplGo1UtHB6dkxAIldWQ/UQzt2TZg9D4KUYRK8gAyKtUhTDM+xVV
	+NMYUgIOh/vE1y0TiYgWpOOYxaHhJULhW6vVb6NAcYuzFu2DqjtmrkSp9Rkt3OeANK5UrxqHGjh
	AEB0rdGHWnF/XdPxPdcHxmmeiLc6i7rwo/q+4eKvKHrM8KESrlhkli97JnccbMtcsNzYTRWLPRG
	Y=
X-Received: by 2002:a05:7300:8628:b0:2e2:d94d:6175 with SMTP id 5a478bee46e88-2e46557c96dmr978065eec.12.1776422232674;
        Fri, 17 Apr 2026 03:37:12 -0700 (PDT)
X-Received: by 2002:a05:7300:8628:b0:2e2:d94d:6175 with SMTP id 5a478bee46e88-2e46557c96dmr978047eec.12.1776422232087;
        Fri, 17 Apr 2026 03:37:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1592596eec.18.2026.04.17.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:37:11 -0700 (PDT)
Date: Fri, 17 Apr 2026 18:37:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm UFS and QMP UFS PHY
 drivers as built-in
Message-ID: <aeINUiVreq7HFqf-@QCOM-aGQu4IUr3Y>
References: <20260417035509.1021860-1-shengchao.guo@oss.qualcomm.com>
 <898874b3-fb73-4a46-b440-6ea3377c2f2d@kernel.org>
 <aeHxPALfVd7SgtUj@QCOM-aGQu4IUr3Y.na.qualcomm.com>
 <c2d7588a-34c7-42de-b809-0733b03d331f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2d7588a-34c7-42de-b809-0733b03d331f@kernel.org>
X-Proofpoint-GUID: YC-99zaLF-g28DSxWVBdsrGPlMbPmyS7
X-Authority-Analysis: v=2.4 cv=YpQ/gYYX c=1 sm=1 tr=0 ts=69e20d59 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=FPaLsdzcxQoKVS78oFoA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEwNiBTYWx0ZWRfX0BPkyotQ9Hhu
 EWdwvbG11EhMGY5ujeeXFy7xYJJj5Vm5x7dfu/1dvT8cwTVBeDo00zHsWtq3SOJtvOIuha1hboy
 5Mk4bLZ0sU86ax6k4KnhX1rGGLAinUx+llF8fVf5VHoPR6JD4vwqgfnRWbDWaZCExvdLHNto5mX
 5j1KMtTv+Hc2anv7VlRjE1ACky6O7oep/4YU99lAZtEPbMWehXp5QCVZ/viyKdHcG8uJutAb0b/
 hBw6ckpFQPJgyOBoDHkxzayF193kZpNZ0DQUDAuL0P6v2dLGQhyZoV4FgXcaJ0UNO8wQMB+EaFG
 p2svGQlDkBvmfL4XAUe2pd7YPIFEenWLWRAk57kqgHRNVCr5wV+pwaFPhA8Etu3JESI5MmLC9Ce
 /z4+gXEhZ0Yrm+R5Ed05olZ047D+fqjMMIvHPsJHU9MWwtktHrnbEyw9nFWXiSz/ywDcKSQeRmB
 2FrvDMZ5bY+6zc2HeZw==
X-Proofpoint-ORIG-GUID: YC-99zaLF-g28DSxWVBdsrGPlMbPmyS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170106
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103519-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CEE341A52B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 10:44:20AM +0200, Krzysztof Kozlowski wrote:
> On 17/04/2026 10:37, Shawn Guo wrote:
> > On Fri, Apr 17, 2026 at 10:14:23AM +0200, Krzysztof Kozlowski wrote:
> >> On 17/04/2026 05:55, Shawn Guo wrote:
> >>> UFS is the primary storage for Linux rootfs across the breadth of
> >>> Qualcomm development boards - Mobile, Automotive and IoT.  With
> >>> Qualcomm UFS host controller driver (SCSI_UFS_QCOM) and the UFS PHY
> >>> driver (PHY_QCOM_QMP_UFS) as modules, developers need an initramfs
> >>
> >> Yes, you always need initramfs and every developer has it.
> >>
> >>> to boot from UFS, which adds friction to daily development workflows.
> >>
> >> No friction, it's both standard, easy and all of Qualcomm and Linaro
> >> developers have it solved long time ago.
> > 
> > I'm looking at a kernel regression by running git bisect, where kernel
> > version string varies for every single boot.  How do you usually deal
> > with it by using initramfs?
> 
> No difference from every other build and boot? I build kernel and the
> same step I have initramfs with modules. Whether I bisect or build
> kernel for normal boot is exactly the same.
> 
> The only difference is `git bisect good`.

So we have to rebuild initramfs for every single bisect.  But isn't
built-in make it easier and faster for the whole bisect process?

It's especially useful for tasks where we do not even need to make modules,
like debugging built-in drivers.

> > If using initramfs is standard and easy, I wonder why Qualcomm QLI
> > (meta-qcom) kernel has UFS drivers as built-in.
> 
> This I don't know. Distros do various things, but of course there might
> be an argument I do not know (e.g. like it was why distros do not make
> IPV6 a module).

We can consult internally, but saving use of initramfs could be part of
it, I would guess.

Shawn

