Return-Path: <linux-arm-msm+bounces-85362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72747CC3756
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7310830345A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF2C396551;
	Tue, 16 Dec 2025 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAXtGcPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T67HATNN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3227E3930FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889694; cv=none; b=bpky+dav3xi/U+W8O+VCH8NFDLTbI+GmWsFBl3C+WcjDWk8np/8NgjN2FUiX5QFtK290x4dEwpsU0hwYQBjR+MKkdmv2jlNZx7i/xZSUFpH3JAgMGBLLlrwpyayVLKFPbxeXkC+O44DzY/PWefIym7vb9MLKGh91KlBGOvX/LA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889694; c=relaxed/simple;
	bh=SSqR88fpb9ksBZbpfRf3fRZQS2LXTpBbW1Tf4Fp1hmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxXsXHwbjgfpW7fwq/qhv8OMnwy2vOfA2l1KTYewJGMywA9NG4sjOrvT2UbwMZHN6f3ivEmpRjdeoqkmdPn+5+/dS14mVaz3owDka01k38CUqK4IzdebzndsF+w80im/VXCgNxESb2nMsFQTDbOqpUTd/t2NBMqDcvun9JmNPUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAXtGcPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T67HATNN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGAMUoM3829869
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9SWB05If3zXHAGVb92TBbx8PB+hF1CMn/2pbWH8pQQ=; b=fAXtGcPzt+TNyEG7
	vefIl6Rpe+ELeQj6tqsu03IlpxVyQIWbPxx0q4wLu1CiSJuix82W/2O+3O9zdm7g
	BMVSwHozs+EBsK6vBo4PKv+Cu1Vw4oFsjFBSmrVhOacVv3QQxpxmHw0lkz7hkVZK
	Zq9nQtI5bMgHLsbJw3dD1JOt/l+KMSYm8XUe0kGKMNIgkFbTREfDSmP098lvLqcc
	lV/H7ekTGuR7J3LP95AnO+JxzG2F4p2i4dfq0T/bcJXN0uy6kQw7M2BCK73cCIDt
	1R6uc5spekDeMDpVaTbxRuw09qpsHob020TsanvgjWO/w1T7I1Y2V4jRrtSGL8oK
	2cD45w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b35m2rh8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:54:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bde2e654286so4102575a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765889691; x=1766494491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9SWB05If3zXHAGVb92TBbx8PB+hF1CMn/2pbWH8pQQ=;
        b=T67HATNNdSsFkxraYpzYRhoMKsO5JmAT45v1wmMEiF72eFDboo44gEE3XLYnSzCdwy
         892hopgl5Yx2IP/11kQsV4Km9BD2wUJmBjzHj1UQ9L9NxAv+0vHtWlNeKitKi5HoTmU5
         yp8t8Hhc8hIotAoAC/29MpGrYnMQI0eIRgH+72EXb+nQhjyb9Cblo+5Gfe6uKVB6H6XV
         vi9byPVADP2Uz4OkqvEh6BGT09Lf/BO0eFOcF/igXYYXWUQc/2FiSsodmeB6uqtyxNy9
         KAf8zSqFC2KQzf2PKggTcJP6mfxP1UyjlLPrMr01wT3SYFKq8mbRV8TLjK9R3f49zG7l
         pFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889691; x=1766494491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9SWB05If3zXHAGVb92TBbx8PB+hF1CMn/2pbWH8pQQ=;
        b=VTFSwTs0Pa+8TOaSMNW7n5XTUATTxu1FwhVAxPLPGElhLHE7TDOb3NHGEdrPH7mSOq
         yR7glGMrGa2kFRSuis0zunvJpjvVpXGIdre3MnQSAFC2hgaJGzT57ziWRdGg7tukX8Zg
         AO01EsmdjEk3zDOhIb8G/gsCA31wV/cVqVfYS+YaaFS2HZUp3010f7MAjSU58ZCxSmNo
         DK7idJZroLcwIrJEulxRcJSvNl8574fczTMdq/4PuVT9umgDvI57MBKgFfsTqUe1hx+Y
         52b/NtyAA0Kp6pJRO+wpGJJ2Oy2Mtfcvhrwt+/irseefYlpD9ZihYlF4qoIOtUqQbTKx
         brOw==
X-Forwarded-Encrypted: i=1; AJvYcCWKjFF4iBycnt0NSnsIVjIY6df4eBxbEtMDchCV94Vcz1CplBC+koyW1+k+78360ibkx27OIE+9n+ptpo1b@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/W/LrP5OwGUgDG3fO4nr3rmzwt0TAjfbu3m6n6cM7gHGPT7a
	Dk9hQx/jOj54gzUb/9+3ZFpRjtr88bb6t8N5SZNK8wTkxEmLUHRVtUx4nrr4YH3JMwgJRWYVO4O
	nHZDuZYtKHDtE7fIT5wzJYSGRD0pvVczDoeMgAaJvVus+Gz98DV+Cbj+vyQaTtA8+tRab
X-Gm-Gg: AY/fxX4qfMhyj1/xR8flc11R80bqiyM4HThdUf6OiF0BcdiP8y0/voAijANXFNGIpxU
	dXG1v4I+7e7zuQyF359eC9gOKkbeKQdFPiJjyZigXymXWVC/7alWOC/ROz7D32ieGtZFC5/vZvz
	+2Tp3R/2Lyk1iscGhTSaGPGmB1jm0lFcA7NuH2ZXvUAOxo8ukkyuFJMpmeQgijQDZq/LRHLqJes
	ggSssf8+8/L8oIuHDDvFAYuQFwiMzWRDLdTeSkcMLceo3+3Z+6b7yO6EfT1Bitii84hOuPajAel
	4ei99Gz+qYi6GV9E1rShTtDx99uvopWuBlvRK6CiMV47Za5tC67Oyzvvs2dtLlc1IRRt00P2iuH
	/t/XECSCKAXNu6L7hGeVkt1Tj/+3SdoMi+MVJx6AEKSRvylOR6AHr/mzgPHshI91psQ==
X-Received: by 2002:a05:7022:3b08:b0:11c:e661:2590 with SMTP id a92af1059eb24-11f34ac0107mr9164029c88.20.1765889690950;
        Tue, 16 Dec 2025 04:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnU0Stty4zuWHkD0ixupltQ2qJSohzYW1Zd+bRg/AdnN5oZOcXL6/wcmVQawVoq31/R88rrw==
X-Received: by 2002:a05:7022:3b08:b0:11c:e661:2590 with SMTP id a92af1059eb24-11f34ac0107mr9164003c88.20.1765889690312;
        Tue, 16 Dec 2025 04:54:50 -0800 (PST)
Received: from [10.110.94.105] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f446460c8sm16583927c88.10.2025.12.16.04.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:54:49 -0800 (PST)
Message-ID: <cee7d849-54ca-486b-b168-086e44f1762f@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 20:54:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com
References: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
 <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
 <mtp3qxngbnlpzk2cdp45ndtecab2h56ocwm6cp5ia7butra55a@bevidj6vdwzj>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <mtp3qxngbnlpzk2cdp45ndtecab2h56ocwm6cp5ia7butra55a@bevidj6vdwzj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LpGfC3dc c=1 sm=1 tr=0 ts=6941569c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1c6WF0r0LC7BQEIA1L0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: SnC0ko8y_pCg_XLd8A3VCQV9CkFQ1iN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfX+y2X384rqlXS
 fWxumcHDR61z3cYCgyq+SOck/2RBTMf+uNgMAfm3wGK5LQEaRAdf4PoLydcwqaY9Rd3STLArKnd
 OE08zwChRIxWBeMhmDXFGqfN2W5s560ubHT5MkgRaCCoN9crFsgwou3yWMoiYj5EPkHrx3Yox/y
 cjE7xpPTcySUutrUgLS83eq+uLJHzscOaN5dD6ty64p50pETWlCuTu66g2nerOj2FqhtdDR2DwF
 61Ns6xshMQe5wdl2lXOtmziUdzNdWEKu7p6fSkZSh9tuGsLvw82eYUnWcZeKiywkcl/X5cvTeZ5
 UK72ynPQnL1FVgESIcagpDgtskPCUHFRsK74U0sz/UCbSsregvz2qAXzmxXkykb9Slw8krX+wqH
 PD6slUNDlCaddwgjgAg07pcsVju9eA==
X-Proofpoint-ORIG-GUID: SnC0ko8y_pCg_XLd8A3VCQV9CkFQ1iN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160109

Hi Dmitry

On 11/19/2025 3:59 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 17, 2025 at 10:16:45AM +0800, Shuai Zhang wrote:
>> Historically, WCN685x and QCA2066 shared the same firmware files.
>> Now, changes are planned for the firmware that will make it incompatible
>> with QCA2066, so a new firmware name is required for WCN685x.
>>
>> Test Steps:
>>   - Boot device
>>   - Check the BTFW loading status via dmesg
>>
>> Sanity pass and Test Log:
>> QCA Downloading qca/wcnhpbftfw21.tlv
>> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
>> QCA Downloading qca/hpbftfw21.tlv
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index 7c958d606..8e0004ef7 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>   				 "qca/msbtfw%02x.mbn", rom_ver);
>>   			break;
>>   		case QCA_WCN6855:
>> +			/* Due to historical reasons, WCN685x chip has been using firmware
>> +			 * without the "wcn" prefix. The mapping between the chip and its
>> +			 * corresponding firmware has now been corrected.
>> +			 */
>>   			snprintf(config.fwname, sizeof(config.fwname),
>> -				 "qca/hpbtfw%02x.tlv", rom_ver);
>> +				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
>>   			break;
>>   		case QCA_WCN7850:
>>   			snprintf(config.fwname, sizeof(config.fwname),
>> @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>   	}
>>   
>>   	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>> +
>> +	if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
>> +		snprintf(config.fwname, sizeof(config.fwname),
>> +			 "qca/hpbtfw%02x.tlv", rom_ver);
>> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>> +	}
> Is there a reason for ignoring how it was done already for other cases when
> we need a similar fallback? Please extend the existing code (or rewrite
> it) instead of adding a similar hook at a completely different place.

Sorry, I missed this email. I will resubmit the new changes using the 
existing callback mechanism.

>> +
>>   	if (err < 0) {
>>   		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
>>   		return err;
>> @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>   		case QCA_WCN6855:
>>   			qca_read_fw_board_id(hdev, &boardid);
>>   			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>> -						  "hpnv", soc_type, ver, rom_ver, boardid);
>> +						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
>>   			break;
>>   		case QCA_WCN7850:
>>   			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>> @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>   	}
>>   
>>   	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>> +
>> +	if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
>> +		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>> +					  "hpnv", soc_type, ver, rom_ver, boardid);
>> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>> +	}
>> +
>>   	if (err < 0) {
>>   		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>>   		return err;
>> -- 
>> 2.34.1

Thanks,

Shuai


