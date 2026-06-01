Return-Path: <linux-arm-msm+bounces-110662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJq0BT3RHWqjewkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:36:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C962413C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFC68302264E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D972370D56;
	Mon,  1 Jun 2026 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6vLvdi5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKCz+RKB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F630FF08
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338124; cv=none; b=Sl2pbqd9u4rwxyIHgfsJjmKIfNtW275xkRMOF6V6r7Z2nn6fdjKTnduZVbnns+e8WK78uR4qsCj0bJo4fcdfIoHb8QSrEmU2JqVK58qrpLyCqybJPKDyy8WoSXdwKPIN3kSIRD15JISaVfKD2M5AOYSqY6cSCjgO1CoC9AUqvwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338124; c=relaxed/simple;
	bh=+5uUPPpDGZQzFkMOIjKIP9I/2V8FyC+O6p4fPZFAVq8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M9Exb42UKI6sQY5PccJo2Hezczu1WEY+6F/7N1FWgxjHwuSN4M4XbswwSNiV2/jrEsNgraGQJwUGR5D7muYduTzo7smTGnTGyqcdX3RhlYjyEb0Ytm4+lk8qkfvuBm0YasYfdFILUzGiDuGCk84fdT0gHmiafQvIlSryxaX4UX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6vLvdi5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKCz+RKB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FMOmK144982
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HeOOU5cua7Ktk12Td4xji8
	2Gjv4e5F5KqDpxKc0nPY0=; b=n6vLvdi57kK5OcWaVMHsMxb/kzpJ7YK5St+07v
	aYDkx8yzvcTGI0NKz7n9Paqig8eu3V5aZyAcglgUbB+0DTv0qLBnU2xGbTCtyEn5
	icvt15VFrRZG68rq9SfYrNJG4vK+VTHx9wEGRGJGZYXSDx7/cXP6JWG7M8u8ySy9
	eZYJGT7N9UzbavdlZaX2AyMru1D69QOL3cKTxbfIANs4g/QDQi6DGFDuJ3I5BMQ5
	PZBP5FleQi1xjIbJdJYvmA3q3FVSxOEn1fm6TBgFKP2n5Wz3xpQt2sL7HUxg1aXb
	8ou0Kh2upUL/j3+MK9F6hbahTpa9F2QjHlKEsdmiDGE3zHkQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sttds0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:22:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b9d265308so3359548a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338121; x=1780942921; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeOOU5cua7Ktk12Td4xji82Gjv4e5F5KqDpxKc0nPY0=;
        b=AKCz+RKBfnHEDE8+3hxuH+1CAbgLlUfsd8AL5ZBT4Ewxq7RUz8asIpZkyfQRiDbrVv
         ltUwJjv5J9wapXjmT0gcUKrttlec7ZZu34+mLJw2UKdrmHp51jNNoqET8dPtQSgW5DoT
         sQBG/Mtt1zh3rWJcxZuDs0Hupvm43exJNaWfClZVQ7jqCI0rWWGg7gb7KScQn6/FAUHi
         2L+qsIJIFoFQchn/fZKvbYy6j+zRKV70zY8s2q6fGZg/hW8ttsmmMD1UaKV+6TEv7qTT
         vyKXcpVBSYtTJrU7qRR0SVcB3guCKVr5injXPf9dOBeIT3oA5RjVj/9+kMZ0pyEhXkX0
         cTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338121; x=1780942921;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeOOU5cua7Ktk12Td4xji82Gjv4e5F5KqDpxKc0nPY0=;
        b=iVvckky3zILB23xNkLgEUKPeMXKt2Hy+x2F+xS/d1qq2cWG7/XDpm4yZydPhk/i8O5
         VLQqQzBGy3heyaHfUNSJlf+VS+YQtOXqZnwmYnXvLWKU3AfuIjhCo2bE8EkQu52uXkgs
         MS8KNdVUAyUxoUpbkiS2OpNJmv/pbOI7IIoNhfojeX5ym/tSDRKzAh4Z+tdpzNBN/mPV
         XjL//0VfXk+aG/1LJCD3c4uydu6DID7G57YZ09ogBWmKvaocJaJd0DHS931rqLo9bHn8
         L00omist7OsjaspqTlgSJ7XVHYqK+rb9wCT9tnJGx+O75EVh4iQXqJLKWUu6JPuTdmTJ
         D7Rw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZRdK/Q1h9i7LLW2cojD2X0DFl4TF0KHgZ7uEk6L4ZV07bF4okFkgJeiOGkCfMjY5r8Zl1k0IMHWMWfeC0@vger.kernel.org
X-Gm-Message-State: AOJu0YzpEq9nJehHajj3fA2rPTrEgi4baN3fk916oXlNEGKhOD3Hc6CV
	slX9sJ2JakVPi88o4JI+Zcxpd4WGbTFCqFQHeXPDOAXsbsabpeuCCO5pSzMihiI3vc3Lvp3lfEA
	DjzxazsTxpv0RndWPKoD5OqaaVbbgE2n3bjyEpGgcbT0dS4en0b7zxpTds0Cbyj35u3IB
X-Gm-Gg: Acq92OFK7nb7KnrUn4EJralu/Zn1sVx14OdbF/hOEmDdSN6GNX7l1y5fo4qZSHqLlyE
	I5GIQE/iH/rjLWcITzqx5GnA+yj5p9WJyyeyWgROI2TeutGP/ZURY+D4mwJ94e545J5yVgr47lr
	rOXWxnZlotcrUzRikOVKAJp2If1VmRSOjr+kItNBhXTd1Bs3BkzSYorevP1FtDY2VUoexO0bnf7
	aDCWkkIKG5lUQMr4uloUg3oBbGl7WUDVrY0KAJ1zfW/ayyisoBhtc+bLlDwh2hTxG5/gM15wd7F
	SURyU5gDoSPPJcNXL+PpQWo3ZBUyhtx0L0tJ2JziWxk/bhkMVcS1WjAg3ScmVQkQVX53zb6Kptu
	RQ+1yRIggaPebZItbX/33o34l6XZ7G7+ik63YgVbwJUxuaod09ATZri77B1NItcE=
X-Received: by 2002:a17:90b:562b:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-36d8e49038cmr9158626a91.15.1780338121352;
        Mon, 01 Jun 2026 11:22:01 -0700 (PDT)
X-Received: by 2002:a17:90b:562b:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-36d8e49038cmr9158584a91.15.1780338120701;
        Mon, 01 Jun 2026 11:22:00 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:00 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v3 00/12] clk: qcom: Add DISPCC and GPUCC support for the
 Qualcomm Shikra SoC
Date: Mon, 01 Jun 2026 23:51:22 +0530
Message-Id: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLNHWoC/33PTW7DIBAF4KtYrEs0DD8uXvUeVReAwUaJYwdsq
 1Xkuxc7qtpF1M2THtJ8zNxJ9in6TJrqTpJfY47jtRT+UhHXm2vnaWxLJwioQDJOcx/PydA25sk
 52k1LSRWkdsgBIUhSJqfkQ/w81PePR0/+thR8fjz+2k11yAL1j9wVME1DSXc5Z4qghW9DCNxCs
 /KdtyZ76sZhiHNTaV0LrbRjAjgzoOtWWSGts7UBZa0wRqJ0Asi+SB/zPKav49qVHZv8e9jKKFA
 ZWlVzJpSx+DbmfLot5rJ/fypxsCv+ofD1OYWF0pIHLBAEa59Q27Z9A+wyRpqRAQAA
X-Change-ID: 20260513-shikra-dispcc-gpucc-6f59c23020f5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX51ED8XOrXuG9
 5e+dNa8ZnR9d7CwCZyoPy0NvG9hjc+/5DsI4vPnGbwP2TQMv+Ut/75zytB9PiYg7r6pykDxUZmJ
 mdrjGJKKD+12wvFwpo6qPH0su7sHPRdrJ9LHBOLC+EOln//C7Hc/VwAGk6qDS4nkbncfc1jobAf
 FZ7micIHeWVpfRo74fhNqFcSXAXL30ArCrxNcSaMj5+pNcQuJ4UHIfeMgbJvdP9M5zPHigyB8nG
 qDBdUt2gNhtjJHR/TntUPg+6J64WU13IEPGsJ/nBwTdi6VdPHR9XthgtaHbF0ZJGBsT1qyo267j
 rLJ8kUF1MvYUcFqUrZgl7MANt7I3MtWgdY58ojbz+CG9UiBaVKgeqycBRPOxMzmmX0BtltYsVZG
 4xxscZnlfhMkLF6il6gKx0OHmuRS8/Ts6pC8WK/C7Iwz4O+j9+JslxCecueBVeAMLpDUDZ1IXM7
 qi/qkLVofn2EO7rzaIQ==
X-Proofpoint-ORIG-GUID: cTVxYDJGUP0HIKVy-R05eLMfkWaktraJ
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1dcdca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7SD8abTaIGG2LWf2mz8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: cTVxYDJGUP0HIKVy-R05eLMfkWaktraJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110662-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F2C962413C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the Display clock controller (DISPCC) and
GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC, by reusing the
respective QCM2290 SoC drivers.

As part of this, the series extends the QCM2290 GPUCC binding ABI to
include DSI1PHY and sleep clock inputs and updates the Agatti DT
accordingly to match new bindings.

Shikra GCC series link:
- https://lore.kernel.org/linux-clk/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v3:
- Updated the QCM2290 GCC patch to use the .clk_cbcr convention
- Extended the QCM2290 GPUCC bindings to add DSI1 PHY and Sleep clocks
- Separated the patches as per the review comments in v2 series
- Added Agatti DISPCC DT node changes as per the latest bindings changes
- Link to v2: https://lore.kernel.org/r/20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com

Changes in v2:
- Dropped QCM2290 GCC critical clocks modelling to kept them ON from probe.
- Updated the QCM2290 DISPCC/GPUCC bindings to align for Shikra drivers reuse.
- Reused the QCM2290 DISPCC driver for Shikra without modernizing
  (keeping the clock-names approach) for now to avoid potential bindings ABI breakage.
- Modernized QCM2290 GPUCC driver to use commmon qcom_cc_probe() model
  and reuse for Shikra. 
- Link to v1: https://lore.kernel.org/r/20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com

---
Imran Shaik (12):
      clk: qcom: gcc-qcm2290: Keep the critical clocks always-on from probe
      dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1 PHY and sleep clocks
      dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller
      dt-bindings: clock: qcom: Add Qualcomm Shikra GPU clock controller
      clk: qcom: dispcc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: dispcc-qcm2290: Switch to DT index based clk lookup
      clk: qcom: dispcc-qcm2290: Update GDSC *wait_val values and flags
      clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
      clk: qcom: gpucc-qcm2290: Update GDSC *wait_val values and flags
      clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra
      arm64: dts: qcom: agatti: Add DSI1 PHY and sleep clocks to DISPCC node

 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |  28 +++-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   4 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |  10 +-
 drivers/clk/qcom/dispcc-qcm2290.c                  |  87 ++++++-----
 drivers/clk/qcom/gcc-qcm2290.c                     | 160 +++------------------
 drivers/clk/qcom/gpucc-qcm2290.c                   | 117 ++++++---------
 6 files changed, 149 insertions(+), 257 deletions(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260513-shikra-dispcc-gpucc-6f59c23020f5
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v3
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: 63e4153eb0a47bb23d906be97cc4ce84f9821248

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


