Return-Path: <linux-arm-msm+bounces-104113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK+HOzS96GkHPgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:21:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7567445D4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E28743037F02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF1B3D34B8;
	Wed, 22 Apr 2026 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyKNJZnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtLFN3tt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A906A3D3334
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860444; cv=none; b=Wx/Fmk1RY5Q+ZsWBNvwKrpK/9m6QFuoT94oYBJQLIZte2bkCfDITRkR4gTNCjBNcTsla0dHISEy8o4CsDF1If8g0WSk76naPtTaEJh/8Jfo15toPFgjmuouzC8gqy9CsbiY+TElqu2Sp7gRwlYCm3zGbhaGSLMiKPJ8nQ01J9IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860444; c=relaxed/simple;
	bh=OvXI+HDA1Dp49/adXJMTdbdphaPTr8WY9JhjFactW4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvGpuOYdVfPo19eXJvUmQMlwI6KGa+BpdvOUtfZ5eml97rXbaQPQNBIbrZxXgsBBwQwdIHW5ccim26RJqCbELbHFDBB0f54OprZkAonCSsjpTkPxpq5vYvC2VDl0PhqFzaBSZcUCtQM1qQ0Iz+Z7u1Gpcaqt05DYFAcx+ZJrmR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyKNJZnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtLFN3tt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96FsJ664127
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dx+fo7SZ7LP6SxYmEnIte8ECjGbhzyTGN2xgQ+oIBFU=; b=lyKNJZndfWsjAiy/
	Vdo4XuxpBMjaf8MyhqS8DEf+jViGKcOUyIFluoKqtfDgUgwS3hBYc8D8l4D4Ai6G
	d0NbwrDEfg3dzzLxmVxM1Uhb3IGhQW4LbcxkEpOZNkdsvVYGQm7+EPV0op1g/q9L
	vzbpyOvhvKJ9cL6lfWKQT30Xsdd0YDo21ue72tukj5bAHMnQLmMW94lVyWsc0Ffv
	udpahAqA76zAq8y9zug0WwRAGWdcX5v1ebqdxVmcBJt38k7H04cbgT1sUDmmXU0X
	ORnn17Op2+XFoOoIDEZO0IkQ1vJBSBJwLYclH8OMJZF4AADmwpKztRKHHr3+wh5A
	EGDRJg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgrnp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:20:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so326538137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860439; x=1777465239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dx+fo7SZ7LP6SxYmEnIte8ECjGbhzyTGN2xgQ+oIBFU=;
        b=EtLFN3tt/vP2uZ83Wjj3Ty0ebj52CYTRqo7zk3nIPVHu785p8rNL8cojgLXhMjMtXT
         P3LdbhWoQ9SWKEj1GCSV/d6Yi6f5ISp4Csh1neXDu8x8T5jvo2TlYHp+WZV2NgnUMGOM
         CTUGwSAHs2pit0M0hUZh5VS7q1+p9L8APcDaPNKn3j9h4Ju5Le9Sf2TabTmyec5503x1
         ArubX0NaevzvqS252NlrNan8xsZthdEN7KmDu9LBUxXIn4Wia3BIJz43TMogMmq5PEnA
         hSqiPaj1BDmIpdi8qAMNYXGOBb69GPOz6R0Cro+Hs3lk2cG1jge1e2/aEK1bT23Bmyj+
         GO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860439; x=1777465239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx+fo7SZ7LP6SxYmEnIte8ECjGbhzyTGN2xgQ+oIBFU=;
        b=B7arKpDWx+7Y8ujE4zpR9qVgAepggovgT/XN7IBaCWjMhnwgsTYjmXNfY8QQSWVEFB
         1SxCy5814KC7b+kPj/LZHvBXnIj4Pkr+Rd7elri4b+lSi8jKx/H4jMJQoO45NmyHqtGJ
         NKjitMNossNnjxCxFLpm3nDFdS3+RJSC7HO2vjvju+L11k+Km/xo5JO1fqbeOqdFUatZ
         6dLg0ldmDdjJWgDav9NbBUG6eiqAoNF4/6gKuso6QXPdZEeHrMwbtcnXgeF/7y5unoP6
         W5kwRWrAc0IFlI3QEnuX6MIESbivNRAboZLSCh6ytNQDEpbIk0Ro/ECXzbM/Jd0i1eb9
         /O/g==
X-Forwarded-Encrypted: i=1; AFNElJ+FRbueDsI7LyzwqhcpVt9mOMc7GYElVRfJizignJowMzXdVHUZklDtmgLDhil9XkybejANfGXWTGewdXag@vger.kernel.org
X-Gm-Message-State: AOJu0Yztvrhqm21ZvS++bo++GqV/Idph55J7wNQO+eAtXOJOZJ3/4khP
	35fYn8xXMw4qmnMT0Bame9eUBUNi7b7TLpx0iZjupM4sfmDwgTaGFfMHtSOj41kUjHLbfRLpdse
	EWF/u7S8QuDEog/NdQ8bjwuuUzBfRZwhT9w7toalhJG6ZRuY+LYeNAPe5ASs0xwXqSTEF
X-Gm-Gg: AeBDieubzXrDsqyKA2RWyv3M5DaW5w1bKCE7urbk2Dk/IkEHGaS+zKmO+i8h0a4FtUv
	LZBvVvIOIHGMlcl+cdFQkzL2baMpVkByW8kqTP9Yo+3dNtFW+mLn3+IH7SlyMaSQCIpa2PahRzp
	4c7pmvTv3APDlZ2636gEkYmOw7mbM+wxJKMkMzykn42ZJb5F4hoEqNvurf//daMFn16C378NFRP
	x0fdDf3zZo/bAFd2FNk+a+3r+lkCTgJMyVZCO9p2V8F5LG2s9rihLmFQtOiHj0DuXNUh8QdCTsx
	IMEoTT7w6FHtEyz3ONcB6pwl7Ci//f+2KO+ohceQg5IwzoLJStt2j/eZAiqGJfdNh+UlKJhWieA
	F+zuFDRgEh/4YotGpgfSEr70Cz/iNBba39FAIGmz6JG2rJ5lOJzmpLqdM/CnfDQDH4Rl4WigNGP
	tkSZ54I5WCTJXs6A==
X-Received: by 2002:a05:6102:f06:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-616f88a28d9mr4163584137.6.1776860438822;
        Wed, 22 Apr 2026 05:20:38 -0700 (PDT)
X-Received: by 2002:a05:6102:f06:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-616f88a28d9mr4163560137.6.1776860438330;
        Wed, 22 Apr 2026 05:20:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6744dcdf29fsm2688364a12.30.2026.04.22.05.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:20:36 -0700 (PDT)
Message-ID: <f2e8c758-2b3b-4425-a387-6b4171ec374d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:20:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pdHh1yVTeFFUNF-2sYQoge4k6OxXycOb
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8bd18 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=X6cb7EJwOZpD8-w0EOYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: pdHh1yVTeFFUNF-2sYQoge4k6OxXycOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExOSBTYWx0ZWRfXzdgjexDgPBh8
 /AH69i7FlRl3Kqgt5Jhvm28K+bHua6Wlio3MEAxG73QgOLzId9kBI8lx1p0b3Z3nzg0rgkyszNo
 pkIUHZPv0HRAQcpj8YvuWtPgaBCnIb4e71/CwznQi+JTZcmLmK4729Idhm8ZeBSUQFN5cpO0XvP
 OIYvn0CTnA/9/pGcme6B+I5Nj7QFu+h0djZE2L8/om35K+Ebu3yk6lQegijU2ZtrwrqvWPOLVU2
 3YMmgdGdW/mBmMjzliIXYfg3PaizOob/wvELArqF/lqL91QNUTR9xOmSi6YoiItfZN8ZCgoKpcW
 VUeRSVYoFsfjuHBCL3HhXj4gxEkJQ99DKbdl4I2dW+Rflok2C3jlQiw5WwPM46d99gVDHKVHzav
 d8iyi1SUgMMV2WFOpbIplk/Yp6oRKLRqOYBOHfmltzSajXypwmqVHdJsflul/hLw+WGZLFFbp0w
 b2aahIVwhQc68SBrpiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220119
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
	TAGGED_FROM(0.00)[bounces-104113-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7567445D4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> The state‑change debug log in iris_inst_change_state() always prints the
> same value for the old and new state, rendering it useless for
> debugging. This happens because the state is updated before the log is
> emitted.
> 
> Log the transition before updating the state so the previous value is
> preserved, consistent with the existing sub‑state handling.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

I'd argue it prints the opposite of stale, but the fix is good!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

