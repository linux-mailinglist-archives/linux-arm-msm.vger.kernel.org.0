Return-Path: <linux-arm-msm+bounces-115946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V74GD2VFRmrsNQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:03:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8216F65C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:03:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gWRH9M6D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HU5H0C2F;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115946-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115946-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3271332B9011
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002193C5522;
	Thu,  2 Jul 2026 10:53:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F21938D41C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:53:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989592; cv=none; b=CokreSrveueEDlvJgS3OJY+xSUesv/P281j9C++bcjlbQYO3cBwUqqLLuqTm4kURgSNtCxQ9wlyceP3/OjDwN3fKve6uTE5I5gUEIm2mUkD8W9Jb9oZjAxgy1hrb0v5gbknsCWtETS0hpY/Ng093VkRlih4rgQUEapKWA3RP594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989592; c=relaxed/simple;
	bh=zFtWR8B7S3inuvW9L53GlFoQESzmg0c5gutcIw8KDtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcXltpLiJZMA7WaNsA1Gbd5r2GIcgc57jrBtT0agSdyFVnJIkrSaLC4Rc7DABgJz8GrphYU3feNxzQZUe5SYSjLDDrlu5ejOlFrAlTd5SkVJZK8dIyt58x+3a2GX6qUhBMcYXZvhnUN7biBeIkcYJ+MZsotRh2VnpOjxGKwdTpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gWRH9M6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU5H0C2F; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AaspZ3592740
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqUGuL2xJAdALhsoufntZ+HMLOOjJ1E0hvIQp1Rg8qY=; b=gWRH9M6DV7XfC+ST
	p34aYWhvotQ2hV4I7hz8kwTFf3ux4SLXMTy/HULWgApNxanZXzxmqMOzDOAHaY7E
	0TCeoSqbLeSDzkDAE7bADJ/myXZ7BR++4pqEgXo64/aO4vlXSaIl7l50Jj4ZdS5b
	gehDuTORdr9/9ojUCyw5i2ixO5+BMoWoPnkWPn4Hzn+8W4Iam+FuFXiFXY4pRu3+
	IOm4svGrZRZQd40Z9XsqNNQLbUug7b1AM/oRhFknK3+bFgEYDk/ht2IHUupK8sRc
	hLlhKLO+jVDj/VpOYUHaIYocIueoc7adRLsbt+HBCMooWc6Lb0ehAacHGajcS5Jn
	uWX1jQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9b47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:53:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84696ed3b24so2244025b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989590; x=1783594390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqUGuL2xJAdALhsoufntZ+HMLOOjJ1E0hvIQp1Rg8qY=;
        b=HU5H0C2Fsfz8C/dTdUJMSMFlBo+JfN2k9tqtrG8+sXJ9h0Ndkd6Q7BUD/HFxAy1VcZ
         kUeOiOQQCVo1GdQQzw9XZNdIp2BnPerJygQ5qPFkWZBBQgml7D066PhtKnRE93pKiICp
         6dfR5NtHq6pgfJ8k/cjvPEGCg0YLjEEfrGjcUBLAm/ujr30jLNsPb/t+2qdzxOvKuzRU
         9occWG0nlkUEsRYMHFMHis4XMJqcxiEUnVvLvFMf9W7lF8rVAKbsYPzuNwwtYlNlvDlP
         Jf20SQtNsryzFOYsnPpN0XY/zoNMF06J+a92bxnuvpO7fAVvtrc0glW4u+WHHli66dGH
         L72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989590; x=1783594390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqUGuL2xJAdALhsoufntZ+HMLOOjJ1E0hvIQp1Rg8qY=;
        b=CoS+NW3/bLOcRYLG8htBif7AcfucNl7fK5DNhUO3/YafOCRnS8NsJxj0nmGvfjRJyZ
         TIrq9ERdf2KMRBlqCSAtJQ/OlyTZpZZMlfXkZL9w8VChsGRWHao9bszEkmEtqdSRV8h7
         bS/aQn74KPJDk2+DmnYG82iDHxEBT2QdUX5HYfZNaP+8nMqvnEuM0mm6weZ45A4Ji+Cp
         SAc/TWY/yZbjHIG5wh1U4C9NpTYQ+ci4EFgIurNUxknZdo1gfKVGnVSjvdM70LDNoHp7
         7tQZsivbAcSdb5TQIfGHLOGPt4j9Y+DOrgI9nbX2MAQnBC2GK1OLNENEvj3U2O5W5sOf
         wcog==
X-Gm-Message-State: AOJu0Yzx9WQMDWPvxHaSvuG/UQWlFE29opRzpDn5yVSCW30bscaFdlEi
	Bwlp48E03ZMH14CiDKbNyhD9TMbErXSE3HQWsM/TFaGWcpUMKk0DtO4PqJsjL61ybzLoYyJEYSz
	CREBBqss+I79MUDFAna/fkGHBERpBD9vIONl8F3OnqmVapr9qRYcBZyf1/q9bQxh+P3MN
X-Gm-Gg: AfdE7clZSL3fbJX9+uAU8txhErq8JUQxJeDiMyxgCbf3RUAe2mSphto5yltQxzVXzV+
	yVcI5TngBa/qfSwUaq6dztuAjTsa/3CCd9hKNf7W8bcCCMRKS8L7eKM/kjFmU2xW9SF8LYre9Te
	Hc6rHmoMUBX8SwA3aP9LepmFRNWSHKyc0SLzVY1/p13J6Ai1p+KDh2QZMl00S5oVDImPOia8NAh
	I0Y+MHoSQ3TTwZ4dKWg3nJqIxdEbRAcUyI/+2eloNK5jf2ZcbLYzAaPOi5N+Zgdi0gFaSCPltHk
	YxekOMjUV3zv1QkU2sgTqwVDpoW/rQIMUk2TfEPTmg9ZSt55DSn4NMjOQyQuUKlGqNSL8GE8B0E
	HxA+lm/dgJVwlzq6zAZTrD7N0ZMHBoehcOOY63prLhYdc
X-Received: by 2002:a05:6a00:430f:b0:845:4928:8655 with SMTP id d2e1a72fcca58-847c0854bdemr5443027b3a.39.1782989589299;
        Thu, 02 Jul 2026 03:53:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:430f:b0:845:4928:8655 with SMTP id d2e1a72fcca58-847c0854bdemr5442991b3a.39.1782989588468;
        Thu, 02 Jul 2026 03:53:08 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e926a4294sm1092783a12.26.2026.07.02.03.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:53:08 -0700 (PDT)
Message-ID: <d6e7675d-a7d2-444f-a310-fef677b4b602@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 16:23:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i2c: qcom-slave: Add driver for Qualcomm I2C slave
 controller
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-2-8b0a5c01f9f6@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260628-i2c-qcom-slave-v1-2-8b0a5c01f9f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX0OEJYMWOKysS
 mTs2BeMLR4QYBReC0nI2X6hIc8vn1Wv1ZmLduNA07xG3AiQjT4ro+d2bKJEGMSrbRIwFXTr4MmC
 q4oIdR9PAgkA0LnGePMR9SOXonijTwzzS0nns2YD9wi7oNmU3KimbTsm05tdpViGmuzW75Xx/nk
 +iLErPMV6jietd0jP1VosfqlsvuAnvBx+Hzt13R/svzc9hkr/VMpRL1Ep25VN4ptkQTq4812Kit
 OHKVmzNKMjVtnJy7qEuOjlPrwZSc+SFni3fJWn9GocLiuab5v/vSFAe6H+tcD1tuzrMe+3I0zzH
 Apmuw8R9AzKTeK69Usn6heebBUZlHArGn1wssOue5VEhL+fv+n4E7eywrG//1QncxvT0sKgcieN
 rzNc2lc0YyIkp4usNMhQuqUTSqYt6w54RVboBoUFczbft26eJmhQBtY2cg6iQ2o5cP3h5zJPceZ
 czEB+bGhgck+gu41wZA==
X-Proofpoint-ORIG-GUID: EdQ9YDLhJKJAzqTWulHfeepF1a0kdZPx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX3uWhejKx4mLl
 HKm3NJ73u2QWB6aA+tIrEvwF0agAQSQZx+wQjAnB9EEVvUO2rfa46Pr58RnDFQj+KYDxjJsyono
 1UF3xM7WA6MuAVlUirA61WO26ER/FGs=
X-Proofpoint-GUID: EdQ9YDLhJKJAzqTWulHfeepF1a0kdZPx
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a464316 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DweH89rA5WwjnC_OmxsA:9 a=BZCysal5wR4PEzCh:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115946-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D8216F65C5



On 6/28/2026 8:09 PM, Viken Dadhaniya wrote:
> Add support for the dedicated Qualcomm I2C slave controller found on
> QDU1000 and related SoCs. This IP block operates only in slave mode and is
> separate from the existing Qualcomm I2C master controllers, so those
> drivers cannot support systems that need the SoC to respond as an I2C or
> SMBus target.
> 
> Register the controller as an SMBus adapter and support byte, byte-data,
> word-data and block-data transfers through the standard /dev/i2c-X
> interface. Handle the controller IRQ events for RX and TX FIFO service,
> STOP and repeated-start conditions, clock stretching, and error recovery.
> Enable the required AHB and XO clocks, vote for interconnect bandwidth, and
> restore the hardware state across suspend and resume.
> 
> Read the initial slave address from the qcom,slave-addr device tree
> property. The controller node already uses reg for its MMIO resource, and
> the slave address is programmable, including through the SMBus ioctl
> interface.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

[...]
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1070,6 +1070,20 @@ config I2C_QCOM_GENI
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-qcom-geni.
>   
> +config I2C_QCOM_SLAVE
> +	tristate "Qualcomm I2C slave controller"
slave -> Target
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on COMMON_CLK
> +	depends on INTERCONNECT
> +	help
> +	  This driver supports I2C slave mode on Qualcomm Technologies
> +	  SoCs. If you say yes to this option, support will be included
> +	  for the built-in I2C slave controller on QDU1000 and other
> +	  compatible Qualcomm SoCs.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called i2c-qcom-slave.
> +

[..]

> +
> +/* I2C_S_CONFIG register fields */
> +#define CORE_EN					BIT(0)
Just CORE_EN ? sounds very generic, any prefix ?
> +
> +/* I2C_S_CONTROL register fields */
> +#define CLEAR_RX_FIFO				BIT(0)
> +#define CLEAR_TX_FIFO				BIT(1)
> +#define NACK					BIT(2)
> +#define ACK_RESUME				BIT(3)
> +
> +/* I2C_S_SW_RESET_REG register fields */
> +#define SW_RESET				BIT(0)
> +
> +/* I2C_S_FIFOS_STATUS register fields */
> +#define TX_FIFO_COUNT_MASK			GENMASK(15, 0)
> +#define RX_FIFO_COUNT_MASK			GENMASK(31, 16)
> +
> +/* Enabled IRQ bits: 0-6 and 8-9 (bit 7 GCA and bits 10-11 SMBAlert not used) */
Define BIT(7) with some naming, so we don't need this comment.
> +#define QCOM_I2C_SLAVE_ALL_IRQ			(GENMASK(9, 0) & ~BIT(7))
> +
> +#define I2C_SLAVE_MAX_MSG_SIZE			32
> +#define I2C_SLAVE_BYTE_DATA			1
> +#define I2C_SLAVE_WORD_DATA			2
> +
> +/* Interconnect bandwidth vote in bytes per second */
Not sure what's prferred unit, but if not mentioned it would be in BPS ?
> +#define APPS_PROC_TO_I2C_SLAVE_VOTE		1190000
> +
> +/**
> + * enum qcom_i2c_slave_irq - IRQ bit positions in I2C_S_IRQ_STATUS
> + * @STOP_DETECTED:	I2C stop condition detected on the bus
> + * @RX_FIFO_FULL:	receive FIFO has reached capacity
> + * @TX_FIFO_EMPTY:	transmit FIFO is empty
> + * @RX_DATA_AVAIL:	receive data is available in the RX FIFO
> + * @CLOCK_LOW_TIMEOUT:	SCL held low longer than the configured timeout
> + * @STRCH_WR:		clock stretching during a write (Rx) phase
> + * @STRCH_RD:		clock stretching during a read (Tx) phase
> + * @ERR_CONDITION:	unexpected start or stop bit detected (error)
> + * @RESTART_DETECTED:	repeated start condition detected
> + */
> +enum qcom_i2c_slave_irq {
> +	STOP_DETECTED = 0,
> +	RX_FIFO_FULL,
> +	TX_FIFO_EMPTY,
> +	RX_DATA_AVAIL,
> +	CLOCK_LOW_TIMEOUT,
> +	STRCH_WR,
> +	STRCH_RD,
Can add GSA_DETECTED ? even though unsued. We don't need below comment
> +	ERR_CONDITION = 8, /* bit 7 (GCA_DETECTED) not used */
> +	RESTART_DETECTED,
> +};
> +
> +static const char *const qcom_i2c_slave_irq_names[] = {
> +	[STOP_DETECTED]		= "Stop bit detected",
> +	[RX_FIFO_FULL]		= "Rx FIFO full",
> +	[TX_FIFO_EMPTY]		= "Tx FIFO empty",
> +	[RX_DATA_AVAIL]		= "Rx data available",
> +	[CLOCK_LOW_TIMEOUT]	= "Clock low timeout",
> +	[STRCH_WR]		= "Clock stretching during write (Rx) phase",
> +	[STRCH_RD]		= "Clock stretching during read (Tx) phase",
> +	[ERR_CONDITION]		= "Error condition: unexpected Start/Stop bits",
> +	[RESTART_DETECTED]	= "Repeated start bit detected",
> +};

[...]

> +/**
> + * qcom_i2c_slave_interrupt - top-level interrupt handler
> + * @irq:	interrupt number
> + * @dev_id:	pointer to the controller private data
> + *
> + * Reads the IRQ status register and dispatches handling for each active
> + * interrupt source. Fatal conditions (ERR_CONDITION, CLOCK_LOW_TIMEOUT)
> + * trigger a full controller reset and return early. All other events are
> + * handled in order with the spinlock held.
> + *
> + * Return: %IRQ_HANDLED if at least one interrupt was processed, %IRQ_NONE
> + *         if the status register was empty.
> + */
> +static irqreturn_t qcom_i2c_slave_interrupt(int irq, void *dev_id)
> +{
> +	struct qcom_i2c_slave *slave = dev_id;
> +	u32 irq_stat;
> +
> +	irq_stat = readl_relaxed(slave->base + I2C_S_IRQ_STATUS);
> +	if (!irq_stat)
> +		return IRQ_NONE;
> +
> +	dev_dbg(slave->dev, "IRQ status: 0x%x\n", irq_stat);
> +
> +	/*
> +	 * ERR_CONDITION and CLOCK_LOW_TIMEOUT require full recovery.
minor- requires
> +	 * Return early after handling to avoid processing stale irq_stat bits.
> +	 */
> +	if (irq_stat & (BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT))) {
> +		enum qcom_i2c_slave_irq irq_type = (irq_stat & BIT(ERR_CONDITION)) ?
> +						    ERR_CONDITION : CLOCK_LOW_TIMEOUT;
> +		dev_err(slave->dev, "%s\n", qcom_i2c_slave_irq_names[irq_type]);
> +		qcom_i2c_slave_dump_regs(slave);
> +		qcom_i2c_slave_set_bits(slave, I2C_S_SW_RESET_REG, SW_RESET);
> +		qcom_i2c_slave_clear_irq(slave, QCOM_I2C_SLAVE_ALL_IRQ);
> +		writel(QCOM_I2C_SLAVE_ALL_IRQ, slave->base + I2C_S_IRQ_EN);
> +		qcom_i2c_slave_set_bits(slave, I2C_S_CONTROL,
> +					CLEAR_TX_FIFO | CLEAR_RX_FIFO);
> +		qcom_i2c_slave_set_bits(slave, I2C_S_CONFIG, CORE_EN);
> +		writel(NACK, slave->base + I2C_S_CONTROL);
add a line space before return
> +		return IRQ_HANDLED;
> +	}
> +
> +	spin_lock(&slave->lock);
> +
> +	if (irq_stat & BIT(STOP_DETECTED)) {
> +		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[STOP_DETECTED]);
> +		qcom_i2c_slave_read_fifo(slave);
> +		qcom_i2c_slave_clear_irq(slave, BIT(STOP_DETECTED));
> +	}
> +
> +	if (irq_stat & BIT(RX_FIFO_FULL)) {
> +		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[RX_FIFO_FULL]);
> +		writel(NACK, slave->base + I2C_S_CONTROL);
> +		qcom_i2c_slave_clear_irq(slave, BIT(RX_FIFO_FULL));
> +	}
> +
> +	if (irq_stat & BIT(STRCH_RD)) {
> +		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[STRCH_RD]);
> +		if (readl_relaxed(slave->base + I2C_S_FIFOS_STATUS) & TX_FIFO_COUNT_MASK)
> +			writel(ACK_RESUME, slave->base + I2C_S_CONTROL);
> +		else
> +			writel(NACK, slave->base + I2C_S_CONTROL);
> +		qcom_i2c_slave_clear_irq(slave, BIT(STRCH_RD));
> +	}
> +
> +	if (irq_stat & BIT(RX_DATA_AVAIL)) {
> +		/*
> +		 * Intermediate notification only — received data is consumed
> +		 * in the STOP_DETECTED handler. Acknowledge and clear.
> +		 */
> +		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[RX_DATA_AVAIL]);
> +		qcom_i2c_slave_clear_irq(slave, BIT(RX_DATA_AVAIL));
> +	}
> +
> +	if (irq_stat & BIT(STRCH_WR)) {
> +		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[STRCH_WR]);
> +		if (slave->rx_count < I2C_SLAVE_MAX_MSG_SIZE)
> +			writel(ACK_RESUME, slave->base + I2C_S_CONTROL);
> +		else
> +			writel(NACK, slave->base + I2C_S_CONTROL);
> +		qcom_i2c_slave_clear_irq(slave, BIT(STRCH_WR));
> +	}
> +
> +	if (irq_stat & BIT(TX_FIFO_EMPTY)) {
> +		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[TX_FIFO_EMPTY]);
> +		if (slave->tx_count)
> +			qcom_i2c_slave_write_fifo(slave);
> +		qcom_i2c_slave_clear_irq(slave, BIT(TX_FIFO_EMPTY));
> +	}
> +
> +	if (irq_stat & BIT(RESTART_DETECTED)) {
> +		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[RESTART_DETECTED]);
> +		writel(ACK_RESUME, slave->base + I2C_S_CONTROL);
> +		qcom_i2c_slave_clear_irq(slave, BIT(RESTART_DETECTED));
> +	}
> +
> +	spin_unlock(&slave->lock);
> +
> +	return IRQ_HANDLED;
> +}

[...]

> +/**
> + * qcom_i2c_slave_probe - probe the Qualcomm I2C slave controller
> + * @pdev:	platform device
> + *
> + * Allocates driver state, maps registers, enables clocks and the
> + * interconnect path, registers the interrupt handler, initialises the
> + * hardware, and registers the I2C adapter with the kernel.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int qcom_i2c_slave_probe(struct platform_device *pdev)
> +{
> +	struct qcom_i2c_slave *slave;
> +	struct device *dev = &pdev->dev;
> +	u32 addr;
> +	int ret;
> +
> +	slave = devm_kzalloc(dev, sizeof(*slave), GFP_KERNEL);
> +	if (!slave)
> +		return -ENOMEM;
> +
> +	slave->dev = dev;
> +	spin_lock_init(&slave->lock);
> +
> +	ret = of_property_read_u32(dev->of_node, "qcom,slave-addr", &addr);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "missing qcom,slave-addr property\n");
> +
> +	slave->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(slave->base))
> +		return PTR_ERR(slave->base);
> +
> +	slave->xo_clk = devm_clk_get_enabled(dev, "sm_bus_xo_clk");
> +	if (IS_ERR(slave->xo_clk))
> +		return dev_err_probe(dev, PTR_ERR(slave->xo_clk),
> +				     "failed to get and enable XO clock\n");
> +
> +	slave->ahb_clk = devm_clk_get_enabled(dev, "sm_bus_ahb_clk");
> +	if (IS_ERR(slave->ahb_clk))
> +		return dev_err_probe(dev, PTR_ERR(slave->ahb_clk),
> +				     "failed to get and enable AHB clock\n");
> +
> +	slave->irq = platform_get_irq(pdev, 0);
> +	if (slave->irq < 0)
> +		return slave->irq;
> +
> +	ret = devm_request_irq(dev, slave->irq, qcom_i2c_slave_interrupt, 0,
> +			       dev_name(dev), slave);
> +	if (ret) {
> +		dev_err(dev, "request_irq failed for IRQ %d: %d\n",
> +			slave->irq, ret);
dev_err_probe
> +		return ret;
> +	}
> +
> +	ret = qcom_i2c_slave_icc_init(slave);
> +	if (ret)
> +		return ret;
> +
> +	slave->slave_addr = addr;
> +
> +	qcom_i2c_slave_hw_init(slave);
> +
> +	slave->adap.owner = THIS_MODULE;
> +	slave->adap.algo = &qcom_i2c_slave_algo;
> +	slave->adap.dev.parent = dev;
> +	slave->adap.dev.of_node = dev->of_node;
> +	strscpy(slave->adap.name, "qcom-i2c-slave", sizeof(slave->adap.name));
> +
> +	i2c_set_adapdata(&slave->adap, slave);
> +	platform_set_drvdata(pdev, slave);
> +
> +	ret = i2c_add_adapter(&slave->adap);
> +	if (ret) {
> +		dev_err(dev, "i2c_add_adapter failed: %d\n", ret);
dev_err_probe
> +		icc_disable(slave->icc_path);
> +		return ret;
> +	}
> +
> +	dev_info(dev, "Qualcomm I2C slave probed at address 0x%x\n", addr);
> +	return 0;
> +}
> +
> +/**
> + * qcom_i2c_slave_remove - remove the Qualcomm I2C slave controller
> + * @pdev:	platform device
> + *
> + * Unregisters the I2C adapter and disables the interconnect path.
> + * Controller clocks are disabled automatically by the devm framework.
> + */
> +static void qcom_i2c_slave_remove(struct platform_device *pdev)
> +{
> +	struct qcom_i2c_slave *slave = platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&slave->adap);
> +	icc_disable(slave->icc_path);
> +	/* clocks are disabled automatically by devm */
> +}
> +
> +/**
> + * qcom_i2c_slave_suspend - suspend the controller
> + * @dev:	device associated with the controller
> + *
> + * Disables the interrupt, releases the interconnect bandwidth vote, and
> + * disables the controller clocks to allow the system to enter a low-power
> + * state.
> + *
> + * Return: 0 always.
> + */
> +static int qcom_i2c_slave_suspend(struct device *dev)
> +{
> +	struct qcom_i2c_slave *slave = dev_get_drvdata(dev);
> +
> +	disable_irq(slave->irq);
> +	icc_disable(slave->icc_path);
> +	clk_disable_unprepare(slave->xo_clk);
> +	clk_disable_unprepare(slave->ahb_clk);
> +
> +	return 0;
> +}
> +
> +/**
> + * qcom_i2c_slave_resume - resume the controller
> + * @dev:	device associated with the controller
> + *
> + * Re-enables the controller clocks and the interconnect bandwidth path,
> + * restores the hardware register state, then re-enables the interrupt so
> + * the controller is ready to handle transactions.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int qcom_i2c_slave_resume(struct device *dev)
> +{
> +	struct qcom_i2c_slave *slave = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(slave->ahb_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable AHB clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(slave->xo_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable XO clock: %d\n", ret);
> +		clk_disable_unprepare(slave->ahb_clk);
> +		return ret;
> +	}
> +
> +	ret = icc_enable(slave->icc_path);
> +	if (ret) {
> +		dev_err(dev, "ICC enable failed: %d\n", ret);
> +		clk_disable_unprepare(slave->xo_clk);
> +		clk_disable_unprepare(slave->ahb_clk);
> +		return ret;
> +	}
> +
> +	qcom_i2c_slave_hw_init(slave);
> +	enable_irq(slave->irq);
line space before return
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(qcom_i2c_slave_pm_ops,
> +			  qcom_i2c_slave_suspend,
> +			  qcom_i2c_slave_resume);
> +
> +static const struct of_device_id qcom_i2c_slave_dt_match[] = {
> +	{ .compatible = "qcom,i2c-slave" },
let's add something with verion or target.
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_i2c_slave_dt_match);
> +
> +static struct platform_driver qcom_i2c_slave_driver = {
> +	.driver = {
> +		.name		= "qcom-i2c-slave",
> +		.pm		= &qcom_i2c_slave_pm_ops,
> +		.of_match_table	= qcom_i2c_slave_dt_match,
> +	},
> +	.probe	= qcom_i2c_slave_probe,
> +	.remove	= qcom_i2c_slave_remove,
> +};
> +module_platform_driver(qcom_i2c_slave_driver);
> +
> +MODULE_AUTHOR("Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Qualcomm I2C slave controller driver");
> 


