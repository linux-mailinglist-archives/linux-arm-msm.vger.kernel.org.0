Return-Path: <linux-arm-msm+bounces-106431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGRKKEWf/GksSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:18:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 923204E9FED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFFCA3042C07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C363FD13F;
	Thu,  7 May 2026 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obji58Nu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/+Ktn1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03E402437
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163192; cv=none; b=fYZtwH1s4FuRf3LxFY2ux6uLU3eHxfTUtbWYKHgBcqTCnNVpzdRAYvIakP/5OEYneG3dWFKMQY52Jz3x4jRTC/ZmUBRaj7OEM8JA62d/AHDuaHABK4cSqSGzaVutCt/kI9FHYdF27+ZBZekjZ0MtCzemBYadvJ35K4z5VDZbaF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163192; c=relaxed/simple;
	bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phleItbweUwNEIGqfUYVzkBOxP/gOVXxG/VYrc+iIpTKhxrjRdrQARsYg09fJRodxQ2elT9gxXVsJXTG1WiEKdxYu2qv61XlpquOg9uorprXecgzjC+RyJ/Jpe2TXUi2YAiZkXTgCsEgvRX8Xgensem4USUGNzQabyHIlcDf+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obji58Nu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/+Ktn1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AJTiS150879
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=; b=obji58Nu5Gqj7unu
	WszKTUNm+LSt7bdUl9WT176axS+Cx/oD0+1xmjSpd4pwd3Pn9PZhtjhGOFrV+zvj
	SwaCSHKGJD7NifcMNmOirpG6zovXl5econsK0Sj6aiJJybAp4QN49G7FtSR6tAKk
	M/1nsn9SGrGNSHQfKfr8H5psRxu9SZtTbBVHd1p9MZdqHmHmmSx1MQ2YRDa05Dsg
	/0MliZllnnoW1OMiTz7DD9AKFFf1zU06+iOs6R63eA8dT9goccItGRtxoPTIATeT
	O6DwrBuBSoshspgE/nYtH2R31ypBf6QSpEDWWCEYJ7pgxZcZnJUvFPNMf+naxmKR
	S1uLqw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctt68x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:13:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7ada7b25f0so464486a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163189; x=1778767989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=L/+Ktn1xKN2DBlzrq9XHS/H0+FJDLnerp16WzJuBhKeLgSh37zDN8QsaTbA5pbvZIm
         GSuhNeaIi/bvIKxTZ/BqJl8YVOLAw1eVc2aB3S2ASPM8xBV20TfE/TD4MnJ1WXkXs4E8
         uXwPhYcgmYiWStfaKk1GoP3pMyO88Rps+wRsvTltppojvakB6q8kuFW9H6H0OyhnTFkt
         +pkuBcHPZVl7PE4O5N0vowJgvEKHOLTBjama+93WScYNlS0SwJKYd6iaxbKtbWizh+rw
         cLidj/jN+2y94I3S6NQDzlQRT4n+WvtDoPklVly4B3K1N23caJWOFV3WzIeVqZcALK0P
         NKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163189; x=1778767989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=GeJlgGX7Grm4fQ5BoNn3wJpOaLJzkuI4ltiXpB1W5YKz+EEgSF8JUAYrx0UebRZNjO
         0hmKv1WIxrtPuQ8z5NoQiG831VHiZGU9nE627yjZNvH/LYVLSNkqc3d2IUfPgyjdLXqd
         xO1HiaLqRd+BTuRwc33Vj6YfUszKoyWlKrvafYDwgIL8tGK5kKOM6vDdKmKSfJJ33TH4
         BhMLxUkv33CnxkMXojZYt7jwUknndg3BG9RWzV75f6J0dBQUzPiL+GbpYkzPNR2ZlVko
         vQHZ3jGYjBeKNPYAn1dAYezfOdQ1fMFzAb06g+DgLWkzsZvWx+OpWqH2NfbKEyHuzgYH
         NM/A==
X-Forwarded-Encrypted: i=1; AFNElJ/5qBgaRF7xohHscU+sMLIB1o5KrVVqz3twTvfIiExQUl3g/0H5ngsbgIM2DxMT+llsJxgWuaekdooqk898@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3eJSlFMXFcERr98sflEZLgB2n9dvnBmfplFJos0vGK/Wbi4E
	s/nYEkhHpUb7sqii24gJcyaaMBKD4kMXqt+BganK7cpyh1M12aj0mZEBCoHAbyC/KWM44u4XRM7
	Dt/A/MeQp3UmIzO1DdfHY8HPaqrZAjtAWP8IFHAZb8LnUsX/z36zQb24qOYUz2QctY7IN
X-Gm-Gg: AeBDiet6jl0qQ6OW1xm2ljm6cIO9N2sxH6z+j+Pmh51dCrM8zWe+4+e1++6pCwv+34F
	yTzjLIyHS28rOCQpJT0wUD2iys0DW37+BLZqyoUSPKb5odOPMwE6ifE1eFArOP/s0rQnOEjvcPH
	uk0O/L2cb0D14cYuNKnOlUn2Lq2KLZ/yDkS61IbG2jbIinY3GrneJ+aPUmHjFAA1qKEZj6O66pj
	E2gZ3Cp0keDRry5zcoksYoaUkYIapQlhMtGlgW5A6y3qSpWMcpH3jIMZI2Jg1EoNkWWwPcJG843
	DsFz4QQEN7ZEIu56Z1Vd6limOmpv/Q2Ljf6LBA7lqr1vTjedFb7U4Gd8r5ZTC8athUWL/wM/x5u
	llMGwqPV8gMLmXZ5QacwR6Ny1cPFFnBEtU6ard6NfFQcGtmWyILc053xrslzLocfMv9v3Gi0yg9
	YDMP6B3Gwjl9FECEZrAIM=
X-Received: by 2002:a05:6a20:1591:b0:34f:14d6:15f5 with SMTP id adf61e73a8af0-3aa5a934e9cmr9687597637.29.1778163188795;
        Thu, 07 May 2026 07:13:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:1591:b0:34f:14d6:15f5 with SMTP id adf61e73a8af0-3aa5a934e9cmr9687531637.29.1778163188196;
        Thu, 07 May 2026 07:13:08 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:13:07 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:12:03 +0800
Subject: [PATCH v18 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-7-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163147; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
 b=sdUjel/sDCFE86TLQatL135VVmhF1NPENX06ZBgfvs2tIhWEvaoHw5CuGwyXPqG1yiqTdbiLh
 /Flw6geY9VtD44J9V2RyI33NtrFE1YU/yPggQvfsQsNwzrZmJDejfn/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc9df5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: GCYCzFTfKGjkGvy9fmq8mGi7kqfa0c32
X-Proofpoint-ORIG-GUID: GCYCzFTfKGjkGvy9fmq8mGi7kqfa0c32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfXwv50PYDWUCLb
 atpoy3wFqAYf7M1CvzoJaMKSNL/FNolKFzczoW6Wem4TWpKMVAe2h/nkcBIngnMxZQF7wedyEjy
 XPM8FRajfpkYwcNeTMNQIAO/1beERNqTPjpQZzhT6KHV23Sk+VFmdTC+mRDOpzEPQA6t2og1OPx
 B7WoudQDx04W3bDtre9pN25BC+shj+nvS6dFkyHjRlau+VLQ0IaNiyu9pAn9KmXqypEVZvWx0Ko
 w6B6DhQ7pRR9JLmTXUxhDSH1GuzBnMFjhV6wC48mP+0LMapqbkplqtF2/BubGER7Yl/GtoRcKBw
 8zAm/7vit9IzifykLR3laekrP1Hn02m2JwLeIC3E43OgJ42CTT63rnnxj+WoiC66Y1ZXv8YdQTt
 AyzzqJ3Lkco1h0THc5B5xu5sruPcSnm+8qI1zirPLCCv/XfP9F5AE1mx1/f82ZA0h3EzbzTA/aE
 JPhOP0v68oGKnV+Oocg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-Rspamd-Queue-Id: 923204E9FED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106431-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.61.12.232:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..2cc855ec9759 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


