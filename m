Return-Path: <linux-arm-msm+bounces-52845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0645A75B95
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 19:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7013A4AD8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 17:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076DC1AF0B4;
	Sun, 30 Mar 2025 17:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e75VYa//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849E01D7998
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357391; cv=none; b=ibKrS5r/zW1Z4SsaJvLUDNQ/8VHmqqJTnO/R0N3sTAzIHvvMojKXgQFd9igVImN6hOImgQtKxAZNObfscriYj+MGhHsBPanaot3xcz7l7CUTIZ/ONdX4XWuGoXP9rZFS/TAGykjgrm0bdwnHFIH2n8JdzCTjSzZ7xNWkDiI+VaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357391; c=relaxed/simple;
	bh=M7YcCO2/Jd6OWqTReHmKh8CPEQ89KUSFbclKV7W0TEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWHdZpfKdVAFn+MuyYjn0OpI3TxNXGUFeZOiPYOqBWmKMdhRFczAhm7pKlYvgoBIoD3Ubd2KyBU/j/S2WNR9gDGFhDKNxTOzQ2EjPtI23esE50UtxjhQ1eadME+vRWAPi06ixxtz14a1OnE+vjgOLHgzY2By/r0PNToK5J4ittM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e75VYa//; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDpqh4025645
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lz8cPs1jv9yYaNYKFo1LAT2i
	8NFG1hmV95XiMt5jeXQ=; b=e75VYa//hrOje19C0Mz0/K39wmVEMpMO95Nzp7z7
	1F2XnyGv6DNSg5Tl9bHgbnl/hj2KvBAT7RnNTtlBmIrN16Hq4YMVXZw/5NDgldL2
	SGanrfylCQ679LHwwRgEdIkovyfJ1iErzxt7lJMsVvHMtMGck0tcjIsoMG7BfZTz
	qAM8XpNYhLdOoQXg1b/yvGH0+GJiRY12UXEHWBOOIiy7tKjt1xJu7Fgli7R39dHg
	6dFeAQxgCeRZiljucaJhme53BE3KiEL+EGL1utUFupbLSrrfP+NBXHEEpocYQ8l8
	SHkcTsPau2O4Kle+gIxmxsqNiXklZDjgNdMA3SMCAzBtmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjjher-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:56:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so130679885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 10:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357388; x=1743962188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz8cPs1jv9yYaNYKFo1LAT2i8NFG1hmV95XiMt5jeXQ=;
        b=hrcSiR7tAxNJV3HYAqMRNYlbpAZkUXJPw0x/7cAGo0vo5p9sAkY9W6sPVgWzonin+R
         oTYVaMxwIUmIvrcqCbxwZPppo9LPGgX4GcuO6hZlB/GO/kQNu+dvekzjqNWMJ+XO9HQ1
         G4f/1rUxnxC91YiyuvbNQX7aVfRXVEy58XVtqByw1qlhCDKeESDZM8HMCFIi9KExgMjH
         9WvfnqGD5g2fE/836tm+siqZ/KTUNFtzmxpx5TUThDVzyeJyTViXo/grkqqslFDQg2ns
         qCRfp7Zm0O5x2BoeW6qpQbObksuIJr+xMy94B9/QX2lCIboMJJCKOF0KLBYdC4tw6y34
         B6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFk3uAKo+2k0ru79zfMQVTJXdM/c/cbC/nZrma3W0zrz8uordMqVkAEkOTLd5blUd4Wvni2tUq9NN+bLF1@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpkcnrSj1lumTs8sypEdyl7+jE2D+FPyA5B5+yRYLTozV0EBq
	t6Hjj9NC6hTA4yaDIjk+6xv7r9yKfxKEpJ89dvtRkBp5mePJbiu7dqcKSkP9dDr2keqOArDSoCI
	r95ETStsQtbulTlK6KKniAllM3JX7pwCc6YIjz/dUAi2nTka8NH0y5TzYdH7E/2fQ
X-Gm-Gg: ASbGncsiwU6VVfVACLiFhFwy2aoii77VO/zBwtRfvyfe3kB2mg4p4/O+RET8/4AHLh4
	+iLtc9ogRF3xRw/G/53e1zRAQHxqPEBhfKVrw5mWw3v9jEipiBJh2PBbYkiWzi3fpXYgeE5liI6
	n87X7z/QFtx/Mh4jDLNYXWaDKZ5tQ/LXFf6Orv5Bi0QetMkQ3vk6N44O1CjVhI+8xSwVhk+VhLZ
	jvpCsRVJI1QyvgaaRBfVY8ZTUAXckzyDVday5wXv210wQBOSSs5ywnnl8yvjJFT2ENSLKfCS4+G
	a9sVttDxI2VI0L3cbxdWeumqsWQdBQ71bNOsgfFmWnfVP7llZo4FPZi36avIhRjUgpxZhN656SF
	6aIw=
X-Received: by 2002:a05:620a:29d0:b0:7c5:5a97:f784 with SMTP id af79cd13be357-7c690730c58mr798691785a.33.1743357388333;
        Sun, 30 Mar 2025 10:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV8w3BiW0koPwvLrrFAy1gyiPQeqzm5vgh0g49Qe+2/7yY+I33AnKCPyAKUW1tUcda2ovAEg==
X-Received: by 2002:a05:620a:29d0:b0:7c5:5a97:f784 with SMTP id af79cd13be357-7c690730c58mr798689985a.33.1743357388038;
        Sun, 30 Mar 2025 10:56:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2acf72dsm11498061fa.48.2025.03.30.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:56:25 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:56:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v5] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <f2odvmbhsfmkrkzada2a7qdjavomt2cjji7mbwibzlhxiz35ai@2qxnfb44eb2r>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org>
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67e985cd cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=YrjviDGP2Rj_hCM7jl4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: B3rAfFVBnYQyyEuaHT-F7wK8ctXIOXOZ
X-Proofpoint-GUID: B3rAfFVBnYQyyEuaHT-F7wK8ctXIOXOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300125

On Sun, Mar 30, 2025 at 06:49:40PM +0100, Christopher Obbard wrote:
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
> 
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> registers is now required to succeed. Before reading these registers
> was optional.

Describe why, not what. Something like 'is now required to succeed,
otherwise bl->max value can end up being not set, although
drm_edp_backlight_probe_max() returned success'.

LGTM otherwise.

> This ensures correct handling of eDP panels that report a zero PWM
> bit count but still provide valid non-zero MIN and MAX capability
> values. Without this clamping, brightness values may be interpreted
> incorrectly, leading to a dim or non-functional backlight.
> 
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>

-- 
With best wishes
Dmitry

