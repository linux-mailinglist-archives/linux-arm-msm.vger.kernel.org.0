Return-Path: <linux-arm-msm+bounces-81012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F2C46BCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D4553468CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97ACE1F3FEC;
	Mon, 10 Nov 2025 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lMk8+nm1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70191AF4D5;
	Mon, 10 Nov 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762779733; cv=none; b=EYRmKhZlnta2aT+DGGlNjJb4435g2OfTjuYY5c1fImU4NML0LezhVxXmHY8zZyvARjuTUv0YVQ4yPm82Nur81C5AB8RaY2GdcIBS6wspMpGGjRqFHkEEaekk8Mp5sZqD4OTW+gQzc84iGCwohe4ttuZf1Snst0M8atVPDY1UByo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762779733; c=relaxed/simple;
	bh=/iRpT42Ct0JcZ/9l/Gf0HpbKDJYGvChbpDpCuuz26Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DJszB2iHM9R/mdmoDL03dFLm/6vXimRil1xHWceTO6nq5JaOEqzWpSkxV/9dZAmgnJ4ZmDBd4uzdbhVdnNqbBHytATFxeI4rYXb0s4yGOl2YcE1Tx1nTqR6KdRZXyiw/H+Dq8BmFROiP3zYa68UVhlrCEGJsG/4JonwMNVxUvdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lMk8+nm1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9EjjR2992484;
	Mon, 10 Nov 2025 13:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	64uSw9MBieeARPXvcbyqf8qMx9t2B+6dl1TjRtx1sKQ=; b=lMk8+nm1I9pj1Oe3
	JKzz1xRjxp8t83T6GgvpZ1heWrtRMpU0PbPJq8HqAcBTavlQ3GEbG0XB3fZyPuFJ
	dIShtbr4lSx0Xvlhk0hkX4nxEaZJ5DIoDEGSUu22WJnbkGr3gZHJg0oKHTqf0Ul0
	Ap2spkViV1Cv9qPKaIZ1q0Fpt2TKSIDj6KnGcuyttV9dortOpfMat5FGcYpMiTwQ
	hcrepzb/Ewjg6471pAtNN7sWhdwZKds49bKx9kTQ08+3z4Gept1fkufHnmRa4+MA
	TrgGKEu9zq6ZJuYOwW6bpB6XCK+3JV0oHRi97xsRuZGSc6JKVV8wcqFCJI3v+PNx
	5wi/Eg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88rmx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 13:01:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AAD1rDx029704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 13:01:53 GMT
Received: from [10.253.12.191] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 10 Nov
 2025 05:01:50 -0800
Message-ID: <78fa2388-3815-4ba5-84c8-38d85e880221@quicinc.com>
Date: Mon, 10 Nov 2025 21:01:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] Bluetooth: btusb: add default nvm file
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_chejiang@quicinc.com>,
        <quic_jiaymao@quicinc.com>, <quic_chezhou@quicinc.com>
References: <20251110034134.1016537-1-quic_shuaz@quicinc.com>
 <20251110034134.1016537-2-quic_shuaz@quicinc.com>
 <5dc5f0f7-3dfa-403a-821d-b4fdb800d1e8@molgen.mpg.de>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <5dc5f0f7-3dfa-403a-821d-b4fdb800d1e8@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IfDscjtEhmrTXSPNvQDboxpHTbSEiO-P
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=6911e242 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=94ha7TBJcUfFed-zCi4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNCBTYWx0ZWRfX/8nm+4+ptQ8w
 /qX7VUkrJ7xZJVQSowl2NV/I54ZvhdXXfCt0DcAixw5z+SpUCID0X4uLZ5C1OCCnCk9wlCmugmj
 JRfhaqRfGN5HDwsnuH1B6h5CS3Mr8VxrqkF0hvLCN3jtP3PTkznoqv+VOyq+cgmEAK3Ffpx8P+C
 Wij+z93SAYWVE/ek7cnplZw24XdNNmGNzmiVWV67tIPrgeC34dzuHgiSaRcPudGD8fonyweB8dP
 bGSjfQ9CvGjcAZi2yvThciCpZC45PbOC3mNgCKxQ5ulk8nj4rG6HRhJ0hA/SkHGHZJw7EYdQ3md
 p0vwqnKtDIjZE6bje6d8swdBjojeCBkduFIkX3IQ45Kbu5EdMP7D/0qP0Rx6jkZ6uziNv+pWxXk
 wQKC4zAe9pX4nJgDDcEVKJ84MrpCMw==
X-Proofpoint-ORIG-GUID: IfDscjtEhmrTXSPNvQDboxpHTbSEiO-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100114

Dear Paul

Thank you for taking the time to review it.

On 11/10/2025 4:01 PM, Paul Menzel wrote:
> Dear Shuai,
> 
> 
> Thank you for the patch.
> 
> Am 10.11.25 um 04:41 schrieb Shuai Zhang:
>> If no NVM file matches the board_id, load the default NVM file.
> 
> Maybe also add the comment, that the NVM file is always compatible(?) and just might not give the best performance.
> 

The default NVM file may differ in functionality and performance because specific NVM files enable certain 
vendor commands based on chip capabilities. To ensure compatibility, the logic to load a default NVM file is added
when a dedicated NVM file is not yet available, so that basic BT functionality remains operational.

> Also, please add a comment about passing board_id now. (Is that necessary or just an optimization?)
> 

The board_id is used to determine the appropriate NVM file, and it is mandatory.

I will also update the new patch to include these comments.

>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>   drivers/bluetooth/btusb.c | 26 +++++++++++++++++---------
>>   1 file changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index dcbff7641..020dbb0ab 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -3482,15 +3482,14 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>>   }
>>     static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
>> -                    const struct qca_version *ver)
>> +                    const struct qca_version *ver,
>> +                    u16 board_id)
>>   {
>>       u32 rom_version = le32_to_cpu(ver->rom_version);
>>       const char *variant, *fw_subdir;
>>       int len;
>> -    u16 board_id;
>>         fw_subdir = qca_get_fw_subdirectory(ver);
>> -    board_id = qca_extract_board_id(ver);
>>         switch (le32_to_cpu(ver->ram_version)) {
>>       case WCN6855_2_0_RAM_VERSION_GF:
>> @@ -3517,14 +3516,14 @@ static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
>>     static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
>>                       struct qca_version *ver,
>> -                    const struct qca_device_info *info)
>> +                    const struct qca_device_info *info,
>> +                    u16 board_id)
>>   {
>>       const struct firmware *fw;
>>       char fwname[80];
>>       int err;
>>   -    btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);
>> -
>> +    btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, board_id);
>>       err = request_firmware(&fw, fwname, &hdev->dev);
>>       if (err) {
>>           bt_dev_err(hdev, "failed to request NVM file: %s (%d)",
>> @@ -3606,10 +3605,19 @@ static int btusb_setup_qca(struct hci_dev *hdev)
>>       btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
>>         if (!(status & QCA_SYSCFG_UPDATED)) {
>> -        err = btusb_setup_qca_load_nvm(hdev, &ver, info);
>> -        if (err < 0)
>> -            return err;
>> +        u16 board_id = qca_extract_board_id(&ver);
>>   +        err = btusb_setup_qca_load_nvm(hdev, &ver, info, board_id);
>> +        if (err < 0) {
>> +            //if the board id is not 0, try to load the defalut nvm file
> 
> Did `checkpatch.pl` not complain about the missing space, and misspelling of *default*?

Sorry for the typo. I will update it. > 
>> +            if (err == -ENOENT && board_id != 0) {
>> +                err = btusb_setup_qca_load_nvm(hdev, &ver, info, 0);
>> +                if (err < 0)
>> +                    return err;
>> +            } else {
>> +                return err;
>> +            }
>> +        }
>>           /* WCN6855 2.1 and later will reset to apply firmware downloaded here, so
>>            * wait ~100ms for reset Done then go ahead, otherwise, it maybe
>>            * cause potential enable failure.
> 
> Please try to catch the style errors before submitting patches.
> 

 I will update it. 

> 
> Kind regards,
> 
> Paul

Best,regard
Shuai


