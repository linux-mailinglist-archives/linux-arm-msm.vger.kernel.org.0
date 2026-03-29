Return-Path: <linux-arm-msm+bounces-100633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPxfCyBnyWm4xwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:53:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9293536F3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1C6D30074E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD10386561;
	Sun, 29 Mar 2026 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gW1XlWc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvBFL+g5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D53859FC
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774806789; cv=none; b=jX3DYMKjj5ChKy7+o69zLLugtqQDgVvSY7/ME2W3r9Ed5d0/Y1CzMLTeAQOeiIjYhReLco1PN2yUomQkAqx9WaQVNr6w/A2PXrfiktB0MnrP91Hn9/1vE8tvPOZJWSoLogOMijnziPJzyBSclXdAcA6aU7+SqgFCm5u93kigW7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774806789; c=relaxed/simple;
	bh=lnpOLv2goizWqN8K+7S+ZjRlHlRODzy4yWSzBsXjVYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZEyRfiJgom8IBtugqokdFIEm19zQNJEnMnvKlVk7SOJkmTSdfb+tRYR4LNDP88zG3339HLQT23BscgObH9s3TyY97ICsJPf/CQZ4db7HtkKzmtHH2+CnkhQ7Mfv2quKmlAK6UTRkJqN3UGwB50/3ftmlmsrlKFVcPNr6FCDYxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gW1XlWc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvBFL+g5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62THChxO687166
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5lWkSdl9EQC
	5AYPdogRyZLrkbPdhVyS9NRffxckaYsY=; b=gW1XlWc2y96kpShF/8rMot3srqb
	+N5fxhrOisE1UhChqRinNddsX2iF4yPDjJAA3pEf6RbQlBDgVb5Vgjt8ZzxgKNKM
	lHFu5lPhUYiJBAVd6uwNRBT99ZxLNlD7CuI4yC3Fm4awVV/rFm4pPzBHLjCFq6HC
	KUAfm7Lg/gFHb1pxPD4ElwGb1SO7jsBNHOw0ML782+0CH24bT/xYTA30bgBZ09Yv
	Of3xm2FGsQyWYtFXoRco9cjcLnofz3260orO67pL9h5IaRNUrUmfw1E36t4qqW00
	Tya0/PrcCxBeBMaKJD8AufQ+kes3H0ekmOpHlPDgBBtztd2f+6DeuO5HBgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67713aty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:53:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso130188a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774806787; x=1775411587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lWkSdl9EQC5AYPdogRyZLrkbPdhVyS9NRffxckaYsY=;
        b=OvBFL+g5w8aCtSDYtbzz7d8nh+i1ZU8uEqzkCPw9RX9FS98BGhAf5Oo+Ts0FTwiPhN
         Vpl7PPeGZqQfwaDhg7GNyhoK7AuDXkj9+e/u9WsZhuBgCl2KklWyzd5qe8ZWJmX1wqfy
         nJofMjD+pMWQ3XaGVdlZNRo858IZYoJYF3BypdUHexVVLfgtUWrackJLxebWiNlnp0KV
         L0kGVSaoyWAkYqZ/HzRGUurprodeAApomgQL/s0f86SZbLV+DpApwVCqzQUJEPq+7aJg
         gSONQYOTHGifljuKdcsZxxJG2hgb/DDlb0YpnBJKhgkqdNuix6RxwxODEn7fTZMOprCB
         gjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774806787; x=1775411587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5lWkSdl9EQC5AYPdogRyZLrkbPdhVyS9NRffxckaYsY=;
        b=Ay1+jx5RjsIiIjSlRlRy8BXvkrToKqOD685Y2gQUbVOjnB8uaS2NkXDj12gpVpcngI
         j+c9el+H6cneOXO2UdpOU22W6k5TaMp+h0tMFQr+xYYnvjK3le0p2VqQ96o3hpSoYcVE
         OuACcbLWZFhHwCQ7Fs64dhXsAg6mKnvRJVJmIJlYs3aq5bDWQbnjL2Kt/NY7cKKpOxl3
         DSEzFYkhw991tK91pj8rxAPyf29ZskG1bwV+yo6/3U0+AMQUHrZGPlAE70lWwoy+cey9
         q6u5L5fDQXaXNO+byRbmq0IimBcK2sZkmhoc/oR9rw9RfFz4JpGY+WNxjYh/oOuuy4s7
         F3uA==
X-Gm-Message-State: AOJu0YzMTLo+dvO1TcVBS0Y3zUkZEb113z5gZYWro03M8bCV24Guweat
	TyJsURsiUiltdJV8nvqTjf/pLc3GQ9CnplqY4KcED3JRK6YIiuS8ulZgk1c+7FnrBQy0K06Sja3
	3dha0VXAqVnt9n8O6VNvf8SpnQlWJuGQL81NwyKlqomSv7+6GM0dB3HzvdqF4CPIgHrOV
X-Gm-Gg: ATEYQzwDkVrzHkLROdjs0HgZpDLJLPpq9qg1O72ZhFiStSiqQOiIMKxRxssb9HhK7P4
	y2ZpW+O3OmA13DQZMuTlBnLz6aMyyIGfoOgQzk5Wk1fP4b18uURF3gAQGhZ+HoGvOHmXWV710Ca
	Kf0cBaPSFbySw2J5eF+IXVPhaf65XwgLqUb8XnziioT+fZb7StewQ+ay9wX9IRLmveEiBFUANP4
	EnDMz9N7I/wN5XJ6ZZ/LYhIVFxO171dRZdIrVKXi0UChYolxZYFVVdOwd3ggz4fEZ+O7tVl2QGj
	hBG8XyMm9noKjXU1pMaLEdjTq9lk0bT07uDDnWlxw5G0gkFxonqs+gQW8HVYxDjYLAlf3pG8b9E
	YaTqqCEgaAPHIX0TddQkdJmkTCRDnFRj9QduKV3rlT8fGTt8F+HHSg++N5eo=
X-Received: by 2002:a05:6a20:9143:b0:398:7830:8a40 with SMTP id adf61e73a8af0-39c8794f94dmr11030697637.23.1774806787363;
        Sun, 29 Mar 2026 10:53:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:9143:b0:398:7830:8a40 with SMTP id adf61e73a8af0-39c8794f94dmr11030678637.23.1774806786914;
        Sun, 29 Mar 2026 10:53:06 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e2f3sm4435891a12.18.2026.03.29.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 10:53:06 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
Date: Sun, 29 Mar 2026 23:22:48 +0530
Message-Id: <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F6WufrT98IruXnzx0hDl1slB6nlVCNKh
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69c96704 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FoofZWJxhLOGeeMvmPsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: F6WufrT98IruXnzx0hDl1slB6nlVCNKh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MCBTYWx0ZWRfX/BmNDuq2jtua
 AgTvXNO2v20+ppv89CaFD0zEdZpTJOQ90UO4aVAM3O3GSGW2niyRdbgNB7ROqLxB9HeHxRBvPsj
 GIKmWwyVqusHP5qNBXSFJJamtnxcCwUdhioTdpz2Njm5leN87BaKZAruAGZmqBpz+8+uQikwjKj
 v1utpNtBoXBAEITbKlABm0eyCaJ9QP+Y7qtI3YFGlqW2ebnlm7HVfmGyVmVt9pJRatBToUy0RIS
 IoDr2loxtojGsAFWiANSDYMEGMtqiTCGV6G7krgREdE/Z7kmF/ayDuhHhTyAlOEjEhf6MbfZGo6
 0mcHftIwi2kldIgkQlCVDvmH70/HQkeKekEMDGpcUJnANR/iKi1xFQ/ixHdgSlp50W6G3xVLBG6
 4QxrYizCHOxLhEAxeW6u0EkYt8ysYV2tNMWsvyoPCHcg2+r9H0QvXLpnc7akJa4A6r8ykYHybD9
 X2Cazhw8zoy0J0jOaRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290140
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100633-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A9293536F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Enable USB support on Kaanapali MTP variant. Enable USB controller in
device mode till glink node is added.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index a603f3056d83..38269aebdf03 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -82,6 +82,11 @@ key-volume-up {
 		};
 	};
 
+	pmih0108_e1_eusb2_repeater {
+		vdd18-supply = <&vreg_l15b_1p8>;
+		vdd3-supply = <&vreg_l5b_3p1>;
+	};
+
 	sound {
 		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
 		model = "Kaanapali-MTP";
@@ -1326,3 +1331,25 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l4f_0p8>;
+	vdda12-supply = <&vreg_l1d_1p2>;
+
+	phys = <&pmih0108_e1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l1d_1p2>;
+	vdda-pll-supply = <&vreg_l4f_0p8>;
+
+	status = "okay";
+};
-- 
2.34.1


