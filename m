Return-Path: <linux-arm-msm+bounces-111023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d80oGStDIGqzzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:07:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1140638F21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:07:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="n/kZaWzy";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C3tftPjP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111023-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111023-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BD3F309E77C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 15:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6966739A078;
	Wed,  3 Jun 2026 14:59:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5CA397AE5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:59:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498799; cv=none; b=P23AkribCAlssVvS8bJGtPhCqFdkWQMiFXMcZG5rsST9W3ARRGzN1Rs1COeznmldfUVp42QCpowLTd153ZvFETdIQI2Bs/bCBXcQUZ7byC5zrbTQgAcJpEZaYNnZbssf+Kuu5RXoNLDGTz4zWG36rMgQ0UFrEgkvpeiVjmnBjwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498799; c=relaxed/simple;
	bh=lXWNmEJrXxHXoCAHvxq7qK8w3dDJ4/31/UMC2TNJybs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ID2tCt9lDnik8SJPQyE7oAUkR5NT1Z+zS/DmGSYXf5BktOP64SaDdEylC+tP9Fo3ifD3b6fivcY67sU5L7XZuuB+I9ZlOJth9NwihAvp3Uezl1jWc7rSZQBIKqKKR9m9zCxJX+Aza1NjLSesntarcxP8J878nvhEVYqoEy/UQA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/kZaWzy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3tftPjP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395rd3780730
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 14:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=; b=n/kZaWzy+7rupsEH
	dKKhdpNDX2gmHMsQQmIxtQv+1JBkx6YQPTiAAjIkTarEXS9IgJg2mmVh4+VKlrR/
	STUal+Qga1WrbTzBqtFqkU2k/IW5An8fdgdmATThKdmbTRH/fpmVev/zTUViv/Ak
	l2f32rfJWzB/6PdIZLeTIQMNIsL2MP5fCfLJ01S/MCVz178wv+imrML+N01qAFIu
	pGs1GFz3c2+7cWPMV+LPZKEMpkHpseKcDNoplbHjDYpL62GI+3qQLNjqqCtQYJkt
	YLSJ0q6DGL4uIqXuJpIAPwQCdmlfUqafOS82oVgDoVuSn6lH8tx6zSWE/NjNDKha
	Jk3dcQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb1d8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:59:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422ca754d8so3401034b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498796; x=1781103596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=;
        b=C3tftPjPPyIYrmd7MSiByV6JXsd0NijgWAXlPKnbI39eZvml6Wm3rerwo89okykp47
         N0llgzSH81IWO+XiHxCYvgYieyekhP2LSERf/SPiw1+wSvaPLXOu4S1YzA3sB0+yoLKX
         zyigja/MjlfB8znmAsE8Goo/QDBpTXwR1GfAJ2C4JnWA3pi5/LKwYqExqVfWt8ZB2Cvb
         /tU2/5fqQRcl2d/WOa6JFsz/+qQcQ4xQgLfNvDrrWc54o83G8cGncCLOil6eXYfXbFH9
         nLltVKtI+M6Mdh7QggsU6FE80CEmckyPHbJlc4s0jvmkZ+/wRNKJk2ZOGK75jvUzoiCm
         fhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498796; x=1781103596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=;
        b=dtYXln+AcKZrapl44Skh1lf06XPsZB8C+CuM6r4r6Rqc90Q24CayLclktojtneMrSd
         DlO8ULXEpqtNplYFRgQ3c5Z+McgJ3ZNDtaxIvj5gbWYIOTPTMCRbI0iNqm4wch3jtCMS
         1W27EkyHGLmtYA0TQ2SvY0591VISxCmhOoP9yDuaqMaEcmSNN0hmYK8R6C75j6hFufFJ
         Ym5ugFVNL1oyBntZw14kSI6N+dgI7Q801PqxsYdVNYb9ZF/vDF8noR7oWtt5FYCzgdQO
         XCWxvKKpURE9hIKFV+6l+MBDasfh6GosTO1mDTluDYNzvsnUXuQnI8pVWOlCms/lOz28
         c3Pw==
X-Gm-Message-State: AOJu0YxnfC2xJtjbqTjj+61OSE1DzY1WqAF6CsF4Dp4+TM9AX6s5SZxY
	FNYfHkAH1rlOfKf89y6UfXpY5FCPlHvn0iWVYY9r3bGq+k4aupZ2DJ2bI/OzSDeYpfr0Ksg8bGl
	MvKOoaeT78qT+TMpP7LLTgHS0rUbbEPclmnS/mNAAQ/xQkS04A+nkrUCqlSHrQdVCLv3n
X-Gm-Gg: Acq92OFHK57NIIuqUXVGxvLm49bg33lRgW8mbywZnaruGiiunQJxq4XiyCVVziEDwai
	SYypR0zm4+Qcs0f3yBtM9h0zoBVzKwX5KWxKLITeIGiQWup6w739RAO4mN8jQaw642Yp5pALguz
	bub9kq7e6khhCX67sG9vHjh6d/giz/UY3l0ysSUcVqAf/hBF0AMlw9pmIqR0M8RI13dK5pCQgK8
	lVUnMxOSLVlhzF7h5IaQVx+ICF4mQJr92eixyQ2UUxF1lHMOA5u4D+eT+dJi3EiCalWSq2NZOxy
	AWsFyADmYtVS/c95aZCDv0DAJkoOdAMSDXcD9DFTEJ6p+se+/XSG79ljaEXNU++6gSRByTT+m72
	1xyPKHb5lI/etrjs72IywNKEtRADiB1G5YtOlDqx1PMXvrGiMQhkFpr2l5ro=
X-Received: by 2002:a05:6a00:4c8c:b0:842:329e:7635 with SMTP id d2e1a72fcca58-84284f8946amr3803913b3a.45.1780498795947;
        Wed, 03 Jun 2026 07:59:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8c:b0:842:329e:7635 with SMTP id d2e1a72fcca58-84284f8946amr3803860b3a.45.1780498795425;
        Wed, 03 Jun 2026 07:59:55 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:59:54 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:27 +0530
Subject: [PATCH 2/5] drm/msm/mdss: Add Shikra support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-2-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=1977;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=lXWNmEJrXxHXoCAHvxq7qK8w3dDJ4/31/UMC2TNJybs=;
 b=fl8GxWFvvAxL6W8VYehdEukb+WWSYKOdLhDUGdXMeoIWzjnTFGm7XxYarDgwo+rK7e26ilCar
 sbsCIpXoMwLClv7E5wQZVUjKe9/oSpcQ1BsITrMiorkZUzsAClU3cYN
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: qMpzreT_M2UpiwnLo1F8l9-9klhi2iZL
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a20416d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IH1-U3DoIKz-FfJ46FIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: qMpzreT_M2UpiwnLo1F8l9-9klhi2iZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX454T75CF+ebw
 2uIxLr70eXPlcycmvu4ux8dFdwaY7GEqvspYhskSN7Sv75rBj9SZTV8lssoYgDfeJlKw1uK2yMo
 BUhTtyT51fpUx8+6pcWCuKRvt4i+CksTrD43vQr3Kc+3ZfnI/NoF6gZUQoKoHIkxO3XtDZlCMbs
 0tZ5Mk5zOdT4jk/LUJRfW7m9qyNPHuVEsDWi8ZkcK0wqjRP6zDm9QPNYBqh3d3adO3JJ3x/qunT
 tjBeFfPrlEMtMZNfB3TjLnINARVID/MYdCN1krvA3bCRGF63xLn5s8tFnoBldrbMNjO8cg50mvP
 xg2HS6GNwmXBPTV/PT6rI/oBLZ8FHSLnmrjRJhj/vc3EkeIaM5MqGNIOXTUtZ7kbxjIDKBUVn0y
 RC3rt3hwBa4vO5ltbvX4kFiYaUosaQnth4TPsF8muLfzF1Cx1lPMephVVW8OtRnYWE3/ShfPBF6
 1E0OstX18oR6RraWJQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111023-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1140638F21

Add Mobile Display Subsystem (MDSS) support for the Shikra platform.
Shikra uses the same MDSS and DPU 6.5 hardware as QCM2290, so it
reuses the same AHB clock rate configuration (data_76k8) and DPU
catalog. Register qcom,shikra-dpu in the DPU KMS match table pointing
to dpu_qcm2290_cfg.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
 drivers/gpu/drm/msm/msm_mdss.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..8abe8ef6fa9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1496,6 +1496,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sdm660-mdp5", .data = &dpu_sdm660_cfg, },
 	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
 	{ .compatible = "qcom,sdm845-dpu", .data = &dpu_sdm845_cfg, },
+	{ .compatible = "qcom,shikra-dpu", .data = &dpu_qcm2290_cfg, },
 	{ .compatible = "qcom,sc7180-dpu", .data = &dpu_sc7180_cfg, },
 	{ .compatible = "qcom,sc7280-dpu", .data = &dpu_sc7280_cfg, },
 	{ .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..03f27e6b0ae7 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -537,6 +537,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sdm845-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,shikra-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sc7180-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sc7280-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sc8180x-mdss", .data = &data_76k8 },

-- 
2.34.1


