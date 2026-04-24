Return-Path: <linux-arm-msm+bounces-104386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB0CMAMN62mvHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 08:26:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B98B45A38E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 08:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0428301DE10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 06:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7293563F6;
	Fri, 24 Apr 2026 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aChjovkQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJsQJyla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2343179DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777011938; cv=none; b=qXZeETstzVsuOpugA5NoK+4nQpSuXs2LpKLm3h7wNjGQ7/ugi+aLIPvJ+6Qk5FFc693LE0+mJYSj4/fMFLAo284Y7xzFgTM8mnBLCKElVQCvj83ClfngqbUYR4LSFd+LY3SqXWPMFCa0P7WGiCn7N9S/vFOj/PzuTxHDHsfNZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777011938; c=relaxed/simple;
	bh=OZAmZrRVMLMsOP3ym3ocwwjAr1z1NW//90f4SY0G6oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkugimxglygFiMI5uIvuOzoOkfETFqYZC1YtdzfGELqxZBxjczSrYAnOUlbTQ9RIh0U+ipENs+ZP0gCHkehKsojoASNJ9nNCXBT57hs9tbAy6lDBtSFTqd1BhQHlaDQjNlGPM7yO3WJ9cE1zjbv/Hm4d529tXQdDa4v84XM5pnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aChjovkQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJsQJyla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O33Y9S756615
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 06:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QE/7SGmm8dVdWu6dNQHkGBrlw+CGR7AbZZlvWxhh7T8=; b=aChjovkQQogDHf47
	1fwCIwT0LsF1a+xtQ/Cl6rUwXZc/AewDlLHLl+eLfsm3bmCTBccGyVg3Y59+M6yL
	jrq+txxaGo8TmbUicjZyZJNX5okUOiYs0aQv9lwQ8aGRwEkN13QN0iKqLCXwoKKF
	67bit+9IlTQmzo5Ui1348siuquoZileWn/CJMDZELquqkE/mIvY9HkNaO9A4wGZD
	7XiFIhTf9v04/TilYl5gwdKGrar6pQ8MtIArDtfWPlndtAbsd8vC6q700j7eZm/E
	Cw+ZKxDFn5zfsTmHdaJhntAIY7nYsNIN63pfP263oA1lc5xeXfcRt+1HlZwPNNiL
	R6Fe9g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bjfc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 06:25:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2e6bf9cb5b0so1181079eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 23:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777011934; x=1777616734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QE/7SGmm8dVdWu6dNQHkGBrlw+CGR7AbZZlvWxhh7T8=;
        b=LJsQJyla/AGl86VOYl79M5MJXjs+A9lmZNPCyQ1O+ZiB7sRoab52YJUPqQiCTC5Mhk
         m7FilErjGHVKf7pp+MbKuS7tFt2kHfeYRqIrniBfZLuMeSULs3D5BWImFVsxk6+6NjZt
         UCR6qHMD/Ki5j1quLgHVcos6+PYT/S1KZqylN+91jo4NE8ZGJx26geOKgn4BuleulXs8
         SjW8Vj0EPDnyz2jVhRpiWoHa86f3l6KrBU1iLAmPCP4TOJ5BP6tM3Q74XlvgWyMYxTJt
         ySjJTZ69nZesyNMVOJaj+UI63RECQcdqELTwVLv9A0HP4Df9dmvRTjA9HFJip2r7C0EZ
         MRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777011934; x=1777616734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QE/7SGmm8dVdWu6dNQHkGBrlw+CGR7AbZZlvWxhh7T8=;
        b=JoxHm4L5DmzTA9751gE4dXOBgMSo+ZufWQomSf/dDX2srg2pFeVq0It4W7rgLVO0Dm
         KmxRPr5DkXsWRkAcioDVozQgMqja8fAx7IsxtX79o3BvriV0WM227ossr4eiB7izxuhn
         /Y/sYzYRhgoTJu8yHdaS9DX3mnnw3MF2V/NXtq2NVUx2OLUHhtirEobDnEVMCuLtzFb6
         nqfOHVzvW320enxP2LegA87cuAMzugvZHVdrdr6kUG8PBn4zTEO93sY8FobCVgoxYAsE
         +eUEJs1cSqBkDHI1uE8KXN/6NlYko/fRdvPYDOdiH0I6E9JBMz9ByuAR5LM/vrjSbA4S
         xAWA==
X-Forwarded-Encrypted: i=1; AFNElJ/fLwU0iJaqwjfLvIV8xX+vUZdYVqlkiZ0Dwv9pnoyBOVRcvjQsMml1CfDXBM75xR/AHa6ghgOPMalckmG3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz29G5CHYXh+qdLwvkhS6yv27ZIYHc9fL+nl37J7ex8uGdTOFpL
	j+wlhaLA+BI+WE6addZeYJzbZVF6O/2f1MAzyDne2J+J3mjBGp2/80zRQe1HNt4GxzKbltS6gmr
	RyOPoAEVFOrQpBt9RUJ7NbEGlgIHDv6PnoyjbXK0tXQKl8x5W3sQENz5OO69w11U62S2T
X-Gm-Gg: AeBDietGzXWYgWuA5ALhI2FO1gCXxxWt5i2rMfE/TmdiubmdpSrKvgBlCuflQ65s1jE
	cMELynqj6z5ACMP3/gpKkCLivn/DzIdt5BIqJfcVd0zADRc8BDVF+wPxaG1j6Fg0kqfOc+pDV64
	/JvEI1E7/0oED/MjEnWDhcoxFH91w61rha1q6hsM05QEEXgMC/ZqMXegNek65HvbRGiGUyBYnkX
	bbTNBU5JObVM91jh97tUAu52gBH441zA1OWjfggtpnuEoLUe86A0jQ697Dsm6NdRHc4OO0UDFkT
	9XZOGRpYUaDM2SXLP7SiFqTaRXXAuoPxS4n7o7+hOj+Mdq3oSvTKh5DgRZLFkFpORi7FLau+0kC
	Fbv5Dpr0LzRWQw0xtkgHFaFsUMMHWvU5psffNb/Zu367qe1S9drIuPA==
X-Received: by 2002:a05:7301:4185:b0:2c4:ec89:bdb with SMTP id 5a478bee46e88-2e464eaab00mr6832437eec.2.1777011934047;
        Thu, 23 Apr 2026 23:25:34 -0700 (PDT)
X-Received: by 2002:a05:7301:4185:b0:2c4:ec89:bdb with SMTP id 5a478bee46e88-2e464eaab00mr6832422eec.2.1777011933405;
        Thu, 23 Apr 2026 23:25:33 -0700 (PDT)
Received: from [10.239.97.27] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b944bsm30814307eec.28.2026.04.23.23.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 23:25:33 -0700 (PDT)
Message-ID: <f782bd4e-817d-44b8-9c04-6f05c00fc36e@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:25:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] Fixes/improvements for the PCI M.2 power sequencing
 driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable+noautosel@kernel.org
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1NyBTYWx0ZWRfXxHeGjZtJ9XYz
 sLtDc/dPHk3rDPbdKJ2teRaHw3akrkKPEsnhdE/rMHVOlvrg7czrj65rtesMULItZIQjqxhgNVk
 UrhPTvRLz/Jy/zJtKMWbGWSpEnMc0P0RTzyxf5X3lSLH2ly4dTR2hh2c/BnUzCJRzoT+keE2Ta/
 OKbGbUurbmeKpBriLtwOB5Qwkz6xGAPXAocSl0FFd/+CpWQsMwNjRgToReDm6WsIPwtBLg2AMrv
 sLeyepnIkljXnzJARzBF34fl3UPGLQL5bc5Y7XYhypU5L3ZStfU4/oXTa9re3AHFo2tZeYm+f8v
 kV/BH6WOn5yzco4CjvZ7Q+O7TyrSaGMv/PR6ABrIUAjIej8yB/vVs1OAScIkejsElknyZBPBdVE
 I2j+aCQqen8bYe8IqXQx3GHSJh8ZEjM/YYI5vT7lG32Ohj763xHAK+DZXOLIKj4x1+Wnk5eItPW
 YnVWpS9Ay6qGCxZyA3w==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb0cdf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=qRrKk6tSi6DhAyMAVQEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: gTluZ6zPXMssrGfT7zhI-kYHJGxlwsbl
X-Proofpoint-GUID: gTluZ6zPXMssrGfT7zhI-kYHJGxlwsbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240057
X-Rspamd-Queue-Id: 6B98B45A38E
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
	TAGGED_FROM(0.00)[bounces-104386-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,noautosel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Mani,

Tested with WCN685x on both M.2 card (pwrseq-pcie-m2) and direct attach
(pwrseq-qcom-wcn). BT works correctly in both cases.

Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>

On 4/22/2026 7:24 PM, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series has several key improvements and fixes to the M.2 power sequencing
> driver and also the BT HCI_QCA driver. Notably, this series allows the M.2 power
> sequencing driver to work with more M.2 cards, not just WCN7850. It also allows
> the BT HCI_QCA driver to detect whether it can control BT_EN (or W_DISABLE2#)
> signal on the connector and set the HCI_QUIRK_NON_PERSISTENT_SETUP quirk.
> 
> Testing
> =======
> 
> This series was tested on Lenovo Thinkpad T14s together with the below DTS
> patches:
> https://github.com/Mani-Sadhasivam/linux/commit/29534d15307551b2355eb254601dec511169f0aa
> https://github.com/Mani-Sadhasivam/linux/commit/f4eaacfe647674be200847092b43cdef2194fc55
> 
> Merge Strategy
> ==============
> 
> Since the BT HCI_QCA changes depend on the pwrseq changes, it would be good to
> merge the whole series through pwrseq tree or through an immutable branch.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Manivannan Sadhasivam (12):
>       power: sequencing: Introduce an API to check whether the pwrseq is fixed or controllable
>       power: sequencing: pcie-m2: Add support for 'is_fixed()' callback to 'uart' target
>       power: sequencing: qcom-wcn: Add support for 'is_fixed()' callback to 'bluetooth' target
>       power: sequencing: pcie-m2: Fix inconsistent function prefixes
>       power: sequencing: pcie-m2: Allow creating serdev for multiple PCI devices
>       power: sequencing: pcie-m2: Improve PCI device ID check
>       power: sequencing: pcie-m2: Create serdev for PCI devices present before probe
>       power: sequencing: pcie-m2: Create BT node based on the pci_device_id[] table
>       Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
>       Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'
>       Bluetooth: hci_qca: Check whether the M.2 UART interface is fixed or not
>       Bluetooth: hci_qca: Fix the broken BT_EN GPIO detection for Qcom WCN devices
> 
>  drivers/bluetooth/hci_qca.c                |  40 +++--
>  drivers/power/sequencing/core.c            |  33 ++++
>  drivers/power/sequencing/pwrseq-pcie-m2.c  | 242 ++++++++++++++++++++++-------
>  drivers/power/sequencing/pwrseq-qcom-wcn.c |   9 ++
>  include/linux/pwrseq/consumer.h            |   6 +
>  include/linux/pwrseq/provider.h            |   2 +
>  6 files changed, 262 insertions(+), 70 deletions(-)
> ---
> base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
> change-id: 20260422-pwrseq-m2-bt-abdaa71094eb
> 
> Best regards,
> --  
> Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> 

-- 
Best Regards,
Wei Deng


