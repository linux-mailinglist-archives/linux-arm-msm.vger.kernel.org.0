Return-Path: <linux-arm-msm+bounces-117978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /ZODKDyZT2qqkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:51:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA0B7313B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mcxSinwf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XhZvemKO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117978-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117978-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D94E7304FC91
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C724307A6;
	Thu,  9 Jul 2026 12:37:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EF04252B5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:37:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600629; cv=none; b=RbumsvfxvwLVvvyjszr1EURiDew7SvrN+W0BwnybElRUuyIy9S7EZpdnYF7biFBfWRytJxiFWBPc+O4xFKi0GOt45tWmwFeR5jgijYRqgA5M2uOg7SbH9YRdDHMIQja4sdUONusDP4ETfYcd0eI4fxIS3mTvj6cv98oqTygw5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600629; c=relaxed/simple;
	bh=fWkAbSCFblue3Z2AwijKMhW2CrasBLX9+Ror5e3etEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLmiatokkPsN3/ZmonEBvhzKjPlz12dnnDcJp6oJuvAeaBVloa0RmO6W4h97zQwaDo6yo1K/449RUereEdasGNSXe/QkzOOSU8s16OdvZ2395O+vLPgW86Vs3fIkFZp8srvPZ35hYbF9SsM3nmjcWF41dJkHV1H57+qJa0kiIFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcxSinwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhZvemKO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDIP1450492
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0uWu4lVVItdOG/gQO6m1iFTqiiPl59WTuu7fGl+srQ=; b=mcxSinwfYlgk2Hm5
	6SMmZJI8+8G0YgkdIsU/V8mRcyl+B1GJXmIjj/OMUgk9kahd6IyUcrm3gGGkdzW6
	Iqt8IDeRwwXQAw1X7FYRV2F2B7/WSVUsrFEQA7aNl6be5RWzELMa38S2B21DEp2/
	Yi2u7v9oI8/o2yewuHwa1alickOZospSgY9UL5AYBsRVIX/4bNR6h4b7qtPVAul3
	JQooJrrcabKg29CB7J97PLRzbrdlhRNe06W/7O/Y3aRnLa5wFWqQ20aETiYtn6z6
	SpU2FjT7X81vriB+aMKmsjWO1TYs5Bfos7rp5wUdr/3+9SFUCtdT6HKbVuq2Beol
	yyCXyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhxgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381e93bfcacso4159232a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600626; x=1784205426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0uWu4lVVItdOG/gQO6m1iFTqiiPl59WTuu7fGl+srQ=;
        b=XhZvemKOKgjPaooslTXuZVrvOp5Fpli1eJ76YGV4c2ty6+a+GKQzoFAWWqIFz3uj0q
         zt1++YZ7Sw6y/SFfWqa2Wd16lx5UWupcH3Z/Gml6aojOYJeO3c3dj64Mylc5xci/a9Qv
         Ywm3eH2GV6GpPKrmbke4yVnMgOMRGQbJp8t0weVxeOHLiVxdc8Hy6sOjasZqeJVdwmWL
         kfgrbXD/quEjrm2x+sSvLvElrq2O5YggYWXHmI4QrCw31C/h3WSX6wQPMo5O6NRxxALX
         jbljM70Vxr7hSgamD/zA5yOHSdGQWHItbqJJxpxMd8D7AnivACQH4R9eDi8VHwCW6HWS
         cL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600626; x=1784205426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0uWu4lVVItdOG/gQO6m1iFTqiiPl59WTuu7fGl+srQ=;
        b=kI2RXEYG1Oz9lhstz5WkW85ffQBj6R+vDeeO8lQ4JGjatzX6cBgKg1q+jjJ0rS55RY
         pgBiwBx2mrO0Ca9SN9gm/g1kgF8LooOxUQbfzHgIfIycxMgbbkgm2Kyf6rKkD/ap6Ba4
         Yb3nD6P+LbqubBZRMH15e4ZrB4FmjP3btNV1V/W5UC26xDWdKSl6uA7G4kEiC4vYJ4MH
         PiqUH64UN9C1WjdaUesGxMV6lKfH0vwcN/A8vmKT72C1RJNdql6uHXz6iqY85adCT+sb
         yoUnUd8I7njmua57MbCL1Iv/STwKJob21QGbraM5UEymzfJnIq3O7vpz1pMEsk5gEJzI
         dEhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2MgiVyRuE6GKA3jdlRxswrV9MOMmCqmA2BQP98MzmuuI+JB5YQFcbW5SemGubRiAEG9E7bG7Y0F8V6lLD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt74VraLAdjIArk/paPvsYL8hlEVBS2MraawNLRzUtMIJxiKmf
	LDI2LAOO5ON9psryu5FeLY6hQynM0/t9pH2lWGIxGs0VEeXJ3XuzgQiddHpavGxOmTI6XKoOC/o
	Bvs/PsEYhdkgT3WXcAJryDzij9KHmAT8X8BM8Qle/BJjc6KISdQdgCuSQbz1kIdUNq1fF
X-Gm-Gg: AfdE7cn6dMXoQgLuAIBd8UKbrVm/B4sPGZcrlBWO+aBxa5ojnS94bfC+r9cD5+OCbqx
	2rrFdiZ7yfgrp4bEi5AJdZhJoS4k/J0DZzqnMduOxo84A0+OSso46hlgE4DBvH+Y37Fb/9DaFso
	8CHC8LcbHc0lvax3dqmyPPj4rQLk79jl18cuxvysXLchr5t/HfU7DBIS0dls+G5bOoZtz+D0sBO
	tnff57y/B0Yb/YUOBKOhqeoNZasWJyhqYiUiFBWtT8FDgc7iRmq6uWs/HJhR7KP7Tw5ljw6/7kl
	fF7vOtm7CQn7tJfHrLDyp7RSHtxlL3KBi4UEF+/R6gfQHrJcMkyyDJt1rhIeuEBf8fRojRlR69f
	/7yDVwXY8PrB+79FaySYH4KaJoj+81ht8Y6OSi24xpKQfGg==
X-Received: by 2002:a17:90b:2f0b:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-38941cc52a5mr7041367a91.25.1783600626346;
        Thu, 09 Jul 2026 05:37:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0b:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-38941cc52a5mr7041337a91.25.1783600625893;
        Thu, 09 Jul 2026 05:37:05 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:37:05 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:56 +0530
Subject: [RFC PATCH 10/11] arm64: dts: qcom: monaco: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-10-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2086;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=fWkAbSCFblue3Z2AwijKMhW2CrasBLX9+Ror5e3etEk=;
 b=NBCO/pvurO3z2mTiBIbwwBIhoDTvIZr66UUgPwXu1X7YUVxIpq03suFlrhJvlbi5AfKtvt7Q5
 b0Q8GffIbCDD8U8KM9jgzMzCqo9i41ToLBHrYLdd3MP8VOWf4T+Un8d
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXy6ZPuQ3nMTva
 9kKcIYL/gYtjf0hqaLjzCrgpjO5U5oecM7wOrcEYdnRjTeE/aSSL43v5tJy0MiLltEDZNQLc2wY
 Ia7jySSlpGBz1jCjdrM8jZ+z9Yf5/7yVTEDqbKU5dHD60z3k295iCR6KlQsCmMOwEcnKjVPlihS
 kCtw+esOPdAjx88xXJCVIIB4s68mQTwArhsuB4yqGEBBw9fsWKYjFmeqaIWoVunn/zSP9BDZ9X9
 RanxJhC4VSczwIGQGUj+L6aC9Tg+8Ynvq3dTpD1+3jARe0eXgOPZqYxNc1Z5mVi45DwCA/axKiN
 0ng73kH9akLUso6AeZ0KC/MsI20s93b+ISni28diRSbdb6g0YX/A8KOXO5akezcDBgs+m2PrkRm
 LiiXUfBwyu1stcPCFukuEXUKFZEzuGoqNcVCOoVUc6r72xRN+H96HltumFFLeD/hP4+e6uNDa6/
 yLOGKapFk9OvljpKP7Q==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f95f3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX284sdWXEa8LN
 703b/gt9Q9fGV/tStnfWZ3k4lNNe7l5PSCO3c+Y/vo7NRH4uINSSmD9RWtJltnENiZAa+28hJs3
 M0SGfMoA6kYLhEImB7pSGuuZ2KobnjA=
X-Proofpoint-ORIG-GUID: 59b2zbph_cd5SnsBkZPbERgSngTM-7j5
X-Proofpoint-GUID: 59b2zbph_cd5SnsBkZPbERgSngTM-7j5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117978-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BA0B7313B1

The Iris VPU has separate streams with different IOVA constraints. The
non-pixel stream must be limited to the 0-600 MB IOVA range, while the
pixel stream can use the full IOVA space.
Using a single set of IOMMU entries for the Iris node does not describe
these per-stream limits and can allow accesses outside the supported
range, which may lead to device crashes. One such issue was reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Add non-pixel and pixel child nodes, move each stream ID to its
corresponding child node, and add a reserved IOVA range for the
non-pixel stream.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e0243901abe9c5748fcd3c448a0203374fb96c3e..d3c464571d5eee18fccb0e6b522ff0400e664cc4 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -831,6 +831,10 @@ video_mem: video-region@9be82000 {
 			reg = <0x0 0x9be82000 0x0 0x700000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5423,12 +5427,22 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1


