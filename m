Return-Path: <linux-arm-msm+bounces-100645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MbkN2DTyWlj2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 03:35:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C63549A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 03:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92E3F302A05F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 01:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05A5271443;
	Mon, 30 Mar 2026 01:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEbmzDGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q9SVjtIS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C6261B92
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774834396; cv=none; b=rp+uK5uX+YSc/cxeBcI1kxBKl8roWfu+Nvrtxhvc6g6nK/HIjkIOcw8nfb0fhWMgOJYxQdBOMPYtBgvrQ0qWmWjamKnP52yS+HLoTNa4v06CWbSasDIOZ6qozSivznkKA4mP9U9v1NR1gxgB+r+p2dvqgTDnFFcMr1kgKvp0xu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774834396; c=relaxed/simple;
	bh=jhRUsi2abn4RL99GkvJy7e3OejC3t3RdEQ9XYnNq2qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FotSipYfn5GEo2m64N/z9EdD3pwUUwWzL4lZvLxEIxbBTtJca3sDhMRBFKbMp7GWmvUzxudvUYL+/R6TeoMWbrHnFQ8a6Ya9oCrvYhosKxFsaJx2DUkNnkrfCxUiAJZ1S7QgF0CyYd3UxHOtsnhY1iv9zYMiGjwFymAzbU+RJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEbmzDGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q9SVjtIS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhk2A3931907
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	go/zEsryBvkHqam+eTEiWB5UJtTv80weDZhW169qTyM=; b=EEbmzDGpnZcWFGzH
	xC+Bc+LZhPiza7AGodxCYuHNpdE0yA4jx8kEhXjaJ0tycXid4yFV7rkwjWpqw3nv
	/FrA08xcgrdejoSLnzqbYUClRnQevUWskzn8rVXG0xFaMSRWJ7TYcPEHVutmYB1V
	PeKgRnnGbFZzPXH6FfFYRecrFuCk1DV1jAU2GtPMTK3vS73LHiOqJSy7vhy3jpXZ
	PCicq2E9dag00rHp7UfDejP251J3s1dGoI4h/xwazC0Z8Q74bYSkAGjSgMxj1I2c
	pm/D5rJJRZAw08N3g720L/jKnd8hkGa1GrxqMOA67lcKrn6YJmLFdRiYsgPL5A9z
	068muQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdca7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:33:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c741b950511so2126644a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774834393; x=1775439193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=go/zEsryBvkHqam+eTEiWB5UJtTv80weDZhW169qTyM=;
        b=Q9SVjtISDBk2bnR5nUJWXrBfFFhoETWEd0GHjK6rQy9mXqRRB332XmIdlhoysRU+SS
         FdK/t0b5zHarext1UhzVIiiY606gxG1DYqQPvPIJjkF0gPNzYqFKentxW0ppv/OG7wAL
         mS8p766ZOcTLfRO/ZRFIt2EzxxmjK89ohdFvzzBI0faTUinTOk0nCfPEt63C+NdSpqqJ
         +3nrf9F7RLyJyedoW1TN1KKMb2qtccfYP57+hiFsN2YacIpoT666coRiUwWLRifUPjw9
         OgXZKEkyTcYOeqLInA+v+tNugUs9U0nUMAD9N1IWwHfYiwI/G2sIylgDGzi7qlH4YjrT
         suDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774834393; x=1775439193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=go/zEsryBvkHqam+eTEiWB5UJtTv80weDZhW169qTyM=;
        b=N8QDqUa/D9UBivheiSgLwLM5pqgJ6obCBElfvFaG2atq+slIQocFCCCm7WfdGK4qEv
         Pz/mRMpctGta52jy5j8/YB/R3cZKtycT5aOEfxTpALZRt03P5zLHJvOIWxifQrD6n8wy
         MhBa5x8ZYj8yickYJKlvJBlKvjUIY8bPu3CCLZ0o4LViHEFG8K1lARVfmrXWz2eZI+go
         6gFLtLp2pBkkxEoYUmV6khlPuR+snIzpcIDNMzwPXodEAkMxDk3q+JMOA8BYkr+ha7XB
         oAhI7uZYiufPxLwVAk2/Uj8mEdkJNGCQCVQT++rTgFUmoG6LarBzXKIHXTR7TwCl4dvu
         A7gg==
X-Forwarded-Encrypted: i=1; AJvYcCVwgruxeNoBLP1qwnpwrLBrz8NrAWFPdXxrhzKseqw8mgd2R4hAyoOMf3/EvlxCfZI7g04onN9kYHWQJ81g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3eu9UGkh/ZehtXn8hBdI0N7J/EBEXS+97vtrUxqtEU7fvxhU7
	1TGjXEeFElHI5cBna5Io9+1c/jiH0FEQhH9AJuQRYNBjWcNDl1jCaz1WAtjnB068Leplluqo6te
	izoPOepJcMpc6VgCpesATGa6wW5ABmViuLGhAY0aysmCfArnDNNT2/deJnhY95IQclkGC
X-Gm-Gg: ATEYQzzjavMFc5EPJOudNgDwvk/iU8JeyV6H533H5QSfsVCWQ112jXPdTg8j/xn3MJi
	sAorimTL+SyGCG7YY0XPuLK6GTmMckP1Uhdq4TOUJU0pljEAUqTG89dr5mprK+Ziyhkcw47s5AO
	M7miCMFOMSFjAKeSHhtV0J46poeWR2sYvcnPQKsj9LrpzZ+Dw9rchRYkSeIB/8MMeG4fc8JhvFG
	EMh5LLcHOFiu9cV6UmDqBhg/ZQcEL008GwWp1ubAn17YmW23kwQpbCuLz249i2Bt5Awq8+6L7Xo
	+VQDgbr0xY8phEq92B6BIhlmyzAjb3s9p/ItpNRE65nUDlCB4mCDCEn0vnY7lPgmLDHPJDMH8lQ
	Lf5tH/vXtoUa8/Ieb9nmRwFHboSZEmVXCHfYJr78Vp3kq+ZP9
X-Received: by 2002:a05:6a20:3d23:b0:39c:cdb:5d7c with SMTP id adf61e73a8af0-39c87bcf3aemr10512726637.58.1774834393286;
        Sun, 29 Mar 2026 18:33:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d23:b0:39c:cdb:5d7c with SMTP id adf61e73a8af0-39c87bcf3aemr10512711637.58.1774834392835;
        Sun, 29 Mar 2026 18:33:12 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e30dsm4856214a12.20.2026.03.29.18.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 18:33:12 -0700 (PDT)
Message-ID: <852c8b4a-f45e-4b9a-9c5b-249c493d7c8b@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 09:33:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Bluetooth: hci_qca: Convert timeout from jiffies to ms
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Shuai Zhang <quic_shuaz@quicinc.com>,
        stable@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260327082941.1396521-1-shuai.zhang@oss.qualcomm.com>
 <CABBYNZKY_-QgsenfU4hpyQ1+87rXDS13wFueN2nX6Wojy4BgHQ@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZKY_-QgsenfU4hpyQ1+87rXDS13wFueN2nX6Wojy4BgHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: urNAeSLY1eJnWUzm-Z5X1F19zb2MCoCq
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69c9d2da cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=mEO4ALF7hCPe5JJGosAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: urNAeSLY1eJnWUzm-Z5X1F19zb2MCoCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAwOSBTYWx0ZWRfX35hwHzLIDdmB
 dEC4RNFrem/N82/NkJJJ6w6DwWd20HHJA7NdVcIrPWb+rCnwIvW8+r7pA5WA+jfx3i/X3rezGMZ
 VrfRA+j/f6vA9j/vb/+8WkpCusPjNNI8oSRQnGNNmWEc2ggVP5LLt7b6Dt0vdOImV7FRVGVIjX5
 c6LHPb2hW+tSphBUQiieyfWloNM6P5gJfEDkYfo2UbuSLKRnLNRtJnEBSLy/aMd75u0dcAcOmxB
 RtbHf08W9KjfxPtc3LAq2r92FWmhJee4qQvzH+LXw+1J8/5TBJc028PCvbXOt16q1kMfQTIYZAp
 iWrCz6tNgOGTKwjuplZvvVQZ2VcyOjf8ScaKc9YrjYGs6rYmykP2CiSNOBNat/6iAkzpqsvmyWF
 31kJWBJFGG3XRrapo33EFuhTh30xV5Z35aKsob/Z3M9JQooGfcdkLqmTWawV5GjS906icWcr7Z3
 lVaEmz5j7ZaUskwy+OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300009
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100645-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,mpg.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 425C63549A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luiz

On 3/28/2026 1:53 AM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Fri, Mar 27, 2026 at 4:30 AM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
>> From: Shuai Zhang <quic_shuaz@quicinc.com>
>>
>> Since the timer uses jiffies as its unit rather than ms, the timeout value
>> must be converted from ms to jiffies when configuring the timer. Otherwise,
>> the intended 8s timeout is incorrectly set to approximately 33s.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> Changes v4:
>> - add review-by signoff
>> - Link to v3
>>    https://lore.kernel.org/all/20251107033924.3707495-1-quic_shuaz@quicinc.com/
>>
>> Changes v3:
>> - add Fixes tag
>> - Link to v2
>>    https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/
>>
>> Changes v2:
>> - Split timeout conversion into a separate patch.
>> - Clarified commit messages and added test case description.
>> - Link to v1
>>    https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
>> ---
>>
>>   drivers/bluetooth/hci_qca.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 228a754a9..d66af13ab 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1607,7 +1607,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
>>          struct qca_data *qca = hu->priv;
>>
>>          wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
>> -                           TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
>> +                           TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
>>
>>          clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>   }
>> --
>> 2.34.1
>>
> https://sashiko.dev/#/patchset/20260327082941.1396521-1-shuai.zhang%40oss.qualcomm.com
>
> Comments seem valid to me.

This comment is valid. I have addressed it in commit [1] by updating the 
completion path to use |clear_and_wake_up_bit()|.

https://lore.kernel.org/all/20260327083258.1398450-1-shuai.zhang@oss.qualcomm.com/


Thanks,

Shuai



