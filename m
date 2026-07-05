Return-Path: <linux-arm-msm+bounces-116559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QayUC+uRSmoIEwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:18:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ADF70AA86
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:18:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FaQbAmtT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cph6gcVG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116559-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116559-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C72D2301C933
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 17:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8795D2F9C37;
	Sun,  5 Jul 2026 17:18:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DD2E06EF
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 17:18:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783271907; cv=none; b=P283txmnPE35zRCyZOEme5w2AJBF8p9Sw6rOymVX2TAd0GmCMW5vVDl0SsEoXKWOZz7sTVsshD/6/A09LQ9CI4rFjadYAGgOlowmYf8GNGB7GXEz1KABBFQbvAnb5HqvzRlxDw/Jk5q+zhLIP2b/xcKTKoNKj+0j7nwxMrR+IJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783271907; c=relaxed/simple;
	bh=kFYFh1TZZqq+jl/FRgppUJ4NXR1JgwqJucPvJ7ozvyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rzCT+sEKM7L/7DzaZWxT5meH4IkQtarMRmjg5jYzconuOblDvsInn0epmsZE/8Uc/qJaPX0H+9n04vVUDE7Wyipc9HbDIQG2kVqVdF5HUJKiIsb91cS31MrYqi0mmNmQra0VDbSodsKm9P/uur/SgbeswQieT29fV/EuDjxcSgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaQbAmtT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cph6gcVG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664LGAjl4046679
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 17:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=E88X4m6sJnIpEBcCejQrRx/RK4SKCLW74DK
	R59LzRlw=; b=FaQbAmtTp8gZrF1uvNHFQq0cD/seFbep6Zy4QNi9GZM8x1KKsZ1
	Y94eigPS1+VTaYDAr2fLPKoN3XZ5n5oUu7uYNjS0VU+boEw7DnQ7EhemHUjcxVw/
	Y7ZQDfMWjfqn59t/T/Z6RUcrfElDUCdW9L+rlT73VrrY/gREHkqQ5TK3NX3yweOB
	DqWM3byM5PHmL15LMQGGe7TZDEeR8WVsZjx9arjfwmgb2kmADVGTY1BIS2raSMnt
	mTGSW4UkwHyqeJiZtiNi4quSMOhz2D+UPJJNEcJMtFjzPMNjjuT34Z6IUFqtbSZL
	7HD4vS70EG2rrF11Baj78IMz7FGxF+NGvJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh35mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 17:18:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e66f9e2baso218574485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783271904; x=1783876704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E88X4m6sJnIpEBcCejQrRx/RK4SKCLW74DKR59LzRlw=;
        b=Cph6gcVGf7Wqj6TthGIHE/gOVJfYVxeIwyWeYNjWo4FjYoq1u12zdFpMzFCbtggir6
         tu66umUxCZUALAjgS4n8S30rkTsP2MGTxvkX3MEQnThixZwwPss3gkoJu3Qk5f4ZOjsa
         q0+xUF/vm5+wtQfbmxhB0efUTrWqdDEQx0Chz8N2cGsuvH+OyV9XMtjsBH7nJQPM5krn
         R3+HZyFImkT9urm1W8gWfrkYDvFD9WubyHNDwU4kqiBO/EtXO7G8TXF0Z67aTcUldElg
         MHfW+JQ56pEmOvU+RPbNdMzaP7KvxvaH8RyTxxyP+GrVN9Ewncd1N6nKFjoPEZos2SHx
         TatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783271904; x=1783876704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E88X4m6sJnIpEBcCejQrRx/RK4SKCLW74DKR59LzRlw=;
        b=gU+FGYRuqPepnOR2WbRAqDQFacGAERDm2z2dsPsexTg6W1iEfLX2y9aJBQY15SA1Uh
         CflylxDZeOW4hxL8IIPur9egriwhWA9+tYz6BfZMO4+6pZtd6GVV5hoffpG6GFAnadVh
         eOg/XDzuphi5xum0KUsulubhLSufFVb/N3pgL9Qw/rO1Mg/F88uMk1A3dkvbdXlF0eLe
         aBzDsPcKL1iFGu8kNdW6/5eIP+QkPhiqy6G6/nSJ/avexwceJp4dUFTBXfECBbxUE6/N
         37/lpsskARqfdDGK9eRvPwr736ymbZd6+KR6vyRhWN5etSTIQF2h1lYFwSPI23oEmczX
         9lVA==
X-Forwarded-Encrypted: i=1; AHgh+RoYIxjX73bO8bQ+mAqvJQfVbiiiPREn1iF5jZVFKE/oCe4qOcGtsIBye6TWPrMMDbInoa6pZ2EK9ZZH3Iq0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4eJAhQTeOuW/rscn/juO4u2Ppf4tI+qAScEFKf4wsWTUodojR
	tnqSDpWypHsVlGRVguh82RLwa+yhYnVE+BwZ3omrrn4ZiNwiKLDlfNnXAydatqYPMQj+4603g1d
	FhHFtIbjUq5elFUCatjk3anactCEELrIQh6hot5JhwDwci/rko3MVLn7+k45s3chQDFh4
X-Gm-Gg: AfdE7cm+LJMOk1EuLs1mOX6e92u9Fi8b1CMQSHb4AzvjtTtBF7arFVx/2xQ1o73Dvp/
	qP5e0VELROgMIg25L9Og9F7tDDOlMakxkQ1lWLQf2OwDRxycauxF4AI6jCLvBVFcgYk0BlRZ41R
	FBqAKmDyy/rdUP5QCH6cjK1OipaN00gx6SCzzwHNhLl4PB0BIyO03/kTaZEww7oCad6SJPO7bSg
	me3sSQLIB2GHyNoEskY2ZNgVUWFaeV46Hn9VHiucTggqhLyM/Sw3s7fB4UkKo5Wlf9J+dOEHr+d
	ST++bA8HeM1l9HcG3JikorCLIOFh7HOD6Z6eb7xrES+xqAXKl5m0EezokUZqo7NwSqnyIrMnEZ8
	+rg+bTGPvLOI1s5NZiED7s5Cj8RA=
X-Received: by 2002:a05:620a:8399:b0:92e:74f6:ddd6 with SMTP id af79cd13be357-92e9a3af10cmr1057752685a.25.1783271903321;
        Sun, 05 Jul 2026 10:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:92e:74f6:ddd6 with SMTP id af79cd13be357-92e9a3af10cmr1057733785a.25.1783271900454;
        Sun, 05 Jul 2026 10:18:20 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdabda3sm220513485e9.5.2026.07.05.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:18:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] clk: qcom: camcc-x1p42100: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Sun,  5 Jul 2026 19:18:12 +0200
Message-ID: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kFYFh1TZZqq+jl/FRgppUJ4NXR1JgwqJucPvJ7ozvyE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpHTPvumdT4GJ+Ie0LS25k1VA52Sq5RRpyVN/
 Ripk43GDk6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqR0wAKCRDBN2bmhouD
 175ND/97YcLGnW3ImtwKSPB5Ne+SX8hbGw5VuOBEwvSCe4fDCUT0IM0epQob7WXSgAA1JQGtWjR
 NPzFfoqqHsoT+mXJG4qy3f1wmUTGP5rDMEutCl/xkxsXu6QSwz8/vxgmMET1mBuG8x32RXn5Jzm
 YkDuc/ibfwLnZEp3Nb/cVAg4c6yCKCt6orCltXugZ+z/ajQq6wOAx+XPBcRp3B3DqvpH8TTy3br
 PXc9KuPY8fNsXzM70ZiYhn1l8GF0Dke0G+1zwYYvV9GPpNtwg+olN0jRqq+v+EJvWoWRZYcr7d8
 W+6ygyS7UE7Wee3fixw8ZPeFdp2oEAl3rSgEDJVP4xVXOjvihpDmhYVkKu+H1h0eF6oIIV0qHVo
 /GCSj7RIDlGdwRCBaezjkSiCzUG4KI2gMbGo1UtpIy9U1X8qwCber/HuPq4xtLNdw3HEaiJs+dF
 3bOgRNuUr6GZI2HLLu3hi4m3QZWK9FGH38rwqx4Lik7Zl1J6gjemNAYt0MrSEvfl1nJk7fD8Ws/
 121RuEMAcodOx/yWIsKolpRIctlyTSwSNFccfQJ1if++EuUdBzMdcTfukg90WVJNsMQNswC8Iyc
 YDCwHSpGhfM+gbtybi/YTJLmEhpfnkqKxturHwX5HSx9zTpzCivDgkzOsPRkky+4GaUpyurr6kq EBLY3RcXvE/3kGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4a91e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4Nzj8Hz7_X1f4_I9MkgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfX2ElLL4DlKEcG
 y+LpW4m5zFIjeo7Bvac29/r1oGS0Fa1T84d0JBM6aMzmn3ZfZXUeeiuWTsurvhxp1xWY78HJDDN
 9vC19D909KgRmzlB6O29CuDoem2zlNpxJCRZlzfimCF74nhl6pEEufT+HUFgZT8chnHlAYArI6t
 3J1kH7NzEBwHXHUIjio+azzqNsSaACl7ZYtpt7T5TB0O6YPFv7hefVNwOlRtD4zei6Z0NitNOF0
 OT51A/PTNq/D/YeV0D3+oFr7z9PEmOK4pwGIynX1naSv0TrpyoqOrnFDNRucXLt9epuGYo36dPJ
 IaJSSK5MkhwEq4ls4oU3PuYSptU5FilM7mp4b+Uggp/GWd7NTzL8GLX6QmT+Lg3TQaI6PldhBC1
 S+uA/G/byP3IOPI6Xs8hzm7M/QI0cxO2SDFVg7wNVz/aiUcoDO7GnZjlWSR55dCBnHrfgD3fbmC
 nJ2zIY1CIFRtI4gFyPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfX3Y4KJCkZ+Uqe
 mwl7jQmfJsCj4oHb3sQUH28ne5bPV4y9eUxRPFVc19cinvIa/4l70NXK2dOK1UpI/HcMdIH77YF
 6xmbnQK5+1+wDdx5wLhn9WwFiDo2ZFs=
X-Proofpoint-ORIG-GUID: skinIo731hRDA5ge-7eiqUIRTDTuHktG
X-Proofpoint-GUID: skinIo731hRDA5ge-7eiqUIRTDTuHktG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116559-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87ADF70AA86

The static 'struct qcom_cc_desc', 'struct qcom_cc_driver_data' and
array 'xxx_critical_cbcrs' are already treated by common.c code as
pointers to const, so constify few remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-x1p42100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-x1p42100.c b/drivers/clk/qcom/camcc-x1p42100.c
index cfe24bde4652..e2b8f7bd8974 100644
--- a/drivers/clk/qcom/camcc-x1p42100.c
+++ b/drivers/clk/qcom/camcc-x1p42100.c
@@ -2165,7 +2165,7 @@ static struct clk_alpha_pll *cam_cc_x1p42100_plls[] = {
 	&cam_cc_pll6,
 };
 
-static u32 cam_cc_x1p42100_critical_cbcrs[] = {
+static const u32 cam_cc_x1p42100_critical_cbcrs[] = {
 	0x13a9c, /* CAM_CC_GDSC_CLK */
 	0x13ab8, /* CAM_CC_SLEEP_CLK */
 };
@@ -2178,14 +2178,14 @@ static const struct regmap_config cam_cc_x1p42100_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_x1p42100_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_x1p42100_driver_data = {
 	.alpha_plls = cam_cc_x1p42100_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_x1p42100_plls),
 	.clk_cbcrs = cam_cc_x1p42100_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_x1p42100_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_cc_x1p42100_desc = {
+static const struct qcom_cc_desc cam_cc_x1p42100_desc = {
 	.config = &cam_cc_x1p42100_regmap_config,
 	.clks = cam_cc_x1p42100_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_x1p42100_clocks),
-- 
2.53.0


