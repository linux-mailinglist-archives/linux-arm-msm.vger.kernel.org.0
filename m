Return-Path: <linux-arm-msm+bounces-105183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBESINvj8WlZlAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:56:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 229224933ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 954FF3098C4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7BE3EB7F0;
	Wed, 29 Apr 2026 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oewXyfUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmFKwi6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664013EC2CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459927; cv=none; b=iGSweR3YzIzgpGqX3VNMdx/qyZutw4XjH9zV6uryVK6PVy+tDGIkSgh6JY1w+hHNKhdEcapt9QF1fkopYhLhrZURso3svx3TEcXckYMX9W70LW00Wr5W6ucPaaxg9Y3ncNqw+nnl9TED/Q4iQM4rkzWpSAbDS8nStMms6IioWQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459927; c=relaxed/simple;
	bh=EWjSijfh5YbT4XwQ+bM9xdGSiunXFV+lVP+JIiSqvGI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TD0k5PB2/321iq32vou1RuniPbjbSwGc2+eV/6eGKH7rBWHDocdrU3SUWvhz+vE6o8VkeGI/H/tNab6jB/XfDaPwsMNB0Gf1pnpytW/4PMaMCRWUiZzmDjSV66EG7R1JqvN00Y+I4WxIU1iVq5KcArW5nCyHOC8+iN5oKNyuXRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oewXyfUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmFKwi6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWT72889818
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SfuPAxswSKgB66zXlIJSMB
	HWjJ2M2YWduAKhLIqYG50=; b=oewXyfUIs1o0GxKCgjXo5uLU3FMisq/CAtQWg4
	qk5P7k9RCm8R8q5/xJO/hV+lA1UzE5T5aJ5a3dRvoe3EBvJIxYERKPGLDO8U9Fzp
	LDr5QMI0bBGFbfsx+GJvzdk1xgkAp834Y8mFFEEU4q1DtEPX9dWr8mqt3ydYVEa5
	qfM1Vs2ibWcoSVd0usbrl/TgFQ3PIuEIkr2gYCfHgF/3UumD+QWjyTRSxRcRcrbx
	YAF0SPCGbQU+gzrnySepEeur+QKAegJDPhOwXp5IPtRhZvN7P40RKuRoyBTLZjnC
	9knYdf1EeJpMqCVMSZTqqip6PhLhExl/D3kyVw1R2772cQDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqbj6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b454cac322so117654075ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459925; x=1778064725; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfuPAxswSKgB66zXlIJSMBHWjJ2M2YWduAKhLIqYG50=;
        b=YmFKwi6/BDLAQ/Hab8Uei3YEI2qdy1syuzpcGthFE3fId3BsdM4tY/+qB/Xmr9Y4jf
         rTu7XdphJE6g2wV0JE7pWZ9rOMBE1d42N1rc48ZBjXSvCUrWtVVmQdme6ztwSk38i1BG
         rWa9jfS3T9W1Ki2MDxr1Hy3Dbsc5+IxXTeZsRedeILt75gfFNPTrVkqMUS8P+cDPsbPy
         8cMU4txCNm6ggxmZpgpCwkpitWarCOKqhWljvfkcOyJ0Gu/B1dDIEzSeUn+neaGkI8mb
         dSuxAtRNYoYnUlaeEuBM+bkj0ZwqaG0o9Jw9hvCOmQyM6cbBMxm4XclvL9ekX6ZVrQYI
         iyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459925; x=1778064725;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfuPAxswSKgB66zXlIJSMBHWjJ2M2YWduAKhLIqYG50=;
        b=cz0ws2HyOn3allRgHlMkjW15roH8bOP+o+v04wmeyYHtZrBuH03gkKyySB5QRw0255
         28B5kPE2yXHGz892ytyoPfcuMNvJZ0oWNe6YD9sxc1a9Ge4opjF+QYxW/FAH/0vEYpq6
         7SbpRwicawUQXooANEo4J0DkX7FJJuJ9oJc4jx+bILAXhtcttu0nwC6Mivj/asMDeOlb
         QYUHTKDB9FdaYTXUyhFgCM1IoOGK4S/ObTJtSCyAzVwBIxeepT8g8hkAwozTXw1nH0Sn
         FfuDsArvmw6Zn6v53pmUnGepZDlJgAm6Yc8BRBSsq7lYkZ161mOi6Z2Mp+c6IVTiGC2i
         /L2g==
X-Forwarded-Encrypted: i=1; AFNElJ9HXPUDKm+c9DqYgCD88f3uO0s1M8Y/NHwTXw5HHv/nfcS8qnz8yGVJLCwGuN2bNaoUmeB0W8V10ZEVDSa/@vger.kernel.org
X-Gm-Message-State: AOJu0YwRNHtZdTChtHbAdMP88yZT5ey3bKv/a9cyOEtGgoRsVDiLy7kp
	aPYNqq1bOqFGk1UXVP1hOVE22Uy+APjXkISDpsR5pXxC6YUAcMsvypy7sKrY5YVRAvfaU3VxrAg
	lXAJA9uHfTnavpFpsp8zt5W4ytOE+B7t6iP9Xhi55aHilzfYlu7Uh9iTKtER/moUwzva6
X-Gm-Gg: AeBDietIZKMMUQUUxjVA2cbMYOLIU+BRDQRX5ag0bydq3pIkkKVvGMLwH1IjQ2KIzFC
	Si/3zF5m6/MUjQx0a5u+NG0to5K2QCSonjbruYQOmo/pu8DVT07pY4DAu6FY4ffK5O6CIG2shDZ
	iV/hozJDRZwfNozUroXp6KfboqQRanfiG53NLhclCI7r2SONG2KXF9K5T3YhYAEddpTO7O5KW1B
	UUgaDWoAtjV6guuHM1AfbyNXCGnjby/xBQpT2aIjDHhH1Jn4wFuO+aTNk7G+KVlN9tcbnA/hwck
	M3+kSfG5Unktp4kim2w5Jnh3Ai1gmaU9Z0nLuF6TBJ6zqARAvnIbBJ2SsZIIyV03GqS3l8RV+XW
	nj4hf2hUDft1LoqPbddJ7YrpZSV4CM3NuUEoaHmRxpWhcWJXQfBPABRWZIjqlWyQ=
X-Received: by 2002:a17:902:ca15:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b97c400babmr48210875ad.15.1777459925085;
        Wed, 29 Apr 2026 03:52:05 -0700 (PDT)
X-Received: by 2002:a17:902:ca15:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b97c400babmr48210525ad.15.1777459924591;
        Wed, 29 Apr 2026 03:52:04 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:04 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Add RPMCC and GCC support for the Qualcomm
 Shikra SoC
Date: Wed, 29 Apr 2026 16:21:48 +0530
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMTi8WkC/x2MSQqAMAwAvyI5G6i1CPoV8aA1rcGVBEQo/t3iZ
 WAOMwmUhEmhKxII3ax8HlmqsgC/jEck5Dk7WGMb42yLuvAqI0bvUa4902+rojWtozmEUE8Gcns
 JBX7+bz+87wdNVaWDZwAAAA==
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: k6jvuLVTvqChBVr_pXWOfH2aBZ87Rdah
X-Proofpoint-ORIG-GUID: k6jvuLVTvqChBVr_pXWOfH2aBZ87Rdah
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1e2d5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Nf7qm-7OTtRn44RyKYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX4rka7JLPwMwp
 jqd6bmUKO5zCJKqWYW9ayT8xTD4+Nd39POMWxE9UXSoILg4wl4DzEqLS68vdkCqSgewkLJPrKpw
 ztqRcSrO2XCiE3QPthiMlGdOoasFolyB+Jh1+b38c36gKr9Z9RRYKFu797+Vn8zqwgF4CpXX9ma
 qdCgCCPedsfYEUwaNPmDdSOxL7ebs3MSDL5PVfUaHKjCytvZemaZRl4jGa8XtDy5IV3bpOhzA7N
 AXjA+CXqDYtvJrebv6Ua2Z94kgYV3Mznm0X3U4hA71d5YxFVli3k+5nrfgBChM9LYqnhNUdsbaF
 IqofqZLLACK/z8WzJb8TOfhO3ePyW+Z3zn42rUAEJo7W5KVl47OpyLO4Xkj8Exm1V3wT9IUvsMT
 tpiPBGBWYN1CBqB1RGv+sZkLleQl5xNHAMU3jMzdf2J5Rgzl7zLRRyKc499raNla5L5yGjcvCKZ
 FlgWvtmdcEfUaXCohSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290109
X-Rspamd-Queue-Id: 229224933ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105183-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (5):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC
      arm64: defconfig: Enable Qualcomm Shikra SoC Global clock controller

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   63 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4428 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  259 ++
 8 files changed, 4802 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


