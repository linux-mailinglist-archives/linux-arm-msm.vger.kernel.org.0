Return-Path: <linux-arm-msm+bounces-81833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82AC5CBA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 365FC342267
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A922631282B;
	Fri, 14 Nov 2025 11:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peHLjbff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwO60L76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F93D14AD20
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118017; cv=none; b=pIP4twmEo3xT/exXbXjlV68Xy51rssIVMoUZRtNmq+As489GhZfrcRKmmHVoeQe3Cqs58rpJJ566JQtlkoQeRFQI7Zic4WlLvorIRr2du/hVsz8NMJlZQS09v7g+lYayPzS8sqWGJrf42s2lKoAI0mc79STTCb/GpObMIELGT04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118017; c=relaxed/simple;
	bh=vAX3cH484f0Xbv8QD14BasTU9187x6VcSFaXgvjGKOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWjtC7w/+M1P1HQehxME9ldifdRMuQm6GKvBkW9NiiKbmv+3yC3DJgblZDiE9CxJ+1Y5IpsYjddyXRoh4j9QHcp3d+iLrwakfBSDOC7Rsx9m/+lgXPEj3J/jg70/DZgpdtnzptGytn4PzJgEwKvJb19xcx5hZVtBAGHuXhsYH3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peHLjbff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwO60L76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8XsaT1484931
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kPNCH1KIyuMKSzzu0N3tSegw
	ZHyq1JgT9YSoRKEcZvU=; b=peHLjbfftxZaWeENIAPfwRU9rhko/9nYruFjSrmj
	hkxjXR3fn1dbklebmPaUI9WbrHjDbzE+rFSltK6bN+2u+hg/DbTshrOyXJ8itVMH
	vgF8s7m7xeXO17/BAdei1exJj2zMXub/ykD5pvL6E8fmxkmV72uTEBZNTztq0lS7
	Hx6bxF4s4KYhJUvkO+qS8ZRtNe5YLxgYZPhHIYM5VmdZKmEbrE5oB2TimCmNEkoJ
	ZJ+CfFV1hds7j7vhpUgxb0VHL2m+xjRudCi8KGvR33fMrwTEhMkdLF4vi1epGDBT
	e6Gnf9iEP64Mab0Ice5DhXNGg0jHMEFmZNxRklFzWAYUrg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9chwut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:00:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed846ac283so69046741cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118014; x=1763722814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPNCH1KIyuMKSzzu0N3tSegwZHyq1JgT9YSoRKEcZvU=;
        b=SwO60L76Bfr4p//Nczel1AFtoZnjkzqDH4gQFXx1dHZ3JO8/eqbufsw69VYIg2LS7N
         O8Qg4A9KAPMNnT8HOe56wTH5PyFefeQ6lJW2KKtHRVyAJHI2wQekZOY8imXi/XjXRzfa
         MF5FdVWVTTgn1GcAwZi2gwCtoaVciFM7DVtBvib89h4jD7ZEnZq/GCKnlPBJiiYgJCxt
         vjnNbnzndz8p7c9qea47FI+wZbRnp1LFXiQbuwAogcuZb6VdmQEd5dK+Ey20aXNkSMU/
         Nc9fwsKXKUb2v7sj1cXVphY7mvcPgmyb6yMe5FPZQXCGfDLciT9ip8sn/Wozh7mNfh4U
         QXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118014; x=1763722814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPNCH1KIyuMKSzzu0N3tSegwZHyq1JgT9YSoRKEcZvU=;
        b=NzlTEGNEt6vJ7ZFPuXumjcO6x8IU8l362yy2PdihvUiJ55Q2o0+8LeRDUQihvOOQ3/
         RFiJ6YH3N5oy2BhF7jH+c11xvE9AfJUL8j6ZjWFrDMElx85pMJ2s8EXlP0tDtYWEm6ko
         YIJubIdHGTbSA4Jlc2nMvGnn9IdKOSVfDaaLEJL9SAwQw8qV+YvH18wvXsLZzt2hpeAU
         ndHw8+FbrYci4f0RjlxCEyS1yGrmk8F8l0iMhuGuwxZOath400s+hQZ0KzpkrdxHgpP5
         6TWZk2Yq8DS3Dvbe8QvCrO8X/j0QEBzF+LYlI7MH4CoouTh8lHNWxABFJE58bCy2wFkO
         6E8w==
X-Forwarded-Encrypted: i=1; AJvYcCW60XMbkwzT+nycEwP18Bt22UZFDVhLxKvkxR5VmGB/0yknvp6Xlg7W89zsw6RU03tDMPs6/KH2tNTTN3Hp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw20GBrlYcAz2jEd+gz0h01evg0VJrn11Rl/ynQudAxl9vz/+G5
	vdDdPFV7SK1LK6sv6KYhY9L+t4KvQjRKJziIWwCu5nDdI+OMolUajuJ3OCkqrAnT1G32MENwRZu
	bYvtsuOb92DIYlkIZu4ZRuu5PpCmYDPt8zbcqdq2a/CjfoyH19etTg4y7PHeQpuvvC5Gm
X-Gm-Gg: ASbGncsW9vEZKGHU+W6CrBh4ur5mXN3V1tWBZFV/ajmcpgOwWKwa05iaZvoQJU3Cr4t
	s2LvsRqeuc17G1BMqw1JT4C3vKp0FXtIUgC51BBjp+NdJNJ4l/YxTiMs8E88ZKd7axax63k69Xv
	IGWNhTnv52dtbxigm4c5QTT9uLX3PG04lb17s4md/vMmOtPYkeKIqMYYC63S4X2RFyuwObT1JCV
	sxWmQj7RpN7bTLx0eGBaU9BVhuB3AM5oSYzN+SWL7rTzZt21K+d8qC27eHPX/js1qnqMVshJId2
	C5oUlnFPZ62ufe/c4Fd9xW1fAsUmzqbu20kkr0wTG+tlAOwtb1y/xdNz0Ht2NHoSEUS1aPYg3Xl
	wUEs7hrrR1F1KUKpbGvU0ORxDExqevZWMKmvv8iFMovKuxjlS3VOdV5bduW5dmiuyR9aNKJFTuc
	kctV7nkSUmh01+
X-Received: by 2002:a05:622a:290:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ede6fa96a4mr79267051cf.4.1763118014173;
        Fri, 14 Nov 2025 03:00:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqcELlDzNVfefFwEEmyDZ1bOQXUV2ZPpENl2EwKnKEZ/1vtc7VhUm8EH2a23gJ6cxtM4wSWw==
X-Received: by 2002:a05:622a:290:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ede6fa96a4mr79266411cf.4.1763118013407;
        Fri, 14 Nov 2025 03:00:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040053fsm1005616e87.55.2025.11.14.03.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:00:12 -0800 (PST)
Date: Fri, 14 Nov 2025 13:00:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
Message-ID: <awavyn6ol3lvfz5kkxqz3nizasjwkjvjz5tpbqgizsykugtrqv@7cvmfwvpzgpa>
References: <20251114081751.3940541-1-shuai.zhang@oss.qualcomm.com>
 <20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-GUID: YJV1rS2NDe6wWdGi5PHk_8oPdDOF4Iea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NSBTYWx0ZWRfX4hLOWJcXmj0R
 OC1vGdA6A05zyCvFn9kc7A09hcRuFsQbs0C6LFNWvTBzQTr67Lep7nFEg69LTk2hl1ajQ4Yt0GC
 L+OIrDuD3u/kIkzn3rXRat7ZWQ0v9o0QihADr0X1FSue5/0nIffowvusdATmWpC4y7sctlB63IS
 VeSrE7dqhaYCTXYFG0Y7J0t1jlRkQX0MjKHhA5A3jXdBkuOsActCp/yBlbT4piZ1bPAS1vm7DoD
 RX2Tg+Y41TNkMrkbcLzgYF6Mf11MKzAFlLAng3rpAemPZCIqmG8lRWZMCFg+djn+db6X1hkOTCJ
 AlV3QL8+7Ws058Mmuc5xdGbFMjQd+7K/GbRGVFh5/85hwN2DsRMJQr4r50KPwmre/Qwga5ASyMP
 RrY45qrl3vYAvl4p1JibDiWnRRWmxg==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=69170bbf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9Ucak9yj36P6dMCT-N8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YJV1rS2NDe6wWdGi5PHk_8oPdDOF4Iea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140085

On Fri, Nov 14, 2025 at 04:17:51PM +0800, Shuai Zhang wrote:
> The prefix "wcn" corresponds to the WCN685x chip, while entries without
> the "wcn" prefix correspond to the QCA2066 chip. There are some feature
> differences between the two.

It's not that it existed beforehand. Please write your commit message
logically: historically WCN685x and QCA2066 were using the same firmware
files, you are planning to introduce changes to the firmware which will
not be compatible with QCA2066, which promts you to use new firmware
name for WCN685x. 

> 
> However, due to historical reasons, WCN685x chip has been using firmware
> without the "wcn" prefix. The mapping between the chip and its
> corresponding firmware has now been corrected.
> 
> Cc: stable@vger.kernel.org
> Fixes: 30209aeff75f ("Bluetooth: qca: Expand firmware-name to load specific rampatch")

No, there was no issue in that commit.

> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 7c958d606..8e0004ef7 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  				 "qca/msbtfw%02x.mbn", rom_ver);
>  			break;
>  		case QCA_WCN6855:
> +			/* Due to historical reasons, WCN685x chip has been using firmware
> +			 * without the "wcn" prefix. The mapping between the chip and its
> +			 * corresponding firmware has now been corrected.
> +			 */
>  			snprintf(config.fwname, sizeof(config.fwname),
> -				 "qca/hpbtfw%02x.tlv", rom_ver);
> +				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
>  			break;
>  		case QCA_WCN7850:
>  			snprintf(config.fwname, sizeof(config.fwname),
> @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	}
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +
> +	if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "qca/hpbtfw%02x.tlv", rom_ver);
> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +	}
> +
>  	if (err < 0) {
>  		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
>  		return err;
> @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  		case QCA_WCN6855:
>  			qca_read_fw_board_id(hdev, &boardid);
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> -						  "hpnv", soc_type, ver, rom_ver, boardid);
> +						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
>  			break;
>  		case QCA_WCN7850:
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	}
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +
> +	if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
> +		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> +					  "hpnv", soc_type, ver, rom_ver, boardid);
> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +	}
> +
>  	if (err < 0) {
>  		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>  		return err;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

