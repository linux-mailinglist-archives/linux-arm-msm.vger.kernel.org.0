Return-Path: <linux-arm-msm+bounces-101728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OJ4DFEe0Glk3gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:08:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85020398119
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9C273027B64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 20:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528133D565E;
	Fri,  3 Apr 2026 20:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWcKyMvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCp+k4jR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1291036164D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246699; cv=none; b=X2ABC4JT1nVJs07S3/hy6xX4rjk/ycdXzIAjplrJ+mz/CNJcYBP9Z5C/X/TFiMlfpOdnEvsfpkA6S1jwAKd+nA8ZNfwZpn00ykA9EcIKy/bTSFGdCUHOwxDtj/mhMZheS8PybKa4FC/78LkAa5zxKbgtJ3Lef9tyWRwXeBjhcAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246699; c=relaxed/simple;
	bh=4SpApPMGjFbxfKAN1ZNT+BLXJEP9lU+80DJn9TXhW+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WipiLZSzN/8oRe/8ONaBOpB7E1mQzG+h3UnTTuXrNBW656++yr8sYrhUokjBv5KHTcOf4lBd876AqWg6sbhFTx8ZfvNNdb7uuBbFcJhdQi+UM6H1VbSPJABId2Y+0DKEqKSAHjXHkpzoR4e5j+Xspz46CvUNekTOeg1yw2F4thE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWcKyMvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCp+k4jR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1dx41453174
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 20:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8/wK4/dOjsvQoyUObggzdeAJ
	1MXSF5tzDRQ4C/byLIg=; b=KWcKyMvdK8TyEM2UiDTsve770Tg7tqTtEX+LA+oQ
	MI3GpC/iLcYWzAwvq8wQWhcNB0EdI/gAwfRKeNco6PZbKUi3dVfZlH8bylNuEiri
	wZVQd38a7zdvciNWdo7Dw8ggoOvhGKj20e5U3XAwJH8//F9bmEgLwcjma2VtP7ce
	9urxePLH6pZPkkOAdRcYAIDYhMLko1iNOr6bWxdBwLXgkGH1e+Mj0S/zyGmRk/l5
	sQZXG/tM60zQLIeGM3GAomeI33nxk9vHM9svldh8YjV3Buy/7LWEvrJ0kpcLEf4q
	TEG7cClfGFVTwVHjHolHPVvimd00SrC4x0dqGEPRE1vQsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam9eyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:04:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so35510231cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 13:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246696; x=1775851496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/wK4/dOjsvQoyUObggzdeAJ1MXSF5tzDRQ4C/byLIg=;
        b=NCp+k4jRjmK3PrFqzd6aVf7dsWE91bD1PW6AGMuBw7bwwNGlhKujYBAn7/leNa3Des
         uUmCCrQN4wjQjSRDu0s1s13PU+OjDcArk+8MqEfZmH3jG+ilWUg/RN094MqBTgcxigUW
         d7BiEd+/vVXjPl/A9lNNX02MjKUAGkQdo65hkUzyKNjz/zNh9HnTRyiLjxy1vmAEbbe0
         vKRoSzELwE6Te++RbmUpCsRAvjF/sTdKbzi5z4eO9raxJVQifBPvb4MzXGl2vx6/9ZcF
         NQ8vJbezs8AT0/wKSaj48/wMH6vXVHFO0Lc86csTD92n9B+A7/kCuvTFZnVlx4f3cj/m
         w9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246696; x=1775851496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/wK4/dOjsvQoyUObggzdeAJ1MXSF5tzDRQ4C/byLIg=;
        b=X0fNmBH239Fdk4fbGhKY+ct/9eKX8SzgP2bbLRzRVuhv18cL2FPtq93bI30HNzlSY2
         CRFU5uEbvwifvHOPA0m6BNbKyZ6xNcvNREI4jiiYFSTqoCxMhT/h+5+ySjyprHdqbKOG
         /lPvp2IyjQgtDZnrE+PpnCqZ20sz++nYHtIiRcAYLQikt94EUFmnzgDiilGdTW9Llf3g
         KBuwtO43VBSEHnDC22wshZ6cpEMF2qlUZ3ivl33QahpkldWxV11J44s65DLUwNUdyiug
         JYucxwjQx1YqnzqvWiFJ/mbC9FVsFADNbu62a1bEtNpxKnFNebf1jI7pMfjC3jTo5Wp8
         6Ifg==
X-Forwarded-Encrypted: i=1; AJvYcCWu4Xv92C1V74UT6IBveyy6P1mpUQ2TN+cvmKA/f3L/cD7OHes9EsCEw56wbVKsU3Bngl8vMHkd/IleU/Df@vger.kernel.org
X-Gm-Message-State: AOJu0YyRDmJfywpShOH6wO8TeLKXUg5JjtrZX9lDZHnlikjusBGTa+qa
	l6huCcoWfqYVRyIkFTOGPT3U8M7qz7YWFwv+D91gu5XY3IgNm6eQNm5hWRJdrGGxJzx3KPBEtOn
	haSSpDIW+pNBugZ63WzzDd8Kxmu3sxhToLAYz3kA44O0LPWA6ygqqzEipjOYuK8lWQvBbAyKgLf
	Fz
X-Gm-Gg: ATEYQzxcjNwEP12tSfeyJ22RlD+3iohOS4DQrI0uy9A1rKJ27o7s/TJYcCPI97/3/aI
	ganZrAd1v8NIGSkB+6nlpRUuVwhZi+N42aH/7jvgI5TXi6/kzE6sng+yvR1WG9rcmCpvK+u8T7D
	521VwrXwC/vDfwsN2Az8xGYeooIdZrCHhqXObeCEsBYcv9PrdwLYQfHn89jqDFNvNrNqZB2QLRP
	dWOjnPX0QzIC0w5g+9bIzOAFqoDo270AX4Pq7lxHwv3GoeIASqnEXS5WmGRhZNgzweXYF4SCR8L
	+7imUAaw6fzcuFIWIjw+UVxej4W8sBL22hsxBodiqS3wqG3hCaPM65O7oQZ3fgkacv5oUP0DLOA
	29L8AjTIqT/6Qd+bNmH8oOvWP560sj0KGPhfLym3JdhTJ6oydvYd4EmTVLVDuh44hBVfZJAvHt0
	FYd+kFAe89By++4J6yQFTxyEdM+XeyunbAFD0=
X-Received: by 2002:a05:622a:8c0d:b0:50b:31d6:f7c6 with SMTP id d75a77b69052e-50d4fa3616amr82584221cf.7.1775246695784;
        Fri, 03 Apr 2026 13:04:55 -0700 (PDT)
X-Received: by 2002:a05:622a:8c0d:b0:50b:31d6:f7c6 with SMTP id d75a77b69052e-50d4fa3616amr82583861cf.7.1775246695367;
        Fri, 03 Apr 2026 13:04:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217d85asm14037901fa.41.2026.04.03.13.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:04:54 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:04:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: aastha.pandey@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable cpufreq cooling devices
Message-ID: <ybptzcfs45xn2tkjm4vzxm4y56bh5m6yuzvzhagoifdycrqgdh@hzvad3pg3dcm>
References: <20260403-cpufreq-v1-1-9d465988c3f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-cpufreq-v1-1-9d465988c3f9@oss.qualcomm.com>
X-Proofpoint-GUID: A1IeSh3ahAiHFlIs4Ozj9_FVKk8fNdb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NyBTYWx0ZWRfX8yQd4iVIkpJA
 HtgPVEbPrf8Qrm8ZFOdEE5/3l4iH5Kby43uTboyVIp4cmO9unidbOiWlLAf5m0XEiv3oCzXve4k
 GlX6pkMnYRTwGveKJpbjhlOggdcv2ay0u0MqcjdxJNqFqKPQlxXslKPoSBaoG/onlKUJupSf0sx
 eH7h2Zmz0hwwEHimd5dQ4Ww24L4RwwGQD2MgSokFxpgcjy0vx5i3E+q9+jvTOi2clpSsg9ULkYS
 bElb04OrB8XfwkaNXV9WQXnHZ1YHKQwYUJwFQL/DWG3qhODJeZbkg8+QNzyXw3jAhd70H+AeNRT
 Xr6Brsblzh53kn2ceLXLZqvB3cJa3rdBuiCIFDVSyZloaNYKSqLbbeP/tJ3+DTiW7DfRrjSHJEe
 +RM37hux0b7HiEX3KSUvPKvyKgXg+DwS/sXMujuEw1TrQIYHduSgWTrV+P4Pwormwa0kcOGaakD
 6V4c3Wj9LY/7MD9Eb7Q==
X-Proofpoint-ORIG-GUID: A1IeSh3ahAiHFlIs4Ozj9_FVKk8fNdb6
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69d01d69 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PKSGMhPC2aK78RK9aM0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030177
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101728-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85020398119
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 05:26:33PM +0530, Aastha Pandey via B4 Relay wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

