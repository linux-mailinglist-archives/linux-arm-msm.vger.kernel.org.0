Return-Path: <linux-arm-msm+bounces-64019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1C6AFC903
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD4D13ADB40
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44E82D8380;
	Tue,  8 Jul 2025 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnaKSVj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D4A2C3769
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751972250; cv=none; b=hetkthWyjaJ5tg1m0uRGrxnBfy7GhjvEAi97Xvk3pn+dtlLgB7Jg+xjJQoX3hv5eozNCsk/wYvZfJf8wM6yRK40IKS9LvuJuCKDkDl728Cm3sez3jxOVwBhxl8NQpou0zu9K4P0i7MMKfKdCxendaJas+OZ8lsGQmx3nTAJi8+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751972250; c=relaxed/simple;
	bh=KQmoX6nrC3iOjojW5GpuVT6EIS2Nwlzk+oP2PlFfsy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndhLGu3w8NPZutcip6XtjvnN/PXQBNDBJNhvc659J+jxZxPGvWCdfpI6xQmuuIasdbYRotU5IijAIAqZ5SXNyGfoTl1KEvk3ni7U1w07g+kuot/zq5YAxQhsqbi3zS/+CsFHUYGsYoCmRg1REgUwWbCGmy5C3ipprZq3kiWkWUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnaKSVj5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAZkd029480
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 10:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GIF5DKT27vfXZVCXrF8mPns2kUF2CyYYqvaNZxZDDQY=; b=MnaKSVj5uWdAkQ/u
	6eAWM/90uIMGTELEc1QOQiJYiYdlfsR7Nu2UdeHOFXa753xT21WXFyP0IVDmoUYN
	oQPaV1nr4ZUGunffV2Mki2zK11qXsf2O0KRS0j3xtpfJBUjSp2rG4QOpABfss2Cs
	LPlHiH+UB2yBnzbvXN/mpvpkl8z8oKADQ8zSX0UpGuBcyYziZOK9f3leRfuFHv0c
	70XJyDIDByzl+g2i+lPIUHF2R76ioybIjRnm0Cs47Ma7Xqep2upOYWbkjRgX6OGa
	BlsXn7pK8DYaoxDpEEkDzoLqtlZh6G3ond6EPVVvtYbPxbXAWLpj1Gkv08RkZn2m
	hjV8BQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xw2fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 10:57:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a804126ed6so13625101cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 03:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751972247; x=1752577047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIF5DKT27vfXZVCXrF8mPns2kUF2CyYYqvaNZxZDDQY=;
        b=KKRX6SUafesG94UxM6jhNjG3617Yd++FJ73BH73Rvwk/7ILGzgA55Ssmf5VoLWMsxk
         UJ+4F/FPEoWXLdDU/8+QxSU1wvSLCIR4QOslh4bFJYqDQEAvaycmMSFak+HjBqRN92qz
         k22hKqFSqQ/ZtUgMSHYuveqCP0VuHAUWVKJoWfHrv8WkMTs5l8vEM6oxUAmhLTqkByKe
         oxd2gBSMFFT0UDeiIiE5NBrM7kVkC3X0VoNifnsyddNvKcVsga3g3DCeJhv/0FhsLk4R
         2ZKdUj4Ttm/OX/5MH7g1vhSd0sHGpsrO604mikPA+wTANA412KgjGees9x+GkK91eibM
         litQ==
X-Gm-Message-State: AOJu0YwAmIzBoT1OtqmrDMluWmlr/aki3v7/RC591xTWMXUUUs+8YnUc
	RO2UoBDAOiqQdxFMHzd8Iwbt0M3LebZ9yyf4DBA1r0DPkWF3PCupN3MeXPuS/ITaFqqk2q0yDb1
	BSj5VAMiCl6gtW+1vjoteCNYPrm4QOAmHn6HlWtfsDBDLSvA+NNyi9vom2qaqh8OmVaWk
X-Gm-Gg: ASbGncvQNo2gD7YS8h86i9aDQOfHFFfrXWlwEhtS5nRZb2DoAt/h6BzgfxrgMVDYS8S
	xbgpQ9/Ypg+fEUh9lh6DTK0szhPLuihrSaMcpVvqclkl/uhd8WKe86VCCdGcvZfKHX0jA0BVKbG
	/QV06JL9O4WjbyldY8VHt4Treb2DFA2IjqIEOOTgsE68FyAwgXrQBFgh5qAnhsfLoGvhaLfUOH/
	PZE7aefSEHOojeX/ht2AuOjNvW+StZMHso2yQEdY2Ux6QYgXBsTy9cwTzQs1R1GNsR18YjkBk9B
	c+scrxX3qet9uBCVtZe8PtbNBvArAIWzQSnidhF2pkguhbB4npOYnx9vHWDJGF7jqWtWMQ40Qws
	oGpI=
X-Received: by 2002:a05:622a:58c5:b0:475:1c59:1748 with SMTP id d75a77b69052e-4a9977451a6mr98009751cf.11.1751972247085;
        Tue, 08 Jul 2025 03:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZt2S+mAamOHM9eCscgbyUrXKj31C/cdnLpzexomatqLRtS+49FFgn7qQCYjgEVPgfBjzG3Q==
X-Received: by 2002:a05:622a:58c5:b0:475:1c59:1748 with SMTP id d75a77b69052e-4a9977451a6mr98009541cf.11.1751972246669;
        Tue, 08 Jul 2025 03:57:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca69657fsm6993938a12.26.2025.07.08.03.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:57:26 -0700 (PDT)
Message-ID: <85aea6a4-cb14-4fbc-bf97-7de513aa0eb7@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 12:57:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
References: <20250708085208.19089-1-komal.bajaj@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708085208.19089-1-komal.bajaj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA5MCBTYWx0ZWRfX2bCZX8OUZyyH
 MilPkIvSO8hDNnGOK6x+wLka2Fg0nqjW9vIDwuqqNFFq7BmptTOovIb3kWf9aZRW9w5JknjaSy6
 bdGU/FE0iC74TK+0ZkAfTwgjSHUNihs1ke4ohnvSLWNxKCrTRLWFjjhmmYc7XSBhpOYbnQjxdAE
 ouWkut4hu+GC3sooZFDu0WXPkmGkmFhgU6V45zCU3rltatEGFJR4eTKyitPcJDJiEeEVUyUOu5A
 GipWcnwEkY7T6/4ufWay0HttsM3vThF9if3uQpzqfydTuSIBapXWkndiPM8IfKOevupjDhglzIT
 VCxClxTXh7LvUzHTSVm8it1dOJOpykBiiByI0agEHQDZkB1RrJgGfqug7T8iUzT/anLqDd9XYZf
 Fu/pmgDO5ASMHDbPuMzniYL4Xo1czUoSclR6xpfbXZmXjYdfIlKQv7GyGJS0DiUa0u4OAczZ
X-Proofpoint-ORIG-GUID: S4RQfmT1JMCGuzyOt7dX_DdJ4FdpK4q5
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686cf997 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=6MIUTFbEWCSSVVwswsMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: S4RQfmT1JMCGuzyOt7dX_DdJ4FdpK4q5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080090

On 7/8/25 10:52 AM, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for HLOS, enforcing access restrictions that prohibit
> direct memory-mapped writes via writel().
> 
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
> 
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

[...]

>  static void disable_eud(struct eud_chip *priv)
>  {
> +	int ret;
> +
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
> +	if (ret)
> +		return;

we're not doing anything interesting with the return value.. but taking
a quick look at the call chain, I don't think this API produces any
error messages - let's print one then, for the odd case where TZ likely
needs fixing..

also this is ultra nitty, but please add a newline after the 'return'
so that it matches the change you made above

Konrad

