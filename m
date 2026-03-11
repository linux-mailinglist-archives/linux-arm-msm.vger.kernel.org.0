Return-Path: <linux-arm-msm+bounces-96998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPBTFyZwsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:37:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7A264AB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB701303CA73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED74E31AABC;
	Wed, 11 Mar 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B17R0GIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5F02E093A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235924; cv=none; b=rhXALOdXMiHy2g18/K26b7cXPu1DvSszMrJpOIHdqGoxIWTcCc3fvom+M13jSbJcMqpdfZ4AjP5HWIh5pY0RZvL6zJVNVkO7DwWQmV90govpOSphYvbiHVmUjcNONTrEAy+9X6jpj1glS/JAOLcD4Lh6cnT1yn9ocWVyMrXs810=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235924; c=relaxed/simple;
	bh=fcoJPNKuDkOxaeGfpvjVklBwG6h+rrhPOzC51SVyp8w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebjjcwgCU03ygDOMCltwAH3dYuxUNrkgYtvvSy+aG54RYzgVDADotOKT4/DyV6EnUb0uaxRxuO9DrMJ4k79vjmn3t7r9r16Nip4HnpR4HORjBTUCSMSCczuTaX2tb/Qg3Ukh3HVB+1NMhI5Dvx0C9pHe6NpFFSw5tUhBmch3vKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B17R0GIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798EAC4CEF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773235924;
	bh=fcoJPNKuDkOxaeGfpvjVklBwG6h+rrhPOzC51SVyp8w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=B17R0GIMPI3VA63UNr09zTs9qdL/WUBIt6avrFViPKQsL4CVt7ju/qSVYHpVBtkH2
	 ypMlgqwscOaNQ97VwqhMFD4bbqCjdkCZhHYskxXhvd5BIKzigfXWfwHxQP1F0kD4oW
	 uXc+IgsxaqH3Wv/WgICqo12qg5n9CF3tGdoAs/wQ/JgdcVYFCnCC//tuSFxt1XWHsO
	 r43HLfMLnGdB5S1IAjeLr5Z7uaDJ4mtV6xFFazT1Y/f9Fpcku7bMFzz8KsnvX7/KKS
	 5XDif2UJiYn7/Qm0g+pyAL/a5MPQdVMp51uXnD+d6N4DDZNE7TX71Z0wfAcpf1o2ye
	 8RM95ruI0JwuA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a01c80c34so149613871fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:32:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YwYR2RT1nbTnubertr85G80ciAQSVjnxs3HAXwx526jzn/xnqsz
	OHdYYidiqZpf9X8PO/ipdpg7JDda1vpERdSZOE1t3I1lyTMHqQC4ZoqhwmeP6gTi9aHLYJK9aep
	ZL322ITFVoVNhrYxQgmqSAQ21ndnzFe8fqi+Gkg4T0g==
X-Received: by 2002:a2e:a808:0:b0:387:da4:1664 with SMTP id
 38308e7fff4ca-38a67e8a64bmr10477381fa.36.1773235923191; Wed, 11 Mar 2026
 06:32:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 06:32:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 06:32:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260304-b4-scmi-upstream-v5-3-f8fc763d8da0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com> <20260304-b4-scmi-upstream-v5-3-f8fc763d8da0@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 06:32:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=McYSbXK5c91O7q2J2VbJ5Ax=3WVDotjo-p704M7bDtkKA@mail.gmail.com>
X-Gm-Features: AaiRm52qcqj0U45jQbqd-qm-LuTyMtS-yQpxO4suRo4FZg3zGF9woupoRjln5lU
Message-ID: <CAMRc=McYSbXK5c91O7q2J2VbJ5Ax=3WVDotjo-p704M7bDtkKA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sa8255p: Enable sa8255p-ride
 board support
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>, Nikunj Kela <quic_nkela@quicinc.com>, 
	Shazad Hussain <shazad.hussain@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: B9C7A264AB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96998-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,quicinc.com:email,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 05:28:30 +0100, Deepti Jaggi
<deepti.jaggi@oss.qualcomm.com> said:
> From: Nikunj Kela <quic_nkela@quicinc.com>
>
> Add initial device tree support for sa822p-ride board, to boot to shell
> with ramdisk and rootfs on ufs and uart10 as serial console.
>
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

