Return-Path: <linux-arm-msm+bounces-73034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 923EAB52596
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5333E3B0C01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043AB212B0A;
	Thu, 11 Sep 2025 01:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="erzMcrMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F6D200BA1
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553149; cv=none; b=RuaqdDrnq3waWTWHw7aQsQw8a18JCFHaKo2iBI/du87dbIcIOniACdAyZGbsFbu51ihFH21WfvNhEMUyYXo993jN8vF0EOcnTL5Z5r+fS96hyWnW0jK/B+XtlNPGG2RsPo0y9IacwKvjO1+QYiQTImoUUVk7qvZ/zdENWm4njAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553149; c=relaxed/simple;
	bh=cu8iAZHj+6qkt386SMbUZdsdGoa0y3ICoc1L/S+KRTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oIZ0dgrxOlEesX2+Va9aVNbYj/PQ1Fmdo0fN6Kgpejj8BbitYxdW0v0cqpSoSXbUKc8RPyXXTCp3BhQCD1MJrEmtF0/A9l4oHiozypMGyNE5KOxQU+pH3tGGVlqT8d6MX1VYZI+vBBJrLUTao3cH6e/MjzU5vG2de1Fv2ZzXB+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=erzMcrMU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f6d63afb5so18010e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 18:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553146; x=1758157946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMNmnJ10e0LO0vt2oBnZUmZ41g9uNaKIbmtY1QUxYIo=;
        b=erzMcrMUx4Tv7DK40KIyfWsdL49t9+xsZusFH5ROuS67CpuKK43Kn3/xvj+4LcYoEY
         IZqFu2wVuxu7Y4at3ruc9CWeeTGLaDNareT8+3i6uDC5Qx6GTbio6FO+c0w6D5TMqDwz
         RNXwJj6MKokvzIp2v//seQjNvb6CBnrP4S+oQHxKYH2DwHK+Qfps/vCdLAMXYoyr1//7
         UlZvMCeuAMv/LbmYsN7zbzRnpZ/AEFf+UjyNu8SxyFyoz3zVy/ELDCw3miU1Y1YxxLUj
         3tPsucBo4aqId6MQfRFTFNYNr9zRqie8r9O07GOius6eJy+aFN2jZsN35HelZtmhz9sA
         e/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553146; x=1758157946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMNmnJ10e0LO0vt2oBnZUmZ41g9uNaKIbmtY1QUxYIo=;
        b=M5vg8jjfIhHREDOIboBEwaPGvVdEJjByZMlSREe3WL2ugDX+aJjOKHJOEk3wXNuIUb
         AqYCx5Ox0tsGtQGSYCknh7HaQZOJzIc6xbrgwwN5SUPu2vEH8ZS/K9dyYAMDXKpHlcfF
         0zKwi23jEyjRiZKGR21xjqtZq3VZCd3wN+M39gnp21/eBxAObFXxmY7ur4Ca+lG+5ufj
         1TZzCLIzPY9tomRQcrRPjvAdh9pkeOHrAxsHyKiHgpJUz2Q7NFsV95YJ/6I3tjhF3qhP
         2MppuMR5fW8ipDnDUc+KiYQq4NPhSLfuJmwp8GqC8ofxDwhsIEq8q85VVq31zJ8bXviO
         vMrg==
X-Forwarded-Encrypted: i=1; AJvYcCV+VGPxB2P2LyLDd3M1yelygI7AP1eVCxg9N529F3iAhs7mO8hD3hm2kVeCO3OSrVGQBHksq7P5ynG+NuoR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AGrV4yhBhyCzA3OavC4/rlsU8DuQfgl8+zx++zz9Blxl7y5Q
	nmQF/liTYxhv1JCFsq9cAKVI5XcviWRJE6E6uKpk4buESAaQg21vlvZ9mEbLvR74qJM=
X-Gm-Gg: ASbGncuGceQo2HuYuMh+JE4BB4LoDYMvU8YQQ8YAx/dzVpEl0xMGmRep29/4HoFdAwf
	252VPetZ63XtiqLt8JVq1q/O43hWQfqACLwGS/z6l3iYbyDqhzS93jbFZzeL/JEBEpiTK4HELij
	7yl2CIwVl3UxUyuQC5GUPu6fBct9oAnv5wjcJUWjkw50GBfkFFqsLXvewZggLqORuioDixgtW+L
	Fh0kDs2nvImo+UXoJOxtlG0GYzCAcHsJeXcTG8mSQvNAnhm5MPDmeOYcCDQ8bWfNe03tH532viz
	O+/7YiWqdZVOf6iN9XVN936xdhyxzeIVgjnBQA/yCY+qvYjYNFLV73flq7jpdF3FlQLHRpmSE2d
	K6rJLOOx5UKJAN5NcRGvBvqIVKx37pw9Ds0AQdmjxN6FEvwlquJJ42jExSpPxhUstYgv40IM=
X-Google-Smtp-Source: AGHT+IHl1UVlJE98JqIYihLtl7Y+krBO7EyUtFwQK9Syxwl7imCVLs5qu+VriWXxkVFZJzXgzqLolg==
X-Received: by 2002:a05:6512:b91:b0:55f:4bf6:eff7 with SMTP id 2adb3069b0e04-56262b36244mr3029452e87.6.1757553146001;
        Wed, 10 Sep 2025 18:12:26 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:25 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
Date: Thu, 11 Sep 2025 04:12:15 +0300
Message-ID: <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Titan GDSC power domain as a parent of all other GDSC power domains
provided by the SDM845 camera clock controller, and it should include
IPE0/1 and BPS ones, even if there are no users of them currently.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index cf60e8dd292a..fb313da7165b 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1543,6 +1543,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1552,6 +1553,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1561,6 +1563,7 @@ static struct gdsc ipe_1_gdsc = {
 		.name = "ipe_1_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0


