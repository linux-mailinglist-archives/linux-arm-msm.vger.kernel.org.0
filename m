Return-Path: <linux-arm-msm+bounces-109665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMu7H2hPFGqnMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:32:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E525CB297
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04C7B301A93C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E531D383981;
	Mon, 25 May 2026 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMGZ0Le7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kco22yNz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81745383C74
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715721; cv=none; b=XUggtkqGM+mxZKIAhnpySkIDqF9U4mCl18cL+9MDNEVBNyPsC+pX4GPsFrVUAkmYaHLiT3I7lfOVUVOZcSsAvyKXdLv2S2Ye8F39D821z68DqthTMczNAOXeaFJ/VvJSMrjYQObEeeTwlK7DQPDKfl/z9SZlfcZDMj5vqySIqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715721; c=relaxed/simple;
	bh=4xf+g+O1Pt1KwtsjV+eCjNEFQXjRFF+GvLFb9GuDAik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReDIQ0ykSlTGOHosyVUkmDr1FUkf42KHOoQWyp0d0Je1Ao4W166fdFJkgM4wArELp6h5rjPOkLFxoSO1ZO6HZWgqtYmfnbUBHjcwTIX353twOebDkQ/STwy+a0bQeKhuEYcGVwu9ip2Gue+fi2/2PTggIEEWnfN0Uhho37BcIeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMGZ0Le7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kco22yNz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9ZW14012691
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3vsvTb/6Fe8DgRA6zwwPppPj
	vzf3iLOZvmJxDZPKrYo=; b=TMGZ0Le7NMFB6fG0wtxslTrHN0Y6o0OdMykaD9w4
	gvIY2We44w90bZaD+rxypWal8n+XvSTLi62iKa87ZdriFCXWmocTzmODxbBSvrZr
	Yhv+lg91GXzYStbYxQr2TYUJHX5sPuQbdjYXPrZVzDDbkBndLtpq3iZo9IxXaICa
	1Ua+OpQmxHhxKglraXQGN+N2AoujYXwmXir9s7FP/lFu55MjYmFp5sQPSqbSLXVG
	FXZyxA3nfRVivqrVqnKquP/D3FRCH65+BFQ+KLJquHR2zRTu1WFRAj1jZQCtOiVE
	ksw33zbS6gFSXCuV3dj5Y4l6sf+s5uowmpA9TD/gr5ASbg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7psj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:28:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6798c46f723so1667610137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715719; x=1780320519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3vsvTb/6Fe8DgRA6zwwPppPjvzf3iLOZvmJxDZPKrYo=;
        b=Kco22yNzL7BwBqsnvd+9IXgITJzsT/D7DStW1g+E1tt+gvwCPT2tDkgWU+zPZoc0a5
         7oqjqKN/Wj0F7EJOCn6SfI38qBdXfwG5avITF917Ra9dzWfB48rIEFvwjPMDpHetESOv
         NqtTWZgsWK7F+toC9riWvsMDOHBkkU77mAz/wfyplAZ+abzDIq98BufjB/Py/Z8vbqfm
         dy0PdJlMuVz/F0EREIlo1edwLlNEuhDi3kl3fjl40vb+DZisApGBl6rPD0niTVdqeoaR
         CRK3qgQSnywZqTmfUoA5dzuNRd0tNACRErShnphsQHhvrcmdoPHbJL7+SiPclgLmXymd
         Z+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715719; x=1780320519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vsvTb/6Fe8DgRA6zwwPppPjvzf3iLOZvmJxDZPKrYo=;
        b=hvSF+TiBC1XCUBl0HWnZEcPT7hcXyvO52Vh+TfADEo1sbuR5GqJQ0Gf79aWeqU3JdQ
         koBSF7KPDmAnEOEyAnM86LxzO16w9bhbs70uQxdiW7RnBGC9y6DBW9z+GzIxdXk/N7QF
         I2Dz9hMFkffJY+GNxe214JLc6Akd1aqY0ZZoNcizfYA2QbwVsfN9qiKsMfO6m4fBQDdQ
         1O24g2iNAnVtS8ki+v4B0RHrQySK9pFhAAbFxW+lN4lzYK9d7+ofs5tvrF5mEDj2gGWY
         HgWTVT33D3EW49E+dvVTiICm2L1BHJNwnR2KeD1Hzfe5oyxk5hgTSb3mn3P6EKjDrioG
         NWKA==
X-Forwarded-Encrypted: i=1; AFNElJ8ADF+6Yxxto2O+GdhZdc0qpWsqY+fu0u/Hi/dZ3k60yw/K0P2cadU10pcXC3zn914cDzXuaTyhupdOGM/J@vger.kernel.org
X-Gm-Message-State: AOJu0Yx17fJM9GQkRY4rjVSoBdpAjQrq9ynAXcI4cOthKNYrSLsFZkXo
	ogOH+ZF2/+8QhwoNou6KEIR9Fj4tRgnJRIQCzoTLMLUVNf510Hbk57Kr1LRv9/1RPWoZauIkKOV
	JE6adAjXKyu6FoqDALtZtx/kbGIt9edqT03IjOK++oUtW81a02z9dji/016/4P5pP7l6p
X-Gm-Gg: Acq92OEgrZa/ky/i64ZvwWSLzpeD5mU6ExiU96LJf0LXgg4qHlGT3mCS4c9v6li8/5f
	BZ/e524aV2BtzkqOeY1MJWD7aXA0LU9XbCL+rn8mRNiz1KFp9r42Y/XgrLGPTR8Q74Ba3qSl1qq
	jq/E6wOKDoXSK/PPRC/rYVZQcHyZBNs5Q31429E2CX91LNQuM05Bnui+8qQoNUWZSYI/rJOoQ9u
	B6UT2rBWC+BexwhzHFciKjxQ1ijGFQe5C9MILfvGIthHHWaqldzV6JWi7b5EnTVy7RqCxKG73/8
	w8qbE+ViYZEGIfNk7xFVU8jGvRU0tzn7cdZ4qf6Mx4YYftvYe8Uvq0ueSP0Kp235dWt1BQmm0h3
	Uv1BUIk30c4A9NfMfK4XlTOJfHY5SyFswTORo+0Rvs8DI6CN/tpB7WYiJcxFezZ7y3/lp0JhlYI
	8pIrKleXlkT6eErhXEeYnOTG9IYTaGp2nxjOc=
X-Received: by 2002:a05:6102:580d:b0:631:4191:6f7e with SMTP id ada2fe7eead31-67c6f273735mr6956983137.4.1779715718770;
        Mon, 25 May 2026 06:28:38 -0700 (PDT)
X-Received: by 2002:a05:6102:580d:b0:631:4191:6f7e with SMTP id ada2fe7eead31-67c6f273735mr6956962137.4.1779715718168;
        Mon, 25 May 2026 06:28:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb37b4sm2734652e87.1.2026.05.25.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 06:28:37 -0700 (PDT)
Date: Mon, 25 May 2026 16:28:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: Re: [PATCH v1] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
Message-ID: <37zqhqm3ryyigcalimems2xvy2ccq3eyssls2pqx4qjufx57z6@w5kbehynw4h6>
References: <20260525124222.3082420-1-anandu.e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525124222.3082420-1-anandu.e@oss.qualcomm.com>
X-Proofpoint-GUID: h004_MLzOT8en0IZ4sUqiaRto78m1xhu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNyBTYWx0ZWRfX4huLqsD09/R+
 dytKaTZDVqOePbbT9gI0zzwhO/4Li5GYmNkbB9n0waGcbT/rshClgYwS5SLZ4lk+++B8A4VE4Wk
 7M99skpQekdnzjzucQC9uTDUQn4gOmH4Gls7xi2Q97ICUhEtbRH0xruprXBEhS+x+bTIfhEw4pu
 hZrnVbR1jfGqbL6+k6xTo6f+CxzJ31zmeu+yDvhIud8WX2EVlS1P/W4ZloIxFnI1xHUwP0jfJTa
 hAPXP4sf3DBQ7nVtqnN+uWMik1FVTQYWsNnkWP0tY+vIODCN+WcVrw1nTAbbJfE+7lxnOFgXYaG
 Vax7z8IgYu57ipRVAQ/SuaGFLvja1eYNgtTgS960bTJNUBW3OUi040Tl6hblhgiDDR7hVaVHM5z
 r92xAtfFaE6mhFOURD/JhOhXvMjoHaKMeIj58YRXuYa0dq7W45maC4KWFLH+bufOurxedDMhGB5
 RKCTXUxL0SRXZiOVadw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a144e87 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pCu_hpMinXdEdo1Js9MA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: h004_MLzOT8en0IZ4sUqiaRto78m1xhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250137
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109665-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8E525CB297
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 06:12:22PM +0530, Anandu Krishnan E wrote:
> fastrpc invokes work by sending an RPC message to the DSP and blocking
> in wait_for_completion_interruptible() until the DSP responds. If a
> signal arrives during this wait, the syscall returns -ERESTARTSYS and
> the invoke context which holds the in-flight DMA buffers and
> completion state is left stranded in fl->pending.
> 
> On the next syscall attempt (either auto-restarted by the kernel via
> SA_RESTART or manually retried by user-space after EINTR), a fresh
> context is allocated and the RPC message is re-sent to the DSP. This
> has two consequences:
> 
>   - The original context leaks in fl->pending until the file is closed.
>   - The DSP receives a duplicate invocation. If the DSP was mid-way
>     through processing the first request and had issued a reverse RPC
>     call back to the host, the retry sends a new forward request
>     instead of the expected reverse-RPC response. The DSP thread
>     waiting for that response is never woken, causing a hang.
> 
> Fix this by saving the interrupted context to a new fl->interrupted
> list on -ERESTARTSYS. When the same thread retries the invoke with a
> matching sc, restore the context and jump directly to the wait,
> skipping context allocation and message re-send.

What if the userspace doesn't honour -ERESTARTSYS and submits a new
workload?

> 
> Also drain fl->interrupted on process exit and complete any sleeping
> contexts with -EPIPE when the rpmsg channel is removed.
> 
> Fixes: 387f625585d1 ("misc: fastrpc: handle interrupted contexts")
> Cc: stable@kernel.org
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 69 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 53 insertions(+), 16 deletions(-)
> 

-- 
With best wishes
Dmitry

