Return-Path: <linux-arm-msm+bounces-41187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01629EA49A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 03:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CFCC165FB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 02:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2884206B;
	Tue, 10 Dec 2024 02:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d2oczcBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA35E1863E;
	Tue, 10 Dec 2024 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733796071; cv=none; b=Mae6J84KzT6VJ6nUWGnpkemeXYXyalkDQIdDqCR0C4FSxWW/WPxAIoDbOXlaTsiOvqx5B4gMC50qhw8hF/F/XMM600xBR+ncF+txvSnsVM8uyphjGpJAdlIW0puCWfQmhX6h2fTgGB3HgnupQsMNKlFqWjOzaIMaVev/131YFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733796071; c=relaxed/simple;
	bh=UDoezaD9GEWSvqBc0IKW9bh4YL0YarQfGjFB9gbTm0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QmAVLdtWaTd0R5phSpPS9aoWybKj9cZ2yMJW1Y0GVltjyKITnkVUHC4G36cEeXy+4UlPok+jjdBUnaFhpZ7fMo1wbo+9b43Tg0gsJ4gKMFhClrfE15/iA1ipCJ5PKIg+fbIU9iIvCsJjBFjRdLNBu3NolXJHtBNUMmbsQOkTg5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d2oczcBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9HQM3c002487;
	Tue, 10 Dec 2024 02:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbgtzVoqUir8ya8NUHuhE09i/YwLkeSdHmalwSZ9sv0=; b=d2oczcBvWtss47f5
	Cf5ADZ9vpztQY+HG9vG+Nk0K+JbjUQEzEt26ramEg5DQ8kPaYIxbUCmDffzevSaS
	UcpUykUHfoG0iVobvlWIm5bW/mTmka+3cPH3cVauUZFFquHrSH7gOpn2QdgFVsk9
	dE7movfVoRWwuBqdF9+VdshAzMysBbaRz0VXYdOTHtWkVFNFHYk65GSI7MITYA+P
	NrQG9BfZwqa9qMTjylSgKxBDimL5vWDNIaHtqFRhWl+LBMGVEApiwmKpKi7V6e89
	OpyAXO6jm4uYG/nezP0rtQhiHz6QX22HVkSpRXaKUWGX7cR+Z8XstYCMA4ZF8+25
	RNNqMA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw42gtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 02:01:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA20xII000674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 02:00:59 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 18:00:53 -0800
Message-ID: <1e0fc6f8-9f5d-4f62-a379-ea9b0161fc84@quicinc.com>
Date: Tue, 10 Dec 2024 10:00:51 +0800
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
 <f7dd3758-c1c8-43bb-9a5c-4674077a5e1b@quicinc.com>
 <CAA8EJpqRAqH-+3xYpSyF3cqFoF9bDbEKSqx5o5XrLZMgati41A@mail.gmail.com>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <CAA8EJpqRAqH-+3xYpSyF3cqFoF9bDbEKSqx5o5XrLZMgati41A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PTpfyy9Ul5CCcFk54SzShYQmBrLpSaJj
X-Proofpoint-GUID: PTpfyy9Ul5CCcFk54SzShYQmBrLpSaJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100012

Hi Dmitry,

On 12/10/2024 12:04 AM, Dmitry Baryshkov wrote:
> On Mon, 9 Dec 2024 at 15:59, Cheng Jiang (IOE)
> <quic_chejiang@quicinc.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 12/9/2024 6:49 PM, Dmitry Baryshkov wrote:
>>> On Mon, Dec 09, 2024 at 05:03:55PM +0800, Cheng Jiang (IOE) wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 12/6/2024 4:34 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, 6 Dec 2024 at 05:05, Cheng Jiang (IOE)
>>>>> <quic_chejiang@quicinc.com> wrote:
>>>>>>
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> On 12/5/2024 8:00 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Dec 05, 2024 at 06:22:12PM +0800, Cheng Jiang wrote:
>>>>>>>> The firmware-name property has been expanded to specify the names of NVM
>>>>>>>> and rampatch firmware for certain chips, such as the QCA6698 Bluetooth
>>>>>>>> chip. Although it shares the same IP core as the WCN6855, the QCA6698
>>>>>>>> has different RF components and RAM sizes, necessitating new firmware
>>>>>>>> files. This change allows for the configuration of NVM and rampatch in
>>>>>>>> DT.
>>>>>>>>
>>>>>>>> Different connectivity boards may be attached to the same platform. For
>>>>>>>> example, QCA6698-based boards can support either a two-antenna or
>>>>>>>> three-antenna solution, both of which work on the sa8775p-ride platform.
>>>>>>>> Due to differences in connectivity boards and variations in RF
>>>>>>>> performance from different foundries, different NVM configurations are
>>>>>>>> used based on the board ID.
>>>>>>>
>>>>>>> Two separate commits, one for NVM, another one for RAM patch.
>>>>>>>
>>>>>> Ack.
>>>>>>>>
>>>>>>>> Therefore, in the firmware-name property, if the NVM file has an
>>>>>>>> extension, the NVM file will be used. Otherwise, the system will first
>>>>>>>> try the .bNN (board ID) file, and if that fails, it will fall back to
>>>>>>>> the .bin file.
>>>>>>>>
>>>>>>>> Possible configurations:
>>>>>>>> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
>>>>>>>> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>>>>>>>> firmware-name = "QCA6698/hpnv21.bin";
>>>>>>>>
>>>>>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>>>>>> ---
>>>>>>>>  drivers/bluetooth/btqca.c   | 154 ++++++++++++++++++++++++++----------
>>>>>>>>  drivers/bluetooth/btqca.h   |   5 +-
>>>>>>>>  drivers/bluetooth/hci_qca.c |  21 ++++-
>>>>>>>>  3 files changed, 134 insertions(+), 46 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>>>>>>> index dfbbac922..e8b89b8cc 100644
>>>>>>>> --- a/drivers/bluetooth/btqca.c
>>>>>>>> +++ b/drivers/bluetooth/btqca.c
>>>>>>>> @@ -272,6 +272,31 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>>>>>>>>  }
>>>>>>>>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
>>>>>>>>
>>>>>>>> +static int qca_get_alt_nvm_path(char *path, size_t max_size)
>>>>>>>
>>>>>>> int is usually for errors, the code suggests bool return type.
>>>>>>>
>>>>>> Ack.
>>>>>>>> +{
>>>>>>>> +    char fwname[64];
>>>>>>>> +    const char *suffix;
>>>>>>>> +
>>>>>>>> +    suffix = strrchr(path, '.');
>>>>>>>> +
>>>>>>>> +    if (!suffix)
>>>>>>>> +            return 0;
>>>>>>>> +
>>>>>>>> +    strscpy(fwname, path, strlen(path));
>>>>>>>
>>>>>>> 64 bytes ought to be enough for anybody, correct?
>>>>>>>
>>>>>> Yes, in current driver, the max f/w path length is 64.
>>>>>>
>>>>>>>> +    fwname[suffix - path] = 0;
>>>>>>>
>>>>>>> with path = "qcom/sc7180/Oh.My.Device/name" this is broken.
>>>>>>>
>>>>>> Let me test this and fix in next patch.
>>>>>>>> +
>>>>>>>> +    snprintf(fwname, sizeof(fwname), "%s.bin", fwname);
>>>>>>>> +
>>>>>>>> +    /* If nvm file is already the default one, return false to
>>>>>>>> +     * skip the retry.
>>>>>>>> +     */
>>>>>>>> +    if (strcmp(fwname, path) == 0)
>>>>>>>> +            return 0;
>>>>>>>> +
>>>>>>>> +    snprintf(path, max_size, "%s", fwname);
>>>>>>>> +    return 1;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>  static int qca_tlv_check_data(struct hci_dev *hdev,
>>>>>>>>                             struct qca_fw_config *config,
>>>>>>>>                             u8 *fw_data, size_t fw_size,
>>>>>>>> @@ -564,6 +589,19 @@ static int qca_download_firmware(struct hci_dev *hdev,
>>>>>>>>                                         config->fwname, ret);
>>>>>>>>                              return ret;
>>>>>>>>                      }
>>>>>>>> +            }
>>>>>>>> +            /* For nvm, if desired nvm file is not present and it's not the
>>>>>>>> +             * default nvm file(ends with .bin), try to load the default nvm.
>>>>>>>> +             */
>>>>>>>> +            else if (config->type == TLV_TYPE_NVM &&
>>>>>>>> +                     qca_get_alt_nvm_path(config->fwname, sizeof(config->fwname))) {
>>>>>>>
>>>>>>> Please, don't rewrite the config. The file may be not present now, but
>>>>>>> it will reappear later (e.g. when rootfs gets mounted).
>>>>>>>
>>>>>> This tries to load a default NVM file if the board-specific NVM is not found.
>>>>>> It is called when request_firmware fails. It's safe to rewrite the config->fwname
>>>>>> here since we have already tried to load the board-specific NVM. The config
>>>>>> is a local variable in qca_uart_setup and will return after downloading the NVM.
>>>>>
>>>>> Please read my question before answering it.
>>>>>
>>>> Sorry, I'm not clear about your question. Could you please explain it in more detail?
>>>> I'm not quite sure how the situation you mentioned affects this code flow if you mean
>>>> not downloading another NVM file.
>>>>
>>>> The board-specific NVM and the default NVM should be in the same folder and should
>>>> appear simultaneously.
>>>>
>>>> From the Bluetooth firmware load flow perspective, the firmware is loaded either
>>>> when the kernel module is inserted (insmod) or when Bluetooth is turned off and
>>>> then on again via a user-space command. If the firmware is not found at this time,
>>>> the ROM code is used instead. It does not attempt to load the firmware automatically,
>>>> even if the firmware appears later.
>>>
>>> I was thinking about the following scenario:
>>>
>>> - BT firmware is attempted to load during driver probe, /lib/firmware is
>>>   not fully populated, so the config is rewritten to use the default
>>> - rootfs is fully mounted and populated with the board-specific file
>>> - BT interface is being turned on. It is expected that the
>>>   board-specific file will be loaded, however because the config was
>>>   changed in one of the previous steps, the driver still loads the
>>>   default one.
>>>
>>> That said, the driver should perform the fallback, etc, but the config
>>> should stay intact even in the fallback case.
>>>
>> Thank you for the detail explanation. Current flow of BT enable in driver
>> likes this:
>>
>> Enable the soc(Assert BT_EN) -->  read the SOC info --> Change baud rate -->
>> get rampatch file name (based on soc info or dts) --> download rampatch -->
>> get nvm file name(based on soc info or dts) --> download nvm file -->
>> download default nvm (if the board-specific file not found).
>>
>> Every time the driver probe or the BT interface is turned on, it follows the
>> flow described above. The rampatch and NVM file names are reconstructed by
>> the SoC information each time, so the driver always attempts to download the
>> board-specific file first.
>>
>> Here is the log, there is no hpnv21.b206 and re-insmod the driver.
> 
> You are re-insmodding the driver. I was talking about a different scenario:
> - there is no BDF
> - modprobe the driver
> - wait for the hci0 to become available
> - hciconfig hci0 down
> - provide BDF
> - hciconfig hci0 up
> 
> Check the dmesg. If everything is implemented correctly, second
> hciconfig command should load the firmware files again (because BT was
> unpowered in between). Second time it should load the proper board
> file instead of loading the default or falling back to the ROM.
> 
Yes, the 'hciconfig hci0 up' will load the proper board file, since it also follows 
the flow described above. 

Here is the dmesg:

sh-5.1# mv hpnv21.b206 hpnv21.b2069                 -- Remove the board specific nvm
sh-5.1# rmmod hci_uart
sh-5.1# insmod /lib/modules/6.6.52-dirty/kernel/drivers/bluetooth/hci_uart.ko
sh-5.1# dmesg|grep -i bluetooth

[54781.019527] Bluetooth: HCI UART driver ver 2.3
[54781.019538] Bluetooth: HCI UART protocol H4 registered
[54781.019589] Bluetooth: HCI UART protocol LL registered
[54781.019612] Bluetooth: HCI UART protocol QCA registered
[54781.020893] Bluetooth: hci0: setting up wcn6855
[54781.087027] Bluetooth: hci0: QCA Product ID   :0x00000013
[54781.087037] Bluetooth: hci0: QCA SOC Version  :0x400c0210
[54781.087039] Bluetooth: hci0: QCA ROM Version  :0x00000201
[54781.087042] Bluetooth: hci0: QCA Patch Version:0x000038e6
[54781.104087] Bluetooth: hci0: QCA controller version 0x02100201
[54781.104097] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpbtfw21.tlv
[54781.794628] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpnv21.b206
[54781.794671] bluetooth hci0: Direct firmware load for qca/QCA6698/hpnv21.b206 failed with error -2
[54781.794677] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpnv21.bin
[54781.958319] Bluetooth: hci0: QCA setup on UART is completed
[54781.981490] Bluetooth: MGMT ver 1.22

No board specific nvm found, use the default one.
Disable hci0 and add the board specific nvm, then enable hci0.

sh-5.1# hciconfig hci0 down
sh-5.1# mv hpnv21.b2069 hpnv21.b206
sh-5.1# hciconfig hci0 up
sh-5.1# dmesg|grep -i bluetooth
[54834.686170] Bluetooth: hci0: setting up wcn6855
[54834.750997] Bluetooth: hci0: QCA Product ID   :0x00000013
[54834.751006] Bluetooth: hci0: QCA SOC Version  :0x400c0210
[54834.751010] Bluetooth: hci0: QCA ROM Version  :0x00000201
[54834.751013] Bluetooth: hci0: QCA Patch Version:0x000038e6
[54834.761826] Bluetooth: hci0: QCA controller version 0x02100201
[54834.761833] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpbtfw21.tlv
[54835.450621] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpnv21.b206
[54835.614015] Bluetooth: hci0: QCA setup on UART is completed

Load the board-specific nvm when enable hci0.

>> [11850.644220] Bluetooth: HCI UART driver ver 2.3
>> [11850.644232] Bluetooth: HCI UART protocol H4 registered
>> [11850.644284] Bluetooth: HCI UART protocol LL registered
>> [11850.644314] Bluetooth: HCI UART protocol QCA registered
>> [11850.645055] Bluetooth: hci0: setting up wcn6855
>> [11850.706962] Bluetooth: hci0: QCA Product ID   :0x00000013
>> [11850.706975] Bluetooth: hci0: QCA SOC Version  :0x400c0210
>> [11850.706978] Bluetooth: hci0: QCA ROM Version  :0x00000201
>> [11850.706981] Bluetooth: hci0: QCA Patch Version:0x000038e6
>> [11850.714508] Bluetooth: hci0: QCA controller version 0x02100201
>> [11850.714518] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpbtfw21.tlv
>> [11851.406475] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpnv21.b206
>> [11851.406515] bluetooth hci0: Direct firmware load for qca/QCA6698/hpnv21.b206 failed with error -2
>> [11851.406522] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpnv21.bin
>> [11851.570125] Bluetooth: hci0: QCA setup on UART is completed
>>
>> hpnv21.b206 exists and then re-insmod the driver.
>> [11878.551494] Bluetooth: HCI UART driver ver 2.3
>> [11878.551505] Bluetooth: HCI UART protocol H4 registered
>> [11878.551553] Bluetooth: HCI UART protocol LL registered
>> [11878.551580] Bluetooth: HCI UART protocol QCA registered
>> [11878.552131] Bluetooth: hci0: setting up wcn6855
>> [11878.618865] Bluetooth: hci0: QCA Product ID   :0x00000013
>> [11878.618877] Bluetooth: hci0: QCA SOC Version  :0x400c0210
>> [11878.618881] Bluetooth: hci0: QCA ROM Version  :0x00000201
>> [11878.618884] Bluetooth: hci0: QCA Patch Version:0x000038e6
>> [11878.629674] Bluetooth: hci0: QCA controller version 0x02100201
>> [11878.629681] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpbtfw21.tlv
>> [11879.318475] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpnv21.b206
>> [11879.482082] Bluetooth: hci0: QCA setup on UART is completed
>> [11879.505086] Bluetooth: MGMT ver 1.22
>>
>> Turn on BT has the similar log.
>>>>
>>>>>>>> +                    bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
>>>>>>>> +                    ret = request_firmware(&fw, config->fwname, &hdev->dev);
>>>>>>>> +                    if (ret) {
>>>>>>>> +                            bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>>>>>>>> +                                       config->fwname, ret);
>>>>>>>> +                            return ret;
>>>>>>>> +                    }
>>>>>>>>              } else {
>>>>>>>>                      bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>>>>>>>>                                 config->fwname, ret);
>>>>>>>> @@ -730,15 +768,38 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
>>>>>>>>                       "qca/%snv%02x.b%02x", stem, rom_ver, bid);
>>>>>>>>  }
>>>>>>>>
>>>>>>>> +static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
>>>>>>>> +            const char *firmware_name, struct qca_btsoc_version ver,
>>>>>>>> +            enum qca_btsoc_type soc_type, u16 bid)
>>>>>>>> +{
>>>>>>>> +    const char *variant;
>>>>>>>> +
>>>>>>>> +    /* Set the variant to empty by default */
>>>>>>>> +    variant = "";
>>>>>>>> +    /* hsp gf chip */
>>>>>>>> +    if (soc_type == QCA_WCN6855) {
>>>>>>>> +            if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
>>>>>>>> +                    variant = "g";
>>>>>>>
>>>>>>> Didn't you get the 'set but unused' here?
>>>>>>>
>>>>>> Yes, miss this part. Thank you!
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    if (bid == 0x0)
>>>>>>>
>>>>>>> 0x0 or 0xff?
>>>>>> board is set to 0 by default, 0x0 means read board id fails, then we should use
>>>>>> the default one.
>>>>>
>>>>> What is the 'unprogrammed' board_id? On the WiFi side it's usually 0xff.
>>>>>
>>>> Yes, the 'unprogrammed' board_id should be 0xffff. Then 0 and 0xffff should use the
>>>> default nvm.
>>>
>>> Good. I think it's safe to safe board_id to 0xffff by default, then you
>>> don't have to handle '0' specially.
>>>
>>>>>>>
>>>>>>>> +            snprintf(fwname, max_size, "qca/%s.bin", firmware_name);
>>>>>>>> +    else if (bid & 0xff00)
>>>>>>>> +            snprintf(fwname, max_size, "qca/%s.b%x", firmware_name, bid);
>>>>>>>
>>>>>>> Doesn't ".b%02x" work in this case too?
>>>>>>>
>>>>>> No, board id are two bytes, it coudl be 0x0206, then we need .b206. Or it is
>>>>>> 0x000a, then we need .b0a.
>>>>>
>>>>> What will ".b%02x" write in those two cases?
>>>>>
>>>> Yes, it works for both cases. Thanks!
>>>
>>> :-)
>>>
>>>>>>>> +    else
>>>>>>>> +            snprintf(fwname, max_size, "qca/%s.b%02x", firmware_name, bid);
>>>>>>>> +}
>>>>>>>> +
>>>>>
>>>>>
>>>>
>>>
>>
> 
> 


