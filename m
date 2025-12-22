Return-Path: <linux-arm-msm+bounces-86124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EEECD5129
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77BC23011EFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F40328255;
	Mon, 22 Dec 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKHlAe5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FE7209F5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391750; cv=none; b=SKHJYPyVNSR+7pnUqvtmG8ZoW3jOpYLKRZoSq6YIDtGYb4DJUS474nrO1LQ04m9AfAu6URWjqGHKhCZIEo/y3wslDxehfZ6WUiGJAsV9NFRJpmflxU3L2lQqaOm8Ytf8Ov91agOBPAJFfuFUw2WavFYB67CuGXnpTXZv96nh5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391750; c=relaxed/simple;
	bh=buhxBjHOVKorNueLk5sK7AoBcrC3h4riWAq7157uSMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oajWRCJ07oTjTYtSSkFK8u2J6Vng6RvBNSeobHAb3QcChWzVemOkrDhfMqVPMhRNGS/YNDeBmE1gzBbHsjclRmWALiLHlUnSQLnQBAl/l9uIRQufCIsqBMqigg+Vm25eR+cL8RYFwwYOL26I/2Hb+FZzvgii2GlMEPm4WxhhIuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKHlAe5g; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so3369827b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391748; x=1766996548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
        b=MKHlAe5gInomOUV9LKjnFY9FGjffG/qAnjMpipeUvkM16plrvp49dxZkU6anfuPtLo
         D10aEJs9dA25zQQ16dOZpxf+gnVP7vKpUsGjsD6zL53KXUd9DR8f6M480JGOVxWaT9SI
         lywlRUbRrY47+NhnZsZ7hQICKzY4zr3Sra9YFD5cn1/EGRZUT0ZzXGSM0bVw4nL8VDL/
         SK98BrTz0lJOpWhYmh9BTvrTUMHXOWPuL8EJG7CnnbyS0Kfwd7U0Vp+MZviECZ8A9ksQ
         rdJCb8uCsc0pitdT5cwBRkaXIRCUyuc5Rm7JJ/SGSSHw8pQRiP0GdoWYRRMUdKtZXH6c
         zlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391748; x=1766996548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
        b=P5LOO0R1OLg8lhMZg40RqE9OXq7wED1LmDF1hxcF4H3C3xoV2/6fi76jdax2e2wwCj
         oeJ2SFo89cTJhI0i04npgk6a0FpOyVXjkTi5pfnDGA/wbnk25TgQSwHEPWEIkJ3r9SgQ
         wNrWV0eginBJr3x4vFLY51SW7uTOdoI6nlyZaXMsFkC0kcKdmgoP1VhZj8B4NaS2JIT0
         LWurikIzacmT0c+gPJU1xJpzef/7hgWNn7RTYyETpT6qnmHwYRcLMKSfA5kla+ruzpJF
         i5GcNneyo/jVoTFbQx6ax9B3t1t33CtUU/13kDqFW922ipw1fhcmyszJDk+YI4gy2++F
         W3dw==
X-Forwarded-Encrypted: i=1; AJvYcCVBuPEru5GNLZahtHuZl0zzSbNW5y0JLyM65tXdfBd3pshxc7jJhCmPNI8evvmEeDbeZsWM9l5zNNdGaRQB@vger.kernel.org
X-Gm-Message-State: AOJu0YynPabSVp13af7UMFN9z8VwEzkZvSuvPn8vBGOrjlO6LNSXFMV5
	TM01e0cq5njyPIpqboAc2679Jq/59rhwxYMIjL+hN1j7ALF9xxYR31L8
X-Gm-Gg: AY/fxX57URpXKy37qX+BqXee2MavBU0fJQOLwdCaScgD+daqoHEPfluSLSZO0AwsoG9
	SLn52yMqR+A4TSUqOy/EA3doWfqZeqPY2bVqif1Me2aUeitqDPt0JiCIs4kkpfk5CB0ercXF6ab
	mwnml9TKIvlCjjtOLXQIbtiTpDezn1lCKHoq2rv+pm6TXgP0D9VWZNKsJDLiM9iwJkru6aNcdaF
	A9t4rNhIt/PzCJiI1EC/KAjg102Ry7JmmgyErmuhNiqgvbxiIwnS+UkQy94FH5nr6p050T/B0I0
	kWD8itECF08jkFIEe2geHj8PxQDFhI8uTrA17xEwnz3bBoRUqKWmbhuB+Lj51udWna4amcBiwjF
	WBxoS+XtHyAFL/dua9UnIuhNGRgOmSyrHpfsi3e4eLQXpdeFtO0O5B0hn5XTE3T7vDMN6fR6lIf
	kanqSnp7MI
X-Google-Smtp-Source: AGHT+IFIaB8eWc1HtVa50QiWjAkChZ0TUx+nROmHgF5xveLYAYPTgHVZsZQQy8Wrx7bUcj5BQhCb5g==
X-Received: by 2002:a05:6a00:a24e:b0:7ab:63fe:d7d5 with SMTP id d2e1a72fcca58-7ff648ed939mr9692669b3a.20.1766391748333;
        Mon, 22 Dec 2025 00:22:28 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:27 -0800 (PST)
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
Subject: [PATCH v7 06/31] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Mon, 22 Dec 2025 21:20:23 +1300
Message-ID: <20251222082049.1782440-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index eb5146bcfaca..cb171088850c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1165,7 +1165,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.52.0


