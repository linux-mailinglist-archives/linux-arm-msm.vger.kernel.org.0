Return-Path: <linux-arm-msm+bounces-117072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F6z2M7xWTGpqjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:30:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28454716991
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:30:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EbFg8IqO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117072-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117072-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9926430734FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD4D30274D;
	Tue,  7 Jul 2026 01:27:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416231F9A0;
	Tue,  7 Jul 2026 01:27:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387665; cv=none; b=heMnLiWBGxN/EnvRYd4v1KBkbW4RRJZoOGjaAi+CTWNfkETYr+zWwWrgNYFWHcQRpnKOl5O7QE/ylbbJbzhJJC+vweJF18HcArPTvzbbp6g5znHhwIIL0oEBaEFGC4PK/1VXT5WRuW5pjJxCuMMJ+rEmxLxQNMYBRY9gVJr9uvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387665; c=relaxed/simple;
	bh=lvw3I4TWI1jWK69gk1yx0G/XBv5emzOqwkSWWH99/OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPjNolisl3coj1jjxvwuVoQ9MTzOyF/O4CwKtjsaQZ5HuHdC6id2M//ExeOas2HL1k4sdMvVHuOcG6JTBU9vVayqyrctzZ60m4xaxhbS8rkLfxREcbg1RzTofe9/Y63kA5jW5eBbKv5OCXf+AbMhajhrvZwisHF1O75IZjY7hkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbFg8IqO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337301F00AC4;
	Tue,  7 Jul 2026 01:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387662;
	bh=g7F4jQ/jT+kjL2k9TN1bHVmEhgRhrOnB0T0rRK3UpCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EbFg8IqOwSkERWAYcsoID8CwdcZ+1LWAFAkm5o8sEyWeZfghgsLMdu9DAdwPUcHHx
	 kWUGsd2meZYe5CCf94Tz9cycWMWizHj7K9Rb07B1GNSOE8zQDWKrSDSzxaqTBwb5Bf
	 pdpSM5pyiKRW2YusbNo0YHF3BIxAOQNrBjM9lH0v9OB0K2qKQFeH+kTOj/msRhym6W
	 LGMk05kzKsXV+DkCWALTzRrT1fmNH3BVM9rDcoWyKi5fegG6WINC9iXgyxyLw7ua3T
	 C1rypRf8dqvu0qOkwLCO5GoRzML3DegSda4UFgc6mnrWLswSafsinZ+lONqkAKKkqO
	 KQTS8IqXf/R1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Some improvements for SM6350 & Fairphone 4
Date: Mon,  6 Jul 2026 20:27:24 -0500
Message-ID: <178338764567.1558388.14038060755092062792.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117072-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca@lucaweiss.eu,m:luca.weiss@fairphone.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28454716991


On Tue, 05 May 2026 17:08:32 +0200, Luca Weiss wrote:
> Add a few missing interconnect paths, the pil-reloc region in IMEM and
> correct the node name of the simple-framebuffer node.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm6350: Add interconnects for GPU, MPSS & CDSP
      commit: cc62a79bfa39e057c73828c1ed369b63d832edca
[2/3] arm64: dts: qcom: sm6350: Add PIL info region
      commit: edda2a710b87fd49bd991895f34195b6ea37e286
[3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in fb node name
      commit: f6e65005fe55c3d09287851523de06367cbf0bc2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

