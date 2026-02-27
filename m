Return-Path: <linux-arm-msm+bounces-94506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJCuKUfkoWmUwwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:36:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB91BC0AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5833830071CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0CA2C15BE;
	Fri, 27 Feb 2026 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpkKw+Pj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HM6/2L2G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B7338F920
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217413; cv=none; b=JWJ4b5ibJDTjYTU388bEdJGF/mWINXqJ5nUgso1DqPeZzbNG9LYMfjJNjs9/y8FrBgAXRXBnTIPqqN97uHpgnANyZUiAFDIDNXv2Qwz3Z/aAEHPJmtGBx+/nQcZ9VFi+VzWi7Wz7OE6vhMb9m94gUvOM9XW0UoYOCuQwyE7ZcnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217413; c=relaxed/simple;
	bh=JAVhVbhVQlCqwSiAyvYiIJKF2fu3vIOqz6xoppA5iS4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DFsz4QVaD20lhFd7JBaYfNSD1Cz/e7ooLG/YLcPisGwAmEZOo5229pQmov0FlnM6cDeHcjh7MHjywsftcQZS727iMMe1/KBNB/wT/QbLgM8emeR9jwC7FI4R6fUTnilCUhfK83yd1P3g6Rs8+S3oS5nzKGJfoKagBh/0m/OlDP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpkKw+Pj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HM6/2L2G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0Hvf2167395
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CB9jX71PpJqF+vh9iq9cLa
	VFVWZdgK9XYLhA7xMJoBE=; b=HpkKw+PjW+36Epukk0N6Wiv7Dt/Q5BhBzCgRY0
	vv3Y9dpIAjYLUceimbRlZmmegPUOie6I9saVZZz1mIoUz3cQ9EJ9y88fNAFI2dJq
	EOBrcpH5LaidTYxQNeOetylS8UOkRwR0J3iq3JbmXLNMe30uHj/97nPEEyIlPjfK
	G/1XEOjs+q+Fh9FXVjzi2YhUfC+iZP41mQR6QLFlvZBwO7arpHGuTM+rkPrdnJgq
	03ntD+aq8N2GyNAOg6268/bVFLQi6K3v5/D3rh/Z7CPq/Qx5I+4ON9JVGcxqRf9D
	Y5DG6Iz2pdyX87LIxH31XhkfUOUuyWRowI/BFo/oUOTs74Qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xusxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c882774f0dso1833792585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772217411; x=1772822211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CB9jX71PpJqF+vh9iq9cLaVFVWZdgK9XYLhA7xMJoBE=;
        b=HM6/2L2GxBfMR03IK0XSjMGfU/Vr1n/pM1Of6T2nDZRiHlB/F08SqDzrbktQxBe8di
         0i7vc4DZ2rgTAMc9t/gGiU9C9GTHMh1lEUsY08yEnACLalpZfS/cyBubKLACLNZyQOnA
         kf420keAqratyEWhQ87ALWkzXHvZiDCFdlYoU1XSuPmQgzsDd7afQbkfAUvMFYc8AsmI
         xcvBNoJjVCzzs6510Zm9extO4Lf0u7Eeaph/d4sW3DRlmPA3QsJ7Wqtn9cu4AobUUG32
         5C4pu2dQeQFPSPghMI6yRs7dy0sfuWfdHy5Blg+XofyJVxaapGY86+OvfsSlkWEJhDOy
         e3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772217411; x=1772822211;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CB9jX71PpJqF+vh9iq9cLaVFVWZdgK9XYLhA7xMJoBE=;
        b=P8b2pDpXyWxVpclERjWeifleGwFAxd+dvfO0VaprdRt7/4BQsGeOc9r/sBSwNc33jX
         pCSH2IplV6YmzuWHjFdWdRKDyV1FstXDQvAG5K9LnIKyBCtFj9b803w/GKAmhF7CtvBj
         KR/FLHYkowCoPQFOgi8EjDJdJlnuRqmHD6vA87nLiYTtybk3QQYPsuzpUDJJvlao7xOF
         4bzTnJcAXHMq4+VtQcJkMnADFDy0U1KR76yK6FlCn7HRnc8XVa9qvFPT+3YcYgArX3xS
         3J8IT/mrmzaCfB6WYbGjateHdGj2mRUoaXMUf6P7IBvT3/RooHp5/CAh7CLv5yEUQvA1
         0G/Q==
X-Gm-Message-State: AOJu0Yy+fdzCE938J+7sNEYHFk7CH+vullvobsmIap9IRypSxeebXwCJ
	PAs2T5lRUZk3nJoJJ8Ywxm7Ar2Mvv9+Caxp92XdkDKHxVs+HSk1bXgzrsSqGzLCNQNTJmfT6ZAH
	PnhbhsanRjkdUIb1tEeJ45t5u7sMvYho4i+/O1iQTWqqnldB4S3WLqYjbV+nuGYTp736X
X-Gm-Gg: ATEYQzwcItHpYkCCSZx9UAn+Jxr5utvuSVFDRpdrbrw22YiusIhWRQGU9yYEGQ/xghx
	hNbJmdMTR2qWm8pMepQuyLIw3/VeDWH1bNlo9WGSm2pjRI2/XWE42zVdIBXMSZEucoXjbY1j6VI
	i0ilIFxUnn8l/6ggRpFDF4J7Vj/uQ+gNYQ7qlqtFrVWJ1RlskDGX926rraoIYcsJqgVZhdWFAuE
	W0VY82TPNR8U5o3mCIX0Yqi1y0G6JY+/uzXzpE8V2z1M8ioiVXlVZ5TjWwYTYLIm6Hb7hV1MkRl
	J5NKS93gKZRXDBJ5mFYeceMCHm8/pK5VYmVDJzhRUsFVw2IH67lnPUskdvlrASq7xVm6Qh8T2kD
	tsUdmJzy/F4/gMU1NHA9FZ4JB2RgyOnInEQOb99QebC6BhDEsWO6Gj6ugkHh47SBxPlTAlvCGLn
	iBKRf63IMrjjHd7LxFSVq5uKWIQu2b8EeWlnM=
X-Received: by 2002:a05:620a:44cd:b0:8cb:62c3:3690 with SMTP id af79cd13be357-8cbc8d734cemr502724485a.13.1772217410663;
        Fri, 27 Feb 2026 10:36:50 -0800 (PST)
X-Received: by 2002:a05:620a:44cd:b0:8cb:62c3:3690 with SMTP id af79cd13be357-8cbc8d734cemr502717385a.13.1772217408861;
        Fri, 27 Feb 2026 10:36:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:36:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Date: Fri, 27 Feb 2026 20:36:39 +0200
Message-Id: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfkoWkC/x3MQQqAIBBA0avErBtQCaOuEi0yx5qNyhgRSHdPW
 r7F/xUKCVOBuasgdHPhFBt038F+bvEgZN8MRhmrjJ7QS8p4Ow4Y5cLdjX7Tkwo2DNCaLBT4+X/
 L+r4fpX0iB18AAAA=
X-Change-ID: 20260219-drop-vbif-nrt-cb7da190f6f4
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4303;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JAVhVbhVQlCqwSiAyvYiIJKF2fu3vIOqz6xoppA5iS4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ9WxlAWyJ4gaCXA2VS3F8Y+w2k7S0pIPJHU
 r6Y5z2vJdeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPQAKCRCLPIo+Aiko
 1V0NB/9pGOLAft/TuUuE6MJPAQxftVZcFlhBWnUO02aTDnmgyq3uamXF05INx8RLzFFRl1WPLt2
 d5QN74IzmPipD/9BEUh7OUEYhWZtS9YweyXp86HVSNW6alH1x+nuuuyUX55EIhmZo8ivOlA9uq7
 fgPB+6n1V5G+50v5cY6jIMYGGl4wfHIgJk262jO8PFUCn/mUHCD0rSEQ5GcQD+EpnXYwlbX09LO
 CaEGEEu/X70x5Z2lBIiotB6LxTVJDzYSaJEa21xt3TcBndPjFHsdpcbWjdlmF3bikW4fpsJL4Ob
 TiQHvYzyyL3cVinclKppEAJmtPQfAqbfOxbc75fzPZvpp79j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: guvLLQBiRJFa8jVLKjE8QatikVM6cfHJ
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a1e443 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=T-p-S-tFZ4_u2FNYb-YA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfX4w2J3C0COPFa
 KE6FJrO4HwClySvENZRrxe0TM1tasc7xiHd+al8RTUVO8qIuOlqQTiOZPrdJiwn7COCSvRADsXF
 lD/TTLjbH2CMZJ8uop+t0bligAgmxtbMU04EGzwBVTtNBXdIcAm4SQKGybciRWwCpqXpvQ+UApA
 bMprwkCKfi/idlcwSwguBCOG3ero3fQHgHbDDz8SIPepq6bOFLeVbNxTK/MlDh55kKhbCLgo4+v
 jEConuCAXO+JbNkCEmyHgreZeU2c+FXeJrheEBHheXvvU9i8JstTmjuYL1DNlzfY0CPh3WQ5gQa
 fgcy712bIJVqwnU+DhxCH+XFUmv4FldyQQoodTD66CjdTGyX4Yk+RRox+M6d0SFHyCUIYorEm8y
 NcMgugmioNkXYdWgxcNpmcC7VRJJLQvuHOMhbRCc4l4qZhonLi7L6OhL+nhV+54NzY8OmFxReFE
 5nHl2PMNryeV2n3hoGA==
X-Proofpoint-GUID: guvLLQBiRJFa8jVLKjE8QatikVM6cfHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94506-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35BB91BC0AF
X-Rspamd-Action: no action

Once Konrad asked, what is the use for VBIF_NRT. Answering to his
question revealed that it's not actually used by the DPU driver.

There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
VBIF_NRT being used only for the offscreen rotator, a separate block
performing writeback operation with the optional 90 degree rotation.
This block will require a separate isntance of the DPU driver, and it is
not supported at this point.

The only exception to that rule is MSM8996, where VBIF_NRT has also been
used for outputting all writeback data. The DPU driver don't support WB
on that platform and most likely will not in the close feature.

The missing features don't match the extra complexity required to
support two VBIF interfaces, so drop the second one and all the options
to support it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/msm/dpu: drop VBIF_NRT handling
      drm/msm/dpu: stop declaring VBIFs as an array in catalog
      drm/msm/dpu: replace VBIF-related array with bare pointers
      drm/msm/dpu: drop VBIF id, base and name from the catalog
      drm/msm/dpu: drop vbif_idx from WB configuration
      drm/msm/dpu: drop VBIF index from the VBIF params
      drm/msm/dpu: drop VBIF index from the struct dpu_hw_vbif

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  70 +++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  19 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 163 ++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |   4 -
 44 files changed, 144 insertions(+), 296 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260219-drop-vbif-nrt-cb7da190f6f4

Best regards,
-- 
With best wishes
Dmitry


