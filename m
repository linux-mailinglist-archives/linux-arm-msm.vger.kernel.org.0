Return-Path: <linux-arm-msm+bounces-96242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMpHJoyzrmkSHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:48:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32D23827B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12F9A306D8FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D813A4F5F;
	Mon,  9 Mar 2026 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R24xypqw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7Hf/4db"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD3D355F3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056861; cv=none; b=PKuENecV7NTXARy2EdQJ/QDVvLuFZXesYKzGTEQCjmWk9ke1YlcHvbiviCLtM3d3vDBaK2PKUPTu/4l64ro7MTl4tkv3iQ/hzYrBjvMDy5vBPZvaOzhhBY3oDODsf1MKYMtagJP3ECDaZrC1yAKHVPazvGtCRIWbGl8nMOU1F0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056861; c=relaxed/simple;
	bh=DoPEjWwBLqtm/JvLlriuTdp8La2V/cu6HD0tfJ/3KN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2vJj1cN9uy2Fxg/g/nKwYxf1HHG+AIc0KEOMlBBtI7rOQflnLbtDsNxv9hpXrLuEfViEQufGtwTSQwrOZibr/W/VRmJZMMiDLuJvNui5Li8S3mnHeR+J/XBJST/CGL7WamNBwLF0sJDAx8GfZndflyOVTSr4QKozCztnCrf5oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R24xypqw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7Hf/4db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Axpkt2466489
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmnxHX2UxVycu4QZL6Ds7pUS/n7cTEB4IxSrk7IZsB4=; b=R24xypqwO/7XKgkG
	PhWHf5THjkrKedfP0WorwxvB2EjS0FsibcJJyla0gxIQwaDAoKiHrolcBc4Mkqsg
	uI4xiZYqghEepgf6lj8c1nZQIboPcGRNlVsItyT4s7easUrRVbeuhlRg00ogJU6i
	61wy96FKWMJ+EiM4w9J8a2VhN/RAcQ2kUGH2Yp/QEYJWfgqbLzoigSRHSM1ZGiQG
	g7Ixt2NgYDHZyG3qxtdz1t5K3J0qYZi5SsVuwkR+/omsuMfm73qC8x3OPan44HUF
	wTjV9vfxncxuZ/Ub662XG3+I/3jkPRRloocbENSvc9sNPyUjbMxkEKDxrghNaECz
	APMrNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrnc6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:47:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38346fdbso823880685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773056858; x=1773661658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmnxHX2UxVycu4QZL6Ds7pUS/n7cTEB4IxSrk7IZsB4=;
        b=K7Hf/4dbAqZSlUaKkMAN8kxzrpKIGyo8nk/wj4W7C7VPBM7xKHtKBrXT5ZfP0MOFHt
         ETazJ9USj0eXCRPjF4Z0jlx+XWKChvDc5lm6kH2qYWZQBXSvHomdl0t+/32dVHcbjEn8
         TcGeAL6ict07cU9qETcxz560p+k6D838ljIRPF0Q6UZu8v3ziDlaxUUb7vm9NMzQttof
         cf83lXwWhDD2ihv4fHD5sxvOcGy2CEFjy/bxHy3hCnJquzILtzaji7YOhdssyztpAZgm
         gHg9qj/CGp7ODR1rU+dLVOFcya9EeD8Ev6kfRAyuhfkvPJvnYKR7q438WcAjOv+JZL4+
         vr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056858; x=1773661658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmnxHX2UxVycu4QZL6Ds7pUS/n7cTEB4IxSrk7IZsB4=;
        b=reZKpr8F8RrZ2ntOP6CPCOxMZALDzPAEWo8Z/INQa2Fp2/jKpPtZleoIcujP6yJe+F
         cFN0FB0wyIOjcrVUk0lx4PfQDobq5AOnBDynf+ybA/qaFj9risSSHYgDQizsyIkJjmbF
         mgTRBHQcVHSSD2HxeDtiR3Yj/NnLxpxHy3Zq6OoIr18ds31Xx+3vxvxYd31jCLJlbItQ
         OFNEy1DuNPPjyZv5nHztqdMlO2MINrEwtwh864k9U8zML44hTkGxv8s6eVgf6Nz7ptZd
         FzmKbNhaVi17HoVrb6xwNsNovSOCVolNpP7woGTKZapHEi1MfTXEmRMK7LB7A6XpOgKE
         FIMg==
X-Forwarded-Encrypted: i=1; AJvYcCXn8gCTGRvFKsurYs/eCYHJagNzTh1wIXvMk5KMMipNP5s7Gy7jk9YoZMzaxNoifHxf2qK8FCdzE9UxuEc3@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwdu7bGskRVN4aHfrTTixcCgywFuso11UijjvvDrOi/iCarMc
	8UHv2Y2qd/0LdoZUJ0PWQSiQgReR/86tLVcAjVd1tQEXs9VvmSSkQr/L6F67eEiMEL2PjkyYT9r
	5BMgXRxsV2V1qAryE1a0nb+Xbh3q8XdaX1nzroPr6dvW9zDAjHERLRgpMi0Od5CADMuFG
X-Gm-Gg: ATEYQzwYS4gR2zgi2FnWjIU4fI98KdqS/lTC8NPGure+sTXzWx83IbPI3vxMo1uqK90
	tVFhm8/Eobf/LbDkCbUvd+UKDAvE1hSj2UOLc02X5mmMWHDLZ5Q2pnrSAtEC4QH03KggU1Bzg9C
	AYuu4yOuSsX3xmx5dsyOzgvxsLFLjesMj6go8MRsnf3kMFpXH/GXUjhjx+gEhk65Vj9oZNtsuDm
	lWxpGZcdKshvUpblnePQBb8fxN5927NIpyQyu2Uy1I4EexlomvHn63RyzVtuijApQ2WLZelkiTc
	snMeXtv2TQMiNM7ga77Rp2egpwA8NSjP/2g3KguayeDC/mcqo57094VcTFus/13cFFubalSYW0E
	sjj8zRzwrek5fwPA7vFDTM62dPadQYEQy1hIAL5MOTp2A4n+En/Q37kRQF/1/UiP1Pz/u1vi1yT
	NQjk8=
X-Received: by 2002:a05:620a:4087:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cd7fc0f6dbmr641725785a.5.1773056857743;
        Mon, 09 Mar 2026 04:47:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4087:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cd7fc0f6dbmr641723185a.5.1773056857247;
        Mon, 09 Mar 2026 04:47:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66e0dsm3162371a12.7.2026.03.09.04.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:47:36 -0700 (PDT)
Message-ID: <805525cb-ef53-4bdd-a73b-6fe7513228ce@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:47:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
 <aa6M2QSXW72xqYiB@linaro.org>
 <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aeb35a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uGzmvu1gi_0XBBI2Y4EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _tTZg_KsrfGP-XzHVknm7RIwox5t-icb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwOCBTYWx0ZWRfX+5fgrMFeHnYJ
 f3wsd1i4Y60FfDfx8sp5ZPqfIMP/xoeYq6u/Vx+OgHje2fMPgu7sbKWz/OSabVW5bifhcVARqzG
 +0sNZHsUrOg6eiNEgugEoKwnLXSci0D34O89lgtiwvpKnUQEChl3j4Qm18DYHX95H0KpXusA5ZC
 jIs5It+XF0jdiq0CfkWoyby1YjCPiFgK8rx8txn6Ae4RUZLH516X/ljRPMWOqTbPy21LO6e9NNH
 5sQG4A82TMc7mvSj8ttNcYO7G5npAJizym1nvN6xypcvvTLtMwNxhRmFmmHR4VAieuQH6FTkKd9
 aaURJrcDVlPnP0gCgC2oHD5U/Ji9KGR8xkXOYPhrypCjJGGeK/1MZoUe5vDN7emGxbLzOeNNMhS
 kv7UKVimELXBTwvcAiNREestjd46PtBIbQ6Lt0SS/b67akLW5IsvzMFJNbBRVoxrTeD3DoGmd+x
 kaSGcw/G08eRzKW9rRg==
X-Proofpoint-GUID: _tTZg_KsrfGP-XzHVknm7RIwox5t-icb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090108
X-Rspamd-Queue-Id: 3A32D23827B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-96242-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 11:04 AM, Sibi Sankar wrote:
> 
> On 3/9/2026 2:33 PM, Stephan Gerhold wrote:
>> On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>> reference boards. It handles fan control, temperature sensors, access
>>> to EC state changes and supports reporting suspend entry/exit to the
>>> EC.
>>>
>>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> ---
>>>   MAINTAINERS                            |   7 +
>>>   drivers/platform/arm64/Kconfig         |  12 +
>>>   drivers/platform/arm64/Makefile        |   1 +
>>>   drivers/platform/arm64/qcom-hamoa-ec.c | 462 +++++++++++++++++++++++++
>>>   4 files changed, 482 insertions(+)
>>>   create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c
>>>
>>> [...]
>>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>>> new file mode 100644
>>> index 000000000000..83aa869fad8f
>>> --- /dev/null
>>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>>> @@ -0,0 +1,462 @@
>>> [...]
>>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>>> +{
>>> +    int ret;
>>> +
>>> +    mutex_lock(&ec->lock);
>>> +    ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>>> +    mutex_unlock(&ec->lock);
>> This mutex looks redundant to me for the current implementation. You
>> don't have any read-modify-write sequences and I think the I2C core
>> already has internal locking for the bus itself.
> 
> Hey Stephan,
> Thanks for taking time to review the series :)
> 
> Will remove this in the next re-spin.
> 
>>
>>> [...]
>>> +/*
>>> + * Fan Debug control command:
>>> + *
>>> + * Command Payload:
>>> + * ------------------------------------------------------------------------------
>>> + * | Offset    | Name        | Description                    |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x00    | Command    | Fan control command                |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x01    | Fan ID    | 0x1 : Fan 1                    |
>>> + * |        |        | 0x2 : Fan 2                    |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x02    | Byte count = 4| Size of data to set fan speed            |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x03    | Mode        | Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )    |
>>> + * |        |        | Bit 1: Fan On/Off (0 - Off, 1 - ON)        |
>>> + * |        |        | Bit 2: Debug Type (0 - RPM, 1 - PWM)        |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x04 (LSB)    | Speed in RPM    | RPM value, if mode selected is RPM        |
>>> + * | 0x05    |        |                        |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x06    | Speed in PWM    | PWM value, if mode selected is PWM (0 - 255)    |
>>> + * ______________________________________________________________________________
>>> + *
>>> + */
>>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>>> +{
>>> +    struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>>> +    struct device *dev = ec_cdev->parent_dev;
>>> +    struct i2c_client *client = to_i2c_client(dev);
>>> +
>>> +    u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>>> +              EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>>> +              0, 0, state };
>>> +    int ret;
>>> +
>>> +    ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>>> +                         sizeof(request), request);
>> I think it's nice to provide users a way to override the fan speed, but
>> is this really the main interface of the EC that we want to use for
>> influencing the fan speed?
>>
>> As the name of the command suggests, this is a debug command that
>> essentially overrides the internal fan control algorithm of the EC. If
>> you use this to turn the fan off and then Linux hangs, I would expect
>> that the fan stays off until the device will eventually overheat.
>>
>> I think it would be more reliable if:
>>
>>   (1) The default mode of operation does not make use of the "debug mode"
>>       command and instead sends the internal SoC temperatures to the EC
>>       to help optimize the fan control. (This is what Windows does on
>>       Hamoa, not sure if this is still needed on Glymur?)
> 
> That's true, Glymur already has a way to access average SoC
> temperature and even on Hamoa it can still be functional without
> SoC temperature i.e. with thermistors it has access to.
> 
> The aim of the series is to expose fans as a cooling device so
> that linux has a way of fan control independent to the algorithm
> running on the EC.

I suppose the main question here is "what happens if i set the fan to zero
and put the laptop in my backpack"

The driver for M-series Macs for example, 785205fd8139 ("hwmon: Add Apple
Silicon SMC hwmon driver") hides that behind a cmdline param, since they
have no certainty. I would *assume* that if the CPU hits thermal junction
temperatures, our boards will reset, but we should be able to get a definitive
answer here.

Konrad

