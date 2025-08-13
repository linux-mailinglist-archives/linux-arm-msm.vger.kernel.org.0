Return-Path: <linux-arm-msm+bounces-68965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 809BAB24818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770041744D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6482F659F;
	Wed, 13 Aug 2025 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSb5afW6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA2B2F6587
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755083521; cv=none; b=FNIcMnhMvU8FE7st0uCZ/GxApW9VugSGyJyi0OEB/o0vJ/7Y1XX74WXONL+/jYLviunGY9t+NIKGRJ4QYQZTYJ4iNYEsOGsJX0yzuSJ4dCfgVwZXgasxrLkGmF0KgwDpRm4fdmTVQMQqYuulCTt5YUXsbdRvusr9G7YloYBP4CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755083521; c=relaxed/simple;
	bh=aG2w3++GlP8FSxeSoENjbAw7qhESeS7SNMbbt3zHZaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=quEaLozD4h0dEl0bGasnM9pf7s9fvf8rtvF4ODa6RTP0BKXccMIp3PRSGMigucd2I3ECZVmn9AxytBvGtvO6F6zFT+/BfWssRyCsgEJkW9fpaW5xRNoY9HhHIr0/n6L5pD0+95qDgi1gUUR5jHsUN2QkmkehrPSEkVTAwqWH1oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSb5afW6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D9ewcU022115
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9a9/MagtEYxspNjJutJnXaxyzY3EaY4+0V2FdsH7W3o=; b=aSb5afW6Ybc7nlEY
	L/hZ0nKvek9Z23K7wqo+FjtFbM9scDaGIBymaSmjwPyZu6hNucVvJzfSwovoOgd5
	GJgZATVmQY0sHBrKw6tLlsnCLWkJFIXCE9RdcGBR1DMp6rZUgswFRTiWkMrUTcJi
	xngKQna7HbuhdafDXfQb9/yL1XouXoOHBl18b0nG3wMLFyHaJy7YwpP8r1pDzRmL
	KDwYiGHiKvBpnxTw5ZSUOx/3pVhyPk2Z/KsrDBGgQWYxzdQ+wbSjaQujSbmcU6tj
	32snPoi8PgHmBPT7WfAG7sH7sqGy1eAHak9lX5CLperQ1oexOWVudeWuPsgz1CpP
	x4g1Dw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rr7sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:11:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08f6edcedso18778511cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 04:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755083518; x=1755688318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9a9/MagtEYxspNjJutJnXaxyzY3EaY4+0V2FdsH7W3o=;
        b=srWN/arINGy0k0/Z939KxGj9jQ3RnfRab9A5ztQxSvzQwH4PaJOly5kKuHwaq+zlyE
         P6qj7+eDeFtlxmF9M3HYGOSPoMolU549RdSGdnxjoQSR/DLepuq3u8W/WVDaCVnA+0Tx
         duYfgb5wBUicCstsYlV9rGkGsbtWhoJczwpCRGNYeMTCjJORI9gOe+YrXjnaKkOIG6tk
         qvj9+uoNTDF0TYvPqije6USia2XkWpv61W7CXfb47BQVgHN9UUnluR8nRpMO3DUEmNtE
         Sfjrd41rO2XC/3VnXMGkQhb0OueG2VYTCjnKb/uIzem3xDhuupP9HvoLr3x9m+LcHkph
         oyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYhVyJDqnoAz4mPOmdD0GKflxg7Z8GdYocx/+sZp5tOtKfXYb6hnh1Q1PkS3TcXBd6FIelgEw606oLJzqk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7QG3EOiosu+VjzlLqHCAj/PDPs089K0NPKk6Jyoxsf2YdgDM6
	LIi/FVH/PUVClkcYLNoDpXYfDZQZ6oh+2ER625Tx6XhKtbE56WYhUzcDnMjWXvjcaebVZkMtokY
	CpOl6HKGM8qHvOX2HCt53KJ1E8e/zI8BKla8IdXPMM40hE28AuvVvjHxBSkFa6h1QaeSWqPOkBe
	W+
X-Gm-Gg: ASbGnctg5FQui6o45KByq0IGMNUJE/i3SglCmvu0Rk3arPRFObXNQG6dVovCTKYik6I
	+PPOVGZIaeHyndwBfZkfyr6Z9p2hY42o0KDLxqMVqD6RSYxNHcplOs1Opa5VqU8DDphuTCE/rys
	ullzJOdtyIx1R5bSsRJco0PeERvEsGMtWklegzne6UpvO5EIpXgslO+utmR5TgvIsGvjKOfS60F
	sNgTrHIu9+Vlp9l/2WQQp1CZX+cRE7AIMDyH240m+hs82tZTcQvVH1u42jNFTIEjC9cPR1LobIT
	i4NyPY5XrFjuIE1QRK8u4KfJ4gZVYhDGnY2fVXcGdVibU+19FYkjX1QaWJOdsQ0I4j6HO0kaO7Z
	bSBa1+7Ns+sNd7vb1ug==
X-Received: by 2002:a05:622a:1a03:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4b0fc6f6340mr14072181cf.6.1755083517485;
        Wed, 13 Aug 2025 04:11:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9hv8At2ld98/A++aXSCzw4i6XuNtCjRqkoFXv7OrvV7SHX95KyS03qs4FAEk7hoguNfKeSA==
X-Received: by 2002:a05:622a:1a03:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4b0fc6f6340mr14071941cf.6.1755083516907;
        Wed, 13 Aug 2025 04:11:56 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e820asm2371584066b.90.2025.08.13.04.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 04:11:56 -0700 (PDT)
Message-ID: <5c94849c-88af-4094-8967-c3b04d33c27b@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:11:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] driver: bluetooth: hci_qca: Multiple triggers of
 SSR only generate one coredump file
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com
References: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
 <20250813033505.3868781-4-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250813033505.3868781-4-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfXwd/lFLdha/Uo
 zCeQ1stKAS2aAeKJ3RIsXHYdnE423+QZr+RthZg3dYjkn0LGgpmEwRjDgSF1hgYJ/zKk/aQZ79X
 AQbJ8xc+l3IaSW/Z/G5XRTxGs+CL6xq+esUeFKCBOIhyUPJ9fn3DukzWoxmPX3znDDx56JgRnbR
 PcZjriFQWQiFpEazBrUtySNm/b6QXO+9RI1OaS7e0FKXxgtxtaIe+zd4sqZODsCgNJr/fp+M6yq
 22FdfcAJ6dIe72xwVT9Eq9XAu8LS9y4g9J8bM90H3PcWXtT0dqcdEuaquEK/vFpXsxno47qf+RW
 lW3fM3D1ONppDoABNbDV8sPw9iCjzVuE+oB72KqDCt6KjVHQT1/Po6Mnh72teoFopkH9RSzqzLO
 2C3wSWk4
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689c72ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=MAoXZctyg3N9BN3KD1oA:9 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10
 a=xa8LZTUigIcA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: REbHPsbllXGezI67Eh8FPvLnnxcQqWSo
X-Proofpoint-GUID: REbHPsbllXGezI67Eh8FPvLnnxcQqWSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On 8/13/25 5:35 AM, Shuai Zhang wrote:
> Multiple triggers of SSR only first generate coredump file,
> duo to memcoredump_flag no clear.
> 
> add clear coredump flag when ssr completed.
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---

Please read

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

and adjust your commit message accordingly.

>  drivers/bluetooth/hci_qca.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 50ec9b155..33c2dd7b8 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1662,11 +1662,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  	 *
>  	 * Host will not download the firmware after SSR, controller to remain
>  	 * in the IBS_WAKE state, and the host needs to synchronize with it
> +	 *
> +	 * clear memcoredump_flag to ensure next submission of coredump date.

"Since the bluetooth chip has been reset, clear the memdump state"

Konrad

>  	 */
>  	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>  		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>  		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
> +		qca->memdump_state = QCA_MEMDUMP_IDLE;
>  		msleep(50);
>  	}
>  

