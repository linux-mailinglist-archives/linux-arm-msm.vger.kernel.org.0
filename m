Return-Path: <linux-arm-msm+bounces-101228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOpNFgaUzGmbUAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:41:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F123747C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C66E530B061F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9CB371053;
	Wed,  1 Apr 2026 03:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLkzGpkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lma7DY+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163DF37E317
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775014754; cv=none; b=DGdQG1lgJeQt9xUcIvelnIu7Ko/Q3Xl+5GV9j3i+vYWUYte6KUkq6nXqh38rtyDAWqi7j5nBx8qI1SD2V9hDhWZyjkEfxIxkAGn7nqdVREfnjQkIKU8ZBt7xHmI7lOG+wW3MB8QbcwZRchZwXXdIBUzwFB6ETldI8hpzPkHtGwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775014754; c=relaxed/simple;
	bh=eGJGe8eovJ/oAHU5KO53a5jb8nImFIZo6uG/tUVMlCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aw9PsjKMSgnmaUyFw4l1TKimXBrxLdgN6SiQlre/o6zaFROrirP+VVNBH61YpH8ZLm/atXJ7gNSbCeDq173rXsiJ+Kyo+Dm8TqG72XagXzDDIX2u2xNc0LJxJDvezDbJZedqw8IRT8CPiIzhW9+Tn+CwWZ3V8BxsyXfpl2X6N2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLkzGpkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lma7DY+O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312Ixgf1005237
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 03:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJ9ENS/CvssgrseD6ncEcwK29NBYxwaboFYVZIp4MUI=; b=aLkzGpkYuSMHIoty
	QRvFCTVvd9qCu78OEEa9UxPg0cnd1QlWnfWJi5CzRXQLp3EvOUR5qnzVA1JF85DN
	TnZUoSuBr5PYFYohHb7tWER1Mw8KB31Ls40wTZ+qEXPvWf/3O3xyzZLf1X02/apV
	5Nr2iVkN9gJw/kxk5uvatt8167FFGNvf2t+8lGCeQ5M9c04p5rj+gOg/zb9KvKFI
	AA98LFKztwCPCuZAaGuwJuVJBkVWvlSG+RsUdjYTRqd5V9W+/XvOHv4XuzrbfWaK
	HqQGJxKile8HeyxwgUYf9Mh2x78cbFE9orHVf6H71lj1RecAe47+P8gOdinL2eMN
	Rd8e5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjg8kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:39:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso68292561cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775014751; x=1775619551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJ9ENS/CvssgrseD6ncEcwK29NBYxwaboFYVZIp4MUI=;
        b=Lma7DY+Ocwel68lXA+TgZLovuf2MkVkjGVnvif12ExKEq99r5lvN9f/NjNz89BDVqs
         TY4zs3NVsxqD5LcHFoVPRoZGrka/LOgEdKTYf8poZINJknkxcG4H4f758i//TUbjiFrT
         BFRI85ZQDFJBZZtMu4qRJhED692Nr50E6tiHRRsQv+QJkeA9gdJkXer4n+jXsHPNN1uo
         P/Hr6zDh4T4cQ8a/PI8QHUZoWNvXfafmyEvKAlat8QQWrJM6RqwisbPL84um1mLh1Lcz
         kSj4cRRPLA/IHrs0FmYAM0aTVRWUNnLC95IjkpYcYZv1IuB2F2vYWqvfQNkOoYky23ba
         5AaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775014751; x=1775619551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HJ9ENS/CvssgrseD6ncEcwK29NBYxwaboFYVZIp4MUI=;
        b=GobODquNX3AbGvNkOjViCHcSD/HtM4bbePaCU6R+m8OXqhAwXgKACweZdz4+lqo0tr
         BUsx7jq14lC0rbcdF0qwbdOaOA/97Ol/yFMmsSgYRGdMmUASbZtNhjOFSZlwCwCVvPZp
         g1dd64TAmQGSddljZgT2VDO+l1skI/B+FPBlV22cbU9grB8nZoDpLuR3ADHHzFg8ippC
         Ox+9eY6D4SsCD05dhD36Z3HOg4o3SdC0kizhDS+HTH0CYzfuVxmRQ6ac9M4Gv5zB2AZj
         PrToAzL8ZZ7yP/eP3XwdjGGW9/TMvUCIlIqvuzuqqLeWcYOJYdmQ/LRjtPa9fxgErnGI
         tjrw==
X-Forwarded-Encrypted: i=1; AJvYcCVkRiorkO6eKOdDdzp5cjllwyqnYTyntnYJ3Tqn8kqHh1zEoYwQxt0ylaap/LpLy54efDmRZq/vkIkfy4Z4@vger.kernel.org
X-Gm-Message-State: AOJu0Yylg7Tj24fJmGz2Swu8PTIZEAls1fT0HF5c1Pz5JZhYSF1cxgCA
	+ULpBj/HP7Z0BlczF9jqRvfK+432ot9V+LV+JE6zFLuQjPKcpBMsJH88rqaS/kS272tgJ/vN0ZV
	ulmXSRC1qQt0DRhmHVjrKFkte6oXEbiJz3vS2zfp0+H9BseGEZ9aXehqnWz7e8Vz28315
X-Gm-Gg: ATEYQzzt4bmS6J+svwUYTGn6ms9LvtQ/UbNwskLSOHg3MRm7yac2nCUGSUYHZPFaiYV
	gmONH6stMmv3tl+guYdKZI+jperRIGbECZk8NNEF3KHi54EiUsF1ITHr2QUNQ6HdejTWXAAJhXC
	CTU1pZEFJFlBsZKermZno863ADYy4V78aPAtj/61t1eqqC8O7Zw0+BsXc/J0AEWgXdI2k7agth1
	/t8N4R/ea9anbLI1M23vRtm3bdGVkx1O8Sv0EQJvlcBXvBB/NMMvvX0xYffZe0tkSFEjjxG7qOL
	kiQlzyPmQTwmHejq4kOWhXEdPIwfynogGV7TWtxOEzIJ4WW2lv0X5FKSTxUz+XvE1Pzu9ABMxEY
	sw6kdWohpdlB2Mfvyg2DgtlfdS2y/ccrhzeH6vu/L4kQkeWRVPdvsfM/eMccNDMG5U3L/+MvmYp
	WnIEUw/zENE+a5tNjd9KefvYKJOEDzYEXntTQ=
X-Received: by 2002:a05:622a:514:b0:509:aa4:4a02 with SMTP id d75a77b69052e-50d3bcc3e29mr30479191cf.29.1775014751237;
        Tue, 31 Mar 2026 20:39:11 -0700 (PDT)
X-Received: by 2002:a05:622a:514:b0:509:aa4:4a02 with SMTP id d75a77b69052e-50d3bcc3e29mr30478811cf.29.1775014750776;
        Tue, 31 Mar 2026 20:39:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83730f7csm24404851fa.16.2026.03.31.20.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:39:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 06:38:49 +0300
Subject: [PATCH v8 4/4] phy: qualcomm: add MSM8974 HDMI PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-fd-hdmi-phy-v8-4-51b0e98edf6c@oss.qualcomm.com>
References: <20260401-fd-hdmi-phy-v8-0-51b0e98edf6c@oss.qualcomm.com>
In-Reply-To: <20260401-fd-hdmi-phy-v8-0-51b0e98edf6c@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eGJGe8eovJ/oAHU5KO53a5jb8nImFIZo6uG/tUVMlCM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzJNL0jPH+Axh+uC1JfC2+H52qSqXBO8GmiMwe
 iW69JGMTYyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacyTSwAKCRCLPIo+Aiko
 1Q2dB/4psose9Y/icznz3t/7IznjflEyGbw1FxyXI/iSSYwQP/qV20Mt2r1e6YjzUEJQkXFjbEf
 CufrmTlcGCTVnAceuWR/ALfpds8pNP1w2+HCyeHEkOCplCrOOLSA9Ur/XAbpouW43EeKt8GolNO
 LNMJvEqAo74WCVAf4+yl4Sso5pNhAmvAOk1yboSWQ+wGMkfxlTo+fHiA0H6/uvZX0dqlJ3nWpGY
 EPRNzoYQJvEMw+7pkFXQFhzrrl9iBXmS2XZbPROO/6dLmroJefMfOW9VM9BxuNy9TSntQNaPztk
 lT/ATu9GHDxVS7d3jPQQ2iLs7KFZ4CXRR0E4az/FkWlDn/rm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Z4omw9dzIgAnQmt5l_Sd68thgWZx8yLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNiBTYWx0ZWRfXwFMtb/06dmBP
 cwo0rxRRjX16nIkn6kYm+ar37/gAMg1lKKjXMecXBfOvQjNV/HdkgaygsjYwZnIqYuCrIIHDj0q
 wAUhy49SM63aj7F7f4KToRVjECgpi5rqD6eXWFMgkMZHSdSb0IXGlohgEtkwOw/VNs1iSbkqdH7
 ianzHMxjPOkWmXjqI5wlX5hEJzA/RFazRT1ge1hFTHFf3jN88R+g6fAdOys9h/IS/snOSDSfvpi
 28bimWt698zY3pgtO/aRljchnDAQh7o5NHNXmXTX0r+au2ky+26T7GdOSn7mtoXG4jkOkpiXz9v
 /BwHG3XEECyjn4x0Lz2+z5SmWikFawmJXbQnv5Efo6XjjbR4JpZIlm6vbrDQzlBofJXrMEXfV3o
 KWoTylpKFWV/J8MzxlXqZMFaMdJMdes0wNJ4d33aiz+jCfCM59PFINcqMjlpdfDVLuGxZ5ufyGn
 j+ZIYJ54hbaDsl+s/Ww==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cc9360 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=U0NZ41NzsMKYcVuMMSoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Z4omw9dzIgAnQmt5l_Sd68thgWZx8yLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101228-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4F123747C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c | 282 +++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
index 720757f8f393..801e304801b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
@@ -6,10 +6,13 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "phy-qcom-hdmi-preqmp.h"
+#include "phy-qcom-uniphy.h"
 
 #define REG_HDMI_8x74_ANA_CFG0					0x00000000
 #define REG_HDMI_8x74_ANA_CFG1					0x00000004
@@ -31,8 +34,282 @@
 #define REG_HDMI_8x74_BIST_PATN3				0x00000048
 #define REG_HDMI_8x74_STATUS					0x0000005c
 
+#define HDMI_8974_VCO_MAX_FREQ 1800000000UL
+#define HDMI_8974_VCO_MIN_FREQ  600000000UL
+
+#define HDMI_8974_COMMON_DIV 5
+
+static inline void write16(u16 val, void __iomem *reg)
+{
+	writel(val & 0xff, reg);
+	writel(val >> 8, reg + 4);
+}
+
+static inline void write24(u32 val, void __iomem *reg)
+{
+	writel(val & 0xff, reg);
+	writel((val >> 8) & 0xff, reg + 4);
+	writel(val >> 16, reg + 8);
+}
+
+static inline u32 read24(void __iomem *reg)
+{
+	u32 val = readl(reg);
+
+	val |= readl(reg + 4) << 8;
+	val |= readl(reg + 8) << 16;
+
+	return val;
+}
+
+static void qcom_uniphy_setup(void __iomem *base, unsigned int ref_freq,
+			      bool sdm_mode,
+			      bool ref_freq_mult_2,
+			      bool dither,
+			      unsigned int refclk_div,
+			      unsigned int vco_freq)
+{
+	unsigned int int_ref_freq = ref_freq * (ref_freq_mult_2 ? 2 : 1);
+	unsigned int div_in_freq = vco_freq / refclk_div;
+	unsigned int dc_offset = div_in_freq / int_ref_freq - 1;
+	unsigned int sdm_freq_seed;
+	unsigned int val;
+	u64 tmp = div_in_freq % int_ref_freq;
+
+	tmp *= 0x10000;
+	sdm_freq_seed = div_u64(tmp, int_ref_freq);
+
+	val = FIELD_PREP(UNIPHY_PLL_REFCLK_DBLR, ref_freq_mult_2) |
+	      FIELD_PREP(UNIPHY_PLL_REFCLK_DIV, refclk_div - 1);
+	writel(val, base + UNIPHY_PLL_REFCLK_CFG);
+
+	if (sdm_mode) {
+		writel(0, base + UNIPHY_PLL_SDM_CFG0);
+		writel(FIELD_PREP(UNIPHY_PLL_SDM_DITHER_EN, dither) | dc_offset,
+		       base + UNIPHY_PLL_SDM_CFG1);
+		write24(sdm_freq_seed, base + UNIPHY_PLL_SDM_CFG2);
+	} else {
+		writel(UNIPHY_PLL_SDM_BYP | dc_offset, base + UNIPHY_PLL_SDM_CFG0);
+		writel(0, base + UNIPHY_PLL_SDM_CFG1);
+		write24(0, base + UNIPHY_PLL_SDM_CFG2);
+	}
+
+	write16(mult_frac(ref_freq, 5, 1000000), base + UNIPHY_PLL_CAL_CFG8);
+	write16(vco_freq / 16, base + UNIPHY_PLL_CAL_CFG10);
+}
+
+static unsigned long qcom_uniphy_recalc(void __iomem *base, unsigned long parent_rate)
+{
+	unsigned long rate;
+	u32 refclk_cfg;
+	u32 dc_offset;
+	u64 fraq_n;
+	u32 val;
+
+	refclk_cfg = readl(base + UNIPHY_PLL_REFCLK_CFG);
+	if (refclk_cfg & UNIPHY_PLL_REFCLK_DBLR)
+		parent_rate *= 2;
+
+	val = readl(base + UNIPHY_PLL_SDM_CFG0);
+	if (FIELD_GET(UNIPHY_PLL_SDM_BYP, val)) {
+		dc_offset = FIELD_GET(UNIPHY_PLL_SDM_BYP_DIV, val);
+		fraq_n = 0;
+	} else {
+		dc_offset = FIELD_GET(UNIPHY_PLL_SDM_DC_OFFSET,
+				      readl(base + UNIPHY_PLL_SDM_CFG1));
+		fraq_n = read24(base + UNIPHY_PLL_SDM_CFG2);
+	}
+
+	rate = (dc_offset + 1) * parent_rate;
+	rate += div_u64(fraq_n * parent_rate, 0x10000);
+
+	rate *= FIELD_GET(UNIPHY_PLL_REFCLK_DIV, refclk_cfg) + 1;
+
+	return rate;
+}
+
+static const unsigned int qcom_hdmi_8974_divs[] = {1, 2, 4, 6};
+
+static unsigned long qcom_hdmi_8974_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = hw_clk_to_phy(hw);
+	u32 div_idx = readl(hdmi_phy->pll_reg + UNIPHY_PLL_POSTDIV1_CFG);
+	unsigned long rate = qcom_uniphy_recalc(hdmi_phy->pll_reg, parent_rate);
+
+	return rate / HDMI_8974_COMMON_DIV / qcom_hdmi_8974_divs[div_idx & 0x3];
+}
+
+static int qcom_hdmi_8974_pll_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	unsigned long min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV;
+	unsigned long max_freq = HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV;
+
+	req->rate = clamp(req->rate, min_freq / 6, max_freq);
+
+	return 0;
+}
+
+static const struct clk_ops qcom_hdmi_8974_pll_ops = {
+	.recalc_rate = qcom_hdmi_8974_pll_recalc_rate,
+	.determine_rate = qcom_hdmi_8974_pll_determine_rate,
+};
+
+static int qcom_hdmi_msm8974_phy_find_div(unsigned long long pixclk)
+{
+	unsigned long long min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV;
+	int i;
+
+	if (pixclk > HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(qcom_hdmi_8974_divs); i++) {
+		if (pixclk >= min_freq / qcom_hdmi_8974_divs[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int qcom_hdmi_msm8974_phy_pll_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	unsigned long long pixclk = hdmi_phy->hdmi_opts.tmds_char_rate;
+	unsigned long vco_rate;
+	unsigned int div;
+	int div_idx = 0;
+
+	div_idx = qcom_hdmi_msm8974_phy_find_div(pixclk);
+	if (WARN_ON(div_idx < 0))
+		return div_idx;
+
+	div = qcom_hdmi_8974_divs[div_idx];
+	vco_rate = pixclk * HDMI_8974_COMMON_DIV * div;
+
+	writel(0x81, hdmi_phy->phy_reg + REG_HDMI_8x74_GLB_CFG);
+
+	writel(0x01, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	writel(0x19, hdmi_phy->pll_reg + UNIPHY_PLL_VCOLPF_CFG);
+	writel(0x0e, hdmi_phy->pll_reg + UNIPHY_PLL_LPFR_CFG);
+	writel(0x20, hdmi_phy->pll_reg + UNIPHY_PLL_LPFC1_CFG);
+	writel(0x0d, hdmi_phy->pll_reg + UNIPHY_PLL_LPFC2_CFG);
+
+	qcom_uniphy_setup(hdmi_phy->pll_reg, 19200000, true, true, true, 1, vco_rate);
+
+	writel(0x10, hdmi_phy->pll_reg + UNIPHY_PLL_LKDET_CFG0);
+	writel(0x1a, hdmi_phy->pll_reg + UNIPHY_PLL_LKDET_CFG1);
+	writel(0x05, hdmi_phy->pll_reg + UNIPHY_PLL_LKDET_CFG2);
+
+	writel(div_idx, hdmi_phy->pll_reg + UNIPHY_PLL_POSTDIV1_CFG);
+
+	writel(0x00, hdmi_phy->pll_reg + UNIPHY_PLL_POSTDIV2_CFG);
+	writel(0x00, hdmi_phy->pll_reg + UNIPHY_PLL_POSTDIV3_CFG);
+	writel(0x01, hdmi_phy->pll_reg + UNIPHY_PLL_CAL_CFG2);
+
+	writel(0x1f, hdmi_phy->phy_reg + REG_HDMI_8x74_PD_CTRL0);
+	udelay(50);
+
+	writel(0x0f, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+
+	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_PD_CTRL1);
+	writel(0x10, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG2);
+	writel(0xdb, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG0);
+	writel(0x43, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG1);
+	if (pixclk == 297000000) {
+		writel(0x06, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG2);
+		writel(0x03, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG3);
+	} else if (pixclk == 268500000) {
+		writel(0x05, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG2);
+		writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG3);
+	} else {
+		writel(0x02, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG2);
+		writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG3);
+	}
+
+	writel(0x04, hdmi_phy->pll_reg + UNIPHY_PLL_VREG_CFG);
+
+	writel(0xd0, hdmi_phy->phy_reg + REG_HDMI_8x74_DCC_CFG0);
+	writel(0x1a, hdmi_phy->phy_reg + REG_HDMI_8x74_DCC_CFG1);
+	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG0);
+	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG1);
+
+	if (pixclk == 268500000)
+		writel(0x11, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG2);
+	else
+		writel(0x02, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG2);
+
+	writel(0x05, hdmi_phy->phy_reg + REG_HDMI_8x74_TXCAL_CFG3);
+	udelay(200);
+
+	return 0;
+}
+
+static int qcom_hdmi_msm8974_phy_pll_enable(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	int ret;
+	unsigned long status;
+
+	/* Global enable */
+	writel(0x81, hdmi_phy->phy_reg + REG_HDMI_8x74_GLB_CFG);
+
+	/* Power up power gen */
+	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_PD_CTRL0);
+	udelay(350);
+
+	/* PLL power up */
+	writel(0x01, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(5);
+
+	/* Power up PLL LDO */
+	writel(0x03, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(350);
+
+	/* PLL power up */
+	writel(0x0f, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(350);
+
+	/* Poll for PLL ready status */
+	ret = readl_poll_timeout(hdmi_phy->pll_reg + UNIPHY_PLL_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PLL not ready\n");
+		goto err;
+	}
+
+	udelay(350);
+
+	/* Poll for PHY ready status */
+	ret = readl_poll_timeout(hdmi_phy->phy_reg + REG_HDMI_8x74_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PHY not ready\n");
+		goto err;
+	}
+
+	return 0;
+
+err:
+	writel(0, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(5);
+	writel(0, hdmi_phy->phy_reg + REG_HDMI_8x74_GLB_CFG);
+
+	return ret;
+}
+
 static int qcom_hdmi_msm8974_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
 {
+	int ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_set_rate(hdmi_phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_enable(hdmi_phy);
+	if (ret)
+		return ret;
+
 	writel(0x1b, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG0);
 	writel(0xf2, hdmi_phy->phy_reg + REG_HDMI_8x74_ANA_CFG1);
 	writel(0x00, hdmi_phy->phy_reg + REG_HDMI_8x74_BIST_CFG0);
@@ -49,6 +326,10 @@ static int qcom_hdmi_msm8974_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy
 {
 	writel(0x7f, hdmi_phy->phy_reg + REG_HDMI_8x74_PD_CTRL0);
 
+	writel(0, hdmi_phy->pll_reg + UNIPHY_PLL_GLB_CFG);
+	udelay(5);
+	writel(0, hdmi_phy->phy_reg + REG_HDMI_8x74_GLB_CFG);
+
 	return 0;
 }
 
@@ -67,5 +348,6 @@ const struct qcom_hdmi_preqmp_cfg msm8974_hdmi_phy_cfg = {
 	.power_on = qcom_hdmi_msm8974_phy_power_on,
 	.power_off = qcom_hdmi_msm8974_phy_power_off,
 
+	.pll_ops = &qcom_hdmi_8974_pll_ops,
 	.pll_parent = &msm8974_hdmi_pll_parent,
 };

-- 
2.47.3


