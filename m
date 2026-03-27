Return-Path: <linux-arm-msm+bounces-100431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDU6JibgxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:53:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD2034A7B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E72CC30DFC21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57D9386434;
	Fri, 27 Mar 2026 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLJ1XQ9A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3BOnzg/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8A6385512
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640865; cv=none; b=jKltZmZmy0ieCSRTKk52bD4qc82GPoI+0LrjxPmFY3gphjrMoJo5kKBOewUlBmRAmBHO7tsgDZnCV8cgoo403+9FlrDKzl5pDPqedtWK1VcpL/rvNuLstNoP7NTarfL2HCCMqQCFlmKFPAf12vQpHEJ8oeuRhCb2WnBAbWGUZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640865; c=relaxed/simple;
	bh=XctpxJmqAwV2gCw6DUEGKKz0Y5cP2tDsJkF+fyqHsss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ss9/C/tNrIvt3q3r34norA9VTrGYMHJbo/GAwgjWn50BBPD+1BNzJaQMXzMPvpYKRR43WRAI7HVP06P6v+uRZM+Yx/JoFcQkv3u6/5DAeL6GCg3Z0KIZ7krD7ogofhv8rWK7gP9wHfE/MpACmPLorEGHGZIVKw2F41pdWHyuAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLJ1XQ9A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3BOnzg/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2OBM890143
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=; b=SLJ1XQ9AUQtF+mV1
	C+LyFCxHX37K4YVqKudiM9weqXdcz1X9S5iKJr6SpWiGbun4XhyzS1YpPrnMZcPc
	a4uvhMKKdJYq4LEluqfWrHoUEtUxNpFJnd9GPsdrdxEv0965ePL1/raXo2hGrgnY
	ICI/Rtp41aHnuLZI7WfCTj4I5pKTE+WO+WJwBEZG22YNYS8BGGm57AW6iolHJGKC
	iDUMl5QGggfhTNu5VQTXwSxMj5t+pIgrh+mI4hyXHQlxDbhqIPFmQ6m2HKWDQiK8
	jj1jJHWn1VlxRSHnBDICXGuwp31kefUJZxqCevOKVy9bMaTxahZN8bMSoo9hglCw
	A7tvZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6rue2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b220c72bbso86246761cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640863; x=1775245663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=;
        b=T3BOnzg/nRB0c6vKIl4WGX66ZbnpsehZFsTvtj0xy/ip2Wedq4nRVyliTD9SxzkKCk
         JDTUsoqbO6B9p0yO42paof3p/93Ju3W+QZBbM1WaoiGDNVGOO88r9WIRCKvVZgb+u542
         T77chlGJMmpQoVHrPPGECj4Pja3thE+Nc2GHcdNuPTprfcmvWXEDcZ1i6Fku0XKzXVr8
         EaCaptJYZr/HO8Xr7ThZKqZJMYJ9reu8jRb8KFoPdPqNJmWmurzDKosJJR2dW4b9RVYr
         IhFIdcwHDkr6leAzs3Xnz1XtruPAg2kMCWpu7dQGmiz74Mg4flOyD01yGHD1WIxQfT9H
         oOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640863; x=1775245663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=;
        b=f9m6j5O2wems+Z2DG0WnkdLxMfZxQc07TYI4RxdLHCD+t2Fb8KMEkyRtECndW83r+h
         PcRTUQLofQzi4T0RdcAa4msa8HvCFiirhWqz8gTBD2xCgDns1NBAfpulPDgUfkfbhLUS
         6VKmEhVI8KKZ0OQKOIrXVlpj5bAIgDL7wZN+bZiuEy7lMiKfhORZvlnE+lCM5HIE2iR7
         ZxqknVGBkIDNiFKHSTr6+qhvvMDmgZmiI0j/giX5NXIviCWTd8sXWQzneF8dtDUogyJe
         Svl3zlU+OznmCc3+gLIgj2jQuFcUDvRbdpwlpcnKf+db6CBjDfs94Xy5BevtI8k0o7rU
         qLnw==
X-Forwarded-Encrypted: i=1; AJvYcCU/rCy+MaI7qAeeWiBFckVYGVbbwLQWQZECFU1WG2Gxr8kkS2GbdkoqBja1iYkF+oyg66yCDrTS2/JOnM0n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8v0mtxrLLANe8p0r1wizljmEEn0RwH5ikBzMLnG5FfQ+Q5xSg
	cD6/ZdFEAHXr7g7ub0qBwtHQ/amfY8h1vb4F1yNC52xrwd03uukSKBt/KrDdEoOzoHYj/R66SCY
	FWxn14qkcuNozJEjn1t+3+udvlKDnPaTk+0ZPvIIj/p2lBHtL6Xc78LDEe6XX/MqioNpO
X-Gm-Gg: ATEYQzyN6hkK2DQFwf4vRfKXHfU0udIMGmxN4cALnfCdsKocDdL/wFnRHDezydzyBDe
	6RHGxGG4EpW4kHoqG3GhJWTyhG33fOzRrLzQIUOf9WdFQnf8w5sgd+FpOff5DTRbwOBTnQAcfd4
	FDr5xMowSqAU/sxbEnzP8bAPo5fzX7CSVtGWwS752H/mu0rFfeE8yUzXAeDlTAkEsd8Coi+68Hz
	oCMtMagbmM52M/K10k3e2VJxeuPJfX9xlHVPAHLpkS+ITr5h63IDKSyjUoFF1bFDE8QUJk1o2HA
	o8Biu4yFdl+3yv8FcH5N4RGwJT98ucs/YEsCNnioqCgouytePPivRF3quYScKBvqmfGuFxeZy4j
	GPuDpTjoD3JICj5H0SS7olThHfh9/mmO/H60PXGoRDQcJ+ugsg5YjfS/uXeEUWYpO3APEsdUlhm
	Y8xvFrvZjb9I1s254iw80VeNIbfXvOfE5a
X-Received: by 2002:a05:622a:4188:b0:509:238f:ad8f with SMTP id d75a77b69052e-50ba37d196emr56634361cf.5.1774640862823;
        Fri, 27 Mar 2026 12:47:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4188:b0:509:238f:ad8f with SMTP id d75a77b69052e-50ba37d196emr56634101cf.5.1774640862390;
        Fri, 27 Mar 2026 12:47:42 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] drm/msm: add RGB101010 pixel format
Date: Fri, 27 Mar 2026 21:47:37 +0200
Message-ID: <177463970769.3488980.9125473167622953389.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6dedf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=Q2NTn6QYng6VSU78D54A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: -cPvNs4EeujIpg0RuqiRA-DjvbdWhkv2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX7YYfFYbvOt1e
 mrVCYShT0gaS117i/JqBr+GRT+WhB1+OJj4AsnyseVEKf21hZT2exA4FYM/YS9UK3QnoeFtX1CD
 KPz+oTscEuhAKHd6vFSSv8+Yqtxk5Ime9s45G8/Ql4rTj2pU3oGcPWI0j7x/g6vxIsqCrkm3LWW
 +ng7+Ud4A2Ir7/Zv8qzfc6O4ceMVA5OW0CxQBSoz/1LQAGHAb+DYgFZS/YQ0R39/I5UCOVnGjUx
 zD3AMlpWF6Rc+SEfeUDIdm+vo4PvylIzsqcCHfdVwhEryF2cO4MGo3JrcnhFtdWbXbQy0mq0KRG
 8pYtv0hUEE2CFiEjZM+ekRAHKx2g3gIQO+vSTIEQ5G0ckgjB6PbzLkH7Vr9wUNXrcVv/8Hs8bk7
 xj1OHfXu61Tdlb/O1sALkO0zTeXkh/kcTmdzpZxl1C+prywWBT26PHHIaJ8jhpFwFaIBGDwwEkU
 yLEFJHF+V2F9SvDSg0w==
X-Proofpoint-GUID: -cPvNs4EeujIpg0RuqiRA-DjvbdWhkv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100431-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com,pm.me];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFD2034A7B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 11:47:56 +0000, Alexander Koskovich wrote:
> This series adds support for the RGB101010 (30bpp) pixel format used by some
> newer panels.
> 
> Tested on the BOE BF068MWM-TD0 panel (10 bit DSC) on the Nothing Phone (3a).

Applied to msm-next, thanks!

[1/5] drm/mipi-dsi: add RGB101010 pixel format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b50dc1e54750
[2/5] drm/meson: use default case for unsupported DSI pixel formats
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a780b7f6c8e5
[3/5] drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/913a709dea0e
[4/5] drm/msm/dsi: add DSI version >= comparison helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a65c4d30988e
[5/5] drm/msm/dsi: Add support for RGB101010 pixel format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cebf747abeeb

Best regards,
-- 
With best wishes
Dmitry



