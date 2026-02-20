Return-Path: <linux-arm-msm+bounces-93518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oId0Ezh4mGlrJAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 16:05:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CD168A63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 16:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A0AC301615D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC24F34EEF4;
	Fri, 20 Feb 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vaY3bOWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB134D93C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599893; cv=none; b=Lo8BJsu2J3io/SCXxrYnQ1oBXiB7FiTc3Y910XKmzzHewJBLYbvqIqVmPUsKZTt833hGvQX/qoOJMWms/5ewQq5+CsLSEE9KM13MdTj4h8a68Eto7pnsw4HogmFR7uFpuyY9c8ygH1Bi3kv0ko5L6zdG4tgdoviuSR4RnUIZkHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599893; c=relaxed/simple;
	bh=LSJ6iVt1fKqUBE+D4hO2jHttM0Mg6l5uyfncK8nFUsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLjENDIo8OQze9mG+H22zMhs3nXcOaIzQkkzrPhJh5eXl9UJIWpSBQeSkf3Mr97ebQPaS2zZLIp0L97qcDO5WmLm3qN9iO+PXilYZ+EjfwbXhZysbPS8TN6DpTg7zONHkdzwcxQCH7YESc/GQzZFc1C2jVRZ0Ws+EyR2LdXUiSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vaY3bOWv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so13081675e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599890; x=1772204690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rodd3MUSh6tvMD3m/O9jejBF/2t7v6lgidsmMLGv4EQ=;
        b=vaY3bOWvB8wfenM1n/uiGN6jYBQB+v/2Vw6aUutuHsP7o2gnVdyCgbUjaxVDA/AqN1
         THOf8YafjiuZhxotDgo9THQPaW76zX3xcOK5MTCIIppuz3HTWqJ2L2649vVSJdX8rgQZ
         wW6LyTMcwhqZriR+JvKxktSAqZOHWi1JplGh5NXIr3HuWBBVoWOhhr3abXznBbvzRpsZ
         2IhFu7NGsXtaabNy8w7eYDDPa3E+hdYgVKQsYfX5AMo2yriKQpx+L8VfVEiZSsDvamtU
         abIDs+wmE9Mp/ljWp8djG0S8qFcFeg4b76en8cOL0IAkf+bnsbm5NRR0OlOQwP8P78Z6
         Kp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599890; x=1772204690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rodd3MUSh6tvMD3m/O9jejBF/2t7v6lgidsmMLGv4EQ=;
        b=UwnhaklGWG0CSycuLnvQamIULQalwg5qtoJnHsLt/0y0Mho+G+sN9dXDj1gjvK8tn3
         rsQBFhowfsslfvydQCczj5LQcdq8h5hd+JTJinoXNwhfsTHBBNGwQiJ0HgDy5sj8O5T4
         gxrqQ1HZe8OwQCGV5qEmmBhm2aZrCDh+u4JARUjVQyHBkvYrRmoSj2OAbe+RM0gGxNw9
         X9i4OxWqxoKcNtRzkGWfZNkLIKat9zilVX7nrDH99u5/Gw91IxIQKCFZ6NUTDAhqz8n/
         B2YcQi0InPn5M8zY9zAr818UqJQL1TqFjv9gYqg7gDL8P5ynYbPhw6sGmjhq03/IHF3f
         fSzg==
X-Forwarded-Encrypted: i=1; AJvYcCX3FgdSwsRRPIAIuYPB9dyzSfGwS0kraza5JF6WTmGysCO56RnDnsads8wB7oMYWjLDOqrnSRpghq8OXt78@vger.kernel.org
X-Gm-Message-State: AOJu0YzKFayOhu0vcWu0KjgBJG2jcaI+OkLBV5DeFFS/i35MEAWZLExJ
	z/giLrnzHOY+lbJFqTovq+GB0DQniXsZTZ0dNBKp1Ea5wR50/ntpMQtu1TlJ613gVic=
X-Gm-Gg: AZuq6aJb2LUWIRoJlJZBDWqIwMEv93FRWxa1LQ6WVHJd0YwlrxAAsIncPv5IoY2o+ek
	xrco94XDuVCR0vSpNgqKiwfYHIpAyt48M6AVr0xrEMAI2Hlx7RDifQ/fMdHiR5FobTHJP4Bu6Py
	7Mwu3cFTLhdH7c7FTUt50WFh/bUxElOpgDE/5WZwF+wEAN8EVxbmKJfoTV27bjZi180oYp8Eln2
	TUOs/CJiB1H2nW5gM/03FF4lemPMwafmqfrc2ythDeg+E7029GfOFRzTnuLJ4TIDG0jd7m2zUYi
	8LAAA1FBKStzFAa0ToW1K+iOcwQ60L6lTBE6bv/+LeEcJ4am68hqtuoCE7qQ1r6bApHB4qa2Jlo
	R5c2jLB4/ifaL0fGL+yuH1US0WtqcABsUWn4DlV7refjiDUsGK+2yDdlqZX4tV4aJRW+g0jP7sp
	IGSRk3eyYfihK5aUmeA9OPJldtBYELbQ1MHlZxSgRgfT6T
X-Received: by 2002:a05:600c:1e24:b0:483:a21:774c with SMTP id 5b1f17b1804b1-4839e668a55mr114317005e9.25.1771599890008;
        Fri, 20 Feb 2026 07:04:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:41 +0100
Subject: [PATCH v5 2/9] pci: pwrctrl: slot: fix dev_err_probe() usage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-2-1ad79caa1efa@linaro.org>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LSJ6iVt1fKqUBE+D4hO2jHttM0Mg6l5uyfncK8nFUsY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgLvAqgpyS3WqEtzwpidrWJupURRMxHHCbYRiCH
 s2cHeQGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4CwAKCRB33NvayMhJ0VnvD/
 9JxYCAzcI+M+RYnaW+fQ5gm0DcADfB4wSW/ncXdOTNzw9LTvMkqbhtK/7qp6IsesiNZUWpif2ZiEH2
 sD0fr3RdWo6TI9uUGAsICG/mc+tHB7Gh/cp1PxprLrUhMhp3pXVcTkDF3qoZkDmK4TYEzV4I75VKci
 N+/dXI4qgpOF5T3LMvCbX7fREmTfv/rF/f3D7UrEYqaH36oer49SaEoylq0qVPnwCZzeTLjKhyP6RW
 yoYjWDKEeSF/Kf6uM2K7SAFwio4KNXa+3GI2q+d4IhFk8rG2lrVaka4OGbCRFrUZQ5X4STcq55P+4v
 gHB7ieWqafW4DQ4wd7vQT/sJvSuWk9CnYjEYcCsgR0rb9jVh5ThwVQJrERNkmOGOxwzP7hssqBqDAE
 r3i252QykXNG2nMtKhk0+4LbIecm+vxLaccSD00waLDeeoIlN/avkIvJpnQdL1pkzyKySq6UEQqrrk
 SmQYoxPeSo7mVZrSdUS88t2HudZGcHtvmL/+LMXiNExUbtecw/na81wuyhIhgCwrwfoMXED+NzNUa7
 FSnOdRPJCjd51v5reoU6dOzC2aUDV5KFeVM8EGvMeiA6B6M+6LM79Wt0/iIfEwRlHtiwfZ+occGxe2
 E09RHwUZpi8mZQ4Ju4EpL/GnLuHGdrlZFz8FyiXUabhd06ixIwXQeLHQs5yQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93518-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 6D8CD168A63
X-Rspamd-Action: no action

The code was not returning dev_err_probe() but dev_err_probe()
returns the error code, so simplify the code.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/slot.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 082af81efe25..f03debabbc73 100644
--- a/drivers/pci/pwrctrl/slot.c
+++ b/drivers/pci/pwrctrl/slot.c
@@ -88,18 +88,15 @@ static int slot_pwrctrl_probe(struct platform_device *pdev)
 
 	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
 					&slot->supplies);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "Failed to get slot regulators\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get slot regulators\n");
 
 	slot->num_supplies = ret;
 
 	slot->clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(slot->clk)) {
+	if (IS_ERR(slot->clk))
 		return dev_err_probe(dev, PTR_ERR(slot->clk),
 				     "Failed to enable slot clock\n");
-	}
 
 skip_resources:
 	slot->pwrctrl.power_on = slot_pwrctrl_power_on;

-- 
2.34.1


