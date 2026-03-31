Return-Path: <linux-arm-msm+bounces-100989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJqII7KNy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:02:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B60366A17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A788A30420BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA013E0252;
	Tue, 31 Mar 2026 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGmo2eZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EcNdnx1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ABC194C98
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947601; cv=none; b=ijLZd5R28raFYEpdPXd+Tz1j0EZpKUgCNHi++hL2zxdQHO4bMPgh5lWVwnhVPQQ0FzBOWRDbcEUwC4iWL98ikXKEj0Emtn1FSLvKmiFLlgFDYom/a0ekfD9oTzGp1I2we9WFQp8PcnTEhhNJ9Wm8hNyCJE6D/4Yc+PxF4JRRXb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947601; c=relaxed/simple;
	bh=Nw6CvUR4lBTq+KjmAXfNh9TloDcbkWqAc4JX3cArOOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CvSWiVQhuJXekW6XmVPBW/oziPv3+0vwSIh6noeezl6yxUTvbyOS0w8+5U9K2WVWtvD927LsxEoY/Yt8D95gVRTvrTFktQemzkoMclDoV+UEHuLLZB0SkLus5Br06+qk28mQFRP5RQFnn1p6F0RBOhQ03U91M+b+Qxhp4ehx6Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGmo2eZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcNdnx1G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5uZ9Y2408178
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+umjxZYh200XgoH8vUlqwPah+GLYkZTyQNf/mkkIb7c=; b=XGmo2eZPtkb2ZiVO
	S5g4n+UvjaNWH7wa6G2W+kFfuHbzHQe9u5SiA/3inNfwyA4HY7PVkPZNokQUxAoy
	IY8LbqMxmuTS0Y35gSdiuBb3S+jUmiGLqhKlgf9N9Bw0CA1aE3kdpw4Thw1cYAFu
	E4zyNp3sU57rxo7A7OQk30+kB14kGfKGld+aXHk5tYzKpHC1bSQYmNik62hR3UVo
	Bmyapy7EhUXWw6LpbzypwwpymBpUTdTFTdh+/acEAaGxcpeqETJTeS878WWigSbW
	wWKlE7SvB847dSV8dQh0EgTH6kfTnhXZXJH5XrD+zJj+sGdM5jWozJ5DaLL1/3Om
	b6JD2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80het9cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:59:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89eadc12c84so14903266d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774947598; x=1775552398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+umjxZYh200XgoH8vUlqwPah+GLYkZTyQNf/mkkIb7c=;
        b=EcNdnx1G29TUlKyYRxImSB6o4UY1QuoZJmkwgIpNOJ96cQ1jdfKV9ABHewKRDw3IhG
         Omr5qo2GD54pJ3F0PWtuNDaEYmz2H4vT/+AWEbhYBpyKuiv5rkBl1v59/zAsvtnjxfwI
         /2rzbGZ6HzfnRIy1qxz3v9ivpf8wHMqfBLdEyTcTNQSqKRX19BYHT768Sgk6F1RSNpxo
         vFLtZVdmss84UYO6Osc1J9WmrEf3vNqVv9FfvBNUB75j2sB9NXjmLcJyYHNJADrJ5JqC
         Tyg/MOv8x5M2hyGxp99ejNG1yhoxr/M6fKbevR2nvCacy31dOsJxdGCMqy1jUiOzDMoF
         iFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947598; x=1775552398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+umjxZYh200XgoH8vUlqwPah+GLYkZTyQNf/mkkIb7c=;
        b=Qiw9dhXZiAMuRX7L/+UFkpy6sWOcp86jHE06OCSnpUbVfJKaHR7dNznCvYBwmyZ7az
         c5NI36wdWqVB5PTdPW9aaVshKK2FsvvvpIXc+Fn7Vt0ViTw+OaaW+A0EbiX8wzhR4EmA
         Y7uJrob2RC0fldeA+sNm4vio+H3l3UE06U/J4NWmt9EjsIEdpDBqrD0MxQBRlZIZfbc0
         b7b1IhEWcMriLxqnoCpqYh7xo6WuXtoM4ivpAtFuU0RyIsV6aYSWeS+8Bj0XVdZdP6TK
         F+Ugf15LVikT66sLdqQWpTNdZ1nJcOZBtQmPjW66HMn3lB7YRNyfSMwdHMXfrcRCoTBY
         cjgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWOBVzfCE+Gyw7GnnYo58sGyMS+qD7/qIOaJxCtZaLgku/VQrKYZWUtVdYTpQ4i0FiV4mVqe++BJVUD9wK@vger.kernel.org
X-Gm-Message-State: AOJu0YzHdoqyhh5PhRujdhlFaq8QOzWaDx4XSd9FJFDn0Kw73RfhKz+q
	uoJCzd+qirvAHJ+oknhT7jQ6YCy974aMGHaamydCLsiAvmGo0B6Ua0TW8O7ZrIN5TdK8bDf46Lv
	V04oF1zq7Na6abfAgjj/gJhxyqS3VqhwZcpIFdm1GFJZYdshmDKNlmKgmAnFOAXIxHreG
X-Gm-Gg: ATEYQzy4DOKqP5y1vy2rdw+JlBgZcUORfbqFF+2roO2ALwUo/jtDBFgsmTiUqxoDYWI
	UJxK8fiZN+1kelHzwWkB4Yfscd7093zLYvdfxYlLNaP77jGOGagdFie5Rh9TmQLd/IwnW8nZ7fA
	iIh5Ua8IJgjO0jw/5dVpXiIzzqyFc9cFxQuZwxv+HLIOmuxao0Ca0lfTQ3HoplN8fV8iwHfPgc/
	NLga68VNnjZ9lv24ZW5NtC7IFApsPl67hyE/fOINa3oHA4mPdUPavaUOx5YLHzggJCkzhOLj5o7
	9CyD9I3QKj+eYmCoTnwUJC3NPNfq3d+Qt8T/8WR3S+MVZi+vP+6bl/+tpA7qUo2kzABui7A2qh4
	ChMR66wzAK6n4JksOi/qW2irQtA+prC40vYtRA5xHS71jSZwf/KTgDOgSX+BWBrLkUX+GOFyZ4l
	7ueEc=
X-Received: by 2002:a05:6214:1944:b0:89c:d5f4:7b34 with SMTP id 6a1803df08f44-89ce8f10875mr171583676d6.4.1774947598310;
        Tue, 31 Mar 2026 01:59:58 -0700 (PDT)
X-Received: by 2002:a05:6214:1944:b0:89c:d5f4:7b34 with SMTP id 6a1803df08f44-89ce8f10875mr171583606d6.4.1774947597929;
        Tue, 31 Mar 2026 01:59:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e33c0sm374730466b.49.2026.03.31.01.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:59:57 -0700 (PDT)
Message-ID: <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:59:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cb8d0e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lg0sPl1ZFXo_qoqoLA4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: wBo5MUW0EdT54OcSldhK124Ft8b6sO3t
X-Proofpoint-ORIG-GUID: wBo5MUW0EdT54OcSldhK124Ft8b6sO3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NSBTYWx0ZWRfXy4Wa9m1U/dyu
 L8jvxy6AHc/BjbFs1V2hN0zDZWby9o5BmUTClO5BQ3wnHXCdVbrWzv6V3yvuOPuy0llCpzyVhvS
 sjxSfPxW8WdL1h/5uR+5SN7dL5Q7aJFoKQ6OsA7Zt+TAoT+IYqxDoaoQskxFk22h+f7f0YFdGff
 MCK0xN0GBDkwNJ7WdHIoO4137wn+Cu1kiajaVpQh6oflTQrpH7xRc8ojK90k45vCgehHl2wuyBL
 9+LXljpA1gToWgJmWlr8YadimAr0f0KpVTewfrZ4uvmqeaEnP4q3BD+1WJXVkF4ejQsDNG7zwHA
 qGyQwfTr9fi34NQM3oJQqktHzQ8tnrv8vqptRlV50k8oNvaPPz46r6772yE7y3bTL4PaY6udhoW
 u8078fcviJD2RJnV5kJIepog5Vedmqsh6P/9dYa8Jbij9EaRLeley40JgZD+KqDrr+gHZh/pp17
 B0Ir/bz3LMdA0Tt+yXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100989-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6B60366A17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 10:55 AM, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> Drivers for SM8750 video cc had the same issue. It would be nice if new
> code is being built on top of UPSTREAM code, not downstream.
> ---

You're free to contribute to the internal template that these drivers are
based on

Konrad

