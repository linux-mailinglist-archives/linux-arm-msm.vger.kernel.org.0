Return-Path: <linux-arm-msm+bounces-98666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bClhGx66u2nanAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:55:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBFE2C8242
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E64D0303A3C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E213AEF37;
	Thu, 19 Mar 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="XjOHu9yC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m32108.qiye.163.com (mail-m32108.qiye.163.com [220.197.32.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ECB253932;
	Thu, 19 Mar 2026 08:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910515; cv=none; b=Qj/0zq39OXENKtSfRC38AyNyUUec5myac0jWbkUn2eDLLBx1YKjo91XWAwu/8FxpY6kdUAgZHGPiev3jsLofp8Q13NMyCcXs0w9U657FQI0DvL+uh6Eyq+ZNYoKlxymyPOyhKohc6+ZwdFq85GOXCuevgCpW8PyyXP2ul9O2JSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910515; c=relaxed/simple;
	bh=V9UETcBsc/iMAnGz8oPO7DN5Ku94ztAnyNEESN2qns4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jc0gLmEF0iRyjyJiFi0thOk2uOdOjxV5DhcGB3DpHKszd4zNkq2oNASDh/g7eWWSMGEYlN9A/z6QoxHq632husw0lG6h+c5J50visHyLjGdats8INKbFHdVO9JHpgcBVYIw6tr82JvGIE7KI5wsoPq+S9Is+eg00Ky9yLt8X8S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=XjOHu9yC; arc=none smtp.client-ip=220.197.32.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 378c74a74;
	Thu, 19 Mar 2026 16:54:57 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: broonie@debian.org
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	neil.armstrong@linaro.org,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH v2 3/6] ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs
Date: Thu, 19 Mar 2026 16:54:42 +0800
Message-ID: <20260319085442.174731-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <df7c1043-c3b5-476a-93dd-572e12c45388@sirena.org.uk>
References: <df7c1043-c3b5-476a-93dd-572e12c45388@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d054e192009d5kunm41ab44a9500497
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS01PVkhNHkpNQkwYQx5MTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=XjOHu9yCce12fNhFs/mc3vHOD1JHdbKYG4kwSmojx6zE/V0+rnn1aS1WYc5R7ODgePGEH7mI89uamH/u9m3AooiUvdCA45PGoNtIOphP9qugxAUuOAGHiqpir5TnKcUIxb8GjCSlaYnEHfbNv1jEO70SPq0id/5W1oWJSKJbCow=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=DXHWz/hkVeEFSggFT38zSB37DsSzRPPNlI3Wn20h/f8=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,endlessm.com,thundersoft.com,katsuster.net,gmail.com,linaro.org,perex.cz,debian.org,suse.com,loongson.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98666-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.892];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,thundersoft.com:dkim,thundersoft.com:mid]
X-Rspamd-Queue-Id: DFBFE2C8242
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for the review!

> On Tue, Mar 17, 2026 at 04:35:42PM +0800, Hongyang Zhao wrote:
> 
> > +/* Clock ID for MCLK5 */
> > +#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x305
> > +
> >  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
> 
> These two share the same ID?

This patch series depends on a patch previously submitted by Neil.
The issue has already been fixed in [1]; I had applied the wrong patch.
I will include patch [1] in the next v3 revision.

[1] https://lore.kernel.org/all/20251008-topic-sm8x50-next-hdk-i2s-v2-1-6b7d38d4ad5e@linaro.org/

Thanks,
Hongyang

