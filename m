Return-Path: <linux-arm-msm+bounces-66054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 419BAB0D7F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 263AB3A76D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 11:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDC02E2EF2;
	Tue, 22 Jul 2025 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VN1GIgCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C6928C5B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753182708; cv=none; b=pbxzJZlx+Ni8o1CGF+WqteMA6dJuVPZp3JG1HCpsRE60vmcGNnaYrmFy2tKOUH6I2CtNXK8EcAxpX4ngQ3qUvFuXSvJn+jvLYM4xN23sh3ccOEUE+kjLZObkoueWHCb3JgNnno9Ibxlvu59p3Rav7ICSO1DIEBG5QtgGUM1G8CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753182708; c=relaxed/simple;
	bh=7b1qh/dSogZFvxoYSJwQTetAmceccBgx4t1nS6JueJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+fnScLmHyqAIVea2M7GwvTpGQO11TPfDKL7ITWsMQ3icn69hengbezUEFVweLTqQw7nqAA2uc56C46q59p4qMf1YsMGhsDHE992SGgROumLQ7AZF6fdDB+bh9nzpirpz9X1FDASUiCfNxaiTfoXswIJewTzBvfVWWlqP7lDiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VN1GIgCe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7WllD005180
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oi53JRV3Vx8pK1+2DIKrj/tvup2GlNnWQRcDHigNxvk=; b=VN1GIgCeEgOMNW7R
	rl90UYWSjqYLzpZJst5i/oNnzS2+YJm4hxij3KFwC1rs4uVnJ2kvevDtylePTc3t
	2MibDyIbck2LKYEo38AHuqEicubnowr7Rtb1ajOD72iXX4uUZMolughWTplSTMe7
	rxVhv7dJqD8ZcXi7gKh4u53Y9Nn7jewsmZq9rlJoh4A2DGu/dTFSYYb/RljPf34Z
	xqH3SNp78F/IZzhjF0MQn/STwypElO8PQqE6M41mNKUP8YWgpnvHL2jibxfBer7E
	WKgOF7UrB13XfAohrGiIXAKdtZzkuMi7ykuvNHnnWlphqgnpS1/JnbSMRGYxBD2X
	s8QzWg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v7gym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:11:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f3613e6aso2684325b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 04:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753182699; x=1753787499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi53JRV3Vx8pK1+2DIKrj/tvup2GlNnWQRcDHigNxvk=;
        b=c5P8DCXmUZSB0NKrqQnqpgsw+2u2k2Pe1gdHjfiwc6g+Evpd7V6cXlznRE1iZIwLrC
         aviTdutjrNTm8RWaTbfjFki/5gzmH44/g23DUSdrtZq0XujBh0GqBKGvvhQ7R5M8KkLU
         UikeqIAsNUHeCFbdIdyjQq3LGcQp09HcmG99WJjm3FIK5R1hxaLjoGc8rf0pJgPHvxmB
         ZbOMAiPytFZgmz33UdU9p7T7s8owiyGLo0CjaQSv6jGoereL+4Sfqsua2oehbV7kg/aF
         oiQp3ffbOBCoJ4tyVlK25Vi4ar0CwBuafJ+8hML7AAzbhAkgrT3QrGHSuPSlksptI2nN
         /4bw==
X-Forwarded-Encrypted: i=1; AJvYcCUdL05erDdbIqy1sE8KRixr4qorMhV5wTxSsWTtlcxO9cgtHexujCNa1tXf5i8dSHpgHo5IYkBLIKO5JlMm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm1oPGq0/4NHGCuq+CBhhTptkVrMqmjGck/2K2nYnENQlQsVwM
	1expq9ZJlLxLQucBNk3WKA7cpHMtB6AcgX/nB9UyH9OaoviXo3opDBtdXhPvrjVO/L+Cp9dsDiE
	jwJ6hJyqpzgFic6zn24G0nwMURDKcIrz57jMKH7w9lZFMjo30Fi00wK7dtOIGbZUcmUjm
X-Gm-Gg: ASbGncsMXoqeann4s2SyeYnHL2AXW/wu0fm+MR9P/lR9yMsb/1MVdph+9e7T6v8S5dD
	uNVGnBnnqkzCqAk87c5xWBzDa5vI35Ce/TOXrD3kSc85iq7eKo5DbpIx1cNLllk042nen8T9D6+
	gC5Y0tHQdpzDhEzZHg2LUMYikD9dWJFlQaFpmTXuRmioFu9pDRu27yc8+PvETqyWvwMjPijqzda
	dY6ZA1fgXsiceJkYTfjw+FUyUu6g9lpZxc2Rdvx2fURnbImWkwDgwVng3Beo02Y2ecqfSyyNaBk
	/72cDZw1TsswFZNx4t/cWDlyr0LefteyhvuBEQ28myeYCi3IEnZ8xwF9V19Do44FW0uDr2nZgwg
	oRM0=
X-Received: by 2002:a05:6a21:e85:b0:21f:ee3f:8ad5 with SMTP id adf61e73a8af0-23812c48c36mr39345034637.20.1753182699037;
        Tue, 22 Jul 2025 04:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzvWUcEPNXtNIE/BBj0biFMIcwHJBPX8MO6tw2I2eYccmF/S3eY5ug3RzJMiSa80xvG6s1rw==
X-Received: by 2002:a05:6a21:e85:b0:21f:ee3f:8ad5 with SMTP id adf61e73a8af0-23812c48c36mr39344983637.20.1753182698520;
        Tue, 22 Jul 2025 04:11:38 -0700 (PDT)
Received: from [10.219.49.237] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678d9bsm7465223b3a.109.2025.07.22.04.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 04:11:38 -0700 (PDT)
Message-ID: <8d488066-6f29-4ef8-8f09-26328b5213f1@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:41:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
References: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250718104628.3732645-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250721-hairy-aardwolf-of-enterprise-bbc99f@kuoka>
 <d614d8e3-963d-4d34-9b15-1544c7a22cf0@oss.qualcomm.com>
 <a006f099-578f-45aa-b165-64e28b8f930e@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <a006f099-578f-45aa-b165-64e28b8f930e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OuD5F_QnGGubBdg-1JPWhqUyPMXLE4qH
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f71ec cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=yfeqtnweelXl-nV2tnwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5MSBTYWx0ZWRfX5rollvTjL7lN
 0S/6RXGWMwFkR/ljp5/saYmtFsSQR7MHOrZbwZ0jLejuHHNUqUtnk1Yy9En5Kamdza6Fx7PlUZ8
 fGMGCFaqUwNhkd8VG1pMkX9QdhAiAwBOAgy6M+zk6BuhoXjouqbzd77gs7zhVStA7+n/zL955pU
 AGblsshnPUc/kUnEititzQ2/BJrBTmaEMBn6i4ig+on9Ah9CDGtQSP7NKss3AUOkDqivNsMfNBi
 M+Q3xL8VrPVC5/ooTDisB3Y8+n9jfAW1zGNzw4KdK0WqHtXCFMR4wGHHtaxFQsAVEy/lDwZfGNH
 SwmFp3NlQPmrTmIMG8LKv5GgTxwVi+IqpdtCuZZWRvIgH5es8XvcrM7Xa7LxVLlJVoCCgj9m2uu
 3ckkN8FO5erImpoxVOOD/4dc5DUJAvkhoZ4OPlUY5ZM3NqFNUvLL3GMcgWhvDvBUcHbxGy8g
X-Proofpoint-ORIG-GUID: OuD5F_QnGGubBdg-1JPWhqUyPMXLE4qH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220091



On 7/22/2025 4:36 PM, Krzysztof Kozlowski wrote:
> On 22/07/2025 12:56, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/21/2025 1:53 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Jul 18, 2025 at 04:16:28PM +0530, Mohammad Rafi Shaik wrote:
>>>> On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
>>>> WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
>>>> To handle such cases, use the reset controller framework along
>>>> with the "reset-gpio" driver.
>>>>
>>>> Register devm action to safely disable the regulator on device removal
>>>> to prevents a potential release warning from _regulator_put().
>>>
>>> It is not possible to remove the device - suppress bind attrs. How did
>>> you trigger that?
>>>
>> Ack,
>>
>> I encountered the warning as regulator was being released unexpectedly,
>> triggering _regulator_put() warnings. While the device itself isn't
>> removed, Registering the devm action ensures safe cleanup without
>> triggering warnings.
> 
> Logs are cut - you do not see the most important part, who puts the
> regulator?
> 
> How unregistering regulator solves the incomplete get/put paths? It
> feels like you are hiding real problem instead of fixing it.
> 
>>
>> Please check the below logs.
>>
>> I could use some suggestions for this issue. please help with some
>> suggestions how i can approve this design.
>>
>> Thanks,
>> Rafi.
> 
> 
> ...
> 
>> [   10.679294][   T90] ------------[ cut here ]------------
>> [   10.684772][   T90] WARNING: CPU: 1 PID: 90 at
>> /drivers/regulator/core.c:2450 _regulator_put+0x50/0x60
>> [   10.694344][   T90] Modules linked in: snd_soc_hdmi_codec
>> phy_qcom_edp venus_dec venus_enc videobuf2_dma_contig rpmsg_ctrl
>> qrtr_smd fastrpc rpmsg_char videobuf2_memops qcom_pd_mapper nb7vpq904m
>> msm lontium_lt9611uxc ucsi_glink typec_ucsi pmic_glink_altmode
>> qcom_battmgr aux_hpd_bridge ath11k_ahb ath11k hci_uart rtc_pm8xxx btqca
>> coresight_stm bluetooth qcom_pon stm_core venus_core pwrseq_qcom_wcn
>> drm_exec mac80211 ocmem v4l2_mem2mem gpu_sched videobuf2_v4l2 videodev
>> nvmem_qcom_spmi_sdam qcom_spmi_adc_tm5 snd_soc_sc8280xp
>> drm_display_helper qcom_vadc_common snd_soc_qcom_sdw coresight_tmc
>> snd_soc_qcom_common videobuf2_common qcom_stats coresight_etm4x
>> qcom_q6v5_pas phy_qcom_qmp_combo usb_f_qdss mc drm_dp_aux_bus
>> ecdh_generic qcom_pil_info qcom_q6v5 ecc coresight_replicator aux_bridge
>> coresight_csr qcom_sysmon coresight_funnel pwrseq_core gpi typec
>> i2c_qcom_geni qcom_common coresight icc_bwmon llcc_qcom qcom_glink_smem
>> qcrypto pinctrl_sc7280_lpass_lpi mdt_loader snd_soc_lpass_wsa_macro
>> sha256_generic pinctrl_lpass_lpi
>> [   10.694524][   T90]  snd_soc_lpass_va_macro display_connector
>> snd_soc_lpass_macro_common authenc drm_kms_helper libdes qrtr libarc4
>> icc_osm_l3 qcom_rng pmic_glink cfg80211 rfkill drm fuse ipv6
>> [   10.804083][   T90] CPU: 1 UID: 0 PID: 90 Comm: kworker/u32:4 Not
>> tainted 6.14.0 #1
>> [   10.811959][   T90] Hardware name: Qualcomm Technologies, Inc.
>> Robotics RB3gen2 (DT)
>> [   10.819920][   T90] Workqueue: events_unbound deferred_probe_work_func
>> [   10.826643][   T90] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT
>> -SSBS BTYPE=--)
>> [   10.834510][   T90] pc : _regulator_put+0x50/0x60
>> [   10.839362][   T90] lr : regulator_put+0x30/0x48
>> [   10.844118][   T90] sp : ffff8000809e3670
>> [   10.848244][   T90] x29: ffff8000809e3670 x28: 0000000000000000 x27:
>> ffff70941a04a080
>> [   10.856300][   T90] x26: 0000000000000000 x25: ffffbfa860a9bee8 x24:
>> ffffbfa860e79cb0
>> [   10.864354][   T90] x23: ffff709406e62640 x22: ffff709418668808 x21:
>> ffff8000809e3710
>> [   10.872409][   T90] x20: ffff709415e81840 x19: ffffbfa86119b680 x18:
>> 00000000ffffffff
>> [   10.880462][   T90] x17: ffffbfa86013d058 x16: ffffbfa8601cbac4 x15:
>> ffff709419a70b48
>> [   10.888517][   T90] x14: 0000000000000000 x13: ffff709400032b10 x12:
>> 0000000000000000
>> [   10.896573][   T90] x11: 0000000000000000 x10: ffffbfa85fdbcc60 x9 :
>> ffffbfa85fdbc7e0
>> [   10.904627][   T90] x8 : ffff709418668ab0 x7 : ffff709418668ab0 x6 :
>> ffff709418668ab0
>> [   10.912676][   T90] x5 : ffff709418668ab0 x4 : ffff709418668ab0 x3 :
>> ffff709415e807c0
>> [   10.920727][   T90] x2 : ffff709406e62640 x1 : 0000000000000001 x0 :
> 
> Everything above is irrelevant.
> 
>> ffff709415e81840
>> [   10.928781][   T90] Call trace:
>> [   10.932024][   T90]  _regulator_put+0x50/0x60 (P)
>> [   10.936877][   T90]  regulator_put+0x30/0x48
>> -----------
> 
> And this is only relevant information which tells nothing. Are you sure
> you pasted FULL log?
> 

sharing the full crash logs
---------------------------
[   10.679294][   T90] ------------[ cut here ]------------
[   10.684772][   T90] WARNING: CPU: 1 PID: 90 at 
/drivers/regulator/core.c:2450 _regulator_put+0x50/0x60
[   10.694344][   T90] Modules linked in: snd_soc_hdmi_codec 
phy_qcom_edp venus_dec venus_enc videobuf2_dma_contig rpmsg_ctrl 
qrtr_smd fastrpc rpmsg_char videobuf2_memops qcom_pd_mapper nb7vpq904m 
msm lontium_lt9611uxc ucsi_glink typec_ucsi pmic_glink_altmode 
qcom_battmgr aux_hpd_bridge ath11k_ahb ath11k hci_uart rtc_pm8xxx btqca 
coresight_stm bluetooth qcom_pon stm_core venus_core pwrseq_qcom_wcn 
drm_exec mac80211 ocmem v4l2_mem2mem gpu_sched videobuf2_v4l2 videodev 
nvmem_qcom_spmi_sdam qcom_spmi_adc_tm5 snd_soc_sc8280xp 
drm_display_helper qcom_vadc_common snd_soc_qcom_sdw coresight_tmc 
snd_soc_qcom_common videobuf2_common qcom_stats coresight_etm4x 
qcom_q6v5_pas phy_qcom_qmp_combo usb_f_qdss mc drm_dp_aux_bus 
ecdh_generic qcom_pil_info qcom_q6v5 ecc coresight_replicator aux_bridge 
coresight_csr qcom_sysmon coresight_funnel pwrseq_core gpi typec 
i2c_qcom_geni qcom_common coresight icc_bwmon llcc_qcom qcom_glink_smem 
qcrypto pinctrl_sc7280_lpass_lpi mdt_loader snd_soc_lpass_wsa_macro 
sha256_generic pinctrl_lpass_lpi
[   10.694524][   T90]  snd_soc_lpass_va_macro display_connector 
snd_soc_lpass_macro_common authenc drm_kms_helper libdes qrtr libarc4 
icc_osm_l3 qcom_rng pmic_glink cfg80211 rfkill drm fuse ipv6
[   10.804083][   T90] CPU: 1 UID: 0 PID: 90 Comm: kworker/u32:4 Not 
tainted 6.14.0 #1
[   10.811959][   T90] Hardware name: Qualcomm Technologies, Inc. 
Robotics RB3gen2 (DT)
[   10.819920][   T90] Workqueue: events_unbound deferred_probe_work_func
[   10.826643][   T90] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT 
-SSBS BTYPE=--)
[   10.834510][   T90] pc : _regulator_put+0x50/0x60
[   10.839362][   T90] lr : regulator_put+0x30/0x48
[   10.844118][   T90] sp : ffff8000809e3670
[   10.848244][   T90] x29: ffff8000809e3670 x28: 0000000000000000 x27: 
ffff70941a04a080
[   10.856300][   T90] x26: 0000000000000000 x25: ffffbfa860a9bee8 x24: 
ffffbfa860e79cb0
[   10.864354][   T90] x23: ffff709406e62640 x22: ffff709418668808 x21: 
ffff8000809e3710
[   10.872409][   T90] x20: ffff709415e81840 x19: ffffbfa86119b680 x18: 
00000000ffffffff
[   10.880462][   T90] x17: ffffbfa86013d058 x16: ffffbfa8601cbac4 x15: 
ffff709419a70b48
[   10.888517][   T90] x14: 0000000000000000 x13: ffff709400032b10 x12: 
0000000000000000
[   10.896573][   T90] x11: 0000000000000000 x10: ffffbfa85fdbcc60 x9 : 
ffffbfa85fdbc7e0
[   10.904627][   T90] x8 : ffff709418668ab0 x7 : ffff709418668ab0 x6 : 
ffff709418668ab0
[   10.912676][   T90] x5 : ffff709418668ab0 x4 : ffff709418668ab0 x3 : 
ffff709415e807c0
[   10.920727][   T90] x2 : ffff709406e62640 x1 : 0000000000000001 x0 : 
ffff709415e81840
[   10.928781][   T90] Call trace:
[   10.932024][   T90]  _regulator_put+0x50/0x60 (P)
[   10.936877][   T90]  regulator_put+0x30/0x48
[   10.941276][   T90]  devm_regulator_release+0x14/0x20
[   10.946486][   T90]  release_nodes+0x60/0xfc
[   10.950886][   T90]  devres_release_all+0x90/0xe0
[   10.955737][   T90]  device_unbind_cleanup+0x18/0x60
[   10.960846][   T90]  really_probe+0x210/0x2c0
[   10.965341][   T90]  __driver_probe_device+0x78/0x120
[   10.970539][   T90]  driver_probe_device+0x3c/0x154
[   10.975561][   T90]  __device_attach_driver+0xb8/0x140
[   10.980854][   T90]  bus_for_each_drv+0x88/0xe8
[   10.985520][   T90]  __device_attach+0xa0/0x190
[   10.990185][   T90]  device_initial_probe+0x14/0x20
[   10.995209][   T90]  bus_probe_device+0xb4/0xc0
[   10.999876][   T90]  device_add+0x5a4/0x780
[   11.004187][   T90]  device_register+0x20/0x30
[   11.008767][   T90]  sdw_slave_add+0x1a4/0x244
[   11.013352][   T90]  sdw_of_find_slaves+0x100/0x198
[   11.018377][   T90]  sdw_bus_master_add+0x1c0/0x310
[   11.023401][   T90]  qcom_swrm_probe+0x2a0/0x5a4
[   11.028158][   T90]  platform_probe+0x68/0xdc
[   11.032654][   T90]  really_probe+0xbc/0x2c0
[   11.037052][   T90]  __driver_probe_device+0x78/0x120
[   11.042249][   T90]  driver_probe_device+0x3c/0x154
[   11.047273][   T90]  __device_attach_driver+0xb8/0x140
[   11.052568][   T90]  bus_for_each_drv+0x88/0xe8
[   11.057235][   T90]  __device_attach+0xa0/0x190
[   11.061903][   T90]  device_initial_probe+0x14/0x20
[   11.066926][   T90]  bus_probe_device+0xb4/0xc0
[   11.071595][   T90]  deferred_probe_work_func+0x90/0xc8
[   11.076974][   T90]  process_one_work+0x16c/0x3f4
[   11.081828][   T90]  worker_thread+0x2c8/0x3e4
[   11.086410][   T90]  kthread+0x12c/0x210
[   11.090455][   T90]  ret_from_fork+0x10/0x20
[   11.094857][   T90] ---[ end trace 0000000000000000 ]---
--------------------------
>>
>> Thanks & Regards,
>> Rafi.
>>
>>> Best regards,
>>> Krzysztof
>>>
>>
> 
> 
> Best regards,
> Krzysztof


