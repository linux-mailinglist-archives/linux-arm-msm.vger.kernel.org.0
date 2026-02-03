Return-Path: <linux-arm-msm+bounces-91657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHt9EITOgWl1JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:31:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38AD7B1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5AD4B3008D22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E157F318EC9;
	Tue,  3 Feb 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkyg21rS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="graTx+mS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0A3126DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114524; cv=none; b=nTnmyVjV+eBRqAxPq32PHcOqLNqKGka3bELGUGQyH2an4tEV0GEFkGfnsMpf0qQPV+X+LDXeQtxez7Iwk1FnSh+bzst/JjLwRgsWxeuqxUjgOlqwdiqqhI8SfB24c+6I6OXYpaenalTJRap9mm6kdBcgRdN7JkSBdurJ6QpheUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114524; c=relaxed/simple;
	bh=qEFM7daAPsJB3GfUD8Tro22tVIStm7Ar+14i/HI/sNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ap0qw52a522NeH9hIdDbRAMwGvuIYmKt+X3FUt5eUK9jHy4MjY007n1NpeuKjHA+XLAgYF3KWs8F8vfU74SnTjGokBVmWB0Y7xYyjXr736NlKhigs5YstW9S8UkuLQjAk5lnJKg6HZ6rLnWE35o4KsvVeDjG8UDynDIhwzL7K34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkyg21rS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=graTx+mS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134ZtT4092361
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 10:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEFM7daAPsJB3GfUD8Tro22tVIStm7Ar+14i/HI/sNw=; b=hkyg21rSCaTK8tN9
	YIqF1XO13sRRKKrG/XwM9PYI2csgViv8kJ+iJT6l6owrOfAgrQSw06WVKYIBkCG5
	z0FYc3faxV+9HlHApTQ6JWCkhqJSRPJVVeLADrsWmaoMCqRV/Y+u6ra1a0NiOJYU
	h+aOYMIC4KQqhCSRtlyu6vb58KcSj7lPudWsJbaTse/EBTTBoX3bkMRDTv+OU+1x
	JotFJe0oGou2am83Ti8hiNE8bpmf0auHh/xEwPQnZRowoM5wIBHAZVZArdy7QEFR
	qVQt2h0Em7C/sgJVWug0dmgwUfJhX1zoTpsQGk4hlr/5261/9ZkJZQo0g1pTf/j8
	vGslNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbkw7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:28:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a182d4e1so102267185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 02:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770114522; x=1770719322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEFM7daAPsJB3GfUD8Tro22tVIStm7Ar+14i/HI/sNw=;
        b=graTx+mSZXUe5E2PON9MFWCrq4O+bONQ6bvWp5zacm0/6eRNPkuWdn2NOjMf2wy2+s
         BISfDrKb1GgWzsP2s1frlYAdnRgOFPUGCZQldengxHIddRY7E/jsx/7TtvycHXe1itDQ
         2xgtE6q6FTvkKODEr/ZCAydAfIilAMSWKuo9e/FG/pxVH/DP575namMjhxVpu5b0KXL5
         +hOFttPZGDJt6oZZKt226zbhrLm/r4NY1p4ix0UZj4EpP6pWSbdyqKRWSLU4iyTFh6Aj
         M7sfoFxU3ETBZfIX5GGzI1woeylX/glAcrLRUtPUM6LLf4BlBSnyHsD+AxmD8ZUXn+wH
         nIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114522; x=1770719322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEFM7daAPsJB3GfUD8Tro22tVIStm7Ar+14i/HI/sNw=;
        b=iF8XmXkA1BXthS5EQidcpaEDYAAkPveqoWgVNIeJZ/Iv/Q814WeOFlCwk8nz65/hW6
         uMhRew67X/gBcQHqmSPW3FKOGC+odKfhgwxyU4nPdVYCmYsTUOd4+U3GSdyLTr9+4SMR
         S5Z5W3dTDXgbQ9F+RwaqFtvUS0rqgLv7ftQ8+YkI0G+RhTLcejpTLYtoMx5gUIkKnyZi
         TggwksjOhbygAj7z3/6zFeKyHeNjZYJkhBb3PvpmQVhcRK40RSECtCqNvjJ+FAUhNxvr
         G3ZY7dfAFaqpGWJ8v2/RyjfmvyP0QaEs22sHL+H3LT2ndWuhWDVGVElk83MKHazQbbES
         5Xhg==
X-Gm-Message-State: AOJu0YwkeQgzGdiycfGgsUkAa9Eb7IldCaCaFFDrnznQcQdR/0G2C5TO
	kCB6E8RTq3Ka0rhqF4UiFwjDaFNI/AEPvq0RTrox+TTKQFj+ksidZpYGQuWA4csTCg7Buo/QU36
	1MZHk3pIrYt1kjnz3+yrHzX9SnigLqJ2TjqPcHwDqw/ojqUx838RRqjSmRdk2PaHz09xS
X-Gm-Gg: AZuq6aIf89zWj/YrZ9MvhXS4nv5wnrBddCACpbPv4s7zzHZyeZhkgCyqnuFlwHxChq+
	AeS4+cJNnxB75osyn5egwV6XnaXzz9WKcRe9iyEHHvliPaUwZmLZSl+B6lBWS5BtNV1ipFcLR+z
	S+Cq3UhjLOD2R1Y5evL79qd7SaCXkCcanm3IuNYNesjUPGW4ToUPDVpKKOdVaQ2bOeG0wQ/BXWv
	ZuUJAsu/iKW8z2ThXY/IJA22YR2hmm/8uMqh1T80jaH4RMumiQigqDxxEhy005JFY96hrLbw+gp
	qRUshh1iMnwc5LSnRdx7NYfmwmsfIcozyeWftAaQhcbp3RWSNvcuR88kVqHsS272cJXlH324+yx
	IO7iZjt5erxBOoVXzwl8lcjuUbiy6wZKr08otPnkIly+TBIOlCW4VBFVgmKWBNRAe7H8=
X-Received: by 2002:a05:620a:7011:b0:8c6:a719:d16f with SMTP id af79cd13be357-8c9eb277e82mr1456673485a.4.1770114521885;
        Tue, 03 Feb 2026 02:28:41 -0800 (PST)
X-Received: by 2002:a05:620a:7011:b0:8c6:a719:d16f with SMTP id af79cd13be357-8c9eb277e82mr1456672685a.4.1770114521501;
        Tue, 03 Feb 2026 02:28:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc56e8sm1009803166b.15.2026.02.03.02.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:28:40 -0800 (PST)
Message-ID: <dd590fd1-cb73-49e1-8df6-4b3d5c57e053@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:28:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] remoteproc: qcom_q6v5_mss: Add MSM8940
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
 <20260107-mss-v4-9-9f4780345b6f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-mss-v4-9-9f4780345b6f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xRnWO-CnnWuC4moMCzroJ-9BzxoS_B1-
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981cdda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=06MASDJmLU4VXX63p4MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xRnWO-CnnWuC4moMCzroJ-9BzxoS_B1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MyBTYWx0ZWRfX6rrhMT3fvi3a
 jTrpZb1sofXgOq51VNbs47ZpfjI3cLkoA9sknFilcgDAFUmn42URfx6Z5Onf1kCCpRtmbbuuN+w
 o7dbNqtYJgbkm1zN02lso3F0GMVcKKmZ0LUAng+RfWwDko3LQel2LqRJwtEnHVnnHbgX01zII6L
 fqyq+EGxOhiRe9YZbEeusqjPOsl3Mu1Y2QK8lRGq4TRrmUb7ztSsL44bhZkEiK3wB53X4SkOiuM
 ohttR/7w8l2R5YTmd2khpsH+vUJ/ezebzbQjVh5hF05YDmdLBcXpNGlyryQKbDvrh0ZaosVj6ln
 djHa5YBhlqjnf16qTLgTMy7zak2j9dM/YQOTIxQS1Z/J+Y4dACta7vdXSa2Jg7CJ3AI2jc5FGT+
 mQ6Di2/eTJ0e28wOoYLJio91QK+5hfwakZ/aBXtjfKYwh5DxDqvMITQK3CVPAvRrEjZBVJ+X7l0
 DbYY9oVaV4kQIV+q+yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91657-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B38AD7B1F
X-Rspamd-Action: no action

On 1/7/26 12:34 PM, Barnabás Czémán wrote:
> Add support for MSM8940 MSS it is similar for MSM8937 MSS
> without inrush current mitigation.

I'd be curious if we can simplify that by skipping it

but

I'm not willing to take risks on skewing away from the existing
well-tested init sequence on a black box..

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

