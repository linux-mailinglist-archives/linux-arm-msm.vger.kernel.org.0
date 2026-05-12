Return-Path: <linux-arm-msm+bounces-107131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIt7K2hXA2qh4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:38:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 224FE524DD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A1B930B6CA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA623CDBDF;
	Tue, 12 May 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtzqpOZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kh2ufj8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388633126B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603425; cv=none; b=A3e9tWE2vO3S9EfEvJO33ejhmoAj8Rd9s5yDlOvBY3YBS2Ia8WlMreIATf+97jgood8jqBv4eF9Jy6aN+NPyBro1lKf7Y6aLu+k/4C8eTt8xKjU1FFkpHOq1jV7Xk3lhfy2EhrKi3UHS4GP1Luluc5z/RoNr8szyJa+BdBUiG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603425; c=relaxed/simple;
	bh=mSfxCiVmd5Pl/gJXAtpaSJ8o/F2bS3jFnhBUWb+5CAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TohRW3GuIeofKxlvNhQrY42P4jh2nZuGUcnJDbrfoWUj7j0hyPGuOQg2KqD1g5kxuyeAenyFi4FE+ZUtar+oLbr/Qsn/0YWdM6gm3BXscplKFBQ5Snig5OdjLHnFe70xCKSXHxpB2QRnSiw/lwgnEugHDfzRYtdMHfq8bIND3ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtzqpOZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kh2ufj8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5NpC591953
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbopD8zp0138ilavAqzHYLSc0uSGjW5RH7Yy0c+EWGI=; b=jtzqpOZ7JbAz8LkV
	4kzKui/ExGO7vwstcOC65pSCtcDtpvmnBxhlpP53ByzDSKzCqtMvys0FGY2Q8KGD
	pH1i3lozz+lFcKqB3/d9eoiPsQyF0lSO08/EQ+79Oiu3WZKn8XSTn0iUmkbBlRLf
	toa65WMzMuoCarlIYJZ+xYZEQhmoi+BNOpLFKvM/WtW5x7xSbu7WVxqvI/Najf2r
	hk8F46TaBoaDh7gPoUTQA86tVyxXb9bTx+oNkwUUng8fRKX+RMs3BoZ/YVBm81pu
	eTkHh1w8a/Wh3snOGWZDTPCPsGQtXPN2oRKBk9raz2rdqN7eQezZP+KFlyvTU3UE
	HPyecg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319sape-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:30:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so4067367eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778603421; x=1779208221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RbopD8zp0138ilavAqzHYLSc0uSGjW5RH7Yy0c+EWGI=;
        b=kh2ufj8WUI1RsCD6rKLJyFQA2reZ25Ad3tiKkDact7YSy8KPnJ6ab5K/pEKtfqahGv
         QHTd9A8auMavQ4FESvz0C1Y7KAGdBuLf/enjHl5wGn1m26irIM65Fx0O7/GBqnpM5WzM
         GLnmqke9Yf547KXw1o3yDsgUVqIY77nBTlBZb0O2FfCmXg/peIfWMQuegasm7r5RdTez
         6aVFBukiS81anCN4R31Ch/q6NhiQDRVrTeXcgnqxcgXOsFLZUHkoeR2VC/eBWW3hyKtr
         fTpe6PkK4/+Lt+s3xH6OZZyIzEugNG0h8MsAWzfisK9TEyC6PJ2VwBFilbMta6zu9wED
         xIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603421; x=1779208221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbopD8zp0138ilavAqzHYLSc0uSGjW5RH7Yy0c+EWGI=;
        b=YwFjL/thL/F4FGAoQm4mXemX/tsY7egzkYyieChY08bdoWPkI50dcmPXsSZqzynYgH
         29pCwwbxYgiVSZXaMzl6Bia6WNfOVlKP3vXbOyjp0Zdw6HQ8TjfQ/PoplJWeUk1EHEIK
         XSCbmIjG5U3AawH7f0NU3+q4+oKzdgxrxJ7Gd6nW29tu8rRaKh6YyvywHSA1Aj7pHw1r
         QpobIiZzHBEKMvz3sBrQuTvbyDZbeAPHx9tIU1quve+/rB9jTL/tIW6eL7bg2TUEC/BI
         94pJrCv6EwqQ4P3SXd6ydtUu0HZsWWBcfRScMih2JR5e+hGSM9+mfbnc4WvnIAbKyydS
         gpJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+w1x3fi748kynpt5dwGH0E9Rbs1JBlOco+2wSxbKloc1NqGBiW4E6EC8xGCyc+N1n2+mLBQFiwp87pnyjy@vger.kernel.org
X-Gm-Message-State: AOJu0YyTq32nCQgW2od3JN41eatlldbOYnP30EBc+HQsqy2gWx/4EhXW
	xxPWI2jyWcevmB47f+gzEryyi8nmS+vzn0aSpy59a3cokjcp/SPoblDbG1l0e9WOutp39bnRbwM
	ePMvKmV7t85TY1Z5g5m7OpbmcACWe954z6EpOzBdR9DQwPiVnXRELbNMkGLWmMzEpSxML
X-Gm-Gg: Acq92OENUKo8LlQO12n5qrx4IO/r9GpsCbmMUmCjwu80Xbpxli06w07ZiOu7RUbC2s+
	snWTMDAASFq5ROIQOiU5x3AyYKVoLPM3hnY5D38tyftGlqqr4/iOPTJOuEpb9lBWzgbfD3rX1i1
	eA3F67fnMmx3ffyoogKnfCj5/XNtWJN5T3FhX5EG7hfIIbxppeWc7vQv5EXc6X0VjLTOMq//FWB
	veCAfpEHPgvHxxNAq0nfcO3PgTx9G7/gNuqbfifIgvhqI0GLK7L8Rx+jOMRejGut7Q7XK4Avx/u
	Du3q4vdqSszpuzVnchGOFVOvfSeV5Nmd+3AsDCrGX6smNL/1Ua5Ai17uHhf+pTnozLDdXhFMnG5
	EEZMB7pecBiac0g57gmO34nmTep/H11XrF1JSVa4LrqAglgNVZc587ROcqlYUe2OLO3k40dJNrf
	M=
X-Received: by 2002:a05:693c:2c0d:b0:2de:aafb:feff with SMTP id 5a478bee46e88-2ffd57c44f4mr1968044eec.2.1778603421381;
        Tue, 12 May 2026 09:30:21 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0d:b0:2de:aafb:feff with SMTP id 5a478bee46e88-2ffd57c44f4mr1968012eec.2.1778603420792;
        Tue, 12 May 2026 09:30:20 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm18275305eec.28.2026.05.12.09.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 09:30:20 -0700 (PDT)
Message-ID: <53438507-7e27-4352-b3fb-5af84a0a1758@oss.qualcomm.com>
Date: Tue, 12 May 2026 10:30:19 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Address potential out-of-bounds read in
 resp_worker()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ruikai Peng <ruikai@pwno.io>
References: <20260414173249.3672053-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260414173249.3672053-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3MSBTYWx0ZWRfXzhytfAU8BSQP
 t0opUP5j5DO5S0HBzqWmdge9/B8SFjdj3Doga2xriHYMT+QX4++CWnYd8uUtVQseC3kTN0LN0BA
 l2thVOSgOiyNAVcePHv1/yFN4soIaDIF61jr3tZuJiUM03MwcSop2wcX2XxPMD7BSf7iew9cPr5
 lqzgiVKsiUMLbYTgwnnXTDUsDdgdeF3PNwDYHr6KxEmL7LSYsiEIHqKHtZs+uo0tPZdD/EIeLpQ
 fSOddHtRHzb1HSkva5odDJNMbsPSj3tFtD5/G+7U0Mx2oYU7hSPKMKDTVcD+fjU0lYDy5NvaRCE
 vyygzN3KLu51Oc3KWl0Jw9LFsLaoVw8B1u4OFQlL5J3JgQbUxpm4Zsrfq9FeTB4wkAVDEvp3b7f
 aYqitJ5gWSJ1oy6KxsLvrRMIRx+TLxTMo0nkqP2SlIcnmYHE/wPS3gkSnIm4JuKpo2F2cO+2LAV
 CsRZuKyqdlln0duFdcQ==
X-Proofpoint-GUID: yf4zvrZEfhb8cackCO5WF2IUUizXVsg4
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a03559e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mABdL3mHLo5zHP9Ps28A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: yf4zvrZEfhb8cackCO5WF2IUUizXVsg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120171
X-Rspamd-Queue-Id: 224FE524DD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107131-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/14/2026 11:32 AM, Youssef Samir wrote:
> Although 'commit 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the
> owner went away")' fixes the scenario it was intended for by walking the
> message and only decoding QAIC_TRANS_DEACTIVATE_FROM_DEV, if present, it
> skipped over the bounds checking code that is included in decode_message().
> This could lead to issues such as reading past the slab allocation's end,
> infinite loops or kernel panics. For those issues to happen, a malformed
> wire message is needed to be sent from the device.
> 
> Instead of duplicating the bounds checking code already present in
> decode_message(), use the function inside resp_worker().
> 
> Reported-by: Ruikai Peng <ruikai@pwno.io>
> Fixes: 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the owner went away")
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

