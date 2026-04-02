Return-Path: <linux-arm-msm+bounces-101566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKU/DYKFzmnfoAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 17:04:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0D38AFAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 17:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD10B312DB80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 14:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3369A3F0767;
	Thu,  2 Apr 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0imsMf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjLei42b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA8B3EFD1A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141778; cv=none; b=hvDiGyj0zMogpiDiGpzeGLwnieSgb8ZpIY++eH7YZg2hm1w6V2AZ3Ec3aGbaxEM3/y+/bcY1hjYiJtD/mEbzvmPYcNLE/KGiBVoDLjqGQvSefk/GF0zIDWBYTNCNfDrtLZIMjzvidCLNAXJTBwx6ZNKjAtLFzcPSrViHYHuKJG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141778; c=relaxed/simple;
	bh=NAle46u/5avuxsi8hpP/66pIOLqvOoFx5eK4UUbxdwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cdpf6vhPZ2rq+HDl7kAEY4NsA75xa2jciyjG7JqMuRt6FxIPTfXBfcpYQHpxtNpD8gTlOb/3sXT/0lPxAzWTI8aiGaHi1freu9hndkVjZtEWjzDGkRCqi7b8Q2eZ7Cr3xV0wrQjK1hk/P2ZXASX6GPpo9wzAUI6s2Uee3217gc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0imsMf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjLei42b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BlFNp2337873
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 14:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37FTNICNHCEbZbleh34LldopVFeJEOpx2/mQKFn/W30=; b=O0imsMf3s8UXpbz4
	wzgmd1j4wyZRZ8mgBmBmm5nfx3j5oGINXTLEks+ACqgD3bb/ZuzNrU0eAs1dVNS8
	gIMKzDNUtV/Uegb4++tlu0VtsmEeAwObpRK2CMfZeXbHIIA0HihOtxyO0t14a/DH
	raKnZOCxlHtHZ/b3//GzCwnIhPYfDXXaUo9k6n4FLsrL3aRHR672fltxz3wJBsK2
	b7pMwlgtLc5Aou2r7nwg8GCwgni2I/rGaB0dll82Xzj1o20hYvC+7b/pdRxXhLwS
	bq89CxgPkcoBDzewLAk7TLuooTn9spLfgIU1OyKp+GYpeHtgSw+G5VuySOITNPul
	vb6wvQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9qw08sjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 14:56:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso13600741cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141775; x=1775746575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37FTNICNHCEbZbleh34LldopVFeJEOpx2/mQKFn/W30=;
        b=UjLei42bBwG4S0QB5Rwvg/yQGazn9FWl8RpoMVr4xcWR03S+HBWEHMX1pOpx0vVawi
         GYjRHgCQ0DV6gPeWFfjVxvfelhD0J07qgRSZza8Fm9BjDd2VNdR/D5FSdJntZPBZqEFH
         iQQ+uP3YC3Tza1SS/618Qaa9BTon3XB0ov8pU01VbHtG9c2rgoGb6F332jDeDGmkO6aZ
         aV+pH0PHajNWQ24NhMfsw3TIWorx2wIbwva1SYbOr8So09858xRWZ1vR5HT6ttszZa1x
         Oh60GTcdEvvPnZd9xSnRbjzels0FJ86JdO9wU4DpYDT+AmwGbtoD11h1iJEvtbieC6KT
         cc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141775; x=1775746575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37FTNICNHCEbZbleh34LldopVFeJEOpx2/mQKFn/W30=;
        b=YbRPrqmWT/URPn6n+CURY1Qw9HOoCH62/8h7zvtIv+Cd9EQ02QfpCcaFBRpDgsegTV
         Gxcximb6C9lcAD+/CS4sd+A78PHkW56vv6Sko+PwS/pNoKg4GgYMttCJfP8h73w1UYdF
         Kj/bHNcqAeD6j4NvJRPLiwsatJW9s4UELeOngTtbNGfpTBG1VJLqDdExm8GwqidAx9DV
         vnvBFs7t7Xiu81UPdTIaPqCJL05GgqTgThV5ldfVyh9aujSTbtPfXYH3+kg3XwVJ8VIn
         xtXLyPvr1G2CXW/vl8bwr25lfXa5YKElzzt/dZphMGFEdcVoNkvk6KdBm9Pcr3cihV4N
         1HqA==
X-Forwarded-Encrypted: i=1; AJvYcCURhn9XtVO9gv9//y5IsMGEe7i+peTQVb+OIJnEIlEkM2MgzIT8cySQdxI1+8s52lqd0aoTWEjhNEsPP3T/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0JEXmFrhjXBH9cu7SKRiXFi23fi8Pb/pHfpiE9KBV8524/fpH
	W/U7Mc/57DGF2G6q+vOi8b4atKchuzinrUq+FnpyooYr04houSTvYLPhFJU4qK4aDp/VBqcCXmf
	Aau5b5rTcf4MknpYvh+AYOtc1iAzYW+V8yYVYzUo38iLfy2a5u8vBiskkZVxTf1Bqnzyt
X-Gm-Gg: ATEYQzylu4og5VYV4lvZNyHcY7f93+T9WCUaRIUNcXZCcHQD++mf+rLoRjFHbHXcOzg
	7W0cmtv0xuQgHtqIX6x1Fqsnh3VbC+mp4p5sfdWO14fmP4KzXvWybx6Is1RD/erPcwqSPq2qHed
	eYg0HbPxtb5HyQuIaQT2UnNQ37RRm+5E1JmH19SlQfpzpdZSONmwzGW1Hv4OlL6TDdmtL3l5Nq0
	r6kxGG5F3ze/lFyBrwyjoCPrGJopi/fObGrVTOREK4yGiqGTXG4xVDBsuqAzmRgzWdcQH0Y6zqO
	oKQ+tAobCpGqaPIzcRSjsl5OOvX35HLLimF3NlQvSf/giPpKYSGUkIy1RI0t1sk9KheEKPAJavo
	dn5FkbJUO+EVjiS4X4cVwPmbi4LZgE0k/rIfeEs2JnZEiakesPvtM
X-Received: by 2002:a05:622a:310:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50d4fc81a69mr29681501cf.28.1775141774736;
        Thu, 02 Apr 2026 07:56:14 -0700 (PDT)
X-Received: by 2002:a05:622a:310:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50d4fc81a69mr29681071cf.28.1775141774280;
        Thu, 02 Apr 2026 07:56:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:23 +0200
Subject: [PATCH v15 12/12] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-12-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NAle46u/5avuxsi8hpP/66pIOLqvOoFx5eK4UUbxdwQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoN1rL94PjnofpbfnmY9zW3YhDG0gLJ6WcfBN
 VwpH6fx3+eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DdQAKCRAFnS7L/zaE
 wyzCD/4qBTYL9xjoSE4Nu12ZWiccYQZk369fh1ufLC778tY8l97gBhcQNTuH0sAqanMIqyLPJWB
 PLl6fEZBBKJF4Rd4OqERxB6kv4Rm1/kDg9rxtW4mp5qrJwDCpTBcJ1KVSy4Lzf2W1xXafHSHgvj
 4ZmSF4rb/jXfL5KpHjoiIhIILZi4meKncS+g3M8C4FsLVm37zWiwCfVUga3rTNy/evEKjLR/ks0
 ohBtsZVB9Prwm6fgTa3Y9VXCO2RsT+mmDuXnSJbjNyijxf4Lwm0rVj5cLwkus8/X5+YLjdFAI4l
 pxPAnEsxN36HsK+8EzZuddZ5nToYDdiaW3XBKv9LcjiQsvIenxG44QLK6L3x+zoZoXGjQG8rbUu
 2ITGUH1jWhAXZ1JW3HOUb3TfA03rHbB0fn1CT/hfEe2QzYZCZYa/o14MK89zc5LFhaeKtrF5jUI
 SlOfynmMX8vdDtdG3R6cWd79LsdSZT6qsHghAiwW6M4NCerMO/sXiktcpt95KMw4OJPclmImo0q
 IH3kRVe6ChDLEmulFuHZ4XuppilSA4oMbsunrAVxIt7fW88Po3J/IOKRSQVFHInkqS6IqDmNj4V
 mTDi0rWDjmjaPxur4wyuVf+GB8CXip0J/9IOYbc/toHkAaH8mcw+0jBjWOtFL/c68pepGzmd25F
 Zc3yS3si1TqgG4Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX6DWdmv3FxGPP
 U5QtGhEU1Fd41RyVh5x58j78Q8ELDALPz2fCHhEbZQnfUBt35lSKEUqOLyfQJT1wF/qYCTkFgsK
 MWyVInHOaih+ux0PrjlC28+p+5Ve7YKGnnqjLlsMcoT0PCYuX8UmzJhhEuYVCqS9fyAg0cLW/Im
 6bBt58LGCg3qwf39s/qJvF6445K2rsyeQMfQ272EzYzR0+HLQ5YfcPiTjEAAKhd0u02lKV21DPg
 ViLh68/3L1NEOcpnC3YHMaupo9uFsUwXW8iheyLAmLfLl+fJIwt/nm/09qPrZKC2K1Tjd9JOTIw
 OjgK+KO28Pq1cfCvANuK8bC+/3riknq5GJJ7u645b+JHubFjmy8TuI2mnnAY5rXmWS0gCRd7cbf
 Y2bz/4rVXZmcm6Ka8n0/boKxqMLp13TKY4krFs1mmYbBvX5w8GhCpLzuHRMTEGz2RBXOeNWdOgx
 DWG1I7MfUD+5e9CQ3JQ==
X-Authority-Analysis: v=2.4 cv=PNICOPqC c=1 sm=1 tr=0 ts=69ce838f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: cb8B1lSLNqATS6w3HgoLnBPm4w33c-5c
X-Proofpoint-ORIG-GUID: cb8B1lSLNqATS6w3HgoLnBPm4w33c-5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101566-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACE0D38AFAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 5c42fc7ddf01e11a6562d272ba7c90c906e0e312..7d214ed6f703e6ea0c8b6dbb1d7620fcaf4d5163 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -43,6 +44,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -64,6 +69,12 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		return -ENOMEM;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, 0);
+	if (ret) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return ret;
+	}
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 

-- 
2.47.3


