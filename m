Return-Path: <linux-arm-msm+bounces-104502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GwPBXNn7Gn9YQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:04:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5E465557
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 451D8301C14D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 07:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E536A320A00;
	Sat, 25 Apr 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLjkM/F2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5mCCaDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E8C3148DD
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100423; cv=none; b=oqeG4B3/ovl/zmmdyNVficlpCJ2NmhCbWZeov3dOAcNaUUSnpH7kpGCNZPQEXehf5/bHfyIvoYmbVEdI9H6/7mmN8hnJQGx15Ex3bfPgE5qZM0h9aXCcQhWcX9nHHKIcbHK+2sYzy8yGNnQb0DeGuGjYtE3Qjz0ODj783Ml093o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100423; c=relaxed/simple;
	bh=AQP/aUckNtEJUsL3LVXWtvqu0dRS3TEew8mNOzKausc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YqXAfibrU3inqtKW8rEJjBBVfov/9TKGxg3FcrXRltyDbWhrarailFydtEQQ9Xmeffn4+/0WLHJLsxEMvunSjSM1YCSGt/FzAgj5Vf8CV5gEXbkcj5dmZQXWij03Lkx3TsCm8IWrwprO1uH6aq5RFZKLpe397PMBmEuISGW1DjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLjkM/F2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5mCCaDm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3kn6i1018055
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JhKOLrjQ8gm
	GEteABIqkTKLHL0ktRUOXijde29GYx6Y=; b=LLjkM/F2hFcasGrL0wfungt5SBC
	hZuYIIt3EG+9NXMNtBkY1ua5RY/G6XJ+1ZuKao3TDlE49pPUXOLnpcPIDdoYV83t
	sGZGVUtS5nIoanGxNl8fIkXJ8HiLwQYH9k9xK8IX9+cMNIZ9En9xAcPheEE464dS
	3aKtcdGLwUSxUcK2DNr1hyon7dMOFT6zj98szOEVK3EuguUc8WBEwB3XkPW4XljR
	bCxyJh1pJt1W3hyxL5dUhJ8yZe1a8yATx2r5/2xGiYjDa8zRXUldP2txxnOnLz53
	W9iee83a9wP85MrzVOanlLb7qfaS2q9XDUVYdampc0Sgj6CQV91fw1zvXUw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07gaq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so12794251eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 00:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100414; x=1777705214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhKOLrjQ8gmGEteABIqkTKLHL0ktRUOXijde29GYx6Y=;
        b=E5mCCaDmw3OUVRDES2NM4aek7Nu0ZBdhI3UCb9PLv4WrrqODOB7AI+K/kYXj3dO4Oj
         Y/e8Pz6yOcN8oetdBglTF99Ghu/CzwJIwkWa/394jEfTHwkRI2Na9h7p/xggP2R5BMP3
         QGpV5qdLa7pyDrDcxpc3JKxgKFjeR5C1TpqhQ+QJIXv//23AR6a0i91J9TH3IYh8K4LA
         jfwcn3otGKC7I8LGdcjcjy+seH7uknob1kzWi2s//EzNkz6Kt1/h4RIHZDnXBq9ZJEFf
         KM5YEnYc9g5LmxBOujjpkDRxLzJywDKBdUNYsrL6RiwQAKBBfCzSBbGX18/YDl0VqktO
         8kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100414; x=1777705214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JhKOLrjQ8gmGEteABIqkTKLHL0ktRUOXijde29GYx6Y=;
        b=ecSVo8VCrzNl5zBa6dkD28I2sn1s3URfB8tZfjy1ToxkKZv53dZ9sjwWeUkEuGtSoo
         OK7P8UZGkY9+pB78uqKBeknQ/7SnZmMjTSLibSmvNPSSSF++JPesv7Yi/SbuSoQM9JKx
         OZuXlNcfLadoAEj50DYqkSDYpr3EQ19ux6zCE2GKMseYHBaLnP35ZYv/89ucD2WRXpvE
         xNWKPyT/TjPsCaHBTuJ4hmgkGEkbzNz/PiTgUaNrkHkWGf/nhif4EhpzfbNNY1HJu0xV
         vLokKMNRmFIFWxb3SXFNQG0zJZsVFvHS3fHl+rWZT+5+e0ku1pcnz5+S9cAXopueQPSr
         Pugw==
X-Forwarded-Encrypted: i=1; AFNElJ9zXyBfy/y6gNTatvCgEOhguavvL+5TYQ3tT/FLYpphxaS0F9wCEw/paaDhZdxVeBdOl03sS7Xputuz7md+@vger.kernel.org
X-Gm-Message-State: AOJu0YzBMAhV6D/HH+8Qhq+k3LdlnyQZxa9ET9yWoJyPi5nb38L80M9l
	e5olK1gVIizXj6H4dRt/F7jlryMIxByrOn0rQ2gPTfa5wYjqw4Mku9a5uny0HPwjmLJ1wUGwrgG
	ixMjkYpOFC+NeroWzfarmrpq0DhZEZ2DjIGnztiqkaNx5827oVI0miu8iGs+JnmgZXUOI
X-Gm-Gg: AeBDieu/pIglK6MkKYx10SxfhaeN1hf4DmeJJOGf8VQ064VjPVQWiFx/peOgrA+mpZQ
	isfWPEt4STpk9mAIjSIZVlNdN8ZtJ5KZi4+xsJu9R3/M1b2LqSet+SA6EJEngvFbYUpcZgTsI3I
	9C43AKSBkWUxf9YUyfuy+qZOxUDaInLERxmI/J7XUoBudORM5Du1JT5r2+MV2Knw1CHychg2Bx7
	l8lRqNqL6UnAV7vlnz/YYW1GgV282wce+Iuz6VUnG8AO+jkz0k6WN74AFzhQ+yURqw0SZJzXuBj
	EluHmExY5PNUnvbYQeZShK8KrbyYnNNrr59Xrq+kXSiHm05q+lXx0PfvFKbGfPhn3GC6BSUDciT
	Eh9WyDivOoPXTqRpKhrvcd41yaTiqRo56nP/s0gG6WV2ux52AN9Mhvbz1JlmAyKRH/KbgHTZeDo
	tvS+iwisUCuQ==
X-Received: by 2002:a05:7022:eac8:b0:119:e56b:98a4 with SMTP id a92af1059eb24-12c73f75981mr19523877c88.11.1777100413584;
        Sat, 25 Apr 2026 00:00:13 -0700 (PDT)
X-Received: by 2002:a05:7022:eac8:b0:119:e56b:98a4 with SMTP id a92af1059eb24-12c73f75981mr19523855c88.11.1777100412984;
        Sat, 25 Apr 2026 00:00:12 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:12 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
Date: Fri, 24 Apr 2026 23:59:59 -0700
Message-Id: <20260425070002.348733-2-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69ec667e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8IMiPDtIn6OAJiDpRukA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: c8Casl8v0Xl2BXWv81Zipj8uTpDtOF1N
X-Proofpoint-GUID: c8Casl8v0Xl2BXWv81Zipj8uTpDtOF1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfXxzMQdQMz5pyZ
 55L6zk7AOFH1YYMTw4ZnhlalS0cRddzwzwA+F03mMTZQwMfUEg/B6RqDr3NPdR7DiTg9sIaW7ms
 sWZ0rWt/FG9M7cI1TV+glIeEnpB8mT+JQLZjiaKX7kIIPYElU1tmB+ChpDVSNEBO1OmREBb0frq
 GG09ZuqlCnohEpsTGrwX+Y26RI8/tK+FUdo2uUYaPOIx+uTnIjIB9tVrktubzBqsury/X5pQoA3
 7uX6lccvovow/exm4kNIAYreuClU12LC7TGD8hLQtQxFa1aYZns67XGb7BuRl6FyHd68srFjwUj
 Qpgs4BbmFTZaVtO04x6aMPDXDJ1NahHCUWkfuV9DSl3NXq4t5uzmRJhOWuK7I2Bx0kHkY+pP+yj
 6AfvXKSYkdH6PKzfeT9Q7G2wv0aVHOW1fssEs4YKJXjL78DlSrSUNKx1WpgryFxXWIkjgdZ/2GK
 +IENrqkzAcMFY22Q5yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065
X-Rspamd-Queue-Id: B0C5E465557
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104502-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the Hawi compatible string for the QMP combo PHY.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..7a7059c659be 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,sm8750-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
+          - qcom,hawi-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -205,6 +206,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
+              - qcom,hawi-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.34.1


