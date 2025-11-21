Return-Path: <linux-arm-msm+bounces-82806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 12037C789E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 20CB135E999
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EC3346FA0;
	Fri, 21 Nov 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4M/xzHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kf2fEQXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8084346E51
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722890; cv=none; b=nVw+vS1D9a49s5dw3BolUzWuB4ywkdqWdMtMgIFsN5SJ8Yjz8v1O2eGsz+tWKzlgHF+zHPWB2F5KnQIEblxwCbeGdRt/c1Sr9BnUTqk81DX4DdaT5Q9IwAolc6qyzHbG/ZG4MtaWwXSCRYp9vHEOVMbqW0qWp+PvuRZAy4y01oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722890; c=relaxed/simple;
	bh=0syRGPa2tBhcuS8yaBU/aDfg/wqrjnmb4AHTzhL5kAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MlQXII4nHeo14ne88B1WIPsPFJqCkB2BdiQdKWxcR2gQrY97rqbgt6sIHnW8i9IDljD4yQXXqQJVXhktaSVGIpZ2meQHRKOsFlxoBR/gaDTR1zAAqISibyNzSjJHreLqRgUzSqrmFWtYrAlFrdwDn2XBEVSjBpw8I2rIuAWFBMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4M/xzHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kf2fEQXn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL53Gvs3007981
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6/NtCfE4eOOvvl6/BrqIrA
	5GDBEKituqahdRPxRKqTg=; b=V4M/xzHN7LMYwrqx2sYjXRcYvDaAMttc4AiyYr
	HQ/ayfnliBUiHMZq/GaQYIDyCjRmc6VYlatzqGE9Ufgpsois1bZjYm8F1jyOfj4z
	hUCF9RQN/j0sKsmFNAg/ESiLOIvt8mryZUcjxEfYXI2Na6Hz6MEatiXIHUabbLs0
	+6mzxLMDzQ3miiSBpcCmCb2mwzuQXc4eCoLOkuAlxz8mQ+1ON0Zo+VhjjPEFM4CC
	Wp90Skm/XKX2VoDU65vgZJIauAkML0ub1LgL0YaZvRcAgBFM1BkDN8HGXHs9RVkG
	a/my0Pb+HXcVJhGv7kccJL74zIEf9bS8sCgQo+TwZ7qRtgaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkf15pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-342701608e2so2218253a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722884; x=1764327684; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/NtCfE4eOOvvl6/BrqIrA5GDBEKituqahdRPxRKqTg=;
        b=kf2fEQXnWU4/7IaAlutXBe6RYeS075ceTxeMT4yWLN1C+qvKhxo3ElwEz6s0CK0l1K
         OAg4aMq2pXfvzI7SINuSyP38a6XBkA6xy20JBWNX/hRsS0nHZVGzQIgFjUQXX3zgZTg0
         6DHcindr+jPF7xZJJconrj5yNcCLeYadjftRo4/0tNL8l0jSA0NMbAkaDFUaHxyWuy4a
         ZWbpkMtujaWmNtuo3ZU+BWOP0VqoWDwEE5rEVOiyxEBYbzxkrBSdu2ht6DCJLw1ayUMe
         CLwqZDeTCYyTt1tDJeNVhgMr4KfkfvWYyKIwrfmYoSPdhoxAPHK7PGaZ9rGV+PgZGnWV
         /5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722884; x=1764327684;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/NtCfE4eOOvvl6/BrqIrA5GDBEKituqahdRPxRKqTg=;
        b=bq//XHOWZ0AdmML7RZwWs+mrr4LB4QXn9pvAccb4gbsxny2+oRNqFryLV8PntC8nvO
         x53DO4oCPMtba1/PQ/n+Rnrrm2jcDjRC6exfIUQwOQNFcW2qAGYcxARVN62jkBQ7pz5h
         BmzafLKoSb/zWpDU9NZ/3aIWOJRI1NcN3YSJ3mIKJhP09snPhbM3eJdmK3tH39WKDGrb
         QkYy0d+kUVeaiHbrzBHCEM6vNe4gZclnCKj5G/VyC3K51C7ulEnWzBlkelJFWOfvjGE1
         akykNJopI1/9lPybvGcXpQukeNDn3FsyeO/yIa/EY80g6HuCKSYqE1szRdUlYjJtB0ug
         xOPg==
X-Gm-Message-State: AOJu0Yz6wb0QlS14Lav0XmK+Ycsi9uaLEspf0LccvNTCJMP5nUqlGd3G
	ePx6yR10wSfgVa0Pym4ZvqG5YElBtoHv+1dPguQE4R9+3qMVTOJWrOed4sx23szLrfNkr13vRD6
	WLjE6AYlLWETf7jQ70WGz5JbiVbxweLdXvjZaIPdVArOiMewyYRtNc76gFl+aCgFjqRQi
X-Gm-Gg: ASbGncukZPM5jGJubvCJwSjC8B3LNR7LbBfbQS9BNa99nqhI/Nwb6DUzLwB2G5lpbv4
	8cUdqFHFbrCrwCR/NY4SQKmd9TswjUNMd/BhB+QcImaz2W7mMGWzX/c7FchlfSv1CP4GHfgzlEf
	c6rdjQUzIOkvbP0+hJHjROnq2BuEHq8ZDVDIdjTeKUZ5YunVvhSKQF4dBvwlokCegMfpyuGyj9N
	3xiS9mzS59X0l/6gk0i+Pu7KAMoPXENrU4FyQq32dGdwEF8DQ1BnYixPZIlozcOycl6MbC+t4cS
	mcmDeWjhqMCmqUTRKDtznGZ7MTdaBlXtarQGsHxzOL8UMhKNQoDevEBrZIwjgrvyyRlveUAvEyj
	gNveUxR2/Ce3MswK5f/HnlnssUIGUeK4Qx4dQ
X-Received: by 2002:a17:90b:3d92:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-34733e5d7c0mr2347748a91.16.1763722884157;
        Fri, 21 Nov 2025 03:01:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4EKY7MSLgTkKfk25ptNCqYPzEjYm4XjjCzOGQMz/G9K8eq3yeBgARKx61LheDDQVki2IjnA==
X-Received: by 2002:a17:90b:3d92:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-34733e5d7c0mr2347641a91.16.1763722883371;
        Fri, 21 Nov 2025 03:01:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:22 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm SoCs
 running Linux host at EL2
Date: Fri, 21 Nov 2025 16:31:02 +0530
Message-Id: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG9GIGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHQUlJIzE
 vPSU3UzU4B8JSMDI1NDQyND3eyy3PiigqL85PgyC11TM0MLAwMDYyPDtCQloJaCotS0zAqwcdG
 xtbUA1ZI0kV4AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=8178;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=0syRGPa2tBhcuS8yaBU/aDfg/wqrjnmb4AHTzhL5kAE=;
 b=13xomvLMM8Px5pPBQJF63HgN2TCM+0VNqn+YENmhtiSnnH1NXyS8tgC61kaN6e/UDH+OXVbg2
 5fdTFsCgBvvC0SIWDFLKMD0Lmy1fE3Uv95T9TGgnDlM5Jh5qw67ZnxE
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: nJMewmRg7BaXr_DpVh_jSw5_nmD9xGIE
X-Authority-Analysis: v=2.4 cv=ApPjHe9P c=1 sm=1 tr=0 ts=69204685 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=xSRJaIKPBtGH_lneNy8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nJMewmRg7BaXr_DpVh_jSw5_nmD9xGIE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX8TaEXrqRSWay
 i4UYBGBx8Oi+4wDEpeyBmYD/v9bZ9HOIO0ShuTGF9s7BX2i9COc25i8MxxjkTXPWO9kVPKq7ZYU
 g1oaUnKeTXNMmOiGLavrdY2B+qZF9QM14Y6wJgN7DI+BIsmAce3feQlj+TpAWCXyFHOaSPQpLh/
 ywmPilImesYII8IDNcLPxP7KyAX3/egQO+uedByMEtohRUTp1sLBFItIYYUfU9mit1oWvbx9XoD
 Zj48dqV3na+xEn21tWOcH2nHteyE3d1Wp2TUNEgKkKT3SoNtsuVqAUib9QOGx1lwkZDN8s6Irvv
 dE3hYSNAq5TGHijdFbf6AfZFBSIr1S/7g7CDtq1+uuc5PFy0qyzHl3b7WkRHS3XQ/VQBbeCz565
 Uwh6+yGMoZTsQGmBPK/Hh6wFSWdcKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

In May 2025, we discussed the challenges at Linaro Connect 2025 [1] 
related to Secure PAS remoteproc enablement when Linux is running at EL2
for Qualcomm SoCs.

[1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa

Below, is the summary of the discussion.

Qualcomm is working to enable remote processors on the SA8775p SoC with
a Linux host running at EL2. In doing so, it has encountered several
challenges related to how the remoteproc framework is handled when Linux
runs at EL1.

One of the main challenges arises from differences in how IOMMU
translation is currently managed on SoCs running the Qualcomm EL2
hypervisor (QHEE), where IOMMU translation for any device is entirely
owned by the hypervisor. Additionally, the firmware for remote
processors does not contain a resource table, which would typically
include the necessary IOMMU configuration settings.

Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
Authentication Service (PAS) from TrustZone (TZ) firmware to securely
authenticate and reset remote processors via a single SMC call,
_auth_and_reset_. This call is first trapped by QHEE, which then invokes
TZ for authentication. Once authentication is complete, the call returns
to QHEE, which sets up the IOMMU translation scheme for the remote
processors and subsequently brings them out of reset. The design of the
Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
is not permitted to configure IOMMU translation for remote processors,
and only a single-stage translation is configured.

To make the remote processor bring-up (PAS) sequence
hypervisor-independent, the auth_and_reset SMC call is now handled
entirely by TZ. However, the issue of IOMMU configuration remains
unresolved, for example a scenario, when KVM host at EL2 has no
knowledge of the remote processors’ IOMMU settings.  This is being
addressed by overlaying the IOMMU properties when the SoC runs a Linux
host at EL2. SMC call is being provided from the TrustZone firmware to
retrieve the resource table for a given subsystem.

There are also remote processors such as those for video, camera, and
graphics that do not use the remoteproc framework to manage their
lifecycle. Instead, they rely on the Qualcomm PAS service to
authenticate their firmware. These processors also need to be brought
out of reset when Linux is running at EL2. The client drivers for these
processors use the MDT loader function to load and authenticate
firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
to retrieve the resource table, create a shared memory bridge
(shmbridge), and map the resources before bringing the processors out of
reset.

It is based on next-20251120 and tested on SA8775p which is now called
Lemans IOT platform and does not addresses DMA problem discussed at
[1] which is future scope of the series.

Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
 - Addressed suggestion from Stephen which was regarding commit message(9/14),
   debug log(12/14) suggestion, and return type change(4/14).
 - Added R-b tag on 10/14 .

Changes in v7: https://lore.kernel.org/lkml/20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com/
 - Addressed Bryan suggestion to modify commit message on 2/14 .
 - Repharsed commit message based on Krzysztof comment made on 1/14.
 - Addressed Konrad suggestion 
	o To remove pas metadata data structure.
	o Added his suggestion on adding retry in rsc_table SCM call.
	o Added his rephrased version of comment made in 12/14 

Changes in v6: https://lore.kernel.org/lkml/20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com/
 - Added comments made by Bryan to save some cycles and added in 2/14
   which could change patch order.
 - Renamed qcom_scm_pas_context_init to devm_qcom_scm_pas_context_init()
 - Replaced devm_kzalloc with kzalloc for output_rt in scm function as
   remoteproc framework does not usage devm_ api for resource table
   pointer which is cause mem-abort issue start/stop test.
 - Removed union usage and redundant code from qcom_scm_pas_prep_and_init_image().
   
Changes in v5: https://lore.kernel.org/lkml/20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com/
 - Replaced minitems with maxitems.
 - Addressed comments made by Bryan, Mani and Konrad.
 - Fixed some of highlighted issues in v4.
 - Added a new patch which removes qcom_mdt_pas_init() from exported
   symbol list.
 - Slight change in  v4's 5/12, so that it does use qcom_mdt_pas_load()
   directly while it should use in the commit where it gets introduced.
   Hence, reordered the patches a bit like v4 5/12 comes early before
   4/12.

Changes in v4: https://lore.kernel.org/lkml/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
 - Fixed kernel robot warning/errors.
 - Reworded some of the commit log, code comment as per suggestion from Bryan.
 - Added support of gpdsp0 and gpdsp1 and disabled iris node.
 - Add R-b tag to some of the reviewed patches.
 - Rename struct qcom_scm_pas_cxt to qcom_scm_pas_context.

Changes in v3: https://lore.kernel.org/lkml/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
 - Dropped video subsystem enablement for now, could add it in future
   or on a separate series.
 - Addressed most of the suggestion from Stephen and Bryan like some
   remoteproc code checking resource table presence or right error
   code propagation above the layer.
 - Added leman-el2 overlay file.
 - Added missed iommus binding which was missed last series.
 - Separated qcom_mdt_pas_load() patch and its usage.
 - Patch numbering got changed compared to last version

Changes in v2: https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
 - A lot has changed from the V1 and a fresh look would be preferred.
 - Removed approach where device tree contain devmem resources in
   remoteproc node.
 - SHMbridge need to created for both carveout and metadata memory
   shared to TZ in a new way.
 - Now, resource table would be given by SMC call which need to mapped
   along with carveout before triggering _auth_and_reset_.
 - IOMMU properties need to be added to firmware devices tree node when Linux
   control IOMMU.

---
Mukesh Ojha (14):
      dt-bindings: remoteproc: qcom,pas: Add iommus property
      firmware: qcom_scm: Remove redundant piece of code
      firmware: qcom_scm: Rename peripheral as pas_id
      firmware: qcom_scm: Introduce PAS context initialization helper function
      remoteproc: pas: Replace metadata context with PAS context structure
      soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
      soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
      firmware: qcom_scm: Add a prep version of auth_and_reset function
      firmware: qcom_scm: Refactor qcom_scm_pas_init_image()
      firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
      remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
      arm64: dts: qcom: Add EL2 overlay for Lemans

 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 arch/arm64/boot/dts/qcom/Makefile                  |  10 +
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  41 +++
 drivers/firmware/qcom/qcom_scm.c                   | 368 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 166 ++++++++--
 drivers/soc/qcom/mdt_loader.c                      |  42 ++-
 include/linux/firmware/qcom/qcom_scm.h             |  30 +-
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 9 files changed, 577 insertions(+), 106 deletions(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251121-kvm_rproc_v8-5618000321fb

Best regards,
-- 
-Mukesh Ojha


