Return-Path: <linux-arm-msm+bounces-39506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C11E9DBE85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 03:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E06FFB20E55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 02:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9531149C42;
	Fri, 29 Nov 2024 02:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G4vEBZcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D9E22EE4;
	Fri, 29 Nov 2024 02:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732845947; cv=none; b=IVCwY5fOeuSAP+L2u2/2QGuBhKfTVC+cTGZS+SGkN5+0jgjQOW9mSH1kTgaYeNRroBuQ2O5QXcBkKjJEzokxaZi92/JJYoFPhsUPRF6DsDlTn1WHq3KgZjipLcG6I+6OVlSNCPFNREvUb/KaQP9Z0dDnHa3R/cfc+6F8vGYYv94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732845947; c=relaxed/simple;
	bh=8+uf94mF+2IiJHGJK0bVHR0KWg7gBW2a2tR6MfjTgbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nszirrnh65VACPzN2ySMk383G7oddndlXV2NMd4SMhhhnwZiNzaSWPHYjqCeh4ANmfPrpO6qvxrpITo/XL5AwqPqB/uoeAccviPX8AMtYV9AsFqfVZd465zECAQCq3j2hHRVytt/2VU8Nf+9ARZ6pVAymFhJchj/hl4VmhXUVEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G4vEBZcb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASLZ6Re016298;
	Fri, 29 Nov 2024 02:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAkH0MNKLhe6MlIwpJQdjqV2N9tPIk4vKSjHpujt8t0=; b=G4vEBZcb+mWWs58a
	szX6rBnviB9UqYndvLBg9M/ppJbX1K3C0lQ4DsYGxd4pHeUyAQJa8H1QpL2k5Oji
	XR8kUG+FMoy4z7sHm1bV1YQzb/Rah/BBgAiv+sZeKft29F4d0Fm3y+NMPj8n6chD
	WSIUbaouM/s2Fz86/+gnwEYo5VUo4EI/w9wVbksB+Y2Z7wb+Z5rkDdTAXVfuTbre
	/MxgNaBoKBwsYh0j8YviN9THtsmBOpie2LfgU732N5eeasHxCzg97AUpb202bKbS
	+FwonKDtVyF0qvwAPwbVW5zYweNdvhXvq//2617/LeRe8E+AfZMzDkU04w3or8r+
	gxwOwg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xw45t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:05:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT25bgU017824
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:05:37 GMT
Received: from [10.239.28.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:05:33 -0800
Message-ID: <413d9ee5-c46f-4fb8-8140-f1cb5dd9616c@quicinc.com>
Date: Fri, 29 Nov 2024 10:05:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] Bluetooth: btqca: Add QCA6698 support
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
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>,
        <quic_jiaymao@quicinc.com>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
 <20241128120922.3518582-4-quic_chejiang@quicinc.com>
 <xb4jdkkssgy3pmgd2iwawthsbocginbfeb2sbuneztshjiksdl@zswbbijyhxk4>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <xb4jdkkssgy3pmgd2iwawthsbocginbfeb2sbuneztshjiksdl@zswbbijyhxk4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HqkEvgij9hFNQDNT-H7TUQ4wzW4fm4ZO
X-Proofpoint-ORIG-GUID: HqkEvgij9hFNQDNT-H7TUQ4wzW4fm4ZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290015

Hi Dmitry,

On 11/28/2024 9:02 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 28, 2024 at 08:09:22PM +0800, Cheng Jiang wrote:
>> Add support for the QCA6698 Bluetooth chip, which shares the same IP core
>> as the WCN6855. However, it has different RF components and RAM sizes,
>> requiring new firmware files. This patch adds support for loading QCA6698
>> rampatch and NVM from a different directory.
>>
>> Due to variations in RF performance of QCA6698 chips from different
>> foundries, different NVM configurations are used based on board ID.
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  drivers/bluetooth/btqca.c   | 47 ++++++++++++++++++++++++++++++++++++-
>>  drivers/bluetooth/btqca.h   |  1 +
>>  drivers/bluetooth/hci_qca.c | 36 ++++++++++++++++++++++++++--
>>  3 files changed, 81 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index dfbbac922..24bf00cac 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -700,6 +700,21 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
>>  	return 0;
>>  }
>>  
>> +int qca_check_firmware_exists(const char *name, struct hci_dev *hdev)
>> +{
>> +	const struct firmware *fw;
>> +	int ret;
>> +
>> +	ret = firmware_request_nowarn(&fw, name, &hdev->dev);
>> +	if (ret) {
>> +		bt_dev_warn(hdev, "Firmware %s does not exist. Use default", name);
> 
> No useless warnings
Ack.
> 
>> +		return 0;
>> +	}
>> +
>> +	release_firmware(fw);
>> +	return 1;
>> +}
>> +
>>  static void qca_generate_hsp_nvm_name(char *fwname, size_t max_size,
>>  		struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
>>  {
>> @@ -730,6 +745,26 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
>>  			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
>>  }
>>  
>> +static void qca_get_qca6698_nvm_name(struct hci_dev *hdev, char *fwname,
>> +		size_t max_size, struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
>> +{
>> +	const char *variant;
>> +
>> +	/* hsp gf chip */
>> +	if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
>> +		variant = "g";
>> +	else
>> +		variant = "";
>> +
>> +	if (bid != 0x0)
>> +		snprintf(fwname, max_size, "qca/QCA6698/hpnv%02x%s.b%04x", rom_ver,
>> +			 variant, bid);
>> +
>> +	/* if board id is 0 or the nvm file doesn't exisit, use the default */
>> +	if (bid == 0x0 || !qca_check_firmware_exists(fwname, hdev))
>> +		snprintf(fwname, max_size, "qca/QCA6698/hpnv%02x%s.bin", rom_ver, variant);
> 
> So, do you want to load the same firmware twice? You've asked for it
> already, if it is present, use it.
This is only used to check the nvm exists or not. Yes, it's loaded twice if the nvm exist.
It's just to avoid too much changes of the firmware download on the current driver. 
> 
> Anyway, if you have followed previous discussions, you'd have known that
> it has been recommended to use DT's firmware-name instead of pushing
> everything to the driver.
Sorry, I misunderstand the comment here. I thought it was to add a compact string. 
"qcom,qca6698-bt", since both the meothods can solve our requriment. If use DT's
firmware-name is perfered, I can provide a change based on it. 

"
Need because of the product needs or need because of the existing
firmware not working with the chip?
Wait... your WiFi colleagues were more helpful and they wrote that "it
has different RF,
IPA, thermal, RAM size and etc, so new firmware files used." ([1]).
Please include that information in your commit messages too to let
reviewers understand  what is going on.

[1] https://lore.kernel.org/linux-arm-msm/20241024002514.92290-1-quic_miaoqing@quicinc.com/

> Let me check if using
> "firmware-name" allows us to omit the new soc type.
> From the driver's perspective, the only change is the need to load a
> different firmware.

If you want to emphasise that it is not just WCN6855, extend schema to
use fallback compatibles:
compat = "qcom,qca6698-bt", "qcom,wcn6855-bt"; No driver changes are
necessary with this approach.
"
> 
>> +}
>> +
>>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
>>  		   const char *firmware_name)
>> @@ -796,6 +831,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/hmtbtfw%02x.tlv", rom_ver);
>>  		break;
>> +	case QCA_QCA6698:
>> +		snprintf(config.fwname, sizeof(config.fwname),
>> +			 "qca/QCA6698/hpbtfw%02x.tlv", rom_ver);
>> +		break;
>>  	default:
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/rampatch_%08x.bin", soc_ver);
>> @@ -810,7 +849,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	/* Give the controller some time to get ready to receive the NVM */
>>  	msleep(10);
>>  
>> -	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
>> +	if (soc_type == QCA_QCA2066 || soc_type == QCA_QCA6698)
>>  		qca_read_fw_board_id(hdev, &boardid);
>>  
>>  	/* Download NVM configuration */
>> @@ -854,6 +893,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  		case QCA_WCN7850:
>>  			qca_get_nvm_name_generic(&config, "hmt", rom_ver, boardid);
>>  			break;
>> +		case QCA_QCA6698:
>> +			qca_get_qca6698_nvm_name(hdev, config.fwname,
>> +				sizeof(config.fwname), ver, rom_ver, boardid);
>> +			break;
>>  
>>  		default:
>>  			snprintf(config.fwname, sizeof(config.fwname),
>> @@ -874,6 +917,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	case QCA_WCN6750:
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>> +	case QCA_QCA6698:
>>  		err = qca_disable_soc_logging(hdev);
>>  		if (err < 0)
>>  			return err;
>> @@ -909,6 +953,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	case QCA_WCN6750:
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>> +	case QCA_QCA6698:
>>  		/* get fw build info */
>>  		err = qca_read_fw_build_info(hdev);
>>  		if (err < 0)
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index bb5207d7a..67c16d8f2 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -151,6 +151,7 @@ enum qca_btsoc_type {
>>  	QCA_WCN3991,
>>  	QCA_QCA2066,
>>  	QCA_QCA6390,
>> +	QCA_QCA6698,
>>  	QCA_WCN6750,
>>  	QCA_WCN6855,
>>  	QCA_WCN7850,
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 37129e6cb..70bdc046c 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1361,6 +1361,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
>>  	case QCA_WCN6750:
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>> +	case QCA_QCA6698:
>>  		usleep_range(1000, 10000);
>>  		break;
>>  
>> @@ -1447,6 +1448,7 @@ static int qca_check_speeds(struct hci_uart *hu)
>>  	case QCA_WCN6750:
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>> +	case QCA_QCA6698:
>>  		if (!qca_get_speed(hu, QCA_INIT_SPEED) &&
>>  		    !qca_get_speed(hu, QCA_OPER_SPEED))
>>  			return -EINVAL;
>> @@ -1489,6 +1491,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>>  		case QCA_WCN6750:
>>  		case QCA_WCN6855:
>>  		case QCA_WCN7850:
>> +		case QCA_QCA6698:
>>  			hci_uart_set_flow_control(hu, true);
>>  			break;
>>  
>> @@ -1523,6 +1526,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>>  		case QCA_WCN6750:
>>  		case QCA_WCN6855:
>>  		case QCA_WCN7850:
>> +		case QCA_QCA6698:
>>  			hci_uart_set_flow_control(hu, false);
>>  			break;
>>  
>> @@ -1803,6 +1807,7 @@ static int qca_power_on(struct hci_dev *hdev)
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>>  	case QCA_QCA6390:
>> +	case QCA_QCA6698:
>>  		ret = qca_regulator_init(hu);
>>  		break;
>>  
>> @@ -1878,6 +1883,10 @@ static int qca_setup(struct hci_uart *hu)
>>  		soc_name = "qca2066";
>>  		break;
>>  
>> +	case QCA_QCA6698:
>> +		soc_name = "qca6698";
>> +		break;
>> +
>>  	case QCA_WCN3988:
>>  	case QCA_WCN3990:
>>  	case QCA_WCN3991:
>> @@ -1919,6 +1928,7 @@ static int qca_setup(struct hci_uart *hu)
>>  	case QCA_WCN6750:
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>> +	case QCA_QCA6698:
>>  		qcadev = serdev_device_get_drvdata(hu->serdev);
>>  		if (qcadev->bdaddr_property_broken)
>>  			set_bit(HCI_QUIRK_BDADDR_PROPERTY_BROKEN, &hdev->quirks);
>> @@ -1952,6 +1962,7 @@ static int qca_setup(struct hci_uart *hu)
>>  	case QCA_WCN6750:
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>> +	case QCA_QCA6698:
>>  		break;
>>  
>>  	default:
>> @@ -2089,6 +2100,20 @@ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
>>  	.num_vregs = 0,
>>  };
>>  
>> +static const struct qca_device_data qca_soc_data_qca6698 __maybe_unused = {
>> +	.soc_type = QCA_QCA6698,
> 
> No. It's the same as WCN6855. You don't need extra SoC type for it.
> 
>> +	.vregs = (struct qca_vreg []) {
>> +		{ "vddio", 5000 },
>> +		{ "vddbtcxmx", 126000 },
>> +		{ "vddrfacmn", 12500 },
>> +		{ "vddrfa0p8", 102000 },
>> +		{ "vddrfa1p7", 302000 },
>> +		{ "vddrfa1p2", 257000 },
>> +	},
>> +	.num_vregs = 6,
>> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
>> +};
>> +
>>  static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
>>  	.soc_type = QCA_WCN6750,
>>  	.vregs = (struct qca_vreg []) {
>> @@ -2179,6 +2204,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
>>  
>>  	case QCA_WCN6750:
>>  	case QCA_WCN6855:
>> +	case QCA_QCA6698:
>>  		gpiod_set_value_cansleep(qcadev->bt_en, 0);
>>  		msleep(100);
>>  		qca_regulator_disable(qcadev);
>> @@ -2333,6 +2359,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>>  	case QCA_QCA6390:
>> +	case QCA_QCA6698:
>>  		qcadev->bt_power = devm_kzalloc(&serdev->dev,
>>  						sizeof(struct qca_power),
>>  						GFP_KERNEL);
>> @@ -2346,6 +2373,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>  	switch (qcadev->btsoc_type) {
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>> +	case QCA_QCA6698:
>>  		if (!device_property_present(&serdev->dev, "enable-gpios")) {
>>  			/*
>>  			 * Backward compatibility with old DT sources. If the
>> @@ -2380,7 +2408,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>  					       GPIOD_OUT_LOW);
>>  		if (IS_ERR(qcadev->bt_en) &&
>>  		    (data->soc_type == QCA_WCN6750 ||
>> -		     data->soc_type == QCA_WCN6855)) {
>> +		     data->soc_type == QCA_WCN6855 ||
>> +		     data->soc_type == QCA_QCA6698)) {
>>  			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
>>  			return PTR_ERR(qcadev->bt_en);
>>  		}
>> @@ -2393,7 +2422,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>  		if (IS_ERR(qcadev->sw_ctrl) &&
>>  		    (data->soc_type == QCA_WCN6750 ||
>>  		     data->soc_type == QCA_WCN6855 ||
>> -		     data->soc_type == QCA_WCN7850)) {
>> +		     data->soc_type == QCA_WCN7850 ||
>> +		     data->soc_type == QCA_QCA6698)) {
>>  			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
>>  			return PTR_ERR(qcadev->sw_ctrl);
>>  		}
>> @@ -2475,6 +2505,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>>  	case QCA_WCN6750:
>>  	case QCA_WCN6855:
>>  	case QCA_WCN7850:
>> +	case QCA_QCA6698:
>>  		if (power->vregs_on)
>>  			qca_power_shutdown(&qcadev->serdev_hu);
>>  		break;
>> @@ -2669,6 +2700,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
>>  	{ .compatible = "qcom,qca2066-bt", .data = &qca_soc_data_qca2066},
>>  	{ .compatible = "qcom,qca6174-bt" },
>>  	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
>> +	{ .compatible = "qcom,qca6698-bt", .data = &qca_soc_data_qca6698},
>>  	{ .compatible = "qcom,qca9377-bt" },
>>  	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
>>  	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
>> -- 
>> 2.25.1
>>
> 


