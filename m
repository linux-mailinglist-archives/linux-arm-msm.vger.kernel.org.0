Return-Path: <linux-arm-msm+bounces-107236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG7cJO0tBGo/FAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:53:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC052F079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5D713006B0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F21131F9A3;
	Wed, 13 May 2026 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKl0Z6BQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIVx21oV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A559F3A48CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658631; cv=none; b=o2CLW10TpRgLHdvfVscXp0yNSJTkaYDZROEUWJ7F/UbvpNgZMtMA0Gg+qOea6CAKTwIsfzG3j2YGwbMrfgEHf2ZYAx4rOm3ujvh52acSB3DtBC66ElJXtf/UuIXw0aH+IJlTrReNaWb6bu8mfo5Y/OXZwYp9cstFiYokEI7ULvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658631; c=relaxed/simple;
	bh=nvDZxTsfOZ5pRR41/vZxK26Ud4ScS5tbuPWl2dxoYBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiCtZKB3cFB01F4MfL4WrZ91uBuwvIDvtdCVx6sqnC7lq/aOO/jV1q4SS+IgwhOkWg6UyooQRBuRaBndOMOSb/apHSEs3Ft0ckCR/xdjUkoxo2wzHISHmBakxTqUUAT3k1lcSddSl6/lrLZCUSijBpnaz6AYf7dGJCl990AJMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKl0Z6BQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIVx21oV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p98L2933007
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yU+sWMY7S+KNwCSbEBbx/+Ty1vfbwm0p7xv6HhHcxmg=; b=AKl0Z6BQe+jHCTs3
	lvXaIYC1/Tyh3N5Lxuxvk0Rl03ewLe18jeFys5B9lZiNpFZV39XOkce/2xj/FhID
	nfrVrdXHINeoix0LeiGuVNi5zl81Wm4O8baA/cmwmkS4/xC8HEMh2UqQwnlZlpHx
	dJ7hH/xxdqyiz9YU+1K2CW2CRYWRpcM6Q4VXirSKq8KaYBaXDTBX77kKhv4fkVRO
	tocIEUKQBvousZygnLxIO+VIl7AnNrDliV9OLjG/Wt8fAqMwAwPJSx4mo4eD1OrM
	K1r0+gW4NRj1jnTDMLT1IOT21AcpecWPwsU3UUX0/10ryNl8sXvi7IbJodcRobSQ
	jmPq5w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319vbfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:50:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef37c3f773so7660221eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 00:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778658627; x=1779263427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yU+sWMY7S+KNwCSbEBbx/+Ty1vfbwm0p7xv6HhHcxmg=;
        b=CIVx21oV/ERu/Jw1DR0EuIOK5AP53k4MzMuB27u5hZWvGDewAaNqx92ftdjql1fbFF
         5n3t4PBKpkGjStWcVHKLU5wQc/d4nh3XODwNXUI/50kAtMrDHf7gY2w1h2nj6mTnQUVq
         gngdGiU7bvMwrpYpjQ3PpQl3GEETWEofjSfbuAdeQrKerRXhpc3qr7pPPWlSq3EOyetV
         JfFCEU+yWhJowtFtYjggtV7sruKPvewRcSVE5bklxdUQjC/rB/B7TZSJykL46GH51+gH
         V17KBk0wHNsQljbSlpRphMCMq6Nj4rPmwDi/JiLN5m6pqaUMI3q1yf0yCN8DWZgtl5Px
         yuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658627; x=1779263427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yU+sWMY7S+KNwCSbEBbx/+Ty1vfbwm0p7xv6HhHcxmg=;
        b=P3NtB0XExIrlE20/OgttGsHxX9qgDZOoFAksz8w4/ZWbKfKE91DSy7z6TY9B2CPTR0
         xnQUzVZIgi/V8QYEwpcUJLA0Xib2pJ2B0vy9bsQyGtSe8TB56+LieDAyqRHhasyRf06O
         dCpvnM7tLPh3CSOtlCSmY0hfsNRCaCMi63LuJiFlUf47HHcN5qEtNYMiOYd+4YPHzgBj
         2dIg96U/7Yy6Y67YeNY1tDLDsIQTVOrKHLnf6/hfENPxNwYtBelUgraM0N72dMsRXvVi
         0ujnLPb2QKwFkbA0/p2iiXFM0WYGBAuFZwlUno+USCAF4iasY7poyKS4l27+2BIZCWML
         VCsw==
X-Forwarded-Encrypted: i=1; AFNElJ/bk9vm6lFmuRASJhjCA+8bzmh0cl6IYfSH/LUF2rIo/h/jqwCwGWX7Ix6tstF5R3ael7MzZdAziWIMCk5K@vger.kernel.org
X-Gm-Message-State: AOJu0YyU2BT02boCjRajBkqWOqg6g/giqjTreS8hFgON90TL9ZIzHKEH
	Sx2y4mXYHyPaTVGZTbh3pH9FltBG/gk3QcF9sU0/Dl7rL+Kp9W8jQzUAeMmzU35+59ZGnrhF2BF
	w4LWVjObK/+6chnZgFmPUWJdtDscY/24QEQurB6EuFiCVJ273tBYDLvEalf6Zqh1ApIeT
X-Gm-Gg: Acq92OE4+k4kZ6duxh8uKM2Uo8vYXhoU+WMl+Nn8LhdlaRlIkqetzqLELDLQcQ8QUsh
	zqFeq+7b+JgD9IZTIYOMa4QV1oYEhc2Am2yIfo0FD+ccggRGH6eWvOSMVAaDItxxupXWhhvUbVq
	X9n/qThbqF9YZC4PINDYai5cNM5B5FjI0aJ2tqHGPfHdAuSS7p0Rq4/SUQHDhrA8BQqiMRizYbq
	oWQn5z7Pj1s6xjVnMeET1aIyhhCnrEIFfPJy9l5rcKIyJuDMDf5ty0MsGzwqRmM+qr15rdJqUzg
	ycG8DDHpTygZemPZRWLfyndWMeSbuE86+bc/1ZNLQtnZTcYw+sIsqe7sWKD73JLdJjoii+p9oqp
	EHAtas5VMywNgLDV85uH3XhnPJXRNprkjjP5MBei6z+jaLvPtYIs0yrGZr3p87zI8imkogWCrDS
	N5
X-Received: by 2002:a05:7300:d706:b0:2ed:935:aa33 with SMTP id 5a478bee46e88-30116e95062mr1378601eec.5.1778658627447;
        Wed, 13 May 2026 00:50:27 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2ed:935:aa33 with SMTP id 5a478bee46e88-30116e95062mr1378579eec.5.1778658626791;
        Wed, 13 May 2026 00:50:26 -0700 (PDT)
Received: from [10.110.35.32] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847506fsm25796777eec.18.2026.05.13.00.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 00:50:26 -0700 (PDT)
Message-ID: <1a38fcd6-a990-4560-8a0d-5219854f3819@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:50:20 +0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3OCBTYWx0ZWRfXzf97yg0Y99r+
 Py1AAloHK+9Um72C/XdiobTZsNrRyGfjgDnxPU+LxYeJ0usBiusuVz6ka06VqTpggQgnNSnOFEu
 MwiPyVrCiQPArIveLhsRq6zmC/aoxgSJqXNhWLSa9pdfJG5Rubu10uJt6UdL6vod8ThTD1mhfWy
 JibvQSwsaZrMKsZRxtcHAZ7LdoD8F2tFAsUDrZ+KcntkHUUR62E70uDUXoOIsbksnX9gy+GPdHv
 jMq9V4e81XB2N8xGbATHsNmzUf+z4m3nJCvIMgEXUmvUVnD/gSwr6xCW8Srkz1BG1nVCRZFbD/5
 yxpcGnZx+/ZSHSrFi6Bep1UYh4bFhILmcytPHAdS9pm/erkLrl5obR/jTxHgKSTFE95ydMKgXXl
 w4EvhO1vmzImuci0m4JVtsL9Qr4/Wjp7d/wFKkdQIwwNLuHG+PXCeTpPTSuASo5Az+emHfFYrFQ
 MJtHrQ87OARz/axtzwg==
X-Proofpoint-GUID: b4r70YFJfPN592VdvGIh7VWc_NIcr1Vu
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a042d44 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qqokX6KkybRntjKqjosA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: b4r70YFJfPN592VdvGIh7VWc_NIcr1Vu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130078
X-Rspamd-Queue-Id: E6FC052F079
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
	TAGGED_FROM(0.00)[bounces-107236-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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


Correct, we cannot reliably detect if the download was aborted mid-flight,
so the version information may not always be accurate.

However, we only force a reload in cases where the firmware integrity
cannot be guaranteed. If the firmware download has completed successfully,
even if a USB disconnect happens afterward, we will not reload it, as the
controller already contains a complete and valid firmware.


>>                  bt_dev_err(hdev, "rampatch file version did not match with firmware");
>>                  err = -EINVAL;
>>                  goto done;
>> --
>> 2.34.1
>>
>

