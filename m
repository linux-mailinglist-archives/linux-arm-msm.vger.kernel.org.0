Return-Path: <linux-arm-msm+bounces-86857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3250CE6DB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FC70300518D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6123330FC37;
	Mon, 29 Dec 2025 13:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JC2NFTGa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4r78vyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEAB2D63E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014337; cv=none; b=hgPde8FtXLp9kvcqFGx5u2Dh3bTh0+OvN59B3p8+9arI+haB/gfHrATO+t5LOiHtEnpSiZjschwTLU7csaAFUkYTivGmpM039Dh/0nzyCq+gVVVdVtOEI23qxE0Q9+jDwBaoaKHEBTSyiEU4R87cORdHbTO6J1deZvyoCG6ZP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014337; c=relaxed/simple;
	bh=XpD7T99QK3bKDNjy2vsjPCbr638faFYz6cZEp0x4Dic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEKVCFYN3XHnDMdnEBohop6a6R6VHduPhRzTX9e5lcNQfTmS06GOKu7Wmg+P2LB4ab4JhMXsdGXSC/xxYDup9N+kAmKRVOQXxD+7ngIZ4WyPaEb4eBBNyySk7bQ7ZpgT5S/GykYrxmmWchCOQ8OqVNPrtL6qeXrhW2rzRF1uTIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JC2NFTGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4r78vyx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA50QC956291
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/v/RUGKGn1X+vhYpfh/pCrCiUYLijb3g2R8NqaKVs8E=; b=JC2NFTGaM54DY90s
	D6gv08eDbXkDcQ5BH3H+klKsu11N8Jc7QVqYuOBE8S79yChsRrNu6QpsC15WMeXA
	35E+mVgLjcVdXbQAJqbeMb6qlVkvV4y1CKvD6bnvUdpJyUzz9vaItD2e2VcSbwJi
	OkhaI3mPtJILOTdnXRR/oXu0NCw5YMhTJp4yGjTfm6xvckB1n+CcFUSRuu/dy1PV
	hvW/oH9kT4kK/+hhQJLtVsqmBaJOI6R2G6vkQPbFKUptBtH1hOWAHbTe8ssQH00f
	mIWqT0xsoNWT59aruCEbzE7rhGHMefEfm63dr4T8UbZ9qUTZ29Ow3LMKP3NNgejq
	Y2HbSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk18b9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:18:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso36223631cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 05:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767014334; x=1767619134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/v/RUGKGn1X+vhYpfh/pCrCiUYLijb3g2R8NqaKVs8E=;
        b=j4r78vyxCecR6oFUOJOLCQynCuASv8+wY1ZkqKYtjo9zqzGMDDs3VSjn9soa01TXVC
         YbIxyOoaNx5AY/3U5LpQWqCc5ZaX5c2mJ4AwLUZelzFMZMd/j35NNqQNf7ABHA6Okbc5
         zqA954/1bRxbszxJ5sXwz1VUzwhgqi+km8L/gwdHfsVoAm0bP5LMkExJI/u8KBJOAN+G
         HMYjMrSJoWoSe9nx0QdHHQn5jgsYuB+dd57BJn2KoWCbb9F16Q8MMiz+vSMH/I0+1aZz
         jNVgeOOu6i3gXqZWfDlXVA5oUPHAvyeKqWB2mySqPdDgXjFMUVPL/4s3DO2mglZcoCp3
         AaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767014334; x=1767619134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/v/RUGKGn1X+vhYpfh/pCrCiUYLijb3g2R8NqaKVs8E=;
        b=cnc/nOcFwHczua95g3rixZMBafYtDeE/f13f3TV9nhRvBtu0TTmbl7Ric4I1xqIDnw
         g02v1WezzQ0CpqLmQzmVZyJe/5pN0zs2oUH1nFJqEhT7KXvqD5fnwkLvIzoz9T++tD9M
         BD6v38y04I96NpgvLbiZx8R6n3P+wU6BKbJnwPKtBTNT/2C2wdycPzIeB7V6b3XcEw8U
         4zU8R6hP0dTnhnlvnMtHkUJUSMLG7StJGS9uiTCFa8HwNyQj/0xz6iSK+CRgZRPjZYLA
         N4n6b0ZsN+i6hupan6UWE7+b0kRBOoADGfdXe+ZHqioUS4pDMrn1ByplhGKfObDyFyGr
         ks6w==
X-Forwarded-Encrypted: i=1; AJvYcCVSizP0UXZtqPxzr3ZIBUdl8qoWTQ7uQGtEbHfjr7ioR14wjBuwZNPK0td5dj0h1pcKU5clVvsbUtPCv7b/@vger.kernel.org
X-Gm-Message-State: AOJu0YwuO/eNEGGvATkFAVxEnrBT/DNi0/+56KH972IKiiBii9Otnhxr
	0PSA3fFPNfQsqp99mXWOAIqJTpONMAhaVQ99Osg1z1kFotzrw3XiShMLbYrUZjiKlbFy7enenaO
	v1jLOpDYG1Fy/j6X2NQQs8V3xn94ObZy3NfOrXZGdUK95ZgcmPXocsNL01DLnS7Y2En+x
X-Gm-Gg: AY/fxX5IOWdXe/uk1m54amRjlTCq324weoWNp2/3XB/QDcDoQN2+r25o8P4Cvk4upne
	Edxgo/M4H2HwSJ/Vmlfb4OMZxJiAVL206P3i3xbSz09+3yUElSao6gVKLgIn99p7QoAqYfsdgST
	PJHclpmF/mxXFZype0LnlPz9AaMBy2Ct4gxTtOHYEFfxt9ax6FxVN54/q+7b8lLm8HqBaoviPSP
	ctILTq0ZANfHfN8CF+SqfdUMxnlVjCH5EH+CSfn5RbVfWSQDL0YwgCjvG7htL3ZoA0sit2DXNIy
	IaQudIO7pX79C/IET/rnYdxKWxgP1rwoCy0E9xrnLD2TWVnGJgylnnDuMsRk+JqnYg+OB9SueGd
	JSa2E19lP+busEk57Gw5HpOukYz5NBYJzKPwenmcJhsHMKT9hzNrsM4vhMwRyFfEPAw==
X-Received: by 2002:ac8:5a46:0:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f4abcd86f6mr342183411cf.3.1767014333995;
        Mon, 29 Dec 2025 05:18:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpXqgxRlcmGdra+B/YgHXBjytYW30Ef6ubBa41rl/XtAmpXyGW8yniJTBqIkfK/TboBcBC0w==
X-Received: by 2002:ac8:5a46:0:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f4abcd86f6mr342183041cf.3.1767014333563;
        Mon, 29 Dec 2025 05:18:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f51a74sm3418949866b.63.2025.12.29.05.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:18:53 -0800 (PST)
Message-ID: <cbf3fb8d-1dc9-4c16-9bd6-df45530a025a@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:18:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mmc: host: sdhci-msm: Add support for wrapped keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, ebiggers@kernel.org, abel.vesa@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20251229070507.3322149-1-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229070507.3322149-1-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1q9fUkfjUvRur7-LWVYFsN4p76-NTPN5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyMyBTYWx0ZWRfX9wa5cy8Oks2q
 bsi01M6SSBh3LmQzb2Kdw3POMfhbZ5dcyL93PZqNv3qquBOV2YNMXq/Jf5+Dd2AdeeS0FQ/DWt9
 mboasKx/qAFU7+AStFyjAYu63zwBsvaIirkdM1cmm+gY1dLZxFAG9JMW7/HdFM+x97vac4q9Dtg
 gc7JOok9nMqT0sBYV3H6ckBdHpssK3u5VbWjdwVNVnxVqAgEFGH+2bf5rMLrQmBnnIEiEiDPssa
 PDX4XaQ6Y35JaPknefKYGhxTe8FiBVoOSfNB/4U/xvPrqDvP3HspfBhGATo7j5vusV7fp1xJagk
 KXexCqnOa44zhEgobCoQXsi/FWhbZscPs8qp7UJM0dbcLrtLBgQvNbnE9Iehca7fzTpSyumGNHe
 ULcF88vCXtBq/HayKAeerrpJUvyMsWLmc2S0BSGeqww4l2XR3P892G2iBeQ7LrA2j8xpLIRSDOF
 w2H4Vi10X8VM/goiYog==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=69527fbf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=C6MLRjK8zebgh08ocB0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 1q9fUkfjUvRur7-LWVYFsN4p76-NTPN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290123

On 12/29/25 8:05 AM, Neeraj Soni wrote:
> Add the wrapped key support for sdhci-msm by implementing the needed
> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
> blk_crypto_profile::key_types_supported.
> 
> Tested on SC7280 eMMC variant.

[...]

> +static int sdhci_msm_ice_derive_sw_secret(struct blk_crypto_profile *profile,
> +					  const u8 *eph_key, size_t eph_key_size,
> +					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])

These should be aligned, please touch that up

> +{
> +	struct sdhci_msm_host *msm_host =
> +		sdhci_msm_host_from_crypto_profile(profile);

Please feel free to unwrap this line (and its copies)
> +
> +	return qcom_ice_derive_sw_secret(msm_host->ice, eph_key, eph_key_size,
> +					sw_secret);

And this one too

Logic-wise, I don't see anything obviously wrong

Konrad

