Return-Path: <linux-arm-msm+bounces-97567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJNICGI1tGn4igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:03:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F4286995
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 166A4307EAE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DE73BD25E;
	Fri, 13 Mar 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="r+uhas9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D632D3B47C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417645; cv=none; b=uCH6jOXpAq4UhGpsvAVuSnmI3QmKW9nA/ueqP2kQ/54miofFILY8UNz/yHwSI94JBPrRIFxp1nYWqGFAKTAqCZ6jQpaCy85wx56e92wfS5g+W9yd5pwb5PmOA+x31VespEnnP9HyFHouZf1is9NrmK6g1jazpUzx011++HfTfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417645; c=relaxed/simple;
	bh=0lcl4kwg6xMYcX6I2qw/0Bb3kvOyEwVkS+hMsOdcTEM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nUx2hFtKHd2jm33o2gdn58owZTr7bPoIrSviE5EitQAM1ST/c8r/RxFzxUutdYy31U2V3jiOHLMN0yts7xPaRLFJXsSqtkmgSNPRXg/jgsvjwSGbLiIQa3iTMCR7yzpLevVrzkTAmPxixvEPVLTbVs+FG/ZAuLK6xeAfdSvBwrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=r+uhas9o; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-660a58841d4so2971765a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773417641; x=1774022441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHqknoZKE7fsrxy779b3139XeipLuzq0YFxuewlpd04=;
        b=r+uhas9oYeidnAhxYrZj9o0V/4zlIDxs1RnkrhJ23pshr1JBLUJNXCralaIRYPV44q
         4qbKm5GVgAK3HJD+FwATkWmJmvRy8LjByhYhPS35VGtenK9YstKycLXkCiw+80JWV7/f
         VWZ8QckRsNnwrVuBvjWXxuSzLT9MZ5NCT99KoODljUr3Zp2pKuwVTjj1BWZk4lTsHN47
         A3eccmsB4oIQ5nkkbwKQMGBI/yisZlCRabHTzbkQmdvdHkv3EQKiCYz24KVBnl51mL+m
         N1000uQgoaYGU0eEpp445w08IVmhiDVjdUCqChHyEGdQo1qk8Cl5mRSFL2D7iUB6xt3b
         8Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417641; x=1774022441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHqknoZKE7fsrxy779b3139XeipLuzq0YFxuewlpd04=;
        b=DfPP7IJld6Q2BXTW3zd5HGyqFwAk3JV3ZgmRrzCv5QO7rtS7L7+r98rcFqVXzPNFJh
         mlWTqio5e883oKz7ORSiNjcFYnm4GJgLOObnY9fOfo92PVxf/BrVEYpJ2pdiWNmWCQCN
         AsM0lp6myjHq5osJsSirx1szHmLOYz8sG5TP9R4X66FaLJOm+oSdbOO+wsKmHbnSqB+6
         +E4LaXNn0AHKMLKlsVQN8RmwlHviilNrIqwR0/cUHx7udRavf+XyaxM9LpL54kMewd1F
         ZkgiARTVG1XBibAup8ik4gz0J4DeOnx0nKdH59FiNeIXTwKqAW6ifCbS6M5X9FmFOKHq
         Cg8A==
X-Forwarded-Encrypted: i=1; AJvYcCUaDzSjR4P0xKb5TMYs7uMkESTe9Cg3bTAYjircF6JW+FoudExcUUidL8BtLuZ7Q0ligM9r7RYV4MPohNcI@vger.kernel.org
X-Gm-Message-State: AOJu0YygOyXrN0VKZvsrIUvbaXckCeqlnmF3kO19G3rhhbqL+zPtv6Up
	A1PehxOxH79V8K7GO7qEcPljECVjAZ88DdYYKtikzG9hLuLU58oSx6h5c/smqqAWqq4=
X-Gm-Gg: ATEYQzzYE0FiBsU5NaG6UvTxEh7xluM7xIes9qzfnGBqMhnaGh8lEVCenbvKTuVkCCZ
	kCJGMdcbHo2z4xBce4YPyE3Xi2tKwoJ+gdWs13dt3STkePf19CxaZkhWAqNfaFVyKSbqNkoH9Uk
	5CicbyISrVqCHRGCC/2GL0/UASYkXbcEnqz0fVcdmb++9nhz8EaqoMdcaEAwRdK6cNOssCmGPPf
	r1xnfQdKvVjRL6cMPBaOaF7qOO4L5RQz68czCZX1YhKLQF8IGB23Sx6kiNO0gxq0ABQWvBmqzIp
	ETBGPZo1JKgl02uKOHZcCEl1WdOOfrxNkHnWWEZSOYz4CfSNdGWWMBtfFtvZiKQmcIbp0Z+LZuj
	8qcBcZabWzpilOPAjtoq5OJCTY95oPFwyWImQIdH9aoKm+WPwPLONIkJkj7bXi/qwRYStiXuo5Z
	cgNhQl0B/cBBc3J8Pfdgsye3RCwTzqV/6sZoRwCtinqOinYcMYDugdJBJnWhIQfPGtU6CFhJeEK
	yH+0w==
X-Received: by 2002:a05:6402:3642:b0:660:a23d:4666 with SMTP id 4fb4d7f45d1cf-663babf0b28mr1753883a12.18.1773417641046;
        Fri, 13 Mar 2026 09:00:41 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb94afsm1397100a12.4.2026.03.13.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:00:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Front camera enablement on Fairphone 5
Date: Fri, 13 Mar 2026 17:00:37 +0100
Message-Id: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VcJs+6UXDAVX6W4SNOxnRajTqwI4
 rsb6vI7cP4NMglThkZtILRw5iEVmIuC+A7pRcjPYrDaeu2Mw26sMFffTzJY61B7H4isN1AOo1D
 H6z92b08LTb/SnM8RHiETxqHveW7UcrtqlOig3fcD97HygIgAAAA=
X-Change-ID: 20260313-fp5-s5kjn1-80a866aee261
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417640; l=764;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0lcl4kwg6xMYcX6I2qw/0Bb3kvOyEwVkS+hMsOdcTEM=;
 b=ovAVA3KQzaGRmmd4JKjyFPLw4kz43Y4QJcFmAvJQAJNw1pZ+a9dDk7n6jyOfMBVxb56N4zxoG
 lB9uuQn4m9cCsdZpKVScM5y/6iOHvRiz/fRgXLLPBJk3CWIlxcU3p2g
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97567-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C5F4286995
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
the camera upstream by adding a few bits to dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support
      arm64: defconfig: Enable S5KJN1 camera sensor

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 128 +++++++++++++++------
 arch/arm64/configs/defconfig                       |   1 +
 2 files changed, 91 insertions(+), 38 deletions(-)
---
base-commit: 3daa4f5dc6cc1ac1ab2f95b5b4c16bc5fb87f48f
change-id: 20260313-fp5-s5kjn1-80a866aee261

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


