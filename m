Return-Path: <linux-arm-msm+bounces-85571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 172B0CC8CD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B96A30093A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE49834DCD9;
	Wed, 17 Dec 2025 16:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kp+/+/jY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAtfdtwR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB3344048
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989308; cv=none; b=DLoJJLB2mZ3zAJR/ujOXL74nOpD9x2m8XuhS5k0YYmCZSUALkTlB1Nuv9cC7lFGTOUnpFb8bO+sbea6JKJbeNsZ0AeLOTp4g4Ct+uRkwzROck0vGY4evu2rS9WI42XU0AIBdgnIS/8eDJykDUAIO0ZuhsxWJvFyAQxbjTul0hKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989308; c=relaxed/simple;
	bh=6whRdpvYkgXU65L/ybg5Lfz/5TUenJYaBYDujOwf9Ac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZHLXLtM1fgWNOjcrq3fIabk+nhWH75v+38LhMK6t68K50qa6DblG2tYGl0B3PgizEIINFRzx+5+mf+qpUb8bxVuXDLFFHe+bxssfhAABhkcU2PmrqWQRBzSMdXfXiNAm0zFtQl12yZKO3+cT7CSA/VDS85z5oVVp2GhZLReI8II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kp+/+/jY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAtfdtwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL3eI3001684
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pch0pIQPj0djI2+m+BHTlX
	ppYag/R19jTLyZZwXaOu4=; b=kp+/+/jYfcQiYX506+yBL2bclN4WpEk/WXXTvg
	jBRiAxUs8DjC/NwtFOgycXhGCFDkpQpFWxWNDmHjIt0/xYYGR0XPGL6FKTRLT1dX
	frbfBL1Z4RaUy2VEeqeuWah2mZbkyplJJMmZw2VtTlQy89m3/kVmNwhN1Xbac/bd
	H6PtlQYuWVGgB9oWrlj/njA0FP5RJ24+V3nk0JTheswc0lzE0x1UohyNU7AYGCKy
	JOfrxK+bcGwcC/MNIQuRVavv3WIkvtmOxXurS9UbvsApKYORa9p1G2Abi76q9M1p
	RWZyQITNwoVcbi6GEQlBCxAixuIP8isxS9NogLKUiyW+JHrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n332c43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f27176aa7so108566105ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989304; x=1766594104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pch0pIQPj0djI2+m+BHTlXppYag/R19jTLyZZwXaOu4=;
        b=DAtfdtwR6hf++DF9lD1zYM/BBpa1COkizam88sAYYphfD/S/vna5a9dLMHytKpna3H
         wudsIqSx7sUXDuCGXu173dAJOwkkF0wc+hmSg3QvEqRdPaRXjxpYjQOgbhP1v+bFjx0K
         dYXK4hCKR0EzaZD0xN6PTq987sGRo1jDJCJogr4EXCoKfNmSxMsnPo0Bf75dCd2sT/OQ
         IlmZtSvPCMGROVLdWf/ECwXE0tnYHlHPPODlOiG0l0n3sDaEtx6RrMAKY+c+6ktG+qS2
         /MHiaQvbp+q+IsvedlP2+yU+H0Zt7t8n9Aj0rdln//BGhDeFZ68dffs+n2ZwyopJWmEm
         FJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989304; x=1766594104;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pch0pIQPj0djI2+m+BHTlXppYag/R19jTLyZZwXaOu4=;
        b=llsmtm7pLRLo6/Zx7ReWfCzgWLqFHurNEBYgiVZg3DjHWmhiWnoUwTqxQ3QbP3O0nm
         D0DW/wyaMTfjc1cFROnhaks6GecnyKun4VLBB6nelQpzhmfx+q76PXUmfybTrfyJephx
         VmUNCdNjOK66wBhqmxj6PMe4tIXtucPsvxr7HM0DnadJRrPmWxiN1c8IdzregV58riXP
         KTwk5+OlLB6og26UqoBKo/a40kIGxaxk8C/ozxbX4OEtQUDj6fLJHMw6kJ+cEGV+Hv0s
         VScnPqX9ID7NRfcN8KdFbS+Wg3wRhF4G2bJr9jpRDqAphuW347coVRH1n/RqNuXEaUTN
         yoog==
X-Gm-Message-State: AOJu0Yx9xAokQWbEd0m1hu9CLB8ZzrOKITJL3TrMg3/G3jOAUN3Wz6Pi
	1I6cwAScBVzrPXos9O05LDB8Pvb551325B9rRgAbBKSPmL93zRB2PFC2JcemxaL3Ox4/6abrz1r
	jJg8QQOYYaAPr4rgKQMO9hKcW/U5+GM8lunzcSo9IcThrxsPET/bwxSNHs6j15WHGgmwh
X-Gm-Gg: AY/fxX7vMkOF/PQ/OsDZML7AWd7dh2PMvIznxFWVERkIjXb9ConwNuXBaRbUNmYZ8sl
	Ysn7+dWg6G0FjpHqd5gWAZH/NZSzSZRbUgiZJRiGOvjtm5A2Bzs0JnuLiPKiXd1tmkgiG7xS5Qa
	1q/X58ZcnY+xU2fHG+Sj/iuR5TB/FfXehI8bmN9ZmfuZKD8lRnkXo2g/1Elif7urutXWPNNmlqU
	5Hby8FdkOC/CHoepUzWs7406scE9LnvvakVVbOUxN4w2j+8DMvhPJ0QsGGmiqvKXsOd++CnGo2D
	7pa7ak3KRN72mwWdhGT+LRaP6RM5JUUK0azaWwprUdrVYbIlm2QKIFSEl8jzFgWG0Onr2Rfg2jR
	UPAo+ryYY7Q1V+OZyyva2S7fy3EQzRDde4Xha
X-Received: by 2002:a17:903:2cd:b0:24b:270e:56c7 with SMTP id d9443c01a7336-29f23ae3de8mr174040815ad.7.1765989304364;
        Wed, 17 Dec 2025 08:35:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXI4zMhgFVzuAic07fsft0YVuW2rVoAIsRB+tY45W2cr+G5Nv14WrtRwHGJP9VPiPt9Kf8xQ==
X-Received: by 2002:a17:903:2cd:b0:24b:270e:56c7 with SMTP id d9443c01a7336-29f23ae3de8mr174040385ad.7.1765989303544;
        Wed, 17 Dec 2025 08:35:03 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:02 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v9 00/14] Peripheral Image Loader support for Qualcomm SoCs
 running Linux host at EL2
Date: Wed, 17 Dec 2025 22:04:36 +0530
Message-Id: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJzbQmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nz3eyy3PiigqL85PgyS12DJHNTYwtzy+RkM2MloJaCotS0zAqwcdG
 xtbUA68fiEV4AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=8473;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=6whRdpvYkgXU65L/ybg5Lfz/5TUenJYaBYDujOwf9Ac=;
 b=hzW0e0c2L+zZ205ghvvymdSZ96P5pntWdeV0eT03bUSbQE3ujv34SB3o1XNr9OsBXaBKVrNGM
 DBLId04L9v6By9bhsZwCBbSfFI9tbs6guSwlBZN/1Yx1+Xiz8DzvUoT
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX3dyCB2X+m2y6
 r+zFcbASP48CebW7xvfVpaDMVeXgtIt7XEWR8xVUiGCQYdNoNYah5Pqsg/+/a6xz6Vppl/3oa65
 SqMxVliDwBmlfI0qQ1vqe+pCEkcHfQh2MFzQZhzaV9lPhfD6UdALqnqhg00dVrKrqn9vNTcT/XI
 xQtVYCeaGSQynZhCtneIIgktyFYIfzli2xqwyz4thOUAINyQZ1/L0yIx0JLzpiieUiFK8Yw9BBR
 sNsIYsN//nr29+WzlFYTcOSmF+vVc0hRjIgiNCEIVlHdZFMLnjerNzTXOCxFKK4q6pinfyk6W1x
 Al8BNJ96OVcFGOKoncCkyZdVxFHiAJ+XEyecyKCgp29/vAt29vVeBlaJp/gdfMkoOVl71iwaT3Q
 +RzAHgJU+kuGKLkXCsiFMfKPuz1Iyw==
X-Proofpoint-GUID: yQ1a-omHeFp7ydSwNuHwDmgQhadmqAzI
X-Proofpoint-ORIG-GUID: yQ1a-omHeFp7ydSwNuHwDmgQhadmqAzI
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=6942dbb9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=xSRJaIKPBtGH_lneNy8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

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

It is based on next-20251216 and tested on SA8775p which is now called
Lemans IOT platform and does not addresses DMA problem discussed at
[1] which is future scope of the series.

Changes in v9: https://lore.kernel.org/lkml/20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com/
 - Addressed comment from Bjorn and Konrad on resource table SMC call
   logic.
 - Removed comment from overlay file.
 - Changed flag has_iommu to use_tzmem.
 - Added R-b tag on some patches.

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
      firmware: qcom_scm: Introduce PAS context allocator helper function
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
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  35 ++
 drivers/firmware/qcom/qcom_scm.c                   | 379 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 165 +++++++--
 drivers/soc/qcom/mdt_loader.c                      |  42 ++-
 include/linux/firmware/qcom/qcom_scm.h             |  30 +-
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 9 files changed, 581 insertions(+), 106 deletions(-)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251217-kvm_rproc_v9-0b753879cc63

Best regards,
-- 
-Mukesh Ojha


