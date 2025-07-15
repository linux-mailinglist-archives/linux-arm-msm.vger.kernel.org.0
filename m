Return-Path: <linux-arm-msm+bounces-64981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93127B055FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9EC94A8391
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E60275B03;
	Tue, 15 Jul 2025 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJtfPuBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15CB2D375A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570776; cv=none; b=GzW2803MMB6JG4K4zKjlwvrLhKOqF8J7IP/k28c6Kpmd8JnOQCTXVsFU74YG2DTLz5xpfcOF0GD0aGmZTSRdNk04GV1UQ14k4jfuiMZBcYj5mxQEKTZLgwKmhFp4qXYo0KcPLObebK3+V0ZEGqLlZBwr/agsWIAORHLrvHHCZdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570776; c=relaxed/simple;
	bh=nQBArhL1fpXczSe/0o7z2BgRBvZFm0FMWbtMWPTW/oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1OYQBCt0jrxstRxilM7in4rsI7ENbczlqDLk6T7PzjIczTZPC6yZHZoWqmWwQ82pd162jnHWw2Nu/mvsPgKa4J98iuXmHsuQzSKwGPwtjLiUAsl1ov9qw4BWM2ZlDQr98cQzSqoEiBJiodnqooLXebTOAWUtE1PRBW941MZ/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJtfPuBu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8ksdk027658
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2rCrP0gitYkz61kp4FaGz7nVfzNXIt3MBJTuyV54Lo=; b=ZJtfPuBuxu4xWIB4
	TJLMba6vSPa6JAikg6E06A1I+YCdrlTyzUW52BrroqkX9Fh6thGZecK7jJtaS+G5
	peoKLdOmFzQmqp7ujZMevx9m+UUtXEDujm3KiilxWublRNxI3EtJsnCWzgncEGZc
	7CI4pxeg2xiqR+yFRIX8gLaAVTxP2FHKFnenMw5VvJfTEpMkgJ1LV1UamEVUPV1u
	S23C07aOjpSyhoqtqrq0puFzF4Gfvg7RZvN01kfioW0Fp2K2Get3lUfUvs0F+K/J
	AKQTyii2m6k7f3w/2V+YmUciu36RjpHvvv7ivvAB1o3DzWfPXDK5cwtxS2TEcWDR
	juTC8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrug394-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:12:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab7a01c38cso3552781cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570771; x=1753175571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2rCrP0gitYkz61kp4FaGz7nVfzNXIt3MBJTuyV54Lo=;
        b=wRksaJSosxmN8xdyofx5+jToqgRNGzZujRL47R6Lj/cYcLX3LXEceVAk+I05opKe50
         6daQBU15aoFBs5l0PuvOpJprLbc5TxRpFEiPARzLkKukG+O/tmoJKzWrq1ogOs9DUakT
         +EzfP6vxZ6Dl7y916dBlUWMMG4gd8/yDgi2sKhPzP9PpoJXGVVpbCutelr+1cDvAbITp
         78wvrIh75q9lkvxcCaBmHq2M3K1WvaBl6xbxpV77uQZFduw2NynWtkMjjUwo12e67Hf3
         t0fLtWB7E2xwJmyen3fQFkf+YWK/kbn2SkFfQW6nqD/BrUUlKdZMmVoIUtyg27cR4Vt4
         1zOw==
X-Forwarded-Encrypted: i=1; AJvYcCUTVASanBBOIOOSd5/NJR5F8uv0+nrNIxNHdZWLaiwfGjcSi9tSGPU8cokb0Nqy9MLv6giFoXYiuvUAv7R3@vger.kernel.org
X-Gm-Message-State: AOJu0YwkDQcU4Zdbtor+PlVp2zSM49p6HWI/6vbCGTkEjafAzYJl/x5A
	wgzuyeiZ3VYEcipqgGo8gaH6hK9MfA8excDWaXM7hQdq1FUN+2SoKcRzAASjOQLqhs6tUdoo5Aa
	5ddSdJIaR2X75pPzfc5rkkjgNCBwmtIoQK5I5qQkEHJbQ0enNweJIpa6UUJ/8zFSDmXbdA/G24C
	TF
X-Gm-Gg: ASbGncsWYmst88SMHtuOKbjqCkt1lPo2o2HeK5dT7Nm0pfgef1KvKbNTvIA0qs15sV7
	U/WMNJet7uoVVc4mCtqr1etKhE8L0ZaHa/kn58ucGT16gN/gA/PG68DCUIso6t2npPuPD6+Z+xF
	02Nu1KMkQPS+06chkZCOR3Am53r4COYnsaBrU/TtqOQ3wCuwRRdlarS7pN5QxvqTCRW+V0elJVE
	4ZN6ExEQTu7+s5R0IQIBWeboolyFCKmH5JxYeJR1h9DcuVqQ47j6O4kWFuJm+Au7SSpunjvUeqj
	uVHOkp+ze6FLtBGtMgZNXKYrk06wcKVSUE7XzJ/lKrC7MdGoP4kCwbe9aamL2yayba63ImUCM6T
	ckI/+kEMMP3eLn4B2vzSP
X-Received: by 2002:a05:622a:4a08:b0:4ab:635b:a309 with SMTP id d75a77b69052e-4ab86c9cfc2mr5190311cf.0.1752570771095;
        Tue, 15 Jul 2025 02:12:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzWwnPodE6Q+Kq7WShiNEjqjIhyPVP6HIt1NVt2xIwm4w220wZPwscEj953VSTSXm27X71GQ==
X-Received: by 2002:a05:622a:4a08:b0:4ab:635b:a309 with SMTP id d75a77b69052e-4ab86c9cfc2mr5190181cf.0.1752570770632;
        Tue, 15 Jul 2025 02:12:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82635aasm951769066b.84.2025.07.15.02.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:12:50 -0700 (PDT)
Message-ID: <2df40d26-7874-4398-bc18-0122dd197c90@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:12:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] driver: bluetooth: hci_qca: Multiple triggers of SSR
 only generate one coredump file
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com
References: <20250715051618.724475-1-quic_shuaz@quicinc.com>
 <20250715051618.724475-4-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715051618.724475-4-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aK6TyQGCQVujigtEQRU81_UhR2sHfV8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4MiBTYWx0ZWRfX2eerI5Q0EP9+
 7gxxZqTZT8RQIDTmJlSl3watmAx1HL7zhcyO23wU2SBcj6kW5dMC7he1PPOqTSV/g5KjPmnMgSr
 AtfrNvVwxZ88ZaeJVeuTLjDY0lwp0zTd6cCBiORU5W1M9LOVtG9i/ulN7md0bhvLwlbynxFy59Q
 nhL7Uep9IROPCe2s2DWX+uCnDO4CpWZMvM32LShGtT0iqM2JXgBxp//sdll9YKbUTQVpxRLoUDP
 avAumtx72Ir3mh5EHIAcNmUsA/eTudO8+jiVlLyL0CtpKZpGrWAFjkiE/0FHxj0Ma6V9uxsNVri
 S+AeiEzF/fPd4SqCxU/uxKQ4+W2OjI9/J3mZCZ7+Wsjp73YeTQKAaYBCkZ/bjlaBXISAOq5WXkM
 1rmQ/LrsimYb7/s9QhEpANcxo4DPn0t8nDxx5IzfgCpSs1Eipr7Q0YhqWNFxlS1KddmcoeWM
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68761b95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=SXdkGL_ce-MxmC-6jFEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aK6TyQGCQVujigtEQRU81_UhR2sHfV8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150082

On 7/15/25 7:16 AM, Shuai Zhang wrote:
> Multiple triggers of SSR only first generate coredump file,
> duo to memcoredump_flag no clear.
> 
> add clear coredump flag when ssr completed.
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index a17d3f7ae..e836b2c29 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1661,11 +1661,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  	 *
>  	 * Host will not download the firmware after SSR, controller to remain
>  	 * in the IBS_WAKE state, and the host needs to synchronize with it
> +	 *
> +	 * clear memcoredump_flag to ensure next submission of coredump date.
>  	 */
>  	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>  		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>  		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
> +		qca->memdump_state = QCA_MEMDUMP_IDLE;
>  		msleep(50);

Same comment as patch 2

Konrad

