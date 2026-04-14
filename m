Return-Path: <linux-arm-msm+bounces-103149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MK8In9S3mlIqQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:43:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47D3FB6FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71AD0300A67B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3973E7152;
	Tue, 14 Apr 2026 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifvB9RoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfUidlRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513C82BF002
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776177785; cv=none; b=MhuXijMf4TQAcB4Gqy3lloRwALQ4p9uDRQFc4HTiej5woNEdVMSu8PQSfm8VDskukOtyzwsFSstJbrnoBS21RQdxRzl3s5mMPYItW3AWkVktN1aSzXodrIYD3QQA5Tkjl8lw8uxcIuXECRyXL2Lv9qQCZgWbuW7TYOXGtHxca/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776177785; c=relaxed/simple;
	bh=LNjvW+h2jdKLluyul8fqI8lMeQFzuK655oXnqkx4wcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBnYINz6YyyJ6NAXSn59NQ6qIYLNGTllbXEXvEtwrnjOps5qALnJsKpYr6yccnMgwiZhSv6IaSDt1HlLsajF42IG5n2VuAVe8JLSRUoruoRd8MV/ljswOaSFr5mt+d8s1AOWzgi6cBUxMTwRGiC+9n3w6ez6vv0Z9fPDF625rl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifvB9RoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfUidlRk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBC2Qq2633626
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPVV3v4VLtmByB3vAduvUEcC5XOVjKu7FaDLbHcwqQ4=; b=ifvB9RoRSHnIMU2I
	rK5FhIddHMU8buBnI91l/ls9FQjwVZvt0op5f2EGCvjkB2AHX6khDJimGZYHcCk4
	GyaV3fKHa5awMMj0Hqk67g3rjA4D5IugE6jDfBOTPqBJqcAeFLeM8jbjMdEf4dzz
	/A6/HMKtmU+WoJjhuJsyv6zP0QW7hA0iLEu8CL7iKuChZjy80zgdICMYhppDi/Z+
	RBNanF8gczNpB6C2GJS8uiGfmBxid64eIIfQ7CoCRq4vrMlSzsG+aH+ThRQ/aYUu
	xuMFEIKEr1a5049FGkyUdlGoiZ4aXiFZEehgx3YJBz6qJ985iW5gvoWCgOz7Qe87
	Umkh4w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86cb4kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:43:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca2eeac85so11286756d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776177782; x=1776782582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPVV3v4VLtmByB3vAduvUEcC5XOVjKu7FaDLbHcwqQ4=;
        b=CfUidlRk2M5tYJxRbRZxJV743YXNV6hsJ5+STNlKRwC+ePr/4e+iO6Xfj79WR+ChUv
         yTeT45gKLmQQW7jDinNKxO7poW0ce4N2UMHDqzRFLiNBGIVYbLWjOh3kLO1u8uaz/5ti
         cml3qnSdb3b296yT8/Tze8KMw7cQg26UVn0Qd1Ggh7mhRNI6vB69Umgc3Cz/3/DOO6Ru
         bl7+t1T31qnLAilSjFlo7RuiMPC8aH/7/8fIDly74HhA1xRvsxGz5w0fZBAhGnEnOL5v
         b/AY5mZ4EcByYBvIa0Iug9EpyEziyJPhHSAyC3dxC+Bl3HRkDXs8GU24/01FL0kfWjLw
         vxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776177782; x=1776782582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPVV3v4VLtmByB3vAduvUEcC5XOVjKu7FaDLbHcwqQ4=;
        b=E/K7V8TFqNxj4tJgdq2gfsWIXF9xgQSdzwC/yJXl2GpFH8NvunuYILbMeZJ74vfysk
         AhBDQuS41BUT0XIdm2qt1zzeqgBTGy5ohE87QTRLdeefpqP9Wlxeup6opeelqoq/GvTu
         8Wgx+MMfaStCa9G0olyQX5akroaCG+rclKRuQKvfTRrTT9XdV5JHCa7xEJJj/ybGzCx6
         esmyPm0R/QOz3cf1dg24pjIxpooDumuR254LN2iPoZEP9UjdVARczD6syiw19xbEXYnO
         ls3HMhQLwjpAOUdzzk+ypMb5+4yDEdE4BI7PKZd8Yz3WY4m3jE4iHZ6G285B+tIiR+B0
         oqQw==
X-Forwarded-Encrypted: i=1; AFNElJ9uzMvcqIEM2DwFIehGthhQx1/ScIOAEtMG+4oJ1KecXgBJJN//8CSpE/I0jQGMHZVPqWel6lRRJqI+/I3l@vger.kernel.org
X-Gm-Message-State: AOJu0YyAY++iEMV0VdM2n9G/UPQUSRn6EOlgLL3wKfHjPAvDzz7hXdiL
	MS6LzP+l1dmCBFdoaRJk3wbAxyfZPwfTKnSDBihgvxZi1Q8EKDEeLvAN2UVZX+G6RMdrgePzS1w
	FObWY/1TkPu9WA1AfOmOTf7obpOBxeLdORh5UukPeIPiVPHJ81PTeQO2gIhhpgn6p5gSrlIDJR+
	jD
X-Gm-Gg: AeBDiesCgKFoWBgJUFE1/znlwXB1EiJjUupq9vudnfU6BlrQ58MNrX9JV480EkTkR7/
	v0fUstDSthxXpY6ecvbxW8cnPW84yza+maXXVb7noPsoUDsmWJQqNNRDALhubzyAijcOOO9LpiQ
	AbTO2muP9p+cfAfT+DYKwlonD6mck+N1yXZ0jCFkoxRbFDuILupSQPWy0sdr8h4knuagn/3CE3I
	+t9rTKUceoGz78l/OJAYcVLavLLKco/L6A5AXYfeezC7S7SnaJDWEeg0dkt0zcMMi0fUu40cV4l
	dO9B0qwl4t3dRCnlao72/soDzYKsS4CfHiPFYpzKsJgiInotiDGV6of8eXvl5q+QPzooerlInf1
	uS/PyfshN62fbtlZ0mFaspabOrjX5pgq/FX5wRWqc+/WsDBpJ02L5XenQ7w8gtaW1fRocjYeyha
	f7mp1tcZZF/zeXOQ==
X-Received: by 2002:ad4:5cae:0:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8aca797bff7mr104568986d6.2.1776177782483;
        Tue, 14 Apr 2026 07:43:02 -0700 (PDT)
X-Received: by 2002:ad4:5cae:0:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8aca797bff7mr104568256d6.2.1776177781912;
        Tue, 14 Apr 2026 07:43:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c54d5sm413465566b.41.2026.04.14.07.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:43:01 -0700 (PDT)
Message-ID: <8d7baebc-db38-403e-b724-d4b214b5a51a@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
 <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
 <38aa8c0b-fb29-44c9-a346-363220264c7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <38aa8c0b-fb29-44c9-a346-363220264c7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0Qr3B6r16v7thB2F0FgxxDhi67KE7vRm
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de5277 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=sSUgItNeZYVuX0SKOHkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzOCBTYWx0ZWRfXz4LbNCm60ucw
 AXupU6aICbnItp+5GFd41s1gsWfKV8s815UBote/1Fv982JIOl+W9hhtuuFVPFO0kfQGwg5S8R3
 g3k5dEgI/Uz2gkNpsNR3GPVXh5Egpxmi8NzdA/MSvTIe0tPvjk+86iNjQdqNpXCAqz00exyyBXu
 gJguedZ18WS8R+y+8vM2I2TfPfhohh+XwYLDcDPgwbDbrP+4AuOrWtULgKdaPn/4i+fvYzPGMIp
 D77BvLQO98SRVChSLxbcUjpdxES/9XGkec2fsTP9fln0cwHg1q9bgT6ZEnoRoV1F61hFrTwlvky
 witDZuL5FklK5uI9ibUl1JNUpcl9LpgUzKU76Bv8zx0dixEXdtzdOHIZ/FrQ5Jtq4aIYh24M0Hu
 XQ2Ze3GHTFrRUvOeRMx5BvFCVfaRa07J5Fc5/Dy/LeZL57GhhbibI8ILWiJ2d+o2cDBFgWjS2Jl
 Wu6yu+2l5R0Rka5mv4A==
X-Proofpoint-GUID: 0Qr3B6r16v7thB2F0FgxxDhi67KE7vRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140138
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103149-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A47D3FB6FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 9:26 AM, Taniya Das wrote:
> 
> 
> On 4/7/2026 4:28 PM, Konrad Dybcio wrote:
>> On 4/7/26 11:30 AM, Taniya Das wrote:
>>> When the clock controller is probed with 'use_rpm' enabled, the
>>> runtime PM reference is currently released using pm_runtime_put(),
>>> which may return before the runtime suspend has completed. This
>>> can leave the power domain transition in progress while the probe
>>> path continues or returns.
>>>
>>> Use pm_runtime_put_sync() instead to ensure the runtime PM “put”
>>> completes synchronously during probe, guaranteeing the device is
>>> fully runtime‑suspended before returning.
>>
>> It's not immediately obvious why that's an issue, is there an
>> observable problem when the transition doesn't complete in time?
>>
>> Konrad
> 
> 
> Calling pm_runtime_disable() immediately after pm_runtime_put() prevents
> the runtime suspend from completing, leaving the clock controller active
> and the HW rails in the ON state.

Please mention that you want to do it on a clock controller device
registered through this function, because currently it doesn't seem
to have a functional impact on the existing paths

Konrad

