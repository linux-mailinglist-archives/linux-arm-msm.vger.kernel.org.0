Return-Path: <linux-arm-msm+bounces-100774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ7xIvtcymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:22:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C21835A263
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 416503034311
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0479E26F2B9;
	Mon, 30 Mar 2026 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixee0bFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzNiFg8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA473BD644
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869440; cv=none; b=AdcJni0BmAK3YNW4qwEcP0b2nzJZpaiim8MhJtb8sFYjWKPHN5ZoBM0eUyZFHjhB6GK0bCa/dzRtFevzPQhUOKbnUR6Ll8R/b+uhVsWCQ4Z2PTRo488+mXMMv7qCW8scaRp0wauThfuxYnJSZGJ+X9NiRg9IjJqLmxKUb6IWPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869440; c=relaxed/simple;
	bh=FjhCAi0gVoqRl+3XGuUu7JAJns+HX17EQeKPrKbLZY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M7RVwNnsGZa9ebNPnssBV5Q4sLXX95GumeepEHRPE9CnvW4MsoONjR/3uX57gAbXMVNfrSI9+l4vV8nvLK1bkXRU0O0Ok5ACDLGVWCKpQEZLhLHkEYlFZc2bAjWL6fPa9THzxGlWT9I9BMPqN8r7aKMiPLGp5u0K6eC6mXZtF1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixee0bFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzNiFg8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9nB1E3721921
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Avf6E7vKBaOgWv7q+weQcHkYZrmeV1a7xpl0AHGfDSw=; b=ixee0bFr/DSi9TZb
	F65YIVu9Droblh+dlTx8uw5+DpcxPTMCKZ82Oddj+rBQC1qpkfSEWaFBaKcwSDJn
	uQbCN6g5uB0B9A5ak8vFefhxjHsUkk1j5iQRh+sldv3/2k6JGllBhXy4w/1GSrkX
	WlO/zcwr6CJE202/H8jiTbsP78lGFcTwzXPXXa/zM/wxWEEKGjCAu5EOuI+pYtbr
	knMkorgil2Wlh/GYLDj66U6GXo2OK4HgyE2ntyZTmkyQjWQUgmzu2Ll4iihb4ajd
	oqtbL8ms+Ylu2WBzlJl35VO5qpfwOGqNTZkxYRoMeEIkN5BgSckCHQqq/ukzQOQ9
	Fj9H6A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmra2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:17:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so17882931cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869436; x=1775474236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Avf6E7vKBaOgWv7q+weQcHkYZrmeV1a7xpl0AHGfDSw=;
        b=NzNiFg8Tx5xPV8YEfqCJPyI/KMpWUGVRdztoYB4BED2tKAxToQO63ynxynBAo9i32Y
         vmbpmgjNkGpfpaIGvxeNY4FmBTZ6ngptUa+cmfjBr8lndAEXtCV2NVHZDfP6ykVcyuHf
         Kg76dg1O9/2qMTi3SqaAKXz9ZPHxy1E6WjeWGcFV5GHJ9CJiICT+/td6HXYRfXrbvTjW
         N4h/FaLEsFjkD9e+IP00JdQWEeYYPNQ8BkbREL6rsClwyC9drhM0BKGsLg/pSkp9iJj7
         OfvhaZHFlivsH2lYla63R+lm6XCuN9rZVqhLhXGb1mUThghkovdOn5MshoMbAAB+nqXF
         P1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869436; x=1775474236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avf6E7vKBaOgWv7q+weQcHkYZrmeV1a7xpl0AHGfDSw=;
        b=nnLo8OHeGi/sxGvnc2j4oV2QdRJpp/9FRN+5CICKiGR84plMn47gRV7684440Altsw
         uJsel+Ub9AgdTUVRbjbnvZ4m7u2Kc6i5tKgRbtbBvG/MbZoqAGBJcxqnZZBh3w53Dqug
         nVaQKtWJptPZHXOd8BZIv8qzhBrTmKds+bPuVImEhTPrnQIgl+mgbVVQYZMeSlzX62C0
         7YTa1+I/+mFQiPvhW/UlYdNpa+tmzRRz/oNm/DBfQOIsiyDTGUpx4zoZZAVKerhxfv7B
         oFd3EZ5E30pl70U9IR0ztutWFcH4UZ/O4j9b5LRbQkpiJzUUdaSj5tKhNiGhDpXkz0SJ
         80lw==
X-Forwarded-Encrypted: i=1; AJvYcCW81FMzCPMApGwLrIxGeHlQclv6QZg/H+5lyHXzFSZF3Ept8EcrPyiqRXwuH6vBXt6kIKV7ZFV3UzIZv1Rf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7y4CRdMHbsPG5ePGo+nboEKbiOgnjcI7sAoU0zG0LoaMGQ/H+
	cSQCL4MNgE+wssaLZOUugxldX1syDjXtW15Ap2/+YFG27KsF7tNrjC9Lt4mN7DvJkH6m1GnKjgF
	7yQsi4DVOmg2i4/6vs3LDtCxDtvLohMqM3W+bxZqY4BJiG41W+OC0wgAz+kglW74wgqzd
X-Gm-Gg: ATEYQzxtgQ7SGIPuh1ll4McWCpDYhWaUt7cYUOPv1yRlqnO6nRAnrRnbHI/dyAXUPQP
	Wu8hkXpuIIpD5ziNr/285HatN8LVVpW30D/RBOavnORQGwZiWfR2era8uXnOouaAGSJPh8kFFrd
	Syqj4civgqbEnLbm9zuS5HJa0xwQYZT4MDEumoIiHcSE8yjQa1AK1FVRgn0ohTbuYYFMhHY0c+j
	xy0uRCqZlv26hQBEqC9p7aXYRl/7c5JMvD0CUemUEgPGllzJ6RJ9p671lvHVPfkIj+kq/K+aXR1
	lxRozy9aVdaNoi+vWaFd2sSDvNdDfp7En59QZkQ6POvuzMgKThCLsaVC1tS2wzd3UunaQ1Q9NqX
	a2wkFlG/h3nqAAjPgoV8X9lZOSqc7Nq5/ntvoMkByvYoIYiTtLUyIMN4zIlPF9rAQCLQNLeivi1
	7/DuI=
X-Received: by 2002:ac8:5fd3:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50ba3828617mr125777961cf.3.1774869436100;
        Mon, 30 Mar 2026 04:17:16 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50ba3828617mr125777661cf.3.1774869435552;
        Mon, 30 Mar 2026 04:17:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b2253d4sm283567366b.56.2026.03.30.04.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:17:14 -0700 (PDT)
Message-ID: <ad9bc963-3fc2-491b-85ee-c8926292d598@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:17:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] SDM670 LPASS LPI pin controller support
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260328021036.85945-1-mailingradian@gmail.com>
 <acc5dKPef3v4cvbC@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acc5dKPef3v4cvbC@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oFyWOA2c1gOuj3eXye2vuVAg9zppbjgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OCBTYWx0ZWRfX8bYLQTRbzI3H
 XP4G2yf9+Ri3v29Vq6xy3HzGEgvlv6juAX2bnPs+9gBo8Zxa+hZBvQS1Jc9RO9zkasB0BDq4HYf
 sKHl58d0nxlW4uVU0V6wR86QGyV78DV1o3KfiRwk4RhLgpPVqbSMbsz8gKwz3rN6d8DVmInqLuJ
 0BWqd9+JYGqhQidPy0tyA2bKboNIT/BkZyuimUG8fObbZHX1TlMii/PJ84ZvhQs/NrlhJndx/Uj
 /0Im1Ue1KA5gon+W+RGjHi7cHgAdENJwRd1cXHV0xzWeFTr8N3ac1qyJ72GByLN9f/eqKoilRGb
 zcLIPsn9gUYEvEXEAUc29zh9VRFRCMRSm2vDCQjJguN9AIY57bYXCpo3HiMlDVRJrHUBjM/NPmd
 CFiSgWFYwPM4yuw3+80qVJLZSWy5qVPLMMqALr/XFwG2cPfECuG4kcD66mxcvi3OF5KFhkUJpH+
 7XvX0RwC+Zoacg2PXRw==
X-Proofpoint-ORIG-GUID: oFyWOA2c1gOuj3eXye2vuVAg9zppbjgw
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca5bbc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=3CczqlxHzE0MuJ1b_VAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100774-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C21835A263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/28/26 3:14 AM, Richard Acayan wrote:
> On Fri, Mar 27, 2026 at 10:10:31PM -0400, Richard Acayan wrote:
>> This adds support for the LPASS LPI pin controller on SDM670, which
>> controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
>> not sent yet.
>>
>> Dependencies:
>> - SDM670 Basic SoC thermal zones (devicetree nodes are touching)
>>   https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
>> - Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
>>   https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com
>>
>> Changes since v2 (https://lore.kernel.org/r/20260310012446.32226-1-mailingradian@gmail.com):
>> - add minItems and maxItems (1/5)
>> - add review tags (2-5/5)
> 
> Uh, it seems I dropped them (pun intended).

Please send a v4 with them re-collected (incl. Krzysztof's new tag
on your dt patch)

Konrad

