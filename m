Return-Path: <linux-arm-msm+bounces-89606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB98D3A4D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BADD73082168
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19AA2D060E;
	Mon, 19 Jan 2026 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0ykjyZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iv54GRGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A24E2367B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817970; cv=none; b=sitpoF71VpyrlknY3BG31LFwaB8o3Gb8YSMKHzakzg/sBK3MzT853tnK+5rEZ0JYLKrM8elsY3ABtL5rNPnYmDRalKNYBVtQVCoWiMNa9NXPgcQSvb0JxEztnlQmPCLkU0cer+IHmsZrx/jt1dXbn0TyN3pd1aEE92R6we/jt8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817970; c=relaxed/simple;
	bh=HukoZ0sxKRcUqWtfECh8yaNdQo0JysxAGRwHzeV630Q=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kHjs+4nYV7Uuh9+F5JUVqeYhzvaPnupHuSr4EeEAYltsCdoN6aaKoD/Jofdj+5EEc6uteKDlGnTUQ8XcDy3bRmwsZX/A2D2/NEDDOrkxrVckOwDRq5Qorg7sW/rejp990HAaDafSDi0FTtos75Yg1LXmvQ4BweI6HYPY2RSNkeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0ykjyZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iv54GRGS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91JaB1470690
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q269Adi+iglW7urX1zCjMdU0Oa+mDnNzX7NUDDZoNTU=; b=I0ykjyZSI8kx9IaN
	DHeMBTPXkUzSNGmAOvL1oiwwqiQVQKC8gRwdG7E9bIzhfP3Q9k9yIt8QK2T9e1i9
	irVBq3gQ2timqU8NjAxxFhoChzIO/X8IcfICcKy6DNpZ0aYRKJ1iVBMn+Gb8ECcJ
	o36pvnLjxv/nzbrtm0ttNhPHZzpPqHcGnGwexpwUoRVmm5Y73mOlb4xow+FS6C4x
	BwXOQBqkBlO0KXhCV5bNahbvliqZpeKKos0A6S0BTR8HC5F+gwWRsYSQlRoQqD3r
	lOGfuT/gkZNg2Y+P5Q+F/Cnd0tJMfffDzUpaDjJ2NSl8inkgjWdRMK4bMjPb5Pt6
	l6gKbw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2gumrx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:19:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-804c73088daso2811212b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768817964; x=1769422764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q269Adi+iglW7urX1zCjMdU0Oa+mDnNzX7NUDDZoNTU=;
        b=iv54GRGSP3jT0AeTDBx4TeulqwD+2N/+od5NANNAk05CMZfOQpeqbvwpOOucndcbzR
         QyOs5S4fs3DUWtymmYPd8Jqx3CZLPw8jH1hoprVwEmTg9yt6Lqs6Wd6ECV1YNaXQw9RM
         Rkxa0nQ+kb/9bw7YEqxCz9rjSAsXmS/Cs9m9RQZ+DpNz5fX8gcCIcWkq+KmK/3cHeSAI
         02JTA4MG4xyGv35oE5vP5TdCJ5IJcEOG1w3XC4irAldkMCHr4z1E4qqkFKHSwLo3vLXe
         N63Yh+KPdr7XUcZ55NOzVRpqBEz2zjSljbWQTanVtJ46xdx96RIRxn0pk3KzS+6Af1YN
         mFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817964; x=1769422764;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q269Adi+iglW7urX1zCjMdU0Oa+mDnNzX7NUDDZoNTU=;
        b=MX14XCcBOTw6ngdhwXnzSKTG9o+K0b/HONUuA16HrXezPHfwZv9OOFUlIIqKDOrm8D
         t0u8YRpKMG3XWsz/0YPNCFuhbUJQWUsLtfzBzTUKNmY7m6z4hkFOm+uScl6WwkDD7WiR
         JGdoZvLp0caWMdzrXzHkf6E6+otNf+Bl5sNAUncwAfMB/S79XiebGU5F8JevQOFsU90w
         6JSof+53VRv+tGaasPltdR92/RrmS6FB3Oxu9uvv/fwr/PrQCcf0kbU3mSDFJnBJw0jD
         iMCW9AzpsnydMbRAOms1apVRVRT3VmNMmYKgkxNuxcKociM+gpEuAcKCZUBv2oZ/n88X
         w/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnCHc0eiJ4RWfUYVvQSLl+45t0mNC1/iZJieIQW2eqRQ2ECKB4sW/upuksejql9OXbwlyt29PEkwFhts24@vger.kernel.org
X-Gm-Message-State: AOJu0YwlwhPYsfweM+QdD+rvEq5/sBxnzE2MdUViW7JHpp0AKZFK+Rie
	aB6JcsbNU1M2KP87e67oDnbv+o+VdBNgEskFLfxa+Tdp/DfqrR/cW1YJVTlWbBAjI1hDNvyA3xQ
	AaSplxaLmXQMhwpod1MXjsCy+EkZyrWCOm87b1U0IFO6LsXpbzE5hnSbLJF/7k6NSl0IHLYeqwi
	rn
X-Gm-Gg: AY/fxX5Y0cxot3hDkwp42LMrBiHmRyNkuP/HVvbBhV8GQLlvru9SrFKs+To3q/Sg/R2
	hAS7qjS5N+6qW9sGqiAGTfJOBacw3veDpD9hD3HRRn7J1WPAyDLUyFXBebYduw7fxv3Dq3mitCu
	JhcRjPdL/jcP0FId7Qu+nK6ro89aa2YBG5p/qx51pEBT4K2TCe3N4+/Nd/iq4YrpMaFOB2xkoEh
	9TOElo5Ib1sAIS9EHV7aOnEz5aX4ERs6MWLH5V2P6BGh9X013XfCQFvTo3ke5OPpgds4IeSIpCq
	ttw1EeLbcBFVx7hcQR1T332D5p6AiVTr4DdlXAOMg4RpScDLu8ooq/QQJwDtGaTA6w62AOmlZN1
	S3u/4LfDrz71T4/30EmaaehVhsh0fpNEDS7hc6do=
X-Received: by 2002:a05:6a00:1144:b0:81f:3c34:fa73 with SMTP id d2e1a72fcca58-81fa07579b7mr10011701b3a.34.1768817963635;
        Mon, 19 Jan 2026 02:19:23 -0800 (PST)
X-Received: by 2002:a05:6a00:1144:b0:81f:3c34:fa73 with SMTP id d2e1a72fcca58-81fa07579b7mr10011675b3a.34.1768817963123;
        Mon, 19 Jan 2026 02:19:23 -0800 (PST)
Received: from [10.217.223.153] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12779desm5799756b3a.39.2026.01.19.02.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:19:22 -0800 (PST)
Subject: Re: [PATCH v4] mmc: host: sdhci-msm: Add support for wrapped keys
To: Adrian Hunter <adrian.hunter@intel.com>, ulf.hansson@linaro.org,
        ebiggers@kernel.org, abel.vesa@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>
 <3a93822a-6ca1-4cc1-be12-38b2b04704da@intel.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <23c9f3b9-f575-5bc6-e7f0-46238c26a7e5@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:49:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3a93822a-6ca1-4cc1-be12-38b2b04704da@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NCBTYWx0ZWRfXzgMGuUIV6V+8
 OTIMpU8z4oEzuB0Py7AneH12p9IRZnl1JLyZyf9gmA3oC1+T9ttqwnrAnqi6yX2vDKSptql0naw
 BLJ4P4UhrKc1na03LpcCL8/4hnYIQ6b44T9naXnyz6+sufD609YH4VdOKuokxX72GaMtZK+dlWo
 gE1RanngkOGCCiLVG5GD2SBra1aVPd7OiiCaPxdChlKWaFIbURFH8vcJbG7xoERQ9y5m152UC3S
 5VqTmD/NEtULb6o1CHt7m2YLgcyFWGyj+KQ699BIZr3ml3UmB8E5U2KJjOUkymTRwWzT6oyJdgL
 8+u39DxQ9qjqEcIKd45k8sDuACxpxC+XV3V05zE8NesE+ny0GP3tA+iuSeyi7AelacB+jS+94mX
 pErnjz4uZpqeFhUaQTanMOVaiGuur9nUmXMkpEhcQHAUnqpNxGMXgVCn4uflb2MaIaJnseVOHDr
 WLgiVSX0U4CZXh+PhNQ==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696e052c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VVF-A7Ca6zvItOv6IJYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hM0yszxLrfBBAps9IO7qrJ_3qGQ0Wc8J
X-Proofpoint-ORIG-GUID: hM0yszxLrfBBAps9IO7qrJ_3qGQ0Wc8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190084

Hi,

On 1/12/2026 12:35 PM, Adrian Hunter wrote:
> On 02/01/2026 14:40, Neeraj Soni wrote:
>> Add the wrapped key support for sdhci-msm by implementing the needed
>> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
>> blk_crypto_profile::key_types_supported.
>>
>> Tested on SC7280 eMMC variant.
>>
>> How to test:
>>
>> Use the "v1.3.0" tag from https://github.com/google/fscryptctl and build
>> fscryptctl that supports generating wrapped keys.
>>
>> Enable the following config options:
>> CONFIG_BLK_INLINE_ENCRYPTION=y
>> CONFIG_QCOM_INLINE_CRYPTO_ENGINE=y
>> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
>> CONFIG_MMC_CRYPTO=y
>>
>> Enable "qcom_ice.use_wrapped_keys" via kernel command line.
>>
>> $ mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/vm-data
>> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
>> $ fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/vm-data > /mnt/key.longterm
>> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
>> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
>> $ rm -rf /mnt/dir
>> $ mkdir /mnt/dir
>> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
>> $ dmesg > /mnt/dir/test.txt
>> $ sync
>>
>> Reboot the board
>>
>> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
>> $ ls /mnt/dir # File should be encrypted
>> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
>> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
>> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
>> $ cat /mnt/dir/test.txt # File should now be decrypted
>>
>> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Doesn't apply cleanly to mmc next.  Otherwise:
> 
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 
Is this a blocker for the patch to get merged? I will anyway see why it is not applying cleanly on mmc next
but wanted to know if this is necessary to resolve for these chagnes to get merged in Linux-next?

>>
>> ---
>> This is a reworked version of the patchset
>> https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
>> that was sent by Seshu Madhavi Puppala.
>>
>> My changes rebase it to use the custom crypto profile support.
>>
>> Changes in v4:
>> - Updated the link for fscryptctl tool in commit message to "https://github.com/google/fscryptctl".
>> - Aligned the indentation at few places.
>> - Unwrapped few lines of code.
>>
>> Changes in v3:
>> - Updated commit message with test details and moved "Signed-off-by" above the
>>   scissors line.
>>
>> Changes in v2:
>> - Updated commit message for clarity.
>>
>> Changes in v1:
>> - Added initial support for wrapped keys.
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 47 +++++++++++++++++++++++++++++++-----
>>  1 file changed, 41 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4e5edbf2fc9b..8ac4aee2cb3b 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1911,11 +1911,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>  	if (IS_ERR_OR_NULL(ice))
>>  		return PTR_ERR_OR_ZERO(ice);
>>  
>> -	if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
>> -		dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
>> -		return 0;
>> -	}
>> -
>>  	msm_host->ice = ice;
>>  
>>  	/* Initialize the blk_crypto_profile */
>> @@ -1929,7 +1924,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>  
>>  	profile->ll_ops = sdhci_msm_crypto_ops;
>>  	profile->max_dun_bytes_supported = 4;
>> -	profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_RAW;
>> +	profile->key_types_supported = qcom_ice_get_supported_key_type(ice);
>>  	profile->dev = dev;
>>  
>>  	/*
>> @@ -2009,9 +2004,49 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>>  	return qcom_ice_evict_key(msm_host->ice, slot);
>>  }
>>  
>> +static int sdhci_msm_ice_derive_sw_secret(struct blk_crypto_profile *profile,
>> +					  const u8 *eph_key, size_t eph_key_size,
>> +					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
>> +{
>> +	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
>> +
>> +	return qcom_ice_derive_sw_secret(msm_host->ice, eph_key, eph_key_size,
>> +					 sw_secret);
>> +}
>> +
>> +static int sdhci_msm_ice_import_key(struct blk_crypto_profile *profile,
>> +				    const u8 *raw_key, size_t raw_key_size,
>> +				    u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
>> +{
>> +	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
>> +
>> +	return qcom_ice_import_key(msm_host->ice, raw_key, raw_key_size, lt_key);
>> +}
>> +
>> +static int sdhci_msm_ice_generate_key(struct blk_crypto_profile *profile,
>> +				      u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
>> +{
>> +	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
>> +
>> +	return qcom_ice_generate_key(msm_host->ice, lt_key);
>> +}
>> +
>> +static int sdhci_msm_ice_prepare_key(struct blk_crypto_profile *profile,
>> +				     const u8 *lt_key, size_t lt_key_size,
>> +				     u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
>> +{
>> +	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
>> +
>> +	return qcom_ice_prepare_key(msm_host->ice, lt_key, lt_key_size, eph_key);
>> +}
>> +
>>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
>>  	.keyslot_program	= sdhci_msm_ice_keyslot_program,
>>  	.keyslot_evict		= sdhci_msm_ice_keyslot_evict,
>> +	.derive_sw_secret	= sdhci_msm_ice_derive_sw_secret,
>> +	.import_key		= sdhci_msm_ice_import_key,
>> +	.generate_key		= sdhci_msm_ice_generate_key,
>> +	.prepare_key		= sdhci_msm_ice_prepare_key,
>>  };
>>  
>>  #else /* CONFIG_MMC_CRYPTO */
> 
Regards
Neeraj

