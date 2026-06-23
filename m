Return-Path: <linux-arm-msm+bounces-114199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SJXNF111OmoN9gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:00:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3116B6F1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:00:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XoE5k9vi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jU8+mOg+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114199-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114199-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E241E30465F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BECF3D47C5;
	Tue, 23 Jun 2026 11:59:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3413CFF7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:59:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215971; cv=none; b=K6SUI7be8gyK6wUJfp6cSnR0T5hRwjhpjn4qSFUGxASUfU3cWsVtTv69YcMQit+Lmfvetny97d5FobY0jbqYsQVsY69z5gI8biv2McD/lJ2ZxQUh1NjgWN3YyAdmkurk9JJ3v+3sZE7h6RrksNgxKdunp2ok1ahqCSDhoWbDXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215971; c=relaxed/simple;
	bh=N/3AVGovt15f7wbdWrYGPsjnPnBLGdx20x+VTIjeCAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtgJLRRIqoQxThzvStJhh5tJGPltGi+2QvbVcn3oA39P1O5HYMVACO0gzsr3cIeYeddx7p/J4pX2LUzHOgdC5d41shclp+XKoeVOcNajkHX0mw3xzQKMXvgNT5qbJHS9aSBFXU5r7gZ9uR5ExsNsnyvAfcJ7Hcfj5H6wUweo6OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoE5k9vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jU8+mOg+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXcI01155240
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeDY1Z/tgJlpDbX7IPSk/ptAPNQ1w+OnQUXLRd5JDUs=; b=XoE5k9vinZh5Yvv2
	OO2HBm0lodKmCxTYcaA+Br6B9oBuNGJRqr0ri5m7si1tBZZZmdCEd8IzSf+pe0WP
	xAOJHibs9YDVhdVXPzwIlK+6/oPh/wO9JgHmT2N/heiY0NIizBRWUA5QiTV+FSw2
	HwAf921GPUZdFIVBevmC5H/KQIWO+m4Y83y1cUuUUOo3jSGPSOYHaU7Z9QhyGw9c
	DibnzKDJXwBxbMdOAg1hmDFYP3uinEAo/kUkqn9v0dPBRrwA9NAhqSCzxKQU4BmT
	Hs6PZTW/WL+N5535yUKr+8WRfp5Xf+lVjL9Ifxj2QbfCg3CfbP63vChuCPSfi47R
	/NF7oA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28rdec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:59:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37ca2bf8e39so6064911a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215969; x=1782820769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AeDY1Z/tgJlpDbX7IPSk/ptAPNQ1w+OnQUXLRd5JDUs=;
        b=jU8+mOg+wsgDCxfRcSSIKAwu8Ieh3TsCVRMkIALGveKbIpW/NW9Ht2zBotRfmBuSWR
         XmNEqoqLLJs3H7NrcRmd6iMOvaEeiRzju2p6kUK2T15UDSnLHp5Bf0WBG9NdGRYc5dcK
         pknzIcVQmUT/GVfz8ketSVHR07mRtAfsv0u+guNkVyDF734H+HsspJhH9GZWwp/YchVT
         Gq6waMtOyONfpOyEiJTs3ofrixok1Pvrt3GgdjFebH4/QoHTiuPSUJkERHqiVUtdxXgK
         QCtwuS6w4eHQkQy4WcsNphNbEdtWD5bBXQw2jVUt8o9T/2ozn3rNBPtEhe8a7Ie4V1G3
         3kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215969; x=1782820769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeDY1Z/tgJlpDbX7IPSk/ptAPNQ1w+OnQUXLRd5JDUs=;
        b=R2qv6uYE118aNZAeCE+GD4Rlu+t+hdbMxVyjORYgkeDTh6mQLhkOF6yZmOCUFP98jy
         HqoK4bV7FHEvoqDv8pIem+WktmKx1EdVLONRlUOq4Pavbckt8/e7k8UbwF9Hwic9oDoc
         BPot3MFts4r7cepjJMZePmeqV1dRkOdv8kiOyguzjwIp2OTNYCGLzvSkPkmDAZthFkk5
         IEz3EJayuldgf4N8Scyt9f5TOpUP1Y81PmotQWemcegKBBS/LPIzndTgo75stJw9jGvO
         Yn6Q5x6CPhks+pmHYceZAGrHjvUsZjLRAVyk8l9/ewasFfqJjRDuOzMPanK5U1QpRW5E
         LdgA==
X-Forwarded-Encrypted: i=1; AHgh+Rq12y7tkUAwyzAvQv2O6BvVNjVG/sv9iv3eMp8hKtqBzKrcQHGmI000aAstPo+k0XPkWr2Du8agEGGww+qI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+11KegMVEQID8/nxlX9TZb5zkzI76kQvLyB60DcTpLBHbryA
	CXUzZXRdVLhMy11uBLX0S8kzq96SJduLzBGJgee/UgRkVyMutOMXUf3NDa14l1XxN7KYRxK8G9O
	K/k+GkndpyvBVPzhYHIzzp36FErFMmPWH8nc43fBEVOJbiDSxmbyoumIVi4eothB03lqB
X-Gm-Gg: AfdE7ckO6VjgLcEMZA+cWl10NRtnE4D/sT2YScOmhGa4FNxjYoffqw1DHeiZn4hxW4d
	py3ohRSOqJfAl84nKlaTGmGDfjts7LBrtijvF2GJaedqInO/oE0zyLOKs+FROtzG67oa7bV3en5
	ZN5VeXqYiuGr+4W3Qc+6dIIYfLOSSmH8b2NeK6wA9VKt4XaFgXNKrP0Izfs0buRPckXtpVqkXJc
	VL+uVHb97vmqabTOkeAF0yAzC3jzeebZaUplMu/31URZcA6xalqBoiFtxFwVvhkrzMQN+zfpC9l
	BlNa0z1ZSHd227mnwCVHDlfjuDwUvdupsrJ0vwaSfxtsAG17RmMTO32cTfQklCva4keV3OAFXBM
	umJ7H8ECyf769FaI9KtSRnbFico+P7R4y46k3azo=
X-Received: by 2002:a17:90b:4a4c:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-37dd15bf1b7mr2558286a91.0.1782215968754;
        Tue, 23 Jun 2026 04:59:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4c:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-37dd15bf1b7mr2558262a91.0.1782215968224;
        Tue, 23 Jun 2026 04:59:28 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f2d2702sm10091200a91.12.2026.06.23.04.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:59:27 -0700 (PDT)
Message-ID: <84167531-b252-425c-bea5-49992a9c4500@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:29:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-3-ajay.nandam@oss.qualcomm.com>
 <89c4fb14-9884-44a0-8921-fc361a9303f9@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <89c4fb14-9884-44a0-8921-fc361a9303f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5OCBTYWx0ZWRfX5vOvRShLIFuT
 tGYjsKljLxC/Fa+cLSmMSQecGLqIM66pZvcIskZWlSxlWcqRMQmu+lYayKJAwyc/9pnbAR0fs4z
 QMGO7vbuyDTumDT5WvJ5z7Tnkm4W/SA=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a7521 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dF8yuam3Ay0lu1q_4Y0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: IHMBFdLSUY997plfY-djt8QcFxAbvgDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5OCBTYWx0ZWRfX0bmLnNHoOt5E
 PJvuWmzjKTSwUsgW9Vh/G4Y8/txhkg8nJ0fraaOtqh97vs0KCD7Hh3S3CzACg1Wt4v1drXDCTMm
 tAHivMRNNaf+WvWR5H9EA3q3Lk5W3mS5na0L0wPQo12yQptUerTjfgrWGB20z11aSyXmtoQcCqR
 4YC8C86fZjHbUd0cXuC8zioa4uKkyNoHEmjkyP3lwaxav23/enC1sTClUQ93sd0JFGD+O/dlGlX
 nZi3FhtgK9s4fuxLGUtbO5HajwsTawuVrJftPuOlims9wel0pDLc08ISClF8tcSM6WOTp6cXaFq
 VwBd315GT4V4JhlWFjyPiz63xI/byuC8Y82aio74Y514T6W9upBmrxb6lFxnhy3ETVMtX0lDZcI
 hZ4WLoCoW+9ObCFa5zsznDoifPXUhE09ks/lkwmiiBWNAimacNM7O1BsKZevmNAnJwfrwcvYRYZ
 +fRTo3oe4UzI/XvcPmA==
X-Proofpoint-ORIG-GUID: IHMBFdLSUY997plfY-djt8QcFxAbvgDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114199-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE3116B6F1A



On 6/23/2026 4:09 PM, Konrad Dybcio wrote:
>> Convert the LPASS VA macro codec driver to runtime PM clock management by
>> using the PM clock framework.
>>
>> Replace manual macro/dcodec/mclk/npl clock handling with PM clock helpers
>> and runtime PM callbacks, and keep runtime PM references around fsgen clock
>> gating so PM-clock-managed clocks remain active while fsgen is enabled.
>>
>> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
>> after idle while still avoiding suspend/resume churn on short gaps.
>>
>> Add a PM_CLK dependency to SND_SOC_LPASS_VA_MACRO since this patch
>> introduces PM clock APIs.
>>
>> Improve failure unwind paths: handle runtime PM put errors in probe/fsgen
>> paths and restore regcache state correctly on resume failure.
>>
>> Signed-off-by: Ajay Kumar Nandam<ajay.nandam@oss.qualcomm.com>
>> ---
> [...]
> 
>> --- a/sound/soc/codecs/lpass-va-macro.c
>> +++ b/sound/soc/codecs/lpass-va-macro.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/of_platform.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/pm_clock.h>
> includes should be sorted
> 

ACK, I’ll fix the include ordering in the next version

> [...]
> 
>> +static int va_macro_setup_pm_clocks(struct device *dev)
>> +{
>> +	int ret;
>> +
>> +	ret = devm_pm_clk_create(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = of_pm_clk_add_clks(dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>>   }
> Can't these 2 calls simply be part of .probe()?

The helper was added to keep the PM clock setup isolated, but I agree 
it’s simple enough to inline into probe(). I’ll move it there in the 
next revision.

Ajay Kumar Nandam

> 
> Konrad


