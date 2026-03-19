Return-Path: <linux-arm-msm+bounces-98601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM6yKRJyu2nSkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:48:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E62C5AB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D2C330B2657
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CEA315D50;
	Thu, 19 Mar 2026 03:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKdWofyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRZgnt4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822191DE2D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892106; cv=none; b=eOdOAiIZdDCfaCn+5t9neRps1Ub8/SKSAUlfQ+/9mMStndjXX+W3e6iyp2zg19M7qrSso3P21YggICHKQkMZXiz/pdo6muQH+6yQ9HHRg9vSe6wAVURtQAvI+lq7G44yDd98sD44RtktC2a2rctdeJJUjWA1Yua85qZpIaX0rpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892106; c=relaxed/simple;
	bh=GjT8hX4GoLE57pLmBQAVyLUFHndk0TADrBaKx6V+sLU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oI0cIJhbrDCaDhr/8NTDmcH2OmanzTrERdqRwqY+kWpMWr7jc7G5kucqROV3VrRzIMv1ULpZwT92TLvZSHYh8nne+jq2iOfUVqpOr/vWm/JooEl+P7NCBof4bqTcIAV/eIHFQ4bDLGXUMsZFvcV33UTFpFjJjOHHLW/ez+D5CkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKdWofyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRZgnt4a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J21bv0005323
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JX6V7P6bsRPeotKtiH7RJ9
	N7+4pq9ewOSYm/l2L69q8=; b=QKdWofywVfC8mLqUB1djykNVRCqNJ4ytFYOYsG
	/KtKWI5O+WHdjewmYRcN8l2ftdjgz2OcQgkoZFO4ZV6dzlsTLA6BiQ0+/Ie1ZIyA
	1QC3UnyJdguaRDBn42y8Og9AzfxsxIVaE1oNbtydb0XDq7Yjxyi3zCKi3wUWESfg
	kN9vkZjY2zCNRoFk7F9jLdq+HnNW385cWuZTXaOiGd0JZCWs9Luy3M5ZcYOwMHot
	8nD7/BJuwXG3GhO4Ds72zomPIh4nmIyUJzqxlXPSorNSTWPfYLh4Cwo2x1P956Am
	Rx2pi0zE2MABMqJbgKTRvNOk7r98BNNeWRdU28eVB3rk6Y4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhg9wuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:48:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso52968151cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 20:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773892102; x=1774496902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JX6V7P6bsRPeotKtiH7RJ9N7+4pq9ewOSYm/l2L69q8=;
        b=cRZgnt4a3IYci6L+SLj3rlgfuNX+AkWOLAsOItcMKaX8gkXAJSgT08RMWyxqlvd/xn
         T1mapdiM81Te5ZZvjLiAB8uK2Y7gtH8ZgUjGS21c++VYaUGYBaOPDj8X7NaAa2gj+RuA
         Fe6alr8+BkL0tg0UCYBsqLTKt5nY0yjE3Ped0fFhuuiwYkhj6J0Bi4ezNtWKVvLWs8O6
         CyGbgmaoqDBBwOvtqLZ545x6j4s+fNiP04ya0fBcg9qQhhvRa9OG9g3+EeD2nMC5HrX2
         uNOj0fS7HY/bo1zi6m4qcMFaCYSkGJWroeHLP+FOiFNd/TyDHsv6jTPayBnwS2IwHFs4
         ieTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892102; x=1774496902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JX6V7P6bsRPeotKtiH7RJ9N7+4pq9ewOSYm/l2L69q8=;
        b=WKk1/6WUi0dmDEGrLaJWrnpkE9Xqqw7C97W+460tkTP1d5D3lhrICcGCuSjrCUOqV4
         Ff70t8PlmtQ47yceFejfnYuBK0g4MXKY2FR7Dzd7hoxmlymR2cvB23NE9ytESmvfdYQI
         WA7x4mpqwHBeXyAdjR7fSQGXpSQ5mjDicI1rHVM+s5s7p64BcmFOkTfyE3GjmcY5D6eh
         rmwCQr1rqRReAVg+Cn6bEgJDX7zR3nSxoBcgPxv339qDZC4L+gWUw2ssx5SfBQJd33jb
         nNZS14psTJjnvFiiKMEqquCrqIoZrxslLuUaJzmJQ7zMZ2Uzoebm5XOmfNfJUo5Hb9kP
         TEFA==
X-Forwarded-Encrypted: i=1; AJvYcCWzAkjQQOqDXbvBAEvwnwg6RaWNc0c6rgYodLp267lAOe8OEzTjufRyWuXubbo+0XHplhXz76HPLuS+dPI1@vger.kernel.org
X-Gm-Message-State: AOJu0YzybdKLDGbXH4c6K7xcEe5rrZYW1zFcixkRSDY07MqcvrHyfiJi
	A/JyYM7Piu4TeNbPuq8ieOk2DvQUYDAU5KuDI8WtNd365EcSyvzP9PF3lITjXYg4xk5CvrHOiEY
	pQVBJs4SYEQmMpl+F96MLSzIkdpqcz9jPE21phFtkquFl5QAhFr2KCL1HimycNo2uQRFj
X-Gm-Gg: ATEYQzz0Lyjsde8CJ2bOBETnG5Nwy2zUk617RSrZvk0vNqEVU5Ag759+5beplUy6YjR
	CuU551MMmOU7d5wDDybZom1UiC/Uw2kr4okyDn7dER/2mFk3jBcYfhf7NRnSTrJb9gD9rR2R9hs
	0pa2mBDfG9PF7AcGHmw9NJ9Nw165dGw6Z+qULYzhQE2HBthMVO3hARhxMGVJCvNBHEaOlEkWMjY
	jktzT7HmPiaXqaNmVlP+xqYIJYgaIMYs76i+UuGglll56TvuCH4swaINyy9cV9B1PkKyxnn/I8/
	UDQSeMqOdWX9yWTuW9FRWOUyZ0viSoqlP09DX77ZKVCArPlnEQFDXLZP1tG4iHPtJtdPL6J7/du
	pcKV49WPoeosfAiDGOSxp6bpM88QCQOXnxWIFpIe90Bc/junMvHsmPhn98GqL4VO86SLS26EY8B
	oDu9rsBFlxngq1hEWHWcTPuVl8Hndw9Tt08Ak=
X-Received: by 2002:ac8:7f04:0:b0:50b:2e8c:6ad8 with SMTP id d75a77b69052e-50b2e8c6cadmr226621cf.34.1773892101695;
        Wed, 18 Mar 2026 20:48:21 -0700 (PDT)
X-Received: by 2002:ac8:7f04:0:b0:50b:2e8c:6ad8 with SMTP id d75a77b69052e-50b2e8c6cadmr226291cf.34.1773892101202;
        Wed, 18 Mar 2026 20:48:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c79442sm907649e87.70.2026.03.18.20.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:48:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/4] drm/msm/hdmi & phy: use generic PHY framework
Date: Thu, 19 Mar 2026 05:48:17 +0200
Message-Id: <20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFyu2kC/23Oy2rDMBAF0F8JWldCo5etrvIfpQu9HInGViq5o
 ib43ysHsgh0M3AH7uHeUQ0lhYreT3dUQks15aUH9XZCLprlEnDyPSNGmaBANZ48jn5O+BY3LIQ
 dOejJOjeg3riVMKXfh/bx2fNU8ozXWIJ5GpxqNgKA4pQAg0GAxoC7t5aNWFO2Gr9yO1/TYkomu
 VwONqa65rI9NjZx4AclqWT0ZU4TuD+cNUZJZvwgz7lW8v1jri7PM+kHHauafBKKchCvhOyEHIE
 xE7Ty3P5D7Pv+BwRCMEM3AQAA
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
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4372;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GjT8hX4GoLE57pLmBQAVyLUFHndk0TADrBaKx6V+sLU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu3ICJCKy3A19oDDChvBzxx7B9r5GPU+ihItK3
 ZBilBRuiYmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabtyAgAKCRCLPIo+Aiko
 1VXFB/9LpajkYmQVIUq/d8ZFH142i2Gr/sXj5aitG99qq0vTEUO1esGql0jcvkWJvnYNPUoK1fk
 whb1q0odkeY4adRCYRXu6R5R6eXgsdMMeq9BQ1FpOHQhaW/Gn0A/hRNNFLMQGos/WnvTKXa1CDu
 72ISmg/zqatGwp/xsPYZ9HCCnk3BpPhTCC8itvG23j+XTc8UZkPWtPkCakjzmbjLaFRoG4RUCpR
 SXt4EgExHOw5PA/pTk+j4COVYr91kfPGmewrXnb7aVpK98cyzB9JpwewaIYu3NjRHo+NY8U32Su
 gw8MEdwvEqFIOE0nr3UeWEM9PFs1zGXH8uQOe6j0pX7K3r0N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyNiBTYWx0ZWRfXzK1snavXeMHI
 p/mQsAxTbO0DJjGgdoz3EM3ZUZEdGO8kcHAXLdkAR3U8h5LMSknnnwmw77QQasp7W47BafpfFg+
 My45j0S9y1UjQMf10thhe0dbaMSOL1HmeUzbtgQ5jZApo/U1MWDlymI6QHxg9t7Uw84hmFfKxJ+
 36jJhrWwhBA3A2EX08EHTyf7vyNpQccJgkhHikTElpj+vNYX2dN4z9Vs/p/S3WlyNzxYjfsGG8z
 LQjl36pBNkhca4B5DggsqZ6ApgrBr5+oPR6rU5Bz1uFhjoL5BEhWIbbVIzMD2tghGN48AVw/WOG
 g2n3idRB+MLENiNfamodFJPDkwmZRkmzw0SK+dpSIH1lysrWoufOXdp0qmmuobK8cbZHQ/3MnoB
 +c7Az/9PdXyKPQDYuM8SxBY8cAL2rjRj2ZSpvDlVY38z+nwYZWn4Op4yKAwqzFDgi5RMhHdYA/y
 Rkv+z3wJfXTG5oFWtHQ==
X-Proofpoint-ORIG-GUID: 2Vqx6cob-OhA14DVk3-nv7sr8jhh1dFj
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bb7206 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aG6DWvB8Nz23F0sxf60A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2Vqx6cob-OhA14DVk3-nv7sr8jhh1dFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98601-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 363E62C5AB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Merge strategy: cross-tree merge via the immutable tag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
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
Dmitry Baryshkov (4):
      drm/msm/hdmi: switch to generic PHY subsystem
      phy: qcom: apq8064-sata: extract UNI PLL register defines
      phy: qcom-uniphy: add more registers from display PHYs
      phy: qualcomm: add MSM8974 HDMI PHY support

 drivers/gpu/drm/msm/Makefile                     |   7 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  80 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 761 ----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 765 -----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 460 --------------
 drivers/gpu/drm/msm/registers/display/hdmi.xml   | 537 ----------------
 drivers/phy/qualcomm/Kconfig                     |  24 +
 drivers/phy/qualcomm/Makefile                    |  14 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c     |  23 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       | 352 +++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 462 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  59 ++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 443 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 496 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
 drivers/phy/qualcomm/phy-qcom-uniphy.h           |  74 +++
 25 files changed, 2628 insertions(+), 3188 deletions(-)
---
base-commit: 95bcfacccdad8a76e02a8eaa92baaf09c879877e
change-id: 20240109-fd-hdmi-phy-44b8319fbcc7

Best regards,
-- 
With best wishes
Dmitry


