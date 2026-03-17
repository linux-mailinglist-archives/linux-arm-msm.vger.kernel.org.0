Return-Path: <linux-arm-msm+bounces-98125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHzECtQhuWkrrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:41:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F1F2A707E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48D7E303D7E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD1D35DA42;
	Tue, 17 Mar 2026 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCW2JEum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXZrlg/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6C539E198
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739380; cv=none; b=fy7DPg4MjJgH4zvAKNhTE7QLAZxCS1x5vVx/tRgelBZdh6/CwYLVJIqwel+TKJk0dkSOiQky+8uwObvXdopIAPoJ8nhqS/MsRVvdjr+rbYv0Mxjsv5La5qMAbPCWQxMx+BuR3ys2+9vbjp8XsSBqr+hN8Rhdp+L+XKElkJpGuyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739380; c=relaxed/simple;
	bh=GRasFOQDQnuoi6LdOvdCuvHUGo8tuUdcLZv2gGWTa7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ftA0Euuf+BtZBFWzGltmta9Xd83/lUvTzMJKmbspMOE+T9ZmTpxuJog0ZVmZi9kqGMZ4Mt7YRb+gmWbWoJNkAU+UwUk7ne92pU0B2CUlOlSToW7KBkkPWx+DyDnHoFDOcBddATWe7nRV9vAhN2wofiBiTQcpT6cAQYL4rW7fXiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCW2JEum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXZrlg/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7JOdf3124391
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K38ecOXWBMhUStpTWn+W7TDtJFk9bdxlpPeuhwPlVTc=; b=RCW2JEumTDgqfoZc
	h6J5QYGwLFJCRzNTGS8QA6cY2Pa0um3aSQmDaA+H/tzB0O+NUG4Ifjfn5psRtT1a
	BHfmtiVIvtmoBujayF+6OOyDXU5NPn8y60G14qjH/BcTGvKACI180g2EEI+j5FKm
	d7z+6Ei2su9wFFlmtLXV2yQ2IWs7698l26nieZJ46/x+T0VU6kJmqbwbcKUjrmnr
	AfX3jCiRG+0y/irlef+LTLUC2HhHUoSDKXVvzClJzaM89EvKHlhwOsK1AMImbUaz
	kk440VHILJenuS+tgLIyge99dqH4p3zzpWhMtOxt8Rjo1CXdDBzpr3Un3MDGs60D
	ZRryWw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2fbrfcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3595485abbbso6868559a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739376; x=1774344176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K38ecOXWBMhUStpTWn+W7TDtJFk9bdxlpPeuhwPlVTc=;
        b=ZXZrlg/XVTSDL27z0anP2RFz4JVT+vRygYLJ9nJXVfx/oFOy5VCFBe2+e5NQwgS1kU
         ooapcT8SlukhP+wttpl3Js70a0oFWVZuts+8VUCZyir+oPSXmektdhw86kPppNtpWGgw
         uCWr7GLpjDZ6ucZgW1RdqHdtmnHlS1mZzxaieL38dFCUJMCKxaeZpDxyHp8wsX07HQIE
         blUY2OARK0YEYxi9b3nvZr55OZa5jwGPXuIfHWsTANncGf2g1rX+3fMrz2MKus6AB5cm
         rDssMF6lZ3+TNJ8Bi5IZ06yc/uhSkJUC5S4f/SMIZIzxuLvKPa7pwlCss9FVTmzMXj0b
         0k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739376; x=1774344176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K38ecOXWBMhUStpTWn+W7TDtJFk9bdxlpPeuhwPlVTc=;
        b=ekdYd9THsjCoRNi/vZAv+CPYbbZqH0vHwYaEmRVpgP84qPEPQgKLKPoRtGW4fCHVDD
         STa0i9sbYdZwUaOTrm1+VEiy/Le+Y1ONvhTLYgFLXAHAK2ICGZjGkNOnc4JPDRzloXCL
         jgZD42l9MTEAq7egP8+9mkvULOnwhqr4DN1a+lpqADNd5RHTQdX7COTg65xp9WgCfdaV
         R/sE/HPz6U2z1sHNF0DxeJ8vUeZIoHASL9NGcz2cvXUxPVbajH3B9U355+P62Ky+8RAK
         gbb4OTybUFLCARjk3hpJR166whGCb1/yowgaUXXBla1gzgm5BYWJZnHuKTBb1PYH/3PY
         ncTg==
X-Forwarded-Encrypted: i=1; AJvYcCXTwKoxWyel5PTQV0HzvmmG3sU4nCGQxxjZe7e1mOS8prQbiiJ2Yfz/+LWt4b6VozqJzurKZOr6vQhny/Rt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw63g1QKYcplQ47hCI8U0F9lJ0kvQ44HJRwPtJNbw8LcHR/pd4c
	1jJ/2ooLjMHx8H+mHXDkEq20bbGwigJbZsNDkSAD3rCPaUMbEix0BOCd6C1tLyxYQpQav/bHIe6
	ro4Y9T5tQOZnieF9zlkKDHc2Q//+oP6Ogum6crMYpiwYhbMAOcr76i54dKFjqvn5L6qdg
X-Gm-Gg: ATEYQzyrOorJ1zFttAN3mW+dNEPflGjZ0gLfoBCg8O0gha/2v/E4fqXLG19L7VGIyyL
	H0MKPOgkg3DLzg3RySbYyHyGWQSLo+MhdVuAbuKvDFhsHopxE72Qj8xaDKDpK0gm58S27vhMFqk
	ptuv8uQUMeW0ZWBD8m9kEFmAHoPrn9nnbZ3g5rkPCA6lJLF2wDlUZmnkLJvnG1LNkPu00f9ZoiW
	iSEdbAmWVY3nrUun73ufHxH5Whis04lSlyHxj/F//RX1Z3aPeVyhGPA4KZshdnN+HouqIQKKXwB
	QYi8pOICDbkzY0e+7IwkFbc6wUxxQoNNUR9m+vUZxZqb/g65sIMi40ZeFmHMNgpBbrVFS5Sc5Ln
	vLwWKCr4NLNoOngiDlRUywcAsYpaT1lbnWvQRa4KxQQNXL04=
X-Received: by 2002:a17:90b:1648:b0:35b:9ab6:1d4a with SMTP id 98e67ed59e1d1-35b9ab61ef4mr6008211a91.18.1773739375977;
        Tue, 17 Mar 2026 02:22:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1648:b0:35b:9ab6:1d4a with SMTP id 98e67ed59e1d1-35b9ab61ef4mr6008185a91.18.1773739375465;
        Tue, 17 Mar 2026 02:22:55 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:22:55 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:51 +0530
Subject: [PATCH v3 12/12] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-12-53371dbabd6a@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
In-Reply-To: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=2504;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=GRasFOQDQnuoi6LdOvdCuvHUGo8tuUdcLZv2gGWTa7I=;
 b=a4n3IxWFcsTR5Gbl0Rca2o6ovz6cpNADv2ocVDC7UUJtQvbi+2qJEobHHXL8L+yvjwzB892io
 BrQuwGTC+WCCgJGFyq1XVTOKaBQCPihkhHfoNHlB3CPl9hv0iCXY4Nk
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: d1iM2NlKGoFasGTrVnc9fyjv0pekwO7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfX4DJSqk1W8z/M
 UdrP8o3WbvF3pYZolB+v0mqAJKG9qKiy0+hwQGIc19HvjGjl6XY/Brop0hNMA6r3r6UUCrhu6Hy
 SuuJZgSlT5rb1JC0wua9dHIX8DsZN/+qSbxSXcwDW+6bnAwux4zoKJLjzvy6abD3zScYAnjjuqc
 VAEm3jyH0bB4iTXSJlX2qV2ikWkTUBoyp4II9Rp6MjDEyYby3eCr6V41m2GRpcjlX0FShvY+yfB
 8+DBtB1ovKcSyb8+zAGKhob1wAtaypAc4ShdVNykI+3OZbzDYNUn8ozZUUo5rMppP1HVVxiL/Pp
 qe4+W6OZby01qvSdApESUbrimiuPC0djiIdjvCgyMsdfqfsDONWO7gVhVqDnxLsqjTwSt7nMnBe
 AUw1VHd7IFKbBqTaxDHLKmrASPYQQ0y3nOnmMgRa51e4AoNY6NAmscGSdRaH2jsRDRXP49UwT19
 L3ilRshOnltzoShc3aQ==
X-Authority-Analysis: v=2.4 cv=fa6gCkQF c=1 sm=1 tr=0 ts=69b91d71 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DGDWbsvPyNGGEFbMfx4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: d1iM2NlKGoFasGTrVnc9fyjv0pekwO7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98125-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32F1F2A707E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
de-coupled from the QCOM UFS driver, it explicitly votes for its required
clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
not passed on the kernel command line, to avoid potential unclocked ICE
hardware register access during probe the ICE driver should additionally
vote on the 'iface' clock.
Also update the suspend and resume callbacks to handle un-voting and voting
on the 'iface' clock.

Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..bf4ab2d9e5c0 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -108,6 +108,7 @@ struct qcom_ice {
 	void __iomem *base;
 
 	struct clk *core_clk;
+	struct clk *iface_clk;
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
@@ -312,8 +313,13 @@ int qcom_ice_resume(struct qcom_ice *ice)
 
 	err = clk_prepare_enable(ice->core_clk);
 	if (err) {
-		dev_err(dev, "failed to enable core clock (%d)\n",
-			err);
+		dev_err(dev, "Failed to enable core clock: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(ice->iface_clk);
+	if (err) {
+		dev_err(dev, "Failed to enable iface clock: %d\n", err);
 		return err;
 	}
 	qcom_ice_hwkm_init(ice);
@@ -323,6 +329,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
 
 int qcom_ice_suspend(struct qcom_ice *ice)
 {
+	clk_disable_unprepare(ice->iface_clk);
 	clk_disable_unprepare(ice->core_clk);
 	ice->hwkm_init_complete = false;
 
@@ -579,11 +586,17 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 	engine->core_clk = devm_clk_get_optional_enabled(dev, "ice_core_clk");
 	if (!engine->core_clk)
 		engine->core_clk = devm_clk_get_optional_enabled(dev, "ice");
+	if (!engine->core_clk)
+		engine->core_clk = devm_clk_get_optional_enabled(dev, "core");
 	if (!engine->core_clk)
 		engine->core_clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(engine->core_clk))
 		return ERR_CAST(engine->core_clk);
 
+	engine->iface_clk = devm_clk_get_optional_enabled(dev, "iface");
+	if (IS_ERR(engine->iface_clk))
+		return ERR_CAST(engine->iface_clk);
+
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);
 

-- 
2.34.1


