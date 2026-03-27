Return-Path: <linux-arm-msm+bounces-100437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOfaIHbfxmm/PgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A234A72A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0EAF8303A657
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351EC385516;
	Fri, 27 Mar 2026 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffk8pkOC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cg9w6u7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252238D6B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640883; cv=none; b=IIzgpCSc4BXkbWdDAUhVnL0poueJI4ASX6ZSRpHmBA8siXECKR3NonzifTkW7cK8qvxo0knFw+JehjUGfh+L/1oEg/0s+JjRV3RLB63giPgLvdkHZE+RFQ0KPhuIzDWGZ2+m0/cNzLrP26M7eqOBRmjgnzNGBiYvAodeLrCa79U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640883; c=relaxed/simple;
	bh=BXFjP5h81I7TMUp5f+PTahlxl+MbnPY8EdMwi2tPA3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P//7yb2Ug9d0GkJfwDczlMiyNgMPTcrztcfOAfujZHXTnyWKS39KHSRLHEqfTDMPc6BqLtA6nOBooZhpagIb9VBagB+l3zEkvR+z1caQOgWRyhZJ2oHjYaKM9ivo5cbmCkPCLhkL7igAgEzAyu1nOiMrrbz8qDJr9Na/cUmTTZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffk8pkOC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cg9w6u7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2Zsa1458371
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6kRrSPpI+U7LkLwcOn9HsFVFBW06sGA4X+7KKxW3FE=; b=ffk8pkOCOEg500SK
	3ZBeKv8gBYyO5RoJVU8iwZcw9akd6XyrNKrB8AbpDyS4Hpw1SzadOQa5K32o34Qg
	LXXkqthS15doki42Q8HbvxIBY80U+ygNHQS8QOULwaL2V0aTVueL6REz2l6OLJOu
	0rBMQZyIZhsbNxI/v2Ay6eV5EpqXCCGhiottuFxOUSpqmr/FxYtGdzYukL+Y2nkB
	ed7EHHKt3Lnc2TyhKOIeSRJr7w4hINmKpUM7QGU0ebAxJ+/HJB1nMbLehUJeF4YS
	kO6UILrezHtqAuKuFrwLkb19PubbE6bTNc0hhjpL5EOoXbm9kYIPZ0GbY7DqC4DP
	p1ruIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6m5wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509044f54aaso75762961cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640880; x=1775245680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6kRrSPpI+U7LkLwcOn9HsFVFBW06sGA4X+7KKxW3FE=;
        b=Cg9w6u7wAbMBfyUGYThCZ/FUoDSRY1IHVxDvydV5kA9vYgJZ5a9rdO2w8SI8bjEwq+
         3LE5kWMuMhzalVB/c4Z9VKuDaf1bL4/XLIBX63KrAGf881kDHuryTCSwNYJT3Ll3GLEv
         U8BmMGCzN4oWu0zeUv48cWMhNy6RThOk3NQfs2pGu/tFfZe1JSks8eC/UaywvN+4rgMU
         2yKKrTxrNFxr6cMbAXfbiOm1hZC6GzMQXTS/EjvU36ARnX8Ju4ELmRWsro91ZIZVMq+i
         CtFo3FAhbC8vjhHKxgAAdPurKmHxQBRvSslI7WjUaZqkxu5jsU3Svm13MuyG6NOKcgVK
         3AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640880; x=1775245680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a6kRrSPpI+U7LkLwcOn9HsFVFBW06sGA4X+7KKxW3FE=;
        b=MOoUNXvGeaOyWvbDJCTL0L8e/ZVQJn4U6EcknrOpV2yaxGCD+HoRLRves3aIJV7554
         8cHBIP7vzLwtwd1NMEQsl5xphlpTlWaQyIY+MNBu3aucdcg21k3lqIciU949VrqefcKT
         NAVz30HbOyaD1AZP8+w/MvCwgqWFc00MARad9cApMjmGZeVqfu1F81wlE7CPr5r1kYQO
         Ky11RbhQxONPi9z6Kg/S3RvxdGth+pMvRe4sOTNjhIQdJyriMZ7TgLsEidp6qWLUnmB5
         hEz7yCKKsDn9cbGNnI5h58ijFM4klWgTVb5/cINfe5RW8+oRasS/om52PXlBveDWrsO6
         n+Lg==
X-Gm-Message-State: AOJu0Yy4Ry8oIvq9bxwQncZc19YzQ8lyCfdNCV77rzPrVnwBZ0LZOjOW
	CdTvTU/sjjeGc0ScdvK+vaf0X1CzA3x6bCL5LI5sTtmHqOtouZhB3tbRB8ecXvugoW6XhFp1MlW
	i9j2OCq2sm2i1iU5/90q0S+CrutY+Psg8UptJuqGkJ2RlUvrt9LCxiIRNLaFVSeAdhBO1
X-Gm-Gg: ATEYQzynxSIcA/EVQ1W/VB6jz3GSRHb5Ii+DIqNJrtVtp8imfurF66KgkAlRMX0TNhk
	B7Ty1qbnhFsgzLnuoK4aUMs+Fo4IyDW/p3BRY2iMuyCL/82wCtAxGXRwF54FpoJ2fbTYRh89kcE
	DqC/22C5bu1UR9j7GqGPlUbFSdO+jFwNqr7TU3ns4m5P6rRjnEV8K+Htwaz+PuC6vvTLMHWiVwF
	+TsVse/WBU/UiI9Yt63oqADx1FTJ5M/lDWSeYeQYubKYjTx1o6YuLXGd/5RbsELb1HzYDnuFQ38
	f+HirBO7lYS3om1V/ssae3BPEi4HxjOoX4E4jnPYXzq5ND5vvnI81EY9sKQqx1yAr6wxaQIGqjU
	coSQ8qz/H9AD8ZQpf3pAPk1ii846JsKVbPT+8m6G0L0YtQ2cKpv8KYsvChy3Y4TeFGH65Yu0Zd8
	TQy2BvpGVpdG+mkTtug7BX+lwaSA9OByoD
X-Received: by 2002:a05:622a:5518:b0:50b:509e:7920 with SMTP id d75a77b69052e-50ba3923ae8mr54201771cf.48.1774640880323;
        Fri, 27 Mar 2026 12:48:00 -0700 (PDT)
X-Received: by 2002:a05:622a:5518:b0:50b:509e:7920 with SMTP id d75a77b69052e-50ba3923ae8mr54201481cf.48.1774640879944;
        Fri, 27 Mar 2026 12:47:59 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] drm/msm/dpu: use full scale alpha in generic code
Date: Fri, 27 Mar 2026 21:47:43 +0200
Message-ID: <177463970861.3488980.11178737973899269892.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
References: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6def0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=TmsmrAseboHqPPC52pMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: RUQ9zO3OxUZFHkdUHYMsMEE1aQW530PL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfXyETAR9oITQN6
 1lh9SZvwETmz+jXPH64iKoucwjb7DG2pCGTL8aMwTZd+Sc0mggkHAhuLdv2vdq5i7aRmXuRtemD
 1Mp9P0JQx0rlNwmYBB5YLVCv0C5Dd4I74vb1jLimsVp79inL6n5M1j4ZneSD5sAageKzFXRkyPa
 74Bti5bGWofdChmi/+VbN/FOr9AAyyRD/CMXbrnZrKzJ3hLeHoK/YRMwVoOQaJcvdGsBvDIwnLf
 Avd8L3iSxin786WZlyi88XwnvgmZhYIIVqEzrAg82/0pnjhl7v4OGC5zwSZ1TGfyqaVYjxzbARS
 bl1SJzOuDnZPsTDMkq+MGIFj0m3SpPRq5Dui6QzH6flZ4LUeOpbATpshh3AqRupuFG8f3h+Zdlx
 /fRoQS3SgIwH3mqJOdJc1PzdgKYj6dbJLOXxxuDiaH9Tv0e72nEHnUk9HcmSeJY/9dh1G7g3GZm
 dKUibetKwsUcc2ERM4w==
X-Proofpoint-ORIG-GUID: RUQ9zO3OxUZFHkdUHYMsMEE1aQW530PL
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100437-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 7E7A234A72A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 12 Jan 2026 05:23:29 +0200, Dmitry Baryshkov wrote:
> Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
> callbacks embed knowledge about platform's alpha range (8-bit or
> 10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
> alpha and reduce alpha only in DPU-specific callbacks.

Applied to msm-next, thanks!

[1/2] drm/msm/dpu: simplify bg_alpha selection
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eef07fd9aa5b
[2/2] drm/msm/dpu: use full scale alpha in _dpu_crtc_setup_blend_cfg()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7fe04c7c4360

Best regards,
-- 
With best wishes
Dmitry



