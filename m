Return-Path: <linux-arm-msm+bounces-117201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7yKaLzq8TGq5owEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:43:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC89719457
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:43:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Su6uGUkR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c6eYRWrO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117201-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117201-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AB3D30488F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F971330675;
	Tue,  7 Jul 2026 08:41:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A32325494
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:41:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413681; cv=none; b=CV6uh7l+WPWvgxok5xdJvw7sVqCUZf2rgUW6WujE8xYuKAQtge3wcQLo0DRlb903p/Z/k+G5Ye6ZAiDdH1nmvUAii4hp3LfK0hPYoLUE1J9+jAGEwDon9BautQN5utOnxp3u4FclWPyLx+5N+lhYAVBrt+GxmbfegxePOhKT63E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413681; c=relaxed/simple;
	bh=Cs4b2wW5iHtR+kmFHtK2w0lnkwrBwTQEiyr6wq4vrrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpVJ9KWAgbTGlCmFfSfrPKAf0VZfVbFQa0UYcm/ptHq/WlhgrgTPYyPy8aud68st9PRMjS+oLpMoSc9/XVqiO9uE65ZIWq3uht9fNPSkhA++c0sLF1exJ/4p/Nw5Gq0ZXk57Jgbq8GlEiRvAX0fIbyyCcMPJ4W2GJXy83zEjtkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Su6uGUkR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6eYRWrO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EC4T3231430
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6KUhfg+iGn7S5vp/sqQvH9RMm0w2rnK+coF8csypQ0=; b=Su6uGUkROEs+Gl1Z
	vtVr2LLrHo42XNui5cxEi2VjFru0lTF6FaMYVrYoPEMH6xZc8N1B1lt+bQIwonBq
	Buaq4miKFPrjS8sXSHGS8o5cZ9TI1a95kHsQn1wIp2k27PDoMmKdeb9pOszqOkL5
	CmFxtVjETwFtXa7bRJP5HmJloaneS48LBKmHPgZCggJW4636WVck30VhGvSUlu4H
	J5uyJsPXzJHg9XsHQiAzBVCSjXgyEeRlWcAQeE5aTRpCvoPpcOFoxxBr+9T4nB8l
	o/qZE7e6Y4t+/muehZhQsniJe338F0d3lp+S7aaS0h31Fxs99T2h7fBjqeouQTn4
	61aldQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79h2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:41:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ead919557cso13851176d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413678; x=1784018478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6KUhfg+iGn7S5vp/sqQvH9RMm0w2rnK+coF8csypQ0=;
        b=c6eYRWrOLdLHf5MJ4nkTgfUTtCGXypCl4eGw8sb1uaKiKXrTvlvAMleqQvjvEXhxr5
         oObQ56Frn8Gs3tveVVj+wewkm9eKvZCugguGjGoFF/dT0TW8VBvxQ4gD3/thQKVDXHoN
         /2rDiFdfuFP7N5wsAFjzasaEtwXR13daYBGHuuTIFMNI+39LxKdMHSQMfyNV50BCBdQG
         3e8vnKj9pKC4Fj7GlHIfIXeOHZL/rsua867R/2mKiBR5MYH2kjgchJM9T4CIdsm1wvap
         A6B1sswCsudjhEWD1ot9Twcyi3UzDpBU/9txJYveifycAQohYoGRfLunuhaz61CTX3xa
         f+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413678; x=1784018478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6KUhfg+iGn7S5vp/sqQvH9RMm0w2rnK+coF8csypQ0=;
        b=sbPSlS4FNC6FudcBH3Dt+TXfvpMMxCdJ535VTSHStpJzWEUtZ1MNNwGn5ynxTN4iw3
         8bBjPxelU9n1bdiZCC+wn1uocPyzixeg/a3vz6poYszElok/WrOmRIUoXKkIT09mmtpY
         hDS4qoQwQjkksOQ7tKTHfL968W3pRJl1dWEWtrh1/CG2xqQTBxIsTkATpxXrTr3yiQX0
         avmqnFkVM1GCirXrssfBZie3MKC+igtDJIZXiI8AvO9uv91DkWTkcxl4oHENIIx73LGi
         iPq6R04g1ztNwkQMjMdDzatmcUQaSwPONAn8DV1B0LD/ggHsO86DvCA+QMBSj02qJtsP
         UAiA==
X-Gm-Message-State: AOJu0YxrOD7p610S/iqDynokmm5p+ufNnvSQq+vzaF80NfT5ytMcCuM9
	4kGt2RLhhYKCETETKcvAsbt6JIJvmec5r9gQ/qQVRsATqgOHLypcepxurXS8YERimVVMwYbOwKe
	jwUi88V5UN4/sxlKjgF1uBnI6Hn/kOJAn9IeqH5sIqONSp0YF5FMmpHC2jo08luVVwR3u
X-Gm-Gg: AfdE7cnC90Aj88eFGe//d+/iPGfYPEyvg1bYw7rGGHlYrOdCimPUEFn9iQLBcQdwRGT
	Y3AVssTaipSClrUCjxL2y3ifiKPogYtR5RGhEOBsqhFRORaSGeVCszKoVBHxVdE9zFHAa1Lupvi
	tQO1W57QDVHAgaEexaWr9VXtg9ZeIrKyJRZvrmBCu3GJ1oN1KbartHFqzJrQaCX98OIGeU/m8d2
	VYvHE91OO4c7+KnP9C5H/439DH187Df8JEXuabVidHJlcPv27ENDw8ZP50IsVItt18b4F/JbyJb
	oBquqXf778EJQE90EiaTQlODWN7LdIOhnnVtIH8aEO2jttNX+L4plja6xnQCkYmUMGO6fQGkPEh
	Sp5Nis1vx81OMdaGvbYjCoOYiMiXBc9FPLi4=
X-Received: by 2002:a05:6214:e69:b0:8f0:2afd:378c with SMTP id 6a1803df08f44-8f74988336amr123239926d6.3.1783413677497;
        Tue, 07 Jul 2026 01:41:17 -0700 (PDT)
X-Received: by 2002:a05:6214:e69:b0:8f0:2afd:378c with SMTP id 6a1803df08f44-8f74988336amr123239666d6.3.1783413676980;
        Tue, 07 Jul 2026 01:41:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cf68f5sm5617603a12.13.2026.07.07.01.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:41:16 -0700 (PDT)
Message-ID: <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2N0ejVrvmIM-rbRIdkEMY936WimG76iR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX9u12o/aEyd3B
 gMjONY4tBedO6EJQ2mMXjA/ARN9iVLwNTtIqma+keimC8QOXLuroluM2mooB5rV2JzjlwNymOJ6
 JhIyd7iKRhCCFUIZkvJfPVSVmqgfsim0WrfCzfe/n25cLWsFaJbdsaDviZNcuGmInjOAusSXkOc
 YFV8vBgIF3Ys39arNHzLGU8N/PK58WEKzZAiiAVxRBOwF4El6iw7tYEESHjMY9M3exCgivC2OiF
 SPqIV14AUOsuuuyvhCXfwXI+XboBuLe67AFVtiBzFsjN+xziDm/UCwmOepqhkxB5EbeOrLboUR8
 gasowQMNhmDLUeX7JOk/5+j8hxP7jDDfEhRdyZE6zYk2ug14k4DsU+2v9t6+eb97MSxrqPE3mFq
 jn3xWyCsqxI/MIMJJ8loSUtxOcRgJWBtIMuUp0A3G6b9vhs7yPVyGDPHs//ytSUawmGcxFmsBw3
 bC9fDipop+Swi8E+KbA==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cbbae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dqspCxh0aqX29DDAmfEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX/jFja0ba6n6J
 GdBER7l1JgiUupfqHLI6x7bnTz9ER2AjNG+frf7bvF7bfQJLjGhwME/81lKYUMyBnAo+QF6MbKy
 xNDm6yS9bMNe7lni5yMu52ydI94sqCk=
X-Proofpoint-GUID: 2N0ejVrvmIM-rbRIdkEMY936WimG76iR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117201-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ravi.hothi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AC89719457

On 7/1/26 7:43 PM, Ravi Hothi wrote:
> Enable the sound card on the Eliza CQS EVK platform, including the
> WSA8845 external speaker path and DMIC microphone capture via VA macro.
>
> Enable the required LPASS WSA macro, VA macro and SoundWire controller
> along with the necessary pinctrl configurations for DMIC and WSA
> SoundWire interfaces.
>
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

[...]

> +&lpass_vamacro {
> +	status = "okay";

'status' should be the last property (let's also keep an \n before
it) - file-wide

[...]

> +&pm7550_gpios {
> +	dmic-eldo-en-hog {
> +		gpio-hog;
> +		gpios = <7 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "dmic-eldo-en";
> +	};

Why add a hog if you defined the regulator already?

Konrad


