Return-Path: <linux-arm-msm+bounces-99242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF1vLOE4wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:58:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A55B2F2574
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9671C3053DC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74EA3A9002;
	Mon, 23 Mar 2026 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvQ6jWY6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FODtchwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B13A1A26
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270093; cv=none; b=qbRSUpm1Tyn5bTu8imFKnvCH6RbBd33c8GV4SfXhtHu406JoXVP5e27Grx+aRWZFoiNJemt4uKiC6XUvjkqN1UkybRQ42YNb4fAL5P5dhgUcGN27hPPEdB7YR8IcRoTilS+6ksg8PPqqK4Eu7KZZczqVQG94W3mx5TBWDHqItmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270093; c=relaxed/simple;
	bh=uu+2PjXiWRj4acvW8VZCOTEzlkSvx1D4AuTsVFzuP7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q4MdtfAm41RkVNRpLLupHPZ7go/aZQPCBIvc3DoGdCnCR3q6SNiHQ0ZSVgSN3B3RW0D3L+lrp/2jBAn14/bYAHFwj6YHdystPuB3iHlGJJTq+Wlq+O+C5MlkRqbALzSWtF1DnS8YSJh1NWhC9tOkjRumuMyIW82+jYfmxZBwTos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvQ6jWY6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FODtchwi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ttZn3468181
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NFB8iZan+a9WC+GZEmQHuw
	wOaIi7wgcITcVT5BHpS/M=; b=lvQ6jWY6adzII01ydC5hYAiAFl+N11wPJvV9zD
	MUWO2KmTWrKGSHetT8CwvgqhMD/txtJfciFROW3DWIqnY3jleFnj/xI9ndRNqFbV
	PNwu0MgN2X11Az0zrGPU2m7Nc7IkEsF4oo+z3uWFyikNs8cjW0yXjNg8x9HRPELk
	ycyIWm4U1f89PeJ4ahOUmZRC1u05s9OXEvzeYmmnqtHkmFIgkm/9CboQ93V6Hvx0
	DuCgU1db7UbY1KKDFZolagUGxFLu8K4Ncc1TEJEAlZhOOSYOSSUspz5xMNPk72nn
	wg3sxKEXXfKtmRqDkU/UzUzVmzIdh6Upnf/ct+Q3MAM5SfDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh0k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:48:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so30511511a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270091; x=1774874891; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFB8iZan+a9WC+GZEmQHuwwOaIi7wgcITcVT5BHpS/M=;
        b=FODtchwi3R7mklox5QEpXoxcsnNk0CZxAq0uRLR2XWGUFC4EvwVrH4dgKNvt8l1m07
         nudhawkuXmJeQ/FzrbGAg124HMkhUgtjRmY6kZKP9qyD/gjTiuZPXdVYpRlkTbk2DFCj
         uMv/MSFQUbbYZHN+p+ezPENf1E8SOYBTlphgHAqt6D5IK33pjsoZ4aqBc92Fd4Nuxl6L
         8o8nwrufrl0+ziVyJt2Rr7yX47cCbkOxBeync5xw1KijMZMdQ+Ot9Zgv5X/ime/I9Xoi
         2cwdZ95d2xO77VGe/kGlFFo/Y1ai3FjBUd5QbC9p72yq9RCpchCdqkzw3dVDsk7giXYx
         Pzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270091; x=1774874891;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFB8iZan+a9WC+GZEmQHuwwOaIi7wgcITcVT5BHpS/M=;
        b=EXL4UVAiNO9+bil0k7gkmUN0hpsIivEpDqhiNNBV2p2r7w2/K0PQDIMzLt3heqEKRv
         dAYYeVntGBEeUxbMc4Tkb8Kxijc75BT0mD322cZ9mBBiEEnq7NfhdSy0DjUL/mQigBJe
         uOZsBvN6JQIcdqaLe1qIJkKNsaxSF6LNhl+2796FfLxzBMWv6pTNRx/jMaKhtVJaHpNy
         On5cj59n71Pe1B7D6Zl//mJxKVd6CI4fMLPVmERMCuyKhQWLfeKLPsY1/dZ59WKrqXFD
         3qvui9adDpvMz+xjrzi7+17t49/jQcNgCPKWteXFY0usF5+DILxKXLAq9XImhFQE73F7
         z1OA==
X-Gm-Message-State: AOJu0YxoOzbK82UjQSWcyUxG3RKFx7ZVJbiqyi7SKlYOtnfRmiIeT6Fb
	vOwP82VctuPb4N5H9jXxLfUCsipwZ3zCdnxziiEEjG9TMoZDV7Ss51y0JtmgKChNcFDiThEh3AY
	oGmKae7JAS2lddwtIehq1xE4XWa7NfjLMyhjwRfl7Jy1hb8BEsTJueNI/ca/29QlQDIu7
X-Gm-Gg: ATEYQzwBWhAQUZ5CyXRQtOnlgWoWnzq6dV18AW0/IWPQwtr57W7/nHM+bZe0ESpWI8i
	x3Gx2EglK+EMy+ffntEfPZSLCQ5EbAQAq2+80Sdt4BGJLRCSGIvn4MEYR54rV44/fw6vErRVnE8
	6diMu9OdeyFL6zZsbSU7waU0AFDbySK0vh7r2N5lhWprLygXpAHH79Qbm5g3KAkGBYnKXRnpKd1
	NEytHpcWUMHvHyAjy/mJvwVEFekfi+Ugqupj4NX+FyTRM9iOpGiIhk4EX4oYZL00QRBqNG0Suy7
	cN7Dj/pCWul54l4HdEKH7CeHHC1qi5E4v3f49J3alDQToOO9691V4G7mVK9WxbqzVe+KcEv5ZXo
	SdvN4xGixOeTnTMWKXT6wak9r8r8gOMRT0iaF/UvzKM2YAfI=
X-Received: by 2002:a17:90b:1848:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35bd2bdbe0amr10163560a91.4.1774270091068;
        Mon, 23 Mar 2026 05:48:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1848:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35bd2bdbe0amr10163552a91.4.1774270090507;
        Mon, 23 Mar 2026 05:48:10 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd33919a0sm5372209a91.2.2026.03.23.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:48:10 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 18:17:53 +0530
Subject: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Enable UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-purwa-ufs-v2-1-58fb2c168786@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHg2wWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNj3YLSovJE3dK0Yl1Dk7RE05S05BRjsxQloPqCotS0zAqwWdGxtbU
 A0ReI4FsAAAA=
X-Change-ID: 20260323-purwa-ufs-14fa5dfcd36d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: XHNzS6fs6sX3xIiwbtC7sGtFQcqgIzaI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OSBTYWx0ZWRfX76/o1I/qSnDd
 jP+TOjr6yUcN+tGmuBWEToVuv5dvsjF0k2ucK7ykwiO9ICBMc3DioE/I9w1/Sg+/mDTogywrW0f
 6GRXC/dO4pa3kNwnJquY3D2bm7YCl4r74Cgo6zhbbQv2GzokcBFi9OJ8irqOVRnbJeuXIOChC1j
 416X+LTyff+LTK/Tv7F8JyIy2gkPz3Hw+zGgJSfFBkXAPzHMGUe2DHo51U8n0zo7mcQoNQCwdMJ
 VNFZ/LCz5I4ruwMnt9I9qnYeKLK3zJLjzmG4LIYhBLwZctobGrC1p91xhHDxvWovrjwZZlXdKq9
 6fM4JIel0I11GLWop9WUiiZQATVpkbDTuTZOtV1Fn5Drmr0hRD4pmCVpKBb4b9jxo+SerpTgpAH
 3rMh5neZO9WymSCKZh/UL3Psf+mB0fDxrbdV94TViJXOOfwv02e1JM8E7Cizn/hBMy/zywubo5h
 +l5OeOw5CJ/9JSaPdVA==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1368b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hvrb7UO-hx07SeRrPXQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: XHNzS6fs6sX3xIiwbtC7sGtFQcqgIzaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-99242-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradeep.pragallapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A55B2F2574
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable UFS for purwa-iot-evk board.

This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
nodes for x1e80100 SoC
https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
Changes in v2:
- Sorted the nodes alphabetically [Mani]
- Dropped cover letter for single patch series [Dmitry]
- Link to v1:
  https://lore.kernel.org/all/20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index fe539b1f4567..f26f8b648738 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1497,6 +1497,24 @@ &uart21 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
 &usb_1_ss0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 };

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260323-purwa-ufs-14fa5dfcd36d

Best regards,
-- 
Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>


