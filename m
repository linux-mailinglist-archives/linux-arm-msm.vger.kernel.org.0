Return-Path: <linux-arm-msm+bounces-97598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBNAO4tGtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:16:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C1287F73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73C053080C3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C235D3CAE61;
	Fri, 13 Mar 2026 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLXFsAD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JiTYLwz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3543976A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422061; cv=none; b=rttc2nx57sVExVqSt5rZr6qwskdwMpPY54d9K1c4/ku2duY5CXqZ3bF7O8StNuRHGoWyduch5xMtBzQIn6m41jyoL/xf5nIZVvYRjeJUEGkSgZBxXA6wrjk8GhniSrAxJvEwFoCkxQgHpwm9kYRYZJQbSylMN7Sj96lM0mYM06w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422061; c=relaxed/simple;
	bh=wnGrAP1sODNKavYJdLIMQN0twxFHY7qFf+lSbA16lrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5s7lzJDMKmSMmj7XjieSkwxJ8DPkee36/QpV9Zqs73lxI6YN1lbnkqAkP3D8u4VQBFLxyWpLlZOtv4G56HggJy+nkKwZr/uN/hN0bCYDnaCLWz/CuzqQmFCp4Sq71bMDeuV7SuGfBclB8eXaZnTqFzyWBf7LkJ1GgPVlICGNgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLXFsAD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JiTYLwz6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXH5G437777
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ftmGZg82HsvVE5aL4YKHhM6r
	iSgn0jTKomy1uoJs+Hg=; b=QLXFsAD2H7ZX6fLnJf0+EpaoSLC6q0bnNyo2aQPY
	6lzVMFg3UlUMFL5IhKLZNE2/Ki377wMU7wPGpP/OFBHqUO+sZgr2ZGn3AwohP8PF
	9wMmDKmrz4O/tz4RNlilIFjDqFFzE+taxTsVN4C7AtnpheIK2/LiMDlVYvnW0wCb
	rh7JKFIcigKkUunUG/PwwvHHDmEfqKQW4Z+ruSf9f7FcO8RKxr7RILqUf+a+h6KJ
	gI3L3TBDnzkGODia/VGbexez9AC3R019Ia4OBad+Coy8j/MuLX6oaq60jOOjKtn0
	eQkj/fRCqXSFDpCoIV7uvwNJaEie/UQZF8XVDS54wR+Rtw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax8brt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:14:18 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94acebd8d64so3974399241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422057; x=1774026857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftmGZg82HsvVE5aL4YKHhM6riSgn0jTKomy1uoJs+Hg=;
        b=JiTYLwz6ikZsofM0jpUh5dW0JocX5nfTSyV5/1Z3iJ61KoBddt3DuHCYBTdC0iXo5f
         0LForeC+0ixUtfvKRf9jlag6SUN/W0cT4piHguqurnc+/eYUmhnm8pZcsD2wIxh3eKyE
         J92PO0OV1rsf/LndDhzA9RFhd+77MQWvphA6Lj8+NIKDs4MtlP8KFFJQaUpfcUANC++x
         yYjAyvwb6fWkva+/Sb5YogxYZZlbx9O/EdffUaq2zKDnz7AX7yNKDl5Qd8iO7IuI/bt6
         qCxXEW3VI8pVnMQ9cdr/ugVrf+LRm9RBo+H//b2yEQBpIMP4iTGBP+WOW1S86u8jnnyB
         U5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422057; x=1774026857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftmGZg82HsvVE5aL4YKHhM6riSgn0jTKomy1uoJs+Hg=;
        b=Kf4g9jsZkAVyVvjzVc5assPqQSQa2nRNGKa8l9nUbVQDIeJ67cyqWGT7mRUHfzK0QQ
         4C0rvtjx6AkS/b5OQrU06hOI2EYVgXTLKm2DZiGZ7J3V0V6AmaO6jnKKa55LDSxTxPe+
         R/eq+Avsy4YPAExTSRbxipbpbNexvzEblKEO1OcQUW3QdbtMqGuuK5j+bvOtwmTca3wl
         4hVqiKNum/qehOeC2jnSJffhfHMsat3cZ9hc56GzGY8hugj/hrFwGTNyrhOoMVDSJ4M6
         3GcRRwA/tzgXpfsaDcj7enHJYTinA5mnkrkjylrC5D0eGiYwScgDyhXRSqE4Q3JplEO1
         9Epg==
X-Forwarded-Encrypted: i=1; AJvYcCVplJIdvlCqH9qotgR7w3CLDb33lCs5PrZFwa0vxy5RQRceGiqXJEVAaX6W1W/N0iCalyUqzypEzXk0mq7L@vger.kernel.org
X-Gm-Message-State: AOJu0YyixCMwa2w6ENoDjCQrRnOBvhGBvuuH3WkggBp+KgN46B2DtpVy
	OLO34DmxcANs1XUtbL/93vGVw1/rWRgTFU0cJ2WYEq5BcaiaZ6lfXJlCD4TiEoagSJ424/+cJks
	K0zqM/2onHCTVUMPl8gxIN+4IwCI+tqh5eMiYSsWBKcgW3cgN295X3RZLL/9dVYoW9Ztb
X-Gm-Gg: ATEYQzxb8o9tbv2HHouHdMMEyv2G1eencqeeNvNp4ld5enbL4ZYuPk7NdepMF4ox7sU
	hc7KYzBZXRfWHU95PYoa4jYRHKBKqYbP6HkCpE9T3VCPdVYwT2X6Wv6GVjmvK7YBLNjwVQ31PuK
	0uThUGT2DbhN6mAFiWw3QgvJz39DDbh+JpFPsNv3oeUjYypZoOoGaPilnz+leeM72umi9wH8Eml
	wMO0hPojkTqZRMcwpvpUwA4Prd6P82ll9NKbuhz3gD0EpS7xkOosqqLTUd5l92mEC39wHgoAdxn
	2cu85F1XbYV9oRi4GxQIS7DfwSDL0s+S7SzWnKjQ8CdZSmxzJNl3Eu7fn97qeTDJr4kMteNYTRW
	eiJk7c6cci5uhfUFpXoZZEzAXWbLKLgSrNFboLVP13tiJo968TJ6XOSaTD62TG+ESZSJzucWZUn
	roVyapgxF/tUP3E3AWCo9cVcFMy5LltF/nqSE=
X-Received: by 2002:a05:6102:304c:b0:5e5:66c6:d23e with SMTP id ada2fe7eead31-6020e1aa78bmr1715001137.1.1773422057476;
        Fri, 13 Mar 2026 10:14:17 -0700 (PDT)
X-Received: by 2002:a05:6102:304c:b0:5e5:66c6:d23e with SMTP id ada2fe7eead31-6020e1aa78bmr1714980137.1.1773422056967;
        Fri, 13 Mar 2026 10:14:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67dbc223sm16625041fa.19.2026.03.13.10.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:14:15 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:14:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
X-Proofpoint-GUID: Oc6kDpCqVqleuatf1jIUMc50TVrkpqHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOCBTYWx0ZWRfXxVlvkMmlC/ZT
 HVoKOMQNBua4BJneROITZQcQ0Ej6+v6NUjbAHmrsPGSRYBR8lFPv8m2DMcThKmRdtZDjeP/g7qy
 10DCLugoCye7BUzmzAgANuzQf3gRdqAF094+AoDgeJs+BBpqsISHFoqCapHY6hafd0s7fdcKseW
 D2lWZP9c9NetUQZWXnpxIOLQh/Ee64cuoN5AiVmVa4rqn3rLIGa6DQdfCv526E4njLRKhJW0MrR
 xHAf1dqPKOOpBkoCV5EpPgDvGAUfXiYY+JhQpWXacNgqmwIwzc8zqHmUq4wuL+sE0HKMukZsgZX
 B9tqO2lvAPY7t150L5OS+KoZsg+fyJ0hSZGoA+3MqI5MSbR2fhaHAS4RCCBvMI4sdUY5GQsg7/6
 z+c1+QVGjSnT++TsKyMFvdI8bctU7H6Z/Iq9iyzKdEk88/Q7qn43eHTiNzyeWen8PARX1tiuvfZ
 wS+KVAQK1R7/OOcFR6A==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b445ea cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=xNf9USuDAAAA:8
 a=EUspDBNiAAAA:8 a=GhyGFkOBsQlZH4ZKdbYA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: Oc6kDpCqVqleuatf1jIUMc50TVrkpqHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97598-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: 647C1287F73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
> Hi Mahadevan,
> 
> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
> > On SC7280 targets, display modes with a width greater than the
> > max_mixer_width (2400) are rejected during mode validation when
> > merge3d is disabled. This limitation exists because, without a
> > 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> > preventing large layers from being split across mixers. As a result,
> > higher resolution modes cannot be supported.
> >
> > Enable merge3d support on SC7280 to allow combining streams from
> > two layer mixers into a single non-DSC interface. This capability
> > removes the width restriction and enables buffer sizes beyond the
> > 2400-pixel limit.
> >
> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> This patch is causing display regression on QCM6490 fairphone-fp5.
> 
> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
> screen. When reverting this patch everything becomes working again.
> 
> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/issues/41
> 
> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
> quickly?

Could you please provide the resource allocation parts of
debugfs/dri/0/state for both working and non-working cases?

> 
> Regards
> Luca
> 
> #regzbot introduced: 2892de3f4f985fa779c330468e2f341fdb762ccd
> 

-- 
With best wishes
Dmitry

