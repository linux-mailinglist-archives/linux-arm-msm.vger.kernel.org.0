Return-Path: <linux-arm-msm+bounces-111353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZwLaE8qgImrFbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:11:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B4647327
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:11:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b5JWmOkp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dO7L8OYw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111353-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111353-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62E14306E1B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4FE3F23BB;
	Fri,  5 Jun 2026 10:06:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425E3F4DD3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 10:06:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780653986; cv=none; b=D/hflGJTyeLQSvFSJyGFxIrg8/xojRuCnt3PlEKxg0ZPfVJXBJ8teo9OKsEkwb97x+He2yiBTRIx+HL/p1LUWFUIZcbm3huYMwxrimBaTEI5A2eFlOJMyBpGe0AkEbP5wJFCIlQfBbjHFVgf3UU9rYeEHWKSJdecosmJ3nIuR/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780653986; c=relaxed/simple;
	bh=x6Mx/EW/MnayQyGmBtoLxhCwOIWl2EnFGvzou5bIL3k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PCYptveTRd+dhxOzoC86Mq1IiPfNacyd74wS9cNN9FiXEig/seUVR1RvJ5m4VxL9Ap6V17zmOcmw896Nqva4x59NJBkoDAQ52Bvto1m0NWnhrMy3SdukbiiT3aNS1v4t+oCbJjPAhxEp35/TzqV7//8KbBchPMcykpZKTLghhw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5JWmOkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dO7L8OYw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555uY1C3112556
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 10:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cm8WyObyqkNfRyMO7iz7bczR6KF/VFOYPmwAPfJalxw=; b=b5JWmOkp14IgWlcY
	HpfJ5cagbB0aPkpIrZJAMwxWbvT+yVC3pT1GB2h+A84TH/Id7e3t1NxtdDYlYUOV
	O7AL71vmtWheMVr7pOySNtYrcbTlRxKZApl6KevjsEofUxYfzhHApdPBxx9jROam
	9DXKkmQvdFENxdmvZcgw96aP7S1BQDEeKFd60L+ij8AyFVGXQT5OHJdLUlxgKiai
	HyGQZcOm7ELnaBjpP/KkxjTXcWPoOu2hg4llRZN2ToUQRUX8ikfcGDT5lC7jZPwK
	V+g0MEaonk9eya+jAswFI+izXoMuCCJvE9Kr1K/0IQgwLXwOGwXLfec15WbOMY/A
	aa8hsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekfv72xvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 10:06:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0b35fa876so20429755ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780653983; x=1781258783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cm8WyObyqkNfRyMO7iz7bczR6KF/VFOYPmwAPfJalxw=;
        b=dO7L8OYw0TIDOlkSO0CCQq05Q88NVHkHxEjIBzZtHsIDfo9qnd7cGrA1lmVNU2vABy
         QwWTBHylq3ZWLNRU74pJSAMVMZ+mmYmaoGc4eNFxr7C9hicT/hkgBSRc37R0H5z9RiWz
         c5nNUuALJJ1UU/IF1D1A8Vn6YMjvHNkiJZOD63L9DAGqXLWKVL2c7oPW83kOezpKZB60
         +m8mJfhS6OyV2KwoaWdq4yrYImYb7M75apC3uMRrr3eOSrgX311T+DovFRlxMjwzLEiG
         3GyEJzyGW+zDlVuRuaMpohn75vKOSJFVpMpvN6lC+WH2tTctZaVbxG0Cx1+TBUKJi3++
         rEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780653983; x=1781258783;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cm8WyObyqkNfRyMO7iz7bczR6KF/VFOYPmwAPfJalxw=;
        b=NpqPaRVi5VZRWB9hPmf+vW/ow9yDubLUd6i36a9b6R11Rf3vE5qswCV6ujGnu9ryFt
         NHydmq+hSYEvHhRqb65Y0H7Hz74wmDsC3lzichrVBOfkt8PiP+eo9yNPRZZPWzVWM7ah
         oOBpW5fwFShHD/zceUbhErsL8p7NkxFYk9K6HvLjbRbl+FsQkaSBMGBDB9BrhFSnZnJ4
         gv2RWUtp7r4yeRW8u5c05toz5kp6X01p4N1lm+2e+wEDWIJlSP7IHW+ES8BCkMaYdRQW
         OAWeMIvn2lOivD+POLFWNkToTmKl+YAOqBOPpmYZUcXHv6fVXfqPqqd3CnB9dX+dEfu+
         mxLA==
X-Forwarded-Encrypted: i=1; AFNElJ/cE3Tnzzq+z38CGq/FiX6AKR6w6phLaIwQe2+AsXS5xC03DidciNkQfmwt1axdOLQ2dqGaD1Qym57ZG9/S@vger.kernel.org
X-Gm-Message-State: AOJu0YweYIcaGp6VfOmQInHkDCOfyFTKEU8aWWWkyMAsw4bJQEysAEwV
	RSEEsw4JFMbePKud5Smm5p+FKXJUamcL+YBlJaMj8XFRk/1ZLN4g1HdxsvSGLDh+yJOcrlC8Cre
	ZBubMqNAK2E1tXn5S9LXUqdWBl/Duzdb9fJGbKTtuZ4qZZFiCtcLGbYiqU13XuJxVodACw9A1Sl
	vRcQ==
X-Gm-Gg: Acq92OHpa+WR2lZYpDDW83KVk7privJEuRv4q01WOVtHmikS84SrDqpETg8tduGVlMT
	6L4rId8JJDibwV+63htnXJBUpt4ZQG9cHZPJQ5czKQlV9/zs3WdOwTM7eN2KzbTfvr31mabI6P8
	0KaapmsHdiSIFmUViwr05WJEfUNXa4UTHfX4w0mljKeoqvr8Jt5vCCMX9tSgJu9pgMDYEkn2Ml6
	FftVfl6+0/37vLgHFa+cMVIrnj2hfrv2UXRuhvfSc27MYFoNnvAHBN/XXy9Q7hYUNXNGTF+rLhL
	8JenjewvBAWymkR+QmuDOB6hW3H0w9OmWCrX8BhZe5kfN+ALPGa/qnd51lSxXN/iIL174abqWe3
	dRMd/4E73HKXIUAewAIjkiT643NKUjVcMsPpK85WKhbWz1PlrjUggiTgL
X-Received: by 2002:a17:902:e790:b0:2bd:d7c5:9272 with SMTP id d9443c01a7336-2c1e78dfad0mr30498885ad.6.1780653982973;
        Fri, 05 Jun 2026 03:06:22 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2bd:d7c5:9272 with SMTP id d9443c01a7336-2c1e78dfad0mr30498265ad.6.1780653982379;
        Fri, 05 Jun 2026 03:06:22 -0700 (PDT)
Received: from [10.217.216.18] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d042sm89757565ad.60.2026.06.05.03.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 03:06:21 -0700 (PDT)
Message-ID: <aa80d41d-43a9-423d-960b-c7a7125c5014@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 15:36:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mmc: sdhci-msm: Set ice clk rate
From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, konrad.dybcio@oss.qualcomm.com,
        abhinaba.rakshit@oss.qualcomm.com
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
References: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
 <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
 <18af0dcb-8cf1-4565-a90d-58bf1e66811f@intel.com>
 <a03e129c-6719-4cae-bffd-563bf1dfc335@oss.qualcomm.com>
 <650d6ae8-36c9-44ba-a065-a1ceebee48b2@intel.com>
 <1487d620-eb28-4a66-a611-0c6dfdf1e538@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1487d620-eb28-4a66-a611-0c6dfdf1e538@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VS6Iy9TaUTeTHi5iQ1HPkdrA4Fp02YDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OCBTYWx0ZWRfX7Ak+ptl8ue95
 LKOl7FghnLbf9FeNK81QzVd3O7QatwlaA0RGBmMX+10h33+SC6PrOwBT5yEODfTZLtDxvoVT639
 cD3MmxU7iBG+nulsWNf2oUTY2nio4hIr6Hf6lds0JthiURJppcXkUrOkD2/KSUDTnUkjFbX3mmd
 Tnd2EyhNI5O3arhHPdmNDCEV8Upxf22UthUpKI/RgDc+khNiQ/awEFLPh7Q+zH5au8bMcfNgb0E
 IPv7tyb4e9zwIY39EFRkYRSqmgt2SeMOaOmy5ocsTAnq0K8UMmdZ79v9l3LGj2JmF6s0wNunvFB
 Ejc1LfQWg8SnXZlT8jRD4ZjegBYnz9vfBU2856KFXllkL1prFtYmuYFWVDU6MmIz0jBCPzoq/tz
 2CbKxy+77KVKybiIUX3cRduFJujZ2Md1dyfi5mHSFfZoQbbr0UZovt4usRiY2doIkNmgPbGNItI
 UFktl5m0cKhO4obVaew==
X-Authority-Analysis: v=2.4 cv=JNULdcKb c=1 sm=1 tr=0 ts=6a229f9f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eytIU0s1LhRWHgRMX8MA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VS6Iy9TaUTeTHi5iQ1HPkdrA4Fp02YDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111353-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ram.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:adrian.hunter@intel.com,m:ulf.hansson@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:abhinaba.rakshit@oss.qualcomm.com,m:linux-mmc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pradeep.pragallapati@oss.qualcomm.com,m:manivannan.sadhasivam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ram.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B47B4647327



On 6/4/2026 5:45 PM, Ram Prakash Gupta wrote:
> 
> 
> On 6/3/2026 1:18 PM, Adrian Hunter wrote:
>> On 03/06/2026 10:03, Ram Prakash Gupta wrote:
>>>
>>>
>>> On 6/1/2026 1:00 PM, Adrian Hunter wrote:
>>>> On 29/05/2026 11:10, Ram Prakash Gupta wrote:
>>>>> Set ice clk rate from sdhci msm platform driver, needed for
>>>>> target which are having legacy ice support, and need sdhci msm
>>>>> platform driver to set rate.
>>>>
>>>> Please expand upon what "legacy" means here?
>>>>
>>>
>>> for devices where ice node is not created as separate device node those
>>> are referred here as legacy, separate device node for ice starts with
>>> below change: https://lore.kernel.org/all/20230407105029.2274111-1-abel.vesa@linaro.org/
>>>
>>> also I will update legacy that ice nodes which are created withing mmc dt
>>> node, so that ambiguity about legacy is clear.
>>>
>>>> For CQ case, qcom_ice_create() prefers "ice_core_clk" before
>>>> "ice".  How does that relate to this?  Please clarify that in the
>>>> commit message also.
>>>>
>>>
>>> "ice" is the naming convention used for emmc ice core clk in dt and
>>> "ice_core_clk" is the naming convention for ufs ice core clk. In the
>>> function you referred, since ice driver is common for both storage media,
>>> it tries to parse both the clock.
>>>
>>> Here we are handling "ice" as this is needed for emmc only. I will add
>>> the same in commit message.
>>>
>>>>>
>>>>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
>>>>>  1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>>> index b4131b12df56..c6a073718aa4 100644
>>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>>> @@ -286,6 +286,7 @@ struct sdhci_msm_host {
>>>>>  	/* core, iface, cal and sleep clocks */
>>>>>  	struct clk_bulk_data bulk_clks[4];
>>>>>  #ifdef CONFIG_MMC_CRYPTO
>>>>> +	struct clk *ice_clk;	/* ICE clock */
>>>>
>>>> Why keep ice_clk?
>>>>
>>>
>>> here we need this ice_clk because rate set is required only when ice clk
>>> is added with emmc node in dt, and in case we try to use the clk entry of
>>> qcom_ice structure it will set the rate for new ice node as well which is
>>> separate.
>>>
>>> but also we can avoid this, since this one time operation, and we can reuse
>>> local variable clk inside sdhci_msm_probe, so it wont be needed. I will remove
>>> this in next patchset.
>>>
>>>>>  	struct qcom_ice *ice;
>>>>>  #endif
>>>>>  	unsigned long clk_rate;
>>>>> @@ -2708,6 +2709,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>>>>  			return ret;
>>>>>  	}
>>>>>  
>>>>> +#ifdef CONFIG_MMC_CRYPTO
>>>>> +	/* Setup ICE clock */
>>>>> +	msm_host->ice_clk = devm_clk_get(&pdev->dev, "ice");
>>>>> +	if (!IS_ERR(msm_host->ice_clk)) {
>>>>
>>>> Does not attempt to deal with -EPROBE_DEFER, although bus_clk above
>>>> doesn't either.
>>>>
>>>
>>> here need is just to set the rate, rest of the enablement part would be 
>>> taken care in ice driver, hence we can avoid this handling here.
>>
>> If devm_clk_get() returns -EPROBE_DEFER, then the rate will not be set,
>> so you are relying on devm_clk_get() never to return -EPROBE_DEFER.
>>
> 
> here -EPROBE_DEFER can be returned when clk driver is not ready, in that
> case other clks, core & iface, would also fail to get enabled and then driver
> would run into issues.
> 
> In case we get -EPROBE_DEFER for "ice" clk only then as you said rate
> will not be set for ice clk to max but warning log regarding ice clk
> rate not being set would be printed, and the ice clock would be set to
> 19.2MHz and in my opinion its not fatal.
>

my bad here, we wont get the print, I will add else case for log.

> so -EPROBE_DEFER handling seems overkill here for ice clk.
> 
>>>
>>>>> +		/* Vote for max. clk rate for max. performance */
>>>>> +		ret = clk_set_rate(msm_host->ice_clk, INT_MAX);
>>>>> +		if (ret)
>>>>> +			dev_err(&pdev->dev, "ice clk set rate failed (%d)\n", ret);
>>>>> +	}
>>>>> +#endif
>>>>
>>>> Could put this in a helper+stub function in the "Inline Crypto Engine
>>>> (ICE) support" section, to save having #ifdef CONFIG_MMC_CRYPTO here
>>>>
>>>
>>> sure, will take care of this in next patchset.
>>>
>>>>> +
>>>>>  	/* Setup main peripheral bus clock */
>>>>>  	clk = devm_clk_get(&pdev->dev, "iface");
>>>>>  	if (IS_ERR(clk)) {
>>>>
>>>
>>
> 


