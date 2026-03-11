Return-Path: <linux-arm-msm+bounces-97089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HQcBav2sWl7HQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:11:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B8226B3D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02112307E5A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C293A0EA6;
	Wed, 11 Mar 2026 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1YXDdrE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVdgTfym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3F339FCB4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270650; cv=none; b=pS6xIC8gRcb3Zl1u8ucWSGhLk7H/Iq78Anc0UM+gYdqgGZOChQ86T8OQdCoRgSAiKagqug3PEEPz30O9aDFYgoFNjcTKco0kO/RFC4+/6wpT58cW4hNbwOAWLHN5Q3i6VG8vASHDJ/Z0Z0VuaKDtGwZRTWAbbWgyA5PRw3E6mkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270650; c=relaxed/simple;
	bh=+rIZqkmT2LXwCveneIi/pNtz1LZGgQpxbuztVSzuDnU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rtTCGX3OjZDwyOrpNSe+8+FFcQeqpmBjz8N8vEWw+eWkN31KyNfem3h5I1t0NrV02OkK0Po73MF7U1UBiXTK9tuQP3qduwehWidfRqGm5wjhobEn8LW+GJqfJjFzPkVHXA9mRNCebAJwvfVRh3mJp3bj0djbCrPOnjg9HRRY2+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1YXDdrE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVdgTfym; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMNlnl4027638
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ntJOwzxTRKyp07lQZdTsli
	Wn9kvDl7CAp2MYSh6e0JI=; b=Q1YXDdrE/gQTMvHO05wreJTy0y91DkDZfJj7Jg
	/32XimgU4afPBdD7jmXLlPgnx0eyqYHGJg6xrap7ByBaFXGQpM8SgRs+10qXos6X
	V0iHzJtI6HhpgO54tLBWY4BiBfZuQ9upsKiu9pF6EKqFRv46jGgO3YmnL32Bb9JQ
	X0BalX/DXCKdINJ8RUDpSWeUgak4hJ1M/RaTGFOlzqiSR69c89EeaIUddaRzTR0m
	MILW+C9jRZCnzFNpRahJGW81l6SytXeYdcpkfPrCU1WKAWkf1sk3IHhYOA3am8OS
	y3AyvooctpyN2QkQyrjBhNiYUBFgUvKMitiB0O70RXuHy4Nw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54r3cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:10:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b6b22dabso154809b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773270647; x=1773875447; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntJOwzxTRKyp07lQZdTsliWn9kvDl7CAp2MYSh6e0JI=;
        b=cVdgTfymlvZ9gdYaNBotzMdzxUfB8ZmsAYaQgOPiVp2d6n/N6R0NXK0k70WQOgORJr
         Y1VhBKiR2gliEyfXf8ZniWsVPizZ5t357AgsdAdWtLFEtDwPAVnJRoxEAyuknvxUjaFX
         4j2nxDKVWDaQ1gR00NvujOXW3MIqNtl3Qus7fJPj+l4cXvyl7O5FbHTQ0zKdXxfym2I9
         JBXFYcOFil+0xd9XsTR7ZuSr+545v3ysJxhY2snTw/aUN/5sB14+GwK0jpB7UULT7lam
         pSLfLGctKoVNSGzugVUmkB1R/hUn3IVyFQXtlF63453d1fjTz2u3Q/OWDh6k7mwBVFSI
         lM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270647; x=1773875447;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntJOwzxTRKyp07lQZdTsliWn9kvDl7CAp2MYSh6e0JI=;
        b=UC73Yhwpp27tbT8ZS9AwpJL4mmlJrj+6Q2h9B2kZBtKOUGYSIPff5TvsKD0TMd3V8f
         Bq4nZlapCGEwLPqknz+wrSDUN8hOoKQxXACzZeVCtrdyuTQk7fNBxLGkRDfejXHOevRO
         Ia4c7eHL8xFoWSyFiCBiLfk0k2PHGtQ+WM8skAKsTz4mFfA6CJ8Rq3d+Fn8XZCLild2T
         bnh4WTUMC5DrcIzTX50cZUILtzeVeYHP03dLw1phdXn8niKQTHmaMrMCB61i+3T2BGQe
         wt5nYvGRi0bEfgNs0QBx9ieEh892vlV+bROt/t859t5Gq9OKVkeUJSbKO4Oe3QYOgLwn
         q8Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXnSrhaEVwkuMor4nDdPC6/3MdNh0XEnXNQ706NvzZfiksIAKI0+kSPhvh82UMA0M/+6qVxxnR/X7B0KPHf@vger.kernel.org
X-Gm-Message-State: AOJu0YxQPMSNLbByTQp7CuCHK0Rm+muYUvuJInVNuKYB4Wr90poo4vct
	+gRbnl9YAAV+/L+xGRfWich51VocwCbtDzdb7eOl7E881Aul2pbaPwzavNqjkZSR4UjvLnSF9ov
	SS80X4D8+g+W5eb7w5wi1uXbWuPOYQ53hCVq9TNb7PdORSO7e6wtvQJrO7s6DRJySJtO9
X-Gm-Gg: ATEYQzwDfyEPtP2Bv5zraUIw68Ofx1eTGIB9uhw85oKkaaT2owqVGoWtpNkJ7dEmmwI
	SEPsmvUrYLlR6X381OJoK5XsaQFovfEvG2gYVtrGJ8uPr26/tPhg6s1sfi8cSPzU5P8h5hzaZH3
	ZYQJK8G21kYxFHzrYTgGwHM+ojxH64lpwtEwaR4VN3NVKdaNiLDR7D0uFBbZvh5Aas4A2+ZrZ9T
	SrojEmj8hflKd8i1wRFOCqWZbiwaWz1qcFmENfAogp4Y+fQnBJjhFZF0PJ9/DfPD3+3XqokPbbS
	1yx0uXg/IYEVledbI03KzwhAWraPklP7yrsCN3UnUQKyKwJZ0RN4dYwNDM72MTF/WivW+fqKZM0
	AH0INq8AyHoY6AmwzH83EPH5AjlZbXU9HUELC4JsQwvv1JQ==
X-Received: by 2002:a05:6a00:4ac7:b0:81a:7d1e:8132 with SMTP id d2e1a72fcca58-829f6f21403mr3907204b3a.21.1773270647193;
        Wed, 11 Mar 2026 16:10:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:4ac7:b0:81a:7d1e:8132 with SMTP id d2e1a72fcca58-829f6f21403mr3907161b3a.21.1773270646641;
        Wed, 11 Mar 2026 16:10:46 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725facbsm774569b3a.20.2026.03.11.16.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:10:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v8 0/4] Support for Adreno 612 GPU - Respin
Date: Thu, 12 Mar 2026 04:39:52 +0530
Message-Id: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAED2sWkC/3XR327CIBQG8FcxXA8HBzilXvkeyy74O0mmtVCbL
 cZ3H9YtmrreAB/J+fElnEkJOYVCNqszyWFMJXWHGvTLiridOXwEmnzNBBgozriivStYt3JMBwo
 0eKks88G2rSZ15phDTF+T9/Z+yzn0p8oOt0tiTQnUdft9Gjarvh6oH15N3qOkscu0WXNyHdylM
 nT5e+o18mnyt0IzqzByyiizxkgZNWuZ2nalrPuT+by+sq7LBI5wRzh7QqAiBnzjZLQRAy4g4gE
 BmCOiIm2UXjrdRMX9AiLvCDA5R2RFojKMOWURRVxA1AMCOEdURYSSXqNE5pxdQPABEXyOYEW80
 U393ohaiwWk+UOQcXhCmoookLy1gCK08A9yuVx+AJIGWVGIAgAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773270637; l=4462;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+rIZqkmT2LXwCveneIi/pNtz1LZGgQpxbuztVSzuDnU=;
 b=9YJeFmI6Bo9N5MyyIrk0KEKTkZJ0pphdZ8RU3R2BgBr1njSzwq807iHqVLDQKl+p5gD2OyeAf
 i/KA5M/TBMFDr82XeGE3gs1kyu7wOS7p7Nk5efP44+e/3ddqbgRw5Ye
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: BvpuPbe3wvu9YB0yjNNlU9KigHgnfD6x
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b1f678 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=59olv_ZbtoQn0EF98qAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BvpuPbe3wvu9YB0yjNNlU9KigHgnfD6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE5NyBTYWx0ZWRfX9Ipm+Z4NoRIY
 sKmFF861cViiEWSWIq4zOFfIaR0yv++1SATHL4K19KHX710eMx50IZ7JnUqpE+BEeV7/IHeZDwc
 M3+9Q6g0vegWpj435kH4XoTcaJ7gmEH/HzzUcS90x1BrnGRJa/BvuJE1bp8yqUGsLioBW+Z2bYj
 VxrAhx6LazD2BcbgqIivIQk2A5sfiDIx7XEWPJMCiTdoIFDVLhWtdff47tG6YGU7gbQyuKlR2GW
 7mN9iVCjyfYKqbxhSPTnpZn1JA1jEqBSAMpD3AJvNdsSDVSWcJzyfm0+MyI4wueJY4JF93og7x2
 hoIAP09xMcXNjm55T0rU1qz8NxQ9I2euPcdJiupTv9Y95L3Wnf2xIVKMKfCLP9lH8l3wFpQF9bC
 gyhFAqIQDJlWnsCuAH/KdOjiiG8b3nHaXGH8sQDpGldeTqAjOrR9vxwcFUqglVPMdYw/Wb6O/LB
 eEvnvA8dZb4aqaF0Row==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603110197
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97089-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95B8226B3D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a respin of an old series [1] that aimed to add support for
Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
have consolidated the previously separate series for DT and driver
support, along with some significant rework.

Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
down version of A615 GPU. A612 has a new IP called Reduced Graphics
Management Unit or RGMU, a small state machine which helps to toggle
GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
full-fledged GMU, the RGMU does not support features such as clock
control, resource voting via RPMh, HFI etc. Therefore, we require linux
clock driver support similar to gmu-wrapper implementations to control
gpu core clock and GX GDSC.

In this series, the description of RGMU hardware in devicetree is more
complete than in previous version. However, the RGMU core is not
initialized from the driver as there is currently no need for it. We do
perform a dummy load of RGMU firmware (now available in linux-firmware)
to ensure that enabling RGMU core in the future won't break backward
compatibility for users.

Bjorn, I have rebased the pending DT patches on top of arm64-for-7.1
branch to make it convenient for you to pick them.

[1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
    Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v8:
- Rebased on top of arm64-for-7.1
- Link to v7: https://lore.kernel.org/r/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com

Changes in v7:
- Drop msm driver and dt binding doc patches as they got picked up by Rob Clark
- Update interrupt property to use 4 cells
- Rebase on top of arm64-for-6.20 branch in Bjorn's tree
- Capture trailers
- Link to v6: https://lore.kernel.org/r/20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com

Changes in v6:
- Move the rgmu register range update from patch#8 to patch#6.
- Capture trailers
- Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com

Changes in v5:
- Rebase on v6.19-rc2
- Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com

Changes in v4:
- Rebased on top of next-20251204 tag
- Added a new patch to simplify gpu dt schema (Krzysztof)
- Added a new patch for GPU cooling support (Gaurav)
- Updated the gpu/gmu register range in DT to be more accurate
- Remove 290Mhz corner for GPU as that is not present in downstream
- Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com

Changes in v3:
- Rebased on top of next-20251121 tag
- Drop a612 driver support patch as it got picked up
- Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
- Remove reg-names property for rgmu node (Krzysztof)
- Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
- Describe cx_mem and cx_dgc register ranges (Krzysztof)
- A new patch to retrieve gmu core reg resource by id
- Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com

Changes in v2:
- Rebased on next-20251105
- Fix hwcg configuration (Dan)
- Reuse a few gmu-wrapper routines (Konrad)
- Split out rgmu dt schema (Krzysztof/Dmitry)
- Fixes for GPU dt binding doc (Krzysztof)
- Removed VDD_CX from rgmu dt node. Will post a separate series to
address the gpucc changes (Konrad)
- Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
- Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com

---
Gaurav Kohli (1):
      arm64: dts: qcom: talos: Add GPU cooling

Jie Zhang (2):
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 149 +++++++++++++++++++++++++++++++
 2 files changed, 157 insertions(+)
---
base-commit: bb4d28e377cf04fbee8a01322059fa14808cdfe9
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


