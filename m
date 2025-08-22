Return-Path: <linux-arm-msm+bounces-70456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C804B3223B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 20:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6ADA62855E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 18:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540372BEC5A;
	Fri, 22 Aug 2025 18:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsHZD8bU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE23B2BE039
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 18:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886914; cv=none; b=BVLkS7Y/9wCdjhz67+4G2r8kNrWsJEGmh3C/3e7Jl8ZuGUHQbPf7h82hfWg07aXPyCSUFmjsSBeBs9xeOeafv2v1X5olxDgctn0fRDborfIKe9aMRfkmp5LkVKpQ4DXpLo5J9u0iAaCP60kR8UIvrBw1KMjUeu1KnYHGiOHwQBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886914; c=relaxed/simple;
	bh=XnfyyBM6Pz+Nxj3ytKVde+CXgWpxq6tYu+r2xS+ravM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qj5hJ53QQ9sxjAMJK7zCa3+eVAUxo8gVjPmCvd0zzkRHffjApuxyR8zNS8rCdXpiXvVujmwHxKBI5jdgq4lX15EiqjaBWLQ5CoxOxKfROYvTXXnu9pIJFqdEFMNY9g4zhvqFaTEsGSLJEDoZQH2PmFcxY69w7cAFUgydTt0syvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsHZD8bU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHUhVu005961
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 18:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z3XjF/GiPBvLacOcQzaE00w+
	swQurw1OEiUWR3vIT3E=; b=WsHZD8bUiNGS77HfTwzv0EQtuW6ifmDmqfUy3Eiv
	rObPs+LQFsS77HSBCwTVpwLLjBDlC1G9zS8Q/JgXbd/tO+5aOp5X0qgAJKubzx59
	mNA4sM36AcPMyeAnAsGfsxBALIYYuDSTnsWdQJ8TonyZXQ/D0sVRsVrh8lPY7dcR
	T/FJrvhC2dlna2o/DNS42kftjrksAu+hPlB6W4JXr2ErCJyh4eV4Ej9T5pSfrdMZ
	BJhJ3tOFe5xG4fu5EbJnMMkgmk617Zk/d0CHRV1UisvpHNmWW+rDGcwsLZjzUV49
	xU30ssrrS7zUbFFuESZjv3yRwR7T2u/UlhpPVlTVTSLbrA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw0yr4yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 18:21:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d93f579ceso32841596d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755886910; x=1756491710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3XjF/GiPBvLacOcQzaE00w+swQurw1OEiUWR3vIT3E=;
        b=klUcBUx7oDm8Sr/cuqSJ89yKndlM9TEXoY3jvXqFX2WuvsCtTByOi3cQlUKW0YuMJX
         poKNd6VbRgUiKF7zPggx+eSVsep8nubBweJ4PTCjY9fKvMpAlZYxluMoJSHjxIdE2pia
         mPgOC9SUK+4mLhxm0kvuXs5lzCyP2270ZMPIAHJ12dzm49/pHF4cEymFqLnOV9V+zYax
         lG8WinGU1T8SZ/KM6Ln+bT7422TjTgOKDXg9ikEzQuA9OqYMsRFdjYNOdO5NIlRGOVsi
         7b9tXDiDFUsei7ML5a2rc/1UsE/vaemGfBfZB891rSoxFwxibfNqSqK1P2P8Gm0350gC
         SisQ==
X-Forwarded-Encrypted: i=1; AJvYcCUawE3mQuxqqqBC3jVbbfoWUAONn4PO/E7N4UjrjK90dycmHRk9BqLpZulPLHzei1pqfpNbxs+acxV7R5Hi@vger.kernel.org
X-Gm-Message-State: AOJu0YyUt0iykuDGdLOa9pF1/dSFtnAjjsNBksweG8ZGfEBscFJbLPGz
	RRiYMeaMthSu7TI0jQUZYbQy/isb1i9kJl3mt51MXClxn0QsEfuoS31QNS9s7DEHw6f6WkmVYf5
	cmp/UBVeBiOTMKTEU86N0pjp1bA5HPNb82+nopdZYFDMcRbjbRcNlWKfCIKKCXEZJB+gc
X-Gm-Gg: ASbGnctymZuiNbfg4o8aeOGDU0rxRjeD7ShVer8YvXOK2hm/9D80x1tbwCMBzZ9oRAI
	5itaUS7UjBBFcO0M3/MjOCtcxRxm2N/73PP3zXYpNYxM75aoLO3OOG5BNPIvJ2oYtMNDo6uiERn
	FPtb8eGu6SkWHzi+0KsaDsN/w3CbeXg1nLufI/LqAx4PbF996UkZOxpbXd9Y8lFicl/vAzAegVi
	P75UAPe+BOKksEY4IFnKPgZp35Gp+Mat2FB88g9pb4cQ30kTfsoM3gIuDz6TuRs4fRPatfcOQ4X
	sC0vvVQQ+xahKAaegfNipJpjxjPJMl9q7IGjLwYsfVxg9BZPtceVJAaFsMVZHZddrSREX+C6gB9
	HEA6WBFqfSFw3feEbmDZqHm78PCOS4B1pvfGBU4u+vvJMO5+ewVLU
X-Received: by 2002:a05:6214:2a4d:b0:707:4229:6e8c with SMTP id 6a1803df08f44-70d971f5efemr56637076d6.12.1755886910406;
        Fri, 22 Aug 2025 11:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXxaLnv1Y9uAXo5cfUz4pwJXUczPdAECaz58MIxnRLI3/YKXEsleDUu2qANw4OMZIlzAK5zA==
X-Received: by 2002:a05:6214:2a4d:b0:707:4229:6e8c with SMTP id 6a1803df08f44-70d971f5efemr56636626d6.12.1755886909861;
        Fri, 22 Aug 2025 11:21:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8ba22sm86692e87.100.2025.08.22.11.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:21:48 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com
Subject: Re: [PATCH v8] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
Message-ID: <eg6hush5t5r2seelkolmb3hqjlmh7w3yzekb3lnn4sm3qxufee@e3eberzr4izp>
References: <20250822123605.757306-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822123605.757306-1-quic_shuaz@quicinc.com>
X-Proofpoint-GUID: MJObmSm94h2zqNSYlO5kg_bcdRCWwpzo
X-Proofpoint-ORIG-GUID: MJObmSm94h2zqNSYlO5kg_bcdRCWwpzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX2Tc+wnjkMQ4p
 f4DCvuHNGPgwV5z8H7LHd2hOc+iy4r9ELIvm4LOUsNkesKf6Dd2YYlzrfyK8MmnAFvGAi6CHGPv
 fvN5zwjKrdzT7jyf0qzKjp/ndZGmSqx7ASJAoQrdrjAb5Kh0e1fvPgyugOvZX9G9ZdFqPW1j+8X
 A1F4JTCJncuLNZaKZF06yYOF/A6Vjp88evGNYBQ40bkjIIhsow8r2TXhldT6AJafAdfSa0mBmpa
 vr4CgqRvXmPnkIqq78sAVJr2q6tbVqr9LRC1CIhRA6BC1j3yJiKU003+3i+auf/YNLKctWb0N5s
 KDXCAxnyeyoA3zvR+eJParELsnBrQvJCOgIwvWyu9+s7mm49sac01rQowrr1WwXDyrvXz+xUgOS
 9qvUZ2rw
X-Authority-Analysis: v=2.4 cv=TpzmhCXh c=1 sm=1 tr=0 ts=68a8b53f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Xgb9nbmtQSVvgoRKimMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508220160

On Fri, Aug 22, 2025 at 08:36:05PM +0800, Shuai Zhang wrote:
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
> Changes since v6-7:
> - Merge the changes into a single patch.
> - Update commit.
> 
> Changes since v1-5:
> - Add an explanation for HCI_QUIRK_NON_PERSISTENT_SETUP.
> - Add commments for msleep(50).
> - Update format and commit.

Changelog doesn't belong to the commit message. It should be placed
under tripple-dash.

> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4e56782b0..9dc59b002 100644
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
> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {

Still based on some old tree. Could you please stop doing that?


-- 
With best wishes
Dmitry

