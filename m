Return-Path: <linux-arm-msm+bounces-105710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIiaDNN5+GmgvgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:49:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C74BBFCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ECAF301DBA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978453A63F2;
	Mon,  4 May 2026 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/ddTn+W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FB6HewFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A566218EB1
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891735; cv=none; b=WRE7IX+xuzBx1IkgJfa3OnfKT/HaTQcF+vpAR6WEMdFDwJ2CDkNTxPPXc/dOnLvFWV8pTZFgaLbfaJSWptxLMTqhAQQk1fcEN3+52y01al8Mi+80y6fIBQIfNEFh8Hhvocog1SRkcJIGupYG/Fo0B36dHgr/4YYrbfT8HOqfm+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891735; c=relaxed/simple;
	bh=uTlUQACvmbDEV9HCwCQjfQKmIVqC4d7G2qr1KVpX1w4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RHGu68p6l+nRLrZF0Eh8V/ku2wHQ0U8RH+EJ/CYZ3LPTnLs0lDVsq3GmAtf0DOpzp8ZDyKCng1Q2laHNSXCnjOndtizox9iij7b3Mb5I1SAgbzlHYwn5qC8iDvEjtXjolG1slgTL3o0b8O2m30AQ71XPhn+gGTvVqcFJkFbtPVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/ddTn+W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FB6HewFx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fd6K1219651
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OHF49pHPHlCswJGS2RotCL
	4VQnSkkpNWBztrFc8PQfQ=; b=H/ddTn+WfUAfK1jZ2JAhJAmv9YxiXwqdcq5SRX
	5jVhnWTrJ1ss8H6TgttsLRvhcPQItq/kOdWz1vgqwGeKHmjWVeF6dwtV6qX0SYal
	1DPqPdD4HStZujeV3wNnEi7/nJFjhi7KnjEjLLkTdisvk7ZlwpkHIt09wa4vZ8nK
	8Nui8q6x20pZ5hpYCm5PA4+xYRSPOAotG1w5z8Lw032GjqLRqlU/aJC2jgWcAdFh
	NHi7DmgJU09SwHzLOdN55hb+CbUmoDtVhzLO3/n1/6tXQ/soV4GqpVksJtpxBKk2
	TO1dMasVfYIEo5fe9zn2M+1nbrdKDb5F0UkHYPnW28obW5dQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1en9qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:48:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35641c14663so4740396a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777891732; x=1778496532; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHF49pHPHlCswJGS2RotCL4VQnSkkpNWBztrFc8PQfQ=;
        b=FB6HewFxioFrgafRl33vyV/1EV84NxWLSbLTLPS8iIsJG5ZjC3KboqYmj7JHFOAgtV
         fjj35YdtxXPAQvQhb/s6306fCHUgTG04uAexEtEWW24wBrrHDJ8JQklUmbGL9lw/cY5t
         TZnzO2g8ZZU+x6PmNsyHtCd+DturkaEFLRBrVNNbNUyym/PQL3iY3A8lYcQVfVYjdH5u
         gQ7uUSJFhn7EcLYcM7fvTVT8mVeDVLHi5XnSFK0qqkdCk8j/IHJ+pA+juLudI30p0bBE
         jRu58Rjh+laffECFxIV/6D32HfY4+VAo63oiMilc9LrVYs5t5wyBzZw+g+aFaBTIdQqc
         8CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891732; x=1778496532;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHF49pHPHlCswJGS2RotCL4VQnSkkpNWBztrFc8PQfQ=;
        b=LrPKjpD2cI91jWXXvFGFY+8EtRJ9LX+CxkvxxEDyRNqXZPZ9Gjhh9HMNbQUALe926C
         MJHFlyQM8JWYShh4Cys5UdScBN/Shb3v2HqvZMh4TuijRoye3Ic+BAEbBOfYSOWG92jB
         k3LmmYTiWmnefog47587bW9NCuYWoNsmlV7B8AF5wwOkafhNyhtrJ0kfgheecbtK7nYH
         gCjYxFoXsAefvTqhJt0y2+pOg1t1wA7XWMS5wQ8oKtDFLUx+8PnDEaqeYu/02So1EB+Z
         I228f79fK0rMgLP471QLRhNRLqNMmm+5zCc/Gt6N3wlRZQrSlV3DPll/eaSLPDVWotNm
         GVOw==
X-Gm-Message-State: AOJu0YypROtx/N6Z8a5K1ciNOIWe/LUGmHTkasJxIqjW4EmE6DUErUkS
	kzpfrpwmi5Z8leztLyFZwXCS9OGyULhUyQyQADvi/cWqKmokK0kvqdYdQQk46BfMlzuvbCgHnua
	H8XHKzKaMUypWHWckFRwA3Nu2YnD3QxbDZ3M6/27g7CheBFMkcrspLBUqDb3HZz7Uljmy
X-Gm-Gg: AeBDieuJTgmAJWNeoUZLhWoYUplaZO9xk4EJqAhlEvED/+fcgaNDVH8eNp5M9lowhEC
	yoaIaQHYfmd5ID4tKP8pbqWyGZO/NawE3Zx21z8kSbVfzEnad0DgmETvNVWuhu+iEJn+RYdMv2n
	R3ZbFPVtR1+iOctY0OFhKYA1lUH9DvxAqtOT5X2FYlbnbehzms2chawjDm81P0F7JjfhoiCkzLD
	y0TesQ2/V8aQipeL4W9gzu1qLcaYQ6tDV69Qp+QzGlz7ZJ4Li7CuaxegVUwPdOqpz+u3eyVRW+o
	dLs6IGmSOKi+NN9x8vCGb9mqwjZ21KCHmo4jro0/RBUMH8A2Yjv5E+vrv0cRXNsIk6IpNgyzQyh
	qdKxG4v7bT7I9AU41OFgLFmBuJesJjyuPVRfQBZeKrPnfYF8=
X-Received: by 2002:a17:90b:3c0d:b0:35e:5ae3:299d with SMTP id 98e67ed59e1d1-3650cd4a7fcmr9184410a91.11.1777891732132;
        Mon, 04 May 2026 03:48:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0d:b0:35e:5ae3:299d with SMTP id 98e67ed59e1d1-3650cd4a7fcmr9184388a91.11.1777891731702;
        Mon, 04 May 2026 03:48:51 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae68443sm96799365ad.81.2026.05.04.03.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:48:51 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Mon, 04 May 2026 16:18:41 +0530
Message-Id: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIl5+GkC/3XPQW7DIBAF0KtYrEuEgRrsVe9RZTHAUI+amAQcK
 1HkuxfHqrrqBukjzfszT1YwExY2NE+WcaFCaapBvjXMjzB9IadQM5NCdkLLnpeRvjPwC01+zic
 eg2nBdehDF1kdumSMdH+Bn8c9Z7zeqjvvn39sbdlR+4uW5ClwkAZQWe8MqmFpN9VBQe7T+Uzz0
 KjeCB2FiEYbcKBaXYneGuHeY7DgpRLQA0S29Y9U5pQfr/uqtS3w3ylLywVvnXZOOgU2dB+plMP
 1Bqet+VAfdlzX9QdiDpX0MwEAAA==
X-Change-ID: 20260429-shikra-pinctrl-fd71ab6ecd6f
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777891727; l=1347;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=uTlUQACvmbDEV9HCwCQjfQKmIVqC4d7G2qr1KVpX1w4=;
 b=JQtArEYM/rET8ZvsBIjX0wfnaGqo3JPcs6y3wh5xN/AEqOOXiIySmvEPXIHmMy8VMpDxsmXnh
 rf9TuD3UQDDBJuiWSjZHEHR22q6hmw1aRF9cWxQ4SbzO8ZsAdQXL47O
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: iTIIwmma6pWZd8kwUbr0c2WZXW66csha
X-Proofpoint-GUID: iTIIwmma6pWZd8kwUbr0c2WZXW66csha
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f87995 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7K3iWs-JhacpI5SHW8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMiBTYWx0ZWRfX5IkhHESeucWy
 J8hPurpURoHogQGarEiGvqxH6XHuhZjk/JBH23CciczgKuU6rWKctJjyWwSc0kFvqH+FIKPewha
 8mtIvAL556ocg/DESboq/swlqtgmWHyThgsvbg6GKMkBh3AKYa849WWWBZP2V8EXSZDe4iCRdfz
 CkFT7ur2J2/rQt2MhuGhMqF5Iwz4eGh5wOHOxBtvHZqQ3u8TVDTTvmILZ4lQPAYiLnuWZvQ9oVY
 ns3gGSHVw5j30o82nvfivAgIwE/fKqj0bfHeSw4QANmpxDj8cCttWyTjH5xRWYi98ykkQfImwZh
 PtkH5Im0twap29cbLApWMSWPm9h5Mf0Kf1yfpmJQvVhzEsG4sHcYP6UBcBASq6c1w8zKJIqTEA9
 0AQgc2HO978DkYeKfqdrFjwumJKcE98px30xItxy2Xouce8Q6Jmu3tLPD+DMPKEiP8yuC29Y0Iz
 W1YCCjD7MN6X9ShYzyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040112
X-Rspamd-Queue-Id: A73C74BBFCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105710-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as default.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v2:
- Fix Kconfig description to drop "Technologies Inc" (Linus Walleij)
- Remove unused UFS_RESET macro (Maulik Shah)
- Add spaces inside braces in shikra_mpm_map (Maulik Shah)
- Fix gpio-line-names maxItems: 165 -> 166 (Krzysztof Kozlowski)
- Link to v1: https://lore.kernel.org/r/20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
      pinctrl: qcom: Add Shikra pinctrl driver

 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1256 ++++++++++++++++++++
 4 files changed, 1391 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


