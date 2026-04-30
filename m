Return-Path: <linux-arm-msm+bounces-105362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAMSJwxD82kMzAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:54:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B464A26D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6042130028AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21899407586;
	Thu, 30 Apr 2026 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GC/yondo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuH+Eg80"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4594014B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550019; cv=none; b=Kb/eFkqYAM+etFLxkCuPA3dwgqts6KteGShbfuV47W8I4rKI3rR2i5TOOBhbY9Lp4mUGM8L8jqyQ90Z3d9o/YbDU27n158vx1mU5QW4MzbxqXegKtK3wWV3oJuTEOtZTsBgvja4YFTJMq5c4he87OY2mXzUANYEKUk/l4Yv5l+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550019; c=relaxed/simple;
	bh=38W4+Mu/PnxQJCbAaMwDoFX3EQQG/JGeECa6z9bYCOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jP/wKwh+kpdyJeREz7oMBdj3O3FDQdC8zWe+heJVEpqGVvo4i3E3s0T/BeEdhn5rwYCtSTUAm0VhRGMxFSVi7oIgfTCYOSyxRuvjjV+7eVK5XuoLSNh+Yd7x59xC//1y7RmsGL1xVW2N5YlP7WrZOKm1yhtegA65yfml/1fke4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GC/yondo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuH+Eg80; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U8GeHD3733556
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ewPdVdGVbSeW7Omov7gTKOsihB0IfbTCUWiSfL4VRZo=; b=GC/yondofWN8U6v/
	D2WK522M1RGZBMQryzQHiq+q2tLJbedDjo7e4Xe6hIC8Vy/nehbIrqqQZ0XeGqAJ
	VThQ67CEzrqCPW5SitZ9os/f3/Iimi7Q92K+OmAFIFgnabwBOacR66U5pD4TrJpR
	pDReb74V0qWem/byDWH1KR3E2xXO/dYsiKgvguSwSRznqLplugA6qZysR9wvYuii
	w93IW6D/De6YXLpixlJed5FkYNf7lxkFpxqH0msa78nQddfsQSRzGtknnsdz2caV
	/EEINOOj+XMgT17o0kXXJIvFxWqTLQucyJ7sCYoR/NIxwOi4xRFmJ5yG6gIYxf57
	z8AIvg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3xafxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so15154355ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777550012; x=1778154812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewPdVdGVbSeW7Omov7gTKOsihB0IfbTCUWiSfL4VRZo=;
        b=ZuH+Eg80Hw5qsS5DUGu1H2bMDp3usHXhFsfJxuGFNBAnI+QbBGXFBsijCGMb9DKT2e
         UXtNAMX+c9acfCTPRrMDYWLNbc4Re55uHXCwgabucbwfai6ePAiM7xjwkJuVbA0cqQyA
         F+AH0W1spWNkmoCdaPCSBvQvwpHFdv4k8/JlzYH/N2fWUO20PZRSAAdTHuM1+MHgz0/u
         ewmbpDqKYetpPF5Akl1X7fRQBP36DdnU+nBkRsdoCSc4pvZDfm3GSzKilI3j0TKuYN6b
         V51BWUy0Dgvt4GF9PFAscm+mRdC13gmtnw7VdmsrAG0RSvsi4kra+o1nTg0Ti4eaNxA5
         KPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550012; x=1778154812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewPdVdGVbSeW7Omov7gTKOsihB0IfbTCUWiSfL4VRZo=;
        b=ST/uU2yeqqqJJXpUjCgg34apQA30m1AyR6C38fYQGCewdkkMOUrdSMbelAntyPCdmL
         a7axJ/bXIYFyN0w+0nJu9tlDBVD/4PemVhPi18YwfAny42tkAe8ELCHiSMoBXZhmC4Ju
         JMxFgnYPxPQZ+XUvXdceOcEH8IbPJF81x5w07XUhD7wfz8geqs53VGw7oRUU6aS93A8I
         FPDLON9t/eUKNxAE+HMXOn3dqmmkT9b5bEecHHd7BntVPrY+d5B/XR4dOsBgdYUaHUqO
         rartnuKBsTGB5NQiMq/YqXmt+QnTCdMgGVSbIACHTioOItpeaYefzMC4JBrnKf+IjajA
         2EsA==
X-Gm-Message-State: AOJu0Yy1lmxVSTpBlBfXaV2OXw5QwRjGhoEDCJy8tkB1Iy1839+A//NE
	iEtWfHz+zTenyP+FHX6i9rpLesSjEwSI11vefTrX1I29TL1rRVzHLQxf5NwrRwluNbQYznygsNm
	hhN6yBHydRl+1lMDOUSzKwyAFbsUaf6tBZI+7MYQ6ZHhA2UoukzpU11QfsafnM29cQ8sy
X-Gm-Gg: AeBDies1n3ewxQWbLI2E7gZB0gP6PP80YnkR80Zy5nczX67Ry1qKWg2AsSOX31JvbNR
	KpGkoFZ24R+aeptrj1pvc07MCVWCxQQX/ifee9G5mXf1bzKdfibx7XoPA9kWmq0pvyGXzq/mL/M
	vGAznCl6i2BBnE2qlIWwxSYfWTd2uvVNdh843XrZEDM+nGKObYO3qTzjlsBiqrxJJ6nnANQiYrq
	XC8Pub94sAxETDww60SLleVVebUOUEgoPiIecLvHQc5ljaSmn9439r6Oty7eBi25pRUG95Tf6t9
	4O3kJW6aFaPtaMY0wtoiQ7TwZedWexGgIlj7e3lMVftoO+59+odQmu+2AAb0SDYhriU/aJMsW46
	51S8+GLqMn4Zj407mLZdoF5cUaeIEpOia+8o4hdTkX2XvPYk=
X-Received: by 2002:a17:902:7586:b0:2b7:ade8:2407 with SMTP id d9443c01a7336-2b9a24c251fmr20368715ad.19.1777550011963;
        Thu, 30 Apr 2026 04:53:31 -0700 (PDT)
X-Received: by 2002:a17:902:7586:b0:2b7:ade8:2407 with SMTP id d9443c01a7336-2b9a24c251fmr20368345ad.19.1777550011519;
        Thu, 30 Apr 2026 04:53:31 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:30 +0530
Subject: [PATCH 5/5] phy: qcom: qmp-usbc: Add qmp configuration for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-5-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=820;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jQuNrTUKcaPoepDnjAwYPdTKMgqST49w7XDlCVKpo4E=;
 b=MFiwSPcZf5BJh3tr2zD+BrmLT3JEXABs2RnR09rePYO1HIaRBb8SKSbp/zbYg1ZuFm0DUtYZV
 lMvo5NtAzl2BNMnxdzznLq+zP6x8UnkcYfXHX6M7/vKfn5dNNxjQkfo
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfX6X9vj714+TQU
 yga6Nz01CrvpAkZAxDcgIFceAiacRyS+BHvB+sATQll9Oi+hSLqAFwTL+P0jF7+BZUnqR7jVmE8
 LvxGr+F9xXLY2t+KE0bkJGlnJO1tJSvWcrF4jgY8lsMZP5YiluCLuGVFGeVbfNNZY2lIqcxNZ3i
 NyTZgtfYFK/P4XTdqUEWsEqTz3yMd6x8TiPYBb8SN4FXbDfsrd9cp9AlahXg9n2a57tMOCEm6oj
 nSF+GgrQ6MPKE+guwQpTMV4Vc1Lqg6lpBD9ayjlpB0zDTI60L4s+ir928XIDFX8LAWLrJvi1gS9
 XVlKbnoUm7LZyXJAc90yHExk/byL5WAte22vHCfNDVf23MU+Syw5S2NU+3JaDG+XW0BuMxGIC1L
 nW+XbwA7lf1PCQPea2PloFr4lgdNqy0xKn/YF62oxOcftAu0YwyTATdY2TtTCwBz6Q6d/zdRK6c
 tktqmYB5HIoUcKf9s0g==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=69f342bc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K8LLhCEcKGHaonpVBxsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jVktqYk7OI7mRL4UWY6XyNcUqe-IRqYN
X-Proofpoint-ORIG-GUID: jVktqYk7OI7mRL4UWY6XyNcUqe-IRqYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300120
X-Rspamd-Queue-Id: 41B464A26D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105362-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Provide PHY configuration for the USB QMP PHY for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index c342479a3798..400dcebf8222 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -2019,6 +2019,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-usb3-phy",
+		.data = &qcs615_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,

-- 
2.34.1


