Return-Path: <linux-arm-msm+bounces-102859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMGNF+HJ22nzGgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 18:35:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D33E4D9B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 18:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B84D630177AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 16:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5A92BE051;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qtmJvChf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEAC4A21;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011737; cv=none; b=JFiN5wpTnpLtkKdAVa5XiMbXHsUNBJOHNS8LWWcCg7WLYUeDpOiefDfvNTJSSuHQIzEqbrqMJ+Uwg7oiY2dvylI0esip2tzFwG579LD5R71CVP8YxmpOhUvzcgEm+nKxWImK6pzPc1CDxcvm2Ps+cprZvNJG7fPGcskUxOlbCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011737; c=relaxed/simple;
	bh=deJQpNs6ALPeKIlykEXREju1UIhgKemiktnv501SrPk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S6ar20RvvFWZWSdW+E47ITMNtAOq+bOnXQlxmUVtL4yjKCpU7fPO0oA1O2viJF8wcE7mPtmonPGUVgjhcPN6Z3BZUZXjPZZjQHv5/NEHKscfVK2LSLmPahjWeO7KeN1FN4iepo63WuM8jb3F/zhDfhZ5NZJFSrl2PJTIm4tfB6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qtmJvChf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50B13C19424;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776011737;
	bh=deJQpNs6ALPeKIlykEXREju1UIhgKemiktnv501SrPk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qtmJvChfsB/UHjqG5E8ZBbO5A9EWRcgI9Yjkv7hT56Q0fsvQfIVh7jVHiiqwcO8Wu
	 8mpRo+1T+t2bVzl2qLYfSOXTeG94nqUb+hOhRJzOTTqfQLd39Ru+d3xWsiGJc0Co2r
	 GEfDtmSdkxtP88Y7Fxa5IquKnLG+lwXtF2lfhl+SeNTuApLtAtQgpnWl9TEMjViPXd
	 boT28+V/N4esfE38zKSznzsp4xgAHNIA1G8HpoardU6XhWTesElPFFFdDNC9vqqPCh
	 1qNcaNzYvP5O6fMdJ3Ke1lOSGjNUxhGBdkq1jFADRAXzZI3FHmoCZUoqbwEXd5SlGb
	 GSVobepAKclNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454B8E937EC;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/2] Add initial dual front camera and rear flash
 support for Pixel 3 / 3 XL
Date: Sun, 12 Apr 2026 18:35:35 +0200
Message-Id: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANfJ22kC/32MwQ6CMBAFf4X0bE23UGg9+R/GQ1sX2USBtKRBC
 f9u0YOJB4/z8mYWFjEQRnYoFhYwUaShz1DuCuY721+R0yUzk0LWogTFR5rxVnJv7xgst8Zo41q
 lDSLLzhiwzYetdzpn7ihOQ3i88wm29VOqAH5KCbjgslFNLWoFytVHmmna+yfbOkn+dWV2K3BaG
 +scVP7rruv6AilfuTjkAAAA
X-Change-ID: 20260315-pixel3-camera-a9989bf589ee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=deJQpNs6ALPeKIlykEXREju1UIhgKemiktnv501SrPk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp28nXBFQ5zHFQaWkVRpBHA23Fh/2PO2mpxgWZW
 jvDgRaQG+eJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadvJ1wAKCRBgAj/E00kg
 cuz+D/0SS0eSY2cFa8oDl98LdvWSsh46+KqVtoaslS7Fg63HoXsJnDxpjRJHFX/v+TKgWM4/Hab
 V/f8mg/so646QfOpyBlpOM4PoZkpSdflBoR791EPWbYhAT7oEU7qZkKiRhWSrEwT3ceUUroyc7E
 eMv8X+zhkeISMjTUhiql7HPxEtjS7Zis2nzOuuS56Ih4HoZkYjVDlKw4gwgtekzZKHd2jBY86Ry
 l//7ictBJ9Z//zUO31DRrwByv8WyVmIILLXvaHISBuJuXwEHDitthtFdWEnDmhJw3OPuvW7YZbb
 /qWtTjmBoBgdYN1aArbeKLABUIN4wOJV09YElgRwJbeH5Lkr7cUCnHIqGrYXLi3hXXGU7PgZ0E4
 QvY3jVVXhPf1ypQnfT8CqL7vuSgbyVrYiM3D5z+ahXRGeNx+AnKk9f62ZqBqX1FmKKLSiavTxgc
 tc1yaQVvZSXlZ1uA1tqrd1b549C9nZR3TuxN6kdjjnwTyFEYN2hp+OduXEhbZY3xkpCGDrqO3nt
 V1Idd/ACam8ME1buPKLxcYLD78kXDqdaeJlUk4E+VGimRtx6DFJnL6KSZtHTHK0scdO5TCXSL5a
 +71OBGIfmiw8T7mO6ZyaEb2GNZpc5juLVlOZyXLnjc3OZ5QhFUFCHO35XeU9dCqfl8KiNDNT4+F
 wgrYQehnsW5ZCAQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102859-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,ixit.cz,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 063D33E4D9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe the dual front-facing IMX355 sensors (standard and wide)
and enable the PMI8998 flash LED with hardware-accurate limits.

This brings up the basic camera topology and flash support in DT.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- Dropped cam_vio label. (Dmitry)
- Move the MCLK2 pinctrl from cameras to common camss. (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz

Changes in v2:
- leds.h include escaped the initial submission. Fixed.
- Link to v1: https://lore.kernel.org/r/20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz

---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
      arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LED

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 207 ++++++++++++++++++++-
 1 file changed, 206 insertions(+), 1 deletion(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260315-pixel3-camera-a9989bf589ee

Best regards,
-- 
David Heidelberg <david@ixit.cz>



