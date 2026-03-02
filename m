Return-Path: <linux-arm-msm+bounces-94952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KIKLu2YpWnxEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:04:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 337C21DA526
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2011330AEE1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578A43E5582;
	Mon,  2 Mar 2026 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/b5Uln9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiOdjymZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084D304BB3
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459871; cv=none; b=pQ4f9+EFny8/AKBCpZmvjKk0xHbJEllznrdgwCUPMu8Ap7go7rMD1JXZ68JTTinnqrkk1eoY6Dvkt+ir0EQ7tf+QYRvnV7IX46hcVTJQN3VvwwxyuoQYkNDx7fWws8/RP+9dv3+aWG8zj07pAcdtS9Gg42HBya0CCIQmEC5XWj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459871; c=relaxed/simple;
	bh=2NtGrgGjWycDDebiOptsUWYg2UPbjSokEvZh/poZB0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSNipfLkMUFlgtgR8rkQqnlupptAfRVpCpatriSTuJPTSRbu921jS2HdzUpojc9mpbbq+hT6f0MvKjRLyTJaxZOJHyit3uj9MOfh+M8QdqLysrzZT/geMRR/XgoOn2F14JBKrs8ef0YZJH4fSXDMXDU6x9rJ6tloqRrbgdfxBLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/b5Uln9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiOdjymZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285x9S2883312
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 13:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qkH3iB4kjIas2KiqSaQBUpgT
	lIwjx8CWzuCP1dOMDyQ=; b=m/b5Uln9J52/7OQT4VhISIjxFm8maPg9IPnI7rZ4
	yy22faAvmoOqBc1yqEU0n1LwX7VXGKDeBjIwUs9J4icsk+Lav6fn32RWRQK+IZkM
	mUtGV9v422EkeeCs3NejYrvxbY8jAkd/YQ5upt1z3CXeTSMELBE/gxjN7aWOO7nW
	4zRubj2WlRV3tDBSNmdXX2ruygCdnDHMOq8ullAjtuj95gbOiNxc3U8o3XzwQxZh
	UR0oElUvD2QJk8fm0554Gm7/mRHhxH87sChT7VgcW/nBslys6IUR6wQC37V/qqdH
	heqUdE7O5mkx+R6YwhpQ9LiD+0b4h1zSV7OKypeu0AmaeQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbaukfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 13:57:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89546cbb998so423527526d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 05:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772459867; x=1773064667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qkH3iB4kjIas2KiqSaQBUpgTlIwjx8CWzuCP1dOMDyQ=;
        b=aiOdjymZqrG53mF+EjrOnO9YPGf16I1Oexss6gcw3N48zBMFcI/CYdu10hFiGZI37t
         E4OZCU8lzKH3WK7O8lSdNvKe2lGQ21QDSuTyjMvLGJk9bnY5YmPA0I3tkCr/s31/LSEJ
         69eNaIok4afP/xNFg3tdKF1pI1W7SCMVS8TZMQSg4QD68W3r6ecS1H2F4D41peXFJzhJ
         5nEqsB+ZK0+mVE6P/aI8djmVhJVXXT4vbVAQLdBNIs6/szKICYpBDPNEMbBUV/JY3Gzn
         NRQ+tw08Mhfyb1gDpNuOGuig0Pi8/ZpQNSDRqMvP9QnaYZKeflHJ1bYsFXdyEiQU0ssr
         EuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772459867; x=1773064667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkH3iB4kjIas2KiqSaQBUpgTlIwjx8CWzuCP1dOMDyQ=;
        b=dVw9bTKpflcnMkB9Ji5cF1shQY/TJMJnlj2pF0F7SwQN7NQHjqK9xG9YlVH9aNvyZY
         6XIAPOfedovzwO25Q1Jn+gEcu/2JDLQkDTdBx+ni9XU1gC2onIV8ZsnZAiR84Hn953h6
         2uwgMl9XbIodTVbNhMERSuR+MS5t8RvkGemi3pv53q36jf36fTqYEMhC11JssWjIU59K
         pZc09PGnIfktvlm1J/1Xz4s8V/sv/amr85y8LyiOeRRWsdE2Zuw5fKU0faEYgxzRXCcv
         XBsPHjc7Eb1nV0eDEkSZRFmXJFYxMQA2PXmQqNSDOqikprYfZR0l+UGaNs/sSKK/sAdS
         iAhw==
X-Forwarded-Encrypted: i=1; AJvYcCWmJEglM0JK0t/Dz2Q8ybVoLd0l9gK0hkclWxpizphfeT1pWueF05I6QtfdpzSP8Co8409llIgLAxqwu2Bd@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVcPDqZkNuTGXuNwpbyuQ1+zDXgN5AWLo5NKq6N6WYh1QNEQX
	zDgXd44V7LTdVEIVmE6lme5kq3azXC64VfquABJY1ZfFAXEisp4Uj8WYKL9QMT7JYsdv4zdnpvF
	5jgnNapvAAEBfNHxtht+KgROb42wfh8HnItLt+VlP1ilU2n6e9QAcJ0Add+EAxRDnWojb
X-Gm-Gg: ATEYQzxAJ+pakLbpg61T9id2h1WphwqNf8ueiyUkOdm/yzMsdl/2CRBBSpZQTuLBLsT
	q2F+QABAR5go7WyOS+Cp5MKbBp3UCNZa8iMl4I85z7FddH6G/VlkakSA6y+JWzuEq+xgV28bKVr
	VePoWVAdAZuUJBdaKcQh8sPZi+WL05xiC6zAc9jFrpPvFWCnecGv2MCNCxrF9Qr2DDelS9hWeQM
	7o1CiW9Gd+7djmmdMx+pdv47Nv4PuoMUDkB5oJ6iU2Mdq5q2HCI07SRdbKqVduDqFAwvczT2Gy9
	iPBKtV9hfreB17gJ02dTNJztWx6PE6fhYKZjmfgIZvz/FH5v+dzz8LS5xmBiUQVUGI6gIQvEIDV
	vzkyDBBntEjReggHA6pgBBuUowwKz7k09M11pCN8fPiBYi8lxpn4Ctvh2Rr0/8mdFsdYCFXkyeD
	ob7QnW5XgRXBN/hhe0ZvQvl5eLJRzEK0UyNng=
X-Received: by 2002:a05:620a:25c7:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cbc8df6970mr1651529385a.45.1772459867581;
        Mon, 02 Mar 2026 05:57:47 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cbc8df6970mr1651526785a.45.1772459867133;
        Mon, 02 Mar 2026 05:57:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3016dcfsm27256831fa.34.2026.03.02.05.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:57:46 -0800 (PST)
Date: Mon, 2 Mar 2026 15:57:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/mdp5: Remove MSM8974v1
Message-ID: <hpehzfsrwpekkzucn335ilryrimyip4powy22cpykxtto66sat@js5iyp2xfgho>
References: <20260302-topic-goodnight_8974v1-v1-1-e0006f7a0526@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-topic-goodnight_8974v1-v1-1-e0006f7a0526@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExNyBTYWx0ZWRfX5eTfbmMbd704
 KATeLYOhkpmD3sV8SVylgIKzKNyYyjbuNngKfYC0rkOPflZpMdaCvUfA2savOnUPWKd93vCqk1r
 fLdpcGmDCaLODlsXgTO4TVoApwP4WGdzqwJsNqHtj0PVhk/DgZM41dDTszOpiljux0hev58vXM1
 SdKoTFJN4skueaP257LL3AwDQABSyxzbCKptyVzw9sNKayrl/v2ty4LjzhMQ9sv127lLekA0oi2
 DgLmIn2E1n5J837JrCuSVJk+owiXzdteJaMxGuejMwmRVUlu33Fi2IuS6Od5C0R7pwV6bsr5tIz
 r5f+/jeWsHmzn319I5MN/hjEfFAi0D27+KG5OuSfjsmvbzGgZGT0dlRQ8XIiiVGWN3nGmc15hCV
 9dE9pEg02R1SgFl9N7nG7jV7jTWLPrthpZZ/ugMzOJgiHe8Fv7f+dv1JmlHZMMi6VxoIyWfF26Z
 86u3rB8XZKmFHKAUHnw==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5975c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1GWdzEGf9deON7KR2R8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: u9_gQimKEeWEa_mJbXd3pYo0jAR2-2RV
X-Proofpoint-GUID: u9_gQimKEeWEa_mJbXd3pYo0jAR2-2RV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94952-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 337C21DA526
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:41:26PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> To the best of my knowledge, the v1 version of this SoC had been
> superseded before any device was released on the market. Everywhere
> else in the kernel, there are assumptions about the SoC being revision
> 2 or the later MSM8974PRO.
> 
> Remove the config for that flavor of MDP. To bring the naming in line
> with the rest of the kernel, remove the v2 suffix from the remaining
> config.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> related: https://lore.kernel.org/linux-arm-msm/20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com/T/#m579aac6cddd5bd5b0adfa778061e6397082014fe
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 94 +-------------------------------
>  1 file changed, 2 insertions(+), 92 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

