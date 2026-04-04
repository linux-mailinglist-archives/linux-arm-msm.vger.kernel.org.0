Return-Path: <linux-arm-msm+bounces-101802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIrrEbp80WkjKQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:03:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EC39C785
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70346300CE51
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C216345CAB;
	Sat,  4 Apr 2026 21:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nok5AUPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krko3hBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF2C33E345
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336631; cv=none; b=UQvDY2rDBZiL8LCLFdzq95EuZYuvPuSqQSj6wGnD+R2tr8uDIghICy/z17sh4+aCiOwLwaOsmqdCultHeAs2Y3EvVQs6vBY7ZEmKHWpNCf9Exha8xMGw5zmJv1Hv9/8X4Net/3t//o9j7129oHkSueANPA3s6X3P7Sim+CGtv6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336631; c=relaxed/simple;
	bh=+J4aWf5YojiTxQdOvfgMJtW8OPo2YRqorfMBEiErPAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pKfJ+x77Fcv90z0rWfTHzfVxpuZylscL6BqEEV29oc3fXcwMNQPZCMFuJZN06wq8ikRFZw/wDC5MzSCpfd6cA08i5PrtBKDwiJiBqkRbbUJ5pF2GOBFH1Vyryt5VXm8KsfuWi9QLUA9zuH1NfrCqUq22Bmg14H0UAAnRRCPkQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nok5AUPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krko3hBC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342qqcD2199939
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O8qW0bRHK9VtZRzpUZbVBD
	nyfCKTCiQkwr+gwij95pU=; b=Nok5AUPzJ1p62JfHrbx3zWpzWZL0PlFvlHijbQ
	EV+ex01GKdiQgce+h22lj4A0ZUov9KeBI/g89wW+U8QmrjgMdjiF2XcSQ9xj18gp
	yAPZKHKSDnuasfZWuvUvNGPDzZMT6C6+PMX0o2CIu3g3QuxCTA7tLZjQmNMdrl9B
	cJpt5hbTytmegE4Ay/h48N4xFiQhncGgt7E7JflKo0o1Qpl71VQddoMpLYs0Ctka
	AFZtLO5g9azAa5qOcXxaQZirMEXb5IpGE8RKiwLWRIGOAL9czXP/X7sr878XGktQ
	NWV0wKizz4qWQZCxNXItfXHUNvm3xW2a+wDKgTd0tRAF66dw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u9j16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:03:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c1107da15so2794523a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336625; x=1775941425; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8qW0bRHK9VtZRzpUZbVBDnyfCKTCiQkwr+gwij95pU=;
        b=krko3hBCn28muPTrkltIqKgrXZ1U0ggkNUR0iY9ojHobPfZQfamnpoR+EnICyBweaj
         DL0fp9JNO/+R/ZT0d93kcT7+ABxJfB1SvKKRtJALTgRMOMt69rZzQc7amBqZ5ojL9mja
         f65FACv4d5G5CPBNKzul+wS9m+oBWqgm6DnFbrbKSQNbI1kVYqi5GfrsigMBkmjXaHqR
         RsDaomahbyZj/amBUEgCNiEh3bKsEl6FtmaRyvIjUk1MWw3jSRpDWHh5XzOMVM0rOvrM
         tujB2uYZPS/lsUpTd8Gd7DF4b+Z8dNzAJTNTagahUsjo5dN8ITrbmm0OmBLNUJtx524+
         EfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336625; x=1775941425;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8qW0bRHK9VtZRzpUZbVBDnyfCKTCiQkwr+gwij95pU=;
        b=Sof7hsgak1o+LYJwiHyhJfQuAmKwxnwJNYsnoLTmYmsZWqXw1tak+FqknagJM2wNxw
         uDv/7hOg4AYWELLA1MzIPuWt+RqWSOi2T5G1DhjXFWOC0qZCoD+SbdTCOebv+aGgP2qk
         kmjfgLapxM0s3NYrnkVt/UJBzw+WR8TEJt9tMpOg5PnidnHFnt4iLlfTeTXR3kGxaqjy
         Ddh1RdKMymsCUpv0pGfT2PxjiUVnSCMe/tIbJLSz742JwNIC7RK9stYNgJIzEA+ReoSv
         90ij/xrIMp/UJNOYbmDzQVf+9JgMNCquXIgWRXlTfdTrmHP7V+DYRGJE74rIPNZZnHW9
         jK8g==
X-Gm-Message-State: AOJu0Yyiv1sCQa8mG5m3zAlvtP+5KiGgMkQjc6ytshNZy3B7TQFt8E/y
	RMS4yTk0WQiRnF4RxBZ2nsCJ6cR8CexQhaxT7bvGJ69YVnzWQKw51HITxjYk0NTiOOhRfrHlYTM
	q78lWkSm44KQ1Bi6eH33ze4sVEpVQh/t9RlEIWxHIYgWIP6BP/3ExeMotDEtWGYn5D25VeIFJrq
	Rx
X-Gm-Gg: AeBDieuRK+0EOlpEyj4xiNA5sKl4TbkmUw/Fj+EVNwC78eEnOMYxeLTgffn23qL9JLr
	z3gURFk2+TB/gB6Q1kVcCZAYUKYwVLci6Nq7BJxtDzqmig38BXs08d7FU3d8w6f7FXt9NUzWMqp
	WB8iFmUF0mo5oDBsxhoVEqsyagqUmmk/g1pipovCS0yp8RuEgzyqOHZv1h/ZBa5wJrBLtDmTxSg
	d1Q0qoRwT1LUsOBR66JxLoyoekcJxBk2vRl+eVNA8l8BDgLo6ENxqotdsoJhp4mleNUsEMfGwTc
	F0K0UBDiq1prBww0zXmpIwRLAWsuu8hYKYPvkkC8KemS3Bt11vFC7QpJs1d6FAUDWiH7XtZjGIL
	kibE4Lhq+rArpRZPlDiInsiHZlRdBf0uIOklKmlnNtUjusQ==
X-Received: by 2002:a17:90b:4cd2:b0:35d:ab26:5786 with SMTP id 98e67ed59e1d1-35de68f8971mr7183164a91.19.1775336625165;
        Sat, 04 Apr 2026 14:03:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd2:b0:35d:ab26:5786 with SMTP id 98e67ed59e1d1-35de68f8971mr7183137a91.19.1775336624631;
        Sat, 04 Apr 2026 14:03:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de677e2dbsm2675545a91.4.2026.04.04.14.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:03:44 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH RFC 0/4] Devicetree support for Glymur GPU
Date: Sun, 05 Apr 2026 02:33:13 +0530
Message-Id: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJF80WkC/y2N3QrCMAxGX2Xk2khtdbghIgg+gLcyRm2zWbCb6
 8+YiO9unUIIfDnkfC/w5Ax5KLMXOBqNN32XwmqRgbrJriU0OmXgjOeM8xzb+9NGh+0jog4oREE
 bViSWXyH9PBw1Zpp9FzifjlD9jo6GmNzhT67SE6reWhPKrKMp4OxfM/6VWPJezs1ltpuBYOJfX
 FurVK1DrfquMW09ckzDUMtCk2ZbxfPm0Hu/HKK8fxuWae2her8/Yo4aLesAAAA=
X-Change-ID: 20260226-glymur-gpu-dt-339e5092606b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775336617; l=2365;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+J4aWf5YojiTxQdOvfgMJtW8OPo2YRqorfMBEiErPAE=;
 b=jPzJNMWb3g7JXstolt1bgI0t3NvHo96BiE9bZ+CxlIAgn7WvnAAg9ofOsPmhTBqrDY6/6+elH
 NvOAdVhX+qJDRwb6GfPTvXphNmC6cz4gI54LDlTzQe/EnzTZOmLwUVH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX0uvJzq3Vkd7v
 w1N1G0uXSQa0IE3tEtMoDYiE6rZe6y6g0qS2WBvXzhRHSDJDpRF9hHxE+fZ8cKiqg2Zy9qGsyEJ
 AZq/EBIZ32JFuHrCSkYi5nZewAFEQXGBIhSZct3yILx16kWqPsDDz/4jDe3ZhDH2/fOoAmFHq6/
 yMLvlZmnWaHsD1GEWtrTNyykgo8N9X3owZCYdTCIV4/w8NcDNaWJeoXqDKDeh5yw2E7N+0r61Nl
 ZEvAybiLl4q5QNJi1L3qB0ogdHhybPKCycNgxnCqne2xEbu88hB0VFdB46lE4WjOb5T3sN82eaF
 FLJqsOaz/f3qmWnCgaEaHlsJifQSyV7MErPkH6HAzfHvqXgz1Xs/hN5fAMMDcNdd//ci88SMdyh
 zTrwyQTVinx2QeeWQ22w5lUsPVNx8yA8b1xeQ5bn6wDO9cp8Cy7vzFz4gSxR1cFf+NpiGyLIHTA
 F8NmY2nTei2iYf+w/zg==
X-Proofpoint-GUID: FC4yecafSh-A7wuepHwgnuP7YPIaPtqq
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d17cb2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Q5AOMzfNme0c0ULdHeUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: FC4yecafSh-A7wuepHwgnuP7YPIaPtqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040200
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101802-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: B34EC39C785
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds the necessary Device Tree bits to enable GPU support
on the Glymur-based CRD devices. The Adreno X2-85 GPU present in Glymur
chipsets is based on the new Adreno A8x family of GPUs. It features a new
slice architecture with 4 slices, significantly higher bandwidth
throughput compared to mobile counterparts, raytracing support, and the
highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among other
improvements.

This series includes patches that add GPU SMMU, GPU/GMU support, and a
patch to enable the GPU/GMU nodes on the CRD. Keen-eyed readers may
notice that the secure firmware property is missing. This is
intentional: The Glymur-based laptop platforms generally allow booting
Linux at EL2 (yay!), which means the zap firmware not required here.

The series is marked as RFC because an update is required in the
gxclkctl/drm drivers to properly support the IFPC feature across all A8x
GPUs. We plan to post a separate series shortly to address this. I prefer
to merge the DT series after that series is acked, so that we retain the
flexibility adjust the DT bindings if needed.

This series is only compile tested on linux-next. But I have cherry-picked
and verified the functionality on a downstream tree which is pretty close
to upstream. Also, there is a dtb-check error for the adreno smmu node. I
will fix that in the next revision.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (3):
      dt-bindings: display/msm: gpu: Document Adreno X2-185
      arm64: dts: qcom: Add GPU support for Glymur
      arm64: dts: qcom: Enable GPU & GMU on Glymur CRD

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 234 +++++++++++++++++++++
 3 files changed, 243 insertions(+)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260226-glymur-gpu-dt-339e5092606b
prerequisite-message-id: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
prerequisite-patch-id: a1fb5b7ee94995a24f6e96d1d2524e710d3a7e60
prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


