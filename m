Return-Path: <linux-arm-msm+bounces-103832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AQqD9505mnKwgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:47:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99774433105
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E89103077685
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D283B0AE9;
	Mon, 20 Apr 2026 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oveS3xKe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2qtR6yA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B2C39B97E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776709928; cv=none; b=U7X59TDlXXGKqSpSTxDYcG9mICIvuT8PGf3TtfODAz6zfOn7gWkzpcuoToN2NOJ0EiiNTPShMWNFQSqE//kZXmIUOd0sY8lUKmn/Jg36PJIhxmKV3bXVhzvZ5IuVDyRUltNSf9koU5OTZWFHx2wcRMMWnOeKY3DR13dWAS42VR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776709928; c=relaxed/simple;
	bh=W6QavrvBH7AjDnv5WKZX+q/dyVslaJZVioNwIB14diY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmriMIAWHF8kzHPwKf6/l1TQOmDJ9qfEdwHPvF97l+W3mIUTx+uzs7sT6Y/pm6XLgMiQLrS90/HFZ1gU8OW9lJrQHacDGOjbrUDwbCulo4QsfrcfU5zZ2ddJEQOMay6Ylm+1c540lekKV6ry+b8o/6USZWdowwXzT8ep7k7oJR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oveS3xKe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2qtR6yA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFRTgD1601031
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxNLE1MroW8m7Sdy5DUKFAIpmZj77ZEaz/yED/SLZB4=; b=oveS3xKe4loKoJ2d
	TPreMGrVp6gFKcGH8+y1lMRDidbu67Eku0LfVNnby24DZi0miSHxxGEojiLBh9nV
	8F/eaQPzDgJHIqOLGir7oNwkL4aypNjpwmfN9hiMBT260fHdG5xqxR8lU6GNCTZ3
	WHPqrDG9B1zL5l4PJo3h2wd0NPw564mvOhij9K+7csCfhUJU+A5bWLDsSlpqqtCu
	H6nj+niD3ht6oDTUIxC67JN1G5Y29/VY2pwGE9Glh8MEdqJx7G3NEi2LwmTIOtCN
	MzgE+EPK41fvg+eyMVatnLFA2XQ1qPzkzqq9YKRcuDSpnnj5PfXchMzoGNFY9+MM
	P/YekQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89a35n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:32:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6101726c594so1370764137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776709924; x=1777314724; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MxNLE1MroW8m7Sdy5DUKFAIpmZj77ZEaz/yED/SLZB4=;
        b=L2qtR6yA/U8hDlOc8p6zat0Suod2dr8svLdq8a3LBd0qhDZjanIQfhOzPYdNg6SXRt
         x0g4wc0/XC9nJuif6xHKnHKgEin0f4zDgCvTSmSvDd9wgG2nwL7iv3ZAyGsmJpGNbiNV
         mlkjRdNUd269uK6tReU9sZ9WXg5bI59R7lybePzgynVnMAda78Q9AKSXWHtHfzc2uobS
         hjj1OdXlFMLrQNS9onzzviqdBFvP9zz8+X63ZIoqsjpn1VUeLjphFtH9Vq2XNi9Qvak1
         rlEbkPWMP2Y0PBKmaekf7Cbi1mVqgmH6qivlhCbJbCEMwT/FxxRr6wQfw+FFlujLXX6m
         GouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776709924; x=1777314724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxNLE1MroW8m7Sdy5DUKFAIpmZj77ZEaz/yED/SLZB4=;
        b=m0wtUZ14cTNKS7b55cS0nNonmHQmqDLjG8gNfQ0jvdIyX6G6/U1ZVRvFoodYct5ufz
         v4WhOv1zk8wT4zSYrfC/bZf0cLo6R4p089DEz3iFm8yutucU33gs4Fd14/0aVEd7B9/Z
         TzwLf5UPxl50BQoeDANwqI5m9AmCQZZrPF5cjtwFpj6zBjirRJc7yGjEe/OvdavyxQIK
         PpBl7sHZRie0sQ32x8GuOC6TzEV7Wo0fDd3cU7lF4bbXu75rap3uF+05E82dnrNYnloz
         jX1L2KNFqVzdNdZ2n0Isoxy9a8Bml2RA+yRSO2OmEi2T8T2oBqGUXQPyYhv+ySc0wNig
         DgAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fK4bBDM1MnT4wy6+OSFsns1YjclSfORgwqnpvMYdDD5c44WrMAuvHP3/BPcNHLW9ip5zhFEWdKHPADFFP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7rvF3sOpxj5AVHB9/uNvs+TBGX2nleUGcbnLKVg45MJds3hHD
	2d2PijGS+5UitkvnmciGOlS6zWm7Uwva36QevVYde01v4G6wfV2R94v9vf8s+AFSnXPCTfIZUID
	j1XtwEoVxqMrwtxJw6fQbOK5apGGEOZX2XR0AYtmDhsA2RrqH98oER0DZKYHnJ9r4qv8d
X-Gm-Gg: AeBDievUHPibZCH76lhmmQYKdOaWdawcIgtF/Xf+RqR/Vj95xtib3Sv0N9VGF4OmVCf
	NxDdFTTeit77UOdJ/NiTz/PvPwiE7V+IDuJSehJepIKi4bWpvv/dAQGucDmhY+IkilxPHukRTAC
	YritTMaWdePDK2YN88vQL+bp18obezSAg+I39pt32f0CVpSsqDKg603j065e0TJCDtjmEpIof16
	dyE8zYCj9Tom8Kf1IYIDb8stfL3/7mB93sGnjvNP2eG1WiQXJbpPqRIOAL/iODDSgDa7ThIRGiA
	A/+y20JgRoG076ijCOWLi6JHAvS4GB2/Erx/tVrI55GDBTvoZW/TFCvEVVqKWbsZcLpUgVixNgD
	nq1bWLDT9J3pngxXfyHYIMtnFz+WFnWA+PDZs3joNvDwOSGFiz7uhTpIHvai+iVwAp6N8rXqdw6
	EiN6MZBQ1qjgQ9sWp4cJoH0YQINh+PKxGdKGz++ZdFgisbIA==
X-Received: by 2002:a05:6102:956:b0:608:a960:c858 with SMTP id ada2fe7eead31-616f68c9ae6mr6129604137.8.1776709923987;
        Mon, 20 Apr 2026 11:32:03 -0700 (PDT)
X-Received: by 2002:a05:6102:956:b0:608:a960:c858 with SMTP id ada2fe7eead31-616f68c9ae6mr6129570137.8.1776709923385;
        Mon, 20 Apr 2026 11:32:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41d85f704sm2119762e87.44.2026.04.20.11.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 11:32:02 -0700 (PDT)
Date: Mon, 20 Apr 2026 21:32:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
Message-ID: <vywmtt6p3itkrbnucahzvsh6hpwqbno7al5h5zrqdcf3cejyto@pr4of7o3zdeo>
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
 <islxoe4wbqx5pl54difetdcl5lrqvfd5ysbaicxz5lv235sfmd@6hwrq3rmqx7c>
 <fffa03f6-82c5-4d87-9a41-19e6f82ec39b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fffa03f6-82c5-4d87-9a41-19e6f82ec39b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE4MCBTYWx0ZWRfX7M/jByBUEq5o
 Jf9CagNTxeaCQt/H57igoS8nqx3j8C7ZBMNT1dw+JGs62pOLgIGVzjnS40GZZXqGAFAfZpqmXFl
 V8xXqR3s+IfNQWSkVY6aqVQR0MFky/3G7aCiHwVb3f2K/1nI8hvfuNocYqz8wOy5RhLK2l2b9Bn
 5IxN4+82L0HWooQWDfAgvYrXmy6BV94cQxVAsfUyHLmsgPhSivkh/cMq/a+SHO+uybQTTXcmlCc
 m1XXTBfH/n5B5qLlIqMzxl2s7SxReuTNDE4bRjAeVdzQRKdnlJTniMCZSFiozt3Kt577M0XmpQU
 zXApSZtzcs+KX0uEgL6q5T8SfbKamPQq+xE1aZtnJvv4fdt7TVvDy2vR7UVdos9DUHfmRjHE32J
 XfPRZmwkUTrSdqpvSNJI4Mh8dYiZKfDrX5XwVpq/CjknEU/iFRZmrQf6vGiDfTsRX0jvgRkLBYZ
 Bjdc8bXtuP/FSjaZoOQ==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e67124 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E1eVf6o5s5qXEWiT5LcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: L6r9KWZ3ewm-EEfUYDBx33B_elZaHNex
X-Proofpoint-GUID: L6r9KWZ3ewm-EEfUYDBx33B_elZaHNex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200180
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103832-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99774433105
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 08:47:09PM +0800, Yongxing Mou wrote:
> 
> 
> On 3/20/2026 2:36 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 02, 2026 at 04:28:29PM +0800, Yongxing Mou wrote:
> > > The eDP PHY supports both eDP&DP modes, each requires a different table.
> > > The current driver doesn't fully support every combo PHY mode and use
> > > either the eDP or DP table when enable the platform. In addition, some
> > > platforms mismatch between the mode and the table where DP mode uses
> > > the eDP table or eDP mode use the DP table.
> > > 
> > > Clean up and correct the tables for currently supported platforms based on
> > > the HPG specification.
> > > 
> > > Here lists the tables can be reused across current platforms.
> > > DP mode：
> > > 	-sa8775p/sc7280/sc8280xp/x1e80100
> > > 	-glymur
> > > eDP mode(low vdiff):
> > 
> > Separate question: should we extend phy_configure_dp_opts with the
> > low/high vdiff? Is there a point in providing the ability to toggle
> > between low vdiff and high vdiff?
> > 
> Emm ,i haven't found any platform using high vdiff so far, and I'm not clear
> in which cases switching between low and high vdiff would be needed.

From my (maybe incorrect) understanding of eDP B.3, the high vs low
vdiff selection should be based on the cable length. 

> 
> > > 	-glymur/sa8775p/sc8280xp/x1e80100
> > > 	-sc7280
> > 
> > I understand your wish to perform all the changes in a single patch, but
> > there is one problem with that. Consider this patch regresses one of the
> > platforms (I'm looking at Kodiak and SC8180X as they get the biggest set
> > of changes). It would be almost impossible to separate, which particular
> > change caused the regression. I'd suggest splitting this patch into a
> > set of more atomic changes. E.g. the AUX_CFG8 is definitely a separate
> > change. Writing swing / pre_emph tables on Kodiak and SC8180X is a
> > separate change (or two). Switching each of the platforms to the
> > corrected set of tables ideally also should come as a separate change,
> > so that in case of a regression the issue would be easier to identify.
> > 
> Thank for point this, will separate the change.
> I mostly overlooked SC8180X here, since I assumed it shares the same PHY as
> SC7280. However, they are using different PHY sub‑versions. Will add proper
> support for it in the next version.

Thanks!

> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-edp.c | 90 ++++++++++++++++++++++---------------
> > >   1 file changed, 53 insertions(+), 37 deletions(-)
> > > 

-- 
With best wishes
Dmitry

