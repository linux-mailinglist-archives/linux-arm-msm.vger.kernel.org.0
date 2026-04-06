Return-Path: <linux-arm-msm+bounces-102031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFi3D+VE1GnfsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:42:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7203A83C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2A3030117F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C1E392C34;
	Mon,  6 Apr 2026 23:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eac2oUM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EP6d4yQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD5038CFFF
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518947; cv=none; b=PZzE9RQ4osx9zr6LFhI7pDGx6whaiOjM/m82qkZywWJ8UYKGT65xgJp2ZVr10scPLNudAwTpCREohB7zhIlat9fcOI9pfZ3vQzMLboh0/W5ZboMyPTGzF4tL6/Swkg9kGcgqFuQP/Sy0IhBfSX4wWQ5Cs4or/mXncZhTRtQmTDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518947; c=relaxed/simple;
	bh=NgT/+YLKkUaacSBn4NGV5ooSuOmkS8Zu15O1bETSCuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSLe3RGXFHwbF7muP8kI/iX+6O9Uva3aH+20zr5k6nftbcJhyZQDQyhjMnFyXXkbUvTFFbaca0cUN8xNMo03rymUheYixF2u02X0epXAJCCB8l0Py2xhPCbd7jHNYa5ZrRm8ucmKQ6Z/VkYkhAWCXMrWZ+H5qjYyewFGPniRth0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eac2oUM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EP6d4yQr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQSji2550321
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QBNE/lG5K0Ju1pitUfzLaBUYmxhHI5uWe5vz/3zRmFA=; b=eac2oUM+YcUi3qaJ
	xAKTj6SwR631NEjwCDf3w7rDOZTUi4UWjQtuFG5wddp7UfrY+GizSmADeSGDDD5l
	Nr8/Qd5G8eQlIS+mioVet+mX8/5I2QlOOMYdgabOlH9Y5xolViGB5LobPBAOmYMo
	hOx+7KtGJomvO2/cFjWVmiinomKWjvm5Vjz4qbqkSs/zzPmQrFMO7U/Os4l/Pgf7
	fvwQaklgVZcbWbTpEXw5WuKYDa9OWPtLrkatlqOYSkOPSX6IxMCW/NR29/w/VIeB
	km0S0Wba9KqwOpMLsmWOvAHB2xZbDwh7NL6npKJ996gC7la9H2/U5OGvfDM3GZuS
	MRYwHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmre88wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:42:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so207057811cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775518944; x=1776123744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBNE/lG5K0Ju1pitUfzLaBUYmxhHI5uWe5vz/3zRmFA=;
        b=EP6d4yQr/tqBa250KLODQGHFdyrXuPBVub8oOCeOgbjX89wiPE/rAwahCXQAt4kvo2
         ta3okQlmD0SmqdPTn/LCKcOPcJXGR+qqX+moBSvEgT7uMrjqUFVC1i+Puct1xZqwLym9
         Icn6GsaKnKwxrCVb0SwmxP5urHbvLuS0lY4lkeRvehWbqgZFGnL2iRtYncSvU0k1vExW
         A2K6Ibh4Fubg7KHvkdp7SR54Pj0HsutuXw8peLU0SbzFuyuuSpDMpVZiLs+doUUgq+hd
         ChOKllV5Xxd9o+ZMKWDWNNb/JJgstX4+g+DJrF8r5yfBhny8S51Fg5AeuL916k742jec
         jWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518944; x=1776123744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBNE/lG5K0Ju1pitUfzLaBUYmxhHI5uWe5vz/3zRmFA=;
        b=NxNFno7b9oZC8TUWg75/8ypJe+dy9S+QfBZ86KucxX4dLrIwGpjMF05fClMEnziyBr
         KoZPJekOGrX3M4MdrjR+tiDb9xjtOczdzTpzIO8RpE3tgjf4EM8Gknm7+nAiAZt6QNPa
         pdXNChZw8D4QF4oa1skNNeYIq/jjV9SMTdYLIx7rvDRyI5qeCvj5PPjPtkmfoYYwf1st
         tP3vCDENDm6jNtNeA0nvUtnsoqIl5sWxRUvNvZpb07Th9zxTPfW2RuUQ4hFC4RmLmAYj
         O73+kr/dUI3Yofv9chUZt8Jx+D2B3YXjoAaoTqWHf9vR7mvw7P1ima4F6jgu52ds7GRz
         Af1g==
X-Gm-Message-State: AOJu0YzNvh2AvY7k3ryFpXsU2i+sR8wtuon+0sAZf43W7ptZcgikK4/X
	k+olm+Vxdg13cndlsPQy5WQjYtqANKHDywvuB8lykc9yv5psDryeUr8aHuoATkKgtjCJ7M98Y+h
	g1MtVayfn7ixpATtqnGhhknWZai64B7wc4BSdEeprUyhSLvWz2UO5b4nq+yz98Myn8AfY
X-Gm-Gg: AeBDieswVMHD2JhYy9mxJhf73NlOdiTP67i+3iBBqDdGxUzH1PqVRgD4UfKsO9gwMSa
	6KvAY8AG2InudVA15D6VmLgo0nDpYwPKfuyt4D8bRdOoEoDgeCLq72lbu8On4aRQj7DQVEtUUa6
	XNOQmqeX+rALIdgft5IOaYwgNsx1Pee/XF7ytd9y+N2PsRFlDfpDBLM7k/qdRgZPFHDuhG4yE/f
	fItyVen/rDbAk0N2qKWcJnL3YOflnsPuVrjY3wADwbYJQH4zvZke8ghX09R3LwA9CwzezLpXFk7
	KTo6GOSK26Uyd/rhkBzRsXyuclMAnkduic+lwe9I8V+/3y86Rn5M+y1grtmUqtLX0s/oMBrQn2b
	jjIek4HdZea7WPXFTS5Gk0QIg2U68Z7X34F3LmY+/pRPK4gJmGI5uHRF5ONEkrQZYvBiYeq8tKv
	RQ/wP//qM1DC6WOTe3fqNCOIKUfMvmE74gTmM=
X-Received: by 2002:a05:622a:2614:b0:50d:86cb:db75 with SMTP id d75a77b69052e-50d86cbdfd4mr114591501cf.7.1775518944410;
        Mon, 06 Apr 2026 16:42:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2614:b0:50d:86cb:db75 with SMTP id d75a77b69052e-50d86cbdfd4mr114591101cf.7.1775518943948;
        Mon, 06 Apr 2026 16:42:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm33512011fa.39.2026.04.06.16.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:42:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display/msm: move DSI PHY bindings to phy/ subdir
Date: Tue,  7 Apr 2026 02:42:12 +0300
Message-ID: <177551403338.616257.13801012061085104397.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>
References: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d444e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=jUgDIxc-ftyl2Azd1b4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: V-F5BYCAe_jHDU3q3gMyoNUCE5vZHr5h
X-Proofpoint-ORIG-GUID: V-F5BYCAe_jHDU3q3gMyoNUCE5vZHr5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIzMSBTYWx0ZWRfX7t1hxMNmTWog
 GqRz7EAY0s3CKrMOv1L7vo4NWofLucb3fLDY6HyAMfbSD8pHOIALJb6UcpO+02RSNRnNP8l3/WL
 5iRyux19Dp/MtfGeYf6qZRdk4SDkQJxwPBaCcW66GWcYmTHDAdb9GdusrZW/Y1tqnOTh6R78SzI
 8EsP5qRA9IhZxC4TQDYjkAs8w2YkEkaZZYHep4NooIFLdsXkcun2U9POrSfYQa61mBfr8DkJlRe
 MtZLlRGT2XrFLLunTGTOxb5WqfhyipJN5ISPpvvJyqJCkGU1JZItWS5wpRambyC/1VURX4z3auf
 BQB7xJv7kZEJxvyBbDzJyBJb4iVfeDdSwJ6/8NPetplcbx1ATB9UqWC0zXGsa9FZPeAiEH4cmrG
 zu9esaCfdkGdV/VfUfOihEcufOowLCo3XirNwI08gcR4RrlzEnr4rtYjCzVlJomT4C8a4NJ3ZOR
 pANf1fWgN/02O3mq6Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060231
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102031-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org,quicinc.com,marek.ca];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC7203A83C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 05 Mar 2026 01:47:12 +0200, Dmitry Baryshkov wrote:
> Historically DSI PHY bindings landed to the display/msm subdir, however
> they describe PHYs and as such they should be in the phy/ subdir.
> Follow the example of other Qualcomm display-related PHYs (HDMI, eDP)
> and move bindings for the Qualcomm DSI PHYs to the correct subdir.

Applied to msm-next, thanks!

[1/1] dt-bindings: display/msm: move DSI PHY bindings to phy/ subdir
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f94aa7e9cf68

Best regards,
-- 
With best wishes
Dmitry



