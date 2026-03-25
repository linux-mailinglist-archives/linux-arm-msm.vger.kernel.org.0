Return-Path: <linux-arm-msm+bounces-99902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM6dDiENxGk+vgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:28:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C5B328FBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9A203058FF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2E83E63B7;
	Wed, 25 Mar 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkpObtTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZHMIet5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CD33EDAC6
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455738; cv=none; b=e1rnTz12quTlTlgjxaYiaRMLPiBgSqRSZkpQBR08iyRIH5J4fEKgy78z/vn2QMwu0MDis4UhytG47MI7aPUMMC7vYLoV14DYZagg9NsgJG4OoqphwGDvjn+XRdAUmHSfCDeSK9wCWoojPj627G2x33Temo5f73NoDd4OnyC8rbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455738; c=relaxed/simple;
	bh=qNmwkvFamYkwV7C+aa1O9yNiTeVw7IeC1d3q36N4w8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PD1XU++JOF6KdDTED8VJ9X/gsqjptcUA8w9er9Ffx0x7nG9rRhOv8CqEmjliDgm6seNJTAIoAsYZebDrrC2lyU81zqBxVTtsQxkaT1TqH9CzXu2Q0YpdAQeYgHZhkYHYD+7cwS8uaYznVrMuLfSJ3Ws5exvmz6h5e4hLpygEsaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkpObtTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZHMIet5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHFhN2162050
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWT6G3Bd0orn86nHkIcAG1VAB2T7rcCWVucJU2c4LtQ=; b=mkpObtTkNdh/yzSu
	LhUxBBf5MMUvk6GM3HOB7CPuv2ZLshHpIpvZLG/2bOwbQu5K9uoSGaRGjVN2VInJ
	JxJ3jZGcB33EAHi093cq7nhdLzRMzi9xsGX7ExIrVC0K1mb5sqalF73moI7LJ9Oa
	PGU1gBDm2n2ebPirmAt3zF3OWiD0Bo8AUDjlFgeFU01ssnnfeoakAZ0+gCCI/JiD
	lzrgBnsn4HhuCxdv6soN38/iBDOjCY5RTfuhNt6CWE2juU9ne7FJZ1/XFXYFbSgP
	pw2uLL42jEq5kCB5iNxNBqnxk8qX2i/yJPQDG1Idcifs+NVM//o4DDh+mYzLq/uG
	nUkmkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489wjk7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:22:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b059ab124dso13265ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774455735; x=1775060535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWT6G3Bd0orn86nHkIcAG1VAB2T7rcCWVucJU2c4LtQ=;
        b=OZHMIet5whgPIQoC5DO1z/d2XP1ENroN4MbDvvRpTAUx2COmpW8rlHil/CiKGl+nvu
         O+0x92PPpXLQPBX/N7Wpu7CASjFSmhuFKUa0LIdrylMTDtck19pV7FpxC/HFLok6+YpW
         dkYY6HzZgx4dtFYs/s842qWrg1aKv33Z9WMyyW9B3H7YZtqTHA4DTrd9+1FruD8qRGBi
         lmd9nmEV2VJaByfztNCDv3Y9UUYn8HnaGBQgqRMpvu76T8oIeRVVsl/MdxdOaZBm/XTv
         one4dCzjeMAKshTrDukAdaPzc+4V62IroYpldYZjLTlIyK9FNT7pPZi42VimhG/xaFfc
         2ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455735; x=1775060535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GWT6G3Bd0orn86nHkIcAG1VAB2T7rcCWVucJU2c4LtQ=;
        b=oS+etODKOAxCtI64lMolXCa/Cgxl/QiBb4l+rtIW77lAF91MwoW5aBMC5oEqzcG8/7
         gy53yqJI9NRrAVup/QZdwqXJU2FKvNSCwOK79hKSPIr2I1Er3eMwBjRmo8DlxG1njxll
         2YVWx919SUpD5PMHZqEuBZeNdhs12t1nq6FAcZtLF6LkyeSY0dawK7u90C13aH/BvNKl
         HMYltTTXhBJ+HQihBsAZ5oSMGuvN3tvfXswn8gZDsIkmhCLlIfyhI96TTzxoG1V7D5Su
         bkQuBWygrrHBGd8+DzrIrktJstEWNhNNR8F26cBw3Jbh2INjSQHYgVQ+zT59L4BGlR1g
         EkPg==
X-Gm-Message-State: AOJu0YxgG6452CS32mZx8jnLzuHXJxr7AvzHv74rPthbFXx766t1Wzxi
	SY+VXPg5vOGUUL61TE2Sb9wRQoqCAAHzaFl9Hrl363SgB+zulXmYBvw2t3q2AoTvRP+KMWYNBqa
	wqU84wrX1E42KJOG20tBL4q9udajXvGDfFq2hux/j7GJvpnBJCp09pUA3bE+/nnrYMyrX
X-Gm-Gg: ATEYQzwPMc0z7nz/Ia6HhhjCMRjbzOEGPDz+BefdYmJh7BBm2gfvagoZwexosEDcblQ
	Aa+q8g5WWkw4/1s9Z5CT7/UUX3zCMtECRD0DN/hr0WpFQxq3CKdC61dLcDqpJ6/lLEpsg+HYT1N
	5zbXwr16/Emou0O72RJOWzA1fuVfsCri5RlYXAyWZaoVJlKSQnwLDwwFcU2dOZmGW4jEUaCnFfx
	9oUE2D6qp0rF6hlY/hES9O1JUVekhjzfLIAudgcYmIhfcrBg1R9br2iyk3AIYD1AfDhOHAD+Et4
	kG2a6+WGj20Xmr2S3oDcG3Pn+hLm5DMbDHmbgqQB8lyGqR9Ltm+vrHhddhJ2ldLQj4eSMAJJmdj
	Zth8EqMvgY1n29jY4cI/I+fPs73kSf1F7kBCsFRw2Bila+arHOFpbd/ywB3tapHe6ZZS/u3/Zib
	BOynsG+iP7Cnb6dH5ybPjOmBAhK/EIUkehaiQXQwr/hA7BCfGn
X-Received: by 2002:a17:902:e885:b0:2ae:c67c:3b05 with SMTP id d9443c01a7336-2b0b099cb9amr47459555ad.10.1774455734770;
        Wed, 25 Mar 2026 09:22:14 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2ae:c67c:3b05 with SMTP id d9443c01a7336-2b0b099cb9amr47459225ad.10.1774455734317;
        Wed, 25 Mar 2026 09:22:14 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8e958csm2945415ad.66.2026.03.25.09.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:22:13 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 21:51:51 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: mahua: Fix mahua bwmon
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-bwmon_fixes-v1-2-9433f9d4c276@oss.qualcomm.com>
References: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
In-Reply-To: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774455718; l=851;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=qNmwkvFamYkwV7C+aa1O9yNiTeVw7IeC1d3q36N4w8Y=;
 b=MIZzkonLkLRbbp6XCUQClhuh2LgrhsxPTsaB/IAvPmNDl7j4Ml4XTqyjsk3aqNjY0V/3mtidJ
 Y96RU++JtaOCVCADRKS/SEO9btI8xxSqQDchm1STRHVO0VB9VZFntLs
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: aPN3thfSUtcg-gDJqUSLCJNOmyPwg3Du
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExNiBTYWx0ZWRfX/0KRisjzbVrG
 G+MoIzcnDEdjNgi481E6zJEcayZkZ+oYSWavjSq4qv6a51HM0/1aH0c2Zy3d2R77C2UpV44RjQ2
 EDJl5fmOri3sBU5uRfnj8Ev0rVc+4WXr3vWvLH7I9L6eb+AgHqsT2hnO40rKjqElGPgQ959NiAR
 9pFdYZ/FW2wfsnaEOImMDlyuxWbGzHGesBu2CdEXBcEKJaFE3saHg+IywKJxUjs5dkC2N5juyCD
 ANReVjxeoapBOMjK980WjQQ43JU6sLv6A+EdHutpU70jqZgqUHBC9ESJxj/5PNqcHfSOknrLFvN
 +P4v1j8OPx8hNg40MzvK2kEGzL1jz21rKip6KrNUDsfgA7TNKBre6bGCpsDjWdKUeSc48wwbEBx
 cCsKzVwkLjIopp08SBamKo1ri8hqI0qwVcrV52v69R/PRKs1gL/5B1mPPgkRm8m/bW+vE2WRvlB
 0W5P9/u5rB8vI2dV0cA==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c40bb7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LcZodfw3TWvoJB7P8G0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: aPN3thfSUtcg-gDJqUSLCJNOmyPwg3Du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250116
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-99902-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36C5B328FBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Delete the bwmon node that corresponds to non-existent cpu cluster 2
on Mahua SoCs.

Fixes: 598eedb21ddd ("arm64: dts: qcom: Add Mahua SoC and CRD")
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 7aa8d26b2b3a..460285e783ba 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -6,6 +6,7 @@
 /* Mahua is heavily based on Glymur, with some meaningful differences */
 #include "glymur.dtsi"
 
+/delete-node/ &bwmon_cluster2;
 /delete-node/ &cluster2_pd;
 /delete-node/ &cpu_map_cluster2;
 /delete-node/ &cpu12;

-- 
2.34.1


