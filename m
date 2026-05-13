Return-Path: <linux-arm-msm+bounces-107412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMUYHyDABGoeNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:17:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A4538BE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79D45303ACF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AFE4DA523;
	Wed, 13 May 2026 18:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLYQC72s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0RqXGy9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969AB1EF36E
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696052; cv=none; b=KfwUSrakESMVO3ZyZn0pOj/N7sxlCXmKQAR+Ld/M2ZEGikxO2I5G62r5mbpk5XL2H4zF/Lcj2T3UWzcJ8tpCo3Ar5e6gijH0ytLrHjvp3Xu5pKM/MY3+HF2M//dYLi6efcNylmO227KeiPARwNp8WcnajxAxMqbiUpwRExgG9zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696052; c=relaxed/simple;
	bh=mqLUBTI2S2Voxvu3yvM6wDaQbTBkg1ZFVIhIqHpLXg0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mscp+lrb5s9mdzR61A/f1x3ifbTmh8OKF1f9pqdCG6S5Ih+lG/gllyUMfx9+Cx/73iFwoFoyk4PVQoImLXHfdEhN4NoGxxtvXuRWLWoDuoGYTpsoQ1fHksB8cgixSJGQZvax3Mqw/tZ5aA8D5Tjb8O0haZHmh5NPATLAUSSON70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLYQC72s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0RqXGy9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBYZDQ3324660
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+5YP0QOKpbphYDgLRVZVQZ
	pcwDOr8t0VL/ATQqa7Tmw=; b=YLYQC72syw3caPf+4dU9R138TxtZPBD8Y6O0Fr
	TUV84VyPdV6XYwBTyHNoo+Hxo8bZn6sZKAYMxlMVRn+kfPCPLBSsEkjBqzX4p7+R
	y4iAeGrYOdHU0f9hqJbi0iJvjKsXZ1X026deoKIMJbASlBFyaKsQCtl2S75Viw3R
	M/fF68OppKTSZfgCW/+SfbuJeM1YlGB+4yJD4rHuFQP4xqxfmoX2H8p/roY1pXLR
	PTngClyo65nCtt/YB2tVDnB3mv+hT/fRYCNk6rUBMHhdoLDuAJvNHtKreWd+PG7Y
	6Y4CnfsYP86oLN5SntyPqus5zCJvGcSgizmE0dqudcxbn0qQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvdau3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6347ed78bfaso3280980137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696048; x=1779300848; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5YP0QOKpbphYDgLRVZVQZpcwDOr8t0VL/ATQqa7Tmw=;
        b=Q0RqXGy9gxX0A9XFFaB0wowT2hCYJX0sU2xBtrbuEkGMyeHwfYKFZ9nf9HKhOCWZFR
         RODvTn9+xYXcSVwUFMxQfiRfkQLS69ck4AuTqxj92osCZQz0HmfhQrAf5p/fbp52f1ZW
         1a1suPZ0tUSSo0r333DP21qAhmK1VjhZy1GXQ/aqUHP1L/+Rb/GGMxvkTgzfsnyQgD14
         HrZYvIyVSzs3/27p/KH3lywDVRQdOTbGczuc7oQOUeWuoqufi6u3Fggxlrm5KgSVmotr
         gxej4OPOC2lOjKYbarlgeAc6ny3nw/tcqGiwM/97DJRgqMU+sF0ecyVz/s/JcaRLSWTW
         lJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696048; x=1779300848;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5YP0QOKpbphYDgLRVZVQZpcwDOr8t0VL/ATQqa7Tmw=;
        b=nrHh+kePHaFYV8vO8C3PzTatWKitq+jlXY18foQbI0lQPLod8gzNOwYZHcI5RiAhZz
         SqkgZbNPj4N9FTGmwb+sQBLP9qBnPPmT5YWHlu/JC/BgFUVyMHRpz3Orq/MCz99adqjQ
         nf4j3XpbuSnY3xXE1aGT6ZSAZZoq+BBQzamThk1B/3aVOaKepocsVPVM2e9fm8kHax+6
         3jWz2lPCgR/fLtpVa3abAlCDWeVmN+RoDQCEKcD9482XNpGKDs2TgmcutQe5xsD7tpWK
         o2AVLg/pZSFrexl6k35Gq6eyVeNap7nbSvHsFRc0iKa/mKQm99xfT5GNzQxInTdzX/P9
         rRtA==
X-Forwarded-Encrypted: i=1; AFNElJ8mYC2PLU03STELHqs2p8IG6KVELVOUVlAYFqGEHRYzMn9tg5uQkWIYWtskp2+7NuUX4vldOdCbkLzXL7BZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxvX19lf3XSjuvjkTW5g/NSMbi4ikZoK/unKxSHpoaKYqxfODYS
	hPVN/5YDYxDqB55U1PtrqmieiRfZcrjYzF0sArJ+jaQsqFS40u/UFAgVZep6GoO6G4lfMvxcVWY
	yHV8KhpYqtjeo+xQyZuxWMMK+ezyd7NWMtQL6AC4y+FRX7xebCwdlhFUN5xYIlGoJ36ZS
X-Gm-Gg: Acq92OEWJbJZfqAw2/DbH+9Ngwv/epvoUXCk4A+ruPSvdpX9XGxqPnaFrk5juXZelAF
	ePgS//IKYHqjH0bpotVLaKHaDkDLSpA5/3t7JOer9IQ4VSeFoIJVuQgR8giDYaSpeovr7yIwjws
	nKBvr2CefoTBtqUdHEsa23tNWlDPxRbY/2bOhgvTkkoDKmXiFL6ZzeZjE8oh/QvlKMiFGA/SmtP
	c9se8x5ZgkEriZX/+9ovXlMiJFR/8evoFUc2ZsHxQxe6vBN6WfgIrZOCPCozoz2akMwCbBDzu80
	eN6hMUZiqXI6B0Ovy6bDHN8mkrv0ZfTk0hNORxgeLOqx4Omv28RR6uGzV+Bs4Y8yzU/MdwzIy4U
	xnggRA6eXh4IU3Yvz2OPCmpSJ3C/2tkmjeRavr3QfW4xpwqpcRpiUsl7RLy5uqoCH1XT5PFj51d
	Oe4IkbbuaRpdTEOJD9sTaROhAe857gCEWhwnc=
X-Received: by 2002:a05:6102:945:b0:632:29a5:2b24 with SMTP id ada2fe7eead31-637a6c2fad0mr2435863137.3.1778696047670;
        Wed, 13 May 2026 11:14:07 -0700 (PDT)
X-Received: by 2002:a05:6102:945:b0:632:29a5:2b24 with SMTP id ada2fe7eead31-637a6c2fad0mr2435842137.3.1778696047257;
        Wed, 13 May 2026 11:14:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8974sm3174770e87.64.2026.05.13.11.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:14:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 0/5] drm/msm/hdmi & phy: use generic PHY framework
Date: Wed, 13 May 2026 21:14:03 +0300
Message-Id: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGu/BGoC/3XRy2rDMBAF0F8JWldGI+vZVf6jdKGXY9HYSiXX1
 AT/e+VAaFyajeAKdLgzuqIScgwFvR6uKIc5lpjGGvTLAbnejKeAo68ZUUIZAaJx53Hvh4gv/YI
 Zs6oF3VnnJKovLjl08fumvb3X3OU04KnPwdyNlmiqAEC0pAEKkoHGgKs35aWxJi+l/0jz8RxHk
 1OT8mlj+1imlJdbx5lt+EZxwinZ1ZkZrhfOGiM4NV7yYyql+fwyZ5eGoakH2lrN/E4I0gLbE7w
 SXAGlJmjhW/uEEI/EfimzqIQLnSPKcM4keULIB4L+aSErYRl4H5RXrVVPCPVL1M/ZE2obBCwJW
 gXfCfcPsa7rD9FxG04AAgAA
X-Change-ID: 20240109-fd-hdmi-phy-44b8319fbcc7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5467;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mqLUBTI2S2Voxvu3yvM6wDaQbTBkg1ZFVIhIqHpLXg0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxbL/px7MZlGkzPWN8gLJcXH1iyZ8OmYXl+P6aK11pPTs
 0Q/LZLqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEFjNxMDTq+s+dKzlpS2SL
 c9j3VruZ2muExKqXFfl4NiseCV5zsC2aXYPR/IhNYz5zclTLmWTe1A8vcrXO52tP3KzH6HvErkS
 yLfeK758FzOez6zJmKdceLF1ZvVrMQGGL3gRbHlGBetvFRtMfSd1oar5hsqWy38dYosL6isNU5r
 s5/093X3KqtNX4baV/rvVJjGLPHJ3HWe37X9c/zXvw+d1asynrsmP1FRX+6sUfrfh9Q3zWH3b79
 28f3p71hs/f6eF26VUzJpnLVyb4Liv1tkxO7emwO6K1onHe9PmLGnx47qWG9m9MXef2h+ufZ2ZV
 /H2hFt+1S257f7ovvd4ytqlsnqW70qswg4DeBrdksxgA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: n5MVuBBa2wu-MnyARdGL5yHpyDHDzB1K
X-Proofpoint-ORIG-GUID: n5MVuBBa2wu-MnyARdGL5yHpyDHDzB1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MiBTYWx0ZWRfX+dIVREMwk16n
 J7tHrapqk82hvrgsA4r+8EMeVbnyAco4zTdIe0207vA1Ae9WsDvzK2za1wR+pmqAOKTmK1fJ7jh
 IfpDxzGng91tKbLACtwacgkPpsnuAPeDEDSCCiSkWC3++WLjKP+/UQT0bXvcoGZrK0ZRLqfJjmq
 Vf+NmEzo6F6Wr0Uzyo2DX5ko6hUWofwbxzEERkFbqNyUYfgqCxk4dREGoUloNYvJFtf3o5p0uBn
 kuIgnQufx7y6CYjtlVSZjD4jQ6Gf03oGQUZkbEiIZWhG3OacGUEiUlPsn6c+UQeas7olOcMAcB4
 oalTifCaNE0QRNEgRCaHjY7ef1wp6ag9fUAKT7xIuZAj/DX1tiOpolXF5brusDwfyrlcKNuXxno
 ZVtzBfABjsbESmCDhdrFr6nf+s+nSrnoihi1xPmQRha93/nivZckW5aAiCl+MQgQXp3BoOSPBMo
 TSmVbJKCtMbmvGdVi/w==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04bf70 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0ODQC-He88dBTbE4dnsA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130182
X-Rspamd-Queue-Id: DD5A4538BE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107412-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
using the generic API framework. Move MSM HDMI PHY drivers to
drivers/phy/qualcomm and rework them to use generic PHY framework. This
way all the QMP-related code is kept at the same place.
Also MSM8974 HDMI PHY, 28nm DSI PHY and apq8964 SATA PHY now can use
common helpers for the UNI PLL.

This also causes some design changes. Currently on MSM8996 the HDMI PLL
implements clock's set_rate(), while other HDMI PHY drivers used the
ad-hoc PHY API for setting the PLL rate (this includes in-tree MSM8960
driver and posted, but not merged, MSM8974 driver). This might result in
the PLL being set to one rate, while the rest of the PHY being tuned to
work at another rate. Adopt the latter idea and always use
phy_configure() to tune the PHY and set the PLL rate.

Merge strategy: Merge the first patch (either through drm/msm or through
the PHY tree), merge the rest of the patches in the next cycle.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v9:
- Split 28lpm changes to a separate patch (Sashiko)
- Reworked PHY power up /down sequences in hdmi_bridge.c (Sashiko)
- Switched to pm_runtime_put_sync() (Sashiko)
- Link to v8: https://patch.msgid.link/20260401-fd-hdmi-phy-v8-0-51b0e98edf6c@oss.qualcomm.com

Changes in v8:
- Rebased on linux-next, fixing conflicts
- Added missing ids for APQ8084 and MSM8998 (Sashiko)
- Switched to pm_runtime_put() (Sashiko)
- Fixed several missed *1000 after pixclk -> tmds_char_rate conversion
  (Sashiko)
- Fixed several math overflows (Sashiko)
- Moved UNIPHY_PLL_LOCK to the common header (Sashiko)
- Link to v7: https://patch.msgid.link/20260324-fd-hdmi-phy-v7-0-b41dde8d83b8@oss.qualcomm.com

Changes in v7:
- Fixed the build issue between msm8974 patches.
- Dropped even more writel / readl wrappers (now from QMP PHYs)
- Link to v6: https://lore.kernel.org/r/20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com

Changes in v6:
- Changed MSM8974 HDMI PHY driver to use FIELD_PREP / FIELD_GET (Konrad)
- Fixed rate recalculation for MSM8974 HDMI PHY (Konrad)
- Dropped register read/write wrappers
- Link to v5: https://lore.kernel.org/r/20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com

Changes in v5:
- Kept only a single place which handles extp clk (after PHY power on,
  before PHY power off) (Neil)
- Inlined pm_runtime calls in the HDMI TX driver, replaced
  pm_runtime_resume_and_get() with pm_runtime_get_sync(), since
  atomic_pre_enable() can not fail.
- Renamed registers defines to drop the REG_ prefix.
- Link to v4: https://lore.kernel.org/r/20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com

Changes in v3-v4:
- Rebased on top of linux-next, solving conflicts
- Squashed add-and-remove patches into a single git mv patch
- Dropped HDMI PHY header patch (merged upstream)

Changes in v2:
- Changed msm8960 / apq8064 to calculate register data instead of using
  fixed tables. This extends the list of supported modes.
  (Implementation is based on mdss-hdmi-pll-28lpm.c from msm-4.14).

- Fixed the reprogramming of PLL rate on apq8064.

- Merged all non-QMP HDMI PHY drivers into a common PHY_QCOM_HDMI
  driver (suggested by Rob Clark)

---
Dmitry Baryshkov (5):
      drm/msm/hdmi: switch to generic PHY subsystem
      phy: qualcomm: hdmi-28lpm: provide dynamic configuration
      phy: qcom: apq8064-sata: extract UNI PLL register defines
      phy: qcom-uniphy: add more registers from display PHYs
      phy: qualcomm: add MSM8974 HDMI PHY support

 drivers/gpu/drm/msm/Makefile                     |   7 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                  |  59 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                  |  83 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  88 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 226 -------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 761 ----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 765 -----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 460 --------------
 drivers/gpu/drm/msm/registers/display/hdmi.xml   | 537 ----------------
 drivers/phy/qualcomm/Kconfig                     |  24 +
 drivers/phy/qualcomm/Makefile                    |  14 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c     |  24 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       | 353 +++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 477 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 211 +++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  59 ++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 440 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 489 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  49 ++
 drivers/phy/qualcomm/phy-qcom-uniphy.h           |  76 +++
 25 files changed, 2617 insertions(+), 3192 deletions(-)
---
base-commit: e6e0eed7a4199442ad9be37daafafa4503c3f436
change-id: 20240109-fd-hdmi-phy-44b8319fbcc7

Best regards,
--  
With best wishes
Dmitry


