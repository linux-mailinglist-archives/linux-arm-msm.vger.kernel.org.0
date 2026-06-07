Return-Path: <linux-arm-msm+bounces-111543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nQp+FdTzJGooCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 06:30:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C79F64EC73
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 06:30:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thundersoft.com header.s=default header.b=IavjGIfr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111543-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111543-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=thundersoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A78301981D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 04:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547C7255F28;
	Sun,  7 Jun 2026 04:30:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m19731112.qiye.163.com (mail-m19731112.qiye.163.com [220.197.31.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977E1E5702;
	Sun,  7 Jun 2026 04:30:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780806608; cv=none; b=iOGV3n0kBnIiAvcANtKg+VdVCSuhT1c8Hw7l2Fai9dpaVQYfZnaEHddo8HzU4v5noejZHaE+rUUTlUpM+j5yIPiToG0/Fbbfe2JavyfRMItL6tls/1TnuV33DBGs/kO7X+iFdVkiSPeRMRpRi3tXTBRJGVIM/L+a70IPZ9qumRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780806608; c=relaxed/simple;
	bh=OxwqnivcpbfLx/ebkZdAv7ZGB1plfGDM+2JE87iqTmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cg8toDSQCv+TRILt2hZPyAUGBVhmjnT9Z53fAc9UGxgrfZLL+6o1WyMimRr7JTbjIf/6ECvu4qWorgT3+gbHO4c+6sbX5PjrfS+Jixyzb+X5CaZnBYQ+3QDsRI4xutebntSPLDhD2zrCM1wkIZAQjPcoWKZ9xD2IeWu7gE71D1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=IavjGIfr; arc=none smtp.client-ip=220.197.31.112
Received: from localhost.localdomain (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415e9f1bd;
	Sun, 7 Jun 2026 12:14:33 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hongyang.zhao@thundersoft.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	rosh@debian.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Move PCIe GPIOs to root ports
Date: Sun,  7 Jun 2026 12:14:24 +0800
Message-ID: <20260607041424.37142-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3eot5467yvyvmw6rckfsklmw2mh3vs4v3apqexjthg5ygksdag@j274au5cv3mc>
References: <3eot5467yvyvmw6rckfsklmw2mh3vs4v3apqexjthg5ygksdag@j274au5cv3mc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ea04a20b609d5kunmb8c2e64816262c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSk1OVhpNHh5KSh4eT0tNTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=IavjGIfrzAfqsL4pFUeSqZ0BpQBlqETfPDwIzhL/sjr6YM8Wja5NoCWWm0npN3tq7E7XdMzZpknFtCMLJswwLoUQ/GI7RGVRZOCrEBQUR9I2IX0vv89yXFBAT31QKHzxkC83uSbBgoDL580/YgCpMCOky/JcYeALvVQ84K9zCWg=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=qa8Pmy/ZNvNjX2eZuoO8c0WuJPc0n8ibS3W+WvdP1Pg=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:rosh@debian.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111543-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C79F64EC73

> On Sun, Jun 07, 2026 at 03:13:49AM +0800, Hongyang Zhao wrote:
> > The Qualcomm PCIe binding deprecates perst-gpios on the host
> > bridge and expects endpoint reset GPIOs to be described on the root
> > port as reset-gpios.
> > 
> > Move the PCIe0 and PCIe1 reset and wake GPIOs to their root port
> > nodes. This keeps the GPIO ownership with the device below the root
> > port and matches the PCIe binding.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> > Fix the PCIe reset and wake GPIO description for the Thundercomm
> > RubikPi3 board.
> > 
> > The board currently describes PERST# and wake GPIOs on the Qualcomm
> > PCIe host bridge nodes. The Qualcomm PCIe binding deprecates this
> > and expects endpoint reset GPIOs on the root port nodes as
> > reset-gpios.
> > 
> > Move the PCIe0 and PCIe1 GPIOs to the corresponding root port
> > nodes.
> > ---
> >  .../arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> Could you please refresh all kodiak DTs at once (and also move PHYs to
> the the port node).

Thanks! The requested changes are clear to me now, so I will send a v2
patch directly.


--
Thanks,
Hongyang

