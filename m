Return-Path: <linux-arm-msm+bounces-27570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4494355D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED1F1F28041
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152C14502F;
	Wed, 31 Jul 2024 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="fhwjlk3e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="zLFYmuvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C706F45C1C;
	Wed, 31 Jul 2024 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448807; cv=none; b=OUeaZvJBxZbckArVYwOq4pBiX6GHm2Di5P9wGb1SOz9vxxpOeGRAl2cFxA1gePhz69cw/YSCinfUOi1zqptC1oswQikwoDzjrOFZ8yR7blQ/GlFWB5s9KedaPDciSwaVJk3+57kmYAFvx06AQiSsd5/o/Zd0xL1hSJrwa/ejHKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448807; c=relaxed/simple;
	bh=DRWYUeL5Wd/Aad2SBfC0KZ85xMPhI1fZWPbTEED2/54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3KgHgbKZTBBilY0BAy9EZz/PhX9NSAL1DZOf+cm0EprAEU1ZDCZfWlycDIvMvN/pOXKrzDk9WHqs4VztfMtxJkw/e5DFXK+TeZ4DVIdFc9JG1ZesnQd/WczfGq94xWIWb/X9Ba2AawdIYlu6XyUgfWzzx+89kD3KEXVQXvgTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=fhwjlk3e; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=zLFYmuvX; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=DuBKYXoBEOi4ZLJ5i4aSUwp7e4Ehv/jv4NQduzcsyiM=;
	t=1722448805;x=1722538805; 
	b=fhwjlk3e4ileDOI6Z8H9uc67K87YWWh8yjn/pwyvjdqgQAukwh4Qf/HFwHgIwmgEi5g6cINBfX7U8hmpqwlUvrcOOChWOKyu3zTXthXC/g3iwzueHoiYS5x12ebO6JkXev35JU/N7W+dM5bIfCCE+VjEETfBmYmZpwdl5hSLEus=;
Received: from [10.12.4.15] (port=59050 helo=smtp40.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDcE-00ANdq-EM; Wed, 31 Jul 2024 20:59:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=DuBKYXoBEOi4ZLJ5i4aSUwp7e4Ehv/jv4NQduzcsyiM=; t=1722448798; x=1722538798; 
	b=zLFYmuvXHSwL/BGhJW/eud9Rlx9xRNYkn8PToqRpMFA1rMfp5VX/AlZesHW7FVbrV/X6ADvCwlZ
	E5F+cdbXmB7QartX2fjWVGW6ndovuB1e3LA9KFh+B246DDiBT7MMVHArDXtC9n3zhda2jF2iDhRDr
	wIR2dE2QKfu59VB3f9U=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDc0-00000000IYY-3uJG; Wed, 31 Jul 2024 20:59:45 +0300
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
Subject: [PATCH 09/10] dt-bindings: clock: qcom,sm8450-camcc: Add SM8475 CAMCC bindings
Date: Wed, 31 Jul 2024 20:59:18 +0300
Message-ID: <20240731175919.20333-10-danila@jiaxyga.com>
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
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9C7DD05013CA63362BF18B36FD939231F182A05F538085040203BB72574EBBC693DE06ABAFEAF67052F47EF61CEE40D1AF806485F292FBEEBD92625EFBC59CE93
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE742D9BD90C58D50E0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637334E2757C55E8D4EEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36AC26C8500C10443827967648F3D4EFBF3246D7C7E03E3A6AA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE73AFA331E307B52169FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C37EF884183F8E4D67117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF3BAFBCDF8379C95DBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B63247F7D7586455C976E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249957A4DEDD2346B42E827F84554CEF50127C277FBC8AE2E8B2EE5AD8F952D28FBAAAE862A0553A39223F8577A6DFFEA7C5B09DCDDD98ABCD243847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A50394500F873E36545002B1117B3ED696040B36CFBF90B07E219207EC0A953D2C823CB91A9FED034534781492E4B8EEADEEA082C9A12FE455C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF73609386D26EAF31BEF254B21234941394DAAD25D62DCEE448CFBF0D31EA94697649A938D59E33ED1D9D8FAF50ED830B0132AD4C5C19D71CC126D84212B092F645C67F40FDD86F3C983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3u3lxlPhQmU1g==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981F091418BA14BADF0F6A6F50B1491C035C705623655A787725BF527D83450CF422C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CD13D22A8CFAE84BB7049FFFDB7839CE9E45E89A588AFC0705E86AC6F58E54D5002271B73248EAA73617DD740B0BCDD1BA
X-7FA49CB5: 0D63561A33F958A5D729B438B1916161DF3995E8C597D36442A2263052D1DCBD8941B15DA834481FA18204E546F3947CE30BDB15EF888393F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E2A97CBC972F7482389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C393E899A2A207F19735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3vqKsfDj1WTyw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add SM8475 CAMCC bindings, which are simply a symlink to the SM8450
bindings. Update the documentation with the new compatible.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 2 ++
 include/dt-bindings/clock/qcom,sm8475-camcc.h                  | 1 +
 2 files changed, 3 insertions(+)
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-camcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index f58edfc10f4c..2dea246882c3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,sc8280xp-camcc.h
     include/dt-bindings/clock/qcom,sm8450-camcc.h
+    include/dt-bindings/clock/qcom,sm8475-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -29,6 +30,7 @@ properties:
     enum:
       - qcom,sc8280xp-camcc
       - qcom,sm8450-camcc
+      - qcom,sm8475-camcc
       - qcom,sm8550-camcc
       - qcom,sm8650-camcc
       - qcom,x1e80100-camcc
diff --git a/include/dt-bindings/clock/qcom,sm8475-camcc.h b/include/dt-bindings/clock/qcom,sm8475-camcc.h
new file mode 120000
index 000000000000..45444160d465
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8475-camcc.h
@@ -0,0 +1 @@
+qcom,sm8450-camcc.h
\ No newline at end of file
-- 
2.45.2


