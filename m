Return-Path: <linux-arm-msm+bounces-12504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C128667EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 03:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51BAC280F87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 02:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB90FDF44;
	Mon, 26 Feb 2024 02:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SETr7nFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A633EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 02:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913517; cv=none; b=iBoI/dQQN1Uza4A55Pg5R70DJp1aZ2CQbsC2zwV25YAhULpJ4THLl+67uz6QErmFao58XlzWgwSkA+qjfKYiYX+pXlmDZvIM23yLojgNv9U+j1DtXR8HdWoBRnh0QgMxFx6jk1OldNLMdfQQQN59qFy9DDqPsX3kKpT5AU4qji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913517; c=relaxed/simple;
	bh=cdm61gYGUySsFxPZ5ngtMYEu8AnIiXIGfprwz9M15j0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RUr4ykPX1zx0ySZgDxsp9xB536E0RRqbP7hQis4w0SIPGQPX1plQknKnO/iyTLPejFu626NTX7xomZwH3O0yD65NZX/pbD9gfZyo4Fi8W/KFnX1lQZLzxaOvGWJHpduRhSiUk+l2wi/QjpMxSfg9kVk2XvwcIpTNgELbqzL+dq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SETr7nFg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512f1c95a06so1580369e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 18:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913514; x=1709518314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3E7dzOhxFiHb1JCqkhJvLIWTzxr8XDqqA0WBoNbgeo=;
        b=SETr7nFghbbOI0G/a5bafZto2x4LxkUrkS4qwT1eGqYTpTzcX+/mfn6i+6yNRnlrpG
         ti5yTRk/UU8C0aOncZ5Qc+OffuZjThrFgBJ7UREo8+G3h46G3b9wmHkDa03wyKAMKxb3
         cm4zwakBgn3EajsORwZnDaHQ+HEWSHZypk4hOBRkyO8W6EmaTV0TjGoeQo7HVp3xlmCf
         86rL4fGUSvqkw5TduqiSf6kO0wW1xJNItHLFjtmVUPexcte33XnJb4TBpQ2tAgHTsqj3
         woRvDODaiVQZ9x/s40vfhXXveVUhqklQT1fF7jSFDv5ba3M97z7gQRJgi3KezsSTkicF
         dZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913514; x=1709518314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3E7dzOhxFiHb1JCqkhJvLIWTzxr8XDqqA0WBoNbgeo=;
        b=T/i3FmUWPaxaqDAZ9460OOKkogbNbDBcuaO2kq5imIs7+Le4Apm4NZ31Xax8t98oj7
         VHFjusIIygGqXlaKGtf5R+pQgfEZxW4wcCZHFiCF3WLy750TU1xowMVgOI6UT4x8Kt2z
         sXsSJbjNkj0jzd9PqU+V3gByLSNwP3rM7dGQvbzVgClffucZR6V4dgQDgHgBIDm0bpt2
         1DuGndjQFNR1zKSoI4rDEWhnEKYAehOJz4sCyjP/mZa4YaTsQ+hWT98PlZH4M3NHyMds
         AgFgvmmo64htFuiJ2QKxEujmX8s71dbC74iRn7P7RbemcfRL0DsT7yKmwTZkt7nUms3k
         PY4w==
X-Forwarded-Encrypted: i=1; AJvYcCWhZ0brA7E8YxBkWJNvG7ebNl/UNW2HFMvYB5iZ/zXgif2f9xX0ND0wwLNUe5/o1KMAN6Oe3G65qLTGBh62j6zLuTNISx7xIJS9gaDZQg==
X-Gm-Message-State: AOJu0YwgGaPnJ+TDnLlOVAkGekqFyi1eiVScYTiU8bNGPSnOUihau1ic
	8FVSN+hV8T165lUo2WznJo86KuMpwby4/xqcMhrWsKLosvf7zBlvE/MSZfOmSJg=
X-Google-Smtp-Source: AGHT+IELdSvsYandsvUg2/9kXl+Uxy6kAqgjNUnscBWDJrEMCJeiyutSYFowciKyHufpcYsErIDaEQ==
X-Received: by 2002:a05:6512:2007:b0:512:b43d:6694 with SMTP id a7-20020a056512200700b00512b43d6694mr1524362lfb.32.1708913514398;
        Sun, 25 Feb 2024 18:11:54 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:44 +0200
Subject: [PATCH RFC 08/12] drm/msm/headergen: don't output full file paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-8-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cdm61gYGUySsFxPZ5ngtMYEu8AnIiXIGfprwz9M15j0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NhT7+nEsdNbK4/t6/GWM4DvV+yrpaxToNms
 1msEgdr7MCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1e7GB/46EXHrORsKwaZpnKqF3lwzDU5kEbixRHeZy/SKsQys8wDF7msZstYUfIfros0SjXuGoJK
 Dnkg92e8E+Aa/GXa3/qWfkJyBPoeSogz78JZvkb5iGhuQtwqjBVXd4S6bt84CSWqyCuN2Hn4OwR
 JSEJKGu4AKK7xgMekhm4rGTlO71vF5cFSaJGR9gWtV4JncK9yEV/nWYgAp5kMd/v1/Cm85zBGaT
 DWhIM/JBGe7S+XnNITrRCrsy/HwgjSwFvTr7eKH1wb9+z16h/UIbqVWk08eguBjp14TwL41ILeY
 BFsjSb0hpnYqVsm//J92J5mLTKGYUaI9/tOZHzQ65jM/CN/1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to reduce noise, include just the file name into the generated
file headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/headergen2/headergen2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/headergen2/headergen2.c b/drivers/gpu/drm/msm/headergen2/headergen2.c
index d5a3eb7562ee..2e5c4593d865 100644
--- a/drivers/gpu/drm/msm/headergen2/headergen2.c
+++ b/drivers/gpu/drm/msm/headergen2/headergen2.c
@@ -377,13 +377,14 @@ static void printhead(struct fout f, struct rnndb *db) {
 		"The rules-ng-ng source files this header was generated from are:\n");
 	unsigned maxlen = 0;
 	for(i = 0; i < db->filesnum; ++i) {
-		unsigned len = strlen(db->files[i]);
+		unsigned len = strlen(basename(db->files[i]));
 		if(len > maxlen)
 			maxlen = len;
 	}
 	for(i = 0; i < db->filesnum; ++i) {
-		unsigned len = strlen(db->files[i]);
-		fprintf(f.file, "- %s%*s ", db->files[i], maxlen - len, "");
+		char *name = basename(db->files[i]);
+		unsigned len = strlen(name);
+		fprintf(f.file, "- %s%*s ", name, maxlen - len, "");
 		print_file_info(f.file, db->files[i]);
 	}
 	fprintf(f.file,

-- 
2.39.2


