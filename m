Return-Path: <linux-arm-msm+bounces-114615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sR/cNYhSPmqHDgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:20:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6DF6CC059
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:20:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GbVd2XT7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114615-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114615-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 921A23036717
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 10:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCFC3E832C;
	Fri, 26 Jun 2026 10:20:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB13ED3A7;
	Fri, 26 Jun 2026 10:20:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469230; cv=none; b=oeQ5UIBb/MmplU84hz1YTHzz0kaGUrvV4XCbNk5567usuKp/zTmdqu2SfeHYdILQF7Z8YAG0D1ElFthNURH+csMg6NlpW64pIn/RlEVevczxu4HkowH6eFlkqPpbfa5XstExMBxzPdR/NOj2StDPDRehTDxjvr5I75mHgjh19D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469230; c=relaxed/simple;
	bh=cA4bqx8KhbMCX1Ji7f0/tsavrsTBEJPeJ/BUQgSCZDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4Ww866lJLIsr+xKRF8eke5EbmyJyOU19nPhIDrjOGyDzEc9UvCB6coEHCELK2O/s76VH4DTNzCcY206ICdbOz2fFk2lzm+peJ9x5s8uj3AIaTvBm3zdjEKJ7D1jlT7QS3Ln5hDwWqdsesoBLXTtAjMivEpst6+yc/S5MIAIJ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbVd2XT7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CC91F000E9;
	Fri, 26 Jun 2026 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782469228;
	bh=5ulkSddQAHOxiSQk3m9xueItocxgNHAwiG6q2cpaoeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GbVd2XT7c2UKSUEXOXOjCQ/vOccTGOK9UdnmcOVj0drOzY622DcjYSh5c0o0T6W2j
	 PYXRpsVDgvJ+3mKWTG3WQbvB9mjT4ncgwCUoBKeaRxf8BTIFVOpySPIlfzX1sTkZ+9
	 Lgfb3I/Bp42MsUJyXbHHKtvnE2whf87SGvDol7zS7FEx9QPHIK28Dy9W1RuCSvhYK/
	 /bPQP2cw4e6X5+lHWUXctTd2PojWL+mQX020NzjYtBB6zr5+mVzxbFOtab70FyN6TM
	 yzelRHJwpyIAlZDMTh6Q13DMnuAQZ4swxl/CTFV9D0NECzjCIWQ7qmki9muwc0FbfS
	 WYckOW9r0XO6A==
Date: Fri, 26 Jun 2026 12:20:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Message-ID: <20260626-grateful-hopping-dugong-c2fce8@quoll>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-1-00905324ffbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625-glymur-send-v2-1-00905324ffbf@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114615-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D6DF6CC059

On Thu, Jun 25, 2026 at 10:47:20PM -0700, Jason Pettit wrote:
> The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
> Document its top-level "hp,elitebook-x-g2q" compatible.
> 
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


