Return-Path: <linux-arm-msm+bounces-91414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEBKMpdGgGkE5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:39:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20452C8DFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4C623011120
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEAB302742;
	Mon,  2 Feb 2026 06:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6qoVYRg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlgabbDV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD842F6582
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013842; cv=none; b=UhDXdYpFwRz3a7HS5oOxvkSyg1vuhurEKoKXT6LS2sW+Wd94i08c0vB69po3W59CAMIlwJ/P1n/MkrpVyWJQCRiS2K+s7Harm11mc8c8xaQNtTgUsuIsOl3h8DpqBUmxU2/LVmOC8MSAAen0/MQrbcUjMALzrj0m62qgsxGKN8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013842; c=relaxed/simple;
	bh=a0QfRDYdqoZW1cCRKs/5tdMZEf909uEpljaG65C/KuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4yXukZXYPzJPiB4mie8TVIDJcWeUi6Jxo9PEFDkG0qYOY0Ww/UH2KBHZ0k34hsSHI8rubSSLky1PALvVW637fmL9vvRIj6XmOSVQXI0phs+DzogPqLUPhHtB8QMs5MjIG912R42ViGtUKzVn/EiHcP9o1saOCWSJXo1gfB+T8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6qoVYRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlgabbDV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611H9X5V809475
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7uurbaHlCXRf2rgol8G4wd6M5ObAVafkPY/8udIrrk=; b=O6qoVYRgPq1Pbddr
	eLNEMEeZs6ku2hG7L7wGJNagyqgZhe72HyMRlz5t8fqt03U+03qINtwN5nM4hgJS
	+c0FFSn9JTJqejdiDC39Br1ILRPt08CoBxHXlvG8mK8RCc5zyPTcixhyqskDIYqW
	xdXZZwJBHtVPdG6jtTib4DJbYqd0peN4lgtMPUcR7Ex1zByxi9P8PQ6ArCuqv1Or
	DRsAMAhYpXQquqjYxN83P9ikitNJ+Wf3YcPqqmuXD9U6JZAt2uMM8ppTwkaWCkPW
	fPblMauT6lgP8yh9KWWfltmU+iZBLds7PhiF6u9KwD8EWPIp5+dU1YCYjIl0DmmI
	7Y8pEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2m7gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:30:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a377e15716so112147755ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770013840; x=1770618640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7uurbaHlCXRf2rgol8G4wd6M5ObAVafkPY/8udIrrk=;
        b=RlgabbDV7zCIQrd71RPCsy8LwmxWqP2VgiqCZ5q3x2OnDwjGBR3KQmbK+SOEanFhyp
         7fKY7qfuSIjx2xnrTWtcKoDsTdeJcaTHzWTbtMa2doDKVTrUIKfHTuf3gUh2O1dHxNte
         Ebo2cNYujVLF3b/cKYfCNCWJgsylUP1ploRxoaujAC2jAxcuY1plt4YjgE9BAVJ0QfNA
         JZbkGR6Gp1RQ1DvZx7z5SiMLKOOVxk1EXDZYz3tTKjkCPPxh+ZHy3ogoPxj58vugiiwD
         MW/fNTaX8HLRHzaGqqhupULZcCdhbjxkDmVJQrfEJgfMZa9H+IE4lusd+pTjh2pLxt3p
         XERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013840; x=1770618640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7uurbaHlCXRf2rgol8G4wd6M5ObAVafkPY/8udIrrk=;
        b=Ee7z6itnJ8Wd7aVfmwong42lSzqf1yJiqjY+Lo9s0CMR6Iprym/x3hDu2INaD1/FB4
         rvMX15dUs2kItC+3yTRS70VfQqIDqW/M0dUWSa6lcRtpTfJc8EVWq2WwWAisuDv6udl1
         LoR+5TdXO+LEyIQxWhhRXgJ9lAJgEZWNMLETQguMLeKVsp+hTv/kXmFsVaWWjSlM+y9k
         a7zxH2rxKTfdevGLwxSZJCvni2kOQs3Wk8lxmu/0B+AKL475ZtfU5VQCz8QFxInlcG+c
         V7X9HCYdVWCsN7NJxn1gkcvBbj78TJrKNJNpA19VfGFQtvFl8gKSR01GNYzeZbllihMB
         horA==
X-Forwarded-Encrypted: i=1; AJvYcCXjgVnTJjEpDq2iaT1j3xKfVhdsTp9D1Zz4KiQMblOjnUxUh3TB/ePoSSOYCLA+ZKzCIwtGbGNwAe2Pjyhj@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUhr0kHiZVP774RkI9ji2z/pMimswkK+bgarUwUEmRj1sA3l7
	BlYa2QJ7D8Te3YfjWNEx6pXrpgtatEMx+OL96FQs7iPHWBlHb3fIu/ZB9uTr7HQt+13nU74mPJQ
	B5vVKxDBoINPIeQGMtz63fQJkQ/LsJdjnkQWQE19r5Ai7PXiLhrldoRBoGfbAUtdnCRu8
X-Gm-Gg: AZuq6aLmZV1B5pY6+5wTgr7B1RoKVp/ms//lLzLkMIchvA4zIhlBSyVkqaWrEwou1kD
	wQkrOhKGclNhbznCWz/6i8ic6+HGFMvo3dV8pKcJIuYXKTBhkjNlPLfhOfBqrMxg3yItQKdXAg9
	3FraS8ilu7dxN6tuwvQJ3ctICC3/NaO592a62U777DMBdjRS8U8y2UoHNZ+fgK3QnN+iNZ9iiwy
	xkCpS9e6UEHmqy5mhublHBF9+IQ/O5833jsSKrT3llzy1Xz9BZFN3G7i/KDDRFw1c7DhL8H7HPt
	akx5KvG/niSwrZE2NL5tClKH0W7QCvKk3yMM7tvtZu00E1w86X/M/R54gCttiAyydN/fIDruLT2
	/C3HX6hkA0AuBG/BdEMWeSdLF5gkll8x3GeoaCDDvPQ==
X-Received: by 2002:a17:903:f8d:b0:2a3:1b33:ae11 with SMTP id d9443c01a7336-2a8d9949210mr115215985ad.53.1770013839697;
        Sun, 01 Feb 2026 22:30:39 -0800 (PST)
X-Received: by 2002:a17:903:f8d:b0:2a3:1b33:ae11 with SMTP id d9443c01a7336-2a8d9949210mr115214705ad.53.1770013838090;
        Sun, 01 Feb 2026 22:30:38 -0800 (PST)
Received: from [10.204.100.98] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d2bsm143075415ad.53.2026.02.01.22.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:30:36 -0800 (PST)
Message-ID: <f8179247-80ed-4bf0-85d8-53441f0d9311@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 12:00:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] media: qcom: flip the switch between Venus and
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YHVYqdKGgVv3MnvH3BayYs8cceSvFFUK
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=69804490 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DgmlmlulvBJC0Q8_JD4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: YHVYqdKGgVv3MnvH3BayYs8cceSvFFUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NSBTYWx0ZWRfX7Pi+O6kxjnub
 WbOs1Dc2y28iYLsHu91SHYpgAVg2nwZysIY0sZB55nhWFUL2hNH3J6glOWl25AFmJFC1IZS7YdN
 XIitvWu5PosdgupZxdkFp9rBX6XpMTCSzpwNQhns8k6gKEf0olJARL5/6NQnx7MI0R7x5v2DAod
 fCn1XNceEGK0NpUSFUTevY5TvTlYNITwQ4O8mtmoCZARXgbc/AXOP1iyr8nl2aN74aE91LkV3qU
 ShIB6lwYaqEZOU8ZJZKS3V8kmmxoiqjyjU8i7eGWbJjWyB5lpC5BIDI1DlgihHf6/XLGkk8DdZ8
 Wp7C3VONlswhSb+RlwkN1o3SEiSRUiq4KOIr4OqpI0FaCHgJl3U+ZLmPuQcNOI0fTp8N5/5GmkS
 jNmcef8V105KKTSIWkFsSS3lxqAkS6+k1NDz7C3j++a10HueOd4ZxrUEWdmymn0P5jYKj79CHdB
 RN2zJcCNLaPZRmWtJrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91414-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20452C8DFC
X-Rspamd-Action: no action


On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
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

Fluster results for SC7280 is regressing, which we were discussing in 
earlier version of this series, need to be fixed. All tests were failing 
but one for h265 decode.

Regards,
Vikash


