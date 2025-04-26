Return-Path: <linux-arm-msm+bounces-55808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00919A9D9E2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 11:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A7769A57DA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 09:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3420D1FDA8C;
	Sat, 26 Apr 2025 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bv87gcBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0098212FAA
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745660962; cv=none; b=pkRUS5Q12Q3Tl88mqpVBnZO5iEIrLOHLkk9qjWx7SODzCaQfpq58nOSLxoSb0LyYjD57FB1Uz31DK/HWfTrc3hpx60u+hxd4xRbvzMsSEidaWgYh5m/GcO31wk46p4J3e7VAuxr325XpE+wO9ncLxEW2zpNpVdgGqjCv1tzILpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745660962; c=relaxed/simple;
	bh=B8EgtZ28fzm2eefGDxmnFqlqJAmYimcdMeMTIQBGAqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=koUOE9BqLdi0i61wqsdnOQoaWL0heNa1irHRhzCeroi3pxHV/3wBr+gr5ctJzQZEuWWvj5H9wPlywS2Nb5gSfFBsXsNE5IWQUp6xNp2PDnMqjshmrwVoIssByRa43Wi9i892NoRjiQNV7nMaX0T/PrOihWSkDTNDUnDA+qqd1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bv87gcBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4m0ek012257
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 09:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeBovqy5swxjnYwF2GUPObcG6Yg58Cf28ut61KxKi3Y=; b=Bv87gcBWNT9PnyUu
	ivmrPliji2D9S0zlNTIL91oCYu45mgjzDGobQHSWw89j2sdSPsnk9lWfh45X3fUj
	L+HIe9fLSL1S0uwAkEksrPl2xdqTSUuKxrBcSkxZwtTACKS5hEI+ttsVpp3Rhw38
	QJYTzeg7pNYrce6935EeuvwYKkRDVQriYi8thj9krf7Zg/QBqjtc8+xA2oDFSlVU
	91zldgyAprr6v5zmqPEorzzfC3QkA5i+50XPgY0cxAZxesqGkmY8E8iKCPE/7y9u
	t7NMGqYNpcE+yY5Pj7hswZAcY6DZlODuLSbV2q8aaqXuoLrh+GWLcyjz7Gy5FoY4
	jcfeXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb0nd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 09:49:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso70753985a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 02:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745660957; x=1746265757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeBovqy5swxjnYwF2GUPObcG6Yg58Cf28ut61KxKi3Y=;
        b=ERuLX7uLx50RQok3wuSB0rG1nOEtXs6CA3INlcTP9uUWNiOPxFqafR2QZpq7F4V9Um
         cZGxaEeOXxI9RiEpAYE/UTCFJMWWF+hUBNm3xyUsEAGUb27qelfENENabTMJ/Ix9oW8M
         ykS8YKUN5Lw7xj6D3g/XD7mbl+ecHwOcbUv89kImU5RZJSETyKSz4cfOFuSieaEkZPtE
         W/UCmM++fAqHRFD8CRCLhvksc/a6X+tV+dE9Ee1dkRhM5cpboreqA5KptQFOp0DaBW+R
         C43E4mCG7RjpdCfZAnjcsZnIoxLblBZTjGWnr5ZaNpiv8N3nOH6Msp4SNzSKsO4RGuje
         yrLg==
X-Forwarded-Encrypted: i=1; AJvYcCUbPpINmZ4O/xMOQGAIAroRwIStbb2axxsu8ApFzkNmw/7+D1uVQo1TT+N1wT6CAmq6TuK7Y6p9m094QwVD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8g0ub7spEbA7nBsoDTXY4B6em5tOhk+2jQ5ljSCg+gYxdX6es
	Qv3bqfcrSCahdHYxnH7Q+y9PYLAnjHnK3l4ImuadYXkdajZeDrrHmGCIvsuM9NM3cC8s96o9ngU
	fIDAbtkEzpzAfkQR5EXEDUbvcUIa+mddqb6X/l013W+dQW8CnpRC18dUTZn/VM1e+
X-Gm-Gg: ASbGnctNAWc822yg8ZLJfHv0ueYF0vojQ50HpsPEnLHEjGDxYO8ZBKiVo5C8K0IoVfv
	F3RmD7R88Faqxh2YDPLtMUToTOelSM3AiIsmQIHXfnwxhaDYGSVxhY7GcR2Pa2/fwLxVS2l+h2w
	RBW75vdzgV+WSeazrAu513O7Gp3FeX+xp7XcCSUFTJ20JfJY59jSVGGPj0/qej5gFUvsQ7vZFGV
	xPi+DLAYMZc9Ah9pXQkiqOxIL6vcxYvZKpKm1noEyUGlBt8mUklPf8L0lzLgW7Ns0m26cIKt95U
	hzG7U0G6etp/haJ6a8nYXDh5AZW30elW1IP+t7l6VAm1d/rXfQ8BuLTOAkKS/vOPO9M=
X-Received: by 2002:a05:620a:319e:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7c96054ba7cmr323496185a.0.1745660957605;
        Sat, 26 Apr 2025 02:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0QwLs2ir/PN1N5iqv5F0Lv4U72x8845jtF7TxG3fWASOplWiGCjdLlSOzZl2mG5wF3zAQtg==
X-Received: by 2002:a05:620a:319e:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7c96054ba7cmr323494785a.0.1745660957096;
        Sat, 26 Apr 2025 02:49:17 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edae042sm261565166b.169.2025.04.26.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 02:49:16 -0700 (PDT)
Message-ID: <6b6a163b-be75-4003-a618-f0e928a6d114@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 11:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, manivannan.sadhasivam@linaro.org,
        dmitry.baryshkov@linaro.org
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-3-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250327181750.3733881-3-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2NSBTYWx0ZWRfX/7mE1P0lJoo3 SiBD6CcsV7D0RTpnj8lWg6qo+Vq/Liu0cz30uYVNTilwp+IwkcuLRCcUlIiJGopry+mprx9gAf6 KSfKNJPIrNYfQou7K9dW8ihQ5X4+ISaP8StumUnPPHduKwTfyC0cdmQ30SflEL9066HpR2XNRxr
 FMMjNY4geW3uFGuC/X6zskpqLJkZFE1I5Fj0v7iGHDSeJKQ95hNRSf0adKZ+eOL9yVUV+9cJaP3 vWwp2O/CDJol2l08GL8XT4euN0aSgtviKB5rha3zprDsJ92vJCxn/sJliyXb2VjL9R9BC6LFfhr tYDrjLSQ8WumuQa+Z7VuDc8NmTC4/lVMq4UgBWN0a8HmwT4KcFltikrmFFIY1bbNBAdvlww8zQY
 rpZsjnG8sU+RlVdJC7sIXeSk1GnjProzkNNu31SgdF7ElljD9AOy3CF8CdiFk9iqDVAC6uSk
X-Proofpoint-GUID: FjqvBzAcLgVg8CsQtHZXDJi5RnhbTWfQ
X-Proofpoint-ORIG-GUID: FjqvBzAcLgVg8CsQtHZXDJi5RnhbTWfQ
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680cac1f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=LmtxcP_z-R2aA1YV_JkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260065

On 3/27/25 7:17 PM, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> This mailbox facilitates the communication between the TMEL server
> subsystem (Trust Management Engine Lite) and the TMEL client
> (APPSS/BTSS/AUDIOSS), used for secure services like secure image
> authentication, enable/disable efuses, crypto services etc. Each client in
> the SoC has its own block of message RAM and IRQ for communication with the
> TMEL SS. The protocol used to communicate in the message RAM is known as
> Qualcomm Messaging Protocol (QMP).
> 
> Remote proc driver subscribes to this mailbox and uses the
> mbox_send_message to use TMEL to securely authenticate/teardown the images.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---

[...]

> +
> +#define QMP_NUM_CHANS		0x1

Quantities make more sense in decimal, but since this is effectively
a single-use value, you can put in the '1' literal in num_chans and use
devm_kzalloc instead of devm_kcalloc in the other use

> +#define QMP_TOUT_MS		1000

"TIMEOUT"

> +#define QMP_CTRL_DATA_SIZE	4
> +#define QMP_MAX_PKT_SIZE	0x18

This is very handwavy, please structurize all data that comes in and
out of the mailbox.

> +#define QMP_UCORE_DESC_OFFSET	0x1000
> +#define QMP_SEND_TIMEOUT	30000

Please include the unit in the macro name - although 30s is quite a
timeout for a couple bytes..

[...]

> +#define QMP_HW_MBOX_SIZE		32
> +#define QMP_MBOX_RSV_SIZE		4
> +#define QMP_MBOX_IPC_PACKET_SIZE	(QMP_HW_MBOX_SIZE - QMP_CTRL_DATA_SIZE - QMP_MBOX_RSV_SIZE)
> +#define QMP_MBOX_IPC_MAX_PARAMS		5
> +
> +#define QMP_MAX_PARAM_IN_PARAM_ID	14
> +#define QMP_PARAM_CNT_FOR_OUTBUF	3
> +#define QMP_SRAM_IPC_MAX_PARAMS		(QMP_MAX_PARAM_IN_PARAM_ID * QMP_PARAM_CNT_FOR_OUTBUF)
> +#define QMP_SRAM_IPC_MAX_BUF_SIZE	(QMP_SRAM_IPC_MAX_PARAMS * sizeof(u32))

These should be expressed in terms of structures and sizeof() instead,
as well

> +
> +#define TMEL_ERROR_GENERIC		(0x1u)
> +#define TMEL_ERROR_NOT_SUPPORTED	(0x2u)
> +#define TMEL_ERROR_BAD_PARAMETER	(0x3u)
> +#define TMEL_ERROR_BAD_MESSAGE		(0x4u)
> +#define TMEL_ERROR_BAD_ADDRESS		(0x5u)
> +#define TMEL_ERROR_TMELCOM_FAILURE	(0x6u)
> +#define TMEL_ERROR_TMEL_BUSY		(0x7u)

Oh I didn't notice this during the first review.. I assume these are
returned by the mbox. Please create a dictionary such as:

u32 tmel_error_dict[] = {
	[TMEL_ERROR_GENERIC] = EINVAL,
	[TMEL_ERROR_NOT_SUPPORTED] = EOPNOTSUPP
	...
};

that we can then plug into the function down below that currently does
error ? -EINVAL : 0

Konrad

