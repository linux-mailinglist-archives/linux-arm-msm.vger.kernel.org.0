Return-Path: <linux-arm-msm+bounces-114531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yUT7AqkqPWpnyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:18:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E166C6166
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:18:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cvoOUYrE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114531-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114531-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19B4A30046B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A0631F98C;
	Thu, 25 Jun 2026 13:18:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370FA2FFDCC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:18:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782393506; cv=none; b=Wp22+rlsWxjPYLz+umVaMn6L+j8NZ4QMqT+PTBjY/cHwIkk5iKkC2fwvToOATRgkvY2tu0zfHzemncJl/VogmrYL6ntqoEvOM25YAR4ey6tH/dTecuxmM/rVVbMu2NrqzI/GV1iadPfggMk1z4LGFCj3KHkwgUdtseAUBn+PSMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782393506; c=relaxed/simple;
	bh=WacbOO72cZ2n89qZpArJv9Y2dkGPCdcnOaWmWAE0B24=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dl7P570JQ15LFPwGvkjuM7HQz7kQj08pqWLls6MtzSmaJ1vrgD3EihZhGLQWtMGe0NmlbS+mpP3e7TwT4wwVdL+KtalqfOCekE9LZgdh1FAb5xhG9M7lQ6XWsnF7fu9OeSRs/6wjHJsQbOq7NLq8T7ydJ88IOlSi5aPm1QtuCqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvoOUYrE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E47C1F00A3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782393505;
	bh=WacbOO72cZ2n89qZpArJv9Y2dkGPCdcnOaWmWAE0B24=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cvoOUYrEOuOIMuAeiwOM8/dSzIv1Rwz6bXswIczZoWhi1kZTA1aQd15+RPP9yKp15
	 vBwjgxbu73C/jYzeHHREMH1ysdji1hX69ZIOtungfbDlIiFYb59z96Gx1Yo50iWjPW
	 ZuZqRV74z3KqK2YG/mSb/m6KOtC83Oc1qMUzR4jsSccNnQHZuKH4P67DslY8jSE2x3
	 YrdzpJV8CyFZD314qPnvSc0oryiylQ1Eh8a7WK19GwjzT+7IHS2ZEz4plqX0nYarVM
	 OmC7b7URWTsBef4B4R4Xgt4gKcl8z/ywTxJAyd21EeZCYNaYJxbGbFKYExMDfNdtdN
	 71b0+Dgh177Vg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so2703213e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 06:18:24 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywzz1WavZJ24XrX85tUm7zR3d82v0yLDJK96rnQyNCW8cj1qZaB
	qnAR6ZpcSIokSllVyrwvcSsniZOnyjg0ssu0uomAPOO7fSiQvrRDyoA0jwRrh4mJNNXkUceMGQ1
	JjS1gk9+AJeajGFDvbDSF/g5mtoIffOsApjIhb3XnYQ==
X-Received: by 2002:a05:6512:144f:10b0:5aa:8823:e30f with SMTP id
 2adb3069b0e04-5aea1f6b155mr784197e87.49.1782393503824; Thu, 25 Jun 2026
 06:18:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Jun 2026 06:18:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Jun 2026 06:18:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260625112750.t5pbesjfftvslu4r@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com>
 <CAMRc=MeBi1osB24xTLOjuBYKfrb3a+OCcW5XSkcDkUavU+x63g@mail.gmail.com> <20260625112750.t5pbesjfftvslu4r@hu-mojha-hyd.qualcomm.com>
Date: Thu, 25 Jun 2026 06:18:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdBb1aq2wdt5DnrVCVBa16F-bHTTBb_MfZpx9+HkpxyfQ@mail.gmail.com>
X-Gm-Features: AVVi8CffWYIDOTp7fywPFZhdrYJb3QvLN1BIlwhybyvS_Y86mIhoui1Sfy433EU
Message-ID: <CAMRc=MdBb1aq2wdt5DnrVCVBa16F-bHTTBb_MfZpx9+HkpxyfQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: Fix resource cleanup on probe failure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114531-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,qualcomm.com:server fail,sin.lore.kernel.org:server fail,mail.gmail.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:brgl@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8E166C6166

On Thu, 25 Jun 2026 13:27:50 +0200, Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> said:
> On Thu, Jun 25, 2026 at 03:06:07AM -0700, Bartosz Golaszewski wrote:
>>
>> That being said, I think we should just modify qcom_tzmem_enable() to silently
>> ignore subsequent calls. It's meant to be called once and stay enabled so I
>> suggest just removing the check returning -EBUSY.
>
> So, you meant to let it call twice..even if it is doing.
>

Or maybe just use DO_ONCE()?

Bart

