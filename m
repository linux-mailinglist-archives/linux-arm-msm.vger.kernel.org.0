Return-Path: <linux-arm-msm+bounces-70706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA5FB3437D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B06E1A82F91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1723019AC;
	Mon, 25 Aug 2025 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WE3VhV8x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C45F301495
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131537; cv=none; b=U8l+bDY3xvKld5uguLHRnYf2wtWoXjPKPuysSN3pdY3bNxg4uEZNGqRzvwBJqggg0iPBuuCColOHfNhfRbIDSc1VZ8McL30QHPmb6qS5pW2xLnY+rszaxbKp0FM2UN3vax10XzFvQ1KU+vxs7gfgTtB2+eQ1M0f70+JaL2so9NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131537; c=relaxed/simple;
	bh=JkSFQSxYmzXtoQxC7rSWB7KE9kDbTY3oS8rwFDz1TxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmxdYWADPPPdK1pV56tudIiD8hcD+ANNd7HeThmcHEfRfH6ugTcUPpuhPK7SIknx+K4bzQWq66oyy0evCu6ExnEEoXnWrrfIa+heZRV1ivfw4/KiqcaEPPB/a1D+ClswoFTr9hcur7AzEk+sSOU3ibC8YBlHjWVnirMskq41cxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WE3VhV8x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Bp0K012519
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6wHYbSvg7X6j+hxKHpKI5Xd3HiTiQ5a6PIWmFXRLBo=; b=WE3VhV8xruhxECoO
	l4c+2fW9Y/peDX9IcqV1KHaQj+t4oNPb51aj5bbwyJd6PbuvHXALDf1wxUkiz/rJ
	eP/lVlgTCIgEN27RhrYVjjKRzmVb58x7GE43TSozz5b8d9LoV7B4SAZvR7ywg/9O
	0+lIDqAa8z74feLeFaoteBNfPyak5HuNndGG/6CSfKsbgaTblCUcUHuPu6ACUkSj
	jYqdw0A4JlpXh4AhB/1MEKigivh0VVWpelxn209vop1DtWw6iLCmnysdGuDIBo/w
	VjRiVL3RfsA6Sfr8ApBYh7OASOkOtG+rWkE1TSTMH2t2enuk9CQPNEEdZ15mzc8E
	bd6FrQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nfg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e8ae86ab3so4285741b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131534; x=1756736334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6wHYbSvg7X6j+hxKHpKI5Xd3HiTiQ5a6PIWmFXRLBo=;
        b=Gvshg5XvOhj3OFUM3IRZRw1RU13VT+bsA8GgCL3OKmsV2m9wdzs9B3EWibPOvjz2z+
         LqbaiqmcR51/toe6Huub2hlWxwReD3Jgn5+S7sgwA/elytUY4ot1uRS2wwLSJCNiAVVG
         +1TbHQ/+uf9nuC2dUywkwDB+0CwmrwNC4e8jw4N40HvanP/naOEEWIWzTVgm9P7Mt1H7
         PPZ9ByPSaqbmwKQS4UiR6IEEEQWPqJi+N6rkriIrXcNkAC2DCAqhpZIAJVA03nMmeuI8
         1mkCZy1ElVjXuXfPuMuc7gV6IAKhYyHXKIkTz67MspCjjJSLns3SzVn+Odvux7bgHdT9
         sQcQ==
X-Gm-Message-State: AOJu0YxIIS9EVf5o3t60bUHFcX9lnL+rp2aB3Sj9H1fbNyc1tpV/BLCn
	DlET6tIDgOrX9zQeAJZjPyTQ/rwC5NHvdsSDrKMVNsq3wC4NAGldrnWjCY4Ah6K03HZTLezitwk
	RCN5v44LQD1zfARul7LBo/KKH37Oxo5yHVgzvnxuasDyLLLFXgmoZB1Ymy9+NPq5EYCZR
X-Gm-Gg: ASbGncv86dHza76rje3OnDcuZZ9vHkDhkLzYlmARFzyzbaLZAuYwDziZ3Od4GSgTyAF
	0C8B3CZV0NpUvry0aDTJaQSxYVU0U6szWbKOgyAWOQbitN+Pw65pE6CytU5/9jd8VjsXK0NVgi2
	woUWlIYbvOa4eQAh/ynkjFSR93QeAPeI0Z6zoalMfbFzJbC9aM8QC9/IYJ8MRI3oBjZd9efJzfY
	WZfZrOgkW0TPQfgJlPkqqGU52jpuDHD6ykxT+p+mbPNI/eRpPHXfFYnWMDGsIrqmsWwhlyXzqh8
	XS3rWNGi16GWD0MlyC1F2OaJoLP//yczcMK/QLMeKJDaJhPgxs4MAreUGmofnwoEl/Q9afs=
X-Received: by 2002:a05:6a00:391f:b0:76b:e936:607 with SMTP id d2e1a72fcca58-7702f71282fmr15614245b3a.0.1756131533928;
        Mon, 25 Aug 2025 07:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOIe57ydGXa++MErfMnONFuNJjLar/gSG8BXw2uySW/CV1EwrBjfkSzqdOpuu88d/5cAafZg==
X-Received: by 2002:a05:6a00:391f:b0:76b:e936:607 with SMTP id d2e1a72fcca58-7702f71282fmr15614219b3a.0.1756131533415;
        Mon, 25 Aug 2025 07:18:53 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:11 +0800
Subject: [PATCH v3 25/38] drm/msm/dp: Mark the SST bridge disconnected when
 mst is active
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-25-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=1007;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=qVUepIjusQu0oiyKhdBBjZ9rnYnedg/dO8rrWYD3he0=;
 b=Mm7SH2QVnkdWkXUKoBGe917JO2ug8TJ3B1CNvrWGxVgZ6cUb76kGHwuP9NdkG7IbSysBIbP6M
 lj+R8gKVMGzDFE9MsunfScMTtGGQAGp/JTS7OfT9zluAnBOGNoIRbGp
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac70ce cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8/hjfRUKxPJX
 NWB+wiamLwvlsw61HiEN1IHLUPlj8VrNVw1tbMSlq5/i043wxb9LaUuUdOl2d6fu9A8/9vFVOXJ
 3wm1Jd8em4Mh9gS5LsiWNZKVHXLLp+z5nmV4Ry7JJWBCDmtKKY++zXjQPydk+ixxI3c73obSoEZ
 W3Oo3/ZzDVJB6lKddq7jy5zrfNEexI9DBZHtexlzJ5ZqRNzaIIXXUjeejR9dOm/DkA8zxo3htFP
 wL6MssSHPQY1knuS8+Tk46zKMQiuQQINZ7lX5vyhaRolasUH9LmBfPyYL3+xDa62iO6ahN9CMAA
 8w5vCAJeFqBCJN1ZSR/LxD0/6U3XbatDt6CEriLh5auullHcTHqzlOtaX4dC6rvfPyQtxd9IESu
 jN3p8eha
X-Proofpoint-GUID: vkbX5Ycp_xCpk7OnvuE8Qqan2Mrqc9-D
X-Proofpoint-ORIG-GUID: vkbX5Ycp_xCpk7OnvuE8Qqan2Mrqc9-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. This patch skips
detection for the SST bridge when MST is active.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e2e6b0ea2f9dbfe49a599ca19b1d205669365c4c..cb433103d439ac6b8089bdecf0ee6be35c914db1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -986,7 +986,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge, struct
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	if (!dp->link_ready)
+	if (!dp->link_ready || dp->mst_active)
 		return status;
 
 	msm_dp_aux_enable_xfers(priv->aux, true);

-- 
2.34.1


