Return-Path: <linux-arm-msm+bounces-109669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD4tIL9QFGryMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:38:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D537F5CB419
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3EEF303A117
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454CA3859F4;
	Mon, 25 May 2026 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpXEWTkt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4jW1DMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054F5384CCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716106; cv=none; b=Gewq13WQPKl8+ntW9QLcboIu3c7bkTvgmcIKSZXryTElE4z/xNNcyEN8we1tBQxRO5zzJlYLKPhl0KwliGIHU1gDZWfy+6zWrTDKz+ssZgX1LfJzg44ysNW+He3JCiyRY+oN44vUo8L6PbgR04VgbAf/tAYR6r+AYVrCxfY2YtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716106; c=relaxed/simple;
	bh=oudhdJs5vmzWRgsikCFo0bZh/Nux2FiRhu+FwvqYCwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wvbg0qdw/0p5xN9cDqH/hn4XlFIEMD/KBKWM6uGiFADwDeJsQyV0xjrSHmKhyMgJlSEpbLOp5Ehfd3g0TIUqvqyXKpYf/XotRn6S3glugjErnvRrD768QFe8fuiidbDH8m8uHeMcXiJsebXyHLTO1XLe0zNfCxhg8g0uFLH4+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpXEWTkt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4jW1DMD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PApmK23282561
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ci3NTfd62mXuPPJg67dMPpYqDLH0VqKpkgnmnkmbQ8o=; b=jpXEWTktXisZiWn8
	bQr6axdUkX/WFiPUZYf7ToQuXEISSqLFzNEQgSaWilrMBELJ0ucTPkavhahaGDhQ
	qsgcaGRxMirZANhMKnrBmRuBdvSsx8aALE4c8uMgYaClpqxTmQzzmFo8lf5w1RfM
	LUwKJm1k5Kb3U+LWK70M8n3NZlhBg2rIbNTwS5SqPi1roZmVcNRoeDJ2d/hKT2RV
	SzZJpENw5UmF3kdmaPpDsxAv8zRxd4dgLNz0U2RbQn5qVE2GOxjsaOl2OJmCe1PO
	klqlsUF57OYwcGkhkF1xWqM93KFhX8p0lAZ0lhO4HldRMYiHiVitNdS9xJYyTwqQ
	ZZRDuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3esph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:35:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-910a755d717so142079585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779716103; x=1780320903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ci3NTfd62mXuPPJg67dMPpYqDLH0VqKpkgnmnkmbQ8o=;
        b=I4jW1DMDypYk5iLqmH0QPArBvZNEyuiD6APphS0R0fONQxMsd8GFyypCMNh/U6yKgh
         KZ8ac7AouDfiQgxKbqjNMTYHn6aqeKFwTpAFT1T2XstpcvIP1evthwGBfBQb12dPMUFE
         HDdAV2Qy4zQWmOceW5N0WTAiI1l35RDLiDwxOTNbS+YIF8jxPccwix8hUpTKH3YPBPlW
         4VHniPBDD0FimEcML7/WflrL/QXrS7zEFl9XyBaT10C6eWb0AjzrzYdmbBBEiye1c3jr
         AGpwrkg/nBCwHL3Qjhbl43iy95z+2LhsOIr3vXjh1Nku+6Ku58HDVjb/D5PLs8TDHDaN
         88XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779716103; x=1780320903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ci3NTfd62mXuPPJg67dMPpYqDLH0VqKpkgnmnkmbQ8o=;
        b=O4uf06//1RZiIbQ07wfM+FTA3zaNiYobcJTDU+XjntoIF7lP3sNpZ66Ns22vpg6gdg
         SKYvo2v0MpfvSPyDXFKYwmt/joZnqCJl1zKzOf+eTcnN+IvzEJ2oKN3Pz+9cXYyFgtvK
         Kcwsj0hHWUvRsReKQNwE4Arpo7rRTsvGvVZmuEKdv+eOFgyxxsRi2QfRmSHBCnzyVZNZ
         oc2qQCX2KB9mbjHepdRnwqa+BCsqulxhjO8d1MIGG5gxZDEF6LqkrxxjKPd5KYYZi20T
         PUcQWY8Lf1Pl7+XB8ohF4eGr6sh6RchNtbCJCk5357arQoRUqX533C72gRAyDQHoZ/QE
         QoAA==
X-Gm-Message-State: AOJu0YzO/QG0V4pvaByk9Ejn7xXYJ19rmB4QVl8C6SxaJ+VwpYaRK7vP
	Lz4e9SZCdrk7FIhaN/g7Eh9OB08UmxKErgX7nieuZhEBShhk+aJcsNdu6aOiyHwDg2cRfjLcFhT
	Np46oZv5qXzWJ+j4kON56LVFJRlHvpQzjislRkpcl+TBp+CLwj/46PvsH6WDp4bYUIYVm
X-Gm-Gg: Acq92OG39zkNMUU4EzolR+npFhMGdg/s+dR11Ybn1qAY122JiYLj4oidsM103nYQ2fP
	zu0NLgiXpWF6+doSdYWM6vjY2d4HRfETbIu7T1GRfef5J8I6tXv8HBUvoV0XfayPofnwjo/wlWA
	xkuvN/ZfrTKTAYbaSn9KIXNm60SfkkUCjp7KBmCou0bIAT/XPyWr8l5zHnKCEHDPx74qrX/NYC6
	qBnhRm0lcPYlIoGc9s+PYepv3aI+lA/LfFbj1zKE54wJF4xIKr0msGboCOwxbIDr0P5nK1FUueE
	aBnCUOE5j3cNvEwqqnbkRS0zYF7SyuzjH002RytJOgtKmsRxgyXrRvLqu39atzPKCzvOXJ3+OkH
	Fb9G9o85lMb9HR7+wVFYlIKKuGd48CySH/X2iSaDF+x6PjQ==
X-Received: by 2002:a05:620a:172a:b0:8eb:605f:6ccb with SMTP id af79cd13be357-914b46c19demr1384682485a.2.1779716103454;
        Mon, 25 May 2026 06:35:03 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:8eb:605f:6ccb with SMTP id af79cd13be357-914b46c19demr1384678985a.2.1779716102952;
        Mon, 25 May 2026 06:35:02 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb133f7fsm3958041a12.23.2026.05.25.06.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:35:01 -0700 (PDT)
Message-ID: <be3f22a6-c0ef-4559-a576-722f684cc82f@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:34:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/10] drm/msm/dp: Move link training to
 atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
 <20260524-hpd-refactor-v6-4-cf3ab488dd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-4-cf3ab488dd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ChYF_hc-KYZDlKWajJFhVj7OuL8FcDO_
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a145008 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UhmnXqIqSmzi-CRdO7cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzOCBTYWx0ZWRfXx9EPmehTI5s+
 pKu8zrlqZbpCpf0aFQKs2PDwm8XAA1G9pzk1w0/8nAPyXcepawFWd8mTQBkHNHA5YnRtzHE6QtD
 lQedl1OKQuXp+vnrskNleR7E6/2wRcnw2sdvoEqOU9i5sSD6r8hLNVK63HNfNcvGlmteY4xbAid
 WkjZweHCe3DucUuBUG3TI9WYgrMe8DCOJ4XZwhyPZCiAfxY9UpN1hxiriUXgxP/lmHQjYK7VsrT
 dKVUEkCsTYlHHEsqMxOJF0QtYdqNBWVyiO07B5ekvNM8cdBeyTHcgpSNhgtSWvKUN7qYrWz2CkT
 jLdC+AYh9DUfzu/nQqsTBl1LrX/wgjidQrTjEvopEf0uowVbIWF1FeM0enw2RR997s2sY8JCU6H
 lHh0JJhJJMwx+xWM/nx8KfRA9VVvg+x4V9v9iuJL9iUAJ1F+xxktmzMQsjH2hWE0P12lkVbHwmx
 +6AZoRb8ykTswBhVRgw==
X-Proofpoint-GUID: ChYF_hc-KYZDlKWajJFhVj7OuL8FcDO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250138
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109669-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D537F5CB419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 12:33 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

