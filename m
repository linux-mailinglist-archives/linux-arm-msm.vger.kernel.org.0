Return-Path: <linux-arm-msm+bounces-107413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOxZJC7ABGoeNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:17:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08705538BF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E916308E432
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EC14E3784;
	Wed, 13 May 2026 18:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/HOeRdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arc2QBCI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA324E376D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696055; cv=none; b=OnzkbNpIOO+gRPKd7ifhH1iAdQoqaLwGI41mXH00hWbHJ1F9oNNoFl4YhrurhBsp7hOuGrDXmSfQqFk636Zc2u7ClzJ1HFj1rhs2XjbmdVIsXOUvBpXeIsMpuk+3Bacw+dveGChUi5+DdcCMrT8fVlPBjALdsSuacr9nZHr+1Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696055; c=relaxed/simple;
	bh=Gb9iaHhErPAWN0IRSVbJi0WfaWGvRDkDjNcbmOqzreM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnjwA5pJO62IuHrEvZFXe88YOzNQUfhiWn/dOZAiAk/5apBzDoqXeXNyFdLRB23e/TnsrXqhZq7y2aaDf01wUkW81Z9wb+zicSqSd40f2uEgDZLZbvkK2GN9H2+ezv2/22PAMYkznzFOofUuzRcUrNIR98F59SU7gdaEJWb02Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/HOeRdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arc2QBCI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF5OZi4159945
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbJqSkiMGG/gTLlM9QQTChdoblkSPekP2NE+zK4RSQA=; b=C/HOeRdmjsX7LIMc
	N8C3ZLYyTNEjpFHRMQhpgHsFzgwvV/v4ccfSWjvy8Wh4t21P8spUVCvPr2FEkTre
	khJC7r0nTwM4pKUni19l1G+JmlY6qv/+P8wol+WJwcjIvFUwbSp8IsQ3lNUoraMt
	z3Z8PypH7jOgNwy1DNRzH4ZqSQsCs2DgL+JYsfQaTN3ZWEXKT0eqb3+Llgs8re2A
	PqUkvVZxdE8SPtVUo0XGC0QVFw+vcNfBvMkQaPMVEs/v7hWwOSNQkPr1o8bhUZMH
	kUaUK7V0+oZxOfRcLw3f5OthJ1k0i/MBpvqLxBhn2n9gnvnHmJqMS+bL5VdSDSqL
	6L55BQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91t6we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d2ad5df14so9470707241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696051; x=1779300851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbJqSkiMGG/gTLlM9QQTChdoblkSPekP2NE+zK4RSQA=;
        b=arc2QBCIaArXtIBhoskHMcz38jSrGz6sGjCTgoiDigsQAdgKhuRbqgu/MPkubh9DBh
         2fQT5A8wjRcF6TQVNvx599t/mIsqIDZENjzdeCMTEh62VVjcIJrH63AFnzjO8TCiTVEW
         /n7ICnvvbbEwxKbYc2jsaHNMZ76Gi+CwQq2Xb3wwLT6Ni/uFH9oFW9jP2ryym1PRCxv+
         ia7QDKfewIWLXxzZsl9asOCvRGnyf75sAbp40L6yPia29i66PFaNk0EA6RoPinx34wEY
         UQzM5IlMh4dQEMpI6JvCMqhHaTX57cJdncMaGrZcIZwEYDtsRuqFI0NlWOwDTVzFe+Jt
         vCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696051; x=1779300851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bbJqSkiMGG/gTLlM9QQTChdoblkSPekP2NE+zK4RSQA=;
        b=LTOUo1KlUCH6SEgNCkQjS6qypKFvF+lDABK4kFhG4W6YcuGwVD3Q6a9WbxWxWNikZc
         z+h6jv/Q7veRku3PIKSIPsa09B+s47MO6aTuYEBqK92mk+34s2N76DY+4p5GxFBKGWO9
         ssc4I4XtJy3otqYrm3QnHnWiDqit0gsfoA2VtZvdWwGBKjoEIh63ADzjplMjLkB1pMdE
         xn5wwHQui1Cy9GaklCQVJaAjb/grlTYZUkuB2U6qXn4qqvzwhbk6Oc8uCG8balps+7Eh
         FMQ+RoPssPUY7yGzJejysUqYYxRsT2eY44w9Uj+tOGmaWWqXzbLui1xNqhstggP7aiLE
         zLnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jeqIQgw6d+2WOEWYhBi9E04L6IUAVpKh9XzwLIU2jAAepNF5JA+rLr6WD1pTtTrAf9U9KpPF3kpKrbF+A@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSrkKkFB/b7qOqtoz8UKgGFNxkbKWHKgLFLT/13cWSo6B0m+E
	qgtwFDbA706fNC1stTK1A2U8sZouJVOoO49gBTM9TaIwzj+pHWSU+r3XWCuCPZ7OrKU4k3H6Irg
	dpKts1t9cTRBr8ldduzhbq7CWzI5IToCud2qGSHC7ngmK2AD1OZuZIpBL2fwsH6Dh3qd9
X-Gm-Gg: Acq92OFrH3ak6MSx+G8rxBX09yfJaNO4keePIjF4dZ72Xj0xeZqxofnV9DXBLSKpBFh
	cM312XNRRSuylJ0AYqRQH4j1GVrh9fk1PYXXSGW0T8KOjHXXDIqBV8Zaq7Ul2ofaDJtJj+AzBMB
	oyqVOEvsKkVkzsbJN1GGFYS/T0riqJcPLRJuMb2aVstO4l1T+4kDCe4hd57CkYQvNYkhtYFtJuX
	ZeRJhQluZceQlOZtG9RvH+0r+yDuM3IxV+o5a5gTOtM6kO8sLYcIS4ulWmG7XJX97W2+VW708o1
	54ydDjyCRsitXfz67GSKJtpA/ULVoFLmU3a3IBfwAAO229W0p/9nFVZMJeYmDVMWy2qCU4CXKvf
	mTqqnq+obQD/R5pkqqG+HvP8YfS8+m4J6ryoC1qUbq2p5kW/rhMjckvMxlCTIDJ2Um1r7Uj2hn7
	8SdwYYF6HkUJQRIrIs4TMGTc0GXXlsiMPcu4w=
X-Received: by 2002:a05:6102:3a12:b0:631:8665:350c with SMTP id ada2fe7eead31-637a96e9cc3mr2136985137.25.1778696051404;
        Wed, 13 May 2026 11:14:11 -0700 (PDT)
X-Received: by 2002:a05:6102:3a12:b0:631:8665:350c with SMTP id ada2fe7eead31-637a96e9cc3mr2136961137.25.1778696050842;
        Wed, 13 May 2026 11:14:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8974sm3174770e87.64.2026.05.13.11.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:14:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:14:05 +0300
Subject: [PATCH v9 2/5] phy: qualcomm: hdmi-28lpm: provide dynamic
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-fd-hdmi-phy-v9-2-ca98c72f1f9f@oss.qualcomm.com>
References: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
In-Reply-To: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
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
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=14593;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gb9iaHhErPAWN0IRSVbJi0WfaWGvRDkDjNcbmOqzreM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBL9tcVl2yBY5Sp5zqauRiqNPnJ4JPfcFm0gu5
 XiGZue78ZOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagS/bQAKCRCLPIo+Aiko
 1cdIB/9HEGnTFQD+U8aYt1inxPazDFqyM5/xUjplEupLOdC6+t1ACNc6YNHX0Ed4McwNFZpbwpj
 kG1lRdYC7qcn7Uk+CaRw+4n4YcKToJTbfXIkfY1jgKkBl/rAChj12VoN30+ppoxm6ni+pfdak3g
 6O02fAyq1h9xq4VGQ1yuOogTIIelMuTzKKBngS+mcHkPKng4S5CuL1n+xmILyQlh/Wm+YmmuINP
 Yp4dZlymfIjjhRH7Txdz0VvcvSIgQBamnz24Dqo+PVIns91V3nxl2/nbVbX3LF+u07v9Y1iXZhi
 byUA+mQG29Hi6vOIzmuZ7e+/kPw25HFGMdzTFEXnxfEmpzB7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0sl5Kxvnw1F1c-VtQ1cgvbl93E8B90ZT
X-Proofpoint-GUID: 0sl5Kxvnw1F1c-VtQ1cgvbl93E8B90ZT
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04bf74 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=rFVNmrDKDD7H5MqYjYMA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MiBTYWx0ZWRfX13tHnE/VOQZt
 iuAYivQVDS65fpVH9UOOuvXNQEePvgbKelESAb+2WmsR7S9BSlzmZIGQYp7WdSzDqecuUGU0ft1
 uKepM1RGBKlP48PcSMgPuyCMZX1oKHg5ZFD8pZDk48fvF13OpGyeP7zKizN18qp7m7zmMAVKM8F
 Dbk+NLWA2Y1GyJOo4QnNSo9ZT9TzjnV1kdN0K1X4lSqmsQyooZYTIiflV/2Eu1XsNl2VcuLZE7J
 zgWYlJEQxKoQmoN52CMN7kmLJRd/hiGYowwAPR2iRmzh7VBT+hQ6n0mVJvdLK0ENIYB1djOIWFf
 7qzmy85W2Fg7DLz61zWRBVrEW8C2uM6T0I1v7zpIRBVe5vFfsRUMCU+NcON8KD3NVvK0MTPDSSm
 8rYiTdMNtoW/VTsGsBm5R/e0Ovy2CbjfdmFUreYUsWqf4nPi155elFKhk6MX/Vrmi/IfLCY4ATs
 5AID3VvlFXmPKTX2mqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130182
X-Rspamd-Queue-Id: 08705538BF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107413-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Replace fixed value configuration tables with the values calculated at
the runtime. In some cases the values might differ from the original
values. Those were validated on the IFC6410 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c | 325 +++++++++--------------------
 1 file changed, 104 insertions(+), 221 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
index f1e7113e10bd..90d3331313c0 100644
--- a/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
@@ -148,222 +148,17 @@
 
 #define HDMI_8960_COMMON_DIV 5
 
-struct pll_rate {
-	unsigned long rate;
-	int num_reg;
-	struct {
-		u32 val;
-		u32 reg;
-	} conf[32];
-};
-
-/* NOTE: keep sorted highest freq to lowest: */
-static const struct pll_rate freqtbl[] = {
-	{ 154000000, 14, {
-		{ 0x08, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x0d, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4d, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x5e, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0x42, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-			}
-	},
-	/* 1080p60/1080p50 case */
-	{ 148500000, 27, {
-		{ 0x02, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
-		{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x76, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-		{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
-		{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
-		{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
-		{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
-		{ 0xe6, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
-			}
-	},
-	{ 108000000, 13, {
-		{ 0x08, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x21, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x1c, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x49, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x49, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-			}
-	},
-	/* 720p60/720p50/1080i60/1080i50/1080p24/1080p30/1080p25 */
-	{ 74250000, 8, {
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x12, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x76, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0xe6, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-			}
-	},
-	{ 74176000, 14, {
-		{ 0x18, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0xe5, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x0c, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x7d, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0xbc, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-			}
-	},
-	{ 65000000, 14, {
-		{ 0x18, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x8a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x0b, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4b, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x7b, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0x09, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-			}
-	},
-	/* 480p60/480i60 */
-	{ 27030000, 18, {
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x38, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0xff, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4e, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0xd7, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0x03, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-		{ 0x2a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
-			}
-	},
-	/* 576p50/576i50 */
-	{ 27000000, 27, {
-		{ 0x32, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
-		{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x7b, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-		{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
-		{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
-		{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
-		{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
-		{ 0x2a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
-			}
-	},
-	/* 640x480p60 */
-	{ 25200000, 27, {
-		{ 0x32, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
-		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
-		{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
-		{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
-		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
-		{ 0x77, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
-		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
-		{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
-		{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
-		{ 0x20, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
-		{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
-		{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
-		{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
-		{ 0xf4, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
-		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
-		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
-		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
-		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
-		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
-			}
-	},
-};
-
-static const struct pll_rate *qcom_hdmi_8960_pll_find_rate(unsigned long rate)
+static inline void write16(u16 val, void __iomem *reg)
 {
-	int i;
-
-	for (i = 1; i < ARRAY_SIZE(freqtbl); i++)
-		if (rate > freqtbl[i].rate)
-			return &freqtbl[i - 1];
+	writel(val & 0xff, reg);
+	writel(val >> 8, reg + 4);
+}
 
-	return &freqtbl[i - 1];
+static inline void write24(u32 val, void __iomem *reg)
+{
+	writel(val & 0xff, reg);
+	writel((val >> 8) & 0xff, reg + 4);
+	writel(val >> 16, reg + 8);
 }
 
 static inline u32 read24(void __iomem *reg)
@@ -407,6 +202,70 @@ static unsigned long qcom_28lpm_recalc(struct qcom_hdmi_preqmp_phy *hdmi_phy,
 	return rate;
 }
 
+/* This function is close to UNIPHY, but it has slighly different fields */
+static int qcom_28lpm_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy, unsigned long parent_rate,
+			       unsigned long vco_freq, u32 div_idx)
+{
+	unsigned int pixclk = hdmi_phy->hdmi_opts.tmds_char_rate;
+	unsigned int int_ref_freq;
+	unsigned int dc_offset;
+	unsigned int sdm_freq_seed;
+	unsigned int val;
+	bool sdm_mode = false;
+	u32 refclk_cfg;
+	u32 lf_cfg0;
+	u32 lf_cfg1;
+	u64 tmp;
+
+	dev_dbg(hdmi_phy->dev, "rate=%u, div = %d, vco = %lu", pixclk, div_idx, vco_freq);
+
+	if (vco_freq % (parent_rate / 2) == 0) {
+		refclk_cfg = FIELD_PREP(HDMI_8960_PHY_CLK0_DIV, 1);
+		int_ref_freq = parent_rate / 2;
+	} else {
+		refclk_cfg = HDMI_8960_PHY_DBLR_EN;
+		int_ref_freq = parent_rate * 2;
+		sdm_mode = true;
+	}
+
+	dc_offset = vco_freq / int_ref_freq - 1;
+	tmp = vco_freq % int_ref_freq;
+	tmp *= 0x10000;
+	sdm_freq_seed = div_u64(tmp, int_ref_freq);
+
+	val = FIELD_PREP(HDMI_8960_PHY_PLL_VCO_DIV, div_idx) | refclk_cfg;
+	writel(val, hdmi_phy->pll_reg + REG_HDMI_8960_PHY_PLL_REFCLK_CFG);
+
+	lf_cfg0 = dc_offset >= 30 ? 0 : (dc_offset >= 16 ? 0x10 : 0x20);
+	lf_cfg0 += sdm_mode ? 0 : 1;
+
+	/* XXX: 0xc3 instead of 0x33 for qcs404 */
+	lf_cfg1 = dc_offset >= 30 ? 0x33 : (dc_offset >= 16 ? 0xbb : 0xf9);
+
+	writel(lf_cfg0,
+	       hdmi_phy->pll_reg + REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0);
+	writel(lf_cfg1,
+	       hdmi_phy->pll_reg + REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1);
+
+	if (sdm_mode)
+		writel(dc_offset,
+		       hdmi_phy->pll_reg + REG_HDMI_8960_PHY_PLL_SDM_CFG0);
+	else
+		writel(HDMI_8960_PHY_SDM_BYP | dc_offset,
+		       hdmi_phy->pll_reg + REG_HDMI_8960_PHY_PLL_SDM_CFG0);
+
+	writel(HDMI_8960_PHY_DITHER | dc_offset,
+	       hdmi_phy->pll_reg + REG_HDMI_8960_PHY_PLL_SDM_CFG1);
+
+	write24(sdm_freq_seed, hdmi_phy->pll_reg + REG_HDMI_8960_PHY_PLL_SDM_CFG2);
+
+	write16(vco_freq / 1000, hdmi_phy->pll_reg + REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0);
+
+	writel(0x3b, hdmi_phy->pll_reg + REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2);
+
+	return 0;
+}
+
 static const unsigned int qcom_hdmi_8960_divs[] = {1, 2, 4, 6};
 
 static unsigned long qcom_hdmi_8960_pll_recalc_rate(struct clk_hw *hw,
@@ -423,9 +282,10 @@ static unsigned long qcom_hdmi_8960_pll_recalc_rate(struct clk_hw *hw,
 static int qcom_hdmi_8960_pll_determine_rate(struct clk_hw *hw,
 					     struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = qcom_hdmi_8960_pll_find_rate(req->rate);
+	unsigned long long min_freq = HDMI_8960_VCO_MIN_FREQ / HDMI_8960_COMMON_DIV;
+	unsigned long long max_freq = HDMI_8960_VCO_MAX_FREQ / HDMI_8960_COMMON_DIV;
 
-	req->rate = pll_rate->rate;
+	req->rate = clamp(req->rate, min_freq / 6, max_freq);
 
 	return 0;
 }
@@ -510,16 +370,39 @@ static int qcom_hdmi_msm8960_phy_pll_enable(struct qcom_hdmi_preqmp_phy *hdmi_ph
 	return ret;
 }
 
+static int qcom_hdmi_msm8960_phy_find_div(unsigned long long pixclk)
+{
+	unsigned long long min_freq = HDMI_8960_VCO_MIN_FREQ / HDMI_8960_COMMON_DIV;
+	int i;
+
+	if (pixclk > HDMI_8960_VCO_MAX_FREQ / HDMI_8960_COMMON_DIV)
+		return -E2BIG;
+
+	for (i = 0; i < ARRAY_SIZE(qcom_hdmi_8960_divs); i++) {
+		if (pixclk >= min_freq / qcom_hdmi_8960_divs[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
 static int qcom_hdmi_msm8960_phy_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy)
 {
 	unsigned long long pixclk = hdmi_phy->hdmi_opts.tmds_char_rate;
-	const struct pll_rate *pll_rate = qcom_hdmi_8960_pll_find_rate(pixclk);
-	int i;
+	/* XXX: 19.2 for qcs404 */
+	unsigned long parent_rate = 27000000;
+	unsigned long vco_freq;
+	int div_idx;
+	u32 div;
 
-	for (i = 0; i < pll_rate->num_reg; i++)
-		writel(pll_rate->conf[i].val, hdmi_phy->pll_reg + pll_rate->conf[i].reg);
+	div_idx = qcom_hdmi_msm8960_phy_find_div(pixclk);
+	if (WARN_ON(div_idx < 0))
+		return div_idx;
 
-	return 0;
+	div = qcom_hdmi_8960_divs[div_idx];
+	vco_freq = pixclk * HDMI_8960_COMMON_DIV * div;
+
+	return qcom_28lpm_set_rate(hdmi_phy, parent_rate, vco_freq, div_idx);
 }
 
 static void qcom_hdmi_msm8960_phy_pll_disable(struct qcom_hdmi_preqmp_phy *hdmi_phy)

-- 
2.47.3


