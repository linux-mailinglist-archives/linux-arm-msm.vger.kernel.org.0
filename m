Return-Path: <linux-arm-msm+bounces-92380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA7iJkyVimmuMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:17:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8770711638D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE106300D4D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3112882A7;
	Tue, 10 Feb 2026 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICFCPa0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627B92D3ECF
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689867; cv=none; b=hOa/lLd3KjCpmaxuBQ34S8Rld6rAlv8+Nt9r3f1CLYv3qH8QgX1q3QdY6VmWDiDV7SZzU0kqV4qNJmy9WZ1c54W5KNqAwMBz4hhvGUmU8dlRQhFtRJAI0OJO14lIhRa3e/GD7ZcbNDKXqDFaYkbsIjsNU87hjVhbSpy4myUZHOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689867; c=relaxed/simple;
	bh=64P6TH5tCSVMwzcWGEk/Kd9i/JzKQ974GxQADdiPObM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JahyJYYMs7Su2Whp2BhPuWXZqrwHwHA3XnE/u0PyNWDN3xhChKcJhJlbqRZ9bRSfu5PgYZ7y7hcOEA9YiTbsin3a0naxQ9CvyZgEzZ3GV4cqnWumJBlmWgdwG0uAU+vfuIzkMJgyX0HwkbqqWZJOTauQZ/+riqIpVE/rvUBmw7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICFCPa0J; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c5265d06c3so678889185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689865; x=1771294665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFScp6N7rXDmSB9O1T48X3nURBntcNXjOboC9T1hpss=;
        b=ICFCPa0Jguq+DHBZh3jXNkh1xFl21X4gV3dTxDlnEX8XdkftWHCR+nnUdX68OaITwh
         rktgoiGaw8FtxzpYdZG6gjUWIapV1+HOvTg2/CxFEQhKtQ1uIxfLV4oXt1bd+MzJU7NQ
         pcEDBTDyU90dugGfYjlh37lgF4Y1pUmcF7GE/5RjsS/XyZyFjxkYkKEP57kCLKqwHZ6a
         MsQLBu2hvz3flF2iobMTh3Z9oVRRn3fPU1BDQYUfKyADPhBsAj0x9Cwzj7SpLtRNOu0W
         5eX/QXtponiIxQLrP6jYjDFxwffqTYFI3AHBKbO+kml+F7lXJNd18AhC8sg9/YuIHl00
         J6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689865; x=1771294665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LFScp6N7rXDmSB9O1T48X3nURBntcNXjOboC9T1hpss=;
        b=P2swPwqwoRqLHga+vR6t3iV8Y5cLK94i43LF051R+0ftjCcP4V5s0WY9gjHHj3m2q3
         H10Od8FwOR9i0utjPeCk65n/jARr5IKRr7ZDLMfajUmwD6JTK3BLziJyIEIWHwNzSgx4
         l6KBzGlCXE9OtPv2gbXdO6hNyR2I2sdbOSca1+sf5lIG/n2JPm7nZX1ihUr1ghqHwD2O
         WmzS2h3nrVs3l0wMuYI5tAwMalLn3+jxzMT9AWymOCE5LCCGQf19O1q+m3vupEoXYqqa
         hh7UCP+K4T+hsfCjz4vLPK0cGn9WxdO7qrku+qsP4ouZGiH7DMoptoAnCtrPif4/6qKc
         h10Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+8/dNFMRkSPBbKqMzHntG5oh3xj9XzJdMHNbPoCmnHlT5fRl0vmyvA/NZujQ0tgWP8ELRzPVFJJGofWil@vger.kernel.org
X-Gm-Message-State: AOJu0Yxei17HMcfPSTw6Y6itw9E1KHjgwPaQY6ddmCci8vez/fRTwfeA
	pm8WXcM1MplUUFZB71Dr6fMY7aBay99SovT6XkLccL8wiftKLu6JGS5J
X-Gm-Gg: AZuq6aJtc3kbsxaonhHJ5b+PLTdONQvzbLjz66BCDZX4fHaJ3jtfT4u+oNRf9tozUu9
	NQhfAcLz5cxJ9qaxRDy0yV7lQPVcdmaB39MZth1RWDwMrCaXSFtzhubOijG+jmDBAQNfZ0YkfJ4
	liUt4kyv37Y5165AZDe2tojogEBCPtiHQyVzeTHxYmw5nz29XafHd/HzIv6T7wxkzOn8eiu8SCi
	ds4eSHe9++IXYS97aJ3oipRKsfK5VhcFnjxBJQ8Lwycia/Gxneo7KEAoofwjorvy1E9gqhh+O1i
	YaWTDz/zKBhl+UI06lQeGmunZodDEjpil84cgQIgB5gCmPMmMZn7wunl5lio2AauTlRewqsR6F0
	5EwGUOfyI8JS0rGyHIQocVF5pABMcxGHzeZFyddQXKjmaBY/GpClc0y/lFP838+62GDkkSfcEbR
	tuTihT6mjze/kGRLy+LSKBGW3Xf+BM4oXcnlRN+sGFXq6w6rSoaS/8ly0fMp4yOa9IsF2kzTZ98
	23N6rFEv1HcmPY=
X-Received: by 2002:a05:622a:5d4:b0:506:7049:c768 with SMTP id d75a77b69052e-50672a2446dmr11457081cf.9.1770689865393;
        Mon, 09 Feb 2026 18:17:45 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c077a8asm91378476d6.52.2026.02.09.18.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:17:44 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: mfd: qcom,spmi-pmic: Allow PMIC4 thermal monitor on pm660
Date: Mon,  9 Feb 2026 21:18:17 -0500
Message-ID: <20260210021819.12673-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021819.12673-1-mailingradian@gmail.com>
References: <20260210021819.12673-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92380-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8770711638D
X-Rspamd-Action: no action

While newer PMICs are compatible with PMIC5 drivers, the PM8998 and
PM660 are both PMIC4. The PM8998 is allowed to use the PMIC4 thermal
monitor. Allow it for PM660 as well.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 65c80e3b4500..d2fce7f669b2 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -221,6 +221,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pm660
               - qcom,pm8998
     then:
       patternProperties:
-- 
2.53.0


