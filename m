Return-Path: <linux-arm-msm+bounces-105988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDiUNH4J+mlsIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:15:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4D84D0113
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4CA230C5139
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 15:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3D048122D;
	Tue,  5 May 2026 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nwWl9kDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E413480DD0
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993726; cv=none; b=b6wP4McbRzLNCKxeYBqAlB0T2u2zG+ab5Lakdd3Ose4z3C71iiQjJmVsN3RVB73Ohj5RHJAyO0DLvMiAtQx1X7wwm2Woruf1/aHHa9JvonniYXd9OKGyl2GYQ9iHPqpXGGja18Dcc5yE/rHlEYNUT+5NqfgRSb18T8gKLSpL+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993726; c=relaxed/simple;
	bh=yzAyyL4gIia/DyQO8L1/7HNASSwaj488nvBvkShJB90=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ErGM4VCYH6rB0/OaKVrzHsQSiXfJsojvL6wtc8P+fzgPmVmjTVtcDGSMhjAMwOoFSZHEnBRWV8S+qfn8g7sfnxU6rmIE3gPeJqnG+/wlpVWkW/Q9sH1Ae3+3FOMj4Jrn423izeuYl9URv9KQva99mVcBekD1mbxm4BWP+HeSDDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nwWl9kDT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9358dd7f79so827550066b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777993722; x=1778598522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9NW9EbCMKAr4jwAZyYJ8qS/T9Kp1AqUHQ0DCYv7dsg=;
        b=nwWl9kDTwX4TAJ9CDNf+dqm5Q93++hup8NreElnkcEZsy22ww6JshXr/9d8ft9bnxY
         y6XkIjQSg81f3nueUY0MFuHnzCN2KWeYEmFz/4/d6NKd0e2p7gPOMa72Gd+mQAnmuOpB
         9R0Dm6T1oSPQBMGaUPyj79oo3JxdjNnfN1dssTxRii2+6oaxA6XRrfDPhu7EQtz922tp
         qXOnlt/et6OB17kfZzAKF02ILuHhEbZ+t7xog5zgXjHjtBv0lpWyFRvTBRIJOoflWJEW
         psqyuhIEi5oOkhrR70gyW/eHjuRbYYdWCTuUMkQ6wG3xMkwRKlZz2j+RdZweMxhoTARX
         9exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993722; x=1778598522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9NW9EbCMKAr4jwAZyYJ8qS/T9Kp1AqUHQ0DCYv7dsg=;
        b=blFzxh+/T+HJyRRmUmn8OWSKV4bWZzBNgjS+Rv45NH+YLtIWeGp5nSRG7PWtyox+6T
         A8iqkHzn+9J8UyNKstcGFYVngAoc+LeSRkJUW0uQY4OSbS5jfCSRQZ01jtpEalx7izhc
         b0t+sgH8cgaIhGGQgWZ77MnoLqN1Wkf7Dkf+1K3xBZX6xnV4g3nrWhHgaRf/Q80xDpqG
         ZTB9/Vy+d9BkOgXL+3XRmzRe7Vrwc+Y2NcdGr0NQzEIVBYDpw6HOkCQGr50GLjI59wjm
         ZNjPG4b1w91dcdZexm39SZO/gTpoitnOTG8k8g4iDcU+tOK9YEiGHk2Cg2rTqD04+7Oa
         rIAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZiT578CYT48HTPFrBuuTmT3BR4Ms6EZ9pCZIwK4CRSnBPr6sNHP36c/roVS81JEnpA/42GSL5kaPTmFOG@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBnzILHcV+fNTkUUi9P1HrjQ1NSo2tS6ConMyBXBlkG8KymJj
	JBKDlYtcavWDGaIpStmy1Ob14LVgZbhB9/CHg8YufAMcwGUju2M6+UEBzJAIJzC+SYY=
X-Gm-Gg: AeBDiet5UoDrnl4hJSrHJRt4rVoihmeGn4nKIqYAtppLrxO4PwCxkaEf+oNw6xhNU+0
	70OzlZoYvcxcH5kZUxQY8czOIjTKlUHcvHrNkSiS+DifPJYTp7y2yWBKgyphuTdfiPN2ftVPIDB
	y2Ashp/b+SlO1ZBAeVtKyXv03JAvrBfM/2/MucDbLTg6FCW70WoV9SejyEaYVekdT13o9+pMOBB
	U8fmkuhrJOjBmqLu0S6LKTw5t9KVmIYtuQD+yXTSJZ2XcxyY2pWukjolCVH9Z23SuAmvNmbpu4+
	5R3W+v0kUpO42rXqYs9aVzvxQRxBazty86PP3KzdLA3RO3qZ3t1CrRk5XZnRpZca+NKptr+YXFN
	Ifg07Y/UN7u87Y6wHmoq2aWONDrEJB5DuWb099O/XYMJXw7NMxtDAHX+QPPoMJcbixLT89NxfsB
	qIqtr2z6IJcgh4eNwMtLEOtzSQ87qhb0zDJSZpAiNYTmn4IQf52KB3lhK+/P1cV62k9sHKWDpRU
	Hcw81of20a3KTddhK+6K5kFrAH5CIfZyaQNQzUJsIpSpgj7
X-Received: by 2002:a17:907:c16:b0:bc3:5fb1:8b64 with SMTP id a640c23a62f3a-bc40f921b13mr217567966b.15.1777993722568;
        Tue, 05 May 2026 08:08:42 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc28c4ea2casm196662266b.53.2026.05.05.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:08:42 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Some improvements for SM6350 & Fairphone 4
Date: Tue, 05 May 2026 17:08:32 +0200
Message-Id: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2prSCkSuYli046BjUtBOISaEu
 1vF5Uvef38FocQk0KkVEi0sPI0FqoMCvPvxRpqvhcEa25ja1Fpi42qjIwtqb9CF88m0g7NQFs9
 EA79/tUu/s8zhQZi/ib+R6DWXm7xrELyQxilGzp1a2mOlE1rot+0Dcw4DYpsAAAA=
X-Change-ID: 20260505-sm6350-misc-a0c3b9407f32
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777993721; l=758;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yzAyyL4gIia/DyQO8L1/7HNASSwaj488nvBvkShJB90=;
 b=AiqET+6Tco1mDdFDPH1Kq0owb3rI4lTZdE7tm0HBtFcjyRBK2JnshWJc+BosZNOczA5QpIHfs
 4lt1cEHG/HRDLrURpMKm1+Fsjh+tZZ5WcZEgq0TE2cYuFAJgfzauo50
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 4F4D84D0113
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105988-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]

Add a few missing interconnect paths, the pil-reloc region in IMEM and
correct the node name of the simple-framebuffer node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      arm64: dts: qcom: sm6350: Add interconnects for GPU, MPSS & CDSP
      arm64: dts: qcom: sm6350: Add PIL info region
      arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in fb node name

 arch/arm64/boot/dts/qcom/sm6350.dtsi              | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: 9e0898f1c0f134c6bad146ca8578f73c3e40ac0a
change-id: 20260505-sm6350-misc-a0c3b9407f32

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


