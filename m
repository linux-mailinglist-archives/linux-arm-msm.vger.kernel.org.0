Return-Path: <linux-arm-msm+bounces-96226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBXBIXirrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:14:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B123237B02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10A9B30300C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D768399026;
	Mon,  9 Mar 2026 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdFHlEnE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnx31/4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD06939903D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054807; cv=none; b=bdTFBVU7RZE3n9aB+U1ILt/jzUhdVvwWyPAMGfEHKgyFMN7YLFgxNFFFI7XPHD1A4whHq/hZwsbna3sOyy1RL0GdcaTqvXX0Jgp78nmM3LyHeQEihDeDbHw/7/5EMxuWiQ0aGrqp4+j5qbl408kmq61UjBwv/zvI9Jlcn7YCYTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054807; c=relaxed/simple;
	bh=aUGGc1R79TGDRJpaHjpkPVJWkO+5hdvgG9goHILcC2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pthLyHpMTik+Zfa43ftlRVBS/a61Bw9ObhtUYziHAlzpd7g3TLpEe0qA2opBKgmJ6xstYHivdxPBfTdyegIQZtvpgW5LWdfknbiEhpjWFP39N/0NWRCkk4ucHcr5nVJkLR25zmBkLYpt97eB1Sk3a+yGZ8v97yB2w261AQUePDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdFHlEnE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnx31/4j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62986XmD3462759
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=swzqftm9DT4
	OQqebBu7PwB37oXOhnBtbstH/+M6fp3Y=; b=VdFHlEnEP5W7a/lwqA5P8Hv9DFv
	UX+PYfL2enVYwv6T7difwNNUgBTgZsEifSasj/hQHxHT6kEZ58etrkKOACYTd8Iy
	o6TQF18z+V/51qiRXWvwfYpHGQhbttyFi52Ec9chfb56X87LYKXom0azEiE2U0Fm
	EHVlTqP20kgGv9RmgoHW9yleLIdPaLSFI/SeDgZI/JOcy6Ilu89d9KM9GJ76+Qaj
	XIdVncq8LVKhaV7CYdhoiFpKvb9zPMhwxmGDGCFyUE13OsWPCI5vBdG+ftR7nbSb
	X0S6QIaJuLCotHk/7R86IF/XQson1T2DSFfkh62L0mxo9s8tjeXEUyc0skg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8d2cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:13:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae59e057f1so86168685ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054804; x=1773659604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swzqftm9DT4OQqebBu7PwB37oXOhnBtbstH/+M6fp3Y=;
        b=fnx31/4j9E93QPcUeM43XWduaiZYAp6dFn43Tq2cmRc2N4y3tdSTju7+CtgRLpoQLO
         SjqwhQda1X4fO3ovrYUOpXpyUmTkbXio5L4QhCrZ0wj2Hm92eBPaw4CoDE+1fLl+a7zG
         1+5qXUYuIPbhNPSpYglJ80SweMj7qdWJ5Z5QDDn8echNsOAqzGPARFda1L27gnKZqWjq
         rHEtDpUyKCr+1WBWN9pO+JO9mKpLwYgQ/9ycrgPbw1LXMDJyKg8iCptUhosRNC6TE05U
         REbXL2YAgYExMJaTDunAMlZcLZErE6G6MDyD9SRvcKn8ltakqHta13iuEMXUv0C6g8wl
         nL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054804; x=1773659604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=swzqftm9DT4OQqebBu7PwB37oXOhnBtbstH/+M6fp3Y=;
        b=MQgvreSI0PO9A0Aley8F/hm7z0BvJ/YaOQ4gA93yCmfxR0FxOUh67N9l51jg93RFHJ
         xbfvtLHfZ8r4YTNzqdEZE5N/J/inO3ridxEzsy/Zl6Uk2mM2siXySalDpQpq+RI52JV0
         AftdTHYeuAo0f0fjR5r/SwreUbmWxVIGWzyDnCIib6VxgFHkvGMb+tB3ol50QFLWcS4W
         cE08DduoikfHPvd172Qp3OVTR9YEvO0lKia1RTVKI8Pvl+RL5ANOTUYu66Z4UhWmxVRI
         zK+ErMgpRcFVsMIdgEKn4VzdEg34rnyevC8hHFjPeBjF1vjQ5o43WE1qRhlA8jMGW1ng
         Gv5w==
X-Forwarded-Encrypted: i=1; AJvYcCUQoKu262sPCu5oeJgSG0eZ4sno4OFmjvyt/LE51FuqnVYHRNTpW/UYQoMPWeHA1xg/XLpp2bhg7brUzYB/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyac2EJiuyEsuF92S6ZpFJlVI5PjRhiwf6M0vu/+cLL67uJv6H5
	a1GOpfnzpiWgJYk2Xh28YRgzyFMS49A19KhzTmw7o2rzoZYpS++u8AqIGB+p8deYhhd2I0txyEh
	wTUcrAwDbJ6b/olEhRwUIRQSt3V0Q+d+uqvnPrCoNezNKxnhyFML4BWjlxRS7HFMwJEwA
X-Gm-Gg: ATEYQzzT5WDF8GJF2bAcDPzk47GTzdBnXRsRmAGTo7rTC/K2W+iu7z0ppUALiQbZx4R
	jotNeIvVhGz28r7WNQgcAuq92rBs0CPQbdH0R4LYErFSjahJTl6SP3kAIQuXW5sP9oQhv/Fdr8B
	sgTMIfTJVOzKapvQoXtjGjLQt5q29gYxEptTVDwCc/AhCLMVp36tHTB5AbngKCTWZOJFtduL5Ke
	UsiJUmy2VLKqq8HMGQ9j0Dvz3mD88orSAXWXiAYpwCRIu8GBKwwsaaNkBVPeZ4GIgjBX8U/xn22
	X7ofJ0PkwSOpZrGOl9b7nMB/MOdYTwrK3DsqvnMNhQLJOLz2qO2xMW/5EndA+DhWso8CEWUNakb
	f+OHDSQ9ksxMuRD3B4PlsejJMCFTBjVvfiFnME0VWM9pkzO6a0QqZ2LCbZA==
X-Received: by 2002:a17:903:2b0b:b0:2ae:4f2c:624a with SMTP id d9443c01a7336-2ae824b8531mr100399555ad.54.1773054803515;
        Mon, 09 Mar 2026 04:13:23 -0700 (PDT)
X-Received: by 2002:a17:903:2b0b:b0:2ae:4f2c:624a with SMTP id d9443c01a7336-2ae824b8531mr100399355ad.54.1773054803060;
        Mon, 09 Mar 2026 04:13:23 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9967sm145405925ad.90.2026.03.09.04.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:13:22 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v1 2/4] ASoC: qcom: qdsp6: q6prm: add the missing LPASS MCLK clock IDs
Date: Mon,  9 Mar 2026 16:42:58 +0530
Message-Id: <20260309111300.2484262-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aHxxLP61ftzByHncknmyIsXXHdb22NHx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfX/9abQku0cIKv
 OsfdeopgcyvP9xeDnNpfCxu5ubg6IZqWoJGhMwvf1nLotSKsSVBDp9DGxK6f8HatWNUd7IbLs6s
 04Et219yV8GCWHK8z5LeHUj/RDgyoNqm7e4faZE+Fp8iClRf7f1bF5Ly545uAfcFsP0hYn3QS4g
 bjTyDtAUPh8nm3rnGCEpjFMBs/9mFehByDcdpAEJdjjDcFWik+ocP3sEtz2kcOXrZF4LeIVJ1bY
 YUcywo13hjo2OXB2QhTMV40zYpLG02CY8d7V5mch1mqC9YWAlWK6XexFSSBaeqk5tJ2iz6+Cp6a
 WLnmuPUh+5D00YznhW3hs4//tmzIYgTexiFYNke2bofxLTgxZAcI+wy4JGSNPQa3xzyl5naFaNI
 fsonFLHbWqZMSvkhoCRxxtWdrOGnDci9VGHPBWZHp0DYHJWswLCajhWGqWIpG3jBtME4jXkIHtW
 +j0OZ6sKX+hEzmnPa7g==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69aeab54 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=xa-b9-zz7eJBtx3xZkMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: aHxxLP61ftzByHncknmyIsXXHdb22NHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090103
X-Rspamd-Queue-Id: 0B123237B02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96226-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.994];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the missing LPASS MCLK ids for the q6prm ADSP.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
 sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 4c574b48a..51b131fa9 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index a988a3208..8296370e3 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -52,6 +52,17 @@
 /* Clock ID for QUINARY MI2S OSR CLK  */
 #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
 
+/* Clock ID for MCLK1 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_1				0x300
+/* Clock ID for MCLK2 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_2				0x301
+/* Clock ID for MCLK3 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_3				0x302
+/* Clock ID for MCLK4 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_4				0x303
+/* Clock ID for MCLK5 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_5				0x304
+
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
 
-- 
2.34.1


