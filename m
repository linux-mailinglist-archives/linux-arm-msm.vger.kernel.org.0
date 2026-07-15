Return-Path: <linux-arm-msm+bounces-119190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WMyYFJNUV2qOJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:36:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D28CD75C8E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:36:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KH36m19v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bnoULkI8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119190-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119190-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B9823034310
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496E4432BC5;
	Wed, 15 Jul 2026 09:31:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71E94302FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:31:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107899; cv=none; b=RQRhi9Yyn1kry5SBAwiourk643P2otwqgjIXWRG7GqKvh7eI6fq5Qg2mfTnZjCnZs3T2d04Xfbjhsgshebcp8ODe0YWf8V0YuVeVjtQui2aNSB2E2o8eTWRstTnuXPj8h5aV4bHDnwN45MnjyJvE99/4cohGJdWgw6v91xaF31A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107899; c=relaxed/simple;
	bh=xPtwZi5RwdtRu4PFwA4mNzCB+LYFKWcb6NhfJw9qcfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJIu3/iyPSa9OeuJvonjThrWZrR87NED6JGmZcSmJabF4Ug/sEMJM/4H6eJFycqC/S9R4j5JC9qiWaFn5K+Bl08ulsb27iAyqWezIAUkf7QbrIYrwIAlMNy8gmOrqUOmuOP0tRz9EccTOConHCTlRfbBl+REFNLUvtURcD6mAHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KH36m19v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnoULkI8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9RO0V3144480
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9a+h5TbfD3DZbvHIMi092MFcSpBlC/pDu2Yq75Eu+s=; b=KH36m19vgGV5HK/M
	w7RV8ACfKQtySVJAuWLU1P62NPNnJuSJUND6v6aoFqcAHuBGroi92gm73Wrrlwtd
	EvL/UEG9L3mVgVuKW6IUxYEVdorxW2T+6ueEDXM/2qz+sgo7DJo9b35tUcGhPxo/
	4HSZQ938O+/Mm2bv8WRS0xbPq8+HwSQw0E0Sbe/PIA9aCQTZPO7Mh3zVBeJila8m
	qMfWQvEmhhNEeYXAk4k0ZPzb0OJszsIndxSqGRs06U5wFEpmb9hedHL/uTVmFf2s
	L+KCtPV5nkdAM0CqNWhaQb4JtKPTjsiUlY3bSV7iiPpricoFgZoCNpLgSwXNhgrU
	b651VQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka80m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:31:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-734bafc2646so101091137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784107890; x=1784712690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9a+h5TbfD3DZbvHIMi092MFcSpBlC/pDu2Yq75Eu+s=;
        b=bnoULkI8wTwnTdhpaC0OgbXEuWMxXuouFZ/nerip/j5u7G5bavXQPkhyqHYFy5c4Si
         GTMaXonvQLDv2xy+Hy6aKfBH3NQ2aFwLVOBE4HwHggJbHgZttjQw4vuyFrzdRiNeXffi
         Pe3iHr4NseoZfHDjWQsPOnJThUvOSo4mvIKRoMSV471XT11Q2CDj316cRFF6y124ngbl
         MU5/rdF/aAfuSEqx8WorqeTly6sXTmkpZOU83KjaAF17xmcAojHhCzTHPjeb4AY9MbwK
         Za7tM1HB6TKTRpgXjB/vqHkuBpwqjJO2FPAjBjPuBuFJEFJlhEDfkwjK8R7knxPGz0yG
         hxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107890; x=1784712690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9a+h5TbfD3DZbvHIMi092MFcSpBlC/pDu2Yq75Eu+s=;
        b=nVzrHV+Wx0gtGHr5d2tVWxiVrZemFX8LuaICo4UIOenOUsPdX00nZ21HfbwURcHJbl
         tZRikJjfJgqykyHqdClK/NLGWsTTvLcWt3Qm8UNRJqKzwHYKRa6CZH6sCyyBnF5T2ePQ
         8ZVP8nD+caNq7WWLOOS/DCcGs7uSutiMxP+PS6JytHR2W8AkvnrJ0Zr+viW+etv+Nejb
         HmocDr9BC8seM7aNM8KL/TGEUyIOm0WdHwO0/77SY+a5OpJCarRv0xOuDf+mgo8Ij1vS
         sjCtxsw2gvjWpLrmt89/Oq/QihImnyNUSggdRtsNWoMavDdaMB5nYydy86An53aWu0li
         JuCA==
X-Gm-Message-State: AOJu0YwyLucukN6busHC27DHXvh+HM4zfbpKBLYWZ8Kn0mjG4eKmgbxu
	5b8EpZv1k5o68Id8ENaesvWQeZ69hN7cO2JU2UFIsgzFu+ab1yj0XQHpQvJTyG7jFc4k9YvZjqK
	88jviItCyZ5RVGPmxFIaQN4E4q+M5Z6/AwD4jgiOzSALoOwiI0leVWkxO+RwS0H2S437b
X-Gm-Gg: AfdE7cl2EnuKlfiN+Oc4WyaqE4iyW/1q7MM39a8fyvrTeW6ZKwZc9VZiHXb5eHi7ycE
	b2LMzDLxbDhaSA0stCk+m+23fvDGqxhTuzS5U9v1AbZW7D6R+oYyqsfAWefAyko3+aAquMAFbrQ
	22u4DctgF6cQl1YRfDKJ9NICGcR/8laPkT+IQrQIgCKnLGKXUORQXC4001ATW+xkxKmqWifX6re
	v49HJq3g37Bq8QSfyFm0JxPlAhzFDJe4weNtTIhPKClkOaLx/vgRXhAuZ0Az6QiDePMiGMFd3yA
	gDt07pxu+IQWGJOSwyIjADQo/86/jPQ7v9RMwAFxKNRYxJVHDQ6ecuG9aqYvte1HFJDu4AQYc8h
	iTxckh5Yw1nc14Gv9D3Mw15XPK06pLeCJoLk=
X-Received: by 2002:a05:6102:5e85:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74533b1aa72mr3923448137.1.1784107889870;
        Wed, 15 Jul 2026 02:31:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5e85:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74533b1aa72mr3923434137.1.1784107889467;
        Wed, 15 Jul 2026 02:31:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd288757esm2743992a12.9.2026.07.15.02.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:31:27 -0700 (PDT)
Message-ID: <40404aa6-7822-4c65-abdf-0ecf1fa073cc@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:31:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status
 before configuring
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a575372 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mfgDh_fDUIA9-y0A_ioA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ShQgSAnKm2BHId1upw0WWw6UVMbUYh-m
X-Proofpoint-ORIG-GUID: ShQgSAnKm2BHId1upw0WWw6UVMbUYh-m
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MSBTYWx0ZWRfX9bq1K15zuqwu
 4PeLUJPwdzQEhzui2UWz071IHv/zOTtZz9jqtVS7ONMK0Qgm2bi7VzivWclAGJ/Onzr2CDt3vpH
 Cvn1V0yf+aP9qosxO4pdICSyIkmGBAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MSBTYWx0ZWRfXy1u8Lah4mep4
 tNeDEPzreRkBtn0Rns7O/VJxL7meIItuiw4Z9GopinkAGMlKp2WUASSashD213qgquDnKdfkPUI
 S6JdJSH1YOpO0VumGJ05cZgZWpSnyYhf6ZHGxrKI/t7O6RewEjMw6v/lyO0YZGmO4bDJwND8yxD
 zNZQHbKffVveHqRdr7roNZJLaWkFqEWjH+B/0G77QQLliJ7gbKeADDeUN3DUq/Uo4rJaS43gz+W
 +2OP1zcN2/VSF/LtvY7hsEP5jLCfTlgE8IbE8V8Oqg0Rf210e9kyrZGZQwblL1DG9FqQMjhAXN8
 JlZpaXpxyAzFdBewEwnAiAmsVeT9+FUyIns/pyNDwNdAYnMljSQaFr7n80cfvDKGeGnrF6RfSCV
 wQv1NVSQ9I3MBGOWRgC5ZJJMR4SM+Xqbfh9x3NtnNUg7fJykYcze1BK1hSUyKQNgJIbZYRk4DF0
 +sQXMkuJyRai9RjYozw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119190-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D28CD75C8E3

On 7/14/26 5:28 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> On some platforms such as SM8475, not doing this may result in graphical
> glitches when the mdss driver takes over.
> This fixes the aforementioned issue.
> 
> Fixes: 3132a9a11e57 ("clk: qcom: clk-alpha-pll: Add support for lucid ole pll configure")
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

