Return-Path: <linux-arm-msm+bounces-90287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPoSGCMgc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD0771885
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB91430160D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE3A346A08;
	Fri, 23 Jan 2026 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9mEo/18";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9tRCM4u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F095D35C1BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152362; cv=none; b=C5/UH9LUbbO+QFeQdkyFoZle/MRAGDcBF1dVNWVi5P/Z6hzVKrNBDcLuASwTSIjgMAxEccdfjmr62cpi0M2sJUCv28AJ3caVdIWxiWkprASHROkzHBrMachub8jvK5mJ32jUXjMyfbz2G5foEvopJ5lcDsyoeE2EEHtLkBlGlYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152362; c=relaxed/simple;
	bh=H2nsn2ktrgzhdTgsNjVFwrqt4bFjmycDPZWh0G7M/Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRlPTSXpywhOxjhoaSHCgexhOPIno2Yl0KAzTtIJ+/1Oa9L4UXV6TU07qNy5sGa/BcqDhtQmrYQe4HC7O1hIESNjf2Hi5K9s64HDa7tibOYAA4Ex7F2rkNmRBChdlWkFUlopNf6jRdBxV7ltWwovRQYewlGTs1bhQG4MoyIdVoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9mEo/18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9tRCM4u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5U38o3677732
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1rGHTboQEjoEmpOjXSEJmAbLioeW0D/SeZ6jdLcwJE=; b=d9mEo/18+sa4OA1C
	M4QBoy41opV5kh48sM0cP+qV4REPt7qkpk4hM4KyOJWw/aZqyJBorlITMtiV9SJi
	1l7wKyinpycNtaxE6KZLYj2Ys62+5+RlBRliTf+GSQpXMCCaIJRcBvI0Ewa4Zr5L
	J9t5vgzpgIcc5mLKh1ZWi1ZPAYdcERF4XYMkajm6xbZYaPPrD6F7hwq4VweL5SGc
	8ia32gXhsldHL4fSu+dITQ+x4z9Q/5I4F9wUhTU976PaoL2rg/P1OgQpZRLx0wQP
	DxicEqK7s7UySxXDtcKU+w9aRT0j3GMX/vHhpESRb8PrrBQkYEu0lkDhp8p2m16O
	JzLnoA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp2emp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a77040ede0so17866645ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152358; x=1769757158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1rGHTboQEjoEmpOjXSEJmAbLioeW0D/SeZ6jdLcwJE=;
        b=G9tRCM4usdRjxbtCtCq/iAtJf7E28oEYoEuo2KySa9lUJFuZwf/x8nnbkhXXUmm9nx
         7cIsNcXPbJ2yzLfXlMgFtjXoatBG9s9lVZUSM1Y3bD1CA8DMjiqWNE3wVkTZLWEC2t2i
         h+e6hMmz5wXDhY4xxuU3sKWZ9X7EgP2tfllcujk+gUatS68NVsAJQQallovd5vmk1CJ9
         eI+kLKN5Of8EnrbmwUpVbFWBpf2isyPCqIzTmVOgTZOPRkDPer/AIPYj0ddQVFEYv/cM
         1BIT0RMhUk5aq4aZEpe67foQX/pyhQs3Wc7NbkcgQUXhVMOn4BdKH5lKpHR0yVPiHjoB
         7OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152358; x=1769757158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S1rGHTboQEjoEmpOjXSEJmAbLioeW0D/SeZ6jdLcwJE=;
        b=vGtxW3vjbSGIzh4oOzaFmLiJYo8NU6hnZanodruHXxcifLR8B2V0MveLz3hz4G9Ard
         w8Vp9RULE8I1VP+L6+p5pz1v85Hjdnc1Ia1ZR5NEbhfti+CQXUlT7jWGFrrpPWASr96E
         nYdWf4OYhTkruWhQU0McqfU38tJx3f6d7sx6QlSD0He9KP6504D5IRWjxXfu9X/YpPAU
         XVUQPD8utyaFSYYshTrFqQuty0vD6twXTAvCcFWmRcMzw1eEG2WCGdqrEZNuq5E8qU/L
         p6qBoWmvTONDQokmVP8Nk/BL2Yao14FjZRORQFTti/wb0bvfArN9VLJiybbnbvikIiFX
         h0bg==
X-Gm-Message-State: AOJu0YxA2r+sMxbyQ19TE08EmbYyqDC5S69T7Ejo2KDHiO6gSUI6Y3I1
	jKMw+RmcbNgDOeP2V5wm7BQGVMWmllCZ8lukoNilwqqNWh4qbCpY6B0uyObbnRoRDCvp0+Fykoz
	bswIkYg64EpmH0GK44VchywFBIePZM4ysT6y/3sG9PIQmtb470ENdgy8zWRpfNpl8sC5XIg1T+C
	bN
X-Gm-Gg: AZuq6aLlcMHS76yNqbPSYnTXqCVFPjNn8In5772hyPvOccKS9DncbC4mGkadR5LxaM6
	Ra47pUJlqVW+6wKmvF7QA9qNkE4mtZtquZ52srEDWZcQs2WUqoE/+Q6zMBWA7qbpHQIs2git/I1
	MzDacY9SM+96Zimw/SmvP/KtLnOuAy9HE8JgU2KI08SFhm4LbobWofJ7ngX6eusLS2kdI9dj4Wz
	Gg92BnMtskVdp+pMsEUdo7P1HG6maywmQAbuqYcUmkZeVhEF/AMisusFBMqyDhHOuFnwcoT0DQA
	f5yxCr8v5G7uUPbmef5Dpw9Zo5+CRKz2VAb6xyjwHakTWosCj8zBFUDBSevYAODKX4u0r6LZ+do
	kB9kC6EjxY1yCNBbgHRCt4syMxdxVD6handVRE8Smj/js/fc=
X-Received: by 2002:a17:902:ecd1:b0:297:f0a8:e84c with SMTP id d9443c01a7336-2a7fe75c2c5mr17427005ad.52.1769152357548;
        Thu, 22 Jan 2026 23:12:37 -0800 (PST)
X-Received: by 2002:a17:902:ecd1:b0:297:f0a8:e84c with SMTP id d9443c01a7336-2a7fe75c2c5mr17426745ad.52.1769152357067;
        Thu, 22 Jan 2026 23:12:37 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978e0sm11336775ad.62.2026.01.22.23.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:12:36 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:42:14 +0530
Subject: [PATCH v3 3/3] soc: qcom: ice: Set ICE clk to TURBO on probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-enable-ufs-ice-clock-scaling-v3-3-d0d8532abd98@oss.qualcomm.com>
References: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
In-Reply-To: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=69731f66 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=u1bwIIJuvd_SIhYoViIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: BSFREzPmRJYfyWxlFevSG2JOECNN34Ly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX0wI9EhT6xiVQ
 CZPA9Q7Q2s+LwKYElaft4cibn4K7hJlWQ6inwTZY17IRPUvBEBwTJ/bWxOgyLLf09g+15cqejVd
 8Mlm9LHsjl1VZnzISzVxUuL3dg3u3eS2nmJQgcyRpC7//8EuApIIJf3ON49X4jJ+LCsyiZAqygR
 yTPs3IGmJYXTC011/x3tmeoxQwFidYtB2oosZSDy/knUE/MDFrR0UJ+JvBx7UPlhTCOV0Es2yNk
 Emvt6DHivqiILyB6/AL7M0Vg6+7OLlo+zIC4CwwMbAT2hwPEMiNZP496U7JbMCoK4U0HhICIm+z
 n2HWoEyNrfBz/3S+w4LJT4ZPxeiB6Kl434RPOZgcjTe7S7IjO13wm3/vZpP4kjZrtPpwK9hsw3P
 ECApoeMB2/OzEAqCIKRVNfZQj6I4n+0bDn1b5LIa3NnIgkDJXQG7eIShJD2rGMYhvD2/vW251zw
 kldpSsC9LQ5jd8LHkJQ==
X-Proofpoint-GUID: BSFREzPmRJYfyWxlFevSG2JOECNN34Ly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90287-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:~];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CD0771885
X-Rspamd-Action: no action

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during probe to
align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index ca6a7df7a6827378af1f013c7e62a835d1b80cc5..84ee5813e2d586e8880849c877182d56ca31fd80 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -645,6 +645,11 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 			engine->max_freq = rate;
 			dev_pm_opp_put(opp);
 		}
+
+		/* Vote for maximum clock rate for maximum performance */
+		err = dev_pm_opp_set_rate(dev, INT_MAX);
+		if (err)
+			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
 	}
 
 	if (!qcom_ice_check_supported(engine))

-- 
2.34.1


