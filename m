Return-Path: <linux-arm-msm+bounces-28901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A66955EFC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22E991C20949
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532A015535B;
	Sun, 18 Aug 2024 20:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="P742Utpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp31.i.mail.ru (smtp31.i.mail.ru [95.163.41.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F614E2ED;
	Sun, 18 Aug 2024 20:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013850; cv=none; b=gWK/UxB/E0klvKvxzd6ftWXkZSjdg/7FBPdufbUJbdo7rrTRg7Z3kmk9onhnlRy06BvUTetG0WdyoIvMmjrFIGk0X3N3uaAswxsool6rcUo1ISKBV57N0V7SxWSVIy4R7V43jWYQifZOSROIxZCX0u/YmLhBOEdpwYJEgOPPoeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013850; c=relaxed/simple;
	bh=XGBjxdDbFiBf92H2y7NdAkQQebR+mW+d73auhu9/3yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6w4Lb/zV0XLrsakN1D9XHUkuZF+4SwLvT2oXc/mFXxPZl5V6lTXGASgbWY80tSUvLFTOjgWe/lPxmkYIUmwfIJ5V0+tlecIMPhpBVXjovbdWE4txnbvzQmSBVtgSxHLxoJTJCs5QdTmqysDmdWjjNqFZEL8dMz8PiMsWkDQIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=P742Utpg; arc=none smtp.client-ip=95.163.41.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=6+QXpNO9xu0EqLMDiVUiZFSvBg7oeNhi7Mbx6GrnkmU=; t=1724013848; x=1724103848; 
	b=P742UtpgoxvPz1ybfQP3Byts0B4A95VTpuQPglDKHsPTUyGulWbVxMPerIsAUQHEtUylXxA5ghd
	gxN2E/LXfpEJpI43sOJS7lVYwI5OFhtptc52LmbRWE6D26RnjJSQtnjnkRplsxmNrdMk2425hbK/c
	HfLXsLcdNFjhLXrUsRI=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfmkv-0000000Cqfx-3kjc; Sun, 18 Aug 2024 23:44:06 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: [PATCH v2 07/10] dt-bindings: clock: qcom,sm8450-videocc: Add SM8475 VIDEOCC bindings
Date: Sun, 18 Aug 2024 23:43:45 +0300
Message-ID: <20240818204348.197788-8-danila@jiaxyga.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818204348.197788-1-danila@jiaxyga.com>
References: <20240818204348.197788-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp31.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9DAB542EDD08389FEC0D4D473505DD1DFA118E75647FAA451182A05F5380850404C228DA9ACA6FE27F3487B1F4E9318940578E6996F383413AF803A513D5FE0BD323C04D0FE7BBCAF2B358B31A878539E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78E8764B5BC580342EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379E3352F7B355027E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D832A42800B38BB585CD7AC5B2B1C5E9D26193AAB9F03DB65FCC7F00164DA146DAFE8445B8C89999728AA50765F79006375FFD5C25497261569FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3A12191B5F2BB8629117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFF0685002530F4075BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6945E48972B8D6B0376E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249D082881546D93491E827F84554CEF50127C277FBC8AE2E8BF1175FABE1C0F9B6AAAE862A0553A39223F8577A6DFFEA7CE1AEB6AF2DA18B6243847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5C0DB4FD00A344BA25002B1117B3ED696995518304F1809A5C89B063BDC7FAC35823CB91A9FED034534781492E4B8EEAD3CCD70CEBBF18A22C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF19B0743ACA0F1028187214DBEC3E410415FF962EB3322A4F9C3B26153060D6FF6141934554CE5B5FABF86C07854D9473F7A0E9BBFB5E2BACF37AA835A6091A5E428D394706B48988F59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmYZBfGrXzd95g==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949816B4BC91EC7BB554F6750B362712FA5BD920781F96640AE6F2C09FF37BA6512B22C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add new entry to the SM8450 dt-bindings for the SM8475 clocks.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 9829ba28fe0e..62714fa54db8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     enum:
       - qcom,sm8450-videocc
+      - qcom,sm8475-videocc
       - qcom,sm8550-videocc
       - qcom,sm8650-videocc
 
-- 
2.46.0


