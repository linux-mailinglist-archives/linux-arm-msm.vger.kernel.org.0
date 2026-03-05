Return-Path: <linux-arm-msm+bounces-95586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPBILp9YqWkh5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:19:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 176DD20F957
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 769843013D6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1B83793A7;
	Thu,  5 Mar 2026 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRNFmW1p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/j6XbOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BDC36606B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705838; cv=none; b=ZVgJXJLL+LEGnOWZNtSch8MrRPDFWNLwDQqArM8KBTCz0d6usshrKsk1jwZDnMg0OXRfGrxHDXTI+FbsvYTLdn9COw4syii5tDc+SJKcKyE/Xuee0pESgdjaxsypi53ztl2Tbuw79Yhj55woTMJf91xqOR99ym1txrZypRoLFJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705838; c=relaxed/simple;
	bh=pKtXrrBm5cADdMiIG05brIdEdoiEsw5uS/LfS5KfQBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PFkJhgpoYDsyehuyILf8X/GM1mR4yzhMcqlqp5XAjqX+nyf8YUxKGEC/w3Oh3akStRU3vUyPuSxiDCspDcWbNgxDY0QVHpvYhaYafjclBt4zQ0N5oYhv4TcKa7q/EwsYZ1RQQWAF4oKBlJy/kDaUkECFDRZeDy3DIuM2Q1+SWGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRNFmW1p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/j6XbOU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AG59M2118319
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 10:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LIadV7BRF9LYFllJ7Yhh2a
	+90a+1bxS3+rs4FMEgwds=; b=BRNFmW1pIXDzhhRsEW/L6PpmEuBklvK+bnLtYL
	u7wLidyxEqCt2WmaW4OwYBh7lo7EUNVH0uzi/6WhviZX2gE8K70CoHW33Xn2TS/k
	umby5dqekVuKmFzWCWpZ6P+sGr1jtncT5AaXceKSvxXZwnM/9pK/k7w0ALqIHhit
	9eQI0F/IYOqdUr0RzWFyDqS/9vOCod4GEQtronFlarpPw6JFrszPFVQyMG4sAnVH
	G5FvvkzC17rW8ZhbF4lATXGTyt7K+Oq1gOeZ3E+YivYf3GMAyQsKFerB6njzFQNE
	daWZ0cVMKBbZyxDT3KqveZaqzxxRAHLbPFAiH6TAKUJOtEnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2w6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:17:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-504888a2a1dso514924671cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772705835; x=1773310635; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LIadV7BRF9LYFllJ7Yhh2a+90a+1bxS3+rs4FMEgwds=;
        b=E/j6XbOUcrnzStzIaP0RGAPgr+0KKPfmLXEJDY+wkM1a7QZtWL2u4dcWEwVCqxzqvl
         YhtPETu3JNhQaiuAP9q3bYifluOBsYn0ZBNUTX0d7vGiww608Otx1HWIX24yK18bijfg
         Gqn7cjDmPZaUcq7A6gU0G6YkTcfI1nsgIp8QaT/7v6QSMqFzKZA9cH7wlurwxGR+C51x
         HtOpQ2Ec0T5KZiSzLGMaK7tqfazz0sk0mO+vRZsLOFmLTShEYbAwiM49kTjXcLi166WV
         JyrQjxwFBw9e2hwGnRvxanufvODnd+m3E9UGMADGoek4pK0TBdnaP0iPdyLweSsiuAMe
         dOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705835; x=1773310635;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIadV7BRF9LYFllJ7Yhh2a+90a+1bxS3+rs4FMEgwds=;
        b=hHmOh1CRiVkq5m6Zt5H8VSYUGmCkyb/sSgAb1Hd4JNTi1bXvTomXaG6bYjPKOa3Az8
         FoKGpbIV3a45EoeqENlyfnhhEnmf7JYjwgH4s+ckHZ7hjVUsNo9IjolTMdOvkbEsZea5
         Y5ZZeGU+dPqeK4pGNwh/3EiPDDLGlsG28Z5SAUyxgjcQPgYZvk0bgUgP+8LSgj2qy1AU
         P3IRD1ZEsOBBT5NYUIlMMyF0yhvq6HpuJtqqlWVZV9/1ev0r5w+E6dKg+cS8pfs7ei/T
         qq8VtnU/i1c3XskC8T16qOcZ440iWv+FThx9zTmtB0PrcGa67+c9Sd3pW4c7cSmVOQB7
         07Hw==
X-Gm-Message-State: AOJu0YwvQw8yTBtm+yKKtX2V9d4kXrkjycbkvzRJLitxSXZuLpruvKuf
	t0WME+P80mKJhj6FDXdhKrvQefBw0oT70ZyPPtsPtzb2DamMvoiFJ+0mUOhy26SJO4NFmIazmkX
	DLkPRGI1DHbZtvfuXBQpucnf3Qh1gMngiFaA2GbTE6IZmD6i40NWd5upISuAtI0xxKeIK
X-Gm-Gg: ATEYQzwQgdptM33lnvWg3VP2gnIzyhXOYY2jIhDjle/6AfJKboVvt2jp5A7ufnjZoFS
	lMyUQEJD05Jmu+5CaR279bBUAoS+4iZCM++B1f3whqGKF9YfIutJRONv9db5UKAmRC7BpiqdEBS
	CAnn3rljeJtAEb9F0Abn8rgX/RdSJvc/I0TDniOFKgOvhqgSkCpwpYekZPNT/yqZDItxnip7DJF
	DUJh71kKg56slnxWoKIB7ahOH+Ppvf+yseP9OdzrUsNtelFMTfmbPSD1Ab7OPkNSsVA70Euj9Bo
	vN2nAM7NEncv3S5bmV6LUiWG9NuHn+y9kMjy2yNMSpssR2zqzA73TRHdt5FnoqEZHqPhL37V5tJ
	EXJYIhqVcxjyDE6enf42F4Fm0xCO/nufucODapJoofb+VGHEEztFmc1jOZH1MAcPZNzx8UfCSqJ
	ZsdMq6m/8=
X-Received: by 2002:a05:622a:11d4:b0:501:4858:a6d0 with SMTP id d75a77b69052e-508db3dd455mr69791711cf.56.1772705835149;
        Thu, 05 Mar 2026 02:17:15 -0800 (PST)
X-Received: by 2002:a05:622a:11d4:b0:501:4858:a6d0 with SMTP id d75a77b69052e-508db3dd455mr69791511cf.56.1772705834741;
        Thu, 05 Mar 2026 02:17:14 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507451cda0asm194096731cf.24.2026.03.05.02.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:17:14 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v5 0/2] drm/msm/dpu: Correct the dpu catalog config
Date: Thu, 05 Mar 2026 18:17:05 +0800
Message-Id: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACFYqWkC/22OQY7CMAxFr1J5PUEkTdKWFfdAaOQkDkSiBOJSD
 UK9O6FsZ2P5fcnP/wVMJRHDrnlBoTlxytcK5qcBf8briUQKlUFtlZFSGTEG5l+PE17ySbQY+66
 PzkbvoJ7cCsX0t+oOxy8Xuj+qdfqG4JBJ+DyOado10XdOYqe89cF458LQD3VvFVrdW2pJU2sGH
 eDjOieecnmuTWe9yv4vNWshRYjWyOhQdVu1z8yb+wMvn7+bOuC4LMsbcn1zL/sAAAA=
X-Change-ID: 20251125-mdss_catalog-3af878fb6fcb
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705829; l=1896;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=pKtXrrBm5cADdMiIG05brIdEdoiEsw5uS/LfS5KfQBo=;
 b=sazVMnVsTwYrtjRD3pS/v0hpCNtiD/J4kvbX49FrOn/ZZ2x1cf9GtFFmOhawB89i9M7kz9BgQ
 x6xXQ/e/w1LASlxRG+e6x9BGUXPUWsSkDeEvU+rHi+ktsvn1tYlvfiD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a9582c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=lNr4chmq66KuSy7Lpp0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kdY16ogjqAhL9zjfi0LwKZ-nKFUkBd2A
X-Proofpoint-GUID: kdY16ogjqAhL9zjfi0LwKZ-nKFUkBd2A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MiBTYWx0ZWRfXyPXajPtXPXiA
 XRPKx20Fi5wgfEipvGj7kEj+403XKZfsVU7b0Uafdirbwa/Fp3m3s37iPBPDLNmuHissebzHQB/
 d6+yGNEQ9tmL9wUkhtOKUq2XvVAdU+u2Wm53P1vVJcSyTUwb5P1Tm5GePv/BUUrSzAreqViFiiD
 fmq+B89v5Q2YuNaAuTmpdCNNGq+92e4wVVKcgBZbTIj2kdpHLtt+3Rb8XhJ5Sb4M7bHb+Uf0KJh
 DE1gbotqbHD4MA8tfdT5le63IGfPV5wh0V6FjrYWPUwctG95FYshycqqCgs0tZVZWNhyGM1XnXn
 VHTWlj0S2aaa50q2VrbUqUkIOnEU4CncxQKpS/J73HqG+Ff4EeH5BJcPtb5zwAQoI1i14lKtCb6
 3WpbepRCscwl22yAGBTu8NWkWQfS0nsY47e3W/DXuuri6oLgEL6Un5lk4czKWMaPLsSyCygzvN4
 rUhnJs1y6nvTSepcpTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050082
X-Rspamd-Queue-Id: 176DD20F957
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95586-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Previously, the pair interfaces for MST had their type set to INTF_NONE,
since they were not used. We are now preparing to enable MST on the
platform, so the type needs to be set to the correct value (INTF_DP).

The second patch fixes an incorrect interrupt number on SA8775P, which
causes DPU errors.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
This patch was split out from the MST V3 patch series:
https://lore.kernel.org/all/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com/
---
Changes in v5:
- Rebase to latest linux-next and modify glymur catalog.
- Split out the patch that fixes the interrupt number.[Dmitry]
- Link to v4: https://lore.kernel.org/r/20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com

Changes in v4:
- Splite chagne out from the MST V3 series.
- Link to v3: https://lore.kernel.org/all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/

Changes in v3:
- Fix through the whole catalog
- Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com/

Changes in v2:
- Change the patch order in the series.
- Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com/

---
Abhinav Kumar (2):
      drm/msm/dpu: Update the intf_type of MST interfaces
      drm/msm/dpu: Correct the SA8775P intr_underrun/intr_underrun index

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 4 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20251125-mdss_catalog-3af878fb6fcb

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


