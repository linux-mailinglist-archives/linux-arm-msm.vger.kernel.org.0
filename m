Return-Path: <linux-arm-msm+bounces-115522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hEUiFmUCRGrynAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:52:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86F6E709F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:52:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Uo3/6GR2";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115522-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115522-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 238B130379AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E60C3DEAE0;
	Tue, 30 Jun 2026 17:52:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8B3A7F5D;
	Tue, 30 Jun 2026 17:52:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841952; cv=none; b=c46q8uibLAvoCSpPWlY9HVEEGgnwuZsu3e7WuVpMweHG8eHS5/bVCmwv4x3WS11Qv2C8V7iSKcYxMhkXKOFAacItKTDxKxfnVmFJRCGLziXCNfCcOOZ6vii88DxWLuKuN0h4z+TYIgVXqqUMQQwcLzRqulbvlTlvM2aizKwtBxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841952; c=relaxed/simple;
	bh=UXAQp+lzfpjcNQcOpVmCfflmm2lZu9Lgr59CXQm/n4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tevp12Dj9NRcy8bug9Glf6Cb9AjeVwLYuq/slT/BPWi1qwHbxf+rJeNZ7xcgZL4GDUMjdDGZjY2gBRqBXa48+kA2ylkKmOZ+0GH9ux5bDQAijqfz8JkuTRmaRYRZjTfW6WPi4Pvo6hj1NtE4EfV5GQN1dpS96vMDCv3BuRbZN9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo3/6GR2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627CF1F000E9;
	Tue, 30 Jun 2026 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841951;
	bh=X24rq8Dtyy3VVS1hghx9qxF4VDAnbjudmPkDMObmyAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uo3/6GR2RJVyHBeI3lzrdVzfuDefc7hjxJFH7ux26Ap19RMISnH02zWwiM2pwRIbA
	 wzQ/9mjtnW9JYukqfpKOCZFct0uP7J26+Q+6Zwv/6lbMOTDaKuJUcqTol6v8T8lwZM
	 YQt3cAxHWmYhUtZx+1aGfmSDdkeJerP84xjSMWr6ti8hPg3/9/P+gZsH9YOEVFHWxf
	 s8kj9pTha6tSxtcmepb33rnpnoDyEUIFnfBsU7cQe7lilLIPOIKV5Xdl9/Wn5YD4mn
	 jeouN5jbJM1sT57F02WKF5i+P3Eu27IF3PohWq+GCczGEE0HN9ji5+4XqQncE7t2vI
	 SmWg3f3Sf8jgA==
Date: Tue, 30 Jun 2026 12:52:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	yijie.yang@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	aiqun.yu@oss.qualcomm.com, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add compatible for Qualcomm
 Maili
Message-ID: <178284195032.4135377.6767177506227722552.robh@kernel.org>
References: <20260628-maili-qfprom-v1-1-9c097e2edfcd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-maili-qfprom-v1-1-9c097e2edfcd@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115522-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:yijie.yang@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:aiqun.yu@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE86F6E709F


On Sun, 28 Jun 2026 23:48:09 -0700, Jingyi Wang wrote:
> Document compatible string for the QFPROM on Qualcomm Maili platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


