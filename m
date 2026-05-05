Return-Path: <linux-arm-msm+bounces-106013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBWOFMJQ+mnyMQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:19:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E664D395A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F41430A3F68
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 20:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9F43D47C8;
	Tue,  5 May 2026 20:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="WcpssJ3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A166937E2E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 20:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011805; cv=none; b=pB2Kj0UHIAytbrlMAz7uONGMY/z9Y0pDpSzF5hi8xKccYXD9QrtjiZ93gZ44ueiYPipXAdgKHh7b1BOQ1yYt7psPKAu7FdIFoBTE9UKLX7/zegsg1I1r6fGbUM84+nxvzLNzeF+1aFlU5jOchSzTmKaCixg/pxSsAYJBk5Kin4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011805; c=relaxed/simple;
	bh=eWyFo6wtcwjcGn72c1H93Yp+EkyaoRZ7SE6IqiBOBuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eK/WdNUYdEBYJqvZMPzZTYekp5UbJ5zC2tsvcBK7QYRFiXKWaMPpGJOp3qplvGmNSNJI0IuzYbj1zqJcufMattg3i33dlK3/LrhW4APhF6zugiuYMTFCjKc8Zx02ZoyjZB8iVOJrHA95mK2yzRlff4j81W4fJgpymhRbXntbvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=WcpssJ3f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0046078so49362065e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778011803; x=1778616603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gbkbiFxStV52q4s9W7vmjcqc2PkrySXx7kVEFbo+QI=;
        b=WcpssJ3fgoiR+TRas4ayEdM9jj8EIc8fGEQzHxmgrwXrf/pouShPx4w2QTUOfrgAXz
         WPG3loo95JUIlJweAfuSbIAy/ETKvkjwFhoaPRZ9NHGFt4logj2KfjyyScZA1UPmyRh5
         NtTbqvUVZ+hT/9cv0/KJrA/35daRJHTNkhxDcfT7fgRFhtzGlTRIKyBSqUeKGKz9xRsk
         2WDvaLAJI5zOKNBOSLrW0ZkwVeMOFQrzY3EWyJfC9x6SlXlAEV6MDlodDz/YZOVNCDwQ
         5E6u51cooJblVOXUMNuIg2gY45SsPvPtIixNxC0QKa5IQc8rBQuGCoaTBRe9dt6MqLDT
         6/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011803; x=1778616603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5gbkbiFxStV52q4s9W7vmjcqc2PkrySXx7kVEFbo+QI=;
        b=AagJPewA8bxkVASmp5Bp4GDYJ7/jipcAqwF1ZJin7NrZiqtlBMLsPJsE4fYIcggmYK
         mJDSEtNNK+V0FLk4iqQZy1PqX+Shbxzdeg3CgTmLo0QwwxPUQSpOHbTBb95NrwmEQnYH
         mtmqlBL5RFGNi4bCzAhBg9RQTN+xMVMsMjTFL+oKTYJNFy9KXQL0Qd5vqoKFbGv5SQmV
         nhePXC+fx0BvyOFuTv3TJtsgp36G8iyztYrnMGnLh33JLdwEVLpbGmqkfeN62KTdaHpb
         bS+TPmcwqNpVWjiRvHOXvkYRW8D8qweaKxj/IMczHFVcSLAV6Gsz73tS8jwq4vS77efV
         UUPg==
X-Forwarded-Encrypted: i=1; AFNElJ+dcXXe4uP68cjjZn5oaYbmI9c9y0cKRDDLjztajHgLpT3Hy7M9fCjMy8yZgMnSVUTQavILO8rvUgP+ORyU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa2feE5TXKyd25DdhyOT1ISxt6ryDmHMkqXOqhq+0aFZURymFu
	KbB4/uetd5JwJ5fnOGB0JbCfsMsNfc1gb5YkCmWph+oNi15gsqyc7RQt6j8y+Vakjdg=
X-Gm-Gg: AeBDieuktlqQSVxp+Yv0MnvQ0xxMzeh7zbrvVmYD9C3hYzZgVxAmr94nVIeIk4+a8mg
	ntgN/xASNXC3FqzPUjUT18Mw8/aLwB7o4379pw98qNSwC2q3/f0IstOkA/3h3DxBvCkQ1WLtl17
	h0xfUHQ5pOiWLW6wDnHPPA5cVcFIhQKxulYF58dOahyrJUSvntDVFPckECgbzXfUfFW4gQJey8/
	XFhpqE5SMBOu/FBAxCxMpQnAXomh5E7xrczzx1nT/HaXXr2bxLsRlgWYt4rQkyxOGpUZ0/Vulss
	Z7O+5rocCrNbjsgdJIFL9aqsyr6umH1Vmh6J6VlyPqoFkNvtuXinRwHchrLzMjezfw5+GiyYBgB
	0rFss8baRJlTRbZRMvf7juTDj5iyOo6q5R1Swkwxq77kk2wsM1sWFRfKx+fDgEi8l6lxf0L1RJU
	p6OmKhl28QQ9Gb5pVgAaEOVbHQ69JEHrN3XjGoa7iGJcAMbjYMT4Pbd/am+y9gocBmDMEx37axg
	NGqcWfSlmjUjVvlfzB3pKOiO+p1KGReCko=
X-Received: by 2002:a05:600c:c4a3:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48e51f45d33mr10958745e9.24.1778011803213;
        Tue, 05 May 2026 13:10:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc8c:f883:9efa:3625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5285ffc5sm1752205e9.2.2026.05.05.13.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:10:02 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 05 May 2026 21:09:51 +0100
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add IMDT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-imdt-qcs8550-sbc-rfc-v2-1-b4767d0dd421@imd-tec.com>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
In-Reply-To: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: A2E664D395A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	TAGGED_FROM(0.00)[bounces-106013-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:server fail,100.90.174.1:server fail,209.85.128.42:server fail,2a00:23c6:2736:8e01:fc8c:f883:9efa:3625:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imd-tec.com:email,imd-tec.com:dkim,imd-tec.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add IMDT (IMD Technologies Ltd) to the vendor prefixes
list.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..2db12a1cb6e1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -769,6 +769,8 @@ patternProperties:
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
     description: Imagis Technologies Co., Ltd.
+  "^imdt,.*":
+    description: IMD Technologies Ltd.
   "^img,.*":
     description: Imagination Technologies Ltd.
   "^imi,.*":

-- 
2.43.0


