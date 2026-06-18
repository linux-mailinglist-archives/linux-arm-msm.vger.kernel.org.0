Return-Path: <linux-arm-msm+bounces-113778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RcC1BfnuM2rKJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:13:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368B6A05FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:13:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wr0V7oL2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cbfL2L1Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113778-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113778-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39940305A5FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DBA3F8893;
	Thu, 18 Jun 2026 13:11:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41873F88A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:11:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788315; cv=none; b=KB0gsKntq9ZVxvlyrQSR0qD5WGx/xipXHPrZmSFV9SCJAn/4/O6vFS/3rZjcWEmLC+Lxct0FULk3UxFJbAP8W1EkANvyYOdG7Ek/P7Tmv3wE2QFZQcbr6Yfd0j2oxBVY0CzJe/mGK9Evbn3oI01Sol0YeRTqbEZgykQ34VxbeCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788315; c=relaxed/simple;
	bh=2I/xHmupXzHalSqq6Seeo0I9rrJSEn4BYl/KS2Yfy2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pafbPx6/yuKtxS/JpCGTT0F2dOouvKoWTzgc052SJBx0BKwvbTAk1xiaPYh6i4L+tTIkTGLhl0SyBufp0qqEMy2LmLM8W9FXr7wSc/h4YFzNpUPSV+IjFR7Jp2hxHoT/8LI+gdvZqnykdWD+CUSvBHFV3XrkAHSoyND33eKnbw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wr0V7oL2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbfL2L1Z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICrsbJ4026980
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fj+s04btC0/OVbnaKb9M6wCHPUMEjrN7D2ylxGzfSA8=; b=Wr0V7oL2jMofSeir
	lMiEczb7ynRxZH9QnR21DSaVFoa/oBM1ztUp5kzDWWBGJ2ZCs72tCRJV1ykPZNUB
	f10rb0uSG2PN3PDVbb5thU3hoqlc0IkyCSu72ygnOl0o6u5ZSkA/rAbI8OLgees5
	RDoQE6QNssjWa2dJqpuZX4zO0eLKENGjDuqy9ncRi/d8ioEPmKPDDk8lo96VJgSo
	za73tKz0GPQEeiKvSJyZLFaFEKUOzt0teMytKpNbgKZXgvfowHyd60rkjsqEl9O5
	KI3gGs1yRjrjgWSix6CHjMQGQjPU+Hhi9CMdQmr2gW4UcQzdBnXLkSBX/TBnLVwm
	nHxGUw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk3fsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:11:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c4271166f3so58558137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781788311; x=1782393111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fj+s04btC0/OVbnaKb9M6wCHPUMEjrN7D2ylxGzfSA8=;
        b=cbfL2L1ZCtPbVewPMGQBfp7BW7tcwxuMd1LDo+sCJiSz3/rj0QZuivMvDQKURXwzJt
         VAMGxlBlTcxnkrJeOSV4tt3R4F+h/KhTwRlLpvdGIvTobN4p5tKWY6OKpEUb6KvZIJlp
         MbX2BIouqEuG3ce6RtoFf+NpUOU6moDIJ0+9wXaPgmpUFVDzafUxModNFaBHU4LOT4V3
         RKb0lCXL5i+6kYcGNvY7c6JacXDxdM6BsEm+W9pxDtsvuTs2Bu5wHfbvorfzfzl5BHuk
         dRZEg820vDQFBWe2QYSeA+aKqG0Yy2BZO058fNMfjqUpQKKFsHYiYbTwJXwMDIZrXfIn
         rBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788311; x=1782393111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fj+s04btC0/OVbnaKb9M6wCHPUMEjrN7D2ylxGzfSA8=;
        b=Bh2ICAhjv2xCNTShD0N8sBxPDkeIifx/29B8mJp+UTNx2ZZqyh/IHa/zYwI/08U6SD
         NYwR4/p/I51uWvtPfarO5P2VPhUS+RY5lbbuO+Pdp67sMJ/XsHW0m2wF65saRHjOCPBK
         BSM5a4XHcRdh/Yikh0KFXHY2qxQ7KE75UX7ymjEL+BW+yohv6j3iaBJ1OcKkLsCEfxI4
         dd36ICPdzNa8d0chpcERZKw2gid7ClNC/vuX97ZDXeL6jZSgEXgiSzAdpZ2UYcQ2RoZ8
         pacnjPCVlhQtRIcJDu9hxRsyMJRzAKxeentbAMa8SbIeSZ4BnF2xTRYv7bD0Jpr2xbg2
         44sQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mqMvQbz6U5eZ84yFC8Yn0pKioL6u4K5SKGbzLaQXSesAvqJH83CrCZ+LYjVuSWoGuBxSUlCdtOWS1J25q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ALzOJRakaym9sGQQMZUP6MFNWv5oNlJqSYCA+RaMEsF9e2HR
	34JFeiHYVDLASJwkTYo7JKN9cWSxyGeGYkJBPjZGDAMWFeew1q4Qh430t+cVgG/aw8Pu54kQ1lv
	3mA3UF3M1ihHy4nnv9b0Ong4F8zf+5sjI523CKI47JizRSulq3jkCycRNhAvffjhuu7C+
X-Gm-Gg: AfdE7clPBrsU2dHCMBKN9wtQNgUUxDz2efEujljPVz/gWCVCemKTbEaW/wN8yOWDMdc
	1g1pBEm8KOR2OnT78G6LI4tFB8OVq6o3hNo0EI00agwprSWBh+4IM9rcO2QkyIQP2vZDIkdXUmK
	GRYzs2pqgLM7rIpbOr6PwJTtxWGtTlePxLt8kwrha08uE66ivgOkXuD2S0PZLTpDCdKQd07g5rZ
	TKmBJqvBDJt2rAxGDotzseBm2uxDNkxVDPhqYAAeeK43IDOfBcU/IRy/ktihvTuu+caPurbdmPT
	+F5T70eGte1jwW4IvpUxU8XRn6FpWvqKZrgd1vp/4tTEtmjqFs56xkCnWLHfHqUh1cCsmAKKAGI
	xJQhb7W/JtXfZP61Y46QrWqPNPhMxkH9ED24=
X-Received: by 2002:a05:6102:5808:b0:674:d57b:fcb4 with SMTP id ada2fe7eead31-727d6b15affmr706643137.4.1781788310625;
        Thu, 18 Jun 2026 06:11:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5808:b0:674:d57b:fcb4 with SMTP id ada2fe7eead31-727d6b15affmr706632137.4.1781788310179;
        Thu, 18 Jun 2026 06:11:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5223309sm950480866b.28.2026.06.18.06.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:11:48 -0700 (PDT)
Message-ID: <62cd69ee-614b-41bf-9d4e-da83df66eeac@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:11:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mmc: sdhci-msm: Set ice clk rate
To: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        abhinaba.rakshit@oss.qualcomm.com
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
References: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
 <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
 <18af0dcb-8cf1-4565-a90d-58bf1e66811f@intel.com>
 <a03e129c-6719-4cae-bffd-563bf1dfc335@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a03e129c-6719-4cae-bffd-563bf1dfc335@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IrRmTQJ5ci032OM4JvfCyKtCwsB90KL2
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33ee97 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nSvIXaLiVGUEEiUzc_0A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IrRmTQJ5ci032OM4JvfCyKtCwsB90KL2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMiBTYWx0ZWRfX7SnOs2UKpthc
 EcoGdxOw6zpNLIcG4RJ6eytq4G0pm2LQtOO/PwzZAHDeEk2kQHx1X9gBb6KBI5d3jX4I3bqov9x
 48+/KpM85Z+NA0sPeiMDBZyqMhCM4Ug=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMiBTYWx0ZWRfX0uuhTGB9yigL
 fHAa5vMspXM5ECHFdJ6PFHbGCML+SuJ4qqEJ25rm6puLGQaHx/RoZMN4KsOkh8LEcTmBtsqHWBQ
 J+jPgQSBYCv8Afmwmad/jTQSd8OHR0liKVLNHo95jleLbPty6bkyMJxSwcTARsQXPT/XMD2sKj1
 ATaqXXfaaeWC8RWVosv3AFOZ8Y+rorXs2A0vY4Yod77S5Ju03iQCQnbRREbEhXcC5y0DeLn1+na
 TSRzZE/WnvBmAKDfw4hiMf+k7wbiRa2lZWNprlzsFsxlRonz49VWSwiz979cSrvYKlbDRX62XQp
 aoImueU3d7/+bHJdDoR+iY3n+emlPqrb9fi660rrZXg7bwLG1TaXW89XKCa5+PKSfan9YzuxgD6
 KJm1qaHrxx1/oANp3XIUlfGQWRfEo7ZststvvpEgoCyFSVzHWwbJXDZNMHRXnowfPfSW//59Qfd
 rqs7CP5Ls1cfWg0ateg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113778-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ram.gupta@oss.qualcomm.com,m:adrian.hunter@intel.com,m:ulf.hansson@linaro.org,m:abhinaba.rakshit@oss.qualcomm.com,m:linux-mmc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pradeep.pragallapati@oss.qualcomm.com,m:manivannan.sadhasivam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6368B6A05FF

On 6/3/26 9:03 AM, Ram Prakash Gupta wrote:
> 
> 
> On 6/1/2026 1:00 PM, Adrian Hunter wrote:
>> On 29/05/2026 11:10, Ram Prakash Gupta wrote:
>>> Set ice clk rate from sdhci msm platform driver, needed for
>>> target which are having legacy ice support, and need sdhci msm
>>> platform driver to set rate.
>>
>> Please expand upon what "legacy" means here?
>>
> 
> for devices where ice node is not created as separate device node those
> are referred here as legacy, separate device node for ice starts with
> below change: https://lore.kernel.org/all/20230407105029.2274111-1-abel.vesa@linaro.org/
> 
> also I will update legacy that ice nodes which are created withing mmc dt
> node, so that ambiguity about legacy is clear.
> 
>> For CQ case, qcom_ice_create() prefers "ice_core_clk" before
>> "ice".  How does that relate to this?  Please clarify that in the
>> commit message also.
>>
> 
> "ice" is the naming convention used for emmc ice core clk in dt and
> "ice_core_clk" is the naming convention for ufs ice core clk. In the
> function you referred, since ice driver is common for both storage media,
> it tries to parse both the clock.
> 
> Here we are handling "ice" as this is needed for emmc only. I will add
> the same in commit message.
> 
>>>
>>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>> ---
>>>  drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>> index b4131b12df56..c6a073718aa4 100644
>>> --- a/drivers/mmc/host/sdhci-msm.c
>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>> @@ -286,6 +286,7 @@ struct sdhci_msm_host {
>>>  	/* core, iface, cal and sleep clocks */
>>>  	struct clk_bulk_data bulk_clks[4];
>>>  #ifdef CONFIG_MMC_CRYPTO
>>> +	struct clk *ice_clk;	/* ICE clock */
>>
>> Why keep ice_clk?
>>
> 
> here we need this ice_clk because rate set is required only when ice clk
> is added with emmc node in dt, and in case we try to use the clk entry of
> qcom_ice structure it will set the rate for new ice node as well which is
> separate.
> 
> but also we can avoid this, since this one time operation, and we can reuse
> local variable clk inside sdhci_msm_probe, so it wont be needed. I will remove
> this in next patchset.
> 
>>>  	struct qcom_ice *ice;
>>>  #endif
>>>  	unsigned long clk_rate;
>>> @@ -2708,6 +2709,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>>  			return ret;
>>>  	}
>>>  
>>> +#ifdef CONFIG_MMC_CRYPTO
>>> +	/* Setup ICE clock */
>>> +	msm_host->ice_clk = devm_clk_get(&pdev->dev, "ice");
>>> +	if (!IS_ERR(msm_host->ice_clk)) {
>>
>> Does not attempt to deal with -EPROBE_DEFER, although bus_clk above
>> doesn't either.
>>
> 
> here need is just to set the rate, rest of the enablement part would be 
> taken care in ice driver, hence we can avoid this handling here.
> 
>>> +		/* Vote for max. clk rate for max. performance */
>>> +		ret = clk_set_rate(msm_host->ice_clk, INT_MAX);

This will cause crashes or at least brownouts because it carries no
votes for the parent power domains (CX etc.). DT should be updated
instead, this is a dead path

Konrad

