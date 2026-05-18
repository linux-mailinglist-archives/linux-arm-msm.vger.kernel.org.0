Return-Path: <linux-arm-msm+bounces-108139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK6GLILWCmqc8gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:06:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F5569551
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7F473006783
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F5B3E4C6F;
	Mon, 18 May 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juEfOYUW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jo7O/4Qw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E440D3E4C68
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094877; cv=none; b=WUpSGVJ/mN7v1R9G6rdXb671RUwl/VhHvt5B1xfLuToOhdnU5rQaBSQGbA70JTpPB5eSvLxQBc/xqY9hoH3deIumj2eatNm7iLRsRqc8A+tO2Qr4qIXOlkOZChy3odVZQpMq+CzoyySe1Fd10fjbwbuXhc53BHRpv57L8A63K6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094877; c=relaxed/simple;
	bh=RSPCH3qc3Xy4iGF8ehWaeSsdARYzSnxswqYM1yeqbyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2pMoVl4uaYORPDH1VwbBexylB00zQ4r2B0/+fzkdWpN0JadZ5xOVHVHWiUNYTkWc6fThKKHJfSPTHvBCbP33QC7mP7ZGE8crWdT65XXOxI4K86l6u9K3Bi/TndO5elQlu+0/9FxpywYtZk80JBIiv3fM3uZbQvkUFrPgOtX5OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juEfOYUW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jo7O/4Qw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7vYDF2531321
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ex/iHFRwmPF119yQVv1TrHAEiQaMqDN5Tz27AKPe7hg=; b=juEfOYUWJv7H9jrd
	+XKDfYTw4cSbssi3/VCmUNSBIBMjwbTHBz2Q2wKO6vcg+xnpWDhqNihY/WmQKZS8
	j5AeKtLgUkG5bQoMv7XJ/MHUl9B4k11EsCJlC1DKtFONj2kT9QEMMCyJc4IhVhVb
	RclNluKpcMYANOBc5lthhFirpQimBb4I7d47QwED6wmKLuHBWldD9kOTg7HXno7z
	ZrV2mOnNhpkpe2A7aPAAdXTYcjdE9h4sSCh7MzzjA0h4qVoIsnDEeS9z6axlRKCe
	4ceUDrKGKmLHlmCsUGYfQMW/SCCb8fA1jhZLOb5tu6uixuCjuCNExhwRSO8X/qC5
	c+2hZg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcmewx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:01:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso1726238a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779094874; x=1779699674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ex/iHFRwmPF119yQVv1TrHAEiQaMqDN5Tz27AKPe7hg=;
        b=Jo7O/4Qwa0YOA6BCC4owwWPm4lg8i7ajVL9VybCDnPYXledGSdEW+qKVhNb0Ks1IRI
         lVNcqgzKcHdwTf9YpBDT+kXLvKsR5AoMUnZ++e0RKSnIf/zxIQDTiiaDnsU9dwqR1Ibq
         R3tQ7KPoP8OjSABJNtP8fwFMlTMGcGNKfx95UUe7JQI4QrhQow8RJZEN4J+06L9YmIBA
         K127JOyBDRXG41JjKOmyLomYnCI4cajgrzh5/kA3dcy+MTwx2N2rO2XIhMAmGY+aAhA0
         oJCZXbDcyoQHhVI1U7zgbyPQsdraoujycUFv2NSRw7GOUDU+FrKcDQaanLafWScMywBW
         Jacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779094874; x=1779699674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ex/iHFRwmPF119yQVv1TrHAEiQaMqDN5Tz27AKPe7hg=;
        b=ZczCrYP4GDIYCQgsThTp5D26Hi77fgYcjbecCAWoqG+04sYnosxzhdwh3wUBkoRiy1
         8JRLuNXcmeJwKihgZ44Aad6bVDqqg81ZGd2luMJ97c6mpXWrRH1fJxSYxEjbSAaI7gK5
         nWv60MBmd5XTY7cYqbyy3A3V21HyE/PikklRWkyFeZmEkQ0txJoqCKsiNGa9kuj/j9Wi
         yB9PE/LYnKhtdD1pu+Hl7rcJ7gagZ7DiQgXS5ByNQUiHrNZrI5SIC6lG27lEiql0KOYt
         r/ey0lfTevIFUW8ISsMlM1bDlty3ldLU/h0Ihlzzappx6211gyMOxG344/JGYrzcjQ1Q
         jLCg==
X-Forwarded-Encrypted: i=1; AFNElJ/zitN6tQEexXYlc6/fU+Pi8cM3KA4lBNp62FAx3wXXrAtbRpJJhDA8618uAQbzxrDqu9SAcGJHgQkRi2GX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4yyOrQ9fKe3ZTPln0R5aTBEN3pa8eUhRIYGjZVl95I4H2AA7U
	KS/D2skYvn2QjfFLxWYg7EUFKECxqFwLK30qxuh/JWAPQF9dAu/qNnBsJo/qVPQEiyHEF7H1NUq
	EdktVw49oM024Mh8vBSY5LUs6w7ZFD8zZruJfgaVjr/mumN7iHl3soO+2kL5nPTUEP8V7
X-Gm-Gg: Acq92OGSAE4/wQBdu3YKnitUDtY7/oCFifjBvAfM0SZ/3nE1P5sv077HRa+SgRUcVAd
	EoY+DmDO/VPY7N9JC6Q4+X0gtw/XoPtv6+jrY0Vzd4PQvuc+vd2wsDyg+0eo6np/gEYnCpQ8RLu
	JiMjoNcLHWquj1RGUSFHmI5GZ+AyR0mCFSzv34W9K7S9lsHUbCIRbDKGvXtSA30RMd2E90JOe97
	DhLJ/PzFzjyFMrK+TU2kuHtez3C6VDpLijNriv9I5+mLHwSGIEdx3IfPSWo/F/A1xlHW90FADbK
	N4niDQEnbquV0Kua5YYFRxy+NIUi6o5jGbFUtNtko4Po6fLKgS0Dlumk8GUKubD5694TJQO0kAy
	8bJIUnUQZyjqtt/8kUca1uiCVwegT8fUyxN1v5OhDcX5v6hvLWgMoj1e5TVu9xue5VEVLrDOimN
	rq3rAkxSn7rdn3
X-Received: by 2002:a17:90b:3c8f:b0:368:ddd7:abcd with SMTP id 98e67ed59e1d1-36951c9a01amr13690179a91.27.1779094874445;
        Mon, 18 May 2026 02:01:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8f:b0:368:ddd7:abcd with SMTP id 98e67ed59e1d1-36951c9a01amr13690138a91.27.1779094873918;
        Mon, 18 May 2026 02:01:13 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369512424c2sm10476510a91.4.2026.05.18.02.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:01:13 -0700 (PDT)
Message-ID: <504b3674-283c-4fb2-bc5e-4a66220b894b@oss.qualcomm.com>
Date: Mon, 18 May 2026 17:01:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scsi: ufs: ufs-qcom: Use quirk
 EXTENDED_TX_EQTR_ADAPT_LENGTH_L0L1L2L3
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
        bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260501131641.826258-1-can.guo@oss.qualcomm.com>
 <20260501131641.826258-3-can.guo@oss.qualcomm.com>
Content-Language: en-US
From: Ziqi Chen <ziqi.chen@oss.qualcomm.com>
In-Reply-To: <20260501131641.826258-3-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tQpbjlSx6pj7iTQ0WHdeM_nNEyOGecWP
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0ad55b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ojIT_3mfSX8TM-jzfhEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: tQpbjlSx6pj7iTQ0WHdeM_nNEyOGecWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4NiBTYWx0ZWRfXx544+NFLCbJV
 cJh4fxJw7JF6nXZPJ0r/4hJ7xbOtvx5oh5OBNQSavgckCg9LyKgRjLBpFBQiyN9ELSyXSa+C1J6
 bJu+fhkUt+b/U8mWrw3g55de/5XnxUolIlxtqgELIxjW9O6kAhBqP7q9L5jZvfNcSn8L69CUItO
 e86LREUFWsoArHPz1b44Y8tyygVibkRK9eHes8N3Op7vinDpWfZlYyc2/NAoDHAhlPCPHMCquAI
 okgsYc8s7YH7rVXld+xhaNUH+hQz0fNg6mhCxHJkrv3eSJ8dzmh1HcUhECxj7GG/rrIaQidH9hp
 2riY49K4a0b7/ik/6HCGtdyCVwdn8+TRqHEWuGI4LSIKlRqqaLIV7Tk2NDXXhqrpsFtt3i6rvOf
 ByJY/+datTFY0+loI8x10/6xOwJS4mmLfEuO5Qgq6xCQs205bcOdUqpFnfEwkQyV2rFMSNioaMQ
 5Xp0KxCt3TIAagR8ZUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180086
X-Rspamd-Queue-Id: 164F5569551
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108139-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ziqi.chen@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/1/2026 9:16 PM, Can Guo wrote:
> Use UFSHCD_QUIRK_EXTENDED_TX_EQTR_ADAPT_LENGTH_L0L1L2L3 for UFS Hosts
> HW major version 0x7 & minor version 0x1.
>
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index bc037db46624..7b6957ef164b 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1305,6 +1305,9 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
>   	if (host->hw_ver.major > 0x3)
>   		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>   
> +	if (host->hw_ver.major == 0x7 && host->hw_ver.minor == 0x1)
> +		hba->quirks |= UFSHCD_QUIRK_EXTENDED_TX_EQTR_ADAPT_LENGTH_L0L1L2L3;
> +
>   	if (drvdata && drvdata->quirks)
>   		hba->quirks |= drvdata->quirks;
>   }

Reviewed-by: Ziqi Chen <ziqi.chen@oss.qualcomm.com>


