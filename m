Return-Path: <linux-arm-msm+bounces-94249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOMSGKsNoGnbfQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:08:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061E1A327E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67666300DEE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E5538F232;
	Thu, 26 Feb 2026 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gKCMY5Ef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJgZQiDi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3430596F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772096937; cv=none; b=c0gfE7HlGvPfwpOBpWyd+hzxMD2C5I3Zq3iQ0qOfVdiTwBjY6ii78/+vr0PDmf1nCCqCo++99Hc/h2BZtr8WNGEgKHWnrrLKd7HbMk85I1TfLrGqBCHDiQh3ProRd5UYnySrdMpDTAhrHjmPhk+3d8Eu2Q68vPDHVc6990mCxls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772096937; c=relaxed/simple;
	bh=AsA+gJVaB0n1q/2UCXmz9k9rHtiiqcFu68NT9XiPDko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pEc8eSAjGeiRB8xxPpgUVd6F3g2QTIn90ReXbkr0GLllbPgvDyDCygRYlJFcdVSrgFRJh6QsvMHCwQY9jwSkzFAdHj+sli1XtD0L9Iljb8C2gobrS2ORGZUX+44gjANy/F80V57o7wfxspvbrd404QRPYuJOTsJFvFgT098OSms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gKCMY5Ef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJgZQiDi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VMql3721926
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RXe/SUX1WenBcaA6Nk5U5ZXTozeuokZ6XY7
	QS42tJTo=; b=gKCMY5EfiDOPRk9Ldab211FLkpsRhTofFC1otIKOFfCpfOPDYhu
	u9C+NT2EefcBhAnokRCpG5YG/3C1Gs5dqpjWYlHaXb/qrtKWMHM0vcm62rO4XTLO
	n71SkorvoTs/dWXzHLJbsxFqIzuGw+z0wK5x1iY0EIEn1l5UulJNkgYlPOewk+q9
	gkmHG/FwGDL66QvtRtWgh0ojb3PY4fBr2aAMgauihMe3nLNGNraZAYIBDNyZEWiF
	5qbYBkpp95zjWPU6czNs2ZWvEhjsx+57f/0Vdx/UrUTrYWBMkpc0YYCGj4dhY/+t
	KUcEX/bYDfOd+FZEjGSoYEPVerC7RUUib9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf3p9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:08:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso623533085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 01:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772096934; x=1772701734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXe/SUX1WenBcaA6Nk5U5ZXTozeuokZ6XY7QS42tJTo=;
        b=gJgZQiDi6GVU073mIiJ7VqIwmryZ7HpGBsTgrX59jzH96PJdLhOK78qjCAxywrWf6L
         uQt8K98htDCmq2AWfn7UWxdXMXrs9JgqiKg0aTSbvxe3x85ZqSYBnwtDn7tiOwA5f0Ux
         721BE5k/AqCiMzUBFvPwtyKRK328NNmlNguw5TxX4BQiA3+WSkmW0ic1rNVOlmovjqkb
         M98iqPQd8kCb1O2O1NsmwrOiWEF8VP0q5EE6K4btSFq1kZXohDMd5vFinPSsbiUHp5jB
         I5Yi1KkxetkjbedPALV2jVSc20SGv3rI118VrYwRr1Vtpu1OKDCDD9EwzbWY4brEUtuB
         Ke2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772096934; x=1772701734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXe/SUX1WenBcaA6Nk5U5ZXTozeuokZ6XY7QS42tJTo=;
        b=OzK9V9O7tS6l7aY60CGvN+2QDffCK2pk8fVO7GYYGbjfe8pMbrjEhT9JgwuCiT2jB6
         ljysa1w6ViBlkxBP014prpkvCBHFIGWjbe143KOrvn4Hpuou+i+5PfuY1HeNyG/LMFEj
         JHfNsBYB+w3YcIh6XQ5eVMirRMriYEGEl7UqyO98TDNnl7OOebIMV3pLjZ7Ukknuwn5W
         DDr2fqCFyi+vtniL1Z5bFAHnc0SvBGZY/eB1qgQeDFCpfjs9UeZQYLuD//n/Nl9yGOsL
         n2RT/BUKQCdwCaAI68tsYHRKz90zXiXjEJc/HqgIRTJFrIjDLuI6KiKM67be/3f7Cj9r
         74qg==
X-Gm-Message-State: AOJu0Yzf9x9zNAbMtuqP2Vtlhk0W/T4FYcvUAdhwjyUDItBkfiUi7EqT
	1vtYbyrEGs69H10Z2T6Y/0chsFSjQgDyOsZeNH9tkwRAXbjPnKjrqhomxpLGSG4cCtsL7kgJggh
	wBGZmZW3kwLIS2qNnwdpiBDxzgPI8uW+g7mHrY+ir3CtozWgZ22q67kft5LVpcyWnh9a5
X-Gm-Gg: ATEYQzwbLeeGZmVNOt1vrplw2vMqYmsZXLl1IG0ZztT6yTtfePsZdm0cMzv6JEndcDz
	QE2KVKMc00itiQmjgx/RrtvQQ7InoqI0P7ElusK5LWWMfzH1+Nh6Fmyqsz7YzUMUbVMHA4qyQXh
	/tNBZ04lmhf/mN61jZ1VXNpI19qwjLs3wfv71k7Ae8f0ZMELm1Vow8Pe3xhR6N2JUa+P7tlAErM
	3d81GWGEMMh2xbDCQJW3oSy+z7tOaAPZDqsbeXnpBLrZahFQ1fzzfAhqvecUVnOCwllNLTg53Hk
	3gMAuXoHQkkm1pEWKsPwLbhWtW1qwm1JznngtBXU+kawiK+iJZczIs26mLH+k5+GivHHtvz9LEp
	YrkRdOxnFkmpw9YdRlRXBHEtAoFcOGZvkDaw8O/dsa/pZGgYOMgs7XdW8IblGhijavCXrz9FrEG
	WAiVoZ1VnnPBw=
X-Received: by 2002:a05:620a:710b:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cbbcf54d18mr417493685a.15.1772096934174;
        Thu, 26 Feb 2026 01:08:54 -0800 (PST)
X-Received: by 2002:a05:620a:710b:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cbbcf54d18mr417492385a.15.1772096933641;
        Thu, 26 Feb 2026 01:08:53 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac51431sm42419466b.17.2026.02.26.01.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:08:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2] media: qcom: camss: Add debug message to camss-video format check
Date: Thu, 26 Feb 2026 10:08:50 +0100
Message-Id: <20260226090850.828694-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WoiKopLIePP0wTS6m7-x7upwOJZJavOm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA4MSBTYWx0ZWRfXwb9PpcC7V4qS
 fu6940PWByKkYCTZDLfGfjxr17HfYOKXZtqUo+UbWyZ11tEmdiXT0yBbMOHETJsbsO4hpT12IgU
 l8eRWdOglD8E5FnThcihRZMIGQbnLzkZVLAR0R+M/rd/bcYTt1o2GZVBOlfsSUNg+IT0fvJma1u
 aWiT0k+Oxm+UyKxbY82Y/xTfHLUPJWUFQsaEFZ3h3H720asoVrebEZlDglvxxiOsCgZWzcXd4US
 Ai2cSfovvMflWOKTJLwRWa99pa1prk2uzyvjlAW1+k3M4hJY9SFMlijOob9R09qwD6gkS/xuAOi
 Uix3K7EPlbGnaoIxsYawM9Zcizbk3kqImRBoEXeDsBe0TkBI3tsambT1sQZxvMEs2wK1xFNWqKF
 5+yaeRvaxWQmrJT6j3XEZUdO4mofpkKb1A5asCWOCiXVwAfj1WZNIuyz2ZWU58/i2xF0p3trldB
 bEyjmfb+tuA3G0n5gnA==
X-Proofpoint-GUID: WoiKopLIePP0wTS6m7-x7upwOJZJavOm
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=69a00da6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=6k50daf3fveMbYCwvhsA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94249-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0061E1A327E
X-Rspamd-Action: no action

Add a debug trace to video_check_format() to log both the subdev-reported
format and the format requested by the video node. This makes it easier
to diagnose mismatches between subdev output and the negotiated V4L2
pixel format, as well as issues related to plane count, resolution, or
field settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0c76bc2cc574..0852eb6f1315 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -218,6 +218,12 @@ static int video_check_format(struct camss_video *video)
 	if (ret < 0)
 		return ret;
 
+	dev_dbg(video->camss->dev,
+		"%s: format is (%ux%u %p4cc/%up field:%u), trying (%ux%u %p4cc/%up field:%u)",
+		 video->vdev.name, sd_pix->width, sd_pix->height, &sd_pix->pixelformat,
+		 sd_pix->num_planes, sd_pix->field, pix->width, pix->height, &pix->pixelformat,
+		 pix->num_planes, pix->field);
+
 	if (pix->pixelformat != sd_pix->pixelformat ||
 	    pix->height != sd_pix->height ||
 	    pix->width != sd_pix->width ||
-- 
2.34.1


