Return-Path: <linux-arm-msm+bounces-98307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDNhFvD5uWlfQAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 02:03:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6472B4CFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 02:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23D9A300BCB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 01:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648A21D5ABA;
	Wed, 18 Mar 2026 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/82vxHu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4FF1tTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A438126C17
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773795818; cv=none; b=cm4+gMold38+I2nDL3spnwLcr4ZA1o81IcSb3vHfO3zxBir+st8gXyB84d7SIBxpBn6HbZ21MJYc/HhrKNMw0nNEInqT3Iye7/FzG304NqrPmF9rS2yAPoU4U4iyonaW1jLZB3bl/72HTtAY6roJrTg5ZYc+RZAmfdnYYrll5M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773795818; c=relaxed/simple;
	bh=tGiVFBD6CtFRjDNC8NMBlMybEi7pcQlyem4ppiZnNd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ff5woYtnTgUs2oj/eQDBbde+YN1bzIAgQ8iRNY7sWxXUl0Yncc5vW8BOVAiyWtIYUS5zaQa7DPWbb1Ezl6o3HS2F5eV8BI8HHd5iZWt4IcFHSGQh4xcTTJMBTc1LJPlAN5Cox6k+dVHam4qmaGK6sFONF/Nhkt6brWVD+3j4CaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/82vxHu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4FF1tTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJkJU161606
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIlQdBj7BXbUgc4O6GDmZgOdn2kMfUU7P+k7WhdvKGM=; b=U/82vxHuYb/Vapj2
	U3pYze/W0oIaat5trCvzJLtSNNqpHT9gaQ7QbgbuiotLU6eUW4Hw9tinXPh6f4gi
	tSzCukz7x2r5KTNBVpM8Mf8wWJgBULSv9ZyzFS9ogA53y9Y/f0jF4ehsbWdt3chh
	f2BusMuCdDscD9d2XAXjLZgkmykEZoXEdZEj5WeWCtR0s0LB15tVtMmKx5MAY6eB
	tQMq//uBWDIca+FTzCz/s4bC1nPGE6SCPmhtr5fwfZdDQzORg508QDp9lF8RRbho
	zsRM220uG6TQ6RyyCyMoez1g5poJJNGnCAXOMmXsZ9uN1zcX3/op+eoBrN0y84GD
	QrhHig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxkrkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:03:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd849cd562so4001281285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 18:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773795815; x=1774400615; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yIlQdBj7BXbUgc4O6GDmZgOdn2kMfUU7P+k7WhdvKGM=;
        b=i4FF1tTTVo3INwzP++94WCWRNZ54MiZ2wOL+FB4YELyJGajOb9hqybpbluoOTiY3tD
         UbpHCyCLdt8mU9RvDGM5YWxv/rRNTxq1GdPLJ51AK3BlCu1iJJCqZvpk/BeEUzjt7/8j
         CWVcOD9XDPtDDPKNKY9zlEu9o5bIMavzH8A7BooTOqkrenpzbt5jlw14A0wTcwYH1hH+
         n4fyW1gCfDaVHf6my63aSo2Db84PtJedXqoR7nA14xt68rAsPQpawTDtoNlr7kC3wwND
         ccQLlVUpAG5otubwMv3HcaTMkRj0N3HLkTFAiHxxK06R31bQmxjb3Z9oiIm76L5hROqZ
         bG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773795815; x=1774400615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yIlQdBj7BXbUgc4O6GDmZgOdn2kMfUU7P+k7WhdvKGM=;
        b=a1xJA1vQpzqdTPDE1CeH2lhCSWH3DptOhaCdRjtGwmz5qzgLrCwfAcD14HbUx8WjMD
         AXsqaHPWjCs1g0tcy2GOKV6AytKUCox1wgK8nLJaUgFmcexRWTb7krGB4cgwYz9Ovxt2
         kTO7dY7I9Oyie84SqXzFQj+xmK+uVDq5wM1EAQmzeyvG6neuMUo49Q3twCLmUYwmoM9/
         IPjl0K69NksZ8HJjVFHFg+1zvC77VgQYq49kyaGvQRLoiJeur7h3OIczbRnYe6rx6fL9
         FdxZw1/qXKM3wKStGEobymr4U6rtpH0rvW7+0jLG7yVt5vPqizUuoLuHaAT7Zol0bGlO
         0msg==
X-Forwarded-Encrypted: i=1; AJvYcCU1ACtQaXqtG9sMc3Uz4iAN0PNbpr1j1Y6Pkjfgglcqh9OBw+XATKaVokd2kyNUdS2ufcak2Xy0zXNGzteI@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAiIdmes3hLhQnIKi5AyXo7kkE8zoy2LA0qEJDsVvdm0UbNUv
	5vStt+ZaLhHZJtadl9ovEPY4rYSgXjvHFaNvFWYMFjT0qRkmkI0ngZUN/IZdYqTF+0vc+vNLwU3
	/GYxLkLvROuEN+G6msY3zeFhP/AsaT+zCUxIQkaHQQJaSfjMquUz9buNvMQDw0lGazqAA
X-Gm-Gg: ATEYQzyQK4vH6nbhy9kkFSI/gLCtodozN0yNCjqoNZNGNSE9b3sBNhMhEpuNyDEhLbD
	WYNOk88KzrqZd+tIHPXkBVu0HlDEAfk97IUR8QXVGSRsltNJ4QARCYt3+7C2ZP1v8C1AMODut/9
	3nQMWWGsnAehiG4/ceFmm35tbtbEN2FARZRp6hxACsICLA6ZUYBU8ONETT2h7z/EYad3Im4iNNA
	fYKLpcwpNEUnnwF+um5KSDdq+8ukpHgS0ZS1mAudV0KONblbmTac1QCZiYBzF2ZcmTYrA9c4JDt
	A6/rG8Gd/ofOvjDbCU46ekR8XR7DnCANYZIKlBH720/me59MFjvgByjvdFAIvyNZw+DqKCmjdid
	xxRrGPNWYMevKFsnRDtm4ELyXe2tSJUi3e0gafNO1zY8i/T4FUA7DK8dPGCqKjZK2FkcHaNRL7h
	z8j+ghTPotRaRNA7D5TjCt+ZbFlGBH+c8ZKNY=
X-Received: by 2002:a05:620a:4444:b0:8cd:b52c:5989 with SMTP id af79cd13be357-8cfad3dfd60mr243212285a.74.1773795815172;
        Tue, 17 Mar 2026 18:03:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4444:b0:8cd:b52c:5989 with SMTP id af79cd13be357-8cfad3dfd60mr243208885a.74.1773795814645;
        Tue, 17 Mar 2026 18:03:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c6e1adsm194154e87.49.2026.03.17.18.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 18:03:32 -0700 (PDT)
Date: Wed, 18 Mar 2026 03:03:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] drm/msm/dp: Drop the HPD state machine
Message-ID: <qr4anmqwa5imhx2gsftggqitasqdhr4bpqimn3e74zj5csgtvy@ozbsty6o33vg>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <9c4dad2c-25bd-47d2-bc40-9b551d023615@packett.cool>
 <a6190a6c-60ae-4d24-b396-089f3b42973f@packett.cool>
 <itszs6eu7l2zix4stdiokftgxjpqlfukbqbdg4u3sestln6pgl@yq3wud26vi25>
 <38e87937-194f-43ca-ab27-a3a9cf7267d4@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38e87937-194f-43ca-ab27-a3a9cf7267d4@packett.cool>
X-Proofpoint-GUID: 1lLd6rZcxe69s4j3WVHwqTGy7_DdDsfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAwNyBTYWx0ZWRfX9TCkgpetw8b5
 XbFWvLoYn6TYkQ6O8qhtGrp9EVUbTMz4XyujEthrYl90jCYca8Lt0RfqUdrrsyINbdT1dxl8349
 oysS3ZCjY7dOUpqJMWJUkDpiUC4CvxsH/lFoE6Sq3XzsRDlNxbZo4dGH5DtvERPVNlh3UDA7dWh
 TjyGYrCsGGjSFkCxcR/2FPUYOvebYU5TL4dM/BOq0ffmkmkTAM5lATMM5zon3wD2J5E6+qveW5P
 dNdoe3OLAiE2GAIunofWmvQXF+Mx6amXwZWzIa0dEprrweSo8aDPqY8OD6K5G3nrwsDQUWo8JeL
 KrAdDl//nXnP7MyMC+jb7Ixv5ulc2iToA/yztKEzOBCcUuEnr/qDgAc7NmHp+mp+oF1cH7hdfwx
 SfhCTY3hPoRwTgSukVVynKvzCMdJznkIgvVQXYq80tqoYcVYHA8ry/4XVnRDhrl4GbRadpkNks8
 fPf+dvnw+jlQ6TAQ3Rw==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b9f9e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IfXTajCwNyicoHrbclQA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 1lLd6rZcxe69s4j3WVHwqTGy7_DdDsfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180007
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98307-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E6472B4CFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 08:15:54PM -0300, Val Packett wrote:
> 
> On 3/16/26 12:23 AM, Dmitry Baryshkov wrote:
> > On Sat, Mar 14, 2026 at 10:10:26PM -0300, Val Packett wrote:
> > > On 3/14/26 9:51 PM, Val Packett wrote:
> > > > On 3/13/26 10:09 PM, Dmitry Baryshkov wrote:
> > > > > Currently, all HPD interrupt handling must go through the HPD state
> > > > > machine.
> > > > > 
> > > > > This has caused many issues where the DRM framework assumes that DP is
> > > > > in one state while the state machine is stuck in another state.
> > > > > 
> > > > > As discussed here [1], this series:
> > > > > 
> > > > > - Removes the state machine
> > > > > - Moves link training to atomic_enable()
> > > > > - Changes the detect() behavior to return true if a display is
> > > > > physically
> > > > >     plugged in (as opposed to if the DP link is ready).
> > > > > - Remove event queue and move internal HPD handling to hpd_notify()
> > > > > 
> > > > > To correctly detect the displays which are plugged on boot on the boards
> > > > > which use dp-connector devices, this series depends on [2]. USB-C and
> > > > > eDP panels are handled natively.
> > > > > 
> > > > > [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
> > > > > [2] https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/
> > > > Unfortunately this currently seems to mostly break link training with
> > > > USB-C, on x1e80100-dell-latitude-7455:
> > > > 
> > > > [  102.190083] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
> > > > training #2 on phy 1 failed. ret=-110
> > > > [  102.192846] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
> > > > training of LTTPR(s) failed. ret=-110
> > > > [  102.211095] [drm:msm_dp_bridge_atomic_enable [msm]] *ERROR* Failed
> > > > link training (rc=-104)
> > > > [  102.211164] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ
> > > > 0x01000000 when not busy
> > > > [  102.247168] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
> > > > training #2 on phy 1 failed. ret=-110
> > > > [  102.252859] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
> > > > training of LTTPR(s) failed. ret=-110
> > > > 
> > > > [..]
> > > Actually looks like that might've been due to having applied the [2]
> > > dp-connector series from above.
> > Interesting. The series only affects dp-connector. It can't affect
> > pmic-glink usecase.
> > 
> > > Removed it and rebooted, now plugging and unplugging multiple times between
> > > the 2 ports works fine.
> > > 
> > > Except unplug is still not reliable, the "ghost" monitor often remains after
> > > unplugging.
> > Does the patch at [3] fix the issue?
> > 
> > [3] https://lore.kernel.org/linux-arm-msm/177362655076.7429.3868048981197120360.b4-ty@kernel.org/
> 
> Yes!
> 
> Overall works better than ever now, looks like I can unplug the cable with
> the laptop closed and then open it and it's all fine, and even play with
> dual-role / gadget mode USB and plug the alt-mode/dock cable back in and it
> doesn't crash.

Tested-by?

> 
> Still, rare link training failures can happen, e.g.:

Thanks!

The link training is one of the items that I want to check next.

> > > Almost nothing is logged to dmesg, literally I've only seen this line once:
> > > [drm:msm_dp_panel_read_sink_caps [msm]] *ERROR* panel edid read failed
> > You might want to use drm.debug=0x100 to get DP-related messages.

-- 
With best wishes
Dmitry

