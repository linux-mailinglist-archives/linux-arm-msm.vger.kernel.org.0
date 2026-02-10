Return-Path: <linux-arm-msm+bounces-92390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFKtE8yYimk8MQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C249116534
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C716D3008089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E582DAFB0;
	Tue, 10 Feb 2026 02:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2QqwQzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFEE2DF3EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690756; cv=none; b=ZDdB3Sepa/gMNprGw1XDMZ5iy5cAa6fAuHgBn6CCst3pF857yE04sQQdcPEqgpKDfbXQCvqfF7udgXngYLzxUUi60wb7V15IhxO9GaJLr3+nnNBhxQbKTyr/HDOn70WNoLom+gcBf8XX8QaK35w6KZyaCqjO6RGWt2Myy3vmzDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690756; c=relaxed/simple;
	bh=89EYxATezOfNinwqg1JLoUYQjiSppo2jl1ZRgBBT3Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1pFHRnDbo4DSD2nvBVIHVwtRvj5Lhq5VKWI0jX/XuCIjDsmK2ZDbWcpCMZFfAWvuGrMywijORw2QwVEDyZ2Nhi3D830UB08dzTGMklO3jBMI+opkz3JgDeOeHFZG2NMeJkwQGQE5lbnryljsMjoAgpQBR4wXkyUm0/DILL+yuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2QqwQzE; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-505a1789a27so1774721cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770690754; x=1771295554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wB96g5tBmbZcB3Dn6OFX+n3pGQOYEK523R4mr+xrtp0=;
        b=U2QqwQzEbf5wEt9Qg16om1/fMsAhw5KJrry4V1Lj1gIGFmtxb4RgiUYq9FWc+b1FvJ
         oK6cVbohcWgdPnKhHYSE8wtc31JSxsho14tkzVzEzw7cVK2py7RNsMHGjOYtvokJFaHe
         VrwilpBSU7nvZMaMhFZ6NL/PGr70S19kJlLZhziVHaxartZASG02mfcWe6GmeG1JivvP
         qCeUNyRr+w87LdMMZ5DiFyCPqc3OQToV+85Fu7fWq4XU2T0zDsiwRnI1LxRZrbG5i0Fn
         PSpkkzuG40egwiLUu1FE975qNXYmM+UZGLRhYDHT/ag6zfJgjQhSgfifqSt1aWi6US+D
         BSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770690754; x=1771295554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wB96g5tBmbZcB3Dn6OFX+n3pGQOYEK523R4mr+xrtp0=;
        b=SrlrWYuHGxHn12CKosL5xlwTuZzFS4lMQI1MLbhc37MzqUoPyA9oQ99bU6oqJ127y0
         pQGbS0g8Zh/3TrvL2M7NvpTVcriu81RG3NjApeC+G8LG3ZeD+koEPgtgKtZF4PhNbFP9
         v+z1isPK1n4y/6rJI5R8u3g9JBlvS9S4lvVz+od8mMZa6KYhX1wasxkzogkdmGWnQ8IY
         9hSi2sp0EIdtshF3wdl0WeaAzUmreZDXxvApqWktR48VXCX2joNNldKc2YW8cIukD/di
         Wn2lG7Zk/ZLvJzm9SyTSj0a63gpADtUke1r18sa8HN7HqkNO0XortcPatdBtm2WGMjyY
         in3g==
X-Forwarded-Encrypted: i=1; AJvYcCUOrXiU3B5uHMVQh6vq55rpA/BAiyRKBZ+nTH+fVHXBypWNwMjOVuECiFyv3IWCwItTLrT1aUh2soig/cZh@vger.kernel.org
X-Gm-Message-State: AOJu0YznrhxFb3GsB2ipenlhH/1cE/n0W2u3lWounlOGjJCNT1rHNGbD
	3ffQ4ysU2DSFlroOuCsn+Z9mh/VA5CGrqQorIjU/nBbimBhuZBeB5wOv
X-Gm-Gg: AZuq6aIrPFoiM+K+tm64I540wt5ymtPvcpdkxLlW9dn+NWXoT2PGWli+QtvXth43yMn
	sIEifJj6QIP43Mvw0ah5KmeQMvB3cpWOkP2Y7A1KmZpd1kwtBA0MaJPJ1UsMI2Je5JB4R/dd+Tr
	iAPMkVHf7OeUnksUUxSzV10eUdI3UG7CoQGrAGXfyshF/JKS5LXgcW8Tli8j0UaqF6chK+/Ox5r
	6QnpoYLalihlTSzcGrVu7B+ZR8grBsM5ZstweANfuSpMhnlUcwgMp4ZxZ84PGSuJ/2WcD9vaHb9
	VP58IWqyE8eGUh291vcwblnEw74RFgoCwK2P4y5BwKpPbBgX29MMRG8Hn+RRihXH8SeJAFH5Efl
	k/3T+4MI4iLUvQ0EHcptWcCqxDBGjqPTzJKN4W03wXJaOAVb+i4VH3RNSHXeDKN4epaKJOr4g0D
	+eCLAJeTqrYDuQkpAMb/LSVFcyikpHunf48xj6MuXziGoI8B/+gm246RBTRIcVWy60+5QDydUFt
	doKgFK9eK2IvOHjW8k867wMWg==
X-Received: by 2002:a05:622a:646:b0:502:9e5b:2d83 with SMTP id d75a77b69052e-50639a1b166mr168701701cf.75.1770690753937;
        Mon, 09 Feb 2026 18:32:33 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392902f9sm88729861cf.18.2026.02.09.18.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:32:33 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 4/6] arm64: dts: qcom: sdm670-google-sargo: add touchscreen and display labels
Date: Mon,  9 Feb 2026 21:32:58 -0500
Message-ID: <20260210023300.15785-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210023300.15785-1-mailingradian@gmail.com>
References: <20260210023300.15785-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92390-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.12:email,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,9c000000:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 6C249116534
X-Rspamd-Action: no action

The touchscreen and framebuffer can have different resolutions on the
Pixel 3a and 3a XL. Label them so the resolutions can be modified, in
anticipation of the addition of the Pixel 3a XL.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index e925cba0381f..2e86bed9ea8c 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -48,7 +48,7 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		framebuffer@9c000000 {
+		framebuffer: framebuffer@9c000000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
 			width = <1080>;
@@ -516,7 +516,7 @@ rmi4-f01@1 {
 			syna,nosleep-mode = <1>;
 		};
 
-		rmi4-f12@12 {
+		rmi4_f12: rmi4-f12@12 {
 			reg = <0x12>;
 			touchscreen-x-mm = <62>;
 			touchscreen-y-mm = <127>;
@@ -533,7 +533,7 @@ &mdss_dsi0 {
 	vdda-supply = <&vreg_l1a_1p225>;
 	status = "okay";
 
-	panel@0 {
+	panel: panel@0 {
 		compatible = "samsung,s6e3fa7-ams559nk06";
 		reg = <0>;
 
-- 
2.53.0


