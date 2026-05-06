Return-Path: <linux-arm-msm+bounces-106151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAvpIbty+2lgbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:56:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2732E4DE71A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E503730B68D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 16:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA503EE1CB;
	Wed,  6 May 2026 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUi8fJk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZFiGKlJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A714A2E28
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 16:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086301; cv=none; b=FJAlfpp0Gx7HfdadVOcimIInD+8bjf+schSxGI/IVgkyOsV+dfjeQI8D02dz0JRVSFwcu92T06uj+2keXJWsaayrXGV3jQz8hjUSwjsZwS0i0lpRWhc6glm2PlGMbRiSoMDfMSzP2kYsFlMbEpjSRPCJTX8YSWs/3CRjKnK688s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086301; c=relaxed/simple;
	bh=ILf2pwIydtwuDQ5X6HEWQeN25aSDTWIBdHxlZSEskg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZ90eSmR47GyehUpgIs4ovoBx0kxKqaklxst2kqcL/jiNH9tvwYWyLYEQa69YrmQ/WGNkbtYYppxnq/Fiq0I/3h/r20Rabe/ByKuP04QKp0KpfVOH1Xc8JSfUWDEiTCBdZjqgfo/ngCcyOxm8iMm3P9JSvf3A36Ymwr8iaEW5vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUi8fJk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZFiGKlJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646DUU4d1527798
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 16:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W5l3VFDbTD30w1M5nzfg3zp7afKvX+ee3MVALDNuec=; b=EUi8fJk+/lET8coX
	OZOiJIeF4FMSLMcnACPvVWZvtjYgJaEv3x354SnLpH0utY0U/d/9oeN0eRwYs2d6
	fKfwRRIoAVHksbvoDH+JAh1yLRdyRywsFzRi+ck3TlnaUTPifqLWK4U2hpv4zStt
	YLYW7eDpZ8/qYxgiDy9fEN5ZDPsBCkP1ATsqJxjUo8UPCdzhMXTgHxRQ9R/T4j6x
	DUsv98Wuj2qiofzpzXH/pOSftw8XafU0U40Wtd/y+MYErhTGVgl1AANqQGElaT8p
	MbuCBEhggfKYZFyl+BO7h9zsZPKIoNODnTKQ6IlewT9jkpZNAlrk4zs1VdbtY8pi
	RHM9Eg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0128a8f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 16:51:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-131371497a1so7839441c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086295; x=1778691095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/W5l3VFDbTD30w1M5nzfg3zp7afKvX+ee3MVALDNuec=;
        b=ZZFiGKlJ56xSF1q//1NE9IZBUvljdcg7IkFZOnssbTO9zk7a0vFUfB+9/ce4oSjzOO
         h7K+DcJ5/qhg0m4iLDf57ZPIOmyV0qMsmRKaO5JZngxGAUA1Y+hvDJbXsthSifZVmxtg
         F5t+AtbEWbVv7SXPzPpv2nYIcqCMCkfsOs4DXtwyc1lZRa8/OKKHQxbd588UgYZtVysD
         97fpZx3sxSCjj8bys9Ntu92nm2OWtgCdD4ibfvmcsDEZFXrfiyApX2QdBk0pGdsva19g
         zU7qSrHB0YoTZOjBK+QYqTmTlTbZTU7SxOiUNE1/PWd4SIix9GyQtH+Is0xoiUMqTVCC
         dLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086295; x=1778691095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/W5l3VFDbTD30w1M5nzfg3zp7afKvX+ee3MVALDNuec=;
        b=phWIXZFU7EwFLjDliUSy/ZngSpZvjMC9Oihf2hh95DNO5oBmqw1Cfm383QDXEVVQAz
         S//WX//CBeCeoO2zJrTyLS7WXofJK/KGLyv+HyjO5B/LvOBLEO1WXbdi+lEg1uKbNncJ
         O8GKvKcZrkS1k225XbIlTwKxyAER4IN0y/bU8awujimWLH3ksqxhuo5q9s3KvC7Kw6x5
         QUScbKNm/v8mPoEXQfA4l9S3cXQ7JvKFKzZ5QLO2ALgt0wxnADzSubSOLZdYDGmjkIQR
         y159VqTGrwCVban5vSy1GFlBOIYc5/+DQy37NfwUZT3Gyd3viRDolD+fElGVSwyLf80i
         5cSQ==
X-Gm-Message-State: AOJu0YzqvjEIpTXZxNU41Q8uzjP3PHjXE7Ve8SUWMIXlyYzz93YlwGQs
	v6v643qzVYuIgrfrHOrgQi7DAm8stxXvjU5byBuroQ89PvfBm0jVBsgmRiGNyImJlyFD3uBewG/
	LEds2qj9lyWcojYIPaNRf6aQ6n+Ijw3dOe+eIVrKYo0QrEQscQXjPG59DNDvAX7zTV4zh
X-Gm-Gg: AeBDievfcf1wCapiVTh2H7q4iF8098dA/I3MImc/WP1zYICmGYTAhbzWEKKEYfHiil5
	kGw0p1GRnl5/AMSTyeJENoxm0vQ7eQ1hfycBVwSzXscZTfhQa4UfWN8rNyNLTSYq1IHI5zZ+rmM
	rfzj1OSSjKrMvJJm/Kp0FQmypNoca/D1aTeax7MGqebO5hItx6yV+iIOIl2ZzmSnxCeB0AYNmfK
	YFxuhp/qJ6B4u3duZ+lH6qzdFJoZYNCQ5rEHr3i2l/wae+FVlfmnJPA3uVCBUBfHPRLMVj4GNnv
	HexOAPmewZfK4wptKIYkKcZhYUkd/FEcs4ZpCyw4vowG9rOu4uDMsIa/oJtSOxv5LgHbYSTC+5x
	vje8jA523MDI6cjqO3C5nphU/orTClGHB4wjOgv7mkdeuyxyCoKKN0DSaZqk9hSshc8XSzLFcf0
	/55vLMfMLlWJc=
X-Received: by 2002:a05:7022:eacc:b0:130:68a1:a237 with SMTP id a92af1059eb24-131964a9dacmr2319220c88.35.1778086295457;
        Wed, 06 May 2026 09:51:35 -0700 (PDT)
X-Received: by 2002:a05:7022:eacc:b0:130:68a1:a237 with SMTP id a92af1059eb24-131964a9dacmr2319183c88.35.1778086294758;
        Wed, 06 May 2026 09:51:34 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:34 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:45 -0700
Subject: [PATCH v3 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-6-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=3013;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=ILf2pwIydtwuDQ5X6HEWQeN25aSDTWIBdHxlZSEskg4=;
 b=IbebwAZDe3/WVHbIALgXbGGemTnHIYrCW42lUXMfgvtIHnPIyrB1NhPmfWeN15joLVJk7yMAT
 fOvmpjx53IYBePwlVaRS9lVBgyTD570OGQ3LsPeHG5ZwvZxNM61tK3o
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-GUID: i4znRNzLTbaeXND99OxdarepEQoqRGC-
X-Proofpoint-ORIG-GUID: i4znRNzLTbaeXND99OxdarepEQoqRGC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX5z3ua8GbQxAH
 /yuRmX9Oh57lonXERd9u3IV5SbjQDy0DARUtKTajtXc9kkqfUuvnk7bHaXOiHhEIQUqrBBQWODp
 b7n2rf2rKB2FvFaZ0sn6/Ray3LWu8UMBm3giYOMYS3MWlIabUmTgy77DbkxLiBB6KDAlO7ENu4r
 bvzOv996GwKeHDOgLLxef4AE1CHguEWB674QkzDR71RSZcXxWbMokrVv7NMln70+yMKay7jB1qC
 lfUhlUzuZ5hEvE77p7KzeCPyUYuEfW2SLevrpBqJE7cpWiMZrD7psAZfRG7TRFIuaK/jYie7Lee
 hTBDTRPp5ZJqrem1sfpTsX6CmHXxdC4W9xp29Lrrc35/LDzbDwVyMcpl5gvuj9fY21pJcskYo66
 i91ll/E/+3i9Dvmo1fIQtHA1jK28rbfLzkkyfogYYMn6GAK7MqojUQ+wMWhweO4wDoqJDN7G40D
 r8eHsF4MHXdv0F5e9zg==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb7198 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xwuga8JxpJPgM73N45wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060164
X-Rspamd-Queue-Id: 2732E4DE71A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106151-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add clock operations and register offsets to enable control of the Taycan
EHA_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d334492145..3a2157bebc52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
@@ -198,16 +199,19 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
 #define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eha_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eha_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eha_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
@@ -246,6 +250,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 	clk_lucid_evo_pll_configure(pll, regmap, config)
 #define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eha_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1


