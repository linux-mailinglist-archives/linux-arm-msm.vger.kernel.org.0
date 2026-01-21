Return-Path: <linux-arm-msm+bounces-90040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAjcEoPpcGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:58:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D5158D85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9409074A16B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB4248BD51;
	Wed, 21 Jan 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zwp9SkXA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtULiLcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02F48C8C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005730; cv=none; b=U/koM3acfGY3clBkGFd+k4UlKa8k9osmYnzIzPQ9D//1WzDoouVaxpsffw7ZMPxk3fBzVfWdENjwPCZ3uC1WVlwk/w8eS0oSFZH3LvBxxjURUeW/9Pb5qdguGU9UXtCmx7uK27S9Mf/Pgi7f+ZxtGu7+KEeBruqfCg2vyou0nVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005730; c=relaxed/simple;
	bh=DtRUDSp9HgQM1fArMPdLlzqxjtYmzLPB38SKtCYKDSY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ilq8xAX71xCFgTxJwn3ON1xpMFmVkKazs6K0zQSChSjQo6QSmekJohCT0gULzg08eU+cNTLGibA5OnJDTGaEM1GowWawti51/FRXkXpEK7gUuSuJ8+x63VKvReXqe3HD153atOiio0W33y4vjakEg/QP5dzYWUu/1Zx2FIAI4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zwp9SkXA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtULiLcp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAeTub2817204
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gn04+KMozYi
	tSvw6r/mjK+emebzFiPF0P7Y1beA9hK0=; b=Zwp9SkXA6/ebpK5Sae41O7hDQVF
	oBO4gaNtyWvZyocs1TgijQ7ysiq+Q2FZZeIaT9heVw45aEvk+8pOHhpCbXKAdEGD
	VFecwnWW3RUqSsnkedO7sJaWI0baPu4LIgQHJS2IoYXHPRQ6AMCVH/w2oL8F+PLf
	g+ACpjPQmjR6J8TE8fDo+7JpJP+2cQmiqcawZv8YwSC3ZqDoqjk0jW722P26ZqX7
	JxuBG3Es6KoLD85giRg4ks6kFmG2It/sWRenYge1zh7MDJuFvE6WH/4pW2ySf1Wo
	DyYlTrMCBttHNfDGtiogQnvM+e00KSiAjcEZEZmYDz6fBSsw5y0f2FkDUDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btw8kgptu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c1cffa1f2dso301458185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769005727; x=1769610527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn04+KMozYitSvw6r/mjK+emebzFiPF0P7Y1beA9hK0=;
        b=WtULiLcpFN3e9SYi0/suaG/sCrmF0kTxEIuhTRUAeATekj5CWn2hK8ZV2YoV+uxxwQ
         1fGBDLHxgOdjnit/YH1cpg64Npe1aDiGsrW6zs5CDun2h3TWpsuXfQLJ7ocsY48mT5dr
         DF9t85UqFFB8UXZcVEPKeBfvYCrLJn5RjKRQrU5IgVjKrMVLjJkhL7TXqkjq9GIV7ZOT
         DruKDIFKBtVGq5l/z9yErestBTjOzV4Zt9UofX7dMHo3Hs33IvNeKt8jThMfrkU71BEN
         ASoMQ2hOpiVx6NZd/8wYPuqvmWF6XLSVi7f6Y51Bx7GoElhiBOl2RKU9pwhDH7AyVunM
         oekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769005727; x=1769610527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gn04+KMozYitSvw6r/mjK+emebzFiPF0P7Y1beA9hK0=;
        b=kXDQAgMAbtTJngnaUFEYgsKjUWhc3Z/gYbU2lLErpajoWQTFk3GRYHPIj9d2KsFo+O
         O5zoAQzb29Q8J2DhTD8jR4jQUwpfi0P47X8UCsKjifd8QVPJocEBjkc/LHwKPklQImqL
         a31c9xNBB+Y/tN2aCY9Gnkb6c5DrhSrAtghZjOku+ElyQKrQ5Z4EWVBNDBVVtRkUISor
         f6aql2gjzQNas1yvd1xOQV5pyOjBowGTo0z7+TdKgnzlQu5gRVDDHnUAOoTZlKf5gbC9
         0gSF7EYRqnB0sQ82/W/hZFUXByJJ2BFWxhVUJ3ACa7OOaUSMMrHxe/DTa/dGZHnTW9Ug
         08xQ==
X-Gm-Message-State: AOJu0YxkhS0gxOvExsZMR6YuSYcTUi2S1ZxbmHfD4In4y4WmyWoKoUWQ
	X4lG/fyC+O5XeEmhJ6E1W5Vn7xw1NFT3c4eeYe8s6UjcQF36hRHhJDTWYj58V0a3Yxx2D+UlEOe
	4Tx+7WMA0eBtAJiZGb/zfpIB/YmWYCFOEUN9F2JZljyOWTSKSrUhwvAE1zG8a5lTMb4/N
X-Gm-Gg: AZuq6aK1b5pGFkEy1Fj2qnpfUvjxOeAaob1jitb8wGUFBrAVJS8WIzeZcKZoq4oMyk+
	i9GiO7aIXAVDGjZ9WYCh5Yc9avz/ssFLCAoKZT8vsBlRUcto/KGFcqK34ZZIbKfE7gQ0ZZl9sOq
	K8tEDTZNg+U1to2cht+fPHmvmo0aYDxQWwozkXcqXdtJbpJaIxjW/edNYw17wiC8pLNfyu95m1N
	cC5S9DMOMLA1M6Yya139TjRNGl7bXCYcdCNLqtmxN47lTgsY+HsMwaCSzkiQEpAiqpuJXD3dsAk
	B7eLWJvz7gU1zwaTTDfAgFeQKRQae839+WiKBd9f7+M1HIRI0wewgRlmatOz0w2oVTllbVPHLCc
	FmXaQ4feiDu4NsNm+s6mhDFnf930CT3qI17es/BETwS28YBO+cDucOQ+DCPqi0OpPAncvkIFiQ5
	b34Ojx
X-Received: by 2002:a05:620a:4606:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8c589b9706emr2839653885a.10.1769005726777;
        Wed, 21 Jan 2026 06:28:46 -0800 (PST)
X-Received: by 2002:a05:620a:4606:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8c589b9706emr2839650685a.10.1769005726294;
        Wed, 21 Jan 2026 06:28:46 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a0d:3344:10b3:c488:b09f:b54c:1120:95f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435996540cesm6098180f8f.43.2026.01.21.06.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:28:45 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 6/6] phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend
Date: Wed, 21 Jan 2026 15:28:27 +0100
Message-Id: <20260121142827.2583-7-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEyMiBTYWx0ZWRfX8gdaeQ492WTe
 xLrjwaUMibXBDE07BXM/m0RlXw3gt/8OaqSLn5sM0A4f0imPbgjS9iTp1PCff+ctp1+lcmQru+Z
 l1NCgboGfSSmNadUe/rH/xsw1W1GVjaE560u3TcmyMnQve5iSt0qc1F1qvfDIUoHlHE7lZaSF3u
 EZ6VOlKGparpaKSQ5J3r3i0ch3OG9rd2gy/jGIuug0Kppal1B6fwA3MH45+iHp68Xavf8mnYAWH
 MZFjQCcDYAXAq/XdkjRqkEjmbFmCBBRoXhek234CLlylm8KIuJBijDkhc6ArY1rhaDkaBk8xxz1
 MEtCuwIIujf1V3WlLEZX8DxljRz2elSeFWWf50sF5Io/oDvE2KPBih0YXk4bYOxXN56Usl4NcfN
 K59lnAhkOVVSkAP5oHWEX5QM1B0q/8NZy5x2jdtbRk/YEXM89vd8TuffO5MFxwJ/Uw6Yo+crYiz
 HMMj5A/Ox31krD0LvBQ==
X-Proofpoint-GUID: 43H2H_i3jrpqOa5wD19yJihMCetslRtE
X-Authority-Analysis: v=2.4 cv=BPW+bVQG c=1 sm=1 tr=0 ts=6970e29f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=GnikDSHSz1V4xWV9RsQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 43H2H_i3jrpqOa5wD19yJihMCetslRtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210122
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90040-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7D5158D85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enabling runtime PM before attaching the hsphy instance as driver data
can lead to a NULL pointer dereference in runtime PM callbacks that
expect valid driver data. There is a small window where the suspend
callback may run after PM runtime enabling and before runtime forbid.

Attach the hsphy instance as driver data before enabling runtime PM to
prevent NULL pointer dereference in runtime PM callbacks.

Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
short window where an unnecessary runtime suspend can occur.

Use the devres-managed version to ensure PM runtime is symmetrically
disabled during driver removal for proper cleanup.

Fixes: 0d75f508a9d5 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index eb0b0f61d98e..d1288a6c202e 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -599,13 +599,17 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	dev_set_drvdata(dev, hsphy);
+
 	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
 	 */
+	pm_runtime_set_active(dev);
 	pm_runtime_forbid(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
 	if (IS_ERR(generic_phy)) {
@@ -615,15 +619,12 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	}
 	hsphy->phy = generic_phy;
 
-	dev_set_drvdata(dev, hsphy);
 	phy_set_drvdata(generic_phy, hsphy);
 	qcom_snps_hsphy_read_override_param_seq(dev);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (!IS_ERR(phy_provider))
 		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
-	else
-		pm_runtime_disable(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
-- 
2.34.1


