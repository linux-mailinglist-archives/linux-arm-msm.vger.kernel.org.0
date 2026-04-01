Return-Path: <linux-arm-msm+bounces-101292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNZIGvXvzGknYAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:14:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC303784E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23498309DB7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA1F3E0246;
	Wed,  1 Apr 2026 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFoMVVQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXqY6BJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945CF39DBFF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038269; cv=none; b=W6lYEIuTHBolLNIVsK+2IrMW+beponHOdH7HE/iXhcx1yTMarU1EZym05wU2fLVprSNThlWkXdfiZjptQcMPWlFZAadqzxk5wzWqVRRKXtGmZdAkIyvy5G6r+XxkWPHS5TwfeZJAUW+Q3BCJ6TZvvS6eFKcR4Z+yszMmHNcTfpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038269; c=relaxed/simple;
	bh=2O4KPsHQ62J935zxDc2Ax3wT+rfA4m2j4eAJwp4ilEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekJ1cierlBw+O73iSNNbUY/0T2H6Of3bmQ/no5W/ovuSZLI+KPRQI7XL0+oZbSLtAzED9+wJwRk59f4QCMM+XDzSqW5pXyAYm1h0lEZwl1e/MLB/TMpf5PrvQFmLzSJS7bFDcsxF4S7uPvDxiO7wkbIcoAN0NEB+bgGRwcHlK5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFoMVVQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXqY6BJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314O1ZR1562492
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjHSbV2B23FVdY+pUIbGKmHP0rQ/BXiN+MmXtwCChiM=; b=TFoMVVQdycJz5Ylq
	YT+baWrBRyjeHPza9jlcKRKXMJ5xRaUsm80kK8Exfv3yqh9vYb8uidEoRWvQvC6g
	0l3GCJs4XYFMdC5W6fu5VrMQx3LDc4g1EIFmgGkxma+argFeRACPboMjjSAfQSfJ
	N08FT1gU1uzRGnDOTjj9UDC5bYD1Ycu23J9M/8XzYxn2dz0q62n1C9AxRf2Hytem
	uBC5YW7WYRFUAEjFIEtL3TUBFR8SXC+15l8JwlHFR0jvyOZZgWpWBnsyq/vshQyp
	OuAGP5B0T/YhJ9i2Of5p7TGcRl9WSv+3trA21lYktbLEYHheMww9AqOdimOVu0HY
	k3IDkw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3sa8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:11:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89ed6f0c71aso15818546d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038265; x=1775643065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjHSbV2B23FVdY+pUIbGKmHP0rQ/BXiN+MmXtwCChiM=;
        b=ZXqY6BJt0RblRb3fQbfttVFVNdEdTFpzvz5Ps+DhSGjLxN36/8GgaSz3Mb5OnN7UEi
         hh2Yi7e0/itPqhhVz1pa/+jKR85m1dTigfGEQQGBtxQLNNbklfpZRepbI8z5aIgpoY4M
         Z7E7nhm3HqOyNuWWpH166JtXlnExFjnuJ++/iBZQcGEmkhG4T/6F7Q3/8JH+3Ojkd0Li
         RzZg7Mj4w9Gjbsrb2V3tirc69rfRFr6rGbU8QXe7ENG9lVOxsOudUnN+B4lJwyFbL/hD
         WZmEV8fTSCt0li6lRvZ4Wy3quOxY0Y2SJymE0xEcloW9rcCBztbS/paHV3Y0dWweZNrr
         ENEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038265; x=1775643065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjHSbV2B23FVdY+pUIbGKmHP0rQ/BXiN+MmXtwCChiM=;
        b=IduLyyjIis6qpYdjRhiwhM8tinasvTgJPOoqr7KS1xclzzWKlW2dXOp+36SYd7NiPW
         1dsiluV3zOWMbLq2kl4tW7HLPPRgUrWIp1gfSTqtGPgqdBWxuRnol62l8C38kaGQLOvd
         wQj/cRDsYXrjIipv+ALW7hBmTy54Awm51nYkysVa98ia0YOkcJig6XnD6PpfZGAcwmBD
         EjlRCkOu4A4VM5vr6t0jPK43GFHfYjwjXjC4oaN9gYBRa8hTFn9e++2meel0VIVGgJJ0
         cdtMf4oU14NJxwZ8qEEPtC1N4TSRUQONjU/dP1mwrVc9XqfUT5LHMsl65Th3icoAEmVs
         oG1w==
X-Gm-Message-State: AOJu0YyujrTKbdhHZdLvYvaXqzj3iYI2YLeAgPOtpFtyv1JHSN/599y0
	r2CVM6n9N2ZPfPtdPCsnItY79M5pU2hJkyemdDvh4e/cJAzP9ttycSRaITLAaKrJedj0INpA0zV
	DAxXhPi+/5GG8WAUj45SpuiXqzvgwqyKY6iKu8MVH5O8MHkr6YR8GpMzfP6VZx9B//MzG
X-Gm-Gg: ATEYQzxkXRzZZ2WD6d685narrN2V5vwOjoZ25BtfCj58LzhWSiPokiQ0NJrVnhtJ80v
	LU4nEt4Gdgun42JRK1BR9+Y1hlR8Tk5Vx4be1lw2VjN1s5oSNWu8rO2isIfNHcRD+3MPzK+nnLE
	tmA0KubT7fUN1SIMZUDfZCNlktSS29ecsRpm8lBasXW4cIxfBPUw0pGqytNKjF4HP0h49LxVqco
	qhPYe6MerT7240uOPSqKOGZCxamZZ/940zv4XLAz5OQYN4e1WO+ocAaM5kcuepwQItFN3bJJ7ve
	vJrvV4H1xDLCqGqboflsjd4cTpMyU2HajDhRgRO41A/B0eYaAY+lUMazY7/CNok7V73Y5rF+Hg1
	n6LdfNNfdUnbPDjMKpdtLdvEmpwqh2c/YdHtmJSYi5OMMwFKhFs3ybD3lCl9mlh6W+7pFV+ulbh
	7Jfjc=
X-Received: by 2002:a05:6214:1d0c:b0:89c:51d0:20df with SMTP id 6a1803df08f44-8a43a179982mr33287216d6.3.1775038264943;
        Wed, 01 Apr 2026 03:11:04 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0c:b0:89c:51d0:20df with SMTP id 6a1803df08f44-8a43a179982mr33286886d6.3.1775038264532;
        Wed, 01 Apr 2026 03:11:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0219ed66sm131245966b.40.2026.04.01.03.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:11:03 -0700 (PDT)
Message-ID: <e3d6f0ba-6c9f-4b93-b946-a33802f5a223@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:11:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
 <20260401-expressatt_fuel_guage-v2-1-947922834df1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v2-1-947922834df1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _IS8K4cnx0HWk434Q3dysDySbXhzld3h
X-Proofpoint-ORIG-GUID: _IS8K4cnx0HWk434Q3dysDySbXhzld3h
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69ccef39 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=eTI-YJAz-J8MpRop-NgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MiBTYWx0ZWRfXwPBnJbGMLmcH
 XSO/t+MjnO2pyaJ1xeYBV+dS8zRbqsZr/ziTyLftMwjBzhK8WoU6gh26eR+yZjM1XFEOOdNPpTC
 1LLm7BswjRCUdGRaves4YbvrN6yrB/c9T1xfTwjK171ITWleBorNXdX/0aeW76GjsmISHs/nm4G
 2x51wtHyVh/GzcOm4/v3NSc1E0J7dGuHVD6BEEj9QbCAvHwtLANWvJVssYzktlEaJbPCQSZe6M5
 cIFYptUHdbg61gVh0xV9t8g4af5A8RW8rMSpIhUzQ7aCMjvOGvj3HWhARG7xq73R2qRROd/WKH+
 TtwltOLeKTksW1PvhbThwOikzoEFuMvY4XzTYCXD30fmvmT5kUhe/o+PZoy7Uy+5OJJKgMFgXqf
 25ZwJgFxCvm+HNpSSsc3V9SPPuL+aSqnV0vptalG44CDz/9eN3Cc1MlJgV9RoCpCS1pkROuiFqA
 vRL53pvp0JqGsLlG+zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101292-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAC303784E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 10:28 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Reorganize the DTS file for consistency with other msm8960 board files.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

[...]


> +&gsbi5 {
> +	qcom,mode = <GSBI_PROT_I2C_UART>;
> +	status = "okay";

I know I'm being annoying, but.. if you're doing this on the entire file,
please also keep a \n above status consistently

Konrad

