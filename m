Return-Path: <linux-arm-msm+bounces-98427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLl0MH6KumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:20:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3B02BAB75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7869C316C1B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286CC3914EC;
	Wed, 18 Mar 2026 11:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBpsbjZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+beUtLl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA9B3A0B11
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832138; cv=none; b=lT4A3HHeU3M3OMLg8Zhg8OuD4qTWJeFBQYSDFPXSkJe2Ys92oN0mTVyUKk3pdAEKs8Ds3oiMECTWSmZyJYh7l+0Ljf3H2oIzjoGdp/3lAndc8flT8ot3y/hFOaAUP5D4+lUTKdvsTzeSco0enBrsjHIqHRqa75UfTu2VENAE0w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832138; c=relaxed/simple;
	bh=rwd+fdD+sjWN3bjprGZY/SteXlcdMNP4NDxbH5slEHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptA6ObCuBrp2Pi53/mDf5bdhSon98zYiB5s0Xs0PuSQiEQ4AWBZdkDhq3DuB2XK81OTjvcZ3olgN3cghcb3XNwDmi7T2BHD128ZIiHkMadSmGLn1lF03pliHF3rqEVnAth97Q5leK4R01bB8E0mGocSGqnkmsfMNx3ylzWl6yKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBpsbjZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+beUtLl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9MvHW3358510
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=; b=TBpsbjZSx59FY0/u
	9lwU+bB1Dk9HqfJFUnlqQ8QoJNQIDRpoRyLfk++jBL15f5sSx/MJGC36P7ibfPSU
	duV3tKdpOqTZ7NfZzhapjK2qJb6fwIt8KgGorPT0j0LOwWxcSiT6v48Rn6/ueD1O
	tgywJttb4rSfYWqi3HZwZ80+YDnu3DGo2L0oHNRRctcrFYphkiamAN15LZAiMlMe
	nE8uQNdVnk1sH2w/6oKhOZqvHQGcwnU4scC3UZPV1ubp+NA9p0sEOz6zEYtUDd/a
	VRYEBtkbkyGL10v98zFQxxNmZyjBbtkh1fR4DfkSbA7iFBv+SL+3algykmIHVnpL
	GCtOxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0cr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so945329571cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832135; x=1774436935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=;
        b=c+beUtLlY2Kxk6Cx7oW7tdlDQo84g92lJyiTDlVzGj/JL4vjVliK6Foka7o5RqRtoN
         +EXPudwjgWQk0JbwPYbzanZ5xGkzYm46OPZsdzBQ5z4osbM1TYwSF2DRr4q273bq2SLp
         qJQQIjKpfz6CMMKu36vFLYZiEmC9InxzGjKfzKZeXz69ZWk17BOlWb+U4usOCkoqTEs6
         69GzCC6dIOXKtm8x1MPpH/YFJGGXevVYbEIStyB25SkaXnfPQYgKrEjAWod9ZK8vxoG9
         0loRDcJoeAbQKSy6TRufMKtpSGdccJUWSc/QBWG5mY6RTvzxt5dhEX5RD/Hzxb6iftWb
         V3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832135; x=1774436935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=;
        b=ZDCmzNSYuqw9jeNB5wNJZpQCibCekFvQ50AtWl1h6/xrre0DmKwPlKddmhqx4DTChk
         nMCdF4r/xqIehqGuvG7NTCwI7QOoA9OyCowNLL5zwPxv7guJKWTy2vj5ZK5OVvZcKJm8
         yH204OeDL5p8dBEewZ8WzwZg3sHfxYSAoIVtUH5KbndAh6qamMQk0eSACQg+igePdf6f
         camyQnuK7qyM7POipQjYeZjhC5J5Ok5vB57L8xZ+oylOXxAFczpPnLp7LA5rOcYcCgLs
         mfaEiGr8OvcazJ69E9hrs9zn5qfPHP+QYunI+xKaNnt9uLkAsfNa7Bvjhnryz7+4kYls
         XcLQ==
X-Gm-Message-State: AOJu0Yyjruo/T0Cch9R8AEQ98shktNDoJ1YSDkDvlZMSWHDvkNmVEAnp
	PbBSJRXQpQ+DyIHcpRXacOoycVTpEZ5TjFmzuRlmw3NB28H7LO/R8yEPNTeu0Kmbr6faFnqscM2
	yruEz2NXteviZGTJO9SroCWX1ytpjB3nQyb15n8itQVg5N1lbFG+OI1IdLAXxNDSo8amU
X-Gm-Gg: ATEYQzxY4jJzh3CMN6pbXInptc+qdO/RDRU7xfJzuezB35WFKlk9HefRWFaXcNzfw1X
	IR4fFW7Vlp365wh5bcO8K0ofRiZc59maGHWvGW0byLWHBkZ+u3A98XrTEVBj5TmhfGd2zv1ePZr
	HKXgft/RH1bNViEdBeuI/cdqBY57yrUIzJ0c5CRcWPy+k3DxVPC/nMabpWrHb3PFhhn55Iyz7pC
	rBeNbcTXvhs5sHw9aF7IKpRjhBix6MXOtBy1vwoCka8shC+2Wb1FuBd57aP5RV0vGIeiMkoOzZa
	jbKor/Vcg08aHSJmu3a4Rh38A0Myqrx3gmvOMxQGt6FReX168eLVhrLvkmGBmPSkq9YOr2F/FHj
	eV380cZ+Gy90x3cqtiXLSie2IMVnCgaB09Qw8ueWeuYHh
X-Received: by 2002:ac8:7dc2:0:b0:509:2efa:f054 with SMTP id d75a77b69052e-50b148b588bmr34689141cf.60.1773832135289;
        Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:509:2efa:f054 with SMTP id d75a77b69052e-50b148b588bmr34688621cf.60.1773832134757;
        Wed, 18 Mar 2026 04:08:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:42 +0100
Subject: [PATCH 3/5] clk: qcom: sm8750: Cleanup redundant header includes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-3-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwd+fdD+sjWN3bjprGZY/SteXlcdMNP4NDxbH5slEHA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe8EOeRZLJaD7GgO6dv0KuniqRRyymTla7vh
 JTqjRW4usOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvAAKCRDBN2bmhouD
 14sgD/9622J1xmbx/NPB8y+YfXK2DT8IpBi8tjYWPpNqXKCpfTO/RdFRwwCnCR1f7nekFuxhRcp
 3K+Vcd2wPOqKMfPsM8rsaSPsXaE/6GavEiBIiNedsVosrjpqZhvTQQoAfbiKgsRbUiMVIkYmQPm
 ekWpQ7DNPFAvoT9KHrLK34jLFJa0sBbjKsX7jwBfwlp8Bz0BVk+4LOYl7YqHrGjGYhaXl1M2Bbb
 ONDUfhSw+21vS1NbmfUM0TctuhCH2IOFTRDfulOhX5VS/La/5Dl1/99Zx1kXSUZ3d7eeUSBhUA1
 i0E8OTCrSXHIK+Mixth4vRvoGeF8g2Udvye8CPMXJlCGfFKlCMPJrVGj9YLYlm9VntTFIIl+JA2
 isXpztQcCBiafjhPol+VAhUbP4qZ1QL/V58Yy+pNkNPSr7h2C2ymme7gywfImhpZuVVcNBXnMO6
 vkgI+mv2ya1mUPNjBqLifviR6XUOFGB5KL/FfScVUGqRTlREvzYrUNEtDiPF78qM/JZ388esGz4
 PLB/B1OxCDdZIhevE7mL/9zfSvG0T+j/xoFVNLucXezbc3VkL2ZOtnr72YsQ4MG/KTPthSbH1oz
 Fi6FZBhAEb/Ci96N2/YGEd0wxDWenbEbGI0oXCc7OKvrprdLPtCNwtmPHoXnIesZx3v7+wY+lya
 aW5An99GP7lXqyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: EtxsCNGANFahp27CKVp2xlPwRaDi7zqi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX3b0aAjqoWJkA
 EQHmNeJB9mpnnPrH9rFa4XMmH9bER1CfmDlServ3g+V0kdKwnEDPsmihZ/i5mX/11k0XQhkxN/9
 3mivFWH3pIO97eaWsGZMA/3SaKyQSzA7kRsOOAHKjxZpBn/YEm6GMVLvQVOp5HiAwzUw9aSoVTE
 lP5kylbQhJsAxZ504J7am8qdSBD2v1qu6k0cHLRTbpSSWLajrQooWU0ePUQPV5aK6iBNP/n4yCi
 nt5/MPLoa/4TL1zzgvs8jrsi2eaTVcEdwYI2X5YKOc/EwzJNP1gbu6A+4DZrNS8WErH+pzL83/7
 bei/LB+GeuUadfzWli/eeWM+tPZZAaCKAvNAoHSRIowO/cqkRbbqMZPWl9zReSBl+xetAOTOleb
 Gs4WFFhA6C346PQ530RtDV5EphNSwM6G2hTI9cnmJRygto5e7E/VHyXM2Wad+TLtjeZuTEoTfa7
 qcHUFbrPstNeNPLixkA==
X-Proofpoint-GUID: EtxsCNGANFahp27CKVp2xlPwRaDi7zqi
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba87c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=J5YPY8RFlEepJke0YncA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	TAGGED_FROM(0.00)[bounces-98427-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F3B02BAB75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any OF or runtime PM
API, but they need declaration of of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-sm8750.c  | 2 +-
 drivers/clk/qcom/videocc-sm8750.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
index 242e320986ef..46af98760197 100644
--- a/drivers/clk/qcom/tcsrcc-sm8750.c
+++ b/drivers/clk/qcom/tcsrcc-sm8750.c
@@ -4,8 +4,8 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index 823aca2bdd34..5c1034dd5f57 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm8750-videocc.h>

-- 
2.51.0


