Return-Path: <linux-arm-msm+bounces-41400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F17E59EC477
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 06:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25626164B26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 05:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F4C1C2324;
	Wed, 11 Dec 2024 05:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AnEQHZ8s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94702451CC;
	Wed, 11 Dec 2024 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733896416; cv=none; b=T1jPEGEeM7P3ETnwYSpLPFWXvTAyDg6fah0ELqYUDmARl4x9A/ItTOkXzMz5yUYsofDHh/Stwm1IWhR24LL1PLzPPs6RpVbH5af0cU4zEuGswY8sT6znW9iry79tUP87O24A1IAH8sShAENYvJVv0s+Cxcy70C78vSIgug1c7F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733896416; c=relaxed/simple;
	bh=QxRpAVNXkbIAVUiz32iWyuxIOggkmsPVhFGj9HPj798=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SH9+3554vY1zabAgnIfHZs6JPbZzzZ4knLnb3YQSr8JIINEnmjVj1bqDtVyTyJDEDf4Gq1B3Me6sKzQf0fRf7soVF5M/xcKL9nX4/t3NWr/2KRLHKczQm7zyXk3WoxEI8k9PzAOTYImhYRVHTin5CwMPmhmIpJcUiguMLKBfsgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AnEQHZ8s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB4mim3027746;
	Wed, 11 Dec 2024 05:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJqIu8MlLVnjkO5uOkWhWu+8Cc+eMZUqFilakTEtHnI=; b=AnEQHZ8sxEneL9Ld
	LIWZA36P9WJU3XgLSLxoslCtKdpnMvNVFfXh3gSXuPsnuOBR4w5TegRgI67Q+2Cx
	65QpcJsiyg5t5wmYUsfSkbgBZVskv1xLbCXKTjJjR3MhimWI9jjO47sN6y4crZ1q
	iSlakjeDItoeR7Lsb0A1j0DjV0U3UtpeLPQmbZg8t9HHo08VfFQVUlLEa8YAJZ+O
	NQfRPq4tbfvwIkib20BVflzH+KKXiiTkmLZLqqB1LfQlQIy9k6M9sKi5H3aJGH6F
	cq0Z2e/8kKfHoRhCaUqflM3uBjSZO2aYO+W+qRSqG/3T8lEDTrZCgNz6DqWiYNZ+
	2sjv3w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eg9ekn4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 05:53:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB5rQsD000968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 05:53:26 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 21:53:21 -0800
Message-ID: <7eb71706-1393-4e49-996e-1cf9d8c98d16@quicinc.com>
Date: Wed, 11 Dec 2024 13:53:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] Bluetooth: qca: Add support in firmware-name to
 load board specific nvm
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
References: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
 <20241210151636.2474809-3-quic_chejiang@quicinc.com>
 <wxb6oo3f7cri27eq3fnqttbl74lkn3rjo5o5rfttbwz7k5v2ug@w4hlrtig2nza>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <wxb6oo3f7cri27eq3fnqttbl74lkn3rjo5o5rfttbwz7k5v2ug@w4hlrtig2nza>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EnniXAaPZ-SipArb8z28DOaSyrQ1FHLa
X-Proofpoint-ORIG-GUID: EnniXAaPZ-SipArb8z28DOaSyrQ1FHLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412110042

Hi Dmitry, 

On 12/10/2024 11:28 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 10, 2024 at 11:16:34PM +0800, Cheng Jiang wrote:
>> Different connectivity boards may be attached to the same platform. For
>> example, QCA6698-based boards can support either a two-antenna or
>> three-antenna solution, both of which work on the sa8775p-ride platform.
>> Due to differences in connectivity boards and variations in RF
>> performance from different foundries, different NVM configurations are
>> used based on the board ID.
>>
>> Therefore, in the firmware-name property, if the NVM file has an
>> extension, the NVM file will be used. Otherwise, the system will first
>> try the .bNN (board ID) file, and if that fails, it will fall back to
>> the .bin file.
>>
>> Possible configurations:
>> firmware-name = "QCA6698/hpnv21";
>> firmware-name = "QCA6698/hpnv21.bin";
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  drivers/bluetooth/btqca.c | 67 +++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 65 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index dfbbac922..deb2b1753 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -272,6 +272,27 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>>  }
>>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
>>  
>> +static bool qca_get_alt_nvm_path(char *path, size_t max_size)
>> +{
>> +	char fwname[64];
>> +	const char *suffix;
>> +
>> +	suffix = strrchr(path, '.');
>> +
>> +	/* nvm file name has a suffix, replace with .bin */
>> +	if (suffix && suffix != path && *(suffix + 1) != '\0' && strchr(suffix, '/') == NULL) {
>> +		strscpy(fwname, path, suffix - path + 1);
>> +		snprintf(fwname + (suffix - path), sizeof(fwname) - (suffix - path), ".bin");
>> +		/* If nvm file is already the default one, return false to skip the retry. */
>> +		if (strcmp(fwname, path) == 0)
>> +			return false;
>> +
>> +		snprintf(path, max_size, "%s", fwname);
>> +		return true;
>> +	}
>> +	return false;
>> +}
>> +
>>  static int qca_tlv_check_data(struct hci_dev *hdev,
>>  			       struct qca_fw_config *config,
>>  			       u8 *fw_data, size_t fw_size,
>> @@ -564,6 +585,19 @@ static int qca_download_firmware(struct hci_dev *hdev,
>>  					   config->fwname, ret);
>>  				return ret;
>>  			}
>> +		}
>> +		/* For nvm, if desired nvm file is not present and it's not the
>> +		 * default nvm file(ends with .bin), try to load the default nvm.
>> +		 */
>> +		else if (config->type == TLV_TYPE_NVM &&
>> +			 qca_get_alt_nvm_path(config->fwname, sizeof(config->fwname))) {
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
>> @@ -730,6 +764,26 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
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
>> +	}
>> +
>> +	if (bid == 0x0 || bid == 0xffff)
>> +		snprintf(fwname, max_size, "qca/%s%s.bin", firmware_name, variant);
>> +	else
>> +		snprintf(fwname, max_size, "qca/%s%s.b%02x", firmware_name, variant, bid);
> 
> So, we have qca_generate_hsp_nvm_name(), qca_get_nvm_name_generic(), now
> you are adding a third one. Can we please have a single function that
> handles that?
> 
Ack, will use a single function to handle this.
>> +}
>> +
>>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
>>  		   const char *firmware_name)
>> @@ -739,6 +793,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	u8 rom_ver = 0;
>>  	u32 soc_ver;
>>  	u16 boardid = 0;
>> +	const char *suffix;
>>  
>>  	bt_dev_dbg(hdev, "QCA setup on UART");
>>  
>> @@ -816,8 +871,16 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	/* Download NVM configuration */
>>  	config.type = TLV_TYPE_NVM;
>>  	if (firmware_name) {
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/%s", firmware_name);
>> +		/* The firmware name has suffix, use it directly */
>> +		suffix = strrchr(firmware_name, '.');
>> +		if (suffix && suffix != firmware_name &&
>> +			*(suffix + 1) != '\0' && strchr(suffix, '/') == NULL) {
> 
> The have-suffix code should be extracted to a helper function. You have
> two copies of it.
> 
Ack.
>> +			snprintf(config.fwname, sizeof(config.fwname), "qca/%s", firmware_name);
>> +		} else {
>> +			qca_read_fw_board_id(hdev, &boardid);
>> +			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>> +				 firmware_name, ver, soc_type, boardid);
>> +		}
>>  	} else {
>>  		switch (soc_type) {
>>  		case QCA_WCN3990:
>> -- 
>> 2.25.1
>>
> 


