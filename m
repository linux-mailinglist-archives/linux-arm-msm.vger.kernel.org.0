Return-Path: <linux-arm-msm+bounces-92049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB/aGAMAhmlXJAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 15:51:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D8FF398
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 15:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46FF13046F0E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 14:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83E6426D12;
	Fri,  6 Feb 2026 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VhefWbOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393B8423A6B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389445; cv=none; b=HlbkqcWL1l2UbL282ImfM3VOyoFMdhzfWGtI/b3yOwrmoQ5sxroxouWPXThqsof7rGzXvJcxYflq1VTMGn3uGjtodDNp/repzpWmOtkTZu/fOV4VkwZWdm4UCkFV5ef1RvRqgoBYCKnrjXJmj4dqPyUMV1ZOyGAc1k628Qsa0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389445; c=relaxed/simple;
	bh=e8pzRN+C8ACMBcukIaiVpQzGH+euW8HR5vxtjI0f+Ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLONLE+15bbVv3XeIcBkecusHyFZF+XT3iAGa1ME2aI5VHwjDOFFLTL7khbe8Icncbs5bWsmDwXeun0DkjetYrm9aCmijT8DYQ/l6so/BvA9C2FBIGdv2AuYscSHbdxM4nk6/fErQSGmWXGtECWdIjAQ0XuHbFxjknhswDVdU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VhefWbOD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso19501005e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 06:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770389444; x=1770994244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+kM/Pl8XWTSE9o2j4VB9J5wVR5uzUXKqDz9HEirBDc=;
        b=VhefWbODRyqqs1/cbffLLzaIudy0cVbThRZ56gpEmDNuJ4EnRYwetQGK1oB9oxfJzZ
         06tgcv5HtjjeA7vGRnBGUboMnIrgDpaKDpJ6YKLEYP1wIAWoA7IfJqOfN3KNww9jxTOP
         7X23QkKu5jO+2hTPtSdkBZ3k8fJ4Ouf/UsSjcydSBRyyyEsCVTUFBREj6yC3YEMOEErg
         8JOOkOOP8X8cOZDEyee6NS/gI2WUJxRhLF5dhZpZ/ptGP9zsN0zGuHg2stz2IGl1vFBF
         X0DiptYjoh/AnG9RIl62lV8DmhZwTpYs1EDxie+v0m7AJfyeCqQAzC3dkHfdMxtFzO9B
         ZZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770389444; x=1770994244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+kM/Pl8XWTSE9o2j4VB9J5wVR5uzUXKqDz9HEirBDc=;
        b=iqDEAU3AWXLpKlJYa82d/XakYHZ7mIN0G0EThC/xQ1689tORmEMR1XNOoy1+F7X3I3
         MBGcwWC94+qURJLEAyMY1B+uFxDBH4WLhiNxy+BgeuZkxs53pCBTHtJk9QgppMJKiBK9
         5GXYxSSiWiZpoTvDLtj8OIVXAi2nbwRW1Hge3qliFLhX9vCYsbTz07d3gYYdwvRDulxD
         qGyCIQPSX3VXtKqpreTxPsO3hI+6Bcyd3YJTHbCdOoklZUFLbKua/ZZHvIRjyM+avngc
         1joYPONX2m10M1b4Li2Iz50R0VrvOtsYYiSD9WMbLIG1VI8AZoLmrrnd9CA/Id4YR5hv
         Y/4w==
X-Forwarded-Encrypted: i=1; AJvYcCUEREyWshqxbkU6vuxuoqS89qfzwBTClmmfx4fHlNU8on5d2dyw31z4k84aaEqOMhW5Wn9OlWu4gUJQFioK@vger.kernel.org
X-Gm-Message-State: AOJu0YxILY3jNdqFWL/eZ1ytjLYR9k+BtqtCb9xLmfQB1SvT6NgnHaSH
	bj6v2UkLnEX6sb4EaVSmLw87ScDzfXKyLzOanzXWqcGtxleV5IivAKvYrqh1qZ9tKqs=
X-Gm-Gg: AZuq6aJgfUNo92Ob9JBx5fg5LImrulxaP/JQzyRYsQlIIlQ4MiWIwd0TDQFKD1lmIKZ
	tCyGetT4XeNGjQKwp1gGo8lUkKTck/1G10BiQUmb3HGGg2nhvEIwxE074TkqY7MqQG29dSAXmOC
	jQSD/T6CuYttgJ6WcPV8RDrZzlOtAW0HuYAo7pyvFIjALdM4vmE66IeWfeG6NrQhZCiswFwwKFj
	071r7rqbaiLnT/CCmxkA8yDmRVWORFFDEV2UQ+IEXTEXxEYZ9C5T0QThwoa5bBiIFm6+Xm/iqPt
	lNiJRRNmrstu2vXyVUsrQnk5uPCWIi4yBQPLVl4fWw5bu1oAFmHW0DzJbpieCRBOBIxtQtIaxEi
	JxAK1NFXXyZed+HD7RqabWgxmmE/LNvA/iMIEO33eASQAt4DtYvfcHdCc4+c/103XfQJhgUAAZd
	QUaKVQ2WDgnxEURqijZ7cMPQ2A0FNFw/ps
X-Received: by 2002:a05:600c:3b99:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-48320933765mr34387505e9.11.1770389443497;
        Fri, 06 Feb 2026 06:50:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832a38425asm3825805e9.7.2026.02.06.06.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 06:50:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Feb 2026 15:50:32 +0100
Subject: [PATCH v3 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-4-5b79c5d61a03@linaro.org>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
In-Reply-To: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=776;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=e8pzRN+C8ACMBcukIaiVpQzGH+euW8HR5vxtjI0f+Ds=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBphf+7ir4ISpN14JC2lFkd5iPKOaXwaAK5xCsLp3Pk
 G5J/0cuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaYX/uwAKCRB33NvayMhJ0TKfEA
 DKQnR6oFqniFA6PEyth+3Dc7qExlLqa+VF2sAijV0VEuuTMTxnXDypSlYF4CSJ4cDPJugF8+mPOBGW
 XLjrM877cNJjAHiQC4e9LRyQWDTWvYrUrLW3BLRC4atjlBhV9ieK34jI/RtA8KOGM9o71nTDtS4BdR
 bh5kUKeDJSCgsBjHm+L6FJmh+DFg+x5Zy8LLq8BYtlkIdm21kBNO4mu+eYj4u68XyFOYzMRq04HaCf
 sVGkHU3kXgpFEaH5yw/P/upacgAnT/i7Uks4SaCX0uQXr9jGX7l6SfWGgKCy3t/xCrwRZJ5Cw6xrSW
 0Nodq5PrNgVLBOMZwywXnx0g++LkFEwJNYmQcRXkLuXs/+Y7p2BvVkC1MZUiq08BuqOCt21rttX6eM
 Zla2Z8LfRe7WcO74dMsR6S0kFLvNRms9ysZ2VAOtRnlvHlZXl3Gq6fiHtIL+o5SydxYOFtm5FXeLZA
 ClMTYvr62dGPPocJL3Rfn8Kg1Mf3+NZmC0YUHBmrR2RwdK3Sv5Ww+OwcxCJwUjk2VjMW5NQlW3YcJ5
 gUQDoXw31/t0MTEmVVLA4QWOXOCYvf+CZTEeHupGH4W4zMCec39luZFGvkKCnIpEY4LaCBP/kSU/UE
 QuxoB9NX6Y9JqkTDaWvYPbDpiXBrWfj/4nM/EXH4c5rqm76+fl+ehWVsbpaw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92049-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B4D8FF398
X-Rspamd-Action: no action

Enable the generic pwrctrl driver to control the power of the
PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
index 08e53243cdbd..4a57a631362f 100644
--- a/drivers/pci/pwrctrl/generic.c
+++ b/drivers/pci/pwrctrl/generic.c
@@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
 	{
 		.compatible = "pciclass,0604",
 	},
+	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
+	{
+		.compatible = "pci1912,0014",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pci_pwrctrl_slot_of_match);

-- 
2.34.1


