Return-Path: <linux-arm-msm+bounces-27562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B7C94353A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 19:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C70541F24EBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174EF3D551;
	Wed, 31 Jul 2024 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Pl8TCN6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp50.i.mail.ru (smtp50.i.mail.ru [95.163.41.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2723BBF2;
	Wed, 31 Jul 2024 17:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448783; cv=none; b=Y9pgEKAsmmRIgS7IA0SaJYnn0/MwVxwCTRh3JBHxxO+31es7/m3xQjMNO/uBrsVnPIbIFgnsmxv6ZDoKTUFUpqGiSYLkBmwOil+cvoMr7GjpkyE0s9mq5hckpFEFqJAQww6oplZcZfoOVLMRuY5nJi0KWGSTPRA9+cesVFU2vyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448783; c=relaxed/simple;
	bh=sepzBZbo5S4wxHuU5PvIDQ2qNh8ZTBZ0kIACcOT4boU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NgFaoN5PSo2dGmZDHgaXIKZZ9wmPXOhAAe20iM3u/2WsdKInsaCDK5UcUY94qMHFaF23acVEPPy8pvQPrlVabwVGilfbGjdhHenPa+oTELAPQBuQmgFe3hdOw+Bcwvem8kyMtdOFmz9lhJhFa4KPB8c7MIg9KNMyGHJOrM/L5zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Pl8TCN6z; arc=none smtp.client-ip=95.163.41.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=/2qEi1U67p7rT2U9srP/x2VgPp+R56cbyTi3qyShb0k=; t=1722448780; x=1722538780; 
	b=Pl8TCN6zzj37jIa1TvJXgGB4gHbqNsAS2gELdnI+b/Trto6Cy7bcvjbb0EusZf+7EClkrhr7HdT
	t1nIZV6OX048+dbW4F1SzPusQkb8vDav2rstOJvgKPNjrCOu3yvav0ZYSLuJ9Ueredt3A/eIRTBiG
	9ankF8hgJMBI9/MptBI=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDbr-00000000IYY-3kS2; Wed, 31 Jul 2024 20:59:36 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	vkoul@kernel.org,
	vladimir.zapolskiy@linaro.org,
	quic_jkona@quicinc.com,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	quic_tdas@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 05/10] dt-bindings: clock: qcom,sm8450-gpucc: Add SM8475 GPUCC bindings
Date: Wed, 31 Jul 2024 20:59:14 +0300
Message-ID: <20240731175919.20333-6-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731175919.20333-1-danila@jiaxyga.com>
References: <20240731175919.20333-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-5c6c85c787-mv4xc; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9239C2541717B5AEF810C4A468CE7865A182A05F538085040828782CD0F9400B43DE06ABAFEAF6705CEB194BA29321884F806485F292FBEEB4AADF9F6CE649D98
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72E4E5201E1C2E308EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372A285F85D463FE138638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A7FAB4BBB595F2D1995830582C796B18C773B3E217A6BF79CC7F00164DA146DAFE8445B8C89999728AA50765F7900637CAEE156C82D3D7D9389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8989FD0BDF65E50FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C643FE6A0CAC512C76E0066C2D8992A164AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C315BC0253FA1F6F8DBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A547D4AB9476A8852B5002B1117B3ED696525E9066CF53747CE99897350C7C491E823CB91A9FED034534781492E4B8EEAD3CCD70CEBBF18A22C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF71651644A95D14BC3DB42D57FE8EB39BC137674BDDCD9064EB4EC66549801E8291CDF2D9493459101D9D8FAF50ED830BCE220414A42506CEC126D84212B092F61FBF512C83CCE8E7983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3vJJva4ZJNB7A==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A1FC0BF4BF26A8A120C74B26AAFF9345D90562361E7016D676C0A7950F1955FF2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add SM8475 GPUCC bindings, which are simply a symlink to the SM8450
bindings. Update the documentation with the new compatible.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml | 3 +++
 include/dt-bindings/clock/qcom,sm8475-gpucc.h                  | 1 +
 include/dt-bindings/reset/qcom,sm8475-gpucc.h                  | 1 +
 3 files changed, 5 insertions(+)
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-gpucc.h
 create mode 120000 include/dt-bindings/reset/qcom,sm8475-gpucc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index d10bb002906e..608fe63fb43a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,8 +15,10 @@ description: |
 
   See also::
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
+    include/dt-bindings/clock/qcom,sm8475-gpucc.h
     include/dt-bindings/clock/qcom,sm8550-gpucc.h
     include/dt-bindings/reset/qcom,sm8450-gpucc.h
+    include/dt-bindings/reset/qcom,sm8475-gpucc.h
     include/dt-bindings/reset/qcom,sm8650-gpucc.h
     include/dt-bindings/reset/qcom,x1e80100-gpucc.h
 
@@ -24,6 +26,7 @@ properties:
   compatible:
     enum:
       - qcom,sm8450-gpucc
+      - qcom,sm8475-gpucc
       - qcom,sm8550-gpucc
       - qcom,sm8650-gpucc
       - qcom,x1e80100-gpucc
diff --git a/include/dt-bindings/clock/qcom,sm8475-gpucc.h b/include/dt-bindings/clock/qcom,sm8475-gpucc.h
new file mode 120000
index 000000000000..2ba622290833
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8475-gpucc.h
@@ -0,0 +1 @@
+qcom,sm8450-gpucc.h
\ No newline at end of file
diff --git a/include/dt-bindings/reset/qcom,sm8475-gpucc.h b/include/dt-bindings/reset/qcom,sm8475-gpucc.h
new file mode 120000
index 000000000000..2ba622290833
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,sm8475-gpucc.h
@@ -0,0 +1 @@
+qcom,sm8450-gpucc.h
\ No newline at end of file
-- 
2.45.2


