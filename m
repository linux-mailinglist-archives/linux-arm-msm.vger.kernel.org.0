Return-Path: <linux-arm-msm+bounces-67428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF6B18961
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 01:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A991C854BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 23:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2951F9A89;
	Fri,  1 Aug 2025 23:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guzpOauZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA2A17DFE7
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754090306; cv=none; b=g2jrgpI40Cc7Jbuzn71hLoFnIL7zzbgti6I0KVVEgR+ndPHv1Kukjj4VhPD+6ujQkFsg2hecI17im0D83RAtV7MTDAz/naYV9YypTpgvBg3eWa8i51WSS6Lkky7yiDnYv3FtJYhjqoLYXTYpZjoHMwMYIj+O3XHa9DaA5b/DBKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754090306; c=relaxed/simple;
	bh=KfW2pjyXjwbhHAG1+rUm82EIhrLsxH3wOyneKuccBmE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X3IaJE8Ym4i6E2RuJeI9g3083TdVk9KU5om+TZpB8/qKlPy+0yImcFIO/0v+h05MXfTCoc5Maq0HmNKtsCBBW8hMtj/sw386z00FpdrXXKyPEEB+qrLx4mchnWgy5YagG6Ai2dueXBdNukLyyoc1GAA3bBfAqvSP+9VUIiyPA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guzpOauZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571LfIrw022762
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 23:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSUWbofeDMNLabFSHa1cdVIt/PhMfOuSeGfNa48oSAQ=; b=guzpOauZzG7pgJb/
	srnEJthgjCLT47tMDHApDS+HhOkGis+tXNtPaS7M5t4RidOkygEuBzkBOM80ciiE
	0lmTmU90QAash0kXGkpkcYj3u0OO7e86dcHI+SnYK0FU8WxpZhQjL9fN861VpfRQ
	YgVrIgyMb4N5CWtpD3KacwiD1+kfTs/1i/6u1BadODZToKgk6is9vaaRoCwjdAO3
	q3Ee5PjREO/X4nB/K6dxIH8nUr5o5WlEAuyYHGZVUL57QBRKI2Ukw/CwgKVM8W2f
	fC3htXM0ZsAKOrcfgNRnIU1WTFgYa08fgcD+U6GE/nONL9BJVonFcHF/ssuJvU78
	iIocIQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488wgrsn8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 23:18:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso2762453a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 16:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754090302; x=1754695102;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSUWbofeDMNLabFSHa1cdVIt/PhMfOuSeGfNa48oSAQ=;
        b=L0MvWyCog41rxb7sF0aewQSesxLiEHnpHQ3wgbeFfxitZxqn0BQJDNg0a60xvdSt0U
         wDy3fde+kmdFuPq3pI/ouOk4cyYBZt3QrtMg9yI8CMiy1iru4WI2arVoEc0/6w8uar/I
         uSPscY0e18BCanuyT6oGyUU4N+LaYTCDoKYH9GjihElOkNOxyYj21r7vI6eFNWRjXADC
         rUuUiJzBdFO1fFDy0eQjSecc53SJEexQtvdZVpe7l0DhbfR+f4MCkh0jZUHpxGfC9dpR
         glps5cKDhn0kYFZgTG1mg4njQ4hBsBOwTb1VQoWZrdz3x5Ki8uBNi+vouLXytkQZTMU2
         uBDg==
X-Forwarded-Encrypted: i=1; AJvYcCX+ltQE0FswAc+phk0MfuxPG0nukr/Cs6+CQHTg50uYDVhaPTUAiRO0e4a8BXP41pp2WLef8HkhVT3ZYC33@vger.kernel.org
X-Gm-Message-State: AOJu0YyWJb6vt5vydiuAU59OCCbxvxTQccJ1ukr/Nbj+VK1+SKraCI3Z
	eJ47wWyv1d3qnc3QDVlHBZI/iqlylEAA09a5FQAp1BrLHqmOwMf0Jij2rIxlIVZUYlg0zLC+Vri
	hETinXNxcK8E5nFnXIhl70ah7RcknbtLSDiQJ8ae4AoPOkdKJFbUm4sZtJBTNMbWhJ3DV
X-Gm-Gg: ASbGncvVRxWMNitabW1Yt3CIY7ZpyHdJE+J5XbZ2Mpgn+kqSZe+YVzA2W0c0d7BuOIn
	9NK0pSEPmjlzfLSYPAvlhRlyrvBS964DOOVMuoX5GerhDzu01VHgm8U1Y+Fu5v9dxdheWDEqH8Y
	0kSqquzCWdtvI3ylfxkZVPlARw6qXGNS/BSvt/fxgBEHZvYkyZ6SynY/TyxRBRHuo8BepiGWVOY
	H843dBwTOHDMSqAUNbfzjdLfUjEEjjtjyBR95yfb+Lm56BATzrxu8wCA+Bm8nurBHzJt6JuYrbZ
	HUj8nj/5NqNp9TvWHc2pku0cH3aAk76E+GBikXolML6aTGurwvr8SzGBfNNcivhUO4VCFQnXm5d
	/k5hGTLGXwe3muXj5bzV6X8OrEKThGg==
X-Received: by 2002:a17:90b:1c8a:b0:31f:4aab:3b25 with SMTP id 98e67ed59e1d1-321161ea5afmr1697867a91.1.1754090302430;
        Fri, 01 Aug 2025 16:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaw+IzVQFtuco638l8PBl0yq8QYW5BbiEwlT/HEF2/oekik+r3ajg4VxoiXZng3TYDn0nhew==
X-Received: by 2002:a17:90b:1c8a:b0:31f:4aab:3b25 with SMTP id 98e67ed59e1d1-321161ea5afmr1697831a91.1.1754090301908;
        Fri, 01 Aug 2025 16:18:21 -0700 (PDT)
Received: from [10.71.113.238] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3209a849935sm5652221a91.33.2025.08.01.16.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 16:18:20 -0700 (PDT)
Message-ID: <bfd5c9c2-ba3d-4222-8586-9620aa2ec898@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:18:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, lumag@kernel.org,
        neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
 <2025071600-configure-ambush-c139@gregkh>
Content-Language: en-US
In-Reply-To: <2025071600-configure-ambush-c139@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fs7cZE4f c=1 sm=1 tr=0 ts=688d4b3f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EddbWebGST1xqQYBUU0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: r0aGhe1HYDmUIdpJYKi9u7dGnXyGh1iB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE4NiBTYWx0ZWRfX86vN0e0jEFRq
 wI/aSIQV4eISjGB6z/R5tdS3g08MgA+KpvR5jMin8mml93tBh5w1euIb5Q0Ogirisy7M7Hjqrxx
 e903j2AiTnxUBtf910G5il0iNzngSmAFvmCkh2WKn13uwmp7U1It7JEJufgl1fzxYqcu7Vugu8U
 BpdZ0W8q5omUSG/vXSmGMiRENdvFE4gJqZw+gi2x4AUmI99wIpqFnhkqvHljZkwihGde3n/n/Ku
 nRIRYHG7K7csLyEbPFxUW31tEdjtqLy6m4kLYywdfUNYIfgj16ZRqXXS4mtQC8kFsd/mSzSUDUA
 5ImcVCMHq9p2NohP/QnIKiMsW4X8bLKLuLlEMU98suEX5DPc4V5ww4PQyQBkcmvgnf5q+oyhXR0
 DPDGeawZJFHVSdGxVLvIa5Q9n6psMVI7Z8eNj45bkN+WSURuAi2TPg5RRucBfLd1dLCiY/r9
X-Proofpoint-ORIG-GUID: r0aGhe1HYDmUIdpJYKi9u7dGnXyGh1iB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=894 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010186



On 7/15/2025 10:06 PM, Greg KH wrote:
> On Tue, Jul 15, 2025 at 05:52:24PM -0700, Anjelique Melendez wrote:
>> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
>> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
>> This makes the total buffer size increase from 48 bytes to 528 bytes.
>> Update the buffer size to support this increase.
>>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>> Changes since v1:
>>   - Defined buf size in terms of other UCSI defines
>>   - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
>>   - Removed Qualcomm copyright
>>   - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/
>> ---
>>   drivers/usb/typec/ucsi/ucsi_glink.c | 58 ++++++++++++++++++++++++-----
>>   1 file changed, 48 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
>> index 8af79101a2fc..2918c88e54d2 100644
>> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
>> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
>> @@ -16,10 +16,10 @@
>>   
>>   #define PMIC_GLINK_MAX_PORTS		3
>>   
>> -#define UCSI_BUF_SIZE                   48
>> +#define UCSI_BUF_V1_SIZE               (UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
>> +#define UCSI_BUF_V2_SIZE               (UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
>>   
>>   #define MSG_TYPE_REQ_RESP               1
>> -#define UCSI_BUF_SIZE                   48
>>   
>>   #define UC_NOTIFY_RECEIVER_UCSI         0x0
>>   #define UC_UCSI_READ_BUF_REQ            0x11
>> @@ -32,13 +32,25 @@ struct ucsi_read_buf_req_msg {
>>   
>>   struct ucsi_read_buf_resp_msg {
>>   	struct pmic_glink_hdr   hdr;
>> -	u8                      buf[UCSI_BUF_SIZE];
>> +	u8                      buf[UCSI_BUF_V1_SIZE];
>> +	u32                     ret_code;
> 
> What is the endian-ness of ret_code as it comes from the device?

ret_code is little endian but since ret_code = 0 on success we only ever 
check " if (ret_code)" and return early if there is any error.

>> +};
>> +
>> +struct ucsi_v2_read_buf_resp_msg {
>> +	struct pmic_glink_hdr   hdr;
>> +	u8                      buf[UCSI_BUF_V2_SIZE];
>>   	u32                     ret_code;
>>   };
>>   
>>   struct ucsi_write_buf_req_msg {
>>   	struct pmic_glink_hdr   hdr;
>> -	u8                      buf[UCSI_BUF_SIZE];
>> +	u8                      buf[UCSI_BUF_V1_SIZE];
>> +	u32                     reserved;
> 
> What is "reserved" for?  What is it set to?  Where is it tested to
> ensure it is set properly?
The reserved property is part of the message format defined by the 
charger FW(PPM). We do not set it explicitly but I will add length 
checks to our write requests to ensure we do not write to this property.
> 
>> +};
>> +
>> +struct ucsi_v2_write_buf_req_msg {
>> +	struct pmic_glink_hdr   hdr;
>> +	u8                      buf[UCSI_BUF_V2_SIZE];
>>   	u32                     reserved;
>>   };
> 
> And for all of these structures, are you sure there are not "holes" in
> them?  As you are using sizeof(), don't they need to be packed?
> 
Ack - will update to be packed

>>   
>> @@ -72,7 +84,7 @@ struct pmic_glink_ucsi {
>>   	bool ucsi_registered;
>>   	bool pd_running;
>>   
>> -	u8 read_buf[UCSI_BUF_SIZE];
>> +	u8 read_buf[UCSI_BUF_V2_SIZE];
> 
> Why is this one just v2 and not also v1?
  Read_buf[] is used to read back the read_requests. If we added a 
separate read buffer for v2 we would need to add more logic into 
pmic_glink_ucsi_read() and pmic_glink_ucsi_read_ack(). By setting 
read_buf[] to the maximum buffer size (v2) then we can reuse this buffer 
for v1 and v2 and code reuse will be cleaner.

> 
>>   };
>>   
>>   static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
>> @@ -131,8 +143,9 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
>>   static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
>>   					const void *val, size_t val_len)
>>   {
>> -	struct ucsi_write_buf_req_msg req = {};
>> +	struct ucsi_v2_write_buf_req_msg req = {};
>>   	unsigned long left;
>> +	size_t len;
>>   	int ret;
>>   
>>   	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
>> @@ -142,7 +155,18 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
>>   
>>   	reinit_completion(&ucsi->write_ack);
>>   
>> -	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
>> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
>> +		/* If UCSI version is unknown, use the maximum buffer size */
>> +		len = sizeof(req);
>> +	} else {
>> +		/*
>> +		 * If UCSI V1, buffer size should be UCSI_BUF_V1_SIZE so update
>> +		 * len accordingly
>> +		 */
>> +		len = sizeof(struct ucsi_write_buf_req_msg);
>> +	}
>> +
>> +	ret = pmic_glink_send(ucsi->client, &req, len);
>>   	if (ret < 0) {
>>   		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
>>   		return ret;
>> @@ -216,12 +240,26 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
>>   
>>   static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
>>   {
>> -	const struct ucsi_read_buf_resp_msg *resp = data;
>> +	const struct ucsi_v2_read_buf_resp_msg *resp = data;
>> +	u32 ret_code, buffer_len;
>> +
>> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
>> +		/* If UCSI version is unknown, use the maximum buffer size */
>> +		ret_code = resp->ret_code;
> 
> No endian change?

We only check if ret_code == 0, so no need for endian change

> 
>> +		buffer_len = UCSI_BUF_V2_SIZE;
> 
> Shouldn't you warn about this?  Doesn't the version have to be set?
Version is set from a read_request during ucsi_register(). This would be 
the first read_request we receive and should be the only time we do not 
know the version. Will add the ucsi->ucsi_registered var to enforce that 
version is unknown ONLY before ucsi_register() otherwise warn/return error.
> 
> 
>> +	} else {
>> +		/*
>> +		 * If UCSI V1, use UCSI_BUF_V1_SIZE buffer size and
>> +		 * update ret_code offset accordingly
>> +		 */
>> +		ret_code = ((struct ucsi_read_buf_resp_msg *)data)->ret_code;
> 
> Are you sure the buffer was that big?  Where was that checked?
ACK - will add length checks

> 
>> +		buffer_len = UCSI_BUF_V1_SIZE;
>> +	}
>>   
>> -	if (resp->ret_code)
>> +	if (ret_code)
>>   		return;
>>   
>> -	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
>> +	memcpy(ucsi->read_buf, resp->buf, buffer_len);
> 
> Where is the length checked against the "real" length of the buffer
> passed in here?  What happens if the device lies?
> 
Ack - will add length checks
> thanks,
> 
> greg k-h


