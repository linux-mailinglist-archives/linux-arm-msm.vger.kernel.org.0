Return-Path: <linux-arm-msm+bounces-91818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMP3NuJzg2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:29:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D10AEA3A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01AFC300CA36
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF807427A13;
	Wed,  4 Feb 2026 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2mzYk3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsSllJpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98419427A0C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770222554; cv=none; b=jlBseHslHX80A8GifMK5KRVVeK2I8aE+z7FbMki34MGKrxbObGI0La/U6OhP7eTfK0hXyMt+2NObBGgFDgxYHlJTN+VPvkUWxEdy2SlXeZm5Wg35KNArj9Qkyss9N+Qbc4iIZGQMwDRfDExxwH/GejtK/X92OD15Nf8ACQhkhkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770222554; c=relaxed/simple;
	bh=CnO4y3VsGfQYxXVySrD+F8oIZqRqy1yQ2U89tkmae5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WlHJEkeHIC5Tovf9oK7EP0hh3vsXpHBHtI/mqvoi91+mSre8OTHk3qL1tNV3h6wX0A+wNBcvQiwfVaV4KZj+4iwTkDpoeMUPJzbf/uZsFHKWZi15PpM9wLOEff9+Eg4yb51n4oyvNvNa+ydHtUew5KmpfUUThblRub8l0oIyVI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2mzYk3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsSllJpi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CISNf1880670
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bIlScLi5z6d
	d33J+kHWnG73XMqR8pPoB5nxdAypevEA=; b=d2mzYk3jH20C7DSbJLn6A3IKv2v
	5xE633sctue/zxNePHgYfthWAV1n94XR8T/ygw7+oMRxR/TJ0LuhI44LEzYAnOdA
	nBGEuz5qh25grtcl6s4FAfWUcNt1JsDRgkZEyq9anvaaofqNXJbNXZZ0WZNNEcxv
	+qMbKKTqcalQORsDkiQW7Pjh6PIirxkTMc40bl+9vPNWg+jnC2QEhJgplVs2YA+l
	iZd54bv0MGGvUbgYUPr/VgXqxfrMHfX5SzL7G2NmswCBNMB2ESjKZhEXq2K/kwlu
	rvFTeuVQw/pWX03pemLbrsouZmiNjyIpCkmSTxzWgwxTEFPhaX+TTw9l1ig==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43n9s6pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:29:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso28105b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770222552; x=1770827352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIlScLi5z6dd33J+kHWnG73XMqR8pPoB5nxdAypevEA=;
        b=MsSllJpiuaGkMaD8pw46LYlRESyrIRi/bfLlWYEFO67DySByTwrDe4N2OeRPRwOtrT
         sbk2lFP4myy9zN/LXRxrh+nO/eu4YaqPWs/mHrRURfhBncnIMWDNnkN2xLH6LFB8pf5N
         ou89glrYq+Fr+sMV7OVBhCDL3BnehrUlbyQee6nVfeNarq78tWWJ05GenpP1Hmh7jLBk
         L36gPwau66UpG6UUB2fmPqo/EN63zOPQ73iIDJsSTzbkfe8/x45WuJNF8x3P+kBsF+zM
         tyCfp5eGUTj6IxNgGwa0JP8j78N9Eg6xTxzUJgW/6Pgdn054Sz/Gm1V27276cBaGp9Nq
         8dJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222552; x=1770827352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bIlScLi5z6dd33J+kHWnG73XMqR8pPoB5nxdAypevEA=;
        b=cAbVcoXwuKp1e+86cDvctu1vIVZlDW8ilaG4fuE5OY/IcjCzMjEif+vrUW+dBU7ZPO
         1Q+bQ82aiUA+Y3pAKxLJm37juFzenBgANXW3fL/ADiUyy2U3+OkWaaUBbB6Tp+/ii2uv
         XJt0ty7E5ubCdWrYI5hBSB0ZyJzHTA9pvCWxVZfaGD2N5vBaenUOlgL1xyT4rfcOcKAP
         /yQpAGPBN/6UsAgP/XFh1QftHw+95kIBByWyxs2zgES5JQBG9Xx/H6w7iTJLNL+6DA51
         VIyCiVjFheAEL0zeEY2ff5nY8+MeyolYlsfJDuAe3LV4DQ5Yw0iFasur8nnbuxGXkCFS
         SMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm8T/eZJIx/FGUPw9/yX9YMwkjF8yn1QOQANMITqvJlxUTsxFUPDAPLNmNb/0H3jKHIodP+yam+fVVOHT3@vger.kernel.org
X-Gm-Message-State: AOJu0YywO96l1UBOZ6D+sGjyR3xsBw/juPAy0niOcqHQNHzF76iqozVY
	jySnxSstgX1l7N4V5tDrMPzkJgodEK1CWHdKdqKg8jF8/whr0WYEeCMhjoFmDaCPMzvbN137WHH
	VKr4F93sNkWxDE9ChBNpF/TuIxM01xplAZ99OEYpx6rI6+XfVxYaWp2S2oHQ71Fv8N97E
X-Gm-Gg: AZuq6aLOTop1mw8AWc6JMo45++9ELOlu1CRNvmXcRpHonWzczCQELRiZrey0lgFD/Bc
	DWkRrpxl/zNEhE5zI1yYex+8uJ+1kASBV5q2YvD0dHgOa6YXOpMWJjrbJNFkMv13zahPfvY0VR+
	U1sTXLvyALIcdBB5y4mlxhQB8wsT+Q9Rc0QlMtafNjy5eEvQyFAtruDPzdMqqaVf9W+Mg0kaPL8
	5KS43nWiaq8i4/IIeIFkKWunZU2UyGTykJL3n+wF9fEI1UnBIdzIdTrv/QUr8OHhhwWuZIm5g0w
	rYt7vlhSL6/CSiTCg+NIbtgN/JfRp6H7zMrN/Y4OmOkaHPmZ4EK0khf2j6ghzNy/Q5yFBSRV4Ts
	x7gx0VJ/f/RZRR4dLVKbT48oLkS3Q5earWhnCTpObcUE=
X-Received: by 2002:a05:6a21:3297:b0:364:af5:d599 with SMTP id adf61e73a8af0-39372073860mr3496032637.14.1770222552538;
        Wed, 04 Feb 2026 08:29:12 -0800 (PST)
X-Received: by 2002:a05:6a21:3297:b0:364:af5:d599 with SMTP id adf61e73a8af0-39372073860mr3496008637.14.1770222551970;
        Wed, 04 Feb 2026 08:29:11 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8515f36esm2546878a12.29.2026.02.04.08.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:11 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 1/4] spi: geni-qcom: Improve target mode allocation by using proper allocation functions
Date: Wed,  4 Feb 2026 21:58:51 +0530
Message-Id: <20260204162854.1206323-2-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNSBTYWx0ZWRfX5rdS3aREKArs
 A9gaMRjxTp3N9hLYmmK8eghEmW4QaD2dc42hoVT3LXadoT0MT21FQktTI+wRbAQHL85XDNC+5X/
 pDXpiui4t4ajwgq1VyBomomWC/Qw7EoZD7o0aVxoy78nvuoy75AnLS/RtWlTcT7Dp4BQkpc/T7K
 bCR4a+FyjK19FeoGU6ZUqo74rzQiLIrbZQpJ48dgLDONJNDcs0gxiIAu0B7PootLPKUGXv5p2Dg
 /rXi3R7+by+sZk3sbvCHbj6cqH9V9XvcxkiaCtUqTtkFcT7u0EazJb/uo6mLxA2nRIG7n5JWXW5
 QbF8RA/rigzuLn67zSWeOWTirXYI9PREpe51cd7shxb/RStpe4MMwDKrs7ib+v/rAud9XduIGT/
 WiVBKeyVsi/wUhAq8Ws6bYvChFSe5RYj22Tqu1fNWrkmUSVK/z6nLqdqMU3uJ7/VwZEBh2DFhlb
 ER5JJXbtsUOl/vnZHCQ==
X-Proofpoint-GUID: xNK-ep8mfR8bF5KHk82ZwJCoKdTpQkN1
X-Proofpoint-ORIG-GUID: xNK-ep8mfR8bF5KHk82ZwJCoKdTpQkN1
X-Authority-Analysis: v=2.4 cv=b42/I9Gx c=1 sm=1 tr=0 ts=698373d9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Bup7t0bCmiTjNce0pOAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91818-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D10AEA3A5
X-Rspamd-Action: no action

The current implementation always allocates a host controller and sets the
target flag later when the "spi-slave" device tree property is present.
This approach is suboptimal as it doesn't utilize the dedicated allocation
functions designed for target mode.

Use devm_spi_alloc_target() when "spi-slave" device tree property is
present, otherwise use devm_spi_alloc_host(). This replaces the previous
approach of always allocating a host controller and setting target flag
later.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2
konrad
- Placed changes where host is allocated.
---
 drivers/spi/spi-geni-qcom.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 0e5fd9df1a8f..f886a9ba56e6 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1033,7 +1033,11 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	spi = devm_spi_alloc_host(dev, sizeof(*mas));
+	if (device_property_read_bool(dev, "spi-slave"))
+		spi = devm_spi_alloc_target(dev, sizeof(*mas));
+	else
+		spi = devm_spi_alloc_host(dev, sizeof(*mas));
+
 	if (!spi)
 		return -ENOMEM;
 
@@ -1087,9 +1091,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (device_property_read_bool(&pdev->dev, "spi-slave"))
-		spi->target = true;
-
 	/* Set the bus quota to a reasonable value for register access */
 	mas->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
 	mas->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-- 
2.34.1


