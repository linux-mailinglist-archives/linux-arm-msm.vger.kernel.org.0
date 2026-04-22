Return-Path: <linux-arm-msm+bounces-104178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL4GE94q6WknVQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 22:09:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A485044A865
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 22:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB44B30160D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF653F2117;
	Wed, 22 Apr 2026 20:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k436IgP2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZclzCN5Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D4367F2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888528; cv=none; b=taPqTnVCQEGJlh+3kBwaqMok3xKodoYsSPHUwfdARzMW0PAVfLEY8EkwAwZEmHJH2RUXu7Fv61+ku6fiFRVxEhNn1DsVTxw6xLB9WqTEZUeryIwSXFah6anmNTrkB/iNj3giFpQLBGN7Tt43eJgDExGsEYFPH/c5oKBqbyX/bZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888528; c=relaxed/simple;
	bh=cvPZrsNX3AiMSJzsAhO6OS3+NTcfadIRaX9s0ELcXdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFXib6sLHSi4RBxLmkhi65wOuUkV/00C9GjN6rY8G+F/msBxh85x6e/PM4ETrHp2lrxIvIpenEK4tYPHyrHIoWLRGhE0bgPIG8icP4+FeqocVEuRivExRtYf5oiZYcanrniGurIwcSm4FweFFZRpIz/YDjQ/r+jGJYwOnelcYvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k436IgP2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZclzCN5Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFPHFW664114
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jxwx/FL89zkqoEwiihjnYa/O
	UpNSdCgpzkNgdkiZ+YI=; b=k436IgP2FPXW5cgyPHBaxXfcWRk+SL7kC0THdfOz
	kanm15sCulvwqWRS969OmG9okUxw89X+OwmS5SXB9ggkGmTyRirsP6t5SuYOLvOn
	EFRSX2uy5vnKybOensydRhrUMafUhkGG9P/CWxBCRLkC63VAz3E0+kkSNySMf3ZU
	SY0CXfX9PvYcrG283gGrd5GbQJgEfmzAZn+QFyBof+h/5yeeeqEuUzO2hM3PDejQ
	NLPhxK0zCCNNiUkm5Us/Eb7Ic2cfamBK7JCr0OmPYS0LLlZNZRTmNxlP/hzPHzAI
	K6KyaP/zvjz+Y4QUc7aCaEDiUqSEGZrDbByFmwq+NnxqhQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgtdmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:08:46 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60fe90d2340so2778413137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888525; x=1777493325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jxwx/FL89zkqoEwiihjnYa/OUpNSdCgpzkNgdkiZ+YI=;
        b=ZclzCN5Qqf6BuaZeB6jYLbCJDPGYaYC7tLMhgBaaVmDf1gLr7jRygCgB8KfKOykCLn
         sVXcyi/SwXyMFUcV0Zm6tFNUUr7pqVQiIFc4zXrigiCJUZnoVu5K0OOqxJlJcQl4uPY0
         dVNL0vR48OtbB10JfJH8zzQp01BkKyuVrZ3/aNS9n3GzdhOJZGWpTV/G2Hdmqf9ZPsC2
         Y381gEUt0IwFIINkQxURfIsou8BWuKhi9MN5M+AkDDA68h9fHlw4mTX8jKW0bomnWIzB
         q6mRsgqJjHEGlIP3391ap7rwo9pPnsxnSCOQKcP5VTUL10symX3f2s846Gmh3kgKGvNq
         QKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888525; x=1777493325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jxwx/FL89zkqoEwiihjnYa/OUpNSdCgpzkNgdkiZ+YI=;
        b=ENGlENDMjrMk93Nmki7uFs/zaZi2BUlGksPL7r6Iq/CmN6F0YUebWTL5N9o2i0ED1d
         0ipIC15UFY4q4Hv7f0PFGi6J7pfve3IeXjR26VcJrCYwGRvApy+NlZFfSNjKlcYeZN+a
         k5CGCZvSewTMHR/QGXI0WlY7mylmesoJm7kfUTtbkBbsrU/++QmdY6UKDKE4PdtaCKlE
         HpwcxdGTOjsw3DL4c0NJXgb/csataYOm+Pctdly5Je0XVmULduwFbJJyOValhZY3pMCj
         /OzhkIJ+qCTxs9aRthsaMC1+kZBUqvUE0MnByzni9igiuaYaUc1uXIjOX+eGldJLkd0x
         AqTg==
X-Forwarded-Encrypted: i=1; AFNElJ/j3lcHQLRG1ffxxScWDI8lfcl9Amyd2Lr8s6ERcO7elRe7s9eWrM0Rul+aqqTIysaBZGZseRqXgpuLVSZY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3k36m537VSW/xWH2dAJYS6njqS1ls4g+gHCxI6kPLIMpI4Aau
	fOG4z9vktTD6Z39T/TqIW1N66eqykGmobB43R26YFDZZdEFqOR2ow8DfO0H6MWpD5gnWO+LFxeg
	aM3eqdo8opRvQ6tpPf5X9hQA4zrWUz9qHwmmpeK0v5n35OgdDiyo9pgY9nVjWS7u0wcAW
X-Gm-Gg: AeBDiesrVgyYqbo3rUCMUcjAV6Gm1D7I6bO749Wp30Z8KpCx4iXXEIGjpO5MAuhPW4M
	b+orca/EFEu5edXvik0oz5BCGl8VtcWVG4xNEYdYkIhdpqjG4NnSjGlsc7dlpso1gexoZSFFvTO
	OqoiGdZHsaPRL1ZsfbPzZzEoPmBavPTa+15u2K4Wgo0gNGSrjKtF2mi4KT57SUpCBwefC4oflXS
	gHU4mlo+0hgdem1ogiAcBCtaEylMw2bWUupfnn8BuSOG/Vb35UN4aVidQD6noT2DNh0JuDVqNjU
	I1XYmFlgpxnN4y9Kvk7QgbmIoDl+s1xKXi6zHWdKFMwxYs+wTgD4ojct4ynJK+mVsIwYWbRJM91
	KtPinmppWWXHum01sLy8IJxTyfsTtljqCe3drxegcHHldLNY/XwKaBqqpqrOiRPg9vHYx10+qAB
	i+Ibm5ads1KtpbS66UiWal2Ix9ZWqxGoqKGi3b2+8gylE7nA==
X-Received: by 2002:a05:6102:2c82:b0:5f5:40ab:2d65 with SMTP id ada2fe7eead31-616f80729e7mr12301275137.22.1776888525326;
        Wed, 22 Apr 2026 13:08:45 -0700 (PDT)
X-Received: by 2002:a05:6102:2c82:b0:5f5:40ab:2d65 with SMTP id ada2fe7eead31-616f80729e7mr12301261137.22.1776888524892;
        Wed, 22 Apr 2026 13:08:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm38808691fa.4.2026.04.22.13.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:08:43 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:08:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
Message-ID: <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
 <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: n2fSrWScJoNh2E0cu3Q9X3JIx2QfHWbl
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e92ace cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=1Fljp5HRrODeMcgZaQwA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: n2fSrWScJoNh2E0cu3Q9X3JIx2QfHWbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NSBTYWx0ZWRfX2kKUOEePJgE9
 h6MpSshZiY5rlMZlNPzBrGku6OfpBB3H1CL7m57Twn9TfKHKBFwAs/UBI5DKXa1zaysWeeTSIjk
 a2RGl8mNpfiWssqdeJpUl/W6LJuvtvt3MrcGkX5ACcBQRSTVLHAfLKrFiIdcWLtgdcbbQsP+KZj
 tjfbp77q9GQNKRGmRUtz5gUrVcX9I5RtoMwg9MtD1DnKvx8NCDpDmMAtkpcnEwr8ltZo2rrRRVF
 OrIgjmEQLwokRZXWYHDSZzw0tYiiIa25wH3QqRvZartNkHeP7wJ80bshnUYvGBKLk//LxhadK2x
 fKmwP7OWOlJmnDCjUjSYp9KxltArLhcPmHAvWXSMgU694oaq4/RGYQ4kXBRQZZlXgZWmWpPFAgd
 PxkNNwJzxhumkbsboE4pXSB4FzstcrLvb5/sNgudaVFIwUSF4eYVJcjT8Lnmr9arpSQ3Bx5DWUa
 PcSDTO2CAXoWh5+NQVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220195
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104178-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A485044A865
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 08:41:14AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 20:02, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
> >> According to user manual / programming guide there is no separate PCIe
> >> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
> >> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
> >> is marked as the main block with additional sub blocks for each 4-lane
> >> phys.
> >>
> >> Describing the sub phys without the rest is not correct from hardware
> >> description, even if it works.
> > 
> > Is this the case for the other bifurcated PHYs?
> > 
> 
> There's more? Oh damn...

In the previous generations. I think Hamoa had one.

-- 
With best wishes
Dmitry

