Return-Path: <linux-arm-msm+bounces-85801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3209CCF1B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 650153016013
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 09:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521E12EBB98;
	Fri, 19 Dec 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rnavz9a6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIWpDjIP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B832D1916
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766135979; cv=none; b=Rrs2QGmqgL3+OAaikB+zaQ6oukr9g0XVjnaC59IJgvzOYuCoemzi7519OF2XlZQhpwI+izFQ+72/uA0j42RAd3n2DtF2USw6f6hm9cwUs6HwDzd3u35x9kLtl6isxU+ZkX1BXnW4ThIq04nKqanXB6p77YWS3bfjachLq64zin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766135979; c=relaxed/simple;
	bh=xh6Pbh0uWTIaJo9YnXyM3s8lP/uhb6VTvGe8mTnmtJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqXvlOSxWYB7yqGoTP40n1ooBiIqDnAe0VqGkj2LJoTcx5O4Btk+cJav6YzmIQQDclBe+6EIxJSxf0us2QJc5yi8TTIlO21Hmb1npI4rwvmGZvjf+WRBY40F8YhLmBYLiMoyOtjnbjdOjXaMEvI/IspNEs6LY8ms67u6oYgeTuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rnavz9a6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIWpDjIP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c9Sr3559103
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fAvrRD8TuzsgeKhtNKbSE9hAEe9ZjO0kt6Db19I21xc=; b=Rnavz9a6bq/JYna7
	vnAmzuVs3bwK1CvNTty49QfBw/GdDWyL4+5GAeNz/BpnCmfYOdpQ4pCGeEgoNGUJ
	B5yZEjA3z3D3xwqr8CHMOFdeLY46AVYFsNjSrCH1XfPVFcNVBfWGGFfJOwo0wDWA
	8kKSC7lX7dsgKlm1xCnqbPJ/U8j5ts9RW09W9OUUU1WoX2kWbpRQWu5YQ5FwQwGn
	dLOvGC1haOae3XD3evTu/ikjU0CDngiwZjKyP12NbNlp1QDwtA6tej15hJF1BBkA
	ZWIgs1+YbxLKCUtmP3NfAHo3nLthHKu8v5QWSKWmhTbNFD8x30yxLm0O0Ut3OZt2
	lhC36w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ca2u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:19:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bc09a8454b9so3532000a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 01:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766135976; x=1766740776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fAvrRD8TuzsgeKhtNKbSE9hAEe9ZjO0kt6Db19I21xc=;
        b=VIWpDjIPOakrVccy2h0f0M/jL/suq7rZ9shelToZqan9ZJKvSm92n9qTNsC4+uWn2k
         zRuSkc+nyaa5HMR443reBD35BQnQ55YYx7Wfc1qimGfQ5LCgP4/t/rBa/O3ZrEn3p6Yq
         Kzhm858Jk0FUhrfdgUtp1LRI2P2mxlSvZTp3VmhSGTJql0E3MDPGtGrtXQ9hvNpF+jLO
         t1l/5qo9tjovJifsLw5lhOzSEUtWsi+jJAF5cL396p0/Tn0/hBkDU78Xo+KJiWiKIY6p
         9C1gkw/qoHmEUXeCfXyMV1aXTzTACF7uh/c03tYy58G+iD5RkcSNRn0ViHRu9ipYbowh
         gRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766135976; x=1766740776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAvrRD8TuzsgeKhtNKbSE9hAEe9ZjO0kt6Db19I21xc=;
        b=lDsgt8E2Rkw9R8dR6Bi8XjzMAaTU06weI4WJ69lmxP4jbmb8+768EjnI/mBI4T9p7M
         8ThBPMV7bpIC5Usq3/QPCxnL/QCtchrCbi0AOG7Yo/OZTtKMaOFwq+JvDZj4wLR/ojHK
         zi8WU2SS+VLaqy5STYEGZY44IdsvuhT1EpLsFb5HjEMZcFxu3szxWLtCNHeFcX8rjWn7
         tjewkF01MEMsdhftO4GZOFTejXNKU+XkcSJ1dwE1JID2253lg5VgRu+TvBoDVei2znU+
         GosmrqaRGYh4oov3jrHHyqmtxd30zt9w0VdHllDDIhFppQ1zvTH5JkJ570q/9O3ZJ6WC
         z3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRfYthofbCWXejV5NbmDmCC1U1MaTyCZVFTFgmDw/DAk7o2MPGe2nlGeKbQ4PEKolh8YY6iJF0MgxBXNeo@vger.kernel.org
X-Gm-Message-State: AOJu0YyeU+uk29me7nLxplg8n845FSx0cINHLD8Hi22pzHOnoK/uSuBF
	phzNkp/C1ekjNYYWMk7/cZwH7PDgJMRGgO6Zr7OujHa/2az1eL/6aAtG29e7a9nrLr64BZauU9f
	qlRUGpeInLBmexJ1cZFpBcGtclpMaDwSyraD/L/xINqAn09njHzypqJpaUQ0N2yjcRmJs
X-Gm-Gg: AY/fxX7UbBGfXdKkB4vcQmrdD5CBUAsaLIxioHhIVO0mbGq1xZkm22u4rYsfoCbyl7/
	uiLimyKUx7wiVXexeXalDeF7nKsf/hNlhbWonH/KaDP1Kh4GkISJ6AtSxU9zsemknEV2tLH6wAh
	OoPRFW4hd7qnhS1PEacz4ldM3IebMjZw9Aowm3+nJnn70Z1LksWcFYYus5TDtZz5UVmOYHyNkQW
	7Kth631Opi+fgqrc45mngJyMYyjGScf0eqkrSFFiEGlIGgZFRrhJv5bdiZ44BwJPonDLMiMiFpH
	jTwEv15BV+5so/KSIHdBOODtum3PJa46wAb6pPbH3YPCECqFKZlummTZRHix2m+EfY/tUdCI53y
	htP4cAfZu2f/5t+zxQHDwjUMK/mJbx2XymI4Jx/GVv7uVkJlGRRLGad9ZXpvhQICt+g==
X-Received: by 2002:a05:7022:f409:b0:119:e56b:c74a with SMTP id a92af1059eb24-121722b29ddmr2435070c88.15.1766135976044;
        Fri, 19 Dec 2025 01:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHLncFl/Iqm9W8a4XTUYn9gRPfCdgmH0wDAwBm1zZM/UvMERAxXt5Y13MSnJriA8Eqv/U0vA==
X-Received: by 2002:a05:7022:f409:b0:119:e56b:c74a with SMTP id a92af1059eb24-121722b29ddmr2435035c88.15.1766135975395;
        Fri, 19 Dec 2025 01:19:35 -0800 (PST)
Received: from [10.110.43.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254d369sm6369095c88.16.2025.12.19.01.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:19:35 -0800 (PST)
Message-ID: <c3526d32-6769-4681-bc54-90a4af082265@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 17:19:30 +0800
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
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=694518a8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CPydP0X5_9nDnWI7JbAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3NiBTYWx0ZWRfX68Unc14m26A+
 NAh53Nb2Aa3syXPw20kOSvAICBuSBm4WMrWWzVmWcJgleq7cSFaIyDNcaaHVFiXIBZKgEjQDGTR
 Yt2VqHQFLlBtYzqA77g8GCD2BS7+bk9aim/V9GNMQXriBABIsYEX73azqratNO27t0K05D7vJgf
 MvC+JLheI5rsC5L3tlfsHz+Myuo1Dly3eVeh9Zcakxklz7SnAoBwI9GEgg1yXjXIMGn7fahS8pb
 GziNRgKKTfVnS7oLuH7k5gCb1eHZpl3RB7UZFHA84NNUyB0UiPYkWxnSljmqNBvW+49YQUKJmkW
 dpXu+5JiYuyKKYyO0MoQ7hZtcRGCneXIT7rRKvZ6o92AVMBehIj3Ve8PELAnD9LWqw4BzURu5qY
 IpN7B/bow9ahvYLVs2MpX7mhdZDqd5/s5NcZH9DEl4UBYyk5/WnbO7PGD2N6KDOAVg8Vevzfvpm
 3mFAr4f7ZwPbGUPwtZw==
X-Proofpoint-GUID: vv2rGd4T47gR1wnKD5aRG9KC27iU5kDF
X-Proofpoint-ORIG-GUID: vv2rGd4T47gR1wnKD5aRG9KC27iU5kDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190076

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

Current Strategy (when DTS does not specify rampatch and firmware):
     Rampatch: Load the rampatch based on soc_type.
     NVM:  Load the NVM with board_id based on soc_type.
                 If the file corresponding to board_id does not exist, 
then load the NVM file ending with .bin.
     For HSP (new requirement):
         First, load the rampatch/NVM files wcnhpbtfw and wcnhpnv.
         If not found:
         Rampatch: Fall back to loading the hpbtfw rampatch file.
         NVM:  Starting from wcnhpnv.bxxx, load the NVM file ending with 
.bin.
                     If still not found, look for hpnv.bxxx and then 
apply the above NVM strategy again (soc_type(board_id)  to .bin).

The current changes are based on the original implementation, which 
should make them the clearest modifications.
Please review according to the existing strategy, and feel free to let 
me know if you have any questions.
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
>>
Thanks,
Shuai

