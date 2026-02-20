Return-Path: <linux-arm-msm+bounces-93521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOgJDIN4mGlrJAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 16:06:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E787168B2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 16:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B87693029649
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC400350286;
	Fri, 20 Feb 2026 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="alkGBNM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900534F24B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 15:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599897; cv=none; b=L+oLwW5EYsjwXW/1nkx/MF4Vrs0xcgBH4OUMloIuCUbzUwyvTs144Rye74NCyM8aY7yjasUMbou1qg9KsWMz+Fv54fZKoxF+x5Fn/0HRli1ENPG10lxYCZlbBUDfrFjZEyYoYemjq5w2e5NarLXb00bvnczBw2yY9S9hzst4j5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599897; c=relaxed/simple;
	bh=ucacCxa/mj+2F+aX6+B50wEhYPy32LXUflgKJU4wTxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGly9CaU8+mD1kzqU5f+0l4YBAbVgcHBeLxU3XM6gLyeu2Qepf3aEFDJI7+yzM4u3DkCoW2tGyYcMEtQfybLH3upxUPjxR71rVsb/J67wiu2u9L0QXePsTyvaW0UPORUf7CkJCKg1h9EUO6GY9xP4f6NWbMELww5tHjS74O8l54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=alkGBNM2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso18179325e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599894; x=1772204694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dv+SXo/Sv4fvOm9Bdd13zyWuAiiFrpYo+dzeHabNNsc=;
        b=alkGBNM2yctjUTP2a66q6aRLUKLQHmVZ9AMGL2EXkkFAU4WbcZdOSitvQ1bY4ao9+3
         VE45VQM8NkZhTGhkUhmsyC2e+aSb8qcW0hT6UznmsPWbqYjC5Iaxr4gDnqvGys+iqDQh
         lVXord/hj1IiK+3tZiWTw9ZpjyfjLKI1nnlN2+aXdDmCAPhxoULL+4hl43/xJ2mEAPUk
         n+UTAbv94OTmG/kMvEjJwAynprI2XCBJyIIWrx7ky+6/nejeu0ER9snf0YltV0NDPsi2
         5GSuiQgL5T3Gn8ElUFg8ftxEjwCHnnaTbNw3w46cV+VqdSSuJ0em1ZoGCJsLGZW7WUom
         WfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599894; x=1772204694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dv+SXo/Sv4fvOm9Bdd13zyWuAiiFrpYo+dzeHabNNsc=;
        b=qe58r+/wcqcEEXhYtLAJ+pijZiLzUJC5n/RTlmRoy6WeatSVp9Foc5Balp4kU8WoVx
         Ea5QoTKNBeqqypatS5YLkhYFHzSStf9I+lEqUUnT5rnMnITSkVpUA1QavTraVAh1E+vK
         q0AyRn6NjSRpw+OMYRZs38PmezH/yQASzEOVEyMLTcAtTAH+F63vmVHf5eaXB7/e3018
         ywQD9SvU+NReq9CV8C9KB60j5/pw2HXDP0Q/1Ta98zUKumFr43cQuIFlksU5iz+jH2t8
         x/66OzHQ/neoBG31+t2rTN9o2hPtXVkYU5CB2EGcgHA+Alc072JE888Yc7XkbWaP9oEq
         OVag==
X-Forwarded-Encrypted: i=1; AJvYcCVprOJUhe1yneeia+m/1ubdR4l+B5y4RQSQIe0Y4Mngn6/9Bxobnlq7tYq61bv4zmE0Kj8+/QjAg2W38FF8@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxtU+39W4gn0LpTDDY7m7Oc00MiEFuLhoOmCiif//b4fJmell
	+CNCwjs39UpVxmE6NhQVINDR0HMJmhj/8xFhblCgPKbHWL2YYx+R1AxAVmhA3EBzacc=
X-Gm-Gg: AZuq6aI+X3yeVOtqjie3IseTyrJ2mwgvBuPWKrwroLtAIjSdfChL4UVQXQ2dYwpPu4s
	ama6BKoCvU4d5mHD18gkIjIoULzsN/VesuVTWwRwmqJyE0ndDq4L9r5kGwmk3ECTPRhogZjmZd3
	QznslxfhrInFxzdkFNTZ9RipvWFO/EPY6NGRuKICrWKiR1J6h8VXXkthsZZAWJaCJ11nSeuP+Ys
	EvmP5nefen/0L37ymKLegtdmsdLijKCoUqTmGc9CKfvqVZnXrXe0yaGJEQXV+V8DEIbAkMOJPLi
	kZKkK06mObMmcYoln/mbEboZjbkXTdM+lKYkotseOudakzij1xm2y4R3wPKHP/AJJC7xS3lhOcI
	0OFM6DAnnhAizScVzkSk6751SJbVBlv2dXCGwfIZGKKXPqMxecbYwlny0sy5qX+0bdBcM1eQU6x
	vsz1hIb44CY2Avm7T3hdCu0kbuAOHMamNfBJiyrGDut86Z
X-Received: by 2002:a05:600c:3f0a:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-483a52b2e32mr41598565e9.0.1771599893489;
        Fri, 20 Feb 2026 07:04:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:44 +0100
Subject: [PATCH v5 5/9] arm64: defconfig: enable pci-pwrctrl-generic as
 module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-5-1ad79caa1efa@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ucacCxa/mj+2F+aX6+B50wEhYPy32LXUflgKJU4wTxY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgMWIfn4SgSHhWQnnkQkpLCpCCiDb2cJXWObnzN
 iW+G1ySJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4DAAKCRB33NvayMhJ0ZYeD/
 4mc6uejEUp9T+4+gG8RCsrT1Aa+N6h+H9ToFhbv8hKKYE2EIUPxVsfwFjc23XbA+Vny8t0VzRjLf32
 UvrTK6j2Va2XQW1aeaAHWkdWtNwCTU04fmMCyjmSvpExDUtZzQsCTCw8dNekvR+k4wQ9K1aC1bToCm
 qO/RfuveNUaLtUJKg+ZhNLzaAdSeqzSi6Bkg8+fY9ZpM3Z9goQBHMSaU02N/Xs8yweVPG64rbCYTV3
 pXV+uWbS6wKQ9l7JycKlUr/DkaXMaktIM+1v1KRRqrxUNrdmbbxgsH0UsEdNAf4qTb5yeFfFh9sApR
 zvSoIFbIdKbEJipTic08Qs66lYs6VTIr1FwKXBY8PDpepu257raCvWluryVBRLWqucprYiZ9l9XIeQ
 zjJAgTzLjKWbYTIYizKHzj+Qu+/0L6f7AxQTrq1xHalrmaZUQlaZ8BV+iu8MOPqC1/zWF0zHaQALPp
 c3cc6LKX7iXtuhIp7n8FETP1pxzn2pb1WCHtMvfjMS7Ty4NOVCb/IRraj2utZdW5Zbh9fMEtIv2Lku
 L/zSKVHXzVvDZVJ8lHo0axAqmrqlgvZUkoNpHdXqrQOxfGyPkE6HSYJFzAHAYGeZOu2QBRPY8S6LqL
 whv9Vz3NSaMt8HAT8DntqEy/ZEIdLy3lN8C779VndPbl+w7q/EqNkklsP0aQ==
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
	TAGGED_FROM(0.00)[bounces-93521-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E787168B2E
X-Rspamd-Action: no action

Enable the generic power control driver module since it's required
to power up the PCIe USB3 controller found on the Ayaneo Pocket S2
gaming console.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..0e8b62ffa7db 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -258,6 +258,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_GENERIC=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


