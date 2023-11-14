Return-Path: <linux-arm-msm+bounces-613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A43AF7EADA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 11:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43F68B20A86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 10:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB4B18C35;
	Tue, 14 Nov 2023 10:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernkonzept.com header.i=@kernkonzept.com header.b="SiabwveP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A291863F;
	Tue, 14 Nov 2023 10:08:15 +0000 (UTC)
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E7119F;
	Tue, 14 Nov 2023 02:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kernkonzept.com; s=mx1; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description;
	bh=nMk7zTRFOdK2rz7OlbU43But/2vJEYeFTpihGg8XE7g=; b=SiabwvePpKfwYhWDzfZmkNiNNQ
	3ZaIv65InR4KA6aJNFIaF9JgNoRa2C/kuMmOHZUbq1sdbczJFTJskPIpIvx8pNDZst2i6oDDgL8Ya
	fIXA/8Agl+Ru22hY67BJJ1XH6tZzdRpDfGkYYWEAEUwc0yaRFjfq8mLKEKqywU5DDV4e1k+VdYB+s
	gR+UdQe4ru9fbqlTD8gbky86aoKPdqW5x9FJ2LaOM0QzM64p9xTewGlcIuC89+4XfRfDRRXUjhQcz
	mWDy349lfOrZdio0Pxp5r4ObvXJAJJD+pUUbus17HiIKt+97xAfHNLa6U9Lr6K/mDvGj6N2toClDj
	Ul0bMbBQ==;
Received: from [10.22.3.24] (helo=serv1.dd1.int.kernkonzept.com)
	by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.96)
	id 1r2qL4-0050az-0q;
	Tue, 14 Nov 2023 11:08:10 +0100
From: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Date: Tue, 14 Nov 2023 11:07:45 +0100
Subject: [PATCH v3 3/3] pmdomain: qcom: rpmpd: Set GENPD_FLAG_ACTIVE_WAKEUP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-msm8909-cpufreq-v3-3-926097a6e5c1@kernkonzept.com>
References: <20231114-msm8909-cpufreq-v3-0-926097a6e5c1@kernkonzept.com>
In-Reply-To: <20231114-msm8909-cpufreq-v3-0-926097a6e5c1@kernkonzept.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Ilia Lin <ilia.lin@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>, 
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>
X-Mailer: b4 0.12.4

Set GENPD_FLAG_ACTIVE_WAKEUP for all RPM power domains so that power
domains necessary for wakeup/"awake path" devices are kept on across
suspend.

This is needed for example for the *_AO ("active-only") variants of the
RPMPDs used by the CPU. Those should maintain their votes also across
system suspend to ensure the CPU can keep running for the whole suspend
process (ending in a firmware call). When the RPM firmware detects that
the CPUs are in a deep idle state it will drop those votes automatically.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 drivers/pmdomain/qcom/rpmpd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 07590a3ef19c..7796d65f96e8 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -1044,6 +1044,7 @@ static int rpmpd_probe(struct platform_device *pdev)
 		rpmpds[i]->pd.power_off = rpmpd_power_off;
 		rpmpds[i]->pd.power_on = rpmpd_power_on;
 		rpmpds[i]->pd.set_performance_state = rpmpd_set_performance;
+		rpmpds[i]->pd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
 		pm_genpd_init(&rpmpds[i]->pd, NULL, true);
 
 		data->domains[i] = &rpmpds[i]->pd;

-- 
2.39.2


