Return-Path: <linux-arm-msm+bounces-114806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xpMDKEClQWr9swkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:50:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF616D52EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:50:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AfyvBxRy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OgbMYe2E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114806-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114806-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9761300D31B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 22:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8D6372063;
	Sun, 28 Jun 2026 22:50:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3625B36827E
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:50:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687038; cv=none; b=F67GkiwrCHhY8QFqPxoefs2tZNzIbu4zI/ljMmYIKJL+kGdMKv+wjT6o4266rOXm6TyL45lIN/wxemylCOhGtpPa5G9kXBVqPGnwzUJ9gpCjnRtdPyjRIlvhXuBrZjTBGqOXtObd1Ilx8VoYx3rvGIiK6aN6XOpEXd1THYChcFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687038; c=relaxed/simple;
	bh=Jur/ubW0ogvxkz0KX+X5lU+2n2LljLpFE8n2inLrwdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJzJEqxQSsjUAgkpRbprhGbflySBBct9EkQ7R1wVZBtaM/MrVn9pVa73foxknNpazwWf+UMCP7Z7K9q5W9MqgZ/n+gfsiFBhFXMvlWY0Qjz17E+vOBgQVQOX6CppDjoqaIcGdmuqZMTTlNBOXMSuiPLGE2fMnvMMNE/JVOOn368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfyvBxRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgbMYe2E; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM93Ep955941
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j+vRFFpc+G0V53boa1pioH5l
	DzLNJAkcW+8BSOZcbSo=; b=AfyvBxRyo223qh0kt1HewpkBVIixQE6iJJrQUJza
	vsmwNGZOG5cYLbBgLndEco7RgaWs0/yUywvC5ebhj6yxuVqK/vIze/f0WziDgmyj
	Uexv0Ml2PkT35spCildFcWgRVwnp8m2PlwPMeJ3X7E7SnVPDduJMqvGJPX4lmy5Y
	8nexKvYyJXWUK22nvWwwt+NJcmHxL0CsdZ2SlWlj/NPro+lH3ogUSH01IWDj9B4i
	PDjSjeFltWdBN8jG2+xCIiNusLf1frOEgM5tLGKsXZoZCb+mMs1byPLLZr3fpyEJ
	fuPmbfafA0PyipaSZ4vDSOfjFoiEI3H6JoGnMP3sQ1FD7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cknff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:50:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55721a8cso12936585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687035; x=1783291835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+vRFFpc+G0V53boa1pioH5lDzLNJAkcW+8BSOZcbSo=;
        b=OgbMYe2EoMAUwrwF0tiOUUeiq6bgoHOC0LzO6vktDZ5w3Xjjbe6eLbUAOJ63qNK1ns
         nKzljRnw4b+BRIFpOPT4JuT5SuiWGeEYaCJMH0KrUkklQgcNhnt6O5JJgU9yGb8TEqdG
         23/vS1mzKJv/qdD9s4wKEPzES/l4TXAjPeQMrbrOeyDEBgWGEgqpI+M8NON4MTGKU3Ea
         2NloUVZUIlACnD3ImAxywFQloWnCtGydQmy60isUNXbZQ/wPENvhAGKGBsoNC7JyqnM1
         nneoUzybHKevR8k2gmji59BS0e0PkGK846cFch0fd44gnT+jUj5IWjtKW2+JJWg6GCUe
         bYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687035; x=1783291835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+vRFFpc+G0V53boa1pioH5lDzLNJAkcW+8BSOZcbSo=;
        b=MbtTBBtwjBUrm0HfAF5nJUWJyIK9CursqaatKVeRcF3EzbptaTfbzU9y9W8dnlJ5J9
         F/b+0HDcgY8uQ0Mx9e+2dRk+VdRFN1Trwr2by97Xw8uUdOf8SF68jfaWmAZ+OOle00OH
         f3CbM1uJImwTBUMvcON9wgpVYxUwM5XacaKcSMXk13eknOqUbgB4qO/0appJj6JHa62H
         HSYBKuUkYMqp5WVkUhygSRMismLdwCbMYEao65Yu2duVq0K4holQ0TX8TvxIzJ2Cokif
         ZyMwtkuWN2JYAH4Wo69UcvcnXWO5g1g9c+kOLtQYZekJ2AvCDkgBcmpuoznNdoC6QPTp
         exiw==
X-Forwarded-Encrypted: i=1; AFNElJ9OMqa7ArYSt8MVlzdsWykZKdVF48wX7RcoQau2cGfmMsEzkyIzfAgu9/YvSjdINM/+cPi3UevudOK7eW0R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1vazVOyOpJj8CxkUAgwdS5B2DyEY8VBT0PC5VMT2RzTJQOysV
	HAx+NIHydmy9isbAzJ93XP7T5TMW8DI2x/8LLoxyBmrGY/cpdWBA5ABAddJ58OWm0xDdmp7s4BS
	6vjyqDLHXIHDGFhP12I4zcRDgCvBP638rpwgZzqlgUpfZGpB34Lxd2ASvqJR0BQRHBvId
X-Gm-Gg: AfdE7cnGbyr10NGqLPJsd8WYzBg/SAawjFxOgglqLoVWXcUu8ONGazexkDQzvBDwbh/
	0K1AAEcKo4zIEsZoSVTlu7KQmNhRy7oWzmr1Go2dppAf3LelieQZbxPODf/1FXb0odLobnSF14+
	zDWEEVQvjXeWh1mL+hweCAJgdPDKAkMlcSTdTrKCB/B9Ga0+EQiPH6diZk1JnUtcBohkgwRa5tY
	BWNQIfoYXiEjjntNhAnMlgZ++P49huaOY9Ogk/yVqt4mDcniH9vZEjKTWPzZOVSYq61/Hmc/OC8
	ZJVPsg2Yi3nFKXswUfLImDQoBNXgnwEM07wJgQZeF2MMWgSY3URtWe2Hm3WSfOvX44vkfDerFEy
	Kw7exn1b/aZqNHI4CbcsXXieBmfh6x/1Ten8mJVN1n18DogCLsMiq0oPYtiOnB+9RJKleEoFQP3
	/KUyOe5dMf/Bs1MwJRYQb8L9Ks
X-Received: by 2002:a05:620a:4153:b0:90c:be8b:3676 with SMTP id af79cd13be357-92b3ee65133mr1273573285a.56.1782687035224;
        Sun, 28 Jun 2026 15:50:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:90c:be8b:3676 with SMTP id af79cd13be357-92b3ee65133mr1273569285a.56.1782687034719;
        Sun, 28 Jun 2026 15:50:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a8b6sm5337343e87.39.2026.06.28.15.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:50:32 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: shikra: Add A704 GPU support
Message-ID: <n3ttyffbsve56cba4x4texugczjkogkv534rjvw643sbqjgcee@iktjvgiqzffy>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a41a53c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfX26QJTHWEro5Y
 wLFEFJRYZD5bSjVgl1GG67hON4+r0Gdzpr/slrwx+STK+kcZ9ZfWTHOThRqLVz/JSBbTFD8cTey
 SCSzvFp/1K6vapImLpxb7Gh95C8Nihw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfX/+AIAe8HiBts
 wi6KZ8UQiqAWvZBzAiniyyOSSLw2AsR91kNRyLzR4XD4AGk5tJmehLlRyD2M+u17gT60bSO2kv4
 Hc63aDxeI2dKKjkEJAJ36xDcMq5NwRmfossYdVgvxrXKH8Me9DK3pF2Vdm0DdAaXHncUcmu6BaL
 IhgL+V3O8WTGgsvFgR0PWrG6YYhwh/l0uRpHC4hc29j6RfzUQs6xKGoGJ9GDplpa2mzsVdJ3m7w
 BgPugOUzIsDGNrg4RiWpCZz5eqebOMU50oGv6a7y8TYZ84Jmb0X5JHuc/YNIT015qhMa2nBN6h8
 ScpqlkznPPxJrZSrDu6I94cfsq2Lq1WtmOMaqaIq+aI3y6SNGCk9dS0l687A5eQASsEOGlQpndk
 yX40aiThvZdY9YKE8H/mGfJIZDDQ/IHwD25F6CknCFKy6x9jImyGQPvWSzWLqkWXcuW0oJlUYAz
 6LhfUUeFOe5I0YSG4lA==
X-Proofpoint-GUID: NhSV6LH6xAnirF-c7xzowE1UoZOK9DlE
X-Proofpoint-ORIG-GUID: NhSV6LH6xAnirF-c7xzowE1UoZOK9DlE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114806-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,qti.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFF616D52EC

On Sun, Jun 28, 2026 at 11:53:58PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
> interconnects, IOMMU, OPP table and the zap-shader region.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

