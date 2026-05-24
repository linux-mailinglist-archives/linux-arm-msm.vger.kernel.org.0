Return-Path: <linux-arm-msm+bounces-109517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOp9HFxRE2pP+gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:28:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF05C39B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B86C302A4DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B24831326A;
	Sun, 24 May 2026 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmBC+XUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtER+VNN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E2631280C
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650774; cv=none; b=MoJDLW1Gn6VNH/WYdPWgahVON7v8fULFyZ/JXojmzizh624jgQ+oPnNbbPEdu2xS+JB3SCTFeBQbnbyO5hI9TSEYsXVOZu/xZ+Q74kKEXHqrkv4BH44MODOz3cDqr62cqRcHOqGd69mIfbn0czEaxGwntLYY0sZ63AzKlBJCIzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650774; c=relaxed/simple;
	bh=capWsiQ5rJGhl9NvRhbnoZUTwqGnZWyJCfohq7HeORs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djwO1xZyQOWVwunx8jDOw8ixVO6Gz6qh2YnkeJh10OBV6WgrIMNsw3xRw2uX+K6eg6EQhwXa/7UvZTmKS2HYUtULik01nTUaoVY3ExCOowNLq8qyAXiTAP2qSrRIyvGLWpQr+nYFdrXpqBhoPGlB55mNwgdhXk/c6+JamlsWvBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmBC+XUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtER+VNN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O7w5da168750
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFsYU4PoJlad7DzZn2ri3+ulmwgZAGOVL0cgWHGyGXI=; b=RmBC+XUFmq/Hr0+6
	P4HQ+kLDbngB1TjfvtVvqaUUwnYkdplmzmDnMWkBNfRGTOt4i206m34n06DxkAqG
	QbJO0gxYrePw227NVpfEnlsOb4yID36AkHEsi+5Dv/kCrSH55aKLNOJ1fb4HMuJ+
	q4zUUPydsCP81WJOg3CVZIWs7gjgFKpwl8wPn9A79pU7+53TjsGQR3nHGcrBuq7R
	Ylo4oYroJRwaRaP/j8MI3DAeWPS0LddstyrkyriIgXkwMPJWHkd84iiD2GM/c2lu
	9YF3UydaLX5lJ/NYMbQjtzorYL5uy/ehJlJXa33PhQ6l85PFbROFgIFU+YUBJnbX
	GcEDGw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0u31e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba838d3fa4so86102025ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779650771; x=1780255571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFsYU4PoJlad7DzZn2ri3+ulmwgZAGOVL0cgWHGyGXI=;
        b=AtER+VNN+V5kwCgafd9qSEj4mXmvlQpOb6SjV+18jYbZzx+0WjtB2cnZxwswmFxD1f
         rZPKzi0/JDWZWGWtZfqdpwdYFBqvCN791Tko+DbKMxI7eJkrJSmKSh8hGEfh3mHuZM99
         UAGQa9ZjfFoaEBy3Ap9Xq0hGtRUkmgCqgPrDp+IVjfwdfImid792bnqHEkwJd/evMoR/
         26km74exs53DlZTK5h4nYMHAzjnpjTyXyaQf1Rm2RpGkui634SfiurNeS8sPpGqnv1qh
         PNC0DXeVIMBxRRBQ8swGNDxHMcyzekMhq2Ei6AddBhSejpxcigLfB0U8TAUX61v6kJ69
         Ei4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779650771; x=1780255571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sFsYU4PoJlad7DzZn2ri3+ulmwgZAGOVL0cgWHGyGXI=;
        b=hgBNuaBUdu+haDe9V0e9PZ/QSlWS12tZ3uyec42hUkBF1D6Y/ypS5E1B4JfiJEZLgE
         9JgoenoFKY+UVIwYBcqUCyGFusVCdq+FjNbX3ECBkrzw+FFuuRrU9R9+tFg3T8yiprDF
         xNjYV9XUS2ENowQd66IXyeGVWGPhoMID00UEWy00HDc2Q9kjvCqMNBXkq3Imfw7vbTFC
         cbBonhTxuj20IETMnoYqmh468EZyJu15vqHJc5Nj8Sdm0tFB4QZFU7qj7Iv8+q5oul37
         cVhVV5l0+3/FHGgzLBSydwCojKFeA4fjdt5iT5Z9jEM74V2duR/1w2qr7aw3rAwDYsjD
         A8bQ==
X-Gm-Message-State: AOJu0YwGn9S3HMnrBdd4nSpr53cNwt8Mwn8Ah4RvQkf8TzcBIt9ilECp
	ETkgSzi8oF1/ZiYu7nI/PKMWMimqoRw0Gy39qZbGJCwcbrI6Wv9/a0kQWvfHNZ9j1ZF70qTuOfW
	X/jkdKwYxd1sMuNgWBSAPQHR6gdbtv7y6Ad2iyo+9PeQTh+hLAkjXNXWVaS7pEkkry5ww
X-Gm-Gg: Acq92OFwGfBuWXD/e1sHclKuKMMHAP/lMzhVS3WWUZOguVbKdvA3vQ/NPsC3R2TMmHz
	j9Q+cAbB0RYa7BlKYa1v3UWSpTlSVZ0C3PP7lW8OztOexdJ1P0Nbfh/ELXrZ8YirGx4ehEj8siv
	zPrevf6u1tPh92DrxA72eJW/wCFxrzwTg/nZ9UeWtB3bN5UoGFdPX9uqRvOA5Vy5t+yhGrZU0mU
	MCBnXcrmT2Thrff00PQBW/lKsTlrpCzrpZfCRRU6np9lvMwvV4c7gtF8lp58K01oLk/EN75FGKg
	M5MX5n+b+IBNfUuheM8JIQ9T/LAC0okOtGAHUzQkcOtRTKjl6ROKna3hZdYJsfGvAMUMBUzc+XV
	/lO8mjLOMJ8psOAsbZBJtlVhxRj0BxjFrcDaBiu2Ih0Z8IBf7RqxBTFKoBEo5Q8iDnOuMXw==
X-Received: by 2002:a17:902:d589:b0:2bd:4d4b:9143 with SMTP id d9443c01a7336-2beb03663bcmr117283085ad.8.1779650770946;
        Sun, 24 May 2026 12:26:10 -0700 (PDT)
X-Received: by 2002:a17:902:d589:b0:2bd:4d4b:9143 with SMTP id d9443c01a7336-2beb03663bcmr117282885ad.8.1779650770492;
        Sun, 24 May 2026 12:26:10 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce2cdsm75329945ad.29.2026.05.24.12.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:26:09 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:55:49 +0530
Subject: [PATCH v9 2/5] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-enable-ice-clock-scaling-v9-2-c84613e9ce47@oss.qualcomm.com>
References: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
In-Reply-To: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: rSZhQK7bZ2UJlzfA-n_nDqoTa0hTRo_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5NCBTYWx0ZWRfX1kpMragD/u+T
 v9PDkfpeZZGvmrpjX/DSi+b488rOHpSqUngj/FqYHiVX2ubswNFdE6hTAPVMG9VNRGZAOuMzlC1
 OjVxOJ5pXT3QjyNe0aAL2iUl1bxIZlXeNMEAWD3wPZULaKxKUWCVIh81NXb//U1AH1Rmh6/YeML
 giG5B3bJy7V5cWpPqqE/CIWdfDymglc1ocgp3JKWMcS5rBN614naMd2M0sjsp/N9g3MufCmQS1t
 PFl04A+cCjbG13mWufVLUdac9Lcj5gCTJO/boLd5YK+rSMdrKYs8fKqG7x4p6bRSP9L1jGygIY3
 QIIDLA0G1ejdakcY0okhWKZYhliIF9MNaEAdOstK1GwhGllJ5Dm6GbOs4OZXQzw5tGaOM9rYeQA
 Q4ttR9KR1mgVXbN/x14xo/Dnav96RVz/TVt60mi+v2BdYsuzg41nNQmcQ4jO05dkN2df99X8GS3
 0xOwzrBHIUBOVuhfjTg==
X-Proofpoint-GUID: rSZhQK7bZ2UJlzfA-n_nDqoTa0hTRo_D
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a1350d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-RVjIYUuWhs3u9hRN0oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240194
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109517-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7FF05C39B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

For scale_up operation ensure to pass ~round_ceil (round_floor)
and vice-versa for scale_down operations.

Incase of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index bc037db46624adaf494d08f6c2a2c55c9ed24606..b248d8db8997341117d014320d22fdf1ae7b89a6 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -306,6 +306,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -340,6 +349,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1933,6 +1948,12 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 			return err;
 		}
 
+		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
+		if (err && err != -EOPNOTSUPP) {
+			ufshcd_uic_hibern8_exit(hba);
+			return err;
+		}
+
 		ufs_qcom_icc_update_bw(host);
 		ufshcd_uic_hibern8_exit(hba);
 	}

-- 
2.34.1


