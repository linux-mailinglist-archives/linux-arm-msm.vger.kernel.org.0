Return-Path: <linux-arm-msm+bounces-115414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uYtyAZW3Q2rGfgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:33:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C58A6E4337
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:33:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Tyw3gH/T";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wj2ddysx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115414-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115414-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 739513028837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B91740B6EB;
	Tue, 30 Jun 2026 12:29:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB240B39F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:29:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822571; cv=none; b=IWGU2iRdQ4+twltyc5p3PiKjvcUUs4Yo7Sv4EwMDQLuZQUInehd4wd5QNkqjrh2h9OOz0P9gd6W65K2P28JwUNILS2qSqxZLaMLnqrw0RkMt+Y6eKqCVPl/UGV5/r7cQoVnizBKXu3uN/hD+sjoyOzGGiYdQ8+GY9/T+KfNcpKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822571; c=relaxed/simple;
	bh=gl0lDm4wynurmveioyR1l2Y5g2edwHFBtqEE6jb4mBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOx0TlkXaSjK25mslwybel206e60ROl7vYKIJqi7WYka7i3NFUlc3rHCWCxyhEAO+2o4mQ54x5UE3Sb8X2yWZgWqRQT/DsOlbvL59BUAu+Q4imMd98nYVriR9gT/ndTXlWPtyKa8l4QHo6A5MhVWeeegs/1ciJhOypTD6lowmJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tyw3gH/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wj2ddysx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxEe1613371
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtTspHsbGkjYzDUUdoD9USWBMPNjPNk/lGT+v+UlaRM=; b=Tyw3gH/TTSBgvzYn
	CTDF1wxMcnv74fhvk3IQ+KTC+kIcRKKbecYHSHw5W3Ijh78lb7r5Vo6eefToGkKb
	RG2k7f319WAv2t1vukHnvTcoYNJfMmXu8qaPa/7c3G8xW9RMoDGFnY/bdoAATjCU
	P3HVlZJyHNBxR6DBCTwhGj+SAdHCis+tHm9F3fZ0e9X20NLWTX1dz5MjSsG7wqLj
	UZzIVUl3cyF+FQ3UD8rPfRqSRf6wJ6nxSINb5cGrg4SWOergjYPo6lX8z2QjgB74
	L4ScsZ/5LQ2x/3wMP4rdY0gGjU0xceG4tF9mLK5jG9uzdKJ+/0y+4u8bv04hrR5x
	QRUeKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cuuag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:29:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c8e14ebb2aso8286785ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822567; x=1783427367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtTspHsbGkjYzDUUdoD9USWBMPNjPNk/lGT+v+UlaRM=;
        b=Wj2ddysxTfwAYc1XH7KOPx+uLd372goh4s4FNN3Klz99QdA3LD79xnDtycwKxAuLDJ
         eTMS2EcqHkRM+dk5hxNDTRwmvL3/g7tAVUbP38ukIpAFz5j73oTih4GJPboNU6M9XA6g
         rfR79qJuiS6+6MEE7G0/jp8zwtDuvPG1dlqapViF+jjiDpLGm3F/GWSgtG3cSwcZyJh8
         m6lqkcJccdk9y0uLT6M1t8383RJEi0OcDC7S+sZZhu9AhnMVrAJ4VMruf2xKVyDdya9K
         wodrzu1K1OcOVZPhLgQhKB0kc0A6t4+8sDeS5dw5FBCZyGWEYJeujITZLoIKDwWbCzpX
         1e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822567; x=1783427367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtTspHsbGkjYzDUUdoD9USWBMPNjPNk/lGT+v+UlaRM=;
        b=BMnYoM/E/evAaVbWzWliBMO3auqErY33FmoMeLDMzwUM6saTF7BC19kIViKLoE/rAx
         ghhJYO2nG9mqym5erW1Sn2OWyF4sBwTVEG9kJp9nTbh69Rr6b6Pq7NKLz3pc3BdpLyAC
         I+c0TkGVeHsfNmRlxGJn7gO4/z0eSc+KsKAg2JzP2ulWD9nROGfk+Hyok0eyE34Gjn/Z
         j+aqEey/uWP06OlWNsJdf8KTkWVIBEONoZc+MFeUEW4MOCeQx8w4LZEXVELxRZQRs5HN
         Lb6MQzN6mb46wWNcwOxpi6q6FutUXCE9yTfzWRHWT8dccJNDWufbBCclZ9r/LPO0FHBE
         VI0Q==
X-Gm-Message-State: AOJu0Yzcg1/fK84Ut7zBzGGHXhKIZNdFDXvinybvoUGRn7G+9iYmch7p
	aA2l7iQZn43Ew0RctrdSENa/0d2D5r2sDDmf5cTnLjnwJwOTRGYeu+dWW/J7EIFWxqEE0A1F056
	MZC68toKuVCW87HeOXajL8ofTNdhEoPhVH7Iw3AvWlWeevmNF33MMyuwkJuOsEeuOTvQh
X-Gm-Gg: AfdE7ckrWhhL+DV6mgMk4RYIMMtmYF5PomCCPdNqh8vxaA/9MZa+lXOSnjjhlggd6hP
	eAP73MtZq+SMgDbHPZ/EvgJkDvtp8T9fUaWVTnNDfn8VrAwrqYYJZLaHq5RQLji1Li1GKQo7U1D
	BY9JCTgvj13vl1B3yK8DOtMWLZSVE+CsHZvyWaIQnzwBkRrFZL7K8PQfdI0VwLzYWMM5KSRLE30
	bziURjsmgsnUWQ6cNST4FeDYVDltsazKEFgWph4o3cQca34der8n/J/lZDJP/DXrUe0nu0M+Egb
	DNhpdMP87NnIQuli685AcuNDt3vSYWFcgzSUQt8NjHW4pf2gqF/9M98I6DLzBXkecSQbOmRwjoA
	Z7J8hxNA5H4a0bW/LTD2tDTqLStUQreNIzQzS2heZIkS8
X-Received: by 2002:a17:902:d4d1:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2ca4487f4c0mr11769005ad.6.1782822567257;
        Tue, 30 Jun 2026 05:29:27 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2ca4487f4c0mr11768685ad.6.1782822566664;
        Tue, 30 Jun 2026 05:29:26 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c71e77sm13054905ad.18.2026.06.30.05.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:29:26 -0700 (PDT)
Message-ID: <1098f5ca-2273-484b-9e0b-26bbe9644c2c@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 17:59:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260614083424.464132-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX3n0YQJKUeeB4
 JiRcDnXM8XTPuYeGq/Dhy6sy/AaUHs17Rq4j2rhHexuT+rE5NOiTacZ2Y/fFmzsyqSPboYPrqb5
 3dlkX2hQFwsJMY8ZHFqPldn9Vsf5ziYObrBPT5NEuZkd7KSV0on78trCbSlYxZ1NEQrPufmXQXt
 HPrA3mhSau44vfJzzpwWbmuccV+Lzu6ZvuGt52Ij6kA3a3jrgylwvRw23ZC/0EPdPQXjbKvTg2x
 1AN//jfM46PVyFerfWcUgBeTN/p2fjQDM9XitLrqpx2jKaU1IIZKfrrLR3c5WEhsbZFkNNtfNG7
 PEUkciukqEVR1T2LbvXZJOK59Zfg2McHhPVtTdv7asu3lcttkelCRpAA+0YlU22wDVNE8lnhtYN
 8P6Qvk1bF7ppMA4RSnihCp4JDjewnKh8Wu6+HAA43ImlrXLe6qlPHi2oO5o4+/DyhixyK1+Gz/w
 cCvg5x/Jam1cAZSBP0g==
X-Proofpoint-ORIG-GUID: SbL8SQPTV2Bn3awgCoywi1m_q7lDboak
X-Proofpoint-GUID: SbL8SQPTV2Bn3awgCoywi1m_q7lDboak
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43b6a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=eJ7jpIcogiy-yz44Dk8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX454h0SHP5nFy
 b2yES9cBN31H8PZ1xEgVs+8vk7bU8XlY8J9hjxpzHE3PDRAmZHIbRQd+tOqtBFVaC+Vh2LabyUN
 eX00F3sUiH1f3JvuwaatreJgqeRHclU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115414-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C58A6E4337



On 6/14/2026 2:04 PM, Pengyu Luo wrote:
> Some devices (such as gaokun3) do not disable FIFO mode, causing the
> driver to fallback to FIFO mode by default. However, these platforms
> also support GSI mode, which is highly preferred for certain
> peripherals like SPI touchscreens to improve performance.
> 
> Introduce the "qcom,force-gsi-mode" device property to hint and force
> the controller into GSI mode during initialization.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>   drivers/spi/spi-geni-qcom.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 26e723cfea61..eece7312f780 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -102,6 +102,7 @@ struct spi_geni_master {
>   	int irq;
>   	bool cs_flag;
>   	bool abort_failed;
> +	bool force_gsi_mode;
>   	struct dma_chan *tx;
>   	struct dma_chan *rx;
>   	int cur_xfer_mode;
> @@ -655,6 +656,9 @@ static int spi_geni_init(struct spi_geni_master *mas)
>   		mas->oversampling = 1;
>   
>   	fifo_disable = readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> +	if (mas->force_gsi_mode)
> +		fifo_disable = 1;
> +
>   	switch (fifo_disable) {
>   	case 1:
>   		ret = spi_geni_grab_gpi_chan(mas);
> @@ -1133,6 +1137,9 @@ static int spi_geni_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	if (device_property_read_bool(&pdev->dev, "qcom,force-gsi-mode"))
> +		mas->force_gsi_mode = true;
> +
I don't think this is a HW bit, it's an internal selection based on FW 
programming. This is inherently decided by GENI_IF_DISABLE_RO, No 
exposure to the user/DT.
>   	ret = spi_geni_init(mas);
>   	if (ret)
>   		return ret;


