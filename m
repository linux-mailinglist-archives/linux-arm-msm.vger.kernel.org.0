Return-Path: <linux-arm-msm+bounces-40653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 009BA9E6489
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43E231885441
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBB813BAD7;
	Fri,  6 Dec 2024 03:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k3yogkh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B4034CDE;
	Fri,  6 Dec 2024 03:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733454331; cv=none; b=MC3+BymfTsAHb4Ez3imOSg8H2bFw4x+UUTjrYJw7KpyEEKAbaAortuG8/x6mPr3DP/qVQ73+hWH6jI2ZJF4JaM1ixIU9mehX2jNPucIeit5UP8Uk9VVipVpdZ6UtCddEoh7fy/wXPY0yP0G8xNJtVN4MmkHrp9uWmJFO6eq6M7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733454331; c=relaxed/simple;
	bh=ZsJ/AkFVM1vSiRsReteToVnPFEEH/Jn05rWtnPj/bRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GfDunRI9+mlNg1/vTyW97CmTNKLmu5nkka0tdgRrRXGYUQwY0YFwFTQgCVN41ItdYRAKWNNm1tzYi6IizajQ6CzwRsWKciy0oKJJCYK4rgs7w9mpPatFRq8pI4uM4fWQ4jkNvH9tRx+0prvzfP8DqiK308sEl9b4hxr0XX1nuPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k3yogkh4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaqNG022239;
	Fri, 6 Dec 2024 03:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wb6HvNkPo0RS94wY7W+nxoGXztB92f45MvHNf1PKXsc=; b=k3yogkh4tc1x4oyv
	YXIsWfJllWMMDo7F13GofauY379XrEZwjFbtK9Nbb5WP5Cv8mZynFutK/uanxqAf
	r1zdwwk1kAHxW24uDfuZcX3JgyieL72QGfbpw/HzLsWDhWCxT4mPRDEqfAP7F6fK
	kjvrOQAfNZTHjwfx+OI5EYYa0CSUt605uN88osMzTdwB4vy7IgvjnYJnv+ByucDl
	4pVnVadMlB+dAc8QKQPGvpuxC/BPkJeeqyzVr9sygIx9kiManhhOnvwSjgstJbX9
	nGAcBEf1bK4LCxjDfAmVBFCjGNAEnrEL5jQSpB+h65Fy2tEpcpmlmwYcXTKI5vc9
	pIMkcg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v801q8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 03:05:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B635M6e027157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 03:05:22 GMT
Received: from [10.239.28.113] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 19:05:15 -0800
Message-ID: <541a5682-5b99-4793-84ee-a7c9168cb9a0@quicinc.com>
Date: Fri, 6 Dec 2024 11:05:12 +0800
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
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <w7r4itwyrh3jva3rx3kmsm4kqtawqkgkneqrlin4hpjkqb3deo@2qmjd3ijzqn3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RTBB0hjoKQ16T1u-igp7ybYrjV907hJZ
X-Proofpoint-GUID: RTBB0hjoKQ16T1u-igp7ybYrjV907hJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060021

Hi Dmitry,

On 12/5/2024 8:00 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 06:22:12PM +0800, Cheng Jiang wrote:
>> The firmware-name property has been expanded to specify the names of NVM
>> and rampatch firmware for certain chips, such as the QCA6698 Bluetooth
>> chip. Although it shares the same IP core as the WCN6855, the QCA6698
>> has different RF components and RAM sizes, necessitating new firmware
>> files. This change allows for the configuration of NVM and rampatch in
>> DT.
>>
>> Different connectivity boards may be attached to the same platform. For
>> example, QCA6698-based boards can support either a two-antenna or
>> three-antenna solution, both of which work on the sa8775p-ride platform.
>> Due to differences in connectivity boards and variations in RF
>> performance from different foundries, different NVM configurations are
>> used based on the board ID.
> 
> Two separate commits, one for NVM, another one for RAM patch.
> 
Ack.
>>
>> Therefore, in the firmware-name property, if the NVM file has an
>> extension, the NVM file will be used. Otherwise, the system will first
>> try the .bNN (board ID) file, and if that fails, it will fall back to
>> the .bin file.
>>
>> Possible configurations:
>> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
>> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>> firmware-name = "QCA6698/hpnv21.bin";
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  drivers/bluetooth/btqca.c   | 154 ++++++++++++++++++++++++++----------
>>  drivers/bluetooth/btqca.h   |   5 +-
>>  drivers/bluetooth/hci_qca.c |  21 ++++-
>>  3 files changed, 134 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index dfbbac922..e8b89b8cc 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -272,6 +272,31 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>>  }
>>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
>>  
>> +static int qca_get_alt_nvm_path(char *path, size_t max_size)
> 
> int is usually for errors, the code suggests bool return type.
> 
Ack.
>> +{
>> +	char fwname[64];
>> +	const char *suffix;
>> +
>> +	suffix = strrchr(path, '.');
>> +
>> +	if (!suffix)
>> +		return 0;
>> +
>> +	strscpy(fwname, path, strlen(path));
> 
> 64 bytes ought to be enough for anybody, correct?
> 
Yes, in current driver, the max f/w path length is 64.

>> +	fwname[suffix - path] = 0;
> 
> with path = "qcom/sc7180/Oh.My.Device/name" this is broken.
> 
Let me test this and fix in next patch.
>> +
>> +	snprintf(fwname, sizeof(fwname), "%s.bin", fwname);
>> +
>> +	/* If nvm file is already the default one, return false to
>> +	 * skip the retry.
>> +	 */
>> +	if (strcmp(fwname, path) == 0)
>> +		return 0;
>> +
>> +	snprintf(path, max_size, "%s", fwname);
>> +	return 1;
>> +}
>> +
>>  static int qca_tlv_check_data(struct hci_dev *hdev,
>>  			       struct qca_fw_config *config,
>>  			       u8 *fw_data, size_t fw_size,
>> @@ -564,6 +589,19 @@ static int qca_download_firmware(struct hci_dev *hdev,
>>  					   config->fwname, ret);
>>  				return ret;
>>  			}
>> +		}
>> +		/* For nvm, if desired nvm file is not present and it's not the
>> +		 * default nvm file(ends with .bin), try to load the default nvm.
>> +		 */
>> +		else if (config->type == TLV_TYPE_NVM &&
>> +			 qca_get_alt_nvm_path(config->fwname, sizeof(config->fwname))) {
> 
> Please, don't rewrite the config. The file may be not present now, but
> it will reappear later (e.g. when rootfs gets mounted).
> 
This tries to load a default NVM file if the board-specific NVM is not found.
It is called when request_firmware fails. It's safe to rewrite the config->fwname
here since we have already tried to load the board-specific NVM. The config
is a local variable in qca_uart_setup and will return after downloading the NVM. 
>> +			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
>> +			ret = request_firmware(&fw, config->fwname, &hdev->dev);
>> +			if (ret) {
>> +				bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>> +					   config->fwname, ret);
>> +				return ret;
>> +			}
>>  		} else {
>>  			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>>  				   config->fwname, ret);
>> @@ -730,15 +768,38 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
>>  			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
>>  }
>>  
>> +static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
>> +		const char *firmware_name, struct qca_btsoc_version ver,
>> +		enum qca_btsoc_type soc_type, u16 bid)
>> +{
>> +	const char *variant;
>> +
>> +	/* Set the variant to empty by default */
>> +	variant = "";
>> +	/* hsp gf chip */
>> +	if (soc_type == QCA_WCN6855) {
>> +		if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
>> +			variant = "g";
> 
> Didn't you get the 'set but unused' here?
> 
Yes, miss this part. Thank you!
>> +	}
>> +
>> +	if (bid == 0x0)
> 
> 0x0 or 0xff?
board is set to 0 by default, 0x0 means read board id fails, then we should use
the default one. 
> 
>> +		snprintf(fwname, max_size, "qca/%s.bin", firmware_name);
>> +	else if (bid & 0xff00)
>> +		snprintf(fwname, max_size, "qca/%s.b%x", firmware_name, bid);
> 
> Doesn't ".b%02x" work in this case too?
> 
No, board id are two bytes, it coudl be 0x0206, then we need .b206. Or it is
0x000a, then we need .b0a. 
>> +	else
>> +		snprintf(fwname, max_size, "qca/%s.b%02x", firmware_name, bid);
>> +}
>> +
>>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
>> -		   const char *firmware_name)
>> +		   const char *firmware_name, const char *rampatch_name)
>>  {
>>  	struct qca_fw_config config = {};
>>  	int err;
>>  	u8 rom_ver = 0;
>>  	u32 soc_ver;
>>  	u16 boardid = 0;
>> +	const char *suffix;
>>  
>>  	bt_dev_dbg(hdev, "QCA setup on UART");
>>  
>> @@ -761,44 +822,48 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  
>>  	/* Download rampatch file */
>>  	config.type = TLV_TYPE_PATCH;
>> -	switch (soc_type) {
>> -	case QCA_WCN3990:
>> -	case QCA_WCN3991:
>> -	case QCA_WCN3998:
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/crbtfw%02x.tlv", rom_ver);
>> -		break;
>> -	case QCA_WCN3988:
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/apbtfw%02x.tlv", rom_ver);
>> -		break;
>> -	case QCA_QCA2066:
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/hpbtfw%02x.tlv", rom_ver);
>> -		break;
>> -	case QCA_QCA6390:
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/htbtfw%02x.tlv", rom_ver);
>> -		break;
>> -	case QCA_WCN6750:
>> -		/* Choose mbn file by default.If mbn file is not found
>> -		 * then choose tlv file
>> -		 */
>> -		config.type = ELF_TYPE_PATCH;
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/msbtfw%02x.mbn", rom_ver);
>> -		break;
>> -	case QCA_WCN6855:
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/hpbtfw%02x.tlv", rom_ver);
>> -		break;
>> -	case QCA_WCN7850:
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/hmtbtfw%02x.tlv", rom_ver);
>> -		break;
>> -	default:
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/rampatch_%08x.bin", soc_ver);
>> +	if (rampatch_name) {
>> +		snprintf(config.fwname, sizeof(config.fwname), "qca/%s", rampatch_name);
>> +	} else {
>> +		switch (soc_type) {
>> +		case QCA_WCN3990:
>> +		case QCA_WCN3991:
>> +		case QCA_WCN3998:
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/crbtfw%02x.tlv", rom_ver);
>> +			break;
>> +		case QCA_WCN3988:
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/apbtfw%02x.tlv", rom_ver);
>> +			break;
>> +		case QCA_QCA2066:
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/hpbtfw%02x.tlv", rom_ver);
>> +			break;
>> +		case QCA_QCA6390:
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/htbtfw%02x.tlv", rom_ver);
>> +			break;
>> +		case QCA_WCN6750:
>> +			/* Choose mbn file by default.If mbn file is not found
>> +			 * then choose tlv file
>> +			 */
>> +			config.type = ELF_TYPE_PATCH;
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/msbtfw%02x.mbn", rom_ver);
>> +			break;
>> +		case QCA_WCN6855:
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/hpbtfw%02x.tlv", rom_ver);
>> +			break;
>> +		case QCA_WCN7850:
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/hmtbtfw%02x.tlv", rom_ver);
>> +			break;
>> +		default:
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/rampatch_%08x.bin", soc_ver);
>> +		}
>>  	}
>>  
>>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>> @@ -816,8 +881,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	/* Download NVM configuration */
>>  	config.type = TLV_TYPE_NVM;
>>  	if (firmware_name) {
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/%s", firmware_name);
>> +		/* The firmware name has suffix, use it directly */
>> +		suffix = strrchr(firmware_name, '.');
>> +		if (suffix && *(suffix + 1) != '\0' && *(suffix + 1) != '.') {
>> +			snprintf(config.fwname, sizeof(config.fwname), "qca/%s", firmware_name);
>> +		} else {
>> +			qca_read_fw_board_id(hdev, &boardid);
>> +			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>> +				 firmware_name, ver, soc_type, boardid);
>> +		}
>>  	} else {
>>  		switch (soc_type) {
>>  		case QCA_WCN3990:
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index bb5207d7a..9d28c8800 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -161,7 +161,7 @@ enum qca_btsoc_type {
>>  int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr);
>>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
>> -		   const char *firmware_name);
>> +		   const char *firmware_name, const char *rampatch_name);
>>  int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
>>  			 enum qca_btsoc_type);
>>  int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
>> @@ -176,7 +176,8 @@ static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdad
>>  static inline int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  				 enum qca_btsoc_type soc_type,
>>  				 struct qca_btsoc_version ver,
>> -				 const char *firmware_name)
>> +				 const char *firmware_name,
>> +				 const char *rampatch_name)
>>  {
>>  	return -EOPNOTSUPP;
>>  }
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 37129e6cb..c566d0bf2 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -229,6 +229,7 @@ struct qca_serdev {
>>  	u32 oper_speed;
>>  	bool bdaddr_property_broken;
>>  	const char *firmware_name;
>> +	const char *rampatch_name;
>>  };
>>  
>>  static int qca_regulator_enable(struct qca_serdev *qcadev);
>> @@ -264,6 +265,17 @@ static const char *qca_get_firmware_name(struct hci_uart *hu)
>>  	}
>>  }
>>  
>> +static const char *qca_get_rampatch_name(struct hci_uart *hu)
>> +{
>> +	if (hu->serdev) {
>> +		struct qca_serdev *qsd = serdev_device_get_drvdata(hu->serdev);
>> +
>> +		return qsd->rampatch_name;
>> +	} else {
>> +		return NULL;
>> +	}
>> +}
>> +
>>  static void __serial_clock_on(struct tty_struct *tty)
>>  {
>>  	/* TODO: Some chipset requires to enable UART clock on client
>> @@ -1855,6 +1867,7 @@ static int qca_setup(struct hci_uart *hu)
>>  	unsigned int retries = 0;
>>  	enum qca_btsoc_type soc_type = qca_soc_type(hu);
>>  	const char *firmware_name = qca_get_firmware_name(hu);
>> +	const char *rampatch_name = qca_get_rampatch_name(hu);
>>  	int ret;
>>  	struct qca_btsoc_version ver;
>>  	struct qca_serdev *qcadev;
>> @@ -1963,7 +1976,7 @@ static int qca_setup(struct hci_uart *hu)
>>  
>>  	/* Setup patch / NVM configurations */
>>  	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, ver,
>> -			firmware_name);
>> +			firmware_name, rampatch_name);
>>  	if (!ret) {
>>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>>  		qca_debugfs_init(hdev);
>> @@ -2309,8 +2322,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>  	qcadev->serdev_hu.serdev = serdev;
>>  	data = device_get_match_data(&serdev->dev);
>>  	serdev_device_set_drvdata(serdev, qcadev);
>> -	device_property_read_string(&serdev->dev, "firmware-name",
>> -					 &qcadev->firmware_name);
>> +	of_property_read_string_index(serdev->dev.of_node, "firmware-name",
>> +					 0, &qcadev->firmware_name);
>> +	of_property_read_string_index(serdev->dev.of_node, "firmware-name",
>> +					 1, &qcadev->rampatch_name);
>>  	device_property_read_u32(&serdev->dev, "max-speed",
>>  				 &qcadev->oper_speed);
>>  	if (!qcadev->oper_speed)
>> -- 
>> 2.25.1
>>
> 


