Return-Path: <linux-arm-msm+bounces-117321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 57s1GiD/TGratAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:29:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2AB71BE74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WuIfxalh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NnJOYeBp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117321-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117321-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7EFD30D421E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72545417366;
	Tue,  7 Jul 2026 13:22:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E83F5BE5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:22:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430545; cv=none; b=Q4UmpzIz4jQWiOpljPMvNTI5j5ZAaJV4P80GqcJpXWopz4Mg9++O9ZW4ukfP/oemEaGzBPJkRZ+51QiGwhrkPHsmme2RRm00yV1nLZnAk4XbbIPIuQ/fUd/VjBlB7gJp1ioPJHUG++tp5hYx9ll+tXbS8wEiAq0aUTIuOBabTaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430545; c=relaxed/simple;
	bh=JLUVtpAcR7Sw3pbtVQgfJbUd6mFFYioquXqjBsVIPE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb7wwlYLgqrQ+iFmvZHo8oo9IehsF5jPQBNsmIXmhQ8aGz2LGsh+eTB8QDbvc3nlr9FrxeiNhdgI/kcBOhe0Z9iPFayZUih06E1kAz7YpbZ/+Qt/qqDH7AwZgcq2PhdXgp24oGllXo11fDHShWyzUf4/MCo1CAeztFWC6LCIFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuIfxalh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnJOYeBp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8VGS3741871
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmiOWeVXgmFMOpD0RMG3VxxL7rn3EHP1lcppg4A4U0A=; b=WuIfxalh9GeqxVmK
	LeN87fp4gUh4Wd7ecw9aOrJf5lFttjyOj5QZ9Tt6KQbbkx15dpHWRB19m+2+EHsj
	+eNqrHUtxFlZdO5gD5hH1aJo8d+1hnE3+VwS4xyssoqHNcdyAGcXMDO7GH8FxJRT
	M/szL0fFkYSbmrslQ70RRhow4A4jiXx1zthcl62e5HB4w84R8H4FPTtzUtkl/Q46
	ZoKSGFJ2qiG6YewzVwULSaIylOAgw+MAkK/OmfSfMGXyRlYTEt9pEBD2Pb0euUP3
	6b+wEN86NLLRmMRuTCZaLX1DSfPlQKfaBxptBlA+6PgAqBUyZIOzTJslZ4tXESRT
	ZGgcRA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0gqsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:22:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a5cef4811so998048137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430542; x=1784035342; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmiOWeVXgmFMOpD0RMG3VxxL7rn3EHP1lcppg4A4U0A=;
        b=NnJOYeBphVyNtMQAUKt6QLICW3nz3WUx7LAqcF9u28VRAINxHIcmIT7QYM7n9N+Vsk
         Ula8KtYN0cVWp+RHOD8ilQe9YsXGXFXE4yigvKhxPGyAbAbB4lRaHLgmdK4KFFBP3wNJ
         TyFz0a25Kf6nlwG3gK1kCm2EI8PZL8P6i5sqCNcq3P014aOs+2TuEqgS44JcrY8wHwgd
         cVaFThv3ktFPLUvWzWUYjjQwOZwqyP73avVmDBwttHVcuaAkRTPFU8dsFv6vuRq8Q2jQ
         X/G2yMmofRazD8YNHmuDp24+bA2V1KhxL9xTXG7h63B/WQvxVtZaTT8imQeDIF+WU7WN
         9/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430542; x=1784035342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmiOWeVXgmFMOpD0RMG3VxxL7rn3EHP1lcppg4A4U0A=;
        b=NYyapcr6qSNNTzv2wWmRomdVWWMrbyos9alwoG4mbUhbdwrhRJTtbE80qIMaTeEOmU
         zimkhOUXCIgSQA1exOuWFO9K4zc4+gVgIxuX07mMSdCYlMjpDepXbRoQZdjG6tjsMQmp
         SL8TOttr8pIInte6DE+kAns5wl76ODAv8roEgXgGnJomWt37vCod7sjXp8AKgKFwAbX7
         3M3Xl/LuB/BfiCuDyAejWkvBuRvt5724BPvOufcUoal4zhdINIIy8tDXiqR5OedoPhTp
         YmyS00JNkAocmoTpZ+FfWQhwFxIc6Z5ewzR5e5QyQljMGoj0eBR1OFjlEzBgePKFo2WW
         2laA==
X-Forwarded-Encrypted: i=1; AHgh+RpwWe8gwcr5bROv3UQNXkI3LirN3b/R0dW92OR9AafXu/IOO69SplblmDDVvGwpmkVKu1UOoL3kgBC9B0HF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy0oqPaIYhLaDt2as5A+DyJi0ey7ukTFdX0d50p+ulUte9ViY9
	vk66Pr4xTqUMm+VLCV49VD3PbRC13Oefd5PBqMnvBKB/oqWyJ8kyATLRmW1+B9UKa2Kczt2l5/x
	7h8OrMZBMQHCmpCgwX9mJrWeBIGfNuz0WDkamIzCzoqQeFVcGybGgJI579RnilUqooUDk
X-Gm-Gg: AfdE7cn9gKQWQYssrDxVCnyf9QDxVTIgvsfIegBraw0YiCYJgT41ZVXBD6ReYUdlIyO
	o3SE075CpvGIONR1U2ewqbAQzw54CWHVz2jNhGc90/ZVBVMoy7wfpFHceinBS61d+xdeB5tqD55
	XVf38VqiAflV2b9cGTjmU/VFgtyXySZ3rpUsuwiry0Tkat5uK1vLAfUfbUjUpF1sY5KutbkzI/f
	2m1gePRBy9xlvCDrSZMtp470yIEa0r4dl2YC0lMbJUN27HQ/Ts6n9sfiwbadIejPfZwUjrfK7gU
	RuXuAd4N4Bf73hYgKAiHg4fsLLDCmcEEYwivv4i+i4hBdYi2rnS5IXVvlpjwl4vRm/DYLk/RYdU
	O22q94/GYa6E1tj56vhzHLUlPjS/X/zZeYYfPYjxraKxy1bZNHh3ufKQ5T3R4T6HkSEOxwk85yf
	Pugp8/o6UWm6GIFk/5UxlqTT+T
X-Received: by 2002:a05:6102:3e09:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-744b7ae03a1mr2826778137.2.1783430540919;
        Tue, 07 Jul 2026 06:22:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3e09:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-744b7ae03a1mr2826755137.2.1783430540395;
        Tue, 07 Jul 2026 06:22:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377075sm3648101e87.28.2026.07.07.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:22:19 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:22:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@nxsw.ie>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <w6imdnlo3xron3f2cw7fq5jtwcgvyijciddxjftwf46kltjjqx@inipxbghzngc>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
 <4a2c098f-5d46-4339-9b09-e0ace37e4052@nxsw.ie>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a2c098f-5d46-4339-9b09-e0ace37e4052@nxsw.ie>
X-Proofpoint-ORIG-GUID: 0gnXaFLMGKYxgvBuFDGWTu_FgzSE3xAo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMCBTYWx0ZWRfX+8am62SQBqOA
 mEKMRh9M+5A4Cvwqbj05PjeTRnF/oIDM3AVXZM9noGuKGN/fI+n1YW98iqbSKlMqaSCNwLof/5Q
 d7z6e1Y57G1SCfPjjlpXaMKFLiiPIHw=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cfd8f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=17shpdAnEHHmTgLBXfwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 0gnXaFLMGKYxgvBuFDGWTu_FgzSE3xAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMCBTYWx0ZWRfX0rpEjaKugjYu
 LEicp0mFrsZbf8LzrDBhST0aM+XbLgNTns1dv4eW8pALXc7sQXvdFA2bSDyXz3EbV7i8D5lHlqC
 OO0J6eQ3dnb6jQAAxIP/a6J/VQrrQ+/P/YSdFHsDAxhWulqqX4llfwmWIIe98u2ZrgQeSaRwTJh
 y2Xeog/fIOQ/RD3csez0eSC0jRZ0SfBJPzzbsW1sNuDdeBE83tPV/cHjfQAFlfzF1jQRM3P//PI
 q/b90TsjdjMXrF5JFumAlyODXxsUiv2pzlDiBPIucdzZSBemv6Ptp57aQVzIJszkWwKPUfhWlw0
 d4LEzpyMKihR+75bPdvOJQ5eWdLNzK4iZqPShgZE0XgK8fwghM20JMDGWCZofGRzXODOiiyjTQj
 Xc3+DexUtBasqWXMroTi8w+GxEeIHs7Pz6THrvbYrmnmNHJk2WtDf3FDTGArrwjhwEd/Tnugc89
 aGLiYessE+UIi1zykEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117321-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,inipxbghzngc:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:bod@nxsw.ie,m:bod.linux@nxsw.ie,m:gjorgji.rosikopulos@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB2AB71BE74

On Tue, Jul 07, 2026 at 11:15:40AM +0000, Bryan O'Donoghue wrote:
> On 07/07/2026 12:13, Bryan O'Donoghue wrote:
> > camera-bus {
> >      compat=camss
> >      power-domains=<whatever is common>
> >      csid {
> >          compat=csid;
> >      }
> >      jpeg {
> >          compat=jpeg;
> >      }
> > }
> 
> * compat="camss-bus"

You can't change compat. There is no separate "camss bus". We have camss
block on, say, Hamoa. Or Glymur. Or CoolPlatform. This would mean
exactly qcom,x1e80100-camss, qcom,glymur-camss, etc.

Then, a part of that camss device we have all the IFE, PHY, JPEG and
other blocks. Each of them having a separate compat, etc.

But, there is no "camss-bus" (okay, there is a camnoc, but it is not
represented as such in DT).

-- 
With best wishes
Dmitry

