Return-Path: <linux-arm-msm+bounces-104000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFriEdMn6GmVGAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:43:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECD441218
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BAC53034ED7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 01:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9812EAB72;
	Wed, 22 Apr 2026 01:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U23XLmAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irK4VJF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091BB2D7DEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822220; cv=none; b=eRU/Dj3Nf1Rfz/Z6RplL/WXfADFoQJZXLiS5GQh38/fWAub9i7KL0vdDKswHhREw5Pr0Ut5GQ/q6/r9rzUB/d5Tf6i9YTcoVmMDOW31MBFS7Z6cawIot5bQ8SlYBWmSpMNG7F30Nn9GosP3gEVs/zsXatZ4BdIYCP2HsU5C4QQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822220; c=relaxed/simple;
	bh=OXH8DH/ui8xW6txaS8itkY02XzsE7K7pwEs85oFzs00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/mfFvaJDJyGRxThGJ3Ntx3zgj40fWt59Spz1lOTWQA888TieAlWPTYGjuWRBzIsb+yk6A+AoANHh0j9vsRGYPXxUHKBxrBzw0gINqtmsg62Nm7QWuNChl1v39PpVB4KyltgSSXchS6n7MnjGepzxXVOiuVjecylh9RNywboETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U23XLmAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irK4VJF9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZlbb4051048
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EzMWH3llJFQMU2+MWwxLHFCk
	KmB6DC32H1dvf8Nmf0Q=; b=U23XLmABdobPkxFYtmI8j2BGwsaJk1LImoGE7BER
	clHppV67jKkvNDK7anLP8roPOy/hGKplGiJFGSr1jWoJUBhemTjlEOw9EwvsBlIj
	UFtOeny3jpAS+WxYWvPfg5Rl4JV481wxbyX2UfqRTCVrXqcJzw3sUQXxH49cnc7d
	UoCHODQFpDxCElMc/gD2/Dcxtq3wwrl9Upf3iMtg5osGu9iZFtjTmMJSvBftWpBg
	Ge3vtt/RIXTuBpv8CEM9PDt0vtt/kiuSLR9SEq9Cc2TyoIQtyCcLPUF+99+SGXmw
	X+3T1FQ0x2eDMuK/pM7IlXRUQlIllGkyl8n9xrYmt1tdng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfh62j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:43:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e423a05c8so24345211cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 18:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822217; x=1777427017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EzMWH3llJFQMU2+MWwxLHFCkKmB6DC32H1dvf8Nmf0Q=;
        b=irK4VJF9LP/HtvkAngl06//U8wRzxxiw4vbOH67wug5T3EKCKKJGeXX1TfWejzoJgn
         Qhd5nKpDjkbJNXf2SI6p0kna1cjTavehy1NgUSIchXEpOKhRHh8YWczAYhTkMobAkPfw
         SZ54tkOpNWULuF2TP/6ki5Bx1IqYm/+/H1szIjjdfEBocAX4IjWF3p3nyNDcCPaCo6Na
         fEqVRJ++P5ZjNEB4gGJ/Ke2NOG7be7wsgILpdpj5sQja4GBvHcHHIK8M/4OVcTOQW2IE
         XrSMvrGyGbK7cBoc/Kxsjf07bblbLYaSQmTSsz5cBUf7JHcml2MNKigVxD7WGcoJDsux
         C0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822217; x=1777427017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzMWH3llJFQMU2+MWwxLHFCkKmB6DC32H1dvf8Nmf0Q=;
        b=L8rjo+RCYecay33epIWjH7lr3apEXdlSEnERMXb3y4mrTUnYdkoGVmT3wY4U8BTxEP
         UvqrG6W8WpJ3T/5mGQE4BSJ/KQAKFrl/stNH5RK+qSFi7kyDIAj/qRTNqnu8pS7nVaUP
         NIKu8oMISNeSIXaYm3DT5eRdyZgMjmf2L9M6NHOlUTWakSYEDN++86B7t/vtoHvuZ5tq
         ck9eZdYAJEGRcN21YZVF2m8oe94ZX+MTQieqCzs7M0UvCTEWYHh7EGu5HWajg1mmYuDJ
         o+hgXZBf2A+E/PKoJ/rODSE+DCgCth8qWGEhk0Fgn7HTs1snSwUzAjCj/N9ofxcnNyh+
         Myqg==
X-Forwarded-Encrypted: i=1; AFNElJ/cl6UtV8uYwF9BsMMVqcs2hQUxKBf0Pb69L7xFLRl8rft8gYKpWKGAzKy/BWCoISZDEyAqb3KVzWoByIOT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyxit8kE7EHedWaE7wbvgFNaMLtGEL/+n/3oT8a5G3WJT0girM
	MozdyyBOv1ANFfZjaluVs0RmO1fQoDFV7OpbiV1YsZBkMMsT+qrZJLfq2RYzkjMFo7GDLf7Bwln
	10RpgbW4CTHSN6FW/ZJYfQ/4BUk02Ihc3TWS1lQBb7BtF+3d2p1m4jx1DTp/upCjWOFYq
X-Gm-Gg: AeBDieu2PSjk/9PLgzEeVt0puCA9pA0PvSq5PAt0xV/Vt3SULs0LV5NGOpOjc/NS8j3
	wUHFlu8ZPzf9AdI+1ULUHl9GBpT+8oBNj3A3NRkKWib6oUP8FVvs/mt1S0YXw+QMCtPOvwOyJy+
	yjOO/Y4U6KTtt6aRWa4gT0QaZu7R2mF3+yw3+cP+aIduyiE5NAITstqCjQaXRa6QCFCnZBTIGWO
	WmPKH6cJFCQrJ/9JfL//Mt/rciAHYbpGR0c/U4rG5RaVtwfhE+93e5jUXX7t1z50UQlIO9JsSmS
	BK7Je8JRtlDfA4pYB4D8kqcSYm5vmGiyMgKzSLJWXBQocmd+9jpTP0zaFZMdJlsc+PaJv+4oEGM
	K9GOXxiqsMBLNQ6/15nGWT+OSa6mSrzSYLRure45xaJ6XzGvlHWkqfuwbkG2rXYv4zcrBlTKD21
	BPh5U/dlWiAOoj9HIg/E+bfTy9SF8dGJn7lAfvOpxbGCnM7g==
X-Received: by 2002:ac8:7f55:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50e3664bc7cmr277776651cf.14.1776822217232;
        Tue, 21 Apr 2026 18:43:37 -0700 (PDT)
X-Received: by 2002:ac8:7f55:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50e3664bc7cmr277776341cf.14.1776822216746;
        Tue, 21 Apr 2026 18:43:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc297sm4026483e87.18.2026.04.21.18.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:43:34 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:43:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add PM8921
 compatible
Message-ID: <7zumbrohiu255tngsebrm5bd3xthwrgugqa2re2ewgxydzlflx@j53a5zj3yude>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-2-bcb0857724de@alex-min.fr>
 <46a322f5-db18-49cb-afb4-ec1a5bf23717@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46a322f5-db18-49cb-afb4-ec1a5bf23717@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNSBTYWx0ZWRfX6IZo2CEzmfYz
 L2EeQ5HhjqaeiBQPTQ8IFLQHAI6BYqXjOYycfxcj1gzEkNNyZ7FmF5BzPxHFqSs2JUWKnyD86vL
 8tbmgZZETFiPrqFkuabi9+gpXfD7idXEEE8dX1OI2PDXJCdHay/BHIG3LUCF8i28AX345sOmmM4
 wqNZo1wmOg50KZ8KC0Jtwq+Od/ogkRC6DE3b1rpjIP02T9kvOH3KzEAXKCBygGnW9TqAwVbJruZ
 fsg/hJl6F/vrEbh/a2Mb+RBvyz3epK/nOf7k7FcYB7j5W8G57YepQE4Dec5r4jrOpapnuBAkLOE
 ZObDbouEr8szcU9+zWaPOlteyOTo7dIipdDgBpnAw0Kc1R2z3+rCpCVya/bFC5Q378BHLZ/4l3Y
 c4iTjjTQytFeKOkAaNkuAqcpFkrDjUuFhHjvt+GORwcvdDIDmEJi1BOsIogiqMov+y3ievojicn
 vlgoT/d5MN640NDCyAQ==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e827ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=F7yC289sF44U6c_-gYkA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: LLdVmuGKxUdRPmCc7qsWJ99zlV3rmOn1
X-Proofpoint-ORIG-GUID: LLdVmuGKxUdRPmCc7qsWJ99zlV3rmOn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220015
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104000-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADECD441218
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 12:03:36PM +0200, Konrad Dybcio wrote:
> On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> > From: Alexandre MINETTE <contact@alex-min.fr>
> > 
> > PM8921 exposes USB ID state through the same interrupt-based logic as
> > PM8941, so it can use the same Qualcomm PMIC misc extcon binding.
> > 
> > Unlike PM8941, PM8921 does not need a register resource for this use
> > case, so allow qcom,pm8921-misc without requiring reg.
> 
> That suggests this block doesn't really exist on the PM8921.. I
> can't find any information that would suggest otherwise.

It actually exists there, there is a USB-handling block in the PM8921 /
PM8821. The IRQ is present and it is expected to be used in the same
way. I'm also not able to find the actual registers. The closest one is
OTG controls (0x6e / 0x6f).

> 
> Perhaps what you're looking for is "linux,extcon-usb-gpio" or
> "usb-b-connector"?
> 
> Konrad

-- 
With best wishes
Dmitry

