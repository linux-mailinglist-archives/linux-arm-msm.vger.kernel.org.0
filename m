Return-Path: <linux-arm-msm+bounces-95840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL1hLL/jqmkTYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:25:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 718752229AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B9C63012BF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEB43AE71E;
	Fri,  6 Mar 2026 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="02JLylCX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF373AE6E0
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806948; cv=none; b=VZZeYXvG6n/F0bKddqYVgY8uPluFtqxYyQVqprCYnOxyGSIMZBBa6i1errVcGfe5SScKm5oH7N1XPmnJC+hGwxZnhhPkkZEz/gO1GNICE5A+eHDRaR6mifqcxg1X20Kshqp7SDoB0Wy/vbASgKlsXoqCyY0t7YgwvEDM7kztjsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806948; c=relaxed/simple;
	bh=OussAjG8fbFFqG3utkJvBKqk21rJMwTmbRmYRXniP1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkEL0CwdQ6eZMPPfKZBSU0sDLcFm/9wn79QH6RsoKJtqDK5YI7pwTdYgq9onKjuDPK2iJYjBnnbQHc58tkG254PqYXY81zoFQ2UUCXBj59khQ8CGvdz0TjsFMtzxKvGKTMBtSjxJsseVsH6155Z1nc0C64tQfQwE9BGLCHMHYmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=02JLylCX; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-660fb578f8eso5847114a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806943; x=1773411743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bRAg5T4pZtJKLQH2FWdjBQ+C0/ZtIItkMAKUEibNgc=;
        b=02JLylCXu3ArYlon0fZFqKnzhA8TfA8YEqxWSFFYqybwP9nKr8t1TqLNqUCzblDMjW
         SzkgU52tHjs1nw+qIiFmh5eY1vJWFDxVj5qfEf2AFPQOS9pXrB1UY0S0+pDxbttCESAE
         TqBUaTW+ZqA89DgHJ+HRnDWHMA/reOOMc/UsrjEaHJAqNnfiD9szfT7STnVRBFaj9DgE
         KZuJ4L7n7fGtqVOpxhsb8VQoXqGgZ7zCSXL0APZOjAIZPBs/mwKa456d32hlOFJLO6B5
         hlYkPvcWesPN8cb9MBushKg6InDyIGSbRdqkhaExIFSVSI9iyggU9tMTvrZrZmkLaAkp
         s1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806943; x=1773411743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/bRAg5T4pZtJKLQH2FWdjBQ+C0/ZtIItkMAKUEibNgc=;
        b=IL7vPXhIPj0Ym2YkLbjBQzQzdxCpkCcLFDk/7VDc9KJpzyIW8r0QnNnjLhA+iZqJjm
         1jqRXD+IRRat3F28l44mWA5S1RTzMRrU/dBIwYaY2guyGODE+7e/LlWPQUrUwgz+/5iI
         pDK5uCw6SOwlipDGmPP5Rm7rBq2Jorn16/44j+/su3Ms3ON0aiuhba2CsAcZqn2EeW5X
         Yf2hRB1CinbwJ+uuMIvQP3rpD0rMXpPaECSu9Rdg9+ZFS6f/wJje7X7aGKFzD13FOfl+
         yYrh1U863XLNOiXXy5/5jUHBZ15B+cQRFk//pVOJuY91nTh/i0PArNCS2hWiw5iQAwiq
         EAKA==
X-Forwarded-Encrypted: i=1; AJvYcCUWcxrwAos7i0unf2FHGssGiDw3Cbwit+CpWGnFG3NyYbfJ7dHCaFPO8TgiEh4TJ4bIvBMP36Y6feTCzSBm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+lgDGkKt294SavnHSsUNJdFvRjpsv0Gzrw5qwKQlRjkPjx+A
	Dmhxze2P4Ghta5ZBUwCIAoGn6Cppa5GXXNxESDccqrVqX5InJaSSc+3dj2NnFsadODM=
X-Gm-Gg: ATEYQzw/+y5Kj0oRUXkl4OnfocOanBVcv/vznf0r0J3R/Hjtx08IOQGik3EGv1w2AmP
	w0rL8ssdOvRPXBG7SubWeZUPwekGI5t6xthC37AOglq1UGGIuLN0lknz4XcHeSbjyU4pkn9AB1v
	BtFaNsXa104fFDt0bHt+23yGDEGMWPwt6qcGBczLJ8Ll4UjHMKCCJctIzHdsAmRI6t9LKbQk+4J
	Ho3HTje4dj6jRVLlpsamoVCpQnhiR5Gv+SS9VuIMEdAuTmMLFrOHnPmR+bDPHpL4Mrn/lk6r/Cq
	0i4mO7GqLuUkzHHLvxBksdBuo2Cp0gaTaaOWCrOiwJ1w+sfixYnBSR0wr6JOuHCkLNvpftdFZiy
	0vz5ikKVD85KgZ+I1vmexJQ3bxvnZJA45WmIejdIVS5AySsZvUQVuViX0PKCB9ihlz4BgxEeiJW
	elTFSYkIpbAsKyQapBefLs7Pzea9AzwhKqQJHvknvzATgJUzOfkvX3y04iX9uItlOSdSoSXLnzE
	DRZ0K7xn8Jfd5g=
X-Received: by 2002:a05:6402:f2a:b0:65c:6d0:d9f6 with SMTP id 4fb4d7f45d1cf-6619d45a976mr1033867a12.6.1772806942847;
        Fri, 06 Mar 2026 06:22:22 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:22 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:22:17 +0100
Subject: [PATCH 3/4] arm64: defconfig: Enable Milos LPASS LPI pinctrl
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-pinctrl-lpi-v1-3-086946dbb855@fairphone.com>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=715;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OussAjG8fbFFqG3utkJvBKqk21rJMwTmbRmYRXniP1k=;
 b=OFivjjV4WyuTlJLQsk+h3UHX/H/piTEXQ86vP+pJ95fnEmqvIn1T4M7vpJDGZwBZDa3wHTkoY
 SJIFOZx3T5nDalppNNIRJmjHe6WL4qFhs6xu/xFRPrCb7jXsMlu9YsH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 718752229AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95840-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.105.105.114:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[144.178.202.138:received,100.90.174.1:received,209.85.208.50:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Action: no action

Build the LPASS LPI pinctrl driver as module, as required by devices
using the Qualcomm Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee85..c8e294fa4b53 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -693,6 +693,7 @@ CONFIG_PINCTRL_SM8750=y
 CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
+CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m

-- 
2.53.0


