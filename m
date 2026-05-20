Return-Path: <linux-arm-msm+bounces-108833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IxeFaHlDWpz4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:47:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802D592710
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9A483065E5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF51D361675;
	Wed, 20 May 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dthFy/UE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHU9Rn7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D67233925
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293647; cv=none; b=OtdhjwPLZqTRbDPkC5A/abxyk8NaPi84TMdDnFcKA4CKZz7i+z4ttgG5RFwj1n6V2yqoYpBbd5hmw8zWixYtfD32dDvfvK/+SZI6oj7Hs88n5xUX4HriQVAe1JUlbLGHGKptMLEftqqCTYJ314zZG8x4i1QzALA+n4/bVOXTAu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293647; c=relaxed/simple;
	bh=Bn0H2a10+/+NsHEJxBYPRp9tLzp3VzyXzN4lI0Igg8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8CMxvZizbqJHDrVhPJ6JNHhupBddOOAhFer4wR22Pf1JCpKev2JeGbgWMnSTjEAKQz7N4ACsn9d93GfVeKDM9TP2yeAScJj4nUy/5/TovYWVxRtqDwbT9t+GxIZKGVkKcm7fBJ4fQz5cdx7fY+xcv1oFsGYPK/e6sir7qFE98A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dthFy/UE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHU9Rn7f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZSOw3084910
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJWr4d/UJwOuBkw57btM1kifrp9/06KHmdp3Lnxi7oQ=; b=dthFy/UEHpzakFtH
	lNkA/rB7iPUMjh4FX8Lgi1oBeqrTYZT9t9Kj58yoK4rs0hzmgxnxm47nnWRrhbln
	IkAmp6QW5CvnrJUDJX5PF3T9HVrJf64ccDyT8o3FNee6yVDltOtL+3pTpQusysf1
	QcVkjeaHnyqbc97lw+zB+RYhqGA/mhVt4MkmL20k5VXIYHErdhtf3jX+6+nw+QIJ
	8Kun7kHtwSafWQ4oaUNVqpDA4TxBvKDmBUUhxLnzJnVib8LQztR6hppftIbVoLGR
	d1ypg88kcf01svr6JsgelXLzOuP6O85JQrBxUEaJ5rNE+VNry9TJ7YTiuqZOcE9G
	Vb7Gbw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f13qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:14:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5756f9292c5so4547178e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779293645; x=1779898445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJWr4d/UJwOuBkw57btM1kifrp9/06KHmdp3Lnxi7oQ=;
        b=jHU9Rn7fnVZkg9bmoBSjP2gAzBwP5m9aMNwOi+a/x6KpI6eabEGy571+8d6BYTXfd6
         gBGjTwKSFsPJXDnnBFdTSAP9geGqWA5WYM4CNVS3FvpEoEUb77KD2HYTuIi8LVCinfwa
         jaOz2JueojlwukjYRFQeRTBjXYk2UooZj5KGWLnn3oG1mOeowTVY8+xV4OznmPLY8oy4
         vVk/5hx+YFh1/dZCW83Nvm5avBhN7ysc+ZtTi8XBSAqY2kWCniIpbnS60uMYRanerjzJ
         DQZbfbmGbP6IbQbsFFyMvImfHXbcaHEOUjdt31lJL87qVR3vYiMy5oOq7/LWRjL9kwbH
         /UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779293645; x=1779898445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nJWr4d/UJwOuBkw57btM1kifrp9/06KHmdp3Lnxi7oQ=;
        b=qgdUzyjSsPGpMxlXKk+ORqIhjUQwymez5S5h9vCrvvNZZ6yZ/LykvTYhAadJipVt0F
         DIwoeIjSQqGntQaZPL2ZKrgdRnNQNJ+6cdn7KPWF28WbCmqksu37T87mdmHvWej+vCE8
         oR+AGZWaRGt2gOIoCq3875vHHI/OfegTN/c4wdOwn3DeXHofR0UYwIntrMnQGtdwO94h
         3uQpo0bu3nlr0C9YBn7mLqOk7inXaJDtWbvOg/Atli/aDFMBjc7tQmVWZ1UA/JEqRULx
         nITbjXWKNRlRXr1PicCGqXzWY0q4JSvGY+us20ut8L/zd+NfGVwD9ZjChpzQE7AKDaXb
         l/nQ==
X-Gm-Message-State: AOJu0YxB1z8dQNkuGsASfHXmIFnEqcLpwieUi7pmHrxq/bH/7RxZOFs3
	+jwVfDFFrNoAIMTsUC3KVqvVRh3yR0vnSGWoqa369PoBTIfvMS5t7vOo2y0bLed5FAZSNIG+0Jk
	9zfgCYz3nPw8zx4turRNxiT83El+0/u9EVoyRWH1g4weH9u779cI/A7bWMkX9hf6l8S7Za4Nh0u
	BT
X-Gm-Gg: Acq92OFWiFo+QTF3Z986Q8CJ7q70m8nG++7SXko4FdfGgI/5v5mIkjWs+nC9Yv3frdS
	24AGTQnL9damCr9G4RUNbeAkPJ8AP9Bognlsn//imJHJx/eafGovrlPhEUZChEFaS0CxVXfLEIf
	zb6XLvI2um71vrEmbcbMemUUxsI9TYynS9htkqLwGe4BipDyeEjTQW4HYMZFVYSnKBrMVks2ftM
	BtiaQdz37FbvLxHqlbtJFyARr7hxMSRXXO2ligJxGEurDmHvd9PMk7hICCiLobwOlyChgQp+c+2
	rsY2Uxdqb2hbTfGZ2f8NRjcgwM/Rb8EmR6X3Vv+9OUQuITq32CGROS4DRbgcEGs0s5Yum0IWdmG
	9OOUBm4ObQZCFlSM2DiubP+N34ilPdjK6t1Lw2O6Guxk9VJeJqcldsjRVW1nk6DH4/DE6GG6CL9
	gFXhHT536p07bCONXPRAnC8L+mQBGuRswwkkY=
X-Received: by 2002:a05:6122:2a02:b0:56a:fff5:b4d6 with SMTP id 71dfb90a1353d-5760be71006mr13132798e0c.4.1779293644594;
        Wed, 20 May 2026 09:14:04 -0700 (PDT)
X-Received: by 2002:a05:6122:2a02:b0:56a:fff5:b4d6 with SMTP id 71dfb90a1353d-5760be71006mr13132721e0c.4.1779293644004;
        Wed, 20 May 2026 09:14:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11b492sm5002534e87.26.2026.05.20.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:14:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] drm/msm/dp: Drop the HPD state machine
Date: Wed, 20 May 2026 19:14:01 +0300
Message-ID: <177929363016.2602176.14011964854996996197.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0dddcd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=ycOf3ZaJPtScUYPjLqUA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: DqVqX746qac2gs7LIeZIML5qjDyY476E
X-Proofpoint-ORIG-GUID: DqVqX746qac2gs7LIeZIML5qjDyY476E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1NyBTYWx0ZWRfXzf9ai3dck9TH
 Comu1eb3/+WF8zeyBHex8l/A6piVdJQEtroUjp+NOqIG40Ve+QRMQHY6/VZKITdXpH5Nr7+N7DB
 /cK8x9dM/mUCDPxgSWbYcKx6Mexou5GC9Wf1iwhOZ5aklGu8QHX+oqwBVSxn8CEphtOgKMl5O1h
 5+tdr+d5xeAmRrcmZtkR05C+msmsBVTa9VKGCGvVKi16imrdv57cyinmXRRIckS5R1BnnYDKclf
 3dkEJZQnyr+ND/7fUFPGLSu0GwfB7+WY2fCYARIGM2UxcTr823DsFiGlT4OLURx/J/sYLj1J9ZL
 BPKm9CYpDnK/Iq18fp3dbcNnJ3dvaygGPSA7Bs8c+4SoCpyPnrH6hQcDenqL28cPT+e77YLbpf2
 mzF414SOsJrgs/TnbqRI4Ixm9S86KCWRyvfNC8SmHigC709rsp1mSmE78lyMqT00kZgGnyovzZJ
 tQyjULljdm5UsD8yQfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200157
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
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108833-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 5802D592710
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 03:09:04 +0200, Dmitry Baryshkov wrote:
> Currently, all HPD interrupt handling must go through the HPD state
> machine.
> 
> This has caused many issues where the DRM framework assumes that DP is
> in one state while the state machine is stuck in another state.
> 
> As discussed here [1], this series:
> 
> [...]

Applied to msm-next, thanks!

[01/10] drm/msm/dp: fix HPD state status bit shift value
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f660158ca081
[02/10] drm/msm/dp: Fix the ISR_* enum values
        https://gitlab.freedesktop.org/lumag/msm/-/commit/586a722ad5ff
[03/10] drm/msm/dp: Read DPCD and sink count in bridge detect()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/41a285d9cd64
[04/10] drm/msm/dp: Move link training to atomic_enable()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/69c1cc0142d0
[05/10] drm/msm/dp: Drop EV_USER_NOTIFICATION
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d9d6f9db8698
[06/10] drm/msm/dp: drop event data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b845eff570d1
[07/10] drm/msm/dp: rework HPD handling
        https://gitlab.freedesktop.org/lumag/msm/-/commit/53797c712360
[08/10] drm/msm/dp: Add sink_count to debug logs
        https://gitlab.freedesktop.org/lumag/msm/-/commit/eaf929349829
[09/10] drm/msm/dp: turn link_ready into plugged
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7c6ce8c98d51
[10/10] drm/msm/dp: clear EDID on display unplug
        https://gitlab.freedesktop.org/lumag/msm/-/commit/af904c787d68

Best regards,
-- 
With best wishes
Dmitry



