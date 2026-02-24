Return-Path: <linux-arm-msm+bounces-93972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNH8OeWPnWlKQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:47:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA81868D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8456430B92D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A4737FF62;
	Tue, 24 Feb 2026 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZllwS4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF137AA72
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933471; cv=none; b=MfQkLveDJe7K/7n2KMrqDdG53Am94bpmgS9QNxCGQsShtYkyci0qIWV5dC1l2dKVBUJXAcMSXcNbkJ4bhVkKwmXEVu4JmRwmWC6pHVpTz0QneF4utXu4i/dTQHXDr7m7TtAmcIhIOt7lIwVWrLesmnvehR+p55eG5U9BW5XJu9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933471; c=relaxed/simple;
	bh=7nZwJ5/mDw/Bq5pcI4r+2UnBmcpmvTKVB2VmpZBXyD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VanvUeak8EH/J1JCDVvrCaO7EqwkI7pMcGtDRQZA45QSTzqql9vErdmFdAX3X245V5WkA4pH/P7wkwC2OAJuI0sbzcimQkhYNmADsaM5R2pEbTmEactohpcNJKTYvRdlz4rLBRBHB8h0F3ksEuY+LKhmHzESvd3SXPa2c/k+76U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZllwS4J; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65807298140so8054066a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771933469; x=1772538269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OruxWPSlwxwYuuBWb0VVRNqJDSH2i/eUVJAg0MyUvQk=;
        b=QZllwS4JtJA757F2vuNfLTIxwvO2ySTKv3pWTTS+dIHYH6liI+Re/aXCauBtZt+vB2
         F7IMEHeu0p/+cp2Gsm5LlcicqoXn3/MJnIL867kHaUFDXVtnRLXj7ixqSnft6keOLJt6
         r2KGUqzO8WkgGvtHMZWEM8QcGWZDtKUFBYT1kzq+ER9D0q/69oAAlx0ymOWz2NuoAroC
         ng/OGeBfh5k6VgqcJ4p4Lb/U/sXztAj2xGjlq46VTfK2W2HyOuBewDmLw1Zl4Q3Rh+Hm
         UTcWCTFy3AFC5g+dpy2aCP6mk8HLDnJyaRGs45Tj52JyTwT6MFu31fJm6FA0PpC7GLNw
         8p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933469; x=1772538269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OruxWPSlwxwYuuBWb0VVRNqJDSH2i/eUVJAg0MyUvQk=;
        b=dVPkyweSQJWje96UN5CDN3vMjEWWhCpdshZh0ub+0p9LKwMHYuMNSsqHIcLPhJe6hZ
         rfPXkEIXe6Wo+Gh0AdnUAD1eHP4f6/iqtmKsEAvjUqEvdHWnX8bqW4W3WzC6iTG9HEq+
         3LQwoDD/yeQ0GTmQ8N8isg4U0Lo9D5tevlCM9vjGRf4QZaMbHsOLiv/55fykLrq2JzPw
         qOlh4Jp7uYvwbDQm+G5sfCo8Lzjz9fK0t9fuL8/s24lsz24B/wclVd00Mw4+3G/X9xCX
         orHAtdLYa9HR1AuNaqqrouWE5GtSeoDU+z7b9wxkrO0oM443FKI5bfIwDMkG2iAdezA7
         tLJQ==
X-Gm-Message-State: AOJu0Yzka5ri2JNzxIzHaZplv4IGjuHM15TvQt1+4k9c/wlXPRYsHxJf
	L4e5yaXH/VC5Mw1FmSmYHpccyaLcmr6VwGKjbLgQ+Nv6heiMMM4ETsTP
X-Gm-Gg: ATEYQzx4DdZrrkTRRbnxsnrzvKCHHi/n0hpg/20qo+QpgMAsop7LMrwQjttSGbMUxa0
	AiG7xHpHHrryVQUiA//vgdX9N3mgIJ/5HVBboUJ3+DpZxERhU+SqbJcZ6zXDN0nU8kjtjgBAV4B
	uOPYxcCcU3IlYlosY1mefGC793X89HTdvwis5WFFbZ0M7R075XEBT1/QkOxHSUg21NnbzzBrcjE
	m22qaevVg04NFXl327dcFjcXBP0GSSr4DeEnLcSF3JnuPjrlTIv80wqwPNdiWuizHxli3mk9Q9V
	o2YfEs+tK6Lw+OPx8V4Ex/bSxILgT4buVIO+d1H0LzQC+gH88vZxl1NvU6/+j2aHvMbh+auHZl3
	txUNUqCa0lYH30ck7HJqbXcBJKmw183/Ev8KQH8tgv9i3vYWB8PEPe37mqtNmB/UESgXUwksXFT
	QYd1LkL4NHueLuXvK95vpXe8QGY/Lx
X-Received: by 2002:a17:907:ea7:b0:b8e:dc98:ad20 with SMTP id a640c23a62f3a-b9081975165mr804409066b.4.1771933468504;
        Tue, 24 Feb 2026 03:44:28 -0800 (PST)
Received: from workstation.home ([178.231.112.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e8cb3fsm417992566b.48.2026.02.24.03.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:27 -0800 (PST)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v3 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Tue, 24 Feb 2026 12:44:22 +0100
Message-ID: <20260224114424.1966947-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-93972-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83FA81868D3
X-Rspamd-Action: no action

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Changes in v3:
- Patch no. 1 - no changes
- Drop unit address for framebuffer node (patch no. 2)
- Add Konrad's R-b tag (patch no. 2)
- Link to v2:
  https://lore.kernel.org/all/20260216120715.3432191-1-zstaseg@gmail.com/

Changes in v2:
- Add Rob's A-b tag (patch no. 1)
- Add explicit framebuffer_reserved label (patch no. 2)
- Use memory-region for simple-framebuffer (patch no. 2)
- Fix reserved-memory naming: make node names consistent with labels
  and intended subsystem (CVP/camera/video) (patch no. 2)
- Convert mem-type value from <0x02> to <2> (patch no. 2)
- Fix s2b regulator comment style (patch no. 2)
- Remove unused gpio-reserved-ranges entry (<32 2>) (patch no. 2)
- Link to v1:
  https://lore.kernel.org/all/20260204115645.1343750-1-zstaseg@gmail.com/

Stanislav Zaikin (2):
  dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
  arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 865 ++++++++++++++++++
 3 files changed, 867 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.51.0


