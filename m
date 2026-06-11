Return-Path: <linux-arm-msm+bounces-112690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1gLKATCFKmqZrgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:51:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5380F670951
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:51:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ZbkGw5/S";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Yb9BZ+/9";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112690-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112690-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A20B301B712
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA9F3C4B8E;
	Thu, 11 Jun 2026 09:47:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C803C4B6A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:47:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171251; cv=none; b=a3iGLBoqFVuDcC24/a4DH6d875eT6dep2tusKbgK2wEiAnalSwaMMSAhUlEmNPODHyhdncNZVWO9GgNmFoi6Fh/xFj+bi5uZXzaGNcm1fxYsZkpMmTQ2EyiJyBBuqjJMbl97qFmqupYmHnEERd60zZr6YyPnMblz8ZDGlll9ctQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171251; c=relaxed/simple;
	bh=cKk/InHI42xbqf0GMKfyHcHnULLRnpZJ47mFMpU9uPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRhZ7oO0hi9nj59SOca8xIiK/fTMVJ8L7IxJeOBws2TIE2AvvlpQcG9PC/RTZ1199vByLtceD3dnik4Pkaqm3c7SXNOOcxy6p4mCZ1ouEJeBgTKTH7dWzj45GK0rmsf/vJjpSY1vwd+wBSCLxQ4/BSFUTG4Nt+K6I8d8E1T28hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbkGw5/S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yb9BZ+/9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GHHk3791660
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJXI28gRfgPyJfRn/DYafWDlX/OTe3kGnc0zofeBxnI=; b=ZbkGw5/S8jMFWWR5
	n35+bDH25EwyJvtzrWrWR76PHkJaHjpC/MkyjSSC9Np0qFdqKYDLaJ9viFxXq05a
	0H1EpOw4eon92vGj1jdifWCfqRO3TOQ3Mdc6yM9eaa2xwS/9NoDJCszRseTpNDdH
	pGsSfVKPpsIczuQ90mJqUCO6RU1MCC3FV9KKDhqq1srk3NL2GkQf7UsviTc7sqWu
	oXd3w1Dm1z71XjXqN19/8CoUYadgzLMpHuWGWl0ExJ8sIf1IQqKX1nn073iiA7X6
	7xVARmYWgyAdZPJ/vKl3DjjXUXy32S++oYwei80Wfl6q1XYr0g1IOLb19Dp8/vdX
	SXXaKg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702tbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:47:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso13168552a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781171249; x=1781776049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJXI28gRfgPyJfRn/DYafWDlX/OTe3kGnc0zofeBxnI=;
        b=Yb9BZ+/9ETojIEOHBBhHv8WzEQ3D+r6Y4gd5npg4GTZfTSIC2K+u6y03dEbUSPZ5eH
         NyAUIAwvWTrHLOErK53H9cEb+Qz19wkT06DQWUve68piwo6VBED4Eg3wxMtueGfqviTR
         4icbWrioB4dikLMJFsdVd20Eybe5A5UUcFqL8Hc1BkJesxu6r6fRj4NO1zFNWRF3haw1
         qacFVKiNajnvEOLAwlPBzXtEEQ7pvUklzqu/TdySrhE84xAlmN7LCBwRfWhSSUM0ZWyL
         LlYOoV5HQCG3QcsE1rTGYFBmCJ+O38SlDwDDz7LXrg7gudldCZo2ZPp0QV9+nAAh2nIm
         +LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171249; x=1781776049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJXI28gRfgPyJfRn/DYafWDlX/OTe3kGnc0zofeBxnI=;
        b=MrSlTX0A4nk+wB4nzVQGNdcQKLKiPJfS0ddjK/Bx6TbvOzpBZkhayRzZax+MwMMFqC
         jsXc+2HU3xIza6x62C3H4Xjd4p/JkyAoWEn+m9V4yG+10W620qDC7vd1UGmglPJ3XkK2
         oAWXCS2ltQUHoyxusI8Wtcf14Su96mUQErLEFWGMZHYhSZbh7JnIbdt/L6k+p91yXVcV
         Gh5+bP3T+Ft7+lzCQmokeae9Ntrid8JTw1NG0JUy3w0ePXn83Oq8+STRTl8BZZjj3wor
         EiVC1qtA3TzvBuCuFVAaOG1Fvhvxp53ojrwGfLiVOLM5IvGJZozx+7GOzHa8VFkEjvB8
         pYkw==
X-Forwarded-Encrypted: i=1; AFNElJ/C5tIVLUBpWso/ddDvfQYf0tQDAWuWZ2omHt2ggb0kCzGhvGrCCbfyMEAB0TBzNZ9sC8orAMDWH2rr2o8w@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp0rif2RIDkLoWgnu6jrZi3PggGhAO1MAWbPdCKTTMRyZ6Ed3i
	E+Z5RDfGe0TWkRB3ID0ltwqqMFxVYG1W4PcIRaVq6IUvwrZBqnuDPahFVKlcpxJu5FQMwYgqcqL
	REMeNVmRF6wKXCJFNv/JrGH3vsqc8w3iR7Lgr3bmLpKNd2ZXh+AFUCrb44zQXfxUCv5JBbK7mhS
	IN
X-Gm-Gg: Acq92OEToN82/7MRemIbCEdDovDHczJ5t9LEjA4XoNSPte1f4kbz1uQu34/aZcawBZu
	MIw00Ikz1Sna8o/Drc/+Iw1b487N/mTctfgJOoplvcMNjHGYA5bG6zWNUCjWKlwP/Bc4v95LQic
	vfuyemQ2HqXEjLma5zz9/jekv/6cIypbyPeSxD0N/joQvM4lRobB716HsOLA6JCCIUzOGOISCE1
	TZcdEbD/Ey0QOrLRIg4T1/kVHCdWVSprTgBpL4wEHFWfjALF867weUIy4yTrDBJ8BJaiufswpSW
	4Nj6/LUcarVA3/0NV/nEPWEq1dYYrSzP+astm49UbEQVw0uxGDSqx8NHU3iNfsGsfvrtzASOxWy
	RTCD/kvnAN3yULTw5S64XNyX1PdktcD64C64IInT6wBIUBy7AahzK+uzn2lpr5+o=
X-Received: by 2002:a17:90b:1c8f:b0:377:4a58:fe0b with SMTP id 98e67ed59e1d1-377a03ba952mr2388347a91.7.1781171249418;
        Thu, 11 Jun 2026 02:47:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8f:b0:377:4a58:fe0b with SMTP id 98e67ed59e1d1-377a03ba952mr2388326a91.7.1781171249050;
        Thu, 11 Jun 2026 02:47:29 -0700 (PDT)
Received: from [10.92.167.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3775558f317sm1982520a91.9.2026.06.11.02.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:47:28 -0700 (PDT)
Message-ID: <1abc518e-e24e-44ff-9b15-1766dcecd8a2@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 15:17:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix Qualcomm Crypto engine self tests failures
To: Eric Biggers <ebiggers@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
 <20260610184205.GB1158828@google.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260610184205.GB1158828@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NyBTYWx0ZWRfX4lJPAyD6J34q
 NcBsUXSWbBAA4pX/1f2sSmYXcJYaa4AHVXOiOYCgaeEfOQIlGnSFQ0ZAuMV4aaJyxrDj2oCHlwB
 KUTUP2IJZy8s/C2zuN+dctdvHcy0nmQGrT8FRAHchRGs8FrinrZfqD4dcLazCwSY+/SOuxplHPZ
 lgJMHgqL6Ca13lIC7hmzX7I7NlRk/lZHC8hBdDxgF90IdXvbFbtgkxEZ+HGUj3HVT53ST2NTIM6
 4h5gHMJ8rfE5HPu6+r80u0wXFuJqP7qYGw4/e/RHRxDPJKE7YDvSyovz1sCOdy1o1VXtKhXnGwu
 H6Ju+zrV2ygseyHDMYAlrjdpJNjoSIX87kwQD2QUVMJ3G2ciV1fRJFGr7hr2PbNW3iXwwJoG2ho
 3mmnAwruJf2amHtzAy3WNyVoyRiGkBjOB3YzfM7Gdg7s3Vi3JXE7XMSS2FAT1ABCr2LQbRtTwHc
 UJJDh6zQTec78DnxhVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NyBTYWx0ZWRfX4vIjSEtrq1lI
 eHFmb9tDx0csuJA4Mbe70V8K38Cl6QThxsBsAsOBTrdRuLEHMQcgJVuocaoCnrQFDayksgFz6m3
 V7nOHylZFEdUXyK2e9hrYTSwx31Crow=
X-Proofpoint-GUID: xhRP_n5CoNv6Pkp3SRXGSz4yMGiUZN2r
X-Proofpoint-ORIG-GUID: xhRP_n5CoNv6Pkp3SRXGSz4yMGiUZN2r
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a8432 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=eWo1p3akS8hEm68lJ2sA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112690-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brgl@kernel.org,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:thara.gopinath@linaro.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5380F670951

On 11-06-2026 00:12, Eric Biggers wrote:
> On Wed, Jun 10, 2026 at 11:24:03AM +0530, Kuldeep Singh wrote:
>> Steps followed:
>>   - Enable EXPERT and CRYPTO_SEFLTESTS config.
> 
> So the full tests (CRYPTO_SELFTESTS_FULL) still haven't been run?

Crypto_selftests was only run as there's some discussion ongoing with
Bartosz on removal of deprecated/unsafe algos.

Seems Bartosz will be sending patches for algorithm removal changes.
The rest relevant selftests issues we'll fix accordingly.

-- 
Regards
Kuldeep


