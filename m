Return-Path: <linux-arm-msm+bounces-91879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFSZNSNfhGnS2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:13:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40736F066F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 886F030293CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2AE38E5F0;
	Thu,  5 Feb 2026 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKsKSezb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrB6LSvU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8293D38E5D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282211; cv=none; b=QOO+qd0ZdbDtlCBiNzOkslH4Otz68O+tK9TtzIbjRMw5Yi/TObA+hv8rMPMAywHvgE5LcHg7S57q6XUM3btojOQs6VkfYTyoYYB3Y6NUilcZ4ZvgIu188SPq9gYife5iPhfDg1c6z3N7bIs5BcoasD2LMIMqEwE2AA/7Gp1K0ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282211; c=relaxed/simple;
	bh=9aD/VAsCHoIu/4yeMQPIDZDJ5KLQ1q6qjjAFCQxBRdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9QR6eQAiCN/vCYtLyeMetjdUTPOroL3Pc/Y+SSRgFpUoIRwN4yL2YOM27Q+dKgcC5drEy5Lhx99sArQJXu+oHUdQyMI6emdCHYRjCs5Q58aj4zpzh54z1W7D5C2rfB3r2RMypi1VqFfnYh+g7+kf/ZQ/QWYjyxs37m7Shaf3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKsKSezb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrB6LSvU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153eJD33398304
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9aD/VAsCHoIu/4yeMQPIDZDJ
	5KLQ1q6qjjAFCQxBRdY=; b=oKsKSezbR4BPyri3GWb/YIQlAJG6ZQFZxuDD9uMl
	AnLSoOVmBfqZQtXnYWnqoXuIkI1ftaHp7RTrdCa6QD/0FdmAWJbkax9Osf1UPK6F
	K7otmlJUu2RFbwvsEZPiJujj9GlBv+gnecClqVBLX0HlmBkSiIwpJCfwDWlW/RHM
	KH+4MTCJ0ZMV6KFuJWnU26To0c4HjcYaQEOfF9B2aS+/OGl663/Kyb8n36JjteiM
	W3QtWaxVjzVIz+CqbAVUE83jfbQRH1c45tAnzyEIPC1yYu8bIarn/TiMPFMABxTw
	abI/PogIP3G8NC81eka4tL2uu2mQIjMVsWkFtZ2qH8sg2w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43dh3vr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:03:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c613929d317so493686a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770282209; x=1770887009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9aD/VAsCHoIu/4yeMQPIDZDJ5KLQ1q6qjjAFCQxBRdY=;
        b=WrB6LSvUsEypmwVBn2R51g7+eObLYtH5umXitzhpLXXW5qPtBCA/qOF5NUnK48hUvu
         vUdKo9PNEPUItHaaYyAmHxf/OWepal8j3Su7iIR28c9WYb0LARU58r52ikHOYQJ5BKp3
         +yKjeHPZM7kwx0AnREIxWEWIga/t87jrp31Bx7shA4L21HLUBNV74ump60BVukCTI+Ft
         w1EKrmcmdYJ52/s7lgKdGNV/fPuaHLXtAgKJ4jk1ZIxTh4bOuy5d0qZOZqZwKgSHR1yo
         5v7khFfm46OlEMEgYO0QIsZW6mWooPW3H18R6rsp6tSR9BVhzzuKOztN0lhUUH1NaLYK
         PVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770282209; x=1770887009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aD/VAsCHoIu/4yeMQPIDZDJ5KLQ1q6qjjAFCQxBRdY=;
        b=S/QDUkI08ZVzkBBIlz0+oEo6nTvynGivDzX/Hof5iQ8Nyizb1KSSNGXrRbvljt4tz1
         S0RETgJHh/So2XGFga+dsWPUPRYugvRXbIM6N+9etz24sCSnSLH4q2ajWbLtddhAIj74
         jJ2G6vrbdr0iNg9exQMLd4nfeTeA9aS3buhFVBW7CCt2JVPrH0b0pk4qOK1h5SlgOdTI
         E5Y5Je/f5h0ym0LOSiao+09YShLwkWAJ7ufqYVzSaviCN4RRGBbq4uhoHAdnsj1dZR9m
         yd/GqtgV1QmVLSs6Rb2hBAVumt53CZEjG3V2G2xq3140dNi+CUy4rQ6qKD32TggQGowr
         jDsg==
X-Forwarded-Encrypted: i=1; AJvYcCUmD9Hs46kCW+kwyOSTyyx0C3WcRH4sGTcoG70hVb++x17M7uq1qh3njoFsLYM8eabQ9u2QFZp6FSJ1YO1g@vger.kernel.org
X-Gm-Message-State: AOJu0YyFWKeb4jc8riYd+cq9MEBJT5HDxFvYFOiG1DDnjuk3FyxXxG0w
	G21uZrcV7rT7B1kO1n7LgeLJ+VcYoQecQhagQJZ27YSoszUw5nww1twprnVPsMoNDT2fOMZKsAZ
	y1eJ72f9xSEDgjtd0O5oAZlIDDATh21MsaViMJ8ouuI2403vEkGf6tHrbfdB94+KhxJFy
X-Gm-Gg: AZuq6aLQJrQqUhT4qe6nlvH3gGmLL7v2yZFrEctkXpW5ocxXVc0h/1s+K/CS2NFg8/H
	KvfdsTnQB/0KbN0xPJVV9BX2hAKGRHiBWirDyh3hU34QZc6vI6f39zSi+xiRnLRUe8608xmvzC5
	LLorfZKzLlt6DKXTOcdvnrjDaVDaXYDPXU2hReEaO0XhOHRs5wX8m9KeUqEG/jXaS8BOPNi+/IF
	7qVx0f400gvwmXHg4XYqYgwx0b3+zl6Rp9UMJkKONQSdeK6cDK47hAh5gRKggzoPeYYxVTwnCd6
	sKwMronoxzqLChxM3UmlBrD7VTuU7LBkbSDKSlk4Fm/mXYf+UuhcCh9j3mz0gRqXBKMC2kJ9C2Z
	SNGjwBEnvRyr7JNmbRBVlvNRNsC0yQocO5o5i/y0S7RDL7lrSDtXL02Cyu+V3BRuUbrlXAoRMb1
	6XJUyeEIb4tCi1IBx49d4HRppkiYAn30fWAe66rNg=
X-Received: by 2002:a05:6a21:398e:b0:366:14af:9bd1 with SMTP id adf61e73a8af0-393724c6d02mr6062283637.71.1770282209419;
        Thu, 05 Feb 2026 01:03:29 -0800 (PST)
X-Received: by 2002:a05:6a21:398e:b0:366:14af:9bd1 with SMTP id adf61e73a8af0-393724c6d02mr6062253637.71.1770282208922;
        Thu, 05 Feb 2026 01:03:28 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c09fc40sm1681236a91.3.2026.02.05.01.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:03:28 -0800 (PST)
Date: Thu, 5 Feb 2026 14:33:22 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sumit.garg@oss.qualcomm.com
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <aYRc2sFI0sKToFlz@hu-varada-blr.qualcomm.com>
References: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260129062825.666457-5-varadarajan.narayanan@oss.qualcomm.com>
 <f5af2b4f-e2dc-4aec-99c1-f06ef0eaa000@oss.qualcomm.com>
 <aYBUG7ixvuTAUJW5@hu-varada-blr.qualcomm.com>
 <jipdrrshukblcwbybahxtbnlwillvmejqx2dnt5h2goqnkgypu@6bov3xicg62n>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jipdrrshukblcwbybahxtbnlwillvmejqx2dnt5h2goqnkgypu@6bov3xicg62n>
X-Authority-Analysis: v=2.4 cv=bMgb4f+Z c=1 sm=1 tr=0 ts=69845ce2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sLZA167xDkUgguiCjZkA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: bpEV7lqJoXBR5T4pNrFdbD7hBIr1Xlc0
X-Proofpoint-GUID: bpEV7lqJoXBR5T4pNrFdbD7hBIr1Xlc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfX7WC+rn/iogk5
 f//orr3UZlUAevzForpr2frkRkkYPO+yt8vVGq4AjIT1HzIZoDwN5rkMHyJFfYmydVrlIBkkddY
 Yt2c0TSPkJHa1n/bGrW0Cv97ZITG2EsYUzAyI+d6jIdQ4Hd+VxQz2nc4VyOs88Z4ASRGKZukPTC
 4YXbtw28pgp4ZpdkTrgdgcMm4SkRZN46Hbjyf8FGVMPtAHVdk/HRLJ41AKjLhqeIEdbWMLBaMLj
 yZmOcfTIm7oLP21FGmhAWWSoROR8u/3hGmWBBud6cqRXVidq7rdwZ5v6gO1XuogVY4KtyQGwuEy
 UUqi4NuE+yAz1nG1Ekc8r1R5YUsIVD1yTsEUnZo4fmd0/ZH/sFgprxPwTMGzwqEJ0xP178RuJ7j
 gSbX43rHHhK0AWkpo8w2Esh90ykr6NTidG/r+ySPNCOLkH5ABFvczAii7+uoK0/KVqVcTSrDhnK
 ZiObtvxfrjD9EKTwPuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91879-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40736F066F
X-Rspamd-Action: no action

Dmitry,

> > > I'm a little surprised to see no power supplies, are they always-on?
> >
> > Checked with the board person. He confirmed that they are always-on.
> >
> > Have posted v4 [1] addressing the above comments. Please take a look.
>
> It would be nice at least to have a comment or, better, describe the
> fixed regulators.

Have posted v5 [1] with regulators. Please review.

Thanks
Varada

1 - https://lore.kernel.org/linux-arm-msm/20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com/

