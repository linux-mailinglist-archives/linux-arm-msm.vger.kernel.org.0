Return-Path: <linux-arm-msm+bounces-103967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFUrHMia52lj+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:42:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E743CE32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BD11305F74C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810362E889C;
	Tue, 21 Apr 2026 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJaIGwvn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7fbM+gl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D582DA76C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776785952; cv=none; b=BsFul9xJtVOmUGpIGAgDuk50XosdTZq0L/dWGe7I5CMGIAmzEt0gAAAMdoaScmObuKoCxVdEGQTnNetC5TBslXVEDhNBg7BbiyEJ+ievNK3WwyUEsOPBBKZWi7SK6BAAfs3NxNvh1vfAaJ3ZBuNhyU8VWApjwhtlX1ijMNuOZCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776785952; c=relaxed/simple;
	bh=y8qcNN9mEH12QAzYQJPIQN+4lxwJuQrwe+L8bZL+bJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETprtcjAJTKXaOTRXC0bDdsetrKvjwXZzARYLKD5rZoIwHAO4YSCnD1npWzNkmbNN8V6ep+6BKTKPFfpTphFsV0LmVw24q7WH+QWRFJFgOKDSFMQGDagGwCutvqVKmNOBSmNie7iykVgg53LZc1yRaP1uu/AXlNwh4bqPB8qXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJaIGwvn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H7fbM+gl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9VVqK4168331
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 15:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XNvd2Yokfo42OCMof3NU+m9TSn1ECI2U+G+NHt/7YM=; b=LJaIGwvnx6TH7WtW
	LJxnBBKdz7mLdF6J4l6xPSN+IHubfGyXiSJVHcksk7q2w+FQBP3xQnjgPDK8Enzu
	RI6c3j+qKPkOd34Yrjs7VUh2jIgSdKyWQoRdwP98ZHrNtsOz4rOweEr5e/VRDJfY
	Ow5qNxvIqu4hZe8sdinTENHv8j/VdLvya/P7wLlvAbHDfkHYoyuEHsKElNaVRZkW
	LV6KVteIxS1T6D89IgHPWNs2AdMz/OCRBktaeJHs9aP01c5+UxR6vKXG6DONZn8e
	28jUL0B4qP2CT1KFkdls4zLJFaZK6Rhr7mLwZ6kdQ1mHY8RpAdrasIDFsvK1lWb3
	ZQLfXA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au2npf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 15:39:10 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-956804755faso5008101241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776785949; x=1777390749; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XNvd2Yokfo42OCMof3NU+m9TSn1ECI2U+G+NHt/7YM=;
        b=H7fbM+glxid7RvlmkhVaDC33s2H1MOBGxFbfFCcpB8gItn7rIiOIfJ+SbBo1AbbAKt
         OP40yOqy6rQx5IupFevzGW3INSJ+8qBF/1M4I1RVoIiFXKzrvhvdHKMnNkNn5ks22OwI
         4BRyk5RtvlXB/+s+vaFvqPrAfB+FQMxSf2FewyQl5vfRSFIS6ccxQU55FpcclnxCix7W
         v7AuGbyzvLF9Z6XUWh4ziX1r0JTPuKVg3MjQCXDsAV7sZ73KP8bL0pXFMuTAYKdVhllq
         ZrNiBCg+Vf6Ls92i0Ikt5ac7qQvGYXa6rVnX9d4FUruXCk9GVUo58vCp/zkTp+/lWnzN
         PlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776785949; x=1777390749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XNvd2Yokfo42OCMof3NU+m9TSn1ECI2U+G+NHt/7YM=;
        b=FDE/hEO4Rrl209C8ER2xeScQXmEztGxn0m5jorebYrsc/pcd+EvzCcg8+E09ioueXO
         i1AVKY3cHEwrRkDmJYoT8JxOPnjj9gEnHAO02LLaSyNUO2RWn4TdgfD6fjY1mB4ka60f
         aFSXcDH7YLk3wsKnLpHicknwEVZp83Hm/AONT3/w8eHWTUzF+IYKDJKH1VIwgc0YctzI
         qjBW7yf8UkUqNkySaygRHtJVwY2Vr++YtKlTwFHsY5OsmVvasx6ftyK76GTdT0dHWGls
         eQUXJQolnVgHku9elbBvr2dKIfg5n1zXJbbMUfxhdw/49yPHwnHwk9Hzm2MOooag/4IU
         nOaA==
X-Forwarded-Encrypted: i=1; AFNElJ/xvWt6fUQyHEGKmn8BmvSfI3dD+ORV0kC7cHUxcd2W80MVvuUvx+GCXMc+F3IYZI/RHQBjxfkuzTLN8I9F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2GbcNaho0PEcYMyVy0IpMIhupYpFaKRLTY1S+AP4CVX+cWm/s
	adlKmUs5grl8IXZY5jRzTMUZVFgNCuVE5KJ8t9GrKpM9HXvylITd+WEPxu7AU5YvMWCIJPgcCWs
	g1XweGlb96QU8hDGTpw1P67gb6ywuGb01eFYFdoP+SmHe5h4ZsdqF8UnD3VYMEUcqzRlmXWsTv6
	7l
X-Gm-Gg: AeBDietxbM03b1qeCeHsMG0f+cCk+KqSDHruhE7v0S9wuub+d2WXI438XrDiZggFDwm
	FbwM1fYfVC23FVjuNJSWpNRYwJetJZujC2CpDJu2FWQ0kMs+BO3NnXmxRVNC8wG84bl4e8bguva
	MKJpwaA/4Yhu3Zo6IwDAf/ZtcBiMcwWEnZwySKymwrcO3fGBihH9Z0wPnvatjJd8y0TuA0NVg0T
	yUsaGMqYm2OH+lIk//hg1CntlFzGUkGZavsvbjDZy22dFmWukdjNYkHWJmHKGeXRLF10C0bNISx
	ehQ89nuxKR+i4dR4WGFMvlFfyjHtLFZXxM0GjCHccAMUUk2cAFgIapvVz7YLUc6bLXZGoQ6VUjI
	Uq09yZt6UU/NtqCHK9jxr68g9Dw42vmQ/Ppf2TT/W8LSprrx9NwpBKNLJEkBaIjMohI6clcEJLV
	bR6UP62zwwK6XlGhTYFTuDSq37EOezAbNsYVLol6ONpK1XUA==
X-Received: by 2002:a05:6102:5a93:b0:602:8742:1fa with SMTP id ada2fe7eead31-616fc3bb2f8mr6819583137.9.1776785949051;
        Tue, 21 Apr 2026 08:39:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5a93:b0:602:8742:1fa with SMTP id ada2fe7eead31-616fc3bb2f8mr6819566137.9.1776785948590;
        Tue, 21 Apr 2026 08:39:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm31023871fa.4.2026.04.21.08.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:39:07 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:39:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/13] drm/msm: Remove obsolete perf infrastructure
Message-ID: <puvvx2h2jnoxej42blcdx357uzx37ogwnqldcynklmm4acameg@4zvnrueodcon>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-2-robin.clark@oss.qualcomm.com>
 <sidcsgvqxddatwwflohsd6gjzm5ehbs4alwaejh3pnjnlhj7vm@nqxhdtxxxizs>
 <CACSVV01TK+iLiaCofFfPU2eeMGT5HX5iW0rf=m+gjojXsjrk8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV01TK+iLiaCofFfPU2eeMGT5HX5iW0rf=m+gjojXsjrk8Q@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NSBTYWx0ZWRfXzvpzTdv1V+7Z
 EO/4wY/g9WKzX1+g69fvOH+J+3z/KTpBbGOJxoHKXGhdP28VhSz8NRrBAPEn/uGZ9uXiDQj+P++
 K24OH2pBwB2tuVbmgyTRIP/bsllgvPOjzXZawTHJwRsfVSbeuagOhK7wQin9fw5cHy2cdutO7CN
 37ks7vgdA8+CTiagjbpTn9Eee+Wg7EkO0sj+74bCsTjltk/VpucoKzUS7LBWy0kN9yK9CEp72KR
 hvVxCwhPN3pSBbwFPD5qmWGa2xzyHWux0zPb4TywdpRqjQhibh0wXHvmPPaTMBWi/9cMyIjkw+D
 AkGd6KPWrGf+aLMm/FzHVV0m3gVxGmduM8LJvy1lySwcLtGnETOiEga5gI79Cr9vmilD+vQas+B
 SK4Z44JEvS94QT1eH6H3jRrLZvbYqAk24lPcC01IdJqxUZB//QY9UNRVkw8QnqdW85D2WOxgLGy
 HP3xx/yD9rHI5c08bNQ==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e79a1e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cnqLc2S548nY-WTIRJIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: yhT0_cO5A7UlIQSV_tyWslIb-PjwdZh1
X-Proofpoint-ORIG-GUID: yhT0_cO5A7UlIQSV_tyWslIb-PjwdZh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210155
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103967-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA0E743CE32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 06:07:20AM -0700, Rob Clark wrote:
> On Mon, Apr 20, 2026 at 4:49 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Apr 20, 2026 at 03:25:23PM -0700, Rob Clark wrote:
> > > Outside of a3xx, this was never really used.  And it low-key gets in the
> > > way of the new perfcntr support (or at least it is confusing to have two
> > > things called "perf").  So lets remove it.
> > >
> > > This drops the "perf" debugfs file.  But these days, nvtop is a better
> > > option.  (Plus perfetto for newer gens.)
> >
> > Would it be possible to resurrect "perf" later? It was really useful.
> 
> Nothing is impossible.. but I was having trouble naming things with
> both old and new perf stuff in parallel.

That why I wrote about resurrecting it later, once the new stuff is in.

BTW: do you plan to get perf counters for a3xx-a5xx back? I remember
that there was some issue with a2xx ABI.

> Is it really adding value
> over nvtop?

-- 
With best wishes
Dmitry

