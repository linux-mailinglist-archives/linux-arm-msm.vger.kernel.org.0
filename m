Return-Path: <linux-arm-msm+bounces-112833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C58NLTNWK2rX7AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:43:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5DE675FA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:43:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R3d9RZaQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dim34O2k;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112833-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112833-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FC163329120
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE30627FD74;
	Fri, 12 Jun 2026 00:40:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904625474F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:40:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224856; cv=none; b=ZfD/NmFXddlZ2OWfJJMBhrl0gPMgOTKHJRi2XEqI3/X0gMnVm3EZRyQFkSsnCyjMEeuzEo+awmHPkuoIH1UlDNLlOin/Rx9Ugz2bRihabzDYNk6ZdskDmRPWmyzVluoZaF6Ab7+iv5EOybKEPWpBA4AYSf6Rbqib4+haBE4uIVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224856; c=relaxed/simple;
	bh=pSEyu1os1/ieohWcWy0u9zFBNSIwzLF8niWiWSbguJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YO/UQVbaLZkE9f0zUx9kwfq1kC9ppn/Wk+HvTEL093MaNgco3tQnN4Tm/PHUFxOKv97YcKd8icaRnhtrKfFfDjpQoQ07uUjv51gAymmE67GfZSq0yLbdE30EyGiWd46zvaWJJdbh6sNodY3kxmXoo2oxttPpSAPHqJSsmaMYsys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3d9RZaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dim34O2k; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMVYsc1921531
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Oy7gQId7O6GkV4H/lWC4yqwP
	VMYWsWW15qBFZKPvcLg=; b=R3d9RZaQW+yTDjxAanyZRTz1G7drs4fVWoHCWBFy
	5DgUqK3b3PzzG4Bl2Zjks2KBrG4ht9a72tz7vkPnXMXhzkf7mYKCDO/2MXv/P0KT
	wCc2shdt3sHBR5JRnc3iJU+eYW8AqfSGshjEp4SAKghF11Jbnmf5+VkzIb3EwM6j
	gr+7AJnVku5bzxFQKNSWd9D9yfKw6LFTw7ut7jPOn2vjqpB19dWLcU36qOFu1beN
	hSMrRsuV5Ag0hxMtlf6Zo4i5YshvYRuH4M1xfVG5UhCP1ll95yJDGZbI5vTknMEV
	XVYapk5HExjk9f5Yx1/UeItG2qzKG25lt/x22mVwEFWuhQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbhjsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:40:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51768072950so4770571cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781224854; x=1781829654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oy7gQId7O6GkV4H/lWC4yqwPVMYWsWW15qBFZKPvcLg=;
        b=dim34O2kfBzqwhYbckj9zZDhvKOim7i/WNu3KdZ5qeSK+M8J6WxZHbBZTzmbO4fUfh
         H6z+h2pEQQQzyXzRc/G3DPzl3rmXvRfJelxcAni12+Rejphzbc5U7jLKoEkaij3Agg97
         /Lr+C7BOhdzrnvXv4BmPr6ai4r1SmFEmzLh9qSAxtFzCToTUFQqw7SfNgddpRapKBMqu
         UK4W0Q83TWQidqw93v1LcQefgL2kSQ7DDi5WomALesata1MuH4dezUO6xIQNdo80dZBD
         8K2/RgpjdLlMTYuYOyw3jQ/ipCKnfsIe6zJ5eS2ovwCiR1SevfkyHmpHyUevqqIi/M8v
         vfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224854; x=1781829654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oy7gQId7O6GkV4H/lWC4yqwPVMYWsWW15qBFZKPvcLg=;
        b=QIv8HStFiOz4qxrwdVNM1ySuY+2bo2DmklHjpsvqsN0QvclaD1bwEjPjsprA1answ/
         wYUoZ3Imgp16QU5WZ2VFGiFkAXSLq3IKnK24DRcCZig+AGb6VPrkCXyw+lsM9osUSgTa
         9ng+V1E/o0uq24ESHW6ZGHl1FzYXZTgasU2Q21CIemNFMNXfKdOM1Yj7gtVjAqpfnj5I
         yw/uHfxwJscJQeRdROzSa7EmSOb8UxMiUAZWtt4mdo3qDL5zItcMVWDyChVr6cec7yB+
         LhDfmCP2KM6pMOFw9SskkUW4q0phaLcc/jKukrxSxk6+NFVwTUXdCOHgSx60KbST6Zxr
         eflQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vgUWuoqcZzHcUf0cuv3cLdHEKODK/kgAQKTaU18FbnXx1OggBNfWls2RRmZvOCdyD36zSJSHsymaqmnTo@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsd84RZL+g0wDr9/tCIpGv9AkGZlcfqk0DhZWDpyEF3Et5EI5
	sCI1pG2uVyk94iFPseA8bciR3ImyArCIYwPmPkh1VIzhgmOY/m5eb9QML7rV50bqnCFMbsDyI0e
	akUYC+PQv5Dzxg07R1r1fFAr1mpA8pUizdsy3o1lOIRK5u8eHOzsunjrpHN+ZTjfrcya5
X-Gm-Gg: Acq92OFpL78eplwBHZSykKrzQtJzlJTFOdc9Vc6td9KxslloAuVwB0pfpn358wskCz3
	742fIc0quvhzlSXZmhFcU6ND4G4eMkbsMXE99YesTAudsrHb0oo7qBNcZKUbDvM9HJqLV7HQMoi
	JUE/gHHcRUJnecgpX69LQ7XRkTjxa6Or6VUe6twQ/IND8Jc07Mczo+dxrtl2+qhKjSmNTmQWALy
	Sb1wO0VsUtoRXWn2AyD2TzpBb+LZOQsQfu/t6dkt/db8YICLh85kYwiJ+rryJXbB0kaMxWvjBwi
	RvqJWP2TLRA/DX4+NEWeuhTBhizWoE2dDUbVSy+b/AvGx2jeEJH5he3g/s4qX6SAoz7komtdm2F
	ZSavInpEuje0vuTd9jpl9P8LA47DiBIYASeBFy+p3tSSweqWKvtZgJjFW+so7dTvitSuZiOzryE
	6RDyuENRMDvM2eKKix4ZF/QTtpGGqpugH7nbA=
X-Received: by 2002:a05:622a:7e4e:b0:517:6435:c4ce with SMTP id d75a77b69052e-517fe6031e2mr5681781cf.49.1781224853917;
        Thu, 11 Jun 2026 17:40:53 -0700 (PDT)
X-Received: by 2002:a05:622a:7e4e:b0:517:6435:c4ce with SMTP id d75a77b69052e-517fe6031e2mr5681521cf.49.1781224853414;
        Thu, 11 Jun 2026 17:40:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a729fsm58925e87.54.2026.06.11.17.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:40:51 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:40:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: qce: Fix xts-aes-qce for weak keys
Message-ID: <533motquixnbence674lawbnlnxevcrcnysymwncjis46j5uoq@wcemraangg63>
References: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
 <20260610-qce_selftest_fix-v1-1-1b0504783a46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-qce_selftest_fix-v1-1-1b0504783a46@oss.qualcomm.com>
X-Proofpoint-GUID: qqBVPwqerFbdq_kFr9bWyjPbw7kEZ3jR
X-Proofpoint-ORIG-GUID: qqBVPwqerFbdq_kFr9bWyjPbw7kEZ3jR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfX/rM/1mZHvLlp
 ExCfMduuJHkhF2aZlIt3m0OI0HyyfTvRgjFTO8K1iXWZJsJB4SvyozhRfZgH7m81O3YdtSihBWS
 ERfL/gAtqE4EntZHWsgJrGbFFv+Ow2w=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b5596 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gYdrlWxjMMiVXSwV_rIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfX+IA2xtOe/tRX
 kuJqyxO0AJTATu45NyHoocOeNX86HWyRnWSx4tl4misVEsqKnWwy9xMq4MZoT1O4xtZD7PeZWQh
 xM3ms6I4BeBjuIlWRtnmp2YGD3xRtkv8fuzyLMWZTgq8cLv4Yvju+4a8uwzdgzpZWARv6nVIs7M
 m24hf+in9s+NHuBHyEd7eCAXver09Aqunel69EXPJm050zG2JRDArfMGAe2C+oFQ5HKLojlh9ww
 cum6qpgJUsuklyTaBSedLrMvZPM6ue73FHxku5WZ1ahoEzd+DOkQ31/oWm3bdyQp+1+2HHG7+os
 To5c6BTWgksjYNcgynfzKcEH+7vNS6j+WfWl3Is+pepVeYSqrYWQyPVyZPzvg9F3uP9AUJFiTOX
 KwwVwazOtcgOGrSQz9FhEOz+YRngL+CO2ShlWknMFA1C4i65FwD0WbWQtmBo3ZpfmvZqi48IUx3
 eEuTrNl5oClEbPjGSOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120003
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wcemraangg63:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:brgl@kernel.org,m:ebiggers@kernel.org,m:thara.gopinath@linaro.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 0D5DE675FA8

On Wed, Jun 10, 2026 at 11:24:04AM +0530, Kuldeep Singh wrote:
> The QCE hardware does not support AES XTS mode when key1 and key2 are
> equal. The driver was handling this by unconditionally rejecting the
> keys with -ENOKEY(-126), regardless of whether FIPS mode is active or
> the FORBID_WEAK_KEYS flag is set.
> [    5.599170] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
> [    5.599184] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)
> 
> In general for weak keys,
> - If FIPS mode is active or FORBID_WEAK_KEYS is set: return -EINVAL.
> - In non-FIPS mode, Accept the key and encrypt successfully.
> 
> Since QCE was returning -ENOKEY for non-FIPS mode whereas the
> expectation is to encrypt content and return success, the selftest saw a
> mismatch and failed.
> 
> There are two problems in QCE behavior:
>   * -ENOKEY is returned instead of -EINVAL for the FIPS/weak-key
>     rejection case.
>   * key1 == key2 is rejected even in non-FIPS mode

Rewrite this commit message to English text rather than multiple kinds
of the bullet lists. For example:

QCE hardware can't support the insecure setup of the AES XTS cipher
mode, where key1 and key2 are equal. Currently driver unconditionally
returns -ENOKEY, while the rest of the system expects to get -EINVAL in
FIPS mode or if FORBID_WEAK_KEYS is true. Correct the driver to return
-EINVAL instead of -ENOKEY.

Then another commit to crypto testmgr to let crypto drivers fail for
AES-XTS (and also another commit with docs update).

> 
> Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
> reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
> set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
> software fallback mechanism to encrypt the data.

No, if it is a hardware driver, there should be no software fallback.

> 
> Fixes: f0d078dd6c49 ("crypto: qce - Return unsupported if key1 and key 2 are same for AES XTS algorithm")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  drivers/crypto/qce/cipher.h   |  1 +
>  drivers/crypto/qce/skcipher.c | 20 +++++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

