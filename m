Return-Path: <linux-arm-msm+bounces-112497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id suXYMcNtKWrZWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:59:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848C66A079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:59:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZB5tGBGq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=evha8ZM1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112497-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112497-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7C65300C0EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756EE411681;
	Wed, 10 Jun 2026 13:52:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DB640B38D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:52:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099578; cv=none; b=UeHm4LwIqWHRWAAZHKu/Jryx2/eoD6Gi2Ol/yx1VonT9q8sgoJL3OlUCu0OkSUiybt6NZQgjm/FFWcljHIWGtNz2R+yGkmo3fMhr+O3PIpRPjzSNHt52ee+M7//1rQiFVF6cHYVvh1k1Jqi7AYu8yID6z+McHGh3/bNkrKLe4Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099578; c=relaxed/simple;
	bh=x9d1nGjclVZUKeV7iRM5DOu+kaZFIGubeAbIfc3DEcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RviOJaMIKYEUDPIgh7JtB6pToXyRTC8wdruNyVsypqDY9fURwkj1xsD50LMiFf+Qu4+dIoKaGiak4HnAE224b2fX852C/tJUF6gfJGKAEKpN7tujBZd01Zvu1f5nMCOLFJTc5UHjUfhSM4YmgKU4aOMe0vIBcpLADw5oYNAZdas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB5tGBGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evha8ZM1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBdgN1138045
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2TlsIu3n7nbKaDJh1P/LwzPM/IJp0Dwz/y8o4GX5Z10=; b=ZB5tGBGqrmruZC5I
	UyQg/xhANWbk14wUoQLI4FTI9GBI8bmOFSlkvEyAEcbC3YS8XCMcS7qTMY0rBY9P
	PdZE+Zukbh6E6AJs5DBEhfzznsol2xrtGhVjF0QG2g1v5vQfIhKieXMWfMBjHpEb
	JnUEMIGvEPHJS5dPFIEMfpvAhEwTun1wa/eQNf87jaxvNthPebbnoRqliRgR13q9
	gYEEuXDKZOmCZ3/n0oX+ZuLjlhPwPphm5GeKibXMqss9b52ZILStRZZLuEYwHxll
	gHdKQjaB6GPDVzsdJaqpSphsYUqQogi7xV5Z0+FN7x9KEkDuBLpy+lmexKyaDbfm
	Dfthaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jpvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:52:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176ff55dc2so11428131cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099572; x=1781704372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2TlsIu3n7nbKaDJh1P/LwzPM/IJp0Dwz/y8o4GX5Z10=;
        b=evha8ZM1i18kw4ZTHEyxGR7Kj52l1nN8KO7CVl/QZkJerO5qKg5OINwg+MqYUkTKO8
         Jr153wUck2Uqr6WOy5n8cZWjGxS8AkRWrA/7DWVeLoXvsgN39x2t6W5M+u7jQBYFCaaN
         xBhg8Nj9mytutcOsmblh2UpBnD9UEAnAQSkjQ2l4wfCBiGo4w7IvUtPQXWRq004lq/Uz
         t4X7KmEAu9/YO9Ts177Y4xaTJv60TN/jjy3sHeXKQm0QGXn0PZey1AlKxnKrJoCseo3D
         vUZnyJ8Kzz0XuNPCFqCbTjjCiiKPFzyCg3oXZOAwe9s911ytkfQInPcMf6SjdqMml2mx
         lltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099572; x=1781704372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TlsIu3n7nbKaDJh1P/LwzPM/IJp0Dwz/y8o4GX5Z10=;
        b=R5fhey2AOj2Xbz8eByXJTX+2NAjq8EbpNGFlwp9F18Mok2kzhHa0NYYzES8wGM5KEa
         F45KYNtsAXkaBGkuocx05KhDpzRZG4ktxIje6P4Fdlac0tB6nl8MEDZ8XCcb0GiFh4yQ
         cxmkXRqDgOz2lcw25w9p5GiMbB9s0rUkpub2jxeD/17lCGIyLyqTUj4/T4uszB3CGm1b
         PvHwsr8z0l8HmDSxH3r5JyToxFgxHgUo2q4Y656w7oy2pJ72T2O8qEQ8E4HhA+O1tY1o
         2L5+37v2D2F1fIJ5zzbBDpiI9+KFDGb6356fq2uI3TiY8RX6Vnz3jd6XGmzCXKS3pfLI
         PTvw==
X-Forwarded-Encrypted: i=1; AFNElJ/bmNmp0kKXCUmMHrevf8rwDlO5520NoxMjkN+T0rlpgaqTLiuTEUYX83+aMXMKgKaV2EK9ViReppkF5I1N@vger.kernel.org
X-Gm-Message-State: AOJu0YzIa8AibLTl5q00qSWL4lCSq7IItv9SnBZQ/oZdQTaxitLydoLB
	GjdRE8ZCy4xczMRheJS0trlm9OITkbtHwC4A2Im6xePH70XbvfQIXei7HKcHxRYJrRJ5UR6j4/j
	lISC3jMWzzbz82QA8kH4NaGdPkTDG43PSqvwfAwt2oOO2Vj5R+fmGF1E69DyFiWsAX5diNUaSm0
	6e
X-Gm-Gg: Acq92OEoaKVElZi9UmISVrhgrK7b/+6N9lfrIMrpUZ9cQolgnmmyv52xKf1wdl/yJvy
	KB3wN7A7hpdZ05FDV7vYBw8tVREtyvXgZPeYx1PxiAWw9F3Fp2GfHRmKzDnFClG23rwUBx2vqq1
	lCJZScLJuLBtZ+JwRJYgokItUUsK8I8NT5KQN8XHpbIIc+ZqJjacRmJa0qyHmje4OXIhK/84XrQ
	3/7K1+mBaAzRjwWEdBuj89URGNxiWZlg8RlBEZ4q2zhfAHhum5kDzb5EYx5Z3yHkmLkZ3TQ7plo
	ke6yJAnk7IVlhn1oeWTtZ+Jxg8b1ZzrGfVo90axWn/KiY6TqRHVeO4Fv1fXi7WdXm8qq+qmNymv
	IDRLD6bXYh+nXOSS7gioDHuoHXbehhD/tTW1duz0oeqA4BXPbGHudoxxP
X-Received: by 2002:ac8:5f50:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-51795c1b7ffmr228568841cf.4.1781099572039;
        Wed, 10 Jun 2026 06:52:52 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-51795c1b7ffmr228568501cf.4.1781099571590;
        Wed, 10 Jun 2026 06:52:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm1227220566b.26.2026.06.10.06.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:52:50 -0700 (PDT)
Message-ID: <5dce26c1-71ae-4c98-8010-037ff2cbccd6@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:52:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [alsa-devel] [BUG] Lenovo ThinkBook 16 G7 QOY (Snapdragon X) - No
 soundcards detected
To: "thomas.kuang" <ks002278@163.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <5fc3ab80.a3e2.19ea717f09f.Coremail.ks002278@163.com>
 <3c28dd62-223c-4447-8cec-c7c527aa49e3@oss.qualcomm.com>
 <5c57153a.79.19eae7e2814.Coremail.ks002278@163.com>
 <0a578098-7003-4048-9c29-affb632c44c9@oss.qualcomm.com>
 <6aac2e60.9b61.19eb1bb6031.Coremail.ks002278@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6aac2e60.9b61.19eb1bb6031.Coremail.ks002278@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a296c35 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=FtP5j2NBnik-WtIcMc8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX4+ctFs2NZqlU
 JqfEuki68ZH8mIDoSO0Br4VLW4McSv+wz4R8kUFp5R3BJDPBKaka8It9PKOlrMtPrPYYD6mHcJ5
 PbZH5bRha68Y9hdRGx6qWf1XpQJx7vdvF2XAFvEgyX2SFGTokGrqKZT1lq9nU5SnhQiBLMLBh6K
 5aH/wOeOnPDVGXNKQeisUz92wIp8Qvkww2DBmTvThYU8QmNQxxNaumvUUeQIyZfYVEQHG+KBiTI
 S4BB1gSmpSTtAd3vPM4QM8gMsyZ/Uh7NlWG5HipngBqd56LcE4NC4++IpoGEp7Fob9r+xko4Jvj
 Mh9462gDd++WU/8CK1oNLUgcPs9OKft00bAV7p5Cqo5xpwXtaAqBDraJWHDSKEH3FAGoAxoiMsz
 odVW6cUlpqvNoluzaRXc2r0lzqkoKYwNiRpnLh4mSJqTXfYY+xYZdkV9xrLGoORwP8tY/YAZ+X5
 QuZ+v8Jcw0N61nb9mBQ==
X-Proofpoint-ORIG-GUID: doO-Kx6BqOUpd0y4P_sJfzPhqGyXTilI
X-Proofpoint-GUID: doO-Kx6BqOUpd0y4P_sJfzPhqGyXTilI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112497-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ks002278@163.com,m:alsa-devel@alsa-project.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8848C66A079

On 6/10/26 3:31 PM, thomas.kuang wrote:
> 
> 
> when run 
> sudo sh -c 'echo "start" > /sys/class/remoteproc/remoteproc0/state'
> sudo sh -c 'echo "start" > /sys/class/remoteproc/remoteproc1/state'
> 
> 
> dmesg is following:
>   625.929265] remoteproc remoteproc0: powering up adsp
> [  625.929296] remoteproc remoteproc0: Direct firmware load for qcom/x1p42100/LENOVO/21NH/qcadsp8380.mbn failed with error -2
> [  625.929299] remoteproc remoteproc0: request_firmware failed: -2
> [  625.929302] remoteproc remoteproc0: Boot failed: -2
> [  625.936529] remoteproc remoteproc1: powering up cdsp
> [  625.936552] remoteproc remoteproc1: Direct firmware load for qcom/x1p42100/LENOVO/21NH/qccdsp8380.mbn failed with error -2
> [  625.936555] remoteproc remoteproc1: request_firmware failed: -2
> [  625.936557] remoteproc remoteproc1: Boot failed: -2

As the dmesg suggests, you're missing these firmware files and need
to supply them.

Konrad

