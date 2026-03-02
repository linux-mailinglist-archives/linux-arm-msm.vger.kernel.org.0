Return-Path: <linux-arm-msm+bounces-94979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABLRMHutpWmpDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:32:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21F1DBE32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF7B0300426B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E125411625;
	Mon,  2 Mar 2026 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEGcfBk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkuEJBwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D696401490
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465412; cv=pass; b=qvdm630DOdH1PDO1KYSwS6xZecD93Ii+88qp5UaKz2Nk9tU6466UJwRk7ZqKvFTY/mKKW3CqqyqY6bFyR5WoZgZJ/q8SjBx2yzJ+eCkdcLk3siwRf5LhaswJO1x4nJqe6sjn9iZPd+EA/gzRsJIlH/FuaI3i9SMcMNTghRlqmF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465412; c=relaxed/simple;
	bh=PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMaYzEevYeuUhxxx435syuGza5gIZ1Ng44a8rXy8zupcrTAW/+kWze63yvte+GkogB9Q3B0mc4Kyyms0PrqlyWfvtpMBMCi5YWlow3dEdQLNoNyThSAvMpBCcD2bblh8iLABKeWH7jdws+gdRBCxfEPOHMttR6nQHZu/v41aKkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEGcfBk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkuEJBwP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B4K5s3561498
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=; b=jEGcfBk4ISlQYOy8
	PYfGyMjsSSnWSuVU+10FNlhJ6j4WYoUt2cbjC8S8Rq8DguXHNcTSvKd92JX7Ynvl
	lLRifdVOoJ3gs/R+5pmibhqNWVAfQbZAxX8kINWm13EVRs7nrKS8dE9wSYqXHhtv
	M8l9+y7/hEMxqynipMImRooMKYrmKy5yGS08iA1LTpGLuiR4qxJJDcBIFAntLe0h
	IDxqBolvbU++xlYIBYQ71KItLGt1acz3t/WQrh94SvaGEoegDZ9myuv6VCp0BuO3
	0iqMItBxioFQERTqo1YqHXDMDUKiAxUHlPl9e+771zPFbySnez3khVbvrvBPLmhh
	2fNahw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bv8uhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:30:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71156fe09so3295680485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772465409; cv=none;
        d=google.com; s=arc-20240605;
        b=Vt2yZ88sCL4as8DQ/Vey9Mlj6XyNVTcG86dxfL10O88EYni/HO1zJLoh5ClMZdJR39
         yfRXbN1tgZfapNiKiAJaiQj/VcrxC7g/OEx8HeIRXm1Dov6fdsNuVPIMVxRtZ9TBCceW
         NCHWEzGpA9sW2dYwaNF0nJAi947cNQ23euplt7XVOoN/FQTg0HBGixlXp2TTJkD+CorX
         BGuhVipkQ7neDUUJcS6KE3TVAVD2ib+yN/GnUzkid7MzPIc02atu0z1vq+TPsGZXGB8v
         APCEyFd9HRAkcYJMzKOkp8mxZ1YOHfQAczFjY8Bryn3zK/lwJK1PnD0guQrlVfzbsOPR
         Ztyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=;
        fh=IQH/z8qi0YiUhIJJr+iSf/s6R+agtzO1gaT46DvMGL4=;
        b=E5TzFfFTL4K3+sUcqABM8GM8SIeJdigGP9DVCM8MSYUrnyuM3WHsylt3DtRPYJ2Xvz
         DOzDScG73eyKvj+60Q7utqRgeBOvb8xNGRcKK1kMtdTBQA5n3RVhbUI1cTjcDM4/NW6A
         BDB2CNyXbUYmMm2p0dyUd6uRnvTmiqopj3E53IujyJwLOSakucTmW7fraQCl9dm3L0uK
         p8uQUU6fWUuo4Y0UeBdfC84r11/ejgLdJRNbclSSJQ5Xfqhw1Y+8sppz2wfQR8GCnEQ/
         aJGkXwMrrOvQ0BsH0k7USVSc5X/M8xh1VAnRQWn1VfC+V4q2v5o9aBLfgYOpfRHv0yK7
         ezWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772465409; x=1773070209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=;
        b=KkuEJBwPuj+Rxb8sn4CO1rDOym0SaTPQGyCzEvIKxqdpRTEMQLuhlo9eckiRf8h29G
         yKalOnt5IbATYG7VRJg0fGQym4Ga5GPgJawKtPy3xRQF7sUyRcQTP+rfPv4YTALQK1jU
         F1EstO3ZwkiRliaiYaKUniH76qdbZSzoIw2p5cGeNCRJT1RTrXMT5+8VtMSkKXsWgYeO
         DDvfm5/X6qh2yzIRuspOxMJGoW2RWRIbnUkAjt4LPIbshpvY1CV2BQompJ/ClpZf/4NL
         qfUUazZEj5fJeRR3Ra2dIAZ9HhnKRa+3orUZG3nLXbM1JeYWUquDHFS9TeAbOg/H6oB0
         FYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465409; x=1773070209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=;
        b=gJE2w8726MJFwpwXAn0Av1JsxOI8YmCRACA7LDXEeu8mg84g4W+L/uDxF4O9v9bDoY
         V9cf2y9I0ez/H4iaYwfrkg30VZ7C+pLYj3jSNBr7h2FPYwsUv0BRF2/8B15s0qpzEq1V
         SPlNOpehvoy2glH8YWWRFXCIGG/ZlkaITXM6UYfJrOJZ+QU4yn5pU6St1U+R/v1SiRr8
         x74tWEhblh7e573yjBBYdzEJjnEXWkHeMFY+cvPKsFKoq5xsDW8sNIW4H9u45Yb3kupV
         ohxd+TfeuJHk6fzRnYlAQhcZhPfkKNVoS7++vZ+m/kJ7TzSPpi8nHmtONTky9h49zXFW
         /Mdw==
X-Forwarded-Encrypted: i=1; AJvYcCURFfc86aIyEUaUp9b2SGigIUGSY5SLthekss/R1KuT6aE+KFYEHSlwE+0ntRxRDhB7p6xgNB9DPrhe4slI@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0Z+koF6eAtJYjtndmx4F1MviNkJjL9qr0aFVoO1UlM9MDN4l
	7oRrYuWMGhtvS8H0iCPPSlfYSS7zLiI7PkYw4hU59qjEgevOjcCWKQVkVd77yIKlN78Jr+wgV4B
	TSNCr57zvzeN0tfa0hds/kBc5C0cHCJm8kmQi5gOSrgElM1aYzY6jKirFmJC3r7rtnHWr5C5sVl
	IKhJBKukLpQcZms6+mIbD9PetZLbbqO5YwhlIEO5HDLJc=
X-Gm-Gg: ATEYQzwi2WQLGzFa79EdilaCPjcOr5fpS4mBleayKl32oxOK8FKDz1zFpP8NrRkoaCh
	NC28gJwpCx+GEQwlYtlOuQmXJLelJF0OeHMoaxAom4IuMqxslMQ/+YLP9cnUcgItR231S6izLA+
	nWbgdpG8L362zBFgl7p73loHwlwZIhF+taM18DVP4oMgvDVvu+/GnfEJM4k5j8PVF2H4Jz5VXL0
	B0nElKatiRTq3ZrN7plHQZ2l4nq8H/21ZbHBQCG
X-Received: by 2002:a05:620a:7006:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cbc8df2657mr1690427585a.38.1772465408613;
        Mon, 02 Mar 2026 07:30:08 -0800 (PST)
X-Received: by 2002:a05:620a:7006:b0:8c6:f411:5eec with SMTP id
 af79cd13be357-8cbc8df2657mr1690417985a.38.1772465407958; Mon, 02 Mar 2026
 07:30:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
 <20260225150122.766220-3-loic.poulain@oss.qualcomm.com> <6js2jmzcbo2dmt3g2griookjt7kkrbukukzkv6ft6i6357g2x4@trpobakpysw5>
 <CAFEp6-3KA5tztKscsaHn3=MVKfwC=gbCMNgZhi7SasxHXxttYg@mail.gmail.com> <trtkruw4g3bn4sltdj3foq6xqxjxvgejnzyn7cbcour7a4zls4@kwexergrb4r2>
In-Reply-To: <trtkruw4g3bn4sltdj3foq6xqxjxvgejnzyn7cbcour7a4zls4@kwexergrb4r2>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:29:56 +0100
X-Gm-Features: AaiRm53FfrEbIhKCGdF2hg8AGMkqY4Ryr-SuCVkuZhM1zKYQgM0hejuz-Fh9sjA
Message-ID: <CAFEp6-1QHdm_6V_t82pime7jFayCMC9D3VGny0e6jsHGk9AXJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] media: camss: csid-340: Add VC-to-interface mapping
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 4Un99Axr2PxxDNL2Ace0VD5GbTD7p-zc
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a5ad01 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=9DD3u0_AU1_iAW09k_0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 4Un99Axr2PxxDNL2Ace0VD5GbTD7p-zc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMCBTYWx0ZWRfXx3XefgInAMPe
 PuMWMw8Zzpc/L/jFJlfrTLUUxZ+J0zPndHaQrDYqeol7QVxdCHbopYrkrvb/gJd56Hi1XO0mcTn
 ASe6ZCfqON+jJHXPNdUzu+av3Dg51Lk41GNBqCW9ju15luNLQOM6DKzeBKf19lIqyIE/QB4YwIw
 6Lu89yRfgQlAd9OwRlKohgowobIGw+S/8OZXWF5cUv2z1O2rgeXS9mKBOSGsGYkk7nCIv7wRqXx
 bms4KgQOFCG6MSEnu11k1LchE0dnyGxW9siG4AW2iLIqceP0pfmWuC8Smjs5Oq6iXw9mwwWHxlT
 tHSKVHI6e3gchKC5OoDod4J0+sQV5RkOnea8wb1eQe/0lLJqjYRu8Ilb9a7ykrwpDJ41QIzWrSs
 D0ryc4P5WkBoyK6texJgejgUcMnFi3XXlS1OiIAaoKCEVC9bOtMTg4mBTwI3gnhXzQEURuAZwJF
 roQC0noyOUCPQgGgRHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020130
X-Rspamd-Queue-Id: 2C21F1DBE32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94979-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:41=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Feb 26, 2026 at 11:15:16AM +0100, Loic Poulain wrote:
> > Hi Dmitry,
> >
> > On Thu, Feb 26, 2026 at 1:16=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Wed, Feb 25, 2026 at 04:01:19PM +0100, Loic Poulain wrote:
> > > > The CSID=E2=80=91340 block uses different register offsets for the =
PIX and RDI
> > >
> > > So, what is PIX? I asked that question at v1.
> >
> > I might be misunderstanding your point here, but yes you did ask this
> > in the v1 review, and I updated both the cover letter and the
> > subsequent commit messages in the series (mainly in 5/5) to clarify
> > what the PIX interface is. If this is still unclear, I=E2=80=99m happy =
to
> > expand the explanation further or add more context in this specific
> > commit message.
>
> I was really looking for something like (pure examples) 'like RDI, PIX
> captures raw data in Bayer format, also providing image statisics: max,
> min and average brightness' or 'unlike RDI, PIX captures debayered
> images, also providing image statistics: average brightness, max and min
> R, G and B values'.
>
> Also note, this is patch 2. It lands before patch 5. So I'd suggest
> having that definition in this patch rather than the final patch for the
> series.

Ack, will do in V3.

Thanks,
Loic

