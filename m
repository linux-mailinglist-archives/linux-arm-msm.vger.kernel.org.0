Return-Path: <linux-arm-msm+bounces-111671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fa/lAz9QJmrrUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:16:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6C652C38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:16:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AMo7IOXQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="keL4JS/J";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111671-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111671-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63962301AF4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FB736DA18;
	Mon,  8 Jun 2026 05:16:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F16D3101A2
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 05:16:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895766; cv=none; b=uCUHVMl9eYPrrkn+378kuw8327UzDVAB/yzl9xcD8EoD3v/P9Ldf/2UvliyYUFrJy2POwQnauu1MRd52drxGCbuPeWv1rDASeVm/gBIN/njEl1v9HTIQHgDnxBuhA+bo4IDzi0CBgCnVGoTVODyDkv0GnMNfzZbbaDWfjQ/svuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895766; c=relaxed/simple;
	bh=/w00nBA8qrayGXsmTYiOFmmxgnCYNEMS22WHFw2LLw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRqfPl6l0BB3AcKF8UzZosNXeySfFdzKlQKNRjN+SAEUSz34L+bpAqPyfpfSiv2HPGXTSKmvDQVU9+5sIii7w42U40Q7MqcdAZ+k//JG2FQw0Pl3Nrizf4jY090wSLn1ddfozQXSlTm1qQrE8zIf48WckHj/XcsffqzpcTqiD24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMo7IOXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keL4JS/J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580G38I2005430
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 05:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vy7CK2A8o0j2tMymlbC3Gk+F
	6Ihxe9D6CqgtXPc5aKY=; b=AMo7IOXQHbDioi2eyFYHiLGgsryazsgw2lr0p7kq
	kMPQl42qaEWBBycY7XffTacNDhCPwpXAvu7cdFGy/nNzKT7CLWgbU6vJOEiY4Hgv
	AQkbyWIrskuPtsrubkbSN6qM82hLn6k82A7/IovHlDrN/0r/qXryXpaeFq+jLrUo
	6Fld45i+ANWEJJGz/jO9OBh/KWDq3BYhi+45z6tMy9UHjtmEyrZPSxcpqX+zB+a5
	cfO9+ezcVxuq1aH3OvWIsq8T/tT3WCYcaAvLK7RQJAGYG8CJujEJ27mPRE0TuXsE
	mHrUvh+kAQCoagGQF6WiB0yCwgafkhoV3Fv7m8Jn/kvZig==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w609x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:16:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfd65ab97aso5717025137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 22:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780895762; x=1781500562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy7CK2A8o0j2tMymlbC3Gk+F6Ihxe9D6CqgtXPc5aKY=;
        b=keL4JS/JNvKHP03DewPqHdOrDuQivnBJG0mQj10MhwG37XRihSta2UTsW8k7/7uDmS
         7+RIZjsNhTaeUKHPo8rtuA9P3lwj0gCfmz5XjEwduGzJ5Rxtk1PtkPPC1x12wIE+DjZe
         GAKEUodDfPkabdekOYhaB6XrnRs0zj1LwHQpVaeU6DfSNE+CvIXueneWJeXnmx5XMk/m
         5esoMBheXFaiLeJUCZ0/qTuqs7+qPxhbTjHnEz73AIeuxtnmv7V5wzQ22EpCH047BYTP
         xO57rlmiEkRX4Aw72cl+npg0ZfkNSs6N6QtKFKO+89UWEgkFKC2THKI1PGO6eeXDbLSB
         fwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895762; x=1781500562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vy7CK2A8o0j2tMymlbC3Gk+F6Ihxe9D6CqgtXPc5aKY=;
        b=lAoQrE8oZ9dBK0Xn1AbC3P9q3a94vHpxBFtCThpnFZnZkYrWvDV6kCrR9woR+H9nd+
         YuSF4mK8kBgK8FHtRfAfKWJYxPQjzEcp8ShzJWtG9USPLVW3bY8auzomZipMiG6OkbLx
         ryqi4KZRjYGxQXERaItPrrK9gW4BQI5x+TGbd2KzpDSRfVlGbDIONCHW3vS3rZNaD7D+
         Api0/tmCeGgBpBIkIHJlrdZTgAwHkTj1FBY+PhQpAXrFdgY4D7kRGEQfAMhs4BxzmLNQ
         NA3aVkkHOrMvh9hvTiCneQsGZ9Is3QbcPHtOyTzFi5/iv/VtuFrhETBW1nDG6kEuSrBQ
         LxWg==
X-Forwarded-Encrypted: i=1; AFNElJ99BaVGo9+WkalMFFxhDA9EgL+fx+fJ8OQvqiRiaENF+WNKkSGHL222W27NrDBW04brvnMN1g8r8VFus+5F@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFOMbxVIi1rH11xDt759A+GYVjvBThZWJRnyh0uusfX+KYvI8
	lCniB/vEZ6MvkPfTstdpSuy/cGGp0SlblJ1eGdvkvym+0CFZK3nRwGC1Zh3GnIWDZiicKPBIyQI
	P8gxRl37tPLZds7zYic+uZGIDQtkTmvI6etmcWPLzfYGB7YL75imPoEaYkGcGfnWtKmVa
X-Gm-Gg: Acq92OEoIe45ifC/GHNnSD9xUHazXFBdtxOWN0JmJp6cKbJPNOkD1SruzT4ealIQh/G
	Ib+McbiHfgRXFj4PPfqEagwMtXAvKTlz61evi4Vln/pVgoqzWrTKy1PJWRXKisAk6FEH4uuWSoa
	oWNLWyRggDe8G4KNk6fCtS1Ips+LanPyppzrwJcW10MiFW8B7oPzdU6pnIEPMOROMHBS81j8iUn
	bizScee2NfDRJsC97npa+YOl5f2YJts/RgcWeHUknmwFm2fRas0MJRyuQDy89Pxd6amQGBL61TR
	hE2O7nL14uUD/3E+Qx/mEM/b8Ej0KCFNok1NqUgi8Wsaqxm86O9fXb1je8Japdm9gHjBYgiMZ+X
	A9G3MgO1Qwmo3xYH8Jd14xudbMZXhIUFwtaYI0/5kJB6geH0HKEt2JivzBz/twsTsZ6VZMKss8z
	nYZYMJgsr0o2F1dN7rRARqD2WF3Plrg+lBHzMIhiwunSjCZg==
X-Received: by 2002:a05:6102:1489:b0:6d9:5eaa:6d9c with SMTP id ada2fe7eead31-6fef0bb1d06mr6883168137.12.1780895762624;
        Sun, 07 Jun 2026 22:16:02 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:6d9:5eaa:6d9c with SMTP id ada2fe7eead31-6fef0bb1d06mr6883162137.12.1780895762206;
        Sun, 07 Jun 2026 22:16:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b0e5sm3533394e87.49.2026.06.07.22.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:16:00 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:15:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pm@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] interconnect: qcom: add COMPILE_TEST
Message-ID: <de6yvclessu7m6kjmnrfrky44vjtrhwsac25zerxiqvtsfhr6f@vw2geiyybhnz>
References: <20260608050542.6167-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608050542.6167-1-rosenp@gmail.com>
X-Proofpoint-ORIG-GUID: 93NItQEQVpsU86zp_SQKSVOpNNUiWhsX
X-Proofpoint-GUID: 93NItQEQVpsU86zp_SQKSVOpNNUiWhsX
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a265013 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=QvphVWULri5qmBRDuI0A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NSBTYWx0ZWRfXx6obCGjowZoS
 GleEpdoz+xDiHoHN7eTKwno5tSWpDk1ImcWshTPlwnILvwpk/o+z16cW624RirBCYt4QZBd0xS0
 AOSzJ3p9tNpQw2UdOLlC7D4t+zzMjDDo0HB88pFPSEo6ywA9cDP6/WLrpbn74C7b1uYRe0di5Uh
 BPHT764eKvsRjg1E0x1kvwhT74wPvqw+06IPbLDzGEb7waiRCwAtdpvUL0EezQ37M0M4E4kYigP
 eayzg+WF0tkCLKQX1DDc8BBzNJ+8Hgl5EWEJGTiD2urek/WIo46zrnJXJh95JYDKfHpfmY/J5+E
 aKXzWWtEyVWNeXfNQKsY9MINkxH+IUKcAYFJo6ujgrkeFWg12md8a5vUJfxIcHdMg4MshDjf81V
 /qnPtaFDfWO1VtktriQWs6Ve+q7MbxZTlPnP/TJ0d4rWta4zl48otW9HZ4RtHJzBprdEkkMId9j
 qLwRznHLA44v7n9Z33A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-pm@vger.kernel.org,m:djakov@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111671-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,vw2geiyybhnz:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54D6C652C38

On Sun, Jun 07, 2026 at 10:05:42PM -0700, Rosen Penev wrote:
> Allow non-ARM to build this.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/interconnect/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

