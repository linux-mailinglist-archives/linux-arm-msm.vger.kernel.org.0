Return-Path: <linux-arm-msm+bounces-90268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NQFMrOMcmlJmAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:46:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1DE6D887
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FF403036D7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1AE35C1B2;
	Thu, 22 Jan 2026 20:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEtQ+SGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EulSsu+K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519541487F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769114751; cv=none; b=WdPgKhB7YiLsmdCkd72nbqiutxaGq+qKOuNChyZuy/9slBioDXqZI5hC4nQNIjJgB7O76o2xs3Ft+C2knHF4JOvxbvSlKcOHf2JpolE69pVUXH1qzr6J+qgYF4GQ1zB0ou6uKcNpMiVfkqU/ivZ1/BTRWHLgjbTTWwGgFggYbtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769114751; c=relaxed/simple;
	bh=0pKbBSh2JzpgFzkx6hmXlw5OHPQlORbbXA6hYAFDFzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6jDPq/oYW9oGEJKww42lk++JWBQxDaPVEJi1rrNKyKG8PZ/9vyLK26rGh9N3fshZNxQ8SGbPHqLv9lBDXqYhjUmyglx/Lrz7UiG0L4frKcIbDC18XA10sXELQ4S2+iOyfo7RPNbxqB4ePSnkPRxNFQwoNiZvYkG7JSL4jYVlVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEtQ+SGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EulSsu+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK81IJ2442019
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WQjiwmss3eG5EHM7JOy8AnIRTT8A8wHEuVTlro+CnEU=; b=JEtQ+SGEOelux+gS
	vp7CvkuJfbR7iquAip3v8S8ZtdalSboNVDqeYZt6s0abKrJiRSf0xKyDr5WkePtr
	7pm15nhIO1W21dReRv5v6nIwfjex1BcaRowZEZZZDWP35/1UZTqn2RaboWCciYm2
	SVhGd08hySVfwEvbpiTFiYg68kaPw6RRFsgdXVOyXfAThop5cdpi9FGnnuqDpFRE
	eBySjpxEyvYHBpLmN5fHxloN5Hy4MS4IGNQdka9Jd26gMjB/nH0rXqVNf+SDR/u1
	x/d2YkJ9m2R5Hku5TQVXaxemFHxOwJemEBuAXJEBymC8ir3Yo2v1FaubI82a8hqN
	ba6mqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bjrgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:45:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c69fd0a87bso116411185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769114741; x=1769719541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQjiwmss3eG5EHM7JOy8AnIRTT8A8wHEuVTlro+CnEU=;
        b=EulSsu+K0knACXjJ4aBqpxls+YCR7X30DWRnkzI9TFGWg2HhtRfOMhbfBogSZV472R
         BkfdxayJjk6SOJgr18Wgizq+NmJFcJagLRVN2xD7CFvwelhVEQWWFMt0mDTz7554quj1
         aaLNqZ/AHBp+LrYyozD67Ao5jaTCSefeB0Os71T08koqhkjh3eJu8EF6IN5iTJN0XAaC
         E4Tzxixbe1Y2nplwqwStG6z8ODcXwKhoMqajFFytvbpGHuEcMYRsEoumXiB0SrmgqMhl
         hHvS/H56ihKh/Sm/XvnfJKgmzmW3MDiN6yv6y+Oaezx5lY4OhkVALnY08FzX8tpowrD7
         q8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769114741; x=1769719541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQjiwmss3eG5EHM7JOy8AnIRTT8A8wHEuVTlro+CnEU=;
        b=vAgnKyD1KK6j9VdJXfJKFQOKHeegHmdl7TWMURbiR96oBC7E/QZln5eSCzbCBO+m66
         BwkAGv65vtU4jWccHkCKwiVsmzjk7sX+fqaqtSdesz1O6eQcCHyclN1wvJobRNem+ScG
         xqnCbxmxH6Stiiv4tSKp3aE/1FoWfTpdzbJb/xsYBIErPHy5UQFjW3yANwYG+7r0HXhN
         ZTDGEB6NZBvOCmarf2nx3GAa30DWDuDY5Lik7WScCPwqF0QCckjqxpnwjWy7XmtEuLC8
         6Mm8/DT7LEMXZNILf5OsrTSRs8EziqWwl1STxDFpqhE5euZ34g/Axsloh+IEGQXa7keS
         qXHA==
X-Forwarded-Encrypted: i=1; AJvYcCXXBsXNqVygYX9srDKlLn9eezEp7n02RF6744XS2KDxNB413s/mOXgRpaAMTETl53rx4x466jcQngJ09suW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9vpC+Bv3F9ZMvgHDF/XnjQ3sg9yIGMWXCO5OtbzJTsuHs97p
	X9FmmA6/wOt+le1uBd4qOoH//Jp0mLSHOq9XoShDvg5gcwOzkutZGAo17z+mCZ1LFqpdAuW9tBF
	0jPYHL9Z/irji4UPCcgEY8YIOEZ0BKWlz60NnT9T9AR6jlhZIyFXgj6XRFuUIqu9OVOUk
X-Gm-Gg: AZuq6aKLvQM7gPBwTxNeV29Vt1KijS3+vMJ+3tT00OSR0JX4DdfGc2jbB0fVvZibr+A
	9IkxpaUNZ2j+aP5NjvxL8pHz+vXS6agbMJzTDAw1BO78nuPBUPPWEY8Gj2u50bWD8+CWaHYjfjp
	3KCd6J6XdtcvWV1iFb5RDL7C1bA/6fLZUMZ1ynIMfm4kDdKDxiBctOXqrW9NhkQDOKhrOYWINWL
	nGtmA55kg1z8d/aeOT1bk00xHybzsV7ZR4YCeEnqA8tuZQeDPblRvglX1mY6RzZC4RY2AQKu7ya
	TUXO6/mfDPQYMvkMuh6ydJcMhED1VcTo6KzfKdrKCLy9qyZCv8VZTwGnSHtULMFs3JfmgXkq79d
	UKb+jB2s0h1KXGuHhYpyfPIHt3EVL206LM+88He0dR0K0EZpHluq7ZxIA90Mc6wMLl3c=
X-Received: by 2002:a05:620a:3727:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8c6e2e3e83fmr74593985a.8.1769114740772;
        Thu, 22 Jan 2026 12:45:40 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8c6e2e3e83fmr74591485a.8.1769114740284;
        Thu, 22 Jan 2026 12:45:40 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3e0a8esm204343a12.5.2026.01.22.12.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 12:45:38 -0800 (PST)
Message-ID: <8c41e8a6-c245-45d4-9cc5-8352818a9ff4@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 21:45:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: add device tree for Xiaomi Redmi
 Note 6 Pro (tulip)
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, david@ixit.cz
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-5-morf3089@gmail.com>
 <d2aff319-d98a-4007-bfb5-8766e3c3c206@oss.qualcomm.com>
 <577de3fc-f21e-4ddc-8f22-57fa05f2ac34@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <577de3fc-f21e-4ddc-8f22-57fa05f2ac34@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qIcXRNw9q631VnvG6n9zpNAjo0trqrYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE1OCBTYWx0ZWRfX0j8060DOLj89
 4aEJgBLoVcr9GuX4Sq/mhAm9pyIRJWBiJ+XejGPFa1JqnPZ7whnOahhUvfUaiGnvbISA/yJh8HE
 4Gnr3cYOyY551pxRR5uCD6QH3J3eYIHb4u4n1nCBm+PnJtYxvg45mp6dytc23FdhRDj5TeuoTpD
 GnnlDOKwQZxG8aJS5dt75/LwLOjDbut2ZGkzY/35JguVdnhmPh22Og/KEzBsTht8UT/4cfnd3U5
 BTeuwc1NMDOqfgr0ZMBLJqpGSGVooyzskHmimDcAOlQ2kPI21cI7bzMe44gB2WGL7qgl2aTJjWK
 lulA00A/Ymbs/Y2e9WlYvjXoNzPnqG+GvJFon1ugN2QnilWePYylL868EeWn/2LiuHxZqBm4zjU
 liJpQsuaEXRUrMNxCiA6PYGj0ZIvHqspfj6WCCkBP6q57eU9Cv7lcHDcglHzFtRe+twjrlsDXz9
 pPQyKcNp96UftLL07yw==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=69728c75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=ra1Uarslx0ZMyU8JSW4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qIcXRNw9q631VnvG6n9zpNAjo0trqrYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[minlexx.ru,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-90268-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A1DE6D887
X-Rspamd-Action: no action

On 1/22/26 6:12 PM, Alexey Minnekhanov wrote:
> On 21.01.2026 15:42, Konrad Dybcio wrote:
>> On 1/20/26 7:00 PM, Gianluca Boiano wrote:
>>> Add initial device tree support for the Xiaomi Redmi Note 6 Pro
>>> (codename: tulip), a smartphone based on Qualcomm SDM636 SoC with
>>> 4GB RAM and a 6.26" 1080x2280 display.
>>>
>>> This enables:
>>> - Booting to a framebuffer console
>>> - USB support
>>> - Hall effect sensor
>>> - Battery monitoring
>>> - Charging (pm660_charger)
>>> - Status LED (pm660l_lpg)
>>>
>>> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
>>> ---

[...]

> Once again clover is exception here, all 3 variants of clover
> are using
> 
>      gpio-reserved-ranges = <0 4>;
> 
> I think it might be better to leave this setting to board files?

Sure

Konrad

