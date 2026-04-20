Return-Path: <linux-arm-msm+bounces-103793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKlAMAFU5mmwuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:27:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3903E42F7F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17A6D310E3DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF5B329C71;
	Mon, 20 Apr 2026 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQrhyNSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vjcr7GTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3505F329C7B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699107; cv=none; b=XW0CfW7RYBPB35Tn19ef5kVit92SqgWoxcunUYah26cFf0E6TMAnl15nYSQoBtzmRTUco7ySXzFqHAVRpeFpavWuuS1UiwxT8/Sz36o3y4+iCDx6nFZvRzRHyIIXT8zdV/ylA+rI3etcccs0C7V1Wz8JyOuEAwARHz0hdXvofZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699107; c=relaxed/simple;
	bh=UvPqtcBs6t12Cb50UIargyyrmizVDFL3lnz93lf5dTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ohoOU1rqRBGer2j10BLufK5CONBqmd/23DyHkzkNhuPmM0WdVcIwp2j+ba5Cd2ZfkyGrbU/oo3dxXzYCxLBj3N0xO2eS0POPML3qCBLQBv56qCwgqRkApYipsCi/cUYbNt9RUSppGX7wWz/RDORD6mOIyGKHdg5MmsrdVi9Y7Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQrhyNSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vjcr7GTs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KA4It02980962
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KPq2KWyVdJ/QThETfa/aj4
	GaL3KGHo2jIAgQ+4vtHSY=; b=mQrhyNSO1d4bVUQ2uy3chP70enO+iO9b/9x8wF
	WYVeBNBsgGl5uk4Wx5ZzJTsJhSP7twcpbRlFk0X9cqLO49FDjXuQQDyu7ku849d0
	vEHn2zSLkdnK3Mb3Lb9KzkMJUxxx7/FhupOQWNn6WjtpzDLPGEdbhqxOiFeqoO6s
	L+TSM41pvZdc6c2Tt6/aTaQUX+nYtUgVVuRtnBXRzpAw0+LqFLs3uSHAv9yKD5R9
	bhi8oehMmdD3XNG+jt2bnnKEF9c5BEbpCXtOe40u6L9kE7UFgokFbkUJXdlmP+pJ
	VTMWDGRx46hXqjtEbW4BamBkdAyE4xLqZfkxMPDXeu0aghPQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnj2ps5fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:44 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-479d900d222so762413b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699103; x=1777303903; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPq2KWyVdJ/QThETfa/aj4GaL3KGHo2jIAgQ+4vtHSY=;
        b=Vjcr7GTsZH61pDNevW15ezqxU2kln+374xp5eiFaC4p86iI7ebajod/BNgXBD4PFGT
         dRQMAnaExjBCktbXeQgo+tG6zczT3JeoKYLhHw7xLfFIl2kqjSLI8qhuOduxdI4HOHed
         4556q6qxFQx686FT7UVUj3i1ARxod0wcVvkQ5d/bJUW10lSUgc0PCeWol3ALL+Lao8BE
         UqRdPBbI2zw7052uYUUStQqjXGqIdDlEk34GqO2I7VWaiE39nHLCN+xEVgCZAAIBCpuL
         bVsSL7AAhXAfNKhe3Z5LW/Xv9WNMxnoFg75pY4brxWwhkuotgPEWg6coNTvXA59wMRdn
         chaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699103; x=1777303903;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPq2KWyVdJ/QThETfa/aj4GaL3KGHo2jIAgQ+4vtHSY=;
        b=rzKpZup/Emz5B7EmcpDalMhSTQKzsKmVrLneUr8MVArgat4+4H2Ege+k5dGgMRG/ZE
         ZASCfIaZVAuvIIzOM8XS1ZWY7vCuh3xIW9/0Eb5coVgBpcvfS6UHbQGqes+H44M4vPEy
         TuHN9/hGuh9fNUBqpqC4+eD3J3erK64hssnZMiS441KH6IT72VqFfc/NNTuzcwbAmba5
         IUvV2+VSuDe12LCctGDAiSVi34OgDdnyJ+DAJAvr23WNKI8SOwtP5gUeJOwHBq9Pcp1W
         R/3FR+ykGpFS4u327iILZJ1oTZi+JUJ2fJD7ksh6gtDyxk/f+uBfOm/OYCvkZBOgipEZ
         8QsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cH1cALFrOxcj+nrQ+pYZiIhR9QnERWgY6RXs8r0GOQye0Tqv3Eo435cFobOetduld+dJZNMxgBjTElp42@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvM/YWlXreeRTJCvDdIdDtU77o8qggMCDCJ3V15ldQMmjpOub
	dVMkoPrUHr1XmPHp4Z4pYse8UO14y/zHCg9mdVTmG3v9Pq/pZgzzW5fNEkBchn6n3HnvhQSE/Ne
	6Vfh4k2XskCl/iDoS8e8RnQZ3PFKq3HNS4DG6Z9YGBZHRJvdkRuvjUuv0oi9Ak+cMk4Jo
X-Gm-Gg: AeBDietIQc0ecboGMf8MEdt6LcCh/7MPsMW0PvD2a+2zsiFsWA5bkwmNxoD7slnqQ6S
	21YTH2ucJKKqVvVryqCmnA2Kcj5cz8DEgLhzmIYu8cREqseuee/VTrJPbVbmRdq81h79utfFZ2g
	LUzyGhhy7gMUi2hA6ORWmOdyo64SjMj20lSeP39E7mJ9zJBQ0DJvGk1ZCklxvTgJR1MxBTHGoVj
	/yU1Ht0cTeQUqdVMU5ledXwPfko6AcGEW93Xq5ywkQ/KYRQcGaj6Z6/rbtvkH38JwOo+544BmY4
	RPqYV29yeRVBnVxPo7CXPCAdtbIglWK8UDhHu/l3b8HeNggni8fBTWU6iC0+9AZ6J4UCeyfH8LH
	rCdsCKneq7hZIc5TmwGMG+R30vYD+76cq983t2ktEDCcU2tcbKe47T2kPEktB/1CwnV5MIJMqKi
	vpD3QDAGOmQBfSEEBNf6fsmqyy6MbhwUCG06moEB86k5xfyQ==
X-Received: by 2002:a05:6808:8888:b0:479:ca20:2904 with SMTP id 5614622812f47-479ca2031a6mr1688394b6e.40.1776699103436;
        Mon, 20 Apr 2026 08:31:43 -0700 (PDT)
X-Received: by 2002:a05:6808:8888:b0:479:ca20:2904 with SMTP id 5614622812f47-479ca2031a6mr1688353b6e.40.1776699102944;
        Mon, 20 Apr 2026 08:31:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/6] drm: handle IRQ_HPD events correctly
Date: Mon, 20 Apr 2026 18:31:38 +0300
Message-Id: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpG5mkC/12NQQqDMBREryJ/3UgSrEJXvUdxkcSfmlKN5sfQI
 t690dJNNwMPZt6sQBgcElyKFQImR86PGeSpANOr8Y7MdZlBclnzSlSsnzrmwsww4RiJYSO14U2
 tzlZAHk0BrXsdwlv7ZVr0A03cLXujdxR9eB+PSey9n7z+lyfBOBNKCyuM1VLLqycq50U9jR+GM
 ge027Z9AAYPTRzFAAAA
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UvPqtcBs6t12Cb50UIargyyrmizVDFL3lnz93lf5dTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbcZbi/KWXeOsOVKc0R63XrtFjzk27ElCmXg
 o1hqq0c2AiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1crcCACcPmDWi1VRXcgFtEXlo+5T/J8Fo1YheczB5Yf/UcL5kzeG1wYdBh80oB6i8rpfl3PAIqI
 OtE0Vs3/R3OyrKQWM6mUEfbofHykn/tlnQdokPu98hSVlATQyeKrtfLI5o40Nrdwxz7PWCEhc/d
 CcHkRkkhNxWNDiQjJQATtm7QgXgteXtJVp0OkDMB3NWa4Mif6sOwMvfCWxGS0VsfgmopA14BWm8
 iMV8J2GhiPTLlcAWNcpW0UCaRV9Las5xLHFCFyX4DkL0yvG7qFApbn/YIQtAUQ9wVya89ZSPODt
 cAE6lzXZZ0TY8jCDbiqtMt2ZWZkXJLv9TxbTNBit8UHk4MZH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _wY-ah-4hXxZ8v6ub6ecm95aG3p45oIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfXw5TXJPEnIZDm
 /SocJTlFvMu+1RVydbHO/RVDPTEbioNN/SdTdoT64H9lzHEbxGhWgZUmALYydCMdB1P62MbZP4e
 2avS/diWwZ7HWWGFAagi9SNk45lxwQIWTRw7aac99rbCGD2yBeRF63rQELUz1453DXT2zhrNXUa
 4opGBMBObHOiWtQhYVx2yhRgy1r9SFyGFlAvdv4+IaYtE7qxsdUDtWal6UNDuYeaA1k7tuqT2Kr
 WEy9QQODxau8irRqvbUbG2LJB5z4aqI2KORPla/boTFpzlvyZ9xig3bvKGfrx04SwIFLjptMiRD
 B6SP3i+Zs1wV5MNkAd4AnjiI8f2VFW89P6tU+jW/JyFvRMDw55tmEETp39r7Quglcsq1CDGxG7j
 nonqA4hZZLTjx9Z2K5LfHFWSUI9Xc5x+57lTnhP+7oBwrP8WFyzunCFBuIwjDAQCBSCdLpSG5mr
 H8L20DDvT+lcJ7zOWSQ==
X-Authority-Analysis: v=2.4 cv=XMoAjwhE c=1 sm=1 tr=0 ts=69e646e0 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=ST8Y6Hw29dmLQzsKkX8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: _wY-ah-4hXxZ8v6ub6ecm95aG3p45oIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103793-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3903E42F7F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

---
Dmitry Baryshkov (6):
      drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  4 ++--
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  7 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  6 ++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 15 +++++++++----
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 22 ++++++++++++++++--
 19 files changed, 138 insertions(+), 51 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


