Return-Path: <linux-arm-msm+bounces-80620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E88C3BB85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 15:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B67A7188545D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 14:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5492C342CB6;
	Thu,  6 Nov 2025 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="otBIPjaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F27D30EF8F;
	Thu,  6 Nov 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762438750; cv=none; b=X46eHII+B4dIbQhEYpGZ4urJDKfCuyRE3+QmhYGVZAwZwoLz5hyAgxYTsWOu2nqnm1AUF7JnP1R0MmM7+NRmb901/UBuixMfchWyxRP8oc3NgOJd8Yh3cgb1kFFheoh4QdRAB7X3QWpflByW9BYPf8sJFnYZMJ87d7/K24Keimk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762438750; c=relaxed/simple;
	bh=xeNaC0f2NZK0/hHTlDUwQ4kSxndyb7w5Ep+As9A8308=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UBJQrr9jPoEP0vQMv8fd2mTmhkiz1C7PkK6u/pKHdoO3YJjaIEol969DpCjBzWtKFisRiFPc8l7+lzRTcPi8HmNzuXNFcovfzXiTgLSbiwke/0Q/LNFfimKDFD43S92pWt9M8+0HpY+a8fOKsIfuVgWByKVyaxARS6+TJwc5J8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=otBIPjaF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A691D482389835;
	Thu, 6 Nov 2025 14:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QZ10Ag4gjfnxqE0SHZIEWVP/xy51PCcDJPNPWfm+s3M=; b=otBIPjaFbn4G2Fv/
	JgonaUmjGEB0J0ArM5qD9qu7Yh4KY27CGfcmiSJFel4FDB1uwPniA+gr6Pl0hJvX
	SBAHJ0BZLLiVbcdUk5dkbU002iVfO1Ci+LXWodWuaO0WdjlIiWQXo44A0IcKQJ/y
	hwJ0CgZuuZm4Cets7WbFWkpUNLRm20D86hobBWcwGygKjSHOQBVzRGDA9DMpgCUD
	sa2MTnSBTczRbrh7/7SDjdfnZ1DBILS7DDeSUsXteMQgK2XvkAI3H8/nZcImUyiS
	RTnpzMmKusiB2DyY6hkoUBA3/haQtz+2v5ZN17Fj55v+60nplm6WFd43uQzfcWpU
	t3kGnQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h9ut4pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:19:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A6EJ4In013643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Nov 2025 14:19:04 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 6 Nov
 2025 06:19:01 -0800
Message-ID: <000027d7-279c-4c3a-b438-5af5b657578d@quicinc.com>
Date: Thu, 6 Nov 2025 22:18:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] Bluetooth: btusb: add default nvm file
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>
CC: <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_chejiang@quicinc.com>, <quic_jiaymao@quicinc.com>,
        <quic_chezhou@quicinc.com>
References: <20251104112441.2667316-1-quic_shuaz@quicinc.com>
 <20251104112441.2667316-2-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <20251104112441.2667316-2-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=R5UO2NRX c=1 sm=1 tr=0 ts=690cae59 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=7vm6EOYB4fWX4Y2RDsUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 6pcs3dpxy3JDAuJ26T0eHaHZxKkC1v2A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDExMyBTYWx0ZWRfX8HGeGLw9mfco
 m09p0NEoj5k9RuuMQrsujDRFeuHIlsNvGX9Ai1DjNEvTshWrD5ZpY5kiVhPAZBlxSkdmUzPm/qW
 xqYyXy8wNf78NEXG+FW7ZkSvHnmNwB3C/EeVHXCL8AvzS7+y7/XQT1GhKArH5AJv0KQUOr+esrj
 myidjfsK2CzsTNpPBSnKaIJQj2dmfLyBHsk70K5pJXufBW0jBiowJe6Q3CoTd3TuRFQYtljFUZv
 va0+V9j8UfTuddxaOaKqgPC7Fx4/rn0Jfz6nccFRQagMfLWlJWELdCizivdbi5u+B+b6r+VrP8G
 DXFzJpih8CcVHMue5BgJiDnMDz5sHOZrx/k2HpDPgji8fUfhrtEB4fAq2LDJpFsnmtsiCxfUETX
 m+d8MZ6zaTw24oY0WCxVFvhrWtr9Yw==
X-Proofpoint-GUID: 6pcs3dpxy3JDAuJ26T0eHaHZxKkC1v2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060113

Dear Luiz

On 11/4/2025 7:24 PM, Shuai Zhang wrote:
> If no NVM file matches the board_id, load the default NVM file.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/btusb.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index dcbff7641..020dbb0ab 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3482,15 +3482,14 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>  }
>  
>  static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
> -					const struct qca_version *ver)
> +					const struct qca_version *ver,
> +					u16 board_id)
>  {
>  	u32 rom_version = le32_to_cpu(ver->rom_version);
>  	const char *variant, *fw_subdir;
>  	int len;
> -	u16 board_id;
>  
>  	fw_subdir = qca_get_fw_subdirectory(ver);
> -	board_id = qca_extract_board_id(ver);
>  
>  	switch (le32_to_cpu(ver->ram_version)) {
>  	case WCN6855_2_0_RAM_VERSION_GF:
> @@ -3517,14 +3516,14 @@ static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
>  
>  static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
>  				    struct qca_version *ver,
> -				    const struct qca_device_info *info)
> +				    const struct qca_device_info *info,
> +				    u16 board_id)
>  {
>  	const struct firmware *fw;
>  	char fwname[80];
>  	int err;
>  
> -	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);
> -
> +	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, board_id);
>  	err = request_firmware(&fw, fwname, &hdev->dev);
>  	if (err) {
>  		bt_dev_err(hdev, "failed to request NVM file: %s (%d)",
> @@ -3606,10 +3605,19 @@ static int btusb_setup_qca(struct hci_dev *hdev)
>  	btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
>  
>  	if (!(status & QCA_SYSCFG_UPDATED)) {
> -		err = btusb_setup_qca_load_nvm(hdev, &ver, info);
> -		if (err < 0)
> -			return err;
> +		u16 board_id = qca_extract_board_id(&ver);
>  
> +		err = btusb_setup_qca_load_nvm(hdev, &ver, info, board_id);
> +		if (err < 0) {
> +			//if the board id is not 0, try to load the defalut nvm file
> +			if (err == -ENOENT && board_id != 0) {
> +				err = btusb_setup_qca_load_nvm(hdev, &ver, info, 0);
> +				if (err < 0)
> +					return err;
> +			} else {
> +				return err;
> +			}
> +		}
>  		/* WCN6855 2.1 and later will reset to apply firmware downloaded here, so
>  		 * wait ~100ms for reset Done then go ahead, otherwise, it maybe
>  		 * cause potential enable failure.

Please let me know if there are any updates or if modifications are needed.
Thank you!

Best regards,
Shuai

