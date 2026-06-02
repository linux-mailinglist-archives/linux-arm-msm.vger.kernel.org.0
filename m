Return-Path: <linux-arm-msm+bounces-110688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNm/Lr0kHmoohgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 02:33:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B5F626941
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 02:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E15C3034B0D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 00:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29BA2F8E9D;
	Tue,  2 Jun 2026 00:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RF5BUdts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ig1jtShE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F372F3C3D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 00:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780360350; cv=none; b=sck32mcGm3Toh5k0RD+D4Qqdp0fRK0YVzpbHULcQZYIC+az3fZR3M4QrAxxIWvQW2DzGwQVjboR/3yVm7xSRx9ijfNLSq3ZU6/+ZewaH4WMuRG6u09Pu936V8qhuNEpw0GwWxxCOFJdrEm0ieoorbQfufJSCBPO3y8HrMTR5So4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780360350; c=relaxed/simple;
	bh=Ozl5EeXxBuqxv3EqPkK5t0/LMK4hoJjLCYFpbaWf0HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTEg0+ee0Ciexdm5E0yvw5RB6u7WEhWhIB656G0LyIROeb+cFrajcvyYuAOR8uTU6zIdPtljj13+Q2K/M7K37GDnYBw7yCb3vCzbtaBzqFutMAqfU2yJdPPWzLp5VcDB4TS65Rv+wIgJYOFyPmIRKPXizJ0DouUeUatcDl1I9XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RF5BUdts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ig1jtShE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651M0tNa2740401
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 00:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=; b=RF5BUdtsRI6E9o1W
	904ivVSNBmnpNYas655kZN3PDBW70EYP/Sby8yNEiSS2tOR2sUblAwrtpw0llLUN
	VwtApOS0loGSjjwRhSF9CXRLv1VCt3rGAlQ0snP16ohUZeZBF/DRaFEDZq/j18fi
	kv//r4WlIKH8zesiykcZb0TVR5H6Xtblw+l55Lyn0TiG1WMy70r0aCXMunPowop+
	pogw+rlOfUNut0dvzVsKJaOMAx6RWNve35ROV7rudOFqtbZcyEwinAVhaixuIkbL
	y0pt2Qk/4+d5D1UfojPyER0IYB6xex+l4rzul+6Tpx98IF2t5JizfzyWKj5o+/o6
	I/Wg9A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqkr9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:32:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304ea42b025so1728282eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 17:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780360348; x=1780965148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=;
        b=Ig1jtShEwjNZV4orQRo5UuxQthOX23mXDw2bl1HV/wyejWv+wRD7xXNtdplx0fYFU8
         seKGs1ac8p1W0m7XmiEDQMFFL+u+3++wPc5Ajl7Tow3093ea7kH9uizGCLfU5lvtoH75
         tLMSEpcbLsQ7fbxC8W9fJT85aktKcZEuXxNKwVE28o1o6PrOUGT0OePdWiEeF2ByC7p5
         /lou/PQzLcvJAibVgdS7vpMq5WlgVt8xDpZ8XUGFupvFmjBTO3IdNrFjJnDIRj4V1cM4
         GvGhuj45dz32+hekUzO+2qcWmUqDIFDA8WfJfUdy/7TSCR9hRYktbxsJqbuv2RiV7oaI
         ngHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780360348; x=1780965148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=;
        b=oNZegqswRXqx5T1dlNz3tsPmsWQ+rdyDntdZdHXgamYVInhyihYJ+qTrxwduAnOS66
         alceJg2MDYkjsM0XrZZX8CFLazzNgiBPBHod+omWZAUoGNR53YYWKDTtB8IoIdx+SRgZ
         btg6QmdJYGeumV6FUhqsx37rte72J4ZHXT54nNDHOKHVmXexBZdkbdNOQR1vonT/8Jqo
         vKTRNa9dph3ybDW8obSlfXC6prkKps+hbT4zciw+TO0NqOsd18m8RnL1t/09OijS/7+R
         cV1/WgNUpk+8dseCLjiOfkfkOIkzqg4zTT/FjDdPTBWb8OkGfNl8NuWdGJ/Mr3bEaPiA
         1FGw==
X-Forwarded-Encrypted: i=1; AFNElJ/b/lLEQwlOvnAnqg4MbWOrHh4a7TZhhV8JVNdjUChNDx1tiQpIT31cvLOpTFVsFKbxrxTO1N6Unk8CM1S3@vger.kernel.org
X-Gm-Message-State: AOJu0YyM78XpHD/26kPCKfhi0x1xKwX4jKgy253wxf9SQtLWyzgrZIQi
	HiMMTX42qKeVPQdN2aytiQX0PR2u5PTY3NtE4TQpItOwQm+A+Lh5JgrXdInpsnIKH7IrF0S1UEr
	dKBPJ/d6wo877YNrwZJLzlmdiEa26CAztw41dMlJEpBvb+6e/g8uGkxd2nETk83Hs3uHE
X-Gm-Gg: Acq92OGodd+uY7OP/wXB6WHgpWlKkCvkP8xy/WXyMlHDNntsEQ2BipV2VEOnjwwJqv+
	BQPN1JvFw9+M4EMgbmOpPihh8vUv8yoeJC/dx6dU6xIMKtspRFjdstLrt9kR89S3uyYsLI5nMVq
	IpLzUfTMu/yHbFuzxdiz+D6yISHkkDvcXP7ykpNDtAoBLXzvTQ4qOjFWcO2wp/KfCGmb1fR+0PO
	DcBs+enL3uXucMtr6Z3MryOYQ7Xf+Te4szOxYQ3rVYtJ06pqrPgKN1kzkjWpANNZjDV5cGAa4o0
	7+5+ZUN5kVLXNFQBsFUVu29HnUSH+eKtzlE6Q8ILs3/Pz2UXUsVm5JWw6uzrWTMKwXxv4IUL/uY
	KYIUrL7hfJyR/uiqExH03q3J6qDKgGh4/77ZtDbGl6JyjncXFVVtX1on/4cJs0NuQVSsSMAxEHQ
	0AdwvZ3lSuZek=
X-Received: by 2002:a05:7300:4311:b0:304:cd0d:9ea5 with SMTP id 5a478bee46e88-30734ab9650mr815157eec.7.1780360348106;
        Mon, 01 Jun 2026 17:32:28 -0700 (PDT)
X-Received: by 2002:a05:7300:4311:b0:304:cd0d:9ea5 with SMTP id 5a478bee46e88-30734ab9650mr815134eec.7.1780360347599;
        Mon, 01 Jun 2026 17:32:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed563d09sm10070412eec.15.2026.06.01.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 17:32:27 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 17:32:21 -0700
Subject: [PATCH v5 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-add-support-for-camss-on-sm8750-v5-2-dac36a190de8@oss.qualcomm.com>
References: <20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com>
In-Reply-To: <20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: NZ2N_LBGuCEBrA_Gr2PRxJiBQuYS12fa
X-Proofpoint-GUID: NZ2N_LBGuCEBrA_Gr2PRxJiBQuYS12fa
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1e249d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDAwMyBTYWx0ZWRfX/Ea+v+SvPUmi
 3FQc3lvtK9UtPw5qaaWLlrYcs6RLZTkRcqyvKrDdG/TDLXVuIFh/zkYJKPHREFlV440iwSRbYo1
 4q8ru3HQe4lE7bkG2gUDxTy8jRUBqOxasrk4IEa7u6CYFLUGKzU/n0WyrgzpnAtskfBDmMn+goC
 /2btMWuYdlKM751NTPzMXjcNvx/7TQUJzkRjOD4kHjQ9X0VzQqPrygIjrj4eo1WXrl63j+C5OgY
 VnzPhk8ak/1n9gogiUphfD3eVfrO3b017G4LxMq7GWMxpvhrdk+U9GG13tvrvpXfc+14kIyfZYp
 kVunN9QjtSrMosOYFrTYdieudKnr/H3hcEiv9/fzJTrG2xSXW46WYPvNcJw1i8JsKoNbsdGpGmE
 wv3XceSXCOPARcpgj8GkgJfwZE8wsTu4ELUKuo+TzlTxPSNHfR5AbgZkrHlPMv4ea2YwBIlXnSj
 XmZ/Evrq+6KkNGfDBng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020003
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110688-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22B5F626941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8fed46868d62..834f6c1a2519 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4533,6 +4533,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -6082,6 +6096,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -6117,6 +6138,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 2c7a0218a82b..314bd794033b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -95,6 +95,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


