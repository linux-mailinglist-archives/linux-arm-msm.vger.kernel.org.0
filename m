Return-Path: <linux-arm-msm+bounces-46032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D31A1B05F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 07:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 526541882B48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 06:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA7B1D63DD;
	Fri, 24 Jan 2025 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Px4YBk9W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37D282F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737699710; cv=none; b=AmPk3be1sbZzUVzmjOPNiBM6nQzeLsDCD26tPyeVqXn3fBaoy4B5jzSBXK9tmeZjTqi2EulFQJ2v32zvwbb0vXZdfZvsF7zGRseCD6ymqwRI+OiKNxWag/sURKvl/myZ84K/b2MYiRUXs8AX3KfzZgKDW1VX3l/Fy/6CHM0Mng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737699710; c=relaxed/simple;
	bh=YFp2Z+t7xRk8x6Kl4lGeCcICjLIDtCSj1ebVoHWStQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=nvGLkSK0t+Ed0zvWYHeiC7XYfzE4lC7QkbEQozdu1G2x9NhR7Mic2pIYT/bC9TKcdG9uuP7uzbMVXbx7Ycw+QOgK1MdRlnFAhgmH7O8nen8UsBm2NbyM0397vFrXuMinxTzOj+X3qJrib/hTrxU2OiX3KFtYamoaMwaOwwUXLuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Px4YBk9W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O3GBuL006511
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 05:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBPYiLdDRBIgHv762UtSJ+rwIwHEn2m5Ux7Jpgicu1A=; b=Px4YBk9WlcwPI82I
	lRe6/pRpKzevtY4sqsHQFpRb8Z9kE2oPHAA+M458Rn04sg/oPQsP8OxxxZFNl2nB
	OmDdPG1XBds6qdS+GYKuxpsLBRQzOoCvVDZ3EgnEfQffCHFvMbKGvNOFe4Lrl42m
	Y6nvmdOfYwAgayCjG6+X/5s3TwUdIajJGD4Amm3zkMymSfr8Cg3HzrGCuk4YyKmd
	EJBfI+aBiSXpOrlxh9hc+6+NjIREkJYkyb6xVlN6wFK6SJijepLdZTu8jMAFdN4Z
	Vj2jGOF40EtrBdFUHK+sYOSR2vNGYDZ6NuwrozpkvUBEtc/w3Fqcxv2R/bP+h8sM
	/XJX8Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c2t48936-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 05:53:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2166855029eso34173425ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 21:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737697987; x=1738302787;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBPYiLdDRBIgHv762UtSJ+rwIwHEn2m5Ux7Jpgicu1A=;
        b=mUPDQRopaa7XCiZRYKYXYsZ9f7QZuDdY3l3jjA/GCsyyMWGL8cxrgvDTozQAtRFl7Y
         KaK+/f8XuWHhWeysWWCceuaTvfCrZc832PfVdewKuQEf4bOJ5Mbey2V5aUu1k/e8VUVQ
         xhh6gtoi7bnJkHHj+OWjwg2JYUuJikyMvoWsj8uUZe6v+AjZhPKAad7OqoimPQ0Nf72J
         87L/T5QbY887Oy+/WQ3BIHHIpqymhe4agk/fgEfuZccoLwWO2I5o4/WgajUXSeU5uT0J
         YdpjDV746OdTAuW+ZEuJysL9EqUOR2HbL8ZtrSLenGiIcfoByw/2xnDWci17K2VP92rj
         G6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZPhW0g/6xFDdhQnTbNA4R5hhcY0Slx3ddC2kj9QqxMwArcTlqS3c8AcyB3VpGBAxrKr0LSZAhVkQNy+Nn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgls1yM5ip7hp9kd2fUrDkaIp7+QuvA5vj9OWnrYNWUEf4Wn8f
	gZjQwds1cQfEAeNFAsb1mBTZG05T2Cv+oTFltWSrcqPB/KWPsq5qenXykAjddyhrPy5JLKXPFzj
	+6YlcP0auurCsLCRwjPVIFv3ZmLpWUbzs+Uc/UkjZ2GaRB+PJPhy98PqTC3ZToqir
X-Gm-Gg: ASbGncvh8mJf5ChN+Ni7fu4esRfCzA6134z77OKjxKGGuvcVOcLHyKhIL/CxdaQVbA0
	5CGA8JOA4Rxwz+mGwGjtYdwj0v5oz4m8UA4P/ygyiz4wCw5b1GXN6Iq87kDv934prkSo3Dq1zLk
	2LQ4XyuutheVpQq5OEC5WUh9zQQuV9tlxn1r4RSLQMHAdkDKFBmApxEMaGn7KVoRX53suJz5nI+
	QViakZx/rHcfiPSkauElCGH9GGM26P/krgTgPjgrkSD/ESV6BkmIXRhvm6aU0YyQFu3QzHtjUF9
	bE1VrzY0B3uaHo2NhdwNA6A5YHhBQNw=
X-Received: by 2002:a17:902:db11:b0:216:6283:5a8c with SMTP id d9443c01a7336-21c355bac6amr396499015ad.39.1737697987572;
        Thu, 23 Jan 2025 21:53:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYAFMYrY3EVMSXVYrxo+bvXExncjT3+v/7gOAOzdbB00h/JmBc+AibN1Dw5PqcIQM/o4Opsg==
X-Received: by 2002:a17:902:db11:b0:216:6283:5a8c with SMTP id d9443c01a7336-21c355bac6amr396498425ad.39.1737697986895;
        Thu, 23 Jan 2025 21:53:06 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424e85esm8354345ad.250.2025.01.23.21.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 21:53:06 -0800 (PST)
Message-ID: <02396f29-5d1c-4595-8c31-c67cf70fdffe@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 21:53:04 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] mailbox: tmel-qmp: Introduce QCOM TMEL QMP mailbox
 driver
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, manivannan.sadhasivam@linaro.org,
        dmitry.baryshkov@linaro.org
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20241231054900.2144961-1-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bJVFLkAvHidOv_POLJIvejVhBz6_5KmO
X-Proofpoint-GUID: bJVFLkAvHidOv_POLJIvejVhBz6_5KmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240040

On 12/30/24 21:48, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> The QMP mailbox is the primary means of communication between TME-L SS
> and other subsystem on the SoC. A dedicated pair of inbound and outbound
> mailboxes is implemented for each subsystem/external execution environment
> which needs to communicate with TME-L for security services. The inbound
> mailboxes are used to send IPC requests to TME-L, which are then processed
> by TME-L firmware and accordingly the responses are sent to the requestor
> via outbound mailboxes.
> 
> It is an IPC transport protocol which is light weight and supports
> a subset of API's. It handles link initialization, negotiation,
> establishment and communication across client(APPSS/BTSS/AUDIOSS)
> and server(TME-L SS).
> 
>    -----------------------------------------------       ---------------------------------------------------
>   |                                              |       |                                                 |
>   |                 SOC  CLIENT                  | SOC   |                TME-L  SS                        |
>   |                                              | AHB   |                                                 |
>   |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
>   |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
>   |     | APPS   |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
>   |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
>   |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
>   |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
>   |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
>   |                                              |       |                                                 |
>    -----------------------------------------------       --------------------------------------------------
> 
> TME-L SS provides different kinds of services like secureboot, remote image authentication,
> key management, crypto, OEM provisioning etc. This patch adds support for remote image
> authentication. Support for rest of the services can be added.
> 
> Remote proc driver subscribes to this mailbox and uses the mbox_send_message to use
> TME-L to securely authenticate/teardown the images.
> 
> Since clients like same rproc driver use SCM/TMEL across socs, the goal here was to abstract the
> TMEL-QMP SS functionality, so that clients should be able to connect and send messages with
> a common API.
> 
> [v1] RFC Post
> 
> [v2]
>      Added HW description in the bindings patch.
>      Fixed review comments for bindings from Krzysztof and Dmitry
>      Changed patch#2 driver to add work for mailbox tx processing    
>      Cleaned up patch#2 for some checkpatch warnings.
>      There are some checkpatch [CHECK] like below, which looks like false positive.
> 
> 	CHECK: Macro argument 'm' may be better as '(m)' to avoid precedence issues
> 	#1072: FILE: include/linux/mailbox/tmelcom-qmp.h:40:
> 	+#define TMEL_MSG_UID_CREATE(m, a)      ((u32)(((m & 0xff) << 8) | (a & 0xff)))
> 
> 
> Sricharan Ramabadhran (2):
>   dt-bindings: mailbox: Document qcom,tmel-qmp
>   mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver
> 
>  .../bindings/mailbox/qcom,tmelite-qmp.yaml    |  65 ++
>  drivers/mailbox/Kconfig                       |   7 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/qcom-tmel-qmp.c               | 969 ++++++++++++++++++
>  include/linux/mailbox/tmelcom-qmp.h           | 157 +++
>  5 files changed, 1200 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
>  create mode 100644 drivers/mailbox/qcom-tmel-qmp.c
>  create mode 100644 include/linux/mailbox/tmelcom-qmp.h
> 

This series was listed as a prerequisite for a WLAN patch I'm
reviewing, and when I used my WLAN automation to pull into my
workspace the following issues were flagged.

From kernel-doc:
drivers/mailbox/qcom-tmel-qmp.c:153: warning: Function parameter or struct member 'qwork' not described in 'qmp_device'
drivers/mailbox/qcom-tmel-qmp.c:153: warning: Function parameter or struct member 'data' not described in 'qmp_device'
drivers/mailbox/qcom-tmel-qmp.c:153: warning: Function parameter or struct member 'ch_in_use' not described in 'qmp_device'
drivers/mailbox/qcom-tmel-qmp.c:304: warning: Function parameter or struct member 'mdev' not described in 'qmp_send_data'
drivers/mailbox/qcom-tmel-qmp.c:304: warning: Excess function parameter 'chan' description in 'qmp_send_data'
drivers/mailbox/qcom-tmel-qmp.c:394: warning: Function parameter or struct member 'mdev' not described in 'qmp_recv_data'
drivers/mailbox/qcom-tmel-qmp.c:394: warning: Excess function parameter 'mbox' description in 'qmp_recv_data'
drivers/mailbox/qcom-tmel-qmp.c:438: warning: Function parameter or struct member 'mdev' not described in 'qmp_rx'
drivers/mailbox/qcom-tmel-qmp.c:438: warning: Excess function parameter 'mbox' description in 'qmp_rx'
drivers/mailbox/qcom-tmel-qmp.c:859: warning: No description found for return value of 'tmel_qmp_mbox_of_xlate'
10 warnings as Errors

From checkpatch --codespell:
1d333d61d25de60704447c9b2dbee165927696d3:16: WARNING:TYPO_SPELLING: 'requestor' may be misspelled - perhaps 'requester'?
1d333d61d25de60704447c9b2dbee165927696d3:76: WARNING:TYPO_SPELLING: 'requestor' may be misspelled - perhaps 'requester'?
total: 0 errors, 2 warnings, 65 lines checked
cb1085a6ed62b0d1c7400ff9257490e431afe7b0:313: WARNING:TYPO_SPELLING: 'initated' may be misspelled - perhaps 'initiated'?
cb1085a6ed62b0d1c7400ff9257490e431afe7b0:316: WARNING:TYPO_SPELLING: 'succes' may be misspelled - perhaps 'success'?
cb1085a6ed62b0d1c7400ff9257490e431afe7b0:357: WARNING:TYPO_SPELLING: 'succes' may be misspelled - perhaps 'success'?
cb1085a6ed62b0d1c7400ff9257490e431afe7b0:910: WARNING:TYPO_SPELLING: 'controlls' may be misspelled - perhaps 'controls'?
total: 0 errors, 4 warnings, 1144 lines checked

/jeff



