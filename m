Return-Path: <linux-arm-msm+bounces-85531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1598CC8390
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6616A301D30B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369E337A3D9;
	Wed, 17 Dec 2025 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz/z0kkQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewV5RaEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEEB3A4EB1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765982088; cv=none; b=NCcViX8QC245edKVZbuZ5ayRENNSxonD0R6XVaVGa7ZxougsNc0X10o1ZPv1zlccDlVRHCgr4hv5EuIqCt5DZKRWg9LdrfiwW532aWuiUJ89Nftg9NJpx7EFNj9xPPcit80D4yh7akm7QgfUpkUHYK4XbS7Bl7Inn6tdo69HclM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765982088; c=relaxed/simple;
	bh=UhOZTTz9qPv7UJ0GHlB0haTnCUt6vCEDzUda6KnoHDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=krFh3tDS3wdXgyH7C3DI6s1VPyUwJxokzz8ueoEaUxBRHNsU0v6KnFVLZrcmiP2V7Xk5XlC3cVuPcwpOPKuoJhXgq74SrVB+pO5V11EZWgdEWRdtLy1DVFLF21QMcFXaOUQbAG9g3GFa1cF5BG88Dz2sYXHMacqT1M0k0e/VTZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz/z0kkQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewV5RaEw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKx3R2042760
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=njvMGOba0VB6PNMA4N7Lva
	d+vGA0/T3/7xXkR8Vjir0=; b=bz/z0kkQkEiqwdCo/DmpLd8rZEDhzlgdOntahT
	BdWsCwHiTrpzsd6/95MsQkDDpUT9jxCcFwhOxT9qBG+fm3441/U6c2KWBj27RvUt
	KrRu4EuAd17sdAkwEfT0DD2Jz42wWcT2Ry2I4eB6raFXH/jaV++Rn2i5xCxJvQIB
	PDAwyDr2Fwjc66/WgAd4OhOs3oKQ3wH+uk4T930AF8fQZVKtPukiVtLOB8VSK2/q
	NvnG8J+EcV+5mwwwwMTtyufzdlhlrvXuzoXAKdZOlvFSoK6E17QSeCHEB7pKKJ1A
	AKtTt0nc745b17g6x0B6jaJYcySTIslt2wsGwT4GMWYwdErw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1trv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c48a76e75so8795988a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765982080; x=1766586880; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=njvMGOba0VB6PNMA4N7Lvad+vGA0/T3/7xXkR8Vjir0=;
        b=ewV5RaEw/9q+0cFasRL+aJMFcpUVfEN4BTMMaxd/CRl3sMeNcLmoGA6MNAfLYqBbLi
         bhOfZ9dCt6sHVYu6ITPbVDgkZOI8H5ucCXyPF3b11HhrXCFDpx0tQ3PGj3vPByyAgEmS
         ptzxMFTiSdi41OqRqHUxETnGRE8Sljy5nWbRQmp/f7d3QeM3ysQ85Nj/diJTZI8UP1Sr
         Z6f+bofJWeMNznIcNT7IqHh2lGHVhXAxQqOxUqHjD0Gk4tP1b6RwyTC/FFPOrH0CHTIa
         NmNh1whsHEOzP70W4Za/1fcJ93ExM8csybbyqfKRBGKWlMBbHsJIqCnTBprDwK6HevIg
         P3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765982080; x=1766586880;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njvMGOba0VB6PNMA4N7Lvad+vGA0/T3/7xXkR8Vjir0=;
        b=cSF4sYP9LyBMbhU5P/sghLVWZdAj//QtcexrjwdybFa13o3fDPQDF6hAEt6JzVe9+i
         +AMNe8HW4DVY+kIo1u5SdWSRKrYlxs/+kTZBfHjN/F2Kv1CkF9XXHGdWr7eRpQ6uf2eR
         MZF1JuhKkT7WDsQNCciikxOfctBItpmdn5sUdj+8VHbAdHKsuDSKgENIma8WfVZzDkZZ
         ZD/CCkklwL3B1P9C2SUI4n1kfK3+YWeHiuAkpS7o9RPmkRFEdHRfPCAAZN8rdDU+HbhB
         vS4etigPPfO6rIR+QE7VjBO/SC0BxHiog6o5cIJGx0xJ1oYxrn7gST4jwFWBc7fic6er
         HGWw==
X-Forwarded-Encrypted: i=1; AJvYcCWlJTL5EXl7vdZZjTflyb8Ya8CHTWLjPkelp/0Cf5dsC8Ub9+9TFcN9dp9JS8HzdSDjiRex3AuSutis9+A5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8V2VQAEdOSnpQSK4IIlGhrJB8WtHhxWC98fYGa4x8ABsZx8uw
	NOg07HCgo1WNvyXAqf6Ag95pfV+mJF5zB7OuS/CspcCoEk3M3UXI446Z7uC/uHo4EJBjk/rGClJ
	SJhpfiOqVa85b831oUb4/DC9AXhMRVri30lvc0ANGgNC5pJyuXmHt1OthwxZcQ3M5uTNzoby4bM
	EV
X-Gm-Gg: AY/fxX7ssvj2waOPIM8UhR6gICEjWkK8QbRYAhdlQY/dMGdpzS7ZEAGAz7YFIlINuq4
	OEUrtioPkuK1RWdoqPQEc6uIRLsjnDJ3z56w5SWkY14vW6Z0LU6Mzln0ndzU0QmeXhLAOcFVtsK
	3/nc91G2b5KG6ZV2yvr2UtXNPxENmGbeituhMsUwUMI2RXmJUv3XxQondxfB/TwIanudl98pXWG
	jXXRU6/dy+uI5mT//EF/6W5Sn4SajMrTB6KfnpG+hXDXjn7SEnK7wle6ZbfQFlxLNfPgvVZebCm
	cZYdT3bwBuqbYNjrkiiIkmhTdGFbdTsWm89S+NlWf9QozmL/19tTUDWaq6AVv2PYN9vuxut+SNm
	W4AudfEJbJKMFeQoyuFJ7+o3GnTRFHbh30uqVuhbfeIQ5tw==
X-Received: by 2002:a17:90b:2d8b:b0:340:5c27:a096 with SMTP id 98e67ed59e1d1-34abd6c03dfmr17060784a91.6.1765982079926;
        Wed, 17 Dec 2025 06:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGS9tHUDxWmlasAHI+NuSiDpTSBzUHhR77SODr33N/jUtk4I7ewtH1p8h/FAbNgFNJXLIqj5w==
X-Received: by 2002:a17:90b:2d8b:b0:340:5c27:a096 with SMTP id 98e67ed59e1d1-34abd6c03dfmr17060759a91.6.1765982079383;
        Wed, 17 Dec 2025 06:34:39 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cfce5eb5csm2615529a91.0.2025.12.17.06.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:34:38 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v11 0/3] SCM: Support latest version of waitq-aware
 firmware
Date: Wed, 17 Dec 2025 20:04:18 +0530
Message-Id: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGq/QmkC/3XQ0WqEMBAF0F9Z8tzIJDFG+7T/UYokMa4DarqJu
 lsW/73RQlmw+3gH5sxlHiS6gC6S99ODBLdgRD+mwNjbidhOjxdHsUkDwoFL4FzRYe4nrG8ap2s
 d7UClaUHmJRhlGElbX8G1eN/Jj8+U2+AHOnXB6d2xfnEhY0qAynkhVHbBKbvOaOs53evRduct4
 Wgz64cN7DBOPnzvFZdiY3/L5FweyiwFBWqNLq2WumhAnH2Midd9woZd3Dot5R/DGPAjUyamUcw
 5ZSphCv6CqZ4YLo5MlRiAElrLZdXkzQuGwZMj4OiwxFCpZcvTr3XO1D/Quq4/c8m2kM4BAAA=
X-Change-ID: 20250227-multi_waitq_scm-5bf05480b7b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765982076; l=5910;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=UhOZTTz9qPv7UJ0GHlB0haTnCUt6vCEDzUda6KnoHDE=;
 b=S5hKW3EW6sTF5sEZlY3UWxYXBQcW3vXBpYXGpEVsIWmNUEj+1uUKruAmShY5KJq9hh586xkMX
 YS1VTSRGObeDHpbyOyuY8aQCGVmunWhFtPcrD8RtbcLMEgXW/0GREpi
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMiBTYWx0ZWRfX7wgrl3eu1Cp3
 uuTvTwjhYSw3g0awO5xSPW4TK96Pbky5D9JaPFVFx2YU7iOgvbhcw8meeQ5L3BtEsxr/By/xvEw
 5FWH3qZqtRfyzARNoyVFx5CQRynMNx2d89s1GF3jqoGnRWAcDdTEfiD7pVD65iX8fd5RPkAJO/P
 prnMScf/N+3u0Sy2o8xImBc2fjOhCkfzKeP1fDuhF1zPXT2aSRidGQFRG8BAZsdSpHUvEPdqbXB
 /3egYIMs7SFI6Vp/KH9QonjbHtAcikCnW+cUvAexNpqYyINLrOWhBoPdiPcdHQZUIKpyfmbiKGk
 spmrD6WWnh+8LnXyBH+TmHWS1iyp6dfVyrZRvAlbNSSmZGcQgHvFlDqcjUaa/3ktQE+KqSBa8sr
 y1mFRfSyO/kwi10G5oSPJeJideJdlQ==
X-Proofpoint-ORIG-GUID: 1D59t4v3BOvLgTLYfHN2brMkymofNLMy
X-Proofpoint-GUID: 1D59t4v3BOvLgTLYfHN2brMkymofNLMy
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942bf81 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=XOwmYTm7vgc_1ZyUsUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170112

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
Changes in v11:
By Mukesh
- firmware: qcom_scm: Add API to get waitqueue IRQ info
 - Fix code alignments(line feeds/variable alignment for reverse X-mas).
- firmware: qcom_scm: Support multiple waitq contexts
 - Fix code alignment for reverse X-mas.
 - Initialize scm->wq_cnt with ternary operator, instead of an "if condition".
   - #define QCOM_SCM_DEFAULT_WAITQ_COUNT as 1, instead of hardcoding as "1".
- Link to v10: https://lore.kernel.org/r/20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com

Changes in v10:
- Keeping Reviewed-by from Bartosz
By Mukesh
-firmware: qcom_scm: Add API to get waitqueue IRQ info
 - minor update to commit text.
 - qcom_scm_fill_irq_fwspec_params(): changed name of input parameter
   from virq to hwirq.
 - qcom_scm_get_waitq_irq – declared variables in reverse xmas.
 - qcom_scm_get_waitq_irq - return irq_create_fwspec_mapping directly
   instead of storing return value for return.
firmware: qcom_scm: Support multiple waitq contexts
 - remove error prints form qcom_scm_query_waitq_count.
 - Use `ret < 0` instead of `ret <= 0` to set waitq count as 1.
- Link to v9: https://lore.kernel.org/r/20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com

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

 drivers/firmware/qcom/qcom_scm.c | 126 +++++++++++++++++++++++++++++++++------
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 108 insertions(+), 19 deletions(-)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20250227-multi_waitq_scm-5bf05480b7b1

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


