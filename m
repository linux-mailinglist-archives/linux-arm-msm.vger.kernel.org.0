Return-Path: <linux-arm-msm+bounces-106192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P0EfFM+i+2mvegMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:21:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDB74E01EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A961E30166F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 20:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DE431355D;
	Wed,  6 May 2026 20:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K34bdA0x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFB9314A8D
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778098891; cv=pass; b=jLAioT6ZE+0XT9PL2aUN8GIEThFrNxCEP10lSHfV51yGc+UNXxnm35lgC7sBrKjZMrE3wuKzFbUj5oqR688FPBOVktv6I86B3s6T8wlavOLKh5gHtaMOdsH8T4mc+OX2jI/lYFdQPIab5mKsMGMxxmnEab+CMHhVsL+qul2A4TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778098891; c=relaxed/simple;
	bh=QAqsL+P/EADi7i+Ad2gryAbkt9BAPf51xGRCB34VjX8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iaTZ5CwcFPBi+KZCYPZaS9Mx/4QsngyALjRR7DY0E3ltF+wcJqIWhMgfzI3ZBtOWuIwSnGINBxRqULh0FGiQy/LCQEdAqWKd6dQNlTNyi6svg+C/YWnIUAAdXoHIKsxUDtzlY4w8DEvtyaDBl47PE9A5XO0WCkE24Hd7AYwIDjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K34bdA0x; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-797ab169454so489247b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 13:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778098889; cv=none;
        d=google.com; s=arc-20240605;
        b=VMMyO9Gf43aq/JEj6Tdp6DAPhgVY+xvSDhuDp6DR48h0U4iAyZvDbzpQU1Nag3c5mA
         9aityd4xWZdXGqfl03oU4SAUK0NpUzp4mXJuwzS/FE3AuVqy17gQJ211ToomCAOH9C4H
         63T3U/vPc8/Ce1Xyi2Fcnku1+yflFknQ2iUP6CxN8wnT+JTKruTjyEu+wYH0bD69My+F
         nOHNFKpmyP5QHyMAo4CURPAYmPLg71QpYDF44s8W4hNH0bA/76js7wO0JiGv4rMVv96X
         nbCT4EKFcptv7ZNh5/lvzNYBKBd8cOVC1jxp9VEFN4ArB+XENajQjTE2EGs5AZ664sCz
         VlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QAqsL+P/EADi7i+Ad2gryAbkt9BAPf51xGRCB34VjX8=;
        fh=O0+3VNKwSt8HnvdQed0CgLdbPAKBGxzSI12956SK61g=;
        b=UklaKFLkYSCUxROYMo8+qOd+icl6qbf+AJEDmD5w8DWEbo3X6LkXAFUBsVuSGuxqFp
         HIaB2Ex7aJSJLSN9E8ttiKCJOOStkL3IgBQ6Af8JJCOTUpSb3K63aqYn/TewyOwMQQx9
         zN8a09kVzwT52k2rpa4M5Z0GsJu2s5SviPVIURQ6sMpU3VCMNFDsFRr/WTLGz9ER4/Qq
         1fEGWNmeaFz9x+1jWreD0JeNvK5h6Kgs0+GLEWlhiR4Rit770oX08BdnV5mnOxZPdZ+j
         VMftG4T5bMrGtUn9XsIypPf7UwHCJ/t6Ne+dNFJGX3DtzM9fLdh2nrPB9HbBOVykEVVQ
         WshQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778098889; x=1778703689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QAqsL+P/EADi7i+Ad2gryAbkt9BAPf51xGRCB34VjX8=;
        b=K34bdA0xZfjembZQ0UZFzUqgKEfqLXMDfVZciVNVIK/sgWYAsedwcOTRB2pXOoNmrR
         wTQZUHuIQLxrtIUDo/ZX0d6Up62i9gXC3oQGiaTtG7N/Ne5jYbLM6PkKs7iREEF4+KvQ
         qVNrIzPztwnxlY55D7wNHFkNCQDsSoMNBhaCf0Htfl2EOUiWcOlPTYFIQVcHXgMaCE84
         GtsNWn7QhNBdQ/LKnFirEPDRlbCfYZMBCvvMGZkiF3K0yAlHyFtwmzeCKKYowRbzp4if
         jsqUeZFEt6A1o+C0TdgTJYnm4rTWy9qcGt0+Ilpd09Yh3aSkYsLyRDyPT/jfJTzl84W4
         SjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778098889; x=1778703689;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAqsL+P/EADi7i+Ad2gryAbkt9BAPf51xGRCB34VjX8=;
        b=ATkmPkCXsV1WNB4t4EPbCT5oCUy6GyIcGmoardTXymYjAMoZ4GR5kbgqZ1+i7GQT2W
         KLBAOaB5tuA2ridB9eSJ/A0qTu+NfjQI6p1orABaZg8R1Lv4BxA8aNLTvRJ/Lb2YRZLa
         7iA/XaW4R7iMZuvdXlEkb7EbMfj9PCL67E6WD7HhjChk6uGeFWbqUL5OhxlEhl3+PmLP
         TtYMTlOz1jgfGcnxyUgqsyUdxyqes1SnFcDU3qtli7C4DgFtYhGdH6h3PuJzBGxESeoe
         gLEw9Q19wpem4U0xN+oiNvlAMJ+98wHDE3sWdjYXprZT7XiSC+2jjk+84+4uX5jjtAqv
         1nZg==
X-Forwarded-Encrypted: i=1; AFNElJ/7R7sKSf+NOWjb3fbOjxHQuRlCPbdeBxXwnJGDqLA+uEu3Bk1TEnAbKNlHzKrCwPuzZ/KPd7GHHKsjz6qj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzwp4I4wf2TbNcIVfcEDmiW9mq3m59vsBYzhmCIuW8LmclVnnv
	si+5tbkTtlGz8n4jZ8YGR8vfSkOOiLe9GqXNFuhWG4RLQNapTQ+p7RNk7o5NwQPgKzYE1xKkFip
	CR8E+I1lNl8X+a3nKNQ1QESlyGUs1yRE=
X-Gm-Gg: AeBDietXsXEnFP0oxz7xdbCQA+G0qiKnKnoI4bxodkuuUKQZd15iC8QBgP6AOG7E2Yc
	dB1neylxfPmQCdncWdco+2/sUc7nDgUziYW2XRe7n0abkdLONlbhnmcsZu87C55m+JVN4+B//4z
	2P4GvYpG/mDOfxGnlwxLU8srEGWKmDH1DSUGhGSsg5urG8xsFAJB75vcaUVGkDBWwnhoK+nFISI
	Z8mu28uEypR2hqYhvQPdz6kbOPUCrJ8A+lpM9si2Q8BOh3oiwv61bM7Z7tzGDKUfMG7IruuBNVw
	vKc9Xm8+22p97xvSQk1EzHH84j5HJ2s=
X-Received: by 2002:a05:690c:92:b0:7bd:8752:cdc7 with SMTP id
 00721157ae682-7bdf5ed03edmr57314817b3.39.1778098889546; Wed, 06 May 2026
 13:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jorge Mayorga <mayorvlf@gmail.com>
Date: Wed, 6 May 2026 14:21:17 -0600
X-Gm-Features: AVHnY4KmODo-emmWNrM3WYgqpixKknjVjoIsDpk2RHha45bWNLj5eq5bXX3aMmM
Message-ID: <CAGK_M0RWxDBY4CP-M9PxMf2codLim-xXdZ4BH158vW+FTq+8Ng@mail.gmail.com>
Subject: [BUG] EM9293 PCIe (MHI) WWAN RX path broken on kernel 7.0
To: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: BFDB74E01EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106192-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mayorvlf@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

Hello, We are observing a data-plane failure with a PCIe-based WWAN
modem (Sierra Wireless EM9293) using the MHI subsystem on Linux kernel
7.0. Environment: Kernel: 7.0.0-15-generic OS: Ubuntu 26.04
ModemManager: 1.25.95 Modem: Sierra Wireless EM9293 Bus: PCIe (MHI)
Driver: mhi_net, mhi-pci-generic Issue summary: Two distinct failure
modes depending on protocol: 1. MBIM mode Interface created: mhi_hwip0
State: UP, LOWER_UP, POINTOPOINT, NOARP IP assigned correctly Traffic:
TX packets increase normally RX packets remain near zero Ping: 100%
packet loss Counters: TX: ~15000 packets RX: ~7 packets This indicates
TX path is functional but RX path is not working. 2. QMI multiplexed
mode Interface qmapmux0.0 is created Traffic works briefly Interface
is removed shortly after connection Interpretation: MBIM: control
plane OK TX OK RX not functional QMI: data path partially works netdev
lifecycle unstable Low-level interpretation: TX path: host -> mhi_net
-> modem OK RX path: modem -> mhi_net -> host FAIL Additional
observations: No routing issues No firewall interference No userspace
misconfiguration Same failure persists regardless of routing setup USB
(cdc_mbim) works correctly on same hardware This appears to be a
kernel-level issue in the MHI WWAN data path. Likely areas: mhi_net RX
handling downlink channel setup rmnet/qmap lifecycle possible race
condition in netdev teardown Request: Any guidance on debugging the RX
path in mhi_net would be appreciated. Also confirming whether current
MHI WWAN support is expected to fully support RX on PCIe devices like
EM9293. Thanks

