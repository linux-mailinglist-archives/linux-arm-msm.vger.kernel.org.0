Return-Path: <linux-arm-msm+bounces-98603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oInjODpyu2kdkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:49:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C02C5B0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E55931429EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C10C2EFDA2;
	Thu, 19 Mar 2026 03:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8Fn53io";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVdLmyH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB47301010
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892116; cv=none; b=ALDv6Z8u+d0TS2CZyqSu5EfddjRM2hSrq2PKbxv1NfAzTHXluN5nudknqjkydlsOG5R0Wwx13ITo9o7K40K/i9e1CqauFxd5A9UpHoBO+HeUjNPwcpEFsH7VTbIU0tj1Q9UwLiQ2xwj5SaH2DTygptissTv0/t05pDjhVe3m8QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892116; c=relaxed/simple;
	bh=RRdFiNjgnPzCRkH1+W1J54NjjzrWTLFzh8czz6UBnnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLRyDhDAja5GjhQTuf+mzYK1RKK82cVB7ayNGC6m1MrX0LhsiawgQpG6KvJljiR1acVvu4QQUBxPtwO9kGR6SpdW3IuF+R+Bk8+6xe4aGCM50nAjr04tlDnZAICjWb2WBmUq7efRFIWKCHJKco7YqII2KaYyNF/ylfFhmFC5Bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8Fn53io; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVdLmyH6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J0XnYM914408
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c58/Sfeclx1N64rZvnt6VYgoyb1/qdvgxUAhY/kc9dc=; b=a8Fn53ioPyLd2UN6
	c58T25imiz5da+jf6qy1c/GOiOxhdSwTPZeeSDp6qsO2zLb8ICxF+ryXJAqnS+Lq
	KSToZ3snDYI6makzp6MtAAo3jP0lZkGeywB7VAjGwXaSzx6Ti5ZflRKwF7Vx+XSz
	Tud6TD1Sm+Rimgcn81XhCYS1sC/8RaK/lNlgSLMny8greDLYZC2Jgxxb1EsNzUny
	utNRZJXvgFn3/y1gYWqCYO0bd8oR0EXxalApSOyk77Q3sWoUAiocvrGm1rwmBa2A
	o8pXlJqBCsclv0E4pyXInTwxcy7HNYyzmLxN2EruCWgRiDe/C+tVdcNpybEdi7iB
	2qdAmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxytyes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:48:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so25608531cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 20:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773892113; x=1774496913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c58/Sfeclx1N64rZvnt6VYgoyb1/qdvgxUAhY/kc9dc=;
        b=FVdLmyH6QQ5n7XSxuRg9/5oQFnasv/umc71bWPVOQlRY0qbh+Pktx7c9fHYNv2i5Bk
         RtDEp4LaI6ange55gq0OwOK+yPVgLpeNFq/rVO0QuL6RpfTDnICKyAKcSaIgrpamQ4ff
         diF71J4qRGN0H+e6aTlvE/7A9WRGMjqE9Kp38a5gXKy5wDce1qI+9CjGLeQithvniB+E
         g4T/DiO6gN76D0cvzEE0mfkx3ASHvzW+pT+iahfRY2lPtFBqdpexxBy5KJpYzOTgxhW6
         N6rS0DG5wRuKKoflGFn0LI3kIVmiWB2UwWyE9VjsBrDSjoyGyiM4L0OAv3zRDb8EKNwo
         D/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892113; x=1774496913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c58/Sfeclx1N64rZvnt6VYgoyb1/qdvgxUAhY/kc9dc=;
        b=D0TijtIulGoDKW0z2Maazh1Luw3q+udyToVwbuk/OS2BJzu+xRCfusVP0E2uQEQdlG
         DYOGSPw9y5YuIk5awFzaqr3h/H12mDPRpIOvKySYl419w3cBe0NQA4b66kxLhVhB5qRQ
         abLldnkQ/LY5Qbpl9TSYHLUruXVzV87Witdkm9NdESTm8sARywZvRfPosz1z+J2SVzlu
         hRcbzeRhXi/WXrnW0Q9aaQclIBb+zmZRvHYDFR8T2SwHjaHVc3P03PXJpaYwmNNQ4qjD
         WIIZSeM24RrqyU8KomCy+6Y8UzU+eCmi7b1bMmYeA7bgHD9/MqqaufQn3RNNkFDS2CNE
         MVUg==
X-Forwarded-Encrypted: i=1; AJvYcCW8VwWD6Y13m8JHRhGNddvhsShMj8v0Art+fuWAqUYCqOqDooQR+Y6DOm1e7rTDnmzrrW0U0ApEftcQjPJU@vger.kernel.org
X-Gm-Message-State: AOJu0YwuLwv8fQ36HFy2H9gvLcMJJXexHfAYVDy270Y4URUjmB4fzvHk
	rvfnputxmjg2s4GnBGhG/UKO91NHr073JLb/erBravHH+27K8Nj52hB2okj6mMD5iyYSt/3g0Zq
	uIb9DFWOK27kuH81vQ/88oXvkCYIlIaNvNeSv1FOdA+V1RDzd4vEBHeHOpGemURMij397
X-Gm-Gg: ATEYQzw8IETuQihJ4xOqQ+jC82egsejjLwLr1kmO8dlgABHG0MFE2oJb/U5PoUJlpIh
	GGGcqEwIoXJrYMGnudgbaKBPwL5/YOjNnGpXIq5StNWIwWpngChkSiONc9gJlKUhSE1NWDkcsOj
	EgmoOh2NzRg5u0oWrNkbqOKyugDkHSmwhw7lWO8Q9GYNJexYW6IbFobFMBBQtNsSzW/QZ66oRoi
	PT/awelpt8sXvy5Ep0Z2Nrdjo+G9YcSKj+V6H9yUsIMzdcCeO8PXWunaAJJ9ksaHeuc9xVaJ0Kr
	bsT3PQhX/vokgJ6dhixWxZljHGXI9m00k6ghdLEWfgQ3DZ5LUX2RZzj/AzyY7W0WyfsXJLOEunR
	sl1/laVYHRI5zwd0/5/vy6QI4usiA7YPBfXw2zJmnBVCoAKwsaloVy4nWOdYjQm5cNCXz352yDG
	c4Qro0ffYJjcU0ETEEwaSZyNrfeHikNn9ZljA=
X-Received: by 2002:a05:622a:10:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50b2461a932mr29074271cf.14.1773892112935;
        Wed, 18 Mar 2026 20:48:32 -0700 (PDT)
X-Received: by 2002:a05:622a:10:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50b2461a932mr29074061cf.14.1773892112468;
        Wed, 18 Mar 2026 20:48:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c79442sm907649e87.70.2026.03.18.20.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:48:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 05:48:20 +0200
Subject: [PATCH v6 3/4] phy: qcom-uniphy: add more registers from display
 PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fd-hdmi-phy-v6-3-cefc08a55470@oss.qualcomm.com>
References: <20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com>
In-Reply-To: <20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2885;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A0KQeSlhmmB1eMUUohCWtmSPla+2ZySmmRe5s7HDmyc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu3ID1p9OtdtONIroVWJ4ofNJlQ0FRMyd22GAG
 GkG11xtlheJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabtyAwAKCRCLPIo+Aiko
 1QuwB/9Y5mflvk48vBMF2X6bgfx5G2s53oNW7k4Je/PGMIao8D+Iw5jt3r+8MZ7306+xOp43zpp
 A1blzkF0vmQbYgS851guQqkfO/P1LErGeeZ6Ir7iRUYGSZnDqfQ/2Si8yLPbiKPl/6nFt/Ow7Dn
 mPS04Mq5caROA+i3B6y8H1iNgcx2w+MB501+eT9WJ1g0dFWNPKLAtZqiZEaVZ5JD8kANn5J7RCI
 NR3GMgRAV1VByesZWXXiq8uxkBAkgHK7V6HdyMnrRTh3ijASnYLb4afO+33mHrjxwCbmlFbXgc0
 qeScWAhzGcb2KI8ZZVakjx67DZu+QMA3JCAwGQiJjzNbgW3e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OUeS2FhmBGhcwBkPSmj3p4kksYG3fHge
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bb7211 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=NWzoLV28igjY6Ppe7YgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyNiBTYWx0ZWRfX/C62OOwTuT7V
 iVBOyV4bd4AG93s/YQcBIxxZchRR5883frwuuhTNxkJT7qv1fIpkeEHdHC6cJgw9te5V/wkKJB+
 tnlQyXjhgCgdDBHJP4SfRxGtGlH9Wtm6pR50dOYv5owgK+twJbvrKzmRrzCcY8+38a+rAJQI+FY
 TmnvxQOd2lT+pB1sRWAHqTWk3p+FAdDj/6c0m4C5VjaZXHxTHvoTNns15FteewTtDSIviJEQS/v
 X0AjsqFcCyrVeT1vLNUrAkGYFe+ZonHfewXGnFVjZagbW814K0vhKNceYgQLO/CNdM/10vw+onU
 bw841zT6lFwjMYQJbZM5ztSvSqBteQueqNx6rf9RoNzJruCgKCIHOaay3aRDP7BBtZQB8CZ4lDy
 KlP87yDxLWnkmIF2nJWOdTf4A5STuD8+fHQyOA/wnv+OUJhBDkfYmjeDgbkbD+cjc6N51IbKl/f
 /BJ6Ky6bUl+c/8SvToQ==
X-Proofpoint-ORIG-GUID: OUeS2FhmBGhcwBkPSmj3p4kksYG3fHge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98603-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 502C02C5B0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Import register definitions from 28nm DSI and HDMI PHYs, adding more UNI
PHY registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-uniphy.h | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
index e5b79a4dc270..ba9d14aae682 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy.h
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -8,10 +8,30 @@
 
 /* PHY registers */
 #define UNIPHY_PLL_REFCLK_CFG		0x000
+#define UNIPHY_PLL_REFCLK_DBLR			BIT(0)
+#define UNIPHY_PLL_REFCLK_DIV			GENMASK(3, 2)
+
+#define UNIPHY_PLL_POSTDIV1_CFG		0x004
+#define UNIPHY_PLL_CHGPUMP_CFG		0x008
+#define UNIPHY_PLL_VCOLPF_CFG		0x00c
+#define UNIPHY_PLL_VREG_CFG		0x010
 #define UNIPHY_PLL_PWRGEN_CFG		0x014
+#define UNIPHY_PLL_DMUX_CFG		0x018
+#define UNIPHY_PLL_AMUX_CFG		0x01c
 #define UNIPHY_PLL_GLB_CFG		0x020
+#define UNIPHY_PLL_POSTDIV2_CFG		0x024
+#define UNIPHY_PLL_POSTDIV3_CFG		0x028
+#define UNIPHY_PLL_LPFR_CFG		0x02c
+#define UNIPHY_PLL_LPFC1_CFG		0x030
+#define UNIPHY_PLL_LPFC2_CFG		0x034
 #define UNIPHY_PLL_SDM_CFG0		0x038
+#define UNIPHY_PLL_SDM_BYP			BIT(6)
+#define UNIPHY_PLL_SDM_BYP_DIV			GENMASK(5, 0)
+
 #define UNIPHY_PLL_SDM_CFG1		0x03c
+#define UNIPHY_PLL_SDM_DITHER_EN		BIT(6)
+#define UNIPHY_PLL_SDM_DC_OFFSET		GENMASK(5, 0)
+
 #define UNIPHY_PLL_SDM_CFG2		0x040
 #define UNIPHY_PLL_SDM_CFG3		0x044
 #define UNIPHY_PLL_SDM_CFG4		0x048
@@ -22,11 +42,33 @@
 #define UNIPHY_PLL_LKDET_CFG0		0x05c
 #define UNIPHY_PLL_LKDET_CFG1		0x060
 #define UNIPHY_PLL_LKDET_CFG2		0x064
+#define UNIPHY_PLL_TEST_CFG		0x068
 #define UNIPHY_PLL_CAL_CFG0		0x06c
+#define UNIPHY_PLL_CAL_CFG1		0x070
+#define UNIPHY_PLL_CAL_CFG2		0x074
+#define UNIPHY_PLL_CAL_CFG3		0x078
+#define UNIPHY_PLL_CAL_CFG4		0x07c
+#define UNIPHY_PLL_CAL_CFG5		0x080
+#define UNIPHY_PLL_CAL_CFG6		0x084
+#define UNIPHY_PLL_CAL_CFG7		0x088
 #define UNIPHY_PLL_CAL_CFG8		0x08c
 #define UNIPHY_PLL_CAL_CFG9		0x090
 #define UNIPHY_PLL_CAL_CFG10		0x094
 #define UNIPHY_PLL_CAL_CFG11		0x098
+#define UNIPHY_PLL_EFUSE_CFG		0x09c
+#define UNIPHY_PLL_DEBUG_BUS_SEL	0x0a0
+#define UNIPHY_PLL_CTRL_42		0x0a4
+#define UNIPHY_PLL_CTRL_43		0x0a8
+#define UNIPHY_PLL_CTRL_44		0x0ac
+#define UNIPHY_PLL_CTRL_45		0x0b0
+#define UNIPHY_PLL_CTRL_46		0x0b4
+#define UNIPHY_PLL_CTRL_47		0x0b8
+#define UNIPHY_PLL_CTRL_48		0x0bc
 #define UNIPHY_PLL_STATUS		0x0c0
+#define UNIPHY_PLL_DEBUG_BUS0		0x0c4
+#define UNIPHY_PLL_DEBUG_BUS1		0x0c8
+#define UNIPHY_PLL_DEBUG_BUS2		0x0cc
+#define UNIPHY_PLL_DEBUG_BUS3		0x0d0
+#define UNIPHY_PLL_CTRL_54		0x0d4
 
 #endif

-- 
2.47.3


