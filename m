Return-Path: <linux-arm-msm+bounces-98429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Hi6IruIumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:12:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38D2BA97F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF64F301BFB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D3D3CA4A1;
	Wed, 18 Mar 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIbYs81e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUz0jzs+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A043BED42
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832142; cv=none; b=dIVYkVXVs6eyiC+Pq23b9PJpj8+YXg/7ScknbE2ifE4qwh05k9FMwdfjp4zD1jtgK/1FLTAQZDjiLAp5M34NxksKhcJxRkpZ2LRSSq3ZhJq6QZ66pUzAQK7XRkHdZZgKaMSYVBN/m+UZHlXJ/OM14fZGEeJSRkE3tESfaiYR48k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832142; c=relaxed/simple;
	bh=7vmfmVTf1sjmsQtQiKvutgOgGxTZ7kdgXKEyXYC7s4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZyYjo6Yb4qmuotCaucZt++S29iT3OsH9pAXtN8AgW4cJ/eiRoT72u77N7J4Qj+t5W9qaDtSElAZofrfARZu74rF2wBaicdKNNV3UaLTOrjQX5kMhg6YlhEGYMNGW35Bftcz7QUulwsZA8QigoswlBDqApBrak1Idw92fwM+Eb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIbYs81e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUz0jzs+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9Mugx3358496
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=; b=mIbYs81ep9WbbYOQ
	BapTIaBpEriJEWLwOZA3uIVP3HQYcHf3MkPRDl4rN+Exk8zf8Cc4I6bnKp6pb8ZX
	U5cafXU8ZLCz4aRjq+tm9GH1FqbPVpvmtheFaM1biNipilrrVuhSP17kOSUCM1pf
	n4Pwr88Y6HvJQhe92viMenlX6zmIyEuJDqfwQUMKZNP0LPK48eWsRXN33dwvIgQ0
	+CeSPgx4MiDWxnGK3Jz2j/BC5CIjj0FxxDNA1eJQHETYqoK4mAHPypyfyo71X9KU
	/dwSf7hXtCWtbi9Ic732YTwiU8AKPVGbbBOkFsCJ1JgEuYuUcxt1iQgJkRAitR1w
	nO0yzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0crb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso128703811cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832139; x=1774436939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=;
        b=GUz0jzs+OJgG4GTVtb3LZ33vg6A34uVk5UOSMEsHKjOuS+xBin8SpCVEhZlJqEV+yl
         RBetkaoWw3FDF8Lis4ZMqE7kqoqOg0aXYwfsQsZNiDr2yQFjdv1rFcuEBJYR20LTF09E
         aG3F18r3BNUU1LfxUzNKgOfezgWpYfkWjydh63V2tOAtDpA2leptIaOVw8pI2Y6dTvHT
         ckUEx3DRmZLWRnxoeFGiabnyI9YxdGm6rkxzX6yFS/7NQWCIxsKLbDD4h8j+wQm634aN
         Z2YSdWVy8/KQaob9sk4koxkv3fDi+M2+7ESMcrOkQX5yGpFOyiI3EZlUmZqbRGv5d40H
         mxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832139; x=1774436939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=;
        b=N3QpJxB32cMKD75rhOJQCAW53TkCEp+pCQjoldhlh4JPhu+I16UJO0IySlNZeM2X57
         emEZ/9X4f4VRwqdulxs1aB3MVlgS845Lf5tYapZQKU0/Y8n5H6qY730gIioWmIjeO43G
         J4IOaPBhT9tBVtSWntNpk6pKfnym+Zz70Qhty/P5RJq+38LyclAC9HmCgwCy84XgvPOU
         Rors35yCYimr50zJ6DdFIjNvJgpoYM3BQlf4wx0vAqoCqUc4aXLc/Qazb5+FytCc4S0+
         g5UlgG54aK0HXNArHUbG42cwPX/PjcDtZBIhOh6rt0GxIXUyNv4el8s1+BBRVEm+Deyi
         jMeA==
X-Gm-Message-State: AOJu0YzyqrlwxzrqyUjQLE82QLybvqQTBVJ/Vroso/WI1AmwqPt8RBir
	m1borMgxtPu50HRELPwWihppdnV2vEAAPZVx0/TTugr9b6JB0tPwWG51hu9IasceZeGO5dRu3be
	Xfwt3eEldlHtIPgkzdvoEpO9fNu7JSZo0LGeruJEPEI72EkA6ozboSrQYqQrWZlhBmQ40
X-Gm-Gg: ATEYQzzQlJaNPL1QhS/nDadxK2uYjNMprEliwYvfYptkxaVz0T1TlqrO+sUerYd96ux
	uESj1DtMXzHKNpzEQknU+tk0u3oWSIxX4x72Oy9+PxRknH72CqD8iOv7KMXRdk2aznkx3K+YXA2
	Zy2G50ww3VW7ujYeWh95iMtae2nnlK+QHGjff1BcxQD4LoxOhwH2nQMRjM8q+RPf5pa57uC7y+B
	3wdnvoEgxyHLi4jkMLhGrAse/jHtUMZqhL1J2AS4OV/6PAqzFbg5/yBWsoPzqp4GAeoJT7195We
	mcS/hfLbBPeKRXnyh97BInwS1Zr0wlqJY/DAaAUAnMWFDZTVDYDWmY1BTf8fqpHRLfSs73mHkVV
	nyv67Wjv0be/kfi8Nd/cUrSCZ1rqSWcM+g8SitQpje0pp
X-Received: by 2002:ac8:7c42:0:b0:509:3c33:9d25 with SMTP id d75a77b69052e-50b1477e302mr36059211cf.15.1773832139147;
        Wed, 18 Mar 2026 04:08:59 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:509:3c33:9d25 with SMTP id d75a77b69052e-50b1477e302mr36058361cf.15.1773832138604;
        Wed, 18 Mar 2026 04:08:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:44 +0100
Subject: [PATCH 5/5] clk: qcom: eliza: Cleanup redundant header includes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-5-d5c6a3b11b67@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7vmfmVTf1sjmsQtQiKvutgOgGxTZ7kdgXKEyXYC7s4g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe+N33ivwaWe6BXKCojvQtemLpM2oysrGfqs
 SGMVzmXDy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvgAKCRDBN2bmhouD
 11E9D/9X0bFqIQ0WUbs/0t6VOpmqg60At5JzdaQHV/nDaIdSLauMo/g8yEnoHKHhSWttJSl543e
 SkftcPjGYwt8d6vaFS7F+Md/n+ElnK7CXvwUOuP5BkZ0CnegvxkLOSrxnwka4gRcQPMZ1o7WZdi
 v4Mu6Z38qPc3DGLA5tLddd1zAUfoefkMNuVGsrIJlD1uRVjiNwlf5mazLxNdcuPmXvJULvRRjMS
 mmqkqjK8LneHUE/lVMo1rhhz7WGvhVgdcPoUnW5LLjnBxW0skHqF2/HvmlR/VHKkWLBwTkr6SWk
 dGVFLOyzV4+BHdVBWWnu51l+KGB1zhyNrb1rbXRtzCavk91zPVuU/aKkYaocvvSWOVBpHmFw0R0
 wOiR12Z5Rg02yFsEaO3Swa6sWu78jXdppkKIqYzkpPmkmKi0dcepVWE+nVReVm10tahEyO4rPoX
 wp6Gko3nWLsYGssJNiplPknAvkmW5xxFacsco4i3Qm0+lraVuPgDgZ2n3y1o+Y84Up/wrpQ122r
 dDj2+SYF8nnjFFRhTzsEHSWUS+gB8SynYItA9vqQdMqVXQxvDI6Yka/Df7hDl6B2xdRjzCBo+rP
 TR++V1c9me6Cjc/awkLQg7iRQFuOF76zqAz+FFFfbL6OI72pWhrV9U/ZpalblFpGp5Lba0c8Bv3
 x9syeqq9RIHeeTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: oaztkr9Wpf942Xl8yT9a_SRsXP0d_fbH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX+mzpPg/D6pFW
 Nz5LkVW+xh4ytORGgPdaUCnGvMj4bP9mdFHe8gvK6Zx9LkIaehdCb3omUKOPXJJLaHTx7+KljWi
 ncRcJjQn5hqIs9tFxt0cDC99UaPL6yGjEEqW86HUhrEuNb2PU90J75aL9VmTqRZEHxeNufouwV6
 4yeJv5fV2Sjj+J9+R7s+3brBpEAAYYxHVE6LhgGRpfDRMTNf3t56v1JbU4rtmoweywT2J0VQ030
 ZcB0BUf8xgwgqZkUI3ubJkCCRyT48liQIGiZcpvdrZeVdzHsyge7+IUHmGmu4kxq7Y0ldiY0n0d
 TJ+5Ot1Vuugpq1ZRbUvoFqhxx7/YmqIS+5X0JRLFsA0gYVSxulYIr5dcmNtuBXppBqTUJIdpFNw
 16TaRd4zXRV2bjxEnubL92b6Mn15/oczEmrRuxsybuelVjOr2GU2WTl75p0pn4qsmLJGSeI+JWn
 ZgqkDo1oqihA1dyGdLg==
X-Proofpoint-GUID: oaztkr9Wpf942Xl8yT9a_SRsXP0d_fbH
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba87cb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2pKPMeBpY-3N91LQmWcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	TAGGED_FROM(0.00)[bounces-98429-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B38D2BA97F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any OF API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c    | 1 -
 drivers/clk/qcom/tcsrcc-eliza.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index eeec4ebdd5c2..06ee1469badd 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
index ef9b6393f57e..5a47a4c77cb5 100644
--- a/drivers/clk/qcom/tcsrcc-eliza.c
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0


