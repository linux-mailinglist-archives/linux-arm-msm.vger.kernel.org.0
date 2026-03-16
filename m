Return-Path: <linux-arm-msm+bounces-98013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOgsF6BRuGmKcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:53:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B537529F54F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5731530480D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2E63E5EFB;
	Mon, 16 Mar 2026 18:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3B1nt3A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q92l6VvP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973213DB627
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687055; cv=none; b=MlgzOoQVYZersGHxy8vqkz3vqIRVen29hNyTcGuRkJe89VjKAq/0FlPwOp4099cguyM0adVlI92DWiQRWHUf9qXlJpn40/go4P2eFfaE83DP773JLyHRUAsmi+av/SdB5YjaY+H7TecmZXWMQnVIe2WZF/ytRrM/7juHFHEOfMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687055; c=relaxed/simple;
	bh=MS/cRl/4Cw9btycylZnToBsjNSjnruWuKDzhlE6Z+2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Id/VHGRKXs76L+ugwYzuE8mGEUD7MFGi8yo4+t+bVjE/zk7XVqZVDKUwvsk7d3p0/RHl1EdTw5sXv5AZeXSwfNZkx5oSfZi+Evk2IUDMWL83SLpzER37s2BzwKmAvnnZ2UdUwDbtmnDZ+ci5lzUi/DnxWSrcD6D7P9RhqTKT8y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3B1nt3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q92l6VvP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GGOwsF3124528
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q8YGBda9KOWCRb2Cug1HV/KM
	YV+AJlVa1FamO6IJAT0=; b=E3B1nt3A5bsRv/nTpUsvIg4h8p7ERZNQOPCcPQtD
	ENyY83BT296WCI+Q3y34BUfmwZ++q2STnSQLYuSeYSQcU5MDe/A9Ol+7NU6L/Tyo
	oe3s2UgQJwOtk3RWMpcCteyvngj7Wp2d8lgsvOGafye8+P5inFf0N4q1EjFJIhbr
	jl7wsmnRzpErSOzzc8rOwPynWn7yKcODKJhaSGXDnG6T02IH6QnReBdcm9Xbz7RF
	RzC4AeFTQjaw8aTRRiqL5Z/rjUPNneUW5qm/pzhLIWw+jOHkJNF0R6djZiwzoEQE
	AAXMOqV13FfQ15fsHudKG4kDwvqyPZA2982RCzL+KPOKAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmhxy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:50:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so709756491cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687053; x=1774291853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8YGBda9KOWCRb2Cug1HV/KMYV+AJlVa1FamO6IJAT0=;
        b=Q92l6VvPszhEyunl6w0/9cqu7kkMLBWSAgxaL2EaFe0qOM8iBUXpIq6nwrUEJgDDE7
         WRKhVmy0+ccEfPg9SxWVHWLEX7vEektRKLjkZeBynUpWyy/w/Z0dhcekv7nFAvDQltJb
         9U9JL6JKQbzJBaZ9uD4a9K0bBvdbBczFWR/PWxMbb3qfDKXC1O+OyqVycuIFIp86x3qJ
         S1P96zGHHxZ24T5WtC5VnYA05JX9uhtWBRRvznujHiCV1x2hd54JphCxc82o4lbCmZZO
         JZ0PQE9pFm64VCaqPwmOH6+pv44wDbHyRPLGNDM3u1sXtBLrKBf7Et636RitOBe2HVr8
         YDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687053; x=1774291853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8YGBda9KOWCRb2Cug1HV/KMYV+AJlVa1FamO6IJAT0=;
        b=U5nxzt10aLeHh7CNq5ehzv7K+T+JGPuYhoTgpFtrPae4yVvaGxOwHczMj3dyTL+uHF
         mBJ6qUEaZjCO8kT3T7Er6wzPq8Ud0zsUIJoSdzpHdITOExaemCIdrGMw14VBcktNphI1
         5EJ2xGJMOzju/O31uZoqeDzlD95ZQDNr/byzrsnLZN1ueJq9qvwo4DUriTPnsyzsUUrR
         DIzzCLwRcHNh63NSKfov2jTOUveHe3svHcRj6CJsF1lMowo45ZhDgDhhjnpUeyWMxDLF
         4qzJqGDzpgr79yf/scBA9s5+9xhrR1xCXx/hakMDioNNznwwt93yfChyPjFs0jf39WB+
         Gn8g==
X-Forwarded-Encrypted: i=1; AJvYcCU0RAN7pwrT7D4ZeFvurlcdV4rn2bfqFSwqN2bsQIDKfvL1WaIC4uOa3TakTM5kJFOYrl/IgoKoDLZIJfT5@vger.kernel.org
X-Gm-Message-State: AOJu0YzGgsDScxpPs5cXYw6GvYk2ZA8NKM8gfdGRhUws/hB2GNiDgWbw
	6jjZayTYlEkIc0ZQ71GM/tZjdmtP6WGKWmf8Xu78DevYT7LgsKwrmFCzmmojiyhqemeXy4iR4J4
	WnT/uFXmIViIUOzo6aZ5jlTuF6FNrYha2z/tQlsmCJAqh3p6GKP7xNiTBrcT6yX5Tyd4C
X-Gm-Gg: ATEYQzz14BLsHb5nTWxmgINRpdIHQWM6dimdBrlh8k6qlAm84e246GqsjrH8KAGGYqo
	24hTVM5gKlE+7V2ntWT1iNF5GVZ56Gx6QV7oHo6RV+P8vhNZLAKY7b5nZDSdOplAok050UQAKwa
	AOI5F0eGnk/yyXaVkmJQh89QHp15ufQ7gggedOVXQSbZ7gO+Uti8NUPxvc94zQeRtwiKL1Vx3LQ
	NKvihkYsLDpJuguX/mui50IpZOV4GHngI8zHbLtKVwChHut7oIwJ1JksHl7myQVNaHFjvRtLfq5
	Q5ujEdWsHxPjABBg7PDrVS4j+OQVootZDfUUxKeMuEpsqJjq0JU6gW8pOzDdoDBVp99HGcjQ26R
	NpERBpzFwKaKETtKwagOiBLuV+iGSItkoe/BP2q/F/vwBw39LWtMahDtat1Om/zZJcFeQCWW3G/
	xLeTTgguBXWExpTkZsJ867bezPQfD5hGuxt6Q=
X-Received: by 2002:a05:622a:198a:b0:509:4342:9980 with SMTP id d75a77b69052e-50957cfb4d5mr190496801cf.33.1773687052862;
        Mon, 16 Mar 2026 11:50:52 -0700 (PDT)
X-Received: by 2002:a05:622a:198a:b0:509:4342:9980 with SMTP id d75a77b69052e-50957cfb4d5mr190496461cf.33.1773687052405;
        Mon, 16 Mar 2026 11:50:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162ac3sm3712137e87.46.2026.03.16.11.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:50:51 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:50:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm/adreno: Change chip_id format
Message-ID: <l5efwvmvrla3we5a5mgf2hrngtgyplla5avolda636apgycve3@fkyet2nl5d5n>
References: <20260316183436.671482-1-robin.clark@oss.qualcomm.com>
 <20260316183436.671482-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316183436.671482-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1MCBTYWx0ZWRfX/lGcz/qYk9VD
 8A6wz0PNFnTacG46Jv5af8XW0GWUkZ5T+EnHOr/YhAOLx2hOygoeRoZfxvCJtDe/yblc+61RVPW
 9dBvpfYKmDKYnxLiXFiu8WjRlyl/cb0Xhqp+oZsSKZEssCXEayJNN7AG3BQInp6CWQ9O/H16x8Y
 hOiAYufN09K7YIg7PX9F5RpCsNM9JwN1vxhCGcR/JM6hT1l/S5ADLHNtLcQwbWdmGIQXXf4qFhG
 D+FRJj+3bbtVE6TIoEEtcuxr49K9gmXMZRKth0vFmqSd14kyB7nfvkUPsF7Ba6IbMj9hgk5ra2Y
 fmHVpv/t0tjJKuMqAUinhn4FIaWSkyGLeIZInLc0MBA1F+itWRtOJztIoou3rmDoCCuyNhV3BVu
 7qWEyavwtDleKIGnnqwg/TqoG6zBaI/pKfxwnF4LBCHqMT2+wUr4voiqrn82rcX1GzSy/kXTTAJ
 XB8/qD32Yx0xOsWzPtA==
X-Proofpoint-GUID: sCw7L3xJpd9kXmbaR30v7JXMaMvKffR0
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b8510d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=LrZYsQg68yZ-jVbP9dYA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sCw7L3xJpd9kXmbaR30v7JXMaMvKffR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160150
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98013-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B537529F54F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:34:33AM -0700, Rob Clark wrote:
> The "ipv4-style" %u.%u.%u.%u used to make sense when the chip_id was
> simply encoding gen.major.minor.patch.  But this hasn't been true for
> at least a couple years.
> 
> Switch to %08x, which is still easy enough to read for older devices,
> and much easier to read with the new scheme.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

