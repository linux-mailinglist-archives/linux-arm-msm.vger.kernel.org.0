Return-Path: <linux-arm-msm+bounces-117625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /7WBDVBKTmofKQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:02:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB77726910
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:02:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ye24f+Kx;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117625-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117625-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 542B1307EAEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506564611FC;
	Wed,  8 Jul 2026 12:55:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD774611C9;
	Wed,  8 Jul 2026 12:55:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515341; cv=none; b=YOBHrvH9Tn7UTrjTXVpe2xHmYA7Qvhv4BnAPF47jNoEFOFMdpanLxcZzlLfEOoHBux8UsOGBsH9/8/4m0kFZzO5uOQdLEpxQMlOVgwQkJmxYv2ooXix7eSvF7ZkcCXq0Rq3tvNOfvOcTYhLRflnJfp7PmQeU4OLpLF2ILlcXrns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515341; c=relaxed/simple;
	bh=GVKu0sKv6JR2SFwPMl2GMGykm0l1ivf7NRCnKBDggFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R1xwEy+OS817Hf9mb3f9PqEeCaA6+l3J08WFfjUvWYEmg2vhx58/cxYHmehmyXcaP5JsmFQmd6SZf6p12t7OC7ZUXYi1P0R0hiQi8w2woClZAMfALVhTjQIoReq1UpcEIsZpQ2layb+gM4zPFODi/nkloRH8BpVPb3q4x/2elx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ye24f+Kx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC541F000E9;
	Wed,  8 Jul 2026 12:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783515339;
	bh=ut3UarkY4E2iVItnOqyLBKMNCQFGt9UFxYJzpkOH7so=;
	h=From:Subject:Date:To:Cc;
	b=Ye24f+KxIRIZcYkrxtfHqyagQyY4jPqcI0Av7LPB9khBJ/6nVoGJt2VeIO9Zol2WI
	 i7C9TJ/smYnJpk8pIPqdPIeLOp3w+W7h3cnlmvNe2uNgWv6wNHAM+9tg100nGUdP9F
	 q4sv5RkzOpmAdhOKLd9+bN1Z55no+6mxVWv0aBmiUHYPajaDBTQJxmFVR7WF4dNXsr
	 JPyaOpsLGrArouu32uPl/H+u5fHjIHOXuNkOxOyKPAact9InxTYzH0g4LEik9mrXX+
	 xPqYsHv9+VMGZM6a/wPcrezGiuJoh9iv0L5AhRvLOYRdfXhXHpYvlgUsEsCYqiPhwF
	 bg9xr97jXsoqQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH 0/2] Add support for SA8255P in the qcom-qmp-usb phy driver
Date: Wed, 08 Jul 2026 14:54:19 +0200
Message-Id: <20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJbQK0XsW4oMMgYwKUDhAN4
 e5WWb7F/zsoJ2GFW7FD4k1UpjHjeimA+mZ8MkqbDdbYytTGYew/ONM04DxEXDWgs2WJ3rvKm5r
 aQB5yGxN38v5/74/TuoYX0/KbwXF8AYOpzwF5AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=GVKu0sKv6JR2SFwPMl2GMGykm0l1ivf7NRCnKBDggFM=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqTkiZMdGzmjxZQHq+vroXk75KX+Q9H0U0bgLeG
 /uB9UlOGlOJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCak5ImQAKCRAZDR20Zk4Z
 NWjPCADH7ve69Tmvl67MC++sdD5RCijoAoxlCWG5cmtcRtk54UbA6x+6RTXqY5G/nSMKRa1hEDd
 eHg8rM03dAbwBCKdM9WPmRfuF1gy7mSaTWulmkkZ3J2PTu9x6XGzFZIeD9G/8lHRGbSgycKQRM9
 AqgKzwKtmB0oM3jHlhq9By2REyaPQyCWrF4eDMZ11dygIg4bzS+Gl58tjvJDAThyC4D1KkUtksD
 QZSCjHYNrMisE9nqAwQDMcWwMGQT7V5KOqlRmRFqilFWgUBiJaGMr8RFr5XhQK0iJtrplnGDC40
 lnHDa6umkXlb4in/JuL5xFm549FZl73/VWfYcKOQ8Eomf0UX
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117625-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mkorpershoek@kernel.org,m:quic_sriramd@quicinc.com,m:quic_shazhuss@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mkorpershoek@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkorpershoek@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECB77726910

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
Mattijs Korpershoek (1):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add SA8255P USB PHY

Sriram Dash (1):
      phy: qcom: qmp-usb: Add support for SA8255P

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |  92 +++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 175 ++++++++++++++++++---
 2 files changed, 238 insertions(+), 29 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260708-phy-qcom-qmp-usb-8255-9986907cdbc9

Best regards,
--  
Mattijs Korpershoek <mkorpershoek@kernel.org>


