Return-Path: <linux-arm-msm+bounces-95155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EPGHsrtpmlKaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 15:18:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B281F14E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 15:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07481314FC95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 14:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9375C388E55;
	Tue,  3 Mar 2026 14:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjgKTAkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oc79IUby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D4388394
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772547047; cv=none; b=oS+PGldHu/Xoo3WStsyjKK00rMOcTP67oXM5w5FyIt2RQlIXXcij0ySjCduxf1jS/ysR2OqBr7nPFe+Vl3mxf/catDaJbBXAL5F1ZpTy6n5E2GEBdqSsUsWRp0zkCdP4GCl4cacpDqJDtwT3gSqq0gKSctAiwZz4ftWj0/s71AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772547047; c=relaxed/simple;
	bh=TzC94QPZLfAjXOmAUze9ASpZwQ8+2AKRwSRX8Zig8AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U49bryO/+SekglOBI069SpVJCnqU+S+LtoEr6jxk4z9xDB5w8LYWD/HbbriSxJxAiE+ox14P1lPb1E99jZRvD84VNTCaK7wfoUCmR80/BTXd+1QfFhSjM/AvCq7Zi050uzIeF55k1wYOlQXeAf+yjbQMaKuW0cRRi21REO0PSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjgKTAkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oc79IUby; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mx6e3996898
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 14:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qR5GzbFJ+dMxU6WWcNRoCJ+Y
	aJmi6VfZZWkl7xtr3Y4=; b=AjgKTAkh1IrAwyyKPL9QxAgZvl2bB3RYIP06DhHe
	f8/kJngrKj7Q5QYcMBL5Bbr4AjfVmKZIbKXJCfDgc5ZOeJHBe2+kuiBUA+FmB9Hh
	xkqNr/FAbddtklvIlFHhbBhzOh9y/nR5lHYXXkz2DDMzOQcWKr5/nCObXkQSWIK6
	qr5GDxmKJOjpqhKRzlyWxCCeszcm0bZjNTyDd+IFG+W7Tc0ZZ0Wx2aDrAtL6fF8U
	5M++w+R3rvWcOLYWZfzUhbL6bZZZWff4Py/HtEWumsNJ5mCs/rZUZjEaGgAE/IlR
	Z0+ap2GX9m8/QbWWFebQUeKimFgjSCIRjpiVK9FjqX9pvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fspv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 14:10:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c882774f0dso3827472285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 06:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772547045; x=1773151845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qR5GzbFJ+dMxU6WWcNRoCJ+YaJmi6VfZZWkl7xtr3Y4=;
        b=Oc79IUbybH/wW9YtrAY7hss8GgT4M/GRkOrhrilpoA0sN+VQ6V77IHGyPBVCekigGw
         cZzp3bRgu3zzK8KtG5WW/DMGvn8Tb8CyiHB8gYWYdPj8zpiCIDEG0eSZie4n5VmCzGvY
         5WUkQ8sqpORD5e+Z+j4BpgIlxS1lUbQZD8fnAtX+nw4P12azcHpyWwbxSr/ghTRJcBPM
         dmFtCgvgYGDj1oWtGKUGBKO9obZTXFrP2Q5d+3fnLgXIxlqlS9CJaNqqtyFT/oyYOXag
         TNtNAH8UtFohiZXDNCw7AlER7G2VZL+wstnJ9dR0pyWTGxPQOe8OHfuTkhF0oQ3GyUxR
         E9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772547045; x=1773151845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qR5GzbFJ+dMxU6WWcNRoCJ+YaJmi6VfZZWkl7xtr3Y4=;
        b=ZHkcWbRvOkmsoZlDfKWWhyhQKFbNx9nYdGXdiz9DmsAej4ByqwNIRhXyBG0Ecj14ZG
         +xYG5hUYFysj7jK4DUMjvzTlqnSGmK/xtPK4VidoLUB63y4kEpPda2/i0ppQicCe5gN3
         bsC5BPj/GiBDA26vMT1ZMqFwjEgAzkoFOm0VLsJuvOzjv63/NkX90fXNfZ7vFatixmxZ
         aWJHSjqWxqSINjIoZ3gUflMLR4UsPn1UPCT+eHT5Q3Hl/wDRK8wi4JPIudF+diueiMtc
         c39BNptIPj+dE6YoZ9GIubkvC0rCmX7arLOHXbpbH5d3LLWT/hIG54YncQ6beZ8JiME8
         n1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYZWwmYVFd2J6rxm9dgUvvSrtPSFB2A/bLvz8eKzkxHRIWcjegAhXBukEei49HAvtYisKb+xRc3UF2P2CX@vger.kernel.org
X-Gm-Message-State: AOJu0YxeItVfYrs48SmkPns1YUntcj5uXvLWphGOSsip6Nfq9/ZSDKwc
	WR0erSS/CG2LyHazKsR6PVmur8PSlE5K48FXXc9ndm9b8vRwRLirFR2KZeHZ4i2/YI26hzYNtMF
	IKOW53Gqucj+igVIEd8I960fJ+96CSfwIxHawcu5HZ7mPaHn7gJENSARuQnGcjJFA0LNy
X-Gm-Gg: ATEYQzxTtNiG8q0rH6oUyiKn5tofoZI3slSE1DlDkyzWvVpXuLnVdk42MFg2X1uHRg3
	mULx1h2FbSjRjD1tXQk3ZWbLm1Ec2TDKcx8GkcbcWm8HOIXkCYfGx+zYshhqOx10DzqMJDrHEbJ
	DsgbJQ3dHX2k1F9fenAkQOu/UCcwr0pWdfkgJSe974fr2KivisNdn8O+uF7IKF7PI1CiCq/Ltdv
	/gPpefSIAIvYTlhQcw0UdGIFpezXRBewiC5DoTFNwX+BK25VoEpJYbtOWAbJlkXrEKQqdbEWUgE
	MZNL5CjCIbKB5iAG0RkdSgWn7DDOnSO3zr84UHYdiF4qAycvyHdgCU3ZsU8AZMMzYOYBeAHOOmJ
	iSO4zoAy+tMOCsbiY006LEIbt3DZc5iRdwvSTVBkw2KIONdo1gL3HEPLrZK9rJZu+VXiv6zLGtS
	BqY0VVgiUD2WphhuOfB3E1JFfpr+fCRIUWQQQ=
X-Received: by 2002:a05:620a:2906:b0:8ca:3c67:891f with SMTP id af79cd13be357-8cbc8df1c13mr1927060485a.46.1772547044720;
        Tue, 03 Mar 2026 06:10:44 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8ca:3c67:891f with SMTP id af79cd13be357-8cbc8df1c13mr1927053085a.46.1772547044157;
        Tue, 03 Mar 2026 06:10:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123581491sm610722e87.25.2026.03.03.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 06:10:43 -0800 (PST)
Date: Tue, 3 Mar 2026 16:10:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/8] drm/msm/dpu: Add support for Eliza SoC
Message-ID: <7hwaqdfopuptvjoikc5y5jm7lf6pr556k2yijcac44fobt3x2z@5eglub7asuqq>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6ebe5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zHWNXANJRpzq94LBRZAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QnQMtLoqog69hu-SIdKCji_x7qj3acLR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExMiBTYWx0ZWRfXwY1iM9WxubUa
 YBk8zW2UURiuwZKaV4JQEBQu7XaBHtVr0siomUJYfauraE1ep9JN7mqo5nGLUmhGs+c9fCv8s4Q
 Z3SQPxRT2X1ZZR3/kbvcN058eRGLyw0DIsZwsrdABnqtc0Z5r0gTGgdioN6DhzwXfMp1fucqqc2
 kzqX0LFdihWEGDREPcQS4qA5fYoH553mVwTOxdc2jkANHKzyXcxvb8DuRN8JZ5SNLOeWdPHl2Ob
 WKnjfTJI3tnHNacA5l4CL6s5F++yVFfaOToWYn/Vi+W59L7+YJ17EK3fymJWYaZH11HDQbnLRNe
 9JrUqShyJjDsQQbyk1yCet6uU+MWuLHXe6iRRD0MJ7g8xxVDBwlUESHUNZnC94VjabD9OXY1wvM
 yRtfWls/+wnYttg06Yqek/r+JsNGau9BaJOnvRTJxm5qpSyDhQba/XMMj3/7DHS951ov1+6FLwS
 EJgCR7A/2+9vKdojX+g==
X-Proofpoint-GUID: QnQMtLoqog69hu-SIdKCji_x7qj3acLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030112
X-Rspamd-Queue-Id: D5B281F14E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-95155-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:57PM +0100, Krzysztof Kozlowski wrote:
> Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> incomplete/skipped part: HDMI interface (INT_4).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 368 insertions(+)
> 
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x4bc,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,

There is no DP_1 on Eliza

> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	}
> +};
> +

-- 
With best wishes
Dmitry

