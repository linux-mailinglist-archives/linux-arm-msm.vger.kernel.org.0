Return-Path: <linux-arm-msm+bounces-81579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB62C56E2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFD573B5624
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D57B2F290E;
	Thu, 13 Nov 2025 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NutMs7pc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gxc8Gd4t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8523254AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030175; cv=none; b=NSudHw95h9KFM8C5xcDjRu3eAr73oepjGaNQYCHhV9nRe/uZCAnGUTyPPO4FbG+y3SE8/WfaVD8vLLAwXZ40VyEXT3HKkCh6qRjvztgN2bqV/pOWUXVHSB3xnIcKy3qnoCE4xNEilBXxeMPnLCShOJEbjgFsI4BsruPB3ONMc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030175; c=relaxed/simple;
	bh=J9Kvjq2rIOiPb/NK/Kg/3r1NbJDYRhS5PvrxVGHQRv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=onLuSJEfZUIjuklkBsf95JfCk7rlIV78OH+sNIXDSbY5rSrm9gqGZaQ/cpJ+6flSBt1/+FbGTIuFr/ZY8IyfdkHtue+DOTbiy2mcohreft+wOLC4fbFGzZiTL30OVppw8oV5lrvssDseA20rJXAbLjFX4lAhamqaV0gF0Oz9+Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NutMs7pc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gxc8Gd4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8v3ow2993478
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n7UPCYfitiBuFpFb0LBM8U
	ACSNAdZALcUJmKVpntskI=; b=NutMs7pcbHSPU/FtiGcYnQs4VWVTVxW2lnytyP
	uAQVvr1dOE3GmA3wtUOKsgI3HPwTV0bwKYTgT5Inekv5WuY/Puz5hModhm81Tdef
	gBprBH9YJm8WV0B5cXYHexB3VYQzJRU7DV7i8GJuo5vbLAnk/sC/GHjPMpD/Liw0
	ttkgZzf5pdB3ow9sBSrpXDkSG41zT+IHN34ahKH/qk8ZDMvJ5CrvTEWRQ6oOvGCG
	17bGePJXilp7lTTX654xVrQoIyBuS8FxSR+wBGQ7iUDchdYB/ukzbmFi6z6SNVlb
	Uc3qqWTzUc3J9Hiy5K7+DOVajTAjrM2dVeERpHUODcBdOTTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jhvr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b8ed43cd00so811309b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030169; x=1763634969; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7UPCYfitiBuFpFb0LBM8UACSNAdZALcUJmKVpntskI=;
        b=Gxc8Gd4tk+cQt3P3YRo9bAHcbQ9yiRECvajLWygrlEi899eOLRegiB2A97l00ySFxH
         8iGKcx9qkZMIlSzY9c3EiD0N/N/B7GcYxTUHgzDUztTctJtqXuhJFDrKfbVvKdre9HQX
         IM4qTiGcJzTJGPql5MhgpUu6KHIkx+Sj+lhhbynsAyRSqoIikVbAUJZEjsPyd6GeapvC
         kjLovI/9GFZZgzqBgu/36bzpGRdgFwzr/qR9oXWAU/2mwDo19ou1qzTR0yiZAVWW7WCR
         GknAY/o+6JGavDXCtl3eT56kMqRzxO7Ms91xF51EQhm5DirUDPhsBO5dkxZh4hqmno9U
         ni+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030169; x=1763634969;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7UPCYfitiBuFpFb0LBM8UACSNAdZALcUJmKVpntskI=;
        b=fmDqPwhb+C1mx7Iqltze1bS+FsXYrxUm2jKrjoyGfPmxyTO0VzE5DgOWcPUCeIz736
         SB6ay8rnYhfdP0vjwErMzFm5J6S4jSf1M/ipyZ3CRjzzN7RzCM33aKvhcdEsMWuoF6RZ
         xS7DgOUE011Cx08XVbqrufSILHnzzCC8KeiYrFvVWvMrvZPZCHZ86i8irtUQaRxEgzjv
         48w84HedVpHcgq6LjZPqrW0yZdCfsGx31NaqNncl68Njc3ftOFujBNjVv3fLvCyJu0NA
         AXPzKeAXNl5J+KdveBTElMYxNNwDBEeb/Pb8z+95ZFCp/YKU2vsSsZdhrV4BydqDOo7G
         NWrg==
X-Gm-Message-State: AOJu0YwJiMjv4uI90md374reaSvglUi0FsWxYKhNAQUL53kQQdrnSCmY
	jxh5wbmEbZxyVoBS3SMS3kmWeHt+v/4zYp+4gAAUbqESCNeccZ8G7pTVgOMvOqUUHR1RE98MbRf
	jLeIxUrBTVvx25MnJNCVNC4PjmyyRZYYVhjFCeXVj1XtTgGVIlqG0H+rxfe8KtrCGLE4RODMsN7
	vE
X-Gm-Gg: ASbGncuKiYsWhO/A8hK5RvtjIW5J67MtI5EtITUlyCW4zDR4YqGhoMOZfgmGMr/aAzU
	QSiJHCIiRzijK8ELDziGj1lAHE9SH4AFujhesxEXs3hdfsqAIxhzCvUWz/WxxVar2nlkjXAg8dq
	4Z7hvukQHKHFACZoVCQPWlcChy/0c5iHrJjQ3KjswiYTsSn4cEvFY6vGjdmSEAKpqw9cDReB21n
	Jh1v7TvYznkyr9eH6KozCz5QsNP/67DvM466Q3YWos8/jZkX1pqAAqUhIYx9vH+Irrlm+5aZyTV
	MMoysbWUNgHU42Igiv0eJl4hARM72JBCHIXRyZKH7dp4N5GjToH80p9g21teRRgo7VnnnNFaHtz
	eeh2u5OTclL4Nth5mMl9RbK8oyg==
X-Received: by 2002:a05:6a20:a10a:b0:33f:4e3d:b003 with SMTP id adf61e73a8af0-35909f74f15mr8135161637.25.1763030168998;
        Thu, 13 Nov 2025 02:36:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO4IM3tC8HAf/zwi7QmfUvJwP8U6T2KFeyQT++jlVAupfKXw44dU1e2LNNk5Eit5tncG1qTA==
X-Received: by 2002:a05:6a20:a10a:b0:33f:4e3d:b003 with SMTP id adf61e73a8af0-35909f74f15mr8135109637.25.1763030168162;
        Thu, 13 Nov 2025 02:36:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:07 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v7 00/14] Peripheral Image Loader support for Qualcomm SoCs
 running Linux host at EL2
Date: Thu, 13 Nov 2025 16:05:50 +0530
Message-Id: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIe0FWkC/x3MQQqAIBBA0avErBtITYSuEi3CxhqilBEkCO+et
 HyL/1/IJEwZpu4FocKZ493g+g78sd47IW/NoAdtlVIGz3KhJIkei0OjLTljgx9phZYkocDPv5u
 XWj/Af1PdXgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=7901;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=J9Kvjq2rIOiPb/NK/Kg/3r1NbJDYRhS5PvrxVGHQRv0=;
 b=lJWOEDTxTDZukYF1tgG+JR02n3Rranmg2UStMAhNrw6A+1GgqssyNkMfuMY39lViHJZXn4xcK
 VnsklYQXy35D9sriKt2NmswTTYWmgbqWrhzKpqZ041bkv+SKb5FysFN
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfX+PrieULypBma
 tE4EbycWzUQvjUZuWr66M7OF2RvLlCOghd3DYD+v1FO7YxbWd0nanJWR8zCtJ5aGeR5hhRoa6aJ
 m16YFhTi+Cl5iCozq00UbauLNBiXvRhHrnufSTbo9Y8KpQeJPm2BU81AJX+KoD9umRvteuiPDaB
 Q172mYVCn3OcBvOtcRIJnr4tZRTtCMxzfnzeLoLMcYbYNKfgk0jFccvDy/e9ZTQUlviIArqKrHo
 vFViXKHsO0D9fy/xQ3BNZssaOyB683jC6VpX3a9avFTYx+HaRvM6rN6j5tH41lnt7SoyhCqvRXa
 WzJL4AA51RGkEqd5F8m9v1rSkNv5opzmCBa6M1JmlLQ7eqjjEfEtIq4molnZGRDDsldUsbS8eP0
 WNpn37AnEUGMoOU9gtt0m2ovs+F9eQ==
X-Proofpoint-GUID: ekvZWPRja_FwQTiLvZClMI2C1uEBGuOz
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=6915b49a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=opVaqqR8PucFcDoZxH4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ekvZWPRja_FwQTiLvZClMI2C1uEBGuOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130078

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

It is based on next-20251113 and tested on SA8775p which is now called
Lemans IOT platform and does not addresses DMA problem discussed at
[1] which is future scope of the series.

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
      firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
      firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
      remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
      arm64: dts: qcom: Add EL2 overlay for Lemans

 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 arch/arm64/boot/dts/qcom/Makefile                  |  10 +
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  41 +++
 drivers/firmware/qcom/qcom_scm.c                   | 366 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 166 ++++++++--
 drivers/soc/qcom/mdt_loader.c                      |  43 ++-
 include/linux/firmware/qcom/qcom_scm.h             |  28 +-
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 9 files changed, 574 insertions(+), 106 deletions(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251113-kvm-rproc-v7-325e735fc4ea

Best regards,
-- 
-Mukesh Ojha


