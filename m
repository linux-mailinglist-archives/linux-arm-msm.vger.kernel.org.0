Return-Path: <linux-arm-msm+bounces-109770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEgqDi13FWrHVAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:34:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C33D25D43B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35D293007BAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376063DD86B;
	Tue, 26 May 2026 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6DAze2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDlbefO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5523D9DDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791659; cv=none; b=Yq5pgBk8/rRKoXtuDkdPVmK7vXHNZH6YIq4SuuR9JUINqQ34Jc9WXMJ4yaMmt/dOg8F+Mazdq7ttogYgiGevn78AssTSogKS/EP9za5t4hTiH6OWPv9B65Uv6NVHLHvp4/V8i8XjE2HbqCS934gujMczL/7yw3zIVx7doo2Dfvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791659; c=relaxed/simple;
	bh=sFsRO0yDsb89oIT21S7eA8A6dy+u3vy3rLbnkAXXODM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVRwksp1ETr7mnMyCZM0fm4GHCAm3V9RTqjnBRyZ/u2PGzcfYbB3o+YGCU29edpSt3gCSE5kbAPfE9fu6F+fEv8fu/qq8TT8ItLoYT+OU8G+0oDAtZFcHx0FrkcAHcMvplLHtDP53afbn+gw38Hjc5MH+TLVt6gnId4tgQGRTXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6DAze2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDlbefO3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q9vahU004567
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6rrwvTxF7kpNlbgbAaNRd9qzBWBl+jhGHIIgmLXSLM=; b=h6DAze2G1t7voQ+I
	3q65s89rrWntoHB5fhr5aJ2BjUPY12d4DnktScZv7z9KFW40LAsfTK7obOjiIPfg
	tyhkXjZKWid28CNg8JkLL9l2lXEUtxIUnmP4NDJd2FTE6tU14bHjnknFWCWSInm7
	FeeaD56RHAkHo96hI+gPA0mLZWy6wME0CkZmh4duwRag4n25N03ypyquGwV0tntB
	2jqJnZMvU7sEhz8Rgq2QLpodBW3JnykLzO0y/NyfXlI516x+2BjtNxDQ7yyBrL2j
	vyeo8pBmLjf+2cU9+F1SE+w6BXv4gHUeV0DEae8Tj3jerLvaOoXwaEONXj0IsoPd
	dslUjA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm03151-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:34:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so36052655ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779791656; x=1780396456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M6rrwvTxF7kpNlbgbAaNRd9qzBWBl+jhGHIIgmLXSLM=;
        b=YDlbefO3S7I4V7GGJv1vKmEteW4zxTSe5+YkfeHLLehTc2nlDMGi5outd0HLvGoQMm
         J1w0il1vQFBgV8a4HB0MQGISf2mgqyfm853a4kc2H8uNzzKT0V2El+Xv2zL7r3ObcFya
         BsYzuQDdbPwKLyXL2SIS2D/hAwF2pTEref5ee77rSiX4csQ4tHncvmDNr6sCOJvYz6L2
         xYWxlzgbYm7N5xF9liKPEZvNgZafHfz1LkSjJt3+D+mYmW0bg4j3Q5/fS+Zc7z30twym
         u8ke42+BckiHBVhkhY/ObuiYHFICjY8xC7/aElfUMZRk6jEooNM1zpcc6sho3rZyJXOb
         pH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779791656; x=1780396456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6rrwvTxF7kpNlbgbAaNRd9qzBWBl+jhGHIIgmLXSLM=;
        b=A/d9SyWtR6bMcxG3WHoP2iFgq2jLlhSp9f8OZttZiXkGRKvZHZkqZvyK+m4T63pDxq
         VRVAfi7O744q0aXu2VIAz20WxQNkTWOuzdLoa060NsYl78lmg1HTbZ2VL6gCX91D2XLi
         prE0VpX7jxSty6KOZxhAcwmjrP8N3yb551k3axmouuNnI7GIcAbU0A8af3j8n30twc+W
         VnWo1KPYwhh3R1yINoJmpr4DTyrdBmEvHIiu6gOAyRol96qjc//syXIb9kfLYuDfcwFz
         8xUO47hfGTgItyEZnzmxBCh7j4i6qkCPIf+Hif3nNfCzKx5w6e32m+qCEG3IXp6+9TRP
         OTXw==
X-Forwarded-Encrypted: i=1; AFNElJ/l2MxucuZrVvDJZXwY1aHyBUilri0L0dXReATaGHTY4utRm07B9+EsLc8Xb6p9nrS7x8gSwULGv0YFIoXU@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBv4R9EnTLySKV8E/AInaMEI91zEDxYi9/d6/1sAIKAty9FSl
	lrpJDnDtZPlZ1o2JR6NnWVpm6F27BlImAvyiGTnG0tFw8BtGZAhEOI5ugF2HWIk/ZlWZ/UFmcLD
	43SMqkOuZimWxyiYqFjuLlI0jD+7FOF7EzoKt43oLXo00H3a287Cf/SC95R01A3AU5Vf4
X-Gm-Gg: Acq92OGTg0DfGhS6Vj8WlS5RQtAOVs5Tp6bDaY6ha6MKcbfFatPv8t07HnJKBF6fFvh
	UGGpaT4kO0wodb9m8keESyjN4U8hLkcLx045gR5pZ/WzAKiL8ahyDZXutF8l1LgcYumNHNecBEd
	ZziMSPrC0TGe+b0m0M4t4BZJPsTlHuW2jRArvMasMXmPr0CrkCX2w9eGX3UOzHR+b/5OyxJ1f/c
	ZTj1oJmVtbMvvASjtlFZaZGXYbRZHGoof1HfeSBldh4njMrImbT/EcgAdIFDQkDkaMPNHkYS+rh
	CxtlxKUvCfLKEcAJmO5po7utY7whlcVp/otZEr/5w0IYyMCPu88680M+HoepC3d5OvVZ72lV8O9
	GMnpNbfM4Mi/BtMiEZ2w+lIJ7dP8ih2IXwONf1wg3yRaeL8CQlAw=
X-Received: by 2002:a17:902:d489:b0:2ba:6ca2:bca with SMTP id d9443c01a7336-2beb0680e99mr203240835ad.26.1779791656209;
        Tue, 26 May 2026 03:34:16 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2ba:6ca2:bca with SMTP id d9443c01a7336-2beb0680e99mr203240575ad.26.1779791655684;
        Tue, 26 May 2026 03:34:15 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56e090fsm131331095ad.34.2026.05.26.03.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 03:34:15 -0700 (PDT)
Message-ID: <a5313752-17ef-4d00-9f61-7717e4f06982@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:02:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        rajeevny@qti.qualcomm.com
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <20260519-curly-courageous-sturgeon-2facfe@quoll>
 <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
 <yn7rwuguaqliovlyukcj2olxby7zerv57na3jf2pgbke5zgahk@aasd4ojwdy2u>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <yn7rwuguaqliovlyukcj2olxby7zerv57na3jf2pgbke5zgahk@aasd4ojwdy2u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a157728 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IV4c8OSHAAAA:8 a=QqSZzXjYCKH221ueLxIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Q6n48rkgcAvIKCAITAMI:22
X-Proofpoint-GUID: 1hvCzyHB_2RmyncGl2a26J9zKPW7-4mD
X-Proofpoint-ORIG-GUID: 1hvCzyHB_2RmyncGl2a26J9zKPW7-4mD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5MiBTYWx0ZWRfXygJOh3A0FZJj
 1OZ79HK7BBH/LUKGLWuMHTdNSA3dUvc27KfTT02FzQvotr2pZzGuxh6QE1Jy5GthdzIWCwZWjyS
 Rg48DhRTKGFZogc5AfuBcKYzar790Mm/+v9IpzUN/p8Mhev4QBWgajNyI02o5rQD6xhUiFub05a
 O6tkTEJcotHBP8NRWA33Q/g/BnVCzqtSQlIC4ZpWS1ZyHf97ccSKFWXnVTDvYyiHO8Mk2qLIn6s
 IIAv5A0jTN53wgEq38fZ9ntfs54e83xYGd3xQn2E6w2V16FYnFMRL3cqDFJ3RiP3phSu0ndWH8S
 YXDlfp1w8516rqLgE7Uk8bxDQj8Kfe1O7l4J3/h4vrbTL0iRyGVm4BjfwtcA2Yaz8y1MYRlLM+q
 j2JKeUwtqZYrO/vqkhtX+DjUttvVgcdEYsOLAwwWTagnalpmsq0vY1n8ifWTao+k9a9movIm5i6
 UBSOreYaELRBhrJD6Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-109770-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C33D25D43B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof , Dmitry

On 5/20/2026 6:56 PM, Dmitry Baryshkov wrote:
> On Wed, May 20, 2026 at 06:10:57PM +0530, Arpit Saini wrote:
>> Hi Krzysztof , Dmitry
>>
>> On 5/19/2026 4:02 PM, Krzysztof Kozlowski wrote:
>>> On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
>>>> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
>>>> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> 
> I can't find this panel on the DLC website. Do you have a pointer to the
> product page?
> 
https://v4.cecdn.yun300.cn/100001_2012175013/DLC0697AAL21MF-1.pdf
>>>>
>>>> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
>>>
>>> If panel requires it, so should the binding.
>>>
>> Ack, I will update.
>>> ...
>>>
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +    description: DSI virtual channel
>>>> +
>>>> +  reset-gpios: true
>>>> +
>>>> +  backlight-en-gpios:
>>>> +    description: Backlight enable GPIO (active high)
>>>
>>> What is the name of the pin in ili7807s device?
>>>
>> Display daughter card has WLED driver as well as LCD bias driver.
> 
> What is the display daughter card here? Is it a Qualcomm board or is it
> a part of the panel?
> 
> Also you wrote a lot of text, but you didn't really answer either of the
> quesitons. Is there a GPIO on the panel connector that enables the
> backlight? If not, this is some external supply on your (assumingly)
> daughter card. And it should be modelled accordingly.
> 
>>
>> The WLED driver's Enable is coming from WLED_P1_EN and PWM is coming from
>> LCD_CABC output of the panel.
>>
>> DISPLAY0_BACKLIGHT_ENABLE (GPIO 91) of ITP baseband card ==> WLED_P1_EN of
>> Display Daughter Card (DC)
>>
>> In the display daughter card of Shikra ITP platform, we are not using the
>> external PWM for WLED driver. But connected the CABC output of the panel to
>> the WLED driver. Backlight update is happening using MIPI DCS command which
>> is driving the CABC output (i.e., PWM for WLED).
>>
>> Because of above HW configuration, we need to enable the MIPI DCS brightness
>> update on this panel. The below command of dlc0697_init_sequence() is
>> enabling this.
>> mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
> 
> So, this should be then dependent on the presence of the backlight in
> the DT. Either it is a panel-internal one, or an external one.
> 
>>
>>
>> After checking this, I realized that this panel can be used without the DCS
>> backlight as well when it's using PWM based backlight control.
>>
>> I can add `has_dcs_backlight`  in panel_desc and set it true for dlc0697. I
>> will update bindings and add backlight as optional property.
> 
> Why? Use backlight property instead. It's already there. Anyway, you
> really, really need to describe the panel in the bidings. Not your
> daughter card.
> 
This `has_dcs_backlight` in panel_desc will serves both the purpose, as 
for our current platform constraint , we need to create our own backlight.
But this panel can be used without the DCS
backlight as well when it's using PWM based backlight control.

So in this case I need to implement the backlight as implemented in 
panel-novatek-nt36523.c, panel-himax-hx83121a.c.

with this implementation ,I will remove the backlight from the dt-bindings.

Please let me know,if I am missing something.

Thanks,
Arpit



