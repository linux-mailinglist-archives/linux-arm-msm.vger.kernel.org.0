Return-Path: <linux-arm-msm+bounces-57693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A4AB5376
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 13:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D563A3BBE5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 11:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8DB28C870;
	Tue, 13 May 2025 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ll0RsFi3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3507269B0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134530; cv=none; b=qPqOPtxgfD5DGISLnjMSPsx/sf87D9W4EGEjR/VsMSprT59sd0WHLhFPhQCzrCq3iOcxFWePwCGw5m7w0FvEG7wtN0EWJxwVF0LJ2HlKgzxIVuSmJT4rounoz3VyEUXobzcwFy8wsCeR61we2CDyACafBAmSNA+cHJgGyYs6eRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134530; c=relaxed/simple;
	bh=rdpI6SyCzEcz0rHhDFC3KBNtrPw+BnurZ+tDNY7GaGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nsHNTgFKsDflY16bcmRDhNexNM836ITmuzeL310TrZiYv0Yb6GLM71N5/a0nFxWOxv8NH4k+32UVPsyNSczRgTaLzFch7rODUXeotQvoRoQNmUcJzWWwcYdOWhMRmlROXONjnUosYTIxwrW9vAyF2J/NRhartaU+rbwkn10/ogY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ll0RsFi3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DAHe7L012055
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 11:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TdcskCO2K/Wyi90DbkJBCc
	6FCyelyPLh1fYHTqrysmg=; b=Ll0RsFi3Z1nYvX2B6WtHFLRhJFf/frMjBJf0QM
	egtXLOPCcB/nrv0CEZF3N91IiA/pdiY8hHv52Up+7Kepqa66gBBBOthKH0YMN+zy
	y0lEJSi2tvX6XvzrKrsUJwzQVHyUgax+Rew4qreFo/aSoLNt2aEvGd6CTo1HADQA
	Dquth35rwQxKa4+boK/7vOpCaSnNqJWXc1qD3rfcR5c12mhExYTOr7aGu+I71Cqz
	NrSQGEQzkjlxYLmzjnlZd1H80Y3mfzSYhjx+LMBQRyAoBgUyuaYf8cg3Dygh3V5J
	6aOoBIBzXZT6uRIZwGzBfsaF4kmSZdklZT/EnZv+uf762LKg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kc3mvb67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 11:08:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7394772635dso4086084b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134526; x=1747739326;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdcskCO2K/Wyi90DbkJBCc6FCyelyPLh1fYHTqrysmg=;
        b=ut4hKiNRTU5/od7iVi4gQlwpRIEbKlekAUCNYH+E13c7Nr/lzogtE8zmkrG55xuweq
         0VrJkAoGVpVx4surXEVxlbYxvnMblXu3ZOPe+R0d+n+SPdJzKzE/M/QSqvnULGUA04FD
         H3ZfadCzmFNGu+en2y9SdjFy017QhNpMIDSSOldqdrEU7H8t3zLJszVQpPkEqWbyfKMX
         soDXtdzPD9TNF1KBq2TrT5htQcwFoONmzqZrTlZjCwc9732xLf+sUG0UM8jbF7nzDPpT
         U6QBrekDV2paeA8UQA1CjnW+v9ahW/gcQpY1GPY8Zk/UjRsjoIi2iOTnTZx+yswmzHg5
         /I3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFY18Y9tc+EvrUat0vQC4yQzcuyzLbhovv1Fl1LTj4L9P/X6ONJLjXjX4te3l05k12oZaUWjpEI05Ayu5x@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCr9wpvL1GSUpOFOtfHHmMm2CzyXsUCYbLmvNxcUObxd7Keyq
	Z4/4MPPQdceIvftytRA/xYLFy39I+1vBI+AHfTpsyn9eFZo35mMyMoiJekDgKkcqjitlO0p1ffi
	U0gKNr6S71nsWCMeALS1m/BmSN0PjCUzlU89kqGX9YsG+3B+fefO2W4OGKeiEucVh
X-Gm-Gg: ASbGncv2pnNctobQyia4BWM+EsuUDdXkHPgmeBvk+OfRAzjcSLaUDpW03Ys6cNl/Edn
	a57XkDDxbuiVUeB3NxizzWhaJXWfV48TigStN2w2/u+59eYZd+ydX9OWRsDdSK5BHmtxHAxiVzA
	cx+jYR7Y/MyFaAuK9IRecGke/PfhyUoTtJJEF+fvwW1L2mhB4u5P528L2nLD3Eb7OqO9J5wrIBM
	1hpTAjVbczyzTauZ8HAmDOD+RZjiBiDUy4+G5jwjCVYS6tqbdmZ01Xtgl5CU69jAj6HB2lyFduk
	CsvAogAZ3okiPfZ9UM+tO225XQmYm55kTxLPFskD9Lit4lOb23/xpMm3uUAor43mX9jkm7BTu/l
	vPZDabhJFiyb1X8/+HZi8y5SedZj1boBPwaoYFFZrs3yqdpk=
X-Received: by 2002:a05:6a21:9982:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-215abc613a1mr29416447637.35.1747134526220;
        Tue, 13 May 2025 04:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwN2TRFlFW2UrWDD2VPfw/5b4OcIVv3/BEHBl6G3cH26syPZhvz9HpnkVuSopGz++v8+1RpQ==
X-Received: by 2002:a05:6a21:9982:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-215abc613a1mr29416412637.35.1747134525847;
        Tue, 13 May 2025 04:08:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b251957fef4sm6051656a12.75.2025.05.13.04.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:08:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 13 May 2025 16:38:33 +0530
Subject: [PATCH] i2c: qcom-geni: fix I2C frequency table to achieve
 accurate bus rates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADAoI2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Nj3UyjZN2k0mLdtKLUQt3EZBMzYxNjCzPLRBMloJaCotS0zAqwcdG
 xtbUATUlz714AAAA=
X-Change-ID: 20250513-i2c-bus-freq-ac46343869a4
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747134522; l=1564;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=rdpI6SyCzEcz0rHhDFC3KBNtrPw+BnurZ+tDNY7GaGg=;
 b=LCHz9YCCEIlr+bjBQdea52XKoMJwQDH+j2d3dmop+sliEw7Fqh/3EA9PeKXG5vTE6dxR5fRNo
 jw2wBTtLHrBChGI68l+LbQvNJi5gGwM3e1IJJpS8ktEabI6RyF7Srtq
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: ahy4lOaZJjwx-ickwazDZVFwzKrn3wxr
X-Proofpoint-GUID: ahy4lOaZJjwx-ickwazDZVFwzKrn3wxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEwNSBTYWx0ZWRfXz0Fh6+wGhu1x
 b44Q6GmEVn9ved9buJ2DmzkVwk4IaxT7OhYrpmUCAZk5E62fZihMXX33crrT7/8bRswwU6PZgvC
 TKdprp4Njt68U6lNcK+N723mt3hPp+5o3z8lBJ2af1M5wX2Vn6H/LUI5WgheswmqrbM9/JHaQsl
 4Qw5QQYXfaHF+0tlOFmeSGhHRepzvgfo5XGLjfuQCWy4IwWicv5eQu2PjL44x/sHmVqgP34tkGX
 qOmwxjyP/Ik2i61EWgGzLPOug1YFZBOMqrPh7tjJjEHd48tuDnVI4zjLKvB8020VtAr8dqMUYIX
 +BPV/tOze61X53MgbB7ECJ7O1RqIT7aKihHrvVHKqfAP2StMd6rvzJErF0KDT+wPEJZZ/5esToi
 MNzQd3f/VcIQsR49niCmIFkpJYPhxSOon1IzVvOUhcbcKVR9YHgQlUdYxd4H+cQmxx9aE2S/
X-Authority-Analysis: v=2.4 cv=afhhnQot c=1 sm=1 tr=0 ts=6823283f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=c3nHYIS01CY_1xjDKk0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130105

Update the I2C frequency table to match the recommended values
specified in the I2C hardware programming guide. In the current IPQ5424
configuration where 32MHz is the source clock, the I2C bus frequencies do
not meet expectations—for instance, 363KHz is achieved instead of the
expected 400KHz.

Cc: stable@kernel.org
Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ccea575fb7838db864ca4a2b21ebb3835b2567b2..2fec7b44bfc1baec68e321a9f57de4156120919b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -155,9 +155,9 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
-	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
-	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
-	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
+	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
+	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
 	{}
 };
 

---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-i2c-bus-freq-ac46343869a4

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


