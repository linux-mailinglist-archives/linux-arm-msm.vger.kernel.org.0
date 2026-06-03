Return-Path: <linux-arm-msm+bounces-110905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WbkdDjTVH2qeqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 09:18:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3468E6351BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 09:18:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KDNFW9Ut;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hwY7HLml;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110905-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110905-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4A25314B271
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 07:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628D33FB7F3;
	Wed,  3 Jun 2026 07:03:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9A3F6614
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 07:03:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470208; cv=none; b=FMTAzx+QaO6QnOmHKm8xnfRBVg7APr5YP4HIs7O2qoWaJPmRoAse7gVrCkdKATzfjeGPGL/6RZ5s/x9BBqLnUpPMM5DMGWx6788WBhMGnnkeoopqOqBb+kjFCkme1lCPQjUCCNk+tfZQ1qQSpQlZH6avsmkkGZZxDLbTzg/2kAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470208; c=relaxed/simple;
	bh=+Bdyb8NLUTZehHkS/DRDaP+HG2rm7RhQMH8vfW8lELM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XWf1fVf9OEAki1g05PZVC+TdAbXUyXlr4vInycOCjdGhl3eq11l51+vUFc59Lif7cDeG/xzxHfaUvaMh9GfbXiplOmo+k22zXPv2IqGKkczkRF0dkzbCKozvwd3ta2piElkWg2NiJQcXEi2C6hHh6jN7qfghfDfG4KcNUD4WPbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDNFW9Ut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwY7HLml; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RYa0874192
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 07:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMLZeEzqO4xkJISu22ZsbDrmPK8krRqnPWp6pg5qz8g=; b=KDNFW9UtWVmjiyls
	xR0uZYOWAjfYhdLcE2loiDbT+8Jv8v8WTq/OvZShvHOkzZtFcLirVQenCvIwWAbE
	oA6x95oSAhe0fksPBRLrv/AbAcvPXFOsqxk4RuTg4kzTWW9P1MMdODcK4kpJJzFn
	tJ5GbH5+gWQi+JhHLWLUEAOJmNMVQ5+qDsrFkxONCs2TLbO8hz9pmqzAcP5Ci+kG
	9BFtMUBHttwjU2r89m0E7sNZCpF7kAorRL0vwVPLA1s2IXY4okRsWyg2T5hOnApd
	DINXy3h7GigdYgB6wJ5LL6C8jkLka5stsZRuQ1ogZcVvx63ffDTrf0UEL4Tdq36g
	SDcVTQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9j43d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:03:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2c129b3so1953972a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 00:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780470206; x=1781075006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMLZeEzqO4xkJISu22ZsbDrmPK8krRqnPWp6pg5qz8g=;
        b=hwY7HLmlaECQjvdJnDaZis1ZZTkoDESODwR2r8pd0KEjTASgioFjwK4/mLg18nrOly
         Vj5wBRF7IJaJge7HcVIyNwNF7Mdsu5NCpOkYXO7pd21enC8TH7K2Ivrt2IDm6DcvlImy
         bZ110dpJi7rDiTc46HpmHB1lzB0+X429aHfMuE1BnMWaZKYnco1abUiMruKk4L4nUGAR
         9xralDwp8NCtAzn1RXJa1xvdkhfmq1oPeTCXbYKb/h1KRUa5AsY8mgdT8V3QZvSyxMGm
         uvsbXjCDI5SgtSjk8DkMja4MrR4dfi9FnTRgjM7fkVl7B3Qs3APNJLfj722hq6yW/CNo
         fAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780470206; x=1781075006;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMLZeEzqO4xkJISu22ZsbDrmPK8krRqnPWp6pg5qz8g=;
        b=eaGHBY36KmHOklh2ADFqrvSIvNAht5Iu17HUzKSA7PmUatfATo1j2+e5fCRqHy0YAQ
         +i91iceXz6JGBsH4bbWYuAlwsK16jB5TIDp3T7HFKjN3YdCsWg/W9Z6loSgcZKEYR7s5
         r3PQnWkA+p4w6kFbYe08mObO4yjlaNuLOIgHFm4n7LONzIg4ms+mloQMnBM86barh06T
         a/VBLWUksLc9kqpwpGw/Npv1dqd2unpQrN6WIU/tRgKh+0DaVVyEq7lsYUlpUAxQaEUF
         FoIN4xsdI1zLI6VOA9qIwrOgL2CpNikS2Pg/z42g/RvrDGmauAbaI3EFh4yFVsgLkSy6
         z71Q==
X-Forwarded-Encrypted: i=1; AFNElJ9orfq24WuIZLhN4MWWWSZAX2emhKsSDL7FrzuYXDHgCeDHqQGA8j5954V5D5j9hgdQy12F0lnElNg+hyHM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz43S9I62CoaNCd3JAbi+3vpHVK+NtNG3LzRDN/fzd7nx/512FX
	2fDWtynqElsJoSQzv87/0H+EwatFmRP0M6hCj6DpcaC5ysD1in8um5zeqad4FBV/lnKCH7md6L6
	OodtaunHLuL8jlGZU88xaF16TghjhCArNfc5w00kNskQ2H9/rVnZEnWFy5duoQMLJbAE=
X-Gm-Gg: Acq92OGD1saLzW2c+YAG5ZWHpiIKn3qLrL/+HX6hLGYNC91lkwGHcISdFl27DkuNYkp
	Vcw8ZKMq28/mi73EE1ywlrqP46zVsAer3+U7Nc35Q79dd0csvaKctyrSJO6ei1HqYtQxfB1zw+z
	Y85N3qxHcugiz5BGB/PEsS2Sns1I3kjfF1p9Ng6sXb8RDX+82KQ1hj5d02u2jVquyIPFQ2H7Ii8
	sJ+Koqq+dbvlnktjdz8XRMMopKOHKE6+OX+RP4cOAq88cVMTWQ3Olu9k9RcpoXB57XwbAlsD60w
	rY4ANiRdbSVj9gXfmjw7mfHXhN7MBbMlt9h7KTD9hXZcCb2cn/Mci1y5Nkoa+15f+e/Ku1bKH4X
	o8QUsqXkAYbau8VzWL5Rs5J1EdzNhbIzs161RoPSFkIjPpNRm5l3xyG+M
X-Received: by 2002:a05:6a00:2351:b0:839:9053:9a16 with SMTP id d2e1a72fcca58-84284f936e9mr2207838b3a.47.1780470205618;
        Wed, 03 Jun 2026 00:03:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:2351:b0:839:9053:9a16 with SMTP id d2e1a72fcca58-84284f936e9mr2207789b3a.47.1780470204929;
        Wed, 03 Jun 2026 00:03:24 -0700 (PDT)
Received: from [10.217.216.18] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428706fa9asm1260427b3a.45.2026.06.03.00.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 00:03:24 -0700 (PDT)
Message-ID: <a03e129c-6719-4cae-bffd-563bf1dfc335@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:33:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/1] mmc: sdhci-msm: Set ice clk rate
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, konrad.dybcio@oss.qualcomm.com,
        abhinaba.rakshit@oss.qualcomm.com
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
References: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
 <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
 <18af0dcb-8cf1-4565-a90d-58bf1e66811f@intel.com>
Content-Language: en-US
In-Reply-To: <18af0dcb-8cf1-4565-a90d-58bf1e66811f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rYBdjblj6NMu3BPjL7hqiXwOwtgOC99I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA2NSBTYWx0ZWRfX3PG0o/U5vcNj
 xuicouT6tIo/kyhWputCrEzzwVhmYYc47d53FUXeFz6iKqrWeFbHDvGgdauCL8SXSEVeVsXWP5h
 jBjNVT2HnmpsynEAxwe1oComoOrPaCHF5ZsBDdhgbevYWhFwPyi5Yh123VRaoeRpHLuLkE9X5Ct
 bf5looyfQtGfClfhl+xg9gccxHTYwUWgxXJ17/araS7t1CXcOrAyEEt2mBYc4g7mgs4Hwlz5UgI
 hFFXMkMMadHV7qoeHhWN2Zl0OnyVkp6UfPJBfVMfUPoRAK2IXe3dcpoSh8GKtkzs+4eNPvKqurq
 lLeEEx9zxEHkEsRD+0dvN9m0qfYWKLdXXeWfHOEs9F3zkzujJmjbZeZn0kinqKuOs+ouQnpxiIM
 9qHdVikWkEq0oCJ1HRO1AhA04lwBKKeRB5K/vrAMZ7fXsbjFzIn7ELl/Y9Zw7LO7KhZWyFFAtpO
 u3r4fWmfayFtnvxWFVA==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a1fd1be cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6wBK2Req9ijoumtyTN8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rYBdjblj6NMu3BPjL7hqiXwOwtgOC99I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110905-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ram.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:adrian.hunter@intel.com,m:ulf.hansson@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:abhinaba.rakshit@oss.qualcomm.com,m:linux-mmc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pradeep.pragallapati@oss.qualcomm.com,m:manivannan.sadhasivam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ram.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3468E6351BA



On 6/1/2026 1:00 PM, Adrian Hunter wrote:
> On 29/05/2026 11:10, Ram Prakash Gupta wrote:
>> Set ice clk rate from sdhci msm platform driver, needed for
>> target which are having legacy ice support, and need sdhci msm
>> platform driver to set rate.
> 
> Please expand upon what "legacy" means here?
> 

for devices where ice node is not created as separate device node those
are referred here as legacy, separate device node for ice starts with
below change: https://lore.kernel.org/all/20230407105029.2274111-1-abel.vesa@linaro.org/

also I will update legacy that ice nodes which are created withing mmc dt
node, so that ambiguity about legacy is clear.

> For CQ case, qcom_ice_create() prefers "ice_core_clk" before
> "ice".  How does that relate to this?  Please clarify that in the
> commit message also.
> 

"ice" is the naming convention used for emmc ice core clk in dt and
"ice_core_clk" is the naming convention for ufs ice core clk. In the
function you referred, since ice driver is common for both storage media,
it tries to parse both the clock.

Here we are handling "ice" as this is needed for emmc only. I will add
the same in commit message.

>>
>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index b4131b12df56..c6a073718aa4 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -286,6 +286,7 @@ struct sdhci_msm_host {
>>  	/* core, iface, cal and sleep clocks */
>>  	struct clk_bulk_data bulk_clks[4];
>>  #ifdef CONFIG_MMC_CRYPTO
>> +	struct clk *ice_clk;	/* ICE clock */
> 
> Why keep ice_clk?
> 

here we need this ice_clk because rate set is required only when ice clk
is added with emmc node in dt, and in case we try to use the clk entry of
qcom_ice structure it will set the rate for new ice node as well which is
separate.

but also we can avoid this, since this one time operation, and we can reuse
local variable clk inside sdhci_msm_probe, so it wont be needed. I will remove
this in next patchset.

>>  	struct qcom_ice *ice;
>>  #endif
>>  	unsigned long clk_rate;
>> @@ -2708,6 +2709,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>  			return ret;
>>  	}
>>  
>> +#ifdef CONFIG_MMC_CRYPTO
>> +	/* Setup ICE clock */
>> +	msm_host->ice_clk = devm_clk_get(&pdev->dev, "ice");
>> +	if (!IS_ERR(msm_host->ice_clk)) {
> 
> Does not attempt to deal with -EPROBE_DEFER, although bus_clk above
> doesn't either.
> 

here need is just to set the rate, rest of the enablement part would be 
taken care in ice driver, hence we can avoid this handling here.

>> +		/* Vote for max. clk rate for max. performance */
>> +		ret = clk_set_rate(msm_host->ice_clk, INT_MAX);
>> +		if (ret)
>> +			dev_err(&pdev->dev, "ice clk set rate failed (%d)\n", ret);
>> +	}
>> +#endif
> 
> Could put this in a helper+stub function in the "Inline Crypto Engine
> (ICE) support" section, to save having #ifdef CONFIG_MMC_CRYPTO here
> 

sure, will take care of this in next patchset.

>> +
>>  	/* Setup main peripheral bus clock */
>>  	clk = devm_clk_get(&pdev->dev, "iface");
>>  	if (IS_ERR(clk)) {
> 


