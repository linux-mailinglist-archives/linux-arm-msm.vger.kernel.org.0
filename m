Return-Path: <linux-arm-msm+bounces-102305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KqQHOwm1mnYBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:59:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E127D3BA2EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ABFA30455F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB42A3AE19B;
	Wed,  8 Apr 2026 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/1WmTWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FIZyHDl6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB93ACA50
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642335; cv=none; b=GaOSKeZ1mU0XNxCRJrlv5zd8YtIqyecr3Tq0qeLBd76xle3+ptsL6JQS/Lt73i8iD7oSx7w2FYMIeu+EbAcn5Rsr+RBaZc9RbnmAAMik0XySg/3iMkp2LGTj+lMS7Od0CoBIDkcXSBT1OuV9wVItwGT8mm96b136jCfdJ22uf00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642335; c=relaxed/simple;
	bh=wJ0e12ikEqoJjKP58GCgxAO9XJT3KyRarFLZzMDpX4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=frnKF/WMF2h7NzZeIVaY7N2EW3BnSnigDM5ryaF7Wej+wotmQ/JuvGLIcdEV/HZgg15w3yP7DmMNJpeWM3RRKrnhueYud7bwRj/wVODsGZZvojORBUsUxHlVEvTf9goE6aKPszF9taqsDmhpl3nstYwnp61cYjGl4Fj9bnFLSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/1WmTWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIZyHDl6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387jcvV1259362
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHLv1LepPQQd8y8BfHLr3erT+0i5iQAtxSKpT8MX/M4=; b=b/1WmTWMkIXCB1Wa
	vMsqwy9HxuY7WHNJACs2v9y4WyImyS7feX1W13gVbWn0AGyaE3cY29PVVcKRGrV8
	k/+Cf4CquKH3JbCZgq1mOdG3e3MrJoPWreJE0JVk7FHPHJB6fkgKUKfLy0ePI3e4
	6ZqfpKeeBLP0lX6IXWYkllyBWUxM/dWufWkT+XAvKQ6QJrxEvgzi3ENYd/FWdGsR
	OQKTvEWgYFbnA3qtxwh6HC0uIqGw2ICjhYujNm6P6gRXexTleNJ2sKaElrUSEnW+
	Eyov2XN5v9bD3Co253foAHtnB7d5mRh3EQqQZ+AC3DFGRzFhyEkff0ZINR330GqD
	7SkB7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttt03j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:58:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35c12a3bbb9so6286652a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642328; x=1776247128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHLv1LepPQQd8y8BfHLr3erT+0i5iQAtxSKpT8MX/M4=;
        b=FIZyHDl6CxQUjkc/XyblKdoxXPCLs8jp7EypmFqMX0+kiW7Ukrf2uiJxCKxndAQyJm
         qXPrGypMusLx0CO6NkLuxczFEbe4E1bZqbaRIgA+yUgJ+qYgGN+w8nmYFoXXDAz/PVB0
         j/Ll3SKXQDeBnzUNs0Xlw/BtMxVxamHuubkV8+7fuUFcnrO2Sq4VcaZj2ALJpkFI63IC
         mDRI0vDKfJjA+ZlZcR2uwxEoOhh2nUFM6iQZtfJAxI9JkWG8otQ7HzrWie4N5SdVL7Th
         UIMvrhAyQ3Rhi/wB/HR2JcPWQPe52FLayGC0rWeeO6eNPZ6MlRVZoT8wvwCtyiySWASV
         AHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642328; x=1776247128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UHLv1LepPQQd8y8BfHLr3erT+0i5iQAtxSKpT8MX/M4=;
        b=cJ0lI+wcYZm3e4I+DIIAYYieBxwan98LQyMYMWVXq3CD21XkQCcWQD5HPSNuzjGIpa
         lrvt4lzCgHCU1CMssSpLv1HW7f9P27LLlYuTGz+BNXtLIvcFYUSCtVojiEihk0zLnXz8
         g03s0Cio2cATe6x/0HCbSETA/XPQ8PhO7UBXpio+3GEuRvMlfyt1RYyb3ShLh7GARRBy
         mmwsDK+9T5QbVX3P/tch4jXgTzXJQnZNZbBLND6wYXwBbfg58l7S68bi55DtxEkpca5p
         ry5JUzzpXYh495+AqQC86252TFFGX4FbwpkLUFyfngaBXAU9yBxNtN3vidJd6N0ak7If
         7ECA==
X-Gm-Message-State: AOJu0YxrJCi27s7NSfI6VqrfqVoJEY2+0gUIM3/ahrEnglx4SGKNeR7P
	QCdLUBM6AKA0pY0CMx3czjaFfb1iJxMlDCG2EXxCk66FOJATiJwAiXd/jvGsPm/hSyF72Zmvnju
	fGv2/illihkQ+q5fG/pnpxqtyd8yOOW0RtfdiCfjM0q+1EeCFpQT65NNkzOZ0SAel0R/9
X-Gm-Gg: AeBDieu4PAWrTfoBzDIDM+oq8g6dZqZ7o7tLXeh6U78DIeCWEEbTS6efMfgVhQVmHcq
	6ZnL6PcvNBREsbM/HWk/9F5M/D7fmCQdUU0Qp4NUQBX6/vvVnTOkVrEe19MpmxK4HAKgxFTCuXq
	aOdqf+0yGMqgZGNec4Im31Ks2Qi2eeFW41yNgtIl2HZwk+dXvKFTbrfSkjxoDFyRMBARpnUbs7/
	mAI+emrzMPwRtfrzIM1TYt3haft7EwfDKIkY6aPkxPsnUaylac59L21SZLC179GmYFrIlkJbuHf
	NChPvOdi8Cl9nK60AFGd3JFS97s/Hwe2uDamSYc6qun6tWIRroBMQGe82OvPt44uZ37YTdG6v2y
	oUimR1Sf+GZ4R/DdvqWhtPL6lwm2iHixr/P6xD7Axak/cCvD2D1oqk91DPDrXLxS9hPAUNuBh3/
	hJdlPYpToenGl2S8x7w5UdzK2/dLbnRC2OhCtiXIV45CseXa+1yb5naGpa
X-Received: by 2002:a17:90b:5544:b0:35d:a276:a87d with SMTP id 98e67ed59e1d1-35de69fc997mr19889974a91.27.1775642328291;
        Wed, 08 Apr 2026 02:58:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5544:b0:35d:a276:a87d with SMTP id 98e67ed59e1d1-35de69fc997mr19889958a91.27.1775642327853;
        Wed, 08 Apr 2026 02:58:47 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm25445663a91.8.2026.04.08.02.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:58:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 15:28:35 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: add SoC ID for IPQ9650 family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-ipq9650_soc_ids-v1-2-e76faac33f77@oss.qualcomm.com>
References: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
In-Reply-To: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642317; l=827;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wJ0e12ikEqoJjKP58GCgxAO9XJT3KyRarFLZzMDpX4s=;
 b=Z3NfKjamXHOLclO68N2bJ+W/p3/kSLUto71lkGiO2Qvmlm3/rl3oXqjBqmZABcruiEbSRxQ+V
 7qvNfsb/KHNBhIUH/R0I8XIy7hN4szaB6YxQnxDO0fknag4UwHtjNbk
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: EfUbHS3dnrEurIb205TGgTigI6cKc30c
X-Proofpoint-GUID: EfUbHS3dnrEurIb205TGgTigI6cKc30c
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d626d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KPtWMpYoI-qC0yIVAH8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfX898e0EzLDjbi
 f6trhHNxoaPkDIRTLeXSqz++phsHoKOC6MuP3NTl1qXZGG3/43Yd2cK2V21sTHE6l72bz5dQDhd
 n1705cyLbGZSrUjcw1eyNHpPEb0I0o3dFs55pYwcc48somYyra3riONqqN4Co1rnfC7f01L6e3/
 vYY358MhSJ8rEcMysj1YNTgUEjCq6ofslMsdAxniBYW2qKrKyBX5dSbqVK8SbK0228EYv3QoagR
 L3tC/rroewuf5HqVgr6RgkCW/lla3C8AWVQAlquCKL+9HLCe9G5i7jMAR34CxbJi3adJFoCpKn8
 tgQEllm7C6J7zSp5BiNYCC8lc04Co7OEFbLGmC62QbToMBFbwHVtraiBtXUz8vGdLJiMMNJ5x3h
 /dyMyJ0WdIq0zXJu4t17+dUlBjABmWvOSIAW7DqJh/Ehwkl2VMbqJ8qUBiBwRT+X02H0e9qtuMq
 641alDwtHnuSQckwmKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102305-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E127D3BA2EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add SoC IDs for Qualcomm's IPQ9650 family.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..77a605bfeb46 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -533,6 +533,12 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCF2200) },
 	{ qcom_board_id(QCF3200) },
 	{ qcom_board_id(QCF3210) },
+	{ qcom_board_id(IPQ9620) },
+	{ qcom_board_id(IPQ9650) },
+	{ qcom_board_id(IPQ9610) },
+	{ qcom_board_id(IPQ9630) },
+	{ qcom_board_id(IPQ9640) },
+	{ qcom_board_id(IPQ9670) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.34.1


