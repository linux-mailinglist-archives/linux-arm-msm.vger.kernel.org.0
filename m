Return-Path: <linux-arm-msm+bounces-102669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BhfHzvN2GktiQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:13:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4F43D57CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3C0E3021D21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564533815DF;
	Fri, 10 Apr 2026 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGEwk05u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298D344046
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815940; cv=none; b=beSkbfSH5l8v0cH29apUtFPKd6ZediQAs2JWGyqEQG4RnybayCb5fXPPtSECaPfPdQVjH65QW1GeuANGT4g7FGzz5L3UHW1bNiBq8bfKIMkCyQ49+VQK0UCDoQg+ZWwnaQw9Da9n6fz5wC/cy+3uGobrH1SvxtlnciLFNNuRjto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815940; c=relaxed/simple;
	bh=H0fXTkWi3cEW1grzTO2UpwdTEZU5njLYXMU7g8OxhcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9bov8Pmzx8wb6aSPu1EUFKIh0RnCxTHEaF3CPWeOVEIcVaObZ77OJhqhvdyya95UOWWXSvfIcwQcKaKGYO4RSB7SF8rhIaDBm80UpoN2ASudmF8345IQ/nGQxYL+JHTKPxrzE5nCbyjLxN4gXxuwzMJylv5yQ0Mv7PQH6n/XJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGEwk05u; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so20288205e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815937; x=1776420737; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2joo26VZqK/l7L0t7ywj7SByOmdQBrAhyw+E9lx2JP0=;
        b=gGEwk05u65i7OyrFU09sm3cibL2EYJ3yVES5ZR4aCtwm+o5T5hvE1D/aFwqvuDvoto
         6x4+Q6rCSxgCNbNIxyyeON19h0981U1gOM7HMkqSpIANW9XKHNFLUgvsz1/mu/65+N6M
         SyiIjbVLPi2FJyfxp7M5tv5qnLXcQHvCiIFCdrIUcmM1+v+l1QsobnglzCazgoUqIRZ5
         sPm6/x5vQ/wFZB/ub8OAPxIm9D262LqIplHmSIw2bMLDfAYzx+Eah9zAcRFGh1JU68xi
         Dpr4GiuPbeSYD+S5S5MKr+OvZN0mdqIl2qC+sAbeBJdf2MAtLx5P/QI05FylJN6Z1xcw
         AxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815937; x=1776420737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2joo26VZqK/l7L0t7ywj7SByOmdQBrAhyw+E9lx2JP0=;
        b=exshmkWZUXHG8p6ahPWdimNuhVzIDXzj2j/KVlhGc/+O7qx6MfXHQdL09T9PbwwN6g
         e22hf5QWLdEVdCH5neGa15Dn8h6Pz0SwKF1mlQevlwQz7JPK7d15c621hAZElDoegKWF
         cmNsYkMkQKCPoqOFehGx6e6cn//6im/i/WckwtMDRpr1McI/lVFxnkZdUZrkZpHXdInL
         rUn77WZIsw6aqDeLKeVYjTGky/DViXRW16DkCurA8+nDrZr5+XwK2Ba/S2aG/uFnKjVa
         9ws00thMPPw689/Krag26pfo9JaAxbYdKkGxzjwel2v+VW39gU4Rw9nGAA5yscEa2O4f
         XPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXLS+DmYadqzzPe7YNfKq8W1uU0/xn1rDdD2E96v4A5ABUGqBXKaf0xt8fCPIRrtm68rsih8s6BQ3X8mAU@vger.kernel.org
X-Gm-Message-State: AOJu0YyMUSyN7ObYZQO+vdlYA4oa6WEpb4HXrmyX96wFU8Xk3FtK45SB
	+E2OGjGDSZd1JwQMwx6GqfPIPrlRSH57CD9MYSWptpul9pjoTz23STlV
X-Gm-Gg: AeBDiev2b4Mt3PNUf6GHEIeZpbxFyttqY4QahEql9XbOys4i8x/t157ITB0+ToeTQzS
	DRGuxIM1yNxhrD+to+ZCM+auZn42cDqlpg/NH2JDkAWrzfTYZhTty5SWkc0su0E9y4N5zCGJzc0
	9WZTPRqPTF/mm02IR6Em+NjbMITmgmyFk9MMu++NGn4r/kLwY4nUF/qIp9SRNYEQjQ6PJ00CVoJ
	GfQU29XRSxpJBOEey8IDMsyXkvXN7x603bQmbTQjKAvLmz83ZkDPWUW99sX7p6X9NlsNEJXX8mn
	habEgZQamMRjvCbX4L1r70Wj+a+swZxM6PmRd8BKJAfW5Ptq1LBxRaUpSnbtK8eDfbYb4/8koQr
	ofqMZtjMndViAWOxH4jrDizifTvw91uXuyR8NSgRNkAeqmv8+I4hdb956uMq4gfUG96MzUJNSK/
	sy9/gIJU5C3RkH/JN2qNg=
X-Received: by 2002:a05:600c:a109:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-488d683d510mr22075085e9.17.1775815937325;
        Fri, 10 Apr 2026 03:12:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b3cbb2sm63943005e9.13.2026.04.10.03.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:12:16 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:12:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] iio: adc: qcom-spmi-adc5-gen3: Fix off by one in
 adc5_gen3_get_fw_channel_data()
Message-ID: <adjM_ZXs9IoIYjyN@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102669-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: EB4F43D57CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The > in "if (chan > ADC5_MAX_CHANNEL)" should be >= to prevent an out
of bound read of the adc->data->adc_chans[] array.

Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This email is a free service from the Smatch-CI project [smatch.sf.net].

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index f8168a14b907..48c793b18d11 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -482,7 +482,7 @@ static int adc5_gen3_get_fw_channel_data(struct adc5_chip *adc,
 	sid = FIELD_GET(ADC5_GEN3_VIRTUAL_SID_MASK, chan);
 	chan = FIELD_GET(ADC5_GEN3_CHANNEL_MASK, chan);
 
-	if (chan > ADC5_MAX_CHANNEL)
+	if (chan >= ADC5_MAX_CHANNEL)
 		return dev_err_probe(dev, -EINVAL,
 				     "%s invalid channel number %d\n",
 				     name, chan);
-- 
2.53.0


