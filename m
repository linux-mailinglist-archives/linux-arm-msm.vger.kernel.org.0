Return-Path: <linux-arm-msm+bounces-117030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6DR5OIQYTGpBgQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:05:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5930D71598C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:05:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OB3SWaDO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XLN4C+Qj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117030-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117030-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11BBE301626D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E914A39C00B;
	Mon,  6 Jul 2026 21:05:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC532236E3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:05:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371904; cv=none; b=IGzKN9Zvv9Oavy8o+T8ZTDw298BRi280IluGDJZwVpH432OuE0J0bbyLmVahWOuFnncgAyYQgOMbDRB3y0J+hGA+MlmjEmy2FZF/Yci9RZun9d+JfcUu21M3A9gz+nJCAf6oUBdI5WIJi8qSioAsedZoMGDAZ9WJPmP6uCAdIMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371904; c=relaxed/simple;
	bh=Ahu8xNvk1lKmwpQNy6Y+IkeezPJfKbRhhPCuckBKhAU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t8C1ZdO5qx5GhHKems5c1R6ViV84exZ7Gvt3nzy3IHJ286RwgVHTdEkf8wjhB+OYZjPdquGSENBel6uhcolCbcLbocxkE+SDKFhEpUXWSfLc0OnexN+Q5ifNeC6efRgWk380fCWle59/l1ardflmEDZ4SBKi5FAQzfTgsT6o7Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OB3SWaDO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLN4C+Qj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE90B1654925
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ep/7FXUXye2OKnoYYBiKQZ
	+RJlOWy5+Z58OqDRKG4fc=; b=OB3SWaDO9LBTQVdXvsoTybQM5DNmjh+hVAKx8o
	W0n+t4T6jBlg2tfMKPOqsbbZZcqpYOv8bT1UBMrTSQmDh2iZNlbU54bjhEcC1onX
	en6ym0K/r/EIGD/AO5fpgD0UeSDd0bacInZ/6GDgSCmo2zLNNSqLeE+BHPKDerR8
	df26PIxCCq7XwJAMYg17imKo/3OAJicj3JKSUZIx5OQAL7zEba7/CVOG86tD8eSx
	4mCekkVsynit1B5J5JoFKOYazxFnUJwos+eto4Hz0677GvTVDv4TUy5qj+pvaSqY
	0kzcwd1D49akvH8tQ8Ymv96Oq3O5GX3ObgzcSmmAhb30kuog==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjxyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:05:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2547142a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371901; x=1783976701; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ep/7FXUXye2OKnoYYBiKQZ+RJlOWy5+Z58OqDRKG4fc=;
        b=XLN4C+QjU/OYQX8bHQrdhgDjxcN+YrsTVrZcEbnM2H1iLs/081YPHzzDIlgp7UWrB5
         a8+pmB5pH9qMP1kgOyxXnrkkyH4kTYvQaIm+VQEZRFDDx8gj2PSEFzx/AihlX6gHNiu2
         bDalR+x+wkWPkKZNyUGTxgr5GOS66YRs0r+AfWdp8vUoiZc2lQEBuwGJabnT2sZJCBRL
         VUTpie14P2xZYWMv6S8+YkwcKK55bS11piPfVmcQFM2ecI4+16ggeIYRF6UaB8Vg713P
         EJiVVUFO0PcxA1gybezc/epEb9J9j2HuMlRVTm26T+euJHneQJ8hRChVt02sx4QA8g1J
         wE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371901; x=1783976701;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ep/7FXUXye2OKnoYYBiKQZ+RJlOWy5+Z58OqDRKG4fc=;
        b=A8HSVFxgI1Gx7Y+AYhgVGBVZlr2l6kRGALpJQpcb5XrCazJ5U1siXnIDqaDEQ7lt8A
         UPxXmHpDwaqyfTlGT7JwdtLRBCmh7ftHYk2py7ulyWAHpIPX1CGQx2Urta3Q8J0L0Wz9
         5WkkpuRnSximo0L60Ol3hhR0dXOftem28UZqlGThIG5UH3U4BkOTyolkh8CEO2Xbh8Cb
         i99zZNedydVZnsmDQafk/GsqQjeBIj4yVLW/4ru5odKCRztt52LQ3D7d08mNILnZf5Pa
         T14SlkTpxiebVIPDGMfJ4SN4yvo1Z0KfGVPsMOKolGbhpUAlJJceTcGSK8+QcHkujqVj
         Jyng==
X-Forwarded-Encrypted: i=1; AHgh+RrfpOcZ3mRzbNJ1NqyACRXTQowipXcMQGM4FW76LTpVimEnI12/UsUftPVv7471NtcmJpXPs7QfRSaUiDh9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0pN7ZLrbICb9YoI494xDQbdg+rRVb4c37mPDrfm+z+1dygwAT
	gZeDj/x3MYR1CGvHsafT6Ody2cQGjHzOjqAGTuGPGYg4JbibpKRV2iygbSplph9qVVelVktyylv
	6JJNObsF37jJ1ZjDxUKQXR/wzM4y4CTyTI9Yxr27b3S1XyCqKcGIiRESCRPCrK+T1pB+t
X-Gm-Gg: AfdE7cmrRj0AMFvyyYzyyjshR2NrXJgKOnRttO7IYkKDTESwVScSnBGvJXlwFU3aBgW
	63rkdUURGP1quvouWtcDH5xEavaO4YNvL/36QQ6Sg8T09dw5oJXMbnkBiI7HfGCnGGJGKnzZ8Ll
	2op8OxGGV+osn53kz0z/Wy+CIp2BkFp7aPsq6zKDBJE1yGXtfZWD3OvauhbGkrjsFuh4HQ+w5F4
	q+RrdLWfMgwew2caMhBh8nJMiqJ8ftA9b+5w3K3xbqkNtWzRHXYxL4/lwDkUJnZqq9SGQr/I3bo
	4mSJ9HWGmCqWBHi7L1qdSOl+Ys8KrqorDHFnmx0NQb9vwMX2jKPFhM0Ie35PrMT9lAqduposGcs
	yYBEymUbYycquoIq3B/70S0StwXuja1Vpm2k=
X-Received: by 2002:a05:6a20:d494:b0:3bf:a11c:176e with SMTP id adf61e73a8af0-3c08efab30emr2850766637.57.1783371900906;
        Mon, 06 Jul 2026 14:05:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:d494:b0:3bf:a11c:176e with SMTP id adf61e73a8af0-3c08efab30emr2850727637.57.1783371900307;
        Mon, 06 Jul 2026 14:05:00 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:04:59 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v5 0/7] drm/msm: Add support for Shikra GPU (A704)
Date: Tue, 07 Jul 2026 02:34:32 +0530
Message-Id: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGUYTGoC/6XUbWvbMBAH8K8S/HoOd6cnK4yx7zFKkKVTI1I7q
 eWEjpLvPjkPbbOlkG1vBDL2j7v/SX6tMg+Jc7WYvVYD71NOm75s1JdZ5Veuf+Q6hbKvCEiDBlv
 nVVoPrn7c7molBbWBXYRoqvLBduCYXo7Yj4eyX6U8boafR3uP09ObzB5rqG0AButdi6i+b3KeP
 +/ck9903bws1aTt6YOA6kqgIlCkgEIaL2L7iSA+CNRcCWKqoaXGiRa1YfxEkO+CAXklyEkAH9E
 pYiXsDeFwCmng510JejwlVbUucz29lMbFrOeXsT77NIXacc7uOIbF7Os5vvfSva+HbVdW/7TO9
 V5NNUjPsWRJzOKPGr7dJhXpM7lM3i/XftPH9DhNBmuvGhtaCkDC3/a2bvSro8YNsDNWQmsbNFJ
 az57QRafZspSCAQxqHW9XIQVcGksdd3Wb+pD6SxnaGk3CRgvx7rYAL2D2v3lWBBNdxNY08h+80
 efhGgSPQge0Qou7Qf3eMQfnT1eBGtMKEoIkurshfKssjKdzgCA4kHaNInsvYwBRK1A4l0hEypa
 +1kPKq97N17vBlUmnv7LISDWXZbII+j8sDeJyPnmb8/JJnG6s8MTQGqvZNPfXRR+i6vCUVrSIz
 lsyBP5+SbxJKW/LLSw/grIeQV+OQ0M6yKBuTfHhcPgFEoR3UHwFAAA=
X-Change-ID: 20260609-shikra-gpu-5432bdeaf0f7
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=6748;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Ahu8xNvk1lKmwpQNy6Y+IkeezPJfKbRhhPCuckBKhAU=;
 b=WpydgwWDk+cqu4ba6ffFGiuXyxIISbpArIe/urfxSv46q2Sgous3Dv2YEqyjhe/SD2+d61v+V
 1T1uNMT7AUACSxeAtPQfeLve+4HP+mClMJ/qfZB6QA2DhKyoCoxen8v
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c187e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-nh9RajweDyCoOXDqwUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: JywACHgeiM_ADsx8bSgdys5INrfTyRu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfXy6U0iI0BsGsS
 bmrGssbdS0cBcALVV7J0tfUTZymS24JbE0E/3qsyc0xo3sf36OUcPQCseRMK6ouXGrytzcl6dmW
 mg5BmeJdcD4bl17U+bMOWyk8AutYMq+CB+5l7IsPIz1RT9MklOvZqNfSE7rcCt4uaU9N5k4udyr
 +PSMfSAi1cG+hSkFacM0XCx9wTrnvs1aDfz3OvTPUCsW3DFy41lae3QTcVbcOStZ9nS9riX7+cZ
 ZEcqBFKs5FB5au2bsGidCm/yRuQVB2RZY5pW1M6h0fAP1kXBkST9KYG2X5hVZCCWSuMxuFRcErt
 Jv0OwUk8llsebN+hRb666f3SXAlQFjpLUZcFWnyPCpqV/HCxOcSqgbcdscMcq2RP4e4fIHIsw1C
 CwzVaFqTdCi8miefwKHZkNnbZgCmrDB3bRTPORgi8N5oPtZl6mWXde6ONsP9ChqKp/jJFTYaNdr
 K9NiIj6pxIEjGVjcQew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX2VCtaLqNIfVu
 OuctOFYB/BpfzBo3E/iRy/QD1F7NzAcGLEPYdbOgvfT4djXx7xFNCPvIQWHj4SKVc2mfeQ1To6j
 +3kX04ldKCmlNidPSvkcVlQ36AZZ2Wg=
X-Proofpoint-GUID: JywACHgeiM_ADsx8bSgdys5INrfTyRu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060213
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117030-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:aastha.pandey@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 5930D71598C

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very 
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Mesa side support is already merged:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41762

Included the DT bits in the v3 revision.

-Akhil.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v5:
- Drop dts patches and enable GPU DT nodes in shikra-evk.dtsi instead (Konrad)
- Update commit text of GPU cooling patch (Dmitry)
- Link to v4: https://lore.kernel.org/r/20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com

Changes in v4:
- Rebased on top of next-20260702
- Included additional DT patch for gpu cooling
- Link to v3: https://lore.kernel.org/r/20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com

Changes in v3:
- Rebase on top of next-20260626
- Included GPU related DT patches
- Link to v2: https://lore.kernel.org/r/20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com

Changes in v2:
- Add a new patch to document the GPU SMMU bindings
- Capture trailers
- Link to v1: https://lore.kernel.org/r/20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com

---
Aastha Pandey (1):
      arm64: dts: qcom: shikra: Add GPU cooling

Aditya Sherawat (4):
      drm/msm/adreno: Add support for A704 GPU
      dt-bindings: display/msm/gpu: Add support for A704 GPU
      arm64: dts: qcom: shikra: Add A704 GPU support
      arm64: dts: qcom: shikra-evk: Enable A704 GPU

Bibek Kumar Patro (2):
      dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC
      arm64: dts: qcom: shikra: Add Adreno SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   2 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |   8 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 143 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   2 +-
 5 files changed, 154 insertions(+), 2 deletions(-)
---
base-commit: a9498e40e3e314ade387d3ab0d5cb14f0f3aa1ad
change-id: 20260609-shikra-gpu-5432bdeaf0f7
prerequisite-message-id: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-message-id: <20260526-shikra_icc_kconfig-v1-1-c589db2d023c@oss.qualcomm.com>
prerequisite-patch-id: 028f3a3c64f57a611b6ddcfee947c56aa6251e3b
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-message-id: <20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com>
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-message-id: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-message-id: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2
prerequisite-message-id: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
prerequisite-patch-id: fb821179cbe1fb1a97b987d04acb5a656aee9c14
prerequisite-patch-id: 1981818fdff444d3bfbe15f5f52a654a73b91c81
prerequisite-message-id: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: e9f8fc7688e5b366cfbd2449856c0aa524424051
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-message-id: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
prerequisite-patch-id: 0cbcb69abbbf83da785619c266c96af624c38a87
prerequisite-patch-id: 1d1ae48f09e537312052f93bff8d04093addc996
prerequisite-patch-id: 6126fcda921fe53b86b3a18c649fd8ff2e1f43d8
prerequisite-patch-id: 3a0482207e363349423f81ee7589328a84752de3
prerequisite-message-id: <20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com>
prerequisite-patch-id: b4d2580ed983cd0262302ad93304dbe5398e5d6f
prerequisite-message-id: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
prerequisite-message-id: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
prerequisite-patch-id: 968bffc36646412f8289b917f37e762a4297bcc8
prerequisite-patch-id: 35944403bd4480caad12657342da15ea71c6afbd
prerequisite-message-id: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
prerequisite-patch-id: 23b24fb512c882a045ed8339b22269bfc2c5d02c
prerequisite-patch-id: 0e79e46bc5a88849a2f0a410b39c08f3244dfed3
prerequisite-patch-id: 17b412a37859fba801efdbe451db31e5bd77438b
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: 1b990e46422307e558300815c1166b90d96fbb9d
prerequisite-patch-id: d78e0b95758b82977d80c7cf18da49661cd181e5
prerequisite-patch-id: f62b00cd64ac3191e0906514443dd43e88746818
prerequisite-patch-id: 0fab99455f954a917fb65348656505cd7ab45bc2
prerequisite-patch-id: b59fd05f9b62bda86079c9d86538b80289110862
prerequisite-patch-id: 71691d8b40e36cdbff6a52c3999ea8bb2c164d70
prerequisite-patch-id: b2868bc50d74afd13c8a0d0fd62301fa9546a211
prerequisite-patch-id: f83f24719ac475317507af09bf08b4a69b02d429
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: 3338cdc5915c1e6b991067d3a7afb734c182663e
prerequisite-patch-id: 59cf68a3a49958a60833aa0464980f8c8d879961
prerequisite-patch-id: 5d146a518f2f76bf9fe93e23a2cfa63c73731883

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


