Return-Path: <linux-arm-msm+bounces-68963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673FB247F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1DD71BC2F17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DCC223DDA;
	Wed, 13 Aug 2025 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYnOVxXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3F82F1FC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755083121; cv=none; b=jrLogmMPrMsDooKbLflTi8u6qa5tReNbsQ5Kbp73xvJTPjeoZwE1pRd8PH93QMcii0H9goRVjYbgUYZD27ej40jHlR5N7wL7gfFnN0FA6+2bSwXz0nbSt2mFHs90TVipcVOmgpan72Y1/lWyVmLGhNoF5DTbetzzyf5FM9/8KvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755083121; c=relaxed/simple;
	bh=sch5TBjToxGrPL0MVu6AzEEz4ok4bUWP/uIfWkQiEz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcLTKZq/2pzUYSyyDLmXJw0eCuKM3n3x2Y1hz9HKSA0BY4scJiIbjEpFJH/jAudkuj1+9Wo+O5sDVcLKqL2oPXlxWfG2FrhGGIjJt4RBxbtT+ThAtP1FOLfMewUf3TykyA9cfIO0WW/zFo6ty7uQCJub04+pyGVMyjTIqka4xL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYnOVxXq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mNFQ019463
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUOmZx2iA1Ss1WAKFvo26UYUKENTpaMWqnAFmsTkpXY=; b=dYnOVxXqInihaU2z
	BiVfUOSypafv55pEmRbwdFdDjrKLLCUjOeVsN11ngfhjO9mG0RcUb2shcPDU8q/D
	GqIKYirN/j8qCcRAJjN7S00McfonX/VgoHKyKFAvgH8F458r4gk56YsDmRYyxXcS
	J2EutwkX8D5at7iwHj/PBjVwiNYrj0/R9pSPtNw1Pn6xJmBzPCp3C32AgrK8QclM
	gXWvcaGDpTVJkhdn3JL4uw1+mCk5GWTt480qypSHYPH8WwSV77K09SHnK51MwvoW
	7nQgM6taOiwRrlOdcSiRaUFae4qumKHFJ4HpR7FmPDrN/dgdJzZ5CmbQzO23dGSZ
	Kkuofg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6qd58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:05:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-707641946ecso15677806d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 04:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755083118; x=1755687918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iUOmZx2iA1Ss1WAKFvo26UYUKENTpaMWqnAFmsTkpXY=;
        b=MIwJgQNa124o5XyEcW+P2btrR2s4Oy+5Yr2plGC3Mm0ky4AZdLcdfONZ62DtXo0R8d
         sjNb6zuPH0aHT2wKPtCd3B7Hz9cKdGMlcHtgB1FO8wRctjtOqywSKCzRwRvI47NZnUej
         /qTGWHah8C0Kki0zs7cKnfZP6hom4ezjhx1M45DhEthgcJ6d9tmo5lKS6/qL4SrGd//H
         WJby53YTfZvxNCmaatVgEOBp/vOJWarr/+35ZGeVo2JsinRIGdGi4FgnPL3Yf47HEzSK
         moJjF9U49kOeZ/IKDIYDNQO2FcXuY8z7aXkelDKVLaZqG+4apVuuZ6FOXj/CWXGeHC9l
         9d9w==
X-Forwarded-Encrypted: i=1; AJvYcCUG+9VDEocN2e3VTyR/4PMWQHS5SgzcazFb3nLbZn3R/Ddb/oJkEDj37dKSfx6ycR9c3GEmUTETzysEGQ+P@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9n7Xrsui8svhw7weiiG/KLUvCtxtZL0GeCwpPY0sxz6B9XrfR
	IwHYPh+98BwjK2RFNgxjUh1bPeY/kA7HVbnuGbdZDJAgMR5oLrpOZM3pZqpIBty7Kp/XQaKbkrE
	xEPkMp8DKDta6qAkMntwLHc0cStVkOJS7jDNO2DF0bpPycR0cHZZMq2ZphyIvOvnThFoY
X-Gm-Gg: ASbGncsLcOTaPxxwm1oIkEeboYTy/p3mbqr4aDAG/P9tOZoubH2waBodY8Up/YnNgi9
	c7JLfwe9WLs0tkB/tjX1K8SYfVc7kyBwZsV+BxNAHFw1m0Xh2bvN4vq3JJa8lq51bwZpqOfw8Q8
	UrLhwBWWWv2I3wPdsPxg3rsNw+bdFVDOqcNuu+jBPGX9I5seQjkqyORjFubHi2cJHGiGypcqJVU
	VD3qW3cCAZJ4MK8aZ2kVRw9S7ngVJhdA+HCt8FaWvUbmd9+JEcvEwRYr3hgFhwecDs/arUL+Zoy
	yJNxH4DwzPl1UO/MYGgn/CcOghMJI9fbRmw4NrDaccu3bnehccOfzbcKJ9DzS18ajgL1t50nhgw
	blFrs12P30A5ciXpSOA==
X-Received: by 2002:a05:6214:4001:b0:707:4998:712e with SMTP id 6a1803df08f44-709e8953851mr14391136d6.4.1755083117936;
        Wed, 13 Aug 2025 04:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE0LNUf1t59zVUgnbYBXxl7wK4EQUqPuL90iLAjgla9CcHvRrfynOHqW0E1DJJOrJoNmHHcg==
X-Received: by 2002:a05:6214:4001:b0:707:4998:712e with SMTP id 6a1803df08f44-709e8953851mr14390696d6.4.1755083117155;
        Wed, 13 Aug 2025 04:05:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6181ad55ebasm6547428a12.55.2025.08.13.04.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 04:05:16 -0700 (PDT)
Message-ID: <77881d50-c044-4aae-bd0a-5265e0db51cc@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] driver: bluetooth: hci_qca: fix ssr fail when
 BT_EN is pulled up by hw
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com
References: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
 <20250813033505.3868781-2-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250813033505.3868781-2-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX+5iaApFjmKZO
 jrCeU8oywJkjmWfCp2idIh5+yUXbIphJt1E7gQVVy53BGaOdrlfVXiFNefF06zI+UDjsq/AQk4t
 esPBN8eAAjuWNQ3UGuu+w1S+9pbnaIvV2OmEYvMCD8EKLeWmAYW/1OXgLFUQ4ZQmcYn+0/VFl+e
 qVp+cZf1l/HgWCIu7PvC5vtu/uBV09lEpYxSGQlySKcfweiULhRnGTOfHuNv1vNTeXr5lEHCSm4
 bUI17Omz4yo5DV5XKUactr1rIyVwXDbZ53RT68TybEa5xlnZp9+ac92/X01UwuxojgtXZBaTgsu
 T9odagOejinXV04YmbZFQtBB1a194isV1jcKLY7eTqJcMw02GwsQ7s2CGfvSkaRowqE7+2+SWcv
 3zOFBlYR
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689c716f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=zw15p0q4DuKXwe2BdPcA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QJrCS-lojNoYBjEHIXkTkP_CX1VmqPlK
X-Proofpoint-ORIG-GUID: QJrCS-lojNoYBjEHIXkTkP_CX1VmqPlK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

On 8/13/25 5:35 AM, Shuai Zhang wrote:
> When the host actively triggers SSR and collects coredump data,
> the Bluetooth stack sends a reset command to the controller. However,due
> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
> the reset command times out.
> 
> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
> commit: 740011cfe94859df8d05f5400d589a8693b095e7.
> 
> The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
> because this quirk is associated with BT_EN, and can be used to
> determine whether BT_EN is present in the device tree (DTS).
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4e56782b0..14b2d1bee 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1653,6 +1653,19 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  		skb_queue_purge(&qca->rx_memdump_q);
>  	}
>  
> +	/* If the BT chip's bt_en pin is always pulled high by a dedicated 3.3V
> +	 * power supply via hardware the driver

weird line break

> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,

"System on a Chip chip"

> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
> +	 * This leads to a reset command timeout failure.
> +	 * Also, add msleep delay to wait for controller to complete SSR.

50 is a random value, I also see 300, 100 across the driver.. where does it
come from?

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

