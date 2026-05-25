Return-Path: <linux-arm-msm+bounces-109578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iENVL3EEFGqaIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:12:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF7B5C7836
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BE6D3005156
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE2E3AA4F9;
	Mon, 25 May 2026 08:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEI1zkhj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btLYL7e7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597523DC87F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696735; cv=none; b=gz27faPiQgjqxBXVw5GN1hjbVbTRXamfyRV46a2VKAeXRp4TGCFVDz1y/N+TNakF0ZhnDTz/fVej+0y4/OSHYZmMe83HXJMBBPAvpB6L4u4gLQybOyAVzxWCiPuMWitkfJ8Ki6fMrWNDVNhxMS7KvVhvnAq63Vm37XT4p4XjF9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696735; c=relaxed/simple;
	bh=ky/uvj7TS8x9BLdhtFGYoyUVdaA974Kp59ypdiHaEBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEk/PpRhW2J+zuHjzPgAF/492y4Nd7IYzb+2H0By1D066+6AbMxIh6y3W4oFK05OxUUX2DsaKH/6zf/nU573lscCzHvxnKY/19vj3YPRWj7A1yCPFocgDybYg33jQ1bFkA3QQVnrQBedoOrwety/t53tjfrCor5Ca67XcilUqGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEI1zkhj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btLYL7e7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QL9N3063411
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1uKsUrjz0I8S2LEpuKUc7mm7
	jWBeKvWru2gsBEv3SYY=; b=FEI1zkhjDA8FW4jKZwKvB+LivL0t60Q+2nRdGhcW
	aXF8pHiSvN2eFJ9FTbEXYZASBrVg9Mp/+oHKYPgIVtdOywiRLXVPN9VORFqnXr7V
	WPYkRutPVpqepKSQf4p/hleSfV4btVb6ANHXgifsvUnPUi1G/WfVpUE9q6nm3pV/
	PJ7WoEfnXmGI5f3ACP5TtixE84xIqnsVXPPk/gl2eLUXlhmQzPnIw3RITXFtM3lK
	AUd6gyHLuYUlrr37dsXbQkhDNHsLAx3ZStAEA15Ah3wKG+ynWXx6vrer6FBINanD
	ioMhZ7kSv+4M0QC/ZXrZiThRGmPNHOMinoGVhUZIekof7g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gg5um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:11:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63a6257148cso5559255137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779696712; x=1780301512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uKsUrjz0I8S2LEpuKUc7mm7jWBeKvWru2gsBEv3SYY=;
        b=btLYL7e7MYvDop8b+dcPXttvsmGHDrV5aiA8iC02x6zQG7fhlU7of7ZSajB6qfjdri
         mp5FboCbGLKpX7fmRlwqbNz1rMKT+sRwuPi6Nx/RoBbJcd2sjMr2inAn4HFd/pCvEElP
         pTI3rpYCRzFczZYsAfhgver13zyAANiAtudcBaUpWrHksvAKPpflIx0B4iT/lMGr3QQj
         XRQTfzPy4e+dk4sL9qrQwmc8c72lMidigEtoImm8sO6Lj9mJNoYfj1XiemcKqwbfs9qn
         vxRa4uNUGcMqd1tjnyGNrORFINt3KM2VsGXXWzEkLBH6XIhsD2eIo4fneZibwCpfNRmR
         wLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779696712; x=1780301512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uKsUrjz0I8S2LEpuKUc7mm7jWBeKvWru2gsBEv3SYY=;
        b=ewLDkK1HjdgY2chmVan4zzMvqUi35GRtTHMA/W6JkYl8y5RmBmNM4xxnGvTgjWQsb0
         BW1lP6ULh66URrRI59kQTuxQIWkVWETfj8BsoRPbbNTB/0XSzMlVyor323F8LX4GHx2H
         uc1kuLgwuHZ10eemRWj3UfPc1DHBxIw6lq+Amp2hDI0Q8fQ1JKSNgoRmYrOccc/7ewUP
         Ww/B13tee9fzDeWFkSeYSMqZpobjaNGJln3Vziy3XYaQrDYatJDyo8zSyKYnt58n+RLK
         k8HtNAVo+KwUpPqpe22Tw1wENEXwXHNNTBpnkbgyXqJ3Bg+XL530Odw4eBKpjmd2vPZc
         hjRg==
X-Forwarded-Encrypted: i=1; AFNElJ8rwrqL0EJrfpau2P0DEPCBz2P0UddXKOvkFGVq9FbRd8Qp/l9VxEXJZ6Fq5jjMlqtAQFN/B4HUQV4HsQdi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsbo4bMTxwZaI4jynwXLVN/ME5iNwabgA4BRcKRat7Aex0vkzo
	IrOiTWtbLVrEW6jnOQghyahUgaZOya7QzahpGuqO5PnTG+ZmB5JpmDE9b5jPvkVqdkb/NXbqa6p
	oKiotJfvFN732s1botjjU2AqnjGZ+ISBFgY+gsAJCPdOx85NQ08GpBRRWBZw6YWLpUpXA
X-Gm-Gg: Acq92OGL/9aJs3sOCoD2t/L7Qg7wovfSl78fErVNneIfh9hy4uPir19gZ4qYMjynZWr
	bqrlkBnma+sd6elP0OTj3/Rd1jujBqCiSrScBRDWGgxZAUtg3x7QLZrFc166710YBdSK70MTFml
	mCPv7KArV28bvFBShd0j0sS1v2/DqRdB+wC2y4R8p6dCuVJJR7hCvDZpU6VoqS5g1vKkXns8oqN
	nF/B5tLUa/r3J9gYhqGObNX357+QbTJOOhTeokRaEo1knkc/PwgUVnrdaH/eC9jVS35dQnNjahE
	rxV2doMMrKPgDONr5MyT6yhIQgj87bRDMJHxmfpoPRoUxlPlq/zsoqpshquGnobdWvQhpLmjK14
	RtKZsgPskhMz55z/lAQvlTqO7BZNrMiCAfNKRpa3mSGIGewVYpMpcxR1SbdY9fR2RvO5hGFnjSF
	3es1d88M1YEhfvFyC+OAejqSqIhqtDVPpaJog=
X-Received: by 2002:a05:6102:3f9f:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-67c7300bc83mr5975212137.11.1779696711898;
        Mon, 25 May 2026 01:11:51 -0700 (PDT)
X-Received: by 2002:a05:6102:3f9f:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-67c7300bc83mr5975193137.11.1779696711479;
        Mon, 25 May 2026 01:11:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb3689sm2529041e87.5.2026.05.25.01.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:11:50 -0700 (PDT)
Date: Mon, 25 May 2026 11:11:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
Message-ID: <rb35vwvusd733s2zbgsitof3cpoyyfope4cpeh47xldw27ufix@7fm6bgr4wtkz>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
 <20260524204537.GB110177@quark>
 <e36172c6-4424-4b77-9b3c-47dcdbdff05b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e36172c6-4424-4b77-9b3c-47dcdbdff05b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fFDAKSSnkYTkVl9GL3YPzJsmk3aoRO-z
X-Proofpoint-GUID: fFDAKSSnkYTkVl9GL3YPzJsmk3aoRO-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4MiBTYWx0ZWRfX2Oh5gTEzQBn2
 fe0COozQ7DsDiFP3f020LaMBMtcEF8sEWqV4KZVMexnEj4CJsKHLJEKTdu8tztzbCp/e/U45J6l
 ibV2Cr1DiIBCIo4yZXErMGniyeNhlTfo+9/bZ8do8f/z4IHoRX1+oTL8O7M4uuKXmVMeOIPYuWy
 llZ2byAM2kSKgzoizjV9/hiYR9dOeBU/jfq4TWld0nHRNCeYjSd4RJrGWSGl6fk+5Kb0OANk9v1
 zLaJBGadbrLNPi2texi8857qIoluPvSrKdSJUtlcnEMNu31m3xbfzO/999YBUgb+1/ldkdwAOtz
 5a3u8JbP1thpmEYr7n6SuT0IwwPxBTr0SXC0aNGxu2QTDnVDdh7byNI3t2TMIklzT5qFqzWEv6O
 TBy7lK6W024YESnrR5GVnTO4yg8AxGhfTk1LudOGe3jtO84m9nW/ftzgzXcCSJFD+wse3Ie435S
 XvKynvdEWvXMl77r2BQ==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a140448 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hz7RXHJ8Q2vzIh2DF4cA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250082
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109578-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gondor.apana.org.au,davemloft.net,armlinux.org.uk,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFF7B5C7836
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 11:59:33AM +0530, Kuldeep Singh wrote:
> > This driver is more than an order of magnitude slower than the CPU for
> > both encryption and hashing.  See:
> > 
> >     https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
> >     https://lore.kernel.org/r/20250615031807.GA81869@sol/
> > 
> > There are many examples of it having bugs as well, for example see the
> > second link above.
> > 
> > That's why it had to be disabled via the cra_priority system.  This
> > driver was actively making Linux worse.
> > 
> > This isn't particularly unique to drivers/crypto/, of course.  This one
> > we just have data on, so it's a bit clearer.
> > 
> > I've yet to see any real reason to keep this driver.
> 
> https://lore.kernel.org/all/c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com/
> Kindly check my latest reply to the thread. There are numerous usecases
> like DRM(Digital rights management) coming up and qce driver is required
> for secure content.
> 
> > Crypto drivers need to be held to a higher standard than other device
> > drivers, as well.  The onus is on those who want to keep a particular
> > crypto driver to prove that it's worth keeping. 
> Sure, I'll be working on stabilizing self_tests infra for qce.
> Kindly allow sometime to go over failures in crypto selftest and will
> submit fix if applicable.

Why are not selftests a part of your default config? How are you testing
the driver?

> So far, i am observing 2 ciphers failing(xts-aes-qce and ctr-aes-qce )
> with CONFIG_CRYPTO_SELFTESTS enabled.

Please make sure to run the tests on older platforms too, not just the
latest & greatest.

> 
> https://lore.kernel.org/r/20250615031807.GA81869@sol/
> May I know how to issue reproduce steps because I didn't observe
> crypto/ahash.c failure with CONFIG_CRYPTO_SELFTESTS?

-- 
With best wishes
Dmitry

