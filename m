Return-Path: <linux-arm-msm+bounces-100906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBZZGl3iymnEAwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:51:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B49D3612B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15343301F159
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F493976B3;
	Mon, 30 Mar 2026 20:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0YVxLlI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ytl8xXj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC7B175A87
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903898; cv=none; b=JFgDnfFUH3bq/HlyxIzUseoFjy8l2Rzg7tZqCw1vZ2LoTAuKN3UxmAcQaRqokTn/aiONSTC5NG19vmFXksCpWYdMwyMdJdClRgG+ByjIepeWoNLYKfvqeQrxyUzJrCI+19o6omUyaNAyqhvqK/6XING5JM2Q2dG/IkXtIJNMEGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903898; c=relaxed/simple;
	bh=swKIgGm8KEVzBXix73OUwXQs2/RvHPlBow9bNaLhMzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igFJXejVUx+oEkHIo1kSpEVFtuHzCxlfCQ4u/0TWWZEVozaldGzThJcXNccmXGIcsDcTb1CYKsXZMJux1exLv0YMQY6b4rpot6Ffhs/dce48a6t05eQFO+PZlZzI0vx6z40MwLj2gUU9zqYjHFULESiugvxQOI3Q+LMiXPK2dj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0YVxLlI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ytl8xXj7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UKmUuF2407599
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sfLWO/i4ybjt5OEVNLgyO1zG5HeDMlwhQfu+dIrpgQs=; b=H0YVxLlIZhalDLI7
	+PVzCeglPvO08oei1dttOUwMVHZ/xsbwosto09vS5VFZTGsb0n7u7nYBvh3uWbWn
	cyGCGxLuHaPaq8L9a7koNh0bRvI+s2fwscx36UfXqVGQ8v6626ktcv8VIJAqWa68
	JMlN6f/zNxeHZuUCb+bUTNAlVXZnyIdM/nl2gEEQY9Dh5cTZV7MISMAs8M6yVovP
	AiXbJzJnkuQj9WPi+mI8nm6ZHWB5HPanAKmGTGEHdb6qVpT0iNqm2d3smB62fNpg
	zb5wzlJhosFaeBPYJcK6mzV/3RjSTd64D+065sDtZZux0uveqPmKZjw0icLp38WQ
	O51nhQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80her08k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:51:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2497cc190so15785395ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903895; x=1775508695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sfLWO/i4ybjt5OEVNLgyO1zG5HeDMlwhQfu+dIrpgQs=;
        b=Ytl8xXj7os0JU2zIevSrfF4pkAZc4Q8M8B3y8sNbaybq2+tgmlFlXGLufTmhTms750
         XIs0LDU4tfq0es9k7TQI+6AWDVkeXP1EBG8teVtqUQObYF+IYs2QWu4KAHSbs5r4znDV
         w7IInMNDOb1h4vPHFXgfubc8k3Yt7NzXtbHBvCUSnXAAKqkroLTgO8+RuZqQC3iXyR/Z
         X/x3DiVKtYcH7Ieasv7VtAa9yNXXFsh0heE8Y+pjQ+eHmikPaqv0i6K8tKbNMBOcz3Lr
         2hOIelTS4ceLXnk9BTNwN4Po7eUb22UQqFivimerzE1vssy07mYDALhHG8KBR21Tr62l
         MN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903895; x=1775508695;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfLWO/i4ybjt5OEVNLgyO1zG5HeDMlwhQfu+dIrpgQs=;
        b=Tj/6+UYRrFGgtEdgjKMaovO5+AMlgdBou+9MMM0XLwfckKoS/MFAyDIOufLCETBI22
         oUVZb42w6yciL962q+fGcwiFfvlw0CpLeK+q0JMCs5JgU43Av5HaFWfgYhl1/tzJfHLY
         +X9I9ve7VXexpuSvlJXX/tvdatmXdAOP9ZDZbOjDRvmn2I8yM+ad48fZU8Ycy4t73JRq
         435ukPHs6o1S3ZENXyOjeDO68y8hpScgz/dIx51qYQzza0BrdaUGNVWYph7isUO8gK2h
         RZsCVOn0zsi89j550OP+bkhe8PUCYAZ2kORJrlD6hIqnX49EMlsp83MECMSGpT1Tz9P5
         3T5Q==
X-Gm-Message-State: AOJu0YxWnZBsrWPKN+5R4BbnurNAtpkFAQ7FGXZFJyj1W6sd0DOyIYnB
	jS6BJxl4bOQ5agahge328I44kaw19Sz/t/HDkjrgOns19FBLamP1nZxJmNDjPda2A/xCmulPN2w
	YbO6rCkv/WZxtpC6GdxYU/3eMQskmGnKvrB1jx8/FP1ghhr78nDyP9AqRsGD/FCZiLYuL
X-Gm-Gg: ATEYQzw0rioUM1sIc+hCSo6GQLT+OMRcILIhDzE8EOgHcTRcjAvBUKrJo+IZsb+aclY
	1nEmDi0OcIQKA/2JFdrH8wSK5HhL0aAbE2MH8FIYPlHcuFqa4jhbibTto4g+M9h4xEiCjxN1ryS
	vMCXIxJHxtKv9xWZsfdCoPDMCzzn9ZU6l/lQ4Ooslal/AlA/8T6++GlIH565MlrYDaHLPEAmX2c
	uI0THtfcvQEnL8ftGlXpJy5aMG0ES24C/I6PxXV4XzNIMDfY5dUdHF6QUg4tmd+A2HhjBDX/JB6
	ZkaJ2N65USDS8234d2L1MuFEcIDerZhYo3b/+tLbPqk2bmGp6oCQSzDT82UvpnrduxBMxM7sWzQ
	F8E/jIrrGFcvouyVEkmrV8CYcd3EWokgP+Hly8USeru1J
X-Received: by 2002:a17:903:1a2e:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b25ee90436mr7881075ad.2.1774903895451;
        Mon, 30 Mar 2026 13:51:35 -0700 (PDT)
X-Received: by 2002:a17:903:1a2e:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b25ee90436mr7880855ad.2.1774903894992;
        Mon, 30 Mar 2026 13:51:34 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265a954sm92575545ad.18.2026.03.30.13.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:51:34 -0700 (PDT)
Message-ID: <6037882e-3716-47f9-9303-b448ab8fed79@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:21:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] drm/msm/a6xx: Switch to preemption safe AO
 counter
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-3-2b53c38d2101@oss.qualcomm.com>
 <2ddea137-bff2-4576-94ed-4f3a48aed386@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2ddea137-bff2-4576-94ed-4f3a48aed386@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cae258 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Y7Gn0S8KdB2wQIMvTzwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: J6Os1KhMtL5a7oIssYPhyYzTIlV44G1P
X-Proofpoint-ORIG-GUID: J6Os1KhMtL5a7oIssYPhyYzTIlV44G1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NSBTYWx0ZWRfXwToYH0S2q3lG
 gtZqYB0H27+076jTifCTYkb5K7xcw2HIT/BI1Ntrqgbx3o6E14FzZGVnBAGAfI7xd4Mzlc4HzrZ
 z1tMHstd2weHRzjGfjSH+6WzzaBfZuzG7uFyHhGg4BSxaGamkR1Ty5K6gmhWGFUHTkXghR3QS3P
 aghaFYKWjIZUqqtnbr7J6GKWupwrQJ+MeCqmkhH//17CfnmBRxPTKN4m8wjj1btpoHuOc5XWkmA
 i/Lslmi6318RrecXpTmoL7sqa0knOuj41KfHyQt5mOmgqLoz8wdmcuzX+V0KkcvjawIXi/QE2MG
 V77naXTGeTZmd1p3+DuHHjk+MDfarRg8YRq/LOOBFVy3wcbl/RmShkDJEF8zagq6xz2Wt6vxc3x
 OcCrHfA0yFUUcjrNOX26FMX8IHiEoGU0ULUXPuffFMm+IB5AtwSTrxINOJobhTH/vVKsXgwLwe8
 ORKCSh8qv0rHGMAIOnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300175
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100906-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B49D3612B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/2026 5:02 PM, Konrad Dybcio wrote:
> On 3/27/26 1:13 AM, Akhil P Oommen wrote:
>> CP_ALWAYS_ON_COUNTER is not save-restored during preemption, so it won't
>> provide accurate data about the 'submit' when preemption is enabled.
>> Switch to CP_ALWAYS_ON_CONTEXT which is preemption safe.
>>
>> Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> (this is not a blocking comment)
> 
> would the _COUNTER counter be useful to keep for any other purpose?

That is actually a good question. I was fixated on the fdinfo aspect
that I missed that this is used in the submit_retire trace too. In the
trace, I think it is preferable to use the _COUNTER (or keep both) so
that we can visualize the order in which GPU processed the submits.

Rob, what do you think? If required we can drop this patch from this
series. Or I can send a fix up as this affect only the ftrace.

-Akhil.

> 
> Konrad


