Return-Path: <linux-arm-msm+bounces-118207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rRQ9IUG8UGom4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:32:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D6873914B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:32:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=dWRL7MCO;
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118207-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118207-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C06E3096819
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A172B3DEAF2;
	Fri, 10 Jul 2026 09:22:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3273DCD85
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:22:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675378; cv=none; b=YqplZ9txm+EK/k+M0XgET4pIVCZiVN7XTD8dwQa+OZG4Le3YL/5a7TVd2nEaj0wiRqaofnlK8irMqNproFnh40FZaSawN0p9MP97BmZ7xim2pL43epjqt0eFKf8y71EfPs9aJNiM94Dt3d1hGQWKqA+6zSX6ekM+2dHWggv6pa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675378; c=relaxed/simple;
	bh=zw1mFAgdyKfwxUO/njqEe7kg2B2BmHFMBO5LtyuiIrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FapA6KqpVXC8AUu571dcCeS2vWWhKRqFs3YdQMaBhRtrqZfMleoiu9gMHZWLnKLgKah9V6byn8aaap3b5+zOq8CVH/eLSMNlL676QxBA47sRgV7XlXlHaM7VFmmML2fNt6Tu8XhHkLdXpYTGege4dCAL2p8tst7MzPJqZmPn8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dWRL7MCO; arc=none smtp.client-ip=209.85.218.42
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1601d552a8so46234066b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675374; x=1784280174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=43ADvkMGQUmy+J3D9zAwHZqQPNIWMHkG2zAIy0Ld1CM=;
        b=dWRL7MCOYZB5Zmb16RQaPELkA38J21mz5H/DwqZEIvbEJtE9FAiBupYmcCLA1zz412
         MJCNRiMfy/5hy9m9UK8FMZ99TaEfbbXx7F79YOuiNWxnDTukAO9Nb6mqYMbEi6g0PQu9
         eA+ph31N5ArQVgVmZQdLzd25gy+SaBTzVcA5R1gh5sd/zQhTuv4LQ0cSyZ7826U6kki/
         wzSV/nZK9drk7C7Q/eYVP1T6gXLkcE4FjqIStDFRsCwKx9XwgcZA/Pu9wHLor3/Hd8Uf
         oncY/NkPbM/J63TUHC4IwuQIjrG4CJw2qBu/7A8SE605T8bkie80BsVPddkADgbWAC7+
         3HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675374; x=1784280174;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=43ADvkMGQUmy+J3D9zAwHZqQPNIWMHkG2zAIy0Ld1CM=;
        b=ouSOj5hxlYTSxxEjRiHOU7FF2O80zP8/YIAcKeBTxsP2u1qRjo6YsnY+Om5tpcWw8r
         M297mnYYGzGqMV6LyZKM5vSZ1/Dqz2FE8zlmIL5OveK0raDqHBl+IzxFWjEIWKxLhJnH
         1P4NfDtF77F1TlZ2LdjRaAbUPtDBSIQGFJ35a3Ao5VSflXiU2W9pF649TopuC+OovlYm
         fzXvdknO6nXvb/GnBGY0Jw1yrSLJcp6nIYi5xskVKgoaXJDaYLf3ZK5K1nBzhh1/qNgG
         QMWBoV9yr3xkdcW4o+j2Sd9+DlR3FpOd+Tf5MXJ6aaN8QLtTIq3gTfuW1OGX+pYBUM0x
         LoQA==
X-Forwarded-Encrypted: i=1; AHgh+Rouck2NZtLTDarlRZJ+WXRQ/Ct6R7HaINIoUyj+7oqMtZOGuBNyAh+p3n7D80b7ZHX4lIRcKDjJVNSZ0nef@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe0WmDYJeDwUtKSqVEzRsGtwQpqF9RPhrHagyqXp/XuaKHhfwz
	NC1PuUjM8VGilEMTJ87VDKTU1jDsdF2kaHP97y74BA9QYWQY3tq5dgmu20TzQeL5tmE=
X-Gm-Gg: AfdE7cksLS8mj0k1XqZ8iuRIpb7UYItpkXHIyzYD66GmLfZIqqhni66L3Ebe5dpqWPD
	qC0nk5VvPqBqS9f5Qf6KiY5pugLQKyqavhCY59y8uQlFW8UnpK0PURNQC/Q/LTfsS/z8T/GCFR5
	dDrVjB++LVtW/ZMWqaE/w7X279MQbMTv7v+zmvCNgd7q8dX1hbaOpta1wihVF7nbr1KIL4BPWYX
	q8TGeM36M+DTxx3hnyjLLbmDoiymIAlpytAbIyYHY/o+YllsDjcc0/Ze0a8xcwi3ppHU+zzXIcw
	IMh6c6Nnp4f8ndTF8vpmMCNxpMnKSgfWRlFF+F/xkhmPCYhYGuELkJmeoC2BEaVwY23/n9FweTY
	JOzEh6dwIdkPWE+KQdoJqaoSx8Bsqpjnbo71/Kihq+XfOqZZGneIvDXJkjXEDc/yoKn9aZNL1eX
	l9okNBrjzDEO/eMArONuVyMIfshSgojxlcz3Gxld/TLEnLeWqOKEftUQ0W7Na+MYuWHkI=
X-Received: by 2002:a17:906:6a1a:b0:c15:db3a:c105 with SMTP id a640c23a62f3a-c15db3ac262mr328581466b.1.1783675373799;
        Fri, 10 Jul 2026 02:22:53 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add Milos CPU OPP table for DDR & L3 bandwidth scaling
Date: Fri, 10 Jul 2026 11:22:38 +0200
Message-Id: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IKUyhVxEXJh3bKdWEjBFBv
 LtRl2/x/wbKSVjhVW2QeBGVMBU0dQX+208fRnkXgzWWzLMxOMo/KPqYMcSIlgZH/kGOyUBpYuJ
 B1uvXdrc1ux/7+ZzAvh9nUbzNcQAAAA==
X-Change-ID: 20260710-milos-cpu-opp-26fb6c36be60
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=1427;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=zw1mFAgdyKfwxUO/njqEe7kg2B2BmHFMBO5LtyuiIrY=;
 b=2ygJEg8asxfZxnC971eSgSt5Ie8THGBJkGRgEb0Dqld8rZ0/r6+OqBE/HUvUiWUiS4STcBzMq
 yUyWpfLcMpSBX9sMHCDh3TL+w0L2fWGSgd+5BIlwI5sQ1bc7ExtvxRI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118207-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akoskovich@pm.me,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,fairphone.com:from_mime,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34D6873914B

Add a node for the OSM L3 on the Milos SoC and define the CPU OPP tables
to scale DDR & L3 bandwidths when CPU cores change frequency.

Tested with 7zip benchmark ("7z b") and membw [0] showing very close
results compared to disabling .sync_state and thus keeping all
interconnect bandwidths on maximum vote.

[0] https://github.com/doug65536/membw

Unfortunately there's no support upstream yet to have different
opp-peak-kBps values depending on whether the device is running on DDR4
or DDR5 RAM, which is where Milos should use different DDR votes. For
now the DDR5 values are used which are (usually) higher, but should
hopefully not cause any issues on devices with DDR4. TODO comments are
placed where they differ.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: interconnect: OSM L3: Document Milos OSM L3 compatible
      arm64: dts: qcom: milos: add OSM L3 node
      arm64: dts: qcom: milos: add CPU interconnect properties
      arm64: dts: qcom: milos: add CPU OPP table with DDR & L3 bandwidths

 .../bindings/interconnect/qcom,osm-l3.yaml         |   1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                | 344 +++++++++++++++++++++
 2 files changed, 345 insertions(+)
---
base-commit: 1db6c7d7df786928c6fb52625f46f1f856158728
change-id: 20260710-milos-cpu-opp-26fb6c36be60

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


