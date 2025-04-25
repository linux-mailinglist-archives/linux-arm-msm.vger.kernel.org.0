Return-Path: <linux-arm-msm+bounces-55789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5DFA9D65B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 01:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9CE19E4A35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 23:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBB12957A2;
	Fri, 25 Apr 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnuogjRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F57817A2FD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624891; cv=none; b=PpVIy605p7zH5ILUmFwzoDDUBJTXewLrnplIBQLDJSraO85E9JWMCeTso6qOJ0Xfk8SzmOW7HJ9bNL8dT02evbcDbjuGj/7lDQGhdpjOsJJSQxfFGNhfnMT8ri3ce+RhMkNHTCXdxZiOQNQ7kecEJbn7oe6Nxrau1Vfmla2ay6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624891; c=relaxed/simple;
	bh=CLM3LL+yamKpOdfncrRxmMa2Pwc/ITqBLCQh5XRNynA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sdh9sX7rCxzRhpso71LUiDiO1nhR31OiRFvw1sIqX+e3xifv2d4n/ncPgvPlkEMj+Rex9QKZgPTX36MRLA341deYt4Eu4XjZ2MsB1Fb/iU3mD6i2sphSJoL6JS81JgULo6HbEAijwFT7tKxNU7uvUNmc1B/kfxIDoU/zv9vzU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnuogjRD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwvu011493
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bY5leKmEysE0ZY4g9gwRQw
	CCOo7dT0pBp5t1RvmPLns=; b=JnuogjRDkIo5eVofCzw0Hd63Z1IWw6Z3rCoRCB
	qVgH4sMixSIP+d2uSz7mjV3Z5cbSVlSbwdka3D+b8KcImNlKGIpy3EVDDFTLLQrE
	obZ1QW9E8vrevf6YsWRYl3f+t4AT8XDTGnPiigmWdUIZSuM0Z1IRiTITnXXhDtrd
	YRzENvsZJNYaziffh8tMwup8HtjtTPCs/nXXdqWj0BC8rkJ2D4jcnDGoAy3ggwt+
	kBfefCXwsMw9g23mwlcTWG9ax70Px4qNZYCGYYG4QEP7xZJ+F1AOoa74NHYDTO+X
	IldBmkodv6rLCXkH/KIdSw6T2JNTdRCkM3SV3hFcnYsuUF/w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3tf1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736cb72efd5so2101270b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745624887; x=1746229687;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY5leKmEysE0ZY4g9gwRQwCCOo7dT0pBp5t1RvmPLns=;
        b=WVDKbi3ISh4sPCSJUjsBZQA35jg7B0j2UkvGzL4vSksWZS4Yyq7+3NZpd+p14n6kCQ
         t90J4pQlYyq3yx4/CgqTWzv4svGhx0Vp8KzPBsWV2bzVRAtXCiIohjz4IDyYIeciHc5u
         +7edzlIcA/FKygx27v4I/5y9KRNLXzvhhjrOCrr2LJ4BdUt28NDA+8ew868mMmzGokne
         InOXjplSJF81SH7fZlvhGJJJUEUyG6ZO3vMKi1ts7miY/ahk5Edmgo9oDNPDCVS7SQ9v
         VatpxQSNaGH6xtmC53Vmqk5+dl5qecaJWBFT4Ru2LGjWFRRQuKbobvPR+j7atQMCi11D
         x+gg==
X-Gm-Message-State: AOJu0YykZvaWDFM0ZJ4fH0u37sa00bkQchGwt55sklvTigDYYRVUrGTG
	28rwVYUBuFvAqs7FXTaB7e6/0aq5ZLhw4U9cb9kO74s3fripmdfPZrSpxyZr2K8jnXVYAY8wBVk
	M/xFUirjrG+xLdqmLUtkvQZ5tD4zkwD/cY+75XOnhMTUjMUpFvxLLvWdcnpQRfxg9
X-Gm-Gg: ASbGnctrHjSPZ6FvUfl+26adZgRDmbtrK/7iuGEzzdqin8tP/bdx0RDLTZahgK1i5jC
	Rj1Ag1sXV/QwWDAzrMGBeCCHoG8C8gO+mHLBDUUSCgRj3u5p5qjyDufofci3AC4GaDxwuJpx1kT
	nE/tlRhmMnzvHy/H188/5V+9QLXGT2Uo3yLmbzWOOQS8URvN4Ypc04oj3oJULrEAJ0wQJVEVsRR
	EZr6pcIRrDpc11US5qxS82OOIExxCNanr+BBuidhKdr96prrWPCozwNXHqXyA6crQAGjgnkvWhV
	0HUilMxOJGknsLoJTBvx9rX6Co8+oxk0V4h20bsZClFI7/KAGtYHUxZRN03MJC2ZzrnIpkfE5F2
	8Y8A=
X-Received: by 2002:a05:6a00:1744:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-73fd8e54a8amr5886001b3a.24.1745624887047;
        Fri, 25 Apr 2025 16:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET7m20puHF/56IN7Vi1vc4sJeIlAeDckkPOER1DChLnUF/bgcy6ViYl6PXC+Bgwq2r5oA6Uw==
X-Received: by 2002:a05:6a00:1744:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-73fd8e54a8amr5885970b3a.24.1745624886638;
        Fri, 25 Apr 2025 16:48:06 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a308sm3868948b3a.136.2025.04.25.16.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 16:48:05 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: [PATCH v6 0/3] SCM: Support latest version of waitq-aware firmware
Date: Fri, 25 Apr 2025 16:48:00 -0700
Message-Id: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEfDGgC/x3Nyw6CMBCF4Vchs7ZNKZcaV76HMQTGASahVNqCJ
 oR3t7L8Fuc/OwTyTAFu2Q6eNg7s5oT6kgGO7TyQ4FcyaKUrpbURdp0iN5+W49IEtKLqelWVV9W
 ZLoe0envq+XsWH8/k3jsr4uipPTvoNvIyN4Uypa4LIweOclkZmzX9TYzj/S+eUaKzcBw/nMTML
 aIAAAA=
X-Change-ID: 20250227-multi_waitq_scm-5bf05480b7b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745624885; l=3233;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=CLM3LL+yamKpOdfncrRxmMa2Pwc/ITqBLCQh5XRNynA=;
 b=lEjMhw2scyKsr/465JRfH9GU2lwd7af7gweXimVGjBjVNdHJLL2Cej9166jXOI64zj+k+9Gp6
 AP0X1p8/CvcB7JmpqU8WdB4iwOo8MiJWd6cdAY24XO7KTj7GPZjOOBK
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-ORIG-GUID: V-U0GsdHTzJqk2L91bPgLWWru3Koaj3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MiBTYWx0ZWRfX5HYGdllm9Td3 cmxMUntQ5ioNUjfcOsXapdmJ7i+w24y8QAUlHOII1Dc5MclddqTlJK1S6hC/ShRTA8i7rp3G2Z2 KNYBvCtHMmagXcJ2EEtf1bPyZU6qSkjwaQOz6cZ7s9s0erTlF6chQ9Bprg9gs6EwtP+RZWqdfGQ
 2vGesBkLk8Wfc2rO9nlazqlOto3ZUNh11lTVlNtBn3a5Yk7bydwUcfmm2EEXszGZq/8EuBZZemd c9w2am3JKlk+YGTqBhx8aNBzTx+VQ7KVrmkqQQweiiBbaM+n8GbaRqW+nXYqXD3jvNMsJkJw150 6CwEz28W85wZ24iollUnau/q6BWxBWs3Ar7OjhcG8lB584uUtgsaUz5kM2ooaFZHB9wt2kfJYwA
 ae2FY+3eFo/fEN63bs/Cc0J8JEAqFoW93MvHqUWqQQJQ8RAJGqxTQz8PXMGxc5CurlJhObgN
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680c1f38 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=_3eEL7FArTPTRUMljOsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V-U0GsdHTzJqk2L91bPgLWWru3Koaj3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250172

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of
these patches.
Thanks Guru!

---
Changes in v6:
- Added R-b tag from Bartosz for first patch.
- Check if QCOM_SCM_WAITQ_GET_INFO is available before making scm call,
instead of assuming failing scm call to mean WAITQ_GET_INFO is not
supported on target.
- Add a new patch to check for waitq idle state in wait_for_wq_completion(). 
- Link to v5: https://lore.kernel.org/all/20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com/ 

Changes in v5:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Modified qcom_scm_query_waitq_count to take struct qcom_scm as
argument; scm is anyway stored to global struct __scm after
smp_store_and_release().
- Tested on SM8650 which has multi-waitq support and SM8550, which
doesn't. No error logs are seen.
-Link to v4: https://lore.kernel.org/all/cover.1730742637.git.quic_uchalich@quicinc.com/

Changes in v4:
- Moving back to redefining GIC_IRQ_TYPE_SPI and GIC_IRQ_TYPE_ESPI macros
in qcom_scm as seeing compilation issues in linux/irq.h when including
arm-gic header. Will send a fixes patch and move to dt-bindings in next patchset.
- Fixed a few compilation errors.
- Link to v3: https://lore.kernel.org/all/cover.1730735881.git.quic_uchalich@quicinc.com/

Changes in v3:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Prettified qcom_scm_fill_irq_fwspec_params()
- Moved waitq initialization before smp_store_release()
- There is no Gunyah hypercall API that can be used to fetch IRQ information hence
introducing new SCM call.
- Link to v2: https://lore.kernel.org/all/cover.1724968351.git.quic_uchalich@quicinc.com/

Changes in v2:
- Dropped "Initialize waitq before setting global __scm" as it was merged here:
https://lore.kernel.org/r/1711034642-22860-4-git-send-email-quic_mojha@quicinc.com
- Decoupled "Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL" from series
- Converted xarray to a statically sized array
- Initialize waitq array in probe function
- Remove reinit of waitq completion struct in scm_get_completion()
- Introduced new APIs to get no. of waitqueue contexts and waitqueue IRQ no.
directly from firmware.
- Link to v1: https://lore.kernel.org/all/20240228-multi_waitq-v1-0-ccb096419af0@quicinc.com/

---
Unnathi Chalicheemala (3):
      firmware: qcom_scm: Add API to get waitqueue IRQ info
      firmware: qcom_scm: Support multiple waitq contexts
      firmware: qcom_scm: Check for waitq state in wait_for_wq_completion()

 drivers/firmware/qcom/qcom_scm.c | 130 +++++++++++++++++++++++++++++++++------
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 112 insertions(+), 19 deletions(-)
---
base-commit: c3137514f1f13532bec4083832e7b95b90b73abc
change-id: 20250227-multi_waitq_scm-5bf05480b7b1

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>


