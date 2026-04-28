Return-Path: <linux-arm-msm+bounces-104983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEC+DBaj8Gl3WgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:07:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B21484921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E32930039A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2513FBED9;
	Tue, 28 Apr 2026 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/x+cIQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVetHQKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD923FA5FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378021; cv=none; b=hna4h7h60exKo6j8M5KWMRGtAzhkAHXV7bNxv/fXHDwx7BA0JDZ0SEr95xviZm2Id7wNR163cq6RcUQA6C5aI7bPmeru8RMv3ovZSjYWvnY3l1V3TmPzfP4gxSdLxmwOy7CDReY+DDe1T99bbnL/X043fyN6+O3cydfFWy7t2n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378021; c=relaxed/simple;
	bh=lyk4P6BlMyKtxZuhADtGbhmpXZs5geBXVLGI6+lsIT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3wv0ljQsYMMpWFzsdHOWWZvxn7U6wd7hH4t7NenbfW2Fs2qEfqwp9qbdUza3zktN+0Ji/akkLecX4/WBmkzX36SvGxhUBYbVSZHEY13PWcmJYJpw7ltg1XrO91Wv/rnFM7y1OXd0twgUgbfCx9azsuV5w2NbvJEn8coWqNMM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/x+cIQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVetHQKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA44533275414
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=; b=T/x+cIQr+Qv+875b
	4tN02qN3qjL1MlIosGj1vGiCxLn1OPlk9EIcofEYFFDCMh4wEOxyKSNf70x9uUTX
	rpKyEtPAT5okFIPOOsBhj36GIQCln9sBelvDgp631LB5j1Noz1bxLRO81UPGiauf
	cRuq6OOGbi9772xF41C4IphzUeRzNNrd+bpHXJl8aSNKDFelo37mqTSgZtwWuxDB
	I8NLT9UvRi/INY5U8d0PIYiHYjyDWQiMnqEGbmAsyhncNneAJYtB/45V/UsuG/tn
	nwy53YvTPKpZb/Lxu5y4PCRFptOLpy/JblQUUUEjC76gu0HYakYaVapwt0N/q+mT
	cB4JUw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjge23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:06:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56db8ed8e40so9683746e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777378013; x=1777982813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=;
        b=EVetHQKZsI7tEQE2Y8jn4k4WYL4HOoklGYBZ70GIb/t6s+RBaa5Qb4Z7gN9ODnyLaO
         UsLXL3zr3auZlnHSHn7XW5Kf2Cy+lDn7tpgnyhh4SdNdJuER1mrdajSucJrz/ZfJPShA
         6YuxaHyiG9fG5e2Vic0lOMyCwO8sNtLQ6oHaS9ipUINO33c9iIIvcL+MVqM28pheIxiD
         gJe/LEg9SjgamK9AgQDhzQk7UtxniBSRtiVsyyT7p+24G7MhtmBRFABhnB2C3C/O4vQN
         KvHPtcgfFUFamuWzm92p+6Cm97HfzADqJe/3jbnbrBBkhPZ+lLfx25lfdv98VSW7Gm6g
         teHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378013; x=1777982813;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=;
        b=WVLV8VsG8zxJhvsKqziumv1+NcRWvwY42mLkZ/uEPok0PYGHe+GoAIaOczsD8x0k+h
         H+RMlwx91W5yaRTrdyKkhKJUgwQUk/qOv32N+KX6OKwEBGHXzbRuh13GBhJzrKT9F3jG
         XVowcotTFPVyfkLDu0wjA4eAdb0b08Pijy0+8RRqyC0cZ1WYKLkcv5dbKzexMU5m/TJJ
         Z0eBDF++jcppdMgeZX9g/TqM51L6o76ejobHcOvGt1GwQDTdnqmtjWOazaqfu56bOBDM
         z0Lts3lb3kYLgyMb2zWqmZXo71pUcQ9qB6yfp8+dRWiD2HdPAYpp5PFKXllS3BDCgzHe
         gKHg==
X-Forwarded-Encrypted: i=1; AFNElJ8sZ6aihFTCSB+qHq3lRySWluU5lcbZ5o3zmRJeR7DfrBiXxVl8dIY0RTefU3DO6PHsWZcOaoJyflUQ001j@vger.kernel.org
X-Gm-Message-State: AOJu0YwNc+qnGZOEaaYi3ueTPdw92huPwlUBFImwzFstv26yE5bGnpNn
	JUU2WDCO2ECckve7a+m5NEiflaKjpFa2Wzw442PORTgaDZcMi2CMhx9xTGLiSOLEzlvZHfBD+3H
	5m0e1+KbMOMDXlFCs/xFMTWS2gj4X7Cb0JSjw4SB+/M6fjv3Va+jvTo37IC+Esi1oeeqN
X-Gm-Gg: AeBDietWNg6iur5+nzo0ge5FSVwFmUNhtSz91RcflEtjc32XdeDil9u7IGD+RP1yYBi
	m09dRstN8uXj6M/uZ7v0vYq0XzLK1+TXT1UlxvGNuUbpjepXo4eHHd1tyrqa66ETrjXDi6InfKi
	yUFGCznqGC8mqpTDr0nKv7ETy8WiPtD5XPdCEbF8Oe+Yuu0cOgtg1n4gH69IGHliK8vmMibQLCP
	JFmXgaPRQuLnn926IxTmKYf2J666VTDe28t5t5kjup09jkPCAm8/K6hwY4PaLvuaYuazUaYBx8h
	Mb+KceV/H1TzGqhtyK9HrE8zRIk26FB91BZh2MbCdMmkfy8SyR6h8Dq8Pv48WhRQbF4ffwAiPTs
	jqsN/1gy7n4CC0TZa7F7EiiV/NWlmLb2IiavHfWWNJ5wO3fbU2LkRr/RdQT4=
X-Received: by 2002:a05:6122:4f98:b0:56e:d2dc:9bc7 with SMTP id 71dfb90a1353d-573a5596190mr969544e0c.5.1777378012674;
        Tue, 28 Apr 2026 05:06:52 -0700 (PDT)
X-Received: by 2002:a05:6122:4f98:b0:56e:d2dc:9bc7 with SMTP id 71dfb90a1353d-573a5596190mr969499e0c.5.1777378012158;
        Tue, 28 Apr 2026 05:06:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a775f7807sm17428265e9.29.2026.04.28.05.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:06:51 -0700 (PDT)
Message-ID: <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:06:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMSBTYWx0ZWRfX8nk0k0V6k3Py
 aY5Z+oMtsH3pRPPkcYZXp9XZUbwe2925GZVq0dQuBkSc2H4vQhiw7jRUrggvysghjPtOEBPBrpd
 dTCucNQIrzusBmqZ0aDFKauXkmFm7X8UXh2LCpRlvcR9v3rjsfZOt+Kq7W9ynlbQ1HM75Mw5KMS
 UGeDXeMVNsf0YNL+rh/n75WHE7+FLnz5ch4/n6KA3i8SQv0EX6ZbkHWYsJvIIr7rH3Vgs3JiHvE
 XFLtdYif5/TApbllELW+g5TjzNRwbyg6VcyHwTsA9F7VcfKzCOP8h9spKYGEsHlvILHqV8rb5l9
 ATzAmBOtuAWr53+xHibqZTCMJ2aTPfArnCWIaH+aPUxqCfn+vzCO0C65tclS+MPww69Daw6yU0s
 DjIqEgHFiDHWqZ8LcFePe+lI7CSOMKt7RpPINds1FmlRyAor51hixpt+l3WvCkD3/Rp2AHLKjNm
 +XrbKdsL/KULr1q9DNw==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0a2dd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=H6Ehi7c2N8zr8xo9JnwA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 9iCaQfMXXdOJwGHpYI0cvfgZ7aEf-afm
X-Proofpoint-ORIG-GUID: 9iCaQfMXXdOJwGHpYI0cvfgZ7aEf-afm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280111
X-Rspamd-Queue-Id: C8B21484921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104983-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 27/04/2026 22:18, Linus Walleij wrote:
>>
>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>>    platforms, which are already enabled on qcom_defconfig.
>>
>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>>    time and feels logical, because if one selects ARCH_QCOM then
>>    probably by default wants to build test it entirely.  Kernels with
>>    COMPILE_TEST are not supposed to be used for booting.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Way better like this.
> Reviewed-by: Linus Walleij <linusw@kernel.org>

I think this should rather go through your tree, because new drivers are
coming and some other changes from me might be touching similar lines.
Well, defconfig also might be changed in parallel, so obviously someone
will need to handle conflicts.

Best regards,
Krzysztof

