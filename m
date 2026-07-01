Return-Path: <linux-arm-msm+bounces-115801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IkZpF9B/RWreBAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 23:00:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 783436F1B66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:59:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RKHTLBLS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115801-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115801-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DA36304707F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B0C3A5433;
	Wed,  1 Jul 2026 20:54:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C2739B97B;
	Wed,  1 Jul 2026 20:54:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939257; cv=none; b=vA73IQ40rv7rU+AL70pVRSBZknc25iPfAgpO6SNFFKrKnmjN7/4/tFbMtXSb0izNLo2zc+iSL0flPM7nAbsP87W2qmSTkCMHgulg2i/u71+ms0rReZPWc+yN7yNgCXVFa2jBatrSm63z/WcjKy8CsRCtEBh10vSEIxKjG0qj50c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939257; c=relaxed/simple;
	bh=5kPiC/ba9ebrghbNuonrT3PrtgBiWeZg0MUV5WBWD9w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LEpVD0Fnp4creobjt1Yv5mG6uj6HZpaOzK8cKQLBD+5f9ogWkxOG9GcXLmE3gBRJ//GqovYDG4QaM1E7/nUtboSY3Iso50d3QexenatjoytqX/gzyywMntqTCTmaEDhq+ZkYrTwcmS63JZagKjo3DD0UtoRKXAiQD04uwHqPnq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKHTLBLS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951871F000E9;
	Wed,  1 Jul 2026 20:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782939256;
	bh=JEvy1l2R5wDaP3nl/PDDWtUqdSpWWifDM/0zHsJVrRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RKHTLBLSHHyOozZaZ1oQqP+Uqzxr0ZaN4FhdLEg55Vlc14sB7aSatfHYl67twCv32
	 Cv4q7UmX6LIZNbmMcwqATcgo1qliognvxVvKTamcG5d0630tD/x43lIahjoMWhx+Rp
	 gaJabrPG55p62aLzweL6lOiJXvTmkrvBmv//IH8wPCYpTF8WfgL62F44i9Ds1QORnH
	 nBYk9moXy3mJuDN8+k7Ri8hhI9uGDQr0EG+9z9pPOV5n/J23qn0DQzbMR5WczuPMjd
	 jpGc9Xlu1kCS3D9O8E3IdXOOesV7agMCpVQ0TKNJt6EgAJeWdeoTclRNCRwqZDNE4/
	 hsyFsCDYKEF3g==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, ekansh.gupta@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260701104821.3120719-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701104821.3120719-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] MAINTAINERS: fastrpc: remove inactive maintainer and
 add reviewer
Message-Id: <178293925536.12403.7742897817429365778.b4-ty@kernel.org>
Date: Wed, 01 Jul 2026 21:54:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-115801-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 783436F1B66


On Wed, 01 Jul 2026 11:48:21 +0100, Srinivas Kandagatla wrote:
> Amol Maheshwari has not been actively involved in the FASTRPC driver
> for some time. Remove him from the maintainer list.
> 
> Add Ekansh Gupta as a reviewer to reflect his ongoing involvement and
> active contributions to the FASTRPC driver from the Qualcomm side.
> 
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: fastrpc: remove inactive maintainer and add reviewer
      commit: b070f59a58df9f98e6439025cab3aaa57fa98ec4

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


