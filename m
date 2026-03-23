Return-Path: <linux-arm-msm+bounces-99193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGhtJHcYwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:39:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1941A2F0551
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4C31302D090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399E738C422;
	Mon, 23 Mar 2026 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOESnbjk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwT9kiHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E6138A298
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262175; cv=none; b=lwI6SRJSK+xHtZhmT/spdfWw2LKfuZLmRuSh8R7VQTk2sLMkqhBm1oX/MESHQlW61dcKVAaZfbz7nG+tb6y+2P9ENJS13mnGSi/tbSjyiRdioXaVc0dkmQmUpYjO9a18+rKZDE9jM3wt0obwkL7+HjLyODOSIvpc6gLQPIE0qzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262175; c=relaxed/simple;
	bh=aPdS/oN5R7bXAi3R7oK9DzbqpnEJEHavy9UFo6/M0Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q82uwHe0eebVvwWASbgrkkKm670LkaVK5F1oqePLfDWULVhi8M7n4Um4Pd6HRQ7kabVaLiw0glRovfsr1R3VCtGAW5OPEOYyaN7ON9QHvEKkairJuwPft8MWhcriKdJZGUb31Jrc/qKShlxmjznVVlI3YXn2VhuvOIe/I6iToZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOESnbjk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwT9kiHc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83wf71364358
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cu5CX5RqM8GBq6AyqwTPyZJr8Rph3R9Mh7YCaq+vOA=; b=JOESnbjk7oJnzSRO
	8YWHiZxk0JNLlHkgOwWbuo/CiMQD9TAb8pRuwfIFWbZYrDEqUDHTzk4cTxSfz7tD
	SVqeHCI0hiOihYY7/V4pfl5BhRQKFTi9si0VM5VWXIhlVNnpQiC2LOZfJRfYzzpG
	k/VRBuYtEkzwKZpV9cdf1LXTkM6b5hdFegOU+vVyrNYKOhwU9+v67/qEADSABFiv
	RVkqmHRzqG+mGyxOGc/wqn43g72JcFzapj2y8VDwHMhQZRZ+zPQ7B2DVJ76NYIGM
	1kntJihJu42wFfY4SCtM0Yjrmt3Tlz1hn3NXlr5BEeqxOThIttFdFPlQrMPL0hI5
	2HALTA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78jnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:36:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4bd8e77dso16712771cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262172; x=1774866972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cu5CX5RqM8GBq6AyqwTPyZJr8Rph3R9Mh7YCaq+vOA=;
        b=KwT9kiHc0hEOY0GQ4Bhe6JSMD7L4pWixv5UYC66BuyemTWXeLX8OLlI1tZ4i7NdOh0
         YXug9ueFLamC3jqfHuJ43YXQfX8TEyeoevAzpbqWlibXQrNKL1e0cya+HhLUQLNW5ir7
         DhMCPPNsh3kxaGSt4wOpMScWsqKGDms7BnZCLZbVyft2CvpS653MvllSTCxhGQHwl6kP
         fGm5rHfZtoI0jbiG1ITW6xA4OsZDMKPl8QY07bKeFSKczFVKG9G8MWyi1ey8myr96iXZ
         MDkfs1I4gAdS9wNGLU0qq7EQP0gU4pb/lzjii6vLcX4G8wiUzXciIOPocGn+3CUT0rnr
         ZxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262172; x=1774866972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cu5CX5RqM8GBq6AyqwTPyZJr8Rph3R9Mh7YCaq+vOA=;
        b=GYxJe7s7FWvDOywg6IBzrkI7U/PWK6yINZe9zsWeSqelFixxs2jB/jjF3dK0Kv+aAT
         0afCtXx4PhXFPhYLJ+YSnwXX5I9WW+dAs1RROkcQDaoH+MiI9DGEvLa/Hpfsq2TASS7w
         rif9oRGK8XBorTS5z7pzmfsBk0adm0dvZQQYlOWTdiUTQRwZZIcR1HTKvslXs7cjBWOW
         IUYot1oA9CwHh/n54MdWiqZ9gUwlf0GfL1Qw6C1WD3xoupePuAmYHueuFh/cOXNRh0ta
         7879ySoGcFPjej/Og2ctPwBvZncore4z/cvduxPZL9E4TtuiYEozhhvEhit7lneOCUOa
         KhOw==
X-Gm-Message-State: AOJu0YyeN5jYJ2/lvINiuQqFHijIYQgf6xe5ZMT+VTINhdGSNu4VPVTW
	QMWoAHlPjUI85DNmGN++vEdE9kFe560Wnb56ICR7G7sukSCAoPX9J7Jts1DPAyMewXYR7ttMuhz
	FMvNZqvA5J/5l5ZrReNvsPWOFWQKhGG42Pcz2l8Z3CcLkMpBGZT2QGtYUXAUmmS/yZsFa
X-Gm-Gg: ATEYQzxlou3lfL1wPNgWwEmYyNBI3B/JulrU4C0RQWlq1tc/WSED2NcXOfnwbYHduVo
	Pe+KN+83UWaudcaADhdaAcVbB5tbPAs0wtefgcNf/jxq25GK+/C/7KoHTBxg8pzD/sIF6i+ECb9
	IJgl8Y4pcEhLo9SznVv374D0WuA7bka28+DecvN7pub0BGwkdVbLsDSYUfrYnQ+12/S4SnFLi9Y
	1u8OPVP+3SfhBtL+ZKYRNW0IxMH6Mk+0hRNnO4o4/UvcGq64I6gWDzNlT0OvCdqJfslnbU/0I4u
	cm3S+xh2sx8pmyJF3ia7zTXKkT6YeOxGk/eksqmlFyzjqorCt4z91waSVgut6QAcOZ/PqnYhoVC
	DuaXNFWiFUL9ndEC4kbnduKFsWknTMktNr/y9kDGk1iF73AAi0zahDc5MEHpqmBIn6uAa1fujVE
	QlF7E=
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr141113271cf.3.1774262172370;
        Mon, 23 Mar 2026 03:36:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr141113061cf.3.1774262171972;
        Mon, 23 Mar 2026 03:36:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d238c8basm3555652a12.22.2026.03.23.03.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:36:11 -0700 (PDT)
Message-ID: <5889e10f-87eb-4943-95ca-d75daa16b3f5@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:36:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] interconnect: qcom: msm8974: switch to the main
 icc-rpm driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-7-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-7-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1179c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vYfEZkc75eIydLf1ogMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: xVFuuXKKhvj339BjhneROeSor-NUMPbN
X-Proofpoint-GUID: xVFuuXKKhvj339BjhneROeSor-NUMPbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MiBTYWx0ZWRfX/X00w4IrRrN7
 qKoszCbaIV1J8+SNSswhk6FWh4nZEYDKyxqEnmY1/jUqafGSiXTzilTrrxNS8efbwxl1/eEuPcC
 xLBfMvGbpQwe4lOlnsoW7U1iBzVwusq1dBenz0GL0kswV4uvHw4wedLTJB0gbwI1KsOdC+MmoV0
 nPKPNQ/xXVkDEGkfAeq3V1fvBDnmfY+7ZdQOsOnL8271NpciqIbexMYJdJ4Hg8tmB48wvI6mNUh
 O5bNJyhE4JR3U0SALt8laXlFJfh4e2To3MFm5jDbqLF9U65BwT8vX6S+FevnBpTrT+pEZAJoIQy
 pD9/+43M3dXNxLOF4BLOHdEvHUtOd4wnuJ7UC1rTnXhvQBWUNEiNg2+wJ42FcE0bsswd4UnKdPi
 zMQAMuysepucmzCygL2RV1OInxEwCkflEtKKEwcpFETIbhjD4SZRaqR3X2wTwcGu0aZooh9Zq0C
 AmVmQpC5uJ3J76NT89g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99193-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1941A2F0551
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> In preparation to restoring the ability of MSM8974 driver to work with
> the modern kernels, switch the driver to the main icc-rpm set of helper
> code.
> 
> As platform-specific workarounds, set the get_bw callback (returning 0)
> to prevent initial setup from programming INT_MAX into the RPM (which
> otherwise might hang the platform) and tell RPM programming code to
> ignore -ENXIO errors from the firmware (until the QoS programming is
> sorted out).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

