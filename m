Return-Path: <linux-arm-msm+bounces-71267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBC7B3C63E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 02:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FFA55A4688
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 00:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E29F1AA1F4;
	Sat, 30 Aug 2025 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOYgwC5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32FA19E967
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513398; cv=none; b=pKW2vVAaPFnUdL1vVIFqQHtO5Fnjtsw1B4zxhgKep5md/BFTgtOxY/EkFVNgstmpPuoXGn9tX1W0SVANO2W5WVQiKgU4mV81SwnrArJVejWjz63uyIFGawktoOfDnB6d3TnvJXqfygfY3Pu0SG/5LAbSsgkwKrHRJ0Y8nJw4bcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513398; c=relaxed/simple;
	bh=HvKx0pHrlJPU20odLzHqAGtdiIb1kp87Z3cgJaG6Apo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ny0t9Tg8ccHnY+Ct488FtFQ2JtQ4ctLZ/4LBj25mJnGir659FvSUQgZqgOqzJ75che6GBMjRa/BtOQY6OfFiTzni5J75BQizv4KW5BjhTjs5tWpQO+HPZI5YUQrkHmhigqK/p8kqFycvEEKBHKz8ShWbLRi2CpZWVzCX8M0SjSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOYgwC5T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TNBTBr027403
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80NStMTAnoFzXJOwtQHaY7xhRYT5mvFsRO93ITTF4OA=; b=ZOYgwC5TrQ70qNtJ
	CBwSeTXLH9UxQ0I5/N8gmk5xlZGUknURoGkAZOHF0rQOsIShKBj5CgBbtNZmf3/T
	dQTkXPx6tVzO2LxWReTSyHfJ+KUdHkyQ0o3n7wBSuO0YF9lT2cCrxAgdRjS68k7j
	+4snMAB9R5JfHWAE+Q9s8E3hmK7DatYDCbWCIu6sM5JbGYbYj8Eio/kUhKjWKBvn
	uDbr3Pd7L3GyKSXCgJPKSosCd3+GkP94Ifrqme375twmU8ar6m3NVyRGD6u34ll0
	Q1p76xCrTJSoRc/aKpiTMSxg0UBwrTlzIo/82Ydm4gxqOJrwzTAPqP/rIWX7GIYi
	10ITvg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umna60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b30fadc974so22720751cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 17:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513393; x=1757118193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80NStMTAnoFzXJOwtQHaY7xhRYT5mvFsRO93ITTF4OA=;
        b=fR4Vzp1aAtcgh2d61qnYUE62GciqS9DtI2xtN0WzHJN/iPSO/cP6q5lAxNDLfaymuO
         7FM2lXkwCrsbnomK0M4yhPgNZI6Sb75SEw/ytTZOARid2oplzwWmIBlSIUyxGKaoI4Za
         Wdx/HzTqQpfwayZQ7qiadEYkXnq/ffCwnVT5E1+obNwAXV5QSAGqG9ge0vc4mdQpY+R0
         iyvM59VHCyX92FVdqifjMtyLbfU0/CozO6gL2oGGLsBLl1qSm0GveLiuRiGVwpfIoV6y
         QCGw8Vu0+dVikmlZSjszl1s5AkrdkAdFpKSfOj4BD7IJiucFaVuBnPePDrndgyHyjJDc
         0HOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS+RGtYqo5leU6fiboaMckJK65UOFzFYp/pmW3h/MiNXTQx3j2FOmn/NMnVC1yCjlqrYdv6+acNn/z/JUb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6H9qJBP5FpZzTGDAiKRS4TRNF0LW5qcaW6SZYHtC0SrPJAO1O
	FD0rdanXo6srZNMGokN4Lhwl0YLLjas3XBZ3g7ZtKzchvjFV5qUcem/53Dt5GVb52st5UqrGQTQ
	4MmPjC61sO6aRyyIU5b7mOW6Q/WjrXr8sZ7VacPrbnI/h4qKA0xsVfENxuIMgCREEhfxz
X-Gm-Gg: ASbGnctHAhIh9ojhI3aFqVPFOC8zL2LiwnCnTOTylOdsUEO90RdcUJqDTPxg704GCq0
	cuRNaYAULhfUYge26Kvy+YuVs3DaRVJI224NCFphyCZCpleKlg/LynJPw9Hsb/QwHveol48n8x5
	SyS8Obbiex+fUKOuXWeM3tiCpOZYhDixiTk05WxOMtNHS5gPzzT0ClbcovmXDCgiRtZsGqROfft
	gwmAlnaKflmrPirYHgb+PB7dCyALD+fOzbM/OufxENvK4E3WgMcW8fFKKDAqp6Fj76wVuVnO9Fk
	lgK+/2+MOfczs2KjPRP2+nUzyjqvXG1w/SsLS99XpxJHNbp41qelnPRW2h0XH8bSMjg4mWau0oU
	ykimlbR16RxTqOgWZZ6SjOhevWnnEABkheXkvJ2U7LrBoSwFgKySd
X-Received: by 2002:a05:622a:50b:b0:4b2:fdda:f7be with SMTP id d75a77b69052e-4b31d80cb39mr5664461cf.3.1756513393496;
        Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+ECcTfEmyA0oDw/SDMAaP2b289wQGB6V4nJyogvFjeCA0Q82zJiolJtrAbz+rOP9mbXYTVw==
X-Received: by 2002:a05:622a:50b:b0:4b2:fdda:f7be with SMTP id d75a77b69052e-4b31d80cb39mr5664051cf.3.1756513393037;
        Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:01 +0300
Subject: [PATCH v3 05/11] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HvKx0pHrlJPU20odLzHqAGtdiIb1kp87Z3cgJaG6Apo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjn135tRCfVJNBGz8sCeDhP5tCOP7aR8o5A
 t4feOQqmQyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1cklB/9ld799npnBEVzpUVL6B/MsuL/WFKALm72JXuja0Df8R5L61ialziPIDOQhwqS7m/CUarR
 BbAyiqXzuPuzqlJe7l8x8oNPMkfoFKSUh6v1bzsao08IUfOpraVdo/cUzHZpRHD+e4Z8qQa+lZD
 wBf0Q4KqCCTPDQVK81CqKt2s49dUX1K3msOCLP+Q9qTWEUhYcipODy0q5i1LOOzeK3q+W79iNMm
 lnkrosjeoE9iQEOOniqNI0p9r7yqKeHQL8lZ+0xiGmqvPd0sbBDmohgkxJhwxe2chOX/N92hTH9
 wpH7XHyXSQPZRmESVQdN7E5BRH3RguYmbQ9At1pUFu6xJ3VQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b24473 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vfAEGMZ_7ZOHtlG3iVcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX3Qkq+eTiSaaK
 1gSff7xfWj7o9kX4KZkj/ZPgBkGrJb+edtCcEjHb0E5S1RJGLz4Ir4SNLSjuLF0VLNYgfM5tF1W
 Ra/J2/hytPgW5xKyAP7hnbzvdwMCTLHOv6BHJYVQgEiCMIaQo/QloWkDXfDqEyQFsNoPKV1azmM
 Q1Z6DnZm9DiZ2vhCcDjEZkFmdwaJshjmCnFjWbT2AtKpQ7ULNZ/TaZrEisMSnBfps5i3/wr7Dn7
 0cbsC+ofVhEh5vcYoOjoQsdoNg1IVfIVxTaEfo+tRGA6nLubpFgcOqvUPVA0UcjrGTx9jn+jnAt
 PLla3nUmeE+qsNFPrEIiXKBlEaE9XkSnBx9Rgx43JJIRb4JCBg8K6HSNezFMh1Y6TrlRre8dDxB
 iAPJXSOP
X-Proofpoint-GUID: T0H0mSf6Z2zKN0CbgCKglYrNSXuwttjd
X-Proofpoint-ORIG-GUID: T0H0mSf6Z2zKN0CbgCKglYrNSXuwttjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..5320641cb6907a98cbc311a80755f09b88a27ff6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -936,6 +936,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -961,7 +962,7 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -1084,6 +1085,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM;
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2


