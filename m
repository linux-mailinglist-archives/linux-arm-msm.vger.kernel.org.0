Return-Path: <linux-arm-msm+bounces-111355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y7C0HTqkImqAbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:26:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0426474DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:26:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CoTPCZNX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ey9U8ra7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111355-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111355-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 769F3301CFD9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9547B3F4DE7;
	Fri,  5 Jun 2026 10:19:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D4E3F7AA2
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 10:19:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654759; cv=none; b=r9VhW9fQ+PK5s+epBeOAxUCYjJkFcpyVovl9MTYejL12p4Xkfoyj7GMCSfSUZXZrdRYla53zKUE0lPgzG9/VdSOG2cHSVM1q9/lClUHPCVKvhToKmui7qslsAXkXB5SGauGuLEeapdDeS7W7hHkH2oNuoPU0ufCIZWb50r5tRM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654759; c=relaxed/simple;
	bh=UjONg0NYj4XKMunIFJbINoDK3VSOgIFWYIBOvuNak5g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nDHgxsmlrIYvKWAQQqmrGI7bHygMdrYp4BakqeMzzmL/KBZ2VaWCifOfFNjK/VUZhJyJShfAgsImizJg/1nF6tdo0iU0xsDbuNEO8N1QuZQf7R0d8oWzYwxAQYoAA4KE+jt3wELA03rU4GXZO4dCYqszoRYWNjDlv3gTgDWh330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoTPCZNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ey9U8ra7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65593c681957618
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 10:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YdRn4DRbFufW0fmv7Xxdna
	0Xs07PVl1QBs1/OWzN90w=; b=CoTPCZNXVLY22xU7IlGWff9+nkN8NSABuqQK7T
	yhjH5HRfRUAC2nU5amDTJOTJ8/X0cepcrQnVE6naN3qswU2gy/9MW/sYS6sFkSNb
	k+mEyavpP9eznk+hA/3jVTMMVFf4IBPR4rqLBxNSPDXMVNqPVwN8RCWZP6U2KrBQ
	DWzeRwu8FgdX+upf4gWBXo4U4zcUj3+6MlD+oA+ZYF4aODv3rf4HV1ljjnVPMLDf
	danFRBdDSE19VvaI3aKe/oX/+Dfr0AiFbR82LXwJVcC8N4X5AMj3I8m5Yrfwgjhz
	Ejehl2Yxz9mHIaMac+1UCzRDut8xVTBdP2BbEidMeb4R3x2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekckpv4xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 10:19:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0a99db8dfso19775135ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 03:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654756; x=1781259556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdRn4DRbFufW0fmv7Xxdna0Xs07PVl1QBs1/OWzN90w=;
        b=ey9U8ra7sWfiTWZ7z0C/NJc2YafnC3Sb5hdEGYL5J/VhzDP5M8+T3lRZbADEVlvCv5
         mXecLIf1SaMTNPUtfq/dMSk9nO0ZWRjFxET8cl6VPvftIOEwKs9SdtMiTQQ5223j0ESS
         veRWjOo8XoQy5L8dBTkts2petY4wLnvmblVRLRv/yyKelz17CRv3SojUrK3w76gdrd2J
         w/8yCs1CufJcTDQQzEwYAuu4NWAfbV7vV0FIsLgU97Hj09zqAR9W35OYVjyVmohTC6lJ
         g72cHn7tNxl+ReJI7OFq/BAMeYz8B8NWOV05UoWUfDqyiawvVuJyQmNRZj7pLJo0/i98
         kSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654756; x=1781259556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdRn4DRbFufW0fmv7Xxdna0Xs07PVl1QBs1/OWzN90w=;
        b=LN3G/cS/XpzvWnoX7vDKiypH+Y/rEH5obt4nGues7UHw+7kkiSg2nHBoU4fB4gDthJ
         9ZU1shCTRMRMSN4eDM0KoOzsIMR0d1LiYp0m56rBGVdBBrU0MXNPZ8vtuiXA9Ha4wv9G
         CsIok4Z0vT+IM9IWxdz/kMwQNxkQRKKjcf0nW8LZbq8ICPLkpHHmdAgSFeTdOdytE/65
         vEQCYe3qD75NqaDn9xsx+p5QcKKWg5wGTNCfkC2vP0jG7lfADqjBo3pRx8JF8jPsHTpk
         pxij1aa5GxBAtOnsU8YDr/It6eiL7lgXx2o8A8UvK28sVa7eggg1PlcGR/EJcjxkbNdN
         wdHw==
X-Gm-Message-State: AOJu0YwLEGDTvV19B5YIgkqJ5hNrGdR9GyCCg48/0BzAbnPsmoIqQ1yE
	AD4eI3bB7y8JMqcIz7VZ35a7iazgZgj3iERfUW7P15yRHLwhsSD6+WCZF5GFlozWKT/qCeK8pBM
	NEvGzp9zK0aYvyrYEh1FQ3K8O1WA1Yf7aJsh5IZj4dLqsdB7mq7Mu6oBkPGSuEnWMocEF
X-Gm-Gg: Acq92OG3LrmikMYXwmPpWJACeJ2o3CDKHhbb/OFP0zHuj1Je0M8Ast9z3njY2F4DM9u
	YKovBVfNI97IxVKwMVKnnF5xxjcziHxGgp0iDb/xkkvLHBvlFiTUtIqGjwTQ3+3viSzeBeffuvT
	RfuweA2sZRNY0SW4IVUkLxIOlGZZbTjJ34wjVYIVJ0fO6pOrengkMSTzhgnm7mVWw2lUYDQq6bM
	4myCyqkAom2fQS4fwYPVy+hSMj+BPY5Z9OIuk/VgBc3NboGI3Um5PQ9Qr5NOS8vb3l8xsh3yCrq
	pAeHathn0ASgApiIadXXBjwPOs2ewznn+Y8AxRcLoA9jRYPZf/b+F9w+ZjpaMqDPc9WqQgy1yp4
	VS/AKLVa1SIPiR6U4/R8/HQ8vzx/2o8lhIJgZZd4Bd3285g65+VkwXyagn68=
X-Received: by 2002:a17:902:d58f:b0:2bf:195d:21d2 with SMTP id d9443c01a7336-2c1e7e44e91mr31358885ad.16.1780654755827;
        Fri, 05 Jun 2026 03:19:15 -0700 (PDT)
X-Received: by 2002:a17:902:d58f:b0:2bf:195d:21d2 with SMTP id d9443c01a7336-2c1e7e44e91mr31358275ad.16.1780654755335;
        Fri, 05 Jun 2026 03:19:15 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:14 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add Shikra (QCM2390) display support
Date: Fri, 05 Jun 2026 15:48:50 +0530
Message-Id: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIqiImoC/3XNQQ6CMBAF0KuQri0phVBx5T2Mi2kpUkWKHWgkh
 Lvb4sZE3Uzykz/vLwS1MxrJIVmI096gsX0I+S4hqoX+oqmpQyac8ZKVLKfYmpsDWhscOpgpE6I
 UnO0bqBgJT4PTjXlu4On8zjjJq1ZjVGKjNThaN2+LPou9v7jPKKOgQWWyKhoAcbSI6WOCTtn7P
 Q2HxA3PP5XiS+FBkXlAuCyFrtUPZV3XF6jbTxkLAQAA
X-Change-ID: 20260603-shikra-display-07767208fa90
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
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=3346;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=UjONg0NYj4XKMunIFJbINoDK3VSOgIFWYIBOvuNak5g=;
 b=NYZsTfhD6L1pZkrKqjY12HiGTIOPAad7elMOIEmgc5l650WfUBoPQwTaiYI4OYgsjDKjhuKBL
 jCLt2KM/JUJAy+tdw3EdLXgPUp6qTh8OMonqEGpoxLFIK4lrDHSxFSQ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: gzEGLa6jvFtxk1mdbK0QDgTh_qm6OePS
X-Proofpoint-ORIG-GUID: gzEGLa6jvFtxk1mdbK0QDgTh_qm6OePS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX7scau0Q11m5b
 aWqrJ96Cmo1nnNggGLqC256s917U8j+1Ly95hb9hqEs9AUXIqAdfe77jE1jWTsmEUOEPMV+SjoN
 7iJSVlzdNs5gSRqizgZ0kud8GWXSRP435XvCFALIkKVLVssvuwHwSyFmu0yF3CwvlXIrQx7OZP/
 b9FJPXtaYFh0P8BXIS+tkC6ZEBnGNbkyZq/DX1OGMO5QFVUvu6JukQNZNbARD7OHiG5tEf7e9y+
 2sD6uRn21Nbyew9m7Vh6CLvIfulVwXYdULA5T1Fj1F2CySm6RgDRbgi2eA9OLaoPutGtNQL7Lph
 uQpgyetOPRh1x1UJapYmjsFWlL0uPoLNCt6B8XuBEgDYNq1bC1tqie7Yg+AC26A05lSZ95iSUzw
 yVabCkHmqTTx8yQlGIgGq6kfjzOGXGrMAErhz7zGbHEoxQGjw/L7/iqzdDNXhu+/sRF2Xywj/0U
 xz1MzCxX4MzZgTGdjwQ==
X-Authority-Analysis: v=2.4 cv=H9jrBeYi c=1 sm=1 tr=0 ts=6a22a2a4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_or6NCU1o4AAqT2-bvQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111355-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: DC0426474DB

Shikra (QCM2390) is a Qualcomm SoC based on the QCM2290 family that
reuses the same MDSS/DPU 6.5 hardware as QCM2290. This series enables
the display subsystem for Shikra by adding DT binding updates for MDSS,
DSI controller and DPU, arm64 defconfig enablement for the ILI7807S DSI
panel, and UBWC configuration mapping Shikra to qcm2290_data.

Driver and SMMU support are covered by the existing qcom,qcm2290-mdss
fallback compatible string — no separate drm/msm or IOMMU patches are
required.

Tested on Shikra CQM EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (3):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  arm64: defconfig: Enable ILI7807S DSI panel driver
  soc: qcom: ubwc: Add Shikra UBWC config 

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml 	| 4 ++++
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  7 +++++--
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 22 +++++++++++++++-------
 arch/arm64/configs/defconfig							|  1 +
 drivers/soc/qcom/ubwc_config.c							|  1 +
 5 files changed, 26 insertions(+), 9 deletions(-)
 ---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Changes in v3:
- Use a fallback compatible chain for qcom,shikra-dsi-ctrl
  in dsi-controller-main.yaml instead of a standalone enum entry, with
  qcom,qcm2290-dsi-ctrl and qcom,mdss-dsi-ctrl as fallbacks
- Replace oneOf in qcm2290-mdss patternProperties DSI compatible with
  contains: qcom,qcm2290-dsi-ctrl to avoid duplicating full chain
  validation already handled by dsi-controller-main.yaml
- Drop unnecessary select: block from qcom,qcm2290-mdss.yaml; default
  dt-validate compatible matching is sufficient
- Remove self from qcom,qcm2290-mdss.yaml maintainers list
- Link to v2: https://patch.msgid.link/20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com

Changes in v2:
- Drop drm/msm/mdss: Shikra support patch; driver reuse is handled via
  the qcom,qcm2290-mdss fallback compatible string (per Dmitry's review)
- Drop iommu/arm-smmu: Shikra SMMU client table patch; not required with
  fallback compatible approach
- Fix UBWC config to map qcom,shikra to qcm2290_data instead of
  no_ubwc_data; Shikra shares UBWC support with QCM2290
- Refactor series from 5 patches to 3 patches
- Link to v1: https://patch.msgid.link/20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com

---
Nabige Aala (3):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      arm64: defconfig: Enable ILI7807S DSI panel driver
      soc: qcom: ubwc: Add Shikra UBWC config

 .../bindings/display/msm/dsi-controller-main.yaml  |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 +++++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 22 +++++++++++++++-------
 arch/arm64/configs/defconfig                       |  1 +
 drivers/soc/qcom/ubwc_config.c                     |  1 +
 5 files changed, 26 insertions(+), 9 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


