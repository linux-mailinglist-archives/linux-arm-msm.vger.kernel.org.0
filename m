Return-Path: <linux-arm-msm+bounces-109195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCigBIELEGpqSwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:53:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FAE5B03F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50848301D665
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 07:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39413A63E1;
	Fri, 22 May 2026 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbF9CIiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBrz+0u6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56565396585
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436330; cv=none; b=mqvsWrQlR9Ti7fb47zjC97zkHtlLj6c0mnDCgkTwpfJ7RUrKQtLNqMLmuzGlWrc4/k8ELEIEh/acM13DdK5SGJ7cz4TqfWIkFSY14kk51235OiEW8JOHSTOpPQbq3Do7ekUYHnW6iSURhlMP2IUL4Z5IAmRTe5KG4NunKd+JxyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436330; c=relaxed/simple;
	bh=uQO/ppJN4//X21q0E3AO6wvjM3i1W2lW3vAhF/4Nd08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLOlCkhWjmMDvEUJgTl9gv/puXCv1C/9/IR7Y2UqQsi5eCgQ4sA1pN4YIOQ9998OlMMfZlqG0aY23sEsQlw5pubK4FQGnaeAdehguOQAXznfk7+1ZKcDE1PVvJH4vwcFi/t3rn1HfEwN5z4dmKzBeGPjM8iFiYWMw7YVjuO9ag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbF9CIiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBrz+0u6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M2waht3674222
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E4QqjnKpknNvt5c1OucC1/DJ
	WgIE/2OWCTMkqhVNWzI=; b=lbF9CIiLSqUYgSpK1DuDJMr89uijJ+9G1FuX+57Y
	Atz+A+SS9OFjip5fHkcIzFKVJDNyr1PmFj3zdBUvZYOv6AZm2DUElu6htLkjzmXX
	MsCKJoWTW1a9z+tKPAKnVK/l0twDRN7q9TuyNX5kbq33sOTwixNm9lgKg2v2IdMo
	3HVKTW9wFe7EyYtNPzXtk9YSTM9G/jG/vmJs1b7OkSzGfm9RZIwZaJE7+NiVBOTZ
	HJMtigpXw9dQr2bi3QUy6fYcdJlfKBYemEvu5uD9kBKqhIFrNwaJPz1obyji/4fY
	E4gmHYcS0noKKtxdIrGi/ohEZGQVlOyI8hiMUQ2bGARnwg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea4dc3gwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:52:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso4440478b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 00:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779436328; x=1780041128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E4QqjnKpknNvt5c1OucC1/DJWgIE/2OWCTMkqhVNWzI=;
        b=cBrz+0u6MiHnleVerwKQ95zaIwN5QHiyCM160KPUTxIfqrSeohzqvvMuSFgjR5ycae
         khKpviEUfNiiVrMaPMWvh/bPkKw/C9L5DvrYAWJ3PPFcfz/5QtEh7WIoLl3SuQyLLrSQ
         GIgPtDkmn6R0A0Wv941AriIyD2wRgnmoeuHoCERpWuLM0DyhYl2Ke7mR5uTL7651qeSm
         Ms1gDxHxNXFtuPPn0HhuV1rTa/m8XhkiGzDuqdgRQXr3aMM6xqu0W79rQIk0K0Me7TAL
         oHpSyZ0i8kzTy46xjJAWO9wXvlVDH8x3kq2FhTzhDtqRS37WFamEJyrGGXIMxazz11F3
         mxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779436328; x=1780041128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4QqjnKpknNvt5c1OucC1/DJWgIE/2OWCTMkqhVNWzI=;
        b=nBGBFSfMVT9H8Xrv8iuCGe+P/z4I37V7kPW7DzDl7aaL97JaNejVKF3alZ73v5MIh8
         HlT8MmqEdi/R5ANXSp+QYsONi2u7YBBVuJNtPSezRsEXglRGUZQ9GbiuYj34RaL36l0X
         nWDO+tgbSoge2DYN3JmxXAbJWhtus/GM+JoP05nhcMeWHBBXvYKokF3J9wQZtIUEC5Vk
         BxYtPGc9G+SNCAgRwbSRSfw0e0KH8jRJIIUN0BdIKccwXY4pTOE6iu9GS40Gbv4mudgA
         yWTszitLxAoxF9Jv1szIwM7KtW3l7CxmCyKql27X9DU9C6jPzJElyDJo1BOviW67dRsj
         I5sg==
X-Forwarded-Encrypted: i=1; AFNElJ/kG8O8+/lLJEz3g6MWWxsUxb+QfSPiechycLCn3dwgSx/bHaXrSDJRGlNjn/sIXKBLyeiKJsOQqJibVRL5@vger.kernel.org
X-Gm-Message-State: AOJu0YysPLRz/CUvQHEF79MTxjOREbLrWP0kNtxAh71nKAgVRqTmf5Uo
	2pmP6qvknh5rWX8gyp/zS13p3uzjnOy51Q39vKU68nNwSmX7Vd547p7YBP7ILklA30eTwM/A8Jd
	YBEYSzGw0ya0FO6w/GhGDgF847Q95zOPOtXnZVFI+Q7S5UU6AtnEE/tmAJXCJWUjUs05A
X-Gm-Gg: Acq92OFNsONLdQ2SmiL9ax9J7po9kt5OY/1huSGrPd5rBMzaOJ7NANnS7c2vj0hF1jj
	wMcdAC6Ls9AWelsnlFDegHZK+KUIXd/W1nJha/kstUDpzvXHNXwicUHnndLeJXCDD5Ekn8EDK/s
	wxF2The+PyQZGsDGtWJ6p4wVRXxp7sWJ7ZpDMXjzHNfBOczyLa/R0/D65be76GMSJYyhfYZ1HIQ
	LQJXJHy9xHlEFHVN6zG1HFuK92BBE07hSKiNDbeXpjXniyxWvc9FGvIjSvqQTl1lDUD2dTgfsLY
	lEBhgwaH22FC12tbgIO6KY0q5/+V/SjX0auHOJXfOcRba7S3keiCogXBfBsHmRI8gE8f/g8ecgD
	72K2S3lcHnyOSCYT3qRvP22vlijD54TE0/Ef8GgipOZAeOGd1
X-Received: by 2002:a05:6a00:298f:b0:83e:c76c:d720 with SMTP id d2e1a72fcca58-8415f407bb4mr2391628b3a.30.1779436327711;
        Fri, 22 May 2026 00:52:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:298f:b0:83e:c76c:d720 with SMTP id d2e1a72fcca58-8415f407bb4mr2391595b3a.30.1779436326812;
        Fri, 22 May 2026 00:52:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e7d8sm1182749b3a.28.2026.05.22.00.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:52:06 -0700 (PDT)
Date: Fri, 22 May 2026 13:22:00 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <20260522075200.lzpj3cfqvrpzv7r3@hu-mojha-hyd.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-2-mukesh.ojha@oss.qualcomm.com>
 <20260520-hopeful-beautiful-agama-ecbebf@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-hopeful-beautiful-agama-ecbebf@quoll>
X-Authority-Analysis: v=2.4 cv=VefH+lp9 c=1 sm=1 tr=0 ts=6a100b28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zTSmB-ngaieQRBGXSw0A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: eDai3nLO0Kr3aCJwEeNmmJ6chMnCN69a
X-Proofpoint-ORIG-GUID: eDai3nLO0Kr3aCJwEeNmmJ6chMnCN69a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3NyBTYWx0ZWRfX3KD/WY3P4pgZ
 aD40yDo7VWzr39rtjfPUhSQLIqjjANgLr9RJMge1454+dato2JEi4WuHKtcSdukHVGFDnR4O/1m
 WYNJu0ggiuRefNXLM8cOWOpNKJI6e+VsF9kHfF6Er4xVzgnmtRRSg8kfzj0vBUyJJh1/BI43L1N
 X+u7QfJG6JCRwwIzZywz2zWvOa2202o5LKN9APUGxENiT7myQsTqRUlpRZnUDZ/4+ueMmPiwdvV
 QLDCqAtosNbkLcgr0FdA8gEUAyW4ndRwfreLwISMjM4ehczxuh+RaHHOJ9Rna3CgHpNrjHrWist
 zpAA5sFWn42EC5Z0kv8JvHQ+VY+o8kqmOSYVtsf0QaQmAbfYnNl82dp5uK1068q8nGlWerchysb
 c496xx37Bk3wz8e2t/IltdX10nD5G8i2DYE2ZZw9Q9Y4XIs0lcLV33XoiZO34con6rV9toPhZeZ
 d8drVOztYr2CHG/TMXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109195-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13FAE5B03F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:17:21PM +0200, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 10:44:39PM +0530, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> >  to deliver it (USB upload to a host, or save to local storage).
> > 
> > Add a 'sram' property to the SCM binding to describe a region in
> > always-on SRAM where the minidump download destination value could be
> > written. Boot firmware reads it before DDR is initialised on a warm
> > reset to decide where to store the minidump either to host PC or to
> > on device storage.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/firmware/qcom,scm.yaml   | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > index 25f62bacbc91..27422d00b8fc 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > @@ -129,6 +129,13 @@ properties:
> >            - description: offset of the download mode control register
> >      description: TCSR hardware block
> >  
> > +  sram:
> > +    description:
> > +      Phandle to a region in always-on SRAM used to store the download
> > +      mode value for boot firmware to read before DDR is initialised on
> > +      the next warm reset.
> > +    maxItems: 1
> > +
> >  allOf:
> >    # Clocks
> >    - if:
> > @@ -250,3 +257,12 @@ examples:
> >              clock-names = "core", "bus", "iface";
> >          };
> >      };
> > +
> > +  - |
> > +    firmware {
> > +        scm {
> > +            compatible = "qcom,scm-kaanapali", "qcom,scm";
> 
> Incomplete, missing interrupts.

Interrupt number comes from firmware and has not even been described
statically for SCM  for any SoC and so I am not sure to include it in
the example. Perhaps I took the wrong example here and should have taken
some pre-Gunyah Qualcomm SoC.

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

