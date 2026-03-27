Return-Path: <linux-arm-msm+bounces-100444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PFiOhvhxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:57:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4895734A896
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7AA330B1407
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD373947A5;
	Fri, 27 Mar 2026 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKFI5eXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0UdFOwM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7BF394471
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640902; cv=none; b=ZZQ7eoNFTSkxMiq+m0AeVGDK0HORzSkFtTdvZwT2oraDboeVo3BG6sjOnAEzj2cQTo9S9msiR8la4nUl7gg7yihkVBZJVvjTb7ri5MUFUHvmA4BjmfAIMYSlGJh+Ezbed4S5GFcER73SMPQkZEafAvhS+J6OsO+yfQnG50Bokeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640902; c=relaxed/simple;
	bh=yeXQyQYZCREN8SA8XGdNMOyScO3aLvPvOpT3Wl3bylU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfghmkQdHIyUDtknM8HrmwWzqc8SDIRPA9ZY1aq3AeWFF6uClbV3BUedZ5dHL6VQgxbMJNrv64eoO1vAh+jg1JfBSqmDlWghdMSxM5DWiFHGQRIkPJyG9O1E+K3nKlAbC39eZkE4HnsI4BikpyZuCNAcGTtTJpQ2MRQJKg2OIB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKFI5eXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0UdFOwM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2gtI083220
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtqaBpxT2LXyPXWxTBBWQj0QjDmEW2sCiiE6APe9YSs=; b=DKFI5eXkuMYtOMU1
	k78bJARrEBwcXoGjDTSq/3eOVU1IoM48gU1wj1PFYdb6GMV9oI6ERI6SDi9G+RPj
	5aQwxqauUZuYbg3xp1FYhfDHiEaYKXN5xPlJuYyUsInamIGYBhykTrCw8vhNreag
	fkuFmUSgGte/HUEQNPms03kXwZBj0uVxbrt+lQ39mBZiz4oWVb1WSE+cC2JN7jgc
	IIuMCj5VbRmOHEudN7OwYH7/a+H+7fq0P3zpcVX7jr7cPXyUfyHaoVwiLD5abVwr
	T+aW57qDCdh8R6jYAFvHHBEkKtlth+oLBQsbuE/wxl2sEOMlyYAXIDceR47GxwCw
	XkwqUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx39ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso26027951cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640900; x=1775245700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtqaBpxT2LXyPXWxTBBWQj0QjDmEW2sCiiE6APe9YSs=;
        b=c0UdFOwMEBQGrQOkOl//g0Xnj4Ho9EkAyGq8ZaeYH+AAgnHhm3aaG/EaMkd/9HLarH
         lPSzzICplM6iHgHB/4bYjBtKpdq3RUXGkXCa2F9CsRRH/NNzl+Ln+/TcD4nz9VCW8bhS
         xKuysvqVr3R6ZJqN/Zq8sBnmMVor8mWa3YB1vlG9OOETcVpKdvoSH7+jd6CbAHYO/khx
         v8cx8DvYbkU7ouryAvjXcTnROrW0UVKrFQUXB8ADwvmwBwAK3WjfTazooWzDH0owaR4T
         cD+oO89OTvzNd8ofM2umkNye7OT3wsSGhsVeZQdb/6Fv9dGL6851YQAP7acXVe2NbTbp
         SNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640900; x=1775245700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtqaBpxT2LXyPXWxTBBWQj0QjDmEW2sCiiE6APe9YSs=;
        b=ogI2fEb5HZryc+tMLP+B1MgvM1ME3s4fI+NrRmQm32smf7OTK0oV+Deh0Rg/s5ELge
         LuRFh4cD63gAbaq01r6iKgWTwTv50BxMnHmpYYTywVBtrZsRgrsbuxGeQd2PoLB/aCBp
         aqtj7BJAHIvwxLznA0cpJAD2LxXcE0n0mTSiV1R5gF0T/05mPNEaFs56i0d3tWAYU3XN
         xPzXwCUpvrytt4WZp6TU6FUJ/0orn6qN7LNDonXPVkJ1EB/HybNY22PH3e0awz6M+ADq
         WQ8ldAjg9fzj5D66RQ0u+0D33BI02YRyp9lp3vRSdM2HusePpb795IwkMM6x9vjB/833
         cqzg==
X-Gm-Message-State: AOJu0YxcGeV8PHAFc+IRifMyIh8z69nxYAefIDXnhAV253t5Z4rkJ8t0
	DdeRV89EPgJUJUJfqv7FdXIa9qKQq+4yIyFWYGnBX9vogTV1GkMGlkNsm6oB54FvfKhmdotoDif
	cEL04+nTjmRip0YVhAEMdDYLX6t9FdWUDYDwsJIeY3jIG3sba+Je9N+WTxP2NI2VC925k
X-Gm-Gg: ATEYQzxb9usEhk07tw60KqN0KDX4qdMz7bb34dvT9Pa8+wrBHT291+LV6MgZM7HuKzc
	92e6xksP8/6B4zgs359V/+HzmbTbprjBYb+DDHiBqu7843pi48f3gCNNf3BZ+7H9SUytzt99y79
	3/g4Y8piK9Aid5RUmH9p9TnHe3PMjpt7Gpgzpy+MNQPLeSFU3gANAAn9evy++Lw0htYODEat/GI
	RhJNUbp6gTMQr5kWTdUQPx/JtxrSDxSRacfzik0+HfRFaJBnkeMAb4Rvou1VmldeFbxM2jhzsqK
	Ezr7dYmJqRfHr+9UaUdlfb6HE1VYkPGLQyTrcwJbkw5dVTY7qDUIvwR+rBXJju9f9bkKEnRsjEw
	3osDAGDxQWgAewY3dMAODEy5MjedMQolbdVREGmP6IBWJQZd7apJ7p0uVBxl35ulNw778hYTBWk
	R04bK4qGYLwPFVVlVI4ONWQ0VPUaftOFKa
X-Received: by 2002:ac8:7dc4:0:b0:501:51fb:622c with SMTP id d75a77b69052e-50ba3918de3mr49563781cf.37.1774640899863;
        Fri, 27 Mar 2026 12:48:19 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:501:51fb:622c with SMTP id d75a77b69052e-50ba3918de3mr49563181cf.37.1774640899314;
        Fri, 27 Mar 2026 12:48:19 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:18 -0700 (PDT)
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
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/8] drm/msm: Add Qualcomm Eliza SoC support
Date: Fri, 27 Mar 2026 21:47:50 +0200
Message-ID: <177463970838.3488980.16958516986078779184.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6df04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=7QP2yv1SlOzM556KXqkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 33cTcZyEG3yLR6SZzh_mNFGHXARQq_oM
X-Proofpoint-ORIG-GUID: 33cTcZyEG3yLR6SZzh_mNFGHXARQq_oM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX0IxmLppXJy/P
 4Vg17YngX6t/1XV7+d3esXP0igFOJV7MWxm4PK5972E6ZbUhyRxvOh2pJXH84gNlbem5XZKXHE2
 4dJKSQDU3q1gxZdSlPmHoit6GSAHU9lsO15yQQSy2OpM9h31mkNpBYUFPVMtzHCgJ/T7Ptzx+Vx
 15MY7TCpZz3s0QLfbuIKe+4KABSRTRRM0UTrMYSD/w1+uKFBTQb2aPMQ1v00fdyA4mj20DLfXmi
 hD9Clm59zhTRY5xUecsO3DjegavcEY6RNy/lQKyOi4JU/EuLhBJBtHTVHtLqMNQsWGNSnM8iwg3
 pgGGdC9w47IgxXOEa4aayKlIyAJQQ+k+FXDtrSPADIlYFzwu1ZeL0RJKO6vXm69Kq9DLJTFOr9p
 Bq6t9VqsdDnRnxpbu3z7xU6fD9GLqwbdtEKEkdEG4K7nhIGMYl8c1h7xIbwfGXMb+qVciUNM2+T
 FOP7G/18jzw0Vxrsbyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
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
	TAGGED_FROM(0.00)[bounces-100444-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,gitlab.freedesktop.org:url,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 4895734A896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 04 Mar 2026 13:58:42 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Add Rb tags.
> - Changes after review - changelog per individual patches
> - Link to v1: https://patch.msgid.link/20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com
> 
> The MDSS on Eliza SoC is evolution of one in SM8750, with several blocks
> removed and added HDMI.
> 
> [...]

Applied to msm-next, thanks!

[1/8] dt-bindings: display/msm: dp-controller: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/069a1db1904f
[2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4a0172e8a4d9
[3/8] dt-bindings: display/msm: dsi-controller-main: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c01cca40073e
[4/8] dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/df761873418a
[5/8] dt-bindings: display/msm: qcom,eliza-mdss: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0a40e2e91b21
[7/8] drm/msm/dpu: Add support for Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0eb707bbc7fc
[8/8] drm/msm/mdss: Add support for Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3e64e6959d8b

Best regards,
-- 
With best wishes
Dmitry



