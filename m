Return-Path: <linux-arm-msm+bounces-97673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLarKPrstGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:07:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0728BAAE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50BC9303EFF5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB8A34EEF0;
	Sat, 14 Mar 2026 05:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAxFRmxz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+0TfYCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1784334E75B
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773464805; cv=none; b=N583cv0aA6NK5P++CH78BH7jWeSPmbUAdUmVarwMQSR4ybdsK9bF5dXgFnUAOZHj/7ssTrTIacG8V8dsC8P3rQKogRjxpn0dStiehiGJQKo3qw0RzEmpiy3fuHj3Na1iEj1q6AeR1R4CvHbjLWRMxoiYqly5utYhNU0UuFn5BNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773464805; c=relaxed/simple;
	bh=MbvT1b8xS/YMwwXL8XURnPze5mFblybfiocVzfQ38o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BeThHzbno1IZi6PvriRgX/Y2Pf9SV+fQZQknQOLRIyhftOIlSuvCraVJcva1DoCbJmayrY9OlsKthcGE0UH8XFizVDwW/t8x9AVKOai4kxAImTadNqeNS7au9o0MY3am65fnx+c3EQSlYe9pl4YSH/6wryVB0/1bJnXWfoKN6Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAxFRmxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+0TfYCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3jqKo3327999
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLcw39wY0jkt+Tdjb18r8ObNeBl0mKoaTLbtIH1xiyU=; b=UAxFRmxzl86pEki1
	+ii6XYj/iQufNO3HT7ERGgOHDZUPM8UITAemyLHIGKG8pCVS/YXzC3YaU30hKhDL
	yzvpTGfo0AwurNQg+Kc9fJu+Vw/Q1D94KGNOOGj+bkZiMc8aWoqw7DnT1LNicxH1
	zTTlG4o2GAjs2ptOJR0w1VAegDOOjMqJ+ejGw9HczPrNNw/QStKvDLS/G2YF4OUO
	YEsFqw3G/ANrgx00g0JgJr2bUydadQc3rlFZSyTIM/EF/nqLlJ8o69X9t01dXOqk
	MiXGeRhlE5Q1ayycaRTy/j3MOWbIehgCVuDyZZNCVny6ekbMA3NxzIEJz5oQZsEd
	pUzZ1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw02783k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:06:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd409so428026085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 22:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773464802; x=1774069602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLcw39wY0jkt+Tdjb18r8ObNeBl0mKoaTLbtIH1xiyU=;
        b=d+0TfYCeqiRIj2IWXrhlx01a1vX8yYdDyKIZHRHNIPnn1ZcEqqcJ0WeDNeq0lYBRUl
         UfIjcNpeYair9iHt4bJ7szYfN8J89dsUGoR5LhuDV4ZUP7Fi+NrDbVUkLCFv3doaMEys
         pkmJSxcZqcO15mQgj74oMVqaS2BYuzedCGbRICj1c25YRlqdBXlwgb17qDDHwlGh2CVe
         j7YQoEdqzl0y/Yy/ZXeqSSLKXISJ3pTg5bxdGJ+IgTd2bFKGw0RFaILWPSuTMeAIOl0H
         zjzGG9KJQBFpCzYMCZ6Vqj1dgh7LY7mWemPMiO7gLut6hIgaaSPTimCBaLTPcyMRF7xI
         cHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773464802; x=1774069602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jLcw39wY0jkt+Tdjb18r8ObNeBl0mKoaTLbtIH1xiyU=;
        b=a5W9dC72lIVdKMNcVQwfXyij/Cjll+bZXHGzjumFW3dZ8ruk5jfn3kcIhj8mJ4pxXk
         47atZW94uGg+tXxpX9Nh+VVMQkIUndsIcp4zsijc35yt1pkSBj2WMEiyKZDm/OB1/bJg
         wap1OCTJ128e8nB8ruDCyoEmQ8UuWmGSdfXunZg8QeIFBbzPuoNiW/3pcGOgrvH3y8ID
         o3jxPbXEkLrGr4rgdrMrHNrpAvnd3pn38XDVzHqN3OF3Wite9bHMcabdclmAfiVLFm9W
         oBqKp+JHpMLwoY4xqzrO0V+Et83+vYxK0vxi/Ezwg8dYBSnfxXQwO/TymJGenb7Y1gvf
         yLVg==
X-Forwarded-Encrypted: i=1; AJvYcCVgMAI/tRVFl4U73v5tluqJSPRFJzM+mOQXwhTYBL4Jmsv8brVKBzJdlk2eis5TRLoJEqgdcNv9cEPk/pFy@vger.kernel.org
X-Gm-Message-State: AOJu0YyMZu7EZ9WHCmLp3+aXE96sWXMkZrNmqGqL04seD07tT7d+8DVz
	GAL4HZ1k6MJB2wKFwB2Y7s3+0feJ7EyLixBCUUAaYJQnwPlaI2nvR9VjTH2Uy4kP9ZpyR9KyR7U
	rQeb1+xe6STd3hgNf5XYtKfYwDwfnbfaYWoL7z6uz8iIZEhmzVUNZdUY/CsLG4dCEdhAS
X-Gm-Gg: ATEYQzz7ScHcmexc4N2JYp51GTy95J2QByoyLWQiB7C9Y837F2RjXlIPGXIQQXmQDHj
	1EROx79xX53pUy8BdyJHAVhH5s1eYWnJ7oO0kiG7SFIT1Q9ssfIxBYjxTdvDQuzyJoAHt2Pk8xJ
	yCYUmb4HHUlQ8EwkJ2un5CA3PFMgRIrR4D5oajMF5e7XuKKnNIjBrPw1KqkZ2T/v/c6m+SC4yOs
	ueDdFnYV7AaHB7z5mHsgzYY+lwS59ipgcZDN/WzVndsVxqvAQrzRg1hcrkMXNOuTQFkGbh3E1fX
	NUmONBKD/wXNJHrtFGCoIWl5NZfksEsOyBpDnQHGhSHzvf5rSv7wCGKQnH4uXoBG73XHW2zHdZ/
	rGEPP1nRv6m6YtcHrDpPdCCT7Cu4IR8eiaMdi6SprNWx+Aakt3u2zd/TwDSeueAPNml1g6rcksS
	Oqy/hp3FIh0U3ScimepwBTb3yAAN+x5iAm918=
X-Received: by 2002:a05:620a:2956:b0:8cd:b05a:a631 with SMTP id af79cd13be357-8cdb59ec194mr755932185a.16.1773464802336;
        Fri, 13 Mar 2026 22:06:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:8cd:b05a:a631 with SMTP id af79cd13be357-8cdb59ec194mr755929385a.16.1773464801855;
        Fri, 13 Mar 2026 22:06:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636206bsm1982771e87.67.2026.03.13.22.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:06:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 07:06:21 +0200
Subject: [PATCH v5 3/4] phy: qcom-uniphy: add more registers from display
 PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-fd-hdmi-phy-v5-3-58122ae96d3b@oss.qualcomm.com>
References: <20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com>
In-Reply-To: <20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2530;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YN5QoEM+F0T4zQEnjBPndZeQoDCtg5ulqiAWAhLkG04=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptOzVyi6PKpjFORb4/UdmwCTrHqoqSSh/Ga4b1
 aLH+7egt6mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabTs1QAKCRCLPIo+Aiko
 1a92B/9fHs8pscVhgX9ZdgfIBdiydhNXgNgJoBDNyCIBf9mE6/Jy+SzM35HfDbFSrOvNgX7L+rG
 3AE35D0Th7sTGa0uSfvM1yjb81i/pWzZyUwYcrunl5wfIOKPTPcEPizOp+q3SK1eQD9Vg+u7DGT
 bXECEz2ew/Z58sPjKXUTor5Vba3sNSto7+8OBoe06NbcL0mjmndAjMCuzlMIRVeKkTjshL0QDJJ
 /6k/Hg1lzR7yQiLW3SBq/BhvvvmS7Y36ACx/6ru9tjrNp7IOhR2RzVzSGLh+Gy9PAYPEMKBZ6dq
 p3uBfZn+gO1NVFx/d9Aw5T+2I731/DeP9Z/2aHrq8vQKGpyA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: W7NexAtYtliz5nbxO6KM7pOnnbZxyqS5
X-Proofpoint-ORIG-GUID: W7NexAtYtliz5nbxO6KM7pOnnbZxyqS5
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b4ece2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=urM--5puCODp6CsINTkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzNyBTYWx0ZWRfXz9pVW4VQrn7t
 PT4am14KSD14RMv7sOl5NlZ7YNS1MTKE1glRPE2Az781+LjEhE1L+PKXdI3ZATdC9LDLFbs4AAN
 O/iyQT6VQKP0+zhNSu9JjLFWV5lIB846lrPnl3gphGBjimLRAAsWK2ax46fCKg0+zkis31UWbdP
 H7TusILrMBOEfQcAkffy89TOHPzLZHwsq5RYTDqotB8fQSNL1AlfCRE852GghTyczGHMnV5v6VQ
 KT8WfbtsH9wZ1mPN7LL/G+TOO2x0g3TezmFUZ1OWMp85JbIKivFOtXPPoPaxOkyHhqQRUr7jnEI
 ZUmfYn3zXYvsVKeZ3ugIvC48nLlMWS3oateDdbQxv75q32ZwRcBUAoIs/pEMK8P2FFoJlOLqu7B
 PnF5AlEjV5JIOMXrs85jlV7UOTI9CvJg+3MFy8MKBS87/M21zqfcycEBz1lhM/ZAEx3fUTNyO08
 +VgMhSDESGPj41lhidw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140037
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97673-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43B0728BAAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Import register definitions from 28nm DSI and HDMI PHYs, adding more UNI
PHY registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-uniphy.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
index e5b79a4dc270..ce782018124b 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy.h
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -8,8 +8,19 @@
 
 /* PHY registers */
 #define UNIPHY_PLL_REFCLK_CFG		0x000
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
 #define UNIPHY_PLL_SDM_CFG1		0x03c
 #define UNIPHY_PLL_SDM_CFG2		0x040
@@ -22,11 +33,33 @@
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


