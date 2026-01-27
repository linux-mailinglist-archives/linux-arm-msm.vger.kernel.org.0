Return-Path: <linux-arm-msm+bounces-90669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLvgEtx4eGmdqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4949121C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AB5E305BBC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738742C158D;
	Tue, 27 Jan 2026 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQ1H41g6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzAQOd8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408FB2BD5AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769502861; cv=none; b=lI0Gge1VGRQ49BQ36FiDHXd77cZkJR45Vu7ljnVma/TDvQP0oCkvMNOGmNgIgMtDEgV+yGz01jgHocoWqG2OYE71ii8jHsSCpp4euO1hXekmfsLttBcr9j7aZAXooGyVPbjNjDioyZI8pciBGUwqbWLIY6SOCFKaWw/ERDQ0tOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769502861; c=relaxed/simple;
	bh=/ZMmm8z/CzK9Ydn1qk72zGpHkz9/CApKnE2xT9rSk5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bru949xn1tWAUcbMD2m2qdn1zVbd1Ef3j+X1AQd/dXOWJVx8vOCyrtZNrs9xghs97O524BUPrhL1rOIco/K5cX70dzt2L2Afv3TKW1r8khhbIdeeKdbZ5V0BogF3u+1jgmATd2DyCK7z9QBzyckMaJthGXYwEPsFKDpgWHS8bBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQ1H41g6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzAQOd8V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86nbX620693
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6T+0bGfJO+QEwo6eacVFOYxwrvZQtgEF9AfHVdIHomI=; b=QQ1H41g6HGviYmJO
	QQeeZNatjK79cSdq3ULP5D1a8HAYtlVa05Cib7kBhlgTtR50TK0q4mxe+euAW59F
	BSaWIIAtL6I93Atuq/K5OFiaY8gZLz8EETEKOQbL3SZA99sP4SYknd6OfSXrl+3w
	nB8oWsvoOJQMm0Qn0FgwPgfvAgBvS434qnlLZJCmDYrjGpmnYnz0PG8I3bHDRIgf
	75nyPKbsFL53j9xIDdq2Yd+QIlNQJ2NNB8wEF9ac9UkXSjd817foZRg5z23ZHdHe
	vkiyr8j2y7YBNSJmXbHU6unZYtwHR47hUJsjZfJ9gyDm/sOawIfe5cEnI4qYbRBo
	3gI3cA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjeg2qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1233b91de6bso9244492c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769502856; x=1770107656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6T+0bGfJO+QEwo6eacVFOYxwrvZQtgEF9AfHVdIHomI=;
        b=DzAQOd8VOwgxL0q0ME4MsQ+nUjw3Y2dge7Vq4zEhMiknu0xaBfVGxJEunGtrlkBQZ0
         TkYM84hi22K2OU5jTbc6UEBpywXCtVoMO54tXmvkpiAtRmiuWOReOc3Offi258Ruk3XX
         RZDtV/YtgTwYkQ8qrh7hX90WuUqPYxQYDeEQP29uH37Wn1YGqew9GLHDnm505N4G+MnN
         QTI3VScfZIwIPGid9A4aQCkiYhgAdrUq37esL0Nd/A90YxC8X9TJOHbGbAfHcxuFfd2W
         eqM+52G77yTRFbyKslUVz2fwEUroxCxfJmtexUtOdTY11C1wP4GG7iOrBkaxUjSyIi9P
         SKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769502856; x=1770107656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6T+0bGfJO+QEwo6eacVFOYxwrvZQtgEF9AfHVdIHomI=;
        b=gF7ezxoKcHAXl5zFE9iYSP0F7MrHnlHt89SNP7ypy0rtKTMY5BtVU55XTsW7L1+Kit
         Xi8oUMqq5ifAfLfa1p8t2kk6st86g5MBkKQ4FwFy1Sm4jPxAplfafGHyxcbgmEXUl7aD
         N6Orq4YCvSds90gAto54bu4j3WgKyOKVp/tr2d3Lh+7Hd0iD/w8+2tUKkQf+jjdhLDAm
         wuof0A+JMxhTwaRCkuTJrZipGMgEGZC73mLTUetdgCfwbYqOFOwIvNGtlLliex1wWFk9
         jbheE+E9oUlSGSg20k5+IH6CAQlfLpiN+aRBiTvWAqejzqTxPNPRmJ+F/yPgKJ9iqSZ4
         gVVw==
X-Forwarded-Encrypted: i=1; AJvYcCWddHbD6TjUJ4dBd/orFaItuwKACf28zT9Pm+uC2rRoWksw4B+pLoVlqtKckheJJmlonmMygXwpv43fsi8e@vger.kernel.org
X-Gm-Message-State: AOJu0YyAe3ETWjCavt41h1udUtbWdtwH+AZ9Er/4TL9R1zS9YQ8vro2c
	qJDGl0p8OPipF3sNkdWrZYG7UWOTwk8Hx/qgeKt7mm4uItR0TCN0m+jOxWGo1waSwX2VoHLyuV8
	F+HwjWlnlDeD5iEbHRTvLZY+BmOlQ8YjWJdGcv2QL9Umh4nC8cWrVOgTUgwQbLwUIuj42
X-Gm-Gg: AZuq6aLqFQHCvwTpAVbelV2enn0VRFcDPGasX1GW6BJZ0DH45r5xd4RblujWP4875MX
	9aO9R8FFCwQ+V3poo9Y733h08w4cwE3KSQg3GH7gPct+Y3+IQ6SKSxoaHYJP2G9L8pmArvYehVB
	0V271ka/kXnpurbovsuRv5Fs2Eoo5rJRN+EShZ6UqtPy1aE+nzOhr7PwP6sG8i70IxTKo0WndGw
	8SjiBxsWJIneqgrgCr1rJV4XT/MVog3lqu3J+HhbsEuovVXRTkmpE1IIUz+p6/g8lXfu3wWWUdh
	k5jOf1ENU+VCA15VL76wIpHcqpv+81J8h4IeCPy7vmRvOPxCg9sI5qgwGUyswcYTWirktRqMg4L
	Oce4K+BR/YXbWyS0YrehR/pS/tEJi+aWktYQH7nvsborIxJcIulbAVEnx+iN7
X-Received: by 2002:a05:7022:4194:b0:11b:1c6d:98bd with SMTP id a92af1059eb24-124a005f4e3mr527926c88.9.1769502856238;
        Tue, 27 Jan 2026 00:34:16 -0800 (PST)
X-Received: by 2002:a05:7022:4194:b0:11b:1c6d:98bd with SMTP id a92af1059eb24-124a005f4e3mr527874c88.9.1769502855657;
        Tue, 27 Jan 2026 00:34:15 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm21064235c88.1.2026.01.27.00.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:34:15 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 00:34:03 -0800
Subject: [PATCH v4 06/10] arm64: dts: qcom: kaanapali-mtp: Enable ADSP and
 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-knp-dts-misc-v4-6-02723207a450@oss.qualcomm.com>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
In-Reply-To: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769502846; l=954;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/ZMmm8z/CzK9Ydn1qk72zGpHkz9/CApKnE2xT9rSk5A=;
 b=YnsGfZ9dbB1/ND7IxfJ0BimfntJBM7x2Wwgue4IZnoMl09Q99U+wgvLc/ZCM+h7rAI5tcg9lT
 Kb4IVI0Bnn6Czx2KIp10RpUoJxC8zP7sjUxy/nSLA2lcScO/Koay+92
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2OSBTYWx0ZWRfXwF9z4svqRQbT
 saYorOq7J4Nq8n63jKe8osl+EmT28Wfpdl3s58ax7C+D1FE3CktTw7xzrZ+mGbL3ZXjkNd+m0F6
 dWTaPDcSU7KR8a2YvhqWvhyfy+RdP7b/AbEYE7OPjEqhYvA3pP2uqVfPSve7wLsAIiGXZz63IyE
 yxZ8U/utl1G+H5J7Nd7Yj0rIwVFXIKuPv8EYmIx8bOscmEdCaG/wAUAmnBXMAGtseVAanXtwsIa
 pQjiCaEXKKJ6CUhPcu0qtlAJIq3r/cv2GfzPd2d1ssed0PBMu+qvM5fpyPSspmRrbomfylyHe9G
 wmnCukBAPAsfHyyn1UYGKFdmvVGtzOjdU3ECp7bBKdOiOk3RV+3E9a8/nn9arOvNqPHuAHB6NdS
 hQx2Xsmqem196RtDrTe3FAUH/CQ0WkAHw4hXtbjEkmmHW+N6oWeYuSIqO9Ln+/spv95IU3qLolv
 ThWjzEkYs27nhcEY+fw==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=69787889 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6pSOtZClNuHiBGgWezYA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: b1HFEs2BYz3vWub4Ud5Fq6vh_AfwTqne
X-Proofpoint-GUID: b1HFEs2BYz3vWub4Ud5Fq6vh_AfwTqne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90669-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB4949121C
X-Rspamd-Action: no action

Enable ADSP and CDSP on Kaanapali MTP board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 32a082598434..3544f744fd1d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -684,6 +684,20 @@ &pcie_port0 {
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/kaanapali/adsp.mbn",
+			"qcom/kaanapali/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/kaanapali/cdsp.mbn",
+			"qcom/kaanapali/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
 

-- 
2.25.1


