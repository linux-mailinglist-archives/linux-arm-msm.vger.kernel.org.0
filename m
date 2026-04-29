Return-Path: <linux-arm-msm+bounces-105140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP+VG7q38WngjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:48:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19180490B96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35D873048F3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 07:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E79E3A9D8C;
	Wed, 29 Apr 2026 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBVT0Ctp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BW1E+TiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3A3AF659
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448677; cv=none; b=KnGh+Rq7S4JowvMwImOLY4nsT1u0W1mHyoqjm2/WMBnwyGLOXO85GwoYLghtLON0ZrOu0kVjjqMPOzWRAl5ql8k5rzscn4QMJgz/JuuJckEVBbDXwOGWmfF4GbDJI/lLh3PZqsfDil2Q8XIwSofJgTwu1yaqarU2GAPeMcdQTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448677; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbSwmJ+8PtxC9uCJcDfvzdL1e8dRSPszX3xqt/q5pSKu6bgE0D8AonSC26a6b2bu+PIr5DhDBwffLzFrp/5SSrZp/2aYqBwjyhI4zya3minDlYchp/InnjNYIO/6YbgpSdrMi0SltuJU3fZjmgNjdn0f5Cu/vHefXRc4/zpvQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBVT0Ctp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BW1E+TiH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T0o6FB2007863
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=eBVT0CtpVU+Blc7Z
	bDBGq657jgsZdMmj6uBX1mm5QtXRuPtQDgeXL87PyxZjumQY0cnIptMlCJlFRnIg
	4nQlomCYjz5dEeNkz3/L42lbMY1hF+91u1veRdbxAV5fvCFhVbz358ZBWBpu5q14
	RoapHIcc9wSCe2cLHB+/Qv+w5G3GzUZC8JB0yfmOk0rf2RirzDe5SWQAOTwyykrH
	+8/NBLosp79sV/80VEIM9HOMNGRRgdELO60YNlItIo7tiAtbXtowSk62xutQe3Px
	FjB/8syL6/AXQ77xAIf3zFHHldvYW4yA0zdWw2XghuhDVLcRQ/+35fPAmjhvug/8
	EdScEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx9brt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so6569698a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 00:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448673; x=1778053473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=BW1E+TiHXUZoubHObvG6KulvZ56bZ5ImcOj5U8vTR1xLRZnjTEfC6pDGPf0VpJ5UW0
         S1ZjTeZE6bxgimiOuFSaYbtxGEktO2gdCMyNb1V1hUBIF/bW63plOVA0yk38eI6ubJ1h
         xbkPNGxser64XM7kMWMQ+bug/g0FVtwPTnabMJ83Hdr65aVhRJm/k7X7VwAT8aJu2pPD
         LHpBk6A75JWP7f4uJ9MmZCFj8S+gqOGUc6th34vKQobizvcLCMyKFomUhP9c26hdiXSw
         Aoswew+FOlWe0sDtgItYB9vkKqAraBtVAhtGeRVLXUFf0Ki6OknXsUHoKNFdjz74+fud
         /c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448673; x=1778053473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=beO88szx+wSO6w3VdWp/75gPGVwq/Av3u3iROxI7iW/vCFFSBgNIU5rZvF0iPFne8k
         crj3Ez9egJKUHvxS7Vk027j2kyNY0aIIRz1A0u/BSyRec45E153xCn2SuseFqSPhEnZ7
         LYt58WZDJtQI9pEQ1973XHqtSm9zPXCSQTL6IJUJQYcfiLRSle80fx+NWRwP/9KCx3e0
         Wi+gqzGIDyQThboJwD/OuJGWCYcPwVNOY4gIUcqG1cDakxLW61UdBqcGKteHMaQGGMp8
         hKyzYZ9W2PjDiO7WQp7qXgux24lTB5I95ZT5RvE4crWLGLuAZ353jlBx96B8K19cItFi
         WMKg==
X-Forwarded-Encrypted: i=1; AFNElJ/rA5y1hxYqiK57a8v8m4/Jyop/g9AjaqKSQV5HHXl7gIwn6kBHoSIwHjzbQ1hgWZOc/cNM3QaCE0ibDT5k@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk8ZbqVM1SWK7Z1Q2zYv7PWlB3nV9LnxONdjFHGEiB28CbWjB3
	TzYxF/KsVFgA482AnGpZqA6aQ6S3u9eHwisM4uBHT4GaNub34/ZPQGqIPl0sNU/JIbsrao3fG0t
	euQZuFD7l8RtYgXk7MSxBvu5OFSGDwd86JGgTgEtOxp1cNR7BsLfAGtvaHvQJ4VnUKTfl
X-Gm-Gg: AeBDiev8yW/LNonHbrsly7oVqHp0HK+Tl+UeHfdx3Y/9/oSc8UjfZYGGMiWfakVVpHp
	3Oq8NlpkFE2PcU/O+KKXPYsEfPlW47eFayF0iOvBzWRcHlay4pNRHVNnqqt8SYLF5EMnlEN51or
	4xI8Rmqe7tL/BcegpgtUaB+0OjS8WsvsviE6Rc/Sfvc0csC84jO/H5C3W5TJpIQ43F0MiuEK7Ep
	gS7TtvqrH1iwFvECp+nKBMD1ROASU8qQOv094UAIQvi7nU9hUabHsEIc16GbtyxTKrq1Tnj9FUX
	mwBtljhdk+ml8OjVMUdthe0YY/eSkQefp2R8hAbf1QMp0R4HoEiFT5L2FXe4ubqwTqgjJtTvKon
	SUAbccV52ssGeq0Uzc++EG99u77X4wF6g3UQ2zc7Iuc1dGN/b+MBCzp16vCxC0rA=
X-Received: by 2002:a05:6a20:6a26:b0:3a1:d516:36ec with SMTP id adf61e73a8af0-3a3af700709mr3129244637.56.1777448672927;
        Wed, 29 Apr 2026 00:44:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a26:b0:3a1:d516:36ec with SMTP id adf61e73a8af0-3a3af700709mr3129219637.56.1777448672450;
        Wed, 29 Apr 2026 00:44:32 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:31 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:56 +0800
Subject: [PATCH v5 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-5-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=0IkCVdxVg0r4cAoAG6j72CGEOa3m9qhNipf+eavwcVAoJFapVIofSwDuJsXRjC5nfFVxOinf9
 fnDcVrlSPNuAlyb/a5+6MAslUrfQkL2Dma1IaDIocQAcIYc48sYlqRY
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: Jdy5U9VaYVmkiDklhj3SEjAiNCii5_Gn
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1b6e1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfXzfMvJNrm1G+C
 +Q4x0hy8uuF9PWRMEP2GiSjvVMYQ/LKG/T+v0b2l1253ay19eUY/TRTfJ1Df3f23fsGx1GMmWsA
 +9p/ifC4GNrX3nQFzDAsYu8xnvoEqpAtn8WVgewIKHIbBKwFbuZ/YrAnAeUAzClzl851T0eI5iI
 MAN+XhoECYqAi+pGAYitE4xE6YKbk4DWzm7LfhrFjgkbJ66x52uzkc5N9yAKrNYgWdWulJePNRY
 7jO+5rX3bxh34xncH3z44BWBavzaNzinXM+DSsU6+EcyU9GzxJ5cvWDFKhEtgblvi/Fima1Hqih
 2TqHOlzFT915ryFqDj6ISiDQiZq9Wt2oTmATWVsr2mK0fcCHlxCjnVbZVQ5FePLMoWTBUOtj6+s
 GYF93WdFYYLdoqUhKAhXzzdduqVVFBHTkRGTGpW984UrIPAyAknf3d2u193dGCqEWuXCQsfU5Ua
 Zpe39nAc5F8JAoPwMxA==
X-Proofpoint-ORIG-GUID: Jdy5U9VaYVmkiDklhj3SEjAiNCii5_Gn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290075
X-Rspamd-Queue-Id: 19180490B96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-105140-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0


