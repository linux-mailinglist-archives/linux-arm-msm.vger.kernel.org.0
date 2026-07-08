Return-Path: <linux-arm-msm+bounces-117789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i2svBViWTmroPwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:26:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 789CE7297C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:26:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B8fRddtu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BdmHRHT3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117789-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117789-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DAE1305468E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 18:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6734D37996B;
	Wed,  8 Jul 2026 18:25:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3163D37B032
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 18:25:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535144; cv=none; b=p1h5q/pQ7ZBeH59fCyXW7+l/e/NLtIBcpIN+KUEOdSUPIwmU7Midil03LkCDhIVPIZwyhA8tbXIClFvxZA8/XAtZ/Q84U0TcnSZLKKvLvsAM5xIw8VhzkAlprvyYEmLXO1hSCykT/rCamMyLL54Gpy51tN9ezENcj1A2xjMfUnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535144; c=relaxed/simple;
	bh=HpeAEWZwctd23qPrDJQucwCkCmlvNsKWN9E+yZbp6pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cu1bxCNFXY5wngZKj4NeV+rhWq60JhNZShb8+m7RJVrURLqSQY4Ya7DyhyVxpMgD/4knaLhs5dMjNjl5i4KOedwLMpQNjvzUTL7j8DnBf0DakFEtVIG2qjdwaxt6r7UP43NfgxkbBb/tGrcIyjlpRiSmM0zxs6g+N8LFi4z9C/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8fRddtu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdmHRHT3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLLrA3387200
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 18:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oadDjJBRgYK5tR8AHh8ohqDa4ddWrSWG7Gn1xGpFy50=; b=B8fRddtu+DSowByw
	jQw6ibusioC+ibtb6D3VlhMJdpAak/GISpluLLAgS1uwYopJvzLnNL6gGlGwnPYU
	RYlObl2Hd0ahY3/7v5o9I46HBqPdWPBuWrs0jq42k1/aRTqOgQQiBdXGwQ5yI22S
	MaWQ19FBMHx77XXNCnGmrI9DC2JKeWI73c+Z+q1R6VAe4WlUjfz71qhnPmb4KUpf
	0HuyU3Q8tkJswtbXNTzjFkJKU/usyaM2IkKljxyOlLPp7Mi3+JWgmG6fjA0gdCoI
	NPDiFIDK+rqNe9HYzuoWXOyex1JFrZedNEZO2c//PezUTfz4Zi5U/NIbSRDH9U5r
	G34s7w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cswc0dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 18:25:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848415e9e8eso127746b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535140; x=1784139940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oadDjJBRgYK5tR8AHh8ohqDa4ddWrSWG7Gn1xGpFy50=;
        b=BdmHRHT3QuIynRNLN7yjTrdYHTviWh/jHBdzShZgz0xq4M4hhvETbifmgnhXTTMsXa
         BrO7fmlY+s0tQbj64/7QgZ7z1JSkuyb78e7Omx7Q9FMN7mkpc+zPefG3+21/ydj3BbL8
         KTKSyJUDYyq7gSSHiEkraTiKgQDDarLLHp6I/QeoOpTi4vGqwzQuEnOQaZs1ECizkVhB
         fRhkW/4HhTyK5Ur82QJFXrXhJ3yqTZVXJjtSZHPchv1L4Zvxmo2UI2LNNeDF0tdnGDvu
         Ffd9OF7Ay22V2mvHHtKllICSJ0g19mRPEFD2h3rl7zAfXgQoM9IaQm5AF0CzFYpUDliN
         ylsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535140; x=1784139940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oadDjJBRgYK5tR8AHh8ohqDa4ddWrSWG7Gn1xGpFy50=;
        b=dzbJuBlZ5ODxeWmRuAo/bsyO6wpvREZ1/CllhEyiApkoPigouLqP7tff/ptXNTNFjQ
         Yjl+h/3Q7oCpm43z/H2mYzvPlZ5o/LsOWYB2DEiPnUePioqYy3l5lJWgT9vb/JlQdwsg
         KovJhS7BcEJzsBMpmwuS65OoVaGgqLhWhaGwtV13QKKFO1IT//+b1FzPRgFG2Z5z+MRc
         j1Gpwg43smz422Frmj48o163ScxhaXbhU9N/PNQjAbkt33S6gZFG0jgatqTmBLTeIMrp
         HFCxVYr5CnuYHBq4BDGVNmZGz4tfjBLzeYEcMLc9nbXpbsLbhD0GLUclokRoZBZtsg2A
         zo1g==
X-Forwarded-Encrypted: i=1; AHgh+RoGioEHxKr+IYFvb3w/2gq7K57V8nV6VZeEp3kDvFp1Mc/kDkxKwfxk8ZaMDXTy4ulEBYgOuvbePc7Si2KU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6KjeURdySFqe5YgAnmO7TovbxU39imUMMAgdqK1XbIGErb68
	g7zIRbwODKxR0GTf3Sw26MzoT4w1rjD10O5urcc8CI56EAXL5fRnPZjlgdqubnxeUZX7LBXQRpk
	PaAN2CTvPrZ87pf2M6qvxSnDqCGCPuZ59hZ5ZF00VoZ3bgxjkrskUKP3VLSWV5xBWJdPoxTCwbN
	p2
X-Gm-Gg: AfdE7clLepR/xSfqNEczOIxH2SgDbTd9Z8h+DEDyicgBcC95VEWlSj1XZc1oTEEm+nh
	H5HWg0nAFuj+XEQEogTB9JrsrbgzONcuFpMHSkZiZvB/0HugUg3B/lCkwFr/Dbfz9v8XrZ8LUh8
	ufpEhZuhAsqSFrH+rmYftF+db40ovE+4/bDJflpbWy81dnpoWQnCIuY66+CBRBjNLewJKsIpRv8
	7v8q03BY4lf4pikIs3H01bPMH/PHgGrKbYI8r34OVEsI3Y5E43SFMAxS+WV3n9hDu2D0yIY36Tp
	w3UedTTNXX1sojMQ4aXD8Od6vTKKV+4bMt1/IwCDiqv7gMQRVs10YeC8nIp5t9jP0J+NxFlKNKO
	G27PVZDKVxiG3xxzmkQWs5rSZhQjesi1tYsl5pvPKew==
X-Received: by 2002:a05:6a00:8f0b:b0:848:30fe:da34 with SMTP id d2e1a72fcca58-84842fc4707mr3900474b3a.45.1783535140164;
        Wed, 08 Jul 2026 11:25:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:8f0b:b0:848:30fe:da34 with SMTP id d2e1a72fcca58-84842fc4707mr3900418b3a.45.1783535139370;
        Wed, 08 Jul 2026 11:25:39 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 23:55:07 +0530
Subject: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: su_GErMvW4G-tnZmlhRcA0PWCGrSeWqZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX95Duv9au+COX
 iG9qZ9UuDJEuu+WlE0J31pyiDZW9lZVJ49JU5W+V8vSC9FiiNLmPRBJFmJFeHlqpIvgfYXx9ybI
 5TcOW8PUB76pOy1CRA8mfK2KeLvvWb8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX2fJsFNVzebjh
 LpTLyJybvhUp7vtOmIn7gRFBwNpMPEN9eHYx1gen0/qJYe9AozEy6wnbcgzB8u49nS3ZyAJDYPN
 vnS5YbzPAyugGdJQp8HdnTOaBf0SgafyTIzrXClFqb748jk1FK/aiNyBPT4BF7NaW0pkGFBfWM3
 cyidVN3leIiJIVdSSpmACILeeyUXpOIi4ygB0AcfJr79Mrb9f5Yx9iaj5HnxjVgBMxyCooVf86b
 1NBIU/zmFLMHQ1AOaxGnYOKPqbFG2v9/+gYmcedqr6P2+wLGpvcuMIAOhhOH6tz21qa61x3RVp8
 WvnmCqgRcIKf0JTq71/vkkUWS6r7T+Mc/ek8JAFQFtk8MBfjTnBIzDt0t/Jy8GMtsz4+2ejT5ic
 iBvVqFsRmi4ybpMpPTIbqzDI6ucH+1Qz+hBOtAJIzO/39JqHNJD9MIx+J1HwBi2MTwBE0SRRgyX
 gA2sNFr262iR9W56l5g==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e9625 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6R40rii2pyDi1IHM5g4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: su_GErMvW4G-tnZmlhRcA0PWCGrSeWqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117789-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 789CE7297C4

Add support for Audio Core Clock Controller (AUDIOCORECC) and Audio Core
CSR resets on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig              |  10 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c | 809 ++++++++++++++++++++++++++++++++++
 3 files changed, 820 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 72e172ee0e6eaeccf709c0110e1d24fb555d894d..08e10feeaffa9a05daed5a2c5db8cb9f5eff76f3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -155,6 +155,16 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_SHIKRA_AUDIOCORECC
+	tristate "Shikra Audio Core Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_SHIKRA_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the Audio Core clock controller on Qualcomm Shikra devices.
+	  Say Y if you want to use AudioCoreCC clocks required to support audio
+	  devices and it's functionality.
+
 config CLK_SHIKRA_GCC
 	tristate "Shikra Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 910add09b3b2fe64bb21a18f4e1e445a702e283b..c03cd721bb8d2736d1bb5e6249dfc27e3af7cb48 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
+obj-$(CONFIG_CLK_SHIKRA_AUDIOCORECC) += audiocorecc-shikra.o
 obj-$(CONFIG_CLK_SHIKRA_GCC) += gcc-shikra.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/audiocorecc-shikra.c b/drivers/clk/qcom/audiocorecc-shikra.c
new file mode 100644
index 0000000000000000000000000000000000000000..76017240f7684da5e2fc5b8ab7ec2d3a3793da56
--- /dev/null
+++ b/drivers/clk/qcom/audiocorecc-shikra.c
@@ -0,0 +1,809 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+	DT_AUD_REF_CLK_SRC,
+};
+
+enum {
+	P_AUD_REF_CLK_SRC,
+	P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX,
+	P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2,
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco spark_vco[] = {
+	{ 500000000, 1000000000, 2 },
+};
+
+/* 614.4 MHz Configuration */
+static const struct alpha_pll_config audio_core_cc_dig_pll_config = {
+	.l = 0x20,
+	.alpha = 0x0,
+	.vco_val = BIT(21),
+	.post_div_val = 0x28100,
+	.post_div_mask = GENMASK(17, 8),
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+	.aux2_output_mask = BIT(2),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+};
+
+static struct clk_alpha_pll audio_core_cc_dig_pll = {
+	.offset = 0x0,
+	.config = &audio_core_cc_dig_pll_config,
+	.vco_table = spark_vco,
+	.num_vco = ARRAY_SIZE(spark_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_dig_pll",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor audio_core_cc_dig_pll_out_aux = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data) {
+		.name = "audio_core_cc_dig_pll_out_aux",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &audio_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_fixed_factor audio_core_cc_dig_pll_out_aux2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "audio_core_cc_dig_pll_out_aux2",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &audio_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct parent_map audio_core_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_AUD_REF_CLK_SRC, 1 },
+	{ P_SLEEP_CLK, 2 },
+	{ P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 4 },
+	{ P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 6 },
+};
+
+static const struct clk_parent_data audio_core_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_AUD_REF_CLK_SRC },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &audio_core_cc_dig_pll_out_aux.hw },
+	{ .hw = &audio_core_cc_dig_pll_out_aux2.hw },
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aif_if0_clk_src[] = {
+	F(240000, P_BI_TCXO, 10, 1, 8),
+	F(256000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 32),
+	F(512000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 16),
+	F(768000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 16),
+	F(1024000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 8),
+	F(1536000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 8),
+	F(2048000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 4),
+	F(3072000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 4),
+	F(4096000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 2),
+	F(6144000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 2),
+	F(8192000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if0_clk_src = {
+	.cmd_rcgr = 0x104c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if0_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if1_clk_src = {
+	.cmd_rcgr = 0x10b0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if1_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if2_clk_src = {
+	.cmd_rcgr = 0x1114,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if2_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aif_if3_clk_src[] = {
+	F(240000, P_BI_TCXO, 10, 1, 8),
+	F(256000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 32),
+	F(512000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 16),
+	F(768000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 16),
+	F(1024000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 8),
+	F(1536000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 8),
+	F(2048000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 4),
+	F(3072000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 4),
+	F(4096000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 2),
+	F(6144000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 2),
+	F(8192000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	F(49152000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if3_clk_src = {
+	.cmd_rcgr = 0x1178,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if3_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aud_dma_clk_src[] = {
+	F(38400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 8, 0, 0),
+	F(102400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 3, 0, 0),
+	F(153600000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 2, 0, 0),
+	F(307200000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aud_dma_clk_src = {
+	.cmd_rcgr = 0x1028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aud_dma_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aud_dma_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_bus_clk_src[] = {
+	F(38400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 8, 0, 0),
+	F(76800000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_bus_clk_src = {
+	.cmd_rcgr = 0x1008,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_bus_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_bus_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_ext_mclka_clk_src = {
+	.cmd_rcgr = 0x123c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_ext_mclka_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_ext_mclkb_clk_src = {
+	.cmd_rcgr = 0x125c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_ext_mclkb_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_lpaif_pcmoe_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(15360000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 8, 0, 0),
+	F(30720000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 4, 0, 0),
+	F(61440000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_lpaif_pcmoe_clk_src = {
+	.cmd_rcgr = 0x12ac,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_lpaif_pcmoe_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_lpaif_pcmoe_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_tx_mclk_rcg_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_tx_mclk_rcg_clk_src = {
+	.cmd_rcgr = 0x127c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_tx_mclk_rcg_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_tx_mclk_rcg_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div audio_core_cc_cdiv_tx_mclk_div_clk_src = {
+	.reg = 0x129c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_cdiv_tx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if0_ebit_clk = {
+	.halt_reg = 0x1068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if0_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if0_ibit_clk = {
+	.halt_reg = 0x1064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if0_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if1_ebit_clk = {
+	.halt_reg = 0x10cc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if1_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if1_ibit_clk = {
+	.halt_reg = 0x10c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if2_ebit_clk = {
+	.halt_reg = 0x1130,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1130,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if2_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if2_ibit_clk = {
+	.halt_reg = 0x112c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x112c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if2_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if3_ebit_clk = {
+	.halt_reg = 0x1194,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1194,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if3_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if3_ibit_clk = {
+	.halt_reg = 0x1190,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1190,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if3_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aud_dma_clk = {
+	.halt_reg = 0x1040,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aud_dma_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aud_dma_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aud_dma_mem_clk = {
+	.halt_reg = 0x1044,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1044,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aud_dma_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aud_dma_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_bus_clk = {
+	.halt_reg = 0x1020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_bus_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_bus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_ext_mclka_out_clk = {
+	.halt_reg = 0x1254,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1254,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_ext_mclka_out_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_ext_mclka_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_ext_mclkb_out_clk = {
+	.halt_reg = 0x1274,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1274,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_ext_mclkb_out_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_ext_mclkb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_im_sleep_clk = {
+	.halt_reg = 0x12cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_im_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_lpaif_pcmoe_clk = {
+	.halt_reg = 0x12c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_lpaif_pcmoe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_lpaif_pcmoe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_rx_mclk_2x_clk = {
+	.halt_reg = 0x1298,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1298,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_rx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_rx_mclk_clk = {
+	.halt_reg = 0x12a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_rx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_sampling_clk = {
+	.halt_reg = 0x1000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_sampling_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_tx_mclk_2x_clk = {
+	.halt_reg = 0x1294,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1294,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_tx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_tx_mclk_clk = {
+	.halt_reg = 0x12a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_tx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_hw *audio_core_cc_shikra_hws[] = {
+	[AUDIO_CORE_CC_DIG_PLL_OUT_AUX] = &audio_core_cc_dig_pll_out_aux.hw,
+	[AUDIO_CORE_CC_DIG_PLL_OUT_AUX2] = &audio_core_cc_dig_pll_out_aux2.hw,
+};
+
+static struct clk_regmap *audio_core_cc_shikra_clocks[] = {
+	[AUDIO_CORE_CC_AIF_IF0_CLK_SRC] = &audio_core_cc_aif_if0_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF0_EBIT_CLK] = &audio_core_cc_aif_if0_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF0_IBIT_CLK] = &audio_core_cc_aif_if0_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_CLK_SRC] = &audio_core_cc_aif_if1_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_EBIT_CLK] = &audio_core_cc_aif_if1_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_IBIT_CLK] = &audio_core_cc_aif_if1_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_CLK_SRC] = &audio_core_cc_aif_if2_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_EBIT_CLK] = &audio_core_cc_aif_if2_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_IBIT_CLK] = &audio_core_cc_aif_if2_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_CLK_SRC] = &audio_core_cc_aif_if3_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_EBIT_CLK] = &audio_core_cc_aif_if3_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_IBIT_CLK] = &audio_core_cc_aif_if3_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_CLK] = &audio_core_cc_aud_dma_clk.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_CLK_SRC] = &audio_core_cc_aud_dma_clk_src.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_MEM_CLK] = &audio_core_cc_aud_dma_mem_clk.clkr,
+	[AUDIO_CORE_CC_BUS_CLK] = &audio_core_cc_bus_clk.clkr,
+	[AUDIO_CORE_CC_BUS_CLK_SRC] = &audio_core_cc_bus_clk_src.clkr,
+	[AUDIO_CORE_CC_CDIV_TX_MCLK_DIV_CLK_SRC] = &audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr,
+	[AUDIO_CORE_CC_DIG_PLL] = &audio_core_cc_dig_pll.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKA_CLK_SRC] = &audio_core_cc_ext_mclka_clk_src.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK] = &audio_core_cc_ext_mclka_out_clk.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKB_CLK_SRC] = &audio_core_cc_ext_mclkb_clk_src.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK] = &audio_core_cc_ext_mclkb_out_clk.clkr,
+	[AUDIO_CORE_CC_IM_SLEEP_CLK] = &audio_core_cc_im_sleep_clk.clkr,
+	[AUDIO_CORE_CC_LPAIF_PCMOE_CLK] = &audio_core_cc_lpaif_pcmoe_clk.clkr,
+	[AUDIO_CORE_CC_LPAIF_PCMOE_CLK_SRC] = &audio_core_cc_lpaif_pcmoe_clk_src.clkr,
+	[AUDIO_CORE_CC_RX_MCLK_2X_CLK] = &audio_core_cc_rx_mclk_2x_clk.clkr,
+	[AUDIO_CORE_CC_RX_MCLK_CLK] = &audio_core_cc_rx_mclk_clk.clkr,
+	[AUDIO_CORE_CC_SAMPLING_CLK] = &audio_core_cc_sampling_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_2X_CLK] = &audio_core_cc_tx_mclk_2x_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_CLK] = &audio_core_cc_tx_mclk_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_RCG_CLK_SRC] = &audio_core_cc_tx_mclk_rcg_clk_src.clkr,
+};
+
+static struct clk_alpha_pll *audio_core_cc_shikra_plls[] = {
+	&audio_core_cc_dig_pll,
+};
+
+static const struct qcom_cc_driver_data audio_core_cc_shikra_driver_data = {
+	.alpha_plls = audio_core_cc_shikra_plls,
+	.num_alpha_plls = ARRAY_SIZE(audio_core_cc_shikra_plls),
+};
+
+static const struct regmap_config audio_core_cc_shikra_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x305c,
+	.fast_io = true,
+};
+
+static const struct qcom_reset_map audio_core_csr_shikra_resets[] = {
+	[AUDIO_CORE_CSR_RX_SWR_CGCR] = { 0x1c, 1 },
+	[AUDIO_CORE_CSR_TX_SWR_CGCR] = { 0x30, 1 },
+};
+
+static const struct regmap_config audio_core_csr_shikra_regmap_config = {
+	.name = "audio_core_cc_shikra_reset",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x34,
+};
+
+static const struct qcom_cc_desc audio_core_csr_shikra_desc = {
+	.config = &audio_core_csr_shikra_regmap_config,
+	.resets = audio_core_csr_shikra_resets,
+	.num_resets = ARRAY_SIZE(audio_core_csr_shikra_resets),
+};
+
+static const struct qcom_cc_desc audio_core_cc_shikra_desc = {
+	.config = &audio_core_cc_shikra_regmap_config,
+	.clk_hws = audio_core_cc_shikra_hws,
+	.num_clk_hws = ARRAY_SIZE(audio_core_cc_shikra_hws),
+	.clks = audio_core_cc_shikra_clocks,
+	.num_clks = ARRAY_SIZE(audio_core_cc_shikra_clocks),
+	.driver_data = &audio_core_cc_shikra_driver_data,
+};
+
+static const struct of_device_id audio_core_cc_shikra_match_table[] = {
+	{ .compatible = "qcom,shikra-audiocorecc", .data = &audio_core_cc_shikra_desc },
+	{ .compatible = "qcom,shikra-audiocore-csr", .data = &audio_core_csr_shikra_desc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, audio_core_cc_shikra_match_table);
+
+static int audio_core_cc_shikra_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+
+	desc = device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe(pdev, desc);
+}
+
+static struct platform_driver audio_core_cc_shikra_driver = {
+	.probe = audio_core_cc_shikra_probe,
+	.driver = {
+		.name = "audiocorecc-shikra",
+		.of_match_table = audio_core_cc_shikra_match_table,
+	},
+};
+
+module_platform_driver(audio_core_cc_shikra_driver);
+
+MODULE_DESCRIPTION("QTI AUDIOCORECC Shikra Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


