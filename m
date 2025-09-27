Return-Path: <linux-arm-msm+bounces-75361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95CBA5769
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 03:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD141895421
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 01:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6801F63D9;
	Sat, 27 Sep 2025 01:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdIx6sZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65691F8677
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935106; cv=none; b=IWi1hhRd6+N3mnL9aWiAEuG8051+X9j/IoYfL+SIauHBpHlFMkbmH78C+jqzNmm5+dPywAdOrdrkPDmtoTGJ2Pm+o9XdxgoOyjVgWts9W09mPyOeUspKJvduty9fT4jOyok1l4c6k/c6CXQvu87/xbAFI3vI55R/HotVZSefuFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935106; c=relaxed/simple;
	bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMAyZuRzOdMn2h+dWxYKB/3HEQ7fIc1kFa1WiZjGQq8zxeNz/Cr1oMdZluIBq1x6FzkB6//Y9j0ZCT2P5JDte1B229H8/sgV86CsG+a60B+a0HxLhmZATbFzFNvYlJpfbLyh156+JPCSAAosH4V+UN2vTCDKZ/FwpnJOHTufbaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdIx6sZj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX39B006910
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=LdIx6sZj+ysPxWs+
	aN8ZqXfUmgPGSOE6GN5IzW+BuvaToG7k1rUG1kxVNaxMSak90s8eOIeyZRGALhtg
	NrXV44rRYOIrzabDeXmEOOplrponsj+F3ZOUZ/TYElX4db5Wv6PYlQbHpi/AuLXA
	wsXfGaIyOhwXJsJnazyCBiqHsIji3scs06UJlu1Pz1ahLz06N2EGBe17F7hf2HW0
	INHvVdGIi7/GolvWKG/FWC4QIFrR5TYDkt36LVIffpTPO4GHBJd6lDZT5xFyMF1R
	mR+E+DsZBd0DCZEL/1FcMlfOhiUHnzOJptbV7xVmO7rRnazUnBteLsSVhcJzEyI2
	C9hfdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qvh4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:05:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d6a41b5b66so65063631cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 18:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935100; x=1759539900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=;
        b=JopSmFs1w46SePqI79YdCDN4lyRIfaNsdPmOzXgg/NZw2SAPwTLb0VUuOHqE+Hp0aA
         hKumGHEzj6fX0R/h05aC8LFNAgrvBK+Ak40Mv1g96CE/g9U5PZNzBxfxgTtudvbxd+jC
         K+doZhVzptSatk7xrWyH6Bod8Gt111Hz+tWhaL/yRYPOGRjNVb2c/pfPtzr+C60uve77
         6BNAj+yad2p6d+nDuvSBsmKFhnnMtUIgDSGOTqTjvRUIa1WfB/qCcivXu3yZygqpHQsd
         nJZx7Ms4SljYtwrMIAW+hF0u/hqz23vOSaRKtGUvAiVFQ19NUVGIYAQ8dNIAVrcQjVr4
         7Skw==
X-Forwarded-Encrypted: i=1; AJvYcCXDqTqg84D0pti60KBRbOa18H7Dt93VC1ePObCHS11yUbSkcDIF+qoy7V1EKbOPRMMUFJNmESfnYXvR5iT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoov1YBnU8hvrSDQk471JpKGJ8sWp+f+QDrzPt1dAPaKZ8hJQa
	GJDMDhUw8IHdctzUTkoFWpghx2ESTU6uruxlRvU0dMdjtn0VOD8wHfchezOjE9KEc5pvSLTXMBC
	VMaGjT3na+rht6pRHZLZ9dfYGpoOe5Gh+oD3rtbjLHCGyUJ9G4pM1pX6f3+084+9mHbnF
X-Gm-Gg: ASbGnctBPRf2djEd9yRpo9TMElO33Dgt8gX/44WkZc/P/9byfOX3yeX7ixTJArNl40U
	HtgbYzKUveP9+pAg68LKxxk4GTIRsf5tCHpJD9xLJkfoXdAekmjgFwOYrnCxxG6VGWktjroACOu
	brRVS0OQa0MG27I1zMdo0bDIO26Xh3rF9YIfBa9hF6ap90njDbPzsLbov3roPPW+geCBxay4cZH
	v0lnoyePEU8Nq03aauaW4ZbzDW2hwcdwVyXXXGAqvYvoOHVAqu7j99Rlm9JgTE120UMFwP2dCr5
	0jt3faYJ/ub3H4N1jkCvf5/o0Kdmpax663cFInhsmszTjqzm4x8owY+w2hBK6MaNXMrxMo8Fhb6
	u2iUhHl3UQ7u1PPfBr/852b3vRUosNvcN6q0kF2xCrugr32pS83Zi
X-Received: by 2002:a05:622a:4b05:b0:4c7:35cb:4b8c with SMTP id d75a77b69052e-4da4c39b711mr133232921cf.65.1758935100504;
        Fri, 26 Sep 2025 18:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGLqabjcVMfWczs/hM1RvjoXYZ24c8DWutZ4s//N20by1dgwDTIo6bz/phU73Cx2EjElCUJg==
X-Received: by 2002:a05:622a:4b05:b0:4c7:35cb:4b8c with SMTP id d75a77b69052e-4da4c39b711mr133232651cf.65.1758935100057;
        Fri, 26 Sep 2025 18:05:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:35 +0300
Subject: [PATCH 6/9] drm/msm: hdmi: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-6-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggmZpcbiYkQjpVkexHgZEXDSvw0DXxRboAe
 D0A9gHSrqSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1feTB/0YC+4rnr/Hho6lqvJBXm+BTduk/QVw+LVH6sijEBUHa8/pAnfAaeAOONR4ag7YUWkgqQX
 sgYuRV8cKAwLMlemd/JbVaBZrG/o9/asI/Htr0NYQ7+4VOs05tz6Dsn8KdQyvOYmQAkgK8Iqd4D
 ZcHUMCLjgTxgzcqwaBQ3dPdBKq9WyqgKY0F98RDFCXyVyrihsR8FbdCEv179gCtv1TrW+cUkfaj
 NtZdhMr+XUBpzAWVE7lE+r04YwywRVSUR8Kqq1/TkiOL8Ywc9Er7RyXwyYmKZiLzjDuNA7m6mfK
 lvktPPCBln5IT5K/Oqv+Aj1Qi29ArDZfpGZ0XxlheSJCAr5R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: QXLfELhfmFkZxP7vF3bLGjuiJcNe-VW_
X-Proofpoint-ORIG-GUID: QXLfELhfmFkZxP7vF3bLGjuiJcNe-VW_
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d7383e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B-oVSsyST8MYkDpc_wEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4p2qbKLGxeLY
 66Wb2AnQ+RfWccpzD26+SlS7n3HQ+1TTrKzhodF5ubIe4i+eNN5TsIDBORxPRwefA5GhMioX/gI
 Vae0XCo0UIDkiC/9sHdqVfqhRIbC67LVAOWhq0mvL19J08n4khwKfBdxlldUk6howBBLizCj8JV
 yYKHS5u5LcLaNZ7ubhHjg7a/xjosmgejNm9R6YDd2Nq1UmlJqsa899k+g9gW8EhnchtrrwSsz1o
 f2mRwxtmizBs/nGt1SdSfwO3HKocp8Na/sJg8K58fvV0c16rxrCnJdjE0ovBS0LtTfDeJzVAzuU
 elLnLTOlsL9+SeZRmdC0M4tB4PmEbHeiIzWxa3sJOsBooDTLbC29VBhogbuTNdJvfDVfK1/mPs/
 JKzepqA07lFGYsW/PemUtxOq9vA0kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..121239a01cea334c3e7c789ebfb54df71515db28 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -248,7 +248,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -273,11 +273,23 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
 				 const struct drm_display_mode *mode);
 
@@ -452,6 +464,7 @@ static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct dr
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
+	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


