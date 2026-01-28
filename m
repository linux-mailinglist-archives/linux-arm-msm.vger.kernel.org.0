Return-Path: <linux-arm-msm+bounces-91024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNmmNWkKemk82AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:08:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DBFA1D6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14558306FFD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F17A350D67;
	Wed, 28 Jan 2026 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poH3XJ2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2UShES/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A432F770
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605513; cv=none; b=K8bVvtQJyoosmwSgZqhm5XrQQ3G6qfDDOHR2MRVdJwE4a2/2wo4Fn4sB5fYSma5LLwVhDuBU8A1ZHDkR8yFjmnbFzWxZogHSIflaTZrLrHM+AFpcUEMjrzdCFZdFnCXH6jsXEyg5RjXavQrFxmFTma/n42J4ztn9cYHT5erATDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605513; c=relaxed/simple;
	bh=IfUVJCWZJtR0OPWS3Rfqb+4Gc48O43zL1jeJrkqacOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqIX3V+jr/KdOsUBhLstbRgkiUZuyMAItraCp/DCb298UBQGYqwH17LTFquq5BJY8mumPdLfggueZg7v/2bmJZk5s7mu6unchGnR1gFzKF2pfseC7DiAZVh0BHgAhf7WsZ3amYrOIqzM3vtKdQdE12oQjomhM0StyKvTkMwUlXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poH3XJ2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2UShES/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92cib041997
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g7+4dvO7yoB7tlTrFHNDQLfZsfKMQXFFnZNIMEfs6p4=; b=poH3XJ2AUTSQxC5y
	dj4v4XY8EPqKnLvWi8jk3Hbg9EYiiUGWiLCRYl69MaecN1Mv17bChdNoI+8RTO6i
	k2yeLNXjDMDgOMGUhZFNVXWQLLZRRbTw7jwUJ86NHQb5LSxtoYcbTeELlYZ4Izit
	SFzIh7BtoHDqe+Bt2jPsTZeFqeQAZoauUmvIs6Mh3c9YOungIIrgWOMDwqj0mR4P
	tdmE7Y0f/4PHQVinMaqV/oG9a90eQ9hf4hk/FDbjcz7v5kb+8igD7xt6su0Fii9a
	RgOexKYz3q56MY2ecCZ8dY1aV/uW0C8fBT4iPHwUIOsieR9qRgC7/vJQdVWQqaOw
	5pGtIw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355u51b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:05:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a13be531b2so68642285ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 05:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769605511; x=1770210311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7+4dvO7yoB7tlTrFHNDQLfZsfKMQXFFnZNIMEfs6p4=;
        b=Z2UShES/9hjMOexzlqz+U+g/AHlRjWOMYt0bKHkCp1HzS/Plwir8OWveiwV/jiF7lk
         VPEf/o0hsSiwnwTh422gbOxhkozs6L8DC5y/fhkYXj2KtNy397iWRln+I3zj4yAOoae1
         Py39bjheXU6dT7IqKF5P/cenHUPyrtSAFyQSztZ9Jq7rMZRfdB74GAa1DS+3AxjmGnNC
         XVF4OnTEuSeWBic3peV7DlilOGuhHL2jy4gsPc3+R3IZbjvyZUs5+KWW2VqOz4Qh6rg3
         EOMheLRQ+Q0iXLusK/mTJ/RwGeyanbXZXrlzqodw77wxftPCR/gEhk6gULz9QiRNtU3R
         olKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605511; x=1770210311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7+4dvO7yoB7tlTrFHNDQLfZsfKMQXFFnZNIMEfs6p4=;
        b=LgT2sm6FZcmnAthRFor+cx9/JnJlO4BkRHCAnQmGZB6fJBN7m4BiHBBSR42dNTLY2t
         uWJeQmo0k0pWcdsrrLBW0VfOlyE2L8jhOa1Oc0byr/1FRPZMxhyCeQq4AlLpUaGl3oNk
         9mJ9pKmvJ2Tq377X+OJeVwFrMZUU0RgWcXrauLLlGqPhUTF7UPAI3QXLnVc7/5KjEz+2
         m90EDkaR8mzr34igQQZbkFwIs1EGdc+Ymt2XXhkB4H0XUpPWc+iFreiZr/7C/1qjlb1L
         CV/QnaUT1l+AZP14LyzcUAhkzxnqw+xKsKQ5fb/gyp+7Xrw+ec1JXREQQNdw5NUYxpG6
         eHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCURtRGxtFu1vsG6mt4NU2Dj+Z659RRdydalogDSk6xtrl9rn5tyuOTOCycz+jjVdTVehTjFjVW6rfrgCHfl@vger.kernel.org
X-Gm-Message-State: AOJu0YwV0tkQaHT77RJhTc1G7VuOoXKbEJQqJ0EapGz3CJdH+LudSkYG
	qEIky+qIV+K8jQYKUMRTwZLFFz8A6fCKqTB913vk+WH/c62lQLaE8qNl3ngzpbx3ab5kteq52Ml
	YhsfFYYM+fLZUPipTBjSucMSZnbOPRqFXxOZMrGcKXA9qhiaSu/+NYEj7eXMd41WfVXQ5
X-Gm-Gg: AZuq6aJCbCBSZqdd5icNIQCihloXHFL7ryntznDg2hnnM5v3mmrOt3XJ3TGEkxmhhIW
	qCRl9K9yREOfcQ43M7lv6zoOuZIpRnTab4sfQOC0aAMnks7MCg10jaxwI42lOGDMrjMghdMrKoN
	dUW3iHweAWXjDduKlLQHmIhN3z9DNmXLuvrXYXNsSDV+PfafF4MoWHGOqq+n5TWfQrGezlHH53J
	zI+I9T+vWWj0W0aif5Isl4sbT5bsgrep1NFn9zV/BuA2pHiT1Ra1NQQ7FKgEeasFpJfiI9Mf8YL
	qisChhXIHUXR+cA4YDstodqbqbLw2lEVLK9tdTQsiIf5g40yYWCHXZeZF0wFPGBM/86bHWKs3rD
	6wgcqHX++oW0Lsvf4Wivdd6F7eTndI59Lkpj7/wPfF8A=
X-Received: by 2002:a17:902:ec8a:b0:295:8a2a:9595 with SMTP id d9443c01a7336-2a870de207bmr48703745ad.39.1769605510594;
        Wed, 28 Jan 2026 05:05:10 -0800 (PST)
X-Received: by 2002:a17:902:ec8a:b0:295:8a2a:9595 with SMTP id d9443c01a7336-2a870de207bmr48703465ad.39.1769605510118;
        Wed, 28 Jan 2026 05:05:10 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eecedsm23189435ad.15.2026.01.28.05.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:05:09 -0800 (PST)
Message-ID: <22583dde-caaa-4d64-bcb6-ac7f09916a8d@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 18:35:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=697a0987 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=4hJEjaH6g9CgPEswoao2AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ml86teEJwu2bBuIv-asA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ogKJIGRhulJqEXgbgyc9wKnEgVptyMzl
X-Proofpoint-GUID: ogKJIGRhulJqEXgbgyc9wKnEgVptyMzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwNyBTYWx0ZWRfX0w/LKEgYrOP4
 xamawbhkakYvLXdxzeX9QncOjMNue6v4meckJEIUHq7F6JM7lJWmjnrG5YjTflezJjazHXpFWJZ
 oz8+0HSQiY2LPsS8TW8EedIMmJMEdt369rxoarJssiTkMbXMfL0t+CMYslZcad+Uy2yKlRzMx+e
 YHQ3BokeBnV3AIsnncaN4VapB9RolbjiMi3zRVZ4IF9SRDtHBbHXWjyGJLEgSoiQaF6VfBcmNWE
 RUFOvvoEwyWN+dF88mjPlxYMO+h8e+EI7iKUd1ZGCCrhvwHe1+WepGfGEvtjSXlKH44yGUbR9Os
 GYRyLU5SvjU2Iw7tt1JVknZTICTSo2klY2HOyFQNSR78eOkw3GnUYWH7NZaxgGrsRJm1fSIlWB+
 YSfUUVrKH3C3Ysy4Cx3tZbZwFE0+Ee2T3Gh9DdZyXgDymFHKnQPwGzvSZlvgMR0LyKnkwFCjua3
 wx3oFbN9loD8FjWwGrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-91024-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85DBFA1D6D
X-Rspamd-Action: no action


On 1/27/2026 5:52 PM, Dmitry Baryshkov wrote:
> As the Venus and Iris drivers are close to the "feature parity" for the
> common platforms (SC7280, SM8250), in order to get more attention to
> squashing bugs from the Iris driver, flip the switch and default to the
> Iris driver if both are enabled. The Iris driver has several
> regressions, but hopefully they can be fixed through the development
> cycle by the respective team. Also it is better to fail the test than
> crash the device (which Venus driver does a lot).
> 
> Note: then intention is to land this in 6.21, which might let us to
> drop those platforms from the Venus driver in 6.22+.
> 
> Testing methodology: fluster test-suite, single-threaded mode, SM8250
> device (RB5).

Could you run fluster on SC7280 as well ? Also please share the v4l2 
compliance results.

Regards,
Vikash

