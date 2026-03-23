Return-Path: <linux-arm-msm+bounces-99437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJTrM3vGwWlTWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:02:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4892FEB8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02A8930D78BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68071384234;
	Mon, 23 Mar 2026 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g31sc3Eh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKX6R+c7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3E384233
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306622; cv=none; b=TmIVLU4P5G1taEGwHeZv1LMcn37IeZjbbSi6GZV1HWEtHtG754cDaCY/gtJNF1+uBLIHdbCIXDUnwASTU++F5P5/GhMTQFMZ7xxIXWOrMsi0vXjfxVbevbHo4pXnBeI1jbx8LPCJDMsmaMTxfJJ3/A4I0L6p2XAsHK2ZWB8Ctbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306622; c=relaxed/simple;
	bh=aH8HvhrBKlUwZlE1dew356KH3tu53xTzXh1q4gq4OLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHW7m6GsZwst5SNj3q/qF1tQicV6QRrDpaQvDppKnTraSm4wfjhFE1Gp1nKC9VScs7z0EuwLBIQWLv1pbCsJf29ow/FA0VkYjp458wqo80bex5cQBmSQFlFkeA6JWGFcL+YGpxVQZBUBe2r7xkv+CMTVL9DPtaIve7umciVpyqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g31sc3Eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKX6R+c7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqiT13634389
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTdfC4nGBF2mKs0lzPAEtgSSWOxV9yn6Q30CnsG8EJA=; b=g31sc3Eh5Qa1BTZc
	3SDn/nV86q4BqB7G9Ma2LsaVEVsgDrpeMW2zODduE2nSg2y8tvd4Bwpl4K5rI+6L
	UR1eOA5YOZwx82/OAYdDi32G1IAw+xu34vTaKDaLCrgqqUo2A+jEKFRxOcrirh7K
	4dK515InqFQCD1vHQddgiehWq90cssVODHs7QQJCUz2TlxW+tWD8YjpGknD8ZDkO
	nUw98YOhTmyF9zWBb7hlv5ZkszvKzrjeSxNvbC0AA1569vohKJtZFppEnSP3QTta
	wA8rKqCYXghm9k6rbw+TtcQFVjXaPA1LRNN0sfUnp8B714lttnG6IPYr6iDgPHMB
	MQ+cHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4jbha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso187703591cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774306618; x=1774911418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTdfC4nGBF2mKs0lzPAEtgSSWOxV9yn6Q30CnsG8EJA=;
        b=QKX6R+c7Gs5103hbj80OpJBFFWH68vY89D736164wJJUQM7/3ggKRrJ9FXXNqa6mE0
         enoKKDkDZd5dng19fIc6uW2dly2F9jen9/scaferGsgXNPFfWihDQo+Q9V6FGctVBKXV
         GuCjHsHeQA8HshovqmlT0jo5MYJ+Geh8/bwpHMFoYmizGpNOvz9RZOX176DyFC6aPoKK
         0N6Z4qLLzQupR5L2NEEZ5GCVgah7+K0PSVDK8Op+jv4Hb2TNCUjHGgoiTKMGnLP/7DWo
         0tm06tEBsL+vqQfX+2wqS9W3G29y4hCfIjEf1urc8I1vg1z4wN6Jlq2evUrrIJ3KGSKa
         XNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306618; x=1774911418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QTdfC4nGBF2mKs0lzPAEtgSSWOxV9yn6Q30CnsG8EJA=;
        b=OnxE2tO2bf+vcQCMYay4LW1XhK80VvdANG0xehL8axKKAxxmoEBj4SaGSaIgvfLVga
         RRlrB6QT+BVLt+IJi1BsY2GPoLUm9aNz7VSgeJsUJ+vzgef59fHc/zNGNfRtYnm2Em9e
         aCWfE5Ne87LAZLYyhfvldP9fgK1/+KI2FYOJVI4ONDj+eNoR3CmDMge17U3XYN/m8N/0
         0Wx5PXMScQKtKxq8nuGJ0FETzlpp3kA/pblqk9rb75W7B711g+/kdtdKIesOLExb8m65
         13mFoml5mkOj2CAFwmBZI54UKbG7FmDGhLlpskKN8jJTG67TkJ4yPmikf/iZNObihYD4
         aBkg==
X-Forwarded-Encrypted: i=1; AJvYcCW9DgtIygh+xo54lnLsTMCMQWCL24jRrLgssBtuZIwu/CU4Lt5Km5xCaxgXQ5C8EX/8fqt/K/PGxSRONKlE@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFyKwkQ8rbVIuq+/1zXMMlWyaqCidAa3c0uSVx3zWl1kCF9/W
	T1hutAOF7X+vpko+Mv67RmJ8uRg3LlYVYx+L9s+AIr6afvX64fYNsJ6D84rzRiQdA0ub+iKvK5r
	Zahyj1ANPZlW/YpOOhMClGQREIP5vaJGPCtz6XD0iS4LD3coa5YlSH70LTRjBORKOqZ3QcE/Oqg
	dj
X-Gm-Gg: ATEYQzzhn8s18w2+AniIyGMbJXzHT3jjwE71c7mdIOpw2XyHvxyuWhXQP4w6+CRZLtJ
	pSLqLMRuiHC21vxTPLM/ptG5BffpdET+tbSwsT1Y0VU/ll+V1jS9fS7CnZzB1Bo0R8soGORAps7
	N4pzCs7sbWYOc1AcP9IhBnUM5ceGt2rMThQzNZMXxUx5y9i8MM4RhGM972JPUaycwZw3Zg4VHzi
	qnUGFxNmK65rIZutaz2NTUHEpVCXpsb7Q1loyI4RX9YN6UZeLJTQEew6y4PlLnbrxTOYzZA2siT
	KHFnBjGxTR8JUKk12j9puuVKHLkQOcdYLT7DFg0pdOytJiLW6ejWLN3eLE/QQlSAY/5HGJLYyGS
	nlLNWBuVg1WEh+2YekCNn84xpOC3D7CMHidOlhJwoE7hY8Fvv7KGXAQILny2gAlO7MEgNiuSpeo
	TpmXG23At2EG9p5G/5/eln5ad7RRJXAY14ENE=
X-Received: by 2002:a05:622a:1f13:b0:50b:49d4:e54 with SMTP id d75a77b69052e-50b49d41096mr139663041cf.15.1774306618372;
        Mon, 23 Mar 2026 15:56:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1f13:b0:50b:49d4:e54 with SMTP id d75a77b69052e-50b49d41096mr139662771cf.15.1774306617951;
        Mon, 23 Mar 2026 15:56:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2963fa304sm156489e87.27.2026.03.23.15.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:56:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 00:56:37 +0200
Subject: [PATCH v7 4/4] phy: qualcomm: add MSM8974 HDMI PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-fd-hdmi-phy-v7-4-b41dde8d83b8@oss.qualcomm.com>
References: <20260324-fd-hdmi-phy-v7-0-b41dde8d83b8@oss.qualcomm.com>
In-Reply-To: <20260324-fd-hdmi-phy-v7-0-b41dde8d83b8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aH8HvhrBKlUwZlE1dew356KH3tu53xTzXh1q4gq4OLQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwcUn8holeR+IM4FJk7NwU4JxiMOFrLi24SVZ/
 Dyj+XSTFLSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHFJwAKCRCLPIo+Aiko
 1ekvCACAJS7NoHWtUcz2I33dfLqhy+ktUzKaia8lVwHeccG1DM53VKFLFbrCF6ve6RagidoUxI+
 uKqQu/v5ul6KLqfndQHay8wcVZXtd566KuSjVvM9LyfI2ynnr5JeFmpdUvO2EIdGYiI/7xOopgz
 iouP78g61imyQGnCCF7guIVwqeY7vmBVG+w0qnXGSwgdvNfm9xvtyZupytLj4QE1+FU8FoOp5lw
 8yqabuqnCy5FQlR0a7erI0QiV76fAjuBdLAO4tCAoTS75vquSaGl07wx26eLXSaZ1e+fJ4gGFBb
 G2VkfbNkVBRsU0P/6WrtSOT64jBvHOvOzOyf2cZLjWAgCqoy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: yUKZZipI97y9vy8Zio9GKZxcJQC-TdqV
X-Proofpoint-ORIG-GUID: yUKZZipI97y9vy8Zio9GKZxcJQC-TdqV
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1c53b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=wq9x00DRF7jIeu_RijoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2OSBTYWx0ZWRfX3hpWvDIrWih4
 XrYvnUHCpqAddiW164P7AkEh0I4xAGYqL6EoTushdKtllW/O/pxMp8EciqNaglrr+abkKRL9jz9
 rqBvJ0HbS9jxtn6K6tYQ2ytcajD5oNm9IwcCkA1wwQ0h+7mntJFqU7VVcPFlXe78MoiivQzHMwQ
 1q79P9+B9xkaFNeqlth8r/fBcrUTatHVcsrS2T6QpAHK6deMCcnk0RHahSEK4pm21Ik7P3qa5l/
 0fX2covh8ttQeO2kx2DH99nGBOz6QDJjhSXkuflQ1dE6k8RO7r9ySI/7/kbdovmu+jJ9ETcXciG
 yrehaYPaBrru4+FjZka+8Sbc71CkYOn4deuJpOr3M1/48vpkXmNVc2U/clGlqwEqOue1El7xCz9
 DPX392RMn0LeIk4RXSMCfTHMcbocKb6yijc0kSodr0N5iEwETdr6zsxEDxtvUU5Kg+s/A8pFMQt
 i0KuYvecWx488Kracww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230169
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99437-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A4892FEB8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c | 281 +++++++++++++++++++++++++++++
 1 file changed, 281 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
index 720757f8f393..a1a73586be53 100644
--- a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
@@ -6,10 +6,12 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 
 #include "phy-qcom-hdmi-preqmp.h"
+#include "phy-qcom-uniphy.h"
 
 #define REG_HDMI_8x74_ANA_CFG0					0x00000000
 #define REG_HDMI_8x74_ANA_CFG1					0x00000004
@@ -31,8 +33,282 @@
 #define REG_HDMI_8x74_BIST_PATN3				0x00000048
 #define REG_HDMI_8x74_STATUS					0x0000005c
 
+#define HDMI_8974_VCO_MAX_FREQ 1800000000UL
+#define HDMI_8974_VCO_MIN_FREQ  600000000UL
+
+#define HDMI_8974_COMMON_DIV 5
+
+static inline void write16(u16 val, void __iomem *reg)
+{
+	writel(val & 0xff, reg);
+	writel(val >> 8, reg + 4);
+}
+
+static inline void write24(u32 val, void __iomem *reg)
+{
+	writel(val & 0xff, reg);
+	writel((val >> 8) & 0xff, reg + 4);
+	writel(val >> 16, reg + 8);
+}
+
+static inline u32 read24(void __iomem *reg)
+{
+	u32 val = readl(reg);
+
+	val |= readl(reg + 4) << 8;
+	val |= readl(reg + 8) << 16;
+
+	return val;
+}
+
+static void qcom_uniphy_setup(void __iomem *base, unsigned int ref_freq,
+			      bool sdm_mode,
+			      bool ref_freq_mult_2,
+			      bool dither,
+			      unsigned int refclk_div,
+			      unsigned int vco_freq)
+{
+	unsigned int int_ref_freq = ref_freq * (ref_freq_mult_2 ? 2 : 1);
+	unsigned int div_in_freq = vco_freq / refclk_div;
+	unsigned int dc_offset = div_in_freq / int_ref_freq - 1;
+	unsigned int sdm_freq_seed;
+	unsigned int val;
+	unsigned int remain = div_in_freq - (dc_offset + 1) * int_ref_freq;
+
+	sdm_freq_seed = mult_frac(remain, 0x10000, int_ref_freq);
+
+	val = FIELD_PREP(UNIPHY_PLL_REFCLK_DBLR, ref_freq_mult_2) |
+	      FIELD_PREP(UNIPHY_PLL_REFCLK_DIV, refclk_div - 1);
+	writel(val, base + UNIPHY_PLL_REFCLK_CFG);
+
+	if (sdm_mode) {
+		writel(0, base + UNIPHY_PLL_SDM_CFG0);
+		writel(FIELD_PREP(UNIPHY_PLL_SDM_DITHER_EN, dither) | dc_offset,
+		       base + UNIPHY_PLL_SDM_CFG1);
+		write24(sdm_freq_seed, base + UNIPHY_PLL_SDM_CFG2);
+	} else {
+		writel(UNIPHY_PLL_SDM_BYP | dc_offset, base + UNIPHY_PLL_SDM_CFG0);
+		writel(0, base + UNIPHY_PLL_SDM_CFG1);
+		write24(0, base + UNIPHY_PLL_SDM_CFG2);
+	}
+
+	write16(mult_frac(ref_freq, 5, 1000), base + UNIPHY_PLL_CAL_CFG8);
+	write16(vco_freq / 16, base + UNIPHY_PLL_CAL_CFG10);
+}
+
+static unsigned long qcom_uniphy_recalc(void __iomem *base, unsigned long parent_rate)
+{
+	unsigned long rate;
+	u32 refclk_cfg;
+	u32 dc_offset;
+	u64 fraq_n;
+	u32 val;
+
+	refclk_cfg = readl(base + UNIPHY_PLL_REFCLK_CFG);
+	if (refclk_cfg & UNIPHY_PLL_REFCLK_DBLR)
+		parent_rate *= 2;
+
+	val = readl(base + UNIPHY_PLL_SDM_CFG0);
+	if (FIELD_GET(UNIPHY_PLL_SDM_BYP, val)) {
+		dc_offset = FIELD_GET(UNIPHY_PLL_SDM_BYP_DIV, val);
+		fraq_n = 0;
+	} else {
+		dc_offset = FIELD_GET(UNIPHY_PLL_SDM_DC_OFFSET,
+				      readl(base + UNIPHY_PLL_SDM_CFG1));
+		fraq_n = read24(base + UNIPHY_PLL_SDM_CFG2);
+	}
+
+	rate = (dc_offset + 1) * parent_rate;
+	rate += mult_frac(fraq_n, parent_rate, 0x10000);
+
+	rate *= FIELD_GET(UNIPHY_PLL_REFCLK_DIV, refclk_cfg) + 1;
+
+	return rate;
+}
+
+static const unsigned int qcom_hdmi_8974_divs[] = {1, 2, 4, 6};
+
+static unsigned long qcom_hdmi_8974_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = hw_clk_to_phy(hw);
+	u32 div_idx = readl(hdmi_phy->pll_reg + UNIPHY_PLL_POSTDIV1_CFG);
+	unsigned long rate = qcom_uniphy_recalc(hdmi_phy->pll_reg, parent_rate);
+
+	return rate / HDMI_8974_COMMON_DIV / qcom_hdmi_8974_divs[div_idx & 0x3];
+}
+
+static int qcom_hdmi_8974_pll_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	unsigned long min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV;
+	unsigned long max_freq = HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV;
+
+	req->rate = clamp(req->rate, min_freq / 6, max_freq);
+
+	return 0;
+}
+
+static const struct clk_ops qcom_hdmi_8974_pll_ops = {
+	.recalc_rate = qcom_hdmi_8974_pll_recalc_rate,
+	.determine_rate = qcom_hdmi_8974_pll_determine_rate,
+};
+
+static int qcom_hdmi_msm8974_phy_find_div(unsigned long long pixclk)
+{
+	unsigned long long min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV;
+	int i;
+
+	if (pixclk > HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(qcom_hdmi_8974_divs); i++) {
+		if (pixclk >= min_freq / qcom_hdmi_8974_divs[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int qcom_hdmi_msm8974_phy_pll_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	unsigned long long pixclk = hdmi_phy->hdmi_opts.tmds_char_rate;
+	unsigned long vco_rate;
+	unsigned int div;
+	int div_idx = 0;
+
+	div_idx = qcom_hdmi_msm8974_phy_find_div(pixclk);
+	if (WARN_ON(div_idx < 0))
+		return div_idx;
+
+	div = qcom_hdmi_8974_divs[div_idx];
+	vco_rate = pixclk * HDMI_8974_COMMON_DIV * div;
+
+	writel(0x81, hdmi_phy->phy_reg + REG_HDMI_8x74_GLB_CFG);
+
+	writel(0x01, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	writel(0x19, hdmi_phy->pll_reg + UNIPHY_PLL_VCOLPF_CFG);
+	writel(0x0e, hdmi_phy->pll_reg + UNIPHY_PLL_LPFR_CFG);
+	writel(0x20, hdmi_phy->pll_reg + UNIPHY_PLL_LPFC1_CFG);
+	writel(0x0d, hdmi_phy->pll_reg + UNIPHY_PLL_LPFC2_CFG);
+
+	qcom_uniphy_setup(hdmi_phy->pll_reg, 19200000, true, true, true, 1, vco_rate);
+
+	writel(0x10, hdmi_phy->pll_reg + UNIPHY_PLL_LKDET_CFG0);
+	writel(0x1a, hdmi_phy->pll_reg + UNIPHY_PLL_LKDET_CFG1);
+	writel(0x05, hdmi_phy->pll_reg + UNIPHY_PLL_LKDET_CFG2);
+
+	writel(div_idx,
+	       hdmi_phy->pll_reg + UNIPHY_PLL_POSTDIV1_CFG);
+
+	writel(0x00, hdmi_phy->pll_reg + UNIPHY_PLL_POSTDIV2_CFG);
+	writel(0x00, hdmi_phy->pll_reg + UNIPHY_PLL_POSTDIV3_CFG);
+	writel(0x01, hdmi_phy->pll_reg + UNIPHY_PLL_CAL_CFG2);
+
+	writel(0x1f, hdmi_phy->phy_reg + REG_HDMI_8x74_PD_CTRL0);
+	udelay(50);
+
+	writel(0x0f, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+
+	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_PD_CTRL1);
+	writel(0x10, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG2);
+	writel(0xdb, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG0);
+	writel(0x43, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG1);
+	if (pixclk == 297000) {
+		writel(0x06, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG2);
+		writel(0x03, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG3);
+	} else if (pixclk == 268500) {
+		writel(0x05, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG2);
+		writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG3);
+	} else {
+		writel(0x02, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG2);
+		writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG3);
+	}
+
+	writel(0x04, hdmi_phy->pll_reg + UNIPHY_PLL_VREG_CFG);
+
+	writel(0xd0, hdmi_phy->phy_reg + REG_HDMI_8x74_DCC_CFG0);
+	writel(0x1a, hdmi_phy->phy_reg + REG_HDMI_8x74_DCC_CFG1);
+	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG0);
+	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG1);
+
+	if (pixclk == 268500)
+		writel(0x11, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG2);
+	else
+		writel(0x02, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG2);
+
+	writel(0x05, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG3);
+	udelay(200);
+
+	return 0;
+}
+
+static int qcom_hdmi_msm8974_phy_pll_enable(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	int ret;
+	unsigned long status;
+
+	/* Global enable */
+	writel(0x81, hdmi_phy->phy_reg + REG_HDMI_8x74_GLB_CFG);
+
+	/* Power up power gen */
+	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_PD_CTRL0);
+	udelay(350);
+
+	/* PLL power up */
+	writel(0x01, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(5);
+
+	/* Power up PLL LDO */
+	writel(0x03, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(350);
+
+	/* PLL power up */
+	writel(0x0f, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(350);
+
+	/* Poll for PLL ready status */
+	ret = readl_poll_timeout(hdmi_phy->pll_reg + UNIPHY_PLL_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PLL not ready\n");
+		goto err;
+	}
+
+	udelay(350);
+
+	/* Poll for PHY ready status */
+	ret = readl_poll_timeout(hdmi_phy->phy_reg + REG_HDMI_8x74_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PHY not ready\n");
+		goto err;
+	}
+
+	return 0;
+
+err:
+	writel(0, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(5);
+	writel(0, hdmi_phy->phy_reg + REG_HDMI_8x74_GLB_CFG);
+
+	return ret;
+}
+
 static int qcom_hdmi_msm8974_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
 {
+	int ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_set_rate(hdmi_phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_enable(hdmi_phy);
+	if (ret)
+		return ret;
+
 	writel(0x1b, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG0);
 	writel(0xf2, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG1);
 	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_BIST_CFG0);
@@ -49,6 +325,10 @@ static int qcom_hdmi_msm8974_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy
 {
 	writel(0x7f, hdmi_phy->phy_reg + REG_HDMI_8x74_PD_CTRL0);
 
+	writel(0, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(5);
+	writel(0, hdmi_phy->phy_reg + REG_HDMI_8x74_GLB_CFG);
+
 	return 0;
 }
 
@@ -67,5 +347,6 @@ const struct qcom_hdmi_preqmp_cfg msm8974_hdmi_phy_cfg = {
 	.power_on = qcom_hdmi_msm8974_phy_power_on,
 	.power_off = qcom_hdmi_msm8974_phy_power_off,
 
+	.pll_ops = &qcom_hdmi_8974_pll_ops,
 	.pll_parent = &msm8974_hdmi_pll_parent,
 };

-- 
2.47.3


