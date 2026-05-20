Return-Path: <linux-arm-msm+bounces-108757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK6HBZO+DWr32wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:00:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A83E458F3A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4196431B6668
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1BE3E9589;
	Wed, 20 May 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyOcFmXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4x/xH9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D93DD532
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284497; cv=none; b=Q+co75RIvDuFy7se8kJqynqcET1UHhjDgQym7TUmxBqe+JIAUXeyv6MtKuRlU64hPTmg17A1v7zDeeegpvrdfiBA6c+AFN86EINdgzkGUY+FrOlLj+0krwwd7StNQdsrqpBcnaUkVWlJM7LWAXUsx/ITyIZpKnqTgTBl93DZrgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284497; c=relaxed/simple;
	bh=wEK2ABOen3tV8/HsKkDV4io4ZqYKyOwnkK33x92qIKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hx5qFgq/J2HNk3JVEdEY2TDOBDN8T156zgJqNDVmwianPtOiqpIKsXTi+e4LgNk/N2Nx+SI8cbZwzvhd9ABhBQIdq5+dqUMMxJC++bto+fDLX3smWEEUMWiB1+4aybQCc8XIVIC39+ONWSS1pL2hIAFJoXa6aDTlHih2RE++4bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyOcFmXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4x/xH9B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCe7J6316969
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVfCWmu9NnLwt3W1x+6m7XcP0Pmlw7T2tdZJKqO170Y=; b=TyOcFmXuYAaJKYq7
	Nc33wRmi0pLyZeGFKkhtc+r9Zjjy3XQf0DrYorpagNjGGAzWsxIePB3LUq+PO4nn
	g3TlvTkK9SCQC9sR9Ul21euyJs6Q6WP2+zV7j7rZL0Melw/v8bVG5QMIWsG8jwh2
	RAKIRfcoEaRvvz4LXASoaEuHnHAIck2xbYDKg9bpNi9LP2wg6KGVoZ73+LMnudxI
	fcRlg7XWwIYBqdVG0xmHy5Hhtnbmzv3g4x6+wIL0wogc3lRgWl8kKuqk0CpTLRi9
	XL/M8BhPSZwkcqssXvY5qeiym1W66nhpPgjlvVUaoFKxDOdVdNG+I0ZmBZT8EI89
	LTzldg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qr7j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:41:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6312af70ad0so6229054137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779284494; x=1779889294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVfCWmu9NnLwt3W1x+6m7XcP0Pmlw7T2tdZJKqO170Y=;
        b=M4x/xH9BiyAxfSSoFVsm2LYHAKwX2/Tu/U/lRW7IWmF1vsAaNIEt+jWFjVuKtLA3EE
         r5tJNSOd9gwyQFtTH9K0W9x46k5yPUN2w4e9VP7wMKkRt8+yRwum/DqelUoWfRJU8QLq
         sXGqDE1uQvEmiPHeeMwqlggs2E9/13VlUmBV2dBSHLdsy/pmBLm4fXc9o7p2U7MG7Z5p
         LY9yNbkY+FLAntzOzSoaTyXSyUFC66ED1ysEyb7dT53JdMf426DcJmOiZo75YxYRccxr
         AQrYwkXzgrz1ITuOvYoK0vAIunR/dLD/kfkofJAVtfRKVv9o0qttYPUwwcEh1YourPHm
         eVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284494; x=1779889294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dVfCWmu9NnLwt3W1x+6m7XcP0Pmlw7T2tdZJKqO170Y=;
        b=OlRB6PHSpEGQGuDPR6fmeUPys4aB11cAox1W65Wg+89wNwfdbQTSImdWYABgdkStUQ
         K9o+NSNjxeUUKGmW2wdFEQLKFYYIADLSIzUBel6EXhml0JfNhjrFPUu9yhD70EiCE41+
         cqrMFXuXfGiwFvWhX3w7j9RWaA8Og0JeIEasFYEgMt6Azcx7OhLhifDlHQzo6PcxOa+T
         P5G7ShErsqFDNJ4TuTZQoV4SeURsMO5fyIcuDplAPii4LpmffX6h/e/UBezioH0NZJ1Y
         ZH2eS/P6xYl42P0DcyF0HY6i4sUhEsRUTWJjaSOUUIqoWdzqW6ZLIMJMU6EKOw0MSPje
         IHYA==
X-Forwarded-Encrypted: i=1; AFNElJ9rtReUIxqYQbEnupM3KBCdv7l7kTLHUig249PpZKJvaqWoJojYzyVbGGJWnJq2aK8MUa5frocvp+LasYBu@vger.kernel.org
X-Gm-Message-State: AOJu0YxyZG3CHVVl0RKTs5r5/ASDgYqP8+RX0BRRD+Sn/xdADeGVl4SU
	cqIAqKzAClcEdArMhyotEYGjvYcUK+8NDI6vKxoV5dDPLu/PBRr3ovUtJP7bvLQil4Cee7qDRZx
	Aq0lWdNbzTqLh7NZ9FsJm5J/GpFWFxJXqMTatyUZWh4FnTm8pbF9mbTk5GhLZG0/AkrPu
X-Gm-Gg: Acq92OGQDeaIEjNNoisV71aOxNzqEoUQWRag96GMdwD5BRbwzQicFSDfqFgJMuKIRj4
	rvs/vZQ6I4YRnaNs7lQ9HcgfwC+9lo/SLVOwuoxZWbQ9LaNJ1LDcE61IVCuZKSJtQXMbAvemrGT
	QS4TRF+2yRUv2eaG0H/udcwlb91/7QoQqBFrabDPoFDVWyKLb9DZFglduQxz9CQas1+GAWZ2zvY
	ukAWzyprOWHlRB7KWYm65Vub1x2xJSv/YeTn0WIjOZxxRQF/4/ZAUR6My/BAFpdZw6sbC2TY1HR
	5O72G0cyB/hAVBpXQ3swWbUlS4KOPXNOgsWTRT6PlFH+i8gbIkliGoaKzdyt6BGGajcb78Qht+X
	RtBzXeClO77uIwrbJJcLhlNoAuawVCoJJRfk4E1yyrY8uKUi7BqdcBwram0YVtFF7raia7OXrAr
	dSTDZtclAkGys2lQ/YUXZQTiIBmKWzactGQ6g=
X-Received: by 2002:a05:6102:568d:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63a3ffa2650mr14672535137.30.1779284494171;
        Wed, 20 May 2026 06:41:34 -0700 (PDT)
X-Received: by 2002:a05:6102:568d:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63a3ffa2650mr14672480137.30.1779284493670;
        Wed, 20 May 2026 06:41:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc3fcsm4997008e87.48.2026.05.20.06.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:41:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/9] MDSS / DPU bringup for Milos
Date: Wed, 20 May 2026 16:41:30 +0300
Message-ID: <177928444229.2567181.2193286518117779172.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMyBTYWx0ZWRfX54FdsOaEtAui
 IOR0b9L/rkaBL2iZkyn9UU7cC0yrntwkU0elptUhxWHQ48jQoW7mLntaNF2yIz3cB9SK2lW4SoG
 Te1fBdsWgEBef9v4eWK+/K6lbhSQZaSTdzeHRu0KCcZnXrSHt3Hoy0VVlevQVPP1+y9A0R+oyxK
 jCc0DjlWIEmnKbeqZTGIr3woJhzVz527KYEbIQtjcBVCqUMvBG4SX6Pbka3QReI6A/pgi+8kAho
 vX2w7MQ0Pi/Ib0sd1zdFWuKKWTyfTO11Dhwlc2bHoroQiWR+SjxqvK+VIImhJ2hy+cjXXwMzhG8
 gWWjNdOOk2DrtOrdAgWFSbRilAwQjCURgeB8+CqKZ7nbH0xz/CQk+zG6QQ8B/2nSvqTtAKxf/0Q
 0Na9hQmEK7S9roiaZNGeFJpl806sTmLJF7A3lumiOU7jMYrjQ6O2SYRRHqu5kXQbI5GjIzuPCiu
 9hJZe4X6wvauQWpvjcA==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0dba0e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=dydZwlHECne5IGhmaagA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: XV3IcuX4G6G8NKuqtXruttObzHkhPUc4
X-Proofpoint-ORIG-GUID: XV3IcuX4G6G8NKuqtXruttObzHkhPUc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200133
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108757-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A83E458F3A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 01 May 2026 09:14:42 +0200, Luca Weiss wrote:
> This series adds display support for the Milos SoC.
> 
> This is tested on the Fairphone (Gen. 6) using the SM7635 SoC (8bit DSC
> cmd mode), and the Nothing Phone (3a) has also been reported to work by
> Alexander Koskovich.
> 
> The panel driver for Fairphone (Gen. 6) and devicetree enablement will
> be sent later.
> 
> [...]

Applied to msm-next, thanks!

[1/9] dt-bindings: display: msm-dsi-phy-7nm: document the Milos DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a64e18774bc
[2/9] dt-bindings: display: msm-dsi-controller-main: document the Milos DSI Controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fd2ce4931c78
[3/9] dt-bindings: display: msm: document the Milos DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5354032dc203
[4/9] dt-bindings: display: msm: document the Milos Mobile Display Subsystem
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5d66543884f
[5/9] soc: qcom: ubwc: Add config for Milos
      (no commit info)
[6/9] drm/msm/dsi: add support for DSI-PHY on Milos
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bdb927095689
[7/9] drm/msm: mdss: Add Milos support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88210726c65e
[8/9] drm/msm/dpu: Add Milos support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a48fe7aa0a2d
[9/9] arm64: dts: qcom: milos: Add display (MDSS)
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry



