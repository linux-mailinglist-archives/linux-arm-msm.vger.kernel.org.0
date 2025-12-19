Return-Path: <linux-arm-msm+bounces-85759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2FCCCE52E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D1753025596
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 03:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159A12253FC;
	Fri, 19 Dec 2025 03:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1pTO8CY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UoHEp2b7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239481DF261
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113825; cv=none; b=gkJmZaPsPxwTyEvFItFEM2Pp78cDfKG3kt7wdUFeMkGNPJ9YIwECgBDb72cR9k3HyqsTLvdxGM/do3y5APE6jCTx9KZUdDPew0N/Z4uqeW5ILyBiu5n10n1lQM4+5TQFsBf+ncBvc15ZScxQpf7S0JEQloQsCVBhwb3WMsg55P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113825; c=relaxed/simple;
	bh=Fr1LzX0Y3VxXOcZLaJ7RI2vKCgxIDkqz6hihUNJ4bjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hR+EuVAbCJ38XXf80eP/gkD+6Kbee8QKWAJLjXmRUeTwZUSD0t6i+O+dpb9277H0T0sXouJ673w4seIr1u6o6+aMaVLheovCyfmDhNanmwovR5ieqMM2yVhirtoX8VXy/796AHsmIMBd8THGbaA8fmqv/0X1htHTtPZDuC1vLBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1pTO8CY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UoHEp2b7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2Nr1B3712816
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q6XnKlh7fprgD9XWqEkUH3vrY9JQMUOXG98
	+6mRu5lM=; b=S1pTO8CYU2uRzzLd05HQGEBIS7FcyiXUdM9IH/f6caeGoiiNnDj
	ri0WE7vcQwwz0OqWvrNCVmXvAAepu4sAPjCmL6+RKqUL7z+2GsbA4WhkpfcDq8Mz
	qntPAKQdZrOCIOUrbSi/GDUyDAypIhjqztzbhUqQb/eeXA6HwDXTS/niL10eUaSy
	PpZTZ72LPGj3P8/34NGDUHWUtn7Y4HFeZDhA6iF52gsqIBccsy8T+2vHY59d1Kqg
	lbgVYlybG+fM97eAfA1lArvjJXXqS86GPqMafsjDM3bXwAVp1J/Yf3w6SXKv91Bu
	u8MEXGJjAyZTEg3lbDXoWDaDyhul5VkZUrA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29h0nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso2109588a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 19:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766113821; x=1766718621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6XnKlh7fprgD9XWqEkUH3vrY9JQMUOXG98+6mRu5lM=;
        b=UoHEp2b7qdtpfSaIL9clVUHxxrzs/W1+WHY8jOIA4i6rLFy5mteQWNmX6aBQEh/ecm
         KrrEzAyzXOvnDAS+E4Tqk92ngQi52iIxqtH52Arav+26zoL2BKZ91psS/5ic7Y9hzRMW
         Cov1SXXC934oSawyfFa5kq3e52WzSVeE0Cb35lr2qDg1IhFqw/ICosO0jyv77DcoRmzl
         yqTrbd+P2nFLuG6NX0Dttaxk5lFUFijNLn18njRpU58lCYQOM3lXUj7tVaipmKIjLCC9
         0LPFjQ7BXyf7VT//qykNIDMtTP8OOsWArCDk66pMde8yAbt6rV5dU/1eneEJ4+2eqU8A
         Ra0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766113821; x=1766718621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6XnKlh7fprgD9XWqEkUH3vrY9JQMUOXG98+6mRu5lM=;
        b=CUC0W5AyKj7VfZUrsqFXdjZL77aBEkCftAB4a+VxGw7qYaGAEbjuEuyq1wTopLl6Ok
         oEXtzV24lb+lCBlCpZUUb631ftn5n9ge91CXvaJydwXIH74tSWbDBEbKSZZrgZsxSvWb
         nYVGXBqa2/IzoRx92+HyCTWdfpyrM0q7YKs3K2+cV4J8c0z6WVim2gzTSy3r3a3Wyy4w
         YylPYKAhsYfBPyD/QAHzMgLzeWpzVDnGwnaB7jdjrTh8Pm6tCPWw1XENplqd6S0DDnFY
         xoyioAMJ7N+eBEtyQTjk7PljXN5nfPHYVdtm5MkbxcvdlFafVBJ+1iYTF6OIXvf24K7Y
         iCvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAMMe+3JTN6LLWx9+LgG5Gr4zZqOub8SXxsw03SrHNlugOxBVInIETujFCUsNUidaBo03V2N/bKuPiDmP0@vger.kernel.org
X-Gm-Message-State: AOJu0YxkDv2nu0Jb/0YO55G/8H/3/v2QYFiMhsn7CTuS5Z4ySHQhkxAq
	qpYM8C/6+Zul5BisgAEkinrmdEVUF1G5fAEFjWnYivCFzFWZCqoq4BYcQ5rBBqpZ7HLVbakQ+1u
	8sOy7nPzHZ4ziOeQgHDWuTZxCUqz9VEhTeKPoqjs7e0Xr9d+6HMfpijmAJwOsxrG7FHUGJMpivi
	7l
X-Gm-Gg: AY/fxX6Tz/FYvjz7ED1fqm+URD8mO7BdREGLsQTzpcCICxOPVY0Hm7kzgCyM/aaAnDI
	MwuiK0QlWK8fvbTwLQEZVfkkcE+FmDHKQFEtHBC1w3bHeA7a/CzIqqrsucame0pg/Xc7FD0jX6L
	sIBZSeWehmCJFGwvUG+6yJMaG1uxXyUFb+kqfoEYpWUVtHLEaGIyToyBuBOR0B95ODtSRT65zq0
	z+ZswfEK9YYdQpuu9dLwChzVL77k94D0q5Iy39/rxQOhcXIqvkhX50lMp3AJ/5p0jNAUwIlIg9v
	R5ZLZS5KiV5xj4s72YOWvbiRVSnsEOeJS35HlO5FYzXJL4v+S1AVymysiac8U9qMDSw2etD8X5U
	G3WYWEK/lF5qYbjLvFaLAoZ1evCx6Bbp2zDWw5rHbBbcngn7MOy4XPYNljdyIXtjLbtnD+X0J1w
	7usV5VMXVxlN7a9DDZ5omVTMvurD/q5Pjv2xZUE20=
X-Received: by 2002:a17:90a:c888:b0:34c:c514:ee1f with SMTP id 98e67ed59e1d1-34e9213520dmr1286707a91.11.1766113821308;
        Thu, 18 Dec 2025 19:10:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFydHdjxKOAO93ZfgWdga5dIebj3azibAMKJ6K+VFdkQotHYrI4sfXHsRWDSQ75SArYL/JY8g==
X-Received: by 2002:a17:90a:c888:b0:34c:c514:ee1f with SMTP id 98e67ed59e1d1-34e9213520dmr1286678a91.11.1766113820781;
        Thu, 18 Dec 2025 19:10:20 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm3737867a91.7.2025.12.18.19.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:10:20 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v8 0/6] Add new driver for WCSS secure PIL loading
Date: Fri, 19 Dec 2025 08:40:04 +0530
Message-Id: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=6944c21e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=YkzghYrSwcqXcAWZ1OIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: CHtdLfP9ZCBE052EzMvdwljoS59C4htR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyNCBTYWx0ZWRfXxR378g+NLT+G
 5zf/iL7E8Vd7Pe9+0Sb7jITiF2ZWclkQeEoZnKZbdzFdO0SJqZsggbNKm5e5/yV4NbRyPH0/F7b
 FZoBKcQ7cDxA2LLEyLfs6Xv50Sl++RwRnsDfAyUFYHZjSZ0waY7P/BdGYfr3Ie5NG9Q0+wsBmAN
 HwDiNJDFD3KmjQhqJ2KS3SUNoFyu/syn4jPjFDkdQUcTlkVN8uVjnZY6ch964gfRBEcxBpsm744
 IkmWTqvx0Y3bbRFLPyPZpWwW/ekyJivFwSjFHOq9r9EQWqF59IVjX8e7PVez5fmfFpRzhyk8MTc
 xPZdiA6Xt0KkQJbiIvOp+ioj3haVeoM8rt+FepvJu3IcKssOYBibAB/u+SaPUjOR/ffuz5Fm516
 dzYjxF7kadX14A2Mev4JDyfoPSukSQKiLBSwLT4vhrM743f29ifvPyieLOK7jsTLOBR+sf+mDDV
 wLMrdXUJf0QV6f5dROw==
X-Proofpoint-GUID: CHtdLfP9ZCBE052EzMvdwljoS59C4htR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190024

As discussed in [4] posting this series after dropping IPQ5424 support
to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].

Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.

Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
I've resumed Gokul's work as the last submission dates back April 2025.

- Secure PIL is signed, firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

[4]
https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/

Changes in v8:
	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
		* IPQ5018 support added in v6
		* IPQ5424 support dropped in v8
		* Updated to use IPQ9574 as example
	- dt-bindings-check and dtbs-check passed
	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
	- Dropped changes to ipq5424.dtsi
	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/

Changes in v7:
	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
	- correctly sorted smp2p-wcss nodes in dtsi files
	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com

Changes in v6:
	- added patch to fix IPC register offset for ipq5424
	- changed phandle description for mboxes property in dt-bindings
	- updated bindings to define the right clocks per SoC based on
	  compatible. Ran make dt_binding_check for validation of all
	  SoCs
	- use of more descriptive match data property (use_tmelcom) and
	  added a condition in wcss_start to not error out if tmelcom
	  isn't used
	- mitigated potential off-by-one
	- adopted use of of_reserved_mem_region_to_resource to acquire
	  memory-region resource
	- added driver support for ipq5018 SoC
	- corrected size of reg properties as per Konrad's comments
	- added patch to bring up Q6 in ipq5018 dtsi
	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com

Changes in v5:
	- retained all the patches as in v3 and addressed comments in
	  v3.
	- reverted changes to dt-bindings done in v4 and retained as in
	  v3 and fixed firmware format from .mdt to .mbn and retained
	  reviewed-by.
	- dropped 2 patches in v4 that adds support for q6 dtb loading.
	  Will post them as a new series.

	Following tests were done:
	- checkpatch
	- dt_binding_check and dtbs_check
	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com

Changes in v4:
        - changed q6 firmware image format from .mdt to .mbn
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c
        - added scm call to get board machid
        - added support for q6 dtb loading with support for additional
          reserved memory for q6 dtb in .mbn format
        - updated dt-bindings to include new dts entry qcom,q6-dtb-info
          and additional item in memory-region for q6 dtb region.
        - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
          Kconfig
        - removed unwanted header files in qcom_q6v5_wcss_sec.c
        - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
        - added required check for using tmelcom, if available. Enabled
          fallback to scm based authentication, if tmelcom is unavailable.
        - added necessary padding for 8digt hex address in dts
	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

Changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.
	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com

Changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof
	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com

George Moussalem (1):
  arm64: dts: qcom: ipq5018: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bring up q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,wcss-sec-pil.yaml         | 172 +++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
 drivers/firmware/qcom/qcom_scm.c              |  17 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 328 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 722 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c


base-commit: ff7278c6e337027671acae5991dfaa5828ee3cce
-- 
2.34.1


