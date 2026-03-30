Return-Path: <linux-arm-msm+bounces-100782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHaMDKdgymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:38:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E02235A63A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AD71300D57F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FBA3B27F8;
	Mon, 30 Mar 2026 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZMVkpCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kgp2FGNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837037E30A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870370; cv=none; b=ojbAsxWE+WKuFJOue4+tYsXLA+RMG8/KW7QIFL33PH8zEmiswvq8us/OZsIgLMo6vXknTuf+MBhP4LsriUkQgXcAKY/nMP2Gp/SECwbuRsHgnFg5DzvyyL860+T3LbcZrCGBww6D4GCMyIiaQ1QI51jdapTJQ57/UJgoow8+uLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870370; c=relaxed/simple;
	bh=fel9mSHAsxUUeAdUWjqyzp2z27WRxSqxKPi2q/rb844=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BuAWVbTKbqtAidhaToTD/HoDaLHXmshkiFlQ4Z5KiRYZci1GrPgXi/18EP0Adsw0r8SBHK1kpeIaYZyDlnhP0phjNy6yjBgvpUAkyTz/Co/CzPb9Vm40XaJ1y/PuZGHmezDMXmgkOJzmI98QlH4hyhombR6xq2P0KRK/9fFfm/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZMVkpCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kgp2FGNG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9n99x3721889
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVYNpilIftjXfqm8NGF87/3nEPjp9heJOVRVsPx0j7c=; b=jZMVkpCnWWiyCRha
	xbRzvFuv/ilFPlRd5QcmwcTlfe0DNibv+Ve9fcZ1YDf87NdyxrnDdKrHwzprFWzd
	Y5yoYx09b+4CksJJhbvVjCBwPN9UajoNbMC96ZhUiH/dkW+bGTFyzg11ZMC9Gd6D
	weHgdkiuefv4zhSStplBt8KlfsWHDVPrLrC4Da/5CdVrltXBnutgbqBsGKdT8uSn
	E3Q6KiznC7M5735wB2+xsGhlTZzzRQxzC33D6Q5m7cCeFeeJibNygkh8WgZ4C/fd
	7ycLPueLAB5dZ3HofL36JBWClx1hpx5O8ibH+yQaV7gvEjUxofzh+o+AULx5wo67
	UzZl4Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmrbkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:32:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so3481408eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774870367; x=1775475167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVYNpilIftjXfqm8NGF87/3nEPjp9heJOVRVsPx0j7c=;
        b=Kgp2FGNGHqCzuL7pGXySpv8oFjZ/XxOy6TO23Dv6kGZZByiqFfrutlEUw5eXWDMame
         4wDr4pNm251Paj8mlEsG5B+YkscdRvhwFfD7v5TDprjtJ3TV4NRW/i/PYsChSVgIJRqx
         HH/HDe+6Eaqoao5JM8K3vTNw1B+8BH9i7L4BxF9gXKHKBP534wDgDZo2o4Eys8v4T8K6
         77OSN8mEOBaratpoFl06x9ahNPzxCbO9u40ANGeYyMCwkNqMWopDfQp0VgdztFi4SUp0
         PvkRG2BpkHoSi2T9IIkUq/37DLOPAoa86JUNy8lXQx1qTsiiuDtu+7G5BK41EE2pBQzK
         BtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870367; x=1775475167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVYNpilIftjXfqm8NGF87/3nEPjp9heJOVRVsPx0j7c=;
        b=gyTEcTZLkpARbL0ljsR0tcjY1htyVpz+qxYE5/siOBr3ZM4i2l/Y5sP+SQ+tX+NerJ
         V2hc6buOUjJr0b6Q0Os7GiaTZRVMKjD3USwpVSTTSErADiptnnnbk2ToxPl5/vd80KHe
         iBDsEap4/0nT2gs9cjAYCtml2rf+jsXGlVAatD+6FCkGNczR2OGuY34WoKX2XLkGhO5A
         7R8N8EtGO4wq3E6lNwIuP2b56wm6IpofMmv1YZUt8Ju3yv3Zkuth585L8ZGPfNt2MDj2
         6/rbpOxJn1zvWExiFMUQavD9Qp6mzgLh3hrqUQHLEmnfgujtpf7RRrFqWn+obqc56myB
         T9Hg==
X-Forwarded-Encrypted: i=1; AJvYcCW5217Mh2jxpQVxM79KHk0A70ECpbO8A4HKKOd0q6l62PgTsd1ZteqTk1knh0XCXGFaoNNdQPIbFeYPyr5e@vger.kernel.org
X-Gm-Message-State: AOJu0YwhvK9/ZYMs6Kv4lraOJiFARRfx6vP5c3SHmwrthwr4su+ZFYm9
	sVV3kQAejItCTQyPdrIyJu3vT/bFOnu+oIm58xFFIh4uuJDdHZ8SWhapzvILLZhL/VdBwkB34RJ
	AOmtrMTKIRClJS2hB479srELf0SnKMu4RhxYgCBCs5GoSHz+f2U4DsG9ZNvCQFcp3+629
X-Gm-Gg: ATEYQzyxit6y42kga8bHHOAvgUxMnXdx8AxCoBv6UjLq1fPRXVoAtv3zhABYsHGYtfH
	amo2hafi41kXHOTG7/pJh4SkF9QEEPQFEW/yHJPf2TK1+2lInmolrZNR+wZgTekRhvFA/0RKAIy
	U3DxMgoVLWTFiE4HFNN6m8n8rCmDkbRr1sViArdLRPyfPvwnW2xXwjRfwo6VgnjV5P+kRCs5rrJ
	9KEZeg3r86haKR4mA57vRjIljQH6mK/KljaHvNY11D80MMQ85O3RjNxhMbPqfbcPT8Tk575r0ce
	kczudKP2eCZ1HxOb3G9H/or3Nt754n7jQ7qC55oW6xrKzKW3y3o/GpaIOrEH3AZEjn2AGdx5RKP
	yGmjZ6nDPGudz1b/zt6h9MKnzbXMLWZnKnHyFj4TekInSDJKh1JD6MSbFaVUyCygc3Lvc9t3Kxs
	ZVeyg=
X-Received: by 2002:a05:7301:100c:b0:2c1:558c:16f7 with SMTP id 5a478bee46e88-2c185c9c5a8mr6082240eec.6.1774870366884;
        Mon, 30 Mar 2026 04:32:46 -0700 (PDT)
X-Received: by 2002:a05:7301:100c:b0:2c1:558c:16f7 with SMTP id 5a478bee46e88-2c185c9c5a8mr6082214eec.6.1774870366204;
        Mon, 30 Mar 2026 04:32:46 -0700 (PDT)
Received: from [10.110.38.145] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c4aac86esm6776668eec.12.2026.03.30.04.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:32:43 -0700 (PDT)
Message-ID: <99d6795e-1cea-4e7f-b8b6-97f55af55d8d@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 19:32:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
 <ltlmp5ytl2f7no7aqq7sl54pwd4f53fuema23xnuwu5uthhbg3@7wamwvv22nle>
 <c71ea478-ed93-4f10-aba2-023180c2ed42@oss.qualcomm.com>
 <ex5zvncmnt5pmb5j2utolgbw3yewj4x4e6nu7sdrgzm7ubasmi@2jdubbxuckwd>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ex5zvncmnt5pmb5j2utolgbw3yewj4x4e6nu7sdrgzm7ubasmi@2jdubbxuckwd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z7hWBkziTU01TwaaK-1x6kXZ4DApjq7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MCBTYWx0ZWRfXzkafTlEKZoJo
 cNSikPiRErVyPx9blZBfGcvUJFyDGLVjaolWLHHMpvmiJ57eYC00KTnt0rWbEYCPgoufiXzpmPu
 klMzuFoHvpxKqPexGxo0kNVsNDrf7KJk7wp4IUW4HiCUmZK5W8/z9WEmV/66Kh+/QRbeZMUtoyH
 77yqXAJY7WEl2p12eVmHxZfQlJXYi5tjHzCdPgKLGXeiQyBby2H6i+i1qsukcanLAM7KBRKSaBO
 s1hDERlD8aMVhYKBgFUW3N426UGsMtbwr14GHz0IS/oUaFjL5KPf4up/1wBt9zzY3kqxeFxEecg
 vYno2v9agcrf9GOB/sWiaCWGF6fr/wedzV6iZohR78gh5U0CDuYoS9auYSUW6FBhPDcYERrwQDV
 PLS7s2g4EoR84QyPWqTHIEmScFe5X6AhAiWztzowceKY3m2waL4M1+uVCUqbqobDWqMT9OESmvU
 4NIQm0gDua1rcu9OQ+g==
X-Proofpoint-ORIG-GUID: Z7hWBkziTU01TwaaK-1x6kXZ4DApjq7U
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca5f5f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=zP8nz7a8HkQHIvqbjmkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100782-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E02235A63A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 6:35 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 05:57:13PM +0800, Yongxing Mou wrote:
>>
>>
>> On 8/26/2025 1:42 AM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Introduce the `mst_streams` field in each DP controller descriptor to
>>>> specify the number of supported MST streams. Most platforms support 2 or
>>>> 4 MST streams, while platforms without MST support default to a single
>>>> stream (`DEFAULT_STREAM_COUNT = 1`).
>>>>
>>>> This change also accounts for platforms with asymmetric stream support,
>>>> e.g., DP0 supporting 4 streams and DP1 supporting 2.
>>>
>>> How?
>>>
>> Each DP controller have it own msm_dp_desc ...
> 
> Why do you need to mention it?
> 
Sorry, I may have misunderstood your “How?”. Could you please clarify 
what aspect you are referring to (commit message wording vs. the actual 
implementation)?
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>    2 files changed, 22 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
>>>>    MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
>>>>    #define HPD_STRING_SIZE 30
>>>> +#define DEFAULT_STREAM_COUNT 1
>>>>    enum {
>>>>    	ISR_DISCONNECTED,
>>>> @@ -52,6 +53,7 @@ struct msm_dp_display_private {
>>>>    	bool core_initialized;
>>>>    	bool phy_initialized;
>>>>    	bool audio_supported;
>>>> +	bool mst_supported;
>>>
>>> Why do we need the separate boot field here? Isn't it enough to check the max_stream?
>>>
>> If remove mst_supported, condition "mst_streams > 1" will appear in multiple
>> places.
> 
> And so what? If you want, extract the function, but don't add
> duplicating data.
> 
Got it. will remove this "mst_supported".
>>>>    	struct drm_device *drm_dev;
> 


