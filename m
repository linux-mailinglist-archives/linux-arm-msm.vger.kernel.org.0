Return-Path: <linux-arm-msm+bounces-98691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAzGCCzBu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:26:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2D2C89B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DE91302BBEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553D63B530D;
	Thu, 19 Mar 2026 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzXlmTWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epgXVxU1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF283B19D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912280; cv=none; b=CGjsj64Xo2F+5pFn9qYGf6MqDBkA+KSh0fLqTdOxTR9qgAj8sfvcTb0ubDdNYJzvWst8FWpXvfr3lgDZdzhCBVD/7NpF3d4+8X+foioNCoeQcIJFyxJAcqxoPPA2ynKpceyFC/SyhlM9Ayd7y/IZ18saRkFF3bJgCv1+bBKF6YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912280; c=relaxed/simple;
	bh=GxsiZ67ycv/oHYv3HInSJ9NnmjuYatXtX4GD7yA/JwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDz0TlE0XM01SQgbc4U84vhZJTXi5V/VVAKm6ruADFII80GanYLeSybkFK32FsJSV9pxv9DUSUrikw0sHshe2f+y1nL4k8EyC5WVEOhw9NYcz7nL8b0ZiWqQuKmAfl4G3HbWJKcLHJpAXxfh442m6LwI4SZeDoYesFelLk/optU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzXlmTWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epgXVxU1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740fm2883715
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TckbxMyJi7AhkdcEUyt8X0pVJFCrYNyjJm/tTCzLAwo=; b=HzXlmTWc1wDkOb5/
	pkuFMz9+J40TgGDM/f58I4EfyeKayoD8ImOTEiyGFcD4774Owcrfvdfu4IcdlYaF
	9xnfhXTnhcpFNF64Fm8wfIdEikCP34A07rkHXhgJgNXe4QB5FCwd/L4YUAgiFQRv
	Mpl8qTblT4u1kRAIXqIyTNNXvOw11udGgBecU6ok6E8b6NSGVjolJseQysTRx/Mq
	2eO44CSBXmHwS0OF2psSt2bgm7A6IOc6bl3jDofZSgQMhiaY1gYcbeRGC7wfsS1C
	bECX0PVTwNwX+sTme3MPhxR1fuh/CxPg9S7IjeL5cJEATIndxgoeluCWHcRLoq6R
	/F5OpA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyuwmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a5b38affdso6852516d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773912277; x=1774517077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TckbxMyJi7AhkdcEUyt8X0pVJFCrYNyjJm/tTCzLAwo=;
        b=epgXVxU1OHIjFlvm213+FpDFsMIRz0J+1gunxb0jNe83zF5rz5Rqm3jBScQdCVlDYM
         fYFpI6H4FxEF5/AO39lvRf9h+CQf21YzwfXWRw1+sbrZd7p+zmKvAv+RG0IdKw6K1P6i
         MKh5UN9qs8E8KBmTkrLwjcYcH+XwFGPPK515kr1B5mtAlvaEXXaA/W7e0JSSwz6kNFmq
         yAItEe9sX6Zkk+Mr0KufuaQHefUiIWeUkNY1Dd77kkjvWlyIG9Ykt85YE9mC7LwLkGV3
         OarysFut93toflKK+Iy6/SPwtcBE1zwSdly1E34DO6BlnmjJHyLzW/5puhzg9jVHTIq0
         atmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912277; x=1774517077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TckbxMyJi7AhkdcEUyt8X0pVJFCrYNyjJm/tTCzLAwo=;
        b=JHxtlorrq1pIb/npbe6VL8dlvN2BYEy85zPIuy/h+4V6n62pRYX5N5e4+9kjwiEtg/
         h2JBNQEmipHYe9KTA5xxxVdu5yZ3PnAFVueIJDd7A4xGNUUYVQZJjTvUiCzlXbw4GjSa
         LsR56vcYzt0n28rLLLB1WCeFoHkzLN+hy7l/t5rRgRoe+QqWlAK6yw/cixjEucJl8p88
         2xpzc9cAfvevWxooWOAz3CN40w+uQVw2OXgLZqCfqXtUVikczCk9CXNv5PglhqZjNvKp
         3UiUrdf3Ld+CvS5KofmefhRAFxTX8+V8ye+0XZmARnPZUiQv4EI9WXH8rQmYwpm4P7IQ
         MFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb3jOyaY2xBZa1eyTAtgx1HwAZvFbeybduE14S65WSAILyfoK6TQ3l674ySqb3lgoHI2T8FHtceQfOMRzq@vger.kernel.org
X-Gm-Message-State: AOJu0YzP3trC8SeSE8RQvrZ6rzcERaPBju1UBNOp2ca95RP7CAYEp27M
	wmf1t909bHvBXFZky7m8XkcUMIRQSlw3usnA7mJk12NmhW3o1vuOyP5EbqXgLIH9O7xU3FsER+m
	eklhQIhNwFei4EgwmD8+sPdHcDzlAHlHCR47zWSfQeY3d3oCyQutipEhhuNvEOv88J4Tg
X-Gm-Gg: ATEYQzwmoI8xiFbCTDys7QAcT85NdMsFaC9gA86fq/Z1iGJjy8Vt8QLVw/Efo00kBjO
	UV/XCzn9e7kOCXRxH3+N8HAEuD47srYwKeRJ7WqWP8ShpUgsI0Moe2hBkzmytGGDX2chdUfYQI0
	N02EJEIuNxHI4mPEF7pWMI2fToMEn2ZsGRebQvobFCJDQu8Tbbu773f6+TSpyRCNGz3bXuejEPX
	NRe64a6/n34ObJ8NrliRFRxOFMvTEQ0lWo/FdeAR0cghQ25lva9gMkVzENkWNapad74Jnyrk9YT
	o6wlUMCeh1gvOe8FM81DoC6SQ4n52+xkfSp6vfN95oFHa/z83rMdmn5kndv8gRcQYITtaFfQp+7
	Itf9LN4qSFMUfsbgj8KkKgqS9e5C7ehEXtNPzDfrQZnk26a4hhVAjel0+chlAdmt/vrYUtUm5di
	btoZQ=
X-Received: by 2002:ad4:5e8d:0:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89c6b728303mr74824446d6.8.1773912277426;
        Thu, 19 Mar 2026 02:24:37 -0700 (PDT)
X-Received: by 2002:ad4:5e8d:0:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89c6b728303mr74824206d6.8.1773912276858;
        Thu, 19 Mar 2026 02:24:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13ed066sm410962166b.4.2026.03.19.02.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:24:36 -0700 (PDT)
Message-ID: <5b9ce996-5cdd-40da-9851-2e7c8a40abae@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:24:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] phy: qualcomm: add MSM8974 HDMI PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com>
 <20260314-fd-hdmi-phy-v5-4-58122ae96d3b@oss.qualcomm.com>
 <5a464fca-7be5-44a6-b124-7b80ea859a9e@oss.qualcomm.com>
 <dpzq6o4qdttbmgtpgit2atjghu2kwrcj36ko3rnvwaehbkvjrk@lr4ms7mi6aiz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dpzq6o4qdttbmgtpgit2atjghu2kwrcj36ko3rnvwaehbkvjrk@lr4ms7mi6aiz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _n18EJvnFvU1KUURohgfgimCXl43N-q8
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbc0d6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NujWGTqPcDVEmWsEH4UA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NCBTYWx0ZWRfX4bEJU3bZzru6
 5ocGO7Ph9uEvxkRVMekZG4fq0gPMDZf3SWpQnbG490mqiPFDhntE7gRLMj0W2pakUlhZgG/HRmP
 JX9rfzRgdqlpU5mb00s5ZC5527fYETleUg4HTLQbEMGTo7vL/a2ct7Q3C5O+AETFPCwaJvZXymw
 OjVajmO/I8gNBcr2qtEwucTForguIv4UnvTOsDOZ+1orYanCowOpVoBEiuEHjnFSDWf4COymU1z
 LoYj5elzrxL5ZdLWGGP7h7nnOIhiOWA9i15SRVvn4A7+VK6jLmzHZxEd/n5sxbaQA3OmygwP146
 mFP0aV6LpWnmaE7USu6N6a7zaArzhkD81RMB66Bj6aYIdaCQ1SIRRRpLXC+RuaKzwRiuVYfQPAJ
 h4Trt2Num3LrJufHKdTXkq/ymAkGYEpu3F1B5ywB0HBwTXhSNRlH5ksZl7H05IrV2uwpJjh+Nbx
 7P5jZ3jOf6UDeQAU/6w==
X-Proofpoint-ORIG-GUID: _n18EJvnFvU1KUURohgfgimCXl43N-q8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98691-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAC2D2C89B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 6:15 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 10:22:08AM +0100, Konrad Dybcio wrote:
>> On 3/14/26 6:06 AM, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---

[...]

>> I don't know if it's a good direction, but maybe:
>>
>> const unsigned long max_rate = HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV;
>>
>> clamp(req->rate, max_rate / 6, max_rate)
> 
> Note, it is clamp (min_rate / 6, max_rate)

see, indeed confusing ;)

But I suppose we don't have a better way of specifying that so whatevs

Konrad

