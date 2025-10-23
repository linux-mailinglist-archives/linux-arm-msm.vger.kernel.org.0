Return-Path: <linux-arm-msm+bounces-78533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D9CC0076E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6472F188DCE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A56730CD94;
	Thu, 23 Oct 2025 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opCjfWSk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E748430C610
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215169; cv=none; b=Ww1VdktHukFiCAvS25ApuzPrKOeYXXLYJsalmyHoxnggj6XWAkQ2tE6AZFSVm7YnB+3CErh3jSg5YoGOhAxvQhQGYUmslfC2TSrvpTMydv0NkTb8yhxxVT2NWhh3S2QNLj42o86qY1lh8mx20WAIQiq8755pcvjyJ1KpoU8NrDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215169; c=relaxed/simple;
	bh=0eLCFL8V6+g5aAvq4dDgsIASiuIJt+qI3LKNCvOALz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pu0Fo7i3y3Zv3UnsdwezmvMNPMFzZqwjLhOI5bEqKyp3pCpgqZ08m1N2WVUdrZMpAWjRlXNZRaRQ7OVklebyUV8VrBVMo6PldIQpDk7aJsPRUgdepejn32RZTOY2AGnKZgVWhW6jlx8SI45uRQpoWxIY86c/UZUgSmPwn0XjH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opCjfWSk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6vswT020322
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PERB36M8V8P
	bxoKI1dQPG3pXRrOqc3fmNLU93lba5Ww=; b=opCjfWSkrLd9OfhPAvpo/z8tFne
	o7cTwGLk4jcNHqNABAJhTBQf6MX3/NT+Mw8EOrauEJSnJkX2UEcLWXJUhHtAN2I1
	rfR6FyBvBfVKXJAIStHSLL+FJFY5dtJSY3YH34duNmnt7yJV6sgKTdt+CH/hGYjH
	DrJUfvyubR9m230AWIN8Fd1gKxabWpqIWkA4HedVTsoSwcNVwAAmdo+FucGCabS+
	VDqrvm42M33SnAX3/NT3OQzMcKQ+2ZpPgtDo8LYtHitSYKYUbpOlfjzDjk1zdm4A
	gArn5cuiIYPUyFb6lYEuUPjYgMLVZFArJv3liYoBAhTgukZ5c28KgS44OAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pr8jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8bb155690so8465891cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215165; x=1761819965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PERB36M8V8PbxoKI1dQPG3pXRrOqc3fmNLU93lba5Ww=;
        b=AO5mYFmk+AggMOKTWiff7/6FLb2FfhCxGAivg67gTde4KumlWNrNRNRN/6PSv1Epdq
         bZgrcN+HjL3fkIAQ08GSEDckrqqnPDNWHLJFSvN9pPCm8Z58eWI4NEeNnXFQh0tLNWvI
         cjlR8LEmdRFso9qWGuQM8qSlYGiIZiNrJeOR9YH6sipHW7S9/a7NaDBQ7QjSt/D+tw8Q
         EmE4mR8MnvLLtW8pqHj6XXgIeFfx6PXOGiDIz8GfytEVG+vViDAZMKnXxdDmbLpfAIwm
         8z+PBBBqTdbIUBAZQC24JUOocQDYmUel8A1vPY6IDwAVVoektQsA6k3/vzyHjeJ9NkUD
         DCgA==
X-Forwarded-Encrypted: i=1; AJvYcCXtbVsLimFI7ngcKZdyJ8tjpLwSv3DGsH5z8jmyQXUh0wqLSsXJtKGQu7HmEysSCBnLrTgJyh45spzdbrhK@vger.kernel.org
X-Gm-Message-State: AOJu0YxsXgcmbwG1rgrsPNx4uP8wqghLym3aE981OdaorK7LL1U3JYjS
	sATpOTA+YIsfByfjykke/1ep52y1TqEZ9JA0kAT3u8r9NEDwEowgxihnQYW5ZjsPmEZulGG4E4Y
	g+Blsjf5BLM1R7Xo4PlSkarokiRCm90xqokDyxd8NAwVv5I8PMYwJVbIDYDKQ2EdVoVi85APCrs
	xq
X-Gm-Gg: ASbGnctRnPv+ndhP7c/xAHdrc2swIKYctoXdsw0QrrtHCXAruYYzyRXaudvfXBBNfm7
	hcnYzBEfY1PE280s+nULxkOt03y5RIZLNgPGIxL3DKy7f/qxd0xibuHqOMngZN3SBkyrnG+4H+y
	0GEtZ1AXD55aCM6OBcOW7yGWLFP5T71r73FpQK4iYZ3CCrAYWlmJTKBIUomjEtTrQQIL02LEAR0
	/Vc445F4YOqgBBiYOqLRiEcm65Q8Sf8dZTyeN92dnHdriIPPGAOG/KznuA7KCNRUZ7bXf3ZaCiB
	8RatpQiWA/6RZk/4h+AEboh1Jn5aceWPEWnlQ9/CG0lL2x+R2IHjGSNrMiFiVAgBmGpy5k6oCmi
	AlHbKoy8/lizc
X-Received: by 2002:a05:622a:343:b0:4c7:130f:72ef with SMTP id d75a77b69052e-4e89d208482mr276254121cf.9.1761215164720;
        Thu, 23 Oct 2025 03:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn5c8+iIAXzjyMz4gZOYSOyXoRyeSphaR9Vzxq59ZuEp7n5WLDJ/muqEKidQjFCzQUmKv27g==
X-Received: by 2002:a05:622a:343:b0:4c7:130f:72ef with SMTP id d75a77b69052e-4e89d208482mr276253891cf.9.1761215164223;
        Thu, 23 Oct 2025 03:26:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 07/20] ASoC: qcom: q6asm: add q6asm_get_hw_pointer
Date: Thu, 23 Oct 2025 11:24:31 +0100
Message-ID: <20251023102444.88158-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX20TLYMG1Wb0Q
 dtgTF3L1PckpyE7HJ2zwURK6XWoPw/79OiR6wgU7t3DUoWWUELtfVZ+VmNdk2Msim9eZFygWzMT
 kr0C6gobl4AxrskHCSjFvvkn/VaONpa7xdZah/pFRDy259N5jglZJ3RSyJpP9BSag99GjpngSJe
 Bf5LYRjGx4BC1yQKfB4DX24LUAlTpCmi4UmsfCVU9P4LVDq2Mvh2SUv2poEF046cKS3zpumF/qx
 RCsoIkoqGk89FvZxezzya3D/7ei4VrnFiljDWmic+4t9DD0Fpk8taRVmtfJiLR/BXN7M66tqXWL
 dSNomGuUbuCoya22TxwWJ4sA4tzmkuTQLkPyEjG86j0cS1B9WXm5RJBOZH4cGyCataD6wYoVTBQ
 rVJd1tACizux5NcPJ2ImdJ1O8Ap9Vg==
X-Proofpoint-GUID: oq916__N_VUG4DqeUyDF9NeYrtSUVMfV
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fa02bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Xpi1c-eeJLz4SkQ0e-MA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oq916__N_VUG4DqeUyDF9NeYrtSUVMfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

Currently q6asm-dai is performing an extra layer of calculation on the hw_ptr,
which is always prone to errors and redundant.

q6asm already has tokens to indentify the pointer pointers which an be
used to get the hw_ptr and this is more accurate then doing the
artificial calculation at upper layers.

Add helper function q6asm_get_hw_pointer() to get this hw_ptr.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm.c | 12 ++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 4c3315d4e27d..1478948f9fe2 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -6,6 +6,7 @@
 #include <linux/mutex.h>
 #include <linux/wait.h>
 #include <linux/module.h>
+#include <linux/atomic.h>
 #include <linux/soc/qcom/apr.h>
 #include <linux/device.h>
 #include <linux/of_platform.h>
@@ -248,6 +249,7 @@ struct audio_port_data {
 	uint32_t num_periods;
 	uint32_t dsp_buf;
 	uint32_t mem_map_handle;
+	atomic_t hw_ptr;
 };
 
 struct q6asm {
@@ -598,6 +600,14 @@ static struct audio_client *q6asm_get_audio_client(struct q6asm *a,
 	return ac;
 }
 
+int q6asm_get_hw_pointer(struct audio_client *ac, unsigned int dir)
+{
+	struct audio_port_data *data = &ac->port[dir];
+
+	return (int)atomic_read(&data->hw_ptr);
+}
+EXPORT_SYMBOL_GPL(q6asm_get_hw_pointer);
+
 static int32_t q6asm_stream_callback(struct apr_device *adev,
 				     struct apr_resp_pkt *data,
 				     int session_id)
@@ -703,6 +713,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 				goto done;
 			}
 			spin_unlock_irqrestore(&ac->lock, flags);
+			atomic_set(&port->hw_ptr, token + 1);
 		}
 		break;
 	case ASM_DATA_EVENT_READ_DONE_V2:
@@ -721,6 +732,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			}
 
 			phys = port->buf[hdr->token].phys;
+			atomic_set(&port->hw_ptr, hdr->token + 1);
 
 			if (upper_32_bits(phys) != done->buf_addr_msw ||
 			    lower_32_bits(phys) != done->buf_addr_lsw) {
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 519e1b3a3f7c..6fafda5bd849 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -148,4 +148,5 @@ int q6asm_map_memory_regions(unsigned int dir,
 			     phys_addr_t phys,
 			     size_t period_sz, unsigned int periods);
 int q6asm_unmap_memory_regions(unsigned int dir, struct audio_client *ac);
+int q6asm_get_hw_pointer(struct audio_client *ac, unsigned int dir);
 #endif /* __Q6_ASM_H__ */
-- 
2.51.0


