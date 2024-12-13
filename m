Return-Path: <linux-arm-msm+bounces-41899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCAA9F0526
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DDC02824F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 07:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9F51791ED;
	Fri, 13 Dec 2024 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i8N96T8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82781372;
	Fri, 13 Dec 2024 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734073541; cv=none; b=IDsaJdQJVj7Lv1BrD1xN+wArNKANLd9iKfVZkEVjW3RLOMgRWM5ojQ342SkcTK/TleqSk+Ffgw8KO3SaGCbmgQM8SqaTZXTOHQcOlKAwhBwUQcI04RFrXD1/C8MFM6mTyb+ktnO1NIpZhvBks3wHwU8xAb66BmV1EFlLU8L83kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734073541; c=relaxed/simple;
	bh=ZvYtqX+eSokpKmEijsquiwbTJ1FCI5gZjbWLwPE5AaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SIAxE5rTttfVOheGlDZqunFmpv/gi0pqWuYteSpHn9u9n//CCOHnjgNdeDqzN5jC7kj2ambVGJr2lDN8HgyBrONGldJmnlcxHb/s1XpcUQenlVBp/X7KW+tdvKrKv7zJvqyi7n8XZ+rJetNmTueAGBeOSc8/WuGqy53S9pvh8WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i8N96T8G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCKWvAv008001;
	Fri, 13 Dec 2024 07:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwopbJqHPFxk70TkKRIqomYWEn1n7k+gonzorpybkBQ=; b=i8N96T8Gjl6zsIko
	g/jDK+e9jqzw2u4PMZEgjj7syIjBoValPewA7ddWZumxeFX09C2EYcsTXmB7LdEZ
	xWw+wZQuGeuBn6mt5Eubg2sUgGMECSh+vhE/H7tpPTB0oMH+qeZOUxbRPiZNGhLK
	VRo0QzoUEJoXwYws9NZkKIqaA5xMpharxCCw2V1T3Hr8lPgXHx9rgKfkN/QgkHFs
	SFgycN1cqmeW+ohrh6PVBagFULh0nldp1809qN0T7jArK6f4l/PRRp9KFZzGtSMg
	sxpLCMzbNfrFiBW10EyD5BtV9uz02DYknAG5LuSIzXnWUIxhOHJULjRV5UGne+f0
	8tfdGQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xus6c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 07:05:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD75Vst026396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 07:05:31 GMT
Received: from [10.231.216.175] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 23:05:26 -0800
Message-ID: <db516034-81de-4e41-932d-c1bb26e1c55b@quicinc.com>
Date: Fri, 13 Dec 2024 15:05:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] Bluetooth: qca: Update firmware-name to support
 board specific nvm
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
 <20241212150232.3823088-3-quic_chejiang@quicinc.com>
 <94eae703-ed9e-4f57-9786-99db7aaa07d1@oss.qualcomm.com>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <94eae703-ed9e-4f57-9786-99db7aaa07d1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QRsW2BO7fFcVmjWYAMWB3m5L6U1kYXMX
X-Proofpoint-GUID: QRsW2BO7fFcVmjWYAMWB3m5L6U1kYXMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130048

Hi Konrad,

On 12/13/2024 8:17 AM, Konrad Dybcio wrote:
> On 12.12.2024 4:02 PM, Cheng Jiang wrote:
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
> 
> I think we should agree on one and then do some magic to look up
> the other variants.
> 
These two possible configurations in DT to specific the NVM file. 

In the existing driver implementation, the firmware-name will specify a 
exactly nvm file. Driver will loaded it directory. But on some platform, 
we may attach different board, then need load the board-specific nvm. 
 
We assume if the nvm file has an extension, user should know the exactly 
connectivity board to attach to the platform, then the exactly nvm file 
will be loaded. This keeps back compatible.
 
If user think different connectivity boards will be attached to the 
platform, the nvm should depends on the board id. Then just leave the 
extension empty. Driver will append the board id info as extension. 

>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  drivers/bluetooth/btqca.c | 112 ++++++++++++++++++++++++++++----------
>>  1 file changed, 84 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index dfbbac922..4842f4335 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -272,6 +272,38 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>>  }
>>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
>>  
>> +static bool qca_filename_has_extension(const char *filename)
>> +{
>> +	const char *suffix;
>> +
>> +	suffix = strrchr(filename, '.');
>> +	if (suffix && suffix != filename && *(suffix + 1) != '\0' && strchr(suffix, '/') == NULL)
>> +		return true;
>> +	else
>> +		return false;
> 
> How about:
> 
> const char *suffix = strrchr(filename, '.');
> 
> /* File extensions require a dot, but not as the last character */
> if (!suffix || *(suffix + 1) == NULL)
> 	return false;
> 
> /* Avoid matching directories with names that look like files with extensions */
> return !(suffix, '/');
> 
> 
Ack. Thanks!
>> +		}
>> +		/* For nvm, if desired nvm file is not present and it's not the
>> +		 * default nvm file(ends with .bin), try to load the default nvm.
> 
> nvm appears 4 times in two lines, how about:
> 
> /*
>  * If the board-specific file is missing, try loading the default
>  * one, unless that was attempted already
>  */
> 
> But, even more importantly:
> 
> a) do we want to load the "incorrect" file?
Normally, there is a default NVM file ending with .bin, which is suitable 
for most boards. However, some boards have different configurations that 
require a specific NVM. If a board-specific NVM is not found, a default 
NVM is preferred over not loading any NVM.

> b) why would we want to specify the .bin file if it's the default anyway?
The default NVM directory is the root of qca. The 'firmware-name' property 
can specify an NVM file in another directory. This can be either a default 
NVM like 'QCA6698/hpnv21.bin' or a board-specific NVM like 'QCA6698/hpnv21.b205'.

> 
>> +		 */
>> +		else if (config->type == TLV_TYPE_NVM &&
>> +			 qca_get_alt_nvm_file(config->fwname, sizeof(config->fwname))) {
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
>> @@ -700,34 +745,38 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
>>  	return 0;
>>  }
>>  
>> -static void qca_generate_hsp_nvm_name(char *fwname, size_t max_size,
>> +static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
>> +		const char *stem, enum qca_btsoc_type soc_type,
>>  		struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
>>  {
>>  	const char *variant;
>> +	const char *prefix;
>>  
>> -	/* hsp gf chip */
>> -	if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
>> -		variant = "g";
>> -	else
>> -		variant = "";
>> +	/* Set the defalut value to variant and prefixt */
> 
> typos: default, prefix
> 
Ack.
>> +	variant = "";
>> +	prefix = "b";
>>  
>> -	if (bid == 0x0)
>> -		snprintf(fwname, max_size, "qca/hpnv%02x%s.bin", rom_ver, variant);
>> -	else
>> -		snprintf(fwname, max_size, "qca/hpnv%02x%s.%x", rom_ver, variant, bid);
>> -}
>> +	if (soc_type == QCA_QCA2066)
>> +		prefix = "";
>>  
>> -static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
>> -					    const char *stem, u8 rom_ver, u16 bid)
>> -{
>> -	if (bid == 0x0)
>> -		snprintf(cfg->fwname, sizeof(cfg->fwname), "qca/%snv%02x.bin", stem, rom_ver);
>> -	else if (bid & 0xff00)
>> -		snprintf(cfg->fwname, sizeof(cfg->fwname),
>> -			 "qca/%snv%02x.b%x", stem, rom_ver, bid);
>> -	else
>> -		snprintf(cfg->fwname, sizeof(cfg->fwname),
>> -			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
>> +	if (soc_type == QCA_WCN6855 || soc_type == QCA_QCA2066) {
>> +		/* hsp gf chip */
> 
> This is a good opportunity to explain what that means
> 
Ack. This means the chip is produced by GlobalFoundries.

> Konrad


