Return-Path: <linux-arm-msm+bounces-109508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA6FHKoqE2qK8gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:43:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE345C3314
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50CD3300578D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 16:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B043ABD83;
	Sun, 24 May 2026 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aC8AiQg/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWYcF/ng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213EC3A8755
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 16:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640987; cv=none; b=r3SaCISx0isEzs4ljXab94jrWDoEi1kNI3B1QdAoWrrvJTBbUhKeAfDSBwqRnkp27OPU1/PT1niDzDaIUIe3njb8Gp6w6IGZiQcuzLHK6rXaUj0bgftqM3oa0wZLqUdEkIbWJ/5kOKhRsx3dLx7HVFhKRO+IOTi3r80SEJBrTCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640987; c=relaxed/simple;
	bh=MpD9PwLQ9CgXa4zGAjImHS5FY9Lr+2Ybi7C/mMlVGXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OV30K4WRDFkeGrEuLLPPFJCU/5rqUTOgGMEoz0O2PYTKHWgprmKWtA/Jhk51+AHNJqRidUqRZTlIHo3S0i4s/CbErcyKDZ6pLWV5Wh9io6GyJTtfW/kTXK0gk+NL21A43/BHo/Hrfmihde/myMa9NTXbzhzSLNDRZFhlCGuv+X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aC8AiQg/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWYcF/ng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NMmLQ52155067
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 16:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vfCAtu9YjFvfjUfjXckwcd/p
	zB82MK5Peh4a9ngumRo=; b=aC8AiQg/3zgWPCN4RPm2nA0QmIFWwQZENaHmsc5t
	Tsbu/QjF4LYwD0LQq81RVb2K+V5cERB1XqdtV73ZIwpOz5rnVqn1NBOPUBc2Eavz
	kc5mQ+yqyB1Yqk8Qhz2tFp/edMNe6LwxoSG+Dx6/7j7t3PDNinYxcmuQlaf0PcV7
	PGUU+IdL4KLjXfRQ20iFmkTnyQ/Bnq4KSdwbrQeIW2QfpTTB7HFyyi7kalI9wBeE
	fyjlmR/Un2Ch9ZWHclIzUg8hIgAMaSxRJgYFSlL0XpeQPcFsldZYGpgEaxLZP+VT
	m2ArzsBCd0UOBf/KA8HBbas3M86bSRLob9sxH3rrg0U+Vw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3bk0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 16:43:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6313cb80e7eso11318329137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 09:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779640984; x=1780245784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfCAtu9YjFvfjUfjXckwcd/pzB82MK5Peh4a9ngumRo=;
        b=IWYcF/ng61hCWMhzyTg1ARiYeN+2jyaKaGhwKbvcwVckHXEGCubIXX85sMjb9fRQ21
         tJyoUQ1P/dcet/vACCZxjUArxmPpPWbxV1dXH7ycSuIpGnLkspCRY3EZWNlvYpiA9r/d
         /GvnC33qaQJ/Wp+2+pJIWzCTidJYlOEEYoF2JptbilzDNFLk7G4SKoxZOPpSP7lj5Nc9
         K+AYl9ERwDmniN61RrzORve53r8DgnOjGZcUiPwBWeQ62qJUcIicXqeCGyDDfAvxt6oZ
         oyWGzLYYjdaoUYx+ETQ8gwgmQHl5w5iP7xNaYcFW5bolRBjFZ7axIE4O+JkT0QdcBryl
         KZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779640984; x=1780245784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfCAtu9YjFvfjUfjXckwcd/pzB82MK5Peh4a9ngumRo=;
        b=Nmm914LORA5AT0V9R4SVUiXgPKybSnTai84v5m0jOL/b/eNPbs/eXW48Z5AuCGtUrT
         TTjuMCqPz9DE45/IhfpJyitdeQQdV1KSqOfO590KW6lccLizGa9xC61fnyXCIgEPYXRy
         mTYgXYJsw/zwQVhsz7oYeFfdXyMs2WoW1w5NmdUxyfLL6vI+Xdro851ck2jPkbhwEpI2
         M9fC5o78Y1DMiwzONmH6AbYNvzHzP1v0FxtYtHaw1j/RHX6yNMgJ9Li7Ae1AiZ0N5DQf
         tyPsWawTgDPaJDKA6BEgyejy2BRJMfDR6f7YRuQE9nolPZBFa5k8UB5WSKM+pBDC+IYN
         6PEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iRz0ZAMahQSd4DCoTMs/2Ylxt6UstUBYH0TCNyns+HisYf1TRvuZ8LoYOA3GjVOns/qlCnL1FcdVV2l07@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7KiQyyASmKg3b54ivCeCY6rodnmiGtlbk+SsO6zImazRQBwtE
	1GdAsbMy9xFs4FZj8ccx1p5JhcuUEGxxmMC3RRqnP+fG7jLbjJALf2aHim28nGiYJZXqWcUQBKM
	IhbcRdf2fKb3oV0OxxVh5Hum5rCVyYblr7HEZTJ/PD7/gFU9kKz844s+xU0geIGHlagKS
X-Gm-Gg: Acq92OFwBa8tsbBaz6qfNmyRpN5PDHPGSAgUEhPrZ1PIAXL78ble5YQa+CACo+klrxe
	U8sGqdozf157L8M8NeIc+sqXRmgBPe/coxDpVl6RhDnn3Ey5xiqLF6lDeEvVoEwv7DbYPEPio6F
	YMm+7OLqVw9mgmKf2KtwP+bfRt6x6JCMB0o2b+FdKEeYH6O7atTkMuepkLnQb5BCaaMfLDtsika
	Ie6sAEQS+NC6yzhkAVYU/UmO3q5SXeZbPNO/GPcX/bnQuXOEf+tnA10HfNwvT0OWPGWjH3qZotC
	YTE/jwz3YwSfcmeRYhCYEC+JBoT4Uos7v3T0uY1V4taspR6s3NwPo4eWMg1//fE7aMsENLZGhEz
	T1UruNjbeshBRWyphJ8pAMfNIGQ62gTBvs6T6BiWhjMmnMdUWCt8GyyAHoUy0AcjXa8W+Nn7WlI
	goyoj/9ejJGGKIMekqoma5leYwAriLciZi8/Y=
X-Received: by 2002:a05:6102:2b90:b0:610:db51:6f3d with SMTP id ada2fe7eead31-67c73e722cemr6301313137.12.1779640984349;
        Sun, 24 May 2026 09:43:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2b90:b0:610:db51:6f3d with SMTP id ada2fe7eead31-67c73e722cemr6301289137.12.1779640983847;
        Sun, 24 May 2026 09:43:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32ceb596sm2021962e87.46.2026.05.24.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 09:43:02 -0700 (PDT)
Date: Sun, 24 May 2026 19:42:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: demiobenour@gmail.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
Message-ID: <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
X-Proofpoint-ORIG-GUID: rA6W-rGvnEtGzgrAzvfIrqgtl2PYPli9
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a132a99 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=f6XAlUmOwKfAZ5K3pb4A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE2OCBTYWx0ZWRfX7HUzTGGVgGMB
 YaZa3rvHNmmSJMpJPVQOtj+5gPmtrgahtkoJaFsqpQ2zF4mW3mz0iP4NMINKuP9IbMNR1OQIn75
 a6fFwTOLJVM8DdUnPyvC68+PmZVcDDTQuflZUtguK2F7izdiGKXZ9QmTRrXSE+8W42GRdE4+DPx
 NTSyhoWdiyMF6acgZ1JVj7q2ASljEsm86q57Wu34NrB0spMA+Sttn7X+/ZOI8/PWWgHdnuu9v+Z
 8EyPT7KQp9ZDmK5mVEjLUKEaHVdOS58emAQZB1RSb/kWskW8zZHxrhF0DVhWcYEWsq7uq7qXDvl
 tbZIlc+2WCS/PtpuamkOKz+TGiaborF0KdUrSkyMglSd8r1LW3ifeGEXAurRLSKOIml2hTsQZmP
 USUDzZkF+NF3lv69qyRuXQ/3J9WU8IJQsAh7mZ/3AgiPMer8PlOX6HIhOC67vmdpjrbcyGIGdTw
 0PN2ws6EgpjW4+e+rXA==
X-Proofpoint-GUID: rA6W-rGvnEtGzgrAzvfIrqgtl2PYPli9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240168
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109508-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,gmail.com,kernel.org,armlinux.org.uk,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CDE345C3314
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 03:03:56PM -0400, Demi Marie Obenour via B4 Relay wrote:
> From: Demi Marie Obenour <demiobenour@gmail.com>
> 
> It's slower than the generic C code and causes problems.

Which problems?

Also in the security world faster and safer are two orthogonal axis with
very limited correlation.


> 
> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> ---
>  MAINTAINERS                         |   8 -
>  arch/arm/configs/multi_v7_defconfig |   1 -
>  arch/arm64/configs/defconfig        |   1 -
>  drivers/crypto/Kconfig              | 111 -----
>  drivers/crypto/Makefile             |   1 -
>  drivers/crypto/qce/Makefile         |   9 -
>  drivers/crypto/qce/aead.c           | 841 ------------------------------------
>  drivers/crypto/qce/aead.h           |  56 ---
>  drivers/crypto/qce/cipher.h         |  56 ---
>  drivers/crypto/qce/common.c         | 595 -------------------------
>  drivers/crypto/qce/common.h         | 104 -----
>  drivers/crypto/qce/core.c           | 271 ------------
>  drivers/crypto/qce/core.h           |  64 ---
>  drivers/crypto/qce/dma.c            | 135 ------
>  drivers/crypto/qce/dma.h            |  47 --
>  drivers/crypto/qce/regs-v5.h        | 326 --------------
>  drivers/crypto/qce/sha.c            | 545 -----------------------
>  drivers/crypto/qce/sha.h            |  72 ---
>  drivers/crypto/qce/skcipher.c       | 529 -----------------------
>  19 files changed, 3772 deletions(-)
> 

-- 
With best wishes
Dmitry

