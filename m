Return-Path: <linux-arm-msm+bounces-79316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E27C17FE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA9A7562001
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559192E8B9F;
	Wed, 29 Oct 2025 02:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gEANWOkC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4EF2D063E;
	Wed, 29 Oct 2025 02:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703337; cv=none; b=uCczaKPlvqj+b4sck/MOOWe9Bspv6nt/LSE5dfOPDOPe3K2gMenO3lkOTyzR0PRjmXg2RrmG48+XNvnkpp+U55rrQ2R432L8ulGTvlO44SIbWeLZzvC2lP7NY0nfBNSRXij3WlHMYJ1asbEOYlOk0esZNlLXrffSVMeuYMXJz0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703337; c=relaxed/simple;
	bh=XPYo+OcuJfY4bg4iIJy8r60Ch0ORGWa4PGjWOKP83B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g2eqve4sm9MEpK9ic+jlKEfKMWPahudZQXon/zyYjTG+G7bEGr67tbWzcFazZvw5TwvoM+o5HPFbJVGVdv3xzt3A3/dlk2ANgsdCsbboOXBIfv2WCiD+F27PD/6AEVjGZ7OqwisDcL3FLmP1pcEHMsy5vQWKBHkNACy0dP4C0pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gEANWOkC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlp1Q2524410;
	Wed, 29 Oct 2025 02:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Viz5wsOpGT8upDjX2IF3pJhY3V85XL5P9gmczHCL13U=; b=gEANWOkC62cDsFcj
	A19DD8os7BEvxjR8/TUC4gDrl8lXFzCm59f9VKl4Q6zdbp+OwXsFnv9kqT7cKpuz
	twqJkiFtAfvPqA2q+7z/cLpW3oeGYhidRA/QcUqn9NMnz8f3URkUummwqj/WRlqF
	4PBQopXIapUTnZBsgm9WNRQzGzGsCsiGya2IOF8M31bxSdV5hitYr3cK26hMCAS3
	9QR8ub/LPtnr4xV/LOBnbl2e5cSWxzgXOIXpgvzMTEKgstkTlHxcUNzJGgNQv/a3
	TPyKE9tXlKU1/whra6H8GWkmC9ggOM8ZQ2dV7PDu2XL0G0L2bhW+4rrfDXZaLl5j
	4bXlWA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1rtuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 02:02:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59T22A28025262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 02:02:10 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 28 Oct
 2025 19:02:08 -0700
Message-ID: <ee4478c6-32ca-4c30-aee6-994f39532dc7@quicinc.com>
Date: Wed, 29 Oct 2025 10:02:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btusb: add default nvm file
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <marcel@holtmann.org>, <luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>, <stable@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_chejiang@quicinc.com>
References: <20251028120550.2225434-1-quic_shuaz@quicinc.com>
 <3fluuwp2gxkc7ev5ddd2y5niga3tn77bxb6ojbpaoblbufepek@owcrah4exoky>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <3fluuwp2gxkc7ev5ddd2y5niga3tn77bxb6ojbpaoblbufepek@owcrah4exoky>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RZvxOyEZTw_UzKXaejm8NiWkPU5kwe08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxNCBTYWx0ZWRfX+6bE2sZ+PTaw
 vD+FJIz3X+2exuRiJQjjL5vsIwct249vV0sSt/2zTdS1MvBqzIPXctUan/p9Bt3i2NU5vW55bTf
 6bV34Mdo58qtqdj+5SeU8y1ZiyebSxhdMnYQBs82qao++vqoGOi/TKzXJc5QjUh9SMcRNAOHz/Z
 zIjiZsds04zcTLgw9wGf9wkWXGkDLWFnmP8bxzgvxauUEKZ8Prm5B/6UQ4Imf5o+RhCZTpv5qHf
 7avFDwO74yt2o2IOMzSD2mvTXKSlE+0j9YzmO8kMtB4TadWbLHb2sKISGYLD+9uHHoLU8MCE5wc
 /nWmwiTrtzlFIkE7S0DwXxDUCyCJPgbcR9dMAUo4KxUqEDUzAMJKvWmV1t36KjuAEfjirCVPjZk
 c5KY7fKQXGS88b1Zu2qZs5aweeJpsA==
X-Proofpoint-ORIG-GUID: RZvxOyEZTw_UzKXaejm8NiWkPU5kwe08
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=690175a3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=GyBpgepc4qxS4VxvXCQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290014

Hi Dmitry

On 10/29/2025 12:57 AM, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 08:05:50PM +0800, Shuai Zhang wrote:
>> If no NVM file matches the board_id, load the default NVM file.
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/btusb.c | 19 +++++++++++++++----
>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index dcbff7641..998dfd455 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -3482,15 +3482,14 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>>  }
>>  
>>  static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
>> -					const struct qca_version *ver)
>> +					const struct qca_version *ver,
>> +					u16 board_id)
>>  {
>>  	u32 rom_version = le32_to_cpu(ver->rom_version);
>>  	const char *variant, *fw_subdir;
>>  	int len;
>> -	u16 board_id;
>>  
>>  	fw_subdir = qca_get_fw_subdirectory(ver);
>> -	board_id = qca_extract_board_id(ver);
>>  
>>  	switch (le32_to_cpu(ver->ram_version)) {
>>  	case WCN6855_2_0_RAM_VERSION_GF:
>> @@ -3522,13 +3521,25 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
>>  	const struct firmware *fw;
>>  	char fwname[80];
>>  	int err;
>> +	u16 board_id = 0;
>>  
>> -	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);
>> +	board_id = qca_extract_board_id(ver);
>>  
>> +retry:
>> +	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, board_id);
>>  	err = request_firmware(&fw, fwname, &hdev->dev);
>>  	if (err) {
>> +		if (err == -EINVAL) {
>> +			bt_dev_err(hdev, "QCOM BT firmware file request failed (%d)", err);
>> +			return err;
>> +		}
>> +
>>  		bt_dev_err(hdev, "failed to request NVM file: %s (%d)",
>>  			   fwname, err);
>> +		if (err == -ENOENT && board_id != 0) {
>> +			board_id = 0;
>> +			goto retry;
>> +		}
> 
> I'd rather see here:
> 
>   } else {
> 	bt_dev_err(hdev, "QCOM BT firmware file request failed (%d)", err);
> 	return err;
>   }
> 

This will make the log clearer. Thank you for your suggestion;I will update it.

>>  		return err;
>>  	}
>>  
>> -- 
>> 2.34.1
>>
> 
BR，
Shuai


