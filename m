Return-Path: <linux-arm-msm+bounces-93126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGA/Ht9OlGktCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:19:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2BD14B432
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B898230360A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846E71624C5;
	Tue, 17 Feb 2026 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYHGcIeH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmtPOfH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC1239E63
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327165; cv=none; b=JXMBZwKDKGMjc+ywIO5bMYduz/hImQtgVix0A5kKOsBnJYlZB3c+KED9A8Pg0QrdhVvo713Ys4PvNkX+BIV3IK7zAHXThH2xBYjGkceOlFxn4dNOGSFkIqB5xLAaIsIt2YHtAUpb5p1LmlfBW5szdwJkkp7jUWGkU5etEss1WpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327165; c=relaxed/simple;
	bh=TtbJw2QxkiBmLJKp1okcAfp6LW1NcrShntWzlulImc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCMyHk4TXRcygna8+ZiaJtVcYCMVJ0W/hrSrTpXwwiHoDFkwiLyPi1zbmNNxMmCRz3fleXPzLy1X4Rd94Om0py2qPNQRd5TuY53Op8oaLY6XQ9JZvwllzdrCnZGdvJnH/HZQoulk4+zdZO7v8u3cPI8vJJoI9klbx/DtaeUkKhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYHGcIeH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmtPOfH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H90lCX289398
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	immdT9IL2DaXPDLwrAcUsFxixoY+wZMF3PrZeo1ewh8=; b=OYHGcIeHtSftBEjf
	JAIxbkCxa2n0CVYJXJgTn7akXtjzV4q+UW0WJxImaqudghK8tDhl3NVscWsw28ul
	9V4zi0MCRnvmi5oBje9o5eTTIR/UP7e/8cVHYUMj71WPZzE/R9Rr0/9ny2aNDqoj
	R4UfvrVt3a4z7NUknitxrCDn64ab6HOdOY5RLPlfZHga2BW+vxZv0TGtiJLJL58E
	T4E75T+y7BUYxAsz/E5gqgxx+VBiqMMyM4UnoeYAlU+weKugg19LlFY0sx5gZbc3
	+9M9VIAstoxCZuhKHDOJodR31csLsAvqn/JhweNlvJdd7AlhS2TmYBy0rQSVyFYJ
	yKn4rg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrt234-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8245982e538so1856684b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327162; x=1771931962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=immdT9IL2DaXPDLwrAcUsFxixoY+wZMF3PrZeo1ewh8=;
        b=ZmtPOfH0u91n8YGLxpjIYSB7QeWwLMa6+azdjWNOs7KkmDV3y0ETAGkx6LrLfEKNGv
         Vdq/6pMYlzydGiVDW70GYtJBqi8mWy0KAQoxoPhVwdvxwatpw1BC8PG1Yg9T36bHp4Zf
         eFIV0wT9KIgZRhOkY/RAwbsXiuZQ954I4vQZTKrWOjk7wbZndBkzRS2QgTIg20hDE2NC
         xqrAGhdt8DJwNoDdjl2xTzmF+SGyfKRlIj2PLsRwQUKF5sJDBvc189ddGS8ceqvwiRqI
         yNSUV7R6IIRiPVYcqtYAlBJ9D/TrJVzznv/fRN5p2Xo4hOkLRoyd459HMTLIMCWQVQzN
         rEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327162; x=1771931962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=immdT9IL2DaXPDLwrAcUsFxixoY+wZMF3PrZeo1ewh8=;
        b=PgNorBZI2oNc6A0lVXN0AAjLLPwDBAcZkk0JMriGY2cfg0rimUot23v6JaUuPqxXNa
         IVlxEczzq1LYFKO3sxeItWexINIYFcEfvB8fqo6l8mHwrpZCBC8fZuVG9zSxw2m7guHQ
         ip9se3amgmMAVvgtnEpbnDUEjeKhaBfAB7DpmlC56pJBxrWiGCSq4g0/iJuBO3uGvd0Y
         XPctYmmSsD09fP55dlYqM4jKjLI7Jf6Dx7tJydhPFbsmz5sYCCR4mq04T2IZ5yinypsZ
         Lwnd/+cu2nWJi1YJDDEhiMh6cLF9LM18FsxXhkVWjAlYaTI2wEylrXtDJJFKG20WcxJV
         /LVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5bJwAD7IR3t0Ag+zWPTdOQ/8doW7atMp6yAyY2SiSb2m5Jl/Y1sP4HQH3Ey6B4bjPPxTYDCPsa1iAs9m6@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbkkU3iduy9U670WXf2830PhysVjhGhfnIliHVYFM4dbNrAWj
	NLJ1F2FmY/FZ+PYYENpvrFTFesSdgEXFkfeIV8jQlhKDwsiAs225BD5NhbC9smFxag2K+yNl9DA
	jgDC/eaz/pg6zl8hEAqUpCKk1xaCiKzJxhMGK4YvXZ7uwezO8mIynpgO2KXiKjNZZdnwo
X-Gm-Gg: AZuq6aL9UqcstA8lUKGQ2EjSghmYNXm4n8+2dgJhqKS1CUqrWZ6CNtkBcGNDnsZtfjR
	47E2ukD8R2Vi8ixDkSwsawUnd50MdbkpOsQ6KP089tECmN7qYaaAIzxBaaWw/F3iJwrtAyg+C1r
	t5YcjfkBEEh8BjSbLnWSS/J7wN3guDURAkn5221npp3MPrxxsNZ6XXCI0ObYIOjWDcM57ZCg1e0
	8LRc8IJ0yKMcro8wFM6CJs+vl7p/2S0dkvHWRS1HNkyzWzbUjn0H66jBD6peshBs/FvtN6jizow
	08G3G/HGq8UleShjzzqPAL9Gt1ih+trdj7eHOIgCciTaw870ipHEZ9KxOC1OLihj5RBREuoGYcl
	aYbZuUbJJJB1EDRiC9gnG0QfGVsItxqTyleRPTNbCiCaMP0g0NBLSRlfi
X-Received: by 2002:a05:6a00:2444:b0:823:ec5:430c with SMTP id d2e1a72fcca58-824d5eb79a4mr9451778b3a.29.1771327162386;
        Tue, 17 Feb 2026 03:19:22 -0800 (PST)
X-Received: by 2002:a05:6a00:2444:b0:823:ec5:430c with SMTP id d2e1a72fcca58-824d5eb79a4mr9451756b3a.29.1771327161858;
        Tue, 17 Feb 2026 03:19:21 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:49:07 +0530
Subject: [PATCH v2 2/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-d3cold-v2-2-89b322864043@oss.qualcomm.com>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
In-Reply-To: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=2041;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=TtbJw2QxkiBmLJKp1okcAfp6LW1NcrShntWzlulImc8=;
 b=YWmGKKIDBl3wYoKkpN/uTl2ahJVwSeE+5nhAt6wtBrGX2sN86iG3g8H4fNwHYNFYCQvszbMOM
 qBFuDArb0YoDjIliFHrt0hfLTqnbaWrwXLZ4WkXsz6TBpW+1rxpcmoZ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69944ebb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ir7Wv4stjHWE4dv3774A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfX7ahGFhy0zF5O
 AHDXuCmgtRA9hgz+FYOqVMOKhEkJZAQR3LuKDhq8MoAlGt2y7QcjaQiABScoPv37vkOKzxIz+sY
 s4o2ijVGagqKR//oEmtdRZBauIanwfN7UEcW3w6YtC7cRqQlUgJGMojTIrfFNm6jrK2Z71Dql9+
 M4b7EuUXPwJHAbfg1oiJLWcwY9qTRaxG2qvRoPec2EEaMhxYHH0z5sG0HQt+jVvckaK7T/Nehaw
 GTiI0VM8Hp+JhNBnMYRT5r8S2YKDe23ngyaTr8PcXK84WBa3FcH5+A9z4tkoAmatka/e94aAdCl
 u2XGqB0Qgu54IiZzUVQUR0oFUmHNrg7cDdOmh7JrCPg6w/GtMuW7pCy//LUIsYCTh5M1in6wTrd
 P2ZiTPHTCW8IJJBdV6cnKAgyVGmsBSQyTpZPWEi0bX3vp2Y34cm4iZL98KikyMpxI0zriYIGoj2
 PQH6OvA24RKGfqhdkMg==
X-Proofpoint-ORIG-GUID: fLo_unuI29tC8D8xzaIHP8V91qB2Qypx
X-Proofpoint-GUID: fLo_unuI29tC8D8xzaIHP8V91qB2Qypx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93126-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C2BD14B432
X-Rspamd-Action: no action

Previously, the driver skipped putting the link into L2/device state in
D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
low resume latency and may not tolerate deeper power states. However, such
devices typically remain in D0 and are already covered by the new helper's
requirement that all endpoints be in D3hot before the host bridge may
enter D3cold.

So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
the shared pci_host_common_can_enter_d3cold() helper to decide whether the
DesignWare host bridge can safely transition to D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6ae6189e9b8a9021c99ece17504834650debd86b..713aa64553bfc988717cab2936935bb43aabd72c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -16,9 +16,11 @@
 #include <linux/msi.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
+#include <linux/pci.h>
 #include <linux/pci_regs.h>
 #include <linux/platform_device.h>
 
+#include "../pci-host-common.h"
 #include "../../pci.h"
 #include "pcie-designware.h"
 
@@ -1218,18 +1220,13 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	/*
-	 * If L1SS is supported, then do not put the link into L2 as some
-	 * devices such as NVMe expect low resume latency.
-	 */
-	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
+	if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {

-- 
2.34.1


