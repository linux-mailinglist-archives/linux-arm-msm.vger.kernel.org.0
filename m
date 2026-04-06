Return-Path: <linux-arm-msm+bounces-101989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDJACLPx02lxoQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:47:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 767C63A5E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B0873035AA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 17:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C8335A385;
	Mon,  6 Apr 2026 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhYq8dFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JXRwqrcU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422DA38E106
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 17:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497594; cv=none; b=a7qrK9f02fyATDc6Y3gJdbRtWBsdZdC1w5D/R7KBjxCSNW1zn2n9K6jyPOXHQBPziPWIWj4fMncRpTvuwAYKkG49wuffQjkgOQ0JDwjPuQtOhpuqlzjrX9Lp8CUtNffZlzUt6dQDYegk9C2J0YeAKFSFCnUs/il9eiRGbJyptEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497594; c=relaxed/simple;
	bh=QdOC66XZZCWOHZW7ZQoHnf5/HhV95/1mJuOXa+EXJKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sW7TmoXwGq68dI4BKWnzdj9TbAjKRt7d3kMXrtB1C08au+almxn1zTuN/mXz8yqFyP8Ff6+pQlSgYjDxCThetrCLz3uaFpjQ9M/xTKBnXP1X2dCZXGG3p5/aPYuU2JsN/6/UAxphHaqo53mqO2M26V8x8UuIXJ+sDLALcJPsdHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhYq8dFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXRwqrcU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636FQIdp2766965
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 17:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9YE85mLITHB
	dDGvg5diTEIAkT3ukV6F3SoC7WLZMtT4=; b=IhYq8dFHht80QXwov6NohP+++xP
	Btnomj0CuqSyHkapzdyB95gVvOrTfBoqqsDpooTMUSTSt4BMHJ+tmVFcOZBmAX+s
	XMytEXsdaPj+f5T6iNsIcI/twoNJMkHiQ3SVX7dF3z6CIRxsBzBSULjz7S8ocXGl
	jelct0gj7FEQFLW4ezK3YtwVwUv0q0GQzsXwv7ruYQkiI+dulSb2TwhNpUh9g+x0
	5NGOwhaZoV5qvpAg/WzkE8UaQRhg6qwYfInzW/MqeKrJexMJq9wmdJHyB2BQGLL9
	3f0C5LToUqrx+0+1MqisAfB1gNSsLgRLMy50qrjvfbm2dA07hB6OT625niw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcff58fmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 17:46:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76ad3b732eso6509236a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497592; x=1776102392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YE85mLITHBdDGvg5diTEIAkT3ukV6F3SoC7WLZMtT4=;
        b=JXRwqrcUBfXC9C7/DCYmdhKkM/Uvt/hc9ex9RpV4tRIBn8B/sh3PfA9n2dD1B7Uwge
         49tst3B/lvORHiY4EQfPITSthu1mT4An+w9o27eL613RktYF144fZJNatcYqE3CjWNOx
         zhmS5wfmY0HQPq7U3g2mW1UTmj3Ee6b7h2ssqw97ePr71HutW1VJAUUPlj4S0FHHyRnz
         NIYrE+N4jXw1Wefx3cINKMVV+UPI9p0hbl/yqE6O6fO/SJHXBOZz72gcNKzBlal53k7b
         fQO5eE/r4xE+lBvRFbo9gqaMK0Hb9C1E6lZvvHD0aQCDo62MpXOOqbwXinqghSsJHLsk
         +jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497592; x=1776102392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YE85mLITHBdDGvg5diTEIAkT3ukV6F3SoC7WLZMtT4=;
        b=Zmffck4lu7oOtyhPYOGazxaaGQV0Mj9hrx2HPqNC+8tjD0l8O4i4DI+6oyUhaYqa3D
         Z0MbilOLyG/S7x1m6EaeWBC5Gio+HqkIpZRKCc9oK/PFf9nV7JzHCrf3LMV1NIJXcXNW
         iHus2Z4i2yBbBnXe/Bh7iLSxg7glLom0EuF6NUCrvmeh67hd1FkPOn61/EW+zs9DQVq2
         RdcGPT47vfKtz63XHM0iJjJtbQXChtBk7JSA8qBN2Yyff9FewZeaD5QYx8Mst3r9f4k4
         aQy1ZVQ34Wnea+asXO9KlJq90pYP6w6E8gIPJEAcD3jeJ4aVMbnKfFgTKkIxi4/taN5/
         xMsQ==
X-Gm-Message-State: AOJu0Ywnpb+fycqxKEzDwtJ6Zri4Mr2EQygtA+OE98YlxMlbEu5fb0V8
	fzotxH+Lnp9ZA8CdnltjikHf2b0h47Hi9HptgjDDC7OB4w3skxudcuOsRFdKoS9z+Y8pRqIpbOj
	sZ3g/rw6AgXCpq//25HEcWg37+WGwl/l98oCgtpL4iXtYNtYxg2sb1EFteQpH09q744j2
X-Gm-Gg: AeBDievYtNSt5OOri8+ELe+1MWBLx+2kyfHwQBfaNAwYxZBZrk8iTHyE7vfmKSWf2LO
	je36h16uNS/X9x/iMg/uLrH6ohFWhDV5zaDzBwsf1R3iN8aRVN1edZMDLqDrx7gVuMi0PhJHD2w
	FKnWjK1WWq6zUbVd5AFPcL4pLQUUwAUW8sYKhimcwc+NLiXZ1mB2+f4bc/DtKI3gfWEIMw7SfvR
	mAjQsr9Gi8hrBC04L0QQSnt83+9nkc6tjHrt9Q+MqfEgjibY64fNvips4ghIU1n5hdoGcSo4mtG
	84tK+/XQcRUAIwmtCDjz5rqIYeJbbAV8mwONoQ11dbqr04zQkNq7dRywix6r2tYE90RMrobrlVA
	CBIzjdhyxhOqfsAbWejD+un7Sx9mdO/59jAy/TEOcBvbT7wqzX6kC+ANI7ug=
X-Received: by 2002:a05:6a00:3696:b0:829:86a5:d30a with SMTP id d2e1a72fcca58-82d0da772d5mr13406104b3a.16.1775497591910;
        Mon, 06 Apr 2026 10:46:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3696:b0:829:86a5:d30a with SMTP id d2e1a72fcca58-82d0da772d5mr13406069b3a.16.1775497591351;
        Mon, 06 Apr 2026 10:46:31 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5f1dbsm15227400b3a.27.2026.04.06.10.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:30 -0700 (PDT)
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
Subject: [PATCH v3 2/3] arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
Date: Mon,  6 Apr 2026 23:16:12 +0530
Message-Id: <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfX42+RlvfW9aCP
 Lk73SCuQ5y11RjqkeN43Z1XAzV2vh61p3fwJYhjMgy04wdQDGBnvyw4MS/Mu+p2Tk4KzTebcwGv
 J0A1WfsGowiyOuY0ncYcVlxWVv56QsutII22mGJwoR4/ff7XDh+JYylQELzbSzLym7iJfoa0rC4
 PEMMILBvgz/dtKRf8LGmhBjWHkrJKo7Z40iL7nnde7ajcV7BgEkd9ZmYpPYyAoTkhz6kVpz/vZP
 8dAuQKB0iFMxlTju6f6KEnyu43+RRHY7y+GlZJkNTNBD7ydP5KXqSVLJhYBejCXlbkoO7ZnR/Dd
 D0sEc01gZsHqh8snr+PsJYV8Ap0gkTql/IfKgoLOQIln643RE45GT11OiL/p7hhcSi5y3aAyKZm
 gEDLmx0YuZ8LvlWDqOhcDKf4tBC+DZ2X6/yVhsfmwQsj+0T7bFqIWZ/jRFOcVLiiucon1+XkHny
 5scy7tQcT8PUEo+dlFA==
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=69d3f178 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FoofZWJxhLOGeeMvmPsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: q6NlHdaPChHPR4l4HoHbOFQfQdFzF1XX
X-Proofpoint-ORIG-GUID: q6NlHdaPChHPR4l4HoHbOFQfQdFzF1XX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101989-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 767C63A5E0D
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
index 07247dc98b70..f9b5b5718b90 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -952,6 +952,11 @@ wifi@0 {
 	};
 };
 
+&pmih0108_e1_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
 &pmh0101_flash {
 	status = "okay";
 
@@ -1321,3 +1326,25 @@ &ufs_mem_phy {
 
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


