Return-Path: <linux-arm-msm+bounces-114282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hwEuJep6O2o0YggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:36:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA826BBCE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:36:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="NxGv/PYR";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114282-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114282-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ECF2300F570
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 06:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DCB384243;
	Wed, 24 Jun 2026 06:36:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AEF308F3E;
	Wed, 24 Jun 2026 06:36:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282969; cv=none; b=uc6sZ4Hf2OHcAAn5r0D67DxF3PLwYCy9sXloEN7AdjmKY2nZcdJtHwShQGogiHf0LEzj3w3X5Sw/LSKRsZH3ugHpXx2bqEJ+OYkoH6IJIeoGnsNu354LvXgVaP1PdUP/z7tWB6mCgBpSYKVRks38DfnQMY1fl4vuOr/aSC7gehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282969; c=relaxed/simple;
	bh=KA9I2ZjyrN1CFvuZH67VbKbISrjyaUpF3onjKUlX5lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDld2uqiafkeV90cgmU553raBBjy1cd2D/pTtyhEuQme+T8wozKKxCobrx4ClvZ2I+J74OK1s7poAgnR9tyRZ6D5cQcUxyA1usMPxBL006X7MLO7/2FIH1HVTAYputqL+T6F73i94HbDfm6jX5AabZBS+j7xjQ98Wt1mLxAdLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxGv/PYR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303571F000E9;
	Wed, 24 Jun 2026 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782282968;
	bh=cgKEs0AA8Uy9o90c5LjkWX5EJ2P+CUk7ArtnAkfUZ1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NxGv/PYR29kDXOv/yLyQrCJVkm46ekzRmnfBxWTBBbHYI06f1iVapPDph9k16MeNr
	 w5fAQz72PUUovKVBA0pESzemPduD3CsGmX/G/k6CwYKLOA61Fe4z5nnotJC3HS4aHX
	 /3c8vM64XSOnxG8o03JI6ZGVHdf/hUHTnsNbq99lt4wz+qTGdWSfBdCRggAWZnrn5l
	 2ki+WfKFy9hiQ7v4r8i3jLeW7gLUJwEnTnV3cU58kYozFSh1ogjxkI4oHoSqt0ahDP
	 r+oGcVeZ+Bz1v2oUfFic9am1i//hFBvhHAIQYAkESE3xhkH0XgXA9c3PDSgZICTlLv
	 QWUgQCcE8+4yg==
Date: Wed, 24 Jun 2026 08:36:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi and Maili SoC
Message-ID: <20260624-impossible-pig-of-recreation-ecddea@quoll>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-4-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623-knp-soccp-v7-4-1ec7bb5c9fec@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114282-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAA826BBCE5

On Tue, Jun 23, 2026 at 03:05:20AM -0700, Jingyi Wang wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Document SoCCP remote processor used on Qualcomm Hawi and Maili SoC which
> is fully compatible with Kaanapali.
> 
> Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml        | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


