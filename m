Return-Path: <linux-arm-msm+bounces-101742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJCRIlo40GmP4wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:59:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C63989A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD76C302495E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 21:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA537386C0B;
	Fri,  3 Apr 2026 21:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pp3wrIjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3i0mY3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BBA3644B6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 21:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253553; cv=none; b=IAS+eO+lzrFdhynwZuiz7RVn70Z7y9sB6E1zA2lfMsglsSVqQtzDa9Eghu124N3pH7BH8vbloY7iun4lsA5Ul9gGTalGCfPusYIOC3OU094vKaur8Bb9MRFOPs9gojiujpJAZdP4evUT9NM8qfxda0IuqJOu8K9Q7eBZ051XkIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253553; c=relaxed/simple;
	bh=rqB937ggnhxRSdJcUTbnBDypko99HI/LIAG4qBwWDzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGXlkEVzvPaYhOYp78HYaCHHcLSiPalYBihei66AcqkNsA6fh5CHoT2+giIrFJ/XJq9U/91fJSVvDx2uPnFFpDFG9iVU4pFndXCWnVB2yZ9rzN8xcA3WoZwdWfX7UpndIA/OBGq6m53zcsnD4r55p8T6chlrG8FeSlRE9C1AvaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pp3wrIjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3i0mY3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EiWdo3772507
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 21:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GgilH/CYlNPEdmGfxfOBQVIc
	9G2hmzaeFbna/a1eu+4=; b=pp3wrIjFo8OXhOX4fzWTgm2KCd8peDxDdfBUA2ff
	26lt9OV4smDsm8OpqItBds3aCS8VTSJEqRs7oW+baLWKyyZ844fWb4htxjt6SWq/
	XmZUdjy/tRg/HPSwGEG0BAzU66W5SKisMWB789KVNWxFVNuJ5Q3L68jyrCz1Gghq
	VZKdYbHXAhaKJVEavycJS3H4wdUZw4u5VXyKp7XDViAE1Yr6ssE57V15Om6Posym
	HBojY7gzgTG9NnszqWs6tIPhf03S/X5whKqRhv7J783xvh/SOOXhbvtEC0AufINi
	1HMYRcp2Ey/RQ4D4e2PMghAnWiVsAjYzVz6eqd1den3Xxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs4a9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 21:59:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so69662831cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775253550; x=1775858350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GgilH/CYlNPEdmGfxfOBQVIc9G2hmzaeFbna/a1eu+4=;
        b=B3i0mY3QaIjARKiHOME9VA2iaBQY92mGNBB1nqmtLYOU0YL7Aj4GWP8j1wwjdn48D2
         pYKrwV8FvKB4H/jDV+WhQJGWdQvPQXzj3YTECGqQ1xWrpd2I0jZ8OQLky7kaDNEKO0LK
         no9eITAZU2oYmQ8jhjcBK0WDwxLkZj6P9Utn0LBebQdzqIP1Vc70H64mfNBBTd335tOa
         tM4e/T09Q8n/QypBI2fHcTZXWCtvEySis4rswi5/BdnKHZYIhRaIxQHTrFz0zNvRLIKZ
         puKWOFdWrKlVH9VE1eNePaq6IGVdcze7B4KtMWVcPDYaPVlAr1qsQAF5/Nf+NSSxeBMC
         nuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253550; x=1775858350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgilH/CYlNPEdmGfxfOBQVIc9G2hmzaeFbna/a1eu+4=;
        b=GZlHSz+n307nWJMaTS9RsUUMt6L7WMuttPFXHZbEZ4YUIyOMTLToMTK06SUy//tW/c
         oIg1X3EnfjnogiF2+ZJWob3SHjjx6p5yrPqkMqEhAf5dIUiP/VIbTVNQFpvRl8BXa3k9
         QvDya2YvI32rwOj9HDq3wJVtKnDMEAm6r56+YzLvfssWgNJj4HvhJ1l4ujgJv7qWMwkR
         2LBQOIs3PRb88/ECEg0OOiH0WvhfJPuNL3M77SCfDdR5jUwAVGJz6VdQ6o5x2zzCx1pi
         ybT0vkKXkLbvsEXHKR3PfoPEHyINT+12cpyCOnAPK4rjuo6LVwAvSb+Gp0rZGsoDULLM
         wEgw==
X-Forwarded-Encrypted: i=1; AJvYcCW9iQmxrf5KpMpH4DoxUfbSEILJa/YXZKtN5FZlSqcDWr8brk01vyc7JLdFj6lO0ayX6G6ppzvrvoACFsOJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzxrcVeg3sCQRVKrzVSTaonzNiJwUoqPV7j97nFpJaXBQGa1mRP
	ksUSYJP05FvtxucthJ+cSKVXlfrZfMs5TInqV89CBze0pOS+Ved1Gn42bGdo6WpDbBFsVIeRPld
	KgvMC0YspBA32yupQ6eIAnxgw+6dkmLA8cDZHXFGoZMjw2pwAjM4nzvbVXbWHNu/31j9fdUQWvW
	kc
X-Gm-Gg: ATEYQzwBy/LE3+qUyFp21al0LGlyjyacUI4APm6oIb0W0Dsm8vxroYIrN9dvlmqAiFW
	aDoZ0mSuFLkdoxpDMPTEyVcYGo6DGJzxICLzzkQ8hglR3YzYx1SETBLrDsVJXRNeY4B2JAvE2dI
	SDC0sri8aRxxjnDbD9YMJg5eTy18zOpZkjVoFif1CEVo611Lg2m0AtQKQBM+95IZaoNfBRVJ8na
	wNMlMiR7/iviwAGzgPlv5AIbL73VK1HfYppveJbejj/9FZmrGidwh0T2JIf/7oDruBU6Ovhi+sU
	H3dFTb9lxRlJEqwOiFcsw8yxkBHxo+/adXUrn84PStNvxhXOnZCk1lIVtNEzjtBoeiR+qys/JQv
	9Mna9gxL+ZLh2ncYOCVCiKHepn23f4DLgR3d7kc/g4GfmMChCO7UiStpSXpd69Iv/RwmZUcFx/4
	4z6arhXmbOEjdNEmsAh6xymIBuc73Oxj3J80Q=
X-Received: by 2002:ac8:5703:0:b0:50b:4984:148b with SMTP id d75a77b69052e-50d62e6a503mr60498241cf.64.1775253550467;
        Fri, 03 Apr 2026 14:59:10 -0700 (PDT)
X-Received: by 2002:ac8:5703:0:b0:50b:4984:148b with SMTP id d75a77b69052e-50d62e6a503mr60498001cf.64.1775253550027;
        Fri, 03 Apr 2026 14:59:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd6799sm1695259e87.81.2026.04.03.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:59:08 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Steev Klimaszewski <threeway@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
        andersson@kernel.org, bod@kernel.org, bryan.odonoghue@linaro.org,
        conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
        dikshita.agarwal@oss.qualcomm.com, johan+linaro@kernel.org,
        konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, robh@kernel.org, stanimir.varbanov@linaro.org
Subject: Re: media: iris: enable SM8350 and SC8280XP support
Message-ID: <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
 <20260403214140.7307-1-threeway@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403214140.7307-1-threeway@gmail.com>
X-Proofpoint-ORIG-GUID: 57eA-4PxNY9IUwKUAOaSUV4RoFWFLpvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NiBTYWx0ZWRfX91wLR+ofCqDe
 bMm5BU/EGppjMMmcQOWk1Narq/9Ag3j3ZtItg9yoIiAQl+VC2IZun6oObqrEo4QwHjTuIuT3Q/w
 Xxap9GjjbV08G8qW89kO+O7iyhH70c92RsPn5mzfK/Crd+MpqOXqAYKuKHB/4cV6oSiWODEfyo2
 6rzpoFox7cWeTEdvUbWadbz0hjHouTmkYmK8X99ew1fN+C+aHEBl2lO+Re+hU5F/yRsZ0gcnHdl
 CCaJUCMMM4bXmkStxXAw7bIrqrAqVPpjfARWqfHP6PdxgEZKxRzuRGwf7yfkE6FbpyTzR+++7Q2
 pjqFJcUusB6HMUq20Oew9kcAfkk0Z/OQDOEUcGIlkSx7Bd7hSlkFzdvo1xzMrz7/6Qh7HaiiCoV
 z8/nLEOGUigBzfpNkX7bZLF171LW+Qwwu9qrQoY6zqd1PcsN/9IywYUeBMmOLSaweTtmirZFNqd
 5vWKx4RjPsP4cMDULSA==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69d0382f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=mZ2gADCCxg8TzUEfTn8A:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 57eA-4PxNY9IUwKUAOaSUV4RoFWFLpvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030196
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101742-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E54C63989A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:41:39PM -0500, Steev Klimaszewski wrote:
> Hi Vikash,
> 
> >> This is not just with totem, showtime shows the same issue.  If I let the video
> >> play, it plays just fine, however, if I attempt to skip forward, back, or even
> >> play *after* the video has played, then I see the smmu fault
> >>
> >>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
> 
> > please log the info about which "iova=0xd51e3e00" buffer is faulting in
> > this case
> 
> I will include the diff that I applied against my kernel, in case this isn't the
> correct information, but I get the following output in EL2:


But these logs don't capture, which buffers are causing the IOMMU error.


-- 
With best wishes
Dmitry

