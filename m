Return-Path: <linux-arm-msm+bounces-110761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE2KFBuUHmqdlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:28:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F762A853
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 508183047240
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17403C3C03;
	Tue,  2 Jun 2026 08:21:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327683876C4;
	Tue,  2 Jun 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388504; cv=none; b=gXk1mEQ6fEZoac2bplZpr23qmHt8u/DMAvvfhiAXxtPyc2oWT0WoF+mj210Jyi6IIsr/T8k/2yXZe2OxCt/qrNDccxS3sL0bmvJWCszr3Q5ipIcSZHHEME8AqFhOMgwHm2eYey7orAH5kC6jbqs2RVG3ASJG7+OCc4hpCX7Wktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388504; c=relaxed/simple;
	bh=ZXHDAK2tWuvFPoSMz1po5WuKZys8THR540gKspSREeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VDHSvV8dN5kNIYhil+T/TMUeI51JUdtjFqotQfn6vzF4j7XCcM9WbJtg6y5fSehK1OKHn8mtoSoEF/8qZJYR/SBeZxoqJJo7RIPqIyFSiUbUj8eTbvU1oD6v/iBv+eRO6VHi6XcF+Sipd5fzL1ilI/DcMhP5xU1Iq/8JazLHLlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.15])
	by APP-01 (Coremail) with SMTP id qwCowAAnzNQHkR5q1DNrAA--.3395S2;
	Tue, 02 Jun 2026 16:15:05 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels according to DSDT
Date: Tue,  2 Jun 2026 16:14:45 +0800
Message-ID: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAnzNQHkR5q1DNrAA--.3395S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1UWr1xtw13Cw1fAw4kCrg_yoW8XFWrpa
	1kuFZrWrn5ua13Ga40g348Zw1Syws5JrZ5ur1qk34F9ryrAryvqw1ftrWIka15Jr1fuw4F
	vw1FqryIqFyYvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUU
	U==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110761-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.762];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,launchpad.net:url,fedoraproject.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DE5F762A853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some bugs of the GPI driver exhibits a fact that some GPI interfaces
aren't available to HLOS, and accessing them leads to system stucks /
resets [1] [2].

This patchset sets the DMA channel mask of sc8280xp device trees to the
values indicated by the DSDTs of the corresponding devices.

As different devices seem to have different allowed DMA channels, the
value in the SoC DTSI file is removed, to prevent new DTS's from
directly using these broken values.

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2142403
[2] https://discussion.fedoraproject.org/t/fedora-43-44-beta-aarch64-wont-boot-on-thinkpad-x13s/183074/13

Icenowy Zheng (6):
  arm64: dts: qcom: sc8280xp-crd: set GPI DMA channels
  arm64: dts: qcom: sc8280xp-huawei-gaokun3: set GPI DMA channels
  arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: set GPI DMA channels
  arm64: dts: qcom: sc8280xp-microsoft-arcata: set GPI DMA channels
  arm64: dts: qcom: sc8280xp-microsoft-blackrock: set GPI DMA channels
  arm64: dts: qcom: sc8280xp: remove GPI DMA channel masks

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 3 +++
 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 3 +++
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 +++
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 3 +++
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 3 +++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 3 ---
 6 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.52.0


