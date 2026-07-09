Return-Path: <linux-arm-msm+bounces-118039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oshqFFm2T2qXnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:55:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4D73284C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:55:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CB+DYJBA;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118039-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118039-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DD4B300DEC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 14:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5520309F08;
	Thu,  9 Jul 2026 14:52:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B556219DF62;
	Thu,  9 Jul 2026 14:52:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608738; cv=none; b=LGjSSl8uVzk6Hd0/FZbjh/B4gFTW5LoWWDf3m0pm96fIYTktmi70DK8SaSZIg82ITwCMbjA2+3Wxu8aJ6HPRiiQmyYUeYHdLO8aOEGbzQC3GucmhN4As52XPK/jjvU1oIAz84cH8WN+0hk86NhBWJiLlK9ZODy5c8ZMOeY6avXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608738; c=relaxed/simple;
	bh=Bvi+eNARt4IojynIZMIQ56mGSggZiqVNZgsU8FYcSUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e4QlWnJQNBog8c+0wb3/0k/1fu4aOPT1dihZTqk65IM5dWWeNzk0qJWx3hc9/l1LTeR4lPJIJOOyIO1sG+wn2MNbqOBKJFyeeZHXZ8id7r6Pl1EAmgzAJ2TfhFCwr1exI3rfV7HsSBOFRy96EN+W2gkgf/Fw1PsK/JIy8OqKx/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CB+DYJBA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57461F000E9;
	Thu,  9 Jul 2026 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783608737;
	bh=3KFQ8VXri7aKSQPbHY93d3EKQrIvP7C1ms7uxiUgmFU=;
	h=From:Subject:Date:To:Cc;
	b=CB+DYJBAQbEcuretqTzsE4dfNn5oxefA8kkIIOyCGLidAUCpGNzjiK0zp9QGZ9vca
	 +Iv9Ff9A57P5qKlqJQ5YBGjtAiBSHRDba3hie376FZ+wpGuHUVoP/Wfmf5h2mcQoGN
	 t57AKX1AA4HGbpR8f4GFZ028wNZRywhMiabCOoNAZMFE+bAQH4JTA2+JQ9uJEwdcHo
	 uSLIRXfZmWBXyT1rrAVFV1igh7zvuZabk6ImElugNfWAsYTH52WjRMkmz1Ns1Ijy2s
	 En2gvKluFiFkMlQJ0NDnwWvwJYNssY0K265gbxzLemi6M9gxk9nkSDx0Z4GYapxMG4
	 9JlXIP48XVdZQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v2 0/2] Add support for SA8255P in the qcom-qmp-usb phy
 driver
Date: Thu, 09 Jul 2026 16:52:08 +0200
Message-Id: <20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhSU2hdeQ/DgrYjVIVCC0RCu
 LuAB3D5kvffXyBScBThmiwQaHLR+XYDfkrA1GVbETq7MXDGM5YziV09Y298g33T4Rg1Si4EKiU
 zxXJjtVGwbbtAD/c5uvfix3HUTzLDHtuN2sXBh/k4ntLd+/cxpchQWil4qcRFWH17UWjpffahg
 mJd1y92HHX2zQAAAA==
X-Change-ID: 20260708-phy-qcom-qmp-usb-8255-9986907cdbc9
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Sriram Dash <quic_sriramd@quicinc.com>, 
 Shazad Hussain <quic_shazhuss@quicinc.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2984;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=Bvi+eNARt4IojynIZMIQ56mGSggZiqVNZgsU8FYcSUQ=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqT7WedxXhVwvnP+fmW857BDhRa2xeBeNs6Jqv4
 O0ymKVhWpyJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCak+1ngAKCRAZDR20Zk4Z
 NXAyCACTpFX1X81pa9KDJSboNTClLhBnFC7RbFqoyY85ZIN5pqcvDt26VWv+ZUfxzPyesUnjOqV
 +o8j7+Nb20bHv+ESLUd4Z50ZV+8yhZNp3BvoSsvrT7Jsqpa8AY8dM4zDPM+PueXZ+zoh0MH3x+z
 OwPoboSAGsmWZExEgZgGw/gdMicyLN+N/bLRxAZ5D1EiVe6pAh0EQoy6mJnBNWX4TFN3mdl3hvS
 o6+hX0kqasmcwdAKAQSDOxWVTzVkqn7oqb3tS4SZDDOxyHzRFCtptw17W7bJUny5lXeFQFS+dU4
 ZiaUSH/SNMZReY1L8KNMhBN5pSCyFK55lUr4Jr+eVEpOUADl
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118039-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mkorpershoek@kernel.org,m:quic_sriramd@quicinc.com,m:quic_shazhuss@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mkorpershoek@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkorpershoek@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6B4D73284C

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

Patch 1 adds the binding change for sa8255p. I've considered to create
a totally separate binding like the I2C one [1].
Given that the existing binding already had multiple conditionals, I've
chosen to update qcom,sc8280xp-qmp-usb3-uni-phy.yaml by adding another
conditional for the power domains.

Patch 2 adds the driver change, which is based on a public vendor
patch from qualcomm [2].
I did the following changes on top of that:
* Use devm_add_action_or_reset() for dev_pm_domain_detach_list() instead
  of implementing a driver .remove()
* Drop the .lanes struct member since it no longer exists.
* Re-order some functions

This has been tested on next-20260706 with a Ride4 SA8775P board that
has SCMI firmware (which is compatible).

[1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
[2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0011-PENDING-phy-qcom-qmp-usb-Add-support-for-SA8255P.patch

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
Changes in v2:
* Driver changes:
  * Fix comment typo tranfer -> transfer
  * Fix print statement to add a missing '(' in the string
  * Use dev_err_probe() in qmp_usb_domain_attach() to reduce log noise
  * Fix pm_runtime_put_sync() order in qmp_usb_d0_to_d3 (Sashiko)
  * Fix runtime PM reference leak on usb_transfer (Sashiko)
  * Fix runtime PM reference leak on error in qmp_usb_init (Sashiko)
  * Reorder qmp_usb_d0_to_d3() to mirror init ordering in qmp_usb_exit()
    (Sashiko)
  * Reorder qmp_usb_d0_to_d3() to mirror resume ordering in
    qmp_usb_runtime_suspend() (Sashiko)
  * Fix error handling in qmp_usb_runtime_resume() (Sashiko)
* Link to v1: https://patch.msgid.link/20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org

---
Mattijs Korpershoek (1):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add SA8255P USB PHY

Sriram Dash (1):
      phy: qcom: qmp-usb: Add support for SA8255P

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |  92 ++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 182 ++++++++++++++++++---
 2 files changed, 243 insertions(+), 31 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260708-phy-qcom-qmp-usb-8255-9986907cdbc9

Best regards,
--  
Mattijs Korpershoek <mkorpershoek@kernel.org>


