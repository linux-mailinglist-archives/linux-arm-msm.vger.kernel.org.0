Return-Path: <linux-arm-msm+bounces-102027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEFiNtpE1GnVsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:42:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 571283A8372
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02F343021D2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E34329E40;
	Mon,  6 Apr 2026 23:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YeBexRlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0QaFQ7t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3069C388E42
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518936; cv=none; b=KEMNciptz9PShczOtdsb2PRixQrYjCdUHb+co5EFZmg5mANYEfCzFjvRXQFDcf0oOW3BKrmLkx7NvWdbAj/hjFMZtp0zRQNgboEF3QZ8TyAv/45leHWUwlpMt/ge+wBTZOYsPnjYhTp8l0CoRXWp/UFRTI4YfKyHww28M4IP1AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518936; c=relaxed/simple;
	bh=fer0fW01p8HdgmUJ9oWWroaVSUVL4T4ZCo7xbWqN9SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u+rRQ6culgiEllbhsPRWdeNG7NPLOS4fZGwsAo4+XyTTadU1rE3J74vNuHjSGt+eW3k98wAAI28O0KDAzL0mq/8mrFPvqR0PVmwcdf8BP2qrR0xu6qRMa/chMws2V2njDaHjQysdY8iI9xQyOmGHjTSDB4rCftXVdIFNgyYtSUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YeBexRlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0QaFQ7t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQQqm1584620
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6ZEeITrOvR0oJDoGpg4mIp8IqYaFSmfsX+gGF9TPAQ=; b=YeBexRlTjU23KzH7
	wzNautZn8cwHsggRIQwx6qBt1HP+nJNtDAf6XC5j5t5qNgUCkc3T4VTUPC//3cgB
	3lh+T9C8HyHHdr7BVkkfo27SahAyM0CbvTXVeGFQq2/aV9H43s9j5ey1a4r2BqR0
	hOe913tmNILbOXmlgVniQb5qCw/vX+hWFsnrNJ6vn8IIDyvThG/pj9JFksmX9h8H
	pwIj+jZrMTRIEbovGxGXWa5lQTuVxJ4KJFuCaJhgPy0XgW25D/GzU+p32UmvjIH3
	II4+01wzAXUM+pIpK4XJV2abJi1rij79GU+b8+srqFYFxEGdNPPeab8TuUVJ4jns
	zAYXRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9r8rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:42:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so1237671cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775518933; x=1776123733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6ZEeITrOvR0oJDoGpg4mIp8IqYaFSmfsX+gGF9TPAQ=;
        b=O0QaFQ7t9dNVKZ3w11mWL6aXtM+ceYQK0Wnjy7R0Ly5OBG239OYKZiwsxxVP1/LByM
         r2ExlEQPgsQxtDR89axBdbkIJk/iVwQgWAqSNmix+YSvuOqcLYdHRc7gtrDWa6z888a6
         0KWEpX+wAokBt/5um6z7QHmI0VT4HDmASLTD3D8AEhS//2mP8S6+3w2QHHZctLjrdkt9
         As2AJ/enB1UDxsmRJTzGldDdUpfOsExco2Ur20AaUP4RPAR4o8GJXmPm+TvmPCC6rn49
         ynWAcCdWyI0lsNehS/c3KeslfLVkoRKRg7uTzyYaCzv6d6w5HG3RAipiIjQ7vRVi8Bl4
         0uSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518933; x=1776123733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J6ZEeITrOvR0oJDoGpg4mIp8IqYaFSmfsX+gGF9TPAQ=;
        b=Be6QUAuGljBLeS0SIJqCmiQepFTYQdzdoKKW07J6BP3P9ZessINUZg9WLtKHpTmEtR
         hqkn7z6EJOH0gwugTc636C5/Rwk+1vy6tMmT8dbU4j1ULIGjgi83eFNdIBxznBK1WSg/
         vHr+1RIuc5vQjpaNM5NONFdZFENvdsXyVZgytXeQ0tPBv5MH4Ohv07UbecfL312wJF8l
         apX7kzlsRhnR8p9IY8qqojR4AbUTb2SWBG2Aj8HbDZ41VH9WR4jYf3hlBaANGYwPVKKH
         qj/gkmTdAmjZetrwlbA0GpT7ZkQGPfa4KlFistxeNrgCnpu3CirJX/ZWQHvU1vSwsSJA
         Sqog==
X-Gm-Message-State: AOJu0YwDSvnkxD7gfRTJ5L8oOd3WQse6uIXb/R5VB2T0uOMHfk+gRK3F
	pITdlD+VrqWFLfQ9z1H5x/RHPxJHCGC5OlC6+GSms4mjD+xQP0fhGmdU1BnmDbHYLtv9hhKp65G
	W4vqk/V8Il59WvruHY3m7jkIBcixzztw6jBXiNVcCE80khVVPcJsJTQZxaAO1dJJAnHoq
X-Gm-Gg: AeBDievZIP2DRam+/zEHlg9ybdXkyPo7LsvobE1OXSA6pD7tRHd4xflZXGGRHiaINrx
	D48wxpfPytRQEuOppGavQuf4Bjo4UDZ94L447KWWHdvsyfz8hg+RbfBqKV8BewPiM6/KRtx8zdL
	3xkZI1UGf+pLHBaYxqWMC4GPtZFqnAarLRAl8gRhRsjuQ/CBeAPpOuliPJUsR5CmoRth3HoMPkj
	R30p55CdOl9QUWFmCLn8fjzk8WV6ufaN/GtwEsI5x1ha83Vop0tbs/OXqXAaj6D4gOefahnDr5Z
	ywkmYG4//ERanWsvnHU3+xIhKJXJ6ClpuTTmkWUrt/DBdL1XCODVHDLGQT5nJiBjfoxTlIJerb/
	A3Wl7+05zyjayIyy59XGY51po7eW8aHmXQIVu6L5Sf2UATRBkgBHh/jeno3EgFTYAaUD+DyFBr8
	7Lp5mNa+oQGBGNs975jyt7dYBbV/A/7Q/ifEY=
X-Received: by 2002:a05:622a:1249:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50d8d633997mr117435921cf.14.1775518933515;
        Mon, 06 Apr 2026 16:42:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50d8d633997mr117435611cf.14.1775518933071;
        Mon, 06 Apr 2026 16:42:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm33512011fa.39.2026.04.06.16.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:42:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: correct DP MST interface configuration
Date: Tue,  7 Apr 2026 02:42:08 +0300
Message-ID: <177551403362.616257.9807566630197414296.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325-fix-dp-mst-interfaces-v1-1-186d1de3fa1b@oss.qualcomm.com>
References: <20260325-fix-dp-mst-interfaces-v1-1-186d1de3fa1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d444d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=6zy0MCPgn_BX5wD5kqsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIzMSBTYWx0ZWRfX0kaZ3sdS9Frj
 Obc/a4qxxaSbOI4q18L52Yqcn/dma3K0R8CjdMTykU7da0xDRPZlVHDAf5Yhkrs2VXE2azTpg+b
 tR3KVVlX0XeNUqEqMQnASprAC7SkrptXdikwzib2nXkgP0Y3U90lhyTftcITEXT4Gp9j/PCUnXY
 iVa8e5xMv3/Z7x+/nUu71x4CVh53sTSVVSlygNCYoQ5cxK9JYZ3OTfzwb4eiU4Qz4itb1j0wxFb
 c9J2R/sAjLY0TsC8RuNM8wxkPS0CvWOXG/Cg74ru1aPmriURf30GdT4y8B4MIcFT8B7jZ202B7X
 nFRcf6hglbz0UtiQkMYBIoJCiEvX3GcPchyE60MAneAUolge5lNhCb5mWmk4mTA4o41pepJSV1y
 kIS90hyOZU2Tk35IVJgAA+AU1zzz5iA1w/TcrweSIdyrNDaGkqSmWTE99oC+WrIk0fFz+pDSZ8e
 I+xQ95sxCNIj7eIOnMw==
X-Proofpoint-GUID: TAolcE5yNiWootH_pan22H3pYnGSwyt5
X-Proofpoint-ORIG-GUID: TAolcE5yNiWootH_pan22H3pYnGSwyt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060231
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102027-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 571283A8372
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 07:32:27 +0200, Dmitry Baryshkov wrote:
> Due to historical reasons we ended up with dummy values being specified
> for MST-related interfaces some of them had INTF_NONE, others had
> non-existing DP controller indices. Those workarounds are no longer
> necessary. Fix types and indices for all DP-MST related INTF instances.
> 
> The only exception is INTF_3 on SC8180X, which has unique design. It can
> be used either with INTF_0 / DP0 or with INTF_4 / DP1. This interface is
> left with the dummy value until somebody implements necessary bits for
> that platform.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: correct DP MST interface configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/469df8c2b571

Best regards,
-- 
With best wishes
Dmitry



