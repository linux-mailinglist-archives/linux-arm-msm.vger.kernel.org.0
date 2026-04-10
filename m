Return-Path: <linux-arm-msm+bounces-102633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNdKL0bF2Gk4hwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:39:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7473B3D50A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D88E23084DE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA7533D6DD;
	Fri, 10 Apr 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jq9IYHBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKVE+KF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5843537D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813686; cv=none; b=cp3ftT7/lV7NMOznbj9OTVSEL1+HcRpOL0zQTSpiSzCzXWyto1mMdhc5LVCkDlv1puN6vH1eJwvuyDJx+ySSJ9O6l7uRzp8SCOMVy3x9L9CARUrGXIYoaOeobCLL7NYe4h2QOEXKpRy5RGnlzXNaLVE90SmVbuhN6KecZTZWK3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813686; c=relaxed/simple;
	bh=ISlcJqsaqTclTJzJ0vHpqn6yxruy58dl5Y0F6HoiDg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZ8pKMpOyLUVc1o5giIMvgGVjr7oAgxv4Woowein8R6dj24MJSTplEiUjEh3WUYKDNsDJlKXramghPHeNKRZIFKOuRHi1QoD0yUfi0ABgliRnkDiWfyuUGQxsh3GiKK3vvmU+jkVLxIFK+Yn/RjwromK5z0IsdxUE+MKdSBGBtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jq9IYHBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKVE+KF2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A87E6v3935012
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/biFkItFX+oUMqk3cF/h471xd5ZBoQ7TawgNxLQz4g=; b=Jq9IYHBvHrs8c2lD
	HowZ6aHqSLR8S8SBZhQlTIFB1NS1vZKtaYPOks0A5BusgsAidkYgqJHsoNnvGGHA
	3wwG266xzfn5s2tBd4Yy8TnthIXkgf0lEieGn4l2An8rNa0vqo++rUuV0Fm6O3Lw
	VEShNTEh1yYTdx7b6TktHAK6oGGvx/sNA/R5vSHnST0G5bF40b2Djx/8iLc+s1T5
	og1cFUiV9oez8pdf+3xxnOxfHK3TIeb8F8UxkI4WqrT1yHc7w2aodF/d1NAnsVjQ
	8orAIZEzefGJ5zH1hzqX3THrrxMNIuq2k2fzvnZdrOkHHhZWKEueQCNNTtoXF8w0
	kRamlg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sbfn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ffce20deaso43749196d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813683; x=1776418483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/biFkItFX+oUMqk3cF/h471xd5ZBoQ7TawgNxLQz4g=;
        b=jKVE+KF2Z5brVKG3FNGxe4AMTLpYxK9nAQBOBJyvim0eXyU8XtF2HwbpyuH9Oj+20a
         AGG40r9PND5zbfmXKi4M8o4vyVPr6hiRfuihSnBlpR/Fld+cFUEQZ2XsegT3UEhEiI5/
         40WuDb2qEZI9PVURTeP3YXA4djK5a+ygz2VNJLcLEBd3l0twtvtqR3MC9iwsz65LwXvy
         hywaxRQksJuTltVwvlt4ZemkPiSL1AlPo0WN8gJ1/OG4MIXIxaa4nhTLEzvcoZBVqsuB
         dSRxl3KwNbh1Mo0zkwYDpKQXkROQ5tXl8WFN+d9LiAHFXM8AHTnjFuKSirwN5qEH+OgE
         dTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813683; x=1776418483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/biFkItFX+oUMqk3cF/h471xd5ZBoQ7TawgNxLQz4g=;
        b=NrH15SQBXunJ3+7tPKR5i7T4vPmjGfTdtrN/e47/w5i8jgM8sbBpX9gLQDkT1/h7xO
         iJN/vjsWVNhfOeY87VTPpTTU+n6X7MGqKI3na5GTmmfJfmSH6R6nHjMmJjS4YW+Palex
         K83lElAUqws2JWoDMQHLYzViWMwRScFgKO4h80/Aa4O65qIPSN2RpZGXiFC3eAYWC6oS
         yoJ4nIoBEVeFtwlLeAjeEaj4E3xiA1lMerEcH7EhRBpJVYiR8KZs8+YZD/ZR/sY2CjK5
         L7Gxp7xX4eg4mXVMqJuBuFbIgMKYhxLwS8EtSiFiHM1OF3zX5YEVTsaS2RaTjbWVQ7BA
         mPQA==
X-Gm-Message-State: AOJu0Yx3ZxY4p3SLV8vMc/iefqWp3IefbRYxycsa5cWlj01z/Zjj2UaN
	POALBVZRGoUpCE+hr+T3XBVDEZ6ov/8TSrM2rNpxd6FXEGlVtZGFpOolcNLggqGJGD0lRXdeK/0
	eycdSYmDRDj9M1pokGzckljRKU9dNoueVwF6Vj8VrXMM/A2Z0sgV3TkdAf6FpmbCN26QxynOa8x
	ki
X-Gm-Gg: AeBDietuLRLgaStb9oANznBIG3d2wwfzH9GwPElEl+IaDmBgTeZWdJh/MDbZW9LPmf1
	HTSG1boG3aeVvHKpMU4pMg+FCJeCWVEEYjmc4usM7B81CJwFo3v4kWolSR2OLMsHtv89AZM/LCN
	eymrhrAZ1pFsc6GjvaS4mftZ+btEydYlDVi1Di3gk/nXLMwhBu/d6tL74oZAogpoo+i2U1ZBUbJ
	z7EVllIx85xGOY56lQpVV9IIztmCt5ki6zDklAG8udOnubWAeLJrJdLvfmqZzk7WNU9CXSF4vxQ
	fXC+ixQAH7ob7Lkr/iZMzyXXX1bpB6KTtl+e0sUPqHmvoW1mJcTzBQF43bCL17ZwppmSYvDghXt
	6YciF5pD81K5W3YWVbRl/Jce+ruxIlqWUon5zs0MiszIGxOkAkRWlU6FMdNm7delhXpEARVTsLX
	aN2O58zpA=
X-Received: by 2002:a05:6214:f06:b0:899:fd80:f79f with SMTP id 6a1803df08f44-8ac8621c0a1mr34234056d6.23.1775813683285;
        Fri, 10 Apr 2026 02:34:43 -0700 (PDT)
X-Received: by 2002:a05:6214:f06:b0:899:fd80:f79f with SMTP id 6a1803df08f44-8ac8621c0a1mr34233626d6.23.1775813682843;
        Fri, 10 Apr 2026 02:34:42 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:34:42 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:45 +0800
Subject: [PATCH v4 10/39] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-10-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=3860;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=guzQ38GsRaOMwlRV9h4phTGd2vjPW/70KLxhOMZyCc0=;
 b=OJAr9yvQwhCxq/bCn/E87eHrdjxjohJh9n6mdnmJMS5gvqXMIRWVTF9aTTEhE7GpBYdN+yNbR
 TDO+rpqEOrMDdk6X0KvOWgYtMQofDl7bsHS3zNH0mbxJ/JeMneBUSH0
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: H1CI88D0zQHrhAtbujcx6uWwk7dL9XI1
X-Proofpoint-GUID: H1CI88D0zQHrhAtbujcx6uWwk7dL9XI1
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8c434 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=OtQsdMd2eBjxU-v0TgUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfX1gDH8VtWphHe
 MKcFZh/4WYaveI+7gWhHzuU7WDvqj6GBJPGOKnIs5YcyErROoEXOc7I4YkVtXRsc3Jkfr1yCcHv
 4dZYTmKvtWu9YbtNv5N1u9Xi1UZbGRNGtjM2lp4FhUSkQ1eiWottdAR2Pz4n4ZP2XNXJqzR0qD5
 jrr9BHLQ2/+5y2D7gjVxkdw4mQMxyeaEwV3PYhFwGhgSfd5H+3akittl5NrhZ+6+Sq057myZiMS
 iPQ4aGHgl/QOiJB+6lJmGo7gb2CP5dpgQIPZaAvzNGBpISCKPGgIfqLFW9nREQ9mg3ZC3mIRIMI
 SUYJlYlFmdbbXwvrz0Vx17WPbebSeqgE3i/EyAObSlItAqO/R0dcP0YUOsQM0eyDFcNiiRA6AxH
 mPUXfNi5y7Jv7+FQtSCVkSa4yPX1MiEYerqNkw/wH7uI7ihKCjYP3yLB851JFzdI4sXv4vs99Kk
 cs5p29qYcRDH//JMl4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102633-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7473B3D50A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Split dp_ctrl_off() into stream and link parts so that for MST
cases we can control the link and pixel parts separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 8 ++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index fa62f8f91189..120ec00884e5 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2200,7 +2200,7 @@ static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned l
 	return ret;
 }
 
-static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
@@ -2228,7 +2228,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
 	if (ret) {
@@ -2620,7 +2621,7 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2634,7 +2635,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
-	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 32196e97cbe9..b83be2252a9b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,8 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1bf1335712bc..31e229ac2393 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -730,7 +730,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl);
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
@@ -738,7 +739,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl);
 		msm_dp_display_host_phy_exit(dp);
 	}
 

-- 
2.43.0


