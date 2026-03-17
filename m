Return-Path: <linux-arm-msm+bounces-98258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SATlCi2ZuWn5KwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:10:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 815EC2B0AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C336323B0A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F8337F8A5;
	Tue, 17 Mar 2026 17:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGo7rPq8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTWCZ0Ns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609AA37D133
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770249; cv=none; b=SXVddG+d17C5PtDnwIYmqXKyPiBBk5lOlmCeWi7ARZubIiypaeGEjgNymrOdO9oscaHHNk1GzekvhVDPjSEakY2Jn5cEODPFiAYGGg6+YDWzmP/22K31ERFqO9aWlrvjL9MnNTYMphsbfbxR2dxovHwJ0byM8JXuJK/7Z7rLe4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770249; c=relaxed/simple;
	bh=zWxRu1kEPY+EiQuxTpySEl0COA+5BZ00XVcMX285fS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE1o/sM37pjzBuYWxmq2GYMrXA5ugEaoFD+Ow0yZV0xMpV+MltbLv00ueGfPFK2aocMCd8Y1bneu17ucFyyRBFVb+UHGbhA6G2msI2HCp7a+JL8mzbZ0IfBkt6oRpLmmmm4u1RgaOQ9orVJ6nzztvTE9LoW25xirhB5LLIkxDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGo7rPq8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTWCZ0Ns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDbW412906065
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txGX+ndpvfdV0K81az/wN67n+Vp1SK8OG9SvULXglcc=; b=dGo7rPq8pnZPNYzi
	UMvfi66uhUNOybi8uqhNkHs/NiHyfzT0H+TNF40eI8Abt4OyukOn1hkN6xIsirVu
	3RL4C+9lwkC5vApyav4DNmzOo2LUGMowkXf02d2/H5qXxYht7NwQxyW0NyBnqbWW
	B3ne+H4/+hhq8z7CXFTsUvJnke+r11GKogzKspt13SR7txmqKxayq0DTcF75UMP4
	on/1XPRCbLGohuN9CfXxGtk47khWJt210LjIRx/HHtbQSqAG/3ixsaFyK9i9p7Vm
	F9VThS+qE/RSFNr+0STB2AtypO8SpmS32VxDBDSrsSZqe/zI1j9KkwyqIWbm1DN5
	CRJcGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxjcu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:57:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd39bso4511162285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773770239; x=1774375039; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=txGX+ndpvfdV0K81az/wN67n+Vp1SK8OG9SvULXglcc=;
        b=hTWCZ0NssHlUDQyIAFuuQ9rZO9urPQezDV79VWmVw49zgGUPi09TOlQHtXX1dHJ7E4
         nLudY23kQSSdU+eMjOkSih/F2V9L62rpZm9VWMZP+PAv95RFa42+k5ibFuZBglvwMX5k
         CQjwLoKdjZzX350dXUVSEYu+a1RUKNNI9eSnQcMtnIMNUD2HDa+DQeheX8h/L3OS/wGl
         +kLNQlqfsFJ6bTcy7QZhQJqu0YY/sOvqf3uce2ukEsJd9G5zmJkTlKUqDw+9Iagasouh
         4i/fy/FI9npXoSz9M81ILmHCwH1+GxrH6F4RWd1T8Sg3COHdZyCRne850bvd6RHZYm8D
         N70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770239; x=1774375039;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txGX+ndpvfdV0K81az/wN67n+Vp1SK8OG9SvULXglcc=;
        b=qd7vtj1sW40DM227ezulYQOHGknah6xNNh+pzCiwgN5cJZMnIrJirhcnDtZ+BFzciB
         n4umvlbxlTl1mVzW/c3otzYZtbSMKrS1EG+N5oT1lIWldTuRP9iRFXZeyYEH/vGdIOnJ
         +p/WomeCZREmmsXFkbGUW/9/OyYnUlXFekf6M6lLMMsEnqyL7rRHHo5GAYE8k0THic3u
         JaIDxvs0PRZr89mi9Ue0BVHl+/pWnbH93BP1/CdY4NV69gZTZfJIFFO3HsD/J+o139Yw
         7htjq6m+F8aj/w0MUQ8zI85oDVTvukzx7UugufsMUEyrInMu+DrrOjAEIk2RDBofWQ66
         JB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoVEhwiKlHWsmynEa44pkvjogWEYj+yuN1q9myqLoofyLwBc+dHyHLudwRG4F6JKiL/zyiZRHjy8mWtAKh@vger.kernel.org
X-Gm-Message-State: AOJu0YzIVLXLOlOLRgMIJNVEki22/Bm4c//bKSnSHAfDHoD/cIqe5DsF
	L+Nz+u+gKHD3Da6klTIOrBOxE+MkywyuTfmKf3P44u7dMSvPnj8yYOCxDQ07YoKjXv2widmVlN7
	SJZr428LhiLuN/yAFNHbE5RELq5PEp2WZ0pWLPayRaBQQyISpsBeDhQ0Vl1OH6WV0zIf3
X-Gm-Gg: ATEYQzx0qmr9VdpwlTi245fJqvK1mbw1hwMpe/NFR9T1hax9qpNeD/kAKsBQhY9xUC/
	9/ChM/4SZ74FgvVeRMNNvYL6Mgkw5uLmAE3rCNKY/5pRnT3GofnqK1NdZlCRSeLqUHM1FHnAdMs
	yUj9Q3pOV1NuUqQLm7OHkP2Xp+bHdXBRQ78yRFjcI4V7gmY3UlJO4NiyUjvShYma5OUvg+5PZC4
	zmo3PM99Uuhn3dIljXZ00J+PGWF7l94gs8AtnKzcVO2g+gDKq9pTLrxD4zE3RzwDDKpQsIdSyFo
	Psd0D+o9vVnbqQY9vh3hDXcw/DpMtk5mUxykDvIyGxx56uRUNiGyMc5+Fo0+UmfF2A8Hk56Q0cS
	FHnP5dSgId7w4PYUkYzx76M15BLWy0sOwHTDglMlYYZgr1iaant6M639z8mkONcq2Y+/wgCNL67
	YFThPX0x7W5G6L+uYfxu1TkJFW5Xw5+lZgErE=
X-Received: by 2002:a05:620a:c4e:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cfad319e43mr67727285a.44.1773770238929;
        Tue, 17 Mar 2026 10:57:18 -0700 (PDT)
X-Received: by 2002:a05:620a:c4e:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cfad319e43mr67722085a.44.1773770238252;
        Tue, 17 Mar 2026 10:57:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279a081dcsm34942e87.0.2026.03.17.10.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:57:17 -0700 (PDT)
Date: Tue, 17 Mar 2026 19:57:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <6sjjtwmulrhwphcfmftslpemjegmdknhxhkz5txnwyejr3ohdj@mzh627gxhjwi>
References: <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <DGSDE0ID17DQ.XQZNKZH5UKPO@fairphone.com>
 <g3dclilgoee6a2dyfqdvk67asjb4ptur5nc52iqqeqpiiourpv@46xstae5zsy3>
 <DH4WJ5KZ39MS.AHLMLFB8E0JW@fairphone.com>
 <3e5f80a6-d9bc-46ee-89ca-b1b2ba744493@oss.qualcomm.com>
 <necpphuujv4cyc33sf6eaaamh2hnub2poch7rjgvxzu6id62zw@rxotgr3rtbsb>
 <DH55OTHPTVD0.3CEOFJJRR8A12@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DH55OTHPTVD0.3CEOFJJRR8A12@fairphone.com>
X-Proofpoint-GUID: z8Dq0KQOM8GxpmKWXTBLpd2fvTMZDQq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1OCBTYWx0ZWRfXyQ4KYj/7eaha
 KHNqIbBgyjRVTkku7KkOeGkjcfrRu+82Z33a8r805BTFCV6KaLLEESxvRCT+G5ImoEmhTIfPbmb
 xcGV2Wmg/0JPpxee8vtdZEnkOr0dfagGQ6zQccuaCZWJrVsZtef7ccFuBdVb2j4Krs1SCq/9ALJ
 cnHQj7ijVFH2vC61BJltqu5bKT0aZhPEekesRxcnuj7+M8f+l28RSiQMIOqFhc/NEQiITLg58Ep
 fJkpF5t0SOzXszTpdgzZ5JyWWByZ4g03QTO7MywtuaVJ1tEmTBz4TTO8UtlYER5rwubk3VTGIYr
 iG6fZHqZX33MVqebwhpYs4vi7hrwl507YCpbiTWD0/s45dGBx0028/7JVPHTQBlaqQzO9MwK4fg
 4dEHKwNByRo8HmjBCxVKPILJLHMy5auswQheORD2JknefB+EUbiaiwDqXchOUyEMpKOHd3iqcrz
 uPUMj8gwSB+5DpD80lw==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b99600 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5Obv-9asVZCeeCFDVGsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: z8Dq0KQOM8GxpmKWXTBLpd2fvTMZDQq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170158
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98258-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 815EC2B0AB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 04:18:13PM +0100, Luca Weiss wrote:
> On Tue Mar 17, 2026 at 4:16 PM CET, Dmitry Baryshkov wrote:
> > On Tue, Mar 17, 2026 at 09:59:28AM +0100, Konrad Dybcio wrote:
> >> On 3/17/26 9:07 AM, Luca Weiss wrote:
> >> > On Mon Mar 2, 2026 at 4:17 PM CET, Dmitry Baryshkov wrote:
> >> >> On Mon, Mar 02, 2026 at 03:35:36PM +0100, Luca Weiss wrote:
> >> >>> On Fri Feb 27, 2026 at 8:05 PM CET, Dmitry Baryshkov wrote:
> >> >>>> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
> >> >>>>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
> >> >>>>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> >> >>>>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
> >> >>>>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >> >>>>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >> >>>>>>>>>>
> >> >>>>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >> >>>>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >> >>>>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >> >>>>>
> >> >>>>> [...]
> >> >>>>>
> >> >>>>>> Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
> >> >>>>>> dpu_runtime_suspend, then we should be able to also skip setting OPP
> >> >>>>>> corner in dpu_runtime_resume(), because the previously set corner should
> >> >>>>>> be viable until drm/msm driver commits new state / new modes.
> >> >>>>>
> >> >>>>> That matches my understanding.
> >> >>>>>
> >> >>>>>> The only important issue is to set the corner before starting up the
> >> >>>>>> DPU, where we already have code to set MDP_CLK to the max frequency.
> >> >>>>>>
> >> >>>>>> Which means, we only need to drop the dev_pm_set_rate call from the
> >> >>>>>> dpu_runtime_suspend().
> >> >>>>>
> >> >>>>> I concur.
> >> >>>>>
> >> >>>>>>> For MDSS, we're currently generally describing the MDSS_AHB clock, the
> >> >>>>>>> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
> >> >>>>>>
> >> >>>>>> No. As far as I remember, MDP_CLK is necessary to access MDSS registers
> >> >>>>>> (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
> >> >>>>>> platforms")), I don't remember if accessing HW_REV without MDP_CLK
> >> >>>>>> resulted in a zero reads or in a crash. At the same time it needs to be
> >> >>>>>> enabled to any rate, which means that for most of the operations
> >> >>>>>> msm_mdss.c can rely on DPU keeping the clock up and running.
> >> >>>>>>
> >> >>>>>>> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
> >> >>>>>>> MDSS_AHB one seems to have 3 actually configurable performance points
> >> >>>>>>> that neither we nor seemingly the downstream driver seem to really care
> >> >>>>>>> about (i.e. both just treat it as on/off). If we need to scale it, we
> >> >>>>>>> should add an OPP table, if we don't, we should at least add required-opps.
> >> >>>>>>
> >> >>>>>> I think, dispcc already has a minimal vote on the MMCX, which fulfill
> >> >>>>>> these needs.
> >> >>>>>
> >> >>>>> I have slightly mixed feelings, but I suppose that as we accepted Commit
> >> >>>>> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain"),
> >> >>>>> we can generally agree that it makes sense that calling genpd->on() actually
> >> >>>>> turns on the power indeed
> >> >>>>>
> >> >>>>> What I'm worried about is if the clock is pre-configured to run at a high
> >> >>>>> frequency from the bootloader (prepare_enable only sets the EN bit in the RCG,
> >> >>>>> and doesn't impact the state of M/N/D at a glance), we may get a brownout
> >> >>>>>
> >> >>>>> This rings the "downstream really did it better with putting clock dvfs states
> >> >>>>> into the clk driver" bell, but I suppose the way to fight this would be to
> >> >>>>> simply set_rate(fmax) there too..
> >> >>>>>
> >> >>>>> I attempted an experiment with pulling out the plug. MMCX enabled with the
> >> >>>>> AHB clock off results in a read-as-zero. I tried really hard to disable the
> >> >>>>> mdp clock, but it seems like the "shared_ops" reflect some sort of "you
> >> >>>>> *really* can't just disable it" type behavior (verified with debugcc)
> >> >>>>
> >> >>>> I think, in 8996 it was possible to disable it. Not sure about
> >> >>>> 8998/630/660.
> >> >>>>
> >> >>>>>
> >> >>>>>
> >> >>>>> There's a possible race condition if we don't do it:
> >> >>>>>
> >> >>>>> ------- bootloader --------
> >> >>>>> configure display, mdp_clk=turbo
> >> >>>>> ------- linux -------------
> >> >>>>> load rpmhpd     |
> >> >>>>> load venus      |
> >> >>>>> set mmcx=lowsvs | mdp_clk is @ turbo
> >> >>>>>                 | brownout
> >> >>>>>                 | 
> >> >>>>>                 | <mdss would only probe here>
> >> >>>>>
> >> >>>>> *but* that should be made impossible because of .sync_state().
> >> >>>>
> >> >>>> Yep, sync_state should prevent MMCX or CX from dropping under the boot
> >> >>>> level.
> >> >>>>
> >> >>>>>
> >> >>>>> This may impact hacky setups like simplefb, but as the name implies,
> >> >>>>> that's hacky.
> >> >>>>>
> >> >>>>> Relying on .sync_state() however will not cover the case if the mdss
> >> >>>>> module is removed and re-inserted later, possibly with mmcx disabled
> >> >>>>> entirely but the clock not parked at a sufficiently low rate.
> >> >>>>>
> >> >>>>>
> >> >>>>> TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
> >> >>>>> plug the MDP opp table into it and set_rate(fmax) during mdss init
> >> >>>>
> >> >>>> And what will drop it afterwards? MDSS will still vote on the MMCX / CX
> >> >>>> level even though DPU will change the clock freq.
> >> >>>>
> >> >>>>>
> >> >>>>>>> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
> >> >>>>>>> targets supported by these may not even have OPP tables and are generally
> >> >>>>>>> not super high priority for spending time on.. that can, I'd kick down the
> >> >>>>>>> road unless someone really wants to step up
> >> >>>>>>
> >> >>>>>> I'd really not bother with those two drivers, unless we start seing
> >> >>>>>> crashes. For MDP4 platforms we don't implement power domains at all, no
> >> >>>>>> interconnects, etc., which means that the system will never go to a
> >> >>>>>> lower power state.
> >> >>>>>
> >> >>>>> Right. Might be that 2030-something arrives and armv7 is gone before someone
> >> >>>>> randomly decides to work on that!
> >> >>>>>
> >> >>>>>> MDP5 platforms mostly don't have OPP tables. (I'm not counting MSM8998 /
> >> >>>>>> SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MSM8976
> >> >>>>>> has both MDP and DSI tables (my favourite MSM8996 has none). Probably we
> >> >>>>>> should start there by adding missing bits adding corresponding
> >> >>>>>> dev_pm_set_rate() calls as required (as demostrated by the DPU driver).
> >> >>>>>
> >> >>>>> A bit off-topic, but:
> >> >>>>>
> >> >>>>> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> >> >>>>>
> >> >>>>> 96 is in DPU. any other candidates that should be moved over?
> >> >>>>
> >> >>>> Let's go through them.
> >> >>>>
> >> >>>> All SoC except those currently supported in DPU require SMP (shared
> >> >>>> memory pool) support to be ported from the MDP5 driver.
> >> >>>>
> >> >>>> Most of the remaining platforms (except MSM8994/92) also had HW cursor
> >> >>>> implemented in a fancy way, in the LM rather than in a separate pipe.
> >> >>>> I'd really like to postpone those, possibly first completing migration
> >> >>>> of the other platforms and dropping support for them from MDP5.
> >> >>>>
> >> >>>> 1.0  - old MSM8974
> >> >>>>        I'd rather not touch it, it had bugs and I don't have HW
> >> >>>> 1.1  - MSM8x26
> >> >>>>        Probably Luca can better comment on it. Should be doable, but I
> >> >>>>        don't see upstream devices using display on it.
> >> >>>
> >> >>> I have at least two MSM8x26 (1x APQ8026 lg-lenok & 1x MSM8926 htc-memul)
> >> >>> devices working with MDP5 fine. I should've probably upstreamed panel
> >> >>> driver & dts but they haven't been high priority..
> >> >>
> >> >> I think I have been saying this: having a panel & dsi enabled in DT is
> >> >> the only way for me to know that the display is working on this
> >> >> platform. I'd really kindly ask you and other activists to get at least
> >> >> some panel drivers and corresponding DT bits upstream. It is really an
> >> >> important flag for me.
> >> >>
> >> >> I can propose some kind of bounty for those getting MDSS+panel supported
> >> >> in Qcom DT. (Beer at the next conf we meet? Some stickers for the
> >> >> laptops and phones? Mämmi?)
> >> > 
> >> > Hm I realized yesterday (through trying it), that also MDSS is broken
> >> > since the no-IOMMU codepath was removed from drm/msm. I thought this was
> >> > only affecting GPU but it's also affecting MDSS/MDP5 :(
> >> > 
> >> > So I guess no panel enablement anytime soon until the IOMMU situation is
> >> > sorted out, for both 8226 and 8974...
> >> 
> >> If you're sure the panel drivers are good (e.g. they worked on 6.whatever
> >> prior to drm/msm saying sayonara to carveout), I think no one would object
> >> to have them merged separately, so that you don't have to wait until
> >> who-knows-when and keep rebasing them by hand
> >
> > +1. Please submit them and cc me so that I don't miss those.
> 
> Including dts?

Up to you.

> The drivers themselves are bog-standard, I've generated them with
> linux-mdss-dsi-panel-driver-generator like it's done for most qcom
> phones/devices.

Getting panel drivers in would remove at least two patches from your
tree, would also lower the technical debt, etc.

From my PoV, I'm perfectly fine with submitting the panel drivers which
worked with the upstream kernels right before breaking the !IOMMU case
for MDP5 or which work currently with the relevant patchset being
reverted (although I assume it becomes more and more difficult).

Yes, it doesn't match our typical 'please test with the latest kernel'
mantra, but I think it is a good enough testing case (unless any of DRM
maintainers would tell me that I'm wrong here).

> 
> But I can work on it.

That would be appreciated. As we discussed at FOSDEM, I will attempt
taking a look at the IOMMU for those platforms once I have time
(currently I have about two major tasks and several smaller issues
before I can start looking at it, but it is in the queue).

-- 
With best wishes
Dmitry

