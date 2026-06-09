Return-Path: <linux-arm-msm+bounces-112194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V2zRLRUiKGok+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21573660FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=HgUYKcYi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112194-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112194-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE9FD305F708
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EDA34165B;
	Tue,  9 Jun 2026 14:15:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFBE34104B
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014523; cv=none; b=Tpq2Ra/gmq9aI6NHS/dvHfrodou5ncai4hYGxcfuRgOb95H8OMrXluUzLT0kGl39HooSuV0LlOVsyDiSgmiINGulEu5MOT9RbRxUplneZP81gAkPgOrb2LWlw5ZFzjG7qt08o32tfSHRN3eAMsOt/6fsMelZcV4w4ZQMPFT5TcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014523; c=relaxed/simple;
	bh=sV0VOlGASc3Xy2ajSqvXCZMafWxAmReEzI23gc91Xdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+nI32q1x0JKxAMFbF5zZw0WzlpFvFDNpMzz4ZD6XOhcyzP6ZlyHTMAlCqHojHERoNdlK3zCqWroA+HAEywHMeoY0wtwH6dDUvA5JCm+03A71RscOOdjLJPGXTxoh64Dz+ChWz/acA5kVCEPNohfkrzFA2eNEt/iKZ2nBssEr3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgUYKcYi; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45efb698ef2so2667005f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014519; x=1781619319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruS6RTBjxVHuZPL4Ne2Tr/Gv3lV+oHaTmX1GUMR3Q3A=;
        b=HgUYKcYiDYSUs2oWOFKWpiWeEfZ9i9ZkJKhPQ/hqSJRmDeTGMX2EBW60GJq46lCBu5
         TWFaHlWpWhm+rlpyItAY7X2C1MyJjh2S8h1yuLlUVjDIi+uEuwR50tN+7Tp0WluaS2hV
         HC1LvjfhLK1dnMLzz8iS1vtUDRwYOwcg/ck33epBPOrm9E8IoVTQxCB2uKPRd1RAE/h+
         q6DvWa9SFnhqcwNv7cuaKm8lWYYorE6UvCjdO6bLff6Vey7kfhPpbn0bnUAicDDL4O+4
         B2l701Bt7xx5ixOenyswJ43n/BDQnCuZ7+xUUit9LCmnD/dq+xCfPXiasDCI/pdIw6m4
         aQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014519; x=1781619319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ruS6RTBjxVHuZPL4Ne2Tr/Gv3lV+oHaTmX1GUMR3Q3A=;
        b=em/WKDB5YSSMsnJW8vfM2B/fPcza08o1a+0HXPbz+tlhWzJJo40ccgBEaqpzRzHthw
         Kta3kWxyXb1ujDq2iQcTy8GjGMp/6d/6LEjmxZfdxsq9R/AK5KBM098hMYjpJzF3bP5X
         nktPn9Ke+lCOMbS7gSdpsVdk56wN8IlPFLsztQeeWxZ9S0KVq3l2rtFD3U3KPrs+hbzW
         5Aw4jYKII/bDFtC7WCzCnKnFNDNzUXHJ72tpbuKq6KPbKKdAJPEwIzU4zDQV8UankoYX
         PqvBuEdULpgR9gVOeYFMxRCz6D3yLXC2DnLgxs9VP7Lq+DLkltt4fAO9iImZgWR9bikp
         Zqog==
X-Forwarded-Encrypted: i=1; AFNElJ8sGmiMxy6yHh72Io1SwFaJUFBsFhuHgNr55coZH5clTm4/DXUBKe3C4k9QZENn1aVcmuW7u0L7yXuTmy1k@vger.kernel.org
X-Gm-Message-State: AOJu0YxDQwIIjac2Ccu6aw4rC/LcZX4Ftz/aiCYy2aaAXbtKEjs6KWmU
	3hfetRLWokXn8jhN1J2zCgrdkjHsaIN0a7ToN4c3CILEaXqEKqvrCmdiDmGdUsyWaS0lEKBXuhp
	U8hNTE0M=
X-Gm-Gg: Acq92OFbcMjE7Yf7MzG21vP/tMqruzdZDnkYtWVyGmsedoSAkPNft3MUIU0i6MAHtCj
	gYNIi1+wPxdCoQfDSBQ6UD31lgcYTjzoIPdyr9WFlv0vdrmOk5Ljv0XiGM44+CjcyzyWddq4jpM
	bl8ul1DaQkiTCBjYLWuSbhZkDxqPI3NrN5STNZv7UmxeXMsME98Koe8Y8eUq31Kp7AeX5Ap7QQD
	nWmfnsSQJx7MLBfMNB7gRQwcXIgJl3UNldcJf+cW3OpvMd2HRxWR+e65cIfoR2qS8O9/s9NRoT6
	RwR8w0U3ilv+Wrnld8rRd95l2lWdzhTWroCn64tBMJFBGIIR/ZKTB+Wp7bGUr5mASxV5oxIiuIJ
	7mKrB/BLq0VCzckZI03fZ4UeDxf0vYJjV4o4DPMd+fl43w3U1kL6ey/o+wtCCOWmdVDOxb249oi
	6rfEt7xKSLh/R7TdaMOv3XNPb1Uu++0ikV3fI8pKojARiRXDQ=
X-Received: by 2002:a05:600c:83c6:b0:490:6e12:542d with SMTP id 5b1f17b1804b1-490c25fc0e1mr353524815e9.19.1781014518840;
        Tue, 09 Jun 2026 07:15:18 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:39 +0200
Subject: [PATCH 03/12] clk: qcom: gcc-mdm9607: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-3-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112194-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,gerhold.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21573660FAF

From: Stephan Gerhold <stephan@gerhold.net>

MDM9607 is similar to MSM8909, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 07f1b78d737a..499e0fbbfab9 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -790,9 +790,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
 static struct clk_branch gcc_blsp1_sleep_clk = {
 	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x1004,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){

-- 
2.54.0


