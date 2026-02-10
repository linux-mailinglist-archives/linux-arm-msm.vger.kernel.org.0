Return-Path: <linux-arm-msm+bounces-92366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAAJKsiNimmwLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:45:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 168001160B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 861983012259
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 01:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59B91EEA3C;
	Tue, 10 Feb 2026 01:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fakO++OA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983B513AD05
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770687940; cv=none; b=eZkyAYwL9GKGEXxcAjThGYbd/2KxdtI44z9D10G131zEt/Zjiz5fSJo9uO0TWYei8CHr2v03Uplo//qkhspPrgCHsaaOskS2WXDeYOOc3i0SApKFYTf1q+rwWbWIvdv91XFjjc9fP6ViCj+hKEmAUmc1RXYAQXlowZ8tNF8yqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770687940; c=relaxed/simple;
	bh=cSJd7h0SOiZG9zgKCimkdXPOMGwNYUdgAMs9mJHXsWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWLH2+Jh2tKq+Ez72gYRifTIXFQM4nOsMk0zJ+4KTg1fNMVymYr0g+6CiV/xvwKZZxLvKGTrlOcuO8inwKX3sFaO4AqwM2j6hx9YzAfmX6r25vhMziblLctEVRmyM8HOtK92TgCk+mJs+Lp8zZZxykCHsgvCUMi/b8vjSKDjC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fakO++OA; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-896f9397ecdso3259136d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 17:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770687937; x=1771292737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=elsS/kGMmD0OoEVMgvfZiiYPaJsOWDl9DHfN22z7daU=;
        b=fakO++OA3N9XJZjKhyaulSZwPrfZcqvKCnRgu+LKoObVeMCkE7j3nqTocTYzr+nuZE
         Hg1VpG4ShGJBwQ3C7mYKzwBPLEqwKnBbncxTqNn99wkpYCs6CvKrr+e9eqABh2h3B7e8
         +D2OpqXT6RR3aUtQQ63lLDpbfjFSHbTBFDO78jqUHCScQSbQxz8W/LbhXLmLF0ersQDJ
         euKjOupEmlPEshzK14HJoOXwxTz5jLlG4BRZSUm2QrZicjwqnsKlr9wU33GOQ2Jad+GQ
         8AD2N6WtIYy4Dlde11Pm/1pzD2TJYzwFQPlNPBYPyVFIow2WAQCtDxSbEJApp6TL7e4a
         X8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770687937; x=1771292737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elsS/kGMmD0OoEVMgvfZiiYPaJsOWDl9DHfN22z7daU=;
        b=Etm6FcLaCem+MWgXhfHxCY/Go7g6oJVg5oN8ob/SPT4fAasZqdkXBzKEtbXjvdvLBh
         bp/9ppU58lIjje0Qy5x0wXksjwfOIXmod/KP9rrGFDa11SzJui3NOJV75XN44lLXW5eK
         L1AKx0ivxhJCXYZqiwzu/0+O5rL6lfWD3ksxZ2/SilrAibcVrjioJi2u3sx7+eVvsFgL
         hY4CKC8grVmBUQ+HMISok5j/aa/jIdnOn0Q+Q94afO/m4ae0FtFbrOtaEmYIuFTTRcJe
         0ST82envq5p6/lRpFrHmAe7MfDhp9DYQ+lG896oFifXrKBeQkGOlqsZsBvzU+mNsUyc/
         cFww==
X-Forwarded-Encrypted: i=1; AJvYcCVMYv0eYE8oeMWtnYDLeTKFpy27+2d4Xml2KUo6rrvfiyS5ZEsd8Ekq4B2XrgQSwTRDg7wuD3fXQrE5+Yst@vger.kernel.org
X-Gm-Message-State: AOJu0YzzxshGEgPs0Hekij9uhEv+8lGeswFfSK4uMdWUm16M3gxAAJ3h
	Q5TnPR536RNbN5Uy4Vms2DvgYXPC+CVnst742SufDY3hvwJFvIbHSoUE
X-Gm-Gg: AZuq6aKS6hUSP4ppK3pnPd5lvbCurt50NEpOiyx751M+eKcL9hXxFaj6WbMLfshlJXp
	O/rwDV63jj/by08p/1M+bXmjn4eoE5WoXGV5KU3tDMSb19VBZZT29nFIQlhpFBRSJCrB5YUxL+v
	ZGUN72wYACd0y7gmQnXDL5DB/A0BjFL/RBzf5oLsLLsgEYtVT2SVHF/Tu/zoVMCVx37nuh+YBcp
	82eqQk6VVUhayAACT/vSYlf0B5DajhFqndY1e+IAdKo79R/TE5sMIsTCJbdPDo50Lv2tU+m7PP4
	ZadFZUOz7qkqGcE9WRkXE1x05sebkPqeFHy4fv+HPpi0QiTpSX+Glw92kxhMXg7UKNByV95x3re
	AXyEFe4hoFtT3eL5w2Wy4lcLlTePcFEmK8iANHdT2U0KHo/NsqWkPuei92djBr6t3mBWvOM4+mL
	R7L8K7eoHPCyD00YPcPqVzjBJUrw==
X-Received: by 2002:ad4:596f:0:b0:87c:2967:fd32 with SMTP id 6a1803df08f44-8953c82d263mr190898256d6.22.1770687937497;
        Mon, 09 Feb 2026 17:45:37 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a15969sm933984785a.34.2026.02.09.17.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 17:45:36 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/1] drm/msm/adreno: Add A615 GPU for SDM670 and Pixel 3a
Date: Mon,  9 Feb 2026 20:46:02 -0500
Message-ID: <20260210014603.1372-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92366-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 168001160B2
X-Rspamd-Action: no action

This adds support for the speed-binned A615 GPU on SDM670.

Changes since v2 (https://lore.kernel.org/r/20240806214452.16406-7-mailingradian@gmail.com):
- drop applied patches (previously 2-4/4)
- specify that this constrains the regs and clocks (1/4)

Changes since v1 (https://lore.kernel.org/r/20240730013844.41951-6-mailingradian@gmail.com):
- add Acked-by tag (1/4)
- add OPPs exclusive to some speed bins (3/4)
- enable GMU by default (3/4)

Richard Acayan (1):
  dt-bindings: display/msm/gmu: Add SDM670 compatible

 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

-- 
2.53.0


