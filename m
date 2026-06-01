Return-Path: <linux-arm-msm+bounces-110674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEyiFXvPHWqjewkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:29:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C1623FA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ED2330E2831
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0784B3E9F76;
	Mon,  1 Jun 2026 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0jKi3jn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDI76YS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48093F0A84
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338183; cv=none; b=YllMK6ocwzXnxEoLj29OBpxoW8u3TjNwf/Xv0x4BAINOIqdfALx8Pn+N8RnhWg1Dglihb226KNE4nEcNwHQbDJ4NW0IA+seuX08wugKy/oK0LGomuYLsLqGZ7ij7jD7GmKPLlkrSvGGnEWj78ibT/sMOOFrfJfXYUPWhA8rqcWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338183; c=relaxed/simple;
	bh=Fb7z5iu2Tu23nAp6mDwCPKGAkCEtpKFZU1e3tF43ZGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVpntV208XkWq2mBbHWW0QBJT0+SZJwRRJHK3/TlE17lpRo9tK/3WhUmIhegIRrgF2+k2iBbG5ylVsiJQzSKGiMbnBsbnq8YWWyDeKh1QzOJcY6Wg695zs6j0FnccHJON0QYB6GGigVBtvdEU5R8C4FNHhyDznilH2H6hKS6s3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0jKi3jn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDI76YS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651HNagN622132
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=; b=H0jKi3jnisPa0iPx
	TIwCWnx/0Zpd7VtL91ZKCz1RGB+14hqNQgZQ6TMK0V2om94fsLnvC5zva3Yn2bIr
	KW9Kmet/TAzCMn+OuOfJiASjiCmbfhdsV5GtrX0VwEhnpG9Ea/dCUUJw0HBzkZYc
	P8a9WyGSni3NggO0vD86Q32igTSvFHdYitBvtxe7s2MtPGoOFCPIBDJ5EaSXSd7w
	pHM9ZnSTA3CmAXhxgF8eL0mOtkDLRqUuxYCP0nCqTdWKF6rsAZWER0hfV0LZ0Rcs
	KzSlbzFaB1uGKHEQdzCbg8c8+fpSkHokcricUK7vTc2WdHmWfb5bHQUGOP2WUsI+
	Rl00cw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954hvtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:23:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97415004so3676691a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338180; x=1780942980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=;
        b=VDI76YS9DX+MhfyZ+vqN1oSpGRu0cqFlF1GO5szXQio81YFZQBuLiUnK0HPObY9WCp
         PMTahWNcTbYahcd/4K6zFzwCtd6Vos5ar81u6D7KwgwYwh4bArXV3X2xh1zf4oHOyr8/
         4XnlifcpoehaWr/UAMbr2ClyoyXeu3xF9ZWrhjBh+cp2PPrTCGY7OvgyYStLcrM0GQoA
         sNNtSNSGUtDjaHoU6mh634YIKzX9VGyg7w/NdQE5pHDE3ZPVxXXOCwYv1vPqThxQe5PD
         VgByTELDDZCbyc7O/iTNibKAb/xFGidym9TwZ+iss444hb3GOj9QO8fCpzUg699auSxS
         FtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338180; x=1780942980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=;
        b=h20L4rj+QbqP/x8iaNXqTi57PYRGqWNwo8YejulmAkEUJoajl1rx4YhPSfYbLQqYbv
         r0/rj50wtsf46yLNCy8VmDG3Y8D6qXJsmovKNZROY4fyrYAgTirrep7/mzWdVlDVkDW+
         Hir2+5gs1YzLI0+Yuoyz93OXE1a2BNadWFHSCPT/WPz+FiplEqKu+IgbGLQ/KeRVzORD
         QWVYeR5QGhouumGjLIyGVf7OWq/2i+D7mBgmLIcsV7Yr2Y258E3Fqje4LvJnsAvYOdgu
         OzQu03V0k6cJxGocg/s18490L4QoBHAK9H5anrjXsHljRgLTWVZ54ftw7woPB03/oKxl
         frxA==
X-Forwarded-Encrypted: i=1; AFNElJ+9nXnIJLYgPSbG/2hKgI8kIjiXOpkeVD1+Vl0t5omb3spvKO80WUOz1BdWAGGGH1Wd44MCO9D+SiaUyVJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YzSOArwX//lQOxP+JXyWV5evgH8S6qmUXpEWKxaAcyfeCpj0hTt
	25mJ5CAXy//IkkJFZqMZ9GwzInO2OvmQVkHggcMF7l4lN7g0vyWoEWEavRHQEAj2ZqE417poLCM
	H26GNaAFa6y2x4oGOvMKUDvlrkNjoaWzqNRn0hKizMP6DxJTstoFSGmkyFX0qQN6vYXk0
X-Gm-Gg: Acq92OGDZuOzKWtcWqLCCTBy+YCwbCmSzfgjYODL+vVsczge7qWYQjJOoICHrNKlrBb
	0LiVVz7wRDZcEfIaQZCdqEoBtqzlK+UIgVbtSM0SRdP2GORDKicFAKDPAqjq/+ad2EKw7hbb+Rm
	0x1bmsiq4qD1oNQvFKjI7KOTMhh+QfDxYWZ/rKVodZ8gWL5laKN6SCUIbC+XLc1OIPpGL+nychW
	B3f3cXC4mJyRm+DZEecdIHcn4q9wgKEetaKhETOCInWd487OgUNMW/mhwPq2nDeotH0wBRh/NNV
	xeJ1nW6HydHrIXO5rLKPJjf2Wryvtv/c0/R0FSnERzh4vc0485CTSB4l6OyFZbZ8/Zod7OV5XTc
	sqFgkkng4201dGKVrx+GolG2252d9Kblvm/rvF6LsHu2PiWj6LBDkNoeWThDpYrc=
X-Received: by 2002:a17:90b:538b:b0:36d:ae6a:22f0 with SMTP id 98e67ed59e1d1-36dae6a23cemr6140933a91.14.1780338179604;
        Mon, 01 Jun 2026 11:22:59 -0700 (PDT)
X-Received: by 2002:a17:90b:538b:b0:36d:ae6a:22f0 with SMTP id 98e67ed59e1d1-36dae6a23cemr6140884a91.14.1780338178984;
        Mon, 01 Jun 2026 11:22:58 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:58 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:33 +0530
Subject: [PATCH v3 11/12] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-11-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: muqWa8Nt2sNtvlwMNO-cwfwYGMBtdWE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX/bJlKDQR2XRH
 h2UZbNHAj11Wz7mOAZ+smlJP+uVpebppDXJ7B23CyXmF9eqd+Hgvsm90VXr/UzdgN8BXuzjW+bf
 fUUmtm93Wd9FFJtgwLJNWFkF32srLttLCFeaaCa3ro7CwjccqMzgKbMwSfsH3QEsOk/QHO7CyQR
 2odBteaKEjhpTu9Uh9E+pFXqHp+AedGi9GK162SmckDh/xgDpylPuMIRDdFfqnY/2jcwvY6itXR
 KUHhPf1QUFDfum+ElE2Z9mumVLjFMln6AK/ONLnIPPVLXo9QJisaXKT3glDNxkc8LVBwkzp2+tT
 BF+ymS2gqkrbik3cisxOdor/8b8r60fumqi24EuWOm8hGozKNnCBWsB5H7S6c7YQA2Xn24yVtEj
 BP+jpYXEpb0Pmt9tUmFTRhOW3f6Dh9rX9nQV/LJAlHOaTpyjXAaAMBuQt4KsReVFyn7Ps3ulb9y
 1powJpgi9hUINIggb9Q==
X-Proofpoint-GUID: muqWa8Nt2sNtvlwMNO-cwfwYGMBtdWE-
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1dce04 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vsOEvA3BJYGQS88P8KEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110674-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 193C1623FA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence add support for Shikra
GPUCC by extending the QCM2290 GPUCC driver.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 6e696cf672923495c789055dcd2ff905d1761e16..f43dd8231fb20d6f44a10ac33ed7dff923c81fa4 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -133,6 +133,17 @@ static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src_shikra[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	.cmd_rcgr = 0x101c,
 	.mnd_width = 0,
@@ -357,12 +368,16 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
 	{ .compatible = "qcom,qcm2290-gpucc" },
+	{ .compatible = "qcom,shikra-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
+		gpu_cc_gx_gfx3d_clk_src.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src_shikra;
+
 	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 

-- 
2.34.1


