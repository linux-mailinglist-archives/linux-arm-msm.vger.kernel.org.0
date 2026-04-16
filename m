Return-Path: <linux-arm-msm+bounces-103410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGdTHDPf4GkEnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:08:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01F40E7F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8355230616C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D553B9DAC;
	Thu, 16 Apr 2026 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5ZNyVIq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RiHZpKIS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B995239FCB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776344854; cv=none; b=OtgVfsolHDw5R2vwVF6rsvyMY2Qwu4OYARYNxt1gt9yLpNBut+ENXp9cgfSciFBvmLQPdKjsjQzolBSxd7yG4h7YU1Kn/n6WY7FOJ1sQLDB58HkrUxHaQ/vGfPeVFFXe2X5RtTiP/jIhSS6ohPdGCMqAUuWwp94Zk9wmS0Gw0PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776344854; c=relaxed/simple;
	bh=6LYYvW3a2jfG+sYqtjrDrNOPas3lIJ0V4OXqFVb6FOg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DV+xYgtPMslcpNL1vVi7rQ+DqgB6HQ/yW+rzaBRzpo8XrdrtcmNfi8Ogjkk4FFTH8OUrBRjHkPiUEUGD4LjX8gzyPNKWzqX0i6+d9YfYTw99FK6RlnOWKzGla51SjQn3LEjS3cCPlnpF3yODtvL65Ej55FO3cSMHc9YqYwJX+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5ZNyVIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RiHZpKIS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GD44ld218865
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=POW8Tff6Ny9kwlW1q/aH/t
	9A59tUh3oFYWOLgRQtEtQ=; b=H5ZNyVIqNSQLYV8RV78BymyisKxFongozKndo0
	ANbwbXqyH0trjOjErfuf/e5WqSbJEwGQPC/p+CNEG1DPnBkg1dpuosVai/hhBz8f
	AUUyNleE2OHZU1et5eIuaw9e3eo65OVrYEeLPH/hVJzV3/4O5jCa+NWnKiS2/79O
	K89kVjBxFDsN5FQSqaP5JERZzPyJ3rHfxWoCjgRC/QZPRLH3NB6X5Ac29DgbP/QH
	R5qsL8t0ZWybc6owicpfbdI00ZDnPicgt6t3nDkPlkk/9YDoe4JkghmzlGixGB7/
	9rVA0YQyxZMLlyWfEOoOIucwAwht6CAg/MW+D81vRyPXfWQw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuyha4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:07:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f803658d5so359753b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776344851; x=1776949651; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POW8Tff6Ny9kwlW1q/aH/t9A59tUh3oFYWOLgRQtEtQ=;
        b=RiHZpKISgkd5VymehyZK3NEeZFg63kSyjiZkbRb9UenUOZQiToWhbe8Gwi0HpcIH9e
         KzLCut/l2HUyd9xyXl5uDQPa+pm0BpF+4u67PBi6OqMOe4LlbTckMUcnfuRev5dt/ODV
         tHqBfAzPnGMqMNApbVlx2UvRLItE5wVi3zZTfrLfUaFsWNXhMhowWD9YuAQzhR0+q+Zh
         URcsjKZ7wDgYZ0M5fs3mXb0KzVcqs7m24DTqs04PfdMMTtLh5kT587beIUuM0Sn51eKX
         Tw2t/JeR7VNxFOgz3OB0bwQBeFekCX7+ZKjQxi2eK1RcNmATpah/Li/hoxp/JusM67Pi
         nSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344851; x=1776949651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POW8Tff6Ny9kwlW1q/aH/t9A59tUh3oFYWOLgRQtEtQ=;
        b=d++tsXSS0b75nhUJY1VZA3bQn5+naI00gQY3naYX7ec/guif1tj2EqeQzpiAZySJ+i
         NgOLmMKfVoGekP+xDCD+NpDdIU0Dms1g8bDH6Jm46NQDfDYnsX49ParEBrZIio8l4J3r
         sppFjIuxtH1NuclDrOcoqeIct1OiQoUiZWsx3wmTOCL6go5EsbSWv65m09fP8EV8cTfz
         f1y/HJGtkd72vfAdz587tJZpNx9XvACn3bvhooMHUZ37OXVkVB2UzS4Z2IhBxghcRzLM
         BtQ8Cfh75aJ+RtaPSY5PVOQQG1ODhrOfXWa+MH/nFDZaHxz/P/Xd0R0vLQ7jQKIQ7l5+
         iA8w==
X-Forwarded-Encrypted: i=1; AFNElJ8xh8LPb/oHxNQGdHcaXK8tOv8u9W+m/cQBSb9t7pB/7yWffC958gtSgvoa7/LjxPWqC5dFcLuf+dxByjfB@vger.kernel.org
X-Gm-Message-State: AOJu0YxlWO2UsE+SgGgevVzBsNdAi5hY51ds1Miyaq8jfAeGtelSVNDL
	Z/VD6NuUpDVKOrxSi+SpQAsOGIT9vNiMQK/adyW2olUwDDuO0Fjpdfg7EzTLT9+/EHqhyNYknmK
	h1l23oBcuxehfeSV0jOSlQbs6zZ2PAY+l1mIfjKiG5wbjbkWRtDtTC3GP3une+qX+5Rwr
X-Gm-Gg: AeBDieuEu5pXslKsQolLthtNOuyrRDaCiUr6lptY9/Da1bIAhO29UI5Pq8Ek6XZfeoR
	UMn6jKWuppF90KpT8/2T3zu344t5joywtygoRuO77mEq0+0XWOkGDzHNUpyF/a1IENsIM4L4AlY
	Hhdy8KWTo98xmOUS01AnN4zs6OlHvF9SZOQB6H/ZXsxpK/kDgu7lijcPmsL4zXp0Kzj3ukBR5Ig
	ICNQIAdP0HAkKuu35CBQffjbngvGW6hZ2aik1+9r/fl4sJzjHQb/rnFDcHxS6bEeAEy6kjUCu50
	yytCV87aoSQuwhRrbzbtzX8BjgrYuE4ySf++ceQ7ExxRfbTKwcTuAjR1F5vjBs83C8qMPehGsPb
	24ImFD+y26pEXWkhUxoJOIZBlO0LpjOaMhCWATX4QOLha4UJBkW6aqQ1/qA==
X-Received: by 2002:a05:6a00:244d:b0:82d:603f:f3a with SMTP id d2e1a72fcca58-82f0c2493e0mr26814429b3a.24.1776344850673;
        Thu, 16 Apr 2026 06:07:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:244d:b0:82d:603f:f3a with SMTP id d2e1a72fcca58-82f0c2493e0mr26814365b3a.24.1776344850094;
        Thu, 16 Apr 2026 06:07:30 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67449c3asm5383605b3a.53.2026.04.16.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:07:29 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH 0/2] Add Crypto Engine support for the Glymur SoC
Date: Thu, 16 Apr 2026 18:37:19 +0530
Message-Id: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAff4GkC/x3MQQqDMBBG4avIrBuIgwjtVUqRJP6xAxplYosi3
 t3g8lu8d1CGCjK9qoMUf8kyp4L6UVH4ujTASF9MbLm1Td2aYdynn3ZB92WdOyTnR0xIq/HgGC2
 zb/hJJV8UUbZ7/f6c5wVsV8uAagAAAA==
X-Change-ID: 20260416-glymur_crypto_enablement-be2ff022b429
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776344844; l=664;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=6LYYvW3a2jfG+sYqtjrDrNOPas3lIJ0V4OXqFVb6FOg=;
 b=1bf97Oq2NNlGFeEkOKUdw/XcDAJQcDlHp7qBHHcRZBOcHXeYZ70pMoY4VpSDkqiw/wguh5C9u
 iKt0KpOkfDrBHoCG2v7ibA7EkrIGm8CidhgrsmcQxG0ANkS9FE6y/qC
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNSBTYWx0ZWRfX39KHaXS0n3le
 MTMH/BPUy2e36lxY3ag1YGjh3JHWnkPS2F7CXG+fU0PLBftt0RxWhYBg1VohAPYdiYisfB+G9bn
 qHd8YCvDJJkEJYOc/uMOm6x8nJbRO105U5jtqzluibtwGoYQWgZxH23FjPXnDWbVfLufOh0zOoH
 TXH9Qqj6abUjXlIV4WtL2sZidUdDOqi7LZjR6vwvZI25VVK+lreo7zN+N2zP0olA7d9jO86kAAU
 L+L4IJoV92KEQprscBjWDF4YbZtjZN9/crJ6Dwi4TOW0ZoN4HiQ1Rg33Fw3RCcMSVqRALvPIZ+0
 RnPCx9wLKxGN3zrHUiU5n5dEdUS8/Da1hanggRv5kCYcpCpIBS9xiH7d0KgXy1ejBKJogi8VxzF
 RkvInj5eFdUPijrCngQJ9Wh0NDbEXDdWR9HvCdtbdGpdT3VZDryyS+Hqs3xzZis4qM7I6syyrWg
 rb5Ium5FDXf+PDlwKWw==
X-Proofpoint-ORIG-GUID: iS92IYdd8u1WtQitQg3U5_HOADFmDoVt
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e0df13 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RuLhemBIKpjh240wRt4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: iS92IYdd8u1WtQitQg3U5_HOADFmDoVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103410-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D01F40E7F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document and add the device-tree nodes to enable the Crypto Engine
and its BAM for Glymur.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Harshal Dev (2):
      dt-bindings: crypto: qcom-qce: Document the Glymur crypto engine
      arm64: dts: qcom: glymur: Add crypto engine

 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-glymur_crypto_enablement-be2ff022b429

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


