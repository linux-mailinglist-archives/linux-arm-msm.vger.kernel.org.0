Return-Path: <linux-arm-msm+bounces-114826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qOY3G+L7QWpxxwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:00:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C36D5F4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:00:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZHZXT2B2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ea/qU588";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114826-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114826-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF615301301D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DAB274FDC;
	Mon, 29 Jun 2026 05:00:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61DA274B5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:00:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709213; cv=none; b=j6+RZujcFtspXgphbHxZKx0mUrLrkWx1KjN9G0xi+R/dHLkIV/62eTOAovy/aWJItfqanSTOE6a2eF+LNUAHiCs0vIKqvhBhgEoqieAIWmfhQPh6thSWsu8Ov93xEjjiwKvRafxzaNeh+H3xO+dHZwAfruru4KFr/h9cc3JTOLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709213; c=relaxed/simple;
	bh=U6aiEFk28xe5SvO/yLkJnO8WbyNlnrJ0dXv5Hg7E+xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiGuDzxIoiTdc23d6+ygmqPRKRvTBiTDgdJgvjzeaZLMps+aHmnYiALlTo1tYRK2krJAR+KEHlvY9T0b7WcB0vwflSsqyworyMAfNysDWqZ1cwAiRneAfxlMgnPCBqgyrVxvdkJpu9tOOhv8wYTunn7+wvrsQcSKVXXdFkMaIQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHZXT2B2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea/qU588; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NwMZ1778405
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vz2AE3fe/xpGnAimt/15bVfH5RoWvbl0nmIK+xDjCNs=; b=ZHZXT2B2lSS4uFPl
	Y0RvDR1S3sNTUNML6basKc/X0EZDrG5KTqyr2cNNnR7OO2lthCqJN9eflVIx/jla
	PaV4zzyzONzwNZddfMPYl3D5bnX0Iw5vIJPbAuJIqHBxc/gwGX8myUAf8ASgBpTW
	vpQOIn6Vv58cCkXVlWNJqcGJPl+TVTmBaNh9ByF4W3rEL0RQKDfxuvTl+J6BDWAF
	wqaniy6GDCeDcD9P8JgIxDTp3BYeVLChb/YblL8fBGy3F0RtcWNW1K7zNEesorCq
	ktSju+5lNY1097WK9ZGswaIggyqd5j4AXSKBzm2MQtNuVVfczkYmIz5auj1w8hRx
	1d9cLw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8mjn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:00:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so13589960eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709211; x=1783314011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vz2AE3fe/xpGnAimt/15bVfH5RoWvbl0nmIK+xDjCNs=;
        b=Ea/qU588Vsqf/wAP0uvlldibT8LyjIQYCLQujgzUJzGNd1vFt7sgBqmUopm5Brmvpo
         sfGAs0Zx3rQ/+NDlEWDjjWy+zZlsKAr25ppvJSRf7w6Gu4E23Z6dw5ibKeOibOzE5cKg
         DvLtkqLnKvFqYcTWsX9xaqw0h+iv6OJ6IWDvSx/WSxA3gmbbY4cWIQ5WtY2A8ufRX/dc
         7bFNX+noI172bs5l/syI5D5YDksIFh5ajlVBdyOgdMb99B4xlY9eCtIay/vo3SdCLLAX
         xcDgZuyuNCEwbSdewRzmFq8MSBgJW1b14ZTPYPJA39vlQs80EkWtlDI1KeyHNUcqko5R
         JlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709211; x=1783314011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vz2AE3fe/xpGnAimt/15bVfH5RoWvbl0nmIK+xDjCNs=;
        b=TjtSWZuLnOjRx84FN60R3znBLcbP1Rq8Pl9vBg1WPEiH9PoiG/xD9kZSp500Ubrm8S
         7ffs+g+uPG3KFLFeJ5WAfDVrpvmepWYeC+Cx/jqU3nnWKTZGdIjpyBuhyF+8T4AETAW2
         /Cg647jGdspOCSH1OWdxwTi35xuEDPYU1AbmZ1jvTTH3wjWGArQbcRr8LtgX+ZLkOi8j
         cS9sgd9spv49he9K4fIG7sZDNP+DRLG8lBJoiBP53+Yz/2Xh+ua4nfoZoSkDnuxQUvtX
         /rNydIddt4WFotmuMfLOt529mP/WcDLNFd55xHmQ4G7k+sSYBhTWccqOR/5dZxX5fBYq
         9IRg==
X-Gm-Message-State: AOJu0YylC4piyZrmMUIc/Bts7Rx4JsrcKMdw3T0iAb/H93Sb0SkCZ8sm
	47r66g1C04FeTU8FjIWi/MghymjZ+nloup7H8atYlsI3XqIt9Io7Hc9x0vM95UlYIkAlNpfZ0DC
	PIaZV/MHVDgmK3pTakukmO/uicCroZvNstAnAFEUC2qznN1MjWjD77/UucK/952cRekpX
X-Gm-Gg: AfdE7clThWp3dwSkC2GOAGUP9hTgcxmg9h1U1XK/fyQQ+li2NiDbUfm/4o77DJf0zXJ
	bPbuTJ4olPfHgF1nQjqCJLylYyNv1I/VkWPJrt25t+PNCNLS8ZWsPlfeQki/nYoa0hZC+sMC6jJ
	PRlnlRFiJW0LzDWQkWnLSE8M4utQ0F3KCmQVbLoxvBfUXDzotpu6TGrvfczmvAJ84upvM37zWnD
	7tA6+/zLFA6T+DR6Nv6aBjg8DszMVu02U/xJI7VX/xWd1puTh7K+egZe+QjU3o+f+lbpdGpq5jg
	YjPc2CS5VfrLG4prKGETHR+R7+5UdiBmlSvw4mIuIG4iQame071bAS0/8P3xeXSQoZOUlELWHG3
	MMOwKWQ9+i3BCIKakRfwn0wNz1D++FoRnr4wp1xY39T8Dmph/vg==
X-Received: by 2002:a05:7300:8191:b0:30c:19fe:3c99 with SMTP id 5a478bee46e88-30c84db2febmr14993424eec.28.1782709210632;
        Sun, 28 Jun 2026 22:00:10 -0700 (PDT)
X-Received: by 2002:a05:7300:8191:b0:30c:19fe:3c99 with SMTP id 5a478bee46e88-30c84db2febmr14993381eec.28.1782709209892;
        Sun, 28 Jun 2026 22:00:09 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm54780046eec.7.2026.06.28.22.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:00:09 -0700 (PDT)
Message-ID: <b7ac2984-5d95-4d11-b633-68ae4b64862d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:30:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <0387ad24-4b34-4e1a-b6f9-44158417f308@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <0387ad24-4b34-4e1a-b6f9-44158417f308@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MCBTYWx0ZWRfX1Pot6r63672z
 cQsbObW7DOolcpQVjs/pZ5viJoGyBEN3vEG/WOO9PrKCd2OGWdAUObiLIx8n9RW/JupZSBaiV9i
 O2hCZd40dQEEgFCtC1bhgDuhyX+6xdo=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a41fbdb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KZhLYVIlkYrD4OtXSOMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ycxjCm0wadQ0QDWrf9uiXjqEVnJuwPZr
X-Proofpoint-ORIG-GUID: ycxjCm0wadQ0QDWrf9uiXjqEVnJuwPZr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MCBTYWx0ZWRfX1/vSPzNSgZzy
 PQx0E/AtqOq6nyLw2Xnz9GdUaeiG5sMeVC7wJ1cWEOBFIvt7xpvHjgJC/Fuooe1JBB0Ldrn+hKd
 n9i8Z3rWdxwqCu/Uy0fo6dOSNIFGBBTPdrR2lfuqGWDiIdp0aNXdLQ/qulT6UOLfkibA5rt5FEm
 +mlCChqFDmSBckEofZ67qhJTWIlqKaK00LFHzUWkISgTbW0xbCfAc2I5gqU6rWUDL4RJfONAhTR
 wy+5sYanCDwdjXWwUyLu0+WAVmrthLjSA+VTCYlr2zgvt2balbj60/kEPnwkkUXdupkhn+TdOfC
 p+2kRLVWryPSNPlyFV4WVya/IEgm0h27LHxlCJUG6+oe0KnoDyTR74h81yQ4hpSC/rekNn3tEx0
 65lQECmUyBz6ND7IqXDycvivC+sSvr6cMAD3MxmFYX3773v1wktoJmB8huryVImjGb43CJnN5OG
 CPKgabKzz6EdGmKUXOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114826-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD1C36D5F4A



On 6/9/2026 2:41 PM, Konrad Dybcio wrote:
> On 6/8/26 7:20 PM, Mohammad Rafi Shaik wrote:
>> Add shikra RX macro compatible data and hook it into the existing
>> LPASS codec v4.0 flow.
>>
>> Map codec v4.0 to the 2.5+ RX register handling paths, and enable the
>> FS counter bypass bit during MCLK enable when the platform requests
>> LPASS_MACRO_FLAG_BYPASS_FS_CONTROL.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -2043,6 +2045,11 @@ static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>>   					   CDC_RX_CLK_MCLK2_ENABLE);
>>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>>   					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
>> +
>> +			if (rx->bypass_fs_control)
>> +				regmap_update_bits(regmap,
>> +						   CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>> +						   0x80, 0x80);
> 
> regmap_set_bits()
> 

Ack, will fix it in the next revision.

Thanks,
Rafi.

> Konrad


