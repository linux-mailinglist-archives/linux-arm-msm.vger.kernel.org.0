Return-Path: <linux-arm-msm+bounces-74981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D7B9DC6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D514163CE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB9E2E9ECC;
	Thu, 25 Sep 2025 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7wC7Db8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611E2E9EB1
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758783958; cv=none; b=LRCak4amm0zh+Hz5I6uEg+YhUc2giezqz9SeAU8EbWLrdsuVsWuOwRCN7J0AfgcaVTMeiFiA9IrvSHsr3yudzTEEhomFBTQG7YR/cMGGUDU26Gwp+MyDgUTl/JYMBs/O1Dt02CMcqb7IB4MZ4RzVqSThijYLU02QmjuQlDDRhUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758783958; c=relaxed/simple;
	bh=xkXgNM4liwYFuSUu6liFsyLgM/OZQSJZDsJNBIKnRJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxA7xn9byIkBYwLL6P39DiSJjkhX1HjXVcygNMQdaSqbletx5M74OQarmDK6QbvWEc8PRJRgsS6Gz5RPvqJabRqYUH1/luREKknEJpg2esqmR9q4O2W/3Nmg1X0k7F8Od0VThGy/vXQDTc7F4tVOxnIhITWAdCoyXEGHlsuqVM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7wC7Db8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4aN2O027602
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GrguMAXW+fsIhAkyrPq5HAaKMZ1Mc4h2NG633gQkApg=; b=h7wC7Db8Qy9+pqRg
	27cIvsmRzrzh77Y7Oni14zgKZ1z9R5KMU7kktkrm4RTLreYWhbJX9YwFFW3xpkw3
	X33ZSCuAtnjH+m2Gcmx0t4+agws4INoC9r0A7uqOfAFLfU+sb3gtwZnodkNFKTz2
	gMCqV5B2WHBcHQJVCHGChQ0lSglrVKZVyPoOGpkIVEIF2mmMZdtblruMcHvwO7kE
	XyjgCMTcp994DuWkv/2gqRaDao92xMk04VcKL8yCZ6Csaxh23OvKckYaVfpdFJyQ
	mLs20y/PXl0yOvtFDe2l4/k6vv5yD1kep4XiCmIDE+HRZ9svAGSymsxt5H3sRBNF
	j1dUaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0buy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3327e438680so141473a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783955; x=1759388755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrguMAXW+fsIhAkyrPq5HAaKMZ1Mc4h2NG633gQkApg=;
        b=dPme/Nt0qwGCuFMJZ9sOvQl4QEJSiwRtVKBtcjbOld/b8MXawNSUR8yFJFhKyiShtG
         sx/TlrvPx7QMcUZPCL36uuulKWOZnd3TeXs5q7WhMrg6RRXf7le+9rJpVeRY5FAlLiyv
         0LsOg3UYhOYT+JDPZi7hGBHHEF7FElzRtWmFWOL3uGqq5guKN1xdi3mOD7IRblI+doZa
         D5lhjoCrnIPOPuUzvI3DNYUy5svON6tJIlVt0gW92vJPaV7DdOpZaljB4ROtTEYWW6C4
         L0yzOdijUkLIlmjP92lJzvWkeYq1JB9wsuEqulek6wsSTCj0X9Ns+9bvqL1Ade85Z3R/
         cMLw==
X-Gm-Message-State: AOJu0YzNKBkRuQMWB38IMLFwY9a+DavXsXU4kxeoeUfRmuZwWyOVbkua
	z1gfvJ8AvUa4S24I+Q5C5ft1gz2uJyYBM0gidjo95KywGmc+EDT/oFpm1ZsjCKzAKcky90uR0sx
	28Sf2f/pwInLdqiw4cw3gESVtKq3NhmHUQzupwK40vykno57DGpOJyzYzx0fOW+lo6PdK
X-Gm-Gg: ASbGncse6R3sGzIxSuayDY9M0qTbMXHgxibs4smyQkQkVHllhVHBO1NC8Zkfv2VqQ5h
	hpAjqyOoBhWa97pdO0gr9azNjDt7wYOCHwWefUSnTtV/0BvSbfu/awI+FI/EQrAljIcnhGP9wMY
	PXIL3sE3nsmty4k+QBG6gBP4ulcmg3/MfhCVuFRj+9WMDxF7OwEFk/RgFPIT/5iY9toYwKtcBPv
	ixVePZ44BEh625LVPcUcInIy+UnI9JVtSv/0EvWRFxpR3g9i8kACtMLF26qWyREXr11XQz9WgNB
	4+dG4ngPsXLJ3qAdKZGCM57qw9t07rFAMhLJ6r2YYfGkBzd/q1j8VG9TBcKjjJZc+Ehj3/Oi2st
	F99HnpE747jMjQCii/HA5DAoXAwHpfQ0A2PzivLlPxxMYARTtUqzIiRsX
X-Received: by 2002:a17:90b:4b87:b0:32e:8c14:5cfb with SMTP id 98e67ed59e1d1-3342a22be84mr1423274a91.1.1758783954713;
        Thu, 25 Sep 2025 00:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiGLGl2UMupnuQtpEa9ZZfBh6eqEqcbNFWWTUDdSOwpa28BBCD0SysDLrBKUXsdg4C53UiFQ==
X-Received: by 2002:a17:90b:4b87:b0:32e:8c14:5cfb with SMTP id 98e67ed59e1d1-3342a22be84mr1423240a91.1.1758783954248;
        Thu, 25 Sep 2025 00:05:54 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:05:53 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:51 +0800
Subject: [PATCH v6 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-5-419fe5963819@oss.qualcomm.com>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783909; l=3308;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=xkXgNM4liwYFuSUu6liFsyLgM/OZQSJZDsJNBIKnRJI=;
 b=J0gdvfqjAFOidyttJubhcvzBjqP1Zm2wCBXo2NSulNdAolL4liaYtKEaBz9IcvDS151zoaVyg
 bqAqIBWVTU1C4VROc9+fi0LDhH2w5lPAT/FoB4VT18AwGr6Q8XpxwWx
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4e9d3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zr9GHpnC6WUyfWqp_BsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX2XcpvzKgmPd5
 vpasEWHZ1gWXtQhIzHT+YXYn1sV5Uxc8ZSh7ZED7G/QMy5M5LoXvR9ebQiXKWbYbLcedbJ+rUfb
 kGmZgcy8FfKXuZQ7zK9ghQym3+6VcWRetJ5jkcpRRlLVaQzqT8BoHIzPpLVOZXsWXMQW+XorZOi
 IeRVdBdoJY+w63SgHdSNpCbJi/tiXHSMDELQIeyyOH3yUaCHO9L5Utw0h/BQSMWOhD20p4R975E
 MN6Ov65kxtacWQ6SKcPVNlkU44IoF6bERp+M8WhGoz+jQTQWPH2SHcFCezicjx21Of4GYXXqP7h
 mTWNyczyHkKALoYXkakiuZbTE2vmD+tLP2uXcc/EC42M0SSM9YsoLZG0Xd+hrKhf7KRAeAnfKUl
 2p6uWEak
X-Proofpoint-GUID: fHqRuVHKlU6RaXu7T9CL2C1QnGwHANoh
X-Proofpoint-ORIG-GUID: fHqRuVHKlU6RaXu7T9CL2C1QnGwHANoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

The original reset list only works for USB-only PHYs. USB3DP PHYs require
different reset names such as "dp_phy", so they need a separate list.

Moving reset configuration into qmp_phy_cfg allows per-PHY customization
without adding special-case logic in DT parsing. The legacy DT path keeps
using the old hardcoded list, while non-legacy paths use cfg->reset_list.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3b48c69f9c3cb7daec495ebc281b83fe34e56881..f9e20f43435c050e33e9490343a4693a339d692a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -335,7 +335,8 @@ struct qmp_phy_cfg {
 	int (*configure_dp_phy)(struct qmp_usbc *qmp);
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
-	/* regulators to be requested */
+	const char * const *reset_list;
+	int num_resets;
 	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
@@ -464,6 +465,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list              = qmp_phy_msm8998_vreg_l,
 	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
@@ -480,6 +483,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_sm2290_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -496,6 +501,8 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_msm8998_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -512,6 +519,8 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -1051,8 +1060,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 				     "failed to get pipe clock\n");
 	}
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
+	ret = qmp_usbc_reset_init(qmp, cfg->reset_list, cfg->num_resets);
 	if (ret)
 		return ret;
 

-- 
2.34.1


