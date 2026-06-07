Return-Path: <linux-arm-msm+bounces-111590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iCQsGCDPJWrYMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:05:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EDE651707
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:05:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=brMLMMUG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dn4w8gY5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111590-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111590-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10CF13007674
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E7A32B12F;
	Sun,  7 Jun 2026 20:05:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D402475E3
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:05:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862745; cv=none; b=dV/2m1/f5DbtKP7Im5x9X/aEYqG0bBu+z+gTxZXcEvq1TqCeDP6XlP4YhhOI77cVFXqVdixANylGcWE3U39PnJ2oiz6yp/PHXVw42wvGP9wTr8adMtKrsj+Kegz4aPKhRD+kA4VcCpUqwX7kB90TNa9YNd6jlq0vhsYWR/dwXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862745; c=relaxed/simple;
	bh=XQ8o4XBTJzUDBh/1MscbS0zEhaWU3W991BV504tZT4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTZS1A7YXbES/ltzc8bZlpBeLkyR4nI6CZ6uZoCwdBP/Pb/DgHb/fSKW8InRyeLLtyJB5+6e+ODziwgXl555SEJetY8oERwC4CHOh80tmOjl+5mIPNP4TMIp8M8nWCuF/CfBXhM2bKufeguFpSe6vcLAc9tCndFg7b7pMKd+qpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brMLMMUG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dn4w8gY5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Elvvx798583
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fr4ZlPnDKIU8+Rj+BrsRCW9TbgLRUVGk8aHsSLkO0Tk=; b=brMLMMUGXXohbJ1e
	lOyG9m2BQXaQHxr7u8SetuNfzj9WqJ5z6kIEaLBjsUh/8rpp4c7gF7yBHQtvJcDi
	Gl1wPwNX2T/jiaEAEBaC+QCl0pHXDJw1mUNmPSaBL4YDp2ktqBSuXmb+FozeeMTO
	2U8XZ0LVYS8VBr+BcKv2bBk/9tbE6M85gxD+srqtgkyqYR31VfIFe74L75ZFwaoa
	QoTFRs5XWO1JO1bN8yXHs5YEURNBOyNUKvGAcGraQYORu3tpvv7QRCUqKR8e8N/L
	RChT0mRiLI/XrJsMVmLnGaLEkyh7FresUfTRIvdn5SdFK3ABLQhg9tJ+6NgvkuqX
	RbMNaA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf4unv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:05:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfd65ab97aso5377606137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862740; x=1781467540; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fr4ZlPnDKIU8+Rj+BrsRCW9TbgLRUVGk8aHsSLkO0Tk=;
        b=Dn4w8gY54VwBcMt8WbOsJA5K9WQnNTF0wIlMMGXf/Fnu2TS79S6khBLEJxnnE/qiyF
         9uEPtituHk0xTF1nLas5ea5Oc7w6UmhxFj/k4WQmNDe+KatlC+oYdHouuojTkcLGEiBL
         uyckG1m+Tz3Xpen1yT9A7MAXkT+V/uvsmZABX7sIl6d0FO+YSybTrrjbh7OTx/tQaKan
         dMN2tfs78pFM+Kvad73vzrnkGNpe5zacSBFASCP8lom8ZXU5m9pxaMXmoCm6tkR/kEw4
         GcooNpF1TXHYdShZ9EYL441OsGd7gnCRtrDrZgEnMLIhvsyYO15wLk0UrF8dhvvgeLEm
         m0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862740; x=1781467540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr4ZlPnDKIU8+Rj+BrsRCW9TbgLRUVGk8aHsSLkO0Tk=;
        b=RtOK2jX6l+uAkK3xkll/3Rcz5hcq+cUa2IPMgGC1LUBzI7aquvT7OQbtFFKq1Aa41U
         0bUxr4Qbchauyz0qz1iMaJE2EJUEPGnV4YBeNjkXG6BAHmptbTGVIkMFwDk6cURfPQzz
         yMAqlcgdFy79QDaZmkxMgaMoL8/4gPsB+IMnB8WV5EY1+YxXsYi0oxOuTWN2wfnYOUfP
         obi3qDvd7Yu2/88aonkySgkHP4Hb0vJJEiwYCSxmPC3ssyjF07jUf01mVN91CGu4JiNX
         SrYgCe7cDbrti42iQG0z3C+yxqnDQ1oex4fNqhCsw4FRQ02+OVG+R6/ncm8ueFEACAj8
         cang==
X-Forwarded-Encrypted: i=1; AFNElJ+0Z5etEni0G51e4r4vKE9x7dKc4WXdPaVpwAqVHRgIoGuL4qNFcIlMehUH9LTVn+puAIY6BPrY3+NBavFK@vger.kernel.org
X-Gm-Message-State: AOJu0YynKT28HuEQ2KGqy//tGTIsL6dnreCmkp42weEac/iZqkd2kWEy
	3eJEqUkTxaUMVNS11gM1UtAeSaUQ7GKCRwRXSdCOy2LrcTi5pEI+Q9fjVTsFXpF95N6bryyQYMd
	Nb8JkVGFASQV6DeXB0yqGsLzWILX38LEp4wTx3Z+Nwrg0kR4htgPJ87+Bvyu6iaWOqL82
X-Gm-Gg: Acq92OFqPNFMn3QAeE8dkFyVcfoqKOTQ4/GFP+VDqJhXg/InWvZ9ya51oGcZorkyfep
	kMY3rrlBR4JMEzPgN6k90PmrZxen5ULjrrgI7XH8VY3mi0rgoXFebAcWqHZRshf0cQMcxASNp2h
	35TGxvvSoPq0l0DlwRcUBBrlAQDgcO6kKuRKzaej7eMr3GTpKK0BoXLx4kgbuH3hubzvjV6JsuD
	pkQBmNbpTyz7UYnpZf79TsSbaDJnAPwkBIFSgRqZ/3QW8sDE3Pdqfdi8zHbzyy2cgWE6J6wPJWR
	+K/qPV7yVMBVqD9rM/UWNryoDRTieMwZoq9zdTAdA6QxksXNfHjsz03LUOSxLYlI9LTmMSDF+tv
	F/1KlNETEYuNt3sDfCotZBnSJnVpIzLpBCY1FM6EPLUPHkn/3Fz3htrdeoc8z0Lw1HUDd6LUumL
	w2yy/RuTDecQSK+wZr+dFROX/fF0FQcB64a9/+nPG3QJjTmw==
X-Received: by 2002:a05:6102:809b:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-6fefb0a250bmr6109557137.22.1780862739835;
        Sun, 07 Jun 2026 13:05:39 -0700 (PDT)
X-Received: by 2002:a05:6102:809b:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-6fefb0a250bmr6109552137.22.1780862739462;
        Sun, 07 Jun 2026 13:05:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b904207sm3257219e87.32.2026.06.07.13.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:05:38 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:05:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] rpmsg: glink: fix deadlock in endpoint destroy during
 driver detach
Message-ID: <j55nm6bcbwrmynrj3ig7azail5aoxmjaurbzbdcmpink7c6mh6@va26vzo3y7ey>
References: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
 <3896c47d-41c0-4b61-a115-c5d6ea282fa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3896c47d-41c0-4b61-a115-c5d6ea282fa5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a25cf14 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tuoRKqVBAySZye6t0SgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: XYAUGUzQ3xrEMqBErC9sn90PlAWcCMBw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMSBTYWx0ZWRfX7XrrOS7DFt6u
 4G6mjZblNS6LfB0oENnfAQcYzZH+V/iXu7wMbOYmkyCfTckLGTTSH89oLAWTCciXZ3p680z0nZt
 U79Qe5wYL/SYxi1+HQGtlhALo4ixOaw5ptt9s9CdOwLeV/qwozrhYojt/uBN/7xpwhDwAlFCRke
 psZWYP85hTDhiqvro3ock9kSoTQtecws0cMVci/ZXgLUHaw7z58VoYns3QCzk2MB4cClgOqyyRa
 DiEdy71rAqzaja66nEuxinXx+CWkOXmp2pqYnOEsQaOwm+PWxbEgP2aoULWIm6ue2sV1zY7Bcil
 v6MtMx2lXaRooH57O7ro0fpYjGX0pF5gVlCofXn+nCDbwRhp88iTHv3MJgkpA1IP7dwJp1wqSU/
 0YAuydVy/X2f5tJ3t2iqT2vHiWRhM+VTNqxt08b70qsUosfGk1LcXwFWlf0rRKr4etOyvbqLt+m
 QAaBzeIFPMo8Nrr/0HQ==
X-Proofpoint-GUID: XYAUGUzQ3xrEMqBErC9sn90PlAWcCMBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111590-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19EDE651707

On Fri, Jun 05, 2026 at 09:17:19AM +0800, Jie Gan wrote:
> 
> 
> On 6/4/2026 4:42 PM, Vishnu Santhosh wrote:
> > During driver detach, the device core holds the device mutex throughout
> > the driver's remove callback chain.  When the rpmsg endpoint is
> > destroyed as part of that teardown, the GLINK endpoint destroy
> > implementation attempts to unregister the underlying rpmsg device.
> > That unregistration calls device_del(), which tries to re-acquire the
> > same device mutex already held higher up the stack, causing rmmod to
> > hang indefinitely.
> > 
> > The deadlock manifests with the following call chain:
> > 
> > [<0>] device_del+0x44/0x414  <- tries to acquire same mutex
> > [<0>] device_unregister+0x18/0x34
> > [<0>] rpmsg_unregister_device+0x28/0x4c
> > [<0>] qcom_glink_remove_rpmsg_device+0x70/0xc0
> > [<0>] qcom_glink_destroy_ept+0x58/0xbc
> > [<0>] rpmsg_dev_remove+0x50/0x60
> > [<0>] device_remove+0x4c/0x80
> > [<0>] device_release_driver_internal+0x1cc/0x228  <- acquires device mutex
> > [<0>] driver_detach+0x4c/0x98
> > [<0>] bus_remove_driver+0x6c/0xbc
> > [<0>] driver_unregister+0x30/0x60
> > [<0>] unregister_rpmsg_driver+0x10/0x1c
> > [<0>] fastrpc_exit+0x28/0x38 [fastrpc]
> > [<0>] __arm64_sys_delete_module+0x1b8/0x294
> > [<0>] invoke_syscall+0x48/0x10c
> > [<0>] el0_svc_common.constprop.0+0xc0/0xe0
> > [<0>] do_el0_svc+0x1c/0x28
> > [<0>] el0_svc+0x34/0x108
> > [<0>] el0t_64_sync_handler+0xa0/0xe4
> > [<0>] el0t_64_sync+0x198/0x19c
> > 
> > The rpmsg device unregistration inside endpoint destroy is redundant.
> > In both contexts where endpoint destruction is triggered:
> > 
> > - Driver detach path: the driver core already tears down the rpmsg
> >    device.
> > 
> > - Channel close path: the rpmsg device is already unregistered before
> >    endpoint destruction is reached.
> > 
> > Remove the redundant unregistration to fix the deadlock.
> > 
> 
> Fixes: a53e356df548 ("rpmsg: glink: fix rpmsg device leak")
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

