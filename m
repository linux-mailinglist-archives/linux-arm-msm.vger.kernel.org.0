Return-Path: <linux-arm-msm+bounces-96635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAukIU4jsGmVgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:57:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14925114B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F9E13380F8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5243CBE64;
	Tue, 10 Mar 2026 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jB1lIg/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buWVqeyf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D693CAE95
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145808; cv=none; b=OLFtu2cMhj/lPGfeXPy2E/Drdau4RBqoCDq5NXFLDljr5GVjwQ0gRetMq7tZ0IFWDP3MbRT+WdoVrxKGf+WXljHJqZN50dJNnMoKAag4VBO5eGXzRGqWmsIQIRmjDKtI7xdyRd1lLc0xgkBn0SpGnflQwBlppmaGjO0v1yLHRy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145808; c=relaxed/simple;
	bh=k/l0eokSbqoAis37MyaiJkwgn22tRwbgvXEJxKYx8FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dj/icPtWOGamnntaN64U50+3oE+9sOgWBi4r970Rz9fSXxMu2z3pesbMg/C35+DkYe+f6vcI08oBxFYNq64Ybso8JX4+l2wjQktcLEtcOafdgH+U6cwoCZIyRixurHId/++2nE4lgyOL7RWdNu0gyKLykPjOL2M/EB1HvHKgKUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jB1lIg/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buWVqeyf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ABDVgb568735
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T+ZB9/pQLKP7YkjSdjqf1UHoIiECDae/z8gfXl3BGnk=; b=jB1lIg/lMWxoXe4t
	mGy9m1NxKVCGKRuglVAx5z6nI2ySu1K3FQ71z+dHR5iyrm3A+ppidn+26qorPS6c
	PfuGdbJMaSAZ3qSGjv+WCXnZhuzLlXtjstPjY+rtMdYb9MlqdlVXpyaC42zofLd+
	Y1pzJlEuELy9Dkjw6NTyYgqX+GVrG7lBT/i/DMJbLaQF4p5I3uIzbb2r9ZNhsKrx
	Odk8MW/4b5wgTiQrmHJ7AQyA5kzLReZfHdlks7DSW8FkGfP43enh8Yik4Uf29YoI
	knOGZJ3YMk51rKS7KhilNSdpHyGnvo5aRv4mSMZ8LEtjw8gesigYcLjr/8tvCzDI
	3zCrCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8hf4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:30:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd93c91075so64166385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145806; x=1773750606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+ZB9/pQLKP7YkjSdjqf1UHoIiECDae/z8gfXl3BGnk=;
        b=buWVqeyforygz5Dt2ZuCWN7Zm64EtnEWpqciscZZjioIOvJ9Jqr+AO84uZJqXd2mI6
         PqZ9e/gKty3ANRxo1av0NcXpkhLrU7RebGlxoXAprC6wQGl8i15BIxfcqVLSRYlxpzTB
         afy9ATO5FKNUxsjXxKV+eKay4y4uW1RioIxoCI/upcuu0+Zwh8DWnLF1f7mtnRr2MpZV
         PdKimGyd/QSowu/SpodGaez2UjiME7F1mSl5+7IY+QBGjV5TM694rLM+3GRU2dB/Bv4R
         Ku0J/k0lnfst5SgI3/k61VKar7gQX6t+aQwIqIvmBxshJaKFXb34l++OyE8ftXsFJpV7
         M6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145806; x=1773750606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+ZB9/pQLKP7YkjSdjqf1UHoIiECDae/z8gfXl3BGnk=;
        b=e6YCQ0z66qgmnRroqzbZHnYm1Qwq1O9mJK2ycrO72WamJ12piT6huSvLQZg+qYiak/
         k1Jd7MKaKTEAzKSajbJ/QXUaKNZlMd3hggitAXVjPlkGHQY7onEItlOiWdQqeBj9xGH+
         IZ5PEtne3kZgqoMyZVx228oNCBwhklnB6wE+lI7vq5nh7R9WevqsLtDE0boBb2k1smz9
         2X173dlfpatapSAzC2PsQlDOSunz0Z/k0HCImU8A6v0xfDyzsGfGczmMu+91sGAZYCCB
         bcQjgJWzRJR1syqsjChaUFDMj/YofZwPXqpa8iUaa9ID4CNwLmNoGOkzVAT5hy10TjXP
         Dywg==
X-Forwarded-Encrypted: i=1; AJvYcCVyAAaI2m2zvBox22AKDpGk4Eb3GQROrO7hdbE8ZvMa97qw3zm56iibc09IuuIdWiqa0o8uIDzEGmlTgxuL@vger.kernel.org
X-Gm-Message-State: AOJu0YzB1chYcIxOmSXKJcrm45tcs9iVKHabs454Ncibunze8ZVC2GPf
	5/I++Ea3pjyKif5zD40R3nBwD/+2eq4wd5xYFydJlqxvBwnOJOu/O3p3LHerFeU3Z36n9VNd90+
	Yimxop2TQi1vLAdCr9/pD93vo0sJNNFq5Kp98U7OFn3M9l6O7jB4oLsl8VK9W35hTE5lE
X-Gm-Gg: ATEYQzzx9+EAtsUrg9hL4qrcfa9n2j/bglMUTKVyVmXK34exx1HOQo/u5jqAKTTzkv8
	1nj9XcpwnRHRwZeafYTu0iHrdEpQK3/L97MGoth+cdpV8RELU5zBqtvcpWTNVHyAkQQSPhn28XT
	bA7hzklWSXPCgKunmlkuRYSxF2HH36O5f3sqW/PBHbvyrNxYROKN1+Bp3TfaAUuaIODGBpeK/Bm
	RApsFrq+L903N7p5Xc04r3NZU21vDDRgg6stsqqext7zB0hi24kk+2F0yLDf4TygmKkrf7rfdKS
	hQTIbFkdCJ7zRPzh8GnOmfw+DuPMnAkKFXcxB770jLQ9Sv16s8FRfbEJsCzeICmWCDDBbee7GTo
	YIQ/oa34IcxTHPFx7l4LcblksjeClrytC0+X88EVJ48x1duAcvfYqgHlAGLmtqiigLso9qIOdsJ
	8YCfY=
X-Received: by 2002:a05:620a:370d:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cd6d49009amr1482301485a.9.1773145805730;
        Tue, 10 Mar 2026 05:30:05 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cd6d49009amr1482297685a.9.1773145805328;
        Tue, 10 Mar 2026 05:30:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8ad0fsm498237466b.19.2026.03.10.05.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:30:03 -0700 (PDT)
Message-ID: <c269acda-a048-4939-ba69-5b460dd8ac67@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:30:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sdm670-google: add common device
 tree include
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Yifei Zhan <yifei@zhan.science>
References: <20260310002606.16413-1-mailingradian@gmail.com>
 <20260310002606.16413-5-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310002606.16413-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX1LSNjoNKMvjE
 AbibaKW1eZXPUhmYh+MAJplF1ipu/7GEOaUGbLfV7h91hYgCpNPh/8o4FjOT6vNH83Lda9aaI26
 TfHBS9JsNHr1KHWb4SVfIl9HIeJDZXRa2lIWXCIHL/lXqn3Jtnt+cq3La5/0IpAWjySPgqWBbh4
 e5RrjlwRXb7/L5klMRBEbuXYQiybv7nEsbnmfsWGLO0YDJacYIIHOL2gbDqpRdAYeD3A4jTJyyl
 E2kNSCEj2mcRWa2Jh8gWV2uusyssveTiFAVmXNad52CPeWZ1wDyM2yPQiodkR+NmiEzfsrn8D9a
 yY14xaHvH9B3PXiEwIUYdjGCWiYBhs1//QSAXZ/KZZaNPPrOCHtuOJZMR01eJRbBXWlUn0Sj46B
 Y3wGU9pXT872yKnT6WOm5glA8CxWs8MxJuuQhpy7Rlt3QOYCUFQI8xHv+Vr79pYrvsKH+qgowGb
 JqaNr7Jou5xSdD5VaFQ==
X-Proofpoint-ORIG-GUID: UfzNK_C-cNBErf03AqJ3qaIF_oJy9d0i
X-Proofpoint-GUID: UfzNK_C-cNBErf03AqJ3qaIF_oJy9d0i
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b00ece cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-GGBP1G6qWGsZPUw2CsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108
X-Rspamd-Queue-Id: ED14925114B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96635-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 1:26 AM, Richard Acayan wrote:
> The Pixel 3a XL can be supported by reusing most of the device tree from
> the Pixel 3a. Move the common elements to a common device tree include
> like with other devices.
> 
> Since the original devicetree should only specify non-XL properties, it
> needs to be completely rewritten. Also change the SPDX license
> identifier from GPL-2.0 (which was deprecated as it can be
> misinterpreted as GPLv2 or later) into GPL-2.0-only.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

