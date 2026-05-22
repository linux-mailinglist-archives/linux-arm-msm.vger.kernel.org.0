Return-Path: <linux-arm-msm+bounces-109347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANLFA8VsEGqgXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:48:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FFE5B6734
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADD2630166DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56EB423A9B;
	Fri, 22 May 2026 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfihpSb1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PidOvA/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9CA413227
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460877; cv=none; b=GungZpw3nh6flrgM80fUCRAE4xGIlucqmpavtxGWO6AgbODhOI26gQR/j490jzWRFGJLj3hYrlfQiVU28cCbavyDfPFTs56LiawwtUGQ81FAhO45bhkICSlgOrLHIlW5hJRI10p5cWpSWUaZQfPeKkGf1vd3xml36X0rc9n6sGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460877; c=relaxed/simple;
	bh=y/+/08RKkTsa2MuvavZnHZmq0MoOXmO5phHVtZs+8bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHMfZQ4gDt5RvGHkEVeVHPey8NnVW2p35TgPDugJuqt0gztO6IJUpTTN5JM5SFzATTyz4jjvHen8f3tYphRHtf8N4G0Ijl97pyIbcMCrLvSVAC1FHlUhL1t7+sLY0nAFP6oPiVSzIzLpFwCNp1lQwZxQmtA8Q7f7/0PvAB8xBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfihpSb1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PidOvA/B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpXkP2125204
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSMMxHxRNCis+0TVEZjUEI9IKPS7rPdh57bkRY+Mtv0=; b=jfihpSb1ajNXjtB1
	e+9hkWsNCDpF+XqTyA21VxoqCMeTq6TuOjMMZsUuYVi6U2GVLGY/LkzW5lDy066w
	Jey79YVI9wUY1+DzdCGa6rNMbIOWlszIfpVaxM31ASXMPhgN1h1Q+TC8CzHh+b9n
	WUw+Vo5n+PL1Vk6SR05lQn2OD1vbWgyjaiwyCHk+vMS6vIFHsBFYoJP1sx0nWjoj
	KkhILSPd+5x8E88YdaE5sOgsBDq1I4yhvNtAIXLDhg4uxpPXMbEDoGpini9DWu8X
	wd4XUmUUNMLm7QNcIyfNwzvizpNFt7C6EskD+awiG9XFcvW89jXeAyYPqoSl4fp0
	vWi6SA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard886b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:41:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57535a51589so582472e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779460875; x=1780065675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSMMxHxRNCis+0TVEZjUEI9IKPS7rPdh57bkRY+Mtv0=;
        b=PidOvA/BaILOO2VNN+QfwTp0kxHETTBaYJE2s7a3GT6VcKKr7oOq9niqvzUdZMyFUD
         QmElPhqcYGNvTVaWQS+f6jp/trJISSOhzhk+TiLro7caqD39Vs0QayBWZgripLexuEA0
         hVkrZvYrOYDNc1lwCAF9KK9VyDLhFC30Y9EKmEcufbCBHS/r1pplOP+qfdtfNKk97/+v
         3WlclRs4wlBtZZq8zfBJacu3srtlIDP4Lu+ytjUogiWCseEbOfiSMDCgHeXYGzLY+OHB
         w5fJEIIPOcfOVKDc9tFOxiLI907z+RYuSJEcTDWETfsbeU1SbVy669xLjv/UdLoS05rs
         m2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460875; x=1780065675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSMMxHxRNCis+0TVEZjUEI9IKPS7rPdh57bkRY+Mtv0=;
        b=Ef8Vxuccks0WPDNii98kDVVbQEZN9xqIpWoiC++OqtYw/xa/gLHZqUUEP1Svhii134
         /Fy66u3uJ8mP1vBj9/zv64LprFHzb99sieFmDcHGsGKai81x6vAjGsEufAlz0CARs+Bd
         7OmAzYUPdYHm5fWE7jwC8FdLmferIfcpDfHWzWXn2mKQ2U4p7fq7oUGH+InvQgeqisgA
         ejyIYjSjPJu9My9TQWtx2VRenhKjEvXhQ3SDnjBmjyxMjbh3PVUXld6BkSgYQueL0uWs
         fTIYIZyPeNpY4Uqa5jhIXO9mvCODDPscSR5G3E0nm1TxL9Q2PuUmuori4iQ29d5R5jiP
         c5GA==
X-Forwarded-Encrypted: i=1; AFNElJ8S560cn6EcVU0VudpolJwQbRWFYRWBwm2l+IIFD5ghi4Zz/eD316LuRY0QO/yjEB3SdIs6+geepejxHpZ0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+ukRzwx8h8invUBbuLCyt37jE31sL45co/d5al9ogpQonMs4
	2g//2ay6tF8P5Owu0Mut+PqXMvjO/IFZECZHlBYhAX9Mwyt4DHF5DsIY18++IHBHh+AZYWvgQt2
	3NKQ3yVeIHHINH42twpS+3E160fYKL1CUEifuDXjAp2HcLqmWcnI+qeVlHC2dp0V2kMct
X-Gm-Gg: Acq92OGbATJj4jBygf9KSj3fIr/Ddi1KfRUHCQe9aQ2PLzw6sK+BtvzwA4rzAZRxzbR
	gh1jCt38o6VHilk0PqKrnDm+IJmC16OKPVS3O3lBiyjIwdIggGm5MwFmGTNywcG2b0jRrKRChs9
	iGGAPjZftIZgAh5/IpzH1YPnMGcM50Yf7sGXDmqmSTcRLxlkv9J7LR3xD6Smef6PPsMLi5hI2jk
	h9DZeGIRwMgNhfwo3g60QKiB6kjXc5ebDeU2EHGfgpjIJE5lT6uy3muH5qhn/4K/PvuUBBHKA4+
	NyDZLzPvcPWxZnYMKyaGxZIzFKuQrlUvu57J3+OSRORN4YGNGXUyUbn/g2NDzhCEl5EWyH0D1Ht
	kvDHKLXe+sSBl+DlazShVEW0uNc3hCRCQ0bqBlR9I3FpgRw==
X-Received: by 2002:a67:fd4e:0:b0:65b:c17:7052 with SMTP id ada2fe7eead31-67c5ff1dab4mr640215137.0.1779460874694;
        Fri, 22 May 2026 07:41:14 -0700 (PDT)
X-Received: by 2002:a67:fd4e:0:b0:65b:c17:7052 with SMTP id ada2fe7eead31-67c5ff1dab4mr640187137.0.1779460874270;
        Fri, 22 May 2026 07:41:14 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3652b34sm60566866b.28.2026.05.22.07.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:41:13 -0700 (PDT)
Message-ID: <f1d191cd-22a7-415d-8ab7-9c0948b9e30a@oss.qualcomm.com>
Date: Fri, 22 May 2026 16:41:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-3-0c8450737d64@oss.qualcomm.com>
 <c67ee441-83d7-4b66-ab19-c2c282c1b354@oss.qualcomm.com>
 <q3wtsw3djk47izq7za5p425wuxoykfsejpm5hs72jtbytnrgpn@in2o4iza7svk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <q3wtsw3djk47izq7za5p425wuxoykfsejpm5hs72jtbytnrgpn@in2o4iza7svk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a106b0b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FAVcj_sHJixdwfoHFuYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: jx3AMxu9IaWsA3kFKYpEitJWP2BtVLmF
X-Proofpoint-GUID: jx3AMxu9IaWsA3kFKYpEitJWP2BtVLmF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0NSBTYWx0ZWRfXzf8O8If5qK9i
 38uXim2dL6ZGqIwFSZMEsgX7sLgvAX3CDZACgOMMnCJd4XFOyThoM1XtMNR7HnMuTwquRjiPnkW
 BOqXBcz+b7UwHZHI8bYzA2ZxN8Dr0G5ePkQbiBVvSQdH9gFl978jd7kgv1gdbi+m+Sj57ugVDAW
 MeDaSx3FyTJsRNIyfKT0wV6qESe9QD+Hoa/DFi5Hs+StrxIpqho5a1S+GNOjgoLakBiHim3ZaU0
 NNLDCcqrUqFDceYqDVjsfcgFRKTRphZ/d8UajmUcq6vizXSCRDQggesawsr/sPdxM6NgedgWSP5
 d74a8ZL5iQnqMFb24BPfkyj6uUNUW2GTT4PtoDS13uBXYE6/H/49nmzWXdMmkRxlcX1c5d6w49O
 lMGgppylzKskrHSIWu/WDcIhafYpQWbk5v4ef9XMjKazeLXRVT/jUv1YEhy+YvP3+XZfEvT5pIy
 QKgEL67kxt9CV102QlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109347-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72FFE5B6734
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 4:38 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 01:30:54PM +0200, Konrad Dybcio wrote:
>> On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
>>> From: Jessica Zhang <jesszhan0024@gmail.com>
>>>
>>> Instead of relying on the link_ready flag to specify if DP is connected,
>>> read the DPCD bits and get the sink count to accurately detect if DP is
>>> connected.
>>>
>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> There's still some trailing style/documentation feedback here from v3
> 
> I'll correct most of the feedback from both you and Bjorn. I'll leave pm
> calls as is, without using ACQUIRE macros. I will think about using them
> for the whole driver rather than just a single function.

Sounds good

Konrad

