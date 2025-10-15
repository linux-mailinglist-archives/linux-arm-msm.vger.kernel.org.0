Return-Path: <linux-arm-msm+bounces-77272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8BBDC300
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 854314EEA33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 02:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D923C30C342;
	Wed, 15 Oct 2025 02:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rqpar8CB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D5C30C35E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496207; cv=none; b=JP0LXkzIt3U0xe/WB3sBZTRjDqLH50BegxP9hGyoH5J1bBrBUSHYEFzizFeeu5431MUtZf4Lc3u9Htn+8UpNzTJ8uO8TG1Zh1b2Ws+glhRL1K7EGbJkurElbmfe9AHr/ZS/DV6KheZWYtly11VlGJ64m4jAWiWnqjlwJZch9jqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496207; c=relaxed/simple;
	bh=0rVwPwb2voVzOHTKavO0nQGcp9y2IoeMgD6s71JHxRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QVZO5aPhrWPnNefQIM8Jc+weRPIGDCpeRDE9IRJdbSFPweDMazqLTxOCDDUHyjftcM8Ti28otDN3O3rTfQZaC3icacUdKBuiHVsPFky7tVKpFRQurGWPZ8VTc+x8BE7DSIZfiUaLyhXgTOQhiNNnONev2k5XW3yeNj9l9bvA7RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rqpar8CB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2e2Ds008820
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a8Qod7OOqEkFq+EpdIzWVZ
	NCKD/5SirXFq15HIYfIa0=; b=Rqpar8CBotbS2mYoRyKRjxjSXXOw69dFCHbDYK
	1Ag6n+cdgcKt1M4cX9Qq9yOnqfbUPeZ68WbA0CYxk35Pscz4yO1oIBTr5KEnAJ0R
	h1TR7kXPs7gUvCqs797FUfzhVVO58f2CHZ7MOSbtOM0cqPOgNFdzpTmXY6XXPMlL
	Cxou2uR3zUiLDRRJtgBrL8et5zA6Gmz2IJeuAZozxvE/Q1AX8sgURcmQcfVqPEjp
	ZDKxFk4JeMSKUzhit7yywQuEJCIHpFdgodoNbwtSng+AvnAmh4KRKSbddNfiKfOv
	gOjpJoRQmCJOfj6bxJ2pUWS1p1AXrlYLIO8Tfvwmbv228y6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg2muk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:43:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2681642efd9so97837635ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496204; x=1761101004;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Qod7OOqEkFq+EpdIzWVZNCKD/5SirXFq15HIYfIa0=;
        b=stDVE48j6q2DiFC4qOX1y/69foAkX/P+x6+rTIJgxaA5+ZTJqpjaphiw6e9Wu/p1kK
         N7+pTh/p8+c26tnXFJG267jwjZ+wv1jnJzUE7UqyWNSX51v7usZAoo7710qK9lzfH0cq
         h03TTY4TOK4AFbcvnmTbKzGspI5l5VKX18MwlR2G4uxLOB5Slp3G+sZP8A84Q3L7KlDG
         QPO63ECpC2oylNZI319ahLsBlNivfsHeTZcYTL8QTundsAbBAqGW/gLCSbrH+IG8R7Oa
         m9F52qCXzyv2gtzCP49vci5REDv+B5TngHPKc5wfTcQFvG8owmIbVsb7g7/58um+hhYd
         Z05w==
X-Forwarded-Encrypted: i=1; AJvYcCX3/0oWsZPCO2tVRc/TxX6+94oy7v8yuY1CsZexzwmqqsyrQnE5lQgfsQe7ai7OyzhR/hZpFd5k3mERlaZM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6kJMMWNF140wZS6ye7MEcCWMduWfHD0PU18vw0BNJPU5e5R1Y
	3td1kO4j17tur9wqLEQANlsnWzdN17BJW3AynJbgbCUTR12+9yv3gniIUFO0tUet5GKPSJbzTlm
	AKrZFanN/grC9/Pl+XQCg070fA+797KLys5gp6ZIjq77+Dib6tJUbnOHS4SpYabcN7VEm
X-Gm-Gg: ASbGncu4u/ysJNkQpjyiAxDH8U0QhJugN/8UvrAAWI74+u2+utYSmMJGOiKu7pzclbT
	yd+/KkQd1OCxE9pU/LcF0CC9GdjYr38i6BUqcYZasvEHq/NQXWnX9EmO/MUUwyG605aiLJTVsJh
	q7Z7o2aVgdMmK1ikB8Ow+pqsV3cjnyUSn3iMbfF3hlW07epsqeyD9ibDnwNiqgMRExQaeezqccs
	eQh8Jr5/VT0l92iUWwQTezwvvzpZsdoMtAhk3N+efFIfDWytLqFILFZAfGZJwpfmCo5HPmK7yf1
	dUCXYScKU63noQauFq+Jnd+Y5eIZBkAQrynf+/QFogpB+dP3886SSCAMUdcgPWe2ux0F8WkTSj+
	La8sAp64+fzGApbOWSpE=
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr317468625ad.44.1760496204330;
        Tue, 14 Oct 2025 19:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE42hE6or4x2HxX7l7lKxe4Bot0TYcL2n/exI1bwf9/Tnqk7dDhc/fzZnCyrUZVLqkIz2RJDQ==
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr317468295ad.44.1760496203842;
        Tue, 14 Oct 2025 19:43:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f366c0sm179219505ad.94.2025.10.14.19.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:43:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:43:15 -0700
Subject: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEIK72gC/x3Nyw6CMBBG4Vchs/ZPaJV4eRXDok6nMBEH0xI0I
 by7jctvc85GRbJKoVuzUZZVi85W4Q4N8RhsEGisJt/6zrXOI8QIkw94mvkJNaxJ8AoLj2oDJi0
 LfJceTo7nC5+uVEPvLEm//8m93/cflrJxg3QAAAA=
X-Change-ID: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX9IhEuJOpnk5l
 oyqpVPUIkgTRe96m28su1CZA9yzE9GxYtV5/oUiNDieeu6pg4e1sOJWTwH3YMx7oEipnjVzkTeO
 77uE9/SqBa3s8pUmKuPIawv/rTJIig5RXWZc0sPtc1gkD1lHZK16G43DU8eAz/ba087us9j9jF8
 doyMEPTRLeHX498d6bkOg9tVUZefw9NGIal0KU8GQ8uQiSlQmuXBBauaI+DjG8Dpwo/kHDIhoLQ
 4VM8EEUgDRxu2p0XolqW2oCIf1VWb0cTBt/qUSthVza7gkuvZL0KJPGPrKvX1art6Ekq0/IlLOk
 HOmSDndJMpLqo98XkqO/5O6JrMJROftljCPozTcFm/2IqVnAfBU7rvNqrt3P1oDZ2PV0+i1fLax
 DLoXv+IjFxz6E/6ukb7WO/8i8m+NVw==
X-Proofpoint-GUID: 2qJ_hgAJpnrZzXRonl3KXbEqZc_WT_Ko
X-Proofpoint-ORIG-GUID: 2qJ_hgAJpnrZzXRonl3KXbEqZc_WT_Ko
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ef0a4d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F0hiWKNqIihWguCrtJ8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On hardware architectures where a single CAMNOC module is split into
two, one for each of the real time (RT) and non real time (NRT) modules
within camera sub system, processing VFE output over the AXI bus
requires enabling and setting the appropriate clock rate for the RT
CAMNOC. This change lays the groundwork for supporting such
configurations.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
This change lays the groundwork for supporting configurations for
hardware architectures that split a single CAMNOC module into real time
(RT) and non real time (NRT).
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ee08dbbddf88..09b29ba383f1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
-		!strcmp(clock->name, "camnoc_axi"));
+		!strcmp(clock->name, "camnoc_axi") ||
+		!strcmp(clock->name, "camnoc_rt_axi"));
 }
 
 /*

---
base-commit: 69a67cb382f428c6dd8ba63e44cd2c59cb84f736
change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


