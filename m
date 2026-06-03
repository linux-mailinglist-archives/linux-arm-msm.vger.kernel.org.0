Return-Path: <linux-arm-msm+bounces-111024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZnE7IEdDIGq6zQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:07:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3AB638F30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:07:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GGS0WfoC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TZOCoiMk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111024-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111024-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AE8B30A4B7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 15:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68719396B68;
	Wed,  3 Jun 2026 15:00:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2568739A80E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 15:00:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498807; cv=none; b=il2Jv40f0t9z5TS+Zuut3XaT/iSWkhOVC0ALU47JVlDk1mBb03jB+VHRwLRjfb4DtbSc41cYpvxouH0sYD02YXPFVJJOmnXJFZ6TJq6q/DOMcdrDTPg4uomFB8LDo69YCpVl679I8zs1bn/6M+3u88PaBQKjgANDVl4ERIurnQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498807; c=relaxed/simple;
	bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtR8kF2au912f1J5NZVE/Oh/sj/tE4c/ULcEeVf5nYQ8zv5aKKmzcwiyUrkCrDUxMAymZM/c/ev8fsMT9ZvA+Y1/oQVfJTRYABfFDVPvyo9GvjoxE6BFX/He2qXwPKCwXr4gXe2Ql2F2L70mnc5EacwrPZj+27QmOSwfmjaQqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGS0WfoC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZOCoiMk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653D4Zgp1956521
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 15:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=; b=GGS0WfoCZgeHzqnl
	hw8vxIT23xX19xU1PnDB2cO6B75LrHO87VXfv1DKd8XjSbhNH0kwKiBv1UoOeo3f
	ssrPtwoOOEBHX1PH+wVbAtGsS/0Xwho7H8jgZGQzE2nCWf3BnujxZOLELrwl+Nz1
	K40mw2BBnmDFTAndAZ4Djp4UpMEoxfDxUdWax/x0YQb8Ie4uxItBIBvY7q/iKMoe
	VFQxQVLAA2eTrOwe2ntQibVK6otdNWkUT+F9/LbvC5lHfmH/lsjfOrw9M+TYhEmp
	90pT85AWiTWdQT5odpQiRn4MvWhSEO+t1sLyr7zwKqaPuMt/X+9xpAu4jNHwtMXM
	W56/Tg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc1ujj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 15:00:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f6247c6so4517178b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498804; x=1781103604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=TZOCoiMkNam0bANXxSUp9Hu8O1nqEoEUBE5ewkomIOSnL9J3cmMFNsJfBtQaDaI4Hf
         5i4yj4bZhTN3wJtGRHa6qMimUirXJD2VYLMb+Jo7dHjGpy9zOdTNkog2UVTKlknjC/Zq
         fdNxwc5HPtugFhGYQvWMQssRVj8YMlKB9XnfAidpTjBHYxXtijUXaf5b/pHMWInd4ucR
         ipIfI7pfpqGIuPrYUi4/GdUSkcACu+DG8c87hjoOO5HgLupLE/letnpcwWVmIqx5Gha/
         ERowf5740CxFiZetAmq8SxiATOoTslMpgK9vBgwgh3REbGrWAfJBYksOauX85BkSQC9l
         xJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498804; x=1781103604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=J+E2PDg1e0YIRLZgGzOrug6c6anVF7xuN9lvFrt7YP1QfjQ3OAjUkYplUXynBboZN1
         qtD+0Y+2zWGYOTQ20bQI622l7h0OQLzKAPKvc+iWdINjbPPndil5z36C9lURKqfmdckN
         6behA1Xz2oHkRGE2SO5WKvoY0yHZiYuLVhxP5wo9HoUUVl2x4T+K2PmcddV+0R//9878
         sQZg4YhVCOWawfE3UdkmyzkM4PSdSE8d3C8zpXZz1OB7g0MHJHyfyS/BIctUOHDetzIh
         xZI9WJ+5FLeL6gHnDoDqpjngRJq1zzLz5xjUPzwAE3yAgoysnGJioPuhAM5bx3cbAVZI
         CBEQ==
X-Gm-Message-State: AOJu0Yy4pNAYclgrO99NBlDaLBBl/7BAbkBQORTius156BNbC9Q3ddxF
	+8lzoc46+UcOx2UEg0oB9gMBp0v4PO6M/UwvI7VHl+sfIlKTYPezQsPI84N5TzP6Gg2zatBKlZU
	Fy0QzVCkkJ7UyxusgRT+QI9YSbNK5F2DdzkoUoBLTEm6Sl3zYY/V05SF8MonY2Dwdd0je
X-Gm-Gg: Acq92OH8ZBWQnapPx7tj1TM1Rq59yDS5RbCc8AMflHSvg7dgd2FZ9toFQWUUA/8B9vW
	63xMMkvPOA5+AncfLZsZA0WUhigx5q4/AWCPoiZsjwNBe9XH+OYWlhceVbIQs0PmPhm75ovaAst
	vLFpjoZa2BezEfukkbj+XS/Giafs+01z9nwb1mZKdz+8pUSK68lMEfAfmyGt9XV+uQJfxgV3Cbd
	OJ0/YxJTO0Y5NwhPF5JGS1Yu30Yzr3hyCfxwOKyg4EJT5QjRyHWyvAwkQP1UVpttIfNVzgceDhY
	JQK1wux65REY2KTVERJ/GZWpm5lZ/OFziA8pERZ2Odd7956aaAMHPCuEa5QuyPzuowubPGj7uMt
	CnPYGx9QjmfsJn7PlUPj28AdQziRrJ8gPatugTRzDoVAtqqGuaVbHVM3aNHY=
X-Received: by 2002:a05:6a00:3695:b0:842:48ae:1d43 with SMTP id d2e1a72fcca58-84284ee8c92mr3870643b3a.23.1780498804273;
        Wed, 03 Jun 2026 08:00:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3695:b0:842:48ae:1d43 with SMTP id d2e1a72fcca58-84284ee8c92mr3870595b3a.23.1780498803819;
        Wed, 03 Jun 2026 08:00:03 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:03 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:28 +0530
Subject: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-3-aeac1b94faa7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=708;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
 b=gUg6b8DX/BHqfCi1J5KoY5oWrnsM+HG3We+0qp76rEwPG/U5JUeiHQ71ZupKip7+1WYpddQA2
 CnY839GbgoyCf7ysCC7p9za7OOQ7Q8Ys5N6TLLl+YlfMU9KTqS7JKzv
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: 5YL7kq8zFt6vEC61D_y89nmlHD6AyAQF
X-Proofpoint-ORIG-GUID: 5YL7kq8zFt6vEC61D_y89nmlHD6AyAQF
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a204175 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX89rEEDUffdKQ
 ypyajoqWy5dnDcKdMX7Ts/wp9xJJinMGvv843H68wf5RHCx7rGepdPmg3v/jRtoLyYqH9S6P4ED
 VZ7goqr5IabRyfg6M2ly2sSQMA33hUk9AR2onrSrEqhyKIFAMO/HyPfG1d3eZ9kivgW8SrLupEx
 3s+g503W+rBosajXM0rbMVJPMTh6vPovkH7g2NvcctCRyGpbb7YVh55IvD3TY0pUbwkrQDjuhoJ
 iXYYtlnWo/Fk6KqaX0g6aYHu0ooqgUINtTMFUzU047WZqYFmL7uqnYP7zGUZIXX4gvitesFDWVq
 P8M8kzGCviGY54tnkUIAQikUXhXOfjYqOoHcBHv7w/iF5dw16ZAHFWsPZo4gSfnQOrAps40v4Z3
 esNJ/VPvaZ5yT0BdEsG+gT4JhgCalQmW/dkIxETvlnz7mfYycHT8BR1TDaNyIW/0na2/YJpALEV
 qE4aqQlmWFmdd5FWHkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144
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
	TAGGED_FROM(0.00)[bounces-111024-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 2B3AB638F30

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 909f3c188e75..a6d72ff63e57 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m

-- 
2.34.1


