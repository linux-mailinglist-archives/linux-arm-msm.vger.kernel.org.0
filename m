Return-Path: <linux-arm-msm+bounces-70605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A54B33C6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B644818945B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104912A1CF;
	Mon, 25 Aug 2025 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLkXwv0l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD829D270
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117175; cv=none; b=eQGppZ/o/1WiV6Dxdvs0wJZuLMGnHQG939IxDXv/lbY6gyySWlHiONuf7EAemhEhhkCLdOE6XZGehUoqdBZ2mOeA4FmfErflcbPnBBMBkVsMoQZKqYznBqildVNnxO00FPk+XaChOGbBnieXVlAFXFvStmvGspwWAS747T6C/Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117175; c=relaxed/simple;
	bh=jDeGIIzXuYSMWeIbVkczM3x34PebPWitvo4rzoTFmBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BYt1IhL1laYnpcZb5D9rRf8c7/u5XhJS3ut3wXOxqAWu/AJmk2xMTtRZyaSTNzd9Zfr02tVPLMUOfOdzQyhSolY18WsgXf3nlTmrML9ZdKCnIC15HIjQiuQGoz0djrJvNjmd0zi0mDz2tAzTHF3n/rrwJK5NzNOIGWfQ6kfM4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLkXwv0l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P6deod017451
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EQ2qZVJG5gxJjhrwczXn2nofAw/cAV6eBji
	O2zYDYFw=; b=LLkXwv0lugjTRM+0hXnoJOPOWg0XpxXcnqsb1hUhqarokX+WDsE
	+s2sqopKzW7FP5Sooj/yXAIvAQPwTgJRXJWHYgabxmE2w2O/pged5ohkxpJS1GNh
	ZqlKwyVW/xTACKrBVjXccsQnvJlGg/rJNFpNl3HFO9POX1oOf99H3IcsrUlhle6v
	eyX5jp4j3OCLggPSvjd5UJvyN+a8YT0Hv6W4LRHix+2Uioz3QGqdN3BoZhXhhw1F
	DFkYzb8Lrl7svzGs+QBRKijqAmhDSjTaQ62Mr+kNejEcYQuM/3DSVdSyHPTaEwys
	4it3RfeTDUXd6wqmOAm6qVGBmm3yDtmVMuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpmt73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32505dbe23fso2799646a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117172; x=1756721972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ2qZVJG5gxJjhrwczXn2nofAw/cAV6eBjiO2zYDYFw=;
        b=byEDGZMq+GqQSUF6jQD6PJYJ040HOYD+wMe07gtFFqYtUQkUQHkrqpwa8azG1n1VAo
         J57wTX9S75XhAMKxe0i5CjWV7kcQS8VO/aMTPVkgLHl2TI+HR6lnQ3JMlIl3zB8PPthb
         pNYNQo8dWHjVeLzbJ5nbroAbWUv/Gfhf6re5zW2CGeLPAwdeffcxMJLLJIoK601ir95t
         73aOH74Qmy08cRtGYiEc1awlRo337PzUr/aOyGH8xN64B4AncybDDkG4NMLG6sxowoRk
         vPigmIGc3LKxPibmT5EFXsqHM3DZs60Ylf4kF10PnMrLEEm21QtpCbGpEaxHz4cqzzhE
         0cXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgjPG5YmPQAPSM2l7GfgATfCDjSp/S1irURIsa7vIQzbnja1qdPzmHy3/l1AqOqqZ2cs0oaJGYEN6jZh11@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdt9Wbzg+fgJWEDGZxRLWwqUDlq7noWLDfJK59AC7YiwJhf9+R
	4vBy3Y3HXb4fxCRxstKOlSZSYIFRv280GiOf5DRyh1o1suGG+0iVugs8HEQs1ZNw7jlogEohmrD
	cScpjDp3IPzw6s95rRV3RHBHDxJ/zXGe3/9YHRuX1Je4Br/VxDpaGd71Jc9OESsTKMFHf
X-Gm-Gg: ASbGncvWHVuAvbo8gsJDp+JlLO1RFkTMxZTcG8/bdXNHYrkBe2C13h8+gTmiwQU5WEz
	3khJXv22mUgeDoQvLq70y7kXSVglLHYzf/4R3N4FMCP2xvmUQBmoRtoc1xIwOlcSDCFwpV3VPj/
	tUS3DcZP+JnEzpKS31Tnu2swDU+e+pow1exV1XH043Ht1Okw+xFeFObAWqcJD4LKqXwGJ6MLQ0L
	R/j1RA+fCNZ5BeefjnhXpke+G+LFy6t9sqecdjccR56ElYYhLl98PCVICdt8iAPTU4ILQ4MpKFn
	i/q+hAZkhW/ges0Z6b/tRxxHzK8o/JcOCCVK56F38x4cuEbS73+uW5DLCfXGGgfAsu1KWg==
X-Received: by 2002:a17:903:1c8:b0:242:3105:1787 with SMTP id d9443c01a7336-2462ef8e152mr160395545ad.50.1756117171685;
        Mon, 25 Aug 2025 03:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqG0Xy2gO1/SO1TSoPecI+H4OexREJA/RTZHOkIZSXzIlqCBI5K8o30RHRi73RDIGTTGnwPQ==
X-Received: by 2002:a17:903:1c8:b0:242:3105:1787 with SMTP id d9443c01a7336-2462ef8e152mr160395175ad.50.1756117171160;
        Mon, 25 Aug 2025 03:19:31 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:30 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 00/12] Sahara protocol enhancements.
Date: Mon, 25 Aug 2025 15:49:14 +0530
Message-Id: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac38b4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=YmuwKWNDwRngVgAKmEwA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 34rixQsCOnS14pEsn7739lAgijlgAk_6
X-Proofpoint-ORIG-GUID: 34rixQsCOnS14pEsn7739lAgijlgAk_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxSKj7rdaXz7L
 RySKvKOns34Mvaav/6It7mDvqMRsSDM5X6PXut4kVlkZWzQeRKyoOhO2l/Dz899njETiiWlX+us
 tj+BppOkm8rWqNH5Ezw5JU2hSSpfiWnfeuqjR6NV6j5PJu+U6y9RE2OfKTd748R79vvd/yn4Dgd
 lh06XLJ636jP+6yTwMV+wDxisqefgMd59s69z8XV91jAd4CK5nyMZN+xlnlFrDBakXOFjjb1CWK
 zLhS9OvgcdkIJpndRD0GcdGB6NktWHcbWgQpLE4pv9wslttrJr2btYuy8Y0bcQtVk3qMIF+GXc0
 /phVR2PuvIXvlL6MSbgG9t2hDUHS2TU29stQ9clVuxqn5In+E1fY3rxmm8iVADUWFcB0U54XcVv
 atwXQATB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Hi Team,                                                                        
                                                                                
I am submitting a series of patches to enhance Sahara protocol framework in     
Linux kernel.                                                                   
                                                                                
The current sahara driver is present in drivers/accel/qaic directory and it has 
Qualcomm AIC specific image table hardcoded in it. This is making Sahara        
protocol to be strictly tagged to Qualcomm AIC devices. We have another device  
called QDU100 where it uses sahara protocol for transfer of images from host    
filesytem, to collect memory dumps. To achieve this, the sahara protocol driver 
needs to be at a common location. Hence it is now moved to                      
drivers/soc/qcom/sahara directory. This change also brings in a mechanism for   
client drivers such as AIC and QDU100 to register the device specific image     
table with Sahara protocol. The Sahara driver will pick the right image table   
during runtime based on the device attached to the system.                      
                                                                                
In addition to this, during the first boot up of the device, the sahara driver  
loads the dummy DDR training data file present in the firmware filesystem.      
When this dummy data is sent to device, the device sees that the training data  
is invalid and triggers DDR training. This training data needs to be saved at   
the host end. In the subsequent bootup of the device, the saved training data is
sent to the device thus restoring the DDR training data and reduces the boot    
time of the device.                                                             
                                                                                
The handling of save and restore of DDR training data is done via the Sahara    
protocol with mode set to Command mode. The Sahara protocol at host and device  
exchanges relevant packets and once the training data is saved, the mode of     
operation again changes back to image transfer mode to continue loading of next 
images.                                                                         
                                                                                
The DDR training data is exposed to userspace via the sysfs node. There will be 
a service which is triggered by a udev rule that reads the sysfs node in every  
bootup and then saves the training data file in the firmware filesystem in the  
format - mdmddr_0x<serial_number>.mbn as each card connected will have its own  
serial number. The userspace service is hosted at this location -               
https://github.com/qualcomm/csm-utils                                           
                                                                                
Thank you for reviewing these patches. I look forward for your feedback.

Kishore Batta (12):
  Add documentation for Sahara protocol.
  drivers: accel : Move AIC specific image tables to mhi_controller.c
    file
  drivers: accel: qaic: Support for registration of image tables in
    Sahara.
  drivers: accel: Register Qualcomm AIC specific image tables with
    Sahara.
  drivers: soc: qcom: Move Sahara driver to drivers/soc/qcom directory.
  drivers: soc: qcom: Add support for Qualcomm QDU device.
  drivers: soc: qcom: Add sysfs support for DDR training data in Sahara.
  drivers: soc: qcom: Support Sahara command mode packets(READY and
    EXECUTE)
  drivers: soc: qcom: Remove is_mem_dump_mode variable.
  drivers: soc: qcom: Support for DDR training in Sahara.
  drivers: soc: qcom: Support to load saved DDR training data in Sahara.
  Add sysfs ABI documentation for DDR training data node.

 .../testing/sysfs-bus-mhi-ddr_training_data   |   19 +
 Documentation/sahara/index.rst                |   14 +
 Documentation/sahara/sahara_protocol.rst      | 1241 +++++++++++++++++
 drivers/accel/qaic/Kconfig                    |    1 +
 drivers/accel/qaic/Makefile                   |    3 +-
 drivers/accel/qaic/mhi_controller.c           |   94 ++
 drivers/accel/qaic/mhi_controller.h           |    2 +
 drivers/accel/qaic/qaic_drv.c                 |    8 +-
 drivers/soc/qcom/Kconfig                      |   20 +-
 drivers/soc/qcom/Makefile                     |    2 +
 drivers/soc/qcom/qdu.c                        |   85 ++
 drivers/soc/qcom/sahara/Kconfig               |   17 +
 drivers/soc/qcom/sahara/Makefile              |    6 +
 .../{accel/qaic => soc/qcom/sahara}/sahara.c  |  534 ++++++-
 drivers/soc/qcom/sahara/sahara_image_table.c  |  178 +++
 .../accel/qaic => include/linux}/sahara.h     |    1 +
 include/linux/sahara_image_table_ops.h        |  102 ++
 17 files changed, 2252 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
 create mode 100644 Documentation/sahara/index.rst
 create mode 100644 Documentation/sahara/sahara_protocol.rst
 create mode 100644 drivers/soc/qcom/qdu.c
 create mode 100644 drivers/soc/qcom/sahara/Kconfig
 create mode 100644 drivers/soc/qcom/sahara/Makefile
 rename drivers/{accel/qaic => soc/qcom/sahara}/sahara.c (64%)
 create mode 100644 drivers/soc/qcom/sahara/sahara_image_table.c
 rename {drivers/accel/qaic => include/linux}/sahara.h (99%)
 create mode 100644 include/linux/sahara_image_table_ops.h


base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
-- 
2.34.1


