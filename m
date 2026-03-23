Return-Path: <linux-arm-msm+bounces-99084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB6vMBKWwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:23:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 265EC2EB779
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBFF4302BEAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A5C1B424F;
	Mon, 23 Mar 2026 01:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VK3ts1UK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ysz0nFV/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62521767D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228869; cv=none; b=mi0YQUqRLGOl28RmX3DDIarz4/djNznqftqy8idwxj5bqJS2/Y4mI7pvD9FSoJQA0jjJit/S9IOujDbf3m5uN1H8GwassLxm34OFHWuI3y48u5Oi3Paz5Cr7aYxyGeCCwlIHgaqwPHgT/T3s5sGurPUZWghrxP3CELqHgo6yt2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228869; c=relaxed/simple;
	bh=JJLy7zrimt3lFsyOiPC3Ko8ZS4DbF0joBlDEKSnr9LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pxi9kO9CkzgUgm5CZBjltRmmzBFk+tRLPFD0zyb0x2xcKnl2Xn15cnqjAr1HLtV3NR8oE/sW+10Sl6hCeMtpWQsnWvm+FeNX7GrOEfqoph0r7HkfcOIKuz/SMVQ8galxOtFGrEcVw4emqD5JjIAlnu61A7VvEHf9OsM3fH+iXXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VK3ts1UK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ysz0nFV/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MBo2U62173767
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZbcO3R3ZiiIrrEyD1DPqzyfiyG8GHzXSWNSaApjzNo=; b=VK3ts1UKug3x1HZ3
	zIw6Kv2baYOhQXviVp/5dl017bgimSzvSeqVD6nmCDBKcn4DNaGxJ5zJunpE6g/0
	dWSHTX2XRfTVLelijL4J5Mx60mm5JmlkS6cWWR0ARwaFuw/JRpej7ff4teucA31N
	6/aVcVRxPshLAsgl78QDZiVKPO+txvUxDki67APKVu1+HL6Gs/VoM+mdhRikQah4
	QGNWQpzlW4leQ1BwRGJaP9T0zRBq/RI/ZAGNpmisMQqztIaG8gTWVK0SAdwhANAj
	HZosOhpa7rhZOXfuPs0AEnQlY/hMY5XVKUYfzAgUMS5fQdJHLaRIM2ePZio94lg+
	ATm1yw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8h7bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso132222931cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228867; x=1774833667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZbcO3R3ZiiIrrEyD1DPqzyfiyG8GHzXSWNSaApjzNo=;
        b=Ysz0nFV/t/syzVQ6I04nb6b7V6b00bx3sSRpWorPe9ftx1jQz5S4oi3R+4k3cge99L
         MGsPKNtEjX9ER0Jf7ssZAbilnrZJJetODt0Wo0yrWodk4Bmp34uZoH7Cd2R7Snz0FgcT
         y146GBqojSKMf9n/pvDgv0uImyNppOWQIFmNbk2w1vjldaXJ3Oevv89woZ/BoRcGUqyy
         r090DTBmiLDeJLTVYWNvCH86jDmcpSM38+4KqDE1PPVwm359m9HrQn1RMaGFtIHe9vru
         xoq0zBgry2tVyHZ9hlVMh331bF5voTYQIjrSaiTRcyfZvFi/0GylZXGnIyolX6IOjUxI
         oGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228867; x=1774833667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZbcO3R3ZiiIrrEyD1DPqzyfiyG8GHzXSWNSaApjzNo=;
        b=E8ybYEz85qlH5IzNqaM4n9L863HUSpu1sZLI1UPfYop6hMbE03eIxcUT2WpVC/bRzE
         Xae+0LDx42Q0sn9aZfmRvD2BqAKkk6lrP3wY7L8j8jTQZib7E/FVF0MZijX6fEQt+8eI
         2xsGXKXqGkzu8I14b1PluEbjSUAgFGvIeOp5BbxpG1ZoGO0AoZEP8UOx2iEs7cgfRm/X
         ChNxGTpoxvC/L4FfCIFC9sel8bhLraQ1gTgpOhaG04fpnE73GiU/Pj6b4dExNPikI2oq
         ifoif32wijOt/ZN6DpmRcAmuhWuxY+o7DFd3aN4614mDT0zy3rQE5cOgRBITg0Ci0SSb
         ZGnw==
X-Gm-Message-State: AOJu0YzQiX+9YKBCs5Bjf1N3OioBhT7lEpeRKSqkLnT2kNCgPSQemYJa
	JEJg39FENdnfWGI6+Wj9g31MyyRDKB/SbgQ2F2dDl7yPEmiKL1MeKs0dgHdIcHlu5Qxouh9Bu/D
	YaC/WhPmTLybggmmDyACt/4wXbU//8A/CQWAfPNMP+krtAL+MYiXOpyvOkhKdimmWmced
X-Gm-Gg: ATEYQzwDt7CJ/lYVZlRCcQnHN0N48uHqVmzOiOAjCyvjDZUAq3LDrg8lmLXJNIX0CYv
	KqgchTgb/Qv3VpN3MP2U1P/BWnyPj3cBFWfUWSpXH/iGWJFiQGFH8Y3qgpZz9sJHUdc0nStLymb
	8KpuM2KVynUbtw2C9KuVCjmdl7p1G2J1JeqyAx3FScbLNwXivrxqnIuTZrDaGFs0RKeHGQtDHTJ
	nZoyiOth+TIlczuSYZaoXx7JcPt1sN2KAbY/QVMPfOOzTqCbKnEnbv/1/D/eS/IQGt++bUe+GAU
	imhfrzZ580UxUP2MHklcDKwJyws6H3pvi15wSTSqchPhBOzCs0UQE8mZCXJthhD3TupiWCfzv6M
	QUlZGMTzTuK0vLTe53i23T13stcjSIDKeIE2gLuRq45tnWFOQh6LbFIId21cxASGgDrJDcLI8jj
	tnXc7Jxv+moq0iODnxVvwTO5/W4OLSZkj2ShI=
X-Received: by 2002:a05:622a:a6d1:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50b4a3c9321mr69117101cf.24.1774228866836;
        Sun, 22 Mar 2026 18:21:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a6d1:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50b4a3c9321mr69116901cf.24.1774228866451;
        Sun, 22 Mar 2026 18:21:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cf9esm2108092e87.82.2026.03.22.18.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:21:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:20:57 +0200
Subject: [PATCH 1/3] soc: qcom: ocmem: make the core clock optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-ocmem-v1-1-ad9bcae44763@oss.qualcomm.com>
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
In-Reply-To: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JJLy7zrimt3lFsyOiPC3Ko8ZS4DbF0joBlDEKSnr9LY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJV6vwszrv0OHxmPWsKZWtFNXBkjkRsHjpOVo
 k1YbTCKqZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCVegAKCRCLPIo+Aiko
 1XJpCACP111XZ3pSn+qV3oNYYTwhszJhqMXaPMn3IN7yoMgHMW6qavobBMTDEgOiHkDjB6tNEeL
 5IxlGmalDPxNwZ3fuu2hf8115p9RfJDFg4OZEvShe3mPY7a/LsyaGglIezXyaGL6/0YhDfydUbl
 cB/cnKhChCqAtlQWEPt6VPLiNI16foLdgDJQjq4YLUzdp3y8Gm4gJGNvjz8Az9G8rh0X4GbUKoX
 DK3FisYXxajV4KBzsmILppLVNRnnglUXtIryr9s9dPBLrvnClamPAjwS2AiZalPgQEO47rF92Ov
 RVWiBTCNJ+4V+i24C5jtpZEv/4z9qgId3pcmKiYlskNld6mL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfXyYzsvmRWPzAd
 BYvlxcCNnN/RiiQuBXEzwISMCof/5uXhPQUvY2dU2/kM1pB+lDuFGnxpHT9x6QMTa1SHvwWcPia
 awvjw2CSMmWshXg4nJsZJO2iVpL5O4wuuM0/KmMjkIH6yvgOffOnmROOZDWS8m2yvhTBKD4CWRN
 2ybfjZxZdHR46vVE8pT0xOFSyzNnzy3Il5W4w4x6ZOMfwjhg7F0wbN1FdsRd8kuD1krk4ZeMZzv
 gfmbBZCpVg0JoLvPSXqV0pBW9IaovyvUkd7mSA0oSMd/PVHRW5HVkXE0R3BanwkApH6XSiHy7rK
 CKVsusgf3YMh6aMC9avQYijMRCB6asjzV6cNpFxFRAp6UQZNXOg4TbsYkuLcpNQGb+py7A6K1UU
 72IJ9+QwbikT7L4nK1fe24Ee8M0Ch8Wib3uQY4dr2gNn6Xln4Rg40d1zaeRPU4B/vpINtkbV+nk
 T0f9xb0WP7JBsI5LT4w==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c09583 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xyGvnGGLPPhhD2GXcrEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: wsbOdKoII9blhIDOGnPGHQ8Wky3LndTc
X-Proofpoint-GUID: wsbOdKoII9blhIDOGnPGHQ8Wky3LndTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99084-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 265EC2EB779
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OCMEM's core clock (aka RPM bus 2 clock) is being handled internally by
the interconnect driver. Corresponding clock has been dropped from the
SMD RPM clock driver. The users of the ocmem will vote on the ocmemnoc
interconnect paths, making sure that ocmem is on. Make the clock
optional, keeping it for compatibility with older DT.

Fixes: d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus clocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ocmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index 6a23f18b0281..dd46bb14b7be 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -308,7 +308,7 @@ static int ocmem_dev_probe(struct platform_device *pdev)
 	ocmem->dev = dev;
 	ocmem->config = device_get_match_data(dev);
 
-	ocmem->core_clk = devm_clk_get(dev, "core");
+	ocmem->core_clk = devm_clk_get_optional(dev, "core");
 	if (IS_ERR(ocmem->core_clk))
 		return dev_err_probe(dev, PTR_ERR(ocmem->core_clk),
 				     "Unable to get core clock\n");

-- 
2.47.3


