Return-Path: <linux-arm-msm+bounces-111566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 93YhJDNVJWpdHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:25:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFD3650698
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:25:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BfwjCMVa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111566-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111566-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5603305EF23
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091423A2549;
	Sun,  7 Jun 2026 11:19:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C1F3502B8
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:19:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831182; cv=none; b=gjOl4TdO5yLpzrBZZ0cyI9ZWyFfxJpvhl1zwjOzTXvrdPmYuqq1hbW6tSRSR6XTmh9wbh1lzKlnU1voqhOFPEL/zzFs6feYOHMMsbjTmPeFdj4F6hRzSwvdu4UeS/lWy9kX8Ac9dr9xstvvmrMHLw9v28J0eex4NslOeqSo1X74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831182; c=relaxed/simple;
	bh=0uDYtqRBUzvLjwC3Lb+glSfRN5HCu+ot/eZzvgKdnq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=se94GnElCUFf8M1OZaMR3iDk+ypEDXcIKrG2LDkWAvERCuD3JdkGEuE9Po7NVPq4MJPPLK8Gs7NNrH9noipSZQ89En/lFKYR0XH1AHdCjI6ISxaKNMViZIW3CYeo7zkDNg0s4/JFdbMMN5S+Q7uk9jijognwY+ubFpcUn6rIPK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfwjCMVa; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b9318997so24137435e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780831179; x=1781435979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nrYQAlpfe/R8hKzBRpiJvT6OU8qSP87xKaeg9At/5s8=;
        b=BfwjCMVa5kQOBFZ/v5rs91TcX6t9R+J+RUXTI6y4v6M2e6nY2c19BviZ0hLBQABya5
         jy7N1orx4sQjjn4wAkIMJ8gJkGI2u7QnZiwJpNQAZOCFR95I+xN8rGw/fP+mTHLZUj/p
         44sswKTGeTHCkARHGPQMu6p6Izzz1LM1orHNpLHFt1HNJ83GampZthLmkv1003riHEmw
         aJPcdgWyEfhRdwLoDuyLYRiGx+v/Zt73O3ftGBMgfRHxr/1+YPbc1uO8DXifmQEZ7WTf
         jxsXmV1GsPWlKkBOAJWyv8e3VfY2ZfFTlFwUj9mZwH62YKAsbXyh2YuzJsn0ql0jyrDV
         Wwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831179; x=1781435979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrYQAlpfe/R8hKzBRpiJvT6OU8qSP87xKaeg9At/5s8=;
        b=qXMRfZTAaFHsJqqtf8fuc4SJdWvWSUnu35eaKBsVwVsG/uP4sZEfwkWrDUEzuZTWB8
         sBb+c6/PaewmvsGaUSdVM216cPeX/PT6a1B3mp77LnPUyiSoDPsck8cH2a4z7aMMgG1u
         33VFuPgB9w5irUg8Fb0vXeVtOYlnjjDHljc4x800lO3HOh+VpCDOGHjGUGfynw5ZpdOf
         w3Zr+pwTOFfM4UX9ziQu0sy0xvL4I1Nsuxu6W0sWXvXH5BEHFN6TQd1dGrgymijA5byt
         PLu37qxcj7D/GYPfRUQJDoCzjm1rBVrcZI6fGoH/wBoFFBaxn0PTIri5zx8gy3zqvILi
         CpjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9a4p94h/1OZwZckHDxPwp5+v1qQcb53mat2pG6ryvygbhTOZktPi0rlQa2RM9ONv8dZ4SLIqBt55e/hwpn@vger.kernel.org
X-Gm-Message-State: AOJu0YyxWlAswZlA688WfjymuyMsocxwtFvWguzXLMJ4ZufnjDnwfF0O
	sZHxFrj5PzHu5S4+w7dZlTSXlXx7r/oTI5H1rvBFuxzzst2sAPxnKkU=
X-Gm-Gg: Acq92OGN+BWqmO+Yr4SUjWvNoLQMZDnnY89IHa6Dap1k+ZVOpbjcUHmj4G87BCS6bDK
	2MINgxZLeFY3Lm+cunS2pyoXnMYWi2/eHMs46t5MHzQivCgCPZ6et0qlwC+Re6WcEfM90+caG6a
	SPB52hXKeH3DZ9+U5enWwJ4T9hvbTVesbkT3JU43A4wBjgRrQLeLzuhDwx1XnjL0hwMsHMV2ofQ
	UtL/1w/cLt/ykyygpPX78m/h2hZyVrPJgXw7dQJQslKfHyp+ury61yE5BDSLcxPwERGP57a5a8o
	Nu1xqYRiFlFzD134thp+3L5rPIk6oNDD/iYTnjZYH/y4DzRN2pzVE/U7e42fzTmXgrHsfkDbs+z
	SQikwUbaCKLJVldrEx3ggI6AloNglcws5TGEW3wsrEjLIRjNL0gWWI7GA0BlRuxzL/ZWUqYJEbF
	bnbUjzGF90b9Vj8Ep3ZI42FcSNKp9abdbRexnVgqIxfctYN+ENWcvDB//LC3e2YrHxIe1AVsXID
	B7BWd+rQt6KQCgplofMBl7b9bHNa5TPGyWMibFhnA==
X-Received: by 2002:a05:600c:818c:b0:490:6237:521d with SMTP id 5b1f17b1804b1-490c25b3ca5mr196207925e9.13.1780831178838;
        Sun, 07 Jun 2026 04:19:38 -0700 (PDT)
Received: from hp-ubuntu.. ([196.74.199.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918d7sm282234195e9.2.2026.06.07.04.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:19:38 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: quic_vgarodia@quicinc.com,
	quic_dikshita@quicinc.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org
Cc: kees@kernel.org,
	gustavoars@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH v2] media: venus: Annotate flex arrays with __counted_by()
Date: Sun,  7 Jun 2026 12:19:33 +0100
Message-ID: <20260607111933.6398-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-111566-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:med08elkadiri@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[med08elkadiri@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFFD3650698

Add __counted_by() annotations to flexible array members:

- hfi_capabilities::data, counted by num_capabilities
- hfi_profile_level_supported::profile_level, counted by profile_count
- hfi_resource_ocmem_requirement_info::requirements, counted by num_entries

This improves run-time bounds checking via CONFIG_UBSAN_BOUNDS and
compile-time object size resolution via __builtin_dynamic_object_size().

Assisted-by: Claude:claude-opus-4
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index f44059f19505..e96d458c52fa 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -616,7 +616,7 @@ struct hfi_capability {
 
 struct hfi_capabilities {
 	u32 num_capabilities;
-	struct hfi_capability data[];
+	struct hfi_capability data[] __counted_by(num_capabilities);
 };
 
 #define HFI_DEBUG_MSG_LOW	0x01
@@ -802,7 +802,7 @@ struct hfi_profile_level {
 
 struct hfi_profile_level_supported {
 	u32 profile_count;
-	struct hfi_profile_level profile_level[];
+	struct hfi_profile_level profile_level[] __counted_by(profile_count);
 };
 
 struct hfi_quality_vs_speed {
@@ -1085,7 +1085,7 @@ struct hfi_resource_ocmem_requirement {
 
 struct hfi_resource_ocmem_requirement_info {
 	u32 num_entries;
-	struct hfi_resource_ocmem_requirement requirements[];
+	struct hfi_resource_ocmem_requirement requirements[] __counted_by(num_entries);
 };
 
 struct hfi_property_sys_image_version_info_type {
-- 
2.43.0


