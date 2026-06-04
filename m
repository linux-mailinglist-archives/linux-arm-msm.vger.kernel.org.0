Return-Path: <linux-arm-msm+bounces-111229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8JJrByWnIWqnKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:26:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15271641D11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:26:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OLUhXK30;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cr81UaSM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111229-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111229-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B77C33061335
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7527D3E024B;
	Thu,  4 Jun 2026 16:10:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F0B391E55
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 16:10:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589431; cv=none; b=bYsmy2bS4EZH2KPI+P6iiopUc2c8n3VQphCv7F4UM1V9WUPkmXNVh0xi4POObFzuiCvLiO7bWlsJat8tnC7OYtx2tQiuktPVxYpiL69G9Gz0kcTOr7tqjTc1YtIKHaMbRpfu/eT0HOeJVEIetUFJesoXFEr7pFghGIkgMPlzMlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589431; c=relaxed/simple;
	bh=If0OESBCReNUYpJqn20IcHKO5ke2Vw7Nimz8q//Qmv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRaqfF4jL4V1fsd+tzV23HYeYuWbHKF/O3Yqf7AX8oRQ8Ug9fpf/QdFiVwrSB9cQ1JaLhBToaczCc2noBaNMmCk2PoGlOZr38wJuaTsq4mYqF7szNvlAsVfnPEvkMCn8HPmuGhmNNHMKxkJhLIWinBi2qd+piIf0v+duBBuGnvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLUhXK30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cr81UaSM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654CgLBH2477970
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 16:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CeMRJDCQY83lNXXkwFNAye2a
	Lcac1O6JbkIjmAjjFKk=; b=OLUhXK30beS50RPLiM3dr/ppd4XXs1mcrm0qbFtp
	URKwTA5UCkyA+l5Qqcz4GTAuI7xvO06qsVyKfuM5rtf7m9QRk2N3rT2Zht2XP/aH
	FNX4pV9AksqQsqfATOyU/2D3+HscZiuNzZnhzdtWV4vB+Y1ZQdZbJPYiV5OQ06s7
	hMV96SnhDxEng4rNZwfOvm6dePsdhGoIAqRPXDx27PMz3gYM7l4UV0CdtS3c7yaC
	BHe5SFyx9SyMppYAqt0a4TID97erKNj5K+YS1CxD6IkTDGJfXY+7nI19CMEIbtJs
	lAbByvBLNh2m7HiIva7hWn/JXtrGgM5FxRQzmUea2AFKrg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvja17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 16:10:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6ee0bfb5681so1179554137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589429; x=1781194229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CeMRJDCQY83lNXXkwFNAye2aLcac1O6JbkIjmAjjFKk=;
        b=cr81UaSM+gLW0uwRw5WeHZxP2T8vDhLUZuw8cFo1blPwiFbcbe9M5UhqK3ZyuChB4X
         Yi74lGfPmaoL3ZxYvw20qYhiBXD1CYmlJBJE5wohp2ASZoKEX19rG7jxdLEnO1NDauYb
         ZOP7WZpYf3dmN4iEZ/4+Dxyt3urkEohcIDqdpp8lb9gl17tybYobgp8ubexfiuu36VEW
         Wl7gJ+0IPm5sriZMHLdJwHV9KHMj3WE19a2KbQpDem5pO/1dDdEh6UOAUQZX/sCDJ7jD
         Z6bjHbV4uby6dnxxpyjDPz6rhZR7nuIASWSj1a7SakszbWGaZ0QYSU65VOefgNL3lyhb
         JPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589429; x=1781194229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeMRJDCQY83lNXXkwFNAye2aLcac1O6JbkIjmAjjFKk=;
        b=LtLV4EMeG3lJmO6/YjJ3JxbjIwhXroEHH/sN2MLudSFx3IHdOsz4pRV5qwIabRzGeq
         5lY3f0idgW5qemMtyawf67UO08LBqdk532cMDdiHADia0M3ZQJe3f0E6P888tuGd8ipF
         Oa+h10AhiSB0SSAWz+CyOZMo9IFjgcsZgZSBO1HiUCgIanaTyWxJmkgyk/IJFkAZf5r8
         ydnVx7hA1Z2QPdUB0Q1WT4qDJLiNr+YgIWoxkta3CHeUduQMsg09GUsJLwGOtjkQdwN9
         ORbuDwQ9QIkAfTky+dqfjHuvC4mMyc73WFX04+ZBRAb7YqzRnkiPBjUAwJYaPU8vrxk5
         6wBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mZLIOxkTeL+DGmimz7431qAu6cC4qa7zMRbGXKSBMQF1h3+8OTvJqcIieDn+em07W5C8rLicyrzgBwKcl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcd/ALoKXJK//Eu4/+WE9RXdyW084OHXsVHvDyIOAQ+6pm+agM
	V1jxlZFTm3vdz+TqrijD/MBGN4doJwsv7Cmom0NOXCcTxiOidHb0eC1bELSKfUanVTkpTrbgMyU
	7IRg+AHJlwLIyCabAQFpXnvz0IS5dG0eAl2NH/EquZntDRZo/J6B3gJDtUrpJS0kjlnt1
X-Gm-Gg: Acq92OFxPWEJpJxRktj/ENkvW0C/7exTPvXxIJNMsffTH65lb2M1P1MutbCpC5EkPXJ
	GABTfF6Jpoz+0C8gjIWAZ/xLOdDEoA6r8gomN5ykzXBGfU/5e/VTGy6S+QewbF+ZuTrwt72xx5B
	PpfhzZQNk0oH842+o1PMFGiJnGAfo3WHudwwL4hKdI24qPg9Z60YMDcZk3O13t+czHkzO2nHj8Q
	oyPsR3vSpJ21ejXcn0YZfV8c6GbMr39nMY9vah+7Qgf7W7xCLY9uGeK7/fwCPQjdUlzielQfflD
	Xdbmx4Ew+asQZRJ7BkY2hjjgVbjmfAewEmatyWZDeSnV9lnvZFvxE9rn/Mx5tuD+jTr9lv/NM3M
	w7QcSH7gQlp3/KHty7OcjAEHfL1dYxojTQcn+MAsuaB3l4ZaRqROPqYxKjrCZEuM3Pskgf6atr/
	8J+CGMcDqJgZwo8MGdBcd9NAA+aMuszdT/1/uxVpRy/DgRQA==
X-Received: by 2002:a05:6102:510f:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-6ec53921cbemr5468265137.4.1780589428650;
        Thu, 04 Jun 2026 09:10:28 -0700 (PDT)
X-Received: by 2002:a05:6102:510f:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-6ec53921cbemr5468225137.4.1780589428228;
        Thu, 04 Jun 2026 09:10:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm18215101fa.22.2026.06.04.09.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:10:26 -0700 (PDT)
Date: Thu, 4 Jun 2026 19:10:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <v5dbtuys3oojjmmpce4j46mgbegacs5ngtjrszvhz47fjjshbs@d4gotpult7p6>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
 <20260529-milos-iris-v2-2-7a763d7195ae@pm.me>
 <a17e8272-b8c9-e6b6-6f5f-adf3f0f91424@oss.qualcomm.com>
 <-iGUTQXDwv82wFFK24QU_oAgyyu3JMeq8V9nMKTafEPcC_McchQEW7T7npIOkggJPXY_K6SogruAf5pZtqG26-WyaGN7ItBR-J_9CGOHH1o=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <-iGUTQXDwv82wFFK24QU_oAgyyu3JMeq8V9nMKTafEPcC_McchQEW7T7npIOkggJPXY_K6SogruAf5pZtqG26-WyaGN7ItBR-J_9CGOHH1o=@pm.me>
X-Proofpoint-GUID: _JcCEAiPeFZvI289J3A4Fr9LvtH_x5sH
X-Proofpoint-ORIG-GUID: _JcCEAiPeFZvI289J3A4Fr9LvtH_x5sH
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a21a375 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dEnjAziRAYfcju0Vu8kA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1OCBTYWx0ZWRfX6Kq8HEL4M+QU
 SKU+u1C4E9YMhImy1YuWwbAEIUxxuy5q5Lj2+H7vGAzHAXgMYdlgm+xFES4aBNUemeIecKTpsys
 xuN/GfIcWt3WIH28zS4wI0HudZilgXB7Ywn2+GMc7TCbtRyaWXnln49HcB5mrJtI7lhPPJlVrhG
 mgLGx97rNtnNgsm8wSU8ovNFcz7ygfGKkjAAgDVqf5Q8X8jyNACOBGsbWBvhfpdwaTNXJh3Or3q
 g217VUDVw9a9wBNI2sA7JV4DIzp0ZkOp8gY/1Cj9zkCYS4FkKx0mu3FJo2FWnDKTnCW5MaSTx0s
 HefjtfI9r7gQ7hNSaGLb8JJCwZn9vvOo9Uap43eMiOaN/iqFEUXqEdyK/1llS0G0LxB1+gsEPvG
 fkWvFKXSabxD0MF+XZDFx/ibk3VsirftD6oaQEpVjR4fwv04lesONGYOOm9OjK5YFlQjQc4pfRU
 wH3giUITGDrjDc283sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111229-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,d4gotpult7p6:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15271641D11

On Thu, Jun 04, 2026 at 02:04:42PM +0000, Alexander Koskovich wrote:
> On Thursday, June 4th, 2026 at 8:16 AM, Vishnu Reddy <busanna.reddy@oss.qualcomm.com> wrote:
> 
> > 
> > On 5/30/2026 2:28 AM, Alexander Koskovich wrote:
> > > Add support for the Milos Iris codec. This only supports the variant
> > > found on the SM7635-AB that has half of it's pipes disabled via efuse.
> >
> > This patch appears to be based on an older codebase. There are changes already
> > merged in this file prior to your submission. Please work on latest code base.
> 
> I rebased on top of 7.1.0-rc5 before submitting, should I rebase on linux-next
> instead?

YEs, please. You are basically past one cycle of the changes.

-- 
With best wishes
Dmitry

