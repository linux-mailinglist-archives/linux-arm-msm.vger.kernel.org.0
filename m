Return-Path: <linux-arm-msm+bounces-66948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E08CB145CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 03:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 839DE1AA1DF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 01:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA7C1F78F2;
	Tue, 29 Jul 2025 01:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHsDonNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36DA1FDA8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753752761; cv=none; b=CpqYr1y//2sJJ1uSI5oqGj0TNv3vY9mAUtwTntckYDE/zqJ7L8G5DOBJ5NxyPYfHML8hT4HF70uF+XL/pZd/Gc0Sqmn5lAaimUFZ4CJ0VHjPWsdnA9/BL1dIvHiexZSN+xY8L1dbsf11UZ+NbUJo5NGDvk91OrBNbcYx1POwSk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753752761; c=relaxed/simple;
	bh=dpxW8aShh2RYLX9CjF0k/XEH2duG8LnixEBwdfov9eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRw3esWdZf2QJKYQUteVvDPe2v4wchvtRI8CJhO0868McWfxUTtsY9yIQLs+OoyI2wZYejv9SCEUlZlZydGLSNbffneMoLvFg8R0k7WoUHRCxtfWvJ3os6K1fkivO2xOnhJy/12g2AbB7S1lr1UueNWepjFgx8g4vjWelyF+vG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHsDonNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T02Sk1018607
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+WbtO0JaeN1fhr4oYLduWJfFLHLQ9helHJAYmSQJKos=; b=DHsDonNyDMW1/nJL
	H0QD1zPT/Wr2sOoN+J2WSnmeN1MDNfkiyU50Vjf9GrplMkmMrHHtfOiI1IFPxwFV
	mubLeiF4KD9lm36BRGUvkFjxxgbi5EMlax+19bG9O39QgJIaFfpJXchMK7A1+rAJ
	itSxJHFndtpTB9Ln4bCGTiZwOzJek4wzbTcNEHZjlzGn6SKECPohgXMt74av4CCD
	7IpIXNgfOkoGLwS2Aoi+srRaBSp0CQoImISiEns1qSK7e6Euq7cPlg7+xeIajMY/
	/vsw9gejnqeRmc6MoBwj07FQTf1zRgu64qfDV63X8D/nP/oInbveb/el2CD9cTn3
	tP+BMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2e9qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:32:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso5822966a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753752757; x=1754357557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WbtO0JaeN1fhr4oYLduWJfFLHLQ9helHJAYmSQJKos=;
        b=ZSMNnrnJYyIBmXivP29a8hFwF72KuUO0WnxWg7/DBPexAXz9A1Cb8okyq7Y21C6N1I
         rMvz4M39t9/6cBVbjHut955+bgS/381YXJFeJ8bJQXJJZwSpBiPrD28QgpVCRRNG0CfK
         Cg0MXDw9DBokW/j8DKHk6F1OBFTI/TtcNkkkO8mlhWbSkEAWuiAiv/n9OE8mOpsH2dPP
         LPZ4JrJaN6FgQfa+kOU7+FXX2tQqOQGJ18bFt49yU/XNqz/TwqwGMl0eWwFehoYgiKpx
         Y8MhIrzlNBrFGS8Fn33YtantdTZb3KdBNyJbR5Yw2Cs59+fRE8O/cJ10/N9rkjUtjWi9
         HDJA==
X-Forwarded-Encrypted: i=1; AJvYcCWukkILbYRjN6UzvHHs7ZvpU+B6y8lg+MI4YlqFy4OEtCgDNIcavxx+YysZSfcNTHUuFXmUkdhS4/L3xS/q@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7ItgXsVb6MSLZrOC69Hys3dxI4p/M9qis10KOcFal+oUEGAq
	X+Mx6IUbGqNU7is4ZMp7oFWOQx8Edw3dVU/7tZNyzg3HGTHAL9anqKG8NTIajQnl2auWNdSHt0m
	i39urk+xKJo4twhWbe7liXuD3Zmo38QlISoUbJL8h9ofhtEa23Llo8lHrNG8KsrPElssD
X-Gm-Gg: ASbGncs13i1uNeYxkSRRGoTdbFN3mxhBMC399tLKK5tR73urQgwc5zgWqT43JztQKLV
	RnqsmRGKubQzoEdz88wxSktW9CsXJSvLI5CejqgqcjNJYPdDJa0zZbi1qpqeAGI+0kZGClF5alD
	wTknOjLXunLBC7NOqyz649X58qI5TQ4kWlfdfDFs+1GVJe+MccXmY7q7170fyoiu78qe/ZviFr8
	FlqU1zR40MJgtlymWEw9JkilwhqxYSxKPseBA+Wegp6ba0IHHyqqBovj3UDboJh8duMdmjq61Ox
	Xn6Bb52CWpw/0RScC5fjOMY4u7xekAMwjcBTwVLlC+qlHlOmBl6Habi+eu3UE9TaVgp8ughV2WO
	PvklS9tEJmagGOc6056UwKhYGTFAtRHRTVw==
X-Received: by 2002:a17:903:1c5:b0:234:986c:66bf with SMTP id d9443c01a7336-23fb2fef327mr178450975ad.11.1753752757366;
        Mon, 28 Jul 2025 18:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa3hRcc8uYaZE3mUBUkpRF0ee2DHpWPplGSLAHNpWv/FMvjfBEx8xAapx8JkFCzhryUd99CA==
X-Received: by 2002:a17:903:1c5:b0:234:986c:66bf with SMTP id d9443c01a7336-23fb2fef327mr178450575ad.11.1753752756809;
        Mon, 28 Jul 2025 18:32:36 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2405bca90ebsm11210625ad.6.2025.07.28.18.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 18:32:36 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 09:31:58 +0800
Subject: [PATCH v3 2/4] firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-hamoa_initial-v3-2-806e092789dc@oss.qualcomm.com>
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
In-Reply-To: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753752746; l=902;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=dpxW8aShh2RYLX9CjF0k/XEH2duG8LnixEBwdfov9eo=;
 b=8Q7Q8nlyZKIFvBTCy9gXYcFEMWitIr6B5ietc72n5mFzetjwBg2rFJQ5W3k/hSmyXKfS6x0PR
 Tesb7L2qmL2DsNEwx3u0OjoadRF4KZTJwef+H1OCiDK9yJQXTWYTDjg
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: kP1YQDYPBv8q_7Uh2a42jnFXJuALDF_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAwNiBTYWx0ZWRfXwT8hYLtwsuoS
 a/vh26v5nNGRgMdmyGSGE289kMgP5twNFNt4Fn5A8eoBrgQlPRVEPwXkR34NZ3tl1yKRHfuaYSe
 FxBEOj1/e0S3dTjt8g56RO2QG/L8oq3FthFaIy9v8SOpecJVpRpfOni1nww/HSv5ddN++yJJtGa
 GoznLdCVbNOovLtbIZvufRu3pOpr82ul784dVjtUrHNLQLNfQ9HP5TSvXtJ59IIhGpjspjCPysz
 l5KD4DSSB/mGQ93tSzsobY9Qu/K7FDppCVsJFRPDhY5xJh1U0Q1F6qKLBellnDyvYnrA1AURzrY
 CNAEdhfTNr/Y87E1vnnf1NC4KRkA3Msd5VzgYLhvRMbKi9hz7jSyRsE98h0cFjhfTLTjEDfztTc
 eHbF9f8XjejtYcl4ePj+MeSMtIA3Liy/YhVbDKYFHWYQqJGWJGq485h0ynUKUmVP+Sz6ujI2
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688824b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=h7II6S6JRGbW-U2bcKQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: kP1YQDYPBv8q_7Uh2a42jnFXJuALDF_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290006

Add the Hamoa-IoT-EVK board to the list to enable access to EFI variables.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 26cd0458aacd67dcd36f065675e969cea97eb465..27c9d4a0912646415efac2df089ddedaf971fcb1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2006,6 +2006,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },

-- 
2.34.1


