Return-Path: <linux-arm-msm+bounces-46106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDAA1BBD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 19:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA18F16E442
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 18:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A601D6DA8;
	Fri, 24 Jan 2025 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nukJZVwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19620154435;
	Fri, 24 Jan 2025 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737741642; cv=none; b=RNoVq542ncoDULv7s0tR3RSne33Prfemt7YRlDeGgROd2NXbAFeK5pj/DVaSOJ7lDQUscaQYuI4u/r4PtyKjJ8JORp10XofY5/MRr1QINd05H34E792CQ97udr82LTGVhj1yzy4ld+iv42XRIY3b3kqmCn4b7zpruNiE/paLfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737741642; c=relaxed/simple;
	bh=Ut25sPY/jq2lNAg8RzPPbfAW5fhnL1MOHp9uU+GpdIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c4OSS/r3It66WXGB2o/pi0Xf3WziW/wFgtCh/sZmbMwiIwAPJ2KgO9bAUQv/x5odJVaHUz3LeW7f7RK6A+CMIm4/QgyognvhjwZm7iF8ZfjxpzapC8bZMGEObAseXonjp9S5O03A90UBgy986JIn2N2glPCyLaw1bJ+WUtKY7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nukJZVwj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OHviD1029133;
	Fri, 24 Jan 2025 18:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bRqYvvjafC3zRbhVTU+2nn7evtZjF+X+K+jbko36NJQ=; b=nukJZVwj+yVljCUo
	/9xSK10ivhta3A30QuspT+Q2rpX9SY6pVEMJWFr8c8YL4IDPWgHCv9ROmlKrt2Hg
	M0HXlAL9kQDU1k+ilHsSc7Mse1vhYM04f+hPy3pZRDoDnGcb1K72sEUqatJ7dkAZ
	cW1YyXgbgdmL+AZy7OmqavSLm2i0VVZm2EX4Wy/sjahgK9L+hAoWPLVg1zqDSstj
	aKxQAwqQpfnKzwv75oyc3CFsDgJcp3lqnzLEb1JRSa3QIB1x0DB1uzbPoXXAhbj3
	TgR/cZ2HxZ1bdMuTQs5nqp7jDUPVE6YdVKEjrsaMU/yFtgrYY40BnQmze0j1j7XM
	UC4Niw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cfqjg07u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 18:00:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OI0ShG021338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 18:00:28 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 10:00:27 -0800
Message-ID: <4b624830-00eb-46e8-ae5a-b822e32b2005@quicinc.com>
Date: Fri, 24 Jan 2025 10:00:26 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/8] Add new driver for WCSS secure PIL loading
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <konradybcio@kernel.org>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <quic_viswanat@quicinc.com>, <quic_srichara@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B6EiwzRgYidXimNZv5hrR-PvB2XBliki
X-Proofpoint-GUID: B6EiwzRgYidXimNZv5hrR-PvB2XBliki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240125

On 1/7/25 02:16, Gokul Sriram Palanisamy wrote:
> This series depends on Sricharan's tmel-qmp mailbox driver series v2 [1].
> 
> - Secure PIL is signed, split firmware images which only TrustZone (TZ)
>   can authenticate and load. Linux kernel will send a request to TZ to
>   authenticate and load the PIL images.
> 
> - When secure PIL support was added to the existing wcss PIL driver
>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>   This series adds a new secure PIL driver for the same.
> 
> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>   reposted from [3].
> 
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20241231054900.2144961-1-quic_srichara@quicinc.com/
> 
> [2]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
> 
> [3]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
> 
> changes in v3:
> 	- fixed copyright years and markings based on Jeff's comments.
> 	- replaced devm_ioremap_wc() with ioremap_wc() in
> 	  wcss_sec_copy_segment().
> 	- replaced rproc_alloc() and rproc_add() with their devres
> 	  counterparts.
> 	- added mailbox call to tmelcom for secure image authentication
> 	  as required for IPQ5424. Added ipq5424 APCS comatible required. 
> 	- added changes to scm call to pass metadata size as equired for
> 	  IPQ5332.
> 
> changes in v2:
> 	- Removed dependency of this series to q6 clock removal series
> 	  as recommended by Krzysztof
> 
> Gokul Sriram Palanisamy (3):
>   dt-bindings: mailbox: qcom: Add IPQ5424 APCS compatible
>   mailbox: qcom: Add support for IPQ5424 APCS IPC
>   arm64: dts: qcom: ipq5424: add nodes to bring up q6
> 
> Manikanta Mylavarapu (4):
>   firmware: qcom_scm: ipq5332: add support to pass metadata size
>   dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
>   arm64: dts: qcom: ipq5332: add nodes to bringup q6
>   arm64: dts: qcom: ipq9574: add nodes to bring up q6
> 
> Vignesh Viswanathan (1):
>   remoteproc: qcom: add hexagon based WCSS secure PIL driver
> 
>  .../mailbox/qcom,apcs-kpss-global.yaml        |   1 +
>  .../remoteproc/qcom,wcss-sec-pil.yaml         | 131 ++++++
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 ++-
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  80 +++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 ++-
>  drivers/firmware/qcom/qcom_scm.c              |  13 +-
>  drivers/firmware/qcom/qcom_scm.h              |   1 +
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c       |   1 +
>  drivers/remoteproc/Kconfig                    |  22 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 406 ++++++++++++++++++
>  11 files changed, 775 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 

This series is listed as a dependency of a WLAN series, and when I pull this
series using my automation I see the following kernel-doc warnings. I don't
know if these are existing issues, or issues introduced by the series, since
the automation runs kernel-doc on all of the patched files.

drivers/firmware/qcom/qcom_scm.c:302: warning: No description found for return value of 'qcom_scm_call'
drivers/firmware/qcom/qcom_scm.c:328: warning: No description found for return value of 'qcom_scm_call_atomic'
drivers/firmware/qcom/qcom_scm.c:425: warning: No description found for return value of 'qcom_scm_set_warm_boot_addr'
drivers/firmware/qcom/qcom_scm.c:438: warning: No description found for return value of 'qcom_scm_set_cold_boot_addr'
drivers/firmware/qcom/qcom_scm.c:675: warning: No description found for return value of 'qcom_scm_pas_mem_setup'
drivers/firmware/qcom/qcom_scm.c:714: warning: No description found for return value of 'qcom_scm_pas_auth_and_reset'
drivers/firmware/qcom/qcom_scm.c:750: warning: No description found for return value of 'qcom_scm_pas_shutdown'
drivers/firmware/qcom/qcom_scm.c:787: warning: No description found for return value of 'qcom_scm_pas_supported'
drivers/firmware/qcom/qcom_scm.c:892: warning: No description found for return value of 'qcom_scm_restore_sec_cfg_available'
drivers/firmware/qcom/qcom_scm.c:1070: warning: No description found for return value of 'qcom_scm_assign_mem'
drivers/firmware/qcom/qcom_scm.c:1141: warning: No description found for return value of 'qcom_scm_ocmem_lock_available'
drivers/firmware/qcom/qcom_scm.c:1158: warning: No description found for return value of 'qcom_scm_ocmem_lock'
drivers/firmware/qcom/qcom_scm.c:1182: warning: No description found for return value of 'qcom_scm_ocmem_unlock'
drivers/firmware/qcom/qcom_scm.c:1298: warning: No description found for return value of 'qcom_scm_hdcp_available'
drivers/firmware/qcom/qcom_scm.c:1323: warning: No description found for return value of 'qcom_scm_hdcp_req'
drivers/firmware/qcom/qcom_scm.c:1879: warning: No description found for return value of 'qcom_scm_is_available'
drivers/firmware/qcom/qcom_scm.h:47: warning: missing initial short description on line:
 * struct qcom_scm_desc
drivers/firmware/qcom/qcom_scm.h:57: warning: Function parameter or struct member 'svc' not described in 'qcom_scm_desc'
drivers/firmware/qcom/qcom_scm.h:57: warning: Function parameter or struct member 'cmd' not described in 'qcom_scm_desc'
drivers/firmware/qcom/qcom_scm.h:57: warning: Function parameter or struct member 'owner' not described in 'qcom_scm_desc'
drivers/firmware/qcom/qcom_scm.h:60: warning: missing initial short description on line:
 * struct qcom_scm_res
21 warnings as Errors


