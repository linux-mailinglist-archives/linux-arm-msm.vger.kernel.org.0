Return-Path: <linux-arm-msm+bounces-112269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hfrWLH9sKGqnEAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 21:41:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F9663D81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 21:41:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lKdhc4Jh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z22T8Ex6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112269-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112269-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 226E9308D4AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 19:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5FD3749FF;
	Tue,  9 Jun 2026 19:35:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8489F3749F6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 19:35:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033734; cv=none; b=fAkKnp6NcIy1Yq2kpxsaO/+qtlgR6TTo9lfZnWJlHyGVvpjW04UC8T4V+o9ljy0ozE2ySkgyHUWbc3MCc5fb4DklNNWCwHexFFj+a6wOFB6JS0yyJTIdq1pvWO/m+ul25ZKUoMQGuOgf4xifChBY473DAVZrxMOuGdUv0zXQJQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033734; c=relaxed/simple;
	bh=F8lS7QpPVnacaOQXs3rwaqUtwYpTjvSxT7xJheckgbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btpFVKEcFSpRHNaht3Yk0u4WKTqkWBCxa6ZnBxzmFUJsM/lm+it9vV5DkXP9i1u+NpPBbQtV+dbLHNEOpwOkKYWITBxbgctoTn9lVjKkU+mNawYghX9VdkwCnLGyRilTf7Fes12RVhCNjogTQgGiu1s+eZDObA2IgkMKa6esNkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKdhc4Jh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z22T8Ex6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOYOL3121631
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 19:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8lS7QpPVnacaOQXs3rwaqUtwYpTjvSxT7xJheckgbs=; b=lKdhc4JhflKlsOXg
	hYS5riH9iP0okOLoMHmCTgBz4qg4hgjnuroX6AWYJnHDLguQJQ5pP1abxqi3ELk5
	soVWjFQJlLOH/kdGLq/uw2uIIcLXNH+rIlX5yN34DE012hUVGQkaw7YtfDpdftfH
	zw+bLKyace8bfspBggPhZGHCzN2UnTmiXbFKpZhw2iXHtNo/RGAHo3pBP5qe1eWb
	kFWrASMfBHEzDjclkslEveDfWKk+a6T5oHUg8oOuuvhK7KnAlqwMxc8btYV4wcqn
	DHhqyDAAWIhkLcShsepUgpxcr+ORdxG05UNzfwrBbvIV35y8aLZ6+nWc6y3Hj8/4
	EShtiw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsbs0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 19:35:32 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383414cf84so999149c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781033731; x=1781638531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8lS7QpPVnacaOQXs3rwaqUtwYpTjvSxT7xJheckgbs=;
        b=Z22T8Ex6n8+cC1DiYaPHK5gZxWdVs6NYjpujZb/4KUi/H/z64SsqSAsxkcOefGicbI
         aR+lbVDX6iDrc0ltsIy+kH0P0Bq/nC2Mxl8OdUNiUntWUwfECUp1XIXDvz2sCX8QuUvW
         44YpXkfUGTGNtyn9Oc8lTQvZ2nSIXLLTzBm73opStLIuWsxZioSftlWBWxvXHXrlI5DX
         fCxG9cXYmvc4lIQLcU7KbtM6gZ+SIBIboNAc1RlVX0L+zbJWZgW6+Ld6ydJyuOVOmVhL
         E/TDUwQiyEKneE0CrxKTAFTvyDVGIFnYgdGtIyoZxHOAn2R8OEj9PnlTbBX1bo973Saj
         P+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033731; x=1781638531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8lS7QpPVnacaOQXs3rwaqUtwYpTjvSxT7xJheckgbs=;
        b=eRNBTNqU8QOHBz3M45Znv0Z6gM3jV/bijDSRCyZBjhdBPrkG+fl98RvtrXhhl7l0J3
         AgB9jMQpY40rt5Pa4WFcYPqKkJ1uA9Gah1OKETWR9b6ZKG+JhlP6I67RIZnmuPC/2JyC
         S01U0kiemZoboTwlFyQ2ltr0gW/OsaaY4maDynLx1zL7PhdKIEUZ9esorayBK+13LLIp
         Q5e+WvO2Io2Ncbqp51o2tiwHgATJ0rou50YcyFEWtgaMeOg4WRSIzmZI2A9Ed6VGH6cW
         UnNXrmx7/XYLoM7uhRGW5J9/psYbtbjwI4Vf4uGsPhp9oPJZEM+xvylVekvHaicf1rb0
         lHCw==
X-Forwarded-Encrypted: i=1; AFNElJ/eCb8wyW2yfFjY2ZTqXQKAUqaOFJMj5aZBRJlTCSO1FHAFkycomj88lx65e819dA2wYmRfgrAuNNIzpElp@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFWHoNNUt7bTSTXdghAd6Sh2typKRlsJuTyTIYBfGJ/mB7gq+
	Xtk13+DQwm69F7EJzbb1uFm1H7fonr4UTtha9eHQ+9VflggXV0FHz2+Ft1H84sEjiQqY+Z+8bXF
	4yQjGQKBuioJhorXDQVWHEyO3n4yRz1+539qZHJ28CHtz16orvKe7rW0zym+6bgl18XUx
X-Gm-Gg: Acq92OEfGBQ2aY3hXroAt3DbEnYdpCnbzoyCrIlF8YVrl4OK7CewfnJuYqdi/qJOzTj
	MQO+TVISfg8K4t+49AnQXvGiyZcnD8HkL1ExfqNC32S78hdqqLgmq5DLLIgKnInEOuT2wjoa1ly
	wf0KXay9HdxYyEbd8NbiYB96NR9Xbf0NNZjo4OySfJSvP9k4Fiu4Fng2O86bmO9/vDWaAcLV2mI
	HJRMbLcLF6aslMy/VhPF2BK2+sdLgGXAkHztuz5FL+Ao96mWWeQTSJ+bI55xZTVTRm77zcUKHgm
	84S4xQXk3wzabUXokoyessG7IPsm7BgYGBLkX+m1BEWqUolxiP9xJt6kMkb82/22g8JDTerpecu
	5OjYCwv3kVQpWM9HvS9U53ruPF5aQucr48b7o4UkWepICSjpTJC21l2nvB/96rzQ=
X-Received: by 2002:a05:7022:fe08:b0:138:364e:3224 with SMTP id a92af1059eb24-138364e332fmr1407681c88.16.1781033730807;
        Tue, 09 Jun 2026 12:35:30 -0700 (PDT)
X-Received: by 2002:a05:7022:fe08:b0:138:364e:3224 with SMTP id a92af1059eb24-138364e332fmr1407636c88.16.1781033730210;
        Tue, 09 Jun 2026 12:35:30 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.107.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5489d17sm15724085c88.1.2026.06.09.12.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 12:35:29 -0700 (PDT)
Message-ID: <5fddd1a9-b1cb-4d08-86e5-665c4d1b147a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 01:05:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: Use pm_runtime_force_{suspend,resume}
 helpers
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-use_pm_runtime_apis-v1-1-6a5238fc6cb6@oss.qualcomm.com>
 <aihahOVIqpm83Guf@zenone.zhora.eu>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <aihahOVIqpm83Guf@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DpAE9ZmjS22nPd0rqLG3MLpEH_bkzUki
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a286b04 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=uEP1mZ4tISDvfoPjOx4BnA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dN3C5qKZf1Mu_qcU80cA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: DpAE9ZmjS22nPd0rqLG3MLpEH_bkzUki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE4MyBTYWx0ZWRfX8GfJsecliBxX
 5b/kbnlFS8RUPIsaWhVkD/P/E/Gz7KEFHrwJ58aaMd3Po1xtbsw6kn3fn1RwTiZFWFKMqZc5+iu
 zOF5YOtaR+dBa3afzAEHBOaesdcEzX7F+/UGhsOeFN2AVhSFqMQk0ub9ap04qcLazNR/wBvQ5QO
 2yUucsqGRLYaVYB8DyJXVmQyl0DrOeaW/dgaFBrVeHlPfTvFbgXZFdwiPNfoJfIdMYDvicO65PS
 giVzfFYy9sxy+ksB0AYcSq3kQTUWC2oISR91jHRWVww/5U5k7HDfPFlhGzYOJlvwSUNsdc86N8C
 yD6Nv8YhPzAZnelWP7EEF2Kmgeqck2K5cuPyuoXZ51Ho/9/Pb+Pses5PA8LMB1z9ZS+NHbOysdP
 vqRZkMA26+uxCxeShU/wFNUV0Jlk/29VUOeD4W6E8p9Iw/f46KuJa4Kn2mfYhzLMKRZlGULEru1
 Yl3nDN10lMIa50kKSXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112269-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E7F9663D81

Hi

On 09-06-2026 23:58, Andi Shyti wrote:
> Hi Praveen,
>
> On Wed, May 20, 2026 at 12:44:29PM +0530, Praveen Talari wrote:
>> The driver carries custom system suspend/resume handling that manually
>> tracks a suspended state and conditionally calls
>> geni_i2c_runtime_suspend()
>> from the noirq suspend path, then adjusts runtime PM state by hand. This
>> duplicates PM core behavior and adds unnecessary complexity.
>>
>> Drop the manual state tracking and switch to pm_runtime_force_suspend()
>> and pm_runtime_force_resume() for system sleep. These helpers already
>> perform the required checks, call the runtime PM callbacks when needed,
>> and keep runtime PM state transitions consistent.
>>
>> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> I normally don't take these patches: Where and when has the
> review happened? The reviews has to be done in the mailing list
> and I need to be sure that they have been discussed.
>
> But, because I know Mukesh, because this patch has been sitting
> for a while and because it looks good to me, I merged it in
> i2c/i2c-host. But please, next time I want to see the review
> process happening in the mailing list.

Sure.

Thanks,
Praveen Talari

>
> Thanks,
> Andi

