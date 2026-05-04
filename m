Return-Path: <linux-arm-msm+bounces-105650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Md2I8RP+GmQsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:50:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3504B9A3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18C8A3034BEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 07:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C293115AE;
	Mon,  4 May 2026 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfGwnj5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhvaUY4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5930FC26
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880747; cv=none; b=GAY5HXHlVDSVC8wwcjsH1WZN9ePXNseyUCm6HgZqZpeC+DHnxSg3L5FZ6oFYnyTmZJKhoeKJeGfA36cQSN+rBVj+ziTFhLvkUvfZc+VTHVHk0ab8xbHlqH4dkuSiuaZIrGimbUDgDtBCZGKZj4RLTyPz2mcq5o/QLm3VJCz1f/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880747; c=relaxed/simple;
	bh=/NX+up7++QBsfX+DKkSvYEgv8gH3v/yxVfCr6DOJpno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bj517/tXvW93dJlc6iINs3r2UIR6bgTfv0IUQ8mH5nGYYpIlKkAfBcLPZUAjLj5waMMdFrNGDDkmMi1XUh2hum9wwo6tQZ+tJcAcpiZakzOdOovqLGMbMbeBtn9+Xv/9u+dUvA4G02o4yaTJFrLXiK/4D87+KqJwaOcVjU1ZNjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfGwnj5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhvaUY4M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DIhB3470721
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 07:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FEhjnVz8B3YbTK0kWp6u8teq7DGCVzqV0sQmkfjGa0=; b=kfGwnj5PujYZ3NxA
	XVs9AaHavli2R/NrFOAeups3Ah/W9UJhAQnunglsHgdt78u4aCTIEiXgoiN5IMs/
	4xVBz/psEr+cLbsp+hF3cxSkb0C+VdO0x8wD1PutYG9vmNpM7Xns32ODjaLNbNq0
	IGUNkXgG6Z1OuoS5Jnnxq4oJqyN1mqndUAmFgSDRXEosdcehmtLQMebQTR1YF2nr
	GG9PF79Wd3QkfiaHAcjs9lenN3vcKdPQzXD0/rUI+le8+TYsKKDpLS4vw/vjQqoq
	9wDSmu5fK0uKqaZsRsyu80g6UrjRNeC8ZxpkGMkFcWb3w2PRocmgjljMxVdDTj60
	gHzRPg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9bvmr91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 07:45:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so4470048b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777880744; x=1778485544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FEhjnVz8B3YbTK0kWp6u8teq7DGCVzqV0sQmkfjGa0=;
        b=JhvaUY4MH5Ful8gNW90AIExiEZwIhKxj7l8bsH3e3e50nNyTVIIfWLx3MJeuo2Zy2E
         AmSpi0lwQOd2mJQzMa+VkXXhOIz+J5ANDHJl0WqM0JjiWEUsY/rmBdV8RK3PADl6S/qD
         cpEPW7Zbbju/6P+N5Hy+pQB1CCuFCdCJ5Z8A0vKDABFIU6orof/mKCR80sqgLv9Uup/x
         GieDmaRO3z/qeiV6Q7pW9jJRmlpQdqrtjrW7qJsPIU4jT0rOPs+AE1yqC+rGvcBz6vbX
         eWq6fIOmuJd6pD1RhAFq5jeNBZwFHniERg+ZguY8G3uoPmliyCwWEqCOqwJlS77COCAF
         2leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880744; x=1778485544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FEhjnVz8B3YbTK0kWp6u8teq7DGCVzqV0sQmkfjGa0=;
        b=UtaDt3n+KVLz6AEn418E4d0Sdsm4MHhoj60KHqOSnKwXVOb4HdDDpagExuvyHLqZEb
         TuhnvttnJOXd1DI6rJ2stx68fp3q7D+dJvTZI74d/gF6ix3iKe1CWZZCP3n2GV8etPMt
         CvNkW9e7UgCuQatCIkS9wPmGXvulpvnCsZL03qzzA59yAp9vrPvqIaidzA9v17H8yC73
         25ulcmM/jWMMOGk7CPWR9XbWduiVYLt7wd7QqdTJHmCcLDcnLh0LG/06zHTz+Q9QH2sC
         Chs8P7/lDlizzOJzIckjtOBRL5nj34CxSoxEjZLY+QMXTAwqg9veIgw0Ukt0UudXckZe
         Vw2w==
X-Forwarded-Encrypted: i=1; AFNElJ9PCxKkYpt4IgSwq72BQh8OcYI9D2jOBWQqu6eyX+4Y7rcUy1uaXv9GYKlNcXCLgzCX/1AJhjVQ/ZgS6gbc@vger.kernel.org
X-Gm-Message-State: AOJu0YykTdhhT5UAlZImlefGcb9YW/3Tn4grT8O6kW0sFpd5Pkud/06A
	x21TCkj2j/1M3fgwcCvT1Em42EGhLdXTnTVCgRWWC/oJJTv1Mcq7kmgYC8HNVv8yeu+mrsQswLF
	vaLUFCIwP1fsaxQvXHnxg4t7sN9MrUhbLicifTy9gMBONgwzq3VvNcKJ68UNdiOzVyhMX
X-Gm-Gg: AeBDieskwCWfq9G5FFKiwbhbbBjzqXbX2lF+WljdKiYIsxQJS4HB8M1+IaLxohjlp++
	UakrUBZtJDtp2CyZRcK6K+NYu6xnr6wdKxQgTbo6Qpbe1gtDcsBxsGjHe9mNNrEUMVsuHwo8tex
	wYjbb9BkSTVY8aW+dKjK56GmNkTQ42TNbqi1+xuh6tZvFAaKbjXMdX3ekn5XKUK8AIFZ4gx5AvY
	6znnHZj1kFdeVOZTedfg6PTnl9ZkPYZ7h5dlJADek4c19oNalgJkgFVFXMKTHkcEVm/n9NExoWg
	NjBbvB4c0WbISTrlezUPc9y+h27yqu+B96Wtydtx1sODTLkTtFrIUu4I4NAcmdsVi1MX+GPbYFG
	I2KmaKcTa8L8ieXVyPNga3T4zo9+/tDn/wLwiqnM+qSpjv0pI43al1laCdi0=
X-Received: by 2002:a05:6a00:369b:b0:834:df57:9d6b with SMTP id d2e1a72fcca58-8352d28bc1fmr8161747b3a.24.1777880743574;
        Mon, 04 May 2026 00:45:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:369b:b0:834:df57:9d6b with SMTP id d2e1a72fcca58-8352d28bc1fmr8161727b3a.24.1777880743078;
        Mon, 04 May 2026 00:45:43 -0700 (PDT)
Received: from [192.168.1.143] ([59.96.95.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b543b0sm10299368b3a.53.2026.05.04.00.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:45:42 -0700 (PDT)
Message-ID: <82bf6986-f3c9-487e-89cc-366bdf92022d@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:15:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top Level
 Mode Multiplexer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-1-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260430-esoteric-badger-from-hyperborea-1049ef@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260430-esoteric-badger-from-hyperborea-1049ef@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kuZpSWQRU25yEiPVe6FjY0Gv2CyOJoTF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4MyBTYWx0ZWRfX7LZF0rJD9WB2
 F4x5RtAzXMrRBx27VA3PVKGQjAdKtpxQSCnkB2fEJE0mcw9pOUkf3nrOhWSyvG1YsHQT5rE0tAt
 mMbdTuVe/Bh3rBc7REe7yAiFo4okk/oVuy5Xq4b8hdzALHnosM4Et9hnGx1Xf/ou9Op8VfAMcxH
 4LRhHu+Frt8M7ME91lDSq9qwbh79Zfm5cdCq0faZ2CY72DLuVIh7YZvqhfcZKSMHBw7EzA/d5fm
 dZ4lP5EEhLJRgwBsbP3rLdjukblOw5AAajJ/GNS1t+HYSMylX+0rkSGNZCMkornLgdoL0k/qM9n
 c9sZYV4N2EgA7+rR4Kvl+y7Vz8Rmfy4Kz8/Dh6kRRVkj9bL4ubH1+XjrHTOvjKP7cLuq7lnDec/
 x5+scgD3LxV2GD1C1hL7sQJ7OWsWQU0qz0ejIiFpi9ewrzf50Dd8DzkA5jGhl9XrLpFmQJF1n+9
 N0l3KJOKwF89vje3EEQ==
X-Authority-Analysis: v=2.4 cv=dqLrzVg4 c=1 sm=1 tr=0 ts=69f84ea8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=d18XUvOkrfNYrh/LwM53Ig==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=2V555Vb6lIzm2OLpEQsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: kuZpSWQRU25yEiPVe6FjY0Gv2CyOJoTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040083
X-Rspamd-Queue-Id: 2F3504B9A3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105650-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/2026 3:42 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 29, 2026 at 06:41:56PM +0530, Komal Bajaj wrote:
>> +properties:
>> +  compatible:
>> +    const: qcom,shikra-tlmm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 83
>> +
>> +  gpio-line-names:
>> +    maxItems: 165
> Further pattern said you have 166 GPIOs.

Thanks Krzysztof, you are right, it should be 166. I will fix it in the 
next revision.

Komal

>
> Best regards,
> Krzysztof
>


