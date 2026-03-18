Return-Path: <linux-arm-msm+bounces-98345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDbsEYNlumklWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:42:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC652B8450
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE64C30107D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AFA3822AC;
	Wed, 18 Mar 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mecomediagroup.de header.i=@mecomediagroup.de header.b="AY+3hnC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569D3859CC;
	Wed, 18 Mar 2026 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823030; cv=none; b=P4h34B8CNMb7zFvboqs+b3ASBr0O4SPVBBBfUrs6qwYNyO6qhHByQi8ol9W8o3bBAk+czi6j8Xnh/Yz/Qf76qX3JiOZi98h0Qf/qR4qJzmwQrc/+pYYoZ6n8yf9D5r7pJ/mhePlgSwa5TYFHxn0ztJamAED95edJjvhR2FVTKAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823030; c=relaxed/simple;
	bh=KGrmAH1uTyXyNrTbl1TGWouuSEucSOJOt+07xVH030k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4poThkt8bd6BNEQBEj44+agXDnJRmlgXOzXRX0fZcbDILKaqbnwLIV7deQR3xyAquDUFDDMokYONuD9K0qjdfsB7e0wWnADNX4eAN4p1mQO7QoWecZkR0FdUSGqJbBdLdc+Aa9IHEx7DwIuV97cnXnxknK3bv0t707046bBp6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mecomediagroup.de; spf=pass smtp.mailfrom=mecomediagroup.de; dkim=pass (2048-bit key) header.d=mecomediagroup.de header.i=@mecomediagroup.de header.b=AY+3hnC6; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mecomediagroup.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mecomediagroup.de
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fbMd821Mlz77Rj;
	Wed, 18 Mar 2026 09:37:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mecomediagroup.de;
	s=key2; t=1773823020;
	bh=KGrmAH1uTyXyNrTbl1TGWouuSEucSOJOt+07xVH030k=;
	h=From:To:Cc:Subject:Date:From;
	b=AY+3hnC6LCC/LVPLmyjp+fbIQK+7lGwlTtOu/K7bOSjPkbmQ2azn4b3JCgUkTRu/h
	 L1YUjaWNZTAN57qsTY5l+8iw/tp7Eh8z7CRmUMnf3iTlOfRtozX24HLdrzybiXX/ru
	 hlk4GTbkXA2ND+dnsXn1G48SLz8vx+W+7L4Qvznjv5H2ymYBSSRrOBSAbSanuqGwAB
	 N0t28HVfCVgzgiEZWQXeIES17UZjSX7uunmDre1EilpaPuTYrrJcX+WjuzZefbrhdw
	 9m4EUoR9o6XS0H/xrF77kC5zH1t7qcAMb2Vz8gWpDkAb2RmlBgBBxaNJYvw1fp1XoV
	 5qCm3GVz0D4eQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fbMd81Hq8z77Rg;
	Wed, 18 Mar 2026 09:37:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe95c.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fbMd74GPYz8tXj;
	Wed, 18 Mar 2026 09:36:59 +0100 (CET)
Received: from debian.fritz.box (ip-178-203-082-069.um48.pools.vodafone-ip.de [178.203.82.69])
	by mxe95c.netcup.net (Postfix) with ESMTPSA id 9FBBD801CA;
	Wed, 18 Mar 2026 09:36:58 +0100 (CET)
Authentication-Results: mxe95c;
	spf=pass (sender IP is 178.203.82.69) smtp.mailfrom=mecid@mecomediagroup.de smtp.helo=debian.fritz.box
Received-SPF: pass (mxe95c: connection is authenticated)
From: Mecid Urganci <mecid@mecomediagroup.de>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Mecid Urganci <mecid@mecomediagroup.de>
Subject: [PATCH 0/2] arm64: dts: qcom: Add support for Radxa AirBox Q900
Date: Wed, 18 Mar 2026 09:36:19 +0100
Message-ID: <20260318083621.470826-1-mecid@mecomediagroup.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177382301927.1404972.16337686860877317893@mxe95c.netcup.net>
X-NC-CID: it72/Sv2sCF582kIxXHp5GOrZ9HwzfHK7TBqtuL1XrAzyqvqeXGu
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mecomediagroup.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mecomediagroup.de:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,mecomediagroup.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98345-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mecid@mecomediagroup.de,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mecomediagroup.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mecomediagroup.de:dkim,mecomediagroup.de:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CC652B8450
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds device tree support for the Radxa AirBox Q900,
a device based on the Qualcomm QCS9075 SoC (Lemans Family).

The board features:
  - HDMI 2.0 output via dp0
  - 2x USB 3.1 Gen 2 ports
  - 2x 2.5GbE Ethernet ports (QCA8081 PHY)
  - Onboard UFS storage

Patch 1 adds the compatible string to the arm/qcom binding.
Patch 2 adds the board DTS.

Tested on Armbian Debian Trixie with HDMI output, Ethernet, USB and
UFS confirmed working.

Mecid Urganci (2):
  dt-bindings: arm: qcom: Add qcs9075-radxa-airbox-q900
  arm64: dts: qcom: Add qcs9075-radxa-airbox-q900

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs9075-radxa-airbox-q900.dts    | 1012 +++++++++++++++++
 3 files changed, 1019 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts

-- 
2.47.3


