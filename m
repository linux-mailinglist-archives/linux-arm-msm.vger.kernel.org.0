Return-Path: <linux-arm-msm+bounces-111726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2YqkJ0x1JmoQWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:54:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FAF653B80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:54:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AQt5/WWq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FpWzVMz8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111726-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111726-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E59503002538
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FA3394498;
	Mon,  8 Jun 2026 07:54:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE63101D4
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:54:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905287; cv=none; b=cyWTGQ94KxuOtJWs8/bFny2fSQRdiBb1oZwz781S4+VBiJO7WrbOq1C50jgfSbwcTP9bBK6J57qloeZojD6xCK5i5NaIGvCA5E/fLMc4T2H1n+LSt88dbebv1+34UhN0DQwER9BgBPTj4XBQt5QlGa2waCWoG86FuTd5SEhGyXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905287; c=relaxed/simple;
	bh=7L0sReKd1AffnTy/iUYPVQXP/Wy7hvlpi5gYLmCH/4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2Y8OIJe+AXIgz/9BIYNpmr/RAhLUQb8CZl9l93iHLgdY98XOcplHaKy25p2ePE1Hh4eTVX34EnOrCI7rzYy5wfnwn+Bd3AP6CM7EDTXY6CdxPKqpwLEKK6Q1g3Hgpfh9+pgknGpLBPfrACstiLU9rgp2EHWPsm3aQFiP/qzxI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQt5/WWq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpWzVMz8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586SIcf2835637
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msbjmP9rM3cSjosteke+EMkxKuVcldwydJL9S0p2bME=; b=AQt5/WWqHbxo3G1A
	/ADRaq7eDD2uq1/5/0ZukPZr71cGEeEWWaNZ32b6iGhBRzhaLk/LY87AC5IzViXb
	N7oNTQfLRIX4jWFDG6bgTdmC2jXgOffGHZeQ5Jx3vjikttdCSGjbslyUIUUafmgp
	6ldij3hHfXYj2lpfm9keoJTy1+Qpl1viS1sgmW+ZQJpId8gFSOHsO43X6KfH9dSw
	2tfUZjR7dip+dsZvcJZ0UdUscSflqew02vjZZLindgzzSTJGJbj4NnRRe/D4dPA4
	fxlQ1VpHynuVam+vBzrHZHaR00ziW4KB7K6czZ3uWE+IgdVq100GhQtvoMHuYQqM
	RsiejQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4xxfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:54:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so13736531cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780905285; x=1781510085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msbjmP9rM3cSjosteke+EMkxKuVcldwydJL9S0p2bME=;
        b=FpWzVMz8K1ivGLwPOIbME2ue62TTkf/ZzAL8ST3rsffDHYLtNoXqIgOQVo6KsOxVcL
         QuiRZdFf3RYmdxJSIYdoyZrJqM8VdQ9EtB+oSfXT/IguAFl582efc0LMvCQwzLADm7C+
         bv0ozUoKFPe92dScu3ioFS/OUykKKucs87/UaUEy41uuwuL1LHqzzmZKLaLcF7T77Jdy
         Z6Tcj5Glm0JCWZsI4Lb8crxDtx55xk70WAXaZK+ZQ3x29pK4k2/ptgH82BGReJHychjD
         liDzH3gc2gDUlgYs4DfUssiwF0+qC61azQuX7YtMwFzc+WffyhvKu86vKAoCMwAcx8ki
         9bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905285; x=1781510085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msbjmP9rM3cSjosteke+EMkxKuVcldwydJL9S0p2bME=;
        b=AKtIRP7tQFjvJWs8yTaLAbSpL41WenDt18Yb5eXy9hLupyws+tBiXujZWFUhkbIr6e
         eqf1B9mbQmb3PdHkKPGiHbEdeJEJNSUcEkdzNDsJCFYED0UNCIXRdAJTIzatMA5WbWil
         MOCeVLTh2GGqLqEUqCecRvkmhmDiRCM3YIPv745kDuxTPN3o5PNoKXPJlB06lagchLzX
         PzHBUSg93gZYd2K7wokWl/u4cE3SCZWSYGMvu6nbdRfdcctD8/z0qvBYZ6XBsMylAV8Z
         updj9+fdaezwVbFf97qgMz8fIyu9DNtOejPgNiz7SUGZ/ptcbUelUTVfJY/mWEHoTR7B
         L4jw==
X-Forwarded-Encrypted: i=1; AFNElJ8tSjorN7guptCb23YmkMKCL8ezUlId62a8NQM3SWMWqmIoqPHx4aRKJhCemK8gdHtuhJx97U5I48V8g5Gv@vger.kernel.org
X-Gm-Message-State: AOJu0YwypIyj59Ux8ZG4LG7WZgBDDfeOSFr8nuORdnsbKJ0nxWmTvJlZ
	BFkzAc46uSCjzP2wJJlZ2UGXBIPJKSsKe8R4fmsmd5Tzch4oUfEwvHbBMDseBSN+G11aF4cDKuk
	cUpCJ2EgLurXdt6oo0K8+PKYpH6uBBkEJ8VeDRyiL0Ttw1aBoklWmk9m6QBTzub3cqai9
X-Gm-Gg: Acq92OHRXK+0QITh8PHYpVouOt3MXMHdbpo8m+5f3HoOsLL2ED5o4yEL4piRa6HH2UE
	GWyBbvBFLhuRVFIqezff4tB74+Z3lBBd3Y+lIgxbDRrx2Md8j6SZ5nQtIMDi0CbEYxd97IzjhS3
	dXJ87uNI4juYyStYnqgUzZYljyUhRC7dIZM1y0OTOnG3LiqpBvx1ZXadFkpLJe+51kCb4M0iU79
	IbTnL9TmOBmt6Gz1xgWTLXlX2pb03G2x233HxrS1zFxYHliLrMIcggX44w0bDxkeUxq6y4YJL98
	2qRQtyDg5BScMvaTL7pPSG5v8sScElNKwVb4xcR0g3lBpk6U8U7ZA06RYeXqDR9um4BCjm47KBb
	PkN2ErsF31khIbCt4iFhE+lYMtUYRxlZpafpUJkfZIQJ6fEyppASvICFV
X-Received: by 2002:a05:622a:228e:b0:517:8999:6c4b with SMTP id d75a77b69052e-51795bbf777mr118585001cf.7.1780905285021;
        Mon, 08 Jun 2026 00:54:45 -0700 (PDT)
X-Received: by 2002:a05:622a:228e:b0:517:8999:6c4b with SMTP id d75a77b69052e-51795bbf777mr118584931cf.7.1780905284572;
        Mon, 08 Jun 2026 00:54:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051b8c7efsm817675366b.14.2026.06.08.00.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:54:43 -0700 (PDT)
Message-ID: <6ce9188f-aaeb-4ce5-bfc1-28b4f45a9224@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 09:54:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: qcom: iris: guard IRQ handler with runtime PM
 check
To: Hungyu Lin <dennylin0707@gmail.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608001128.80090-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608001128.80090-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hT_kdGDQMVc9UXrhx3zflgSYlz4UAuJK
X-Proofpoint-GUID: hT_kdGDQMVc9UXrhx3zflgSYlz4UAuJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MiBTYWx0ZWRfX6I8v9tiBBmma
 NgrGpO9/vIO6HV/No3X70X1TUVUzTvaHOEcpfJyM60le7i+9QrNX+u4UO3lx3iuSvTswizPELvP
 No9ZWfHkWsmTiRNu39mt1DkIEL8OLVq/8lS4yF/1Lv6+3Ex7rr5Ipm+MHDanepw0RA5jsSbdEB+
 jIh7H8fmNn/wuo20T7hYhTPAgfZgufc71at9Lk61ng4beuMQlWwEI43IuhzETJ2KOYhzZAD5pDL
 lIerUVW+wlqzYDcGiOAaj69S+izQKzbYZV2/zh0mjPY3/828NwJc/sldVJMVOnoPLKSKBuDzz4c
 X7bQv5T4NLPHK7JU0kxrL+h4dV/OlZ4GEvt4L+oJ/oSZfouftmwsaevWBzYgjmdgzoQs123T0oo
 KDwv21eetxjYU339jOWm7JHACzUmFa18b0/s/on0Pde0VjJorRzohuhCzASGjNbUNLEkbdhdUdf
 YP+wMqZ3SIJzKLuG0Hg==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a267545 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=-rh6snQRrsOWgr4pTt0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111726-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9FAF653B80

On 6/8/26 2:11 AM, Hungyu Lin wrote:
> Guard hardware register access in the threaded IRQ handler with
> pm_runtime_get_if_active().
> 
> A possible ordering exists where the top-half IRQ handler returns
> IRQ_WAKE_THREAD, runtime PM suspend powers down the VPU, and the
> threaded IRQ handler subsequently runs and accesses hardware
> registers through iris_vpu_clear_interrupt().
> 
> Avoid touching registers when the device is no longer active by
> skipping interrupt processing when runtime PM indicates that the
> device is suspended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

[...]

> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -100,10 +100,17 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
>  irqreturn_t iris_hfi_isr_handler(int irq, void *data)
>  {
>  	struct iris_core *core = data;
> +	int ret;
>  
>  	if (!core)
>  		return IRQ_NONE;
>  
> +	if (IS_ENABLED(CONFIG_PM)) {

I'm not sure this driver is much useful without CONFIG_PM

> +		ret = pm_runtime_get_if_active(core->dev);
> +		if (ret <= 0)
> +			return IRQ_NONE;
> +	}

Have you actually hit this issue, or is it purely theoretical? We
shouldn't be receiving interrupts at the tail end of suspend callbacks
(and there's a disable_irq_nosync() right after the HW is disabled)

Konrad

