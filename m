Return-Path: <linux-arm-msm+bounces-108623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIxtGgpODWoNvwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:00:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC99587F8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8C773004D93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 06:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BACA34040D;
	Wed, 20 May 2026 06:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRuM7iLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0823394C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256837; cv=none; b=kdmPuTy8q7JbSULNq4E60a7ydRcxez/3/8kEFqUCR8WdgSruI0mQIGYkAD2g+kZ70WLGjWe1aUpKeE5NhMqtKc2nAQinxlmbxg7UB3JeUDE8mlNynE/dK0VxM4OBGv7Wh/g0kYsGEnrXgjBHCTQguSvglqQ1YgwTgGhLZUEA37A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256837; c=relaxed/simple;
	bh=PwdFhbnaIbvzyL0ByKYE7HETeCMGZAIbkeJSqweSa40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EBc3KvTGQW0TYNLQbd8Va6IVVTP8iPkbOd94lM8jTv8857ojqYeG08vMnGMbeulwUd/rWVkMkn+z85UhbqhRTE5+SOnvIqW03OA50N2i4kBbm0cCmuU5gBhUYMbLRf6gj9gjI/sF41eeVUmL9hB7HL+S4uJOC8zdNJOwcbBQc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRuM7iLm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso42934325e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 23:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779256835; x=1779861635; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6h5aMTMM8bzIWFDjN53bSMUWPzwm9wWidLlXx3yYUg=;
        b=rRuM7iLmZ9hqTroKGQqzpwOggl9f9djMT0YcNIzugBySJ7TCV3RV+murkL2Gk7Ha9o
         WBRZGa8orNsoIo1HEVeE2WULyqkD6equIdBStlPxHrVyalB3qTfQyUIZrHfCt+DHxl5p
         cHTAIy2Ej63rIyUKjvHNL/lDl/lHkIF9X8Qf/ofpKPxwtDdiMb+CS92lG+n6mfDjJZUa
         2+YlkDgNlOcB3vzk4KWRcokaJi2+K1mEWz+OtEBN7B7ZNsQG255SaqxXpnRzlKA2L0vT
         lM5I8NAEh54dxDK787zxnlE1Mh+hFFFXxLIcdXJF+C+R2GQovmUhj9cIuVGiqckxC68N
         foDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256835; x=1779861635;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6h5aMTMM8bzIWFDjN53bSMUWPzwm9wWidLlXx3yYUg=;
        b=jDRkC6yXlAhzf/MsZE0YAQcWCRH5M32VFRKQSHrpx7bHXlQCAL1CTYQ/YxeO4Xm91O
         H2eFVlGq/c02cUNKwkuex9MbMMlu/UT3jzNkuNwQqdLbdiSMGYSAVltxdI0h0pRVVWBX
         h689haO5mIqrAJjiAp9LCKJ2/4Hm9ClX6uC4ihl5hMzh6RC1EcKzH7/xz/TU06tI7f3m
         CQoSG604gAhUp4M9j77kEE1StZCaIKE2T5KzRLzqn52Ppf68Tugl0ZcJ1zs01nCJkkHG
         ODozATlMsqefMQpygRxcoZaNL/80tKSPxovAnctuiqOnLryM9irf0U+F1xv1u9JeEBSk
         zFxA==
X-Forwarded-Encrypted: i=1; AFNElJ+hMNNpPyvQnyPfyeXTWmIaJ3A8B9qCsZysMNF+CtBpoYdKVN1GVuLsyYjh5uyPRqN2D2ErJ5IVRMR5odVg@vger.kernel.org
X-Gm-Message-State: AOJu0YwOF1JI1qwD2ZCFwN9n8XqbomqDv47jkdJiYdTgmn5zlAqbT4Bm
	2pymX3xVaGP2yOvL4RHNTMgJxCfYcuqnOkgdPmhx5FYpB5TMTrgHMMyB
X-Gm-Gg: Acq92OGvnqajcvl1actF52/Gr30JjJ6M9YKpxGaxpBLHP8bijJIZyG8hLW02mV9Dky/
	17ldTYB72Qv3kOU4WBzNGnJxIogMVGm4txV+viQ/T/Ilx3wQTRLAlFoBp37NcQI2lfVcrfCbWbR
	lGepUVKK6s2qxyKFIgbZl1zFrmjyd4Lho6FVTJbEuVyXzqXzVMOMKlfUtWLiQgwaeLCowbJMIqB
	WPO6MmI77WOL23Fpd5MsVAUBH3WVFCKugi0Rh17k506rt6HG4dTJIcfeNxf97RVUeN1MSOukEIP
	ektCx6ZYGFKKS79abGx0FHdJNOk1gvUn2SLVDRSWOl4p8pB495aG82Hw7ud+gZEtBry/GaBUJ0h
	0KVIgHh5CFvmmFEaWt/vWbdFzSQxES9a2C0/m6T0Ghcr2XDlDdbcqGVfPrbaQzHGS0I0SrByd3c
	/B8X1BXPKLRgt4chKPIbiQN2WqcoIG4A5OBw==
X-Received: by 2002:a05:600c:c4a7:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48fe539519dmr330248945e9.14.1779256834204;
        Tue, 19 May 2026 23:00:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf86db7sm185387655e9.6.2026.05.19.23.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:00:33 -0700 (PDT)
Date: Wed, 20 May 2026 09:00:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in
 qcom_llcc_get_fw_config()
Message-ID: <ag1N_rAHEQ1YJsa7@stanley.mountain>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108623-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8FC99587F8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The devm_memremap() function doesn't return NULL, it returns error
pointers.  Fix the error checking to match.

Fixes: ac23106a9b9a ("soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/soc/qcom/llcc-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index dcc08f63e020..2006bfe198ea 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -5231,9 +5231,9 @@ static int qcom_llcc_get_fw_config(struct platform_device *pdev)
 	}
 
 	slc_mem = devm_memremap(dev, res.start, resource_size(&res), MEMREMAP_WB);
-	if (!slc_mem) {
+	if (IS_ERR(slc_mem)) {
 		dev_err(dev, "Failed to memremap SLC shared memory\n");
-		return -ENOMEM;
+		return PTR_ERR(slc_mem);
 	}
 
 	ret = qcom_llcc_verify_fw_config(dev, slc_mem);
-- 
2.53.0


