Return-Path: <linux-arm-msm+bounces-91036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHprHUoXemlS2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:03:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A844A271D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD6AB3004920
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBB3225390;
	Wed, 28 Jan 2026 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgOBWPki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRk2NgLN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87988221F06
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609031; cv=none; b=CLDZ+HmjSFUg6ifMFsdXqVfGmrhU32rIgM3At7S3eyuGgKTAHwqEB3uI2rTwiiZy7F+7VjIZulfBlvVcZvtWLBLrnZWkGEJOhW8ABuVv0TIlxct7p907CiaR44ukoi+Cel5i46u9RCdOGta9/Ni+lHVOXBbwbemBOBs+12ryNfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609031; c=relaxed/simple;
	bh=30FocctSoXBE5CWvqx+TP0Ha8gdmE4WlKjcYX5KMIfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MF3eNIgu1VHXte+U60sBYByaDfeIZ9W5YJaQCNqVEidypk5+F5YPfcc6dq7h1/EmwWuVZwTM6P1O36hBz3xSLW1TGXxEc+C9qkEThj7OD4oYxihDsdNhuPOcLxESoAO0WZnYxBrU/O2GkRLglb69GJncq61SxdaxGbAZekJUea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgOBWPki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRk2NgLN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92V8W254542
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKkXPBgrqbkwp1MsXVuHY/hDJf+7uos/XFP20HaG6iA=; b=IgOBWPkinX08r+Ei
	3HbmElMnEijkKDTZtmHd2oyCLzWlsx8abMEx2VMPHpa3PmsTeGDRK0ZDdDHSf59C
	WZ04GtN2emM+UQGj7yNNm99Qf3JmIYw0Cn1QQHK9wuYAiuAD65PzldDflYGsrbAG
	jLdzVz4ber5mNrCJxNpvRaN0cTi9xpRgYsxw9rgKRVPyUY1iIY/cHnDPPtwRfxbq
	sAo7UNXlup+3tuSeZ+YutcqoXtT86qZ1h4wSGq0nce77lYlGQzPXg0ejeXvJTd7e
	LdMWrzY5QNr72rlG1NgcJgKUkjfKC1x6xgmfOp6DvgpsA2AadIPo9jUEZT7uFwTC
	wVPmjg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y3muw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:03:49 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-40411c8cfc0so1611870fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769609029; x=1770213829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KKkXPBgrqbkwp1MsXVuHY/hDJf+7uos/XFP20HaG6iA=;
        b=FRk2NgLN8lU8deKj9vmXfBmu/J/Ix0dsCzujbFgfkjZIsDoBwQMo02d6/Bjsqui6tL
         2N04wAo2jr76kBw/+qI4yzvL0AZK4g/I68xy7LmkBRhEJ3FaK3qQKPX5sVBRcb2Ze3m1
         /2rIfqWAVjJF7fLHY/SHObYhG0wiOYGGx40Nlr0FXkDxH6u3JI0G8cj0GVUWZ8ejYRgB
         k6ktvNIkIW1pZwHSXr5MKYAesa79ghOe2MYfL5UiYts1RxCYjvDM9TZToOCpOKPn09CO
         SJPE3f6ZKjnqfnpMXcR9ZFsrzKu6cyU48+CWLdzXO/MVRM1dzFPRq1fhZYT/L96C2/0E
         YYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609029; x=1770213829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKkXPBgrqbkwp1MsXVuHY/hDJf+7uos/XFP20HaG6iA=;
        b=pNiQrZtEjwafdv26N6Nc1W8uIQi3RvnBoUDM26k6YxUV4efhOmsknk3jHLTKoyKBfg
         kMkyqDq6juBWsxkLqp5gIA9U6MVu6DXT/B1fRKS5KB9QqmTQPa567GIIi0krkQNqR95C
         ATkQUb7hsy621xLmt8+OMXleGHQgdw6Ehm4sH9WE//j8kUbpXM6UeFQRFt2uGFtTRNF4
         r9E8D2+/cqlA5dme+Ewv+RRMnoi6OfXQTqy6gn43RT7Dri1wXijXJbcVhWbGB00O7oFp
         qPwv4H10iLOA0X2jCdXWRao/TbwsSPTkYiuW6ma6eIgqM+NNEo/qxkkUYf4dcfBBkOFi
         Zpyw==
X-Forwarded-Encrypted: i=1; AJvYcCWiqXtLJvD6xPWgUeCLwqnd3ZN51mB9xwLJ+x0dGPN3LHIOGLKW7Wewr7ogYXKSnWXXM4tPCb/YlyYSk7zW@vger.kernel.org
X-Gm-Message-State: AOJu0YyCmPIvWhcJBspSEhtku69Fbcz3VpWIWvzFMEi7GRLC8NPqyVry
	yUaeuRozB5qwNOIgvjSc6VW0CtXh7VYdIOMlB8nFbvAfmvhtSBpAqJLbtvIqOAHgNABZ2w515g9
	lx0UH1iDh3CsMyEVgD8mcSq6zaKZUqSS4qXUakCWX2l5ybv35Un32tTrF+JYf5VKQESZG
X-Gm-Gg: AZuq6aKzcWKZvR8Yj8ZoXPtGq2fuRCE+IskOfnMS97kjgW3/7bV7xb7ODo6bO6DKq1x
	qkY3agZ1CFUb20GvPxy00KvYS4yIvcYi/2vomypIiPrYB38+z6pCUV1sHpCQGpI6JcDMCNDJy1u
	IJ4Lfs+Ty9WMUhkSqn0CHQ7aBenSn+DfLBqKhOp9RUWiy6YbndgDF0wQgVIv3dmsizuW8QXrCkg
	BIkBZC2BJRolP4d87iIXFuc+4e+BxXAQElpbGRfMhPhYSfcTLqFp3yqHoPrTaDAEjtI0F+Z1Mzd
	yXFqSOh71wFRPEbHmQ9QYfNRE4ZRliVYiJvd3ObZJZRiFuKY5RX7we3lIxg/ozUf0xoSQwExbFr
	bTiWCxzgEJ6EjoFDpbu3K10w6UiBAp8ywf8KDWTf6imVtDCIhNA3YgjwCBd8nm97MsM8=
X-Received: by 2002:a05:6808:11c9:b0:453:79a6:fbf7 with SMTP id 5614622812f47-45f1a947b95mr85512b6e.1.1769609028964;
        Wed, 28 Jan 2026 06:03:48 -0800 (PST)
X-Received: by 2002:a05:6808:11c9:b0:453:79a6:fbf7 with SMTP id 5614622812f47-45f1a947b95mr85495b6e.1.1769609028161;
        Wed, 28 Jan 2026 06:03:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e4a9sm1548095a12.27.2026.01.28.06.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 06:03:46 -0800 (PST)
Message-ID: <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 15:03:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>, linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SUoK79XAe-4gkFVqwzpMhyXfkd4MX58W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExNiBTYWx0ZWRfX2SIAuJvnN0qq
 SmbMFLp9haK8C4g08vlpuHoGlVZSK6UVI3YQsLB/xfiBv/CWa3x6zCxQaeGcURH17A9MtSyftZ3
 6jhWfeBCtNKO5ZbKdVPmuywkJGlj2FZCbAQd5w8xbNFayZgmmDEjzyWpkSWrJyJJLSYcdgzRWmC
 2LeuNcuQ6HVOdgCigwVyzI5UHghswjgkR9+jSkfyQFpj3VdZxg+dsIK8qPrqPwABVxf9ovCawXc
 LgFQqKTPmoaOciY0Q+yU1Sm9Hk1xsmwQjexQumd5lw412Boa+9Jnuh2sO/PhSz4hHVsq3gFe/gt
 Sr74D4n7VmmzdlRI2RvUK2Q1Fg9V3/q648T+Bk+OYYPrFE2SmHdchZybN+i+aorNjbgMyLdeowh
 M0CmPn9cepqd+/SBPo8sVPeribW3tdxYtCMDoJTcnDCo4/cEJmWbGZFvJXhfSLVfCFxYD/pWCt9
 oh+1mKJG5KwFNjG0DUQ==
X-Proofpoint-GUID: SUoK79XAe-4gkFVqwzpMhyXfkd4MX58W
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=697a1745 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PBq3vNApJfUu6y03SUIA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91036-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 6A844A271D
X-Rspamd-Action: no action

On 1/27/26 11:48 PM, Aaron Kling wrote:
> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
> for Android, using mainline kernel drivers. I have come across some
> missing functionality and failures that I would like to inquire about.

[...]

> * Some gpu related clocks complain about being stuck off during boot,
> causing stack traces, but the gpu does work. I tried to do some
> research into this, but quickly got lost in the weeds and I have no
> idea where to even look.
> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'

I'm really scratching my head trying to understand how these GPU
clocks could not turn on, they barely have any dependencies than
"the chip shouldn't be offline"

+Taniya ideas? This is 8550

Konrad

