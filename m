Return-Path: <linux-arm-msm+bounces-110967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZJ6lMRglIGpexQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:59:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 237FA637C82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:59:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CofqQoNX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gRl1x1MV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110967-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110967-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 359303003614
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4623C769F;
	Wed,  3 Jun 2026 12:53:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3B92264A7
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:53:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491205; cv=none; b=s43yFpwdbgaIPLVdqvwp1VEROIRvnPI2jkoUWFyVbFDBoRVPsV5P62TWxuH15hkmagCWpmx+z4x46OnmovJQ9gY/z07T2UBC2ySqoqK55wZkS01FrdbmzyJ73oJhlN9rDmPZUZJWpy6z86/f7pKUxBY3B2nuxaDMF7uro2eTjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491205; c=relaxed/simple;
	bh=2CR0Nxo/LHhSwkjcrEkBeCqOaHQ2ASUZ2dBUfobv+EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/J6fmvRuIrzWwrzjXvI+hZoiYh7bbXsKXfhfz3ir9vjK+a252DZxTztneYUtprAXRa3rRtsAOrXJkMZMtsZ++em4baDbiU2hlUlbNRxgJhWAf3Lo/vWQA7oCm3Cn0e8RUQTsYOBPOwfQn1yKsWu5fT1VxA9Pw6LcoJDTfLE6nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CofqQoNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRl1x1MV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RKEi3077828
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2CR0Nxo/LHhSwkjcrEkBeCqOaHQ2ASUZ2dBUfobv+EQ=; b=CofqQoNXQIWnE4rP
	BF4xw5mIl3DXIbLEvTMEfYQgI55z4M1K9l7Oi8AP2rUGYFsIJpEX74Vh8PdILBAz
	uADOxedsFaCjNv6CA+/XfXlsHRRa9pXEnhvVq8K0Y/PHyOcnyp8QvMr7lKUshV8H
	jDgf3neqtxqwyoVuWACgHNo0pzHtdLiSj+JuUqsh1oihGntY2ICqbsYlOEIw23Uz
	lu2niPYcuKStlMZKtgfEqH8zXCNU2HIeyN6hDpf0Lynw0K+PI4tjaLiA4tJ1pbBl
	Gdm1aJ3oBIZkiyCA5s0n/tywldtYFJrJpAONWN0VnLgx3RGYXkvBUlR59xCEV/m5
	ZSV2kQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbthnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:53:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517796be724so2360291cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780491203; x=1781096003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CR0Nxo/LHhSwkjcrEkBeCqOaHQ2ASUZ2dBUfobv+EQ=;
        b=gRl1x1MVzsEsnKurJz1vv8CMzM1EDP9Q26UMdv/hNew1JnVAoNlK4QzeuIuHTcnYCz
         4Kd4KI7s/u7ysjvWG1JStZQRguu2GlY5lBiSYRxkPjexHKEM4YNiVvLWmDPbfAwqi2F1
         e54+eFizrFjf/gYCxNJr95rJjz7hcjpTV0vxL2f0ZVUWz5IAgNdyMuKniifXrjAhw341
         kVBUIh2xSk7pgvBE5ZFmgQTi4ebYyM8wE5N1gDS12UillaArEkniZ/Ocgy39gm5c7cKj
         p6Ci1G0ONLvewhk9jKLuC+tbr+bt1e6WcngqdBTw1DmQPmfqiVo8RTV97ms2z4I4Zg16
         X1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491203; x=1781096003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CR0Nxo/LHhSwkjcrEkBeCqOaHQ2ASUZ2dBUfobv+EQ=;
        b=XRUQ5W1LK28aIBLXEw1LFjbcngBmSmvGZB/za7YBDksrvkEZ+qrUSevPtXKiu8UX1h
         2F8GLb1ADhPuUEIDYgZnjfdWqC0wsuEK6OAPYT28ynWj/i4ai5/zgGHCVezQfMY6xg1k
         chOvsEllXTkLNJdRK81fq0TRI7nQ9iMcwyBcZ4rk5xIhZv6bUeiA0CYDoYszK4ce2DZP
         nagYd+sGZcObRsFFhdxwHRrd1A868gGlwOrRioxCUX3Nqa/QUP4IkaLN4rqYZ4lj3Woi
         dsCm+oVgUqG0zXImMXfDDP3aRR0xPIz6aOIeKhzVamR36gpA97eJZn/akuDwxBWTSK21
         PZSA==
X-Forwarded-Encrypted: i=1; AFNElJ9BgXOtIIuQ/iP4o1VLrAevgdDJ8W8T0uqWFRVLT6QnoO70oLovtQsnqGHqxYZ1XKZq2bAq+vdQAWiyhr4v@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiZ3wK7xNTXtUJiPLUoGAL63NMqFgMCIJmfSu8e8dBqjm43Bd
	eB3PDe7RpMUYidG5JK4m6YDb5JPKe+cvOe5xVHgN5o84j2DNM5wRB9jeEAzMImnoohP2Tj5ZxFv
	ztcmRmIVxlMDPXxD3oaNi2p8yBrE28wo1DVxhMiP0YtcCQcC1jFQBYxwaPXhRW1TbXLGj
X-Gm-Gg: Acq92OHQAq5+/LxtlN4bTjfdVb8x9G9GkTVgHuN7LcxcksmsdekALfkW1Th6VKNojKf
	zFdOwwNZPXFb68vPaqTgKt+6PWCQVhGYAigA9zaBMYUQTeEipNICiUsuxELvzd/5kgh6J+8q2mQ
	WiwRQfau1phLU7QkMhv7jz90tqPHIgsX4+iesXH17d2h9CrnAfLNljgKnsiG44YV9uGlKIzWCDl
	dy3j4Msfx7DvA4ZjKKGhcnyyMoc2rVrsVh/0NiqN87920OdmvEiDQnYqNI2hysEm4kexLXt7iub
	/d9moqBIRWnb4to9Nkm++oKDBruHbleiuPtECUOr15cSdvZ3Kfyj2kGmF+oLihFdem4reaVH5nH
	AtDXxpF2jTNKoMdv88S7Dii6tVLkdKTQFpqYgaKL8sNmhXF82Dw5hGGjK2yWNo4HEJI/a+4cxKz
	2DIPhzgmm28to=
X-Received: by 2002:ac8:5814:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-5177830b1a0mr35058381cf.3.1780491202675;
        Wed, 03 Jun 2026 05:53:22 -0700 (PDT)
X-Received: by 2002:ac8:5814:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-5177830b1a0mr35058011cf.3.1780491202306;
        Wed, 03 Jun 2026 05:53:22 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05177150esm152678766b.5.2026.06.03.05.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:53:21 -0700 (PDT)
Message-ID: <fb536e99-7868-4d79-9d00-b422e831b9f8@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:53:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] qcom: x1: GAMMA_LUT corruption on DPMS wake
To: Daniel J Blueman <daniel@quora.org>, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Val Packett <val@packett.cool>,
        Steev Klimaszewski <threeway@gmail.com>
References: <CAMVG2st2udHCUHZ_2j=jNmwTAVi2Cvda0qGgH4tDZHwsGVfLKQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMVG2st2udHCUHZ_2j=jNmwTAVi2Cvda0qGgH4tDZHwsGVfLKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyMyBTYWx0ZWRfX6Tr+dcpvLsq3
 v+4Wm9nw9QbJcEdzv5bixKeJ3DBoPJDCXUbGoTk3KGFhnfJtCsR8duPWbCsjWttmeLAr5jzIuNv
 F2ixhncmiLcoApPVOKpBDdHKfJmfN/l8a02fOVXvK8N0heCgPeRs3dybduf929a6MsQZzr1Q6Gx
 adYlYChFMburpPSvjovsduC9+IVoQbKqUt31TRKVz1/A4t7wlte0M9xBKSJ0lbvow+FXXF+JBkR
 TXOgEwMKTsvW/RBGKcyKLncHO9Xy5pfJa/EI1TSdLOSD27yZB5Ossi/oMv640+lUdbH6Zx0ZdUh
 wK3mCroeIQrwn9oT1he41ifSGZvWyldW3doG/7vnsy4DHI05KT2a2vuk41vKE9byi/yrsn4wcXd
 kCkp56TkU+iAeS29EylF3idf+4tK8fgtU8FgCaqs5BlOelXRypqML/dM56QAodITkjw4T4wn2Eq
 HnmYnBYLT0XpTqj1qaA==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a2023c3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=zIC3kcA1p7w0c6vzSjUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5bBQZANcjrgIEKt7G29ntsMooJER-Nib
X-Proofpoint-GUID: 5bBQZANcjrgIEKt7G29ntsMooJER-Nib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-110967-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[quora.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:linux-arm-msm@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jun.nie@linaro.org,m:krzk@kernel.org,m:abel.vesa@oss.qualcomm.com,m:federico@izzo.pro,m:neil.armstrong@linaro.org,m:thomas.weissschuh@linutronix.de,m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,m:threeway@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,kernel.org,oss.qualcomm.com,izzo.pro,linutronix.de,infradead.org,vger.kernel.org,packett.cool];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 237FA637C82



On 01-Jun-26 07:37, Daniel J Blueman wrote:
> Since Adreno X1-85 GAMMA_LUT support was introduced in Linux v7.0 (eg
> Ubuntu 26.04), when waking from DPMS-off, palette corruption is
> frequently seen; this manifests as purple banding. If GNOME night
> light or similar is enabled, the visual impact is greater.

This is not a very useful reply, but FYI Adreno is the GPU part,
which is wholly separate from the display engine (which we refer
to as DPU)

Konrad

