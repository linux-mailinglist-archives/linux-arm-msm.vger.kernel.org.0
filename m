Return-Path: <linux-arm-msm+bounces-95120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO4sBqHKpmk0TwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:48:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 681121EE84A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 433D232FBC47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD3542982C;
	Tue,  3 Mar 2026 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvsaaNV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvbHfG3B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2833A9CF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537503; cv=none; b=uQHX8a2QVKl9BZywbNqmjwyfU15OkCdCic1w3owhNtf1XE1m3DkyRABSg+gdCyys1nIw8hi7/GQ5sEOJ+q19crwT3pe6GSMHAt1yQoROzaHzaHSkA56PzBxO1zelKX4dyBy2FZJ6g6fR9zG+7z7/mkd722nMXqI7Ze2xGWiKEEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537503; c=relaxed/simple;
	bh=crYuknviy4WZt4lwM1uh4JnMMJVyUHcQI5pren86pIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eqp/ZWSxssMrQ5Kh0xpeBpEV660j1OWjIP9cZl+seMldKQeSbfCpvba0gTpCxH8eX3uW58ab768KjOtW/iS9s9dFrgX+Fs4adIPJv3aliCbfH9RUBbK+TCIM1fd3Z9r1t3k+KMm88dYUythWL7Haqyc7LOYPXUiVKQ5kgaX9g5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvsaaNV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvbHfG3B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mj0P3951819
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 11:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCspUN4yg0mBW2cs+CDIhav3u7fqfrGMD0xfZQLCXOU=; b=HvsaaNV809YcloPc
	/gVJlsOWBMcblTwXm6VtPoXk+l/8YPomA2GM3VyV3teOabdcXQbWKSdeEAcSM4hY
	ZOAe2FtNDeLAFwyYSdIhEaalRTmH1WQajdhw5lZQAUPsQ5OL0bVKVlP6dzUm4Hcy
	n4tmIQ+FvTAr8oRkYOeQwWaGU4MO0UcxSIUNVnifnWF5a7DXi9QdGpgWa4lt7ZAg
	yWm7iSBEPukRiRYILrxB9hscc1ATVmGKXit+WTeDoIxsEwv3dJZPwQeaj83CVhn7
	tvbQNZWCj2V4wmZ1LTl2GJM8Ojnuppm1eLfWtiJHojmJJgLM7yTj7fHuQLt3VRoo
	YuD+3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3n8trs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 11:31:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38346fdbso476718585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 03:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772537498; x=1773142298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCspUN4yg0mBW2cs+CDIhav3u7fqfrGMD0xfZQLCXOU=;
        b=NvbHfG3B3UB81X+eLnmDmeJ/czmfodRg9mHp13PEPpVES0Du/eSJsRZ9oclLpuWV3k
         y4cyp9x6ZtJWS80g8flpRSdcNRppEmgRCAQoepU/9E0dGzbfRvMXjzcGOHIcHnVxGw6f
         amEY1k0AtV0UZdW1kWoTOBJGPwEZrAHJuk2lsWGVPX9+NX2J9+znMRfTsXPtn0j04/pu
         aSjPg9KYugXso6lkj0DZR8qP/xwXmvhSBqYQkzIibkPNxrqO6y1Q3WR5kmJMdQj4bjWu
         0Bs054lm2OzNpWyp6mZxpc7tHxx5i/YZ6+++5n+xVaUKq6KwRJF1pesKNV+SgE9Lduo2
         XhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772537498; x=1773142298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCspUN4yg0mBW2cs+CDIhav3u7fqfrGMD0xfZQLCXOU=;
        b=fBpQZJv8+TzKyXbqx7dxxydCcJjIk1xnCEhVcc6WLm3e4E+gAj1Eyau1hoX1qqBuPx
         eugOYPswM1kAFnVIrVgdR1YLbhf4G43EdvYYOFxpmpSYaUQNybXIkCrpPhBEsskwDGbs
         QYgr3SmHWmRzFgg/ffLWzevrGE6laBPLayq0saI3h4/vKPDceOQGJnOl0SQpu9m92yEe
         v0PSoinUiJdg012KkI2Hg1KQaknu+I5ABvXhccUg6D1PRVp5AeRoW1afH/aq5yQVHId3
         40rNj3Arbldohc6t+AMN/nW6XNn10lBWBcCgQNudfu704L+iCy/9pUjEvsZkVds14Mkk
         VI3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1X40WE8cNrXAxNvoK9AL9UMKPrt60ORogQzfi6Ain+b7qhy1nvMYlPIGDEoZ0b7pVCAFcM2BGbWHqvpna@vger.kernel.org
X-Gm-Message-State: AOJu0YwM69UHhxsW+Mfj2wfklMe+CvBhZZA11tGlR8gYZZzSupH4+v9/
	2qrT1cXAhG7g/zK8X9MP9zo4zy/XUuitNX7aETL3ugnNEmqZ7/Nt+rjBTdSYNENT5F2oA/eMssl
	pvt+sI4Bq8GvKly4NOeYApw9c0iehKZuPutXeA9EKYoPWOnHSnjdsJ/m0I+HfnvF/6T/A
X-Gm-Gg: ATEYQzzF6AZj2ANTN3DxfZL5cLhvm2pGepm0H4BvTH6a99CAT38Osp64cJJkBtndcV2
	6CsYELiRBGHeLrGci6e7BifqC/XF5v8YuikQuvZd1zcgdBaABHkzS9cwma5fxZCyvvJHGJl7lA3
	YpZB00+ViVVq1OMt1nBAmor6bG23qOY/9TqxULEmcqhvEXhZPkxKOe447B4vyr8H8tkFYG8rCED
	ab15onHKvE1w5RVuoFTXLnR5zONUeasj2s3ka7MDQBQNICj+OS8TilApsOnYUOayaeO4rl7fR/v
	XHsSpczgUrSBOvfJTadyY+U2HO5OBOCUNsAdjxEOGJEnF1RLU7ML6oL5m6FsrUYDoOZ3VGcd0zT
	vD+zljCubcvsup4/HyWOrazKLXfPcOeNmAIpixQ/VI6UhZSFoNkXydpFzq7erZIcCrNCoPAT/2K
	lP2HU=
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1560294285a.7.1772537498037;
        Tue, 03 Mar 2026 03:31:38 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1560290885a.7.1772537497512;
        Tue, 03 Mar 2026 03:31:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae61474sm582362166b.44.2026.03.03.03.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:31:37 -0800 (PST)
Message-ID: <6ab7b752-f906-4897-9aa9-12af636a9ee3@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 12:31:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Move pipe_clk on/off to common
To: Val Packett <val@packett.cool>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260228220634.22778-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228220634.22778-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a6c69a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WxJYI2yInr4zNcYYujUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: W_WXXY7YYQZq6YTKErAOZcdsg-A-_ccf
X-Proofpoint-GUID: W_WXXY7YYQZq6YTKErAOZcdsg-A-_ccf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4OSBTYWx0ZWRfX2lDUNDhD7vqp
 S9XZIx62scLex+Dcw1Xjd2ZBNnoqxURlXfNnudd/COwFp0hPXuQzkc5vT6N+7O+8Ca5nAknhjU8
 bsjycOZe/sdRI6rpOTkI07gWkGhWahDsw8UK3Qab9+syhyf0PIux9VbO1vGW9+gzf963Z1qE6RM
 963XC2I7eRgsNgZ6Fg3xuKGEDtv9t9dE3L32yvh32I9pYoxVJ6DCn2juP3rhrLvcRXJamTL8Iqa
 91vb2fjHP6CEP+zJGnakqpdvUwiAZgnHa+NYj3o/gaCQKVY15Lo/WRfXvrF53xJL0vfREtvjj7h
 dPnJBIpSX2O8QjTEuc73HUJw/nIz5oSTozSiPutsBhuWB6Oh9HQpgwFAf6O3z6MzWYgiuAXbUfp
 5CHEbpyB+2XZgpMNjGJMbBf//1qs/PlPGPvzZRVVPJLzp7bqUTWHA8hRpKVe1Rjmr2PWcwI0Siy
 JImLf4VVCbxjqCkn87Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030089
X-Rspamd-Queue-Id: 681121EE84A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,packett.cool:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95120-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/28/26 11:05 PM, Val Packett wrote:
> Keep the USB pipe clock working when the phy is in DP-only mode, because
> the dwc controller still needs it for USB 2.0 over the same Type-C port.
> 
> Tested with the BenQ RD280UA monitor which has a downstream-facing port
> for data passthrough that's manually switchable between USB 2 and 3,
> corresponding to 4-lane and 2-lane DP respectively.
> 
> Note: the suspend/resume callbacks were already gating the enable/disable
> of this clock only on init_count and not usb_init_count!
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> See https://lore.kernel.org/all/389ca5d3-a698-4dac-911c-39ba057e3d17@oss.qualcomm.com/ for more info.
> BTW https://lore.kernel.org/all/20260205160240.748371-2-loic.poulain@oss.qualcomm.com/ helped with coldplug.

I think that's a fluke, you shouldn't see any real-world impact from
that patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

