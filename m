Return-Path: <linux-arm-msm+bounces-105682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD7hMExu+GnPuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:00:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D64BB595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC1033007BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C0938F258;
	Mon,  4 May 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jK9ut4Uk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqvxowdj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54262390200
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888832; cv=none; b=EQHGDKChjrnbQZmQ9SXl8OOcWPCqxHLaBdYQeOS/CiH7HZkV5b5kmq4wexDs9xKWHXzF0YQYx6nlo7UJ/oCYR55x9tTFaYvcaB+kHe8XWmJKhYuriS4huHwLzYYdYx2IcYy2JgLTiVk+ATVOgzUFAoW6T2wBEaTvi1Ou9aMd+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888832; c=relaxed/simple;
	bh=VnD9jdvKPvG7glRhxASxKCNThJUBqzwvtoYewjlEsII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyRkYPcUiL2YpMetZ6v3a8713G4QB5lcd8j9JyCqiSNxiDFF8W1Ji0mux5CQpGgJShjrf/cBq0tIMn9wH2Nx9rHtl1oEem+cQBxLYh7fQ849EaIRWfmubHEG55WiBmhkouKx1X5fz1xTSMKJDBOEkpegftSZa5TL3pAymk8Faqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jK9ut4Uk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqvxowdj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fKo72777142
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDbLe9bSNnTNLNJROEag6joMnDPk6Ll32XnlgfU4CME=; b=jK9ut4UkiXuNJfJP
	uqiPox0nTN34wGmu1N9rVQMUsASvwlAETSChK3S9YBNycrPnrRoUJ5ejm34HFpU3
	kcfuqBXybHGTmttMdpXAQq6NIbkYj6p0ISHj1/ny6MEoqwdE857rPjDT1z8d237j
	v/JuqDfF/0d2JGJPoocGfkwZqnOrl4tRjKFuWWUZe+o5oKiqEHmG7086WiNR36il
	Is9Ree1PUZjY60EZnHDsXzZKBzbt4Ze/M5mRl2Y5g8GfRBfW+B7LzLsWilUi5yLl
	hTyARA9uKuTvMJL2BqcuVkeas5hXaCFLuiQkPAPHZVVtrLyF2L+WtuP1pBSOcj1+
	7oqZ2Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaj7d5n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:00:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acadca1ac4so113149816d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777888827; x=1778493627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDbLe9bSNnTNLNJROEag6joMnDPk6Ll32XnlgfU4CME=;
        b=hqvxowdj2DWhZj2SMx/FKWXC6MfHhrOsTmr3DdFyHMlixjtgMzV4utP60Uspc1tWbm
         XhA2+WGU0u+KHVY0hRIHHXgi31qloilRDHOTdnpr6LnHOp4PbjLhuvRicXVlq5++Dj/D
         nX7Ojm+yPKlYOYlBsfcqKaZ1n9ne9MCIFhSGLBol6x4AdG4VzgW9zFLhyWG9GnDXGG3q
         mj8QEaRTWQ48mQd9FcOkIQX4t8dKguLEKHwiFyUELGkAtea02O7RXg3+1cc45tQtincg
         U5c0+9xdBcrZ9tDyJt88e9leuv4zRVv0IOV+LtMN9IwN4OGUaoHkNtvjNl0w8echRekM
         iQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777888827; x=1778493627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DDbLe9bSNnTNLNJROEag6joMnDPk6Ll32XnlgfU4CME=;
        b=rhnLx0G8JdU14S7Cjr+PbZV2KS5uZsCwKJva4UZC3SNuZEYmqRt5z5tiwXH7psFnjg
         ugCEVyFGcQfg8AYybA8gWTBG6DpeIjLd8BeOTuKjlsCBdeBiJnJEGZRfTh+IT+YNSeeK
         lYZBdEEaC/RC0VIgAeel/Ij3Cvb0Fow67G9h7cGepYEbDIb/6guW6wA6WEbAOtEFmY40
         V6LVLizWu3Oj3UW5RCVgUbCKRDjEuUhnd5V460SexnmU6UQmH40SBCm5VIcuBThADI/S
         l6ze4MLQaHu+Qrwidak94+X+n/dVKw7oYPsB5QoLmMZTBrpZiHVJljJDMmClwg8JjWEx
         vWqw==
X-Gm-Message-State: AOJu0YyhT/6d5kSFKlOFYyaaWpXYjm4OKcMwEH0cfIrqG2FCvuubABB5
	W4t7o3a/azzWafUSwJRRIyr6L60CkMmqGSVsBfFwpDx3TwvgVYWFEMiYM+XurcWTGExcK0xzNFw
	cjUK7YMI9KjQfwRP05i3Wqs22Dz+65Khu566Vku7qDN957HvWhzaOwPVSQH9ZRPm4BXA7
X-Gm-Gg: AeBDiet7CeoAeqPY67yAtAcgwDshUfiZixQYPGhKp9SMjMbZgZS3SuNpQaVgoQKFT6/
	O2+cRq5I5+zyCY7uKmb0/TOc5Df/esnTrqd+PvRvvq3Z2CFcdnk1OjQPFcy88DK+FnmLRsDLjjv
	bclHQYuj2RD/vCtWUZVvKKVkwPo+BpiKxNZhiq16HlVQNBx6E8jPS9O50eqzdOTK6C8wa0NIE6p
	cTIojQUraChMV1YEMbZkHfHKv8Zu2610dN/qC6Ho9jnALN3GKLNICxp5UeCl8+znqQ3BZFizytl
	lP40m/9kTp7n76bI8owwrINHkufBpzQPw1Btn22nvINYgnSxUELZZXtV1fyjei1FzY5t4cMziC+
	WQ5FW/wHEemRpIQZeT8wqLRx8pI54Xb1qC7fQAPfs
X-Received: by 2002:a05:622a:58c8:b0:50d:db76:55cd with SMTP id d75a77b69052e-5104bfae184mr125610691cf.52.1777888824902;
        Mon, 04 May 2026 03:00:24 -0700 (PDT)
X-Received: by 2002:a05:622a:58c8:b0:50d:db76:55cd with SMTP id d75a77b69052e-5104bfae184mr125609931cf.52.1777888824263;
        Mon, 04 May 2026 03:00:24 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm324355955e9.12.2026.05.04.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:00:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 13:00:08 +0300
Subject: [PATCH 2/2] soc: qcom: llcc-qcom: Add support for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-llcc-v1-2-d7006c899812@oss.qualcomm.com>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5225;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VnD9jdvKPvG7glRhxASxKCNThJUBqzwvtoYewjlEsII=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+G4xusshIRi2SzPrkoTMN+ltX1kAIntvG7gif
 2eK+I4rRJWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafhuMQAKCRAbX0TJAJUV
 VutlD/4vw/F+zZLmRvGvdy0xCfWWPhRt6eUtYZ8Wm9t8hIW61rX5erz+qk3vWN4rsIT1W508kDn
 kNPOwjGJeMCEqXkL5Oq0KVTMA+w/r8hxoJSIuw8UD4aVTQzZ5upBMz1q841SkBATi8b4HdLIGXX
 U4dSfV0OBaeKvPvnP0VDDUXE5da433i7BqrjKfbRkLcTrtf7wmINHmNuGN3xdDyogq1Hp00tSL7
 JYvHgjHOM/uvVR3y6yLCgbuLFDl+XCgRgxs5bH+TIwd0firnPOmxAgwI4ew6VOswFIvDoEJJH+k
 bAr8oOQjyPrYAolSMqnKrI0WGm2/Bva05/wlwRKd7MeqXjLAhXczpJIvHU4CB8xv6KQMekYKI0h
 u8a2dPIKaACXXIE/AoGtTJ3oMzYPpSuBdAzZZ5uN9zs9zitLocR+Gn9WTLZu1Kp3h+9sXLguCyK
 pAHreQVKJMx4TgDsHkUCJA/7lpJcj2LTr8yNjLJQfCjKTPT99c6U4M1avtnUEogXNFkkFG/M4ma
 IbPuo5DvS5HgXPDITifE0RzuzWKzDkoRtbv1JL42VOHIqNBltmHzDwxphmOLm7KoTF1fiqojRcO
 b0Idwqh0U/57InHki+f1FBF639apmLvUxQzkDI+W+gtUo1y6b9rtoXE6cBMwxPunqgVK8KE0i2K
 rnoGnPaskm4HLgg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: FEqgS82djD1CVHl8N3BJ5EH_tmI91rk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX36ubDWsX2Qxi
 afhTIoT1cKUXCqSQ0tSqSnSU6h5asYgtEBpGA4rZmJqfBmBPnXhPWnRA5l2k+Ke6o4fD5luxhDg
 bc4i0oVz0LT3wIua1vm5GJbM5F0xxtOP8MSkjHvMD7Td6vvw2+UOwGhfgd1EenR4MWRBxIjndta
 8RF4NP8XodXlUHS5VfkmL4u8XhH1tgKPtjpc71jqGSdecG385IOUXcLWxSgWt6kW3CDLMbRliNl
 BCbVYnMFFBUUfRYf1Kqx3/wWbsN8yXgR/nJu7ylSIOGzPoR5MwBfgXYw/N1ps68KOb352UuyxjS
 bI4XzbpLGKbsDX6cF8JGvLYaw7R1Snm5K0R8KjSPL1D5UXTkLH4J+EFFSzMKsEkyA5lr34KexhK
 CxA7zb53tsAlwOAxtDMjVvioBY8Vnc3Px3umrN9ZzlG6plX3/2tiKH/iVUj4HMcn7PpaJ2Qcay5
 USroN5BxPQ1eQ8KO7qA==
X-Authority-Analysis: v=2.4 cv=csirVV4i c=1 sm=1 tr=0 ts=69f86e3c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=H1N5wm_QsmpplRD-D3gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: FEqgS82djD1CVHl8N3BJ5EH_tmI91rk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040105
X-Rspamd-Queue-Id: 821D64BB595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105682-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

Eliza uses a 4-region LLCC register layout made up of two per-bank base
register regions together with the broadcast OR and AND regions.

Document that layout in the devicetree bindings.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 180 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 0161ceec8842..7c05cb3619b2 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -181,6 +181,171 @@ enum llcc_reg_offset {
 	LLCC_TRP_WRS_CACHEABLE_EN,
 };
 
+static const struct llcc_slice_config eliza_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 896,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+		.stale_en = true,
+	},
+	{
+		.usecase_id = LLCC_MDMHPFX,
+		.slice_id = 24,
+		.max_cap = 1024,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 128,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_MDMHPGRW,
+		.slice_id = 25,
+		.max_cap = 1024,
+		.priority = 5,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_GPU,
+		.slice_id = 9,
+		.max_cap = 896,
+		.priority = 1,
+		.bonus_ways = 0xfff,
+		.write_scid_cacheable_en = true,
+	},
+	{
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 18,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+	},
+	{
+		.usecase_id = LLCC_MDMPNG,
+		.slice_id = 27,
+		.max_cap = 256,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_MODPE,
+		.slice_id = 29,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf00,
+		.alloc_oneway_en = true,
+	},
+	{
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+	},
+	{
+		.usecase_id = LLCC_LCPDARE,
+		.slice_id = 30,
+		.max_cap = 128,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+		.alloc_oneway_en = true,
+	},
+	{
+		.usecase_id = LLCC_ISLAND1,
+		.slice_id = 12,
+		.max_cap = 1280,
+		.priority = 7,
+		.fixed_size = true,
+		.res_ways = 0x3ff,
+	},
+	{
+		.usecase_id = LLCC_CAMOFE,
+		.slice_id = 33,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMRTIP,
+		.slice_id = 13,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMSRTIP,
+		.slice_id = 14,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMRTRF,
+		.slice_id = 7,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMSRTRF,
+		.slice_id = 21,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CPUSSMPAM,
+		.slice_id = 6,
+		.max_cap = 512,
+		.priority = 0,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+		.stale_en = true,
+	},
+};
+
 static const struct llcc_slice_config glymur_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4141,6 +4306,15 @@ static const u32 llcc_v6_reg_offset[] = {
 	[LLCC_TRP_WRS_CACHEABLE_EN]	= 0x00042088,
 };
 
+static const struct qcom_llcc_config eliza_cfg[] = {
+	{
+		.sct_data	= eliza_data,
+		.size		= ARRAY_SIZE(eliza_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config kaanapali_cfg[] = {
 	{
 		.sct_data	= kaanapali_data,
@@ -4397,6 +4571,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
 	},
 };
 
+static const struct qcom_sct_config eliza_cfgs = {
+	.llcc_config	= eliza_cfg,
+	.num_config	= ARRAY_SIZE(eliza_cfg),
+};
+
 static const struct qcom_sct_config kaanapali_cfgs = {
 	.llcc_config	= kaanapali_cfg,
 	.num_config	= ARRAY_SIZE(kaanapali_cfg),
@@ -5238,6 +5417,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,eliza-llcc", .data = &eliza_cfgs },
 	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},

-- 
2.54.0


