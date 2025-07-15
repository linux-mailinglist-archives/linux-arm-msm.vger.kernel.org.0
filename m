Return-Path: <linux-arm-msm+bounces-64979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDCB055F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 155571AA66D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A182D5423;
	Tue, 15 Jul 2025 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arVCBPAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AA526F45D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570704; cv=none; b=i4NOm+q3Ws5/H003obnH2iX/sA7/HY3KPI5VVIsvHC4QpTbYRN/WXjIaQU03ydhuA3Y+uKc3AJjSGlF+Gfu2ycXpYRYh/GVLjzUMbI4kUHy4W+sFRb6WSYCCxDp6kBKRpiAt/BoDX8NF9Uq9VZo5YkbrILOVv/ZVcck4PB/tO9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570704; c=relaxed/simple;
	bh=i6H0SoP9g7Mh40PXCCzXn7OVTXXgFzI0ZkVY8YnTY1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJwle6p9DZku93t4ueQ5vqdntuMF+2IWq7yVYVAw2TFTLFBW3rkJx8UCUNnwcGTKXsIhWzQVKuq5L53FhmNtbq6XItrgFlVDZaCMT9Zu4gF5gAQl7usAA8K/RHF043YBd1bp1RleP8maPERe3N11z9KaLzMGUb9EmSBR92mzWFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arVCBPAQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F64EFY022077
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xHNwrDHf6UIgXAfQcHTDVtmuWUsHZcYOAu9uyV9exEc=; b=arVCBPAQHFFc+Ihe
	JLN4Ltjj6AY/bXHGHJ8vJ0UqmRM9H4Ql0gmGss0TTlF2rN7MnvnR13fRQdNrPifS
	BJ1tEgheobAOhYRR4irr3L+1ZQai8KEJQ1dDdADuiDOtbqyZoBC0vMREKCW+pOkL
	4xkGt32KK2sCOC3rxcRKf2SLFv/V7gtpD9C/wTyfiHYiAnE36H3Bmm86CiMzfuBL
	6anSk/tE2Qyes7LPY2W0tcZgV3E8iiOwMVUxZ88bjzGk3n9/phS0f3gg5Iu6Afyg
	TJ4nC/wadvdo6sZoaTCxCRcqY47vwgcjPFho0wh4DUGGQhTE4AoWw4j50DPPsvhE
	2baYZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpabf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:11:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e2b5396898so3646085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570700; x=1753175500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHNwrDHf6UIgXAfQcHTDVtmuWUsHZcYOAu9uyV9exEc=;
        b=LuwoazKAq4uxeXcvSFJtvJjXUCWZNSp6Lw1pCIkvDTCZdwcax2XLyqdOb43vhqkw0r
         wFXqz1Et20IXD6IAr+/sKscSWlIHnGjkUj40WHYxDhVa6BKwDTfdyhz1uW22nm8aAFZP
         b2Dh7Pdfhfz6je03Uv2BsM0IxTBeGge/NznQiAgVVmpd8BdlQZjtp/gQpWAnhBECgWzf
         Cqzu0z43IoTVkK2LDhOI1iQaF3XRXBcoEydYJA2a5fWxm3Ut/noyNrADwq6K7LIsplHf
         VmaBeeLe+d6Mr9tI6YPKK4XglJHjIdST2Aojj5cM91vptY+jxcKyEK3HoCdAAFsZ2E90
         tWSw==
X-Forwarded-Encrypted: i=1; AJvYcCVwAXCNpQmsYKy3qmVQ6q9C0tjAYC2N4drpcMv2rrIskhUGLfbvgg+3jDqEQkoM1zBF3SYiXCLQHdJL1tmj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/gIi5yjj8vzZm1Yx+BiZ111NKAgN7Slsn0OieWfzmJz9pt1E
	2CJTJVwJEKTUm6wHUuhDtRiaGYJGNLqpPM2P2h8v1GIeIeBABT3NEdQirm8FdLTqH3cgv+YUw49
	Mcp4x50aR1SyTa3Qz3Kwk6/8xJbAR21YlG6XbPvQjeBYlSZV/TkpNr2fYZ3N4iZUVdyULSDErOW
	C2
X-Gm-Gg: ASbGncvPmNz6yKqvdhEd3nHy/aJuV3TuBY5dFZ9oqflCsQPxbjkQPBU2t1bWsr/AtmR
	+EdghX8Q2Z1ZGWro+Cu+ghIQolRocy6v/6P/g+j4LNyx8o+sWWWuWA3HOKVJ82LNX7n5a1u9U6M
	mR6qVyyY5nBo26RTt51pBAhCRSWdkLsj74ZjQFyYSnRC7egd5J6MMzxlcju/zcAehheu2BpcCIC
	+E/IT8EKFVYqXjoDxco/GZpMojkW5qnmpP6VUy241KahJZon+Ph8ynkP1GGawUZl3kDtifhSdCR
	BnS6LW3eMcqIOFMOMbZTQx+QLbTmQqiLy9tXa3Oaw3yVWK+UQa3lpVKaEAfxcHKGw88N6398ooU
	DqPkC86LeI/IaJJFBdRxc
X-Received: by 2002:a05:620a:269c:b0:7e1:1d2a:1224 with SMTP id af79cd13be357-7e33c7a6355mr40170085a.15.1752570699879;
        Tue, 15 Jul 2025 02:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR1aw9F8+kXl8naOWf8WjNqzukxHK0EIf4qjUMaJlCHG1KSJuHXl67oTKzisc1bUnW8qs52g==
X-Received: by 2002:a05:620a:269c:b0:7e1:1d2a:1224 with SMTP id af79cd13be357-7e33c7a6355mr40168185a.15.1752570699481;
        Tue, 15 Jul 2025 02:11:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826452bsm980325766b.92.2025.07.15.02.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:11:38 -0700 (PDT)
Message-ID: <ee84aeb0-728a-4642-9686-3abb9588bb24@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:11:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] driver: bluetooth: hci_qca: fix ssr fail when BT_EN
 is pulled up by hw
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com
References: <20250715051618.724475-1-quic_shuaz@quicinc.com>
 <20250715051618.724475-2-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715051618.724475-2-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4MSBTYWx0ZWRfXzbjukqJnoGH4
 4SlvKzqny609FTNljnCISOrnhU6+dvdt39+DpsNbTt1TNHsMwCX56Ha5T38cPg2r4I40nLIhByJ
 ps/EL4CE4no2s/II015dR3c1DRwOnWbTXXmqBnt6tZthMR4rDNnBVw634eWSnfIJnYeXyCz0DgQ
 aHY04Zp5C8qO34NAM6/8sAhrdtIZJzBevyE5Bes3Fw7oK5MmeCs2iFyNTM2Tfs7vWclED9I8dVU
 eHTNaL0qEqpnk5yL1sWU9dCCTNR+QfiZphwS03psbS6oCs4sMqufhETt4k+AZMPb7S29eLbvAzI
 H12ADYgFuAVyVM7neirDkd2cjsi0GN/VG3g9yo+ZRqmTXJ/TQacC1PuxNiU0FxZtPbpVyy0bGDT
 MCSbghIZXwwmMI3OTBIOiA1Fj4GXhZqV8GC1blf9/N18RQ9pzVucsTjEJpJhhqJEloZrpbrJ
X-Proofpoint-GUID: qhhTFkHt7I8ONpKXa1vaZ0JBLNTYQeYm
X-Proofpoint-ORIG-GUID: qhhTFkHt7I8ONpKXa1vaZ0JBLNTYQeYm
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68761b4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=W-2Lj9y8xAQPGZupIAAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150081

On 7/15/25 7:16 AM, Shuai Zhang wrote:
> the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
> This leads to reset command timeout.

This is a description of what goes wrong in terms of the code of
this driver, and it doesn't explain why you gate the code addition
with HCI_QUIRK_NON_PERSISTENT_SETUP, please share more details about
what you're doing, and more importantly, why.

> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4e56782b0..791f8d472 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1653,6 +1653,18 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  		skb_queue_purge(&qca->rx_memdump_q);
>  	}
>  
> +	/* If the SoC always enables the bt_en pin via hardware and the driver
> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,

What is the "SoC" here? Bluetooth chip? MSM?

What does "enabling the pin via hardware" refer to? Do we ever expect
that a proper platform description skips the bt_en pin?

Also:

/*
 * If the..

> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
> +	 * This leads to a reset command timeout failure.
> +	 * Also, add msleep delay to wait for controller to complete SSR.

Googling "bluetooth SSR" yields nothing, so it's fair for me to ask
you to explain that acronym.. it's used a number of times across the
driver, so perhaps a comment somewhere at the top in a separate commit
would be good as well. I'm guessing "subsystem reset"?

Konrad

> +	 */
> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
> +		msleep(50);
> +	}
> +
>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>  }
>  

