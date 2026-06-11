Return-Path: <linux-arm-msm+bounces-112569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DxcuMjEUKmqHiQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:49:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7CE66DB14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:49:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H+A17Vos;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112569-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112569-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DA13304671E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 01:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85B02BDC05;
	Thu, 11 Jun 2026 01:47:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762E28C87C;
	Thu, 11 Jun 2026 01:47:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142477; cv=none; b=SCCJ8bYCKd+YdtwRV1G9hdlQO4AYCMKqWCRN2ANbeD6+z95a79OElkY2GQQkkt8B8OJgnbhtj6hQ6k2OpyXBdEppo5V423qO4PuAMb23VcmlVvM/+9J4FRP1zN3erMDOiGxLtQNApb3rQj9ACEcq4q4FHmZlcyKlqVC/GWoDDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142477; c=relaxed/simple;
	bh=5ieW4Oaerkvlro4GmdbXHQ34sl2CK0ZbXa1B7hlloJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/5evtF0GCBgpqioEyzK5MtkLEVW503AgHS/A4r30+i5AYAJkzyOHiZr6+QPB4IRNmY7cbP224LvvYKqAFnrATcF98QDKPuQ6RYSs+g1II04iTPUjvTCpayQ1rZH8e/LDLCUv/AoiGrZZKSmimjw0MKV6lmHW5ykZgfEnCI0KnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+A17Vos; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596B21F00898;
	Thu, 11 Jun 2026 01:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142476;
	bh=Y6A9lY2wOBX6mv9cQW2cLkElhQ8Xpz6G49i/I6XDyIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H+A17VosjyxMdPCS9rAFmBXm0bULopqly315s/+zgQWWXGdwTqAbTdiBwHMWjcu0Z
	 TLLE62WhELMwA39hw048Xo5m+Nnko55iGy9Xtq0Z7XUWjGgenaFTADlvXrIOOOhZEM
	 hBXKUgnangKW8lDdth1dsPkMwZG9FbulJ6OoGdiTCWi7ubas/gy/e/5R/KIdkmLuOe
	 4uHPuD5AQNrhpQuy+v87TzyNkGcA8Z14xA4iV3vRB354FQJKeyH/2Zu39RVreP1D3q
	 gyQVOoatBpUpnR9dCJFLukX8KoQOKWxjKO2JXpasaIcSXx/McefwFQUmjZ9U1T+2v5
	 f0nw+91oU2PdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Add compatible strings for RPM and mailbox devices for Shikra
Date: Wed, 10 Jun 2026 20:47:45 -0500
Message-ID: <178114245722.590736.11826462854744083593.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:mathieu.poirier@linaro.org,m:stephan@gerhold.net,m:jassisinghbrar@gmail.com,m:sneh.mankad@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112569-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C7CE66DB14


On Fri, 08 May 2026 16:10:45 +0530, Sneh Mankad wrote:
> Add support for RPM processor, rpm-smd device and APCS IPC device
> for Shikra by adding appropriate compatibles.
> 
> 

Applied, thanks!

[2/3] dt-bindings: remoteproc: Add Shikra RPM processor compatible
      commit: 181836fb3aa6715e3dcd899c9283daa9dfbb91a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

