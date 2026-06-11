Return-Path: <linux-arm-msm+bounces-112567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T2Y7HuMTKmpuiQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:48:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2566DADF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:48:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eUNBz3PY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112567-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112567-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9C8C3014176
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 01:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A583427FB37;
	Thu, 11 Jun 2026 01:47:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DEB265620;
	Thu, 11 Jun 2026 01:47:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142475; cv=none; b=DZHmkgFqN7UqaMaHKdb27/E80b1uAiLfQeQJtJG7TnCsR366IVl//f4XA0RyR6UMQnYeE1KswRE0Fwl/ZOt9wjayalVOAbotcrYyt75wJzjL541IfMnZym1JaTqSEQR165YAwHaPRmTRGNMOE4tZ/15r5rn15aGkRxo2NDJlT+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142475; c=relaxed/simple;
	bh=GuQJgjKfeC8lE+5MU+T/2VjLycXSLPbj6ZOkqgaU8N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMzi9Fq9+eqvMQGLg9QH5PK89ABZIDGHrBCot1pJDc8mW4R3gm+y/CnI2L1i6nF6ITR14buyELLLVH5N+Frv7EDEU9WcY1qFE2OBtgLiFy/yA9nOgcIHD9sAwz5+SwI6kGsBQtZ7TNrenjIpuQkWJQz2k/liSiQOBLPLtUJPyJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUNBz3PY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89B21F00893;
	Thu, 11 Jun 2026 01:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142474;
	bh=QgI9TH0K9M08zgUhlImJ1Lz1hSkKFM10JZT6HcfOXRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eUNBz3PYM95OA5i57LYharcxwl9QvD3LG2sAhswZ+wx3oosYOKkThi0jxo5NG+H8O
	 r6NqpL6j+uLFDn05TNmvoUxlWnhQyCRgvJqTwKq5GVNs/0xaKCNqpJcSEIlfHn4f3y
	 dFEH5x0XQZO0MRWVZfbW6kcxMugToygTA0K7P/8WxDCzSRPXW68n65tjXYTQcI8ZsK
	 nqJvhVG10CoHwEuWpXIkS4mTEfxlspuQql9dN+uSGkSAGfX/gRHsxAhNYveZcyltF1
	 WLNAjj9hYOuplsZmVcvnNK8Xkpahqwo3lZwasfQBNl89KPXEmnzWh8ALXACvwzTPeu
	 U4w1apG7nZMzw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi ADSP compatible
Date: Wed, 10 Jun 2026 20:47:43 -0500
Message-ID: <178114245711.590736.10294919878949624614.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
References: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112567-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31A2566DADF


On Tue, 28 Apr 2026 00:36:13 +0530, Mukesh Ojha wrote:
> Document compatible string for the ADSP Peripheral Authentication
> Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
> ADSP PAS and can fallback to SM8550 except for the one additional
> interrupt ("shutdown-ack").
> 
> 

Applied, thanks!

[2/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi CDSP compatible
      commit: a9697e35887e7e3dc1135dd97efd39d46d910e73

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

