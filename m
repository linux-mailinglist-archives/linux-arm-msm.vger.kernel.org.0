Return-Path: <linux-arm-msm+bounces-52467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0987A703AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 15:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49DFF3B80A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 14:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A802561DF;
	Tue, 25 Mar 2025 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TO/ZQV6Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3242E3382
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912523; cv=none; b=FCP4hw8MEt+uGOQshDu9YnOXxCDerhd5KQx3aBOw+hKcnuW250hUNSs9M+ShwEvda5I4F3rWhAbGeHmD1fYhUSRwCGjT6E/FNXsersD7GMYz6wgmhuavX2mpo4GHcdI0fnKIyrglD4pVWfW0BG7jd7yFfw8emPLfMerOfkMiZHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912523; c=relaxed/simple;
	bh=B2b0gdsxPlJ0aPkDZGIODju9MnfkVruUd7LTAIJth4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DAHa9lGd8joTMrxEdI7thKNZ5OS8o+T9ZflT2dQxa7zq2zGxYIlFbuXzF2explZd2/f9mXBg5aeVfbZF9/9+bEipUgZvbCXcYVfa0pfjL5gsLTgFKlYHrMZJfRx+6WkJ5shojNXVxnau/LTnmD8Y0WfAcQZGsaNK8YzYLiz4RcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TO/ZQV6Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PD3mAq024738
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 14:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kp3yGWdT4AV6kkrdyjO2FJdT8nOV4kJcKTIpcQc7Pgs=; b=TO/ZQV6ZSOOIQO6/
	EtuY3avalnKyKRDIYJ5L4diQO64ei0GCwfEGLTRLRfVAUZ/dzhogZfZsGwr9LOfG
	6TsfxYd6uqNSrVZNUlLTFuv07jCOec/l3ioo50XpUDWxWIYIRkN7L3dr850X+yIj
	HNHk3Gu+WKCv8y5y1u+nxfPs/LGlnGX5jev1//5a2WihdrtiE8NxMe1Blu7DCzR1
	am8P3+vZrj7jB6YzVh40dx/1uVJIwXjjB4hDQKb5Dx190G4OrLdmfaSNIRlfSgM8
	7HORa5z9tbLv2cqroJ8L3F7PUPAVoqWOGQp3NkI4MSprpbK3KVzwcDLasnSUFOLz
	ygOT8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qjbtcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 14:22:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c3c5e92d41so945590985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 07:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742912519; x=1743517319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kp3yGWdT4AV6kkrdyjO2FJdT8nOV4kJcKTIpcQc7Pgs=;
        b=Obo0bJFcXcAKWRqc4WKILCpBOZNMQJ8/xujpwdudYbEnarPaizL42N/ZpOEg8+R/qR
         JuWDg8IkQcPhXS71s7W7kXdQY3c0Ga/pN6477/NfBFnX7boJFYiQG3mWMMR0oIIQby+e
         8YURxPUZfzFy1jL49Gk7kMmKVbIV3TE51v6L0NmjsMsGatU3lOKDjCQm7zsWMmwXm+6I
         MAVGJZHiZ2X8sm4VJvkPjQPo2SAZOeCys4GL2JMaf4rxo7Jql9IYVBdho5w9T0V1ysnw
         2YXyx7oAN6DDg3thOotWy2fZ9ypI2UML6ljdOKoPCtIltEk//iejxjFttkkDoDuNLFtc
         YZag==
X-Forwarded-Encrypted: i=1; AJvYcCWltIPkRjB1HRPcTtzlpvlJNreLfWjP9/+0dxuKixma5d9viWLLrNfcYXTUkreccxvj5fGDSC0woINzwGf9@vger.kernel.org
X-Gm-Message-State: AOJu0YyU+w87qv4tO5UDcoML7yhDoHfq0SWvxM24w6Xa+C2G8PuB4NKM
	L8skWx8qfCYDfDJPl6L7TdpEroqAJB3wE18zCapnrus0LUWX1epZoF78LccOQlxGQinDDqksOoJ
	1ZU0ggUhaL1K1PwJ16uj7ALdczA/Kdvbov1pKBDDMlUSfg8s382nKmK6DTDcD+DIe
X-Gm-Gg: ASbGncuIAYf+R8gcEHPdBjn0Dg/L9L8uJX9o8HNynu0DyKD1MEOP7GdEzirRHals/t7
	p/zzN+zupR1eNITsCdkDibq87TRmpC4pCBhDicbMtz+SF2r8rpukNQu+6JHMld0wEHo367lv4vN
	y3Q54rIGr8ML0qONPMUjMikCcnMxyCTaeww57T5hipPMKUmPRhwNP/kaJLMoAaz08dyIzVcW9Lp
	uHvOg1TQstlD/oYM664B6jQNyGQNOgpt/MZBBM/JAtr05n80vr2ih1RrIIpUezcqmIpFc6IOhPu
	GDPukbhZtCYbvKhYhOJiFySp6JAgI1svDF/lSo4hs2O4uWfxYHmtFkWhuK72EuBvi2w=
X-Received: by 2002:a05:620a:4082:b0:7c5:4194:bbcc with SMTP id af79cd13be357-7c5ba1a5851mr2078823485a.29.1742912519059;
        Tue, 25 Mar 2025 07:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE3gf2K5kIjZtYjJH4qhQtLNFCQgnGxwMyKEgZu4Q/N9eWpJ5iD6eXdGIpzuGP7y89fDMGrg==
X-Received: by 2002:a05:620a:4082:b0:7c5:4194:bbcc with SMTP id af79cd13be357-7c5ba1a5851mr2078805785a.29.1742912517757;
        Tue, 25 Mar 2025 07:21:57 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65083e4sm1508348e87.171.2025.03.25.07.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:21:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC PATCH RESEND v4 0/6] drm/display: dp: add new DPCD access functions
Date: Tue, 25 Mar 2025 16:21:55 +0200
Message-ID: <174291251084.2000243.209850835590674876.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
References: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6uH66jrNxdjg3qFSwrTDK1UMn-Cgpaoy
X-Proofpoint-GUID: 6uH66jrNxdjg3qFSwrTDK1UMn-Cgpaoy
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e2bc08 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=DZoDOQWOqP-ft6bgs5oA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250101

On Mon, 24 Mar 2025 13:51:18 +0200, Dmitry Baryshkov wrote:
> Existing DPCD access functions return an error code or the number of
> bytes being read / write in case of partial access. However a lot of
> drivers either (incorrectly) ignore partial access or mishandle error
> codes. In other cases this results in a boilerplate code which compares
> returned value with the size.
> 
> As suggested by Jani implement new set of DPCD access helpers, which
> ignore partial access, always return 0 or an error code. Implement
> new helpers using existing functions to ensure backwards compatibility
> and to assess necessity to handle incomplete reads on a global scale.
> Currently only one possible place has been identified, dp-aux-dev, which
> needs to handle possible holes in DPCD.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/display: dp: implement new access helpers
      commit: d8343e115658fb35115e0720f4761ffa0147329a
[2/6] drm/display: dp: change drm_dp_dpcd_read_link_status() return value
      commit: fcbb93f1e48a150159534a1e6ec19e6fdf9196df
[3/6] drm/display: dp: use new DCPD access helpers
      commit: af67978ee37e543e62d6d3f7eba58f8f259423a7
[4/6] drm/display: dp-cec: use new DCPD access helpers
      commit: 97f37939881327e118d6252289973c186377a075
[5/6] drm/display: dp-mst-topology: use new DCPD access helpers
      commit: 2554da0de3e8312c7149d03d702ddc6c1ff5e3de
[6/6] drm/display: dp-tunnel: use new DCPD access helpers
      commit: 95c4ea2e0329b370a53a041a19227f8da3f47481

Best regards,
-- 
With best wishes
Dmitry


