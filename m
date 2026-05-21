Return-Path: <linux-arm-msm+bounces-108978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEXiHPfODmq7CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:23:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE76F5A23DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C338931DD0C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFFD35F5FB;
	Thu, 21 May 2026 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptVDuDGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkSxANUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044435504D
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353850; cv=none; b=m4RHbAWUHRYoG0VMvFEgrNxzT2nPg8pOESSyZJp9BCa/Xa5Nh5d2VKMcTxwJk552nWyKAS+BkYNPmrdkv+SzroYZ8JKyb/r+MQfzzW5uUpFzZTcF/LnmkFABAXeZ2Xzzh5JhOX+T1kNDbNnyuzXo9OKjGetFp8TRA3bGbZp22OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353850; c=relaxed/simple;
	bh=eaVvj1dPJSfSZ0x8CWyjinLutqp36HpNs5/aY/I5530=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/GfjXtdcS3RoE71igMJR9L3YFUIqr8aWuZk61Ch0fuKBsD6Zf79ZZqH+QW5c1osy3jLbB6dDp2LQHRBGubKh4bahVMIivcZAD9DHCQ6he1Arn2c3Pe/r5EpaUuD02+5M8zW25ZiffY4ZRIvKaqcqqiQjw4e99l8deDpraHPfyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptVDuDGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkSxANUB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L68xPI3111300
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8FjEMX7Xg61uERfYxrB9paEF59vrppq67TlyjKhGpss=; b=ptVDuDGbznTcuPWN
	0Dnwp89uTPhkRd8CDzvkQ/MosxKpjwf/aG279ydRDDs96TNTWfiVeJRuCYfaN29P
	uHquFiqHAGan+u6AgS08+cYCD/YZP574kjHaiJVMqggcLUI9csXnBceEABvfIqYU
	VEGtGa000E6NzUwtlabartw1ZlPBywwijO6RazC/TnppKpZHVfhH9FpkKs3hspkr
	xJLbJmI+9JsYMEV0/n0ImIRybUivlpP8Cv19KUko2P/oV4DPyYzhdRvPW1EaFkV+
	QVkjYR3TLPKW9+W5cko1C8MbQqloKix+ucmouuQlWY/iwjiaZB7LTnYOtP1tUipY
	pfsGCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbgpdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:57:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f04f07227so147431885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353847; x=1779958647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8FjEMX7Xg61uERfYxrB9paEF59vrppq67TlyjKhGpss=;
        b=VkSxANUB96iDoq2JPKEqKjvLOMU8MAas7Iuz87j0KU7sjFlXEIfCmx/qei4Ouh+cCf
         AcLupLPsQb6fUVv//G5VgjVdow5msZafM2RQsL7uSlUP0ItgitmIZNNG70gGZNcRVbds
         vNEQSsEOiG8sLbxK11KTGws9jfUNk/ptj02uJIbrYSeOyFMXUE0onxc4agb1Vw/V0JS4
         bAqMypQVdNoB0spT12PVe1sD0K9QAXL5MWrK9agJKyv2KqYnYeUD7X9nJR6Gzxq7z9bp
         b41XdTeQsCmK/ZI1lhkNYXd0w0xv85kr2is5cSCZU5ErlftEyrLTYZMfBXFqX1Tu0MGB
         oTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353847; x=1779958647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FjEMX7Xg61uERfYxrB9paEF59vrppq67TlyjKhGpss=;
        b=IdLkcsbbarAlWfLAOp+jcnMy+ThRwv2r8TuayVRl1WdggwyYOFjZ9iLytZuTX/Rd07
         lmYWCu4CFl8tnBqSw6qXk5gLaly23kfpW7VXwb9vRu8DORtGYxCt0O1yPf2CsKSEyaNq
         7ci+UVtjJYG4rM3hIAGVfQNJT9bmAte/vVUyXBM+590tCytqiLLdbk4aID1/K94JprLN
         NAYyoidu5D9wu/sLxLNVV7EbTH3Td0gX7LruGe3t/4x3FW5YBDKZXBLymGukSMc7Le6o
         YbPXNYo9FEEkYCtFhr6gcaTkJ/heYpGFdGh+RZE9HSpOwzEhLFpHg0jie/0eGHvgb/1/
         BqQg==
X-Forwarded-Encrypted: i=1; AFNElJ/fqVedRoOJSImk5F4DciIKcxAQYH7dWfGEGcfO1YJ1kccIT3Xdj/jtme8PtIXSU05M5zA1hpljZhhBnegg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw3gcLkQDEUPkrzuX23kuIuCXT+VRq4hZV/qkrbgKgs/QQb1sZ
	CEuELZBBMWIJrqMbc3a3uz50HjGjOjkAzsWXOBkaVleL8xElFsWxpP8YpmzcMa7TNZKasC+6XDM
	nA7izyGjS6bzJLeYfJspufwh0Vbb+PgwMn4utLaNLBqX32stlUiHHNxojx0BsvIy+Scml
X-Gm-Gg: Acq92OH/LFjOJYwjNshsKsoGX798VLiVMliWRW2CnbnxdhV6/gE5nHT/Kk4dt7w1xAf
	jGDfc1AAWeCuIvEo0efAASIs2cqQGZ9vRpXDPEPHKkiEoph+lU9B4k7vtFmGjrZ/zTVrgA/jaq+
	a5bzLzgZxj0p1KSny1k4tTd7yjh42O9rYZobHy3Ra7dZppS7WOLyl6+8gnzop8sZetvIpBwGbzK
	8JSZh61MHlOx1vyEajJoI+OccYwBMfWWqcPs/kpLnMSxEA1mLRWJ0419U09rylIIUbqrbz7UV5t
	QhGhSlCyrSHrus6d7pHo3si2QVUztiUkG9HJKMgtett4uSopEs6UZqRiRJK/v64zKHyvcUqz4cD
	ozqnDuogBuQ7/4yqTX62hZWuouYsPP19vKHZZrc7QAbpsvft6OmW+d0FeIudO11Z/Z+GU18Fvuw
	9V96k=
X-Received: by 2002:a05:620a:4456:b0:8ee:e440:fae2 with SMTP id af79cd13be357-914a2cee72dmr157595085a.5.1779353847112;
        Thu, 21 May 2026 01:57:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4456:b0:8ee:e440:fae2 with SMTP id af79cd13be357-914a2cee72dmr157592885a.5.1779353846676;
        Thu, 21 May 2026 01:57:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8e5sm9082419a12.4.2026.05.21.01.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:57:25 -0700 (PDT)
Message-ID: <890213e2-8e9f-42c6-a59d-77ba2049e979@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:57:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sc8280xp-arcata: Switch to uefi
 rtc offset
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, Johan Hovold <johan@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-10-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-10-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NyBTYWx0ZWRfX7GQvENzLjtd6
 96TZtg2x5jO5HFWp+hMQmg9bCQMFVUeDNWIo6aGsmz0o+c1lLWXevz7bmc+tiroWrmkgJbL2GRI
 eIhJoc/0flUtSlH0NWc16XL9cKWPfwKu8YnZMPvBgYlzLCCfJ3rnAA0ZAoGzTDOB+9yQfwSyFMg
 5RBv2pb8yp68VMKAjtbCmVaE7fPErY9eJ7ayaLDb0d5odpq4MHbphq5E1beKW6cz5CipYG4qwBs
 lSof7tBeYmlV1xcj2jwFtArAfUk3btYgwVMwIRCseVLYVfx1+jF8WJ256sIauvhW5lbJUjF7eg/
 3lV48dvIBodsOx6xifREsFCqmGGfKaGR33xkG84EtIayoTW2Y2Tc+wwWLrupb+TNLnJhDWlcG/L
 OSZ6M8qeLLKXtwq6ichrxLlyf8TikA2iP3DZwLFv/MTYA2qQE802CB5gkiUc3K6N9UNDiQXs17n
 s8cYDEiXMY83qbM9ZwA==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0ec8f7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wKcXyNcv_UQp_uj43OvMZhmWr6d_YXo3
X-Proofpoint-ORIG-GUID: wKcXyNcv_UQp_uj43OvMZhmWr6d_YXo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108978-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE76F5A23DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Align with the reference implementation from the ThinkPad X13s:
> 
> Switch to using the Qualcomm specific UEFI variable that is used by the
> UEFI firmware (and Windows) to store the RTC offset.
> 
> Use the new 'qcom,uefi-rtc-info' property to indicate that the offset is
> stored in a UEFI variable so that the OS can determine whether to wait
> for it to become available.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

