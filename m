Return-Path: <linux-arm-msm+bounces-100623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIplECZTyWnrxQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:28:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7DC352E91
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A690301C3EB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 16:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0B637FF4B;
	Sun, 29 Mar 2026 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaeCLS/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZ3d2bdZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9D379999
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801615; cv=none; b=A5oJbDcx0Wz8Zsn56yIwqJ+XDW/pfI6+0H0ldwQuqvRhq5B+fRWeNPxFge6ukzbN7+wrjYAmIOI10QNTtHtcuVSdgl0mTUJEjw8cqtoLB9AcZRKSauIbDkcYoMHW/HnTgFWlDPpv3PHn/bgM+0UFG8zXQ+8+QlMHSBGKSyMw2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801615; c=relaxed/simple;
	bh=BV2CRbd5Ks1bM7XWw8rz9kW/9XNhzo5Mqsm6ztgphcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/9mtU8u5duIK7EbJK5Xfhs4aSYGl7KeXuKAnVTmE3xlRnhHWyoEoXz1hx9usRNPD71YPuwA3dSCFDPEfapaIyZ6DAZj+aaKAZyoClHBfXmnFV6oFyI7dyDn/K5LEVD/559GEfCaQHI0sTYWQNHXerH29fHDJpnKDZr8ChLis4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaeCLS/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZ3d2bdZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAi4ug581611
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fdGyKkoxaQWG1ffBLul/TTDI
	k4tPeF9ND1V5q4icSaU=; b=gaeCLS/RVhM7PuJSy/D6Du30dO75tX/tFs9zmVpW
	Nx/xYZUip9bX3ulnJXW92PvIPnb4n+FIrmLcHIW1kaXNLFulVMXa8494ASY7UBme
	Xo1rRGtoy1sgZ+wvQ3xEBP/G4sCI3nTO5UdvIymzX5zMXUQBw0f88Mu9SxQfjdCM
	1W3muAYy1iiZAhm/VObGybqa6ERgmLviFUQYZ42mXa8v88YUkojouGlm49nuNZJH
	F+gytqpprj/SvWOo7E/4TmYqSDiga6w73SSka5HFos0dn4+MtLU/90IOvhggbFBo
	43gZYc9bVXIPOwbfdib5MNzzHXKPOsXc0VqVwbZ75Tun+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqkb99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:26:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so43197301cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774801613; x=1775406413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fdGyKkoxaQWG1ffBLul/TTDIk4tPeF9ND1V5q4icSaU=;
        b=WZ3d2bdZ8BWKlwitLlz1WhwhV4FvKFhkQ9myHcgvV49xGeUTGr+Nl9iwSd8egGMiJi
         4zLdn8oGABSf8kkeHU7qTEKM3k1+c78TlfJW2ppq1Lr+TzqNzR07qsll1135MMG+M5uM
         F2wxXmpQSQldtvguAP+DGEk9TKyA0ma5Ubp39YD8Kf3VMNY9AgYbeSlNvy6YI8JiIANB
         +zbruKbGWQQ7QSfsD8gC+4BD9kcgR6ChhO3MJqcD3B3E0D3yW6EyBjNZ1+WuoaL5qVzZ
         lpY+Si8Q9ZZXeHlyqADGp2I/uS1BK4qE0mZjZnPo7lKQ5AIC+l0CX82IQncDDcv4oZcC
         SRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801613; x=1775406413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdGyKkoxaQWG1ffBLul/TTDIk4tPeF9ND1V5q4icSaU=;
        b=BXU3jCmYDF7KDoGW0huqx42aARmYewhtmQnwWklDQB6poSYf1lpTh0jAwQpsC1rZn9
         M+DibW14V66ytYuKJRD9b3YEY2jgbXLD0owpUsPRkdNA0e7AQGhnpderVUa1f7oW7F/n
         m125ykENpT+zBpXay3s407agdZxu49oIaCSZy7RR1TETJCSefFyQ9oP1CUNiuhRFryrS
         eJrtZ9xQxC7k7wGaCWlC+TuRctbgnK0JmutgzXy79QIn1VPpQdjyBrwyxEdk9aZFccuk
         863YB+hkqrw2m9Vd/7X4r9YP9L9JtiQFPo5h3jkd8uGRWFf9HbK2w+9z2AlNj+f4GBCh
         5arw==
X-Forwarded-Encrypted: i=1; AJvYcCW8jqXJsfex+LD0wcTdtSFAZyGRdH0So0pSkUdx+4kk6tnrzRHJM1jYjpr7A/Dl9HTOYKn+Iumpk4/xo83a@vger.kernel.org
X-Gm-Message-State: AOJu0YzXmq2czBGSZGf+xU2EtK8i4srQg1sMxnzYdJb6QXCwHOGN+KR6
	VSU//wHIZaWI7n733kdLa3V2KQ7Dx6/dfhYcw8NvhEMDFUmmMLzAMe9ijR0/EJKv4LUKo3+xFOR
	DgNhb5s1MMkbRobNKqVMnT+8XawOtRtXVTAFDMJEoKSbgdCLE16CoZ443ye4ufg0PKZ+Z
X-Gm-Gg: ATEYQzydCmof7+IWEpCCOYzjmJxhCvy41d8xXHx11BewRN0cY0BDIbIW3WzFGCm8DUb
	a5loFvhDuiDjGkOK7vci8l6AORkv0RKBOZihRxLaRQpz9f3lGWaRyjd2wTIc1x87ztKlWT/sd4m
	/3HQ9DdgT0+YQUtenrNk4kT/j53xsQR4Hj7vFEeHSkDg36lE+3ycnyKS/l9eAZoO/imx5OXTmBJ
	d6S4pIVxrNRoinqY6za+L77R6IQZ9SvA2kV0k9uOCBc4S9i2l4KrvKS8mJVR8jlERVh2oLiuW7r
	dYGD8kRqyxcdh2QKxkAi7MpKVabv1464Y8Ex+0muEcqQhcgFsaqVEnzBwtvl8VTz0BZV0wP4iAE
	dFfiEDGMMuXzRZrFi1eFIBzPgpD7dUR29Oqu+6zl5jd2dFRCRJRsSyjQ+JoA/wrLwR6Vdzhtm3j
	sZAQ0Usig34jk8xyPILodFI9ghZrhotYI1YjA=
X-Received: by 2002:ac8:5814:0:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50ba3994b17mr129652151cf.67.1774801612745;
        Sun, 29 Mar 2026 09:26:52 -0700 (PDT)
X-Received: by 2002:ac8:5814:0:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50ba3994b17mr129651861cf.67.1774801612278;
        Sun, 29 Mar 2026 09:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd7f3sm1100534e87.23.2026.03.29.09.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:26:51 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap
 QMI requests
Message-ID: <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
X-Proofpoint-ORIG-GUID: BRENGtWA-nzaa0o8VG0crRyG2PJC-7Tr
X-Proofpoint-GUID: BRENGtWA-nzaa0o8VG0crRyG2PJC-7Tr
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c952cd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyOCBTYWx0ZWRfX5dKwvY5cFeA0
 SCyN1Ym2mpPJh/iIXLiG9DQpYoRbZZG+RgRZM+o5Xz+0kxJ+qEkvvXS/oSXg6l82fssyYHYibHT
 4FpoRdroJbzSXY6MNPvS6WEO2Mj5vG2kYJVe7dMWSN1UUsTWbKmIGRyXyDPWciTNzwGCsVHFsDh
 +SqhslpwZpVKaUIqmJyrm9HCwt20mtq4B6XKdKQ+SNrarX+CWr0lkeqmSH8/krKg3kFEyv6M9Lc
 HAGb1C8CcdtwKb8iPGRruMbu2e9i0mcHSKAVKFo1jFfoRRDYNaBeoBgxg1afaqyySEJuWWH/Jbm
 2EvAQst5HlratTO6PIPSluehYMyC2sJyJW9f6k9oBj89SvY3Zr3B/fmIvwTWhEcJ4DZCvsPkApH
 vlQSee9C+IixhbORVfO4sIt+4RwlzLBzoINczmzmB7DiLG7ZeG4Xb0mDZUevd7szijcdZ/7+KSR
 uJ/1z+kuk2DuVYfHQSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100623-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB7DC352E91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host capability QMI request.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Jeff, to my knowledge this is the best approach that we have to solve
the issue on those devices.

> 
> The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
> 
> Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
> fatal - Wi-Fi services still come up successfully if the request is simply
> skipped.
> 
> Add a device-tree quirk to skip the host capability QMI request on devices
> whose firmware does not support it.
> 
> For example, firmware build
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry

