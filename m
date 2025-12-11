Return-Path: <linux-arm-msm+bounces-85063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1C6CB61F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EADE330014CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39EA2C0F78;
	Thu, 11 Dec 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffVxtotQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuiD1zZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690CF2367DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461585; cv=none; b=ck1cyEg8Di7eoy1BlHKltSQB5S8Kx0iMKeKzT14YaA82ayRTm69IgX1M+EQsCwzxJFbCX4IpGBvouBN8z7A+dBwLltG2oMXkGjBtQd44Z+FiOMXLl5lI2vWj2QB5VVolzK619RNAlXUe4VSyfSYNU3cxNE8lprUBF/YtYamMHCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461585; c=relaxed/simple;
	bh=WvDCaCiR7TQN5ztB+p64FRCFx1KZeesYp3g0jzFfzRA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z1GOi4vBsv5oJ7TpmclyiYuvmphmJby/LP/ActRAFVBLGW9+Cr5oou1vUoilOqPEojHl23RxHN9iNnggicdm8y/lpdLh4b8uaTLtZyx9kaS1+e6vbrNou9bxtFIDvNYpiHXk2rIF/29in41N8Jt3LZ6rBzXo6O0YO9oV3ZSGe5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffVxtotQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuiD1zZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXnRE1032259
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rVG0FQZ7iBaAjg/7lmETvacjhdr1fTvFD+2
	Qy3WCzAQ=; b=ffVxtotQjY9zglSIz/Go4Wl1wXbQ5wDRl/0WvtPfy2pcJrvWKCc
	g/bgCtyeOvN1c2KMWEaKNdqCMgSnhKt8Lvxcfu7Wq4J72PHHnHeJPzAQphPZsh2E
	GrN1HiPQ6Pfo2yhFaHIyT+rO6HB6cv2k/PYGao82RsMAtBjr34fRJkPpW7j4Ldel
	o5RMHiRLBO0XhawfLKNoMx/WKy9so32IKhxb2g8MYy2OwzOgXxrbcRKCdUF/zEcQ
	0WsUJG04jRzxvepnhWFCQ7f8FF09DO1IeCsWeTTwNdf+z5dojNziBrGn0WLJ+7hs
	48riIEHNzNWAC/k+HqzgImGVn7JcBNsHDMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygtfjmr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:59:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so2087911cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765461582; x=1766066382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVG0FQZ7iBaAjg/7lmETvacjhdr1fTvFD+2Qy3WCzAQ=;
        b=EuiD1zZcYoCsAzZ5Po1o2V7iYTLCGvIl73yj6Iz+CJsvw50ypHA4oDIA4b+EFQTRGB
         DCJeZ+g/WxQsTy5B9tZQY6jjMMhMQPUDLBEGV4mygUJcCtOzTY7viDTal+PhACJ7etEG
         y/9EBQ85a5bWMc5ltJRGm3p5JyVT1Pl65sYAXBxHunv7ohng6S7iB/Cmfap80FjX36Bh
         ECPgnyCWTqJzGsjUgIMQ5dXX5ciwNQDnRuex07sDu+DeoZ75J72pumSK/o/lndtE9MA0
         L5aY3gJDDrOFDBGeofxqWMYxkjC8kxVZu1TIEXQAfIewLoO/1o8Q3nHxuB+WwrV9nR08
         NFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461582; x=1766066382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVG0FQZ7iBaAjg/7lmETvacjhdr1fTvFD+2Qy3WCzAQ=;
        b=rRM2yH34QWpMR1+YL78R/9KXoF/st4PTJLYgIEOR1x/eDl6B1m/QV6S7VJGCplttMA
         ROjFGyfTjXNG9yDNbdfZ5HFKrNk8niKJvmkiPklPg1S6c7VCFFTL3xfvkEtb6mumQLU8
         MtcJ/BsOg0Oiats7anprznLF6sOoM9jxy9TyilWGuOxF05ivU5pIQxBtPAI77iqxxteS
         DiE/d2SckQR2PFR3zan6P14/REQcB8vRbA8Cf1r0YQotg8uvMhnY7OrxwWpeKkA/uKxz
         KBqSx8Azp33NzBHv7gJHoIdmzlrOm4+WED1FQ/PU+RBGIH3HgG5GV3tlKr+edElxtOG3
         SlIA==
X-Forwarded-Encrypted: i=1; AJvYcCUgllmOkiYTuwoHaG7l6QOXp5Iqb11KYeHEouzyaZJW+Njv8ZsdYhzq11BIBWw0rfDUdkHcLGjyNLulVt/n@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQF8PiadlZ1CMqRQtuk5C5VwXeSF7dHlnAkFCFv+oUMpYWzIo
	uwVDdUx8TjJopnW9Rq6dStIo9GgsxpjKv9GFA6yMcS1kQ3EdTC97PfNm9QCes8937OMJMZUpy+a
	BSE3M8Q/jS71NbHc5GJquLxKb+WpAmDIpDPg9BH1U8ycMEA0W0z/TCFnRlfwMV/s9Yh4a
X-Gm-Gg: AY/fxX5KmXM+RNag0mrsdoZPYA5utdlkhGX6YhYrj04SYk8bqi+XGDhmN19xXuOsxX8
	hcJ5mxk715KYfnNOrbxOXAPNk25LzxToshR8V2ojl4vaxD6AAbbp/fAOspYhrmH/T/w2y76eq3c
	erk7OZc/3jkvKejeecFtgesDopBVqzAB4oNwCTQFwnW7BWyOiOF0jSsxmIpt6kr1hWMA1HhOdSy
	EOU9FboURozdChlestvbGsnBaFE71vp0PvKiFsFgCiVQRt0M3d0uF27kbGQO2DdA/ggp4kieiSh
	FrRU5zgfmoTN/ZMqMgGQmHK/9e5zzFjw+RPFZoy93ShAA9dgvgaKKw5wz46SGXI5xsNwjwxMDrr
	QHPkb5oEtEOVCktwofUUbM5oJdn2CSrr0EWycOCE3KbqBXFVrGu+qwnUDWr4EZ1kxcpwYzMTALY
	UH
X-Received: by 2002:a05:622a:1311:b0:4f1:8bfd:bdc1 with SMTP id d75a77b69052e-4f1bfe7cb6emr26170171cf.40.1765461582531;
        Thu, 11 Dec 2025 05:59:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEL82MuTh7TZYiCGCdEEgBHZ1CkYasSx0yzxC/VRGdzRhvTLCAY9xlSXBZY0LdF/lk4gU7uWw==
X-Received: by 2002:a05:622a:1311:b0:4f1:8bfd:bdc1 with SMTP id d75a77b69052e-4f1bfe7cb6emr26170011cf.40.1765461582142;
        Thu, 11 Dec 2025 05:59:42 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:85ae:5e15:f198:7755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f1e838sm51695925e9.2.2025.12.11.05.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:59:41 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: vladimir.zapolskiy@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3] media: qcom: camss: csid-340: Fix unused variables
Date: Thu, 11 Dec 2025 14:59:39 +0100
Message-Id: <20251211135939.1779544-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=At7jHe9P c=1 sm=1 tr=0 ts=693ace4f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=zQcWxqzyLD2HbsL2h4kA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Pq4X1pod9YzIJMlxyR5DE8qJl41FgVEQ
X-Proofpoint-GUID: Pq4X1pod9YzIJMlxyR5DE8qJl41FgVEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMCBTYWx0ZWRfX9CXIxKMfrswG
 QuvPjP5ODyrYln64aYioKRv6Hp9Ur7X9VJDEQuM9UdKsOmlGZOggcwee2DxEOWGr6qi1jWZLhl/
 /I02zZlIHMCb3ClNdoc/pfSLHHtZj87BCaIWvnChHCCxNLJ+Xb39KCzWYc7Vx8ZaPtBSweLirzK
 LkBp9lWjTc6e5qcqQB6Xcy1MbzRgnd+dDh0tfUrzb+C7MdOf3knury9lzIcwgFckqS1IuU0FKbg
 DFzndBMrI0UISZ7Yj/xK9L84BI69VpMGiRupWHhubvgVzcVYbDQtG9L1+bvEbxT63tHAlFm873c
 yFx8juG0GsuxuPFbhadtSYjyKsqDryS8fItOmJDZ0ZUSRJWZtJv11vhWcdXK+K5m+n284ffzbOT
 jwKrSPbAGDrmy/TjvCsB9JbZrYZgYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110110

The CSID driver has some unused variables and function parameters
that are no longer needed (due to refactoring). Clean up those
unused elements:

- Remove the `vc` parameter from `__csid_configure_rx()`.
- Drop the unused `lane_cnt` variable.
- Adjust call to `__csid_configure_rx()` accordingly.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 v3: Reword commit and drop the Fixes tag as no functional bug is fixed
 v2: Correct the commit ID in the Fixes: tag

 drivers/media/platform/qcom/camss/camss-csid-340.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 22a30510fb79..2b50f9b96a34 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -55,8 +55,7 @@
 #define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
-static void __csid_configure_rx(struct csid_device *csid,
-				struct csid_phy_config *phy, int vc)
+static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
 	u32 val;
 
@@ -81,13 +80,9 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
-	u8 lane_cnt = csid->phy.lane_cnt;
 	u8 dt_id;
 	u32 val;
 
-	if (!lane_cnt)
-		lane_cnt = 4;
-
 	/*
 	 * DT_ID is a two bit bitfield that is concatenated with
 	 * the four least significant bits of the five bit VC
@@ -120,10 +115,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
 
+	__csid_configure_rx(csid, &csid->phy);
+
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_configure_rx(csid, &csid->phy, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
-- 
2.34.1


