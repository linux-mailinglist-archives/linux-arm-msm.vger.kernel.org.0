Return-Path: <linux-arm-msm+bounces-111603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 01X1Mp7aJWr8MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:54:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 707CA65190B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:54:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TTUSJ/G6";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IXwUF4+I;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111603-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111603-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26E76302C6F7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D7833121F;
	Sun,  7 Jun 2026 20:53:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E531F9AE
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:53:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780865588; cv=none; b=YbPp4uiGCSx1BsJFPqpTl0Ki0vTNAnKmPPmTk8ulK9Qxae+zuyBgPvp3zVeOl72HBPV/c8P+hvYpiJ8LKcEkTPyyZG56/TsZieGg9eoERXLOzOyzhFe97NdcJTTdqcwwB+SRWQMLIv7aPGkbOzdpoAf5TepxnipvNEXgWKNhkIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780865588; c=relaxed/simple;
	bh=nSG49t2rWl45pGWYF1OsDUoVekoqCmWTFjRJ1mk0I2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJgojadvaUzt2E2b4LRaJqvtfJOKeU7nznR6yP3SAlUb1ZiXARvIv1ZcxE9KqpYBB0J1a1xgtJK7ueiSldHFWWy190+eiKvNQIWKMkPvUSTqyyJwRYOrq07E/1ARUjdoTnftan2sq6jZExz61952V3xef2R8RsPaGMhs06Enc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTUSJ/G6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXwUF4+I; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EmJGE888723
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p16AzikaBGvxHOE7IgOcj9y4
	UVGtNm9juMaQ099Gfyc=; b=TTUSJ/G65OWYRJ6OpkesxCLBy4cHdz2HNiXFJvj4
	eF7eELJQLuDGB2/hbv77pWXNZ0TxKtLWjHWBK4k/hKnL/mx0R6s7Q5BJaM20UfPU
	xNHkO5MFc6dqZhAPfolh77LZh/4ArmqVGXuP9inBnHJpuCW3dlHMUY58wmv+5Hjq
	E5Z0/SENEagL+uK5XsnZw/ghm3Cpac1g11wwk6ubdv20xuO2GQt3k6Fe/saQmjYM
	/CKlZjZ9dFDSQBKyp0JHjf+i7DIE2I4IN90VwjPgVpfAUIa27CWfX31pe7KDEPcm
	RU3L0CE+B0uawkjjqpdDGgJqdOa6nPjWV+tyvnl9pCoNLQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrct1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:53:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c33d75153dso1489136137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780865585; x=1781470385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p16AzikaBGvxHOE7IgOcj9y4UVGtNm9juMaQ099Gfyc=;
        b=IXwUF4+ILgHq4AKH3BaBfbY9Ua0ItNEk3XyISsfBG5nC5v2F41+jf9GdOeZbJ2Ax5s
         5PLb4KLDcJk1fNncC01YF9uhc7LdqP/V3UYi0HWdLnSNSskttpa8ucEMoCx9u3WjUFNx
         bw5OOdkU7v2VPn4tRhT/a+uK2RmoHSRvz/nsXBxxxtEWayUetbXJN9mM2K4OA/I+/zU4
         Yt3IXkRW3mJpmiqfffxufUMMP8zlhPaSjejzihQRRgeudRlwAF+lY2eTLqybfWbAbfq+
         72bZdZj+rzH/zrGqWT5boE0C8dXg4VVEbLTDTmqitfgg7KQWMOypzPQKnj8JK1hKztZT
         w2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780865585; x=1781470385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p16AzikaBGvxHOE7IgOcj9y4UVGtNm9juMaQ099Gfyc=;
        b=ne/xJJXHH45dhh81Jy/WteF2dFLX8ok2ewz9dLsFp2+VKrOSFrdAKA9Su9XDH6/kSj
         2M4DHXIU2SXO8mtEPJ7V0arTxhZ/2wmWfjq4ARmmNnm3lE4N4767dB9ol1yN7Eyelu3C
         QxAbdcs2yhooNvJ9jCnlJJc/DliHP5qeYKPBzlnRaNICtIitIibzuw3Tp05ve6wTo2yY
         VUiIcevkYeE4drZVxbaxQGfHvc8nLiq5M4dXyVU9Hg1TZ7aA/4yjrcvLqrfAdpFlQ7UM
         bV8ZzuVPqB9raTZaPwFsDWEQVTMgqt4mhNshpIdkgh9FQNariozNpZnMdJxc300zh6y2
         4Kxw==
X-Forwarded-Encrypted: i=1; AFNElJ+VPBCv9ljdIA6qA+nVUTDdCCrR8RupavasBaaxXP9rFSdfI/mmW6C9w7XU8oRVYKBL32oRE7IZOw4uJOkk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8WQMnFzaCE3rm+4Pwqe5dB3XKfR9m2mRkIrA336Tg4Y06i3SV
	VYFIUz6XDxMVQOGt8cI0OSIeqm05krIai5dLsbWCed/pOFGv84hw2QIcpKrqehOd2z41XBzI1/7
	sA/2bLV2p8GxzQaxO6yPiLbnv2rK/omZaqX6T4W3n7fqO0gW4J1ejhu0YHN9lnTiI8hdl
X-Gm-Gg: Acq92OE0c2r0UdnjkqwVMxZ3YZpz2ZhGxrSTf6NqgCKTNR9ImcFmnF6rYZSuJ5c8GNk
	I1bUelhN2OPOPvgtYtIiw+zZ9CH83ZDQVemLRVDqDAbdXtfGJbQ5YgSPak0zVuIZ3ZxiC8Le+p/
	OGRvQsSRP7vDa5CWmNqfTTPrecINtGGb25ArGY6RH5OQOyOay/FVbUSNoFoGm8QCBsQUn6qKAoP
	2BS05V8PF5zy3bjSYQG0+8Cvt2ZmojVIbF5jz5fQojTcAtoSKQorx4E4gyH1PEze9HihsPwthrH
	iQRQdG0royuqzYI+/zU3EvE5wdMw/Yb386ORQP5AJAWrs1z/n9Qyjv3WJoTVKvPeHgSy1taNygz
	LFVI6ZrHuyKT5YGWlMBKPj5bkxyn30QCbVhvxFO/meTAhAFu3+QqEGDwqXqtyGeHUrYOon07odL
	adX/5S6oXyWkUSHBW9ygXl5mzvbOI4X07mGS1hDvJ0OPc6zA==
X-Received: by 2002:a05:6102:6890:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-6feef09ad6dmr5751325137.5.1780865584613;
        Sun, 07 Jun 2026 13:53:04 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-6feef09ad6dmr5751314137.5.1780865584069;
        Sun, 07 Jun 2026 13:53:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990486sm3244065e87.68.2026.06.07.13.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:53:01 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:52:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Om Prakash Singh <quic_omprsing@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH 2/4] crypto: qcom-rng - Allow zero as a random number
Message-ID: <qf4lum2jd57aevapv7nognmepjpgrj4kylwkdbbslco4zn22ab@pudydze4e7ic>
References: <20260530020332.143058-1-ebiggers@kernel.org>
 <20260530020332.143058-3-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530020332.143058-3-ebiggers@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxMCBTYWx0ZWRfX1OcztTVeh+42
 zB6FVTnMA5HMW0W04kkJ/8H9rgCvvFPQre4Tpk6oXpuuE6NrIZtpN6iYyiK9QaKO69WwgNbjUtS
 npG7LfysL6jNYQiXQwrA3gVqL/BWKT/Ty969gI1rUze1c/NIXixiV+dmFEOH0RH8IZq35hEDR3D
 CvQmkc68sKYdbOcgGXsdA1nCwAqaBz5g8VWAFSDFyqaNPSa1zW8wKI3udPephIrD7+IbZz7l0yZ
 wFkNtEDII2tXxZSMMDvCpPjxxPxwyAp5Bws93V6NmePKu7TsIPr/Y6m/kU0+xKAp668tqQ87FxG
 Oue9ADQrBynxNLxbQUFFIvRnnY8W5gX4Ch7qFe7NLDuJ93vbxCJmiF2NUbVi7S6YsxG3vZYAu5B
 ChklimPAmdVivzzje1WI76Qp98WUp8LIqlMuD6VtSJ+YifgwIbYPMJqUUKGViQiElwTzRTttxOp
 YF5H3yA63PHBOS01MrQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25da31 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Ovu24umgMWGFFTF80NAA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: qcZbjze3CdFerVBRk6MqczUvzEmHsYDd
X-Proofpoint-ORIG-GUID: qcZbjze3CdFerVBRk6MqczUvzEmHsYDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070210
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111603-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,pudydze4e7ic:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 707CA65190B

On Fri, May 29, 2026 at 07:03:30PM -0700, Eric Biggers wrote:
> Zero is a valid random number and needs to be allowed.  Otherwise the
> output is distinguishable from random.

ROFL.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  drivers/crypto/qcom-rng.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

-- 
With best wishes
Dmitry

