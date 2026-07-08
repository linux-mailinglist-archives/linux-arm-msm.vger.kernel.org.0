Return-Path: <linux-arm-msm+bounces-117747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1FVNMEJtTmoXMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:31:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F77280E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:31:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="cZkdDD/+";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117747-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117747-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 311B231BB573
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A60438022;
	Wed,  8 Jul 2026 14:57:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A421438000;
	Wed,  8 Jul 2026 14:57:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522679; cv=none; b=Ca6R1zK30/53fzNltbH0WL1O4nEk5y052/oKw9tMRE42pO0Nrb7kZCJUXfYH/pMWGI35v7lbq4T6W/oM7R6mEsKlIDXfaZY4Osd8kZPiA9NJVf+gWOqPe6grYAs6AmYNVIuT4RQtLcOqMngnHzhKR9HC5bJSGgAm87hts1Y7Otk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522679; c=relaxed/simple;
	bh=rtpCwt651kcQr9WKD719LDb8+o6wQtols+xtFmtYc4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEbJeQOULJY/ESUaYi6uEnY9sWMx7iTO7KGVGI3WNpSI30s+37b95pYyzGPI+eYoRfNy2gRo1i9+dbtdJKLv7CDSop0oIl247BJzltYrhwkIFxmJ5uAlSD4bBfuvGMlHqyqh80j1Ok2izqJ5VDZJLlhAZaz4L0FrKFs/f9QG8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZkdDD/+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1031F00A3F;
	Wed,  8 Jul 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522678;
	bh=i2sp2hHDzooGbQrCnzv6DW/wnJGQmVp2vhPv3cl3fdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cZkdDD/+g8pitwc+7E7z8eMWFjaOOOIKccm8FaBCHVDugwUAV4onCWRbrLAh8vtUM
	 4DP6Zr0h+VaKTLduRgs174nhM6/aHNXmH3yIPsfWC/KN/DYDdV1NIvJFY85sJ0O6md
	 0+IA99+rY5BzBFCqN//Ty3KKQHxLGahJXZv5FN3Urd4UmNK/fS90PcvZmzWHaiYDpd
	 NAiDi7VyqmNYbRDN26kQrTHNY/+SzpVZkoLNKuryMu6+jJ/li4sbKqtGrSFzIf+HpU
	 725mzuCgf7zjilJTFVjKjlxLhAn3dOzfPs8iIhjThJgQwVMaxqmKw10AYJEnESzN5q
	 csiDesfGmdBCQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yedaya Katsman <yedaya.ka@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup panel compatible
Date: Wed,  8 Jul 2026 09:56:59 -0500
Message-ID: <178352261606.2235436.10213047628216526295.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
References: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:yedaya.ka@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:yedayaka@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117747-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 592F77280E8


On Mon, 08 Jun 2026 23:10:23 +0300, Yedaya Katsman wrote:
> The change to the panel compatible was missed, fix it. This compatible is
> already in the driver.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup panel compatible
      commit: f135fd1bc76d052f1bf4b1cc987cd47fe0a71d8a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

