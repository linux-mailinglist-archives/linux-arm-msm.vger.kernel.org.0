Return-Path: <linux-arm-msm+bounces-92864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHBvDbsOkmlJqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:21:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B13313F5B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CDA630075EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 18:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE10A21D3F3;
	Sun, 15 Feb 2026 18:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfWCLCBp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWFDQoeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB713E02A
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771179704; cv=none; b=OL2g2xOvZa7VUw+CYEPlBBaT+j3SfwAPfHYSEnYp36kX18IvobhkKkrxLu/YUrI6OLxljqSzCxD1HwjbuiBvfYHEdtXwKZ6+bi12i3HwMnJefrKN9jyeb23e1RfAp5uULq/uNm9FS1Y2Gf7eCaFrqVVjQuoB7jQHZ+SgitIguhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771179704; c=relaxed/simple;
	bh=7aFvA+uw3FGqGyf5c8DfV4Gvcdl2F84g+TlL4saJQDY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FYpaiRY+dZMHuUTCQaLrSaBLaNa3nhPLnKU+dS+V4CckRD75fSwgrv5dV9tFBf22DW9UHTg2ngQpShXvAvnrySZg/sHuQe8QQ+aWnCEiS8QAJUqXHimJKCqAAXZc+ZOA9eWucUChsHpjSgvMUJvo33swT1MY3+N/5TW5wNfmCRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfWCLCBp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWFDQoeM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FB0cdn1525347
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cWE7p+bkZNUh9o5AWGIjoFviBM7bxYlch3+
	N14UTL8I=; b=OfWCLCBphSSxGlPHZ+plPAO4kR8RPabPYceKcdtu1/W/JKBQaHk
	tJne3ElvVYZYu2hSH1AQHTgZml71IWLGMbNHCQyv4aoTSYJ+gB+UyUilKWia7Vom
	x7ywBlIXY//NBnS1nbNUHB54/Abw8gLw2WFh2lOO7eYM5qXVMqb0YuTb/fX45WWk
	j+S7tzAdqy5+WyaDAqg4KRTCZq6FRerTnSg2uZK8IJE+FkTdPxbdgrlwpqJCaKnQ
	LWj6mffSYmLrL2ssRVyxgSKmOIecwJ2RsDjbPO9J5HBRuP84YPeFF5CNJxRMvlss
	w3NdhykSpPZrVjzOC8EgEkFEhR8SZwm97FA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcjkha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab0b2e804cso29728355ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 10:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771179702; x=1771784502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cWE7p+bkZNUh9o5AWGIjoFviBM7bxYlch3+N14UTL8I=;
        b=CWFDQoeM5Djvwsb/8LpbTTvntkOppFzXTgEl3o9JXbKfuZ7VTl67YaipipY5QCru64
         6tjZMEAqI0PT4cHtzYJwDYCg/rmkXlXwP9RiHMRRv3u/8pFQOpc4WKPHy9F9eHinxU29
         VxowD63SNTnvYBn6mYVik9FdblQMzhi2DFJIe0fcumAdYvQWMIau6MTEhVL00n75nJDk
         yswMFni+p03cYsFtKpze72TecnGISftBXw68yyZ0vyqNznybYyQAm0+mYTmTt0vHAqK6
         jp8LRdSt1Egi1OAAdMosd2n/6pV2P6Zc2ZDoVaEAex0oNOCIlE/1OTWy+pX8if4YFEYc
         +N7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771179702; x=1771784502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWE7p+bkZNUh9o5AWGIjoFviBM7bxYlch3+N14UTL8I=;
        b=g5vq82zUW1FbVNHYsnqtGD4icwGGwxZ6kGdQTlVWSN5OK2RoIycF1sOCfdbrgxju63
         uLIoSsLx4dX2qNBFHWqRwrnqPnDcFZn8QbBzmUZqdclp8iiYxSZ+tS43DKNn0+73Ob8c
         /pEIK84G81c7cTwNoIOqfeIynIso+H8CHwwWL0GDbYAOkz4/LrFLny0f4cS4uTi1LC+S
         i4BA+Bydl/qqxn1U2wO0Vpj2W6KBCRKUR43RMX2eKxxJ2AQ0KyBuQGZ9tu6H0miBIv70
         m0L/fjWHzKiahFtF3OKEYp9hBg2mqyA4fXEypAKjzZEzKpiPP9npKgfKJP+6L7+qCvtG
         YAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIj2eJ3WHkFfLCEeyxGoL4dJS2N3I2K4HTRxcDAJJd/W0TRf3C4EHpPe5PkUuCitXTORZax5/Cagr4N1cx@vger.kernel.org
X-Gm-Message-State: AOJu0YyPGtlS2H1wjO2X9cKYJigLSpFZoiGVmaxA2Z6dB2B0GMmC5ZSq
	9W7WXXI3LPdyjLGK20Wk806Sl8IgfPQnQiSdvrii2ki0ohRKv1fmxFyWJI8tTwNa9PdyDTfNhDG
	1AW6BH+HucO21K3ET6gUy0n51QRC1ChsD2iQ82Zu3Wxu7WqmMpfQaMa8x602eZZlPLMQi
X-Gm-Gg: AZuq6aKYVeqyuRch9yDeC1ppwoak3jrryTOsUrpPHv2d0ZOQc2aACar7n4MpRKYxU3P
	oNBdRc+1q72yT6gWFM+HcZXqTEhKKktWldSsl2E7ZTbxAmeRG6g33bcc3wDhwVPoqtJACYzeIrU
	ZIi9PFWpbbtnj+QQeZ/GKiOL88C3dqrNQ8NjwcUysyTCxRVPDqZRnq79GuOzj5PhYiUH9ywjhuC
	czIpcUGr6znLZLf76eUIMR02MMxEHdmfpFMOVimyn2gGYcWvQYra+bcq7Ea4GJd37k9RF1UlaZi
	tapojSDvUX3kxSq6I0BSCFzsFN8fKzFPZyjw+wYlyH7tR3yRqzlL+yuBWbIGSS/x6mbdd+0rkAL
	A5pxyy9nOjdap0vkaoRemvDcr+MsB+q//RE2SPZCiD3+8+ge7UJOmPQ==
X-Received: by 2002:a17:90b:1812:b0:356:2fee:92c8 with SMTP id 98e67ed59e1d1-356aad3d59amr7447348a91.17.1771179701796;
        Sun, 15 Feb 2026 10:21:41 -0800 (PST)
X-Received: by 2002:a17:90b:1812:b0:356:2fee:92c8 with SMTP id 98e67ed59e1d1-356aad3d59amr7447336a91.17.1771179701350;
        Sun, 15 Feb 2026 10:21:41 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e537desm17425381a91.4.2026.02.15.10.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 10:21:40 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 0/4] misc: fastrpc: Add polling mode support
Date: Sun, 15 Feb 2026 23:51:31 +0530
Message-Id: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NCBTYWx0ZWRfXzERHXXZxes6i
 yC/ay5V0gb+sCVv8s1z50+4d5A7HBV6BcKNNXUTfYifucLxK0Wl96A6aZWZ4Y7FmMTpntpU3Nb5
 za3RUF5VsTfK4+Zy1lCXugAtVkS7PSZqCuoIenYHnBJbGfE/ZKIhVWzYX+MWyhobAgWAbz+t4je
 d+RzK30TSmWrUk0SJmYsE25o03OWwMzEN3SXqnloqb8zai94bzcnsmrKU3eEIIycrB1IpjwYhwW
 2J3qiCYdyItOjnQ7VM/KnApSqROBb5dvkKGfKV6JmwDJl5XBF69FJaWrU7bOHKq3Z3etZ+jbRLx
 SE+0MSCCgEDKSKBKqFSkC9zh+nde/hqjyUU/Owt+MlwHi6Y06GZxog+x4RFYrMkOLwxeRuUFCze
 AJu4KrNxdHNmtKmA3T7rU+MRtZbZKsEP375nTB0i+95w0+9H2Vqg30Z1jzKBgtemRqWyL2WhTQB
 /+tnsZSs2DjSsmWz47w==
X-Proofpoint-ORIG-GUID: UKBnBlyR9LvSytsRk-kSEgJ2OcG8UVxR
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=69920eb6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeUw2I9XaFYL6OdlDaEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: UKBnBlyR9LvSytsRk-kSEgJ2OcG8UVxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602150154
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92864-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B13313F5B5
X-Rspamd-Action: no action

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v5]: https://lore.kernel.org/all/20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com/

Changes in v5:
  - Fixed poll memory calculation.
  - Added few formatting changes.

Changes in v5:
  - Add more details in commit text.

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 166 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |  10 +++
 2 files changed, 154 insertions(+), 22 deletions(-)

-- 
2.34.1


