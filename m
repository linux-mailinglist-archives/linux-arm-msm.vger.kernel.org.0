Return-Path: <linux-arm-msm+bounces-94466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBuiCkqqoWm1vQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:29:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 996431B8F14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0765230D45C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5049C27FD45;
	Fri, 27 Feb 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmS912TP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SB8VwT3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0B12989B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772202197; cv=none; b=MjJBUYRKlVSnV/bxbsALin6nOmiHpITH/8+yQGWtw1wyUkYoXEtMXr8GQOQyQo/g7gCfvrnDhn2JGAdtHm9YS3ugWEpaB18CfMwlca6oJ6Q4BYL+h27CQmLmKc10GDt1O/uddGUvljSF56kcZt5YPhKIR9FfVr3ee6xtiIOPs48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772202197; c=relaxed/simple;
	bh=qiHSzVHBwmKCmpWxCLWKkvn6EVGayWKBpsn+FNXo6ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hNmyLyRtoEeCTtmcNPAkoCYcaCUVQbesQjhjlFDN5WuNNvLVOWwGabeWUtvdvcaxl50xT1Ys0VpRH1NP7yGoOx8+tMoypf0N8WgQ+r5IWJDDuvkPMNM2qSce32d3qmI7H2LWLw3OysgD26f65nyCWOVo9ZXn2RE2F4w+xKVdFlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmS912TP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SB8VwT3l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RENERr1125825
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LbWv1DraxFhV/1oko2gTlG
	J9gvfW5tsF984h+FYSIgg=; b=TmS912TPM8oZ0T1JYYWp2+GYljZJJQu1/xudc9
	HFvah1a9ToJEJwXgBOeIdUCULeHTsAPS3VHsbv3TaRltqzZjwrTvWVaO0vpEfZEo
	aUwzFCKXGLknRMCSGZZu5Fsmzas52i7UDLvTI08fqCAFHhqvBoCZbCNET2sHokQI
	uAClhIFEDZhK0rkZKhGerzE1kEYrOcU4+Am9c9GGduudzkrqUEiKBlt0CYK0m4Ye
	AUpxQMZFEPLkSLw/uFVKWtTgkFzgIScKYv9xBjcpJG0N32R/g2ty5cUDPpOGt6jT
	PczM88Ii7Zmo+/Cv8ZuzjmS9Y6Lec3627tgY7htdKiyLrX/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7ybwpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:23:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71304beb4so1279676585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772202193; x=1772806993; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LbWv1DraxFhV/1oko2gTlGJ9gvfW5tsF984h+FYSIgg=;
        b=SB8VwT3lch4xfSuh6uFWhvNjQwQQi+eqbfXmz6PzdIi1ZlAvEgPuV/MOOmo9hTKw4F
         l1UmKU3ZH6xgkhiEYJQU1IsoQ65qTbWj54KnyEmTU5gyHJUPRdrXuCUANlFMDmTXsU+C
         qvCpb1fSlOm5TI/uV+w2kr9J/5sTK15xiHygyStk0w8VwtKH2fnfMt7oBSj115KdUptS
         yfIzYcPMB3xmjAOrJyGiCtNpC77jVuAfnNY4t0XLfkxYgcsJKgcdBIVugnne+zWFI0/+
         F7i5iVkeJXPtxU9UqnmqlFsD2LbUZYYZyeKErvoXORzpZcXKNbDJl9plZse0pWWs5KPx
         JcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772202193; x=1772806993;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbWv1DraxFhV/1oko2gTlGJ9gvfW5tsF984h+FYSIgg=;
        b=SJ51VFjTInLxAl6rkeK4LxyF4b8TDKBiEMXzAaGEMO9qLY3p3CbRtuawfeIOWk4ejC
         3J/ytp/IAfj70QkzHk67aflx/aMwd0HezjFmptx7EMesL2wrTazSIGLb1GngjqFH6hsD
         V5D/vLjJTrw4ns5wY6juqNPclKTEI73KBBteqIucVkzvIcH0KtIoa1X9c8WYDySDMaJD
         TMTjgFB8Ci3AMPZHhi8W5QzE9x9O8SNg+D57HOnegH/eW4mxrarlMbCNwfeHAQqTnKd4
         BMBUHLT5D+Z++5uArohwYM8hOkM78oJoFVOBW0wSJZjPye23XvgMXSYh2SPIf27Bv4y8
         RMlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWnI9Vg+EuE+nT8FgmVIpNGMM4qVxJPYoUMJYGKuLbx/oNIGq/dUQPX16H6fCP51tNxsH53SizfVsciXrd@vger.kernel.org
X-Gm-Message-State: AOJu0YxsBpisUaV/aLQseb7DTD9NMaNZSJesDGHY+BDYuVb5dCmtFMiI
	1QfXdNpK6PyoD2eMDDbUZ+sHwMcNVkXMvVd3/uTnhRVkaPbiLRGS8xVOeemiA1dQpdc/GFQ6QEl
	Pkg3kfdI/TmCoxq2j7cuES/8XowegPlX7vccXnRDGXOzvCAKvmHFU8NCVMkRWMs9yLQAK
X-Gm-Gg: ATEYQzxPlx1zGVc2rbgik7/YFStX5DPtnU/+k3tFBIW4kUcq2DcfwrpzTcEjd97AfHu
	1e88QxkfTJyWkHSkd0mHbCAaN4+yDquDu4cX7zvC2ZumlC4Bccrn6SwDhSqGVB3Q+VlIEnZX563
	YI708cWHir24vcj/vlVqMle7UiyucxUEhWLtuD9biupBaVNIfN7Yl3s6wZ0nyHOL7bF+ODHFcUw
	A2ohrh5y0WkDbzxZD+AoJn5E8MoVDogs5q8mHlEVAKqvbUwCfdVu4OEyOSzna5lidq4WqrHeCib
	3TSBu4b7GOuAdMim5v4yvzQ2WH1veKi3bDSu+EnpCeYjCl2Leq3bQ8wtmCyoLUBEiqWCYrsSpba
	gHl4Nwm0fA+d25Uc64vYLLO9L62ZRFg==
X-Received: by 2002:a05:620a:4505:b0:8c7:d2b:b5c9 with SMTP id af79cd13be357-8cbc8d834d9mr328564585a.9.1772202192472;
        Fri, 27 Feb 2026 06:23:12 -0800 (PST)
X-Received: by 2002:a05:620a:4505:b0:8c7:d2b:b5c9 with SMTP id af79cd13be357-8cbc8d834d9mr328558485a.9.1772202191836;
        Fri, 27 Feb 2026 06:23:11 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm120204765e9.8.2026.02.27.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:23:10 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 16:23:00 +0200
Subject: [PATCH] dt-bindings: display: msm: Fix reg ranges and clocks on
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMOooWkC/yXN0QrCMAyF4VcZuTZQizjmq4gXNs26zNmNZBNl7
 N2t7vKDw39WMFZhg0u1gvJLTMZccDxUQN09J0aJxeCdPzvva0zD57kotvLGOGGQHCUnQ+WENIz
 0MKzdKTqiwNw2UDqTcln/P6633baEnmn+hWHbvje5QwiFAAAA
X-Change-ID: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qiHSzVHBwmKCmpWxCLWKkvn6EVGayWKBpsn+FNXo6ls=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpoajGiWV89MPuotO9j0TY9byhHx2MtflA2zy47
 idxX7lWc1CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaGoxgAKCRAbX0TJAJUV
 Vr9rEACSpY2faiOnGoMe8kzSd6PPC1vk5Lhem2qn7I5lzQiTwIU5M4S1kbzLpT5wYDWRjvjhBcI
 toEwyTpL8I/XsVi6s99yODDmyHebSPdTzrtpGvPpJzLgtBkKThB7pJ5hq9Kx7M15GfO9LllzYUv
 bLihWNPYWrQkaqonzlMhz+fm5SiH5ELbPpDrz71CTZD3ImLg7eN5XP9YS3K+OV0dJSz/LnddKe/
 +1PSUZM8/HLrjeHPKzdaO3rhp3IYRkYlO5+Q1nCL2unqNtFJNpg7ZKMYM6jKX3r3Ru8jJJj7PxE
 Kb1Ak3mCCD0BHFqcDdZRcwlTV7i9WUaCeHGu+01TImDY6IdQs68d4ysn49PANwloB3siaOkw6fs
 YsqHcuhI1N7Ujxbgbu7zB513FrJ1/21SUsVI22c9F0lKAR4HrHbBsUOplAmEEvlzn8XHU5FCEbx
 HaLIrLbB1Ftpw0cRgt2vNxMmNgl1CwrAgxvJNV++e9gC93a6xxdLD6gIEiTfMSGOsC7gBzTvp6r
 sXsLPuUfzG96aRpmKG6YvmZcSkWmWFgHle+dxO69kXw96UcpMM5UN9tm0zlsmc+QwH9z1WAeKXj
 cCtM5cNzwq5I73QXh3azZXJq2yW1o5ekJLewh3V6mBGACNw3dK4ciVgoXLoEvP3r48Ag4A/sPZ6
 EyT0FRCQFE7x5ug==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: KzSiyVWtiv9duamL6yVF6RrawNSml7jA
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a1a8d2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=feC5BgBSBr5ATEYaNTcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KzSiyVWtiv9duamL6yVF6RrawNSml7jA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNyBTYWx0ZWRfXzEHgkL58yU7V
 QErZ8EtI2QCaY3B2awGiKah8RvC3Cih1Ah2Ov/dz+sTlyu5UtM/GVFsAUfL2KRdBJlkhu3JONAe
 gbQbClz7aix7Ey+g6244bYBS4nXalyY4aX3GtyoEVGOEGR+496nRkIZLUQUwvi4yKCoHnVErYVO
 knvNpKm1lM4b1acS2FHEreCEx2j12QYLERH4EJ2oDi3dXo6+zas74NnEgci9PxmZX8TLBLkQPQB
 fseLf+ekjaulhlCzdX9bAC1ob+eYj+786pGScuET66vw5kkce/QpsCKhFxygn/ez44eZdCuefeO
 QHhustuGVc5JhGAYvAl/sfraCD7ed1uyd49qf5Rrt5/JZUVBLM/isImusznZ7jk4y9/h5/pExtl
 iV7FeKl5O+jRDpmG1IQTanyszcWc/TXrAhTaIItdHeRg7YUr4zORechM+idqh/ACAa+GTD7edjH
 POwM5DsnDUVuipSU2FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94466-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 996431B8F14
X-Rspamd-Action: no action

The Glymur platform has four DisplayPort controllers. All the
controllers support four streams (MST). However, the first three only
have two streams wired up physically to the display subsystem, while the
fourth controller has only one stream (SST).

So add a dedicated clause for Glymur compatible to enforce reg ranges to
describing all four streams while allowing either one pixel clock, for the
third DP controller, or two pixel clocks, for the rest of them.

Cc: stable@vger.kernel.org # v6.19
Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ebda78db87a6..02ddfaab5f56 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -253,7 +253,6 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
-              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:
@@ -310,6 +309,26 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 2 streams MST on some interfaces,
+              # others are SST only, but all controllers have 4 ports
+              - qcom,glymur-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clocks-names:
+          minItems: 5
+          maxItems: 6
+
 unevaluatedProperties: false
 
 examples:

---
base-commit: 7c21b660e919698b10efa8bdb120f0f9bc3d3832
change-id: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


