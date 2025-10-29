Return-Path: <linux-arm-msm+bounces-79329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D90FC18553
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 06:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B5D144ECD22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 05:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C192F90E0;
	Wed, 29 Oct 2025 05:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/AS/BE4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilZN3j94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157A2F6927
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761716678; cv=none; b=WtWBA8oIp+Sdr1k5Sx2XGTBI6XjN9ufl1/jFqWwePLKhiMvUQoU+yNk7W0bZZX0pKXBF8Jj51zJ0sA0gyBJMWOMgNbceFi3PLAiW0L0OWLfGv82oJXE1/xflI4VFGT3PRVaBev+S2m/lGxNIPs/R+Xp9cr05fn1xDEFE2WGz+0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761716678; c=relaxed/simple;
	bh=F0W5k3SvzOe2pljFMvhAaWmKlZxvDKSkyBzST1T5kfw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T7xMljZVdMqEhMxzcSo4jC1CpyWBy00zkfGl5MsRHBVZKONihQ9KemkxGK58vFlO032QMJKkRmfHp49206dxmD+wIuQ3S0Ovqi0BRqSXwH+9RR6JUKalsUwbkpah6K4ieR2dly3qOpBtXSAEALth7aXHioCZHSTibPwm4GUVB0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/AS/BE4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilZN3j94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4urre3642849
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LC3GMcFuvDtY3XJr35Uc7e
	Y+sExnlTPbLnkdhHO9Mdg=; b=Q/AS/BE4AlEFAuGOBZfT2ZaGNoCEoqt0U8Z8Xd
	MtZ7G9x+9JoKXw9oOm3hnxau2tl4nb4bstc64n/NoTO606lswJWYxYZOvBcVIwrj
	Ikl0Zgq15twGejhfkIVnO7uFe80DLH1LByHLVmsdkymRJtbqPudnpgBqK6nJWKv4
	J/tMaFlGzWTVELu9WGuzRCJXatvVYr6esqKcDsFL8QLlHV2bqUFQdXEGmH8wePbK
	72nKf8k4cAImKxUv4F8OuSm6kVVKtxT1qdR/9Eb+uutnminsc0qUchbwEN0dHNJ/
	mrMmh3z0kqB+i+00DQBm+bEO9Rop1GVO+rGOcGVMhRs5V4cQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hanp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:44:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fbaso80657265ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761716674; x=1762321474; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LC3GMcFuvDtY3XJr35Uc7eY+sExnlTPbLnkdhHO9Mdg=;
        b=ilZN3j94xnwuZqraVZVgaXvpt+HyZb5iU9JSzwp432HzuhL1ExPL6aQhgCDNYAy4JW
         iEKJ+xC5o5paYQYEjl3IA7nFsp08aGpSox8jtXdVu0DLh/RUYlEckivI4dJqIBEZACum
         khqjK4R8R6DOZyNjWWD/7qIQfAAptVVMZjcxL1tW4mty09Klv2wGCkaCFBv+7IjYc79f
         TpyHgaff3Z8ME9ZK+XBUUNQ4FlivHIwuN4ZZZk+th/jEUI9j+x1pt6NfGmWWLt/3S090
         NFX3TH28DuCuX/aMOC/DCGfeAub1r8WQY7TY5pJ4kPOaGAEAMs6gGPz59grCSUxnwjVc
         9f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761716674; x=1762321474;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LC3GMcFuvDtY3XJr35Uc7eY+sExnlTPbLnkdhHO9Mdg=;
        b=fbfC/gGlc81nF0UNRzkm/Dcf8+w7qWvTaZZkuooCYLnSzyPbs02DtVGE66OUVC8emx
         deWgCdeD7nUz++S5qn1wv5ZkQWtjjK0U++KDBS01GTYtozdJHej5XWavLuj/Fv1OrKZ5
         9pQvdFqVcQsj1VSlRvGdKOou5abqf5P4D6vGSjNjIpy8LZHqhzF1Ld2Nv6YIMjtKyFiK
         j5XEDmPKloiqDkQk2ugyaeappdeJK8gbtiOneBV4UY8ptAxf1xTqPU1sQ1SVpzIX/gxG
         8CL3zYLiLLRhruBaP7BMHqTgqi+ni74eZtldR9FgTLfmOm7viLBjavMkdkQMnxFHDPwh
         +zAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxto76V/bh9pw1U8sH3hmZi42zAaiWPEjqVDIkj3b42XdX+aOIlLPJje+j6bgBlnu4AuFnohZnwRX9tWf0@vger.kernel.org
X-Gm-Message-State: AOJu0YxnrajhgMiDp7lVfvKcf3P9rT9G5ENmqjZc/RDLyw/lnVaAvTq3
	ut5RNf1sDDAWQ+60cC9+6kjLnRCKy3cTzFcGMLorENT1esemiJMg5T+cLpSfhHt64KsUFirWhCl
	O/ibB+G5M96A9O8lOnt68aGKUKsIUqDTNimX7d5wnEf4gqibd8O9bJ6O+6jD3/Dw0k/Wn
X-Gm-Gg: ASbGncsou/YSlOFXb4uy8Oca/gy2GrvrFZE48BS5/xtQTZQOxe06X6/GDVGCVj3M1Nh
	BeK/xPHjySbOqnjvdnmLsm4MvHuVPTTQ9rvuHaptPlGtKw3VxQqLWMDHiunq11R1D2zN38wVU0C
	lTzBjMCBWQRZmzcz9lKnfpr3HFgL65jYeDJwjt/FWWy7M9eIc+qxKJww3GrApfF5WnxLK02pxeG
	VxkMv71gLutrWw4eh17Jb8BariJE8fMEK7yKh3xjM6X51bMwRTtk58kFqTT7sR33Fv9KHsP5g6A
	VqWcbyuBhSdLZdoPq2V9fr4Jf8PBOFDX8QhUTt0GAUBTqeFYECvhbsONKOYFE5JhF9bdf+BDHgq
	5OcEpxSrZPUnMuGtNnAdv7B2ugsv9akhva17HT6Lj9KbLp5uJtaas2g==
X-Received: by 2002:a17:902:ccc9:b0:27d:339c:4b0 with SMTP id d9443c01a7336-294deea9531mr21189345ad.35.1761716674205;
        Tue, 28 Oct 2025 22:44:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwIT/+Uxh78/COAQ0RUyc4JxApOhZCBiPwjnlxdxjlDaZnqWNHQph4VHfmOmFbB2rlTLvPFA==
X-Received: by 2002:a17:902:ccc9:b0:27d:339c:4b0 with SMTP id d9443c01a7336-294deea9531mr21188975ad.35.1761716673694;
        Tue, 28 Oct 2025 22:44:33 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7d1fdesm14280643a91.5.2025.10.28.22.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 22:44:33 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v4 0/6] media: qcom: camss: Add Kaanapali support
Date: Tue, 28 Oct 2025 22:44:09 -0700
Message-Id: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmpAWkC/42RwW7DIAxAf6XKeZ6AJE3T0/5j2sGAWVETSIFkn
 ab9+5y22nrYpB0A2TLP8PxRZUqecrXffFSJFp99DBw0D5vKHDC8EnjLcaWEaqUQO0BrIc/TFFM
 BFxMYHHOGGOCIGHDCwQO1emu1bZXoqWLQlMj586XJ8wvHB59LTO+Xnotcsxe86FUDxzCtSFgkC
 NCdsltLhKJtnmLOj6cZBxPH8ZG3akUt6vu6FLL5z+sWxWTXdk2rUVnn+j/I9R1Z1f8i10wWCrX
 pUYpOu1/In1cfiU4zuy5XKT+q95vbVxTMmWDEZCKUCJZCLFwwIpfp2TlKEOZR82E0GdFJvWvq7
 Z513k/uDre+P9AbmCGaI/gAi1v5xRx8eIWBRwKqdVpS3e1M0/9FUpIvHQlM9tPhHXLBMmdOmRS
 BFyuZBiwsaIS27oU1Uu2Q6IbTyJ9aZfiy3wQ6c8/L4GXHZj6/AN75hRONAgAA
X-Change-ID: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901a9c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AVJvM5lMoBLg5W3HYfAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: fmSUoBbp8DoOg8E9h0UTDw2JC0y5dFuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0MSBTYWx0ZWRfX2sMyA6MEZdQH
 kzsxcUBbqwTPmFW+GJl1ltGl0ymrdEIdddwQpMNclPoIf2OOrip28HewoSCOsyMDiSnylHivsha
 xWvDiKi3nDN/+wluQtw7WOubxZiQbe390+xciX9zEYVD4iVEiuBXClETaktebtG6xyidOb4znjP
 XVHu48S0ygYcj//7yhlNAYCprl4r3lr8eZyshLTnJjngJtxJSs+g5TwIbTyQtbHyGeZU0uPn6Lq
 jGo5X2r13mqUabvFSuIkkFGG+71b6tDdqvFUIzqBN02Jc5TUpJ/6fh+VYdAE82hAL8X+baNu19b
 qAHXpOZUZCLQh7ETuk05oqhKWRjRXPUnUN5jxaJx3upwDmAmaj8F2U4rYtJMOWW6wCsaIpb0x45
 5eiN3/suZHfokU3GHrirtSCypbVrbA==
X-Proofpoint-GUID: fmSUoBbp8DoOg8E9h0UTDw2JC0y5dFuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290041

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera sub system provides

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.

- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/all/20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com/
- https://lore.kernel.org/all/20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com/
- https://lore.kernel.org/all/20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v4:
- Refactor kaanapali camss binding style and commit message - Krzysztof
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (6):
      dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,kaanapali-camss.yaml       | 406 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 382 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 +++++++
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 13 files changed, 1486 insertions(+), 5 deletions(-)
---
base-commit: b09b832c719df5e10f2560771fd38146f2b3fd7c
change-id: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
prerequisite-change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436:v1
prerequisite-patch-id: 3ac5d6703a9530eda884720c146b9444f90cf56b
prerequisite-change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49:v1
prerequisite-patch-id: aacb03b359fdf95977805f42918c0b6c39889e32
prerequisite-change-id: 20251021-make-csiphy-status-macro-cross-platform-5390dc128aee:v1
prerequisite-patch-id: 27c2ef96f0e747ec6b4bcf316d8802356e4cc3f4

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


