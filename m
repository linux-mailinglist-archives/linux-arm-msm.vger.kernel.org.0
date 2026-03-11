Return-Path: <linux-arm-msm+bounces-97076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO5MBkvOsWmQFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:19:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C7C269E6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F25E3037FDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178CF391856;
	Wed, 11 Mar 2026 20:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJmQc3ss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQRPosyA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44AE3909BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260269; cv=none; b=kTUFtM/WD3Y6QUhLV5WrBJkIc1wIxKiwfewrEFLJ73NIKwvS/ryB0yJAYnYXV64nxSJNZVxpzUS0/6zOmwicLI4alXbUO03OrQF2j8JAYAqDpkHzqMk7oKc8NyjyM0y/t5slBMfMuo0rOwRytsckpsnLyJgYqISzjK+QlwvyAno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260269; c=relaxed/simple;
	bh=YOc37GFpIDuzzD9xXRHR6ElanP5yUXGTsuM7FbmpFSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrMqIuV/TgaffVnOEp23WbyNin8+4/iP8GlBaJRsgKCJ847+BEfzstMFgvs92OqMHac5LVFzID6xSvdmusOBwoeeCb5ECMbUGNechJCLle77LBentcgrEwnvfh/B9aTgJPl/FI8MybGpXmVZIn7Fhq8rItzLdYWtSHN+liELq+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJmQc3ss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQRPosyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BJH2jl1439664
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USEdJZD4t49t/lSSKGJNdAbpficI/EvChZFc8qNnldA=; b=UJmQc3ssJnNlZMma
	MiSamt3oI/v46g61OhfWBM1bHsEOXYTv65o8CP6eBGqlNkltQgXQnDGNy/v2HfEU
	yUGsxmkssAgKtPc/PAh4DPHdp3JsSEyfBASXAOZI4r4KgVm+qIQhtv0kUcZq5EnH
	bg/HHI7jf5jii4jzwnN4qBJXiQUoSQdgXmtazfUTGVHQmsZ7UhzxrN9KOCUDw9Hd
	9/iQFj/wUVo233WiApalFayJESI5oSqIqVqe2+evPhtKB9Jj4hQE4XiO1F2g/UbK
	KJBnYkQyELHoFLo0IciGcMrCAy46XurMwYR/uAmwsQ7BiVR/jxn06q9dOOqHDSy5
	4Ijsog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yjwjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so267539185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773260266; x=1773865066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USEdJZD4t49t/lSSKGJNdAbpficI/EvChZFc8qNnldA=;
        b=iQRPosyAGLcQcH+lJYfPdiYvama3U/uEBdn+FReU7x1/t5IY2nl+7s8bi4HccYftGL
         ny0IY0bjYyyD1ZZXxeT5qqAlP158Jb2iUcutKQHwqg6/b4PRBt63dqkt+z2LWBSX0UX6
         zXsP3ux05JQyAX7fWNIXpsacR1/y07LwFuoj6Jy280uv96IeKhrkF7VPzG1A1qrWCdiA
         NRAANQ+8pKhs2T1VUOMaDOtYctQa0W23RHq2dtYdlNIi5zSrBquQXxvLOmKMi16ijLOO
         feYrYAJh2/1mJOt6CrOG5XnlUUEX+EWrtSfxQT5WW4OcALoE9WO2ZjhPMvX1Cc0RjhRB
         QhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260266; x=1773865066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=USEdJZD4t49t/lSSKGJNdAbpficI/EvChZFc8qNnldA=;
        b=JwBY+qeN9xP8kf0DSVR+0jVR2IIKjq7ZTaRmFjXHl8Fiu26DDfkdTK/1gi63jSg5kY
         ZY+RooPDA0monGUkzNgBLRVPS38sfqiu/+KLGCI2KDLEfWFjQmfqfNo6tI8fcrn6HpwQ
         zMcrSs186oc57UWeg9s0GO2E1QOB+FQAAv31F8L9Acx38jNWzGDLtdLN10G78OzPfRkP
         HnSf0KbQwSR2YUuoBZIfLi68gOABpJ6M1W0R4DU7Kn7asUL+fmBC4Gs+7oDxmmtBKU7v
         ygb6s9sZCqDw3O9Or9DjdH8JODWs9q77lDSlThxnk4LlGs35AsVWZSb/m9PIm8WZiBHf
         NSvA==
X-Gm-Message-State: AOJu0YwQ/he4t+ZwQ+4K3RryjeWaf64Obmk01KEXDJyGrk3sSD5TczFP
	Mb7MhUESDf5Vy3F3Sj4zfs5IlF5Kl3fzxtR7F0RlibZgaR29pE71TL4oV9Q6oViCA+BP17Lb6z1
	olGUO9bOCPefeXQnmvnOY3i40vecd7Aysgf1t7Mfe3Vs+ekRxDmg7hRLvSYWKRXmEP8AR
X-Gm-Gg: ATEYQzwlvR4CgkBA07BEzcaiDZVH3HfBrIGyGSrSQf1YBfo4KIkh9+57hSSteR2HTir
	P45ZKtuNyWdEwSYQMATbOnw4DCSabhPfxQM27vp6OBpYr44H5ao0KdHgUpFvZZGPwVwvnOWSG38
	xcNpk9RCm/RXOTrDO/WLiHPIw4PjuoG07ZJuvciHv6HeF/8RMMclYrQ9t4hn4+eSuICjnuEwffW
	4kYz6wrT6A85G2uQ75koTy1JNJG+d1u9oQIo7eFH4zBHUjXvQb7xpEM4sEueQ4Q3wmQtz9P41KH
	zNu58ci2zl7nReHMHX9jqJihDtZCwAm1i0grc9GxdKL9pnhtkKT5kEnxGSKxnalV451Jn/t9fTk
	Y9RhsErPgVIQFfz6KdzHgC1lYr7pCPnFZnt+B/CUwwLB2
X-Received: by 2002:a05:620a:4041:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cdaa7b6b03mr133547585a.15.1773260265909;
        Wed, 11 Mar 2026 13:17:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cdaa7b6b03mr133544385a.15.1773260265467;
        Wed, 11 Mar 2026 13:17:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm79257255e9.10.2026.03.11.13.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:17:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 21:17:29 +0100
Subject: [PATCH 5/7] drm/msm/hdmi: Drop redundant 'int' for longs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-drm-msm-hdmi-cleanup-v1-5-c5535245f6de@oss.qualcomm.com>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3732;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YOc37GFpIDuzzD9xXRHR6ElanP5yUXGTsuM7FbmpFSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsc3axZZhUXT1CW6a6vbfC5K0dFoSFq+gi44wv
 b1XFk04VE6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabHN2gAKCRDBN2bmhouD
 17KOD/wOE6KN4qlo/MJUS2BggnfIaG7hgp7xG6+JTtyPfv8NTQi7ymQcDztDa5IT2RJv5VGbeN+
 3Qcu12APxMC8IP8XkBBD6/1WbB63sfxnvPEkLJIvxJgrbASFo8CRDmqIn9QHNKrVtLJz8ne4oDX
 kSpF+JGEQJgo7reGELB0nu2IH+pg3CwRsflmi0mQwDMz4LNJu/kKuIUEKzu79xRnXL9DPGsD1xe
 HJ6k/KnCr+OIHdUKs9F5x6gCx+DjQIpZzSo4Z0Jx/xYHaJG3FCe8I9m0o/iYSc+8UFCtvp+Orrx
 F1JP/clmn2bXNAbxgZf8saxRJ8cQ5ZC6BW56ghPSdx7tcYVnibshHroYpUCXjEguTOswG7SxDO7
 Mekrz/KL+WG3zRRfNnN2RJ/UQB5K1TTborjHlHaYQA62IXuYA7oyNrshbMMkGsTKMm9zx8DdECm
 TknYMG7a0B2Na3kckkj9aHtagxiqWaS9WYbYYHhDeVTtJfUKoycZSxMIyFPidH5NxLrg5k6TtW7
 I4oTQNK7TOM3Ra5+RjwwyeNbyjPzT23NWI4RZ44ayqXQpLHUySvTE12sKBKejt0dRwqaZaJKsHH
 j44AprlpPOyvS86kyAycEt+XHpn4toeX57AQw4urC4Re7mdo3C0UfnYuA0kVWo7s9SGIM0PUbaL
 +PNtLV2k8ss2vLw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE3MiBTYWx0ZWRfX77yCeOvLvddl
 1i2Z0nFqI79n8seUVWJlklXoFVthXYoF/5U/jOeylEy7JkfYrfQYQ2bV8ats2U0G3/r9oXtG5OV
 HfAs7kd58Vk7L8wJWcc+SPI09ukVDbLFaOocymZ3kM4dd/6Npe6NmYvwbMvzpaw4KB7ZiV9Rr0U
 kX1A3pSoJiD29mfX15ZHGJomznH/dN6HQm8SMMViRaHvELBtc6CqzCTkcN6rrwHfMw1OdUesH6M
 IHoPuMw5mgmN+2ds4wGNaJDuZBKT260onxcELBRkEKyuwysXCmTSkHkEHWPOk6GAI7Xt42eIF7L
 dphlNPRIOA5AHnoA3crSzDRlaVzAmySbnhQ8cJoV7pHkCIohBKriSGUS6xxzjBc8/FGijk8ob82
 x8YLeGadr6JuOZRTm0MTBSyIjyXvdPmyWt7jhlT9REGT0innJ8QCZIETqlcGM0//Iih8ZAKsAsd
 F6jsFbp6KpoTY3illbg==
X-Proofpoint-GUID: kYQ6wxObwy2M0Uz5YZ9BNTOJ9xx_Y9cq
X-Proofpoint-ORIG-GUID: kYQ6wxObwy2M0Uz5YZ9BNTOJ9xx_Y9cq
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b1cdea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ls0epF-H7U94aXreF4MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110172
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97076-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 21C7C269E6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

'long' type is already an integer, so 'int' is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.h          | 6 +++---
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 02cfd46df594..49433f7727c3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -43,7 +43,7 @@ struct hdmi {
 	bool power_on;
 	bool hpd_enabled;
 	struct mutex state_mutex; /* protects two booleans */
-	unsigned long int pixclock;
+	unsigned long pixclock;
 
 	void __iomem *mmio;
 	void __iomem *qfprom_mmio;
@@ -132,7 +132,7 @@ enum hdmi_phy_type {
 
 struct hdmi_phy_cfg {
 	enum hdmi_phy_type type;
-	void (*powerup)(struct hdmi_phy *phy, unsigned long int pixclock);
+	void (*powerup)(struct hdmi_phy *phy, unsigned long pixclock);
 	void (*powerdown)(struct hdmi_phy *phy);
 	const char * const *reg_names;
 	int num_regs;
@@ -167,7 +167,7 @@ static inline u32 hdmi_phy_read(struct hdmi_phy *phy, u32 reg)
 
 int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy);
 void msm_hdmi_phy_resource_disable(struct hdmi_phy *phy);
-void msm_hdmi_phy_powerup(struct hdmi_phy *phy, unsigned long int pixclock);
+void msm_hdmi_phy_powerup(struct hdmi_phy *phy, unsigned long pixclock);
 void msm_hdmi_phy_powerdown(struct hdmi_phy *phy);
 void __init msm_hdmi_phy_driver_register(void);
 void __exit msm_hdmi_phy_driver_unregister(void);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 667573f1db7c..73fd5a47022d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -94,7 +94,7 @@ void msm_hdmi_phy_resource_disable(struct hdmi_phy *phy)
 	pm_runtime_put_sync(dev);
 }
 
-void msm_hdmi_phy_powerup(struct hdmi_phy *phy, unsigned long int pixclock)
+void msm_hdmi_phy_powerup(struct hdmi_phy *phy, unsigned long pixclock)
 {
 	if (!phy || !phy->cfg->powerup)
 		return;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
index cf90a0c1f822..cfa8fc494199 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
@@ -7,7 +7,7 @@
 #include "hdmi.h"
 
 static void hdmi_phy_8960_powerup(struct hdmi_phy *phy,
-				  unsigned long int pixclock)
+				  unsigned long pixclock)
 {
 	DBG("pixclock: %lu", pixclock);
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
index 1d97640d8c24..10ee91818364 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
@@ -9,7 +9,7 @@
 #include "hdmi.h"
 
 static void hdmi_phy_8x60_powerup(struct hdmi_phy *phy,
-		unsigned long int pixclock)
+				  unsigned long pixclock)
 {
 	/* De-serializer delay D/C for non-lbk mode: */
 	hdmi_phy_write(phy, REG_HDMI_8x60_PHY_REG0,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c
index a2a6940e195a..6f40820d9071 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c
@@ -7,7 +7,7 @@
 #include "hdmi.h"
 
 static void hdmi_phy_8x74_powerup(struct hdmi_phy *phy,
-		unsigned long int pixclock)
+				  unsigned long pixclock)
 {
 	hdmi_phy_write(phy, REG_HDMI_8x74_ANA_CFG0,   0x1b);
 	hdmi_phy_write(phy, REG_HDMI_8x74_ANA_CFG1,   0xf2);

-- 
2.51.0


