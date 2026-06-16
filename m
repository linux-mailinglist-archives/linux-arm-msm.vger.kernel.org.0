Return-Path: <linux-arm-msm+bounces-113359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HkDHHyYdMWpBbwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:53:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D768DBF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:53:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JLASb6/a";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XYZN6noH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113359-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113359-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE3B6304ADFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA0C425CC2;
	Tue, 16 Jun 2026 09:51:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D323423A79
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:51:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603518; cv=none; b=cwjbmvuvQCve/1L2gJrQ6xKYmzBSITMjMZuCcY008m/hVhViPWQOkhsZbCTkctdBiLja0WILFZtsBv2ZLLaJo5VNC3rRWb3eLNQSDNQv+Iiyl6bAF+BEojwO5OAyV+vmt2RpZLAftlAmjl8UD5rm2xXiccD1qyA40gYi4Si/DFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603518; c=relaxed/simple;
	bh=IWAW/fQBEPZiTaCdacTP7PqDqStxP/BFTF0KywhLwSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AE8TKTFuZY85MaW90rNhEhIsOK1g/x6zVmFYS13ZlG1SPZ6QU/8YxEa/FhbK6zbRY55juWsRQNq5Q6cdI4E+jypxvIWUVfkwyYG4kqUaWtQplYHqmtxakxo1yUrY5/eucl+XSrrJxTBxxtfc9vaVH5+JudyjkxthJ1xOJQI2BZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLASb6/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYZN6noH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65Hdn2849805
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sMOZTRu51g9pUPpWMnqPhEB0vPr07XkL6hULH16byek=; b=JLASb6/aL0EfAJIf
	BZD20bmA4208cHOjVVvPbO52FaL07bm2ihQ1TxZ/7kzzEYJMkBupZbIcrIb6WA2g
	QZzlbulVUOJOSVN3/LNkQ3YNzRtGX+s5V07pcX6h1QbQmUPewa/nTReetOqOYmQE
	b4FkcNv958bboc1V/EPIBnqNXSc9r6KQnn4R4/v+4F/D8SmhqCMFDTzRuIeWhDS6
	ruHpyPiQbhM3jce/Jus+H22ywzdpp+JbbL07F+G+88j/GkEOXo7CoCIwOeOGIfZS
	s7Et4KMid+YHNHrGxZnkqRJLeAAVBqjzw3WcN3Z84A9qlaeSae+vv6W6FWvXAQDA
	Rwg6nA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g94d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:51:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97955899so4259226a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781603515; x=1782208315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMOZTRu51g9pUPpWMnqPhEB0vPr07XkL6hULH16byek=;
        b=XYZN6noHulCYpa6tmQ/9udq2/CD891cNbLeGf1rOZCnqqP7f+I337tFGjO6v72Y8NL
         +7NNXxtqHa4hS8W529LviuaoHe1vQKxuzRpCasAr8KvLMYGcXDpuXWyPwAE3axOcYmQv
         Whd44wIKc4hP03YqWUGEg5e87jQOhyQGwcsPiEouWfle6beA4z1P05T1mYy6QcOiPmWV
         hJszScDRIoCfSbayMbPzcNXN8GKhh3Q51xdLOg8r1G/7cTKj+zfTPVDgmcWa06j2DfH2
         YM1GaRmOyk0fq6svByy/9kDh8cgi5m2ySrUp4OqY/OgI39W6g3SDYN5ooHhWCdfiGzPO
         slEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603515; x=1782208315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMOZTRu51g9pUPpWMnqPhEB0vPr07XkL6hULH16byek=;
        b=GomhCvjmFOp8UCRG9um3J2+Cp7sN0fmDgsDnOMahyGFFHPM02wzaQQa9aNJ44FnY0v
         o1wYPN5KhlbW9WCiP35BIa+b2MVtergGVU7xIy68nBCCjN7QPkSSdtdl7VAu8Cv/hpYG
         Hsa8BP2Va9nwjJ2U/u/YPUhAUeCH4846vF3Nsq1ITsvqa0wBIIy7HiZ1UV21TT7eFsV4
         TYF7qahICNER7aCFQtubtvHz9wjCfiCntU/ruCgbe9oHZibdF3vWXbOuSZIEDEExqCDd
         J7/JvQB8KX+5UL9ob9Z9Aj4t2Rz4GYJRJWpxJf+lLRDDsy3k7XpgDE8u2NHwA2QTz7bb
         nA9g==
X-Forwarded-Encrypted: i=1; AFNElJ+PTrFnfgvShRO8My/q40NwCg9neVepLnVHCDWjyqAIZtKZiypZxLa+ipCEsvl8QHY6D+xbtrmib1WpbieU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb92WBhqvRim2caYnuAUzuPDvMqgZk1M//f2t35GqpW+U2Z2Lq
	pCrBuW+uApAJ4iWMfO26FyTtb4VJZdcQv/LG3qei9OsUNImJ7wrbE+qsoqbPf9L+EuOo8TzDgoJ
	RPsUoUcicIk3dO7bGUV6Pa/Jdp2GWU+2BJamZuQijKHZSS8Z+8BmJrt6S3FWYiib6w7zC
X-Gm-Gg: Acq92OECdxIA3/vQmGmxOITGRtoiRRpJ0u4sKUERp/r5UxvDRHbMD3OlGIUexfW/HgS
	xjTki6todZB87LlT6ZXYecPm7xZiYvxzFEDR2VwIoFQ3BR3itW98ouwh4rg4PFImQk/FPi1FmX8
	0AtYDipu43JSSHYgKNFfpyvXuXGSZa8sUwpKz+32YC2uhLxgIPO9VBB6/5JnrNRAP7lWMXSMp3c
	XgI660bVt67jZIl6PEngkFueJ4KYr7Md7F+hbwwi08DJjEnzduWkdkxSuuNx7TsX6GysCRRsAP0
	CCY1cAUFVUc0QgbhR3nVFKWHjRMeeIWek/3haJhOvrC3ntM/cYY0kQtiF3UmQJ+7ucZWGBDZpKi
	EiTRRNpxl562DYUpZQ0Bq3LH9FPQOq5biq980WY/O0MdmuLQGKSeYaxmfItrUVdOCo6704Vbban
	ch5Catt2sdndca9rla
X-Received: by 2002:a17:90b:55c7:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-37c5231731amr3218107a91.7.1781603515036;
        Tue, 16 Jun 2026 02:51:55 -0700 (PDT)
X-Received: by 2002:a17:90b:55c7:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-37c5231731amr3218075a91.7.1781603514551;
        Tue, 16 Jun 2026 02:51:54 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5208fd0fsm2258085a91.0.2026.06.16.02.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:51:54 -0700 (PDT)
Message-ID: <bcf6de3c-97cc-4f83-9450-fa4a64025243@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 17:51:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 37/39] drm/msm/dp: add HPD callback for dp MST
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-37-b20518dea8de@oss.qualcomm.com>
 <ml35zldwr6f7euzmw6noy7j5mufyhfhmwoigkwq5ykyyl3amgb@5eo63mfnd4tg>
 <42c2bbab-dd86-4ba8-94f6-a6f377425be9@oss.qualcomm.com>
 <t4ocbdrm4d3xlocycwnsgkcyyuaebfbkid73pxzel46nh724rs@wairidx7ct2x>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <t4ocbdrm4d3xlocycwnsgkcyyuaebfbkid73pxzel46nh724rs@wairidx7ct2x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfX7Vxt2Lc/tpaD
 JVW1vPnY2m32E4NaaP5Lv0xAr+q++HUZ2Vgd13i383fX0JdiiaiX6HHoMFRm56e+Ac93OqQA9jf
 25Q4xQ4LL61DT60+HeBprcGSfBnYLlr2V2A2N4VAD05fa7237JrhHGw3Yg7XNtgUqpPGwrLH+n0
 IDIwpSwD5zOfSgatK224JI9ymLIdgrDU6YNWD4Z/Sw41hzO37npL62N/OjNzCDprNf+J3XCOSAG
 7jPyWvg6eA7Fv1ED78HkU0xkRD1F0/J+PwWVIZ8kleyvBfyMSuovvPY3wwknng2k77EiRwbCnxa
 344vuPiKkc0D1x1Lm+EsJKZd9xWSmGUzZ+zfUniBLpNt48rVxN3BJVemF2nhcsm0qQTLIKWzk2G
 hDasoVIonXsjZEVcc88+p8nIPsOErWUlp9PzO8no3vmuX8CcmMas8zE2xmQasrYR+bZNok8W9z4
 1QpVWibfGDJOgYG9zVw==
X-Proofpoint-ORIG-GUID: 3793PxqGDXdHOSezvJjny3QO9XmrFJFr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfX1ztaAp+tMQ1m
 aTy0AcUZgTB/hcZQxsMgQoba3uXEPozt0KLfphU/q6fi73iVH3tb4Rymsp/aa8qeSsq7zt0lWLj
 dapUqcINLenl0Y6sqbgfO92GgIQ4Xdk=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a311cbc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=btda8m9z8dVjgjKQGyEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3793PxqGDXdHOSezvJjny3QO9XmrFJFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113359-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E21D768DBF0



On 6/16/2026 8:50 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 06:05:07PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/12/2026 6:00 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:34:12PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Add HPD callback for the MST module which shall be invoked from the
>>>> dp_display's HPD handler to perform MST specific operations in case
>>>> of HPD. In MST case, route the HPD messages to MST module.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++----
>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>>>>    3 files changed, 54 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 919767945ba5..ca89e20b7563 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -454,6 +454,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>>>>    			dp->msm_dp_display.connector_type,
>>>>    			dp->link->sink_count);
>>>> +	if (dp->plugged)
>>>> +		return 0;
>>>> +
>>>>    	mutex_lock(&dp->plugged_lock);
>>>>    	ret = pm_runtime_resume_and_get(&pdev->dev);
>>>> @@ -556,12 +559,19 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
>>>>    {
>>>>    	u32 sink_request;
>>>>    	int rc = 0;
>>>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>>>    	/* irq_hpd can happen at either connected or disconnected state */
>>>>    	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
>>>>    			dp->msm_dp_display.connector_type,
>>>>    			dp->link->sink_count);
>>>> +	if (msm_dp_display->mst_active) {
>>>> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
>>>
>>> Will this work for USB-C?
>>>
>> Hmm not work for USB-C. We can remove this check here, as the IRQ thread can
>> handle the disconnect case itself.
> 
> Please. Start testing with USB-C too.
> 
Yeah. will test USB-C also. Could you rebase this series on top of the 
HPD refactor series? Thanks.
>>>> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>>    	/* check for any test request issued by sink */
>>>>    	rc = msm_dp_link_process_request(dp->link);
>>>>    	if (!rc) {
>>>> @@ -1125,9 +1135,13 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>>>    				      connector_status_connected);
>>>>    	/* Send HPD as connected and distinguish it in the notifier */
>>>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>>>> -		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>>>> -				      connector_status_connected);
>>>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>>>> +		if (dp->msm_dp_display.mst_active)
>>>> +			msm_dp_irq_hpd_handle(dp);
>>>
>>> No, don't touch this code. HPD notifications might be coming from the
>>> other entities. This IRQ thread can only send the HPD notification.
>>> There rest should be handled in the notifier.
>>>
>> Ok. From my understanding, after this series
>> (https://patchwork.freedesktop.org/series/164954/#rev5) is rebased, we
>> should use drm_aux_hpd_bridge_notify_extra() here to notify the IRQ?
> 
> No. There is no aux bridge here. But yes, I'd need to call a different
> function in that series.
> 
There is one concern here: if we use drm_aux_hpd_bridge_notify_*() to 
notify IRQ events, does that mean every IRQ notification would also 
trigger a hotplug event?
If so, this may not be necessary, since the MST core framework already 
notifies userspace/client on its own. Additional hotplug events could 
cause userspace to query connector status again, which in turn might 
trigger the bridge notification repeatedly.
Please correct me if my understanding is wrong.
>>>> +		else
>>>> +			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>>>> +					      connector_status_connected);
>>>> +	}
>>>>    	ret = IRQ_HANDLED;
>>>> @@ -1793,7 +1807,8 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>>>    			msm_dp_hpd_plug_handle(dp);
>>>>    		}
>>>>    	} else {
>>>> -		msm_dp_hpd_unplug_handle(dp);
>>>> +		if (hpd_link_status == ISR_DISCONNECTED)
>>>
>>> Why?
>>>
>> Let me explain this in more detail here.
>> Currently, MST hotplug and IRQ events are handled through the SST bridge.
>> This guards against spurious unplug handling caused by
>> msm_dp_bridge_hpd_notify() being invoked from non-HPD contexts where status
>> == connector_status_disconnected does not actually mean the cable is gone.
>>
>> In addition to the real HPD IRQ path, drm_bridge_connector_detect() also
>> calls drm_bridge_connector_hpd_notify() to broadcast the detect result to
>> all bridges in the chain. So a single physical plug-in produces multiple
>> msm_dp_bridge_hpd_notify() calls — one from the real IRQ, then several more
>> from various probe/poll paths. Stack traces from a single insertion on
>> QCS8300:
>>
>>    1. msm_dp_display_irq_thread → real HPD plug, status=connected
>>    2. fbdev probe triggered by (1) → drm_bridge_connector_detect →
>> status=disconnected (link not ready yet)
> 
> This should not be happening. We don't use link status anymore to return
> connected status.
> 
Let me double-check this.
>>    3. output_poll_execute worker → same path → status=disconnected
>>    4. drm_dp_mst_link_probe_work → same path → status=disconnected
>>    5. output_poll_execute again → status=disconnected
>>
>> Here not work for USB-C case yet, I’d like to switch to using
>> drm_dp_read_sink_count to detect whether the sink is actually disconnected
>> or no sink devices.
> 
> drm_dp_read_sink_count() isn't enough here. See the plugged flag. Maybe
> we need more flags here.
> 
Got it. Let me see if there’s a better way to handle this.
>>
>>>> +			msm_dp_hpd_unplug_handle(dp);
>>>>    	}
>>>>    	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> 


