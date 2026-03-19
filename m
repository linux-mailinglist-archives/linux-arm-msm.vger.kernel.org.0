Return-Path: <linux-arm-msm+bounces-98657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKYOLqayu2k8mgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:24:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E302C7D3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD22430229A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3373A9624;
	Thu, 19 Mar 2026 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zPY0WgJP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F633A9619
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908613; cv=none; b=Lb+070+hB82EOsYoz1ofC/hvT1VDyDzond8JRZALoT4pfva2f8YH1adeOhzSBfocblAGKHTINGko9zoSLKBhAZxR79q+6thzLZH8521pmFFojINYJ80QnUzOar0NQsdV51U4xYbmIo6E/UC+Gmyk2ZMmMCLEyRtP6dZWPn5SBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908613; c=relaxed/simple;
	bh=8OUjEf16Sv4c06kAyALyJjDjDtzADbHjUj8tHoIjBcg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u6h5YAyXbu9+ebp3pLxrjtThYj7onSkpB7voD40GKqDktJd+x8z0ev6H/Y067Sh0/bZhvNKeI5KD1lyzFVnUfPh0R0LqE+hU9h50gF8fF72huaoGCqRzbbgtvVv6Yh1hcoSubHhMUXJAoDuY0WdCFfWAvZYns15GJU7t1dCzcOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zPY0WgJP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66847de014aso744347a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773908610; x=1774513410; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKUgfeQ1rM3ElFvN8WXZfRxgDUTYTxbBCS1OUwiotCc=;
        b=zPY0WgJPQ35eZ3Aes7F1QWi/87cbzq2C5pypBhKLKHCiPgiAHTpbafuheH3ewp1HUn
         eJYb2CcWMFxCGdd2qqskA8cGZjO/9nBT/6NCVycZsFnP5nA8aMFZit9NvprJEwFT06ax
         mlBVnWZ5r2fliQPFoGIOhYnTcXtmlY0gUkeCqv6x2ZtTCJtC7r+EP7yBhYSUztA8vlLs
         AB5gtzr7/b1oxPk0FUP3JpJ+2iolX2KW3ptMw103ypIFsiAtz/horaXe966Xc9IUND5V
         MGcaOav2sT33sqGeBhGBFdRBvjX+fQxFDRcQUJnmhZe2s0/VYw/wTetExff/8DMnfqEP
         mjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908610; x=1774513410;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKUgfeQ1rM3ElFvN8WXZfRxgDUTYTxbBCS1OUwiotCc=;
        b=YDcypz+qm47psYYy1vW1cx+QU9g+6fcsjqfX9eEB28oLeiy2ftambYmVoNbLcXImqC
         zVC8bBLl1eOoXvCmfLGUoDtxB8T7b3jUXYVIeWO86TJgnLXEoSV5KAUvUmxhDLqUugsl
         I/tHuEz+bofc2htvraEjFFmGSFUy0THnF0QcD71WfC6bYgWRIDXzsHCY3hlIiL91xTat
         Ye+50j+CaFlY/kobhlTrn3s1Sr9JEAcVqdNDdZi+UfPX79kUkyun6S2CCGo+VtpqvNkw
         OEQK9HO/p18rcqixmkuuAaG6Hmn6dpfilFAagGeh/VW8TfRTASmViE6tSLYO8v7Gnbiw
         cc2A==
X-Forwarded-Encrypted: i=1; AJvYcCWsgrzts5QfPOj6qtHfiB3BhbpDH/a5xpXq1411TYLCayEGNPVcOwZuooXZ8F0usLENKI20xCSxtRv6gR//@vger.kernel.org
X-Gm-Message-State: AOJu0YxZIaEW8is++R5i4qaeHBBlruC0qaZRwo6U8WmVEFBWIMV1oZgY
	LZyVyUkPBr12Axrn5Eqvl+pnfWt/rOUA/qKoK1/Ft1fS5d9db8ZWPjapH6Abxf10VJU=
X-Gm-Gg: ATEYQzxwgWyIR7l+eUxb/B+0iv/uij/gNbUIm6mRq/BOki0h/Re9zkZ5EiEmDodGwyz
	zl87RBZdfe1+H7dIjoA0TR4NhDykL9y3FsAzAGYPxfOzKw7VfaEf2Mufn6iZUoUdJ2V7WlXgDmn
	GScLRJPQwR+JpLxaMDGZMlA4+gNovX8t7tTpWYPRt28DP5nInqX1UOHuZmFGNsL/agP8sBnm+9u
	Xm+7sbr7FQ5kMwakoztPknF8uktZK58IU3lxzM9ylrOU60U7tDR+8J3TpcidnZWeQGR/oKOc502
	8ZGdoTArqyX90ymujEsAZC5phtBMj8H+Bi4RJPtKZfujDiyPBNrY/6R8WTHndzo3Kvs8o1eWQVy
	rn+vkcU0npagnZbHw75NhmjdlfT6S7voY+pU2aBql7VjIXuULNKLX21h+TgqzDaWXCEABgX994Y
	y1nkzIMU7nw3nVHpQV24i9hPihhPfTZ+wrNwWzs+Ia0csV3YYftId6gg9i5fWiz4LF19CP7Jlg7
	fdMtw==
X-Received: by 2002:a17:907:3cd2:b0:b96:e0b1:ccf4 with SMTP id a640c23a62f3a-b97f4ac5c3cmr415327566b.47.1773908610177;
        Thu, 19 Mar 2026 01:23:30 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142cf16sm419743066b.20.2026.03.19.01.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:23:29 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Enable UFS support on Milos
Date: Thu, 19 Mar 2026 09:23:17 +0100
Message-Id: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12OQQ6DIBBFr2JYlwbQiHXVezRdIAx1kioW1NgY7
 16KXZgu/8+892clATxCIHW2Eg8zBnR9DPkpI7pV/QMompiJYKJknJW0w6cLdLKBysY2RspCK6l
 JvB88WFyS63bfs4fXFJXjXpJGBaDadR2OddbDMtKkzXlFvkCLYXT+nX6ZeSJ+s/IwO3PKaHmph
 GoEM0zpq1Xoh9b1cI7uZJrFgebiSItIm1xDYUtuWc7+6W3bPuf85gMVAQAA
X-Change-ID: 20260106-milos-ufs-7bfbd774ca7c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773908609; l=1012;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8OUjEf16Sv4c06kAyALyJjDjDtzADbHjUj8tHoIjBcg=;
 b=lcyO/YyTDYQvlFsL9R2tkX9hgH7gkjIBuoyMaUdqITm8HaxUK+opvZ76XJu4TJHSx8T2KOuqO
 OXVPilTNok4CyTjB5OBzZ17qnOAa7x06q8WTSZ0959ViT+qJ0cYz309
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98657-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: C5E302C7D3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add inline-crypto-engine and UFS bindings & driver parts, then add them
to milos dtsi and enable the UFS storage on Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Drop applied patches, rebase on next
- Link to v2: https://lore.kernel.org/r/20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com

Changes in v2:
- Add missing dma-coherent in milos.dtsi (Neil)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: milos: Add UFS nodes
      arm64: dts: qcom: milos-fairphone-fp6: Enable UFS

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts |  18 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 129 ++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 3 deletions(-)
---
base-commit: 54526d6c29ce58d5399cd4e2237d631266ebaaef
change-id: 20260106-milos-ufs-7bfbd774ca7c

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


