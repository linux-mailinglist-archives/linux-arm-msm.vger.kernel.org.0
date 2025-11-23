Return-Path: <linux-arm-msm+bounces-82998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24479C7E1C5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 15:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CEDD64E1F03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 14:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859D22882B6;
	Sun, 23 Nov 2025 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwMcO+SH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wu74PFxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A323908B
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763907583; cv=none; b=tEjkIhHrwFjTPk+Rr1aIfpryQl8GLETIo0GDjOMbif+KLLR3mE+yE5ae04IDMhN7GuY7/ps2OQLoTHlQPqO1Kza2CPy/014SjYs9uX5oRuINIhwq9KG5cs14sDRhYbrR3Blj15GwebxEAzzaMXuRdIqEQ6yXs/H84VfYoaYB6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763907583; c=relaxed/simple;
	bh=3VVY2nOIMpKNNitNmhyqg8YYAZHr3dvXPu6jT7eYECc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AOmx0wirYxewAVDIjsZplJOcyp2LnbdtQo+YmiqV4Yj/vTurM9CbzJLQOY0szCkDKwbDpQSr4Kq/auLd1f2Hd3AbF2WSt7gXDLj9LnEqCur1UfSwieF9IQo5rNejFUrFsIBlNesT8AjfX5hCr90bFoKsOP73Cynp3aKot50GQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwMcO+SH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wu74PFxt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANBhjU81516159
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VqN0u1CVFKlsO8nmqMaqUp
	McUlbbYdVikMjzpQ5KzHE=; b=MwMcO+SHwrTQM1sX9Y4/x8bfuyYBSE7Etti9mu
	fmk6R6BM356X2V5d+rG8zHSTEQ9p0CUQLTqYxBmSDq0kFuxE+VCKgM6afrqdSkU5
	AAk8dh1rWl9Af1bZpJYuyAt2o+QxAT8OKkj6tC4h2xYxf7MLaBbs49i6ELX740Sz
	ylmVs4qq06phXAiL0YR2oB5BIDT+1viaFc9aixeEDqnpcEHzlRWKzVg9fQRPhmAu
	VyXg7dCQDawC8Bleo1VwYKXzPkbFHXWClGJGikPMpdcsTAr2x2SiONmwpjCFwsmb
	1lrU1alH1BeIH4AzHiaKDWhJC0VEYMc6qgbpuyHH2RFI6V1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69sjg9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-299ddb0269eso46495915ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763907579; x=1764512379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VqN0u1CVFKlsO8nmqMaqUpMcUlbbYdVikMjzpQ5KzHE=;
        b=Wu74PFxtEaCxuelHjLqwDu926G1c3UVvcjXLiI50b0SUvZ3UDiOwjogf5vrxyDM7d9
         HY4TTnJntu+nLx7QaS48nwtvWFlYmnkpgOaBLqmSresijDgA8jsGuFN+5ETIx7/4xRYU
         Tx1N1pzkc1S0hrYZV7PZqzNW+DqMgoUMXTdWig2fyMN4jTYsx7ClqeWY6kmeP+gSwvy2
         9ujjjzRe0S/drcQGuOLizHS2jZJbKciMwJQUgp+n1OyOnabwFdd+1oMyc405qCTFmrTi
         Rsrih6ORCM/jEZj0eJjKWFjoeDnpUDojC7JeQfEcbco/JBOeNj/UMj+HbKn8t1vSEOQ0
         8hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763907579; x=1764512379;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqN0u1CVFKlsO8nmqMaqUpMcUlbbYdVikMjzpQ5KzHE=;
        b=ZzfyaxfzSJE0PAQ0Q4dHJjIAo7IEuDwdfF5GFKy6wJ+JCtPNgYksUH34n5YC/jUo60
         31jnxvRlqYw7T8+tNRFpBagB3P9qk24ylqhijmF7iIgVV476gq0IFvHDhbieMblSRSij
         FH2KgzjqFi2hxQe0ZZ/VjlMiK2qmeTu95l7E5bupbNG2fBm0WVfa2HBZayeEj5+o+7op
         PjYRB3RLDXkDS4hIm7cYbXfRd97YvmtbZGk5CdMaoRq9iY67K24gz5xpl4OclGVU8Lkm
         nf7/TLg9TlkjnxFBq4lAf3f6wlinNDAP1Dw2E44J7dllEy+1LDyCV5RCos61yZDQTIzN
         eOSw==
X-Gm-Message-State: AOJu0YwDq8HFoznLVur/imw6E7/oV2jyB7TWtWTsPslqb60sviAU+nmJ
	rHiSaoo3r18zub7r4HsAAy8rRxLZUdsvDpcng6PxJSwxbmBQC5FfykpVApo0psS9G49okkcoYHf
	EsiSuGSNhc4htAshFfGJr5rheKZxBDcRsYnxG1nW9xGrorXY1yh8GEdn4XLOj4s1VxLctAOcJhO
	4H
X-Gm-Gg: ASbGnctPefzUYDnGE75FG0EQyikLhGvKIMR1w6mtaW1kMSBpDRRmk/wvDI8ZD4cAxBD
	Lztb7FWFTQWBmv2jSc2fv1Mjv5uZ+GVB5WtgYUN/pn+DiS1+XMZqXlAMgU3f6LPKtacRvoZY2Pw
	+MuHdVirF2CGCxdlre0X+VHzI5YIJ0akkxT4/YkNzoEhUUMxx8CpHXNjTt0jAuSlb+lS8+oxvJ9
	qNLfN0l/BvhZljW/zKHKGVQz/rEWCtktpIHXcypBJgVIb9NZ/d5axDHTVKK8pnKeNh9udQTqNiI
	pDFqUTQJVqi4jSYKXetrs1C5ZOizGnzZ7D2pMe+YjTNyyjpslSvEjFzil7zMRAHq893DgjvNByE
	n96om2XMEfvYg8MiYmnZuB1yFLMogkF1kdY9Z9UzoMf9QPw==
X-Received: by 2002:a17:903:3c48:b0:268:cc5:5e4e with SMTP id d9443c01a7336-29b6be930b7mr98676275ad.1.1763907579343;
        Sun, 23 Nov 2025 06:19:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkHQutTxoo0yOyDDYqwNiJDf2q4ngLzBpxueepufo1bHsKJPyYk03F68uMpj1OC70RFU7v8w==
X-Received: by 2002:a17:903:3c48:b0:268:cc5:5e4e with SMTP id d9443c01a7336-29b6be930b7mr98676085ad.1.1763907578814;
        Sun, 23 Nov 2025 06:19:38 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af0ca952sm10135992a91.0.2025.11.23.06.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 06:19:38 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v9 0/3] SCM: Support latest version of waitq-aware firmware
Date: Sun, 23 Nov 2025 19:49:29 +0530
Message-Id: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPEXI2kC/23OwY6DIBSF4VdpWBcDKGBn1feYTAwg1puITAFpm
 8Z3LzrJbNrlWdzv/k8UbQAb0dfhiYLNEMHPZZyOB2RGNV8shr5sxAjjhDGJ3TIl6G4K0rWLxmG
 uB8KblmipKSpXv8EOcN/F75+yh+AdTmOwaneMzzZUVNZENkzUsrpAqq4LmG4p/yYw43lbMJvKe
 LeBI8Tkw2MvzGJj/2Iaxt9issAEG61ao7gSPanPPsbCq6lgbhe3ptz+M5QS9s60hekltVbqU60
 F+8Cs6/oCHg9cmz0BAAA=
X-Change-ID: 20250227-multi_waitq_scm-5bf05480b7b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763907576; l=4678;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3VVY2nOIMpKNNitNmhyqg8YYAZHr3dvXPu6jT7eYECc=;
 b=QJZHrD2oxkd60QL6eu/28P8nRcQYWITQWlmTRtFDv+nlMyEkhYVJnjHzuazgShxQJ+5BpVnE9
 Hm6jKRx8sZpAoTirI2yKIgt9XilWS3Mom8lA+4Ofkbr3lGWJ8+nY+RD
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=PNMCOPqC c=1 sm=1 tr=0 ts=692317fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=2Aqlhn102uXVFFBPaCcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z056s7Fb_p0fh6oZqd5MnC_RrLdhe0dc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIzMDEyOSBTYWx0ZWRfX4WOmeYyEgl42
 +gekV/II3Em1QhjmLkXPtEdG/xIe6xMo5nTt7Wkh/yRo3gaDaszsdgkIqjtK5Hmz+ax/76SxhOR
 udgGql0oyan9+jxe545tOs8P84CAxJrP6X8qARE5liPhTvgwrPQugqDFojQ8chH2s9U4MV+nmro
 MJ4deOhRN/mFBE6rkSupq3QRLrHiZ9FRkx+ZYXPQsNfvJiiiry7f0nv1fbL4nIZ5H85p+UAXx4B
 UvkHF0CYEDwmWtli0xAWpu8tqyi6SFcBUu2VqO7qJc2Nn/znGpFeeIcVqxXTGAJKYed2pQOQl/Q
 2vQpvhS73YrT2zNOVxIq1CJaYNTChETwPmQsaouYegRWTKOxvYFAtNFCsxO6Eu4R3VW5MB1+lr6
 dpukiHbRn6PPvdBScJlh5w+KTNWfNg==
X-Proofpoint-GUID: z056s7Fb_p0fh6oZqd5MnC_RrLdhe0dc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511230129

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

Thanks to Unnathi for bringing the path to this level of maturity.
P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of
these patches.
Thanks Guru!

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

---
Changes in v9:
By Bart
- Updated commit text for wait_for_completion_state(..., TASK_IDLE).
- Changed variable name of waitq to waitq_comps, to align to its usage.
Others changes
- Move the scm call to get the waitq_count after the clock and memory related
  init in qcom_scm_probe.
- Link to v8: https://lore.kernel.org/r/20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com

Changes in v8:
- Replace "of_node_to_fwnode" with "of_fwnode_handle to align
  with current kernel version.
- Add NULL check for parent_irq_node in function qcom_scm_get_waitq_irq.
- Change declaration of qcom_scm_get_waitq_irq and pass qcom_scm pointer.
- Set the scm->wq_cnt to one, in case where waitqueue is not
  supported by firmware and continue to probe the qcom_scm driver.
- Link to v7: https://lore.kernel.org/all/20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com/

Changes in v7:
- Assume failing scm call to mean WAITQ_GET_INFO is not supported on target
  as qcom_scm_is_call_available() is handled in Qualcomm firmware's TZ (EL3),
  which doesn’t implement WAITQ_GET_INFO, and therefore always returns 0.
- Link to v6: https://lore.kernel.org/r/20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com

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
      firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()

 drivers/firmware/qcom/qcom_scm.c | 130 +++++++++++++++++++++++++++++++++------
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 112 insertions(+), 19 deletions(-)
---
base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
change-id: 20250227-multi_waitq_scm-5bf05480b7b1

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


