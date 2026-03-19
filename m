Return-Path: <linux-arm-msm+bounces-98674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zMPiEbW8u2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:07:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D87152C8588
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F15CA30432D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498BE36CE02;
	Thu, 19 Mar 2026 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOnVAmL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Usrvmur0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F836C0C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910948; cv=none; b=gGt0/HkqY7sCjbSqWNwRySMZkK6H4MMBIiAxFLftxxEY2fOqfAvNPo9EV9QM9B871OpCeLx32dfROtIz+APl+kypCB07/pszFjUwLK6slA0S+2cB3Oxt0Mq7NaKflFkBIDEHzP8XxKpjPYXn8bwOvNaDzh+SuBtT5LgmUceGG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910948; c=relaxed/simple;
	bh=rFYQ77mBbRdOk2Q3EJ203LJMJt4lPsFrx6TYibicFuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=db0O7hOYfBbjVH34NAbAY2GeQbJR/vEFKMxZoSs3bzlKmlzFstHjxTlytMPJ7BsHkf+gECMrFkOr0JN9PSWSC+WsyJdWD01HTgztj3TECFuTVgfDeH8JkM9IMKXgF7H8yX6wOE8y524efqZWbPKsflwKOTwHTqyCFd2xbPwD+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOnVAmL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Usrvmur0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740eJ2883726
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=; b=SOnVAmL3naEmqvxp
	wCam5A5ffUzxVU1QmNFR4kL3wVfl9kBJLap874hNnZL/A10nu8uG3NpMfPSZKbM2
	tOZefy7xFI7IbFBTZC3+UHFn2G+KuWnvWrGjNSSDg3WTW80omdEH/MQd8BVK1BtD
	WD3+ZiQR7pprQ8lVhbIgczFYijPq3rCfgPvdLMQXhuJwso9ZiGB5a6cgLIBossql
	PmQwNA2RP7CCoZ5Wnc2RXGqkpJHV3PRx4KY7bA2jduYZJnGtIsttRlXveyHJC1Qe
	VRqtCjpEZ1tbDfn/Q/uGHLwfF0hDJSTj25jpJpD3s8rZ4EZdpIkRa8Y9XE4RYli2
	8i55zw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyuu6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:02:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-602948972c2so9292157137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773910945; x=1774515745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=Usrvmur0ciM525rP5WBv/EbbkC28XEw/GrwJhejDUcrirKaj5EZymTeVwc3vA6DvJD
         /xQUZIqR+6DVrT0/K9a8JRVY9JbLG61L0awN/FA4lQ5+E0B1qoHNoJW4cio7w7HiZt6A
         V+8WOdaR4FmVIyezOj4VCr9hc+86Vlpz0YGjM4V1PWYWMXo4KCoNjhL5pp+ArliDAf7k
         zM83vrb3CO9bqHQ9ov3eu+8gimOieHZkbZNcGg4k5QoIWrk9rp9l2ijPO82e5PIEbZ8p
         /BORM4d7LL75+R5U+8m/BlJ543Xu1IOkQprykiO7KffWGo0fK6uF4SS7Hr3MKb0ITGEY
         jvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910945; x=1774515745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=OwpKkUm55P3xqX3hWNqyyS6jk9Ys+5wQfJ6Lzm3X7p5YYLKXGeTm1OzAAouR4v5Axq
         jlp6whcQOC71sJeCNvDPC+oy/Kj9VOkss8sHsQf/i90kdNXJ3VsjjiQl01j5/cUU0HOx
         3amhwhWilMUKewUOtLrmHmV8cl0qUe6pS3NnbmSuQXKGLM3dXlxkn+P76ZKG1bocVbFX
         t+2hjzV/h8Z9g+RkitSadMzW1PcRdSkMIDkeOBiTW5EW2Fo95WhZqv6qHYfwEiIx9F9m
         X5A2dqcIQyhWjcftfZQaSm2uGk9BEtl5XFdtvou4IoziiUHd4viDYhauTSAlmagZ03t2
         T7tA==
X-Forwarded-Encrypted: i=1; AJvYcCUmwkRoSEz+d/756faJp5XfI9JpG5rVCBsejkVjayhfZsz5r1Im1Zflex6kwtZ57YTeHJloOtSWH5BMYbth@vger.kernel.org
X-Gm-Message-State: AOJu0YxWnO78axrlweT5RYJiv0HHOA0U+D9viQipRHGvkdf7aTnngPvt
	6fbZsD0d7tEt7w/t+ZkEWeN2odk+spEgAK40SpHWbzuEEMlyZdZPa1xKEZAnAu7DA4MwsXMo4xO
	5ksjtm4mvH+8LTOEVpUskCC2FBf2Gt0nV9Wj0Je5SK/1YPhbapEpOp9dRniGcdH+Jl5Qj
X-Gm-Gg: ATEYQzx1gIhMVXvMh1fsYSbgKAcX91LyFgnnmswNmOlkjTgWTNgdLX965PQ8Is9apXh
	3bd34Kj7k04mLoexz4+QxWjXQoeotEYcFA4q/H0rNPn6KyBrwTAFNHsS7QgzZIR+fbsNEUPISe2
	7d6ZhJNu1gl4i7CAlqPzlNSWK6gmgRHFXdE5wa5sSSBr5A510BWNkX4i6Gl+I02rBay700Z+L5i
	qoqXzVLLLCJnzhjuAq0Jehb0dNBsucDTepUkj8zZwCVe5nCftvLmoP+DFn+Ga5Rinsf6deK2TjA
	ctTJGG1YgZF5EZ5ssWiFdcYwATfr0CqJXa/W6kvHlfkErBo3fQL2NfJrNXGWBOnq+neEk+pm5aD
	HPxqduodTPzb8x1dVhVFcyCWnVr1QiH+qkkFqr8wSHPrqShYh+B+KXNQuX0jOeZ7hmcCZA4ybVk
	IeWZNdGwJq
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1267001137.24.1773910945444;
        Thu, 19 Mar 2026 02:02:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1266966137.24.1773910944965;
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm48733435e9.8.2026.03.19.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Message-ID: <c26aad81-ac48-4ba1-987b-ab6c271fc095@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:02:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI
 service ID instead of defining it locally
To: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
 <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Si_hkL5MhD5eAFjxBc4eZEvjit5qBHfw
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbbba2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=BdGfMZ6iCwODMfnLSHAA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfXxHEMnvaA06Mo
 q5PSSmg4xSs2DkrwdjOxKwVDfNWVp9VFJCSsyzwxjEfcxoBEu9OeQtutYS028XXd+C3QgkWaiSr
 dpB0tq2YTE3Hg6+Qg6FBzDkUJdkKLiUhCVcOtWBewc58e/ZWduM6Yz3xXtMy5GCsVptd4imP2Vw
 CTqVSIMuZ5fEYfnRFDxOCdtKsmBzAZI8s/DaOdw2J+D6pYhi31qipb4qHGo0Y2tKDhXRECd0NzO
 jU1OwMoRLHPXpYGWyQblub1luzEqF/ZhC2AF5vTEIrYyzoZeYlCjh2N2ZWQL3tOEGJlX3Cdivzw
 hSjphNM/oC/n1w7NS7scyElWWxvcey1CHAq0Qo1Fy8UmfGXzGW1sdGFeKbAL3y/8hR6GyHYo206
 fgCfAPJzRNM0pmvWZQ2U6NN9BdYMe8eYwNlYG1E+AEWfBl3QxVt3L6BMs0pFGNrK+TJH0GN4iLR
 cqcyb4MPDCjllwRPK5Q==
X-Proofpoint-ORIG-GUID: Si_hkL5MhD5eAFjxBc4eZEvjit5qBHfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98674-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D87152C8588
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi,

On 3/16/26 03:09, Bjorn Andersson wrote:
> 
> On Tue, 10 Mar 2026 00:03:33 +0100, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>>
> 
> Applied, thanks!
> 
> [4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
>        commit: 95b6c029e56e4d75e2957ce7ac795da29415865b

Just a head up I'm not seeing it in qcom/for-next

