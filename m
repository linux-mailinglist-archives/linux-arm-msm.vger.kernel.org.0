Return-Path: <linux-arm-msm+bounces-107543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OlfGAuKBWrGYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:38:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B6953F644
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E52F301B6FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5973DD52C;
	Thu, 14 May 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="In5dd/Z8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3fLC003"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66913DC850
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747912; cv=none; b=BjC1kKgGhaxhD9pcgQDRlV//S4TiWKjrur816V2BTngYslsVQ2AnFWeO0Wc5QrwAn3ZmB4b74KY5X+8Btv26ptsshyyAHGsTPVtvkCe5l/YAL6paSOYI7xifhXtzBnAeeroNU3U2m6yQmkDFuGO6box1giJi1RmpjTK9zVuc8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747912; c=relaxed/simple;
	bh=i1221jkWAGJU33vbiEn0FDVAy4gg+YBRkE2HEzFn26A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T4oEwaa0QOy34ASkovx/R9osdjCT3HVEM3ZKzvht2uUGpOswD4UQOjfzrIZejOsjxppUgSTkVEZ29csecJm+j4NIntNg/WkYqZuyBR8xhWDbiwzM3iTbYg6JAZ4u4BEzbfRdh2h98nXc7CnGugLwhJUZB1vU+kuvexhVS4lli7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=In5dd/Z8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3fLC003; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E68aH61965374
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 08:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OPJFGpIwJN68tIJIhmYF4q
	5utOMu7J8pTBzQceAjv6M=; b=In5dd/Z8GLROUVsPQqoFL9DwfKN2d7BiCX5K3T
	REbh4Wl5RkaJ7yCNCISNFvH5o/OcC3C/V6ZVNMFy8XQUH3pZEg6ZKAFhn0YUzh3A
	AHPCqaFneP3biEC6y0BGkbtIMp4QlHw8K/L0rZr5iz7aZ8b9JaxzdMgzaN3fHxza
	+zrIFTLFRmqx2bg93ULzbMQd2RH/yhaZQ70EBU3dOzk0VGeUzLaYoDWrvFN17/ZO
	aag5rugkJ9eYu0rfAi4CU03ENJzirVG9ywv6nnKlGEDGjUcH9vBuFZQ/G59ycBay
	u9uyoamE81G7cXRMGUK9kc5/G6RWzhPfUMN4FMlq4BNZQSAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v88gat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 08:38:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9b8137828so82783665ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778747910; x=1779352710; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OPJFGpIwJN68tIJIhmYF4q5utOMu7J8pTBzQceAjv6M=;
        b=L3fLC003XS8xvCs7LlPciItb5zUE1Kk3Uq4IbCxtq9kelv565wFsPsaMrrHkqJykEQ
         maL2Zd9rSu71SPah5XquQPpRKJD6EmQvrlnyMJVWSHCOcCKJaMT9fDQbTLSchodimskx
         4TEEcn4Xzlc8AxfBSI08z5K67+LtidOxAIjemvFpqpKmOlJ9Oq12JOMKnNdVmT3jmBdq
         LUrJ5V2jHtUcoZNQIZ5qwDe1/l+0vqEbqOOtKCGhEpg1847tpkSDayYoLokcrzWNOBK5
         EZ3KNuJeycm5vyOYhwewVfX62e4DdySLtXjG8MNcSEeQ+vFE+oJN5liiM3SgnvKGxnam
         IIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778747910; x=1779352710;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPJFGpIwJN68tIJIhmYF4q5utOMu7J8pTBzQceAjv6M=;
        b=D7qOer0StV4fG/nR+7za7DLa1Gg7ez+XnU/S/sxMr63xNg0uPaLjse6Je7llw6HP5v
         GwhwINxghq8v+MLpxxd4RAm/NG4fMuqrKeCCELqX4Ve9/BaQ4yM6qZBCCxa5hv9nPBw+
         JRuP9zD91bNAGT5DaQJ15p/DsMqduMbZ94WUz7jvnSf7hr+gv6PmPW9RohHRwykW+U5+
         QPsJVIndiI4Cu5VQPZizUh+b+lR5QeWcO9Aq+OfBSpFTsoJQP5VHrT8mYPe8WAplmGLb
         y4O//GpK/hnuqSTTBidQ/EC9UgFHnU9BHFE//7ROz12r09H8d3vrB5ApSTDSIAsS+cMF
         cCiw==
X-Gm-Message-State: AOJu0Yz7i4P/RzhaLUL7FVnOeYh7+DnhiYrbGVa5/WLl7ZbQtrvrlSqt
	djNhXKHm8/T7uJMliBxqlQ9ahR6m982WBzYj+4eXuDHjh0QvfGWK7PFLlpCC4byHYk9QA5K01bG
	IJOcocBRvIdWsWDrjhxJGMFpEUViIg8nUdkZTWbNWvPUbMRr+SBYCCWwsTriWKhg9TSGp
X-Gm-Gg: Acq92OEWCs9yuqzsEdBkclqVeW6JMcQYN3L0VoCbb18FTJ3yvcTZOGccc0srgaqvkQ3
	bAMyg4ON5Bo94F6knxIg35DFRf3gY7+gOairGctC6/yt+EtbIc5X1bxzfXXVhw0GBVgvXZaRqUU
	zVj5mZkjV8BHFrlRk0i7+o7UoMjvmGIwXmB3rDE6pxORSVPCUXTduuuheII4lcQMlBtkYvn9eOH
	BaUcdwjGTv3UkMrrCBtl8rhtmbAVkoJhWvMijmjbRlFE2BokXFwS5QAex8clFj0onThfAZ01v+e
	LgTgQsEyW4Hf+MMD2gIetIF+KW7K1GOfzgh85jkgM198Byz4GB8liJ8+4UDsvf8ibPk7tOQEmhC
	OFmxaY1Rm6TOnWGUOBNHJQzIeq7yZWq5ZrPNq28s7rwvhWY2sPw==
X-Received: by 2002:a17:903:32c3:b0:2b0:c90f:449d with SMTP id d9443c01a7336-2bd2fe21b31mr64624555ad.19.1778747910005;
        Thu, 14 May 2026 01:38:30 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2b0:c90f:449d with SMTP id d9443c01a7336-2bd2fe21b31mr64624005ad.19.1778747909372;
        Thu, 14 May 2026 01:38:29 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd60275sm16200695ad.7.2026.05.14.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:38:28 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:08:25 +0530
Subject: [PATCH] pinctrl: qcom: Replace open coded eoi call with
 irq_chip_eoi_parent()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAACKBWoC/yXMQQqDMBBA0avIrBtw1KbQq5QSNE7bEY06oyKId
 zfV5Vv8v4GSMCk8kw2EFlbuQwTeEvC/MnzJcB0NWZrZ9I6FGTj4SVrXaedYRkc9m7J65JbQ1gU
 ixHIQ+vB6Xl/vyzpXDfnpv4J9PwCOc33udwAAAA==
X-Change-ID: 20260514-pinctrl_msm_irq_eoi-ab736e16d411
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778747906; l=987;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=i1221jkWAGJU33vbiEn0FDVAy4gg+YBRkE2HEzFn26A=;
 b=YEB80AVCXPVqYr7GH7Xd9GQeS/VHOwb+2L1h/fOb5F9BuWyqaRVVY7P+kOd+2RLLRD/7e/2sG
 j3iTYoYRazGCW1Tfp7ZaXqlc/lJfSvVT/ohYM/dn0q5ga8wIOiTuwiH
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA4NSBTYWx0ZWRfX/nglj9LhZSOR
 PbfJYFRrJqwEfd7zEnr+mBQbAH0gosb1lzHulE476v4BnQzRheQiR4M2Og3KDdWpl11T21NztI0
 3WAZyG4ompWS0GaFs4fkq1gxZazuBKdfpNP/1GK3Afy94cHB/P1jOsBx5hjf6AkHmluY0q87N3v
 zhxn86mW9INW+Zg9vx/RIMRkLl6Vhq9ABw1wFFN9pgLv13hjRBWxD8JLtek2k3D5kjbwtZtFAeC
 2F1Ff+phrLwF2zy680lKDQ3zx0yIhanACzydH5fnrsLO/XaEYd0HosUNUB1szK3YPMYMzjdIo5r
 nCMkGfrhJFm9jYtNqFoDjPf21rxPVbRTnYETRKbHq+smjp0194qpRzSND+uyoTIe0ETP4bxPOMU
 1gYM2Iz/VmXMPZtRdLrudjMAg6OUyTyz7y01BYsBg6t53fQN5IN/Al2p/pyBHjw1IuEiAK6lqR/
 bSDxyU7uNnJ5PBT/2ZQ==
X-Proofpoint-GUID: eyYMTPUxry2TLqxy_SemeKrpTBDlQ4d7
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a058a07 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2MiOTwD28NhBqraG7AEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: eyYMTPUxry2TLqxy_SemeKrpTBDlQ4d7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140085
X-Rspamd-Queue-Id: 01B6953F644
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-107543-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().

No functional impact.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb8..6771f5eb29e4 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1012,10 +1012,8 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 
 static void msm_gpio_irq_eoi(struct irq_data *d)
 {
-	d = d->parent_data;
-
-	if (d)
-		d->chip->irq_eoi(d);
+	if (d->parent_data)
+		irq_chip_eoi_parent(d);
 }
 
 static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-pinctrl_msm_irq_eoi-ab736e16d411

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>


