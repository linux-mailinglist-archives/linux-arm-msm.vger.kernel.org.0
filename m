Return-Path: <linux-arm-msm+bounces-94610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALNoAmD5omn18QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:19:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6F1C3838
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F66530D2ECE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6358E3A784C;
	Sat, 28 Feb 2026 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7QHUKd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F5538736D
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288321; cv=none; b=ViShtY6Qbspetbj0tKG/Acs+4jxG3w4vMau4S7JK0qkY7LcMNh24gwHtypDbecRq9tMYamjt1Pi4iYZjS0udmyIXzV35PN44C/H5zqkdvpvAsRfYil+itua8va706+WJVL1JYkkMHnEOGd4R83P5H6VF4Hfrv508IlOaStY+C2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288321; c=relaxed/simple;
	bh=1x+yEo+WJPeaUg2iqLovDoJtSFY7lrzzMEON//GNxJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIG2Q3i1etlxprMo9sMDCzG/MyTh/+ZUMwQV8cSu2XNljBcpN7YJGdhkzyleUSwYRh98o99KUSryP7GgKAEFsjuzFd7E/639ZMiwNgvo2Z2TCzbvOo6xY/jWJJU8/mzJB+JtxW0tkXjwVfRs2xhM75jZ34aHcyB/u1q8qyDq/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7QHUKd3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a8fba3f769so14408505ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 06:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772288320; x=1772893120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9q4+vzHqt/9/I9Wl5SgvfIE9/kAMERYBCx5YTj2gss=;
        b=X7QHUKd3WKjtMRJoUclEoxH+FIXRsfpDP1xbXLgR/96/S6QmDlUHpP8xWvhnYiniu6
         gG4FiZgntSkaCgwIRDqZJeLTVrJNgWMWTdRJ6F+4CLcnWQufYBx/cLPd1idgz+BN//I/
         uLr2y+mdCq/cmRYVerxOov9NhmM5ScKD+yp+fmhjgypLhnUj3WEdvi+CL1oYfCS7eL6+
         +BCUs//FDT2VXBzL8l9zrClLvoBCn0ri+eWZo7iVEhJRhDmHjZ/ENj7wavi0EUq/wwLJ
         QQ8ceJWWfu4Fu9TZytAtZcQATD3AJA/cUlgXWeDykuv0TvlfATUmw8NtFqe8vQdYut9j
         +Fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288320; x=1772893120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9q4+vzHqt/9/I9Wl5SgvfIE9/kAMERYBCx5YTj2gss=;
        b=a9eQB6rqKl6lkNcVnaESG03c2C6yLreS8IpXYqb1sWwMblvIuNAQ1JzacfCbbrMQTG
         jrsQsHyQ+vLA3h/JyRWr9YYK0YaB4rRsPr8spvblyc0MLjq61OywIBYNJtuGlP1YhtBQ
         aT0hg3vujunLHj+ZQ7Jjtz4ZCGXHp+S7YuWXbnVLddMEBAN6hE3g76LCge9/cR3yHkWZ
         CdFRDFfrDXTqLKFHVqmEoaBhIvSA6UK0RGMjlphiJBVwmA7wBgNwEw8mfjAyaPFw/Dg+
         iVfMWhTedl5GDivFuS9EXXjiBpBAT3W+0hkl0FRGIYNwY7OnKvK1XARxjjrdFwj0GpGw
         hyyg==
X-Gm-Message-State: AOJu0YyhD9jKVa7YkFSMVS7lJJpP09XGiGlg45R7FQJPgZhIlmvWxBP9
	D0qdAdMT0e4iGNbj1+/sEH8buNvdpU8tCHW7RThGLbDRkxfMm7QKxJuy
X-Gm-Gg: ATEYQzzIcjyXXSdjrHfPaUUReNUw4QyNATZVXObjDr8PYkMLmPR69JG0y8/fxkemjeE
	oFekOiqH3HyKmCXcb8ShjjNTLwFpYigzngrIPiuj0KJFo4NJINAYvUS/C1W2+lxMb38SAR3Or8r
	nu4UIOQjsM3K+hg1PV4ASZgO+pfvgpR/T4GbCRykNLKHK3r/wSVroIr76Fz2a6wODQd2TtcPZDK
	wPAqK7RzwkvqK6ZlDrB/h0+s46endX9e684wnplZKqhpQ///IFfWsZb6dcpUbqX1GbQYSbsX6u7
	0+iJKciWitX0Kka7EHs7CDrB18OIzTg7XTI0gDr2axgVu9GeRtsK6rMkae18xMh320vT6oUScGD
	YO7OXstzk76T7YEXaStqP++KKgu2GoBu6Iw7TMtFyaRvZHoa3o0v/JcwQtUgd2IblHXTYhf7w/R
	DDZ9f6gcS/dW7844DP182n
X-Received: by 2002:a17:902:ce11:b0:2ad:c337:5a32 with SMTP id d9443c01a7336-2ae2e4b0d31mr59227405ad.28.1772288319526;
        Sat, 28 Feb 2026 06:18:39 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm18697235ad.6.2026.02.28.06.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 06:18:39 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyu Gao <gty0622@gmail.com>,
	White Lewis <liu224806@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 2/4] dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
Date: Sat, 28 Feb 2026 22:17:13 +0800
Message-ID: <20260228141715.35307-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228141715.35307-1-mitltlatltl@gmail.com>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94610-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7FE6F1C3838
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same DSI version(2.5.1), then we
fallback to SA8775P compatible.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dab..617dd110d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dsi-ctrl
+              - qcom,sc8280xp-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
-- 
2.53.0


