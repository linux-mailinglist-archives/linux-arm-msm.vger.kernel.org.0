Return-Path: <linux-arm-msm+bounces-12498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9368667DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 03:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 608461C21172
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 02:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA34FDDDC;
	Mon, 26 Feb 2024 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aFUYWtQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E7EAF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 02:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913511; cv=none; b=TsvDo5MwyZgKFGqyo746vMNnjjMukYma+hgWBwrUXCp3jPfcpwcPOZOxAKSAS7UQcR2NYAOesoxBfn4KN04w2Th8mZQazFnHd0pOemuYpWeVnWMXh59hDbtnswRA023I/zKApVVM3WHzW6OMi/Zce3JwimwVUJ4VSq8lxLl8P3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913511; c=relaxed/simple;
	bh=GCmbOiHpksQl5QzvCUG6WPQ7hoPhwGILSxcYlA8FkiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOEwxHwmL8d0FxxTlAgbSoiFYip+i3h2JrPqC1BxAt7/4odhjrJaI/jQwSBEXkSOIuEbJHek4k1Vo9uajNy/zGNsqes2W/afpYC+MD1zgeGqde6oek6zrDyS/tIFahUASmesrtPwa1mjDNmgiYznO9dyCiQLxCpP3EJ0sJf+TTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aFUYWtQx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512bb2ed1f7so2712098e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 18:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913508; x=1709518308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YO49NCblAtKBTyW/HG28rdBp+P7ciUnjc6tjgHkhxc=;
        b=aFUYWtQxGJ7HmbFEUQU6L0admNGwZzwXSMMYX74ZjqKwYOubxaPtjD7EFcK8HLc3lh
         TmDBxkbp7c8m5IeaklSJKpXGQpnT4VsY9uWADbRZa9d5T7MT/Bp2xeLdpW2lmyguC0E0
         4b/WVNqzAQktIY5t98U82Np5zr6E0nPa5FXQ9ZHCPLWRePYH15nXbET90M4xt/FWZsEW
         mH9+n9kzDHgak7bX7w/NNjsRPYqVznDmFprXqQOrWprGyG4LoZEZ8vP0fY8aANjhGhVQ
         ygFrfgGCAawptkjpP4wxfuJHLyctQge5uYcWbpDwep+FnCEO5hGlcPvMCwOJams3pRpi
         k0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913508; x=1709518308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YO49NCblAtKBTyW/HG28rdBp+P7ciUnjc6tjgHkhxc=;
        b=RXp2p18V9R4kXSRj/fp343JsDxplGsfxWYIwi6AbjOzFAxuuUkJ63DUgRq+WhZAq2Z
         uyq8qXB2Mxg/GR4Iy5vHDP6zf6nAM2CjEEznh7SrtpEnisOU9TnWJX8cXLnQbRI9eQUR
         5UBQ+HfWNAdjvD9C83s4JmPhyNe9j4n4aVPF33uqnfBq6xYDAj97aZ94K0Sjn1J1snnS
         FqasrDhr6na0fk8foRqWTTSRrLXmfau9xxnoDdVtfN8+8Ud1REQzVhV0p1YroKpHQlN5
         XUJS8BS3h/A8TouMDpPZmjipZoClGFl+Ug9N2YdYYR85cUpm6Dc+Kv4zdSDDRNA2MZ+a
         QFLA==
X-Forwarded-Encrypted: i=1; AJvYcCXNoGkiYX7lIKlfPTAqBqdXgVT+paj1/Vf/p84eZhce2Om1ZZqYwGSmnc6HLcDo4T5H+w0RqywYCZv0sHJk9eIclaohz+NuhWqxbAhRFQ==
X-Gm-Message-State: AOJu0YxJVxUMvvmvl60qSL0bARGQUi3SsPL4KW0kgPsMCJn4J2zsBDm2
	dV/OXqqvfLNm0xsoNtiq4ZeiirjzVcN3yInQqMeLpOINGkzIR52zrI1v6OnFPx4=
X-Google-Smtp-Source: AGHT+IGM6arZuGaiRIqhoTaiESYpSqS7ARUqNQhjVEnkptr/m2/6XCawaKQgJuuQGgnyQSeG+9VzLQ==
X-Received: by 2002:a05:6512:ea5:b0:512:fc6a:2d10 with SMTP id bi37-20020a0565120ea500b00512fc6a2d10mr1487797lfb.40.1708913508068;
        Sun, 25 Feb 2024 18:11:48 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:37 +0200
Subject: [PATCH RFC 01/12] kbuild: create destination directory for
 _shipped handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GCmbOiHpksQl5QzvCUG6WPQ7hoPhwGILSxcYlA8FkiE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NggplOAhkZ4TcIUVFZRYGYJgjLoTm1ot7+w
 zpS8LPTlAaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYAAKCRCLPIo+Aiko
 1bBlB/9thCMztpjZ24AQZfOl4nGcw36lRs6sD8zWSRDqcZ7DDXW88HukH6n9X4QEYqtIrmCv3Uf
 I2u2GjCLznZKSn0lsK6JVodcOS1pxZOr9aEG0RsVOgVGNdT0UiMqBHFMdLZOMEc40hTlNMc5KEp
 LbOvELeAMQ22xduaK228sjQs3A24dUtq19IdBx0pJYjkBqG3SYhQi0+M2PbsKpmZy5ByqiroHl7
 ymxm4UCKSgEmmzxWxknN6HoVtSeZlSsejTjfDKjcQeL0GWnhE52u1JA4aOPketCWodUKkwg3Kg3
 KVqi53EWoXeS+iQoxFilQyly44dJ9U1sl/RGFZ1K1CcWnviO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The driver might decide to put the _shipped files to the subdir. In such
case the cmd_copy might fail because the destination directory is not
present. Call mkdir -p to make sure that the destination directory is
present.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cd5b181060f1..94373eeac420 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -297,7 +297,7 @@ endef
 # the copy would be read-only as well, leading to an error when executing the
 # rule next time. Use 'cat' instead in order to generate a writable file.
 quiet_cmd_copy = COPY    $@
-      cmd_copy = cat $< > $@
+      cmd_copy = mkdir -p $(shell dirname $@) && cat $< > $@
 
 $(obj)/%: $(src)/%_shipped
 	$(call cmd,copy)

-- 
2.39.2


