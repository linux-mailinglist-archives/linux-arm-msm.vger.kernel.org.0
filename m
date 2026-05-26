Return-Path: <linux-arm-msm+bounces-109751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOZBIVtbFWp7UgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:35:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA105D284F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97A33300BBA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00733BB673;
	Tue, 26 May 2026 08:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfvsJ4JG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AN/d2/ea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611AB38423F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784537; cv=none; b=hGwqLIBgYWU0gwYyiaOoTwd9PMNn0NDbr/Tj2yqDpU0B30YrstXaI8twvxBqSCxvl3mFy3i7Z3g5PyaifOA9kHIa3QgzjcbaY5IR1sRSj8lytDVwlNo6Seqa9ODJHUp3whDSn/i2eyM3LeTSysKTvStuINTYMJXJ2ajAav88kpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784537; c=relaxed/simple;
	bh=W0hMroCYS5fbz9f0gfltAG8CqfsGAO0JiMRl9c/r31c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMc340J9cubFWGkhwUt5jOoUJw9K7gNlt2ISmlFs3qpsqPxvCj2cBdP+3ivthY4ee4M++TFerQGJMnHd90viTwTgUhSuLffBYQLpLmNxC2M0kQhp+9bt9I03UnT+9bhcwbfm0aCISRKMdOFpHRY9ffgMPXUqi227uZJtR7Zo4Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfvsJ4JG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AN/d2/ea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6VdQo2145815
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxN7uZ0WxSxkaNekTFdgi3oj+0DA7+48Vw++MklSwVQ=; b=HfvsJ4JGWoXw1fuD
	Krxf92uXqUokgbUoD/JC4DyGvFSiA39CXGRsv1WmMpYfPazMuL2rjuiY5eRfd0O5
	M62T2BzXqzeN8byKZABnSjRSU7sPVZSGgN51iGT8+9Kl+pa+0YUOUkDf+RSp+FaZ
	IsZUbTvPzPiMLbpmvjSvCaVVDRiI9quaaOxjwpOdkiiJkXeCOfSHOS+aZ1Mdz5q5
	GrfIFLY8I3dz1wyVXtXwKBisORSNB8vG+EJC69CBGzGBr2GaDwG9hPxOCd9QgAl+
	NvsnJJIOq/w4eqp9thjx5ooh85MoC1RgycqRCLWQvnbachSEa4M7lO747CwC5s8y
	/Ff+lA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv3rgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:35:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c827bda3052so14295601a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784535; x=1780389335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxN7uZ0WxSxkaNekTFdgi3oj+0DA7+48Vw++MklSwVQ=;
        b=AN/d2/eaT6DsFo5ubfRGCPgUMMz4IOlW1l+YeQO9t5wEktAwn8xbGIUSNYiFANSGzu
         Hr51hOtUX8mNEUvcWKFJjTk3VfczZNm//dB6/xw4nyFrFoy9XHJd0NrPZQIEyVh2wU8S
         9294BKKlrAAXcwuFbf0M9EI8HxoMzzbCc6g5hoCHfSkD/VtY8XmWuelyxTxlAEBC6jZ9
         ggzrrWC7hjWEYFB6wG2+KDxbmSehnKn33jhdm4r1mAtIEErhs5egNOzkb+vJAdkDdWc+
         CqIdDRsErsCZ3oHftg16SMYi5GJ2oOHW7EzlK8M/NUweyPFl0riGkazwOq1IoSLIvwwr
         coOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784535; x=1780389335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxN7uZ0WxSxkaNekTFdgi3oj+0DA7+48Vw++MklSwVQ=;
        b=cMpWliQQnHR6UvzojI2TU+JisrZEzW7PBGscZJg8lh1soVWEUpFFiqGAhE5+JGtWAL
         fj5WWlzwYcWc0X+IjfJI3+bu+Zc1CuhLJ4jRHMkp+571KpTWJvJ+dF3riX/UsxtW5s+n
         V0/fdn0+EMF/yDpGfu6uYBnYQun1zsFEWeS4QM17ZyRjnbqDj85dhaOYIkrP1DmBNmc9
         l2a6GUf62sIKtVtRjg0AR89EtCE8ebQd1ZfDweInWtT7DhRSzNTbvbBkvg9sa/8oBpKh
         UdPxTbTmbZ2GG7FPaQSU5ezakszXbfePJ+5Q7yjJMkKYp3DJeJi5cGPzsJe1e/G52xtY
         FVSw==
X-Forwarded-Encrypted: i=1; AFNElJ+t8bIW9AIEGko+TvtL+K4BPnHTrPhWxTmtFQCI8RTMc77GlwNbFW29hEMVvQqB/PFrg9T2ChSVyjkDtmIo@vger.kernel.org
X-Gm-Message-State: AOJu0YxSKUX2lPzP1a/y6EE5nwqzVhxHZVoGfd7pqyZNl4SY7xkSCgql
	kZ4/s+vH9NBFYTvOwZUguPIfpswcsHggK/QKjd41UpXoVuerRmokz32d8tXC9OI7avK7iHgarY5
	Nok1VlkLMnv85zNp9ZZKZh9I/hJPdiAqoAH9/3Ri0wwgbkoXU/16FnOdHxEZKkP2sVsBP
X-Gm-Gg: Acq92OGE4LZWPY6f+7QGk46fH9xDAPWY7l3g8u5o7gbukiKHfQ3dsa3gmdlfHEbAVRa
	Qn5tXz1Se7FJpRMkw3/JPU9d0LXY0EyhfZpgSnnv9AQ2R20gtL2Vbs0qMfCTS+Z1iLzYsmFt3+K
	30MoHwg4tVYjzX5dXyjRvHTMDQ1B5GYEUMftp61p4lPkFCoJU0PQV0FAEmJrqXYjF+jBYYT6ci/
	2RgXAcPFpZQH24NtH0ky7tEm4cpK8dJJzpktZYTSHN6+T9LFpfV20K1SlB3Ho+OaLIuhpWh59JA
	uVotz5MMiIzE8UR4mxlkr66n0phl32irGcgMgXzaV8bPXf7q5aRfkBNsFQw5cpquYuWKGaLItuF
	YGlmCBSiYGFBklEQkYViKLaNLGjjP6BYtzbzr4hQB4j2Eqg==
X-Received: by 2002:a05:6a00:3a0d:b0:82f:3828:a009 with SMTP id d2e1a72fcca58-8415f3b0771mr16934555b3a.3.1779784534867;
        Tue, 26 May 2026 01:35:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a0d:b0:82f:3828:a009 with SMTP id d2e1a72fcca58-8415f3b0771mr16934512b3a.3.1779784534257;
        Tue, 26 May 2026 01:35:34 -0700 (PDT)
Received: from [10.206.98.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009852sm11859079b3a.59.2026.05.26.01.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 01:35:33 -0700 (PDT)
Message-ID: <02630778-a16d-405e-9ce4-7076d14c06b2@oss.qualcomm.com>
Date: Tue, 26 May 2026 14:05:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
References: <20260525124222.3082420-1-anandu.e@oss.qualcomm.com>
 <37zqhqm3ryyigcalimems2xvy2ccq3eyssls2pqx4qjufx57z6@w5kbehynw4h6>
Content-Language: en-US
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
In-Reply-To: <37zqhqm3ryyigcalimems2xvy2ccq3eyssls2pqx4qjufx57z6@w5kbehynw4h6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfX7/Q2VS1i4Stq
 9lzPZ/8jCFP+JkkeLCwi8+0XBEm4Ph6TJeuqWz9GPVKQLw/0zDefHv7tug/T96W1Fizz8IQEEmc
 cDd5pxmZpLNAveVYNz3Yl5e1U59JbvVVvShIi6TWGIDRR4I4HxetjSFCR0gWaHsojy/JL8pJtlD
 CsZ0hPV3Vj/pC4cYSfwXTVFLY7+J+5LCZKZvQK95prZSftK57Kh5UdTQ9eyIjQ1z4jD5tsuUI+t
 IDvO8VBU0Tk30aIU4xr8Z4/ccMUkIZ2xoY5K6zHWVE8GElz0YPMIsUE8UDSg70bDeE/uVnVIKBG
 d9VkelojssFWJKmRKBVjeiiSel3wzNx3CtilEjNTgTOOqJA/nES1TM/tiXGAWS1ocusKnH5uN1p
 XU0KaqyiWLzGfbFsgGUdzkN1Sf8Mhj17kRgCDk8HgyYHCJc4R9NEIwG283f8Ti7Gox0l69S6R+2
 25THt6zzNpV41LsIhWg==
X-Proofpoint-GUID: bi5pvlM3aTfU_Bkdut4n2CjXgjDjB_k9
X-Proofpoint-ORIG-GUID: bi5pvlM3aTfU_Bkdut4n2CjXgjDjB_k9
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a155b57 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kv5pTRVh4xdshmm17rYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109751-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DA105D284F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 25-05-2026 06:58 pm, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 06:12:22PM +0530, Anandu Krishnan E wrote:
>> fastrpc invokes work by sending an RPC message to the DSP and blocking
>> in wait_for_completion_interruptible() until the DSP responds. If a
>> signal arrives during this wait, the syscall returns -ERESTARTSYS and
>> the invoke context which holds the in-flight DMA buffers and
>> completion state is left stranded in fl->pending.
>>
>> On the next syscall attempt (either auto-restarted by the kernel via
>> SA_RESTART or manually retried by user-space after EINTR), a fresh
>> context is allocated and the RPC message is re-sent to the DSP. This
>> has two consequences:
>>
>>   - The original context leaks in fl->pending until the file is closed.
>>   - The DSP receives a duplicate invocation. If the DSP was mid-way
>>     through processing the first request and had issued a reverse RPC
>>     call back to the host, the retry sends a new forward request
>>     instead of the expected reverse-RPC response. The DSP thread
>>     waiting for that response is never woken, causing a hang.
>>
>> Fix this by saving the interrupted context to a new fl->interrupted
>> list on -ERESTARTSYS. When the same thread retries the invoke with a
>> matching sc, restore the context and jump directly to the wait,
>> skipping context allocation and message re-send.
> What if the userspace doesn't honour -ERESTARTSYS and submits a new
> workload?
If the same thread submits a new workload with a different sc while an
interrupted context is pending, 
fastrpc_context_restore_interrupted() detects the mismatch (ictx->sc !=
sc) and returns -EINVAL .
This blocks the new submission and forces the thread to resolve its
in-flight interrupted context first.

This is intentional. The original DSP request is still in-flight and the
DSP may issue a reverse RPC back to 
the host as part of completing it. If we allowed a new forward request
from the same thread in parallel, 
the DSP would receive an unexpected message instead of the reverse-RPC
response it is waiting for, 
causing a hang/ unexpected behavior.

i am open to new suggestions as well , can you please help suggest what
is the correct way to handle 
interrupted scenarios ?. 
>
>> Also drain fl->interrupted on process exit and complete any sleeping
>> contexts with -EPIPE when the rpmsg channel is removed.
>>
>> Fixes: 387f625585d1 ("misc: fastrpc: handle interrupted contexts")
>> Cc: stable@kernel.org
>> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 69 ++++++++++++++++++++++++++++++++----------
>>  1 file changed, 53 insertions(+), 16 deletions(-)
>>


