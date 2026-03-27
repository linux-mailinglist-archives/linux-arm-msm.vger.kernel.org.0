Return-Path: <linux-arm-msm+bounces-100432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA5XGk3gxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:53:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFE034A7DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4070F30EE538
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF42219301;
	Fri, 27 Mar 2026 19:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCf6yaB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxDFLQC4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E263815CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640870; cv=none; b=oudjMmsBWm72/GD2cs1/s/VsApjC90LM9jSs+Cj6crFnveIE3eY8XOygutj2lb3kuXuJk2vf9oXkeK0XbDKBWmTRoyHIrfd45z71WP07soDG6x9WHXie4YJI5UNVY8SFv2z19b3OqMQ86uzELegtKKwdmzYPnU7Lx3/cp0BloYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640870; c=relaxed/simple;
	bh=zuD/t5praq3ZAE27YbpjWAdFHAzQefbqiASmvO/6KtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbMnVvvgOMI5SHrV1qE9SpPR8uWxXhorr3ZfGLu9YeA4EcHYPkMowTAqUp3DCorUt79a0OXk5VLeVDzGGkqtHeorigzEqoZQE014lPphWSCj8SHayBYYqgW3MCpVjkYBJj4c0miJqx9PT8Dl3EUJjjCR8cQEVZiejyxWjQlqrD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCf6yaB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxDFLQC4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2OYc890142
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNolaSIJQnYnfyjuvjrLxsZjP4V2sU/C+yvXWyQhc54=; b=WCf6yaB0S8uXUNno
	CiUmkAawZhgsLfvpWRg2+qdg2vVK63fkaMOkaHWh5KlB4Se1i0D65SJzQJIiMeJ4
	BWM0lXoOggUa7Cr+6ZQPcx3rbaQM/4hHikcS6TyKoCjIkbDa8Idhh1Zywv6gW22C
	cHy/yZAsJHSrxTSoBNiyPSXSksWmUdTMRqUXgRqEO5tHQt2xQBYHMgFElkjEdgL1
	QlFFXmKsDyNi66lBpxPYGPrLsFKmyhz2gUHRcEjChCnz9Gw4vtxx3QNMo+19W66D
	9nDkrtADe7rht6K4mc+EH8mgMWwV7Ay1Y9sU1A6nEhmtI4SmXGtdw7Qm8kobDpay
	y+um3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6rued-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50939597b85so57744661cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640867; x=1775245667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNolaSIJQnYnfyjuvjrLxsZjP4V2sU/C+yvXWyQhc54=;
        b=RxDFLQC4p0MruP6yAkbCTN3sonZPGf1uey+7GtX0TLT+t/0z5ipquoOnGOVynJCtBl
         Qbx2cjnUT59K95iQ13BDR+EXCp98/morLlJyfV0yJaorbrAql3ok8iUTnGWv9lTwyEXc
         WRB7RfeFjXJLYBc5tGy0jU8umnt5TDS76PmssuouyBvXkG8UOPMiPF5qNWfLFrFhzcLo
         a8/oTGE3gDPqVj0bX+xR9ojqyJ5rCN4Hpu7Ratsm0T0ZJ7+mWyYc/T70yIEJcTZQYzeU
         vHfBnU5Bo2/edZ1wsDRC0sU0U3hkamL4UnhVTQKfDJVfv5KkeP96rxj8TwDjcjHvSwvV
         0keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640867; x=1775245667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNolaSIJQnYnfyjuvjrLxsZjP4V2sU/C+yvXWyQhc54=;
        b=TiY6IRJyw6r9TmOEfTqDAOnAsvhXNC2atRuVYiXvkDgcNeZJMfGuKnCv0kEalR5b5h
         GpIdaBjuLjBSdY+R1x72aNO7/uP2aycFeGR2XCYlDtcKlszsGcFwfxWYls0BTZI7qLfB
         XkEdyUCN3XYNfpnV9nj/TuA25WfSts657epEGt9AyeN0y4ItEl/X///wPqyFpJRQPWh8
         lzfUFmk3b+3H6IwWySL3Ehxn6j7FUhczldAU8xw2pM9ux/F/txx/OqilD/dYLGrge2qQ
         RFhDzr+t1yrGENrLS8ij1TWypx7sTG29QW9NXNNyvpQGs4h0rMJWNNAu2wo4DYYPZ/5D
         X7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Ws+GA2+DCCl7CGS6oQSLYLfiq446BQuACNNW9QID/DFRyxHJDRH6swtNpPTd0QhsOHZcPFSm/3iwVcfM@vger.kernel.org
X-Gm-Message-State: AOJu0YxWIyJPllQ1wsRu80VYgdn9+jiWQXUmWeqebho5fZlQln4h/1iC
	ecJkwgXSZGQkobk1H/BSBg28zwB7tOiFMPgIAVsrDs8DlvtOfuMmeLA5LpuwQfDH3jhvVqmZvcP
	MxG1fyZ7onKnGEsef37q05K+cGHjvmfEMevXbhBxI43TGVuArcxr1lztmo8w45ZHXOs3G
X-Gm-Gg: ATEYQzz4hdwsqKNLR591QlD/mNOw3IKhw7zkOxqFa8deN7C7KVTmvjIMf4yaAoqN3ui
	BTR6AttydiuhpqIvejNY/vSt8IUMkCyNy62IeDlgf0UKoJ+SHWGNpdYrkSHTfIKHvY0L1LUz/yS
	e6S9eiNdXP5y0wRNo8TjwVh/35VsmN2jME51JIp2GRGfxKvWUhqibvMCIXySuuZVr0FUu0PNYB8
	U7BtXzxJ/0tqspkXvSRATDHMpQ160Z+GCQd5nUo1V+XUoxWoqXxXUH3BjfUi5IEx7U+Kcy26NDl
	H/HZOmkI7eQ6sAU5qoUVFZdu7mq7mV3RFmzza12t5HusYsVoKORfqAK9KtENFGTIicEKnfcT/T0
	Xfen+wPdyRvW4/MUvdqX+C9/CLzZ7OqhVv2+4FhoJwnXWAsoe2ECGm9giZYc4tQHM1DUTbuU5ja
	cuqJehEDh7N0CBByw8uQCGm9FUb3Z01XHx
X-Received: by 2002:a05:622a:120a:b0:509:1326:ff24 with SMTP id d75a77b69052e-50ba384b0f1mr48714611cf.17.1774640866989;
        Fri, 27 Mar 2026 12:47:46 -0700 (PDT)
X-Received: by 2002:a05:622a:120a:b0:509:1326:ff24 with SMTP id d75a77b69052e-50ba384b0f1mr48714321cf.17.1774640866478;
        Fri, 27 Mar 2026 12:47:46 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
        Ben Dooks <ben.dooks@codethink.co.uk>
Cc: marijn.suijten@somainline.org, sean@poorly.run, jesszhan0024@gmail.com,
        abhinav.kumar@linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/hdmi: make 'msm_hdmi_pm_ops' static
Date: Fri, 27 Mar 2026 21:47:38 +0200
Message-ID: <177463970805.3488980.13091032797245779789.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310132501.195954-1-ben.dooks@codethink.co.uk>
References: <20260310132501.195954-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6dee3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=NChewM1GXYrQM836dJ4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: Y71dw_UzwY55G0M9hcokBoDcKXpvDojo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX3/bGI2zkqJQH
 HdC/9mcLDDTES9pDQuDY3MHBXb6tHUnz3O3LeVXoqjNDoVTzmV3vLmiKbihrfSsQHDOC7Krbavw
 4ryNiBj3hk/kQ1+jsAcFml4iA4e1GRYG7SfnDIoDxVWsExjnk4g7D9d5bzBbPzeaVZPVH5shdzc
 80ctj9rcSMsAZ33ACx0BWRDTjJZQc7ZS7XUhcaKaOUXDYJrvrJjQSgrIqkySeuVVqyyrScRuToO
 8tznxTpFHvHsPIEh8gynbXQb6uTI5XGmNFFLJqUagFexdVR935DdSWmg5l6yDeYVaRsYOxLQaSh
 OOdJcjbr+7bPpigIi+21gf/J/z5DdMOeQVfo18DJUKGX4QgwW34YiWIt0JJTg8wdpmix6cnWUXV
 Reh9Md9aLgZKiXKbme8hM/Pp1fxW6FgD4AxT9vEYvcJhuNXfT9kuEtoPUmfCcxQGHcP85gpChhv
 qrJsMO0tML5LWNdRfOQ==
X-Proofpoint-GUID: Y71dw_UzwY55G0M9hcokBoDcKXpvDojo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100432-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[somainline.org,poorly.run,gmail.com,linux.dev,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,vger.kernel.org,ffwll.ch,gmail.com,codethink.co.uk];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCFE034A7DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026 13:25:01 +0000, Ben Dooks wrote:
> The struct 'msm_hdmi_pm_ops' is not used outside of the
> file it is defined in, so make it static.
> 
> Fixes the following sparse warning:
> drivers/gpu/drm/msm/hdmi/hdmi.c:432:1: warning: symbol 'msm_hdmi_pm_ops' was not declared. Should it be static?
> 
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/hdmi: make 'msm_hdmi_pm_ops' static
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fdbc6391b4d8

Best regards,
-- 
With best wishes
Dmitry



