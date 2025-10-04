Return-Path: <linux-arm-msm+bounces-75970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F9BB8DA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 15:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 53C7C4E3C64
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 13:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5429327B34E;
	Sat,  4 Oct 2025 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="QkKK70nl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from dwarf.ash.relay.mailchannels.net (dwarf.ash.relay.mailchannels.net [23.83.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E127815D;
	Sat,  4 Oct 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759583555; cv=pass; b=IjiFyf2U/J/JWl1tg2XU8vz3p7JYGV4+7TkxveCPh5wpI9KDbi+KdaBGo6Yy17SNMk2n7qhVcPzBH69gR5nLyZElR/qQwxLjPiccTmCqztQFx7Dz/+xdRG4I3IO1uJi6pZscMZDu4PTciyM/M84zMiP3ajHqVA4ZKS24/WeDt7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759583555; c=relaxed/simple;
	bh=SkjOwNyhSeIXzF+EvSTvsIvyCd6kGJDIqmCLJoO+ty8=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=Faj26JK1NcZD8dLyVwUw5K1luy4facqZqlj6LqjdkUavduIMtqtVlzme+FBS5TV16B0U8ZxScmGtdE/UM75XUThrLw2RS9+ilMOpT8xVrd8dF4GwZiZhmt/a+3vXxoFQqXq3M0gaGkG4YIIM4iJR7llVBsowtsbjE8rE4pHYvKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=QkKK70nl; arc=pass smtp.client-ip=23.83.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F29622E1EED;
	Sat, 04 Oct 2025 13:12:24 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (100-113-89-159.trex-nlb.outbound.svc.cluster.local [100.113.89.159])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8FD6B2E1ECA;
	Sat, 04 Oct 2025 13:12:20 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1759583542; a=rsa-sha256;
	cv=none;
	b=HXgHmfodNHcdZ48zJSLi0tNbeBIMz1uuEEFMW8gQpT9ob2ssGkRNMW8c4VNehKNFq7AfQP
	3M84R5MOW/iFeRIodWCzXGk+fibYG3CMdR4L08Pr68xwr1uqrGRPwN6pz1SS0GG8cm67Al
	KgUBBNcNFsPTWfjrwTvbxaJAuDkD/LCOhJ78V5fBOpIz1R8lonMoYUDmjIrt0MWAQBookE
	psI68ZegPxfN33hSRkJlIBKd4aaZEiHtJkpN0x0yTx+XmMCK9maAWh1D9o13fg/SKxuEnz
	WvyDfrBpQPGWAuEx8RozSswUPFkW1W6Fe7yzIRVTr9lhumvowpxVK3cnr3YOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1759583542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=7Bb11pJrqRvyIGyeK2hRQzFdl65wkQu5i385pRom0Tw=;
	b=KjOMozAlNnnrwDixdiTXZJ5ydPmhOIobXoj82gAzx+QwdP1vw6gDaz/PHGR1Sbxl+KbtP/
	+nlT7dmsuW18We/9LwbBBaLhnVYBbKOhj15RGSJiOHXiWomqXu+MuPkvPzA/nnwzX4x8ri
	vsuxBRMELTJu5M8o1ytDmpEnmByPe9KjcJ4onYhsL7s4TNiXNUXftz0gUWp7sL595rK1ww
	UgPZF1/2aRYAhOGHi2q5WXuAR5LmOTGr66qG2MOVJ0kWC/fO4mnz88f/bjEc2YOzlHLZdb
	I47kI28FG6LXMgXu8Eu5fk1WD/JHvOMAtAZmYh8zwBGcxXHfIhxYtJ2NIlDQvg==
ARC-Authentication-Results: i=1;
	rspamd-84f8cfc67-5t9vw;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Whistle-Spicy: 0dbe96610615f03b_1759583544824_861418411
X-MC-Loop-Signature: 1759583544824:1034410249
X-MC-Ingress-Time: 1759583544824
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.113.89.159 (trex/7.1.3);
	Sat, 04 Oct 2025 13:12:24 +0000
Received: from [172.17.0.2] (unknown [36.79.124.169])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cf5Xx09Wmz3wbh;
	Sat,  4 Oct 2025 13:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1759583538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Bb11pJrqRvyIGyeK2hRQzFdl65wkQu5i385pRom0Tw=;
	b=QkKK70nlJh0qKWTbyXK2hCSpGI0LBjwmpocAuLVVXtBQF5GSelvM3SKPYVBsXBSqq5G63Y
	5ZfgiIJU/DHm0NIZUx1g6p9cQklx40CHMYnP4e5PS7IEqOd6hU22KEjfulo08xLqQMAcJI
	vfhdQ4IX7TtUl7NiGsbIrqvkrTMljBq0o1RxaW3hQ4qG4eZ10GWzU4T3r1n7Hp1A99pXvG
	B1rO6/r6Wo6TZHKxBkyy8hsETr8/T0xnC+Ylt3AJFEAvmOA20sHJ7q8Twvmf55Q/Plx0tJ
	zWADLDUmbtU9FhdkGbRzAduE/48713+Ham2UcHtoNXnUT6orKUu8EpPpbHAexw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 1/2] arm64: dts: qcom: pmi8950: Add missing VADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251004-fix-pmi8950-vadc-v1-1-3143ecab99e9@smankusors.com>
References: <20251004-fix-pmi8950-vadc-v1-0-3143ecab99e9@smankusors.com>
In-Reply-To: <20251004-fix-pmi8950-vadc-v1-0-3143ecab99e9@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759583534; l=1037;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=SkjOwNyhSeIXzF+EvSTvsIvyCd6kGJDIqmCLJoO+ty8=;
 b=/l1px3Diz/GCDrwL/etPqW9REmE9YJLv/ZhxHop8uycGoOGNZQzYW80SbF/Or3C38FdwcKNfi
 EvQGFTE3wFGApRhRf80qAPTwgd0iGzNsOo18oBpTCMhmYuvKPxh3cGj
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat,  4 Oct 2025 13:12:16 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Eb6aQ+mC c=1 sm=1 tr=0 ts=68e11d32 a=aGBhDEDgd9rkiRpfI0k7ZQ==:117 a=aGBhDEDgd9rkiRpfI0k7ZQ==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=353qvsRKi1f8VIB1FV8A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfFdbIZXrvx0irvy8JrLe2HPCUekIhrv5YBvRU/T3+svWViKspvdY8ExNy4Fi6DKG08O+qm2Fv2NVNJTD2DD3J9KpRaT7ezMKqzhEIFCkfk69IfYIb3Gj qhNJDK63tcXIcSHTd0l6Sg++CcVQIaj4BFNoioWppxLtqX7IxGRVLR8a71ScvlQRjkoQ+aHFcJEzHCE/SBHL535N0CaeakhF7IgGbjSoDDJ78gxRuzatWWpP G3y89kz51qwRjR3kvJGSfmY8KFz4XinlrZCbS8gU6U3CqRpyzkAN+xLQNYXAift3rSho5QwNa6O9D8pOERbmIIJtSABac/NK0/XAyWheSZpH4iGOF96FCqou 1YjvQ55kgnCR73uw/I9Rp8S4Lz7TRSJf7Vu4ju9gpa4PHHrwikl/5/ka/NzOB/L5oO19lECdE+dM2JgxwHpJty/RCooWcFCD/j79AFZBj5LI9wuKook=
X-AuthUser: linux@smankusors.com

When booting msm8953-based devices, the following kernel message
appears:
[ 13.090800] qcom-spmi-vadc 200f000.spmi:pmic@2:adc@3100: Please define VDD channel

It turns out the pmi8950 uses same VDD and GND channels as other
Qualcomm's PMICs, so we can simply copy the channel definition from
the other Qualcomm's PMIC dtsi.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm64/boot/dts/qcom/pmi8950.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
index 3d3b1cd97cc3d04b2c5a78c06fbeb3fee3c5af8d..16e436b68a7c161b1afd4f3eac3d7d8564e40512 100644
--- a/arch/arm64/boot/dts/qcom/pmi8950.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
@@ -55,6 +55,14 @@ channel@d {
 				qcom,pre-scaling = <1 1>;
 				label = "chg_temp";
 			};
+
+			channel@e {
+				reg = <VADC_GND_REF>;
+			};
+
+			channel@f {
+				reg = <VADC_VDD_VADC>;
+			};
 		};
 
 		pmi8950_mpps: mpps@a000 {

-- 
2.34.1


