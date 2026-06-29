Return-Path: <linux-arm-msm+bounces-114983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X6rfM9VLQmoi4QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:41:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD166D9009
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:41:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=drs+7ALu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H6IoSq0b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114983-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114983-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD10A301FFEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC543BAD9D;
	Mon, 29 Jun 2026 10:40:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891333BB128
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:40:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729644; cv=none; b=dlzrnqbnIvSe9RAn3xKq1sF+Mn3s7gefqYnp/RUZ7QyQuxOczvmGC8SMQFFIHet08ftrPBkDqsqcYDSes/pdzhAPc5QaIuGLuljUZD3Dlfw/QUzZcFD5F+X3s52HaRAGnuD7k9S2iSiO2BdWiHc1zYlirOGhS6yUkwUakHthRlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729644; c=relaxed/simple;
	bh=v7GJK9TIu9yr3dF5vF4jQAR563uwmKoRa3pjANQ2RmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0uoSP3bljvNhBCMtam3oU5Aux+d2z8dz79+23ig8tvG1b/Ou43QWHD8zRsSHYFfK+tW8FR5dshvs69SFRPWb8THgnOpPccTcci47JM39XD4BhKxFSF8bkLW0g+4lDZCOv/wyTZx3vag2DEEr3o6aqQ8TVbt+mdlpXtF7p3+3Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drs+7ALu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6IoSq0b; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3w42601595
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V3hiSM8FxtWrf5QqJf/JCZffCi9CGJEKZUikvpPr/UQ=; b=drs+7ALueo4Ha5Jd
	Lsg5ifXC2AsOb648GprmTlVmQXsWJ99Ov5Cl1Ta7xk2/UDuRtsCMSxM0LgaZBHF5
	qllt9wMKsdlXIbRKY2GnDjgL/l81M/b1nQ/gFcr0FZqYbCm9Z0Zbi/5HSYt6bzU3
	vbSCMKzXn3FDpUxZxwz/2FxX5HTMND05h8NW9Xcm6hXRWoQVUoCc/2JhI4xMVg6d
	viJHvMSUh8dWnSXWis3oVFtbzcYo+4qBqDej9KGtoxXlBC5gnQ9MSheQR5oZRoP5
	SqyZjEgzHJlc/BR5LuRTGnEd69PNqfCNd60LiZk/fbBJiXC6MVZmwtV669fLTo5p
	PvvMPg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8det-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:40:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3691502eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729642; x=1783334442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3hiSM8FxtWrf5QqJf/JCZffCi9CGJEKZUikvpPr/UQ=;
        b=H6IoSq0bsTZjIAfAinpWThzJGVfG8mwPJ0cyP+T8rqaGIFrDozG3zCUJ5I6Mbh8v7U
         ugNMkQ2M6Cx7s0qYSXTqApoVGge7Ao1j8gQyPMPdcEokEHJeOHNnnlDbXOxkhmDpBeOz
         /P/znO0GdfppDr25r68XSRV5r/hLd92Wcj8zQgNsAHjorikv5Sboo5PFDJh6uAxWeN+R
         /NzZYoV9NRTshk1HWkf+ON2LHYVccgce33hRlS6KvwQXIXjsDAebOYo+bdpUken4f4uQ
         xy6ayXD95BVB8oZH7kSLuGR/QZ15/RpNh+G+M+eCtUOVkvfTJKGSBqtTAJCwHphAjEbk
         0fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729642; x=1783334442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V3hiSM8FxtWrf5QqJf/JCZffCi9CGJEKZUikvpPr/UQ=;
        b=XlkmWjVLtC1WWQL4i/KIZQr4JBuiFh4cf4PR91eVdmHPpJ5gtTVmcWdZGOSVrzgnOn
         p+yFvDO8sQO0z5FvNfDAxWR7vlut6AygwetIG+t3N/mTNnYXYTu7DJI4TYNGBPdiG8OU
         lTHfYmNZoBB7JgNcW0rF+j4eDfrPXhlqHcbL0Y5I14CY1vZ82KQr49Blss45SHaV1Wrs
         O51SYTGbWyTQvPJa+58w/+Bo652xVyq4vaB7DuKS6dFnjrYoQbi3BEhh27ywUV0ZJKd2
         SbjwKZDLmiI55spRdg2qKjOmj8fqggYHa9wfc9GsEJ9dYuokmRNGYOozN/Qe0WzghOYl
         5Zpg==
X-Gm-Message-State: AOJu0YwcaGvaKHMdsMjdnH0E2xy2mZrLsQkGrWGJTdp1SPhF9eMsWiTv
	tZ7jmuoOVywybeZuxHMmaaYsWkxGEPNlgGeCoU8Uu6kW2X91hFDLMSkCUSK5CZpD8kpAp2YZ6SZ
	mDqtzt0C+Yt8Fp7Dz7WTzi6B5rfbOuD05gZpbwM8qnEe7qqh3v+p3/noGtZZ00SWAZs+7
X-Gm-Gg: AfdE7cmub84CeHd5bcUOMthcvowkuCzfaxcspE1CjstkpAeF50hpzsIKLbc3hB9Z3Ni
	eyqrmseRAJIgGLkDEJkQUCMrAbp+dbiQB+6OM8LSq1M0oVsusUJzlZx/KtjBm4wCIUa95hdQXh4
	kY61ctBxnY9Td87h7jWFQw5h0f0QNYEQQ00wn6EmByV6xyHYklWUWDjLxx599lu5Q2fy6oskw1r
	RiZOom1gEG0K05NnqP/RM2lysFM4TDaGLl007qOlyYVcXVFQpiwUKRVCYOeNMy0EUfgRAjtTwHZ
	GGMC+GpZ/1FUZHYacp7BEXxpm0AsJOtsqzz3YL1rWdfGRptrMRcoUTtiWpobVJ+oOQ11rz4JXa4
	b2G8TtttXh4/cPkcvQ6ds4QcmgW+Mx0ef0Qzq7opiHuBL+Deu7pl5VIaFEdDuTJhSJn0nMqZlLU
	nq5Et8Jy5epH8PHCb7JAHvy7E=
X-Received: by 2002:a05:7023:b0c:b0:138:14dd:16ba with SMTP id a92af1059eb24-13b22714f85mr110559c88.38.1782729642286;
        Mon, 29 Jun 2026 03:40:42 -0700 (PDT)
X-Received: by 2002:a05:7023:b0c:b0:138:14dd:16ba with SMTP id a92af1059eb24-13b22714f85mr110539c88.38.1782729641785;
        Mon, 29 Jun 2026 03:40:41 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm25413085c88.10.2026.06.29.03.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:40:41 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:10:18 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782729630; l=1264;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v7GJK9TIu9yr3dF5vF4jQAR563uwmKoRa3pjANQ2RmU=;
 b=JePb+JTSZVweQe4J3f9mxF9F1NTcoU1qKfY8gYtpf5DPNRhk3X+D6lEdfrIyJbf9cQTTXdg9n
 x4M7MrneXkOCnaqtWlkuaDAY21IgUBRk619eVBCApUQ65JYEG+TySqJ
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX8aLhE2cafMZ+
 GourM/C+tKB1U/TVHONRzukUasmkC7dkuXKA45IL/e/WVIX/6cAb7c3cYaOUhqlhhr1icWOjY2E
 tr/zksQfxe+7y+KJ5YxH0SN0cnJHFK8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX6yfA5XoRSj29
 vFfbbV330fdfjfidlxSDbALEXXzlyF8G3pUvkJ0oiird/CS6C09Chdonxtf83BuckjUBf+h5Oqw
 tIWvO17h0rc0kACVLC8+rp85LQUoIwZFIbu7+UM5hXAowyv37lO0zGuC/O+Y892hItht0P4v3tb
 ja8OXjTkbSxM0kiAcw2qqX+tOIlAEeq915hsMEH6sLvOzF3hiubD5SGFbuF/S9mFMuJU1r3FgDG
 zz7CK4qGteAzHEd/nQy+Crg2KlX8O3bMOW0g1umuHg/i2sSvNRLQ9krlqcSm1hS+oBINfv0iWwK
 fnCNUhGnWDgtVL7iClqmtGeVQwHKR6vnGliAbHJL4O/VhChqh+Urr7ORSHJzbu4OnPZlmZLP+c2
 TBcSgbNPoEpAM0qLLiZBj1vm679CzlullvpiXXtGHVFI1cpnlGCXnk8ag9KKtDo1PQpusfPucXL
 3PVEAKF7Cma3OUauILw==
X-Proofpoint-GUID: C5TsBJDHQzSkFUgPtbqIS4CHPLR6Ox3G
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a424baa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: C5TsBJDHQzSkFUgPtbqIS4CHPLR6Ox3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114983-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CD166D9009

Add embedded controller node for Purwa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..491ea7769cd7 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -837,6 +837,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,purwa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1326,6 +1336,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


