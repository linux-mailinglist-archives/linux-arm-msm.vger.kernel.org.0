Return-Path: <linux-arm-msm+bounces-73475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC83B56EA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 05:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B76218953C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 03:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09622080C8;
	Mon, 15 Sep 2025 03:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BrST37j7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E757C9F;
	Mon, 15 Sep 2025 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757905480; cv=none; b=axSj+Rg6Wv8jnPoGAyijn6CABIYfs70QwXpnUjrTMbgqdtFLt021ohiqaToZOtNfocvQgN8HEwKxmQ2NGTig1H2A5gHAUfnFtMkvXdjGRFVw7w3dv73qP8G2P3jnm53TNXjQl3mvXPTotePWRpvuyx0609NxDsW1IEHFGIaRE8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757905480; c=relaxed/simple;
	bh=/n08WvjcgZz64jmHuOYdy3h7tij0VWi6ys07urtBIAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G/8VA49gdzeCrv40cCuHbdMv4k5HABhzxaD95DS95ULivGbzCkrahH+jxVOz5vXc0nkp2z7xCJ12JgHZSXBhneeWpioO7ihPJUJCvaaCOVsGAS2H3bcvmLu8rIcxLcb0NtO8vGdpm1Jcll/mA9nXPXVViZ6uKwlsc1T5J0VhFuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BrST37j7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMKTKb027703;
	Mon, 15 Sep 2025 03:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfYDUawOr0FMXVNZV7xOILKvh+Egb3nrzK89Ssd3jck=; b=BrST37j71Jqb0oRe
	VSiPDJn29jqzZHoZrt3jy+vNyfjO70Z1gHwxyLOVXJAT+BpBTNbOmeRTvLUD9Iah
	5+TduzIi6ZkS56PNhoxDiA6qEoe7XXzfjLesAMZvsQ/DLnfaIeCEBNwD7HnsNX2h
	iqfRRQ7YcsVMhuf8ByIoVSpW0o22O5fotSXTrVeOqUVXka/zypC+vjgdgLMnbsbI
	nLrwefv+NyRB6mhhr3Jla5Gkcngndk4wSZ6YF68sMPP6ryhMm65XpFIa3JUicvw1
	1xBReKMDn6Cm/pUMJFjT2nzR0oEmlDPQ1cK1U92KKNbKBwraIObwvyvhG0WCbQ2t
	Sbp8HQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr3fc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 03:04:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58F34YEx013867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 03:04:34 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Sun, 14 Sep
 2025 20:04:31 -0700
Message-ID: <c040b551-17cd-4491-883a-bf33b4ce28f7@quicinc.com>
Date: Mon, 15 Sep 2025 11:04:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
To: <dmitry.baryshkov@oss.qualcomm.com>, <marcel@holtmann.org>,
        <luiz.dentz@gmail.com>
CC: <linux-bluetooth@vger.kernel.org>, <stable@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_chejiang@quicinc.com>
References: <20250827102519.195439-1-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <20250827102519.195439-1-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pZa89s8EFLerjyau738EXJhoScZwh-4A
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c78243 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=PXhdPGoDMKSCdWacWocA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX/+RomGtGlZvk
 7D2J3usyJ6frRoFHgBkP2ymigYnmxGM3MuzUySD1irYsnJTqWBRkB9JQJ6Uql8SaO64DKztS+jr
 qmUYdMeBT0Wu2/rpJqP++LGSuilyQCXt3vUv36rrBgd4GGTxVZ2QBjc063DL067JtFrkUhD+Ouk
 TTVaY8vL+DxWbb1EeWZ+bkhbv5qrOozQGs+RlgUTq9zBBN8i2pu2/U7lwOwEbFTFv9vWrN9TGvQ
 HxWKOoOQB8uN2BexjUweAHW++F81lWwOYeyP+iw9UrMxEwTUuGKwWXKzYoOZ1znvjMnT2I5e8Im
 xQRrOe57zRyAVpruK/pY8PI0ocAZpOPDU3ZLaN1yik+nTZo1NsbtdYBSc/LQdQq2MBvWXJ6XJai
 x2YjREO0
X-Proofpoint-GUID: pZa89s8EFLerjyau738EXJhoScZwh-4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

Hi 

On 8/27/2025 6:25 PM, Shuai Zhang wrote:
> When the host actively triggers SSR and collects coredump data,
> the Bluetooth stack sends a reset command to the controller. However, due
> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
> the reset command times out.
> 
> To address this, this patch clears the QCA_SSR_TRIGGERED and
> QCA_IBS_DISABLED flags and adds a 50ms delay after SSR, but only when
> HCI_QUIRK_NON_PERSISTENT_SETUP is not set. This ensures the controller
> completes the SSR process when BT_EN is always high due to hardware.
> 
> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
> the comment in `include/net/bluetooth/hci.h`.
> 
> The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
> and its presence can be used to determine whether BT_EN is defined in DTS.
> 
> After SSR, host will not download the firmware, causing
> controller to remain in the IBS_WAKE state. Host needs
> to synchronize with the controller to maintain proper operation.
> 
> Multiple triggers of SSR only first generate coredump file,
> due to memcoredump_flag no clear.
> 
> add clear coredump flag when ssr completed.
> 
> When the SSR duration exceeds 2 seconds, it triggers
> host tx_idle_timeout, which sets host TX state to sleep. due to the
> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
> As a result, the controller does not enter sleep mode. Consequently,
> when the host sends a command afterward, it sends 0xFD to the controller,
> but the controller does not respond, leading to a command timeout.
> 
> So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sleep mode.
> 
> ---
> Changs since v10:
> -- Update base patch to latest patch.
> 
> Changs since v8-v9:
> -- Update base patch to latest patch.
> -- add Cc stable@vger.kernel.org on signed-of.
> 
> Changes since v6-7:
> - Merge the changes into a single patch.
> - Update commit.
> 
> Changes since v1-5:
> - Add an explanation for HCI_QUIRK_NON_PERSISTENT_SETUP.
> - Add commments for msleep(50).
> - Update format and commit.
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4cff4d9be..2d6560482 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1653,6 +1653,39 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  		skb_queue_purge(&qca->rx_memdump_q);
>  	}
>  
> +	/*
> +	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
> +	 * hardware and always stays high, driver cannot control the bt_en pin.
> +	 * As a result, during SSR (SubSystem Restart), QCA_SSR_TRIGGERED and
> +	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
> +	 * command timeout.
> +	 * Add an msleep delay to ensure controller completes the SSR process.
> +	 *
> +	 * Host will not download the firmware after SSR, controller to remain
> +	 * in the IBS_WAKE state, and the host needs to synchronize with it
> +	 *
> +	 * Since the bluetooth chip has been reset, clear the memdump state.
> +	 */
> +	if (!hci_test_quirk(hu->hdev, HCI_QUIRK_NON_PERSISTENT_SETUP)) {
> +		/*
> +		 * When the SSR (SubSystem Restart) duration exceeds 2 seconds,
> +		 * it triggers host tx_idle_delay, which sets host TX state
> +		 * to sleep. Reset tx_idle_timer after SSR to prevent
> +		 * host enter TX IBS_Sleep mode.
> +		 */
> +		mod_timer(&qca->tx_idle_timer, jiffies +
> +				  msecs_to_jiffies(qca->tx_idle_delay));
> +
> +		/* Controller reset completion time is 50ms */
> +		msleep(50);
> +
> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
> +
> +		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
> +		qca->memdump_state = QCA_MEMDUMP_IDLE;
> +	}
> +
>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>  }
>  

is there any update?

BR,
Shuai



