Return-Path: <linux-arm-msm+bounces-41323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8939EB442
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEC571675DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1E51AA786;
	Tue, 10 Dec 2024 15:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lc0IP/im"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D91A072A;
	Tue, 10 Dec 2024 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843035; cv=none; b=eVF/Zwny1fpkyj/Kl/jat5SxBd8247LlYAl9l18KifxQ5uyJfZvfz8NRlAZ4nu0DYKcSs5ZEBECpcdAm0zzKRUtYzn0Vxwkukz6B/lkmzaF2y8vo/9AXX+iJIKHgef4MB4zL/EFcNcTZhACOsrKqk4Dy9cCOgseOb4h29nKS1Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843035; c=relaxed/simple;
	bh=u8AsEspJ2r2jjfbPPlHBTU6WBJYa4HlD1it/c/fJdzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g2FXYNoa1D7zK54Q9q4PIClrJj4zbPCLN1+O5d5qBTNaQZuYpC82pidAcc6CQK0+k2YuQqgZgGaITYQ9Yk3SB+3bbnoTw7bO3yqInnsXDnrZ7L+cmsV8AiXOuMujLKxbTDhPkFzHKcmbWcJBoJ3/KUrOPHvwSxNRok1ieSvoGAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lc0IP/im; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA9sTsd018809;
	Tue, 10 Dec 2024 15:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsQwKmZ2gnyeT1g80gOnM7x0rgtDoVWxp5S4GUfBf/I=; b=Lc0IP/imNQJ3RI0J
	KmPahm0CZEprcscglCWg+dglJ7kX9GmyGh7udy7yn1a+M8TytrYoZHZJZQsqaTsj
	zjMjvXCY/dq+dW8eeCPffZa/SuYIO8Nb4D+bhHmMcd7bJdATYh2Qs7Q8F8H1MhE/
	C3jHCVjLgmyCtPvOMkDVDbtDrj5H57sv+bdJHBqDjFnZmOvQi4XmTDba3DHVtj+7
	8nMc+CAuyWQHxQ9ix/30mkn6LoioLGacaNRrfaxKJDFZ2IN4v2VrEOyZqqajJTEV
	mKtgpqOq1fNqIkSblCbh3sxKI08i4YfC6WGn8Loxu0H4U72eZQvZAW0hmARg0yIj
	r4ARHA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak3a9s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:03:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAF3gOd007183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:03:42 GMT
Received: from [10.253.78.12] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 07:03:37 -0800
Message-ID: <ccce8ed3-1bf9-434c-bcb9-943d380544a2@quicinc.com>
Date: Tue, 10 Dec 2024 23:03:35 +0800
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
 <4ef61f91-f1ae-4593-9522-2229680a9707@quicinc.com>
 <fb7exdibh4f5r3io6m34i7lqqe7qo2kk357bfdzcdbie6cppui@mqwwq5w4c57j>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <fb7exdibh4f5r3io6m34i7lqqe7qo2kk357bfdzcdbie6cppui@mqwwq5w4c57j>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RUsAdvfJMAisksEi8FexfJmGHJebrhDw
X-Proofpoint-GUID: RUsAdvfJMAisksEi8FexfJmGHJebrhDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100112

Hi Dmitry,

On 12/9/2024 6:49 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 09, 2024 at 05:03:55PM +0800, Cheng Jiang (IOE) wrote:
>> Hi Dmitry,
>>
>> On 12/6/2024 4:34 PM, Dmitry Baryshkov wrote:
>>> On Fri, 6 Dec 2024 at 05:05, Cheng Jiang (IOE)
>>> <quic_chejiang@quicinc.com> wrote:
>>>>
>>>> Hi Dmitry,
>>>>
>>>> On 12/5/2024 8:00 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Dec 05, 2024 at 06:22:12PM +0800, Cheng Jiang wrote:
>>>>>> The firmware-name property has been expanded to specify the names of NVM
>>>>>> and rampatch firmware for certain chips, such as the QCA6698 Bluetooth
>>>>>> chip. Although it shares the same IP core as the WCN6855, the QCA6698
>>>>>> has different RF components and RAM sizes, necessitating new firmware
>>>>>> files. This change allows for the configuration of NVM and rampatch in
>>>>>> DT.
>>>>>>
>>>>>> Different connectivity boards may be attached to the same platform. For
>>>>>> example, QCA6698-based boards can support either a two-antenna or
>>>>>> three-antenna solution, both of which work on the sa8775p-ride platform.
>>>>>> Due to differences in connectivity boards and variations in RF
>>>>>> performance from different foundries, different NVM configurations are
>>>>>> used based on the board ID.
>>>>>
>>>>> Two separate commits, one for NVM, another one for RAM patch.
>>>>>
>>>> Ack.
>>>>>>
>>>>>> Therefore, in the firmware-name property, if the NVM file has an
>>>>>> extension, the NVM file will be used. Otherwise, the system will first
>>>>>> try the .bNN (board ID) file, and if that fails, it will fall back to
>>>>>> the .bin file.
>>>>>>
>>>>>> Possible configurations:
>>>>>> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
>>>>>> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>>>>>> firmware-name = "QCA6698/hpnv21.bin";
>>>>>>
>>>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>>>> ---
>>>>>>  drivers/bluetooth/btqca.c   | 154 ++++++++++++++++++++++++++----------
>>>>>>  drivers/bluetooth/btqca.h   |   5 +-
>>>>>>  drivers/bluetooth/hci_qca.c |  21 ++++-
>>>>>>  3 files changed, 134 insertions(+), 46 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>>>>> index dfbbac922..e8b89b8cc 100644
>>>>>> --- a/drivers/bluetooth/btqca.c
>>>>>> +++ b/drivers/bluetooth/btqca.c
>>>>>> @@ -272,6 +272,31 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>>>>>>  }
>>>>>>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
>>>>>>
>>>>>> +static int qca_get_alt_nvm_path(char *path, size_t max_size)
>>>>>
>>>>> int is usually for errors, the code suggests bool return type.
>>>>>
>>>> Ack.
>>>>>> +{
>>>>>> +    char fwname[64];
>>>>>> +    const char *suffix;
>>>>>> +
>>>>>> +    suffix = strrchr(path, '.');
>>>>>> +
>>>>>> +    if (!suffix)
>>>>>> +            return 0;
>>>>>> +
>>>>>> +    strscpy(fwname, path, strlen(path));
>>>>>
>>>>> 64 bytes ought to be enough for anybody, correct?
>>>>>
>>>> Yes, in current driver, the max f/w path length is 64.
>>>>
>>>>>> +    fwname[suffix - path] = 0;
>>>>>
>>>>> with path = "qcom/sc7180/Oh.My.Device/name" this is broken.
>>>>>
>>>> Let me test this and fix in next patch.
>>>>>> +
>>>>>> +    snprintf(fwname, sizeof(fwname), "%s.bin", fwname);
>>>>>> +
>>>>>> +    /* If nvm file is already the default one, return false to
>>>>>> +     * skip the retry.
>>>>>> +     */
>>>>>> +    if (strcmp(fwname, path) == 0)
>>>>>> +            return 0;
>>>>>> +
>>>>>> +    snprintf(path, max_size, "%s", fwname);
>>>>>> +    return 1;
>>>>>> +}
>>>>>> +
>>>>>>  static int qca_tlv_check_data(struct hci_dev *hdev,
>>>>>>                             struct qca_fw_config *config,
>>>>>>                             u8 *fw_data, size_t fw_size,
>>>>>> @@ -564,6 +589,19 @@ static int qca_download_firmware(struct hci_dev *hdev,
>>>>>>                                         config->fwname, ret);
>>>>>>                              return ret;
>>>>>>                      }
>>>>>> +            }
>>>>>> +            /* For nvm, if desired nvm file is not present and it's not the
>>>>>> +             * default nvm file(ends with .bin), try to load the default nvm.
>>>>>> +             */
>>>>>> +            else if (config->type == TLV_TYPE_NVM &&
>>>>>> +                     qca_get_alt_nvm_path(config->fwname, sizeof(config->fwname))) {
>>>>>
>>>>> Please, don't rewrite the config. The file may be not present now, but
>>>>> it will reappear later (e.g. when rootfs gets mounted).
>>>>>
>>>> This tries to load a default NVM file if the board-specific NVM is not found.
>>>> It is called when request_firmware fails. It's safe to rewrite the config->fwname
>>>> here since we have already tried to load the board-specific NVM. The config
>>>> is a local variable in qca_uart_setup and will return after downloading the NVM.
>>>
>>> Please read my question before answering it.
>>>
>> Sorry, I'm not clear about your question. Could you please explain it in more detail? 
>> I'm not quite sure how the situation you mentioned affects this code flow if you mean
>> not downloading another NVM file.
>>
>> The board-specific NVM and the default NVM should be in the same folder and should
>> appear simultaneously.
>>
>> From the Bluetooth firmware load flow perspective, the firmware is loaded either 
>> when the kernel module is inserted (insmod) or when Bluetooth is turned off and 
>> then on again via a user-space command. If the firmware is not found at this time, 
>> the ROM code is used instead. It does not attempt to load the firmware automatically,
>> even if the firmware appears later.
> 
> I was thinking about the following scenario:
> 
> - BT firmware is attempted to load during driver probe, /lib/firmware is
>   not fully populated, so the config is rewritten to use the default
> - rootfs is fully mounted and populated with the board-specific file
> - BT interface is being turned on. It is expected that the
>   board-specific file will be loaded, however because the config was
>   changed in one of the previous steps, the driver still loads the
>   default one.
> 
> That said, the driver should perform the fallback, etc, but the config
> should stay intact even in the fallback case.
> 
>>
>>>>>> +                    bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
>>>>>> +                    ret = request_firmware(&fw, config->fwname, &hdev->dev);
>>>>>> +                    if (ret) {
>>>>>> +                            bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>>>>>> +                                       config->fwname, ret);
>>>>>> +                            return ret;
>>>>>> +                    }
>>>>>>              } else {
>>>>>>                      bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>>>>>>                                 config->fwname, ret);
>>>>>> @@ -730,15 +768,38 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
>>>>>>                       "qca/%snv%02x.b%02x", stem, rom_ver, bid);
>>>>>>  }
>>>>>>
>>>>>> +static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
>>>>>> +            const char *firmware_name, struct qca_btsoc_version ver,
>>>>>> +            enum qca_btsoc_type soc_type, u16 bid)
>>>>>> +{
>>>>>> +    const char *variant;
>>>>>> +
>>>>>> +    /* Set the variant to empty by default */
>>>>>> +    variant = "";
>>>>>> +    /* hsp gf chip */
>>>>>> +    if (soc_type == QCA_WCN6855) {
>>>>>> +            if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
>>>>>> +                    variant = "g";
>>>>>
>>>>> Didn't you get the 'set but unused' here?
>>>>>
>>>> Yes, miss this part. Thank you!
>>>>>> +    }
>>>>>> +
>>>>>> +    if (bid == 0x0)
>>>>>
>>>>> 0x0 or 0xff?
>>>> board is set to 0 by default, 0x0 means read board id fails, then we should use
>>>> the default one.
>>>
>>> What is the 'unprogrammed' board_id? On the WiFi side it's usually 0xff.
>>>
>> Yes, the 'unprogrammed' board_id should be 0xffff. Then 0 and 0xffff should use the
>> default nvm.  
> 
> Good. I think it's safe to safe board_id to 0xffff by default, then you
> don't have to handle '0' specially.
> 
Sorry, I missed this comment, we have read board id of 0 from some boards in other project.
So it's better to check both 0 and 0xffff. It aligns with current driver implementation. 
>>>>>
>>>>>> +            snprintf(fwname, max_size, "qca/%s.bin", firmware_name);
>>>>>> +    else if (bid & 0xff00)
>>>>>> +            snprintf(fwname, max_size, "qca/%s.b%x", firmware_name, bid);
>>>>>
>>>>> Doesn't ".b%02x" work in this case too?
>>>>>
>>>> No, board id are two bytes, it coudl be 0x0206, then we need .b206. Or it is
>>>> 0x000a, then we need .b0a.
>>>
>>> What will ".b%02x" write in those two cases?
>>>
>> Yes, it works for both cases. Thanks! 
> 
> :-)
> 
>>>>>> +    else
>>>>>> +            snprintf(fwname, max_size, "qca/%s.b%02x", firmware_name, bid);
>>>>>> +}
>>>>>> +
>>>
>>>
>>
> 


