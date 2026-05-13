Return-Path: <linux-arm-msm+bounces-107237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOTcKEYuBGpuFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:54:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2DF52F1B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4D083014135
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ED43D6491;
	Wed, 13 May 2026 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V68MnocZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HW239AZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EB03D6473
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658762; cv=none; b=Y4ePV4oe5reKbRYeVQw3ZWmeQOZqJbsn2JMZt0LTiNHfyHNgXeEWsKnkR24wOIkZa+SCUPp22EPW/2ey4HnNhpALKtzJaxolcvnwNWfTEv+Ol/6GORh1KrNkMGMQJzOUM2vkGm/WsMgSDPgFSfy+8n3LFyiwv+VoR6oLAn3PjtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658762; c=relaxed/simple;
	bh=MSXep/bDwIn3yHe4zPzKf5Aas/TTus+4HSlvtcwQFuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+ig2ZMjWrzYLpOrLsG8Ret+GJ8IQzCeLD9nQs9YGzQn5qFiCyMpBonaqGAq/lofc0PiOFyuvjKaOYIFLWd7VS1QPEnYPdh08A8nZAZskTZrWmzRXr9rlAM+03fDNxWh0gB0vgu/Vp76EgFYN5j61cckxwwEXA5yBB6jVuZziss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V68MnocZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HW239AZ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6ih0l2965290
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ravoL5PG8TFBvvHW7mZTeCpdtXXYG3Ly4mpodLGV0u8=; b=V68MnocZ+qiBFkh8
	5ElHxnLuoYyP/kCaYQrSfVhm/i1SMyKw+4KMf525HOudtW+kbjxZGydfCh3RmbEg
	6Wjo4LLbn1aYFwN8tKXzpv2GLgwaDQAzvykOaYXh0JlkwgcvYKAUM5TLfAuwptq9
	eJw62eC0BmZNbtHLhR+ydVtSNjrkG8eUP6xanCfPaWIPK+CYJftjijfE7v07J61R
	Npz9697/d9fy+EJU4jl9YV+iC2zDs2GcPCWQt5fP8ws2H9YMdrQaJa1KvrzKoFs0
	HvbmYIQO8dUiydXpKTeFdPIymsMPsSaOUx5pIM1cD9V1dXGhMttyuZL1WL/Zb6ux
	3uutGw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5884d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:52:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso8167102eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778658759; x=1779263559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ravoL5PG8TFBvvHW7mZTeCpdtXXYG3Ly4mpodLGV0u8=;
        b=HW239AZ8RRHKi//Q5WXu4bDre8EYaNm/ylprM/knn3IaOzcQzs++9nI/k4yvTYwLyz
         7Vm2y8NwX8bI2Hl7EGsMfbZD5LHIjZITBSoGfiewzC0F/CA0L5NQAmsaAiy2u0u0G7C6
         nozSRk0NjIMud6C6w6/W8ppYXG+fBuKkoMhpXa+nj1aYQ0WExY3Z9Aj3Dt//o7tpLJuK
         fTy5xewxmhGcJMvNL9gXZ0PhI7D1uuaNkgiNRJg/fNjJQWt/k1aX0Qa1qXYlHr0DkgMI
         P9mvefD0WCZ87r+jFVis92iYNNg9eQ1JFDDzW6swTWcJjacl47VwwTJ1yxuakzU0eUNs
         PGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658759; x=1779263559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ravoL5PG8TFBvvHW7mZTeCpdtXXYG3Ly4mpodLGV0u8=;
        b=T1cREL8qZWqW6nK+Wo80OiCYqoK6MUyQt1SHDtYfccV4FrlwNbv7qkRcrwV9xHRTm3
         9u5cKXmAz3LsEgLppWwA8kLy9BOVdDYr0YyMFON5qvg1kbF+gVYC15aenRch/hDvJJIv
         N/Gntf0D/iC40hdfbD+Uh33jVMXF8kXOkPyl2oj6o1eBPMDipvX1Ck5DUoGJjEC0fcxJ
         u6pbEj8bB5oPYsZvVxSMKRo+QpyerjRZ2H7jP+F6/n2Mnbm1tLZrLTjkv+jeTsnamajj
         L51laegG5snhGDHdV3jcDJWiD5Zh1i0i6V0/u9W0X8op/qdKFlXyxvRZlrq8K131CePw
         w6DQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iKmbJ0sP5G6aPWQaBRpdoXxeVtRicOvt4TQhV/di7/U8hRgo8ItBnRzqh9cpRXElAngB/QL69Yvf+vkTk@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ+A5ZGlkicTzatdgP5PeFrX4USqf9iTNT88ElUDb2cACabPAC
	gzntvsndAKeW6Ep+FfbHhwhhYvxziCBCD39M9TR/wEzfGKlSmCd2xaEiBHLArhavBcqWv6zFkNA
	tgCBvfnij8sDnNqrPOr0Ldde7RJH2UrHYBy3a01RZMwmaJTw8cLd5ddAnfiPMVsk5+Byi
X-Gm-Gg: Acq92OFKq0Unt7rNKO1GMdJnXhP0pcozXJSIP7mYLv15gv6uU0XvT4G/7QMG0h3IGBZ
	j6/fWh/KeA2R4piptj27aIoYjDykGp8Ra+MHnwSnyJ0MnAgufoc80Q7LmjjaxFSYz2414QK7IT3
	OSx9v2G4cWiWB22EVTm5hFF3U+ZCSdw1eIv1xhr4UGcmGS4ed7wJP91PmMuIZooFASA70HgYAvF
	/sQi74sUeZ5sqbQ6q7aSuSeXyBENLYpNSpq20YkTTfROlHdCciAX/0yPBh64St/vKWNPh7Z6TEs
	42e/wdh8aX7v8hB0Ld4nJtoKh/NnUYRZ8ZnddMRk9mt02kEA3YucXtXOQ54BNIb6QvARvE416rG
	2FQX2U3P0kxfm25E727j0PZJHj7O/EmvLkOpq70OlnOeBmTXoDw6fXs4JnbeKt+K0hcaCtW3fxW
	SO
X-Received: by 2002:a05:7301:4001:b0:2f3:dbfa:1955 with SMTP id 5a478bee46e88-301569f3016mr800981eec.34.1778658759398;
        Wed, 13 May 2026 00:52:39 -0700 (PDT)
X-Received: by 2002:a05:7301:4001:b0:2f3:dbfa:1955 with SMTP id 5a478bee46e88-301569f3016mr800968eec.34.1778658758815;
        Wed, 13 May 2026 00:52:38 -0700 (PDT)
Received: from [10.110.35.32] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88914523csm20850189eec.29.2026.05.13.00.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 00:52:38 -0700 (PDT)
Message-ID: <8f5362ca-5513-4d9a-8922-6603783c9ae7@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:52:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: btusb: Allow firmware re-download when
 version matches
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com>
 <CABBYNZLP+rBrjhdKJLE7N47Bg-g4-6E3vS3yZXvMKwYQ2rMcUA@mail.gmail.com>
 <CABBYNZKbVT2xXqedwoenuU0YroJO-3gyhJGSixt0zvodLez0qQ@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZKbVT2xXqedwoenuU0YroJO-3gyhJGSixt0zvodLez0qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3OCBTYWx0ZWRfXwOmoKBJLXEbY
 y/IHAvkAobtTl+r6LHZfgKvpRUHCrAN2oYPDcJu9gkNa34JBCzqNpMmfAI4p82NBC+JESKdTt3Q
 AZpFDmzlM7diJNg2S8pFdK2mdfSU6j4pCSxn47Dd3AYeEP3DzCorqF3rcbInYQJkZ6IxiEw7KxX
 pcTcFQYDViipa4WQ1RgnjTbqif3pGcoApb4XWf9TocDdW8ALop/hz3EGFN3cCXjIhXrXnAKiXeX
 zpvMmWJ0AMdM3g4dyjZUdG5wnnUcpPkLHMWYo7Fczo3YwsKkFuqXw21UIo/+OdyQEB16EtgXwwd
 25BcIP3nblOJGiwrfEy3KFmjAGgTCNr43JhTJ0csrT3b3p1PNTMsdqU119n0vi+Vywzd18M0vKp
 z3aJ6CPGqK5jL2TY+sa4RXnd+HCA5bB0MJuhgqEY+AN7qoFXPr0tk0hEjtslGGHBHEeW2Dp1zi5
 dtqDoH3ZU9OrDuTJM3A==
X-Proofpoint-ORIG-GUID: idqogU1B3yz7usP4BJ2MLjqHSxiiiHXk
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a042dc8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=pGLkceISAAAA:8
 a=KQFOj9_g3FkfKAVhRwgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: idqogU1B3yz7usP4BJ2MLjqHSxiiiHXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130078
X-Rspamd-Queue-Id: 1A2DF52F1B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107237-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi  Luiz

On 4/30/2026 12:14 AM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Wed, Apr 29, 2026 at 11:17 AM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
>> Hi Shuai,
>>
>> On Wed, Apr 29, 2026 at 8:12 AM Shuai Zhang
>> <shuai.zhang@oss.qualcomm.com> wrote:
>>> The Bluetooth host decides whether to download firmware by reading the
>>> controller firmware download completion flag and firmware version
>>> information.
>>>
>>> If a USB error occurs during the firmware download process (for example
>>> due to a USB disconnect), the download is aborted immediately. An
>>> incomplete firmware transfer does not cause the controller to set the
>>> download completion flag, but the firmware version information may be
>>> updated at an early stage of the download process.
>> Hold on, if the download has been aborted then the version should be
>> reverted, or rather just update once the firmware loading is complete,
>> so this indicates there is a bug somewhere that needs fixing, not
>> worked around.
>>
>>> In this case, after USB reconnection, the host attempts to re-download
>>> the firmware because the download completion flag is not set. However,
>>> since the controller reports the same firmware version as the target
>>> firmware, the download is skipped. This ultimately results in the
>>> firmware not being properly updated on the controller.
>>>
>>> This change removes the restriction that skips firmware download when
>>> the versions are equal. It covers scenarios where the USB connection
>>> can be disconnected at any time and ensures that firmware download can
>>> be retriggered after USB reconnection, allowing the Bluetooth firmware
>>> to be correctly and completely updated.
>>>
>>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>>> ---
>>> Changes v2:
>>> - Update code comments and commit message to reflect the correct logic.
>>> - Align the commit title with upstream conventions.
>>> - Link v1
>>>    https://lore.kernel.org/all/20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com/
>>> ---
>>>   drivers/bluetooth/btusb.c | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>>> index 572091e60..70abbabea 100644
>>> --- a/drivers/bluetooth/btusb.c
>>> +++ b/drivers/bluetooth/btusb.c
>>> @@ -3550,7 +3550,13 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>>>                      "firmware rome 0x%x build 0x%x",
>>>                      rver_rom, rver_patch, ver_rom, ver_patch);
>>>
>>> -       if (rver_rom != ver_rom || rver_patch <= ver_patch) {
>>> +       /* Allow rampatch when the patch version equals the firmware version.
>>> +        * A firmware download may be aborted by a transient USB error (e.g.
>>> +        * disconnect) after the controller updates version info but before
>>> +        * completion.
>>> +        * Allowing equal versions enables re-flashing during recovery.
>>> +        */
>>> +       if (rver_rom != ver_rom || rver_patch < ver_patch) {
>> As I said above, this sounds more like a workaround. That said, I
>> wonder why it would print an error if the version matches, it sounds
>> to be that if the version matches it should just skip and consider it
>> has been loaded already in case the actual problem is fixed by setting
>> the new version only when loading has been completed.
> Btw, the following also seem valid although not introduced by this change:
>
> https://sashiko.dev/#/patchset/20260429121207.1306526-1-shuai.zhang%40oss.qualcomm.com


I will check this and submit a new patch if it is issue.


>
>>>                  bt_dev_err(hdev, "rampatch file version did not match with firmware");
>>>                  err = -EINVAL;
>>>                  goto done;
>>> --
>>> 2.34.1
>>>
>>
>> --
>> Luiz Augusto von Dentz

Thanks,

Shuai

>
>

