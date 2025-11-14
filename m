Return-Path: <linux-arm-msm+bounces-81842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A1DC5CD7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 84350343E6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7D8313551;
	Fri, 14 Nov 2025 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+llvOnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQsNZnze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC724313295
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119469; cv=none; b=KtBPaJh3QSXGaRfApBlD9M2EzwBsj8dymX35Tvp8+Wf6hgUs7skqUvGug38hoqtlDzQ1hVniqy5X+rS+gSh52PhlxEuIB0zbxDxkcKpyJ/Wx9Rwmz1LsajrOimP3uZfW1v8XDsB5TPg+G5CM9d56aKHbMlD+kZIEiRkeufv0Mao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119469; c=relaxed/simple;
	bh=4jaLqD3KZ7VuNrlZ6Q6LZMSVU3w1+1xihGdTjga8JjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4QeFJjQBBytLqinDL7Bsj9CEfv1eM7RGiiOf+JXARKLAhfQM9dCbQHnHxpRgN/G/ILLTDkYJRKRMeeNBnC9FYOoS6FXqfCKTzQGIl+zG7PiFTC3iHb0leLXBt11hRYBfmgXEXMWNCY9o5dpyrpEslwzoR8r7Gi4vPHNlXKXNMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+llvOnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQsNZnze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8DECk1692449
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50JEvdflBeKatW9OY+cR1OJ8SgpTllW/vP2IZkIBCk8=; b=n+llvOnOw1qaao6q
	QcTfxCQ1uNvCabsnHPbv2Nv0EmN3d1ynBcBP/gMSqsLUxEsT93uKO7wePXuRWFsY
	bGRzsw3fAwnTFuir45oQ8DgJToVm/yuPCYUQjUvNTbfOymjtVu4PkwiUsNfffA1I
	YCQ42UvXklpURm5MMfvkm00Uj44NZyemAOcq3S2W5H7laReRiPSNK+9L7d5BxKhO
	W3DK6qKWT5Am1hCU2zBKv0417c62IevssNUa7g7ZIfPzoMj3KU87ZZufYSsJAAyK
	uoxPKzYQ9+ZoufKktOnXLFACPbaTUKk2DZaquISO89WSJiOvT9VB8FXXveyL4pJy
	PpgH8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g1y7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:24:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b95d06db747so2380999a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763119465; x=1763724265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50JEvdflBeKatW9OY+cR1OJ8SgpTllW/vP2IZkIBCk8=;
        b=iQsNZnzenT/L8/LOp8CABW3H1+GW2jrvHLaZf5jUWeE7b5BMihRf8GjfwB0/8cb8dF
         iych6sNG1HIFVL6yVhxzUzT+HYO8zwu09V7kaTxwcKpG8axYUEyeT4kL7aGXtDxKLJG5
         PCjr9lrAltWFT09+j7RGOMjHGVV4y2ob3RJBJWgr3dKpcGEWzoD549D9ObanLSF7fQox
         2HZ2+LWTHlpGhx/KSPAutnNA7o9/xM1mN9OjvUGJR0LqncmgQYdjyjljB6Vl0/l6ZoId
         ojtwZRkFRA1vy0hiaLVRuyBWuTfZhpTF4Id/JhoDMSVq4zeMxNb6us2J9+kqRqMt7ycx
         WtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119465; x=1763724265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50JEvdflBeKatW9OY+cR1OJ8SgpTllW/vP2IZkIBCk8=;
        b=w2Ge7hUOjo20tZgJkUHgZMq1oKTUVvgfAoExFHV/wB1EZvlLi3kb10sexiX5HtiA9d
         UMDOXw4U78yaVhH1R7EBZ7f6s1GGqttUCVrSM0UqVQHlSVfI9fvYxxNox5UZkNPHRud8
         Mq+hIJhHymgNvOoG+DOEbAWRipaAy9anyN29+7hg5fxaMJvxPSpxvdU9K6vfKvN+Odqj
         +fD2TcX//INoeIO889IJEP4qFdrnk2zn0YwTSRus3JzyIRUUC76CKn39h2chWUUdDgCf
         T8sW4xdpudcvGoV+/H7c7+5pthxwYSrPd2dAvdlCQi4BtWsGoB3ft7610AGhHoB17CQi
         l45A==
X-Forwarded-Encrypted: i=1; AJvYcCXiQ4CKdXYoag5ll1qwSnWjSApVN/MzYSVsK4RbxxnKKrJrg7lDblJzRt9KgbbwHmD3C5Oj4EFvD/6wyLH5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DqrJarvpGTNbOI4R1V71g3QRv5aOAG9VWit64dMEu2GlYUiH
	5k2yRBqeujaZsDkgAkhCHh55Til1+eFWa7yXeRde1IdUW2GmkN3zhtRzWCc9enoyHWKSLTYTC7u
	cvIo9QwEG4Q5USJeLY+8j0c/jgy19RSbmD2slnEUypeWma6PwNBI6Vd+nqlb42QNQQ0Ef
X-Gm-Gg: ASbGncu0cHKcY/0iJUHFXbiRtLG0MlfXVqNANX6H0KTJl1VQdv3h1lT5hK5/PshSIx3
	LxSV+DxTYzO+PC/fEciG2hwiW5FW9Rf233p0mFJBlTDqhil56ZO1yPGyL9gYjO2jSKUIZaoCw7C
	9pZwMBqjXYc31+kwQcYMblUPh8Zv+gZ6Pfo1Arxsk60DaA5YOGTPrqiGQJ1YnTwPNoqkzUmWoeB
	bePQLdH+Qtg1NBZsf/bJxSfaqsnwudGd9BS3fc3DgLAT3DCb6ZbzV6IFpCareQ+7uquTVxLv/sT
	1ZtaNBxwUd4wVR6EFmN1pOEWvttcOlr3OCnQto/iNbWzgW001Us0aZCtCR/LDTbQtUv3M71iGd+
	OOKuyYM98csrsa3CP0HIVwJ2ywadFbGg84JR+LMi+i19Qczq0Rc7HHVs=
X-Received: by 2002:a05:7022:f68a:b0:119:e569:f84f with SMTP id a92af1059eb24-11b033ae894mr1093203c88.6.1763119464417;
        Fri, 14 Nov 2025 03:24:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IER/KNwHh+JkP9cIAvCS8U1orv/bAdp2HgRSNhoWYtU/+3J4fEc3CRBuZMRvHx0R9loqh4jRg==
X-Received: by 2002:a05:7022:f68a:b0:119:e569:f84f with SMTP id a92af1059eb24-11b033ae894mr1093186c88.6.1763119463426;
        Fri, 14 Nov 2025 03:24:23 -0800 (PST)
Received: from [10.110.115.10] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885c0sm9652707c88.3.2025.11.14.03.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 03:24:22 -0800 (PST)
Message-ID: <eb280667-f2bc-443a-baac-4f48d5acfc1d@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 19:24:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        stable@vger.kernel.org
References: <20251114081751.3940541-1-shuai.zhang@oss.qualcomm.com>
 <20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com>
 <967d99e5-7cc1-4f8c-8a1b-21b1bd096cb9@molgen.mpg.de>
 <32c952e1-39c0-421b-ad77-26603907d444@oss.qualcomm.com>
 <8ffee44c-0e44-4137-bf9e-11e7d8b168ab@molgen.mpg.de>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <8ffee44c-0e44-4137-bf9e-11e7d8b168ab@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xny8K4vw7_h3VHDVBfp2pB9q0QLl3hQg
X-Proofpoint-ORIG-GUID: xny8K4vw7_h3VHDVBfp2pB9q0QLl3hQg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MCBTYWx0ZWRfXxf30qhYKOjVf
 owKplhBBMUlK5hlG1EGQSB7jmDfv17+M+gVpNN74tDhLkUSQJenusC63a89VF7y7MXO5oMFhRpR
 jc85KSlAnebnQbpNmm0adq5F7YLH9pfQDw33B4U1Esxa8knf0IKv7I31OhNdK4cS3UcqtwWFsly
 AM8HDEebSTssaNgiNmAOpCwVn1yf61EAkhddXXLk9FtlRVrUAu60KQ9vIpmkq7fDYH11cowedCz
 kzCMRU08xeMyOKkVYeBw+QKiO7cGLYTXx+gM0nQ1NysWliCthSbmRY9OD4wxJrpggKINtqkCmRk
 I3R/yYGbwzZuRNNlZbzztsGI8Ncfh9cUC/eQ3o4H476sha0fYYs2cI0KrmZwwktMyyFzvJRlpdh
 SFB3GwUUYY1FqX7nU1KHKaZD1nKDEA==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=69171169 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BUV9c_y4XzYhrbKXCpIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140090

Dear Paul

On 11/14/2025 6:45 PM, Paul Menzel wrote:
> Dear Shuai,
>
>
> Am 14.11.25 um 11:41 schrieb Shuai Zhang:
>
>> On 11/14/2025 6:04 PM, Paul Menzel wrote:
>
>>> Am 14.11.25 um 09:17 schrieb Shuai Zhang:
>>>> The prefix "wcn" corresponds to the WCN685x chip, while entries 
>>>> without
>>>> the "wcn" prefix correspond to the QCA2066 chip. There are some 
>>>> feature
>>>> differences between the two.
>>>>
>>>> However, due to historical reasons, WCN685x chip has been using 
>>>> firmware
>>>> without the "wcn" prefix. The mapping between the chip and its
>>>> corresponding firmware has now been corrected.
>>>
>>> Present tense: … is now corrected.
>>>
>>> Maybe give one example of the firmware file.
>>>
>>> How did you test this? Maybe paste some log lines before and after?
>>>
>> Should I put the test log results directly in the commit?
>
> Without knowing how they look, I cannot say for sure, but yes, I would 
> add as much as possible to the commit message.
>
Sure, I’ll update.

>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 30209aeff75f ("Bluetooth: qca: Expand firmware-name to load 
>>>> specific rampatch")
>>>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>>>> ---
>>>>   drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
>>>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>>> index 7c958d606..8e0004ef7 100644
>>>> --- a/drivers/bluetooth/btqca.c
>>>> +++ b/drivers/bluetooth/btqca.c
>>>> @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, 
>>>> uint8_t baudrate,
>>>>                    "qca/msbtfw%02x.mbn", rom_ver);
>>>>               break;
>>>>           case QCA_WCN6855:
>>>> +            /* Due to historical reasons, WCN685x chip has been 
>>>> using firmware
>>>> +             * without the "wcn" prefix. The mapping between the 
>>>> chip and its
>>>> +             * corresponding firmware has now been corrected.
>>>> +             */
>>>>               snprintf(config.fwname, sizeof(config.fwname),
>>>> -                 "qca/hpbtfw%02x.tlv", rom_ver);
>>>> +                 "qca/wcnhpbtfw%02x.tlv", rom_ver);
>>>>               break;
>>>>           case QCA_WCN7850:
>>>>               snprintf(config.fwname, sizeof(config.fwname),
>>>> @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, 
>>>> uint8_t baudrate,
>>>>       }
>>>>         err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>> +
>>>> +    if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
>>>> +        snprintf(config.fwname, sizeof(config.fwname),
>>>> +             "qca/hpbtfw%02x.tlv", rom_ver);
>>>> +        err = qca_download_firmware(hdev, &config, soc_type, 
>>>> rom_ver);
>>>> +    }
>>>> +
>>>>       if (err < 0) {
>>>>           bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
>>>>           return err;
>>>> @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, 
>>>> uint8_t baudrate,
>>>>           case QCA_WCN6855:
>>>>               qca_read_fw_board_id(hdev, &boardid);
>>>>               qca_get_nvm_name_by_board(config.fwname, 
>>>> sizeof(config.fwname),
>>>> -                          "hpnv", soc_type, ver, rom_ver, boardid);
>>>> +                          "wcnhpnv", soc_type, ver, rom_ver, 
>>>> boardid);
>>>>               break;
>>>>           case QCA_WCN7850:
>>>>               qca_get_nvm_name_by_board(config.fwname, 
>>>> sizeof(config.fwname),
>>>> @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, 
>>>> uint8_t baudrate,
>>>>       }
>>>>         err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>> +
>>>> +    if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
>>>> +        qca_get_nvm_name_by_board(config.fwname, 
>>>> sizeof(config.fwname),
>>>> +                      "hpnv", soc_type, ver, rom_ver, boardid);
>>>> +        err = qca_download_firmware(hdev, &config, soc_type, 
>>>> rom_ver);
>>>> +    }
>>>> +
>>>>       if (err < 0) {
>>>>           bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>>>>           return err;
>>>
>>> The diff logs good.
>>>
>>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
>
> Kind regards,
>
> Paul

Kind regards,

Shuai



