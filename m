Return-Path: <linux-arm-msm+bounces-99977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDL6L8SLxGn50AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:28:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6059232DDBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 901DE305B586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D72370D79;
	Thu, 26 Mar 2026 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmVPmPML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF4F37C11D
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488491; cv=none; b=qcxKsiLllj5fPZxH22PCj9pI8v4DdnzVLPB1Dh7KT0HP0FikR4kACOfx97QyR/+/dn4n9SYh5dq6SlfKwkThYTy1o5cxDt6jgqmjFnbwksQq7WFtbd8qA4v5xdm8JbWA7VAZU5F/uLMKxOK3U4c9f6apA7KWef5QNGCdLNE2OOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488491; c=relaxed/simple;
	bh=RysHVq0N4+YzTb4e9cFYCnf19hquCbv9aui7fBhcLT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYTWmUUVL2lkDVNa/76YwvZwQ6yujRObD5MuaMYiZUTXKpMnISs1uE1ltzjIunDkPAdOj3z72qK5BVMGYXbzGZzKCh/eI2u/tF4351by+8dzrXT0fBiTtOQXwvNp+sJvzR3VRhGzulvzugyx4AhObh3P63ZN4PyDS+xFKlVe9VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmVPmPML; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b87970468so364311f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488488; x=1775093288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqJm1xZwLehDeiB9ZhDe2YZdoSqbYfjYIEA7QeOvbXQ=;
        b=WmVPmPMLg5cHLA8iedgfnYlvZlnh/EKxSoE/DD0UeeIjOpsf7893oZTwou3ltuyVdq
         TRhHyZDASKyCL6Dk8bHs5tNHImjs0tNstchbNlcnHlPBkri+mpsB7yTYhftiI3Hy0lb7
         YOHzBqZsH0DoiGw2xQAoBhGUGLNlxRPNmIGIG+TUI3Rpog4xNwqIWJQmCEOPIQJ0x02s
         G6F4zUlTnwd/PenIRi120yhYAvmQrA06l0XKPH3s36fR0m0zztEX8TuixjL0MerjGCv8
         PiGcvnJcH+aFzkxMHim9gPhYeHgYhUkMT4Eo513QRs2IuJaJKA4rL6vkqtmyZngv6h/p
         zYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488488; x=1775093288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqJm1xZwLehDeiB9ZhDe2YZdoSqbYfjYIEA7QeOvbXQ=;
        b=X2tnwbiOK7o7x0iGbO8wJdfTv/OKAZZhx2AS5QdiIgmYWvbDxjCpOL+Sc97nPd+PGW
         JL9xueEwXTtSkF4+zaSr1DouL5fOnEO+4T26GY/K1rJz12q42su182grqx6eCGbKht/U
         7AdliIWAB1WEeVJpIitQyL+9eDv0qrlJw+nYtJkw94kndXo7VmL22uecEmeVQnKM+pW3
         Kxj/l1jdfAU+3v3+sSIFp/bG9CJOz3W3Vb8v2H1kyAFtJntoiJxqIiqyBAhoknOZWa6e
         wkUm+4vUVO+3NEJ+cgrzdZl9a/P1iT/K5pltUOqaK/xp0QjAJRsf1PR0q86hEyIwxpi0
         hhBQ==
X-Gm-Message-State: AOJu0YzGdz3IRWYg+hy5LxM/Ye76sYgntbx8MoNhPROrQF367Se34mFS
	ZekFhfqtQIkGpgGVnqnV322OQ48t02wmjc4h9dQbs7qyRqSupQ3u8lC2gUdetbEd58I=
X-Gm-Gg: ATEYQzx8s/ESe/xq54Hh4vbLXVdDrWyoTXZIfyck1PA+wTC4TaesAzz3MrbAw7+WQo8
	Hq4YtQnNHx+NZm+0qClzJ3CIFJpTvZW9pHCYp3yercJFyElyWsfglkpN4fu5D8eFJKLoyFRzEqv
	+9pDHRGMoGJ28fNCikUHtxmiFKtLtrwikMwj2VgLUv9Jty+/pYnsItelNjk8dxALVZWr6Isbad2
	hSUmMYJOcvu1/IFYgT9Dmp6bn/K8S/pOYT7yyyA1XQ/tLmRa+09edGrky6iSexHpCp79/q8Uble
	EcnqxOjkGCHoVYQ2DOrVorcjiHVcXZEz8LduIq9NGdbFaWwNDeTTIIGIk7KhPa6+pcP3JO1wpCZ
	tGZNfGrMtB8RWrLVmS+6mDut1F2PR4b41C2NaB7+QzEDG50wx6fVjqJBIxZxIP9JchXwOZ8zLyI
	zYudsuBpwlEFm4L682I/qAFKFz+Ybb334OxjY=
X-Received: by 2002:a05:6000:2890:b0:43b:4625:5933 with SMTP id ffacd0b85a97d-43b88a88baamr8337146f8f.30.1774488488352;
        Wed, 25 Mar 2026 18:28:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:32 +0000
Subject: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=RysHVq0N4+YzTb4e9cFYCnf19hquCbv9aui7fBhcLT4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/++z8oXlchbJP/1M16TqvlqfGF301jKf2r
 tvWAN5KfSmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OvDmD/9IeYsBBB79Uzcq2AiGxUn5frbN2yao4rM5EyI5w/zdWIwI8vVhpwVrKUTRnPJ1DrvcovQ
 fb6EwO+HedpbY8CYcPjKLFWRNxM8B9CymD0RJh/GyNimakpmkqsK/ZzjRW0qJyHLMwxzVcKBQgZ
 6STIheHOVMYoCqmuMWC5Q0yDrkia1uCszfyaARyX1V/ZNDwBQ8qX/bcl/g5hxuG+k8VQVzlVNhV
 NOH0xS6kyAALaVifjCjL8z/A8491mvPf4ml//sVj10+4pHu5QrkcQwIRXOvbJHmIjkyz+dGDkX/
 cyjqEiqPQK45U+k7Qwnn2ZwKVfkxiEvvmojLvfQECfFh49JvyPXTo6JvyYlKZ8o/6COYLD2IXAq
 /1uOuMxz/5YTuuZcL/G2jvgkAJl+dVSe+t61zL6HrtGp9dRxdA1/bjwuZ4YKjcI5pVBT8dINs86
 tPjzP5qu8CQWrvgpuuTOf9PGwr0KTMeBILGjMGsYhgI4Rf0+N5OZhoh70uXgU8V+ykJl6eDcTIO
 WH37pYR2LCzoLFH4pKeJmXT7umNMkx9tK009I5PkmZNwM+EhJuaOJQdoISyrEqSBfXhzFdYwdHC
 k7snsqE0XnDaEXLa0ZmLyJeJBkmf8NsFfsTzfwNZi+0N/5N+eoLzp8NVTv/fK9kAhf7NtD1cAHX
 dzKtZJFOLXIw6Jg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 6059232DDBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use devm_of_platform_populate() to populate subs in the tree.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd8..66ea057291f6d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.52.0


