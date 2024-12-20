Return-Path: <linux-arm-msm+bounces-42939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B7F9F8E88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD11C18902B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C691AA1F1;
	Fri, 20 Dec 2024 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vuWkiM2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5B91A0732
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685428; cv=none; b=JFsx1qffdmUcqnkOi8pRmZX1pmPK0ME8Da02IqNEysvAoblkqcrEyHx8pNYE3Q5pk+2LjVis09Yq/zYJ9AuDNJ4NHj7a98ZEIjJBOpUEAMX/Rxr7Kjs1G0YVsPWlXCLdZH4bCR5wf0E7v4wTLt3Beg9G3FC+iS1N2AsB1U5Cq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685428; c=relaxed/simple;
	bh=DbfIVgwdPOtjGyPYp3zFC8cSx0e4NRwlmaO+ILtD/1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NxsmIWEs3Z9lE09tIExKA6s3ELE8v/UFp/QUPOqy9UIRaY/ce0zWkV7hEq+GauJHJpAC7cDYQo5W1w01ytIyh0/RGvlRs6elQ8t1B3t+yee3p5VvpIY4PnNPLcCzVgCEvxCHmOzRvmHOaZsTNCvJujSdy4YpS48+wnkjEfzxRWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vuWkiM2X; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso11190665e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734685425; x=1735290225; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TKQF6v9mjJTHAGrz+anbwJhJc4N1fYhnSvoLIwg6Hw4=;
        b=vuWkiM2X2LurHfl3/g+Jj7uFleBh8ZZDzDqFryqzDp9kC5QIc8gZ2WbFhc/TTsyN5x
         IZs3kh9hl0UccvbDEYBOQlMdhXagX4bHcRRIIpbJXJTN7sFNvQdDSmtaXQhTOYRfeOOz
         M4ZKV9qzuxEcw3FGFo4lOazlVpYOIrfLPFZBui5clscZelSHKo2L/PXSSuIa1Qknaf6K
         UG5DwwVxu45S4zgKRNtr7m7EfpT5X8/rjvxsgFYATcKobrG2D+935LQAUH5+Adufgl6o
         OTEuaH51tfS6q5fjpO1mnZTTH6XBgcHK3oKjQB5mT4ylM/e6BD8ldfwIbiri9Qp7VUDh
         tE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685425; x=1735290225;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKQF6v9mjJTHAGrz+anbwJhJc4N1fYhnSvoLIwg6Hw4=;
        b=w7w00PbTsk0u1xtVbUFwQX3CMlmtiDFwHtZUaJZ0Tesmao5vwHVP1nhzBLZc2gsPLr
         emJoEhTGBvcx8eY1eFWPv6ZahoQrv+QxxY7kDVA+ryUh9atXK8PeaR2QL8vCUlPA5WLG
         AU16qEU5SCtfDxROdkUIokHBpyS0o9YIKolQ1A4wm3Mnum2D2hLdwFkmog3VduLaX7j5
         4epmdt7XujAonJGNKCw5zIcEMTTIJ519/G3vbv3wWeInLwrolKC190gImYw+iPMep7Di
         ml6k2Roe8MeOANkpc77bQGIpwQf4Jnbo8okHeyAEWGR0/jwL6nSRBZfTdDefdp9m/efq
         j8fg==
X-Forwarded-Encrypted: i=1; AJvYcCXn+0l+N4F75W8f1vupIhLEc/RKNLnmfUOg2wxotMB09o+1GvrU6sVrKKpAI+0hqkVKgOIhc6jYGyXjkTJx@vger.kernel.org
X-Gm-Message-State: AOJu0YzVhIKoBTjkIjYUUabFKh+3T5bTq150SXE6BYb5U0CachmsF96z
	xIYNiiyw+qm9l98cMXHZuunpTEbM96kKA7+EgKq17uNApMq0yITCwvajhUICiag=
X-Gm-Gg: ASbGncvrXAU9SmNM9cx0yzxVu+C4/ps8hRvgEXEtfjY05dkgw+tCxZYRPaVvh+tq2YX
	wyGAHMW170vcqG8CgOLuVUoIUB4DYUQQVAuxWUumUT6lWp3NFfTVpwpMdSiB+sJyY+PmDPika4J
	V1PVUg/T4JEVdh1nyE117RhAqPo7lhUIbq81uo6x7jAThtmKyJrCIMEahH1Tr9xGQIwCS7dw5l2
	Tun/7WQaLj3ohiOsXgWotJr6iRjFJ6CRDzvEFP8oDrX57yv5z7Uat2sJMZV+uddhqbLQPai2Sym
	HceRcZmUwTPfOKWYyYVIhIVA8O/opg==
X-Google-Smtp-Source: AGHT+IGSHfVV7ZgeNmbzBWx67alIxQ8s1vI3ArjQYk5K4x5dU5OensPI2MOkBdI3RPTXPnjlqYDKeg==
X-Received: by 2002:a05:600c:4f51:b0:436:1b7a:c0b4 with SMTP id 5b1f17b1804b1-4366854850emr12697055e9.1.1734685425468;
        Fri, 20 Dec 2024 01:03:45 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm40610375e9.7.2024.12.20.01.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:03:45 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add missing parent_map to clocks in SM6350 clock
 drivers
Date: Fri, 20 Dec 2024 10:03:29 +0100
Message-Id: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEyZWcC/x3MSQqAMAxA0atI1hY6OF9FRKpGzcJaGhFBeneLy
 7f4/wXGQMjQZS8EvInpdAkqz2DerdtQ0JIMWupCaS0FH5UppfA2oLvGw3oxS4PtVClbqwZS5wO
 u9PzPfojxA5EIHo1jAAAA
X-Change-ID: 20241220-sm6350-parent_map-c03e9b61a718
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

If a clk_rcg2 has a parent, it should also have parent_map defined,
otherwise we'll get a NULL pointer dereference when calling clk_set_rate
on those clocks.

Correct this on clocks in both gcc-sm6350 and dispcc-sm6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      clk: qcom: gcc-sm6350: Add missing parent_map for two clocks
      clk: qcom: dispcc-sm6350: Add missing parent_map for a clock

 drivers/clk/qcom/dispcc-sm6350.c |  7 +++----
 drivers/clk/qcom/gcc-sm6350.c    | 22 ++++++++++++++--------
 2 files changed, 17 insertions(+), 12 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241220-sm6350-parent_map-c03e9b61a718

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


