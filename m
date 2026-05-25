Return-Path: <linux-arm-msm+bounces-109547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ASXMhHWE2pKGgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:54:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D18835C5C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9822D3001A76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 04:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E293831E83E;
	Mon, 25 May 2026 04:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hb6Xo9KY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZJB7xAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD832F7AD2
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779684875; cv=none; b=PIPQitU19ncjcXBajhXZi0nf+2BoVnB8wonqEmID6tQ2BNakOsrG3SkS5AAH1HvN/f8IJam5Ly5LBRB2qEANDbmfXjRsxN73gQyDWXayyERJnYz1ZgPUwlloeDRnVK+D/RBIX/nlBArPEUOevgiojX7HJ4E2r3UnIz8/fAeklVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779684875; c=relaxed/simple;
	bh=mLKpSdg5UZFpJKCKH2pdp7Peb+6WwPB+uVGIggRnO4w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MuPoLO/EOAX1P2Zd2/bvFVlrpeMuIT+kGSpBTk6YRf0O1yIQxVgzmY+9LOFsyDcmc4K2lZhzh2AEARnM7F8iuAYV4I8R3Ojn3e8wAnbpsgvQ1mrtNuMtmbdNrB20hyAb25hdndiTMdQ7+xyoKH/wT4wvZCnoHsDTR67OnupvUSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hb6Xo9KY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZJB7xAv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ONmreE2244701
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0Rs6oaK/jqTub1cx6UO6JWIsXdV1vKT7AXCB2yogII=; b=Hb6Xo9KYv//g1fLV
	1vC3sk2gtWb5ZAtlbZAwV4tZ9K/XU5SkQawELNH1e3B3pE+sRwxxya9gqIuJtIPD
	Uv3vMvMiYaTov2Ork8PeSRwyZLdyR9HLWids/TF0dyXndIuPet9XgUyRWFN288GV
	w1bZZkJUDrKjwxDszG5BSR70H3oVekswagSwnuuti4HzcFU5ahntIQPX68oYnDhS
	nhpcFOKso9ZgFDC7h5cBA18KD3pvh+1ViW6vBXP8sc6zKSreqYbbY1N1ZFY5TxK+
	PmiX3e7pbP9p78fS+Q/uL/1vQL7YVBy6O3o0xIJgCvzMr0Y1b0iNepm13Nq8xyFv
	/Y/0lQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7mx8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:54:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef62078ee7so10234878eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 21:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779684872; x=1780289672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n0Rs6oaK/jqTub1cx6UO6JWIsXdV1vKT7AXCB2yogII=;
        b=EZJB7xAvQsQeDemIK/S5YO+2+ipcxs0hAd2d5a5ueihQ0x9IQwkQktSueAVCZHrHPW
         UFrLO6bo4i/dDsqgyOgX+Q1cNvjpV7G05c5Kz0BfIyg4ddvj6x51oAFI6csvC1S/sq4u
         pxMqCgM0WuiuDDmC4LQ6ELQea2LLbYXl92uY9aBHNIqf79C4g0dm6/AUyL9QLRV1gg43
         ALrvJpzsFhjldd7K4xl9c/PCuHU1mDg8pgb3wG++xW1OoYGQ4q5gj6vIdZtaWXcoGT8w
         mKHzKqts3yE7KMzopUKatYU/d8PU1MT7Pixo3xwilsdr3au4BrMCiOzcX4IrPjSQ8YNS
         iIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779684872; x=1780289672;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0Rs6oaK/jqTub1cx6UO6JWIsXdV1vKT7AXCB2yogII=;
        b=hH6c2vTFX4m2RxjMoymaJIGXi/mMbvMIffBuBSAx0INYY7wfAQcU/VIK5rGGk3KkBU
         17iiLHCwN68Y0irb/gCaGYNCqenaddl9zrMsBzLG3Zn7aqmAAmzDVijF7GikCV7SkA5y
         YhUSdLH36rYblNvhLZ0jH2YqiL6OntnQ4+Dhr+W+8n6yBI/flEZS/F0gJFhrNQ2q8X2c
         Hyg2MBNoCNk+TfXU48OQObt/sZggpLT0Zx7lXab8OdKsr7kFN0GneTU0pgQauQKu0FgX
         C+UDkEnXp3S4c23UZ3FZbb5skfYH/Yp2aQ32eIHMtcJLYV99zS32qeTC+PMmraf2ikuV
         yAeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EwbMdF6FaGM2uI/8BWdg/ri+XW9x0UUyyvemHjo/OcVYxVlkdzrxdEVfxHrSCjzPRzD2G9J9keof0jTEN@vger.kernel.org
X-Gm-Message-State: AOJu0YwtkFsZMubG33gqw4u6jrOrXyfJIO36VR1lRWBoYRFARMfLCp38
	SuT9RTmPBmx8KF1t2UoXtse5z87l0ZperCNro3EUVcYeJMECOvMMIWqUxNIrYO12vaekGbsN+R6
	EX72u3valt3CrqA9s/CADTIpRAmJFlkxnLqf0IafssF1Yi6VzFcK/tnYYcs7ZF0Cx6RgA
X-Gm-Gg: Acq92OFw1K0c6jymYukmu/fGe9KsKOd0ykTKhjz5eQy1jTW4zty1hKvANoUKBMKud0P
	EjphAY2pe2wmVVPA8MG8UEyGDF4/3/iAUwt+4UFnedp596N+lTcFeLjCerf9xxr1A5KnBflw9SM
	2R5QUqTui8Ze0a27IM42SzTd80q1UFKf6rCXF/tjY49Yfl6SsqpCdrUWbVNAM4d9M5V4fNX+eZo
	JPPXBJ3K2Xejm6c8WBnY91KsYnnmy4HWSlSwT9rhUFw7Ua2+TU9wnKkQqjDYv+iWsp0t++Btgto
	Gvw0eHtex7xjZ7bkpiL1k1ovP1b54kAVOkTt0IiOGgPGn5W60GIvUar9QFrNAFEPY/Xjjla4qA8
	Wzu7p8JwFfNGaVhm2Mu5EKD4i+bDYo7KxtxlTOjdClCDWWOa+sHR1o99dGHrmflEGPzyrrDXNWs
	wrig==
X-Received: by 2002:a05:7022:913:b0:136:5631:bfed with SMTP id a92af1059eb24-1365fa355cfmr4334358c88.20.1779684871985;
        Sun, 24 May 2026 21:54:31 -0700 (PDT)
X-Received: by 2002:a05:7022:913:b0:136:5631:bfed with SMTP id a92af1059eb24-1365fa355cfmr4334343c88.20.1779684871402;
        Sun, 24 May 2026 21:54:31 -0700 (PDT)
Received: from [10.110.81.142] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba39d7sm5189913c88.14.2026.05.24.21.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 21:54:31 -0700 (PDT)
Message-ID: <9f898fe2-0b38-489a-b3d0-e13b00a68ab8@oss.qualcomm.com>
Date: Mon, 25 May 2026 12:54:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Increase SSR delay for rampatch
 and NVM loading
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        stable@vger.kernel.org
References: <20260522110838.1158643-1-shuai.zhang@oss.qualcomm.com>
 <1b8e8129-4f42-429e-bd70-5e368551739c@molgen.mpg.de>
Content-Language: en-US
In-Reply-To: <1b8e8129-4f42-429e-bd70-5e368551739c@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2sOVqdi1z4NRmFP236XC0Xe8lfdjLWKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA0NSBTYWx0ZWRfX6+/aQyfxIm1K
 XX3/eoMr8sJfYJfGMdDOrfslk5cmrYQWo+2veNWfzQDbiNj7KR/RmLmCZB3pofXwMy0OTBwF5U7
 TOe3swiiJjgi84DkKCh+QcB1mHV9ghqfJxQQMGFquWssQTs32UA2XA2SD+8pai0x5FJ98N8gpNf
 as3yJoy+fa98awZHfwilBw4EzHUgTKM2WHUBVcqD4fad31kq20NFjNzvrMmxckHhVIrNiC47vs+
 uFWM7R5sIAfnz6peIJcsgt8I5waXbfMiA4OJMIIDmCzQU54zruwAWQPnPuGy7E3Nya56lkC++DK
 GUhTaAwpzbRPIYMW2bX446zmtH3UqAe5XXCZX7s8fkZ76Fww+WmfF1iPr0c3gGZ90mhpwdwiEB7
 toUuUkfBo6QahOnKJ4oWBTNvVBOSrwt3lki8npACo3dIvR89hkmcZaPuxkGrdMfFEMlbsgGsTnq
 6WY7EjJV0AJTSMwr0Jw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a13d609 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=k2v91a5pJgHk7pTncY4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 2sOVqdi1z4NRmFP236XC0Xe8lfdjLWKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-109547-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D18835C5C9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul

Thanks for your review and suggestions.

On 5/22/2026 10:50 PM, Paul Menzel wrote:
> Dear Shuai,
>
>
> Thank you for your patch. Please mention the delay in the 
> summary/title. Maybe:
>
> Use 100 ms SSR delay for rampatch and NVM loading
>
> Am 22.05.26 um 13:08 schrieb Shuai Zhang:
>> When bt_en is pulled high by hardware, the host does not re-download
>> the firmware after SSR. The controller loads the rampatch and NVM
>> internally.
>>
>> On HMT chip, due to the large firmware file size, the
>
> Please document the size (> X MB) 


On HMT chip, the rampatch size is ~264 KB and the NVM is ~9.4 KB.
I will update this information in the next version of the patch.

>
>> loading process takes approximately 70ms. The previous 50ms delay is
>> too short, causing the controller to not respond to the reset command
>> sent by the host, which leads to BT initialization failure.
>
> Maybe paste the log?


  Bluetooth: hci0: QCA memdump Done, received 458752, total 458752
  Bluetooth: hci0: mem_dump_status: 2
  Bluetooth: hci0: Opcode 0x0c03 failed: -110

I will update this information in the next version of the patch.


>
>> Increase the delay to 100ms to ensure the controller has finished
>> loading the firmware before the host sends commands.
>
> Why can’t it be increased to 1 s?
>
>> Steps to reproduce:
>> 1. Trigger SSR and wait for SSR to complete:
>>     hcitool cmd 0x3f 0c 26
>> 2. Run "bluetoothctl power on" and observe that BT fails to start.
>>
>> Fixes: fce1a9244a0f ("Bluetooth: hci_qca: Fix SSR (SubSystem Restart) 
>> fail when BT_EN is pulled up by hw")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/hci_qca.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index ed280399b..184f52f9c 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1680,8 +1680,8 @@ static void qca_hw_error(struct hci_dev *hdev, 
>> u8 code)
>>           mod_timer(&qca->tx_idle_timer, jiffies +
>>                     msecs_to_jiffies(qca->tx_idle_delay));
>>   -        /* Controller reset completion time is 50ms */
>> -        msleep(50);
>> +        /* Wait for the controller to load the rampatch and NVM.*/
>
> Missing space at the end.
>
>> +        msleep(100);
>>             clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>>           clear_bit(QCA_IBS_DISABLED, &qca->flags);
>
> Is the time it took to load the rampatch and NVM visible in the logs?


No, the loading time of the rampatch and NVM is not visible in the host 
logs,

as the firmware is loaded internally by the controller.


>
>
> Kind regards,
>
> Paul


Thanks,

Shuai


