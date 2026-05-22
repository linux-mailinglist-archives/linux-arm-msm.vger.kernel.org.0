Return-Path: <linux-arm-msm+bounces-109218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D7xLeQkEGoYUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:41:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA7E5B15F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9EEC300CC25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B99D3BFE2F;
	Fri, 22 May 2026 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqNOn+Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTNRoDb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236913BBA01
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442907; cv=none; b=ERJcimSp1AiDaYbkUZHW7OtK3x0LCXfa2pJs847DSP2aT4Cq1rdkt5Q4bYiX6vuleDKSkidxh0ZFzRMam0AamqlRbuk8bsa4fK1OQYVfF94csWeFHlsv9mFICLIYqgDoSYQUqbCtXsYpxjkIy3g+Ob9GkuUGt1wrLNvXRJkJdt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442907; c=relaxed/simple;
	bh=N1DpwsN8XjPhZiy/REfYe3Txz5NfZfhGG9xVmdZ8NQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVKhinGHFXE6ZWbdKnn2RjYvUNJp254xR2/8lhIvblwGBrdob26ZRWtgMyiswPTJBJe4U+lQeHzC6qkGf0443+buoBtxIyc6yiVony0lLGwQwyP2MZwR04k72/afohMxKU1juY7DGFFcq8CHK0wGzez1aYOooaoTmlMEoQhS8Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqNOn+Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTNRoDb+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8cISS3532125
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDDtStgxWdmz+zI9FXNsfPajHB/12rCB2dYam0qgxvg=; b=fqNOn+CmNoDa+x2M
	I53BbEVkXSowPjPeKLza+XS1rrR7A8Y0xop0aACjwzh3hWAd0qsh2YwRhlygKkuA
	E8qSFKxtOSCtNsKyvVRPC9CUmf2HCDlGMbEAYXAiOD6EUDznPUPP1M/LAksPoc5q
	tXbq1D5xEnXBmaiyTB5erNc5QBqx7oF7ilbL7CxOcg++qNpVTnrGYJl3AZh7QnOp
	JPPU2v75WJOzAIWF8ljFhKeEyMnS+sunR55hPxpMxGdjoaE9Be9lJhngRbhmXR8/
	o7D4w5PSxZemSL3iKQyLP18Mi1ev1CSHtJhUCNQJ1p49N1JURuSKCtJoOO1iEcft
	ubtEHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gveh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:41:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516c9ec73dcso4033651cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442904; x=1780047704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDDtStgxWdmz+zI9FXNsfPajHB/12rCB2dYam0qgxvg=;
        b=YTNRoDb+ayQ91hwSKtXp9wKUAFXSAbHUY6iV+G9bemKJOo3LHqlduqGdakDWJ+BXKv
         MbhoYhZHHgUJaGFFYYrOFZ1c/TK9BHcYPp7j5Sv2QSh70t35nu3UP3CwX74SvEB5/ANT
         ITTzCPcYw9BxaQ1Vulakvv77dasmsmLTS2ugYM9SsAwh+RWzDb8Nij7nj37C5UEdPTDS
         F2taI/d4OrdNiiiIK2ZuNXmw1yawUtrdedhpdMxOUSs0AtaYOw5lUdQiffw+m5rdf/Cm
         RHbNj/kZ1wSVLap3XTqzP6iUOsylGQQiNRgQCPFMCZVG1WS+DcNdSa1eTZn72StpSx4k
         MkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442904; x=1780047704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDDtStgxWdmz+zI9FXNsfPajHB/12rCB2dYam0qgxvg=;
        b=l0GnjNy3WziGWJqNdxDfXP6w1wLPfqZ4IIDzDu2QJMYKclXEZDUAApAT+SwPr/xvXY
         BcRjaaIpLCsdFCMs72uuiXyUu3o/qbbSD9iabOpqOZTpClmOwGUY+QTwFrANtkSeghEe
         Rjr1wISVI43xbM5BcbTPj1Ik9QSTk1VisNuGUqx5o8x2727Wk8vFXAj+ONG/brbTcfFM
         tW++MgW5PJRcZsStaY2KxvTfSVR4P4dYVx8JjFynd2E1SGk9bfiaDVHTj3qEzyzBIxCb
         HtAl3SfQu+eZd9c+Wp6/lO9YFBUb4uqZn3iNB9npcrKU0BAAiDF3db2qUiJMJKPepJ8c
         BZaA==
X-Forwarded-Encrypted: i=1; AFNElJ8+Hn+p0qLFFBSX6wsNkcHH5wLaxK4xY6UeShc/07loo+vjXHZwE3lRyUdshe8HknNNp10rgSWFWVBqAxcA@vger.kernel.org
X-Gm-Message-State: AOJu0YxeuYUXslk7UKRKXVUGDwtEBtcCoTn32PJMbb9zvZcovBgMLlZb
	g2pihY3Z2Zes6S9QapLmkcd5Sjx7Zhx1g4leRhjKE0Kz6MiKU44nydSkXCtfEk5GvZGkfO8q92g
	+X6GFuW//j0DGwRvKnLi2wJ+w8ckCFbFBP1eDGrB+4fY1bqxCDvJNGGX9B5gFiezSFl2q
X-Gm-Gg: Acq92OGZT0yo3RnGruu71e4CPITS+Wq9snGpFRlvYevUaEOEPcjpNGOFoTxGA5ZuK8D
	0YphQWpXzhZGAwSLKJSJxSdc+Jum9UybuOsb9Lo/Kr2IWDRPK6WIK1nPrOwW2P80ggOE3RDpSnh
	4oWA4yhfrYrUSld58eyP0xIXdGlz8jCfLjbLaZUr1FnOjHHIwQck7dNCsyBlCu3lTGuuNfOInVv
	a/JxcE2CWEvPaiQmx/qdnLHBwz4i0/St4wb/d9nV5UVoT+v2CwuVAbIh96dIY23AkC7gSJL5z7x
	uSO2dB0MX5Z/MaiI0rW3GcwljGMjq9ropoSx+JM5CAMBK9x3SPZpWjTr6wfnN9o+gHBXT4IRFvv
	EmBfPAxWwZ4D+Dl+9KNVismPuvwK/P9SBKPAUIRDa7MqFyQ==
X-Received: by 2002:a05:622a:a6cd:b0:50f:a53b:9cf with SMTP id d75a77b69052e-516d429c741mr22271291cf.1.1779442904118;
        Fri, 22 May 2026 02:41:44 -0700 (PDT)
X-Received: by 2002:a05:622a:a6cd:b0:50f:a53b:9cf with SMTP id d75a77b69052e-516d429c741mr22270971cf.1.1779442903741;
        Fri, 22 May 2026 02:41:43 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf1e20asm456782a12.15.2026.05.22.02.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:41:42 -0700 (PDT)
Message-ID: <9a999b51-8131-4032-82c3-72d7eccbd222@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
 <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
 <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a1024d9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=umUCZPTDblNGZq28zJcA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: dhEvnOaZRcWj_-m1P551gMui0t9T9eEo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NiBTYWx0ZWRfX7ZkmvV7UOeRc
 BLIO2btOCdWrQxBbYMGiVEckFNzfu3usbJMH7qyezke+Yx827WZUIuCyZqFXl3BXaaGnwRIPwFF
 rtj68g8W22uGOH0OPEgDGHNcQoNnSRNo5GQEqMgtgnRZUpgjrppHPQTOiYZeuW5nVB3SA9q4j+/
 Pvvd0ZbwXiFmDld+ZVEhKsbP2icMixZGXTiBadP+C4OpNMRZzKVHmKcXFxfFQN/UIezxfsL8ZKs
 vd9ahk1cpeH4XqJEfLA3C0ON787O16hX9NBcrnxll3Z0WezgmI4XAZi9WV9Jvz38ZrBYLj3woR8
 +19AtyhTMPwyyPnW0julaIiWygoRoRgccMJgBjYlQVWhVBprLfHHOOqw8QQB1960VAcG4FJzply
 2niFVHylvTi5cXzTskCmtYEp3p/ikjBOoW7Z5M3PJxyFbh7UMwt3iW6LwqV/eEHcoOxwyMo1DB7
 vj8rY/POXoej1sriFKw==
X-Proofpoint-GUID: dhEvnOaZRcWj_-m1P551gMui0t9T9eEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-109218-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DA7E5B15F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 11:39 AM, Konrad Dybcio wrote:
> On 5/20/26 9:38 PM, Akhil P Oommen wrote:
>> On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
>>> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>>>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>>>> the A8x family.
>>>>>
>>>>> This series is marked as RFC because it depends on a few other in review
>>>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>>>
>>>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>>>> review and has been applied.
>>>>>
>>>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>>>
>>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>>
>>>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>
>>>> For the rest of the patches that doesn't have my R-b tag in this series.
>>>
>>> Unfortunately patchwork doesn't capture tags from the responses to the
>>> cover letter. I'd kindly ask to spam the list with individual r-b's.
>>>
>>>
>>
>> There will be another rev to remove the RFC tag which will hopefully
>> have my R-b tag. ;)
> 
> Do we have a resolution on whether the proposed fuse values
> are OK for this platform?

Ref:

https://lore.kernel.org/all/oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me/

Konrad

