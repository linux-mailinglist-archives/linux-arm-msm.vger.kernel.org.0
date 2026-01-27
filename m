Return-Path: <linux-arm-msm+bounces-90657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JN3C9ZmeGnTpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:18:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15D90AD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9A4630137B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB6832AAAD;
	Tue, 27 Jan 2026 07:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZ/5uHWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCfsEM3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68FC2D1F7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498320; cv=none; b=u111dJD37LaId30nwX1RCIxQBqKjGuHQlGPHVqWpep8CmqQMlbjhhZMl4JQt/Xwjtw8xCwSf2QH9noSYx6vsPKat96Ds3AouSPA7vGgIGsGEGTt5w3LNC2PysBjFhYw55qXR8ylXT4ACh+whCQloAqNRA5ew8v07uRa1CvkxAO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498320; c=relaxed/simple;
	bh=nPIjFJWEz6cbYOAQ8erioipFaVgTTlFMfXePTF1j7ac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qU3JE0jukmWCbn1243LcpAMKXkKBOPyhP1V5dE+ZpSlAQx9Kq1l6a8DyuYfio2EYbKTGi/9VO9D+5lZ7C/tiSCoUaMKVfaiyhvJcy5HqZJHY+YCu8PWzcIUzbWQ2cAh5u30ut5opQz8VZh4699XwyPkfRTletnW/KZ7keNJq3tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZ/5uHWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCfsEM3j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UBYp495941
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IWEnM0YBbjg+b3mhL88lQZ
	NqYkOm6EFF+BuRi3TqvyA=; b=CZ/5uHWuykzpaSqRT3qLqAPcmZawWAKCkCi/vX
	6zofSG7KuZdNBzrmk5L/w+lSRzmNbkbe2vMPhoIuJdNRyX+ahDVDE2xupXdDpthx
	tKUDU7Gtz+LSYGX6Tfff3PDvGZUzcOD42HISIa2KgBLFAhYZKZ3yRF+yhGZs1KMA
	u5Mr7GyayRfHYKy5N4EZSVAOGebbnsQhL1hTD70qKFfNh79RN4HIjzV9i5uJAor9
	J3K3C4rSVve8iEJ8mfByGrxdiysvSFxdhM8O9b4RGbor6I951g5hFSYGuhQVAk4M
	Msw41r9sD/kOqAg07PsrhyPKSv5CiDHti59SgCt49u0sZ7GQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bhnqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:18:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6353so53685985ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769498317; x=1770103117; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWEnM0YBbjg+b3mhL88lQZNqYkOm6EFF+BuRi3TqvyA=;
        b=bCfsEM3jR0emyVyLMGkzKHVy8iPIOvShY5WZIHVbAVJ3fCURt3WLpGHY6gnwrxEMrX
         Jw1mraBMsmXsTSWpcjTbzAdBFp7GOXrPcfxILVM1jCRyWrDgXapr1GsqxsD5yBk0TBsj
         OKmBN8aOx+0k7X1CJnC8iBgAItaVueQ0F9zk61PSZrDwhSJdnTo+LTVbVzTvO7eJvqHI
         TJFqFLGgR1fyrDoabrtl48Bs63vVwFtdu45oZlNYUnLkaWKTSkuNufgIU0/KfloA7BvS
         XexczFvYk6xiYrDVK8tavPNgz1zIhtTOVU9JN5wzSilY3WIKd+R+DtwJ7mbujXmZscI0
         hMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498317; x=1770103117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWEnM0YBbjg+b3mhL88lQZNqYkOm6EFF+BuRi3TqvyA=;
        b=RtoSyruTZ1OMsJmTPp4nm6UwdEn+GG+/1SDuJ+TvoNM5D6X4kKKbFbwLenuNTFObl/
         812+GJ+08W/WlTmk4U1fzSd9rfTfnjSVk80w0lmpP64XzNQx5RaFogpQDGBOhoLxN0OU
         b20ST0hu0IYMQq/prBfmXLIPy6WYsxuz56X+xDXhYX4gXp2B5CV0/bqJLipeDI7ysMDS
         YTNi4akmkm+s1QoxvALAHymaSLltEO8lXOHp7ROu8uVdZMhUO5Gi1oh97bM8H0C+VH6C
         3svNsYBW1hjXOrPPpEJ9JfVxAe+FtsewSMUmHOcKJHWRVlV0mKKn0Bi4GjYxA/QSLjHB
         4X5w==
X-Forwarded-Encrypted: i=1; AJvYcCUZDWktIxDR2UrL8zCFdN5swJV3iVhTx2JEt/2GGABioiHTd39NpZ5zeY7o6fGLoPWCZgcQd2LJjdgRMisc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbl5/I/7Ie1VgtnHNU14rfLs7ahTMAlOJbWMvWBGDIExOujOog
	jdc8rjAPB+G1kMDgyl1fTTplh5MCrN4qGl+NAGzX+cClZp9majwOLRx2DClLWZCiAPl3M4ztp30
	1xoVfyT+UlYRqiYlRob1TUc9OtAUHfPrzYDlF+i5NPawg7K5yELohPz1vErwfATT+MODt
X-Gm-Gg: AZuq6aJeVPCsHywbDryLDBhg4sRE1zQnWuSMGDiGdW2CjCEWaExIpk1PksRqvU6nDcX
	XlOOD8OtDBEIDEqGPUVypVjZsIRUD5p/SrCh2VM6qDY948o5acPpwTBDCPQbzrv5PoMLaN2igD0
	VKqtXZXcwAlBLU03Gwc6bNDcvyr6uTAd8fVWcRn+LTk9KO02tl8EVXminJFSsLpIZzcH1bQyB75
	TJD9s67whXsVHIDXr2Ruq1CYXX8uPBcG9qDoYd8/VA8IDLrVEUtYt10EypfI7FAk8yYzHqNTp6a
	wYPwmjz5dnJK59kRIs5xRWE8SRsNtf6lSdOLbWoBpuPtmtP+OYxIB4x9Uc/jWVPcUvJEoq/L0/B
	cbecfeWspK1n3CtGRytFKsqa+yr+FhFOnmw==
X-Received: by 2002:a17:903:ac7:b0:2a0:c1e4:e25 with SMTP id d9443c01a7336-2a870e8d1e3mr9505725ad.54.1769498316971;
        Mon, 26 Jan 2026 23:18:36 -0800 (PST)
X-Received: by 2002:a17:903:ac7:b0:2a0:c1e4:e25 with SMTP id d9443c01a7336-2a870e8d1e3mr9505515ad.54.1769498316443;
        Mon, 26 Jan 2026 23:18:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a817f21707sm88084525ad.28.2026.01.26.23.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:18:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
Date: Tue, 27 Jan 2026 12:45:48 +0530
Message-Id: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACRmeGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMT3fScytzSovj0gtLkZN1Uc5O0NFOj5DRDYwsloJaCotS0zAqwcdG
 xtbUAWOuIlV4AAAA=
X-Change-ID: 20260124-glymur_gpucc-e74ff52cf138
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: i4OLv3MvSo_OyZvBZgvgM2d3XpDKb47h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA1OCBTYWx0ZWRfXwRbe5c7TcPuE
 yJjPYZqyFDorpCSeW9kedEV/E3iZl44dB/Sisng4q9vFIRA3xtGSEYJ9mLUCJ6yMpFHqQzVpRGa
 zTWSchVMfuSDFnuI198eVtkw863ESH7Ovf9ax52FfvF7t3ln1GBm2Duq95trNbAf1pqDJbZzkkJ
 flAPEhfKo+aQCePjwk62PEYZRupJnZH9ReHNICanGu9/SL584bbhkVSSiLjwiwuv7Bf0Iw3Xogz
 HpNlVoe3UnIO5uSUedm9qWjrtjqZYQOHJDzpGoknownwkXRH6TmT83oakiwegdA4KkCtxUf2+K8
 UR1qCZAOBdPfkfB2mzu9UKQvKEe1TXsT9km+kRMDvDCM7vMGrYEOe9ZYuLaqP06LUDLZvc8NDTn
 fDZ9aALtUJrF0hgiVDY52kQjCDnGCTvmTxKLAxbWmLdEqViwOS1DUsx9CJ7jktamjItAmEwKknf
 nsiwQnD8FeTi9rzceuw==
X-Proofpoint-GUID: i4OLv3MvSo_OyZvBZgvgM2d3XpDKb47h
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=697866cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8BAK5ul3PV33nhPFZ3EA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90657-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC15D90AD1
X-Rspamd-Action: no action

Support the graphics clock controller for Glymur for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

The Graphics GX clock controller is a reuse of the Kaanapali SW driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: document the Glymur GPU Clock Controller
      clk: qcom: Add support for GPUCC and GXCLK for Glymur

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   4 +-
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-glymur.c                    | 619 +++++++++++++++++++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   1 +
 include/dt-bindings/clock/qcom,glymur-gpucc.h      |  51 ++
 7 files changed, 685 insertions(+), 1 deletion(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260124-glymur_gpucc-e74ff52cf138

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


