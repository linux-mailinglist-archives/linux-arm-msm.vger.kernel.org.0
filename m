Return-Path: <linux-arm-msm+bounces-91505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNBbN5SrgGkFAQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 14:50:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25345CCEF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 14:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1847D304E726
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 13:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347A4369973;
	Mon,  2 Feb 2026 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8JOq4y1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8wvb7D5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70AB367F51
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039853; cv=none; b=B/PCm3GdIdN/OOx10V91vUZ8M3pVNu30nGtWnZfjJ5FLli8TXHZfE9c9kJC1hMsivDZXzYq3EnguC7v7OO5lioLDdJ/AOsdoWq+p/Bvlrzz71POWgz+ho1JFekLCFvx+vRP7i0cYDHK7c3I/A9wGfTWHA5KnEEA+IPlb773Dbng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039853; c=relaxed/simple;
	bh=TXrVzglhxx2R/ILCLbECZUnzA+BqufE9jF3+1Fhl2jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8aBcFx2uN4PUARqiPfPPSytzs3ZSGjIKjyXlmUNvIwXcqcrkB/x4GFgIfxBN0DvTYmlxKdQDGbvZ27vnNNq1meDFBjwsiShiEY362tZakFlkV+B7LTUjYu1ZJG0q9PpZphylU6EMnnAb4Djt5zL0Zu3fWeK6fHn/zkLjlWb0HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8JOq4y1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8wvb7D5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVFL5255196
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 13:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ag58kKX5ANor8LMMtVZGiTM/
	y6XE2+FFqs7vu7KEdRA=; b=F8JOq4y10tPYDBunwHtDfPAE14oWoY+JlEQJK/C1
	Frd/wv4rskjAzI/jWOCgXOVxSm2Tsv26Q7KTJ/AWZgduvUGCS/E9QSodJ0cqqf5l
	HRLk4y9VE2kg6tMDSjQsLMg0lYw11bsIL4mQKsMGCRxc+trsfo+LdD4KmJhUMH9V
	hNDfLNaMYRlk7A44EUrRxCzbYHh/8qxoGDDoUQqW+RCiFbHpFn1Eyb5mccGBdWum
	dir50GAL8ePsG98LlYeUhxWARDz2Qdljh1I6DJJPfJjvzTr2d1pMgNqxxEOmcFr4
	vBNkucK9zpSzbhDOP2/wxN/qNh083KToMXeYkzhWFeEBCA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kg668-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 13:44:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso15428085a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 05:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770039850; x=1770644650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag58kKX5ANor8LMMtVZGiTM/y6XE2+FFqs7vu7KEdRA=;
        b=N8wvb7D5lnil99LiPL0SjnZeSM0rzs1tGWxRftpCpo+vF1/P0CDxoTl4IeJE56LKUr
         e6F6fyW4x37hGcx2yEGTvIqoPAnDvIl7ocG3nvgAV6YdsD1MpC82oxjx+q0EyN2ifGwj
         iM3FyE28hOLCIobaHY1MAaIzggoomrLskWc/+c1Qne7UDMsyJTcSVBCXbzdqIzymtbtp
         cBDRTYPQZqvcB1CTGqIKIxpCq9Gisel+9u9rX/1AdXkBp6SqzcmHuKVswYhTv2lmCpUi
         8haMp0cnB6WDlm10DMWe7U805NS+zy9ND6uXMn4mGuno6wcer+1pGSNGEYXfcj25TWMU
         zb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770039850; x=1770644650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ag58kKX5ANor8LMMtVZGiTM/y6XE2+FFqs7vu7KEdRA=;
        b=OO9p4TWmeEROunGp8mNe8G5oKDJU9O0pnzetXCX+qGebsRk32kr87Pg7ryBtdzZpJ2
         slebgVUsvnaaoTfa6j2E6Xo6gexF/ayoG0I76JPOCnON/ydtD7cZIPunAaP3O1XffsZb
         ULMrfIzI9CHz4yBbMKXqUcVhGiay38ZYtc0jLQ+1d3i8pl/uBrAOyWt2LEZrX1kFZvsT
         bo4mgqtvXfLMt789h4kX1g1PEKJ7qvAbdfq3Ovg7eftIp24DRecB1AginhpVasoBROks
         6eKWeUd1WModECwp6C6RfG3voGIko7+HKli9S5cT4U1cDvXIlUnAqpEEdqia+QOHfvih
         ypjA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Isu8vdUI3dqxL0zP1+z4h1UNEnUSjot8Yf1OF/ZVa2wneniu2Zim2xeHyNKYt3yKCGUAodseLwrB9Jfh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0uTEVk83jQnwhd4A5sY9z2i8QFOF3H15lBMwAp58SuM/KKwHB
	pLDLbzDXP6RGNarid+klIkaLf91bHGUuaU5Fk41GpvTeGWoEZ9iWCGQUe4D75vSf2kHWQMPvR5v
	Aa6OvUuHg/j/WAeBncF1b9Kgtw2PELTtoQlwBuF/7AJvYJyxtvOiKyo43KbVFnY0ToHIn
X-Gm-Gg: AZuq6aI5bMDQff0fakH0oz6SIT42EegXLVY0APggEls3TyDIZXJIEJs2T4vdDdcRIbO
	06p05vFiYuTKsHqo6yQtCPKSd1fvkXcgHzC7Q/7LCwYeG93r6bDZqiI8Qg3vv8xv2PqdJcAwWYv
	TH4nz/e3EJrwgJt+WF41FwYtC0bTDI8DdlppMht6dSHXtMigrrBMgFS2RYOK/L679xqEzmL5Llg
	DWLDbbrSsXZdRX7T6p6j9Yw1VJt+nGXg8PAXqEECbvxxwQYmgdhHl7wM+h1XqkvUbtp7ncUSYYu
	TV5w2xOWfaF4tl9C6jxSr5OWRyAWZUq++7BKYQBUmH5y9a+QPtWbQ3nsdP5Zc9aU4E5EH6SGn4P
	DyL5AF+XH8b3zYT+FtaYBymBZTCcr46XO2Nl/
X-Received: by 2002:a05:6a00:39a9:b0:81f:994f:cb with SMTP id d2e1a72fcca58-823ab67b8a1mr10943007b3a.24.1770039850321;
        Mon, 02 Feb 2026 05:44:10 -0800 (PST)
X-Received: by 2002:a05:6a00:39a9:b0:81f:994f:cb with SMTP id d2e1a72fcca58-823ab67b8a1mr10942982b3a.24.1770039849639;
        Mon, 02 Feb 2026 05:44:09 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfd797sm15752992b3a.43.2026.02.02.05.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:44:09 -0800 (PST)
Date: Mon, 2 Feb 2026 19:14:02 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Message-ID: <20260202134402.ochfxv3lnju3dioa@hu-mojha-hyd.qualcomm.com>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
 <5zqxloovexknbuhknbafc2trf66d6zwtvtkhjbchmbndxg2j6u@3giwqjkd2vl7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zqxloovexknbuhknbafc2trf66d6zwtvtkhjbchmbndxg2j6u@3giwqjkd2vl7>
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6980aa2b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qiayP-4gCwJqfZe5UOMA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwNyBTYWx0ZWRfX7kmImeS8aCE6
 ZoR/lwYKEuMZr1d02I+bgIlt/ONoJ4/2rKRtaM67ZEbg/pyKlINqzZiTkaYEOZQsZfU0cEyrE8Z
 OLwrFHgwsY5UOVldnpDxyQsw0Cok/eszFDvTshlX3iTZGGfuu87HBshFmAobf2L0jc+jxSPk8MB
 TiDWafRoxhu5GDY4ejkxbqhqzo1TfI8PaBE4h/yF7Nuj+doHZytprUsvsiNQqdTz83E5ootGrGl
 iRxp9+b3wLoaqs0EufcR+VvsrvFWRLLCBD7soJfxJaVZ4JXOWtclz/FRasJBIwGKTrs3o0PTF63
 IMZ9RnPvHDafnR4SeA1FIAB3GpmwSHzmNBsBkK23NGpG4qdE6tr6QbSCRgspuDX9/ZUMOo3dtnX
 ctEmLsN2aZiOYqg9nbJR9QelVeXwkeYejXZXFMTgS1E2EXgSkKJogtyPyzjj4m0sp94/wFg2HMp
 BR+/JmnsiW87fFBExOg==
X-Proofpoint-GUID: M92pQ33jF7gj7knMnsqHrVEzZHCVE1x3
X-Proofpoint-ORIG-GUID: M92pQ33jF7gj7knMnsqHrVEzZHCVE1x3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91505-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25345CCEF3
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 10:18:29AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 04:14:34PM +0530, Kathiravan Thirumoorthy wrote:
> > Add the "sram" property to the watchdog device node to enable
> > retrieval of the system restart reason from IMEM, populated by XBL.
> > Parse this information in the watchdog driver and update the bootstatus
> > sysFS if the restart was triggered by a watchdog timeout.
> > 
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > ---
> > Changes in v6:
> > 	- Update the 'sram' property to point to the SRAM region
> > Changes in v5:
> > 	- Rename the property 'qcom,imem' to 'sram'
> > Changes in v4:
> > 	- New patch
> > ---
> >  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


I have a few more cookies (stored in a fixed IMEM location supported
downstream) that I want to add, and they are available on all Qualcomm
mobile SoCs. Should it be added under SMEM now?


> 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha

