Return-Path: <linux-arm-msm+bounces-102030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJzrADNF1GnVsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:43:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5549A3A8449
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4A82306B1B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796E938CFFF;
	Mon,  6 Apr 2026 23:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPNmE7iM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnpoGcD6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591CB3191BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518944; cv=none; b=TMUK1r0kEsantBccnOgZlTmaab9Xuebft/R/urbzdkkEqtHykahGByajI28MVabep6gs6IFOIAMepTrulBi9bC+r/3wmCGU1apKPq6gI4V8kkAKgeiVIkgIONY/IPUmfF/F3DXAcwmr54TPTjjJd7USiMAdRUFRao0XjObaRLbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518944; c=relaxed/simple;
	bh=Tq2Ql7GTVYGQftgr0GTW2YgPBI5Z1Jt5pKngTdOFTPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMe7Osdy3JWxNw0ZyZvLOxh+IpwpDnlIRIS3TjW1QvIdIwxExAemhOKUf0HU7wil35GNyg9DHW0TEOeq4dlGLHfA+O0KXcNrxp5WH1hUS7eNaD0ex0Sm73LdFGARKBcR2lRlLlJZ3LiNxeMXLxmRwOvl1xsI6yS4Lwz9pxJsLUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPNmE7iM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnpoGcD6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQUbv3537479
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VYpO7m3upf97kzILCKmwygjG6qLYrb/UUREkkw0XpvI=; b=WPNmE7iMo8AlXuFv
	LhXL/96gf2hPyUqFsxRyih91QgO8BJ0tjk4QzopxX7gnrsb1MqpFoebmDIE4+i2F
	WImfCgVrfnZO1ixifuIrR98ylwNpcViRwWYshCsNH1iYYvVCl+O3Lyhi3Oyo4Kna
	tzP4P7mug/qORAI0g2c0draN/9ke8hMxvhUlTZIJsBpNoOLmws4dlI2ybjOFxce7
	7gqn4beUhu+hGjtKhxYkKc3TajwGuF3elCS11ZIxcpeLQVn9jFKnjMh5y3nvqv+p
	JGHTeZ5mffeqfSOHMN3UwPP45kiYhLyR3Voh/A3FScwiP5nJDpV8ZQuzLBlFaCyd
	m0mAqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra091e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:42:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d5d03ae80bso635808685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775518942; x=1776123742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYpO7m3upf97kzILCKmwygjG6qLYrb/UUREkkw0XpvI=;
        b=QnpoGcD6oBsrlU8RWc3dcun7THEVIQ3xtbe5mKxc4Ou2/UggqTEtPa6DKmZsO97KFD
         Sr7X4Dc9FrC73YBhGRigEGfIsV1nrfaWVTnuceFrlt4bqYSO+7jCULk4zHzq0rRI3Wqe
         499zzEBBX/U+K9j6bjQMkRCQeu12DBHObWlrIrJQw1Zl6KoqO8vPFvnOqwF/VF5MxzZK
         md9f9VEnZhnF75o0mXiZUyqn6dzYMjm4NBA0/NuwW9SpYUFcjRhYTH/g3vyKkml6A3Ds
         l4AvKKj8mFTupOXfdsJepQFj5Aq8Cao068fKeySaDoVUNHdY4VlyGn5HnIgK6+a3Gw1y
         QSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518942; x=1776123742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYpO7m3upf97kzILCKmwygjG6qLYrb/UUREkkw0XpvI=;
        b=k7xqxL0Tw4a7zEzeAQfE7NE/E6TIR4ZmfAlCOKyHU1Qzvw6I/a9kx3GD6ZBc8ETOVj
         NI9WKRZFfjsWLzqoJ3Oobk2DxniVt2PFvapceUL6rgLjN0+6w65oYxhaQ0+/Kaiqev3/
         nCkGq4hzXS587MNaJLYbCUjB3Smfat1FvfzKNtjBWESss2zs5FPt59tCyr2RfV1AuZWw
         nYKNUNOXD70qjLai5Kmkjr7XaFnv97Z4tIFj7gmHoZ0k8Bqc35VM0JDHHuDDj8Q2T4h2
         kaHcYzEJhGliETNm3sr0Pof4lMBo9ej9Z3XQC6Pd/oLPj0hr1qxqPGcZfZwWi9EhbGFg
         /chg==
X-Gm-Message-State: AOJu0YwbP6Uj0eyQtv/F6lIplaKOZUOX5uRHsR8h1ibQQMuiYn1ZQDlx
	QH1WqQQ1YH3hd2SJzvT88LqhKw4sNoTXH8yrpIvGFeyeEWagW3/MaCNTCb2V6W0nH/waFusO1YZ
	YwMg/Erw5DSTOlmUWvPtEXTZu9lWfbLlyUF5NIh94gLIajZnfJLU5CEhc7u1PsafUOEJD
X-Gm-Gg: AeBDiesSKDRqsDEl4Q/N8Mv4inhNUrQSmx0pXxzbRNuFRBnUABVc3wElxGLgd7cAelw
	/1L18QQM1FozqDDat5Zy5Mv7RR1vO2oULvNUgAGEmR4Z+da96ghobjbG0WnDb4PH712yXeJUpDB
	px3LSWPk+68TmPcpYAsS1xmnkHfDhOG1eC/s9Bs27LPuYousUwaN1OqvjUsaxNMpXrM7lXs/rn+
	DZM3cFIPRDiv9YNcluJ2yHsdVwU9hZ0TCWqF3cA53q44v6Re8Drx6eFs2ASHiLZdAgapnu/aMrA
	dNy9W8jD3C3y2KHYl99ux+zNNPLW9Mnc/vOzRMkUwOjXKuahA/lgeeQ5Tc5OWRm3K2Tmb6iy7sm
	R8aA/+X4zMS9rGWjUml0dk6aGDMfk7sMmvBVFk+j9G134M4a+V8hEZO0SFckG+/VJa8tw70eQS/
	Y+fQJDYltnyjxqpMN+il6RZC378wrlhcV/kvU=
X-Received: by 2002:a05:622a:1801:b0:50d:7204:b532 with SMTP id d75a77b69052e-50d7204c395mr183731901cf.14.1775518941543;
        Mon, 06 Apr 2026 16:42:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1801:b0:50d:7204:b532 with SMTP id d75a77b69052e-50d7204c395mr183731581cf.14.1775518941082;
        Mon, 06 Apr 2026 16:42:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm33512011fa.39.2026.04.06.16.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:42:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: drop workarounds specific to MDP5 1.0
Date: Tue,  7 Apr 2026 02:42:11 +0300
Message-ID: <177551403363.616257.10156402243953196092.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325-mdp5-further-drop-mdp1-0-v1-1-5ccee47fd1aa@oss.qualcomm.com>
References: <20260325-mdp5-further-drop-mdp1-0-v1-1-5ccee47fd1aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L_gBXzmrW_DjgVWgZMO-L_FmRo0OnIJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIzMSBTYWx0ZWRfX8F51rHkYJ6vR
 pwgiOs3gIwR9ZJcuUkcT8TRsFFk8nVHOaMstO9AeanYJKZc6EwPGdACaToA7x1BfxR/N6adre6J
 60QKRhbnonZhKyr3TV1wD9IfGHt0/VvKX+6aCTKRzL2mA8BjW1TW2eFIJ99TDm5imGTP+kgRFC3
 F7Qn1GFoZ1qCQgu+YreTA5+U3eVGdlSJ2iaA5YmBOjREbVVdNMYyrLOLMNzV4W4eaa3du9wtuZ+
 V2hlybm7JJ3P1lSS5UfjByKfb5/kq9DHjlskpPHuUVgtoWXTy8kc9K6bPiJX+WbuZ8GWPqsvACc
 LuoTJ22gRy5zVpCFuggkC5UTfCxHS3/A9NjyJJxLNPBryFGoC+eTbZhwiqur8G5CmYYNFhZOxzx
 NvrS6e9NjW1v4vMi01UGQZNMTb/ZeVY18d2dO5utc7hUJ4gbQKKG+g888Kx8Z62fyNQviCB33Ln
 lmAX8HaHGsvxwT+9Hsg==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d444de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=-owB3-D08_1IoEjBxTMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: L_gBXzmrW_DjgVWgZMO-L_FmRo0OnIJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060231
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102030-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5549A3A8449
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 05:06:06 +0200, Dmitry Baryshkov wrote:
> With support for MSM8974v1 being removed from the driver, there is no
> need to keep workarounds specific to that particular MDP5 revision. Drop
> them, slightly simplifying the logic.

Applied to msm-next, thanks!

[1/1] drm/msm/mdp5: drop workarounds specific to MDP5 1.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e224e3a167bc

Best regards,
-- 
With best wishes
Dmitry



