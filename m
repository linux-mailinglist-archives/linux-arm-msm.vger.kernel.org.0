Return-Path: <linux-arm-msm+bounces-96905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BGkOrwqsWkBrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:41:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAD125F880
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 239BB303EF9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D082C3B9DAE;
	Wed, 11 Mar 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJxEJaWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BE83C1404
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218393; cv=none; b=lqGJMW4fR6vKdX0GN5tLA0l3WVwA2Q7pn4cr+TMdq/wsOTG/Q0vHWddLqLWeKGpYKIi8Z25mmvAri+eBFlmyZ6XBf2yA66kq5esNavT+X5foZrJskwndIYVrniLo9owxkKjny+aV3R20lh+PIHWZOUFvi5TMk13Zpk/EbGGPvXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218393; c=relaxed/simple;
	bh=QxbY4TmZVmcy5WyPXsY5uAywYWWbPj75/Fg7V925xEM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Klit+ZBxQVKdcIVZAvKBXH3+j/m2duicgK6CilS3NaVRSvagdnRf1YRn7Bmz4di7spnxXcasNwEy3cP6epQs5SXzspCCuxoWnuWsTVq2bY9pCbT4Cfc4Ee20cFwtvurvKa4rrc2hOsrE2MBEMDXjNHlzOL6Cgko7xw2HnJ2NkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJxEJaWK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0D0C2BCB0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773218393;
	bh=QxbY4TmZVmcy5WyPXsY5uAywYWWbPj75/Fg7V925xEM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=tJxEJaWKKdrcw8kgcmla/CfmanmXOQ2IZvbxZPSLImcyVxGK+Ig/UvT66Sgfsimuz
	 SCvsdMJA6k8uoLRGEdRsfQuplHNMUvfbVD0CJOBZvYKDpi7sbm5xnM4On1meR3V74x
	 7Hx6AjvNbpC+WHCSyS9mRDv2Qy+VA6CJtv73RBVCpgFG6NI/kMVY8mnlQCYiATLnHK
	 BjUeYNxGBhY8ORevS8fHoML0x7mku1dBp8bNvxguG7OuwPTi+RXEfq81+P1wXY8jGo
	 p78vn7V7Oto7sV6Fa5YHlBfsxm2LcvPoeCQ/WMYwyAGRhjMdCd2rtsvO6l6DjqAtil
	 7lprrPM60IqPg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a142464316so5048534e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVV8/B5tDUmQRdr78mTXofSpLicTWNPZhkklkftcy0VhXL4s1+3kCMhldXy9SX/6nWZ2jN05nKz2qUj0uEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyPmNXI5b36WHXEJ6TzCchCgMzU3OGBUs7N/4HORo40r8VyGpHq
	x36lJYsQTa/Tb6/7RhltCa4Al0fxGa/0J3xTs7lX1BNcNEDj1IQVeFYSTY5R5SzJv+yxM42YqfZ
	sYZI10eqNNE7WOT0+d+1Viacit+HGoskXeF681oCfdw==
X-Received: by 2002:a05:6512:b82:b0:5a1:3d08:cfae with SMTP id
 2adb3069b0e04-5a156bc0a56mr588182e87.22.1773218391674; Wed, 11 Mar 2026
 01:39:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:39:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:39:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com> <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
 <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
Date: Wed, 11 Mar 2026 01:39:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
X-Gm-Features: AaiRm50VFTJzB7IPYCS_UKzHDhcMPo2GrQD14UYX9HZQII94keloO5cakmoSMRE
Message-ID: <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing rproc_add()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6AAD125F880
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96905-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
>>
>> Ideally things like this would be passed to the rproc core in some kind of a
>> config structure and only set when registration succeeds. This looks to me
>> like papering over the real issue and I think it's still racy as there's no
>> true synchronization.
>>
>> Wouldn't it be better to take rproc->lock for the entire duration of
>> rproc_add()? It's already initialized in rproc_alloc().
>
> It would still be racy as rproc_trigger_recovery() is called outside of
> the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
> must explicitly call cancel_work_sync() on the crash_handler work (and
> any other work items that can be scheduled).
>

This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
but releases it right before calling inspecting rproc->recovery_disabled and
calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
lock and rptoc_trigger_recovery() should enforce it being taken before the
call.

Bart

