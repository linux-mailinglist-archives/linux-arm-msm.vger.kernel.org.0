Return-Path: <linux-arm-msm+bounces-67528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4158B19244
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA8FE1898311
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41D62820A3;
	Sun,  3 Aug 2025 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyHRtd75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A92928136B;
	Sun,  3 Aug 2025 03:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193533; cv=none; b=YECyWSIMiwojICHTQqmm3g2ste96Opa267YOqsU7tmypelsSczrnohBQTg1q/f+d8aniWuZrCr1VRGdhXjg4c4FD2F9Ti5uR9Hdpw8FIWS/aDyugC01EKZMgx6DbGHbJo8lAl4Q5XhdOjt1dQq1bs1Z+EOeBcd+LKvs8LT/vHgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193533; c=relaxed/simple;
	bh=b+FioSz/8EWacVXu7Sm+hMOcAgEfnPdX9uYqDnCHyck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AEenKZLc6+SPciHL35DDW0jEolwGs6n40+QKJPPKoLhNCMrPwh3PBOY/0Iy4JVMtkI9YJ/5Ynlf6LITkv8gUY9fpxWCW/Q0ApbzsMnyvZjw7c8yp6hC+jlD1PWMVf9R7/NID9uYhllfV7FZobOpb6MaFTKr0XNCUDd+2mQhXuus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyHRtd75; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3e3e926fdeaso12248235ab.1;
        Sat, 02 Aug 2025 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193531; x=1754798331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JCLCVuCy1Iq9Gw35PtEgUXRGWUdACaICRLzJa5akkQ=;
        b=kyHRtd75Rszj6XN+q6zUkLhHZZNWxGXZncYPTrpdX0X0DXRzCK0ytGvh+k1jO2dhvj
         IQKxz8UBV2H841SIIdB6u352gU3IsJ7tuJ6UbWMW8c6F/cIwBvEyJdbchIyTUdmVW2tk
         BmojrbMOStGbhjv4e9FLhthwZZeOTv2UwzppY4dPOaGYG6lh+ZqW7JOAAff+no47MA7j
         voqCol9Q8el/EOYvyNSlp82/OuDir1Wej7G5WdGvFqQlmaAQDRNZwGgZHYPT8dAhFFy4
         uTPYVwBHb/VSr5mXokMUsFLyKzUXmemkYOlvtIkfL/qFiuxTx1CRQNULjUpTlW9F+eiL
         HOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193531; x=1754798331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JCLCVuCy1Iq9Gw35PtEgUXRGWUdACaICRLzJa5akkQ=;
        b=qtp/UCCe8qeDWnAcTbLrDAle8k/bouPbXTRKYpQTo2IBbZDzmO1EUl1NxNznq4d4WH
         QdJYTU+vlRExM/+AMhUIiX+liu/LlexcDX3Qwr0TE5Nz0PXk/Mzq1VNyiXsztHVI7rl3
         jnStbIwVFZwo02IkdQwKurAzlH+VD/KAY7oRyBZSIKvAPVWvYBiNeoFlHS1ndDedBmfX
         9sVJodzrpHgt49c0ufYowa+n2Q4mK6pAZlmvu+c6zRScUOc/+78H5V1GWYvo+pu5kdS1
         e4WX5hANBGdqDXUM/ca1kWWi2mvYaNu90M23o6KBlGj+7TQLnmj7Tdyem5W6heL952lE
         l0cg==
X-Forwarded-Encrypted: i=1; AJvYcCXnIK+VzDnsiU37wdxt6KhHBMS2Souv4gSd+xla4TC5h1LDucLB+xOrDU6A2y0EDYy/1zSC3tJ3I9SAvtV8@vger.kernel.org
X-Gm-Message-State: AOJu0YwrOiWBSiCtehdjtEwWtrimRiVJw5ZjE7Ed0aPLqTnGo1ILpKPw
	dod0XP6dQvEnpPkssYgOZvXItkuS2XHDORQWcMoFuNXi53cZ154i0BpGdrHOp9IY69M=
X-Gm-Gg: ASbGnctGwlrmiaZd2SrA/UMdM5jvHhIQRYsVo8ZwVhWWmyGUqGlSn0owdEBwBpQxSs6
	iPcX53phi2vxOVsdiOGL7sNVyBpnwuCbYJqsAl4My84RsY7aR6c/z7r86FUPGxc8hZu4w8TztjS
	eyZCVOPJj3vAFAwqoHt0h/mwb75V/DgOwy9RojTjXsfWklHHcnzwhbx7vWCUPqgVsCwPEnyAS4p
	rIQcTfwNlF7IqfP+JH+3QHgsQgmn7bmul7YGqf2GBDqnkBuEC3+eBkKbZD3DF+xLGEZrzCwUPn3
	2Ky8lCpZ7dDjV/xr1yOyX3bi7aZT1b+gc4uPS5Qb6qN3Yuat5EwPLUidZ7B6xcceppHsOi03EnK
	exgXgIFmohK0T4GxZoN3EtUHZwHN8i8aXhMiGMazlE+mfY4jAEwwD6VVqUYv14NoBJ5nMDy+IL1
	xN5A==
X-Google-Smtp-Source: AGHT+IELdpv7uUZAZBrGCo6vRMKsduTbeRMcIYAoxynvAlTrmV87SOcUm0eDA5nlXTZa0W/xhKLP5A==
X-Received: by 2002:a92:cda6:0:b0:3e2:a8d7:cbc0 with SMTP id e9e14a558f8ab-3e41610d612mr96883205ab.2.1754193530845;
        Sat, 02 Aug 2025 20:58:50 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 12/58] dyndbg: macrofy a 2-index for-loop pattern
Date: Sat,  2 Aug 2025 21:57:30 -0600
Message-ID: <20250803035816.603405-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dynamic-debug has several __sections, each with <vecname>,
num_<vecname>, and it iterates over these with a 2-index for-loop.
These loops are fiddly with the 2 names.

We have only 2 such loops now, but are getting more soon; lets
embed/abstract the fiddlyness in the for_subvec() macro, and avoid
repeating it going forward.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 283926530a43b..7c5a1ae2c0a65 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,21 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a sub-struct member in _box, with array-ref and length
+ */
+#define for_subvec(_i, _sp, _box, _vec)				       \
+	for ((_i) = 0, (_sp) = (_box)->_vec;			       \
+	     (_i) < (_box)->num_##_vec;				       \
+	     (_i)++, (_sp)++)
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -155,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1220,8 +1235,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-- 
2.50.1


