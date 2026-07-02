Return-Path: <linux-arm-msm+bounces-115915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qIPjB/BGRmqANgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:09:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52D6F6751
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:09:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="mt/FVJP/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b+dO6UBe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115915-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115915-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C21F32BF191
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FBF48122D;
	Thu,  2 Jul 2026 09:51:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC34DC559
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:51:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985896; cv=none; b=u3waZJ7PuG/JxZO05hGZXrINqk3afIzr63nQ6VdVx2FJbixJc6uziCFjBqziLDDJ1sg7rdUQ0nlH4k7SQ4kR9YTqUgnAKdAlMac3By1RK4ICowG/92l/6hBaHo6KIsgLvn+je9A8YWA2WSFpJy5o7En3OOLMTmrKJMR41kHfJQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985896; c=relaxed/simple;
	bh=W+J47DLyzKHe2QopLDHxTslHmL997c14k/yofWkF6Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ri5ZLNKTFrejNqHI+Mg80bzqNr2EO4su1QjZnoT27Xy+9wg4N2zgPZw7CblUSiCkNb9YNahEVJ46lLmXtOkIj0URJG8VVE9tIk0pMNuVmeNUKZAR0fnu350hMLoXow7g3zYn0i8yehOPjJa3BG9cl3W/rwujBagvU6XzwyKnAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mt/FVJP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+dO6UBe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sJRo4172117
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=; b=mt/FVJP/tJ5BWdlV
	MFtSrp87h2XL4XjVlr8vGd+hkcnvXtHPGqIcL1k6a3eXrZ++8LtRL6SRaNh9vGt/
	9Jd7JO0BmAt8Lsr2ehIbSPs8tVV9R08C7E2rQx1dga+xwEtUcK8MmCOJ60wQ2ZY7
	efglepwEIW3wXOlyMWuGm4YmXVrAvyCfGVzeQX1OyeK2X5swe6aJQQqkMqXnc0a1
	8SKd86sJsX6XGVEAZ4mZ6YQzqynSLwK5Te/ZGDNPF0RnhctWixIR7m8PTT/30vAe
	6Xtr2KMHPi8tYHpJTSjCDYg4dNNvAZknosHC3ddQT88g8ho5MxTrcGaysMMSvPo3
	JSud6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwr7qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:51:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84770f89b99so2673944b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985894; x=1783590694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=b+dO6UBeqvLQJZNOGMTlKmJ0T1R5bbKNmUYuTMybPKCn//pHtk7CSeRsbxpWqLEXkV
         gIJJroPjdlUAnMKErU20HTON2LhgjqWZXLA3TAC9QWdex6Aw/+7xUsNJQCL2y2qmx1T8
         48SOrXKysP292GZSiZxktlZvp5chYg71rlwtnfdWErwXQ2MlYn+lPTMC32NKdKpZZLGH
         +CEV3bitquxuf+XS4+jUkSeDgL7K5V29pHmUqJstU8Ob7rtdeadOxJHE6aaTBYQ3oMKX
         82sqJx1vea7I1LjpyPL1w4xc+IG1h3HD1e0ZYCEp4Zpn64/uaL1NuN76lIJDtNuhVeFe
         hk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985894; x=1783590694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=js64oiQPTUeyft/DQlKV36pMXq8MNXtFhWywBMEf79bjnKy0J1hHVMFHQtoo1SmE+1
         8ItPyAvr3VuPGqPj7Ln7jEVQfq7/ViN0i23btWzQVS6ErX+FVG5qlRBAtFtiefaCPFqk
         5A3fhRbyYPTN1ltVJXXNn89KzREf9P/R6uODyrqRnYG4oAPNZJuePjNviYFcamql5zlW
         ABsPQtScuUzw6mpl6fEhixjlLjGEFsKbxcscBtEoplzOtsJkYu5o8ZxywmGRKs/zs0rQ
         wv+pnPJX1hwVcL5jY1IYPXPGODxM6zTz5rGn0/JbS3ja0FBgO0DuUu7FC5ey7rLHfj1W
         EaBg==
X-Gm-Message-State: AOJu0Yz42zWG6g9yey1Bc8Nt/pdYFnbwO8dHB4TDo5UApSRxzKZVVoq2
	QbZKi85eQ5Ga8s/PJBLQL2oYGTj6V8vfQ0zdjQ2KG864LYD7ak4Y73vqqV5hOqyEaropAc3NEnq
	yoAX1DHxcRE1foEqKlN4nvJ17PFrge4R5yJJaUaRIadBsCJ+1l9+b2ZtDzn44zvv02z3L
X-Gm-Gg: AfdE7ckEGDl/UW9V+Ee6ViNMN1QB+BUMXm/L/xYQy3HMyT1ijCVX784kTknEjG16ib1
	bGOYu+LEz5e6CrtAYwn91MpsEaDfkYn5/tRj9hgFO3mZMbKN6VeQuudy7S4OvshOj0e74CdH2mN
	r9pZreaw8vmMInS+jAX3Mp7zw+N9WJGapJi12Cjcz6r2pTh8sgxihrMrxNLFI57wUImcL/38IZ3
	vq4aSm4mU6RI8TOiLybJwYTOKOnjc4pyGwg3TvccrvkHgj8/rDyTeMA2unsUTd9iZwNk2YyPo+T
	irv4j2llkar5uzAVDd9H9AjWGEnjctIT5SbBBB8Yj34nR6YEyLE+QLhBXEq0EN4js5VF2odjdam
	uCh94v/Ojyduey8GqJ7rydbd5+Q==
X-Received: by 2002:a05:6a00:4194:b0:847:87c6:486c with SMTP id d2e1a72fcca58-847c08d16a0mr5329773b3a.51.1782985893499;
        Thu, 02 Jul 2026 02:51:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4194:b0:847:87c6:486c with SMTP id d2e1a72fcca58-847c08d16a0mr5329576b3a.51.1782985892939;
        Thu, 02 Jul 2026 02:51:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:32 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:49 +0530
Subject: [PATCH v5 07/11] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-7-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=2699;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B2Dpn2axDYIMHLk1wigFR9Q2p/KX8LBdfSSHhm53znE=;
 b=C01sg74303YfJrG1IZIvaMytNKmgM29upDf3ZU2cIOxelbs66nkDIIxIKa4ICb5StnUkXqH5J
 jKy0yJGGe3mCj8WKPgr/6jlJGeltSEHJm5fbGOiIOP9OloNeKbjNPVS
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: CL1VdQFkMNgURH_3p810IllcT3pNM4Bg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX/zwd1H2xLIkm
 pkBXvdiNQAWqBaj4crefdP2di9WhmPe151GCP5IktJNya6DGLnXYGL3rNUdnYl/KbUaZEECkB0j
 +c0W/PU4Rlmv/5qDIOME3OEbaGKiPQVW16/05PO/4sRG4d4Ol9FSzaTC+0+O/KM/badoKNo3J6/
 cYRqYSDpEDpOVTC8EnPIn53Ly4E2oSBmGWFJyNge2Kl46pup7MBs4JqXF1ZvDegWW0yJHQSA+43
 RJ90AgLzjT4roUD6mEbmEcdJ1fbqN4bUBQvRpLylXkG8oopyxpKzsag45HPJ8PeZ81ul9NaG/bh
 64cvVYUnnkuDNg8kGpFt1ZC39rOy68YA6o/SGyUq08Z8FT8x4kbUWbPUN2S8z1UFLITnwmiCzSz
 atCaxwNXkdZuSULjbfJPII0vte1qKwXItW2h0FCiOcTm8rMwxhAGPDMG4sIiXp5JZc3Oh5HpZ94
 XpbCGtlY5F8nsQipsRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfXzluonfxGhi3H
 44hpjwCeZK9bS2OTbYuWZuvzuWjVCpP+St+eOpKK33f3RaBnvjSPXvj1W9ShOBFTJnBLIYuBVEN
 046lVHCqbDzj5khHqTmSfCcU/K1llUM=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4634a6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: CL1VdQFkMNgURH_3p810IllcT3pNM4Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115915-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:bibek.patro@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB52D6F6751

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1


