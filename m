Return-Path: <linux-arm-msm+bounces-105455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IqJAIxw9GmKBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:21:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB34AB43F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94109300A622
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 09:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC45B3803FD;
	Fri,  1 May 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HRaf4H39"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A31D3803F2
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627117; cv=none; b=JdfeZJdHizz8c+LQhzm+MHZsdvB9JNBzQDvPEE59snZvqo9QTvM85e6aMWiNrzN33MBK+gv+zshSHL6aCfA/zYw/AUGiD8wDtvdxE0tWkQv8GCmY2fCCmSfb2N0tRqcg4t5/AVkl1zml2/9Sx36SAr9KeBoXnnIr44kjRZ4pkyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627117; c=relaxed/simple;
	bh=WGw15wnrL3hMI5E1OHDA/5Y1FK0IInxfQr7juzg6tUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iC8wht/fuB7K2qteKMH6AsO+c+dhbFWK93wqCOoqAoKMxjoCvJRnnXL96VaWb3EJWgFGwqR/k5clniZAjW4DvOPrxybYuCsLaO8ScuxgijDbScwTZUt0kDl82qiliYiZcKBkYdZtXVNnh+4lAc/hQvVM1EfDar+MzDsmVRf9Bns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HRaf4H39; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a786a9a35so321465f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 02:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627114; x=1778231914; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDZosYsDgpbdMxXQX/sZK+i7ik/+NlYq5noK0zNARiA=;
        b=HRaf4H39WdELAQDTdStWHUY7iU3sXOISHpXwCeU9xuAI5Ulppv5hrkD52nRlTymc1g
         k98/rV7qOEg6PBNkTOWgcBWMElNg8h5cUopAnmfr9wVYe7sYFe4tHHOAUarjSTms9D2s
         1GJp3wQ/R0Tg7Wu1L/H1ny95lOzsyby9kqcjBXo5MLvtkVWRyJ8ZrGn92E7mzTH+3rjJ
         Dp110nLE+5LsdPOa2jeiKwzCGBV5DXaK05ggi+0K3Z/hL5g3Z7maR0hk4IGGy7ETmg2B
         F4RH+p4C8WT8lbVmRuLkuU4VGjWSLuqj0hTIAGUvyqWuEIrJXsOwMCAY+GmgrdxRkM4N
         TE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627114; x=1778231914;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDZosYsDgpbdMxXQX/sZK+i7ik/+NlYq5noK0zNARiA=;
        b=R4uBEtBaGrw6d4o+QlqObmICLWtS6ra4TSkExd6iWqt2iM9LalCbfFDQmx2XpXcBOw
         1J8kQPulxajCifVYS+dnBj6suLSG3hUF6qhkAGDPdjiidF17r7NRmnGySDs94NKdZ+uD
         n8areAeDcnrRrNLKopaqltH2G92dou7s5a+BYnSPRKMPcrDvHilu7z1CtraL9uY+7QkZ
         4xJXjpDzRvIVBGmdjqZaXJQ6K1W+UT2WTe6otOjjE/GAS1iQm97GGlpEwZtnrHjSt/d2
         h4CTjhz3nzCUAJ28FooDsAswWRTR0gRl98v8SIgwsp+s3WFQ7bALyzkReNDdEWx+8sxI
         dT0g==
X-Forwarded-Encrypted: i=1; AFNElJ+lBPZBIfmZWGMi9jNy9p3x3tT4mVcdxB7N8PThsXgpU+l9gvjyX42u1x+lyWFfpCn9qyBqffRkpNmwEyGd@vger.kernel.org
X-Gm-Message-State: AOJu0YyLqcpQN67oZehw0OIL1oiP+B/YOgcZBRKD4zOvRWCHj6PmPmHE
	IhyRcOnQ+bWdYFIu5emSDk/jWQnI7JWqEoLR7ElKPLO1RDQ2SKy86e9014hm2Nf2X+JYMmCC2OC
	ok6mKFSY=
X-Gm-Gg: AeBDievxhR/fBD1aiXQaacKMuFS99PJyqZDzSvO8ROPTDrxwP2V2qyqVo1G9SyLCiAg
	N7a0TB9ofgwsZwLy04lQ4vXQFc4OG0mrvbO23D+WtfviDF030FqjbOCD6xE1p+wwoFdDaMV7nFV
	d6ouI2YjO+NNLlp8beCFObtFidfJdb0uwdc6k0eJPsK9MDv+oU73xhX+W7sa/BdA2QqgkBE4T50
	/yCAiEy+O5U4M1bGL0AvISdiE6ox1qotyAOpv5lme9qzx1UDpJOF9aUTW9gBf5CBoWrNL8flXfw
	fRV0xKBHB2f084VtecvV8HACNNp+Cl9yH3VzYx05IvNxtxPu9++L2NDeMj5RCxjkddY16HhTFSH
	5ur5u1f5F2dbk8L+h3ednY/1X3CmGHh9AylBh5blRQ0vHY3it10pHNApDuVJNw+NfHZJFjMJe73
	+e1TgT5KxJveUCvFUSMMMCsMtd5feqVZTWPcRur6dNgyPO9IvNNY7Cb7i+pEzkH9drFV+xkAa5K
	EhF5L/Z+LCnyZWGlZU=
X-Received: by 2002:a5d:5f91:0:b0:449:fb9e:4b4e with SMTP id ffacd0b85a97d-44a85d97773mr3498972f8f.15.1777627114550;
        Fri, 01 May 2026 02:18:34 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Support enabling interconnect path for GDSC for
 fixing Milos camcc
Date: Fri, 01 May 2026 11:18:28 +0200
Message-Id: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQrCMBBEf6Xs2Ug21iqe+h/SQ5rs2gXblESCU
 vLvxt49zOENzJsNEkWhBLdmg0hZkoSlgjk04Ca7PEiJrwxGm04jdmqWZ0jK2dk5JTW+xdEzn5D
 4CnW1RmJ578b7UHmS9Arxsx9k/LX/XRmVVq3W44Wdx3Nne7YS1yksdHRhhqGU8gWfxpmOsgAAA
 A==
X-Change-ID: 20260116-milos-camcc-icc-d41bdff31ef8
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1757;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WGw15wnrL3hMI5E1OHDA/5Y1FK0IInxfQr7juzg6tUQ=;
 b=y9ZOv7Hz76149N7Pj/D9PMsrbeI3dZtb7wHBWIaRE92i7fwvPhqmH/Q9tyA9kVEcFZD6SwEHZ
 psNpwpDjV8pCCusCyi2SuQMqPN2+E8tgey/9b47aPVmJ9ZvLaL7FV3u
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 9CFB34AB43F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105455-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]

Some power domains like CAMSS_TOP_GDSC requires the enablement of the
multimedia NoC on newer SoCs like Milos.

Add support for getting an interconnect path as specified in the SoC
clock driver, and enabling/disabling that interconnect path when the
GDSC is being enabled/disabled.

Then specify that dependency in the camcc-milos driver and add it to the
dt-bindings and milos.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Move icc_set_bw() calls to gdsc_toggle_logic() (Mike)
- Try to make dt-bindings commit message clearer
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com

---
Luca Weiss (5):
      interconnect: Add devm_of_icc_get_by_index() as exported API for users
      dt-bindings: clock: qcom,milos-camcc: Document interconnect path
      clk: qcom: gdsc: Support enabling interconnect path for power domain
      clk: qcom: camcc-milos: Declare icc path dependency for CAMSS_TOP_GDSC
      arm64: dts: qcom: milos: Add interconnects to camcc

 .../bindings/clock/qcom,milos-camcc.yaml           |  8 ++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |  3 ++
 drivers/clk/qcom/camcc-milos.c                     |  7 +++++
 drivers/clk/qcom/gdsc.c                            | 33 ++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h                            |  5 ++++
 drivers/interconnect/core.c                        | 20 +++++++++++++
 include/linux/interconnect.h                       |  6 ++++
 7 files changed, 82 insertions(+)
---
base-commit: 9f5d28c2bae83e051ab7f807c819a634693ebffc
change-id: 20260116-milos-camcc-icc-d41bdff31ef8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


