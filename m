Return-Path: <linux-arm-msm+bounces-99076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGygAvmUwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:18:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6752EB685
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1019302C5FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F20D1B424F;
	Mon, 23 Mar 2026 01:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBOolYz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtoB8wZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6929D1FBEA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228657; cv=none; b=hGlCrwwkRdxiM7bv5+XcM2dHvX3yfd7kTR+aaWAh/D7nz0PHeznTe/MjEiW/vbicYuzpkJ2frNOV7Jx5dCW7eWBqJaaX3dS4WLw81/eVLslk3XH1LMOPnulssTNGP55v1+JkbzSsUycmtfqln0KbGDtCGIN2Mem3/TtnD7OnOIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228657; c=relaxed/simple;
	bh=yWGYHMvMuQOoFgMW09hmb437wfgDJSFA0so4gDay7xI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmS+5cwezPsODg9EOiuqe3J/DCFDHIMXASKj/0pj4OTId841wCDeOuvNCkE4RdN02N0UTC74yTvHAOgabqcRLFggUs+JBEnk2sgUD5U3cahFHk02RHdx9001vm6l0o292Xpb+eY3iLYP1PazeWDqVnSfR2YoqXJHUE3SAtr4zW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBOolYz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtoB8wZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ML1pf7900480
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WgxylbfbI/Yb32tDq9tOK0ZiL/pL/XntVxHahWXIwAc=; b=oBOolYz6Qe+yNlRV
	PVSfJsLTCfMWMlyGD6f4WmOZqEMIsejqC6/xFHcQc3lPWUgiimaGgPYhS41wJWg5
	WlFIOOfmhqhR4Z24vGhGPAYmwNiEGiqeaL8AkdXE/3+fHwIeQqYYnrVm+S4ESC3c
	Aw/hLjeCOSbLmO1ErKFSrzA5cqoBo9VBvkkkei4Pm9PghzBXCnuxg8PPI2YBiBDH
	3UNoFmM2pxvP0Bzm3+SprYs2VVzZ/w+MBkVNJVJJZoEM7Wu6CC5ySY3U2jFO77O7
	VM1K8sp32Uu60mQCVUe2VNXZXizVUsXyl2eIwaBQuVo5O0GL91eKvZhipc6l5BVd
	mkmvbg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rb9ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50937cf66b5so35431321cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228655; x=1774833455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgxylbfbI/Yb32tDq9tOK0ZiL/pL/XntVxHahWXIwAc=;
        b=BtoB8wZE6t9elWH7anzwURBvMEc161cJ+wx9W91tEWVfH2Lr361YyriHZpLsowguru
         3b7fVzJxP5QEOCXtQK+rBYgrvyMNIoWSOBFUoR9qKp1bC6P4m6ri0RDrKFeMAI2FtCMG
         jieY3OoVnhJhdJE/ba1EJzh7qwewDXXqZI5RKEQmSfRa+ERIoEmjrCkxWZa8dnqoCF7F
         OV4kRil/AoMAktwmBIcVEEW7e5AbZqT1v43tOhVsC1Dsg2R/7WfQjWB25rSiTBhLIeo/
         99RYIHDgsZ13Y2Qgy18QzI15VK/aBcWhCtsD6mXVc0voKY++6T8jm2/FiJ+G/k2HYsyt
         hDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228655; x=1774833455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgxylbfbI/Yb32tDq9tOK0ZiL/pL/XntVxHahWXIwAc=;
        b=rdUhoO8nVRa3tyyz1pBVEZOhcGYPOTzO9re8mlehRIaGCVohwAeN8/KUcID4LymKst
         vmrl0Q+mZEOCOY0AjKKGEe2ru5Uyn4TwV3OKWkCHx0IygXWbUhZTA0H9lIMU72ZRU9hN
         11SldKvWnihZyS01m8Yd6AQTbfnQEEIDtA/kOZ2op4QenlkTMw1SGorzKU79Zj28zwup
         /53t3MbOihNR4PlsZWLRD8ss4qpPJSUgbSjwhmlF/S29roWGnoUl2oUeYkI6NMli8XXL
         2RQqxamksvUl8N+GPvgc4EutQzQBrP43xwabmHbIYw9w/Zd3PtJreapAf5jyhsX7eww4
         +E4Q==
X-Gm-Message-State: AOJu0YwMBIJhzInjKFZT60Vzf0FTmj3rlJboZLbCx/azZ8CZFfb8dXSZ
	wvwCMy1EgSL8yIyQUlzKIv6srIDcNtu1fk4GSdlQmDBstok55DYQUyyUvjO7K+yAh9+kHZS8CLx
	2BVwN2NT3yXkKJgFAMn4Sm7bpPvNd2IV8mUouM9YbKp/dAXtwrUTTay+G4sc8X8ITNME9
X-Gm-Gg: ATEYQzzkN7DkGXi6A0IplPqprNAEnO3UNkh2DYwU/MDEXYs+BaV/rtSMcocqJtwekKw
	BS/KPMVcckW0Ti94LqYE2U204sWTmrZMj7kIe2rf2iL4HDDEy6tJeF5OBdbG0HISA69sgDgQk5m
	dQ7Kr6CibcQWb9BniPRYcAuYtLNBd3D1x28CDXmQXxW1pnqnPxQfC2aazZffxdmhgytegaRYUaK
	cadgvHNUYvuqw6PGiKFGaywDPqC1/z76Ff7Ulu4P2IUjmq4zhuIAQ2Ws72iFSU3vhZxc+IiwIR6
	WP5+7j+aKE0GGcwOIhpn4BCTXYiJzYLYXee+dd1fYXKDdLBZTfRI3EF6cwQwYeSnFk7cWIlQ7Lz
	doGyq3Z7PySKKXC9rRYx4U08fldAednbZwvRm2FYUEd//hnNzZDifZySmmI5D4UiDIUV7TNgsTX
	v/p8QPR5TdsOZaeh8bkE7rqRGqJOoxmJ8LkoQ=
X-Received: by 2002:a05:622a:608a:b0:509:1216:73a3 with SMTP id d75a77b69052e-50b3753b8camr154613411cf.58.1774228654922;
        Sun, 22 Mar 2026 18:17:34 -0700 (PDT)
X-Received: by 2002:a05:622a:608a:b0:509:1216:73a3 with SMTP id d75a77b69052e-50b3753b8camr154613101cf.58.1774228654496;
        Sun, 22 Mar 2026 18:17:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:19 +0200
Subject: [PATCH 3/9] interconnect: qcom: drop unused is_on flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-3-7892b8d5f2ea@oss.qualcomm.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yWGYHMvMuQOoFgMW09hmb437wfgDJSFA0so4gDay7xI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSe7ieNQ1Heh0uoGPsKz8u8QLjSJKZv36LgM
 JKb9O09Y9eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUngAKCRCLPIo+Aiko
 1d0CB/sEpaROlU7i52HdRAVxnsGIApTDzfrurpIz5L9a8/Hk6PmbI0VsThejviemkXjNLMRVPw5
 ya6ionImhYUuB8qKTh0mdPSCnbwfz0zk+gRjIUV8hgc5XregqzgRRwiC9wF4qYXPn4VtX4m/6HW
 DUUK8CjHm0HPkoOENOswgWRWDtepae2bN3Rr14Kox4+lr/CoCTYKl11pRLZWp+MXUVlHQWxsj3t
 zaei5Bx5FzYW+dIHP8bLPBNUj6vfDlgSXhfj3Rs31qUNz5HbctWJoCsDxO56EfesMRVrspNPQgG
 D0nTm53zOEZ4hFxu7XdlVYrjnV1rEBZ+xPuvya1FwMG38VF1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 22wphj2RB7pPIgFxdEizKPeRaaoRSvSZ
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c094af cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=snkofG2PpA7MSmzZjVYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfXyvvwXGW5hJ52
 ORK+v3UZ5NEgsnk1NlQp4WIxZvIb6m8EMrdVIKfsojOMGiugcRMhubpeTNYcgq22wb6h0is/+Xh
 /yaSAncXJwB4Rj1GHu7+bhOvOxsUD0enAO3d/R3CQsj3SD3y6CNFESgFfL8QYtedGMJHOA5YmVc
 ioMpnW+oBBdFQJU24+BGxxJUQWIAd3AM9Tc3dAcEgQsNZzP+8ES/b9y+Jh7eww+hhGxN5Ke7nSG
 ozAkj54Oep3OsmmHulyA0998jxPoAzdhr3GA/m7Orkp61G9PSAEeQEuRQJkf+ETeu77Ei4xBbFW
 pJBp7V/e8xpYTIMSF1sdh2d+kMLofHdstKkEAqR/CDwUiHGCtFIY8Pj2gtghltnbW2sPu5ZBlcQ
 o48FtL8FGvDvS+PGDnn9qF09uq9DC0tizAb9B6254bcEMsVMaNmEJBWp8tnKA/O7EUn/E/I/OQn
 xJIQgEBnYIIhWd8Rbog==
X-Proofpoint-GUID: 22wphj2RB7pPIgFxdEizKPeRaaoRSvSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99076-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F6752EB685
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The commit 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface
clocks") has added the is_on flag to the qcom_icc_provider, but failed
to actually utilize it. Drop the flag.

Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index f4883d43eae4..3366531f66fc 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -51,7 +51,6 @@ struct rpm_clk_resource {
  * @bus_clk: a pointer to a HLOS-owned bus clock
  * @intf_clks: a clk_bulk_data array of interface clocks
  * @keep_alive: whether to always keep a minimum vote on the bus clocks
- * @is_on: whether the bus is powered on
  */
 struct qcom_icc_provider {
 	struct icc_provider provider;
@@ -66,7 +65,6 @@ struct qcom_icc_provider {
 	struct clk *bus_clk;
 	struct clk_bulk_data *intf_clks;
 	bool keep_alive;
-	bool is_on;
 };
 
 /**

-- 
2.47.3


