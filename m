Return-Path: <linux-arm-msm+bounces-35152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3029A56DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 22:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D4D3B22C8C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 20:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322CE19ABD5;
	Sun, 20 Oct 2024 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="AXhvhPZu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="tbZQU6ln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF2199FB1;
	Sun, 20 Oct 2024 20:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457828; cv=none; b=K4qON1VU5vaLOMyzqdsuRKMB50PqUj54HKMdtILW7iacxVNgS/0gTBYWeOfYKeNaWiCl6BSJsJQDef01muGjZ2Oxq/PFtgJbyCNBhzCugJ01XqPp0DcXZiXFt5X1ymbsGo5MqZv3e6+lFGpnn7kQl/CQC6s2nD0SW1iBp9eJygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457828; c=relaxed/simple;
	bh=oKYjYfzgj/QuQWTyRI7VQcfmvSCFQSovIKjBPB2vx/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsLcXCxWkgzRlDsDmGbPqtBCCLPLMqeJJI895fxGajHwUBh1E2KJwVKrPhbeMxR03rdSKB6kczUmf2fMwUKQIMF5HiJBG+gu9OuSCjb8eklifOEUJdr6QRMvcPLuqCUU6ges0QK1+iiu1U0x9VZVbqo6WvI3TqjghICouLG0gKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=AXhvhPZu; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=tbZQU6ln; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=vGZBxZtCD2uQa4IUxJT+4n16I/SlXFZH50wjgpf3xQA=;
	t=1729457825;x=1729547825; 
	b=AXhvhPZuZyhVQsp9pznlhh8iBZnI+QSqtBAGWFV+Xsgw5CgIHAAR4K86/WAjwbdBoSRcp8CAu1QbleshS0ec1eL8hM905nQcqodthUFViHPDvz8s7SqqXz3ka2MpAPP1DiareTvehGFdavxd+dQKLZB+wgmcFVQ7T2P44Y/WY30=;
Received: from [10.113.5.34] (port=39004 helo=smtp50.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1t2cyv-00GyqJ-Sg; Sun, 20 Oct 2024 23:56:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=vGZBxZtCD2uQa4IUxJT+4n16I/SlXFZH50wjgpf3xQA=; t=1729457817; x=1729547817; 
	b=tbZQU6lnex1PX55qlTfE38DuII8J48aXUX8qymZVQAgjFFCz0lfyBBQFCOQjCfFZc8ZZ7ZsPTxw
	yTywCN6+SacaVsfk0d+KzLtUKcjX0q+MTdXgeMfucHEkPiE4uhUSI0xMJMBqnADipqF0iOD6reioP
	rHg3z9LOoAsjaDO7Bhg=;
Received: by exim-smtp-669df98d5-42lq6 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1t2cyf-00000000L55-3aE0; Sun, 20 Oct 2024 23:56:42 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	quic_rjendra@quicinc.com,
	andre.przywara@arm.com,
	quic_sibis@quicinc.com,
	igor.belwon@mentallysanemainliners.org,
	davidwronek@gmail.com,
	ivo.ivanov.ivanov1@gmail.com,
	neil.armstrong@linaro.org,
	heiko.stuebner@cherry.de,
	rafal@milecki.pl,
	lpieralisi@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux@mainlining.org,
	Eugene Lepshy <fekz115@gmail.com>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 3/6] arm64: dts: qcom: Add SM7325 device tree
Date: Sun, 20 Oct 2024 23:56:11 +0300
Message-ID: <20241020205615.211256-4-danila@jiaxyga.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241020205615.211256-1-danila@jiaxyga.com>
References: <20241020205615.211256-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92EEB9808938F525BA8BB9D7ACD544D14DED0664CBAD7D1D8182A05F53808504079EA179E24E3CF473DE06ABAFEAF6705664752B218AC0D7C43A93D006BE7B5D54ED41D986C17A953
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE782FBE8B5DCA684DBC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE77633BACAB33B95088F08D7030A58E5AD1A62830130A00468AEEEE3FBA3A834EE7353EFBB553375668625671731385B2A60ADD6F395CBFDD5A1D86E85098DEBE3D8584564F7817BD4389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0A29E2F051442AF778941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B64AAE2D1698E8717BCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C2249DF05DAA3FADDFD9A76E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B966E725657410D233AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FCF1175FABE1C0F9B6E2021AF6380DFAD18AA50765F7900637F09814068C508CC822CA9DD8327EE4930A3850AC1BE2E735DC7F9DB2523BC7CDC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A573D147946E1EB2325002B1117B3ED696644C0938146B29F14869453249F34FA4823CB91A9FED034534781492E4B8EEADADEF88395FA75C5FC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF314B35318D5E688E4C7F51CFEFF10AD9BB1B1C320A908FF86BCDDA012F7D867E669E50AE970224330B1383DF4BE982FC1BCC9AAEDD11D2F61B4999C0876C9295E5170F8520D3E3CA10F1BEBF825BF23102C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s4ad2qoPMPA5g==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FCB02445A36FA45DA9B464708D7791FD7479F2A5B85A8B2A6DFD0E1CAA73928702C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4F76BB1214CC8D45ED7B71B0E06F85DC053CCE33ABF06C568F3CF0E9FE49B69586F9C8573CB553B337075E3EC8319A4874087939224DD2A73239008015A2D73
X-7FA49CB5: 0D63561A33F958A557B3F172FA77695984A10476FCDF9A282317AC291D48BB768941B15DA834481FA18204E546F3947C086477444092610FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063756F1088DEEC39839389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3628704EBF2E554D535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s5w7S0nu4CPxw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

From: Eugene Lepshy <fekz115@gmail.com>

The Snapdragon 778G (SM7325) / 778G+ (SM7325-AE) / 782G (SM7325-AF)
is software-wise very similar to the Snapdragon 7c+ Gen 3 (SC7280).

It uses the Kryo670.

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm7325.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm7325.dtsi b/arch/arm64/boot/dts/qcom/sm7325.dtsi
new file mode 100644
index 000000000000..5b4574484412
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7325.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Eugene Lepshy <fekz115@gmail.com>
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ */
+
+#include "sc7280.dtsi"
+
+/* SM7325 uses Kryo 670 */
+&CPU0 { compatible = "qcom,kryo670"; };
+&CPU1 { compatible = "qcom,kryo670"; };
+&CPU2 { compatible = "qcom,kryo670"; };
+&CPU3 { compatible = "qcom,kryo670"; };
+&CPU4 { compatible = "qcom,kryo670"; };
+&CPU5 { compatible = "qcom,kryo670"; };
+&CPU6 { compatible = "qcom,kryo670"; };
+&CPU7 { compatible = "qcom,kryo670"; };
-- 
2.47.0


