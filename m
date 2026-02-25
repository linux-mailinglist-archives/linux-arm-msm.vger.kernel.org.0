Return-Path: <linux-arm-msm+bounces-94049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMwgHiCsnmntWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 09:00:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBB0193DE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 09:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF15A303A6E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8453101B1;
	Wed, 25 Feb 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LV+QCZw9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJ/CDqN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1923D30FC3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772006424; cv=none; b=jLZVd8cKgmvZ1H8eoFzEFvtyez3PgL1dUNX4ZfAP1M9moC+NxkMkjiJDBzGZO3lkd5zoczrhqSrM7ZgzIC+6XEODqlRdtZZe9GWog9d1bk0DOcu0e9Ve10qQ1KAEIi6dSYozwludqUvJzo01u91QcsPVoYBaCQeog2HxuyUhjE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772006424; c=relaxed/simple;
	bh=WAlLQFuiG46G63OWi71Ya5Oaz2Q09IfpFd9OYK0/v7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCP7Jr3kOI6HutsrP5+FozeZU28dVO9dGpSedgJBNHNIs9LZpbL6+eIkgm76btYShLw5mvNt998oX9LUq9hJZpdjKxL7+eMYtpN+Pbx4ZsCPfXeKtnuOrUOocwswkYsZB5mJo7YOZgeGKflXkOsHstRbkBnU0E8A33N6tmTsMAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LV+QCZw9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJ/CDqN2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P17pix4148154
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 08:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GyPCX4s3bHnIw6xPuH3MulLGRJovVoI+WeruDlF4W0=; b=LV+QCZw9aL3iEixL
	r7NFIN1SEreU3z3DzMdkpU7rKnrHrymZKxN9+4dlMmJcyEuz0B29ahlwLHyeVePw
	1RFm0cF66sPBJpKy9ewJZcr1mzyDLcgkhMXfwezJ8n6HJPRY3SKXZHsC5MeNYV9b
	XfY3u37VTP0ddXsyvnFoM7437z7h5H/nmF4h17nJ/XJdJ5pw4VKD8q/K9F4Dg7is
	NqSpQKQ2CqyelFzPFSS51zk302h+ujXktnJBW04qZxZRUpXJAyaK8t38hjVA+NXP
	QRzAux/U1/gtXr0REYOV4utGzLv4L3cmhBhUrEc43X7EcOZm7b30VCsKzxjoGT6Z
	8X3h1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57ry1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 08:00:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824bbce0a44so26852735b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 00:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772006421; x=1772611221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7GyPCX4s3bHnIw6xPuH3MulLGRJovVoI+WeruDlF4W0=;
        b=GJ/CDqN2o5wxyH2sE1eqbuNCI9zBXRFwdR971I+vzQGR/nGfZU582gxIDdtJrxmZ2R
         IzZ8e/EScy8RMzhVEmG1UaBAkW2cRf08EOcxDPu8B+TjT8Yg85dajgyKlY6Q7XCEqOb2
         uUX4D7kyS3QYC+W9GStijXjTeNZHu+O8vmShBpE2GfUQmU8lpyAmJBRSaCHgN+w2yg9W
         JEPmYPTI3QHJ0AjpuoCU0vGxJWXiAREnFQjhL123p0n23Tu0Vymkn4a+7SMuji12Gzxq
         ysCfo8+ds33XNz4Mgtp8X6zydTWVowFqvVnnju/K5hUdPe3CWDd7QgBiz5lxaClv50EI
         SEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772006421; x=1772611221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GyPCX4s3bHnIw6xPuH3MulLGRJovVoI+WeruDlF4W0=;
        b=q+t7ioRsAe/K4ltA9paAUlKBKhYxB6cS7Zup9MwKgyDDv1fmjIqz5WtZl3H6roMoER
         QJEAac2mJbuvSkPnQvPfYmRu8zIhmpv3wTe+xMU0TRHc0hmSYqutISRtlkYrm6Gy0gIf
         SWG0Y5x1C7o6DnC5j4ljv+RIE8JqDJPZ0ejLXFfdxwqHZWShkvT3ZXsQckeCxfd2MOoy
         3Jq9J7byCapAz9G4i+xLeHRnvNOPd+y9I9KXeW+42sWZ8us2sDyoW1yHoWvsLkW8bUKO
         UtdYWA+V4LSg5FWldk4h4yZcdRFk6QwH/ssn83Nt83xZgbEBXMgnh4diQjqb/vwzcvFS
         4Qng==
X-Gm-Message-State: AOJu0YxvCYslS3lISAVkLY7PFsgJbRugDiizfLZ1dDftUPApjAiD4rNl
	9Z18J7tapn2i4hsJUkKoklqe3UU4KMkhJev1ME/c1NanBnvddeKA6g/NuWwwQqIvKgrkEmg4/b1
	0Rhaxk6wAcYGmL0dP3k1zM3B0HIgYSxvHlT6NPuE6XV+O5vZtdyqLUYnoQgPK/wqhJKjGC13dD9
	vz
X-Gm-Gg: ATEYQzz8mB6SGn9tALenQQ+RXJCYTPq32YbVhSbgZ19MxqK3OQzYeYXhBmG0tLuzAK1
	nxDJmYOvZWA+64befbRTsIoN17tTl9+bOjXn1i2tDBw7evFGsOUF5Biw6QCKij18xEFEGbfxtR2
	Ddf9f6y7+gYvJk21mYfUuLal8UNrtmc20/iUPHUgRSKMJOVeMqKSSpx2K1GFMHkyGEtx2wnM+4w
	4JVVkBuNMvcWAtA4RX1LpZ1Aud6ff7HgMuhL3MXoVKFwQhMWU0c6Vt9V/lwzb/aoNQXwYWfgh9w
	ovz86vpp4UVVNLRQ5+UbSvkpjbF+3od/rm3b1VCYn7ZIznfDar7QEIJEjQKq0qo20Eb+ADaT+/3
	W7xRKg6IxkJl7kfFXAxfOkn8SO32o2XySXcV8xkW85nVFl6WloFiYNeXWIxy1GH+ejdNQ/Ced58
	l9tLnZJEb0AyRnDzug
X-Received: by 2002:a05:6a00:2e16:b0:7ef:d070:df1e with SMTP id d2e1a72fcca58-826da8bde47mr14214859b3a.3.1772006420984;
        Wed, 25 Feb 2026 00:00:20 -0800 (PST)
X-Received: by 2002:a05:6a00:2e16:b0:7ef:d070:df1e with SMTP id d2e1a72fcca58-826da8bde47mr14214809b3a.3.1772006420313;
        Wed, 25 Feb 2026 00:00:20 -0800 (PST)
Received: from [10.133.33.74] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd692b99sm13116288b3a.24.2026.02.25.00.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 00:00:19 -0800 (PST)
Message-ID: <70824913-ab52-4737-ae49-50cbe6251e4c@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 16:00:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: qcom: edp: Add eDP phy mode switch support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-3-231882bbf3f1@oss.qualcomm.com>
 <af15838f-6a31-4017-ae5d-7b5e30f24aa4@oss.qualcomm.com>
 <845165e6-4595-41de-8cff-d065e8f6b6be@oss.qualcomm.com>
 <f7fed0cc-0c59-4a75-b045-a83df924113d@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <f7fed0cc-0c59-4a75-b045-a83df924113d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699eac16 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7HR7IauXUe_kPJgae54A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Oz-aSB41ConEcvMWupVRLnU7eJ8bcGTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3NyBTYWx0ZWRfX6uaS+XB/ufgC
 CclZA1hqwwVWNuOJW8xs0VWmL5DDt281r3RLjcdvXCO5uxEt8iuaBXemWxfe/LlSb9QRMYedpF6
 BOToUvs3Vg6jTJ1kHsXaLhLdiEHdX4fI8TmZnU0KXsvMxqifxmOcgsan8aVgdHaQyO4iATm+BHz
 r9GNUVUWX8HocNl8w8fgzYpGy/3JjGliZ634tZftahSUUmUO0fPn4femW6lgG4N4Iet/LnK1gIX
 kv1yf7uCjNRZgS1xoliMnRcq5pVUjXObNdrVxeN1RGsOIY5ysyRVQUxyWtzkFLGkR4pF02qN2an
 P7l3kO7U8KAi6HaV+oWcDXzQXGVdzJVRM4Uqay5MnqvVamTWoISUMh7dBsQF5l6M1PJCtkntg55
 lYDYIEUGzz0VC/d1o/lmNwXQRxhYIwKem8gPPB7RTOfRtfh1YG6NLr1spTFEAHqxDj3VMLx4KUW
 BsSOMjocxAvgSGc8P9A==
X-Proofpoint-GUID: Oz-aSB41ConEcvMWupVRLnU7eJ8bcGTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94049-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DBB0193DE5
X-Rspamd-Action: no action



On 2/13/2026 7:06 PM, Konrad Dybcio wrote:
> On 2/10/26 11:29 AM, Yongxing Mou wrote:
>>
>>
>> On 2/6/2026 7:02 PM, Konrad Dybcio wrote:
>>> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>>>> Add DP/eDP switch support by splitting the PHY swing/pre-emphasis tables
>>>> into separate DP and eDP configurations. This allows the driver to select
>>>> the correct table based on the is_edp flag.
>>>>
>>>> Add a dedicated table for the SC7280/glymur platforms, as they are not
>>>> compatible with the others.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
>>>> +    { 0x0b, 0x11, 0x16, 0x1b },
>>>> +    { 0x0b, 0x19, 0x1f, 0xff },
>>>> +    { 0x18, 0x1f, 0xff, 0xff },
>>>> +    { 0x1f, 0xff, 0xff, 0xff }
>>>> +};
>>>> +
>>>> +static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
>>>> +    { 0x0c, 0x15, 0x19, 0x1e },
>>>> +    { 0x09, 0x14, 0x19, 0xff },
>>>> +    { 0x0f, 0x14, 0xff, 0xff },
>>>> +    { 0x0d, 0xff, 0xff, 0xff }
>>>> +};
>>>
>>> This is not quite in line with docs for kodiak. Now, if you have
>>> better/newer sequences than the HPG, I'm not objecting, but please
>>> cross-check
>>>
>>> the rest of this patch I think looks fine
>>>
>>> Konrad
>> Thanks for point that..
>>>> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
>>>> +    { 0x0b, 0x11, 0x16, 0x1b },
>> here should be { 0x06, 0x11, 0x16, 0x1b }, arr[0][1]: 0x0b->0x06
>> does this looks fine? will check tables again..
> 
> For kodiak I see:
> 
> eDP HBR23 / low vdiff:
> 
> swing
> 0x0b, 0x11, 0x17, 0x1c
> 0x10, 0x19, 0x1f
> 0x19, 0x1f
> 0x1f
> 
> preemp
> 0x0c, 0x15, 0x19, 0x1e
> 0x08, 0x15, 0x19
> 0x0e, 0x14
> 0x0d
> 
> (notice how that mostly differs by the lowest bit being (not)set vs
> your proposal)
> 
> eDP HBR23 / high vdiff:
> 
> swing
> 0x0a, 0x11, 0x17, 0x1f
> 0x0c, 0x14, 0x1d
> 0x15, 0x1f
> 0x17
> 
> preemp
> 
> 0x08, 0x11, 0x17, 0x1b
> 0x00, 0x0c, 0x13
> 0x05, 0x10,
> 0x00
> 
> Konrad
Hi, this is different from what I saw. what i saw
from kodiak HPG:
eDP low vdiff (High HBR):
  0x06, 0x11, 0x16, 0x1B
  0x0B, 0x19, 0x1f
  0x18, 0x1f
  0x1f

  preemp
  0x0c, 0x15, 0x19, 0x1e
  0x09, 0x14, 0x19
  0x0f, 0x14
  0x0d

eDP high vdiff (High HBR):
  swing
  0x0a, 0x11, 0x17, 0x1f
  0x0c, 0x14, 0x1d
  0x15, 0x1f
  0x17

  preemp

  0x08, 0x11, 0x16, 0x1b
  0x00, 0x0c, 0x13
  0x05, 0x10,
  0x00
The set of values you provided looks more like data from LeMans / 
SC8280xp / glymur (low vidff). I’ll follow up by email later to confirm 
whether this is due to us using different HPGs.

thanks.

