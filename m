Return-Path: <linux-arm-msm+bounces-91186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAKHHDZse2mMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 15:18:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8815B0D78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 15:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23924300E721
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 14:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A0A24EF8C;
	Thu, 29 Jan 2026 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJoRJwY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoOflR/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2EA3770B
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696262; cv=none; b=irNdZJvVjSJGbEathpOaDMQtX4w3hpYGu24LwtCN/Ku5lPXeLCR50y6B4aB68aMvllIJ8whEDg19DlK7MCg5Qkirzg5hV4STNqlkDfh8YCkoOhYLBCvibqn7MScC2ROePbodghDxilJAgJVY9fpmI+TFPZuPLVqR3LAYzbIKYB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696262; c=relaxed/simple;
	bh=QxW0f6pLDBRENUCo+Z37WURx1pG8/E2qFBSIDtV/2/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2HnZ+WAnJV3OATVW9S8ZiP9Z36sDhU6iiVTucjJGMbQ87ZxO97m3lphS8Va4kaIePX46LwfGGpDtN/699gscaT3vDXSRstRKe+S3oTbROknCHkoF8Wz7s8z8ULx6B4ZfevN6VJAJg0MYXLHNcFu5pfnAzBZwELkMCKWdK7fdkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJoRJwY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoOflR/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAI3AK2150699
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 14:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPxS5c0pRe16fDouaE61U8nM92dYddyMAnv3v5fItBU=; b=lJoRJwY/N5LLdmaz
	yP8ORpj6R15zgxFrSasCs3DZqbVnj6B09H1/2FTb+qCBPO4UkeYzaIfRSrLhhA3J
	S7FLdbv2Ow73wUSOeqd+AOYyiOD6MpNOVAVjH0JXAHuMzXBYprqkkGZtQ9FlheHe
	jcFwq0ph8mGDaTXtOtgUYDIeTGoFP8vBhONEZRQFLcehjK1KfF/X/OBvd1CCc5Lg
	5GMl6pcTlzuqbKBK1yCiA1tA+6n62GZvucwd/Prj4vJQAN6M9sbraLtA9frGO3YW
	rO6HCj3LcbiFI1aeOQLcUq0HXhDB3agMITSEjDrZW8wlGM3QBo5EXPBu3yJWEV0e
	irvtfg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3bq33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 14:17:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ee9e287d7aso20432137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769696259; x=1770301059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPxS5c0pRe16fDouaE61U8nM92dYddyMAnv3v5fItBU=;
        b=aoOflR/VWy8eWr4jWv93mfElXeXyuYFSDpHZ4f2JfeAVzTFVA5IscBv31r8bSswVwD
         AZ27DnnZRe8zYijlFCJ/7A5FXunZzx6B6pfMuFBdjqsVF0mKTNpdPCFXEjHfcZYHo3Xl
         O8VmX1E6bVoYpjTRkxFD4cCYPsbE2gJQrPnr4PUmyPgQVKrKiFLgn6PgGBhi4XSfHy/W
         brvR22eKtqWGZIPnjE38NL7MLaxE6N2a/Hc7xw/IotL/kIvEk4JM6xljaPrqJtd67KmH
         cKeUp3K5SJIfRzV6UANdTS50Q8T5kbRbTTj3SrWnxRb/MEiy/UB3IVMFneA4x3KhiFND
         NQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696259; x=1770301059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPxS5c0pRe16fDouaE61U8nM92dYddyMAnv3v5fItBU=;
        b=upVEH1tLtfVUzwGpRmxiNJ45JwEJNJipr7TTDWrNYI07Ak/ZQSbJ6cdQAkZD0Vh0JI
         1TrjppbJhunwb3J1Ezb/NVZ1DA/XlXq9sryFqmQ642F2FMHkmotL458vsrsFMusMMchH
         Qh9/HBUOWRzORl0LkQrlxLHTcpSA2eGTiPgIds+1/JkfSbgOrRBypC3Zw6srVhLNEFSR
         93oJVsV9ywIIWXq+Hx993PHQ2ZLo9t7sXIkvnYTg21oOHLWzhiWA4GEQBSu0+zyFhwHt
         eDrDTHkbWFOGA+cHFd2YXEMw71AkI+In6zXJzeVxfy0B8hZedaYV4LF8dJlOsF+WUevt
         U2/A==
X-Gm-Message-State: AOJu0Yw9KO8sfXcQPYO9nyzFNd0xorB8b5/RljxcQikI8yzXqTtosD+l
	AiieQDRcmTPRSq2cSlkzg7yV5Ofhxpt26VaKeDXnkS6ugCynTFCO95zuoy2AB9hOCVy0fUn2Mxw
	GD24GfLKkv5kn/27vydKv/Tg2txx/hQ+I0a+eH3+fFeG4KbBCm1sGLiI6hlJCtOjUG95z
X-Gm-Gg: AZuq6aJ+Ifo7VvyXr2AoTgsTRv7/1j/Jj0URBMcFY+BWA31rvhThmFG7lrFlb13vaeB
	vvaEKGC4mGYOAjOezD6VarJWm7j9aIM6S7Q9piM3gjj9BqNGMVl49G5xtbPnzZirxckM5AyUJtF
	35tZySPnwrPqxs7KlzbsUz+/6jaZJ4ID+kX2Qnlzc6o6F5TWPOXSSvjL6hw6iPS/chRM7xgS5e6
	FNYsS/rrHCzL/d3jfIBu6QH1APFcVecY9r6vT1/cB6GLfJqs2nUjCcQN294p593YA0KS7e/zRrK
	K/v3J9r+Regx3ddHm+5oyTuIh8SgvoenzBGrfCqy9luBMNHzunWza+rSuX9uoT4MKgjeeiZ4XxY
	5blBOtPQAfCXoK54Wtcv0nUGqW7yt99WM6YefU05f1hQ+uCD5y3Oa31zmfXIuJr0kZew=
X-Received: by 2002:a05:6102:4186:b0:5ec:95a0:6aac with SMTP id ada2fe7eead31-5f87e834e64mr1047581137.4.1769696258908;
        Thu, 29 Jan 2026 06:17:38 -0800 (PST)
X-Received: by 2002:a05:6102:4186:b0:5ec:95a0:6aac with SMTP id ada2fe7eead31-5f87e834e64mr1047572137.4.1769696258373;
        Thu, 29 Jan 2026 06:17:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2d89sm1145142e87.49.2026.01.29.06.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 06:17:37 -0800 (PST)
Message-ID: <42c1c820-f235-4d7b-af58-c0b9a4d331cb@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:17:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Junhao Xie <bigfoot@radxa.com>,
        Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <dd89949a-11da-4c57-9b1a-2fba181988cc@oss.qualcomm.com>
 <2397C90D8A633438+88e8956b-5753-4842-a1c7-b0f6a78580c1@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2397C90D8A633438+88e8956b-5753-4842-a1c7-b0f6a78580c1@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697b6c03 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KV2aPqcVs2_3Sbi7RCIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: VRTa0AK4vDU6WWMreVWyG7GyFa5fG5wN
X-Proofpoint-GUID: VRTa0AK4vDU6WWMreVWyG7GyFa5fG5wN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA5NyBTYWx0ZWRfX1I46uMZ53M4S
 qZeYAM4tq9jIrmAEq8wpv8p6ztRNwKsGVOhetH8xW4uizisbCvleDhp2SS6rS48OR4d9P0h4cHV
 +UDemHLMdrvVOyyalOJNUBlOpvSkJy3JowVknqMjRIVpqSDFCGu+aMeoxzL+aWH8OHKrIl9f9Ob
 8lAxD7WjaZR31TBH8qnwffXqrjkP/UywZPz9vnHEfYXuiccav7SGZtpjL7W0/OuJyXr5Rpqti5c
 uxGSgbpfvrnm12QcXd3GvOulnWVqrZfV+2MN+mpvwSIeKuVb31YW+KRtGRWJY+G5ovBr2wBfQBd
 EfIJY+rISUolBHj8UvfJwlvVgOh02QMgBaG5VsqE4XUOltygkfbBnvUsrgDhOCLABZC5G437kOi
 osdvzIoyQxuRXa//4Yw6167eBhfbMGm2lYVsM67SpasennD51jZB+Uv4+wA3YN6GM+RUb7I6NMm
 jHyUCUS42MhjH4aw5mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91186-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8815B0D78
X-Rspamd-Action: no action

On 1/29/26 1:47 PM, Junhao Xie wrote:
> On 2026/1/29 5:43, Trilok Soni wrote:
> 
>> On 1/26/2026 3:44 AM, Junhao Xie wrote:
>>> This patch series adds support for accessing storage devices managed by
>>> Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
>>> introducing a new MTD driver.
>>>
>>> On some Qualcomm platforms, firmware or BIOS-related storage (typically
>>> SPI NOR flash) is not directly accessible from the non-secure world.
>>> All read, write, and erase operations must be performed through SCM
>>> interfaces provided by the secure firmware. As a result, existing MTD
>>> SPI NOR drivers cannot be used directly on these systems.
>>>
>>> This series introduces a new MTD device driver that exposes such
>>> firmware-managed storage as a standard MTD device in the Linux kernel.
>>> The driver is built on top of the existing Qualcomm SCM infrastructure
>>> and integrates with the MTD subsystem to provide a uniform interface to
>>> userspace.
>>>
>>> This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
>>> QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.
>>>
>>> Note that this platform previously used the standard Qualcomm Linux
>>> firmware, which allowed direct access to the QSPI controller without
>>> needing this driver. However, we plan to migrate to a Windows-compatible
>>> firmware which is more feature-complete but restricts direct access.
>>> Device tree changes for this transition will be sent separately.
>>>
>>> If kernel boots with EL2, access to the SCM storage will be denied. This
>>> needs more investigation.
>> So you plan to enable this driver only w/ the Gunyah based configuration
>> and disable for the KVM one through the devicetree overlay ? I just
>> don't want to break the KVM boot flow on other platforms supporting
>> qcs6490.
> 
> On systems booted with EL2/KVM, the SCM storage GET_INFO call currently
> returns -EINVAL. If a platform does not support SPI-NOR or SCM storage,
> __qcom_scm_is_call_available() will cause the initialization to bail out early.
> 
> There is no DT-based enable/disable mechanism, and this should not affect
> KVM boot flow on other platforms.
> 
> Other QCS6490 LE platforms do not support SCM storage, as the LE firmware
> does not support SPI-NOR boot. Radxa Dragon Q6A uses WP firmware and boots
> from SPI-NOR.
> 
> The root cause of SCM storage being unavailable under EL2/KVM is still under
> investigation.
> 
> [    0.770124] qcom_scm: convention: smc arm 64
> [    0.775005] qcom_scm firmware:scm: qseecom: found qseecom with version 0x1402000
> [    0.782990] qcom_scm firmware:scm: scm storage get info failed: -22
> [    0.999095] qcom_qseecom qcom_qseecom: setting up client for qcom.tz.uefisecapp

I think you need to create a shmbridge when running without gunyah, see
e.g.

4a7d6a78fbc6 ("firmware: qcom_scm: Add a prep version of auth_and_reset function")

where the memory is bridged right before the call. Without knowing any
better I would guesstimate you may need to qcom_tzalloc (which does that
under the hood) the 'struct qcom_scm_storage_info info' which you pass
to that func in qcom_scm_storage_init()

Konrad

