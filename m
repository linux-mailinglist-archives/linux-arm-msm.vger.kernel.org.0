Return-Path: <linux-arm-msm+bounces-93693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O/cEexZnGmzEgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:45:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A826E1772FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F3913124DD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6356A246781;
	Mon, 23 Feb 2026 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KV7p2Itz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W65VyuQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622B22D4C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854018; cv=none; b=SMuVlhY1P4X6M2KPBjBur47Ome00fblRt7ZbHKlpCe7EN+QIycR5LehjxscL0jstxfBQBSuql3qdfwLjryc4BuN7mOikKZ+PJ1alRE8rRHwzuklUvxnLkNzmj3B6W31dWwfZgZns3742ZOiUB68hkqO/BfacNPuT9f6S0hu+f6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854018; c=relaxed/simple;
	bh=cJWzJCJItZa3LgWHGCnkDXAGCzpA1dECNXyvAq4F3zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqUHeYPbAk+ILxm2vP5Hdz2dhr8XcQ/edPVXEwf0Bb3/M9yDhnSyFcOe1gXCVLCxTEqI5z6vKWMm3tjOWqlX9F5n3+BeaE7Oe2g8HGepYbCClNOadMIgBT6FuQT35CT19lZOd40U1XVNe5S5yT284xVGMgvaLIGNO2j8Z+Uu/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KV7p2Itz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W65VyuQd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NA8EBK2565272
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qMP1fnI46/G
	pEFViRkVOwbLoNKl3yFGnh6aCocCxjF8=; b=KV7p2Itz0ONf60R2CWGvJQdam9Y
	kn6EYOoM8QADJAG4kwPF5P1KgT0vYgzaRO4KPCYmPef4varinCxIHBrUM+tD7LDV
	DUwLKoLhGipjlGJH9AwCUT3epLRpnkAQ9hYZnLINm5svfkodMAGIxV9A+NHsUOa0
	clsP8uVVHUCgaCrkXJjPL5BdFNXeFDrV2waaqBSBUohP5qKDOtmpvS1FTukViRR+
	a99JfTIZCoU9XxgLAT9oLugWcP+O/BARXgEWnJAR2iIMLzrinyapqI0pqmdLEAvg
	UPtsvCVgJrCMt7/ADGdxtp6vF2fduOwdlS5DQVeuABbdP5HQPexw9RDEFgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyvv1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so5470265885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771854010; x=1772458810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMP1fnI46/GpEFViRkVOwbLoNKl3yFGnh6aCocCxjF8=;
        b=W65VyuQdy3/isDIbLk0ZH79W/kRH0KR+A/AnvsV6/C3FHzFUd2xWnZVbvRF3HWSDKL
         IAAznkuEaLM6xc7YK2zfZ8HhUx2rdqUC/kwzZUM5aJtz0k0F1+erf4YwOgi0a5Q1G9rN
         +5caNObOO8gOhkuN+TaskCkW7E6V7WcpyOjk+eGcDrN7/v6h5/7zcKFcahFxA00IpFA9
         GeeYQZggqIImYryTq3p5fgIknJ7szbnqx5bRxDpPb8ujlqVHkEVORo6qvcmGWiuWAcyo
         ywW/mdKVMyo4ZpRR3bNG8SJ0oOHsa6MXfsrGfJf/U2UwYaMjEEzxybY2E5Oi78r3nr9n
         8q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854010; x=1772458810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qMP1fnI46/GpEFViRkVOwbLoNKl3yFGnh6aCocCxjF8=;
        b=Uv2RwBaNXNV6myfwf6Fppet7tuOQIAExd3HqDWO8e0/o0mgdkbe8ufBTn1qaLQ6njK
         pmkqhe66VKks31+SPj8fca8qRAkOjJSBOmsZTl5GivGDiX5zdl+oSV97mx/5EQZbKxIE
         tuurBesbLs4H87lMHRaK9X87ZF3ce7yHhlme5kBG1fn1KBira4YUWoMA+YT6LJIvL7Xl
         VL+PI9NU9WPHO2aPOe4Ryxy4BQ7HY3NxXjoMgyUtthWX53Jh1+D0Bt1xPP9bULMA87Hj
         aGK0heJyPU5hQS8p7ipIc+hoMx7bpkqqaZe+TMylgt706kT7uUZGCZcrLuhHCm9MqvQG
         bhmw==
X-Gm-Message-State: AOJu0Ywa8yGeUqjdj5DXKQrBDTqZFgBgWCvZOlyqVqStin9tRrltEEWi
	qix5Ai2fUtBuDFPUDxr6zUKECv46EG/fr2fAItNjZKE1JAlfgjigjrRtPi1U+X/BKbPa6jTLZdD
	TZY8HUXzZ4m8vIzFAzYq03H9RIgE58G/3jEE1k26tk/XIU3/gkeB5BxOUgeMEldj7PsJ2
X-Gm-Gg: AZuq6aJWZdrLW++ntwXaOn77CwuvDFwsVuXyuhCJ9yw5UkvdE8/WYZF/qSdxZyYylVE
	VtNEo1iJlosImEp+o1TDcQZFpDFfRijxsq6hY7t+Xxb5HiiPHrOotwByPKku0b3Ud68OGOK08dr
	noMqY2Ci3alrtg8kC0jLWy/NoFrSduZftxpfHLy2qto5q/u67rVUOBaD0IaP7I3D/O8oYKp1vr3
	2CoVG0mJepoZQ8Kweo0EN5Z27wRAGL/JWQpUOLfbGQPsqJpWm1/LgWgFg+bfw/v3bdR+jSKdxTF
	96hAwe+oL+5m8qAlJL7cmjBdsR9DPbFP3rA9kDbH2MiY8kyeyYlX7icxO5IRAuM+7A0GXxezjDu
	EWVRCXIFI5kaT/4SjbFwC0O6zkQpVHfwwOcFtcemSSbPudbngmPZCd78=
X-Received: by 2002:a05:620a:46a5:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8cb7be3b844mr1673811685a.5.1771854009950;
        Mon, 23 Feb 2026 05:40:09 -0800 (PST)
X-Received: by 2002:a05:620a:46a5:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8cb7be3b844mr1673808385a.5.1771854009509;
        Mon, 23 Feb 2026 05:40:09 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm21323985f8f.28.2026.02.23.05.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:40:09 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/5] arm64: defconfig: Enable configs for audio drivers on Arduino UnoQ
Date: Mon, 23 Feb 2026 13:39:50 +0000
Message-ID: <20260223133950.221234-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX/2AO3It3Y1hU
 72V1hWFKihqKEgurDbhU3hK8ZJIhMWd0W7z4/BYseju1Ep47kULv0t7dtU6bj913bDnA5NA8ntz
 kB5429Ya74gzILit7kMmvsjWU4+Lx1tfEaSnxH0qGnjs6HW86rF6MkqkA+BFakYvIG8ucUZuyj2
 ZHpHwRMAqQY43PAqVFVeg8v8Wr4zvP+S4q80D8X6VZhXuM4WU4BpMNy2h1SC2jVl+awdG+V3zK1
 dkrojo/1t9BzVyuwX00IpcYV5EOq9PPBpHvXkUjhcpW03/yNzMSuQq48E7hTqvvikN7cSjV2htM
 I+eGgZgFLqbJlr3B75n7MOR4uTBFPdHA+qycYR1pMhGBFk1lZmioSHVSG64lb+PIY+ih5xVn04N
 gv/o3zEUjpVzK7Ga9aw0QBeJIrVRKKlAj1EdqvoYEULg5VZ2Su0tV/p0Ln6HfCCBEV3/oGoLqSh
 oOwqpwphaqZR1abci3w==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c58ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: h_hQiZL7ZeCI5dXNDLDqUbtxhifWjHdq
X-Proofpoint-ORIG-GUID: h_hQiZL7ZeCI5dXNDLDqUbtxhifWjHdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93693-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A826E1772FE
X-Rspamd-Action: no action

Enable reset controller and pm4125 audio codec driver that are required
to enable audio support on Arduino UnoQ board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..6db35c1605a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1146,6 +1146,7 @@ CONFIG_SND_SOC_ES8328_I2C=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
@@ -1550,6 +1551,7 @@ CONFIG_SM_GPUCC_8350=m
 CONFIG_SM_GPUCC_8450=m
 CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
+CONFIG_SM_LPASSCC_6115=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
-- 
2.47.3


