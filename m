Return-Path: <linux-arm-msm+bounces-90502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JrvD9g8d2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:07:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F3866BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 177EB302803A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB92315D22;
	Mon, 26 Jan 2026 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gckajqXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJZPnYQI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F432E69A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421774; cv=none; b=Gn2TzjZBKQb7j5n30H9n5g9nL5IPv3DhS1O6bqDGTj+gnAIsyYYctgAxrtXIRZwteBl2LM7UG/GuMrq401HXz27JcUfIhSqdeJAQsIWLAQd8SAiT4NkrBmgXXDOHHki3l2T8qQtpACUMsgwA1Iu1p6Rm9sYch9EHIuJB2Kfjqx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421774; c=relaxed/simple;
	bh=hVUXYanH9WHp1bVK4mP2nWJgR+w8BeEuD9psnVP251o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qBGcyQXe+QjkHsu8o8vXiTRSKJlCQ7LJTRBIsu8/5mGZjEUMsmmAKfEplEwHUqqKMsGQQZeXyFMIsGqZCB5fcCA6NwaunyVYI00DfWww3g+qYkGVkvn+PMxkeAyiNnVLFEDiOtqbBawQY00+PitYw0YxwvN98MCvNSqMAxoY2cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gckajqXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJZPnYQI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q2G5ZQ2536581
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJ8n/rnroMmSRj+BA1mzSL3+xFr/ialXAh2Tf9HBPZM=; b=gckajqXLiuRnM+t1
	ASQNSqNfr9LdLD2E/c0A1Qy+JOZ5ZnvglyE6cIq9ocnhIu5FoyzX9gLtvRKbL7LQ
	cfW0h/IFZ5N8xJ5MMyEAAkBSzV/SIgyCsSZDk7tWA4k5OIMHqzjIV7TnUy2/EpGg
	b+rJ+j5tiT6cTmRjXMJYGCVvdYuDtT1GLNqEXPhErDUjhNeX6hR6ZMnHEXh6fEaD
	cz5WlSM483CPp1PaRhMfxuZ+AmN7qhHh3UDS2BVVn9QXgab9TDLJkYqs1EFr3Hra
	7AapljJSpnJJPfmtSddfF+hN8xtqeWVgKyDmJtatLN7qtWuwgHxtGsdVxWJlQt/F
	fkaLDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtybkxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:02:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6d6b0f193so92702885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769421771; x=1770026571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJ8n/rnroMmSRj+BA1mzSL3+xFr/ialXAh2Tf9HBPZM=;
        b=TJZPnYQIO3hZ3JGHTbYSmTLhFIbtublnGilzA2/QZ1t4P19sWLyT3lk86S/oCwse/7
         au1M379yTWKIuDIxgF41nsWY/l0+DqALx/74flmf9Bb6WX61WyaCkFde6aRQ2x0JGWrR
         vjwzFiBiEEC1l5ML8mhYK7uoCHvIhTu6Sw9DkN/bd69WxeheOdUVDEiLJbQega+Ggzm0
         sU9OxAG5regz7+M+7IYdGfAxKhm/4/aQ857zlfWh3jNDj02VTa/H7BufrriEMAGwKCG2
         B578q7UcTxTZEsGD5CfY1X9S4twzsnRT/TEB26uhEZ4yyLk2iTDcRZugyJNwc40B7BnC
         iUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421771; x=1770026571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJ8n/rnroMmSRj+BA1mzSL3+xFr/ialXAh2Tf9HBPZM=;
        b=aG6iA4RHIXjBUBgLrgjC5owmUQQyoLo6MYyB1aiRr9VlByEkX7uHvIhSbR9kw6Pdgb
         iQKZ70mtZpV1yjNvp2ErBUOxBRnl6PgLDr6xGsoNU0bYeq3fUjD0I+Uh9Za7+tANWMO4
         2JJykZbAqCmgUtJuDKFyantYXRWxX6HtxWOp98jPYXb0HxpQfGCTw1f0g6FSZDBKVmIy
         NkWXjcYuB20FcEA3RQXojm4tOhF8Sogc6GIboAdiqSWawjIUKI/cViLOpxB20TA+uObs
         OYyhyZQSfVPw5N9iRtbBgHWLQKJN2k7MN6jD7rPfizXcJFh436HWxDe/xf+GhzdKXmjX
         LJKw==
X-Forwarded-Encrypted: i=1; AJvYcCVv5XNZd8WgCArs+OjEL4Sry1ndpbQe1Klktboi73Q5nk+FYU6Oo5v1q13ZOJSw3L4266KT4RExksCP7lFN@vger.kernel.org
X-Gm-Message-State: AOJu0YyUlVMJGm38tslAgG1wf/DPL3DIOjY+dUuqUqR/VgB+J1oefqCX
	iumsT7zbSavsZI/Pl/A9vdo+ZhSFzKmhzC42qJ6CW9A4BY1sObCKwWGNZ6pGXDXl0OMJodO19A/
	8aYA3u8mnM9v21rQVzlI71a+gMkZmJn98gvUU4HEi9A7fx3dLVU/pBtLSxkOkCu9cdkDB
X-Gm-Gg: AZuq6aLnTv+B26h3KWOt7Uo8P4G39hJvuPQjDfiIc6PqJx820aOfLqkJ2kn0u6Vy4AT
	5QecVC2UEPp4r+teX/gLeXhGIHCERJfQa5P7Yni3Lh2YIZzAGi81rYF9mhasBHUsqtRQ77SNar/
	mwjXrdRZkhiFnAeGbCOddnP22yyAr/zKbjRmDD7jcrH9lI+QAYNtCWM64O2S9DFPxdm7L2TCqIT
	l1U8NRBLYC5FdSe8FhvmrcQ4+yNfsmKw1Ed+arQweV+VjtgTgED86N9F4X5g4AKp7/srV8hL/jm
	ScRnqjAZJPrg9dnCsq35OqQp4d0iiOfXXks7922aCsOQ9fU02fIevZ2xmimIeBgc386nuoP+APB
	6f+gnp9GjjVWGFt4Gb59NNOVh8RMYtpUpBa3FmzSy8j/4lt5K5fHbZdG0VNSw9KQFZ/I=
X-Received: by 2002:a05:620a:6a84:b0:8c6:f997:d6d1 with SMTP id af79cd13be357-8c6f997d6f4mr264581285a.8.1769421771112;
        Mon, 26 Jan 2026 02:02:51 -0800 (PST)
X-Received: by 2002:a05:620a:6a84:b0:8c6:f997:d6d1 with SMTP id af79cd13be357-8c6f997d6f4mr264578385a.8.1769421770666;
        Mon, 26 Jan 2026 02:02:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b88693ee59dsm563948166b.4.2026.01.26.02.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:02:50 -0800 (PST)
Message-ID: <3e996da8-fab0-4a50-bb95-75a339b01547@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:02:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
To: Connor Abbott <cwabbott0@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
 <CACu1E7Gpzgg0WKT9EyFO+uJsGCVAcEUG1OkTdhXLpGThTrd=Ww@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7Gpzgg0WKT9EyFO+uJsGCVAcEUG1OkTdhXLpGThTrd=Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KovxQgScQwU3zPkv7r0MFKXDE2Db_6vn
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=69773bcc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DqWAgVkgPjLbLUnWXkwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: KovxQgScQwU3zPkv7r0MFKXDE2Db_6vn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NiBTYWx0ZWRfX4Wpx4r237Vk8
 Whoalvt+SmB/k42iR6vfXC3Mu5xt/hre4KeEL4kF5X1ABWUk71d+oNzTTmnkhw7zqjDcuiZ8Ch/
 R+N7lc8cRnxss8SEzGW6BnP2oTub4U+5ydjBuuhCbfXXkqo8AAxNxauMLNzbLAX4lyT8P6x/ZLX
 NIif8i1+7EY3YHRtCzbHBM9/4zPyp+0AcY9t1LOM0MG/R5qsGHBVWZFM0XaaP5WyAFWg9RYZZ0y
 xKCz1bbhzNTCOgUBN+4G7nNVhp7L4HMA6/Z8fqRaSrJa5xzKAgLTvt8eEa9u0hDLjeU+ELxN1xR
 JmzuMLBD/Z61E5hHg3erBy0kli53ct0a7s4duieAWuPFYvicG+p7p+zcdzGDf5kAySXnt1hcCNv
 wlAFe2Bgatp+Y4baAWWfOBOqts6PvFmQsWaMFEJQb2LWWLp9QROxuFCpW/brZ3K3PiCgOKqxzXm
 MtwvZMZPWxqV4dZNyoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-90502-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 998F3866BB
X-Rspamd-Action: no action

On 1/25/26 6:16 PM, Connor Abbott wrote:
> On Sun, Jan 25, 2026 at 6:37 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> Currently the database stores macrotile_mode in the data. However it
>> can be derived from the rest of the data: it should be used for UBWC
>> encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).
> 
> FWIW, there is a UBWC version 3.1 not currently reflected in the code
> which adds the 8-channel macrotile mode. If we just added that and
> made SM8150 and SC8180X be 3.1 then we could derive it from the
> version.

I see 3.0 in docs for both

Konrad

