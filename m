Return-Path: <linux-arm-msm+bounces-108625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO+TIE9UDWr9wAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:27:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF13588202
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DB593001482
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 06:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C0D373C1A;
	Wed, 20 May 2026 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dunzMV3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtRH9BRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CFF30E0ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779258388; cv=none; b=D0izIfObABkOUG4DgFO2QtJIxIul/A7iBysllvMBcDKxJQYYud+ItkhMzuEDA42S7fdwmxA5xcjxIFfrZQhBv1sxywIvKmoRAEyd0wUINXfOVScf0ipYhfZb8WkqVr2iyT3SkJ/JlDh01lrZEFSaGExi5J0jpripWXz8MMDLKXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779258388; c=relaxed/simple;
	bh=BQZGGR+Kj9Md3bS6Uq4HRXhbnJ4m++574iu+PGya68I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e87PCLZAYVDtnt0bu/hu5inXgG0xENn8VaA1S0fS9+8XRLCEGxjsfw8uJOmLZSbbSRwHTU3oZk4N6NpJwe7jW/i6jVMuIQos1LpuG1uT3wfd1ab7X2aOGoyLez3WLrQv9dMzysa97707SM25bOB2urliyuvGxbJLp5K0QkOyGYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dunzMV3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtRH9BRJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6DVRg2983950
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bW7F36999oGFMbvn1eYTcV73jKHwj2KE5q8L3kwSVD4=; b=dunzMV3uXGkn7Q8I
	K1yv966/P0r1yGQzaCI+eju4wxVDl2VU5NcvnPjb3CtDSqtS6g2o3OXGr4HUEnWU
	O0Ml8v000I3Fv50EOnmDjeHT9lCIT3+pbnocaNbmmneGuJXQ+FR02FAB53WV0ORw
	hIBnawbFy11Nw97lqy/qVzLxz2XQMwEDSybh/rY7Zk9g7DF3FHq9Rxl0TjhxOCEf
	hlszaPAZqWm4OsuLfO5sJuID5S1qOAhMqHdcE5jYin67F76vPfQoqv7JpDgRRVWS
	RcQqFhTD0vYGs+OvTW0P49PBmat2c06aHFbT/kxBPRGXbIjAR6Q+OsXyoR3nGi4/
	5hhMdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3c3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:26:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so48412965ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779258386; x=1779863186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bW7F36999oGFMbvn1eYTcV73jKHwj2KE5q8L3kwSVD4=;
        b=UtRH9BRJ3aa8tHrpkttAhcsI0s7fNEPU2OHT8MFtlyASK6/+oqPZQILeqAdVmkq+7c
         Ee0tmOXUwgTaeT/6v5Go5aHdOX09ek4qbabrL7O5UUVBAXqY2aGh5h27PLZPmBTPhQrO
         yxowWVchT36E1kfWaXp8op1uVSaggstXt9KScf6h3d+EIP+xMAckE1N2hLnGb2YU7NcC
         2ZcE+66XbTwktN8MnFjHgWASMqfkS9oF5U4Csr2ciT1Yi145nOjMc289Ze+U04Etyaop
         zPxpjzc4ZmTg4MMcq6MPpsRgrHhdfawkYVnYx37g/WSNsU58VvgVXJ0YqWmbQLPYFp8b
         Z0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779258386; x=1779863186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW7F36999oGFMbvn1eYTcV73jKHwj2KE5q8L3kwSVD4=;
        b=p3QrH86IzcSArzQlHRZNjysZpaLlAWwXX4nW29v07xeTSv4U///Y3s3T1jzWVj/WJN
         DLuoT/q9btNyD9ZTlHKra5Sctv13omZk/YuaebW+BEw1XsAOlnEWCbYsHPiOFN96m9V8
         nY63x3H+zgWEczAkArvKmQ2ab24FLy+LzhR9Epuq2lT23OXV5wZInGzNfZXILFTJJQpk
         nB5p7/Itf2ZzR84ryqgA2t0RRNq0DCfbG9mR6rtS46vPPBBlqLqWTo05EkntEDMdrQ8y
         Tewj5LbMlwqFaRQAZO1w6f+2kLhzQckh9r5TYkHr3STidKUb2pTz1F+/UTaiEnwqZE/d
         I6jQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rD72walBZkC8Oig+1pWhR/D3YqBRVpntlgAaJDOXXtl90085zwsgrquwQzGJGSBvOXoas7dgQDwZqRYlZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/1aKqoYYp05Fqyq63qSHEbzqgufBN1Ryb1bOEzkchbHYVu9u
	Fbum/4nJtZzp5eb/Q1yfE2qJRdaZ/XooVmK7qFNBWu3elNRzvJ7jA0oGHg8/5ufdM2LiycAS1KU
	+DJa7gZxeKelUNf/JbmzoYsws005RnuqRI3zdiElzVJswwspiaWVbSOJ8+eNYnHXSt0pD
X-Gm-Gg: Acq92OG4jkoQ9OjeGgLETqK+Xb0BMuCNegeFV5mBD5oZARPDHxIlCKCyTRxG4W9BenC
	VBmM1JuWvMy/wrG1GWQ+XBCsG9oD0E/AuxzFaYBmnuCoKrfnWINg+Q2faTJ/nKv+8Qqb9xrsUzt
	Q2Uu7SwVHMojIbG+lbIXyK7B4+C6zE9XwQPrS2XgSiTM1BMuqfdIwmwGjxK/ryD6hIo4P1MbDmk
	NUGELexvHhHE3MFkzZtxAk+f1lEAklSrNZ/XIYscDKTKwaVgp1YhJrdy1GwZ6UybuZ/VANvawAe
	UTzcDc4cd+nQsRPsixK2yxPXF7fAX3hj0E3WIBxE4DO3rLkyB3A82xy6VnPKOyY+9Mvn5tL7Cyw
	qr8Dxfjo+dhPQUzJi4Enqkz6TNX5bQElpJEKLd/Z8jrVlt+qVPW0hR0CJDww=
X-Received: by 2002:a17:903:46c4:b0:2ba:6601:8e3d with SMTP id d9443c01a7336-2bd526f69f8mr226306905ad.9.1779258385729;
        Tue, 19 May 2026 23:26:25 -0700 (PDT)
X-Received: by 2002:a17:903:46c4:b0:2ba:6601:8e3d with SMTP id d9443c01a7336-2bd526f69f8mr226306635ad.9.1779258385245;
        Tue, 19 May 2026 23:26:25 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe4973sm210884795ad.41.2026.05.19.23.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 23:26:24 -0700 (PDT)
Message-ID: <cf77b8bb-5427-4d0c-b212-51947704378a@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:26:20 +0800
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
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZLP+rBrjhdKJLE7N47Bg-g4-6E3vS3yZXvMKwYQ2rMcUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d5412 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qqokX6KkybRntjKqjosA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: zOn7jwnvjApaI9RNkvUNhNtFEmd8psLG
X-Proofpoint-GUID: zOn7jwnvjApaI9RNkvUNhNtFEmd8psLG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA2MCBTYWx0ZWRfXxHMy3sxAuT65
 3IEcRcidKBwwSDG/QP/ViL056Mm7ET0F3bgIZtA0TFIhlyaLqr10SIBYfxSI2Fh6PMOfmBxMfpe
 KbheDfbprhnIRGSNqBhlvTZWJ/H6y9e+AMMSyVjBNMgLpGXzRswxajvI3p47SyZXtzfISCBXMVt
 4wzPz7ewhq+wCm5fZ+/8NRFEKqielYixkHArbR/6/c4WTTwauHO/Qzj71pwVU/f3sZPCZDVkqUS
 fGt3xB0221wZrv5MNA88Itf5IXIVle/eVZs0YNPcuHsIrNYMMaolJXX5oQ3CDQFqj2n01QYZbsG
 gjLWNXfDcMK/Y2stEvD3oA4YSrjciayBH1nTL27DjAsecV5ftTisZhcuQbYCyMk531QTcsWCAOl
 KQPmuMaOHfgvA82aK6NdBJNQp+rvfr38TFS7OB5M+iHLRjZamwm9bJ2We+tJ2GXx0YcrrsWQUpj
 AEa87HtuNfsRps48qTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-108625-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBF13588202
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luiz

On 4/29/2026 11:17 PM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Wed, Apr 29, 2026 at 8:12 AM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
>> The Bluetooth host decides whether to download firmware by reading the
>> controller firmware download completion flag and firmware version
>> information.
>>
>> If a USB error occurs during the firmware download process (for example
>> due to a USB disconnect), the download is aborted immediately. An
>> incomplete firmware transfer does not cause the controller to set the
>> download completion flag, but the firmware version information may be
>> updated at an early stage of the download process.
> Hold on, if the download has been aborted then the version should be
> reverted, or rather just update once the firmware loading is complete,
> so this indicates there is a bug somewhere that needs fixing, not
> worked around.
>
>> In this case, after USB reconnection, the host attempts to re-download
>> the firmware because the download completion flag is not set. However,
>> since the controller reports the same firmware version as the target
>> firmware, the download is skipped. This ultimately results in the
>> firmware not being properly updated on the controller.
>>
>> This change removes the restriction that skips firmware download when
>> the versions are equal. It covers scenarios where the USB connection
>> can be disconnected at any time and ensures that firmware download can
>> be retriggered after USB reconnection, allowing the Bluetooth firmware
>> to be correctly and completely updated.
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>> Changes v2:
>> - Update code comments and commit message to reflect the correct logic.
>> - Align the commit title with upstream conventions.
>> - Link v1
>>    https://lore.kernel.org/all/20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com/
>> ---
>>   drivers/bluetooth/btusb.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index 572091e60..70abbabea 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -3550,7 +3550,13 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>>                      "firmware rome 0x%x build 0x%x",
>>                      rver_rom, rver_patch, ver_rom, ver_patch);
>>
>> -       if (rver_rom != ver_rom || rver_patch <= ver_patch) {
>> +       /* Allow rampatch when the patch version equals the firmware version.
>> +        * A firmware download may be aborted by a transient USB error (e.g.
>> +        * disconnect) after the controller updates version info but before
>> +        * completion.
>> +        * Allowing equal versions enables re-flashing during recovery.
>> +        */
>> +       if (rver_rom != ver_rom || rver_patch < ver_patch) {
> As I said above, this sounds more like a workaround. That said, I
> wonder why it would print an error if the version matches, it sounds
> to be that if the version matches it should just skip and consider it
> has been loaded already in case the actual problem is fixed by setting
> the new version only when loading has been completed.
>
>>                  bt_dev_err(hdev, "rampatch file version did not match with firmware");
>>                  err = -EINVAL;
>>                  goto done;
>> --
>> 2.34.1

Just checking if there are any updates on this


Thanks,

Shuai

>

