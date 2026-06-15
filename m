Return-Path: <linux-arm-msm+bounces-113206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ozvDJIoUMGocNAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:04:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 058E9687756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:04:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oldschoolsolutions.biz header.s=s1-ionos header.b=bkMxJ0RA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113206-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113206-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=oldschoolsolutions.biz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E3C7300D919
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFB93FFABE;
	Mon, 15 Jun 2026 15:04:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A533258CCC;
	Mon, 15 Jun 2026 15:04:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535879; cv=none; b=nzSjQ2HMIk4+c9FSvYHMnlsWUoB64VGZ3fOzG5GtkoR44JNVKycrQUYO3twd3jY1dASwHCc1IoeG+Fj6L/8XfqSyu/d8p9HYaXSaaT+HtDs+Q1Xebvb/kbXP2YLmC9xHyJTPiE54nHo0roHek9G8yVGkfUTjA5yHTDPwfAPZE2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535879; c=relaxed/simple;
	bh=EXY2uu6ib4i0Umzbyi0k1eACx9NyAhfxBDBY7iThl2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4lsl3zfVOfcjFSUM24qfBulB2QP7DhaW/xcr7+nyWQv86+WpJm1zjSSlqD6mg5CS7vI9POAoi7WpIMCi249DIom1hntaAgHsOZghqmcZaRI0y+th40F/DVwRG8T6aqyg/t1KDCjmREkV34MO2HwPX3smiMcMsqRciawNtffsuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=bkMxJ0RA; arc=none smtp.client-ip=217.72.192.73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1781535875; x=1782140675;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=EXY2uu6ib4i0Umzbyi0k1eACx9NyAhfxBDBY7iThl2w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bkMxJ0RAWBLjqJUMyvv8+KHd1XsAi+kzjjglAP+ccefKdkX6FO6WuvAXkx03CL47
	 ICcF5Q5k2DMWyM41+g2wua5WEVa+HzEskXESUNrolEo1dTDccJbSo1ZdhjazZlvGz
	 xYnEHmhz5XKmmOv5hgjwQpeuqlrkCEg3qavZqHFL9KxPIacQcYTFRHCFJFAl2/qvB
	 CBS7UmD7NaNikHF/ReIosTyIZrQOUmmFVjz6LCweFKdTHEL2FSGRTnj5aIQFEZx/T
	 iES27J9QT5ssLOAcog9JoLadEnLEJpdOS0+W4lD0Buqm1uB+ypvGAtqW32KDw/bGu
	 Kxoa/j71PbUSllKJqA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MX0Xf-1wg6ez2uuP-00QrNL; Mon, 15
 Jun 2026 16:50:52 +0200
Message-ID: <689ef757-ff55-4665-b560-675b3e2c0d07@oldschoolsolutions.biz>
Date: Mon, 15 Jun 2026 16:50:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 3/4] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
 <b732e65f-5963-4598-a341-06338044d90c@oldschoolsolutions.biz>
 <ajAKrYK44-C9B9Yp@redhat.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <ajAKrYK44-C9B9Yp@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WFchek0AOHyQVbFu1iBpKkw2wUXDiEaNJam1Br6h1sYEJVuu+wP
 Ra4EqoShSBMrvKBTRbkXyX/FORqrrithKxuiqgjXgyt2fUTY2Uz4OnAhylxT0U1S3iQXNoD
 gzo9/KbgaB09EaGfzmEHWz5ZX0v29syyKD1aXnaBmzXZeTFrJNxYwjSQVC9INtSzhJf6rFH
 cMAgM8f3nyymUIbwzMxww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gHtO+xbwJGE=;iAC1tStPdwdP07gWbRKpD2cTIms
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oldschoolsolutions.biz,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-113206-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oldschoolsolutions.biz:dkim,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 058E9687756

Hi Brian,

On 6/15/26 16:22, Brian Masney wrote:
> Thanks for testing. I'm going to put the Tested-by on patch 4 that actua=
lly
> adds the sync_state support when I post the new version unless I hear
> from you otherwise.

I would say the Tested-by should be on the whole patch series as its=20
running here.

with best regards

Jens


