Return-Path: <linux-arm-msm+bounces-91416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIlSF/NFgGkE5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:36:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E6EC8D5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC3273003D05
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97302F6188;
	Mon,  2 Feb 2026 06:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/whkhJQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+pIhGdj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9237527A92E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014036; cv=none; b=Mr8Pra+RvhlXZODQPyrl9asTudM93zzJ6SMXLisyCukb1u6aHRunA+Swy1MTVmGsjZAVr1KnBu/vdXDKZcqQlqotHvF/LuthQLfhfA0aJFQAobdTQHpkOD5yVIrRuG/mNyPEpFrOaKF5Ja1XkeY6uFVhz1shDQ5B4z3wL2Wic0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014036; c=relaxed/simple;
	bh=5A8MkJi0Ij6IEGxQSCWOeS9alDTiAmt2QDnFwYsFduI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Iqgg17BQB21+WuMCR5CNuFqmkUqOzePjq6+Fe26A7OOnjKKenTdRzxKY6V5z/jKbcYqeTv+gHPDPcOkFJ34E+wJXGKNBk9kg4Ipt9srE/u7HG4oLnCNo4XbKvXBC2pGmUWC9j7rQu9D2E+z7nNDkXqMiSMp0/BUo159oJVsqnik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/whkhJQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+pIhGdj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NuOBA1325781
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmudMRzI4gMTA4iimv99L9nomB2MGIhNGyeIOMqavVQ=; b=b/whkhJQ/csK2XSk
	dp69c0L3RKpWtoiQOYci4aoVNd0WplVf6npNfxyeHyTHIns1Li0UatUe+1ApAWTJ
	lZqQzUvM0iSobXYymulYseDqiGanKI26KD+zrA8y85d6swR1RHtcXHNInECiSAw9
	Ad8Dg1r3YRbTpLWeoeFT6q0O7dxf4C7okk2UFovm9hgxZh4ZBycsEBpmhojVueLU
	dCGZlrhiDH9iKFkqc5lT0Y2hX3kQxa7Sl/CfngiBxIvLiwI7zxVPwwLW7xlUl2qF
	NPNswd4CVwwyO5dZwFEpKpB3bLAzIY8WEg5qgaMjchGy5yIbKImD7tQm3Hr1QamG
	eGJFMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnv7fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:33:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso2208552a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770014033; x=1770618833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SmudMRzI4gMTA4iimv99L9nomB2MGIhNGyeIOMqavVQ=;
        b=I+pIhGdjCMo6WXmK7utkjuGB1zMBbCjhBCm8RsL9vF7MCHYaQo10hF/8Xb+bheWl76
         fnmIDaFcTqDoZy787VsjHJxynM44veHEc0y3aCQRrjSlH+HkpnScpz7egIi4/bodRaLa
         8osPKuZVFmsIgRwFzHicslUu7Hx+EnFeQbs0v+JImyUuLDy7h730mktWz0G7TKNaAZw0
         bGI1UucCeR7AY5dh4VP0FYhGi7qR0WIOOcBjUAicfNjJ+GTg1U18tFpUOmf0XIjZqp89
         9SO+DZVqOSEuRoPlh9vw08nX4onZvUwRP1Vm2Jrcyk0zWadxDGAaXNBW8QkT9QHIbCOL
         QHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014033; x=1770618833;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmudMRzI4gMTA4iimv99L9nomB2MGIhNGyeIOMqavVQ=;
        b=o6hPOaqiVov6/cAQUw5BYhHw0kOcT1Y7sS5yUEW6Jn2y3TiylmrUj2ZiMeJeagK96I
         mJAkHP64ciP8fQ+5S/wNop9zfTPDhpqjofJWtXL6JoVA1Dqk7IZZpHdHmQJgIJNx0avo
         TBpyWJ0DIoqmbGeChhmJ0M8IoayvQhKd9enP8oCbKeXrBCsSMDkbMdu+gVdP9RQndXMK
         7jzEkx3lJ++xtRV0qXxPwYXkr4Tq+aKFLZ+yJvkwyk5Q1M2Iu3iJdpQvL1sKfIpTCeVT
         3KnisX2nQGT8LLkqLOvvGkrVGja4/fZIpA92r5R0gPfSBOinF2GSnWzCQqCLJosSgc+v
         zTig==
X-Forwarded-Encrypted: i=1; AJvYcCWxVcAMFYl6wfXZph0pyeMjlu7M1/1vP+zG75+pWW7uM5xlbmCHfvT68ZL4gFg60DS2F578CAIiRWBaplBx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5D2Re3ackHikhZz0DbaLxWbX3xP5R3tI7GpdTVkovd9poemyp
	i6mK2w7qOGyFtwUWRHA3tGDY3odqwTpUzpUydrf2OhDOi0LZxMt8Baf28M/vO3w5T9Cw4yD2Rre
	hA6/H+bNt1JtsvR9a2fEISpHXCfXrDqVAENJurTmyBIdwunLtQhaWG9tSMrcxbMl8LOAT
X-Gm-Gg: AZuq6aISQq3qP939Bw/L/rrbqQon4oKkd7N8Qq7bQnLs9A3V97kHCPbRx/FgieXCndG
	fRN68k5rf24cW2l4djwDud96yY4/hXFWu1Ebtpqqn5I5b2X8CT1a/sfPhmDypAYFvltQlQRIQeW
	J65iUfG5R8a3l5WdPQSwlbJGcHYwyrpKWIotVlzn1Zmrg4Vc69KXNaG/Xvr8RIqMVWon1GP06iy
	B7z1OyzOFaWvzMy3CvDEkz270rHt/OjrP5KCBm4AeY8yytdsT9LSxMCQMOObZf0X3HcPpGADwvi
	kzMBeTor34v9L2+JtICDwnvn4onEp46cFcA8bQ6ICPlVcjIKLEDifztulcC9xyrjOouIu8IePK5
	ox+lvN5XBrGxFWqmtD5uHIsMcjxIrLdS4cQ1ODB+UwNTSX0ZyDchVosQbXTE7PqOuCNNU60okqa
	yrlAbO
X-Received: by 2002:a05:6300:404c:b0:38d:e87c:48c2 with SMTP id adf61e73a8af0-392e015baabmr10217874637.58.1770014033349;
        Sun, 01 Feb 2026 22:33:53 -0800 (PST)
X-Received: by 2002:a05:6300:404c:b0:38d:e87c:48c2 with SMTP id adf61e73a8af0-392e015baabmr10217852637.58.1770014032879;
        Sun, 01 Feb 2026 22:33:52 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d2bsm143216935ad.53.2026.02.01.22.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:33:52 -0800 (PST)
Message-ID: <9572d8a9-de90-45ca-903c-a11bc69d0213@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 14:33:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <6usjefc55acdchitwe3usqtkr6ca4rtaen3at5knwygakdkze7@caqxdadvnz44>
Content-Language: en-US
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com,
        stable@kernel.org
From: Jianping <jianping.li@oss.qualcomm.com>
In-Reply-To: <6usjefc55acdchitwe3usqtkr6ca4rtaen3at5knwygakdkze7@caqxdadvnz44>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=69804552 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=erMO1dRUYXsmLKenB8oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: BIgW6DZyUGxYrlxFmtNsk_WIpDHI7_P-
X-Proofpoint-ORIG-GUID: BIgW6DZyUGxYrlxFmtNsk_WIpDHI7_P-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NSBTYWx0ZWRfX4rShhh6OJnbF
 SDh+8t9oCjU4lLozONjcVGSN8ZmdxvvA20DJEiO0MHBrNdbMo6Cm61fIOHo+8FHIknobwccrQMw
 IEaXeIRGNe+0S7gMCGHe9OI2IrL48of8TDpAGdcKx7N3x0tWeCDqupRlSxsn/WzhEqalpliuvAm
 td6IMqj7MzkbCfCNFO+M3XXwhkWuOG6BOgFt02AK7pIp/5IIopLa7R2zHJRVzdibaYST5eOnh9x
 UlOiU4Gio+c4/MltjzCKkmMgK8Ye+MrShKdB9zIT+p4+3OS2NS/0buUmokja/Fec3CDwuj6f01/
 Tfv0omaEp+gM+BfvS8u35xXpy96b8D3hLAVH/sNhVqdfmsjcZs7LZvn0g3uANb1t09hjWshK08j
 YBM1vZNs9iufU7h5QKyPhoEvbGI9PXCsEX3yp+svzwm/NnDcJZ8J9j+EdOHo04CD5yooXuAXNY5
 3GrvuXipOGjsYwutxVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91416-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44E6EC8D5F
X-Rspamd-Action: no action



On 1/16/2026 4:43 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> The fastrpc_buf_free function currently does not handle the case where
>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>> dereference, causing a crash or undefined behavior when the function
>> attempts to access members of the buf structure. Add a NULL check to
>> ensure safe handling of NULL pointers and prevent potential crashes.
> 
> When does it happen? Do you have a backtrace or is it a safety coding?
> Do you pass NULL buffer pointers to the function?
Thanks, Dmitry.
Yes, this change is mainly for safety‑coding purposes.

This is reachable on during remove/deinit sequences when a buffer was 
never allocated or allocation failed part‑way and cleanup proceeds.

It's a saftety coding: to eliminate NULL checks on the caller side, as 
we do in a lot of other kernel API.

At the same time, there is a possibility that this buffer passes NULL, 
and during verification, this can cause the kernel to crash.

The patch makes fastrpc_buf_free() NULL‑tolerant and simplifies callers 
by removing duplicated if (ptr) checks, reducing the chance of future 
omissions.
> 
>>
>> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
>> Cc: stable@kernel.org
>> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
> 


