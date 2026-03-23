Return-Path: <linux-arm-msm+bounces-99161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MRYNRcKwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:38:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D91142EF31C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AD9830074D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B719E386C27;
	Mon, 23 Mar 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8PAlXqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfisDMM4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A733D4E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258706; cv=none; b=SMRFSRcccH3nMbrWtkZVpw+W8WbJxwBJURqWWZsGaHOr6FxD1PU/ZJoT5jn/fo+KbtGQwm0PpfskEpbe0DX4RqlGJSMv14gzjrMO7o57RGDuppPDxO9QeFCNDxgqHubZ2OxyoMzDEUWx9Bo9xO8+mq0UAlxElBnDLpZHF9Da6I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258706; c=relaxed/simple;
	bh=z+POoKyfa8zLBTym/G/260Yp9JlLJyXxuQRco6Ut5Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7wnw2XdaumgIrBJogocYKGlISRUGCH0yezC/h7xMlHLw4WP3bDDWGDUpjKOD32M2xb+Z/1l4K4/FnmzwFWWuaUJuOO5IranrbTwDOZPSowLyUQIYasRW1IBrp4r0pXP6HO12HzkGQGn37f++KQ/+qtXO9lMzf3lGHIXp/OIrz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8PAlXqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfisDMM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ADmp424220
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bw1Ug8t3HovMsDQIBVaZvb1BqvAKmd2sz3v2Cct7ByI=; b=L8PAlXqv0dkte+B8
	DQNNCHL5VeSpfP9p+H8M1s/ccpNXiorCQ+p3m+5ufawR7zV7EUK7YaSUd7TxW349
	iEfLD5WO+hfyKC5adwh7GXiICk2acASnGcVxjhyK6k2LhOzBjPCbyQDZBKw8fJ3z
	KSlnHFwYravPKKP8YiH/nSDI1crNzUmBVuB1r/f2LUoJhLiGNNCwnXYEcgJ2wAk2
	s8VWR0XeYYl9DXE/LCG4XyuD/jC+ecDxwMgvzrjXOXsd1g8CecKg6cZg02WYafm+
	iJUJz1WRjI/vlMInwv/FseFietIWUuueiCLjTbhgaaI7IuXczvLCGHqVM78gEzRe
	n6tgZg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvmsba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:38:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899fcb63705so31391736d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774258704; x=1774863504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bw1Ug8t3HovMsDQIBVaZvb1BqvAKmd2sz3v2Cct7ByI=;
        b=SfisDMM4Mg3/ETqbmTTfe6aPI05Em9ErPJ2ITjGVtFjL807w7RdwGoPuMheluuMl65
         12u/FCxJh5HeLBJoENy139uho5AxIQdUkIylqwBnnYBsXRDroZWvXO9XJf6Yd0o/+4Ha
         ri/iUKlOl10PtqUlHv8xMGMeyiV+ffG0ykIQljDeM+OhUc7MOjHOd31MYeH9VhMUEoij
         BoKszskfFgCJD22lP5O144H+fv3y/t4nMwZjjA0IfWjTnERjEt7UaqaWfZH2fmGDDBpS
         qCRWjgr6xmiQDevy8q3FNGpcEGc7d9f4a1uCdmAw/6E/olAJLFNguAeBNLBIN+qprpUd
         2ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258704; x=1774863504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw1Ug8t3HovMsDQIBVaZvb1BqvAKmd2sz3v2Cct7ByI=;
        b=bCZ1npfDMERr9Rn18286Fn9vpGYc2YMSqSTi/aJ+/eN9EhNPlw6fZRIbx5IAqAfwrR
         tiquifzZJCiNG2362Jx9ORwhEjJCaff+N0YCdQ4PVoSsUOZcpfXVGYwAj6OKu4oAlysW
         fTdjzd86KJ0fqnPMHWA+6AHLIMlhbEKdOiIuxBfutO2FLl1qGYUEmWFIyZ4WnPu9a+0h
         SNhIsXehVTgg9ssRMlPoB7iHpQX82gNZ1KanQfr2H0+GGVT1JKjDyxgXvwsX51E2KaU4
         uTtP3dIRr3d++LYPLB8QWNrVbLmVPDJZ+sBXZIHnbVkrO6tbYrZbjijwxKHwoOKKEIs5
         o/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUrB3kCAmpQz638Fo4r/SmSeD1OBh373ZH+ouj5IhXzrS0RIiLy8q3kklf9dbD3bZZNyEib6S4aYRAFqrU@vger.kernel.org
X-Gm-Message-State: AOJu0YywfdB1AN4+EgKgz1+KJtepwMiZO7PQju7qyLymbwtFIM7eWH2w
	aWfRIbubRl7CcDA2+y8AKepnDSyTTRptx2SWKZe1UDH8OUuQLks6jU57fJC3wYAcgEGgIsSGsZG
	HQSPJu1v6zMmikG87cjs8c0UpF8AFJk5dVDl1KrgW/4z08ijZ0FZmqb/JQ/KLKhg4HrY/
X-Gm-Gg: ATEYQzzuW5gx45GoevbTgGOwd5eCTu4FmHKWNxLKPlzuA4UAJ0jW6gyYR3QGwU1Z0AQ
	d2NMmKr4Gp+6tMHZ82eBmn9Z0WCaTb4c6AP15UiN8FG935W2uEtFsc7L+URJkO1LnpngBB0Q1s4
	APMdpVZ9WIrJBti7MmJ0HEZ+b9zdyprXe6HOZJ/z4HjugkdF0iKryiJIPqBI5LzcL3fCgr+3Bcl
	koM+HmYJiQUvmeAoKTyJnPNr8PVMfwkI+KIy1I5UhNoLzpDlLdQjf874jcs1Aeb4dta7uEi/zB/
	cURpmhIqfiq02Xzz2izyKHgMWVdVR3gEkOGR5GD2VNmzeLAuL6KlD2wlsM7MYDZOIs4Rty79qr5
	pZIySt6estDZaLUVUiNoQnQJwEI/7nRb++I/SOVSIgA1Xuw3VeXc3QVBDiuji5o5IlwAtnpC9oy
	pe9aU=
X-Received: by 2002:a05:6214:2484:b0:89c:83a1:6a2a with SMTP id 6a1803df08f44-89c859ab0c5mr156614396d6.2.1774258703924;
        Mon, 23 Mar 2026 02:38:23 -0700 (PDT)
X-Received: by 2002:a05:6214:2484:b0:89c:83a1:6a2a with SMTP id 6a1803df08f44-89c859ab0c5mr156614186d6.2.1774258703411;
        Mon, 23 Mar 2026 02:38:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43bd6sm477368966b.10.2026.03.23.02.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:38:22 -0700 (PDT)
Message-ID: <2f801f66-68b4-4515-adaa-092782082162@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:38:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add AYN Thor
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-5-e66986e0f0cb@gmail.com>
 <16211bef-2360-4bbd-bd2f-72c1d6993a1b@oss.qualcomm.com>
 <CALHNRZ_5_2zypBAeZT=YM6ZUq=wv-8GO+DEJTOgtJ_8nrB2REw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ_5_2zypBAeZT=YM6ZUq=wv-8GO+DEJTOgtJ_8nrB2REw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NCBTYWx0ZWRfX2EwCKsjKISNZ
 YBCZnMou558ZJHtCqOz1CmgSXqVb9tJxlOn1hNNVPZ5vSjvqH7JH1Jk/1LABSpkMhwhoyTsVr+v
 bvJhEPW/d4fYlAj2/utGxydsGauyRRVaKDEawPCGNcxF3YZWRdXhmEfeTXpL8qjHvWWy2WLhP/c
 DJ4Rw/bKFO8dDcOslbjttBfX4AixRGcdVGjrswUiWe8/U49fgncGppDkMyt8Su9ZzLGbfuaqEsn
 HNxSD6j0mCbsFKNTOLWPGbFKxYaDiskUsIDxbKiKNJjcrMGQn9p/mLMxIKRDNydu8Xb6CP/soTZ
 XJFanWNt0gi8JOlyo8w/KcbXG9HExaEUUl7iHm/n2wjgucimBZeMb8yrXfkYsDdTgOV3N4KdMAO
 I4K8Dge+zSZtxiYWPi+M0EOqG/HMzi9Lfmj/Ih3Ys8JOt/eQbkgFkgq45PwVlFe61W/0Z5aEigD
 r9Ghpj6v0/yFUPbH64A==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c10a10 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=G69qOPBZkNddxifnoy4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: y-XpaMvCQ6rNBgQpwSvPj_gAzotdrX3k
X-Proofpoint-GUID: y-XpaMvCQ6rNBgQpwSvPj_gAzotdrX3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-99161-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D91142EF31C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 6:48 PM, Aaron Kling wrote:
> On Thu, Mar 19, 2026 at 6:32 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/11/26 6:44 PM, Aaron Kling via B4 Relay wrote:
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> The AYN Thor is a high-performance Android-based handheld gaming console
>>> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
>>> AMOLED touchscreens.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&spk_amp_r {
>>> +     firmware-name = "qcom/sm8550/ayntec/thor/aw883xx_acf.bin";
>>
>> That's perhaps a dumb question, but are they actually different between
>> the devices?
> 
> To my consternation, yes they are all different. Most of them are even
> different file sizes, it's not just header or signature differences. I
> am assuming they contain tuning differences per device, but I really
> don't know much about what they're doing.

Yeah I would assume they contain device-specific tuning or whatnot, but
I was curious whether the vendor actually did that

Konrad

