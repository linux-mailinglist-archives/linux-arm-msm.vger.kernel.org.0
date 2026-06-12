Return-Path: <linux-arm-msm+bounces-112846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QHJZKASjK2oDBAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:11:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F01D2676E09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:11:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j164tRX0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HEwYR7ON;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112846-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112846-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69166313EF8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9DE3B8920;
	Fri, 12 Jun 2026 06:11:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C6539B958
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:11:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781244671; cv=none; b=J2P3+sarjxZeKwZZD0IcA3XpBU1iFqeF7M3QPQO+TqbPmSkI3ynW5X40Zfnt3NMaaDqlEsR7FY9S0yH+iilbDzqTtC9bnhfJyiyerPV69QCajueaiJy+G27w2mi38CXhSJmO0hbz2naq375Us5LsL4GRcpJEI1si4mwiKg4+wKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781244671; c=relaxed/simple;
	bh=N+Gm2HSJFkbJXuQJt1G46yvDEIW6X2a740Azcl2U7co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj8WcB5DzywoTPZv+7WhHScW4DzESU1gJ6VlY7B3TutLx7ll5muBf1EXY7+KdG75TQlsOzEE8pvoNQlTi0ow55nYkGK7konKaijJGLBybajbmAOeeEH+AvrGDyhTUwuHgAtYF75g+mC2qMgy18WjCxwZKAPklRp1ivt+HjxTrrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j164tRX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEwYR7ON; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Wd62475924
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ekVFbnV60CHye/xjBKq0eWUj
	dvANtvBJPng1GEY6wXA=; b=j164tRX0Tt47C0NZe9QfkkCG8Li5HXkCUGGWXGiZ
	RHz7JvQ6yPOHkvTS6tzcwA37DfQTWUaqhQI+bsTwqJBNYhVgs7Saaj9cjY6KlOYT
	v0bZ2+OBMDcinHj7GvvGaoKJB4zFvcu2242QDqycXjRRl/hEjvdKtzvWeVMxP1Hs
	t7r3JfvVJoi7v022vv2h3t5l7l1B9Id09HZg0Em8MFLfJIvBWnAQWqnf4U7fqxN/
	a4hHA2qPMVq+p1Gc+ZxeGeWgbscKjS9OR5SfHpI72sjUjdo+Bfll8TgkXc/2srU5
	rLuOSlUTlmL+gn1xmPXp3wlLkXSMTusP/XHtny78dL5UJw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5sudu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:11:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a83b662fb8so711721e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781244669; x=1781849469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekVFbnV60CHye/xjBKq0eWUjdvANtvBJPng1GEY6wXA=;
        b=HEwYR7ONlSq3VjjXNQz3q7TXKkRvaZN+NLnmd0S/YbN9lRAu3/OeqKK816rNtrlrkn
         g3VQuBKDRpArcruIhKVwBgrkmlIzakVam7wE3Tw6u2MMuVpt8ZIJt8Hfi8KaEc1OZKzc
         LdqgjARq+GfC06Lj9W/W+K0tX8hzc9mZuY+vyIoqaBdwC+WPXc32o7aQ6Kgeg/UfeFaS
         zqzvLVUFJ4hVoHAVCUkv5YEpoCbaHK96gQ5XM+jHpxO+5n5lkKyP3XhAZ3416QgyBG9Y
         ZcA64155BaYiED9oz8XUzFCAkwWVlf+mMgmwatYj9aXP+U6823W+Nk3al0EjnURTNa6u
         G9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781244669; x=1781849469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekVFbnV60CHye/xjBKq0eWUjdvANtvBJPng1GEY6wXA=;
        b=fsIRzPCzeST5fLwUNnppFayDbnBEI2cgmkTLjM09RvLN/vO3tPgtFx80L4YqWjtBZ9
         /6TzYRicHknu3vesV4HzVMGeUZXJXIlWPepbJ0jmQNmUOlppAmEdsectj8PAv45RfcIb
         MWhkss2rwqivCOup6stZsb1pcy7fmCzqd1/kCfpJyHmEldIILUv6N/Evj6RjeEhCf01G
         4nTRSz7nk8jummbw3ya6shWr+iespsT/ERixN7ju5ykyEO4e7iqOooj0j5OFZOfIDLpU
         e8FBkgBpps06AGufVzc7J2jdnH8I7FICpTYHChL4BtlwcustqFVe5kDcI5NbsscQsodC
         1o1A==
X-Forwarded-Encrypted: i=1; AFNElJ9wDT1EGjnueH0QZtIdn48Fc7w5Te/aPlfhADeS8ZuIL+R1LZcbB+dl7jgPozEfQeXwWubsmtmfg+P6FZ3K@vger.kernel.org
X-Gm-Message-State: AOJu0YztNYaMiNoPIvkK155byuxuM6XgV5h+opFjAy0qLyxWz2g9n38c
	xGs9LJbJY9yi4KxDI6qd/TDeu6hlNnSYU0wB6xCK7Zd77GwLMIvrtoM2uq3+P/6OL8PendvUbOx
	p5FEa/3bp3er/WHl10Qej+/g3WiYtY9ecotnaZhY6QRDMzcuB29jN76aUZCHVYr+JQCbtyxklDm
	h8
X-Gm-Gg: Acq92OEFwzpaV4Xiy9CLsgI1AOWixbmMWw4oSroj1fW+D5o2LTnjMH5q/rhHQOSjHW3
	o+DVgGFCkGlmrRk25XlwaftFQHpHXFr2NZDsaWLoUT4HWqWTo0kIW828BiYaUJpJhvP/s2jqtq/
	pYF/0XX3ftPfWorBJB2Qohx1kdZsXBQtoy1j75dzh1NcDwEHnfIdyAJJh2D6SzGkllZT47lTtJW
	ogQH2vOSJFGRaLYYPGr494Q5/aewo7cVZY37yHMplHeLda3QDT5C6QcvOxbPx6Ha4DVW0XZUApC
	3ZErl/JSPuN3WMVH7pt9DEWviGHRcSkGIbH1JdCuxA5bTH3+g9HJfV7TcUQmIV3VJhfDqPZ80nn
	CaHmIKuah8DIq+YyDKVhb+4AcpJxBCsLze8EX9gu6eim4ZxBCLcwLkBqxp0fwQxEhQsTRoV6rFy
	aGvbl5/9ktYDveTQVDAuEZXuLE/FCgaYyOy08=
X-Received: by 2002:a05:6102:8019:b0:631:7781:fe91 with SMTP id ada2fe7eead31-71e88b1b9aamr611370137.9.1781244668617;
        Thu, 11 Jun 2026 23:11:08 -0700 (PDT)
X-Received: by 2002:a05:6102:8019:b0:631:7781:fe91 with SMTP id ada2fe7eead31-71e88b1b9aamr611349137.9.1781244668166;
        Thu, 11 Jun 2026 23:11:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f1b4basm3579991fa.24.2026.06.11.23.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:11:05 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: qce: Fix xts-aes-qce for weak keys
Message-ID: <wesx5ccirum4yjrg3d7bstv3alvddrghsancm3fj2hhgo23z7u@pi6ngkzezgkg>
References: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
 <20260610-qce_selftest_fix-v1-1-1b0504783a46@oss.qualcomm.com>
 <533motquixnbence674lawbnlnxevcrcnysymwncjis46j5uoq@wcemraangg63>
 <aiuA8CCGcfP6MdLy@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiuA8CCGcfP6MdLy@gondor.apana.org.au>
X-Proofpoint-ORIG-GUID: n9rqETQH8sILGQt4WJnyVhdOfBievAPV
X-Proofpoint-GUID: n9rqETQH8sILGQt4WJnyVhdOfBievAPV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1NCBTYWx0ZWRfX0IMAhDLjZH02
 qiO6ENgI0VA8xUIiBCGh5Mfo32kBvso0MFYjoTAJD3rzW3Ti22Ex7tOJ5+v3F7lmTeLk8dHjyaV
 UtAgPKccajxpNoXbwL+7+llI5n7ltQs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1NCBTYWx0ZWRfX7TZ1Xkp2lURV
 aTD6oYEyYRglsJo7O7cGPm15/JfTzPGB6Fm3IeFyaTNp3UAwJ1D9c+K+VvmjlBLG4LixnXcY56L
 220ihc/mTeD0tXDyyx6O1rzLtSqMuEIFlZqj670YpO1eV6WpiY7HGVykOrkwd3P8WcfOAiBLxS8
 p2tCQ681nP0DRWC3IRVzEKONKsI8g9cfyRx+/ra8cG+NzgmtKwNFxzCHm9QQPHAMRXtDLDChrSm
 SAY+r97ieFWAdX5QADLq0//2vLU5V/kbFHpSiz1Z/hVW/bN8DVdc/Mq/KPh/r9fFvAx2u3+l5cR
 c+18n8EbxiABfQirp2KlyKp6OhLCOX1NX/VcOJH3F0AjNluHnaNkY59eCNfL17KQIGNfJGVje/Q
 nStKRZhldOVrvUetQwpR/tzaaMAftSRqkimq/dhHAZxCLVFDpTt9XIgmlAhLmSInBxZb2zoTpoo
 2DPuI9L6xCcfq6KA3vw==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2ba2fd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=3eZhI8LKvID409CYhekA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,davemloft.net,kernel.org,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112846-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pi6ngkzezgkg:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:kuldeep.singh@oss.qualcomm.com,m:thara.gopinath@gmail.com,m:davem@davemloft.net,m:brgl@kernel.org,m:ebiggers@kernel.org,m:thara.gopinath@linaro.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F01D2676E09

On Fri, Jun 12, 2026 at 11:45:52AM +0800, Herbert Xu wrote:
> On Fri, Jun 12, 2026 at 03:40:49AM +0300, Dmitry Baryshkov wrote:
> >
> > > Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
> > > reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
> > > set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
> > > software fallback mechanism to encrypt the data.
> > 
> > No, if it is a hardware driver, there should be no software fallback.
> 
> The driver must support everything that the software implementation
> supports.  So if the hardware can't do something, it has to use a
> fallback.

It's unexpected. But you know it better than I do.

-- 
With best wishes
Dmitry

