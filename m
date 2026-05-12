Return-Path: <linux-arm-msm+bounces-107130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGxDAkhXA2qh4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:37:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B4F524DB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA91F30ADC9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799363A599D;
	Tue, 12 May 2026 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2PLwgCZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y91BsQPJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1203054C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603390; cv=none; b=ZKRSHMmd/340HoK2tYq0bqoIAto9b/eBiDjrFPHenUSQVNxOuu/bxW3FooQXrBe4mhcksheJoVjJe7cYEW6yPNGCsFq8+XxOMTtZlz7Ly5O6RIG2RTpdtQhpqc9m44bawwnHZTvm+YBK1oYb71AlCiQ+k9ITnjsvaIDyA51amJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603390; c=relaxed/simple;
	bh=64zNau7pz5ZamhVZ/n1/KIJESNE+vRzYlVtXDSJC244=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajImMODIJImCovVybLPv7yVEhJuP4RkjbNwp4AAE6mSKgbpnMuVWg4tKUJoV1M/5qo7hlVYNXihJNycjsduGC1FRO6mkKynsJrc6l/LwOgUgf/YJVhzAMGRD5WlJi53reK7uSHNGEJlA5Q5+VhLyJ49okHkA5n0BLRhcbrY8UHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2PLwgCZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y91BsQPJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkZZc739991
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rf5cEOsHU26Tj1loSiJe663Yzqnhw3qt69APzldG4Hs=; b=e2PLwgCZVpzfAcQz
	s1Kh+akXdvWTtErOO3M4PT5Vsn+RtATSvZaHWQm1ePdtmQqtTNZ89ZsGOWruY3Dp
	tLBgEnOxn92xWJqaWX4Wy++YBxkbm6M7oMU7kWVeLF0ZZEmQUsU95dft5pb8gkUk
	+WTwe539lPXwTd3w0vMDQSuFhlpw30QvrOcpivsu1lLGs92GZ82KxvC+UKSr/fAg
	XZHP5Wjsb5JxM6ss5Enj9rB5b4TIi+FOzyKDJVvEZ0mYku6p93gi8d/NiOwc3BzJ
	mrnKuLTyXQ9bv/Vz2assfgSTyXLJOfUrTNlmj6l2QBZvi5H8NtsfuYyOCv2QASa5
	xpyxWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhsdsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:29:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so4065884eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778603387; x=1779208187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rf5cEOsHU26Tj1loSiJe663Yzqnhw3qt69APzldG4Hs=;
        b=Y91BsQPJsQuI5R+oIjnmvwY9d32gEZelREWwv8Lj90b74KvYg+17ijqrx3tpDvNCto
         e1RjSavgie0ho7HebG3Rt4+iyW8oPj4zB0lPhae6DMjGJrxVp4Fmb5YnR2rRJmC61vnL
         XW+PY9MWNd9Ui/Zw1O4izhxN2bdN3ybz0yGyY2jeNzoNENbLu9mMXVFyNWv0DiNDzOUQ
         WLJ68JRB61anfUY2SkMr/wqV6xtUJxXtrsjqP190kDKOTJeaWKspL5qRAu072GRNEI88
         vw3tMlMXOVGVgU5eI89ZFSf8DjB0ptICwlQ8ykkzwoj+qD/kwDkbpUbraZ+OnUORPDxw
         ADTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603387; x=1779208187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rf5cEOsHU26Tj1loSiJe663Yzqnhw3qt69APzldG4Hs=;
        b=qsG6VFQm1kOYQbBEIS+idbSPP7OFzgJ9lU//76+fjDrRbKapRYbQJojwf6mvGwHIvA
         RiyOl3rSdHGy+OGQdk5b2JZYbzzQptVuCpm8L96rnIO6iC9UV8m0YprRmWC+99Yo3+LQ
         NCT0aKuRnQwUsVVZyUExOMaIHvyWvhB3fNnURqQlkJYBqXnh5zHNaG6Ga3yTn0L8FKXE
         xd44/aK7iZo7XaYBfgWmUAJtXsdY85AN8hOSSdkfzyqXFJFCqBoudMyC5YtLZTcv/TKI
         Q4J8m0fm91YM6by08xU0vAxLebdazGhv0HT0owge9vHnQYObev+6Akah+k+KB/W2Q+sW
         DlUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lebvBD8B1ZUYcmQ609L1fh+qL6tKDmtOh8qSihqPAzHCC63+CcVz+SGLPydI0PKE79T7LdAkQZD+qMkj+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc611wx9lwUK2g4BKGuhLKe9/Sx+HLgUnJpTzDbar12WeCQaYb
	CkmoqSX5zkslQkMOFAvuNBAtMBuxW5/BXN4OfWkwv2tGHLhvP618RWsCTqDcplDLnj4Abj2dAA8
	7TjVd4Zi2qFSIawZ/JGiQUERdHdSeEced8Ic/ZE2PN8LGrb+QGjR+vnZSbjKg0ES4zQYrlbKRap
	Hx
X-Gm-Gg: Acq92OHe98Nc83V4AadXYJZ5skdoL+lgDwaMGXZzj8NinDgryg0D6vb2tXsJ6QfkovG
	X2goL5HOkzOQcPgbfk3y7GLsPSHAB1vXNeMOsFvW/U1Umjbh9GxAp4RxJdRWMo1w0eTymvuk5MJ
	xUzol2064upTN7s7ptFFwZwXJ7yFqsjwjZVAWVvzG/io0KSd1B6nU+HI+bE6GK59MhCRxmslZ2g
	K8juCVt9JTA5/Esl6V2gh17Y090tqnLIMxhg29ldWEVUBnec7LQNOmMB0yKhxDjzXxZFk0nYnw4
	u00bpBODAPdyWIjUe8YXwA5R+tkie45x/ChKG++kNHGsuOfy46mkNxqoj4PIgGVgx6u046YNace
	PxUB10V0bZcu7CaKN+hNqTC+Obp1ToXAApd/fjzYnKXwtb3JKQVc7jDnQZlb36zrqsMFPsho5kV
	8=
X-Received: by 2002:a05:7300:7244:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2ffd5cbbb6emr2254675eec.13.1778603386619;
        Tue, 12 May 2026 09:29:46 -0700 (PDT)
X-Received: by 2002:a05:7300:7244:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2ffd5cbbb6emr2254638eec.13.1778603386001;
        Tue, 12 May 2026 09:29:46 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm23165126eec.23.2026.05.12.09.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 09:29:45 -0700 (PDT)
Message-ID: <8c12cacc-ab86-49aa-b4ac-d80ef965b55f@oss.qualcomm.com>
Date: Tue, 12 May 2026 10:29:44 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Address potential out-of-bounds read in
 resp_worker()
To: Lizhi Hou <lizhi.hou@amd.com>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ruikai Peng <ruikai@pwno.io>
References: <20260414173249.3672053-1-youssef.abdulrahman@oss.qualcomm.com>
 <78a955ce-8990-8594-1ebc-e7d4da14dce0@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <78a955ce-8990-8594-1ebc-e7d4da14dce0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3MSBTYWx0ZWRfX3z95kNx0r1vQ
 pNhEw/+/mY6YM8tLh/xxRyeno/mPaEqX+x3A/c1I7blg5SaVK5YagICJtQAgi+mM7eD2hnTnJNb
 mLDAKgB5yKuTucb419YEvds93j1uGd7NSPZKzFSm9LNVY9GVKbVwPQVOZKkmFaD0WSlsqbxhgZV
 l1DUABghpIpEFJ/SoIaSOiGoO88nlGMoX1Q639aZk5oNDDBPPa0k7PkhyO4B1AjbA/z8k7U2nqL
 C/Ljg9H72wLk42B352BptzLLuCjhZsw1ynT5sd5woosXcAPyzEEGdnIhaymMG9EGfCBAy5A/sxt
 H+0WT5M7UiC7khGSQjn+XCR2S9ATyF18Yed6MsWHyuUtHC1SrIY7OSVYCv7eWh5tm3Anzzs//wf
 H9CTEvxe5hh4nCMNyuNoG4yduL8o4kRMSMypsWEjCLj3v7//YZVpnboOubf/FMoj9/f18uHBqAw
 v+XkiNSzF6RJMR9HZ7A==
X-Proofpoint-GUID: CtvUuhX0x8BHWG58_mflQCiY7t2WPX1q
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a03557b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GXTGxBg3FJQb94FoxOsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: CtvUuhX0x8BHWG58_mflQCiY7t2WPX1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120171
X-Rspamd-Queue-Id: 64B4F524DB7
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
	TAGGED_FROM(0.00)[bounces-107130-lists,linux-arm-msm=lfdr.de];
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

On 4/15/2026 10:52 AM, Lizhi Hou wrote:
> 
> On 4/14/26 10:32, Youssef Samir wrote:
>> Although 'commit 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if 
>> the
>> owner went away")' fixes the scenario it was intended for by walking the
>> message and only decoding QAIC_TRANS_DEACTIVATE_FROM_DEV, if present, it
>> skipped over the bounds checking code that is included in 
>> decode_message().
>> This could lead to issues such as reading past the slab allocation's end,
>> infinite loops or kernel panics. For those issues to happen, a malformed
>> wire message is needed to be sent from the device.
>>
>> Instead of duplicating the bounds checking code already present in
>> decode_message(), use the function inside resp_worker().
>>
>> Reported-by: Ruikai Peng <ruikai@pwno.io>
>> Fixes: 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the owner 
>> went away")
>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/qaic_control.c | 48 ++++++++++++++++---------------
>>   1 file changed, 25 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/ 
>> qaic_control.c
>> index b21e6b5b3a10..818a77adde2a 100644
>> --- a/drivers/accel/qaic/qaic_control.c
>> +++ b/drivers/accel/qaic/qaic_control.c
>> @@ -1075,11 +1075,13 @@ static int decode_status(struct qaic_device 
>> *qdev, void *trans, struct manage_ms
>>   static int decode_message(struct qaic_device *qdev, struct 
>> manage_msg *user_msg,
>>                 struct wire_msg *msg, struct ioctl_resources *resources,
>> -              struct qaic_user *usr)
>> +              struct qaic_user *usr, bool orphaned_deactivate)
>>   {
>> +    u32 msg_hdr_count = le32_to_cpu(msg->hdr.count);
>>       u32 msg_hdr_len = le32_to_cpu(msg->hdr.len);
>>       struct wire_trans_hdr *trans_hdr;
>>       u32 msg_len = 0;
>> +    int trans_type;
>>       int ret;
>>       int i;
>> @@ -1089,13 +1091,15 @@ static int decode_message(struct qaic_device 
>> *qdev, struct manage_msg *user_msg,
>>           return -EINVAL;
>>       }
>> -    user_msg->len = 0;
>> -    user_msg->count = le32_to_cpu(msg->hdr.count);
>> +    if (user_msg) {
>> +        user_msg->len = 0;
>> +        user_msg->count = msg_hdr_count;
>> +    }
>>       trace_qaic_manage_dbg(qdev->qddev, "Number of transaction to 
>> decode is %llu.",
>> -                  user_msg->count);
>> +                  msg_hdr_count);
>> -    for (i = 0; i < user_msg->count; ++i) {
>> +    for (i = 0; i < msg_hdr_count; ++i) {
>>           u32 hdr_len;
>>           if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
>> @@ -1110,7 +1114,20 @@ static int decode_message(struct qaic_device 
>> *qdev, struct manage_msg *user_msg,
>>           trace_qaic_manage_dbg(qdev->qddev, "Decoding transaction 
>> %llu.",
>>                         le32_to_cpu(trans_hdr->type));
>> -        switch (le32_to_cpu(trans_hdr->type)) {
>> +        trans_type = le32_to_cpu(trans_hdr->type);
>> +        /*
>> +         * orphaned_deactivate is the case where a deactivate response
>> +         * is received from the device after the user owning the DBC,
>> +         * and the message requesting deactivation, has gone away.
>> +         * In this case, only process QAIC_TRANS_DEACTIVATE_FROM_DEV
>> +         * transaction and skip the others.
>> +         */
>> +        if (orphaned_deactivate && trans_type != 
>> QAIC_TRANS_DEACTIVATE_FROM_DEV) {
>> +            msg_len += hdr_len;
>> +            continue;
>> +        }
>> +
>> +        switch (trans_type) {
>>           case QAIC_TRANS_PASSTHROUGH_FROM_DEV:
>>               ret = decode_passthrough(qdev, trans_hdr, user_msg, 
>> &msg_len);
>>               break;
>> @@ -1430,7 +1447,7 @@ static int qaic_manage(struct qaic_device *qdev, 
>> struct qaic_user *usr, struct m
>>           goto dma_cont_failed;
>>       }
>> -    ret = decode_message(qdev, user_msg, rsp, &resources, usr);
>> +    ret = decode_message(qdev, user_msg, rsp, &resources, usr, false);
>>   dma_cont_failed:
>>       free_dbc_buf(qdev, &resources);
>> @@ -1607,22 +1624,7 @@ static void resp_worker(struct work_struct *work)
>>            * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
>>            * otherwise, the user can issue an soc_reset to the device.
>>            */
>> -        u32 msg_count = le32_to_cpu(msg->hdr.count);
>> -        u32 msg_len = le32_to_cpu(msg->hdr.len);
>> -        u32 len = 0;
>> -        int j;
>> -
>> -        for (j = 0; j < msg_count && len < msg_len; ++j) {
>> -            struct wire_trans_hdr *trans_hdr;
>> -
>> -            trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
>> -            if (le32_to_cpu(trans_hdr->type) == 
>> QAIC_TRANS_DEACTIVATE_FROM_DEV) {
>> -                if (decode_deactivate(qdev, trans_hdr, &len, NULL))
>> -                    len += le32_to_cpu(trans_hdr->len);
>> -            } else {
>> -                len += le32_to_cpu(trans_hdr->len);
>> -            }
>> -        }
>> +        decode_message(qdev, NULL, msg, NULL, NULL, true);
> 
> This seems changing the previous behavior. The original code will 
> continue the loop when decode_deactivate() returns error. And 
> decode_message() will error immediately when decode_deactivate() returns 
> error.

In practice, there can only be one QAIC_TRANS_DEACTIVATE_FROM_DEV 
instance per message, so the two behaviors are functionally the same.

This is somewhat an argument for this change because having different 
behaviors across the code feels like a recipe for problems from corner 
cases.

-Jeff

