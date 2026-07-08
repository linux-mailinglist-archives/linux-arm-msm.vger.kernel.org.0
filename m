Return-Path: <linux-arm-msm+bounces-117743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w5hfOzpqTmr6MAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34805727E1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XMriGhP8;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117743-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117743-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D79A305BEDE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA88435EF1;
	Wed,  8 Jul 2026 14:57:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D83D435EC7;
	Wed,  8 Jul 2026 14:57:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522675; cv=none; b=nGemE/+xgwaUQYpztAHlByXetvA3q1sAZhAsQIX/8PbsizTcOuUB+sh0z4n9ALfIcTVfSpaSB/0Z7UQZPj2mjEtgzNQ+SP9rZDcymwzxtEavuKWOZtLMGn5LpwkhYSNkR4WM706CWz6ACsyerT+B3iyxFQRj5oC74Jp/bAjvYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522675; c=relaxed/simple;
	bh=uuMSw6Dk4iYoG20x2JY3IpRhdtK5oRn6nHPTzzAdjRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d43vKOg6oTie8C+kxQ8Ho+lBVn8wZhfCbt+DXgVLR29XXOIjXUhjlSBqna6PFdupVaE6T6fq5NmsJ7MCTvX3DgWdUSLxwYNY/srm5CqgUTU/PNskktUWI0ZRr18Z4LYVroNgTZeQgNIH1boAFgQiSTy18xYqDDEk7YDo09amYzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMriGhP8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FD91F00A3D;
	Wed,  8 Jul 2026 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522674;
	bh=vyfyghuXYCD3LhgDfkXl0FNzl+5sEqekPde3hzUTV1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XMriGhP8oDWf5DLwqlbyhz7vY2SzRaxFJa9zhXsVxYWySGErP7O+Zwpv/4QJP0nbC
	 dTI+nPylrtwI6VyzLrC+PxxVMnJP/59TUlmbc0QTXnr9+91blHN2bLBF9IBOIPrJ2B
	 vN3JAMuqhf4OHwqTbu7XALdYxPpXzn8pWAy1+WMRBMNzgKMn14NiHcsoW1Tje5M7AV
	 adT7e1G7bpCRZ0E152jpl1J7wRBv7iZdg6gO16PhsffVXm2sgA1OhkIbhKF+2kUBaU
	 0lTj8wLrYNOYmXWRxmq/1rrTohzMbmcCivINxS+w8MqQpBkiYbEf9szb7WHf69uCkd
	 AO4MznzyWstcw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
	Chenna Kesava Raju <chennak@qti.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add memory-region for audio PD
Date: Wed,  8 Jul 2026 09:56:55 -0500
Message-ID: <178352261636.2235436.10420459601272958947.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com>
References: <20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117743-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vinayak.katoch@oss.qualcomm.com,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34805727E1D


On Fri, 19 Jun 2026 15:20:08 +0530, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: Add memory-region for audio PD
      commit: 531ce288b6dd43c1ce90e0b501c209783f0e0ab2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

