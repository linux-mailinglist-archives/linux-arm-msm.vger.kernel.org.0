Return-Path: <linux-arm-msm+bounces-112834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RwuyOWJWK2rz7AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:44:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 435FD675FB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:44:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NlMDORRI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WeG4lDoN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112834-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112834-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56ABD303AB46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6EB26FA7A;
	Fri, 12 Jun 2026 00:43:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF972C21EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:43:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781225011; cv=none; b=o8K9qnPrxgOlFeRll+2SLdyXWulS6uD/ezb2mSLzXqluaGRAyM5mDycFGMlS6mnJA0Ciqaqlb0x/UCzjW/+YpC/zh0Wgt+sLBGre0gs0iW9oyb+ukTSqjKue0J2VYNgw+7QeHglyFJcJ8hcwFbUXDgbLEVSfeF2efUvW02sGdhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781225011; c=relaxed/simple;
	bh=8jRkw6RfDHQ5Ir+6z83uy96MZP0sokiXORn64ldFT/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPlXLqXa6YCwSBH2ix92DtCQFW3oIHrYRVLI5SJILPHR0EBdr7DfaS2aTt3j2UkT7xG/eAFCBvNNaikRLJruJwgv0dIY2nvqaISb/O9udUgtwRbijUtt8nD1nNh6O47i/bw2tHOFJ2es06RbH12udqHIvV1AECoQZ69Nx5EVCWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlMDORRI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeG4lDoN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMVc8a1819870
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xydnARKVU4Dp8mleKZj0tD/2
	fWrgzfcye+B8Z2l0sho=; b=NlMDORRI4RV+Zaa/yQmUPcvCJNHZO6shGb6hWAwZ
	x/BYMEMdx+H0x0opyojU7RfobPIj8944pAvvhZEqirrINGVKM5hIjk7KRZVx7lWx
	tZlwdKiDL1/x0bUMVLXmoRG55hEYbH6Z69XBNGFLX7MeWxHhAQA1ySI6sscjjWka
	+sMwjGns/gGMQ9pxznzZk2Q72t8NF7wo9bnrVwHImWxXISiTD8qWorfQkcOFA9dg
	FOTdawLOWKYjVVfVtZjGk2MCKos4LkV0+T0sLnxvu/sLBoN5NaVI2Kj1PthxK7RX
	wW7j8F+bCZ+ce9ztrdATt4HnfqUky1rMymoI0LfO09c/Jg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30g91dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:43:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177f07ea82so7370371cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781225008; x=1781829808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xydnARKVU4Dp8mleKZj0tD/2fWrgzfcye+B8Z2l0sho=;
        b=WeG4lDoNstJwoMgAPkxqKQneZziHd8Ut7GazJGdCt2aNV4T6mqDWAO/H69pkxL9LNk
         9iM4KP5ScPCc6U4hZ3zfxbWiHtEq8Sp8vROzONZ0qu1XylCdxZIK3Q7SMQLidceg1oCq
         4UKRGmJAEffcgq8YjaZxbdfEOmIWPd9JGkCNLkQKYooISqvMnbJGl6QTfCvxhLkCTA2G
         TXa8p1qgbJgSa3henmRZ4x38809+DveXaVxKfOf1xsroUKvD20DdGHOHZqqfGEplmR3j
         wWq/dSNpGvHAJ4tgscg6OoxmqLEF1omQmEaWRwwsKm1dFddPuL3dKbxdHzLICo5fYFEh
         TnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781225008; x=1781829808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xydnARKVU4Dp8mleKZj0tD/2fWrgzfcye+B8Z2l0sho=;
        b=b8GJ4IRksgZf4n2xB1jo5LCWXxKj6bFLNTM7i/8PBO7h6NgPKp3DTZgvFEc2t9pfHp
         AI9EXFugi465CorAz+Z2tmzSuNfbWCJPBqLt+a7YArYANRxN1JnPOfwLbhmcs4MFoc9F
         z3GZR8ee1NLp2NxqxUrp+uHx+i+Ao+qNYlncB7jWeVS4I1GoBvVMzKPX+2iqi/suHCKu
         5HHN7UPbDZl5lqVIBzuavMQXjynmDtuNJGNXF4qRvgyGdGPg0a4rxpstpnvF0Eijp2JE
         uQq6rzTRFk+k3nzQzZMcPiVyLMK+rQR/6UUqfZyAijxObjCZKwykGzFFu8o0fNUT8F1Z
         UQFg==
X-Forwarded-Encrypted: i=1; AFNElJ876dAe3sUsbvfWmNi6EDuEXuMsUBtTe+mfoelqp7gMW+7H0VmQ57epRxJIDcbs4kVPpkaDYphYmNAb0KRF@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJT91nyJAl5pJjvrQK0YGdB+uzkzb2a78LKxhDTWlSNhZaxep
	2zTBGcikcllYq4afyVZFzxFh0hYJpYdlhaoY2BwPO8PK7vcZODFzQcZUgKp6VccacrS/cgtbWev
	FGIdspSVHfYKqXTYBNZtcPQPDVN/fv/R7n9yPEUMB/0sFCpiVMuIrMtJn2pT9X5fZdw1T
X-Gm-Gg: Acq92OHu1OGHa8+21qx7KVDgXtw8PReGDcptszNJSHnOWizAiIfGy7JdVFQ8J0AIbjB
	cQNUcwtgI9S4QmALUU35f6yD/MhX3mi4kmBnPSRUMjd0UXXqgcmO+36/MHUHk7sJrurpLCQymlo
	f5xU1H1Z4KxeH8dNa7Wp6g7KP0NsHvFRXdWJWwmmEB3kvWuLlkDM7aD+DIlIMPjyhDKiAB+7mB3
	Oo+l7tC1F7raB2A6yakCqLXFCtcpSVszeKkJ9jGjWlQA5pUvwtpPfQdSUvOE6KKMvpfOq+15+qw
	zdMhj8kxr7LiPjbDEHImn3CE5DW7wNlXtbATvrBdcGA1+28LS0Qq5U7U2PjEO7ex7iUnEyPnhXP
	V7Gg4pKg+oabEiSCOaV5ugY1iFiYxpisrK04sfNyftE5UcZe6fWFyVmzcS4YwhmB7N4BGMEt0zX
	NVbWGchdkycBDTSfukTsdlSeKY4Ewwv4tjJtA=
X-Received: by 2002:a05:622a:488d:b0:517:9407:5c36 with SMTP id d75a77b69052e-517fe578a22mr7529491cf.53.1781225008202;
        Thu, 11 Jun 2026 17:43:28 -0700 (PDT)
X-Received: by 2002:a05:622a:488d:b0:517:9407:5c36 with SMTP id d75a77b69052e-517fe578a22mr7529221cf.53.1781225007811;
        Thu, 11 Jun 2026 17:43:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b327asm60552e87.70.2026.06.11.17.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:43:26 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:43:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix Qualcomm Crypto engine self tests failures
Message-ID: <4fzeulsheu5tam6pcymjqkqnqi3ibjgwchiefy27wr7b5i2yhk@4m47fpfbsmwf>
References: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
 <20260610184205.GB1158828@google.com>
 <1abc518e-e24e-44ff-9b15-1766dcecd8a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1abc518e-e24e-44ff-9b15-1766dcecd8a2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwNCBTYWx0ZWRfX+Tk6ls9cASJe
 kBQh2IrF/CITO5/BMXtzqpafhGtXvHx4a3hH4jfBEknrjtm1Otlc5/UdFBXaxjs4voT6JEtEXfo
 gt3y3tKVdh90eEhDqTf6+stwSl7bDnc=
X-Proofpoint-GUID: hol2mM8oZPbVEEIYH5rRY5aFukAw_PYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwNCBTYWx0ZWRfX1YEuLoU6ecRR
 JcndNANp6d921r1frAaE4X19fKwgQKCOPeLUcrqq20D5eD5RTDc0RwRSs1XSHFgkB4XEhCc5qjY
 XflpdWuIZFzwsYcoHyymbyLC8E5A1VNCd7JYeDB6HkCr2H1WMR0Ny8e+SgzErv9FJ0TtKOROkSy
 kkr9zYVWXsrVY0mZZBYULpqxrKjewj5oQ9cEoKBG2hlcMbuf5gVaCNEMHd1tSbXkI4Kzu33QKDs
 8ubpZ4PW9ef8OfCprTfPk1Ll70+3khwuDUSvj2kKw5P71tq9FzQ3OJxs+By9DZJImqgUYQy/Ze8
 Ie3M1hrBFuzY0GOaF6ulOvJSKiKGVnDaBCwND3jLE1jTnAyRwUMzNOAf7ZJ3kKYVVWs1EUa7ffH
 il+pIHcJJA6jOoCM49h01FXIOzHmvphtvaOz4d9r4mr89cZm/ol/CGZU8S2KILNRgpUrDkBMUAj
 kIIpYQrz7Mk8YZialIQ==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2b5630 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QF-RXkosJRkZplQLQDAA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hol2mM8oZPbVEEIYH5rRY5aFukAw_PYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gondor.apana.org.au,davemloft.net,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112834-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,4m47fpfbsmwf:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:brgl@kernel.org,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:thara.gopinath@linaro.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 435FD675FB7

On Thu, Jun 11, 2026 at 03:17:24PM +0530, Kuldeep Singh wrote:
> On 11-06-2026 00:12, Eric Biggers wrote:
> > On Wed, Jun 10, 2026 at 11:24:03AM +0530, Kuldeep Singh wrote:
> >> Steps followed:
> >>   - Enable EXPERT and CRYPTO_SEFLTESTS config.
> > 
> > So the full tests (CRYPTO_SELFTESTS_FULL) still haven't been run?
> 
> Crypto_selftests was only run as there's some discussion ongoing with
> Bartosz on removal of deprecated/unsafe algos.

pointer?

> 
> Seems Bartosz will be sending patches for algorithm removal changes.
> The rest relevant selftests issues we'll fix accordingly.

So, the old kernels will remain broken? Or do we expect to backport the
cipher removal patches too?

-- 
With best wishes
Dmitry

