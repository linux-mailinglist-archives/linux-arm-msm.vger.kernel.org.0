Return-Path: <linux-arm-msm+bounces-56724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AEAA8A39
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B2711893C31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 00:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF861684AC;
	Mon,  5 May 2025 00:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL1NeU5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F620150980
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 00:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404110; cv=none; b=EWTuC9Zjdp3fNzdLaMoCqB1pXieih3garb7eXnzUlR1pxdyzSUn042dH7SuJwvfajtYKkyIpq4vAPb7STLrftjONBk9lxtQH4g+xoE1zSMNobXQSr4loP2C9Tz9B2fBYWMvLldXbtVNALVmkOp//ds+mtkgfiNbYTuaJghtO/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404110; c=relaxed/simple;
	bh=D6TFGB5oM58ofnRrvAfwKN6lOoLCqPqgZw7msJQC4Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2qTfkRrUUcWOIdIHljzMguIG9tk4KOM30esMoVIVy+/dgqcnYCanJ8h06bXi+MaGALtbMAo94sL01jzlyoSgEXt0d00d2Gca5LBQnl8PfTOwOlzBoVodbl/Xe0bxo3yqtuqI/djz9EcBVysRgw/ZtbIrPuIic9tDfPiHoiMYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HL1NeU5O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NOWGm031016
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 00:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wLs0iVHofkv4RiL71eod9NJCAwyTb7zT17L0PQFSE=; b=HL1NeU5OLXXFcxXy
	TjxFc6NtarcUGFTLNJwNhYH30ubvXysRIKcrydvpwYpqJAErHlC5QSk7C69Ygyou
	oNgK9TODN1LMY8bueOKRi6Em/mCGU98zB5NLOoWx1YhFoE5GFGw9mKe1Nki20Bbi
	j6P3oY+ZlPTMpNSuXtV+fq38TqzNYDn5uW14MWocJpMZTM1Ml+lRVeTSUwYSRBrY
	wx1NcuuYHmbJteRKsUfc5VVb0H+o/DHip9hVaERvDW8VLET+E+p8/fYg5QgF85cY
	peBqqy2cdq0rUmC5rmyXtx3OcCrEOJDCM0lyeQPcTZimN/j6yBixzqHpFXw4Khi3
	asiWMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n2g5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 00:15:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4766c80d57eso76957491cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 17:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404106; x=1747008906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0wLs0iVHofkv4RiL71eod9NJCAwyTb7zT17L0PQFSE=;
        b=RaE8d4MMOwhVA9bj0bSF2O4SP1Vv6beiuX2pObeX/MYQ/kFAecvMuwS/B9U3Ssws36
         EPwzbE2ZUr6waExt1vZpJCfh3jqwUBeIOu9X6vKO4LXm28TqGDvg7pWq5UabNk/FCUrv
         p3IOXPOpx8hyf9x91ZQOxz0Miz4L4Fz585ru06J1RlLP9VDHgnBk9nFa3rS6H/gh9ixY
         HY6j8+cigKymglkpPqhxBSpweRxkPmdiuHBH27KdGc5lJqTANXbodhW4XUV+4Wd+Gtv7
         qMZWgV2ZehSp+gVqyvq2g3M5v6Yuqaei4RmRUYsxsewly3q4fH6QPl2x0TdJmiUnd6ef
         y4iw==
X-Gm-Message-State: AOJu0YzkDsLfkit0gNwlQ/obUHFBcBxXs/9QWZFF0TgX3wVlgQZgHdaZ
	eZGoN8Vkh8P5N2D8RORqchMHs6ihdEFwhoyHqP483S60FB4hiGPXIV41dCg/IDwpqC7UvN9Khz9
	QCCCBy7zvZoZcJl+jxQoSVTPfhHp4UATHBGtqCJttbBCutz8C/IeWrLhCoLyfup7V
X-Gm-Gg: ASbGnctBqhoGQNHzvWLSVbkYfroKewm//7XY7FsqpS8fFohqcU/iZY/PQ0CMIjehCSx
	2y5Klk95t3+i7Jr+h/sQ4hfO1FIW9ZEFR4MnNOxUAYw4Bm5SeXVExIBAcgP+QEnZTZcVpaIzz15
	JrICV1cOkjDZkD0tk/bE81WFa84tNmRTFrtBnuGDXSvWFTFuQP9tDM8PkPjH7CAe0o0GQo54j7d
	bu0U/Frtw4q1XVkdJn7UUonwHc+ZeHTp2JPirnm0jO+Sxp4rMP9QGNvavALcGnuqYq4ThjRfwxh
	+dkho/z4w53i/1FCzI7bS8rqM2MhuhEqJH5Mgx+rtUHysDBomXSGP4/5GfB5pw12V6RuIauXH9+
	FLKYaJ02nhNHmmcCYQlMfEhO5
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id d75a77b69052e-48c32ac7333mr177680441cf.42.1746404106177;
        Sun, 04 May 2025 17:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLLxowO0dJGPkvuX9RhOj9QBfPznkAxKoanIkxu8WWIzBNeIlJLloQOmPJXB6Ug9KK63z7w==
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id d75a77b69052e-48c32ac7333mr177679971cf.42.1746404105839;
        Sun, 04 May 2025 17:15:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:47 +0300
Subject: [PATCH v5 03/13] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-3-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OUSREmRh8249bUIyNnvM4Q8G4H+YLOauuOGWEq+Beno=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7KLXUMBlRbyuEJArZP28ojba3pXgt+c1/7
 okMpiFlV4yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1Xm6B/4gs76RF9xtIzBzLSkxCGgpkPU1UtrIEEvR2dHR8161J3VbiGvR7Ho29PviL72l057riaX
 NrQAUbxJjM3NBSI97ryLHmN3LAFCjIKCPLGGg2jC8RcYRV02KzNB5KcXvfLOAarTKfMRxxLCB09
 bZTxJOrJPbR9Q76Os5esA7DB7VasvSsJrub2zlYxD5WZTtMIZ68bCGJxOgkMkdsOS19tVutXkKZ
 DxpQifCrW9U8CIXk3GVAU95EdQUpTwBucj0J+6lRmtf4R9P80W4C2G+U2KBogFT5hSdvCU8MUy3
 vw/9EYy9LjHyseDqJIoZCglgw9ae8APErjI5wti7eMo6y7lS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX5KJARt6zgubK
 g+2VH3V5QlzNRyHDQU5mHjEaXdtYolh1joEj8W3JxlJp8B8m7luiME4D8cW5DWZykNQY5YnVI2q
 Oi/b0uhEGfj7JCshujcMcW3wAGRW6mplOsHHzI7Q/NLKp4HTAENYIy4bXWnzobDSigPEKugk/1I
 DGdtsNLnu95wQ+5RqQNg+RhoKpGHqnqjyYX98af23PoWeUox1UDFx/979QlYXTcPxYNgDmVc1fc
 u2m01johFCKNppXGnN1TnGwV+gzMcHKr6KVzMEHpzGducj8ywDe/AXv0SopYz9HgP87/lxQcHkN
 KUCqtdjLDlwM9HGSLCp6dYnrnDH2drnNkx4v/IKoP6zc+pd2Is/R2P+NL1pHFOyCjkFcAJbapzG
 4PUr9HltxSCL0HyWcE8msR1Yxf9mVK/ekoz+3DuUybADPp0JXJZ6Q2ebqNdx1FlhAZ/Y55zN
X-Proofpoint-GUID: hVZvHNPAQrzWDdLNs-IaKM5bcY-7kzog
X-Proofpoint-ORIG-GUID: hVZvHNPAQrzWDdLNs-IaKM5bcY-7kzog
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=6818030a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=-Tkwmxe0xhrxJHpsn9cA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9e9900882687fa2ae4a734d5cf10b5bae5af2f87..ebf9d8162c6e5759a3780c74354b6c159598750f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -233,9 +233,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char * const pwr_clk_names_8x74[] = {"extp"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.5


