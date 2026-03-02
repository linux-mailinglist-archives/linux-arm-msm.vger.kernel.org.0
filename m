Return-Path: <linux-arm-msm+bounces-94996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CATLCs63pWkiFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:16:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCA51DC8B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6CEB430AD146
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4027042EEB5;
	Mon,  2 Mar 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQ1cF/MH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fEFjOI5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB8A42B740
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467082; cv=none; b=iSFWHBqpGY8hTBTN2FKFqtWt46mQS3L7e0wffl49runHA87lvh2buQYNU7kLLAed5F92tlbskXAzzlDoSK1gXc5079KalquNE6Pfbb912EbiYRYJlZN6oH3Pwsm8jAQ8edwIQJJnEStxVJQUw7GGmF1lK4vr6F1JW3qP6kGuExU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467082; c=relaxed/simple;
	bh=QtDKw3sIoTdfDtZw65i+I58veFyHFSLP2ujI82KTTCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnhzJmXYMFgHYszrUq08/M639wC/Wf6OoesVHGyRfUA+q3bclaXVOwF054rVR9RMDxstP1DQZmPZ9cVLJf0oU1uxlij6tipLzgEfuBDBznHOXOSDiOifRNkqSjvGrUOQB318XbFJlssFVDedl8ptRGGxa8jZqKy2uj9XWbmRIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQ1cF/MH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEFjOI5Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622E78wp056160
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=; b=pQ1cF/MHYq59woRz
	oPrTjawyd36QiltIrv43pzT61p3G2qkYzR/zqYARzavBpUevniNAZXa1EVozR2PE
	RbUaTpzJdtRHFOP7mHtMmZl9GdOAPUGNnztZJOdUxGIf7ppNfPUR85fQhI6nAoj+
	hfkbZuQG4T3Zhd3V422sOQwPkHm+lkLJRudA8Ar4m8of5apM7xIz6yzQB2vJBhZX
	vBjN5x/zBYjil+QO42LFEWpPtdaurRGUCpecBMuk7EPEg/QD+/NGvvzDErfDwP1b
	lgJ2351XzPs7Uv+UQpq+SIPjiwBGb3Kk22wy3j8vJod/lMMA/RYfgM9B5WTv0Vgg
	bRJXGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64b1wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:57:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4b8e9112so377157085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467078; x=1773071878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=fEFjOI5ZZfVUrHIQrBzM85/ZrTaxhh2J5tXIDhSdscNRCOoXgIxJmGI/ysz6hjnsD0
         wcc/A08cFwk5h2zGgGDMNyPEHk7og5m6PanyS2lHaGB2xRL+nPi+Dj9GHpCDvF7H9EjA
         nicOEA6OF8KrkDRUhZ/Pz7SfORh5+JbwmDWnYvn5By/GhzIUCB/ifsWsfOMrwGNxayGW
         ulF2W9DldLTbCvs791djKjFdKfd29xI0GFl8dxlGGgiy+gWgV2tRzC+RSSyYKdb8iGtJ
         dQe/9IoHavkdJ1MeM4ySWLnAPWhpK1NHVJk73zCaNlrqePLLsvxEmLZkDRzNitrOog+l
         mXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467078; x=1773071878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=CO4hya174S8DudAJT6NjdsJl2kEn9SClPC7stYKnENukzC8GRlHuiUFrtM7fQOMrXV
         iHdCAaqw/9Lz+Loo/OhHQKeHEiRgHD1qtVS7hum9i5WMjxY+p8yP0TY68nlOkw6GIWvv
         YPfj31M3g0t4SNxU6JpFVENk9vOBeIRzNnVGYkORPH84mpRAS2lPJPWUo3AieAq18tu3
         zErCdqtgq3zapmvs8AuYO9N3gCOCc8nRjblsOKC8FMg/8y1cAF7JE0ZDqUb9cMfvLLo1
         GdjRwKZGayMC+/p44oKVS66h+Rlm1hkzrtABJK6dDNfHZSUmdMSZGTdloz0o4i0D+vSB
         bKog==
X-Forwarded-Encrypted: i=1; AJvYcCUUdU1TA3V6io+EV4aNjbL7Thzbsy17+KA9EjDzWMv14jFYyYNpm3Kf/ZN4UGUH332SuG1uERYLFAXrR1WM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh9oI4Kq4x4bgKXQMQKiNdia8RaEvBY+7lsD4cWUhCgwRdk2ic
	xq+skPhyrQXxurERo7xWFFcQAGPMv+s6OzXBIP8JbuLg9vV4GXkIzMPmi0farm6YKpW/lND8nnq
	pcfkHBiPyqh0jnelwn5gCKbIV/rj1viXxGBhDC7ASg7/EiZymtRqihiYmN6fJDwziJiNN
X-Gm-Gg: ATEYQzwLeRyGKCT5OIRz8Q+fPP/hO2J/T7aOO4VguKqplJNeiiPPftBBizIowZEnpR5
	i4Yx1qo3vRrv0vN96owmmY9KY6lDtTNNZM6V5CDoV1PRKYOYf4nUJQamIfwcTRqQM47ViAMSU5W
	4SxuCMx06ZYQraUc9I3RSpSg1ytHfV/KNKpVQgZj8bg88l/gSm2IDGTsGt24ahr586FPitdJil8
	j9UaUleupqElhxZIaJ2KaV/d8LnIGKDMH2n8MjKrznTQFGIRahq0Gfnvc+ONNDrXv+9H1kiJ0wQ
	2aV1G4azH6vlHNMRz3zw68Nu69zrbkvc0Gl5QrnwOemOnjtmkR7Y6uI75e6pjLg/VFllK3/J5Hf
	Xnn5xGYWbcdBCIFwvrZZDppCexiMe8fB2pn/lQH4hOjDewa+YEu5I
X-Received: by 2002:a05:620a:404d:b0:8ca:2baa:774 with SMTP id af79cd13be357-8cbc8e82641mr1612984385a.18.1772467078435;
        Mon, 02 Mar 2026 07:57:58 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:8ca:2baa:774 with SMTP id af79cd13be357-8cbc8e82641mr1612979485a.18.1772467077944;
        Mon, 02 Mar 2026 07:57:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:24 +0100
Subject: [PATCH RFC v11 11/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-11-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gfl+Fn+ISpyM/izQ226zR5pAGJiHs0gWIagW7nCmNI0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNt5bDUkL7J/F9xgZHxua3RHn7yN37DQAd5k
 a81DXZBCUmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzbQAKCRAFnS7L/zaE
 w1AsD/0dIvkbcuCLSVavXlzNy2A5vtB4RVHS7Sh8XU1wqW/rudIXRcE6A/tT6zQwwRl9FKk72R4
 LRyW5woC/F8fOtXQbE60wN+nyNhHJqFaQrXGcgvkIdjSeMEPHBP0UGmLQc/DlMK7Myvcmha6NBq
 a7R9i65yQ1O7/TjxzvKbo4c5VsEJosG9sqsIFAyo+cctWRU5+DVpaHS6Watckmbme0qFNGqMumJ
 ZK+SoYfWp7qA+QUakyhPHwWmBJCyojx0QWjNQ8jaXYHBMQvDDGeTv5aXLGbiN/X7cONQ6t+5gok
 bjmeSoRCll96nWdaXevAKoCcIZSlLAZtKNrPRTP2GWc9NskijVbNH/58e7ZJdTtHcrHe2AuqrDX
 5IoxbK++ZYng/eVj0Co2mqvxa7b9p17y2odXkzVfMnvcQiwUd3gp9OHNLvtUjXhwgnH2+9bLInl
 7QeLiTkq+oxQOUFnF2NkQSywZFTVeUuczgyvavqi+GMgYUPijvaprVjCA3R9hLuxKq/Xj99E9i0
 bHNrt3Nd6WdtF2JvBKm+xXlADr7nUv01fx/TDwiXIhzvk/GnJoT/ZfH0BqGi/ktIBdPqgujId+7
 xcRzaDdTjSY+NCHZL0FfykhDxXOXZjG03CXeFld/hXWHgD9mY3CgjRQ8lj2++jdO2J9Q3dLNRSB
 Ddhf8CtiibFMAxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: T28vPb-2KwyKFtR6lV04L-9dK-RpIkEv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX+WXgdbyJOIO1
 XsZgI1y+MygeJEOEHXf5fjrtUzzoapvSqEF+p8rebV3MqudUL/PPGZEuyoNCRIk/BVXm6QxBoa4
 L8XPLTIIAjNkR3zjfPIuZq8rGrs47w97RCIniQAU1e532Md/JPsHb5f+PtggD7emIq4FOMJx0bJ
 ZveplGlhkxWV5Gw1a1TE6vcN08UnY7jGKABMIlgJJFo0X1+S/tNVTnN7evbCXQLqv4XLOobTqfg
 rluheT70saMp0EDINCuRpO3BjYPpoyxb5otP2ouJb7vta9vMwiwt7u7V20V8q1TB0E6R1O0hvOH
 3EfBMk7y4eEGdkfTbbX+/hSLXjrijYAAEWmCvrqNzrJnEQ4LfArhFNW1ne90CjcxUvgRJp5yyE9
 8Go5iG4yzfOJC+ITVb1H0sMvHjkq9OPw2aPQQJD/u5NVipz8izZKmUroGt7284cLXFMX481lrHt
 kYrG5XprNt9JlZspJIQ==
X-Proofpoint-ORIG-GUID: T28vPb-2KwyKFtR6lV04L-9dK-RpIkEv
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a5b387 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
X-Rspamd-Queue-Id: 2CCA51DC8B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94996-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8f6d03f6c673b57ed13aeca6c8331c71596d077b..83491e7c2f17d8c9d12a1a055baea7e3a0a75a53 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


