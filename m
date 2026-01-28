Return-Path: <linux-arm-msm+bounces-91078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEplEvOCemnx7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 22:43:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 56451A92DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 22:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDBAE300468E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 21:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C046B337BB5;
	Wed, 28 Jan 2026 21:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCJYk2cg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATCQx+AP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5362F233149
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 21:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769636590; cv=none; b=eHZlxHSii7ygFD+xmfFo9eQpP7qNewNiZpnN7O34BmPZulCHxLyFkG1phDMeAzHKhy8I/EXlVt+zm0C8dkLi8IJD03VT/cvCDW/1xaNu+KBB6BkvoyB8pA+8xi+bw5pIovco8LWfhp/xXVW5WHQLzunC1pTUFTwgKPdjZkOg0/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769636590; c=relaxed/simple;
	bh=Z9jI3SbKMM6MP6CDPde2yJcyGBPqAJJ0bkp7IRWWQLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJiBzKulL3+zfyGFy2fJm58x2JZkh5GSsgWyMw0iiEZSLKbp8reAYlBZtt0Uo/pJZEc28IGL/4OhbkHO8NRXms1aliXZIGwGcCePtLEGKnEDzJ7Bwn1fq4gtuLyy+ujGpdfjTC9b6RkSrtuekAhCcvjHhmWpXOgHkDBb7JeUxA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCJYk2cg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATCQx+AP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SHeX9U1751664
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 21:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	694p56qmOVCQOsKwAm7dFp6MAQxFwO6++hWNZYgjm9E=; b=gCJYk2cgjy0uoyQT
	BO1Lro3w9aF0v5JgMJ0dKpha4oR4iOuuASg/JKOYPf0fcPfyioXf6hAJGbsY5V3K
	zTguP+7J+atDGPaAfQzNPh6JT423pZ5njoiwrIWYqC/Uluva99Ncwrgm5mS+8p7G
	U2aQcjQcaiKctzbgbX/op9t/blcH3iknjdccraDN8ay9xeUmzs1XoLR1iBFvQLif
	yCI/jNzXhhafjYRI/m1vnbsz02Slo0RRyAhLXk83A7OztSbTHyjs5WHrQ0QCs1/m
	lxiROXsjuJNSvnesy1ei012chuYNnYIA5B6WDs7FhUNMPlVei2QIUWsXCL/7LL1w
	2RPUDA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byhsja2bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 21:43:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so2532338eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769636587; x=1770241387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=694p56qmOVCQOsKwAm7dFp6MAQxFwO6++hWNZYgjm9E=;
        b=ATCQx+APpQl6iHbdIn119d9EvCaDCj+QL+p20artC6cwhsv4j4nUW11lQDCbtg0xgG
         knITBUEBO/nCuNuPrR9Mp4B7BUZsBnQHUXjiFYBGlmWc9ajUc6gp7XWmbnxUjmYEUu1X
         e8K/sn4nk4n0l+vouBJzGcofzbO+PEg6GrWPi8A8zbtjsGQJE0srdQ4ED37bZ50Cha4h
         XoUnydIezfIICRM0N3+fBW9ysMr2B0UDG04agi8Z2YPkJDQOry3xUO6fLmSl1qgf8uP0
         AQTUWka1eed6AZsCgI3C8avaa2WXl82+s87wWo5z8u6SDewLehRtQ0GM7d5Qi8I0MnJm
         4r+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769636587; x=1770241387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=694p56qmOVCQOsKwAm7dFp6MAQxFwO6++hWNZYgjm9E=;
        b=EFfbjNLpc3niu6bmA5Tnf/iOW1qKCzMF9bNJNRnNmZB/1IuxCDlk38TaADkw/pSfYt
         Wgi4yGtKzCZGcpwGbXJzA5YciiP0EIxzR5oItuuGZOogzYbPNCN/oPIzYQ9zHxHqxBS1
         NcKSANd9K/CmY03TLeOKwoUYNkECQntX6NmHkzg8jxdCUc9sKNNmo3GXo626n1slk/j5
         vw0s2FFZeR2/JyFTwW0L48A5NQD50+nB/8FgpphIt1RKpbzJHA/U0mlyfggS8T16lZdE
         ZtU0YHgphGC6KjEgvGm5Z3CLB5HWtm613GPrkFJgCRwW+7jR143JauMZ12pkbBSDuIue
         TAWg==
X-Gm-Message-State: AOJu0YyGXabQFDbDEoVkBU7vT+eMk2SSFDJRbIYCfAYNuYid9U/N0jjG
	BUtc8MAq6nD2bQCQqNFsrpL3sjBeu58s+yiNYuKWS1dKxwAlMNMYbpha8klK33srQEHMxML2Xq/
	pHGQsP7Py4fPlxExplzzDN61rVP7qbhVXfz93Y0WgkpIbngJL2e2RLqJ6LLDN9Oai47ev
X-Gm-Gg: AZuq6aJcuOtGQG3RweFfFeIKtvWbeJgvv2ucgeQV5fFSISYAObw2whl485gli+GXBF+
	/ss7ZgdjvYOTLAGG41wXFhqEEbpzKxZASaLphVNkyolnShEBSg885q6c3QR92QynOmBdp3i988t
	vmNUaoIAM2noANHLpMsjkTJj3HaS/0alIrMM5PepDTAg5eAhJ+edo2TzYFDPtPCcJNK7yUQlgOQ
	O4EWH1s5EZIrtqvvJcYQ5Te+QrbTcgM0457fSdXT5u8ekPotdvZdvwzvjHjQkwZYdYhA8FQXEKD
	j3fSiXzvCQpMMMLweNVREu5Rqb4ncRS5s8t+2+3q4tISvvD3NLoCa9q6lIUnDfGkDRqcG4gblCX
	MLEFtVpY1Bh3oOBNSoOOUTmaC7mIPk55gYQxa9leSYSMKHml0w6iqWWiJx2vELOFJjR81
X-Received: by 2002:a05:7300:6428:b0:2ae:824e:31ba with SMTP id 5a478bee46e88-2b78d8cb64emr3980095eec.7.1769636587366;
        Wed, 28 Jan 2026 13:43:07 -0800 (PST)
X-Received: by 2002:a05:7300:6428:b0:2ae:824e:31ba with SMTP id 5a478bee46e88-2b78d8cb64emr3980081eec.7.1769636586750;
        Wed, 28 Jan 2026 13:43:06 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1adc5ecsm4795082eec.24.2026.01.28.13.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 13:43:06 -0800 (PST)
Message-ID: <dd89949a-11da-4c57-9b1a-2fba181988cc@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:43:05 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Junhao Xie <bigfoot@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YaU3QvzqB1RLA5af6tMyDTx8F9waGhhv
X-Authority-Analysis: v=2.4 cv=GbMaXAXL c=1 sm=1 tr=0 ts=697a82ec cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8
 a=y_qrqjq6FbBQszKUsJIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: YaU3QvzqB1RLA5af6tMyDTx8F9waGhhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE3OSBTYWx0ZWRfX5jN/QYrN5qv0
 j7vCfZFuZQHYSn1jh4fpgtbS3h7YOsJti1udUO41o6xdzmjaoqHJvuSLneu1AbIxOn+mY64pebK
 QghxDFbDwwNmUr9wSEqGLwPz8drxLumHJJ1JP9rZHUWwKvA9ad0xhDzd5dFQEp0wtO8y6ewjqmx
 vk5bRfGs+f2gniS6HD7gAWufVNEt5xGBXjiXcy5RqU2xFX6wOos80cwZ+ZRp9l/uX9h6H4CLEAt
 bu1QIqPbjTFglOrkLR7ctn7gzHgS5+Z6B5zNvO7OdA6iwg4rIHpTJZsDCULNK9gSikopri38AFJ
 XFHShFUz+voCEyuNZ4s/taGONfdY/Fm3DX63VSH9g1xwmktdQnpS9UI0KfUC+gkTNJ+o2xW8oZH
 +qrXdeR4Lra/E5aPKtddsy2wxaKISf0oaoQbtkP5TCLbUFAND6Sh1aZKixmjNNdR8Je7hIS+ALT
 sT/Sm43dCzTuHjdt6dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280179
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91078-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56451A92DD
X-Rspamd-Action: no action

On 1/26/2026 3:44 AM, Junhao Xie wrote:
> This patch series adds support for accessing storage devices managed by
> Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
> introducing a new MTD driver.
> 
> On some Qualcomm platforms, firmware or BIOS-related storage (typically
> SPI NOR flash) is not directly accessible from the non-secure world.
> All read, write, and erase operations must be performed through SCM
> interfaces provided by the secure firmware. As a result, existing MTD
> SPI NOR drivers cannot be used directly on these systems.
> 
> This series introduces a new MTD device driver that exposes such
> firmware-managed storage as a standard MTD device in the Linux kernel.
> The driver is built on top of the existing Qualcomm SCM infrastructure
> and integrates with the MTD subsystem to provide a uniform interface to
> userspace.
> 
> This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
> QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.
> 
> Note that this platform previously used the standard Qualcomm Linux
> firmware, which allowed direct access to the QSPI controller without
> needing this driver. However, we plan to migrate to a Windows-compatible
> firmware which is more feature-complete but restricts direct access.
> Device tree changes for this transition will be sent separately.
> 
> If kernel boots with EL2, access to the SCM storage will be denied. This
> needs more investigation.

So you plan to enable this driver only w/ the Gunyah based configuration
and disable for the KVM one through the devicetree overlay ? I just
don't want to break the KVM boot flow on other platforms supporting
qcs6490. 

> 
> Changes in v2:
> - Convert enum qcom_scm_storage_result to macro definitions
> - Use __qcom_scm_is_call_available() instead of a machine allowlist
> - Add missing __packed annotations and endianness handling
> - Introduce struct qcom_scm_storage_payload to improve readability
> - Always compiled-in qcom_scm_storage_send_cmd() and qcom_scm_storage_init()
> https://lore.kernel.org/lkml/F138514E18CB55B6+20251218180205.930961-1-bigfoot@radxa.com/
> 
> Tested-by: Xilin Wu <sophon@radxa.com>
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> ---
> Junhao Xie (2):
>       firmware: qcom: scm: Add SCM storage interface support
>       mtd: devices: Add Qualcomm SCM storage driver
> 
>  drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>  drivers/mtd/devices/Kconfig            |  17 +++
>  drivers/mtd/devices/Makefile           |   1 +
>  drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h |  34 +++++
>  6 files changed, 481 insertions(+)
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260126-scm-storage-v2-0a4f3e900b88
> 
> Best regards,


