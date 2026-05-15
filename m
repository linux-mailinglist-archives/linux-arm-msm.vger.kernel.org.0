Return-Path: <linux-arm-msm+bounces-107942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AuBG/g5B2ottwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:21:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B3552111
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B45C3006019
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F484921BA;
	Fri, 15 May 2026 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R/x3oGK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31792492194
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858412; cv=none; b=mb8Tv/aSEgjlakALvrBlYWgeCUMyIUziA9dR7XBRUQM3xl13hBv67Rb79gfk3W3sbgFxQ7FZBCZVCjz9iUL7Ko9gQPjS6ur6hMWmXczajd5+Ch/Z4p87CqrTquNEaqqHI+hC35JYezS8FUnLudribTeS7tQJpBBEwO2YO2bi5bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858412; c=relaxed/simple;
	bh=cg1EGpE+tZLsxSw7/5908IsKJBY1Wp5HHzb3pF7yEJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e69CR95A8xPMUemSoc0oi0WdBtVbVYWcdcflcHGUnbqZII1GaBVq2wQmnPC1auhTMoUkK7kz3vmgvvpdgbP5CfSnuib73tREbLZEUsFqBs+hqEL4xyTZdHLc0SlEMMCsObZJe0mRhffDgsl4ZefUCT1hJyEaneJE30GLttPLges=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R/x3oGK8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8985fe4e6so869333e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778858406; x=1779463206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO8zlppoftXaEUDbpITntu0HDlDbn0tIr9/mYNTg0Z0=;
        b=R/x3oGK8p3Dkez9P0VvQG7OChZU69k9Imb4RpnbE/PAQ3t3OQ0GCqnqnUgP1kcKuAG
         FdlTMX3PFehCiM9W3+cS7nw5S/NGM37GkItDyLMrs/Xee0RU8bAM3XLrzkKaWwXYlV9K
         EnmI68pT5a3nkOACXs1LWPaBYIei4w4Bmq3AgFh62Fl8Lr3s0WUxsaw4JpeAvcdQXUB9
         o/gJhZ/JOwarZxCDuYwG99/c0CIT805JhM11YU8HqB1JHejSrH/U3sxkLs57MQU0mq5i
         PwgWSI6ODS5FKSipwDz3nF7U0PoN3xWfJV/95Hl6NYAoTPUi8qKOdUMSk9ceRnbMeUDz
         RfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778858406; x=1779463206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gO8zlppoftXaEUDbpITntu0HDlDbn0tIr9/mYNTg0Z0=;
        b=tFqs9ZkSTdXMunLTtZKH0s8n2bfGL4qt8ogcqwlpHxWCJePkBqWigSQW5PsUQ9tW/h
         jVxC9eCmklyJ18EaqXjaw1ZhvpFNjglnMcMEaCfS2kFtL6yiyiwDEXd3kT1keukP59MK
         DdQ5EQDPExD15eHeBFvTgVPOxdNaERtjxdcwXz8LvCclTkk/Tb8+YN38gvkkK9p0S1bx
         RiCfUfDgC8E9F231IgwG9BQJeRhBtU5/SiIWLFGKSDVTs6qD54xAMFphS9TUkFOriMfF
         sfNoWXrUuFI6mjVJQr43QZpZe9Ez0jcmsF7XVDAGZ/WAwM3A+NYEJO5hlcCvp4WeDFOO
         xFKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/X8ZyPvpBWaHXxC3WEvor0vteea+ltq63meG8I6/rY4brRn+EmnZqd9jSl9rn01TYKwBFJ0j2F956EW3rq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zgcFTCvtnJ7UTIhaKWFEpU9yppk/Hc01l5seqZHykk6jp7r4
	+8mcmP6iFptE029dP2FZYjjegS+0Mt8wD+cYIUFW/d8K6FMO8ZSxpanKTaSEL647c1g=
X-Gm-Gg: Acq92OHJ1hLWcUBfFg42TlgFRIqAP+5FSQi5FD4OhvsMR4BHDihJIufahE0CG2ipDSJ
	UivZu0q0J6j0BKZKgm+YajqErfYQjmdYjOmfmUMDX2X/i4qkKhU4uDLw+9L/jbad1XDeA3t3PQC
	E7X9ACJbySl7uRHUe/jE0UuJRcpUYLAGoZSQxWBuInEJRkBtyVmhKNxcBbYQWBYtnbFOki8QzUh
	Ep+dxTcVvAjzhDOEU+zJLin02rpnymFHDUW4TC3+agqMqPbHni9PKXj+ZX+b1sUD73r6h5ERDZc
	o4ar0mIqa4btZuLWNYcKfWtFE1kwF6V14c3MT8aqgpmMk4e206huyXWcD+j+Gp/BNLqJiDDLum9
	WWw+yQveryzalqP7y4uq7QAE1RDJbvIVTSwkFeaMqsArreHS1u1LPS3gA4ZwT+lqwfYOID7zYOj
	hObHrNCKgDXFr632Z20IG0ApIlPqSLd/oNgDXvHERhgHvwoq/qHKD1P6KGB32QZ60C1A==
X-Received: by 2002:a05:6512:693:b0:5a1:30ec:427c with SMTP id 2adb3069b0e04-5aa0e74299cmr608491e87.6.1778858406006;
        Fri, 15 May 2026 08:20:06 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc20fsm1392418e87.43.2026.05.15.08.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:20:05 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/4] i2c: qcom-cci: Fix NULL pointer dereference in cci_remove()
Date: Fri, 15 May 2026 18:20:00 +0300
Message-ID: <20260515152003.1604187-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260515152003.1604187-1-vladimir.zapolskiy@linaro.org>
References: <20260515152003.1604187-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 745B3552111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107942-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Action: no action

On all modern platforms Qualcomm CCI controller provides two I2C masters,
and on particular boards only one I2C master may be initialized, and in
such cases the device unbinding or driver removal causes a NULL pointer
dereference, because cci_halt() is called for all I2C masters regardless
of its enabled and initialized state:

    % rmmod i2c-qcom-cci
    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
    <snip>
    Call trace:
    __wait_for_common+0x194/0x1a8 (P)
    wait_for_completion_timeout+0x20/0x2c
    cci_remove+0xc4/0x138 [i2c_qcom_cci]
    platform_remove+0x20/0x30
    device_remove+0x4c/0x80
    device_release_driver_internal+0x1c8/0x224
    driver_detach+0x50/0x98
    bus_remove_driver+0x6c/0xbc
    driver_unregister+0x30/0x60
    platform_driver_unregister+0x14/0x20
    qcom_cci_driver_exit+0x18/0x1008 [i2c_qcom_cci]
    ....

Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index f3ccfbbc4bea..01e440b6585d 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -660,8 +660,8 @@ static void cci_remove(struct platform_device *pdev)
 		if (cci->master[i].cci) {
 			i2c_del_adapter(&cci->master[i].adap);
 			of_node_put(cci->master[i].adap.dev.of_node);
+			cci_halt(cci, i);
 		}
-		cci_halt(cci, i);
 	}
 
 	disable_irq(cci->irq);
-- 
2.49.0


