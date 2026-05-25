Return-Path: <linux-arm-msm+bounces-109620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCAqD8MfFGpGKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:09:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A91B85C9011
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AFD63013893
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F417533F8A5;
	Mon, 25 May 2026 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfgNmMml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ib5maFv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF6233E367
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703740; cv=none; b=GSbnF+dX/o88D34s//GkDXHGTT60rjgs0ZLoTXIG9IIRd3UmCpYHvViuMruRX0mt2Ayc2ssHVvag3NtOkqNKXKWVKzgVwWIvt4h9iWg3ZYkAm7ooIA+o1tE7j0yCDkC1v2iAWAjEroGJMHlwMmeLWq/lYdtc6CFu0X84VkcNJGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703740; c=relaxed/simple;
	bh=rbhuDJgekdkHv+bVDNi84AE5LM+zHeiCMyce3W5naTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYcu+K3y7ZQqVzMhpEIgUsfpupKRhmK9tuUJyLkJBmk9usvVLXxZBid1c5cRPSOFtybj388sP9CNFAFT+r//PBPPYK7G7VU3viGWykHVZ3uvsVZHqD0uyNq6VDw9fj/mk5VJWCAiM5W75/jCz8Hh5iKud7TE65OFQPG90BWq6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfgNmMml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ib5maFv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7POav1518829
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IhQx+fQN8NMYGyoe+FxB1LZO
	zEN9L+wVzrVejV2yZ4g=; b=OfgNmMml1DZ/CmCKWR0hegPNSABNWmLY2PsdIEQ/
	yJB1nBPr4xxP5Q2xNGPGwfT32zWPQJHTVwhFD67V40iISKNaN9Djid5qEJPQz88W
	qlgLUEQ1NUBSozgBkH9/oTwxrxogy+DM4EKr1J/ajGGOAZXP5g3lliR0Aja/Ck82
	IaGKMexr0dxmyZ5o2ISRDRA2YHAez6iYvHIDVWxgs3AQ7+Op5i3qEeePpY8D9WAh
	XjndcPKoJXfFFL9FXXlaKdnqr5l34L0yvt6OTdTga3AbacGavwWHYgLDGCaFBDl5
	BO57a7xSHYkr0GCeTx0/x01DDAzl9Z3DfcDRtQHWK/DpcQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txp6xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:08:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6618ab427ccso10982325137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703738; x=1780308538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IhQx+fQN8NMYGyoe+FxB1LZOzEN9L+wVzrVejV2yZ4g=;
        b=Ib5maFv4HahrLXRywMgEHiT9pvVk7sQM8h5RIBCh2QPhNiVxM0wm375srpHRXEM05B
         wrxt4meOjRCu5IJQY+p6b9LE1gkXv5fyMn1WLWt2DrMJ2+OBBnkI4bvYcWmXZFfoyaDT
         rSleiNXPWWLREMv3jwyxIrpD+3bnyi6nloIUHFsKhFPw3orG3upn1eTaeyIwPv4Z9Ewf
         hoEAcCNIjmIcD/6Jm/Lz5ZAAr7QSPxQjTyqSXkW2/Bz945HUIivyIp2C7FMXTb+cN3LZ
         AbRpMTGgr0E6q379O6UfHpfAeNKs5mBuVWFxg2bW6Ai3NkRpd2dUUXRC9pm6A9tMMZAU
         wklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703738; x=1780308538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhQx+fQN8NMYGyoe+FxB1LZOzEN9L+wVzrVejV2yZ4g=;
        b=cmelPbHrWjho5Of4aBjc+LSPCD+ARIdPo4aFhTgS147g+yE3V9zj60VuUl9vc2kmy7
         wyyxnvah3LXbcbI1ZL6PbC8M/qYMsWXp1+V90hU9+qz1O/vTS2MxZZxIMvrQDAT8sxx5
         lbjneOn7dzPZADOEKbYDOxb2cESRqqgA7KcdcZxB6NKzoYQprXuKtvkKu3EzN3gyQDQJ
         f+BgVsA/UoDmct+4nohWIC7fQVE/aesDFABlSbRSlgY649TOB5qx6iRiljFmEMxJl39E
         PehHL7xpYH3zNsXC4aQZcl9SAMqv3dmi1uPf5a371JEOMsKpAi01hYrlPwIFQ0IAInmm
         Qs7w==
X-Forwarded-Encrypted: i=1; AFNElJ/t6bW5Za2ueayhwVZ4zTdf+ChRiPFtf/7Wi+gglDt3q4sgNSHKo+zy9RGX9YdAfauKMZsuULJOpnZQxU5v@vger.kernel.org
X-Gm-Message-State: AOJu0YztdzT3aTUlIH889i5oX99UuF9xM5/wO0ZHwzBkl0iM3pyXzTmP
	CzkpS4woWSc2wyXSZmXFLm5jY5uZ4Bk/n+YJm0CVS3dbDGYcbNn1bez39d6eeUfWBdG0ySF9Rrd
	OnI7ExVlXm3+jerJHmfQXpYR7HXOAMFr50AX64UbkQtZQD56WYUs42FEbRB9ecvCLE1UGjT0wX+
	aTDSw=
X-Gm-Gg: Acq92OFvEBVhDKPmH5A/yPyjCMFqmzt8YwDbCI4VrgLRNajqX8TVFp9gFU9vIcrl9X7
	onNXnn95sycedI5CGdZzlpBYuJjJnz/O4NdTzkjeb/No33wELhbzB+qt6iUrSaxknJVUrkjnzRa
	kxaPPJRRImXNzZIRUQW/M6LetNlliLLN32Sh4vl+vHTC7/hkAukDKfXcyUlTxwwn5m5wD1mXEJl
	HWE+I6ndyFAW9DpBGfBbYoqRL0K+rjO/tr0Zs2BDnxK+Hnil8aAN/fMxzoO7ROCSiQx6ANtA2B/
	o2ISsIYwNPtJ2yi46hN2EDxUFvnQUEIsPFxn/mcWq2owFMcvp+vC9mjXQd5HCDySpqsk7Ro9NZQ
	2gkSOUeJsqzL6Q2Jc4jLpv6tgbBitXSeKWGChmilZ8NH3+zfykzvZRFlhbBlbGtQZCufhWETbJF
	37j9uV0M0DCoOXP7VlDBXfnwZQmrfpuOgRM7iEJ+Tg6T/aew==
X-Received: by 2002:a05:6102:610a:20b0:608:d017:471c with SMTP id ada2fe7eead31-673c1842bf7mr1390556137.6.1779703737802;
        Mon, 25 May 2026 03:08:57 -0700 (PDT)
X-Received: by 2002:a05:6102:610a:20b0:608:d017:471c with SMTP id ada2fe7eead31-673c1842bf7mr1390545137.6.1779703737408;
        Mon, 25 May 2026 03:08:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf945fsm2557294e87.75.2026.05.25.03.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:08:56 -0700 (PDT)
Date: Mon, 25 May 2026 13:08:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Message-ID: <moeb7zqqhengrd2nrqyuqydyq4pk4imd2uylmr4tf2ypn65h34@z33iifvtf7al>
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
 <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
 <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMyBTYWx0ZWRfXyPDJHPkTyFSo
 rXlrGFLHCVHsaVRGP9kMLau3LJbIerydloZQuLOepV/gKfziyG1dL+xnAK74Do0SMVltfSu3nKN
 w0KSMfmA5SuO67lnaQIpJ6cAcfNynfghKH5Bs9RI8bv7AZ+YqG39Qe7I8pw7ocVBR/9nFPIZwo5
 a3Kgw75n0Hr3TS3oxF8DBtaPm6bDsXVWy6sRO1nG6NV5zAcFyY9N17l5zv986HU+qBRnQPBVoMi
 vy6cZXcJu5oekF/O14PVazflgyady9yK/6PJPe6tYImfnwwX3VSc+5qXvEliaXm9w9wvBAGfgtK
 ONLvCcKjTd1UsjN4aojaHv0Ftqw8wskdC555JFD3y0c2WvzxCFmLFV0UJNNcQ2BGhMtaVbXvbUJ
 hX5j8xk8xorgFvBVBjoULElLKVt2Ml2tb5KrEmexdMFgPAMExQTmXL/8MhZ+hS5Cov+nIIr21fU
 qKNffdiQQVipAsZwFDQ==
X-Proofpoint-GUID: tsKyt56RxnqzEJqSlXf6s_sW_e-AQBLQ
X-Proofpoint-ORIG-GUID: tsKyt56RxnqzEJqSlXf6s_sW_e-AQBLQ
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a141fba cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=N0EbhCz5inPs_2rfm9cA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250103
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
	TAGGED_FROM(0.00)[bounces-109620-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A91B85C9011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 05:37:23PM +0800, Yijie Yang wrote:
> 
> 
> On 5/25/2026 4:37 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
> > > Document compatible string for the FastRPC interface on the Qualcomm Maili
> > > SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> > > fallback to Kaanapali.
> > 
> > Can I assume that it has the same bus width as Kaanapali?
> 
> Yes, the DMA width for CDSP and ADSP is the same. If you were referring to
> something other than the DMA width, please let me know.

Thanks for the confirmation.

> 
> > 
> > > 
> > > Assisted-by: Claude:claude-opus-4-6
> > 
> > Claude assisting to write a one-liner patch? It's becoming ridiculous.
> 
> This patch was generated alongside a set of Maili-related patches and was
> not created specifically on its own.

Okay...

> 
> > 
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > >   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 

-- 
With best wishes
Dmitry

