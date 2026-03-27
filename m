Return-Path: <linux-arm-msm+bounces-100436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LN/KSbfxmm/PgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:48:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBB834A6ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84C633074F50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FFA38944B;
	Fri, 27 Mar 2026 19:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dS7likSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9ZAF7rO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65C386544
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640881; cv=none; b=lQDZnXmmCk73fTlYidmITREE7sqvOspJ0vN4iTvhzRj4/WESyuGKSmRr3f8S+cdaVlyAgGtPZ16GXUL4DxCY8mxrv0p6a5wNwHoLTquxEjwDPIBobsCmdeABQc2j8evbEclnvkeVTthe0pMtYFC0NC4PG0KK7B8cqquqsf9h48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640881; c=relaxed/simple;
	bh=CVqVIuGQsuwpxggOqIJiIhU2kMW8ChfRO4mSmw1QL88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UD6uTtqE9Q4fIyivlUFRgjVEXgKhjuHjl7vBt40Qrg+5ZsuzFj29HknGKqSDgEb+8++7lGRU8po/neuAr/aP3MseD0ai7gEFyzxG9aUoVOi6NO5yLcDhA44798wVUVH7t2RCVqgmw5zKB8y4wLzQJnYw89yrdF11/Ev+LDUuZ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dS7likSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9ZAF7rO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2k2w1458669
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdVOzkr0t7g78/Qkg/ZSkv1ZfQiCPqhiBwUFUrk6+V8=; b=dS7likSLevTMhGp6
	CzMztV9oBUz+LzzZrNqBTMsxua0encGfm8onpKd3ntEWsDHToinPWKQKe8r6S3v/
	cMX2afBkllO8v0dDJJR2M/vXY/W5YQRtcOmwBUwJSpgSff56arqGs5/sMQr6yvr8
	cmUWDA+ccGnalbu6jp3/rb+KwNlI6/pWT5L7HTAGKe+55ClBvsZLL66Oc2mNTVtQ
	/JaBrjKycwTmVt0kw/3o3SoRVKbUM5zEQMbG+1/ZHsZzBJUNyZbXkRwTk7856k3v
	8Z5O+rbXTO0zxubw1Yl7tReFW64Ku60AKZaxfIxsAK7L27yIxDpPnhScQA9LKs2/
	qFdPHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6m5wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50939597b85so57748681cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640878; x=1775245678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdVOzkr0t7g78/Qkg/ZSkv1ZfQiCPqhiBwUFUrk6+V8=;
        b=Z9ZAF7rOClL+gWhu2WnsidvmxgjEazSQrNLjMjL0lBd8ru7xSVu453BmfPfAiyXskV
         PBBw6X74Mqc8dLp6XdbnOvnjSczWIgZbPzOUulV6a7ZXGJF1Jgq9ufINbmMgpC3pbTfC
         YUYNexnbrdxxtYqfQ2W6SiXNWw5PfxnaUZkse2SDfDFaZM6ovN4Vy+V0/T4Ar8SVYXki
         dKeDLOgArZMjJ/TL3NwbyWoU4TH7t8yEQiZt33OekqWP2GdVIWv6VYuKLeMRFPYhM1eQ
         OAFh6kB4+wFJ6N21UzKtaT+HJaBCTE3Ox7lWDyHDMvJm1aQ+H/eEz3oLt2HuZJP08P0Z
         0WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640878; x=1775245678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YdVOzkr0t7g78/Qkg/ZSkv1ZfQiCPqhiBwUFUrk6+V8=;
        b=U1Hp62ha0DWL2qW93wG3d2AHA/Pk2ztwocVhV3O4+G/eFI67vBLGluhHRaSF/Ghm/Z
         rnSBow+j/nW+tTxbryVocAkEfM+ZDGgOyWSvXjMvh/Qvu2vumzBu0AbP1pjXN3jZ8HCq
         0X4lyJLW7RB9kgBV0lSDq6D/TV3xNn6EF0Lc+q/Ai8ybbx+mBHvau+sPe3b3jBHkYt3g
         8mpWuMJyXxqK7O+osmO9Iz8Twe/ntaXQmCUJmSVLAHoVAHIJmLQosGm29J6ssLdcCn83
         AHfv/hL+hjG82/kMZEm8hX0fbRM5beO7A2eQk3hSRufHfve+Zm7zG810EFJuXltdLMOB
         05Qg==
X-Gm-Message-State: AOJu0YzSZ3KcGXvkom9s8pBE9SKOd8fK6A9LD+JE9CNzcnwj/zRpuj92
	YHcTSl1yV7EbKEbMLc78v0XwGP3zSu/2wRftuTLn+vAHa+VTRq2R7ltkupYyoFgQL7NjNQCjmAz
	DHxIFx1ZheQ+FhDHTv1eWBOE3yqSiTROBP3kI5d7XHsVIbTPjVhYfLKNRJKG2EDOqYHxM
X-Gm-Gg: ATEYQzyqhXve1kLskTYGIvS7rS5FLQ1J1tM3J6lRRcOqybH+rw9nPIhf3S5aV2MxIm+
	rCjfHGlhzUz3xezttHL0Ik7kBVyxr5VoAI0Qv7VECT3aiLsGzRNKWDpOIjPijyRyN1+01fQUPaQ
	1eaDsFRmXbhK2V0Rc0Yu0TjQZ38vQjgaumLNc1ACB37TYUqUVwSk+/eZjv1CEAN8J5TyJb3m/oN
	bl140tiYsNjYHpnVdsM9bz0pnRwG8GIjQXnFIRzpvIAzowJkSFrSZjtUksN1cxfClahcf60Yy7g
	tv8DiJJmAxEpu3t4MrXbjHgPqXku4qAev2cR7AedDDwod8CMF7e4KT9yxXRKafpxFz2N6+JDol3
	0cPIB7Bq5eQ2+qTpz7cfTjoJmdR8nBzREQbmsaqJemp8tzc3Lj5mgIC4ViQHAdzo8y1MXtJgtsY
	QGTv1grsPwrYNQkoldBkSt39L591nkArZ6
X-Received: by 2002:ac8:5744:0:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50ba3839cd8mr53078091cf.16.1774640878280;
        Fri, 27 Mar 2026 12:47:58 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50ba3839cd8mr53077851cf.16.1774640877857;
        Fri, 27 Mar 2026 12:47:57 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
Date: Fri, 27 Mar 2026 21:47:42 +0200
Message-ID: <177463970853.3488980.13500610408173936059.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
References: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6deee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=39mIW4_-kSZLcnXInCgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: sf3uUC_wjo8dtMh8M93B861ifNIenMiv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX6Enre65em+fR
 ire3gNyto2ByM9XXlKjMmO7GD0DBnAgzxRNJwtjOTy8Nxl5wA2fiWlCY2K4bLiyrrch5E+2k0SM
 +gY84xigiv7Tkqi4c+Ew8g8kiS12LRaZK0zoIBU29CBKzNZdRuZMAAC2kMWC0FFGzyNosoWp/OP
 3M7IaAli5aHwho+bVSJ9l28/9vX1LGyqRZbHI8AF55J34Wyo35xzMTiX76EdXlcdAJrwi0HDY38
 BofRMGDsnfZrDzq/j3xgmtyWJ+cowc/AJ+BqVBiHQVnj48QDrzH5/LfNmR7nGqEJp9VHQ/bzs/i
 77dUdq7CyfiCVaQ7pmpK0vd+SDWexb+XVuJSzYtVS6u/SevFz4zj1LGFi0PDKrSobjpUhAd7CUb
 6avkCnsNUEhDmLxpQzjkpQxaZYJ59AH28xHbonzOzjpDwQOQgfSypuux/33NDvSgheaVLdoyVcI
 Rmu/qkOq/AW1ktRAxZQ==
X-Proofpoint-ORIG-GUID: sf3uUC_wjo8dtMh8M93B861ifNIenMiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[quicinc.com,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100436-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DBB834A6ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Feb 2026 15:49:02 +0200, Dmitry Baryshkov wrote:
> Turn on the switch and use virtual planes by default, enhancing
> utilisation of the display pipelines. It is still possible to use legacy
> implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> parameter.

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: enable virtual planes by default
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b0907ee59e24

Best regards,
-- 
With best wishes
Dmitry



