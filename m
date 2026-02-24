Return-Path: <linux-arm-msm+bounces-93878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BuSDOwjnWkkNAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:07:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4518191D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80D48313A7B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D045243956;
	Tue, 24 Feb 2026 04:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnRcJ7+7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRU3N0cF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2B18AE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771905943; cv=none; b=l+YkNM6J1d9KZY7tav7zyoiTPZ2FI4Hym73O5CgBlB0A7IiZiXK/uDhbg7tlsJ+9bOFM2B9gzgi97BMyWgCaYe98vLa8/+gGRQLWaas3jOyzqiUQmHYPp7oVGI9eai4BQ4HUli7kR/Zbh6PlqBXwcNEFz6Hn1pKMTVS4Gn3gAzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771905943; c=relaxed/simple;
	bh=Bfl0XVvB1tcWaDvFOkOiFVScwfGT9xswD6ZYXLjGgkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LsA2PsxRo0heE2vMPQa1uXp2whkjCHDx7sZZ071hvD9ffnAMxpOynPt02FlMNek0sN3HlMuM9veEK+Locsdrso5SpfONQ45RuxwTODFDoQRgkPDyeKMxPEEJkwfXFNOVgUW4pDoa+xlOKR+y4d7xAVVvl/WcYYIgOnvYt4RjuI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnRcJ7+7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRU3N0cF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3o8vI1740954
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJCNJcyv6krVTe9H3QCOJjGUcENmq65QNQwF5TAy7pk=; b=XnRcJ7+7eOeqLr4X
	/TYxJ2iiDw4wtCZ/OwCsm/iq9ykaaAdGmINfM0uD0aP1M67Fvr0gbgm8//njJlK1
	h4UazrpL0KYUA3q0Vr4iDGZR5LBWCGQbP/EU3HKuKvb27BKKYVRCL1Jk8CvcV9n3
	GyuMITnB2n4nlm9YcURtJgaZyQthGX7Q4ACSDQZXkJrULIBn+1m0peK2qsaj0Qj2
	nzYNQu0g8CHIb1dNduj+zNxbbwoZ37DMtn2fLaWu0yyX/PKG1CE9HiFMhygs8/fu
	z55QCP9LOmrxh9qlwhvzy7ISGoKnw8SHrsOk5Yr53wkjTpQIdY7RINzAKRoWI3Ll
	tF6P5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e381a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a129cd2so6070773785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771905940; x=1772510740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJCNJcyv6krVTe9H3QCOJjGUcENmq65QNQwF5TAy7pk=;
        b=QRU3N0cFUVshKZIMdyGv/JyiX/tdZnSfev+/GDqpHpo8BwpJmYg9fez8PITV9mqnKb
         f2X6bnShIrzL7+knIDkomIfPmV6OVyszAJbvsSnLtvlXC9r4cOFZE6NruGALH8bXjp2T
         B6LbyUznIkLcnPuCILcTReBoUnRduzp8sTpQjIm3s1pYN6mJbTfozQf6tJsDUh3CVkrW
         QRfOd5AeGpZeyf8uttsRQvnFFcCN3zAXvDzo5QpIffOX8RHZPWziG4LQkQq5VBk3lsJL
         XmVA/liODawDO1j/heVoW6U2bJ7skGcbhAND/703Gdwr2lyCxPMeg9a6tKcoIJxsqe47
         9vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771905940; x=1772510740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJCNJcyv6krVTe9H3QCOJjGUcENmq65QNQwF5TAy7pk=;
        b=kxXzfAnYS0pQnfFIN0LGlhBKukZK/kwc6LEUI0lDffl8u3uYoVTjAAAGYbLm/tcZH9
         wz9m4M9jNxWsFTPc4eN8sBwZ4ESN4PIcFMSUJyQDc46Fa12xWq11TqiFfSaHhABh4omO
         cIm/yDZlesoC6VjfQXxjGWx3N3EhI6b0uJsuFfiaJe0d5i9oAZfvkuOlo8T6ELKXm1xC
         BtorQkbPw6Ta+mBJ+Ih4tIM09V0d6Xt50wnwNDGXeQBSgvlc0YRr0lxvIRnlODtQtYU/
         3oKdi7iupJLd9+YAh5dlA6sfJpKl7Syfho5R2VP7vswdNnutkXs+ehsWbrfy4Bt6LLlk
         YebA==
X-Forwarded-Encrypted: i=1; AJvYcCUMgZ9go5bLUOLlpcaDgv5uenVcO3NaC0zwiR4GPt6rsMfvZZaFCl/jV7B5gLFY0NPuNoLFjJBc7toB7oyC@vger.kernel.org
X-Gm-Message-State: AOJu0YwTlh1yn6wHeBMoeTfVohe2lWBbAbVovQ9Oss8RskEd1D6pyHkO
	gpY4Hgp6DBJyrSSOXo0SXZ1rjk79BqGpBMKCV67FL4NE9c4c3yen+FZYN5eP27DQLlqbGRLeMep
	A0kskGTbLNtGT1ukqK5EIFpYzDsfvI89Jes7q3u19eAOcmOSK51DE7DJxYzYU1AGFVk8E
X-Gm-Gg: AZuq6aLbx0YolEnu0r9mgmuFn+0gjOUBmsn3IK9IUuUT7DzS4yOLxW0t4k68Ha3Px16
	BZtbyTKFYoxyZ1Li/yw5f6g6aOyJDMXC8YgEfIJBTWpLFfZrqyAgZlUYSNvatkXpf3wBKcHDHCq
	u7o+E2X2ZxYUwhpyEpB6KOksOkNweCadRFpWDGagj26lqcMyI4Bs7ryiY1EbXCv8VJ2mf+msh07
	/J4FzNNJ+fjz12z3Zh4/L7hvqBEUu9jaqagUXz7uqKTBCZqxHvnmVZzF25OASC/ZrVSOgR3SSnG
	QcVrnc/E5CmHY0GTtzePT2uboSfr6iaQGe+le739VfZYN3LpcZUaB6odSfBwsj63C5qW4JN1ISH
	AkS2BObUBH/e7MC+wsVC4tqs86fhok2BxXRVkA3uWQgLfC9Q1/lG+wEz7KrO3nHtC7VAWt6E4ZE
	SM0orMtQofumYQOpfQOjcw10g82uZxD7OClck=
X-Received: by 2002:a05:620a:2946:b0:8ca:3715:eea5 with SMTP id af79cd13be357-8cb7be70d9cmr1773393485a.14.1771905940326;
        Mon, 23 Feb 2026 20:05:40 -0800 (PST)
X-Received: by 2002:a05:620a:2946:b0:8ca:3715:eea5 with SMTP id af79cd13be357-8cb7be70d9cmr1773392385a.14.1771905939776;
        Mon, 23 Feb 2026 20:05:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:05:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sunliming@linux.dev
Cc: sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix smatch warnings about variable dereferenced before check
Date: Tue, 24 Feb 2026 06:05:27 +0200
Message-ID: <177190591480.429979.2382561876586023167.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260130053615.24886-1-sunliming@linux.dev>
References: <20260130053615.24886-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699d2395 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=QJ83nO9Bkbp2MILl3NoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: RmTftyHn1T3f4Y45b3V19350bw0F9ksM
X-Proofpoint-ORIG-GUID: RmTftyHn1T3f4Y45b3V19350bw0F9ksM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX7+CWxRXJvBIS
 yVqpWnKpOR+0qUYWcygU+MrGs0v0AFXi88Y5xlxBYm+LAH1CooNAmZkXzqkj2boZh4nOtyLZRYH
 fHxN8pYCZQk9/XMJApLhMLeL0M54gFQ6rVzL2MloM4n4lwIKeL+AlQ9U6WoDXI1y1COAZVZlz1q
 3BCeBRVz2NpX/o0p5ZtkES1rpUI/BMqxdkVk89E6MWo57YerUTtCU+86Vgle4jfQLpKu3rU9IHV
 T5AUyhLNn9/3vSrBDAN0euNtR44vMIbIK63GolGWzNMF0jxhKFmcyeRyFitHmKGb9M9AkYW54Fp
 B7KFm58nVmr4KnDvbhuqQOgj0NsZU6mgaWluWJKjDk6G6ASs9Hk1DIbCaTxxk+swZER+mSoQuBx
 F417v2OhqHWD+1vTp6lsuMGsaRcWc1B9PP2bQuw0AlAqYj+9+F6FOMfNss9Jz50Bi63CiUrlmri
 fZl3VFTbxLv9HrNyeZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kylinos.cn,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-93878-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,gitlab.freedesktop.org:url,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84B4518191D
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 13:36:15 +0800, sunliming@linux.dev wrote:
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Fix smatch warnings about variable dereferenced before check
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b1dcc804f466

Best regards,
-- 
With best wishes
Dmitry



