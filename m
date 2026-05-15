Return-Path: <linux-arm-msm+bounces-107977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKshJzGvB2qrCQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1875D559644
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 160BD30166F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 23:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53943F6C5F;
	Fri, 15 May 2026 23:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m13L0CPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F263F5BC9
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 23:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778888493; cv=none; b=jLwTFAiGBV0eWIYbZBViuVEoykUmWLEcC0FBFDKeX7xRLl78wIZ53lD29GpDuSH1AFYrEgWRxbGB7UJZzB9so01HRHAw4/VHETPXrsB+ydK+M5yeWcDdGjs73946tG5Blqe1/F1bQ2rH++zpjMsar8BdBFo59P+x+TFjP4xD5AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778888493; c=relaxed/simple;
	bh=EsKzy3a3w2QB6ciWVXrskdcLX96Jst2IB0ykM6mC4r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Up7unUWTsleSUciOSIOsQftbI8UNcQiNZnAKO9Z3KMZH8MYm4AAT+mzy2ZOFouI/qR8UjTRFQ8HRYrDxO6yGDViwpzwMuh5UdbJKqdkEDFQq2vz9m7+vBSwiE/DgqT5xXsqB73wASjmhUJRGwpRGQePk3vjczWOfIthWNMA+KTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m13L0CPC; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3937a1f9f7aso586021fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778888489; x=1779493289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDeSMFVFW4O/ySYbhcOTcvBHuoesceFJngMVL1LKDjc=;
        b=m13L0CPCH6GGrqZL9JpXXb7QwANaVMKrIRFcFF1LLHbeE9v21sUrIEMOxazqROJqTO
         qJfBhT6ngQAnVdmziv/FS0hFBS3S0rddeqfaIUJA8ohlOmuBVxeHBoYick3Nex9vIubV
         olWtUSD6FIavkvoyNZ8kY6L6E/E6TxCjJf2IbhH08nUxjaskxcnMT+zzSS5rzXNSu5xW
         8jT+zwVegbKBxf8VSpI5f9A1t7pfcpG/8jVmFLsBypB96A3/jKkcTo747phYxLTMMxRe
         4DOXS/WTeH7moRT9OXqMeWdqGq2hAEfuesoBBdLsCLn9hkW58BR+CzirstAXhRZLtWDl
         Lt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778888489; x=1779493289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LDeSMFVFW4O/ySYbhcOTcvBHuoesceFJngMVL1LKDjc=;
        b=EtU4a8CboACXo1GDHIVCRv2iv/dTprv9Pg0Z1y89cmvqwnsmr35mFBzpt4rLU/9q9z
         MVUpUJpcN12yUarxlVAM5iV7xcuyhfYG/Lj9ZRfZXN2mDIoaj6xBJDL68LQ7jOcbrssk
         PIZW1H/bijzj65BaI6UYVIw1xj+nhPnYFvjhdzOtRxhRC2Lq6+coJDvfpnOSl8DDloC6
         R7YftI7AxUShgPs5NFddOIsRb6qEdpmlKVBB8NO55j5CyDQtIWQXk7JQGir3bIVU8DiD
         Ck4cYlOPw/qQ7jZlDtZLPttKe17y2J/WYUz8mC4tnd1UD1Pzx5UGx3vVHC2DrQA2MbW0
         y9xA==
X-Forwarded-Encrypted: i=1; AFNElJ9LeuLerAcDx0+URclcZOaic+lgeEQPQq2SAoVjPAYqYWqpqSosEiXZiFBytgtC3S/t0Zo9/a5p/gJEvjw1@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBeR58+IBBRSjInoRA0r8Ihg8Ou5UoKVQmD+eoGVC0OT2h+MS
	Rv1hmhB5Itd9VYZ+J27zGI2s8hHd/6AY5U5VipV+Aqy4bfO89Nxgd/HsWjDE/MpMvYw=
X-Gm-Gg: Acq92OFlTRfuPrjXhJUPdYpjVT+vHBpbrETlxkcGjgZ1RiUl4LOtx/Sxs2yDHCNpJkT
	qDsae6wIc+Jt+q/jO+T3UZ7bCyj74RSCzWfTAwCVSKYZ7rUHAP+hLIwXGX9EDneCpMxa5qaIl8+
	TkNk+9iWtx/UU+bR66x/0bKcCvsRqMsq5yLEV4P3F4lQtUgTdlFOVq2R5Wz7d9ka5+11io7ROJO
	mEkBi3oStoy5zFsF70KDqMU44ZHNLjOBFm2pG60zVvnJaE5JsJ1FrD18mLkouN6KpxX0qGLQu/f
	0k00Ol5s176IaLox7VKgVGgcTcqi3atTmeHVfkmNkDnO+8Qh1WUO3TzvN0qCqX9DkytVQWikBxu
	v49VmyaWShcAfH+sN9/guht3s96W8lVbaG1wbBOQz6PYVm9/RcPBhAApqP+b/x/u95uChjp0opc
	Hr/cFO06hr+8fEUisTH/1AOGseTLe7lzLT6o+cLYMLNmDnkRKujUJlHLnO7NnflHXBug==
X-Received: by 2002:ac2:4e06:0:b0:5a4:6f3:dfc with SMTP id 2adb3069b0e04-5aa0e990ad6mr823387e87.6.1778888489172;
        Fri, 15 May 2026 16:41:29 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c710sm1631384e87.7.2026.05.15.16.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 16:41:28 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/4] i2c: qcom-cci: Fix NULL pointer dereference in cci_remove()
Date: Sat, 16 May 2026 02:41:18 +0300
Message-ID: <20260515234121.1607425-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1875D559644
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107977-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

On all modern platforms Qualcomm CCI controller provides two I2C masters,
and on particular boards only one I2C master may be initialized, and in
such cases the device unbinding or driver removal causes a NULL pointer
dereference, because cci_halt() is called for all two I2C masters, but
a completion is initialized only for the single enabled master:

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


