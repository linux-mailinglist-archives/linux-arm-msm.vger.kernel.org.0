Return-Path: <linux-arm-msm+bounces-118610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qLaJDpcnVGp8iwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:47:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C9746462
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:47:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jF4o180L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gChpkFGo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118610-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118610-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74B643011BD8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E0A25776;
	Sun, 12 Jul 2026 23:46:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C26384CE5
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900011; cv=none; b=ZqBfNmfYtQ8pdyfr6yhUxJ5XpmIwAOfysoKL8w+q93jBuUmR5muAkRaM78twVxU8HKKAPnHwtQ/6upexdH0EDELFxsJbMGe3bfxXD+h5d86fGFlpVF1NoL8knP/3haOvX7WZ27dLK+0b35pSHqG29pApZ1E147K+gmLXf/JiKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900011; c=relaxed/simple;
	bh=JPm0jViFR77XDvaIfwVMV1gpnCCaEkafTtELFRtPCpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AY+wKN/1Cc2PmhdSnmTHnSmR7HTyKVIkvJUezp//BAq8XfQaWNMyirDeUAB9DzAKRxWwNprCCPMOGcxa4weMiwo1NCZxQQRxC7oF8Bpcdtujr9E1OPAwTWprbgLGY2enuvkWPjcOcb8igdpoDn7WHYVBuPz4pEB4C0uwN19Nxrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jF4o180L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gChpkFGo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNU2Wk3808897
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y8OHZ/EXAVlMihWZ1dk1clB/7sEMPnke8vGFcWsrqY=; b=jF4o180Ln8MEnBOY
	GQ05meA+hMD5C3g/Mg5AsMFDkeqRy6eG1nF01tr6ZNDMEQctXCv1kzfsfTSu/we4
	aLuIZh9FelCoTzByeEZv6BsuQnHwFcA1rAuhde5qwV0TVBOSTFdu1ZLgIUyfX+SK
	lNobd/weO8z0Wxr0tiX7OHpzQlTfZQ8uHS8CUc3x5LbeTc1qDTIyPiq436qMvxg+
	0ANdty6zqOOYGK9mx9vKLTGhHDct22sHkyZ6SFO8fZjRhQqJbveSWnO2fnq7zgMS
	cBIcxEZsZpl+pnFbxfyC8SFK0hm884Kmoed4z6Dzt0MWdwENQYYe8u3PTColkBoG
	OGchPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekckp3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso51788351cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783900008; x=1784504808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4y8OHZ/EXAVlMihWZ1dk1clB/7sEMPnke8vGFcWsrqY=;
        b=gChpkFGotUSmUd8yIxaDCxNg5sXPT1AHI4xJjT6QpNyzf+krWBIEbLLwb5LbTqeoTq
         dIFMxTFuugapOyi439MptJx60QUvRKAm1nvDN6d2XbKO+FP12XHzAUZ3y9wGppvpN92n
         ql7tG/AHQtOcolPsJTy/pIc3jzZA3vz+RKSWmxe98xb2+HjImHiJIEdoHuYIDTOTnY7h
         2+cL0GscKVQOBAG1MaO4KeOhRHL3GOjgObD/4NuxdRxM20rF4dtOe4oRa6OkquZ9I37P
         mXsjJ4m/QrxdnW8DunUeOSZ1caIpYIMMTm+Jsj16FKAqacooxWx/2PzElXIlv+p3ExU3
         mvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783900008; x=1784504808;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y8OHZ/EXAVlMihWZ1dk1clB/7sEMPnke8vGFcWsrqY=;
        b=RyR7re28LKfRk5y4tFF5D9XsWOayImqaGMQVkhINo2L9PZx/c7D5O3kBpCFsFrSrER
         AhSS809OUxTRyP40xxKrXjrYYv+e18N39ZlP/slKcZdjZFQ1swh/nKiC+YDMZOGfm0Av
         z+EYMr544EUkeqqdbVi2W3GmHmb2aQNswnu1kwxzPkjKwxxaXzhoxiKI0rWWj6veYKfD
         9o7gyMZOIAp3cKsylVN22LaphKpqC8jXO2Mx28rq2OefWHszQ+l2zQA6jrIVz0lmfSly
         0rNCldd2SXcwv6319GmMRrbow2Nv/TL9DjH8xWUL+PDLW+qC3Zr5J+7v08gpLiUpnBt/
         YJWA==
X-Gm-Message-State: AOJu0YxybkExMYX8/Zota8pd5lPGJkbSyYCnSE2e2etLVBNPgmYw+Rj3
	j68EP5fC8fi2W9b8JWcRCE0pxLx1LNo81/NkzFJr/Qb/KdcncUy5/OkutLrQ5ifH+rhv9vJg9/L
	byYz6N2q9vCtyrGxDepsVdOIgUT42XLU7yG74A57I1cl4jBbEStuSzSenqlbT98D1Fk8j
X-Gm-Gg: AfdE7cmhOM7GAdn31u4fSBjRdtoojHfHp5X0tXFSVwIGZRTrYlwkNXV7AHgs1d6tJOh
	Xh5WkFuN8iM+hL/hj8i6+Qu/ToSFlB6iEA4R31/HgtwcpkPZPCgZWs47CMwIorhRsCJNn+ApVlQ
	6T7XqTeBnzz3dMAH0acnxq1E3pX/x/7NJidUiDw7O5VOQ9VIAfKZmkxCeW2uKPmNF0xRU558XXW
	PLIpZ25rfktjZUH8oRqFwigROLfKvjU/mJsB3K1Xdr3NmCJPUAfXiBNtVdhD3s6XAC7JMZvbPdq
	jFd5JoTDqzP/M0+r9341uvzRk1sVB9MFy4Q527xn4/CdfCU5jmG6gxd8aM9vbfEADRYdbPPZtOQ
	mejY7+A0q32u5wF+nwoQMe/dn9NamTwOJxNs+ykI0O7ebvZnssOUmtmDOzGw/qrxw2uP50kVDfz
	ZapWfBHw1mfBMvNjtnMBDIuB65
X-Received: by 2002:ac8:5808:0:b0:51c:7b12:120d with SMTP id d75a77b69052e-51cbf3402b7mr73169511cf.75.1783900008134;
        Sun, 12 Jul 2026 16:46:48 -0700 (PDT)
X-Received: by 2002:ac8:5808:0:b0:51c:7b12:120d with SMTP id d75a77b69052e-51cbf3402b7mr73169401cf.75.1783900007719;
        Sun, 12 Jul 2026 16:46:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caaf40esm2371357e87.71.2026.07.12.16.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 16:46:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: add missing drm_edid_connector_update() before add_modes on cached EDID
Date: Mon, 13 Jul 2026 02:46:39 +0300
Message-ID: <178389962795.1434604.5841714986393955443.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608-drm_plug_flaky_edid-v3-1-1ca632938e7f@oldschoolsolutions.biz>
References: <20260608-drm_plug_flaky_edid-v3-1-1ca632938e7f@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfXwjwg6cf7+qH9
 wsXgu83TKAoA6bPbHsDhtPidNKSohzvCmaizxLpNO+POvNcEGwhu0RHJdk3Xtj2NFfaAd2WvaAC
 V7lRqwZSv48nPZZaGKJo/hyRiowFT1cClVd+UXq6IPv4A2MClrPRjNxsTL962YzZzRdF3/v80e7
 XjZi8+w00e62aBdUHu1j3H6yrWHjjID7g8odUS0tqltp/yThT+Lkit6GIdcaTPjayRLGoJpXLvG
 tX9TFDdHaZ14foWQyMt5hsXDQH62E9Rave+Dzj3eFMHdYxhJlRoudIbQPYQey+nadG8QTspChnB
 uztBNimiawwuNuy+WxgfexmN8qvR1Q4GdU/nN1I8a0Q5foFNtl6WKFipwG8z5vpplzj26Y1P3rh
 3T0VYMnoXKivbLfPuMyP6cMKYB18lWwsIGRPf9H47EjsZXABgyaVot3L9G6RjVuJfnk62W8c8tc
 GQkYWKv8szbDILRngbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX5KvZweSJfB0f
 DI+MO9dkqxHeqvKNKcludSP2weT8UPCZbHgTYRqt5833HnCsit65zRrE0saZyYg9y4WK3FucAlh
 PrcDzVXL0GF0PUsCTHXnDttrYEGndjs=
X-Proofpoint-GUID: dNFKra8HMC_Sf-SqpC4hdaPT915vSzrV
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a542769 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=sa5PkiOI6JPz9RB1ZpgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: dNFKra8HMC_Sf-SqpC4hdaPT915vSzrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120257
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,chromium.org,intel.com,oldschoolsolutions.biz];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dianders@chromium.org,m:jani.nikula@intel.com,m:jens.glathe@oldschoolsolutions.biz,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118610-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F6C9746462

On Mon, 08 Jun 2026 06:54:39 +0200, Jens Glathe wrote:
> After the refactor to struct drm_edid, the fast path in
> msm_dp_panel_get_modes() that already held a cached EDID called
> drm_edid_connector_add_modes() directly without first calling
> drm_edid_connector_update().
> 
> The new API requires the update step to associate the EDID with the
> connector. Add the missing call. This restores correct behaviour for
> the cached-EDID path.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dp: add missing drm_edid_connector_update() before add_modes on cached EDID
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b7088d58dccf

Best regards,
-- 
With best wishes
Dmitry



