Return-Path: <linux-arm-msm+bounces-109261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAqqIXs2EGoaVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:56:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C675B292D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6487A3083A93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C153D3CED;
	Fri, 22 May 2026 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJgG/Wnv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qjn1x1E+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E83D3302
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447032; cv=none; b=L+EbM02gTSfm6gXeyvb8jHga+1OKsy4h3vzRQkJTSlIp1vfmJsHY7mKg0v0IhpL8rWGzKLYpEDXOkfqT5/ch4EioxRmmqQVzJeB5DGTj6LMnI5A5ntDIs7XokLjzAPiTNeD7nHAOygAwQYtYkQAuK26woLNM6ADEPQL/90fqUEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447032; c=relaxed/simple;
	bh=Ss/xKitgd8olKTPkGOM+CzwTEm3C4JYbsOFB6qDCO+A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KMg3P8H2xyPYAfjzxw/HsiSy33Uwg0pYYQxVIWfQ+erRW6+DRVYWIH9X0r7olP53g1rIPexmBUg/ltWzaTRxDSOuHrriV6iTWNbPcehyW6PjgbhCM4AiPTt2XdKMhTzHAQF1RI4xUNkrEgsEGARzv0SiYLDZn9yjJ9W7Dv/D3eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJgG/Wnv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qjn1x1E+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6x3CL778821
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rsFY2z5jc/JKZpx8doK+ltMU++8z2DwQdy8
	wREIH8mw=; b=GJgG/Wnv1s+qWiG3oXGUOaa1pE3nYhPIOEgIVW8P0VtrQJELxY3
	fg4Sf+X/R3lup7MyympNKaOW9NVrH1G7djbI3MkX/H1POWEcFtQhGfHb0FPzvF8z
	I1f9Wgwr9aHSWphsm/315RdKxCsQrKir+cNusEq6Dk0kJDFF5MJyjatY0npqbqca
	vdFBDRihDJGgjC6ewLhXp8UsrvNu2JCIo3Kh490B138PPXE7KX+yvtHboUx9G9Oh
	MVbVOaDJ/DiOsV2wq/Ofz2/BOCO/x+O6oW6YI1nhdZe8YDQ+qiJHZxUKODGBWvdI
	I9w/Sk2OpNn0TB0WEndhQD+8LfCoOUE527g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7atcgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:50:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so72662885ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779447029; x=1780051829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsFY2z5jc/JKZpx8doK+ltMU++8z2DwQdy8wREIH8mw=;
        b=Qjn1x1E+wxCq9gG5lWlLIzUISsG704Vwwle9A0LJPq1Cw/+rDcx3gBR5+u6hqjR0hE
         3e9ft5FnxSJb1yRdpBWkPJfynDL/AnanIxDNyrblU6SFMiIkTDrTz5dM7Hl/PIUuxnaW
         +i2/TWBQszpwslr8Lj+pV+TpZ1nmsj5PYEdJLObHCFj6cwJrPOjxRJi6rMMXv9s8dHHb
         /5KX1bFsMwzfwp6/xqQm/B3lcnED9YJ43I7hONSUl7Z/XZGpc/5Cxi0VYt/HUXFV+TwC
         4AN3D4JkWc/1xVYS7RvDLyhb5G3sRYqwkVZzIkxXD2wk8o3/9excc4V2qS1yJgMpli/h
         /BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779447029; x=1780051829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsFY2z5jc/JKZpx8doK+ltMU++8z2DwQdy8wREIH8mw=;
        b=MYmTa8IyPJ/qbuDFiAOSwS/1j8TjHzlPbFv8GXjlU3Ns3Rph9A2Kq1tIp8rxUdpP19
         19cZpoBJKnNMAWLwtfludTshqYu3CSNjTLTWkQZ0HIkIOBNR02wVwjbi8VBpalpBnDol
         1TDqDy9FteOr5p64fmqelhjxtz7TQONhwHufSY64CAqgv4avHehg1UpydqJzrB+XMFFo
         Zc3ZG8V6rMRXBSIB8PnqmjYgNmYtaXzuCcIrHvbPB/PMjwjTZ9TjJJ71kAPAiAtmhqf7
         lVbfj389VkM6kwfb99kMuGYjz+1sBtYc6YymE23uZXEm13A4I9sdgjkXN5GkYkkMxOb4
         Jxdw==
X-Gm-Message-State: AOJu0YzL0yk2q4xWdZTwQzHnfbuFC2vNUAoeogHB3MtHkytXn5uFSrXg
	Atk1IgnEwVo7ePisONIJ5/W/zQDr2A+2BcFYSh1wq80YiqBkoDoC1JMbB5khH8UYOvjgUIylaLS
	Au1mp3SMKYY0iuvb6D7shVwOc8ImUBahXTysUVGJHNQyH6bd+fzX75qRjo+IdyliRKXW1
X-Gm-Gg: Acq92OGEQtIteBGmMzIKzOMWQ/lY6ufae+Md1P55s/zDJfNg+ApnB6nn1+vpBgeIK2k
	nlW5mFSWp/dSi83E2u9NfqGqHSK0JTJRptxFcciQ/f4NCpqmrFkR0DUFHtAQuU6O6K9BmmvW732
	yq4N5yNx/fBPRlALyJ9CTICUiyJYwWZkfGxfOZa+e9MWXQGw1WbB1jeflB7EoXD9gemJJUwGDNl
	CBpEx5N9z08lDdtY7z2yrtWHf/KxvHhssUsW1jNdID3pHV08IjWf+nwfjYcHJMUdq/hKqZ1ipJ1
	aKKme/BQcshFGFNypajfaww22JtMSrQXqEP3LJEbPWLi7xjDe6njkJD/Vil/nbeMceg3Cpn+Xxl
	oFuGRaqHRN29iziWMByXZCpgKNNKz2OlksrZd5gVtMPfjklyy
X-Received: by 2002:a17:903:41d2:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2beb07b77f6mr33920655ad.25.1779447029268;
        Fri, 22 May 2026 03:50:29 -0700 (PDT)
X-Received: by 2002:a17:903:41d2:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2beb07b77f6mr33920325ad.25.1779447028828;
        Fri, 22 May 2026 03:50:28 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5914287sm19150935ad.79.2026.05.22.03.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:50:28 -0700 (PDT)
From: monish.chunara@oss.qualcomm.com
X-Google-Original-From: mchunara@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com, jsodhapa@qti.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: qcs615-ride: fix sdhc_2 vqmmc-supply for UHS-I mode
Date: Fri, 22 May 2026 16:20:20 +0530
Message-Id: <20260522105020.3588377-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A2OS0GiX--Hc8Fo4byzZvMzD7Wr4h3z2
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a1034f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5JD22pyS9HkwBMopzcwA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: A2OS0GiX--Hc8Fo4byzZvMzD7Wr4h3z2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwNyBTYWx0ZWRfXyPENKRdXuc16
 Rif9brFJA4ocIp/6Zy02KKUFHrzKsA+2/rySTY6WmngPgB5aDmcIZX/UKyQmKoBMhOlv0KwuFqK
 AfB3YFfhBQpg4kvhOXtjAdHSdfCNUmN1VgQSB3nsdwUai9mJG+Zb9hc8zL4vJZWXDWW7pdAcFLc
 iVORWm3rt0ZVNnAmgsM+Ej+Ycityrl9XDAX+bqx1BXZBBccdoP1Tbh9TGWvP029Nrr/Mg3hCjb7
 Jr4LLT4p7+VyZcTNR0fw1Kr90Moo6hr5+lvIblGDEKJRXNO3T7nfh9zzvga4vp7Nt0BK6De2QN6
 mHx3EQcJSHLV4fAAWMosg4nMIzoIPDhwx54QvGbgbj5xU/264Pm5mfRhbY8KhwEk3b5CIcsgGaY
 l/2REr53weX6HklI9/27Mn3zdJutrVX3v/ueb0eQycwshyXb81b+FPxZpNfn/f9C63m1CEm40DI
 RaAPq6XuVQ1ZSs6kbrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220107
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-109261-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00C675B292D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

SD card is detected as SDHS instead of UHS-I because sdhc_2 was
configured with vreg_s4a as vqmmc-supply, which cannot switch
between 1.8V and 3.3V.

Switch vqmmc-supply to vreg_l2a and update its voltage range to
1800000-2960000 uV to enable proper UHS-I signaling.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 51b13b492472..047b4efb04b9 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -232,8 +232,8 @@ vreg_l1a: ldo1 {
 
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <3100000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
 			regulator-allow-set-load;
 			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
@@ -599,7 +599,7 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vreg_l10a>;
-	vqmmc-supply = <&vreg_s4a>;
+	vqmmc-supply = <&vreg_l2a>;
 
 	status = "okay";
 };
-- 
2.34.1


