Return-Path: <linux-arm-msm+bounces-79810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938B5C2395A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8271E3AF840
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 07:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A61532ABF7;
	Fri, 31 Oct 2025 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4Y3vsP6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+SksGqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89939329E6B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761896525; cv=none; b=rqH3hBEeIWvQqf1GwjjvTBT/YoWHRCJ1hMmog+bOshDbZgPMZfAcciCb5ntkU7xhr0cwTfbtmLzx8H13O6mK3SlJKsxTbdt2x4Mrtx6T6ol0RhusynjdmIodaDetl6K5v3hnr1IYKEfBwsx+Qjj6M+6Web8OQlk2VUJoVBQaSfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761896525; c=relaxed/simple;
	bh=rlsZNO3r9jM3pXZk7rHdjWG3W9uPoXZ+KGBQDQntePk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p/M/T+YWqGcvlgzSZuKOTWIJUow2i2i/0/F/JK0OwMOld+rNVv9GbDNwE/byegHSvK0jFb6t3Qc6hGTBXBEbf4ypoihcBQnfyLZ91o3aQ7+pTURDXT0fLFRg71iYbjer0uIr/9ZGP0Y/CWcoj1BMpPSVQ95P/6Lz0H1tL6blof4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4Y3vsP6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+SksGqu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V18FH71417342
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ovRnpTLoXzZqTnzO7mofmt
	3S7grzyD3/EeCjszf/sVY=; b=M4Y3vsP6Dcw2wF78sSC5Z0ULnuulTtQX8NUoIb
	5K7INk7y5FS5wzF+YFDZUKgZFfjTgBjs/ahN++XNqE0T4OQVp0bxv8wof/XC7thb
	nr59Dhwb8WRhFsY1NmP6rHszu4BxKCQCtJM8/KNI3rOSyntcdRdgO+XsIw3amvOS
	OzBZNgJTLRjWtuW+Vl4Ap07aZnPH+7NIbehc9C8qQ4pZ7gaF1QqqicKpWxt0ST5C
	u9oVZ3UdGoQTdxMuk5AxhBXK1nUhjvoeYtxX631azPODHC/57k5oHs0EvLTf3Im7
	GjHsqooao4BZAA2RqOYx8n/5xQcc/CiVI4tFbCqiy5l9SYBw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69gw9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:42:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so4143048a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761896520; x=1762501320; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ovRnpTLoXzZqTnzO7mofmt3S7grzyD3/EeCjszf/sVY=;
        b=f+SksGquD8NnU97nd2DrmidNGW6KUHr9BHkFzvrYRR/9cyCpbKjLBlawSsWGkmm+nF
         8z9dgSWCWU3uuJhYEYjBac2HPA5UBtIWZ6WqQ84yoqzWGsRHa48pAFdSIJE4eemDChiM
         j6DsqYW2zPp7J26uUOar5V2/0+hG8Px7tMIk6tQaK30X3iA3p6Yg1L6Oi6V8EapcwwFg
         iD/aWhpbsm4jD/YUiJMdQ98Xx8Qyvv7dU3WkGveDZMbGeu28IzNUx8bdHwMwyN0KavuT
         5gffBgs3ls6kMQQtVr3ZV4hu8UdimelibPWeMEb4Mq3livMZB29gfz0AaJhW1YLcR21U
         FR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761896520; x=1762501320;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovRnpTLoXzZqTnzO7mofmt3S7grzyD3/EeCjszf/sVY=;
        b=qeE8WDqtyn27+W7espOsUMpgdTxIMZVBMqrHZvbsSkY1zXIH+/+ZmkIVzJxfH9NX7t
         Li/xhKAG92saaLNUDCXHStxJvSLHeAygf+yI1QknLh2Q/ON7CkGjVFcq221ie4UumfFN
         U524WcfwKuE+n4kWKyWB5jd7nzyqxbrhziFmTkDJjFXn7ZOYp0OYNtsQvLO2CO62Q32O
         XnKNoOX13sn5XaKmkhU6sG/bs8AYWCa+VVU7Jp1SwZmjQCZxnCTj8hgh40W7sK/U9ZFo
         dIjlBnLRcU9s/tYyltijo+Ns7HRi0aQDa9nDtRFlGGDRaUv6UlR0VLcJnI4A5wqGOfri
         0CwA==
X-Forwarded-Encrypted: i=1; AJvYcCUck5ZQVi4K9EbaxcxJf4KnevL/QpaVg5B27CvfJCrMNs0bBazLCr807bengEulHFzl6iQz6ACgf6xF3gN7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx43SJRx8Ad1RIOy/+FNcgz8/LMFs73AAJ0H6Ioujv0eK3NHFst
	QjwtJqv4KFHqSTe+b7gn3izelmPophQOeo0ct9++B+dmkxye+gxKeyF4uSb+ESBWX2XxU68HIoV
	6FtJMwTn85QquGaQxSB5YziPqzfptjswfWfXFdQPyGjzgtUodwb/Kni1rCoo00DrVeJe9
X-Gm-Gg: ASbGncvIu65WAlY2XljUs3yOzowRSrWPOp86IhHvDkjoGlwsve7zqHRP3nO4+LBLzuG
	4fEbzqIzWgSxJsEqNyUl6WPew0vugDGy0wf7D3LfWmntHLIHEeyk9vQSkJQyjG4KkJEfM0AxAfo
	PjeyghQlDhLa6/fZEs9w74+abooZCyPwjfR1SLS07Km6QXjbvlBoLyU4QbjVxdvbIW2OJoC0YnS
	3Uh/QU04cL/2BKd5BlHFHNrnm0T60ETUg1ZOtTwnDzs/9SFNW4UJGHJ7DV3NT3ME9adKTYSy4I3
	GnQFjaeK5i5p4SLoCDzDVRVfS+SdNVI18Chxzk2L2DUN+wz+7SceigXmgphrW/W8rlUCRdMhQRA
	KFxpn8KEFP7wblCT+hXdacz+Lt+Y0XUwDGlCtbRN8eepT7Cmpnw==
X-Received: by 2002:a17:902:c947:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2951e50eb4amr29425955ad.23.1761896520301;
        Fri, 31 Oct 2025 00:42:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnOvple5E/jpu7Ojs3vJuSdtwKz4L73asmo+O5/kr7zaTkjX8j3txjYMGu4cHSGN+TDfMUMw==
X-Received: by 2002:a17:902:c947:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2951e50eb4amr29425675ad.23.1761896519768;
        Fri, 31 Oct 2025 00:41:59 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696f0c8sm13276735ad.71.2025.10.31.00.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 00:41:59 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/3] mailbox: qcom-ipcc: Add dt-bindings and header
 files for Kaanapali and Glymur Platforms
Date: Fri, 31 Oct 2025 00:41:43 -0700
Message-Id: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADdoBGkC/22Nyw7CIBREf6Vh7W3gtlVw5X8YF7xqifYhKNE0/
 XehC3XhZpJJ5pyZSbDe2UD2xUy8jS64cUil2hREd3I4W3AmdYIUG0aRw2WYwE1aw1bVjIt2xxg
 ykuaTt617rqrjKXUlgwXl5aC7LEgw5lnnwn30r/Uwsjxe3VRg/XVHBgwaI6zQqhHS1IcxhPL2k
 Fc99n2ZguSLiB8+6cUPj0CBK1nRSiqOxv7hl2V5AyI9euD+AAAA
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761896518; l=2031;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=rlsZNO3r9jM3pXZk7rHdjWG3W9uPoXZ+KGBQDQntePk=;
 b=OV2NRnkecWvBSoptNP9Hzj90ZICtv0J9DF+D+bN6dKOSlY6MQsUxFBkEXBDiv7MuBJeB16Vyr
 7B1krNcWNyWAtRdSWHt63Q6ZEUil9tflf79bYJyqEguqqISJ2dtlN00
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA2OSBTYWx0ZWRfX4CHaDWDggAbY
 V2fqd+Hs5UpKUO+Rs+5XHZlOpuqpYvkUGR7t5FS0RTrCB4gH150go4aLK/6yUn8kWiQFXpK2RRc
 styXAOfEfcxCYj+4FFjz0UZQMu2uN2McGaagRipXqIi8dlHr5HiU6qvocS3Y4d3yiTI6TJ/DE0Y
 LDoxBEp1VrhYI2yjT5+YCIIHNo8RNxmeDkSQmFdCEJSWCFG5SZ73HSOB+WllH8F9v3B83tEvX+t
 ZaJHeoomSuYDLisluP1grCExK5tRvMkGgKMK+Imn6xoXFbRxvSj5r16mnIzalgfDkKl75FGtif/
 OLrrZRH8dlpEG4roOjh6qjUQ2YuJoZCRO5h7GhXpOhXDPC0NZ+LwIsDQeDdUjqVRXiZsCjpbnkP
 jw3ASGG5in2Gekr1qcHbMHscHNKVYQ==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=69046849 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2HIG4QdnYvknWnWHaxgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: UND8miS-HrIOGkDg1LZgglD2tF49MHq7
X-Proofpoint-ORIG-GUID: UND8miS-HrIOGkDg1LZgglD2tF49MHq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310069

Add dt-bindings and header files for the Inter-Processor Communication
Controller on Kaanapali and Glymur platforms.

On earlier platforms, Inter Process Communication Controller (IPCC) used
virtual client IDs and performed virtual-to-physical mapping in hardware,
so the IDs defined in dt-bindings/mailbox/qcom-ipcc.h are common across
platforms. Physical client IDs instead of virtual client IDs are used for
qcom new platforms like Kaanapali and Glymur, which will be parsed by the
devicetree and passed to hardware to use Physical client IDs directly,
so header files are defined under dts.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- Move header files from dt-binding to dts - Krzysztof
- Reorganize patches
- more detailed information in commit msg - Bjorn
- Link to v2: https://lore.kernel.org/r/20251029-knp-ipcc-v2-0-8ba303ab82de@oss.qualcomm.com

Changes in v2:
- Add separate header files for different platforms
- Merge binding and header file in one patch
- squash glymur ipcc change from: https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/T/#m186ef6ceb50936185d07b81e2d36228a5a361d34
- Link to v1: https://lore.kernel.org/r/20250924-knp-ipcc-v1-1-5d9e9cb59ad4@oss.qualcomm.com

---
Jingyi Wang (2):
      dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali and Glymur Platforms
      arm64: dts: qcom: Add header file for IPCC physical client IDs on Kaanapali platform

Sibi Sankar (1):
      arm64: dts: qcom: Add header file for IPCC physical client IDs on Glymur platform

 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |  2 +
 arch/arm64/boot/dts/qcom/glymur-ipcc.h             | 68 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-ipcc.h          | 58 ++++++++++++++++++
 3 files changed, 128 insertions(+)
---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251028-knp-ipcc-6b4189f71121

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


