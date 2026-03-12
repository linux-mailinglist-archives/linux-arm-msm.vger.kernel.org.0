Return-Path: <linux-arm-msm+bounces-97113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJZrAcAosmlFJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:45:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 615D026C654
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BE32305F4D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C872C0274;
	Thu, 12 Mar 2026 02:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAGoAWus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKy9iq5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88DB35BDC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283472; cv=none; b=pF7Vo5k/JzsS7YrULrmmSCoT29lUs2p1E28YtQyJC0v5n5GV12FLyPMrffvFcmTmFT75XBZAxTkYz1es7Uz5uCm9PYLko0cd4X46zqDcQjn8JV4wSKeAqwMf4oLkU9LlCZOXAhg5RvvaxWUGYkHQqXtG2R1QxKOsvD215KbT0qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283472; c=relaxed/simple;
	bh=mRFUZXlHHZuLALltcBB4l5Jyq4llgehaLKcrhkiULJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lw20djP3526Do32KQuTymSWILtuHXUtgr/cDxCvcmomb/K7IIukHoGyRJZyZ6zlZ9JdYNPsfsFdUim9lqbNZei37pWsdC6ChYuaWkVBr83PCj3llaCXtxNkJ/2zaUkq4y2kkeSOStEGdYJHsJTEjHLag8EUuArY6jdFlGADwUVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAGoAWus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKy9iq5J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2cO8f1594029
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=12b8jCwqoYKP65SYMJuDuGmK
	zW7yObtAvdWL7ShwXFs=; b=fAGoAWusyGtrGDUtbcZyr8sgt/pKWmjbNiTeY9nU
	gpvaTZwThDld9+chtMzoStr7s2vvN0vj42Wo/7fPYzg1r6fWX8nLzh65DMMlRXS6
	AzTPPkZ7pODuZjk4Pj+UpL36fCHiGFicMmyA15bqR7VGa+krbx35eSiK1WjsxVf1
	pO8QVrEQpdzRXaC16HUDAGgWDt8E6Xe1OD4PrMNxd4TO3PIA1r6CWKhekRJ963ly
	Xn15mAIAzf1jmLgugS0wm2mbXef+6u7wydtmSzf+ccYyPv4UCzKi1O606FshYL5E
	/dJksqtBHNG2jVY6rCZHU9NxHGy5gSYjpYtjD+tNmBk4vA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvq80gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:44:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899f92be718so36517516d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283470; x=1773888270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12b8jCwqoYKP65SYMJuDuGmKzW7yObtAvdWL7ShwXFs=;
        b=XKy9iq5JvDmSUiVF7gHR/INT4c2QEPqMVvjZR5+LXUrH6Q17Cw86VSJ4xD10QzDiQh
         euSgC9pVgiS2VhnC4nsDd+3R2pRi3z8mfYf4pwU5Rq6UtE/v8vnFPF55OWiFUwJ1RmpO
         tTEsOoCAws3i7g8zBikblxgFtYhp7UuLzP8oX2W/uHF4yJm+3Wgn2cEbrMrOgo1Jz85A
         4YN+kz1Bx+Mv4fpn2pyayPT8Vs4Iro6rbC/Na7furKDMbXFbGPGjps06qKYrlTkzUL30
         AWiwBjDAa066oS3iWSVq4c/BnAieeTOIRXBBEzXMXahgoQg7unoiRZWMX42eQ3eyAaOo
         qaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283470; x=1773888270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12b8jCwqoYKP65SYMJuDuGmKzW7yObtAvdWL7ShwXFs=;
        b=P0hbUklm94f9u4COdVIRHHwh5DQQA2Q2nhoFNMtjQTlEQVHhu1z7KSoDy8x3qNIv7u
         lkQVQr8WbX1uWBkS3ptsWu3d+WTKqlpWEenlximZaOaQ61qASqldEDyi5Bzm/UieOaYy
         Oeayvzs1wk0eIj2c9y8eqmY0Lo5tRyxBbhslSOQOv2C3nQPy7bli8ZLLB4ANMP1Sb/+2
         FFwFsENtTt9h+WkesLw766f39iLGCHLTaYD+/4LiU+Yc7ITwrnebAx0g/UWGYeVkuz6t
         137AGFf3Mq+K3vZ7PbKABH46qMpLLPriZvCedv+pnNyS6NSpdQ2/T4BdAKA082wGlHSu
         EQcw==
X-Forwarded-Encrypted: i=1; AJvYcCUiS+Zce1Tka+bdwW5a5WOIB0PUU2nYDkNecCX55/ATPPU/V4Qo4HSx6qx74/CGwb8bAP5QxUILiN2BtVHo@vger.kernel.org
X-Gm-Message-State: AOJu0YzYgkNm/U3G8RM+cvg9vgE8RixKbbU4ZI+13Yj8UjHtgoBbTkDL
	sh+659Pg6xk+yU6fjxgSchh4TNI60uNIw/BtztEqr6oUHzXMhRrYdAj3qAc/VEKF60QJVl2ewZl
	4NsFATmOdTh9MyU3zDppTKx1C0gm4cBu0lTJ3OP8+XY1BG26wKabW4Wc1MiPhlmbSO9y1
X-Gm-Gg: ATEYQzzI4mqc18ISF9j8CHjtquSRNtDI8GKt7ZVHY0E7Qazsuxsk/NlJFxdma1TClkX
	jBTAbaNB5SmumtKJOqzV5L+msw/+8hSWLQgiZ4wHSiCV7inuEms4PdQHOb4CrUXKE9l0WVk/h0N
	VFXzdqH6SqnISNjNQQArOEl5ym/M+W/ySmPjCF4+wTlqYzlc375+LhbD/zZHAKppUVSUdvCD9uJ
	4fxKsoerds2tPGt6a8VmPl8CzLITz6frjkWvNhUYA1zo86TIIccfjIDcipZzbOh72vXJ5FsZKSV
	JTHwQfITtTs85k79chmiYLb7y7sZ8iOSAndcVZmQqXrqbxNn+z5df/juXoKHZsKx5Pgbp0bsNm1
	mVhEtuDX7ZfJp4IlfxNv/3egRAAirw+jMap7yAYAr/8TVi7DbyohAP8aczUYvMGH1+3s9IMIhTB
	8fdWxAJW8oFPc9MDubr4fCVJOA+QponyEML48=
X-Received: by 2002:a05:620a:6cc5:b0:8cb:d149:ac9e with SMTP id af79cd13be357-8cda1a7c83cmr606003885a.76.1773283469980;
        Wed, 11 Mar 2026 19:44:29 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:8cb:d149:ac9e with SMTP id af79cd13be357-8cda1a7c83cmr606001385a.76.1773283469532;
        Wed, 11 Mar 2026 19:44:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b8dsm705100e87.44.2026.03.11.19.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:44:27 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:44:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/msm/hdmi: Avoid double error print on
 msm_hdmi_get_phy() failure
Message-ID: <uap624isb6lc5y23wd3ip6tdpuky3g6guvxbyiuvuyojctpr5y@h737tehd5vbm>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
 <20260311-drm-msm-hdmi-cleanup-v1-2-c5535245f6de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-2-c5535245f6de@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7YoHP3DWHqcHpjBN8OojeZeLNKihDta4
X-Proofpoint-GUID: 7YoHP3DWHqcHpjBN8OojeZeLNKihDta4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxOSBTYWx0ZWRfX0BN44QYYi/FM
 LR2X3g1BChVAl2EFDq/hrPog2xgejN8feYaUFSwcBdEaQeYah0W/5SA8YYB2fSJUuOVcJEHaVbN
 abqSrtfYFxcLZ9CsHCWEi3/T+WDixjKMoYFLJ+CfU2AgC4B68uxPnx/+lvx5nySFP6saU5HEVmq
 zfFGhkWkyvKHzRT251eBbvqHKns9dA0eyeoyQJ8vPUGo6B3mIK6xVgO77QenproI4AXUD/z5Zjg
 ft2Y/vJcdd0QCl4PAbGY1UDMnGWNl/tylyNrCI1Xj7tnqTg9nAsWocbHFhdOTJH58g+xRV/M68Y
 1rBPrpGZKn4yfK/ZNImVpAIBAqrNV2ae1sAsbBrOumZ2AwrXsbZuw3pDWgyV7q4o/RWnh24vsRN
 g2GYAW5pyOYrqj+ohOc6OxSx75evUBcg19OeU6oLy9zUae5FV0u9iuel06FfZVFtwY5lLUENmOu
 K+XlL02zbXIKtu52vVw==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b2288f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=WLOm6CK1ZXODqQ26IXcA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120019
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97113-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 615D026C654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:17:26PM +0100, Krzysztof Kozlowski wrote:
> msm_hdmi_get_phy() already prints error messages on each error path
> using dev_err_probe(), so final DRM_DEV_ERROR() would duplicate it and
> possibly flood the dmesg on probe deferrals.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

