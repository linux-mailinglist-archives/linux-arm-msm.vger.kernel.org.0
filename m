Return-Path: <linux-arm-msm+bounces-116231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kYitLE51R2ohYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:39:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7287002D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:39:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XCBPZ2IJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JMeR8pUU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116231-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116231-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D21A23039A1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E213314C4;
	Fri,  3 Jul 2026 08:31:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FCC2C234A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:31:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067513; cv=none; b=T37qgdEJUqOFlKKAa9d/f5Wixcl83fFtg4abYdUGS0HKV9J7F2Bpk+sPGfJizH2nwpD/xlWcsC3MSOVn9F0aAQUsHLsSUDgwjNL5sLtGHC/3GHvrYirug2bS9MBTl970M/MQt23f6grsgCsW8jJ9ehSw1kpFLGExOwjoW/v6+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067513; c=relaxed/simple;
	bh=RM14EZ+JtNCN7Tih2aDJbikJ63wC1jDUw91kbqLYjEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=cqS2Xc9M3hOc+k6QKDc5zF9Soe7LjxOfIi7wpCSBakqMkuKW1W+oGmvWlN5Am+0VBNv8cVymSvwapDsyOnO7ak/97TTdbVwA+90yRKTF/IkB7tda6sekZEOtPzNvaUxX/EL4PoRMRHpQqpISQOs+y+NUftQ8VUEFh4aI5MnNVoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCBPZ2IJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMeR8pUU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rfJN2994867
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30jHl1aofyomvSG7on5YYtAKEDMGwM3o7HFcEeYIKXc=; b=XCBPZ2IJ3Eb8DgH9
	1Sst3yHvnu6gkYi6RdjV5PmhLo13mTWF9d03tdUedS6pbuhV3uP9MbGUdNNQzQKZ
	+rsy2HtQSjckn2dnP/f/UX9syZ6kffWztVskGwjs5gzqyqNrvkQDjrvZBwv/b8ZC
	xeSA6eNAecY6IThuro6QZpqEgrc98Qdsqw1Wr5D9Q2ZfTT3p9dkQIXTahQ8Tl+hk
	V/75xDZZ1XeOuaz0GFILi7iaV7sSJOjXg7nJzp7pvNRyTHONNSzfeqEReEDdKOCk
	PIE4uwe5faUsh8v6LRv+jjlxdudDI73QoWTszPJCMvnPgm7HnksSC13bhO1FQJvl
	bmmcXQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1f6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:31:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9b71388fbso8602815ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067509; x=1783672309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=30jHl1aofyomvSG7on5YYtAKEDMGwM3o7HFcEeYIKXc=;
        b=JMeR8pUUCEd5efR6HgVVbM6I6uU9Of9KwHgEGrJYKoloQRaMI5L4mGEao35jMKsMTP
         CrcfW7AgXooUQu/SBd66GP34ffyHwufHHBSBxH5NAi9Z5Sse4pPLrZL4VrUYEBDHsv61
         PzhQidyw4xos8Z+G59HqYmaUl/KTTbbte0hb6NzlTz7gFzZcbS3gj2mySelp7aJAqSYK
         6CH7KjfGYReE6YTsbPgspANzSqR+285LuLFykJnOohhMIolq4yDAIdQ/LqPvbnL/eQvq
         fZd6DUlnK0NXOGbziF0uHY9K1kvBOXYjzB3YoajzLbGjpQ4ZsaB+2xs8WH5+AfMjRpFC
         cGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067509; x=1783672309;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30jHl1aofyomvSG7on5YYtAKEDMGwM3o7HFcEeYIKXc=;
        b=ROv07KMHdWWfK19HRzrBfEG33s0jqARJT79g+c6CfNnZZSXuNZtLakEjlwszjheuuN
         YXRAZdaK2z1RpjWZ+Yg35q6DpvzQyeA4TnYmxs5bQvqH1XQgJE4jVChM3+MS+eSPwmp6
         C5hw6wWysyVYBEhlMtkLcCnE2mJPLh0a4M2Qxh0aFSj4OHtckTx1aC095PPfGVNVFbEJ
         O3MqVAJQGaRJO9nanqjFf/VnmvnLOsgyPUmrpq/jszthJRlBqIMDntOVjB0R28ea/Yef
         8MUYHsDUGRpeIVXYKXlv3JtKX2XMGOrEjfBAhvFOno5bdmzo+J86VFXJ4eWbNKtu8+7S
         oLvQ==
X-Forwarded-Encrypted: i=1; AHgh+RovpcsVNCqp55sQgiBwqddjKWhTDdhPPV3tMCV7RROSW6rL96cMI62Mh62lV35NOhkw6BEicszXxjHX9FYJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyAun+gTQ6KXUyG394vhh1Rak+rLuwkC1pboAcryA/Lz2C2nbo0
	//lKMp7cf/ldahmIr8qkGmliRQGjgBkIEV257zNdHqjvnnWkZlex1Szr+ZDJK90+HB9XZXszpkh
	MQNh8j+gcsFiiJ7DpO6F/urxbgycQ5projfuy5jGIWGVxqNmCRrAtgPcyPfy5+FhMRPII
X-Gm-Gg: AfdE7cmnO+SgLlNqVfRfmlAF3xNdM0ek3gLI/kt54SJf4BIecTkL61Jubj1754pHxDA
	vNSq7y3oQsWZ/bKsoVJiDKhkbOGHOHimbNLthXnbTFDhSUdBZzXYbY7EbpS7bVDlrMfYbUyciHU
	iGCGQ+6CeVr0Thd7fWBxn0LxUStqPBGeB811JOk6QlLOQWWfWu2qJyrzcH8kXOzh9jmH3ZhyAmd
	B5tMT3uSdUM0aDXDOZHaCygsxJr/vLUAlXVSBKyJZ3mxqlGvQKbo7iFxURoi9Lp5NNIFVyLJjwv
	JClSnQKVvp0QfQDZmkhNxX1Y4lPPR8zqj5eU6QAZPztbOJbBCVJuzM34n+qYrTKG33u+CIm0dUY
	rcmXdOmNRUT0NfEBqJNiWW9+RuciiXUKCwdHMls7TxKQRYS6s+Q/4aGfdpmJtm3P0Nogltg44I+
	AjRNAebg==
X-Received: by 2002:a17:903:fae:b0:2c9:e261:95bf with SMTP id d9443c01a7336-2ca7e757955mr102746935ad.26.1783067508753;
        Fri, 03 Jul 2026 01:31:48 -0700 (PDT)
X-Received: by 2002:a17:903:fae:b0:2c9:e261:95bf with SMTP id d9443c01a7336-2ca7e757955mr102746625ad.26.1783067508205;
        Fri, 03 Jul 2026 01:31:48 -0700 (PDT)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7871366sm5880105ad.62.2026.07.03.01.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:31:47 -0700 (PDT)
Message-ID: <d883112c-5ea5-46e3-abb7-f7c611f52ab2@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 16:31:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fastrpc: Reduce log level for DSP info and reserved
 memory messages
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
 <cg526ebtmnboqpw5aabwrtmoc7fhnvc57dmjax5zltcjonnazv@pynuwgpx3bi5>
Content-Language: en-US
Cc: Srinivas Kandagatla <srini@kernel.org>, amahesh@qti.qualcomm.com,
        arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <cg526ebtmnboqpw5aabwrtmoc7fhnvc57dmjax5zltcjonnazv@pynuwgpx3bi5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MCBTYWx0ZWRfX/X9OXW1Pz3cr
 FymoTAHFSEF103Gj9IW9CFiUs4ugNoH+zQSsC9DbRXQuJaGcv5qWqAi3mhFajnAnyv3MSb0IrQB
 egOSu/AuI6QuRhNg7ESb7kwuXGPbTpM=
X-Proofpoint-ORIG-GUID: eB1Yv17za-cBzWJlPMEalaIRkpKLazj_
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a477375 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=C2AwR90XAiyykRj1wVUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: eB1Yv17za-cBzWJlPMEalaIRkpKLazj_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MCBTYWx0ZWRfXy2kLP1PbCB3G
 NxmsrzOPEKtF2MwltrH7AflwGcXZ9GBpphs/MXZymQi3Hh7WmUeA1AP3tFhXx8l8IwThqnDjtKk
 /ADN3/BrNR3FgBtrsSqia8TzpMEKLu+YYUqGouC2t8FyVJX5GkvgyQrtMVkx06eTAtDzKEuudCy
 YVVbx3OefA992sv/omWdj0/Pt4MTDj6aEJtjQs0jEZ6Jx/R+LO2GN+p4hm+C8ChlUME9uHFGduv
 tS7+gp2VldzKx7HG/+EtxpvOyTKbAmXjYAuLxxg3YdrK3NYqDVb5fqJ/AqLOkzkPvLABF47R4rM
 vmpCUnuJTFzN7qkHaX6IoQKp7+883D7W2Gh+NyLGAvpP7mEGJNdoEs1jP4SoYCqxz1EMl6h5HfL
 cZ5u9F3ZKKZlRJRZ346Sw04UdWZJuIkejTZQLg0x+HZJZbcbGWm9+R2hJ7/NRQpvFrkBOjM/1T5
 DzkcE0/L0TmBEm5B7Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116231-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B7287002D3


On 5/18/2026 7:08 AM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 02:28:25PM +0800, Jianping Li wrote:
>> On some platforms (e.g. QCS615 Talos), fastrpc may temporarily fail
>> to retrieve DSP attributes during boot, resulting in repeated
> temporarily? What does it mean? Should there be any sync with the DSP,
> letting the FastRPC driver know when it's safe to retrieve the
> information?

Hi Dmitry,

Thanks for the review — "temporarily" was a poor word choice on
my part, sorry for the confusion. There is no boot-time race
that eventually resolves; let me walk through the code to make
the actual scenario clearer.

The FastRPC misc device is only registered after the rpmsg
channel to the DSP is up (fastrpc_rpmsg_probe ->
fastrpc_device_register), so the transport-level sync between
the driver and the DSP is already in place before userspace can
issue any ioctl. And fastrpc_get_info_from_kernel() already
caches the result the first time it succeeds:

     if (cctx->valid_attributes) {
         spin_unlock_irqrestore(&cctx->lock, flags);
         goto done;
     }
     ...
     err = fastrpc_get_info_from_dsp(...);
     if (err == DSP_UNSUPPORTED_API) {
         dev_info(... "DSP capabilities not supported\n");
         return -EOPNOTSUPP;
     } else if (err) {
         dev_err(... "dsp information is incorrect err: %d\n", err);
         return err;
     }
     ...
     cctx->valid_attributes = true;

So on platforms where the DSP firmware implements the attribute
RPC, the message is not printed and the query happens exactly
once for the lifetime of the channel.

On this SoC the DSP firmware returns a non-zero error that is not
DSP_UNSUPPORTED_API, so the else-if (err) branch is taken every
time: valid_attributes is never set, the next open re-queries
the DSP, and the same dev_err line is printed again. On RC
builds with metadata flashing enabled, several such clients come
up at boot and the console gets flooded.

I think lowering the kernel log level is the least invasive fix.

I'll respin v2 with the commit message reworded to drop
"temporarily" and describe the above accurately. No functional
change beyond the log-level downgrade.

Thanks,
Jianping

>
>> "Error: dsp information is incorrect" messages printed on the
>> console.
>>
>> These messages are observed continuously during boot when metadata
>> flashing is enabled as part of RC releases, causing unnecessary
>> log noise.
>>
>> Similarly, the absence of reserved DMA memory is a valid
>> configuration and does not represent an error condition.
>>
>> Since these scenarios are expected and do not indicate a failure,
>> downgrade the log level from dev_err/dev_info to dev_dbg to avoid
>> flooding the console.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>

