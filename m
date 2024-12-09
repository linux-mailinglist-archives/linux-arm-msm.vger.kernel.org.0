Return-Path: <linux-arm-msm+bounces-40976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3939E8E56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6A68160857
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 09:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82102144D4;
	Mon,  9 Dec 2024 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XHcYRuVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4021BC4E;
	Mon,  9 Dec 2024 09:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733735053; cv=none; b=hsJ2pgxJEn5L7qWfBcav0GI+FIhhlnaxqHIFeOyoetK1ABpkoyxKCplAXZNYk+sC3LG04mFXbjO8cf3oRzRWmu9JTX6nI/V+4HdbUFNI0qlY55i340f3WGUbZzdqcvgllESKgapagSbHCZSb5bU+zYZbDrwMGSmVV8gMhiNaj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733735053; c=relaxed/simple;
	bh=H2jZTkLbwk7BN5Is9xz+Nj2EwExGq08ro+t9Y0/Jols=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PdsHCfVRpFkM+S85niU+6DgiR7UBBw3Sn1hBvhFUcjpBBH9lmOK26Z4HFlQFrNxryyzxZplroEj8mpfbwuHZg5oJ36pZWQXXBuDP+1V5nbbOUexQG774TRCG33X2mdczGLXG9PgOrtSWdZXse/MuyOpLcpcHQ4rvHzZnf71W3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XHcYRuVu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NvKRN012014;
	Mon, 9 Dec 2024 09:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixVmgO7fwBaVxwfi3Y1NjGr5PH1H9s6qe0h1vg7w2v4=; b=XHcYRuVudoSIysaj
	QBM8iNYi98TTkF+J+IxncRA0zQfGlzdwoue0iDD4XlI13kQ2p7C+/b0xPvqN1k1X
	kEqCL/ZD1W79c9mTIL7kr2w3F8wHco75kau9WbF6JznZvuRRLUhtkUkO5ek4s3Lx
	irK9ZPEjERFDmV056inMyB5v3kY1n6CorN86XaKsulPAZa6xdBHwsh+mjaDNNzFY
	XgXbcsuOFzf1o/2Exf5JI0kl4CN+QTZpr6w6wJOdt0rUNloJg7DlclyQave3fyM0
	CEjq2RcB6uAZeNPnZIsl6b4r95KuNtXDEx3NQcW38ho3XpZutA2uYKcezj23kq7u
	pq3qZg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdaqc31j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 09:04:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9943Q3019346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 09:04:03 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 01:03:59 -0800
Message-ID: <4ef61f91-f1ae-4593-9522-2229680a9707@quicinc.com>
Date: Mon, 9 Dec 2024 17:03:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] Bluetooth: qca: Expand firmware-name to load
 specific nvm and rampatch
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
 <20241205102213.1281865-3-quic_chejiang@quicinc.com>
 <w7r4itwyrh3jva3rx3kmsm4kqtawqkgkneqrlin4hpjkqb3deo@2qmjd3ijzqn3>
 <541a5682-5b99-4793-84ee-a7c9168cb9a0@quicinc.com>
 <CAA8EJppmTSovZKTPb+syrc0Vvfu8U=HoP18tW072OEZ5nYyOgg@mail.gmail.com>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <CAA8EJppmTSovZKTPb+syrc0Vvfu8U=HoP18tW072OEZ5nYyOgg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yxPQOJY3-5KFthpSUXtms2Q8S-jzzBAg
X-Proofpoint-ORIG-GUID: yxPQOJY3-5KFthpSUXtms2Q8S-jzzBAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090070

Hi Dmitry,

On 12/6/2024 4:34 PM, Dmitry Baryshkov wrote:
> On Fri, 6 Dec 2024 at 05:05, Cheng Jiang (IOE)
> <quic_chejiang@quicinc.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 12/5/2024 8:00 PM, Dmitry Baryshkov wrote:
>>> On Thu, Dec 05, 2024 at 06:22:12PM +0800, Cheng Jiang wrote:
>>>> The firmware-name property has been expanded to specify the names of NVM
>>>> and rampatch firmware for certain chips, such as the QCA6698 Bluetooth
>>>> chip. Although it shares the same IP core as the WCN6855, the QCA6698
>>>> has different RF components and RAM sizes, necessitating new firmware
>>>> files. This change allows for the configuration of NVM and rampatch in
>>>> DT.
>>>>
>>>> Different connectivity boards may be attached to the same platform. For
>>>> example, QCA6698-based boards can support either a two-antenna or
>>>> three-antenna solution, both of which work on the sa8775p-ride platform.
>>>> Due to differences in connectivity boards and variations in RF
>>>> performance from different foundries, different NVM configurations are
>>>> used based on the board ID.
>>>
>>> Two separate commits, one for NVM, another one for RAM patch.
>>>
>> Ack.
>>>>
>>>> Therefore, in the firmware-name property, if the NVM file has an
>>>> extension, the NVM file will be used. Otherwise, the system will first
>>>> try the .bNN (board ID) file, and if that fails, it will fall back to
>>>> the .bin file.
>>>>
>>>> Possible configurations:
>>>> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
>>>> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>>>> firmware-name = "QCA6698/hpnv21.bin";
>>>>
>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>> ---
>>>>  drivers/bluetooth/btqca.c   | 154 ++++++++++++++++++++++++++----------
>>>>  drivers/bluetooth/btqca.h   |   5 +-
>>>>  drivers/bluetooth/hci_qca.c |  21 ++++-
>>>>  3 files changed, 134 insertions(+), 46 deletions(-)
>>>>
>>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>>> index dfbbac922..e8b89b8cc 100644
>>>> --- a/drivers/bluetooth/btqca.c
>>>> +++ b/drivers/bluetooth/btqca.c
>>>> @@ -272,6 +272,31 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
>>>>
>>>> +static int qca_get_alt_nvm_path(char *path, size_t max_size)
>>>
>>> int is usually for errors, the code suggests bool return type.
>>>
>> Ack.
>>>> +{
>>>> +    char fwname[64];
>>>> +    const char *suffix;
>>>> +
>>>> +    suffix = strrchr(path, '.');
>>>> +
>>>> +    if (!suffix)
>>>> +            return 0;
>>>> +
>>>> +    strscpy(fwname, path, strlen(path));
>>>
>>> 64 bytes ought to be enough for anybody, correct?
>>>
>> Yes, in current driver, the max f/w path length is 64.
>>
>>>> +    fwname[suffix - path] = 0;
>>>
>>> with path = "qcom/sc7180/Oh.My.Device/name" this is broken.
>>>
>> Let me test this and fix in next patch.
>>>> +
>>>> +    snprintf(fwname, sizeof(fwname), "%s.bin", fwname);
>>>> +
>>>> +    /* If nvm file is already the default one, return false to
>>>> +     * skip the retry.
>>>> +     */
>>>> +    if (strcmp(fwname, path) == 0)
>>>> +            return 0;
>>>> +
>>>> +    snprintf(path, max_size, "%s", fwname);
>>>> +    return 1;
>>>> +}
>>>> +
>>>>  static int qca_tlv_check_data(struct hci_dev *hdev,
>>>>                             struct qca_fw_config *config,
>>>>                             u8 *fw_data, size_t fw_size,
>>>> @@ -564,6 +589,19 @@ static int qca_download_firmware(struct hci_dev *hdev,
>>>>                                         config->fwname, ret);
>>>>                              return ret;
>>>>                      }
>>>> +            }
>>>> +            /* For nvm, if desired nvm file is not present and it's not the
>>>> +             * default nvm file(ends with .bin), try to load the default nvm.
>>>> +             */
>>>> +            else if (config->type == TLV_TYPE_NVM &&
>>>> +                     qca_get_alt_nvm_path(config->fwname, sizeof(config->fwname))) {
>>>
>>> Please, don't rewrite the config. The file may be not present now, but
>>> it will reappear later (e.g. when rootfs gets mounted).
>>>
>> This tries to load a default NVM file if the board-specific NVM is not found.
>> It is called when request_firmware fails. It's safe to rewrite the config->fwname
>> here since we have already tried to load the board-specific NVM. The config
>> is a local variable in qca_uart_setup and will return after downloading the NVM.
> 
> Please read my question before answering it.
> 
Sorry, I'm not clear about your question. Could you please explain it in more detail? 
I'm not quite sure how the situation you mentioned affects this code flow if you mean
not downloading another NVM file.

The board-specific NVM and the default NVM should be in the same folder and should
appear simultaneously.

From the Bluetooth firmware load flow perspective, the firmware is loaded either 
when the kernel module is inserted (insmod) or when Bluetooth is turned off and 
then on again via a user-space command. If the firmware is not found at this time, 
the ROM code is used instead. It does not attempt to load the firmware automatically,
even if the firmware appears later.

>>>> +                    bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
>>>> +                    ret = request_firmware(&fw, config->fwname, &hdev->dev);
>>>> +                    if (ret) {
>>>> +                            bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>>>> +                                       config->fwname, ret);
>>>> +                            return ret;
>>>> +                    }
>>>>              } else {
>>>>                      bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>>>>                                 config->fwname, ret);
>>>> @@ -730,15 +768,38 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
>>>>                       "qca/%snv%02x.b%02x", stem, rom_ver, bid);
>>>>  }
>>>>
>>>> +static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
>>>> +            const char *firmware_name, struct qca_btsoc_version ver,
>>>> +            enum qca_btsoc_type soc_type, u16 bid)
>>>> +{
>>>> +    const char *variant;
>>>> +
>>>> +    /* Set the variant to empty by default */
>>>> +    variant = "";
>>>> +    /* hsp gf chip */
>>>> +    if (soc_type == QCA_WCN6855) {
>>>> +            if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
>>>> +                    variant = "g";
>>>
>>> Didn't you get the 'set but unused' here?
>>>
>> Yes, miss this part. Thank you!
>>>> +    }
>>>> +
>>>> +    if (bid == 0x0)
>>>
>>> 0x0 or 0xff?
>> board is set to 0 by default, 0x0 means read board id fails, then we should use
>> the default one.
> 
> What is the 'unprogrammed' board_id? On the WiFi side it's usually 0xff.
> 
Yes, the 'unprogrammed' board_id should be 0xffff. Then 0 and 0xffff should use the
default nvm.  
>>>
>>>> +            snprintf(fwname, max_size, "qca/%s.bin", firmware_name);
>>>> +    else if (bid & 0xff00)
>>>> +            snprintf(fwname, max_size, "qca/%s.b%x", firmware_name, bid);
>>>
>>> Doesn't ".b%02x" work in this case too?
>>>
>> No, board id are two bytes, it coudl be 0x0206, then we need .b206. Or it is
>> 0x000a, then we need .b0a.
> 
> What will ".b%02x" write in those two cases?
> 
Yes, it works for both cases. Thanks! 
>>>> +    else
>>>> +            snprintf(fwname, max_size, "qca/%s.b%02x", firmware_name, bid);
>>>> +}
>>>> +
> 
> 


