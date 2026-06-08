Return-Path: <linux-arm-msm+bounces-111673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e0P1IydRJmoTUwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:20:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C49652C92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:20:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JnEC44Mm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LJrJ5BAf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111673-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111673-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F3733023F9F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30831367297;
	Mon,  8 Jun 2026 05:17:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A8934DB72
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 05:17:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895862; cv=none; b=TRHdwttiEqF7STYGtJuieHri8X5WqAlY8VlIXfyUB4VK3feICtbHJCbBOV+Uke7RELTe7YXltmEzB55w8xd+8YodQ3aJdKa6UBLq3SxY52vjg9NLtxINueOGP0KiYsg2d0q4oiMZucIsr0csKey2UBFGCw6KAB3aRvisExXqKyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895862; c=relaxed/simple;
	bh=ECCQW3xO5T10iM5U19E+0qZYiXxmAtMlR1/dkEEP5jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXW08Dp0HAkmykAlJIv1u1uvBtXo6eKswZ+mhga5LOnpfS7w6JvawvG2FVHH44neIJ5jHAOxi8kJN1NE7v58ObbSJWqz+4gdj9Td5Y8VhWbT9TqDDliFCkhHHLLt2To4YfZx2DNwUY7QJmf7+uId+/qsSJwaza2jvUVuPfe2W4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnEC44Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJrJ5BAf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Ee2M1575383
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 05:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jHDv+l1yJPatDEFQEt3C8+YE
	NnInljrnoEQC+ZtHEAo=; b=JnEC44MmkE34jRXFAcP5fjofJOckK7SAsjHw/smZ
	v2iIudu/0FYOM4IVzFVJqii0MWFrktGFow2+e5NRhBk88YbumNtQJjJkxyKjWSjL
	QguzgEr5DaKfq/rMbJSFdX77PjWNOzpC1uikgygzKbUKpxjJJOFFwW0FAWznlTMv
	LDYGSQBuFrKZKE6/hAJwztE71NzRxkQGKuVcLaBQFi6GKmb1Z3Cr+8y5Mp/Ve0JK
	iUbk3IwwE8CYK4VB+au/YsHTcnv0fB7/zvgmyGG9uVNH8HImqwpYV2rZNoCNeuiL
	czrowGotVNsRLF3ULKVv57X/7JoxNOefsrYd1s9dUsV9wg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cxdkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:17:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfc66167c4so1539926137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 22:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780895859; x=1781500659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jHDv+l1yJPatDEFQEt3C8+YENnInljrnoEQC+ZtHEAo=;
        b=LJrJ5BAfBzHc3FoBFtQAr8UApGRtYH5FMPkZllea1H+SgtcifAD0vikY5IXjcijNuq
         GXa7fjLnrk6nw3PBVODt7MWqvhtKMHsk4nSbemwgloY6YlCzEj+2Eh6ZxUzx7yTNK0SI
         Wlu7YWJLox6tkc3fzicULaGl60VD6HH8a8D6xN5NZu16iNeoOFxmh4CJEz9UWK5eF7bT
         bgdx/TIsAlCSU9UDwrSnmygJENoFSgcwMyeZgov/RyUHYPdOHERjcwfmkWgf4fJtoV9x
         jhvjhg22wXQGwXWT2nRnAjutGgZOqMXTpooek9CBCPkI0K2a/q82PMuGQFEwCA1h9kAw
         sO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895859; x=1781500659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHDv+l1yJPatDEFQEt3C8+YENnInljrnoEQC+ZtHEAo=;
        b=J9gpyTPSLPU/zZ+QF33WexwWJNK+EyTi5B+lyrHsTrOMbUrf++pLLcf+glvcto0rHI
         WS4I8KOrfBWdyzBipZDlQ1CEaMwltkumTTThmtF3VvhrTSjti6rX726BqW/o1RVe5OII
         3ivgn6QPvzV+U0jAIiRMePDjsivq+aJGhpKxGXzn6Tq0Ocu0u9zGxip2uDkur69gVYu1
         di1RSM1ZMzpllCckwp2bXnxOrw2t6E5qbxWb+GboyKclBneafmglRk1WIslMo/kEKDEb
         snqXUcavcE9sWGHudcx9kOBf/PEa2F2+KxUSWMlqGUiQwqK0nsnFLXlHggd8fOF9SHH8
         mBzg==
X-Forwarded-Encrypted: i=1; AFNElJ/1zdjMJBvSX09rMJoHglhBQ0GTjeHsNYszhn6YjJv0TruzmaunVqJmw2eCwD7cIISGKikrNQxv8iual+FU@vger.kernel.org
X-Gm-Message-State: AOJu0YyVRMlGNAgU7NFcrMMVotgZ675oQIV0vkB3MWl1IYfolox9e6hF
	Gpgqqd5Zx1cSZXNik0n1Ptx4salUUZi/TMyqB0vUV8R9R70V15uPYchlhf3C8ny7w4hr+v+UjNt
	ikFktYPfbO+mUhzH+qRjVa5Et+uoHEk12oeOY1oDF9bQ4dxsjS10RiMxHOQ+aPRK4WxuV
X-Gm-Gg: Acq92OHph32yFOGk2zajJ2HYgP+KIkvEu96S/U7R8XU7BnEW9dSJ1hD4AKyexUvWrfz
	UAX3AmA5H4ed5mKyWuW3cSdYw+kLAREV9FifphwgE2ny1D/UwhvMTJeWhoMjAR5gJ5Cg8fbwNse
	FOnbMARkC9CsaIYdn9FfO1l3vB37mQ+EQBZT3UTLbJceIO3fQaeSkBKt5o4D5FCCKqLos/5r3DH
	ukqrreQnMIRSdnt/POrG8w3TVJatExiXwyN1qyucev4dExAXgjvFzosZjGk7SpMnclH24Xi+geD
	TQRKljc61iuUzN1Mz0PKo638QQeWLD7fII4BjvEpWluKAns1ryD4x/DbXzX1APP91J/6M4fgKlH
	AoFrKY2uhtUsNR5GZaNJGZaiKOn7SUx0szpSFfYsniOD0eOiTJ9pVcG410gF6s/WNdrQUdKCAV6
	/1DGtWX9kxUvmiYh4/qbr58Yjmc7SLT0OQWOvRYl76OBrgVg==
X-Received: by 2002:a05:6102:370f:b0:611:61d3:819c with SMTP id ada2fe7eead31-6fef194a11fmr5732457137.10.1780895859224;
        Sun, 07 Jun 2026 22:17:39 -0700 (PDT)
X-Received: by 2002:a05:6102:370f:b0:611:61d3:819c with SMTP id ada2fe7eead31-6fef194a11fmr5732436137.10.1780895858823;
        Sun, 07 Jun 2026 22:17:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9082b7sm3529811e87.36.2026.06.07.22.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:17:37 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:17:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
Message-ID: <h5wyyse47cceezyjxxzjbq4rjvghfgei32rog75mhe2cifwv2k@ouhgbhcshmvg>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
 <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
 <0a7f8ee4-2bd4-4ae6-ba6c-72b37d6ef92d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a7f8ee4-2bd4-4ae6-ba6c-72b37d6ef92d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NSBTYWx0ZWRfXxG35HOa8UsDp
 rLmIM5BPpx8ub8cZbBn42SoBEFk7ObYO35bQ44xaNQRoDveHrCiDSLHzFsD1njdwR6nDEPk3AGc
 j1sPaWzqziSe87o70UBmntZwzqG0WHpNEn+8tM4RrVn/OfN5oc03Dk0ZK/pV+/YcZyc8vyVtUlu
 zvyXlLRAyeHl3nZIu+n5r8MKNDhICgKDD+1Jj3UF9i7yqlLo8/+q4ybS8K3VEncH9sDFIWYYuAI
 cP5Np9EYTayT6v1gXxTGEb/XW/FatySRb5LL8KnOgNFLGR2FIm1tSapecWC4axneI+VA6umMgMe
 PCb7JMfc9SbIUXyfOtnY4g/38RuKtGYIx8MTPZdfEYMFFTaE5/Lx0BxTwZVjqGXy1/0DIjQy9JQ
 yXdqAfeF/KZmyuBk5/t89K2ooVMQMrVJtaDKMzhCsnZjD2akFDUGuAR6PCK/VQ7yN/AqUSg61RH
 vlQtYmD31cmL1+4q+iA==
X-Proofpoint-ORIG-GUID: Sq1_GxSDBFGfXjzaklooEdqj3iDvJH4_
X-Proofpoint-GUID: Sq1_GxSDBFGfXjzaklooEdqj3iDvJH4_
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a265074 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cM4Jl2COizv8PBbNEBcA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111673-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,redhat.com,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ouhgbhcshmvg:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01C49652C92

On Mon, Jun 08, 2026 at 10:16:39AM +0530, Imran Shaik wrote:
> 
> 
> On 06-06-2026 05:12 pm, Dmitry Baryshkov wrote:
> > On Fri, Jun 05, 2026 at 04:49:14PM +0530, Imran Shaik wrote:
> > > Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> > > 
> > > Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > I know that I've r-b'd the patch. But then I also compared GCC on Shikra
> > and Agatti. Is there a chance we can merge those?
> > 
> 
> The Shikra GCC has new addition of EMAC, PCIe, TSC, USB20, QUP subsystem
> clocks. Along with this, several Agatti clock/reset register offsets, as
> well as votable clock register offsets and enable BITs are updated on
> Shikra, and a few GPLL changes are also present.
> 
> I agree that few clocks duplication will be there, but it will be a clean
> and better approach to keep the separate driver and bindings for Shikra due
> to these new clock additions/changes.

Ok.

> 
> Thanks,
> Imran
> 
> > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/clk/qcom/Kconfig      |   10 +
> > >   drivers/clk/qcom/Makefile     |    1 +
> > >   drivers/clk/qcom/gcc-shikra.c | 4431 +++++++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 4442 insertions(+)
> > > 
> > 
> 

-- 
With best wishes
Dmitry

