Return-Path: <linux-arm-msm+bounces-87412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F1CF350B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 12:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 833C23010CCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 11:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979DE2F60B2;
	Mon,  5 Jan 2026 11:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpNUKohg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaxDNfNX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF659246332
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613105; cv=none; b=Hxbt20W9ng4RCMI1QiV99EA5Nwj9ZH1vRmKqT/dbQde7y6MNrtAVS38hGltrx5sEbidsldhVHjfjY8cPpIwZaQPrn5N7rYeJx9FoWByQw2+QRzp4UPboNbSPu4chhVIjlkIVGu3iOUUmNdet8rJ1HGfAGbvN7WZwfTwDlSA3iq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613105; c=relaxed/simple;
	bh=fYqbYpO0S5WfqC/0uKdwveeqIC2aZzmj2ENQEfL3v5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDTrgJEF9pKRYwUMgpnQSjHA4W1lRCvg/ed7tazdyFSJgNVueJ0awiADwdyvH2epjWs3vK4wvJO2wSQXLHQfJOT6XRrJ2tcBwduk8h0Viss1baKUimnh4FNTxpkeGv4YOGAzXcHluBk1I+63vSBYCF/AZOXNfD5hv/BdMeIjZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpNUKohg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaxDNfNX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059cUEZ3541749
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 11:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/M3BPNHZ3ASlFbq+AScCc7l1bNm6TrESTBPxWA+QDQ=; b=GpNUKohgry2Z51Fm
	fOwgv4r3XuvDDAP/18/aBumb2FOp/bSjJdZXqcvjLYW+CEbU3dbwgQuaxgMeYFw1
	hX+jYq3vH9qYz2ECvcBIJGie8WaIp0EPzgkmP8Z0I3wlXvyI4z6xPlh7Tgas1Cth
	O10XK+OPg7QGr++nmb0q6BsoYFufhu7V7A9H0k8m92IrCK8uE8P7uFzrhIanwMUt
	JVrN1uNXC3aHaLHrfq+OHIwzVGcGmr6lGqMn0o3twukDmfsPS10HmlHmpzKBQ+yg
	tMW3Y9cIreM6/8/yhjuomZJ2GCejiyT5XEcReu7qx6BtcEzGjJ2ozAfyU25639IX
	SNGlYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shc0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 11:38:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d2aa793fso379477441cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 03:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767613100; x=1768217900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/M3BPNHZ3ASlFbq+AScCc7l1bNm6TrESTBPxWA+QDQ=;
        b=IaxDNfNXQ5pvNZQhrrw+OnZ0DpCH6Qkhfl1B8XDG7g9QcU2pfBU0oLv+vpwZQPL9n6
         aqqC6OdSRyUpPMCliqkEL/KACghBmu0QcJa009VfKGezP5xRr5LwMzJc/HeBCKRjioKt
         ohvCm8RpeX/aX+J+YzoUzClSzUksVHMf5iZaBk47m90GU54sKIzt4yUmS0z4C3P/bfnl
         TGKTAiv4J6M0j+H9jKUj5p2SUnP0eQD2U/1KxmT1Ng48JrVU8OLp8M5LKKAj7jmJBNrK
         UoO4bTpTPqutX+6IGo68SBt22BKGqMXjvgGXVNZVVFposXJ43jZXPn9Jyf5pFjyCP2nr
         54QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767613100; x=1768217900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/M3BPNHZ3ASlFbq+AScCc7l1bNm6TrESTBPxWA+QDQ=;
        b=uTU4dHR/2zC+7vmfIPArWndPUCXbK4riTpAZ38XI7pwzv7Q6jsFyxlsO8v7HdD7MBH
         V96Nvwi8kglKxoa58R99reppt1YDuusCO4LC0w45N7cy/qdsPb91XXi0hWINR2nH39Vn
         K7PMoA07bKaAnsaAaJBGayisblpp6E00283xO95lhl/jhmc2PaawuS5atdYyzVPvgIRh
         wWy5Hc0JUxu8tzoKxZFOI5C2TWK+sncWaxWoLIXYeYGFEFkK3Z2NawXRAfVkVxNOmqRK
         E3Vn4KYSVJWvvl7AAQ1L/kbXTtP6cuyeBEa8hcabyuYWCVwSBmKUwbxclWA1Mndlunab
         m/EA==
X-Forwarded-Encrypted: i=1; AJvYcCWHBi6cykOAKxcodnmJxyOpy17T9VXSSFfg0Q+uSw8tuJ8UV1ldebvmjnqLoiOfHBFuWQOthM3kAfMTDqLn@vger.kernel.org
X-Gm-Message-State: AOJu0YwbajMti7q7zJ9lYhNivF5EZWpptMkUnUSUaZew2RHMDUf9VSJf
	t619d6pssZV5TRAo1tG1ZpHcGU18iaEPBgTeczuu9nSbS83/JRzOqHiiiSzoARy8Y9VWfsmZFPU
	YllqYWA7TM+1MF8ILR2FaBGMc9ruH9iSsYfDmikjar5yxT1OBcdtKKxNF96PF4L7/qMun
X-Gm-Gg: AY/fxX7RihvtbY32Q5i223sAue+v4y+O0tEht4sHIsJ6txiMtgy2wftm0SncX6sBbVr
	yLD7rUQbnbMi4Bv+0Yy9dMyMiUbjxaIIDbh4t8CF5BFLFaSKzMj8Vo6Y3dxDgDXLhaFOVMt8+UF
	tv2TXG79niVDpTVYbh6gCtHX6VepV0jaX9RxknHBBcWhlV0zaTbzmQMlS4r/wLrvIUyEFdZpSwp
	fBQEfnQQjIVAQ7/duqKmjk5DVRyzKspeT6tWwm9JAsp+Zg3IebH8KuswTNbtpHLtYnvvCnZDuHl
	MXlUEwI8mGkaJpeCutJXQ+juANZ6MuKONH2eWuKz+nBZo9kZgrZGNtu3Kvckocjl9K7j9BJScab
	Q0utjU2Ao2TFWKCWVf0TlE2kfh8+iNehmefBe
X-Received: by 2002:a05:622a:a08e:b0:4ff:8fc7:917b with SMTP id d75a77b69052e-4ff8fc7d691mr31747181cf.80.1767613100221;
        Mon, 05 Jan 2026 03:38:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ0SsnFHMqY2wE/eg9sn8gloOVgYyn9oFsnM87TEVaZu91yqZfnBIeNQhgtK4BEaDNZVBbVA==
X-Received: by 2002:a05:622a:a08e:b0:4ff:8fc7:917b with SMTP id d75a77b69052e-4ff8fc7d691mr31746921cf.80.1767613099558;
        Mon, 05 Jan 2026 03:38:19 -0800 (PST)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1b1sm99602754f8f.3.2026.01.05.03.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 03:38:19 -0800 (PST)
Message-ID: <9ba9919a-087a-4379-aa9f-ec899a80e7d5@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 11:38:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] ASoC: codecs: wcd: add common helper for wcd
 codecs
To: Joel Selvaraj <foss@joelselvaraj.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org
References: <d5d57177-5c82-43a4-bf80-ec9d336b043e@joelselvaraj.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d5d57177-5c82-43a4-bf80-ec9d336b043e@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695ba2ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=WFa1dZBpAAAA:8
 a=eyn4GuZuLns4LCBNQR8A:9 a=tLqY3ihS8TPOuiYE:21 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwMiBTYWx0ZWRfX5OlCQV3xBpey
 X07bjZeriP67QT7K+39NzN8P4G4O+DAM2yxCVMTeStPP6J2hhvTiKS8jL4IPT+SxTb4XrdxdytH
 qZrTanzsXqbI9m6JYWhxUgJArBjU9L6CpEkPOf9ntaF3CboyJZRXeqxP6fImXDNCqLVps9yYyLh
 Ti6WXV+0/M/03P729R+pZiWWGIlD/rbi4sd9utHVGLMLCXCtWsvZyD9wMQ2k5kZeaHN8JrmtH+Z
 dtvoZt7i05BlRNw0BrRDWCubIZB3R2qbZmSQJi7Qe5sfb3242Tk/77xml7dvFGQH1IscZHdKQJM
 C1VzPK2IF1qkHlKy8hc/UB9VkS6O1/A+kWlc70dMorN4Zn1CeSYtuJeKS5j7lVJj0SIJZRg1YNA
 SgWKg4QZignYzAqYoYG68laW4wwYmvsk9HWFy+f369YbQPoen09H2WFsxZYYdUzCXhPsIEG4bsn
 E6tsOSWsWQR7WGR2q2w==
X-Proofpoint-ORIG-GUID: ZPKCueYolgxDN-Rl-D28w1iFOUJzmrDM
X-Proofpoint-GUID: ZPKCueYolgxDN-Rl-D28w1iFOUJzmrDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050102

Hi Joel,

On 12/29/25 8:33 PM, Joel Selvaraj wrote:
> Hi Srinivas Kandagatla,
> 
> This patch series broke internal microphones in Oneplus 6 
> (qcom/sdm845-oneplus-enchilada.dts). Reverting the patch series fixes 
> the mic in 6.18.2 kernel version. I suspect it is due to micbias related 
> code changes in this patch, although, I havent debugged the root cause 
> of the issue yet. This was initially noted in mobian distro [1]. I was 
> also able to confirm the same in postmarketOS. It would be nice to fix 
> this issue without having to revert the entire series.
> 

thanks for reporting this, and sorry about this.> [1]
> https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/merge_requests/29#note_708300
> 
I had a quick look at the code, looks like there is typo, can you pl try
this patch and see if it helps.

------------------------->cut<-------------------------------

commit 854bbda3542d83884dcdb49dcbd94a697956234d (HEAD -> next-20251201)
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Date:   Mon Jan 5 11:31:46 2026 +0000

    ASoC: codecs: wcd934x: fix typo in dt parsing
    Looks like we ended up with a typo during device tree data parsing
as part of 4f16b6351bbff ("ASoC: codecs: wcd: add common helper for wcd
codecs") patch.
    This will result in not parsing the device tree data and results in
zero mic bias values.

    Fix this by calling wcd_dt_parse_micbias_info instead of
    wcd_dt_parse_mbhc_data.

    Fixes: 4f16b6351bbff ("ASoC: codecs: wcd: add common helper for wcd
codecs")
    Reported-by: Joel Selvaraj <foss@joelselvaraj.com>
    Signed-off-by: Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com>

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index c8db33f78a1b..bc41a1466c70 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2172,7 +2172,7 @@ static int wcd934x_init_dmic(struct
snd_soc_component *comp)
        u32 def_dmic_rate, dmic_clk_drv;
        int ret;

-       ret = wcd_dt_parse_mbhc_data(comp->dev, &wcd->mbhc_cfg);
+       ret = wcd_dt_parse_micbias_info(&wcd->common);
        if (ret)
                return ret;

------------------------->cut<-------------------------------

> Regards,
> Joel Selvaraj
> 
> On 9/9/25 7:19 AM, Srinivas Kandagatla wrote:
>> All the Qualcomm WCD codecs have most of its code duplicated across all
>> these 3/4 drivers. This is an attempt to remove those duplicate
>> parts by adding a common helper library for these codecs.
>>
>> To start with move all the micbias parsing and voltage settings these
>> are identical in WCD934x, WCD937x, WCD938x and WCD939x codec driver.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/Kconfig      |  7 +++
>>   sound/soc/codecs/Makefile     |  2 +
>>   sound/soc/codecs/wcd-common.c | 70 +++++++++++++++++++++++++++
>>   sound/soc/codecs/wcd-common.h | 27 +++++++++++
>>   sound/soc/codecs/wcd934x.c    | 82 +++++++++----------------------
>>   sound/soc/codecs/wcd937x.c    | 81 ++++++++-----------------------
>>   sound/soc/codecs/wcd938x.c    | 88 +++++++---------------------------
>>   sound/soc/codecs/wcd939x.c    | 90 +++++++----------------------------
>>   8 files changed, 182 insertions(+), 265 deletions(-)
>>   create mode 100644 sound/soc/codecs/wcd-common.c
>>   create mode 100644 sound/soc/codecs/wcd-common.h
>>
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index b8d58d2fe326..5bb51d084ec1 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -2251,6 +2251,9 @@ config SND_SOC_UDA1380
>>   config SND_SOC_WCD_CLASSH
>>   	tristate
>>   
>> +config SND_SOC_WCD_COMMON
>> +	tristate
>> +
>>   config SND_SOC_WCD9335
>>   	tristate "WCD9335 Codec"
>>   	depends on SLIMBUS
>> @@ -2272,6 +2275,7 @@ config SND_SOC_WCD934X
>>   	select REGMAP_IRQ
>>   	select REGMAP_SLIMBUS
>>   	select SND_SOC_WCD_CLASSH
>> +	select SND_SOC_WCD_COMMON
>>   	select SND_SOC_WCD_MBHC
>>   	depends on MFD_WCD934X || COMPILE_TEST
>>   	help
>> @@ -2283,6 +2287,7 @@ config SND_SOC_WCD937X
>>   	tristate
>>   	depends on SOUNDWIRE || !SOUNDWIRE
>>   	select SND_SOC_WCD_CLASSH
>> +	select SND_SOC_WCD_COMMON
>>   
>>   config SND_SOC_WCD937X_SDW
>>   	tristate "WCD9370/WCD9375 Codec - SDW"
>> @@ -2302,6 +2307,7 @@ config SND_SOC_WCD938X
>>   	tristate
>>   	depends on SOUNDWIRE || !SOUNDWIRE
>>   	select SND_SOC_WCD_CLASSH
>> +	select SND_SOC_WCD_COMMON
>>   	select MULTIPLEXER
>>   
>>   config SND_SOC_WCD938X_SDW
>> @@ -2321,6 +2327,7 @@ config SND_SOC_WCD939X
>>   	depends on SOUNDWIRE || !SOUNDWIRE
>>   	depends on TYPEC || !TYPEC
>>   	select SND_SOC_WCD_CLASSH
>> +	select SND_SOC_WCD_COMMON
>>   
>>   config SND_SOC_WCD939X_SDW
>>   	tristate "WCD9390/WCD9395 Codec - SDW"
>> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
>> index a476d6c45451..8d9bc03ecc60 100644
>> --- a/sound/soc/codecs/Makefile
>> +++ b/sound/soc/codecs/Makefile
>> @@ -341,6 +341,7 @@ snd-soc-uda1334-y := uda1334.o
>>   snd-soc-uda1342-y := uda1342.o
>>   snd-soc-uda1380-y := uda1380.o
>>   snd-soc-wcd-classh-y := wcd-clsh-v2.o
>> +snd-soc-wcd-common-y := wcd-common.o
>>   snd-soc-wcd-mbhc-y := wcd-mbhc-v2.o
>>   snd-soc-wcd9335-y := wcd9335.o
>>   snd-soc-wcd934x-y := wcd934x.o
>> @@ -764,6 +765,7 @@ obj-$(CONFIG_SND_SOC_UDA1334)	+= snd-soc-uda1334.o
>>   obj-$(CONFIG_SND_SOC_UDA1342)	+= snd-soc-uda1342.o
>>   obj-$(CONFIG_SND_SOC_UDA1380)	+= snd-soc-uda1380.o
>>   obj-$(CONFIG_SND_SOC_WCD_CLASSH)	+= snd-soc-wcd-classh.o
>> +obj-$(CONFIG_SND_SOC_WCD_COMMON)	+= snd-soc-wcd-common.o
>>   obj-$(CONFIG_SND_SOC_WCD_MBHC)	+= snd-soc-wcd-mbhc.o
>>   obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
>>   obj-$(CONFIG_SND_SOC_WCD934X)	+= snd-soc-wcd934x.o
>> diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
>> new file mode 100644
>> index 000000000000..8f3c0806cdc9
>> --- /dev/null
>> +++ b/sound/soc/codecs/wcd-common.c
>> @@ -0,0 +1,70 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +
>> +#include <linux/export.h>
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/device.h>
>> +#include <linux/of.h>
>> +#include <linux/printk.h>
>> +
>> +#include "wcd-common.h"
>> +
>> +#define WCD_MIN_MICBIAS_MV	1000
>> +#define WCD_DEF_MICBIAS_MV	1800
>> +#define WCD_MAX_MICBIAS_MV	2850
>> +
>> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv)
>> +{
>> +	/* min micbias voltage is 1V and maximum is 2.85V */
>> +	if (micb_mv < WCD_MIN_MICBIAS_MV || micb_mv > WCD_MAX_MICBIAS_MV) {
>> +		dev_err(dev, "Unsupported micbias voltage (%u mV)\n", micb_mv);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return (micb_mv - WCD_MIN_MICBIAS_MV) / 50;
>> +}
>> +EXPORT_SYMBOL_GPL(wcd_get_micb_vout_ctl_val);
>> +
>> +static int wcd_get_micbias_val(struct device *dev, int micb_num, u32 *micb_mv)
>> +{
>> +	char micbias[64];
>> +	int mv;
>> +
>> +	sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
>> +
>> +	if (of_property_read_u32(dev->of_node, micbias, &mv)) {
>> +		dev_err(dev, "%s value not found, using default\n", micbias);
>> +		mv = WCD_DEF_MICBIAS_MV;
>> +	} else {
>> +		/* convert it to milli volts */
>> +		mv = mv/1000;
>> +	}
>> +	if (micb_mv)
>> +		*micb_mv = mv;
>> +
>> +	mv = wcd_get_micb_vout_ctl_val(dev, mv);
>> +	if (mv < 0) {
>> +		dev_err(dev, "Unsupported %s voltage (%d mV), falling back to default (%d mV)\n",
>> +				micbias, mv, WCD_DEF_MICBIAS_MV);
>> +		return wcd_get_micb_vout_ctl_val(dev, WCD_DEF_MICBIAS_MV);
>> +	}
>> +
>> +	return mv;
>> +}
>> +
>> +int wcd_dt_parse_micbias_info(struct wcd_common *common)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < common->max_bias; i++) {
>> +		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
>> +		if (common->micb_vout[i] < 0)
>> +			return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(wcd_dt_parse_micbias_info);
>> +MODULE_DESCRIPTION("Common Qualcomm WCD Codec helpers driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.h
>> new file mode 100644
>> index 000000000000..611f06cdec55
>> --- /dev/null
>> +++ b/sound/soc/codecs/wcd-common.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __WCD_COMMON_H__
>> +#define __WCD_COMMON_H__
>> +
>> +struct device;
>> +struct sdw_slave;
>> +struct sdw_bus_params;
>> +struct irq_domain;
>> +enum sdw_slave_status;
>> +
>> +#define WCD_MAX_MICBIAS		4
>> +
>> +struct wcd_common {
>> +	struct device *dev;
>> +	int max_bias;
>> +	u32 micb_mv[WCD_MAX_MICBIAS];
>> +	u32 micb_vout[WCD_MAX_MICBIAS];
>> +};
>> +
>> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
>> +int wcd_dt_parse_micbias_info(struct wcd_common *common);
>> +
>> +#endif /* __WCD_COMMON_H__  */
>> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
>> index 1bb7e1dc7e6b..d10b457e6c9a 100644
>> --- a/sound/soc/codecs/wcd934x.c
>> +++ b/sound/soc/codecs/wcd934x.c
>> @@ -21,6 +21,7 @@
>>   #include <sound/soc-dapm.h>
>>   #include <sound/tlv.h>
>>   #include "wcd-clsh-v2.h"
>> +#include "wcd-common.h"
>>   #include "wcd-mbhc-v2.h"
>>   
>>   #include <dt-bindings/sound/qcom,wcd934x.h>
>> @@ -116,9 +117,6 @@
>>   #define WCD934X_DEC_PWR_LVL_DF		0x00
>>   #define WCD934X_DEC_PWR_LVL_HYBRID WCD934X_DEC_PWR_LVL_DF
>>   
>> -#define WCD934X_DEF_MICBIAS_MV	1800
>> -#define WCD934X_MAX_MICBIAS_MV	2850
>> -
>>   #define WCD_IIR_FILTER_SIZE	(sizeof(u32) * BAND_MAX)
>>   
>>   #define WCD_IIR_FILTER_CTL(xname, iidx, bidx) \
>> @@ -530,6 +528,7 @@ struct wcd934x_codec {
>>   	struct slim_device *sdev;
>>   	struct slim_device *sidev;
>>   	struct wcd_clsh_ctrl *clsh_ctrl;
>> +	struct wcd_common common;
>>   	struct snd_soc_component *component;
>>   	struct wcd934x_slim_ch rx_chs[WCD934X_RX_MAX];
>>   	struct wcd934x_slim_ch tx_chs[WCD934X_TX_MAX];
>> @@ -555,7 +554,6 @@ struct wcd934x_codec {
>>   	struct mutex micb_lock;
>>   	u32 micb_ref[WCD934X_MAX_MICBIAS];
>>   	u32 pullup_ref[WCD934X_MAX_MICBIAS];
>> -	u32 micb2_mv;
>>   };
>>   
>>   #define to_wcd934x_codec(_hw) container_of(_hw, struct wcd934x_codec, hw)
>> @@ -2168,55 +2166,24 @@ static struct clk *wcd934x_register_mclk_output(struct wcd934x_codec *wcd)
>>   	return NULL;
>>   }
>>   
>> -static int wcd934x_get_micbias_val(struct device *dev, const char *micbias,
>> -				   u32 *micb_mv)
>> -{
>> -	int mv;
>> -
>> -	if (of_property_read_u32(dev->parent->of_node, micbias, &mv)) {
>> -		dev_err(dev, "%s value not found, using default\n", micbias);
>> -		mv = WCD934X_DEF_MICBIAS_MV;
>> -	} else {
>> -		/* convert it to milli volts */
>> -		mv = mv/1000;
>> -	}
>> -
>> -	if (mv < 1000 || mv > 2850) {
>> -		dev_err(dev, "%s value not in valid range, using default\n",
>> -			micbias);
>> -		mv = WCD934X_DEF_MICBIAS_MV;
>> -	}
>> -
>> -	if (micb_mv)
>> -		*micb_mv = mv;
>> -
>> -	return (mv - 1000) / 50;
>> -}
>> -
>>   static int wcd934x_init_dmic(struct snd_soc_component *comp)
>>   {
>> -	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
>>   	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
>>   	u32 def_dmic_rate, dmic_clk_drv;
>> +	int ret;
>>   
>> -	vout_ctl_1 = wcd934x_get_micbias_val(comp->dev,
>> -					     "qcom,micbias1-microvolt", NULL);
>> -	vout_ctl_2 = wcd934x_get_micbias_val(comp->dev,
>> -					     "qcom,micbias2-microvolt",
>> -					     &wcd->micb2_mv);
>> -	vout_ctl_3 = wcd934x_get_micbias_val(comp->dev,
>> -					     "qcom,micbias3-microvolt", NULL);
>> -	vout_ctl_4 = wcd934x_get_micbias_val(comp->dev,
>> -					     "qcom,micbias4-microvolt", NULL);
>> +	ret = wcd_dt_parse_mbhc_data(comp->dev, &wcd->mbhc_cfg);
>> +	if (ret)
>> +		return ret;
>>   
>>   	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB1,
>> -				      WCD934X_MICB_VAL_MASK, vout_ctl_1);
>> +				      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[0]);
>>   	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB2,
>> -				      WCD934X_MICB_VAL_MASK, vout_ctl_2);
>> +				      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[1]);
>>   	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB3,
>> -				      WCD934X_MICB_VAL_MASK, vout_ctl_3);
>> +				      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[2]);
>>   	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB4,
>> -				      WCD934X_MICB_VAL_MASK, vout_ctl_4);
>> +				      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[3]);
>>   
>>   	if (wcd->rate == WCD934X_MCLK_CLK_9P6MHZ)
>>   		def_dmic_rate = WCD9XXX_DMIC_SAMPLE_RATE_4P8MHZ;
>> @@ -2517,15 +2484,6 @@ static void wcd934x_mbhc_micb_ramp_control(struct snd_soc_component *component,
>>   	}
>>   }
>>   
>> -static int wcd934x_get_micb_vout_ctl_val(u32 micb_mv)
>> -{
>> -	/* min micbias voltage is 1V and maximum is 2.85V */
>> -	if (micb_mv < 1000 || micb_mv > 2850)
>> -		return -EINVAL;
>> -
>> -	return (micb_mv - 1000) / 50;
>> -}
>> -
>>   static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
>>   					    int req_volt, int micb_num)
>>   {
>> @@ -2562,7 +2520,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
>>   	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
>>   						    WCD934X_MICB_VAL_MASK);
>>   
>> -	req_vout_ctl = wcd934x_get_micb_vout_ctl_val(req_volt);
>> +	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
>>   	if (req_vout_ctl < 0) {
>>   		ret = -EINVAL;
>>   		goto exit;
>> @@ -2610,10 +2568,10 @@ static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
>>   	 * voltage needed to detect threshold microphone, then do
>>   	 * not change the micbias, just return.
>>   	 */
>> -	if (wcd934x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
>> +	if (wcd934x->common.micb_mv[1] >= WCD_MBHC_THR_HS_MICB_MV)
>>   		return 0;
>>   
>> -	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd934x->micb2_mv;
>> +	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd934x->common.micb_mv[1];
>>   
>>   	rc = wcd934x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
>>   
>> @@ -3036,7 +2994,7 @@ static void wcd934x_mbhc_deinit(struct snd_soc_component *component)
>>   static int wcd934x_comp_probe(struct snd_soc_component *component)
>>   {
>>   	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
>> -	int i;
>> +	int i, ret;
>>   
>>   	snd_soc_component_init_regmap(component, wcd->regmap);
>>   	wcd->component = component;
>> @@ -3054,7 +3012,12 @@ static int wcd934x_comp_probe(struct snd_soc_component *component)
>>   	for (i = 0; i < NUM_CODEC_DAIS; i++)
>>   		INIT_LIST_HEAD(&wcd->dai[i].slim_ch_list);
>>   
>> -	wcd934x_init_dmic(component);
>> +
>> +	ret = wcd934x_init_dmic(component);
>> +	if (ret) {
>> +		dev_err(component->dev, "Failed to Initialize micbias\n");
>> +		return ret;
>> +	}
>>   
>>   	if (wcd934x_mbhc_init(component))
>>   		dev_err(component->dev, "Failed to Initialize MBHC\n");
>> @@ -5860,14 +5823,13 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
>>   	cfg->anc_micbias = MIC_BIAS_2;
>>   	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
>>   	cfg->num_btn = WCD934X_MBHC_MAX_BUTTONS;
>> -	cfg->micb_mv = wcd->micb2_mv;
>> +	cfg->micb_mv = wcd->common.micb_mv[1];
>>   	cfg->linein_th = 5000;
>>   	cfg->hs_thr = 1700;
>>   	cfg->hph_thr = 50;
>>   
>>   	wcd_dt_parse_mbhc_data(dev, cfg);
>>   
>> -
>>   	return 0;
>>   }
>>   
>> @@ -5888,6 +5850,8 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
>>   	wcd->sdev = to_slim_device(data->dev);
>>   	mutex_init(&wcd->sysclk_mutex);
>>   	mutex_init(&wcd->micb_lock);
>> +	wcd->common.dev = dev->parent;
>> +	wcd->common.max_bias = 4;
>>   
>>   	ret = wcd934x_codec_parse_data(wcd);
>>   	if (ret)
>> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
>> index b78f37c582ca..ffe6508fd84c 100644
>> --- a/sound/soc/codecs/wcd937x.c
>> +++ b/sound/soc/codecs/wcd937x.c
>> @@ -21,6 +21,7 @@
>>   #include <sound/tlv.h>
>>   
>>   #include "wcd-clsh-v2.h"
>> +#include "wcd-common.h"
>>   #include "wcd-mbhc-v2.h"
>>   #include "wcd937x.h"
>>   
>> @@ -85,6 +86,7 @@ struct wcd937x_priv {
>>   	struct wcd_mbhc_config mbhc_cfg;
>>   	struct wcd_mbhc_intr intr_ids;
>>   	struct wcd_clsh_ctrl *clsh_info;
>> +	struct wcd_common common;
>>   	struct irq_domain *virq;
>>   	struct regmap_irq_chip_data *irq_chip;
>>   	struct snd_soc_jack *jack;
>> @@ -93,9 +95,6 @@ struct wcd937x_priv {
>>   	s32 pullup_ref[WCD937X_MAX_MICBIAS];
>>   	u32 hph_mode;
>>   	int ear_rx_path;
>> -	u32 micb1_mv;
>> -	u32 micb2_mv;
>> -	u32 micb3_mv;
>>   	int hphr_pdm_wd_int;
>>   	int hphl_pdm_wd_int;
>>   	int aux_pdm_wd_int;
>> @@ -872,15 +871,6 @@ static int wcd937x_enable_rx3(struct snd_soc_dapm_widget *w,
>>   	return 0;
>>   }
>>   
>> -static int wcd937x_get_micb_vout_ctl_val(u32 micb_mv)
>> -{
>> -	if (micb_mv < 1000 || micb_mv > 2850) {
>> -		pr_err("Unsupported micbias voltage (%u mV)\n", micb_mv);
>> -		return -EINVAL;
>> -	}
>> -
>> -	return (micb_mv - 1000) / 50;
>> -}
>>   
>>   static int wcd937x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
>>   			       struct snd_kcontrol *kcontrol, int event)
>> @@ -1481,7 +1471,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
>>   	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
>>   						    WCD937X_MICB_VOUT_MASK);
>>   
>> -	req_vout_ctl = wcd937x_get_micb_vout_ctl_val(req_volt);
>> +	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
>>   	if (req_vout_ctl < 0) {
>>   		ret = -EINVAL;
>>   		goto exit;
>> @@ -1529,10 +1519,10 @@ static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
>>   	 * voltage needed to detect threshold microphone, then do
>>   	 * not change the micbias, just return.
>>   	 */
>> -	if (wcd937x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
>> +	if (wcd937x->common.micb_mv[2] >= WCD_MBHC_THR_HS_MICB_MV)
>>   		return 0;
>>   
>> -	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->micb2_mv;
>> +	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->common.micb_mv[2];
>>   
>>   	return wcd937x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
>>   }
>> @@ -2436,22 +2426,14 @@ static const struct snd_soc_dapm_route wcd9375_audio_map[] = {
>>   	{ "DMIC6_MIXER", "Switch", "DMIC6" },
>>   };
>>   
>> -static int wcd937x_set_micbias_data(struct wcd937x_priv *wcd937x)
>> +static void wcd937x_set_micbias_data(struct device *dev, struct wcd937x_priv *wcd937x)
>>   {
>> -	int vout_ctl[3];
>> -
>> -	/* Set micbias voltage */
>> -	vout_ctl[0] = wcd937x_get_micb_vout_ctl_val(wcd937x->micb1_mv);
>> -	vout_ctl[1] = wcd937x_get_micb_vout_ctl_val(wcd937x->micb2_mv);
>> -	vout_ctl[2] = wcd937x_get_micb_vout_ctl_val(wcd937x->micb3_mv);
>> -	if ((vout_ctl[0] | vout_ctl[1] | vout_ctl[2]) < 0)
>> -		return -EINVAL;
>> -
>> -	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB1, WCD937X_ANA_MICB_VOUT, vout_ctl[0]);
>> -	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB2, WCD937X_ANA_MICB_VOUT, vout_ctl[1]);
>> -	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB3, WCD937X_ANA_MICB_VOUT, vout_ctl[2]);
>> -
>> -	return 0;
>> +	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB1, WCD937X_ANA_MICB_VOUT,
>> +			wcd937x->common.micb_vout[0]);
>> +	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB2, WCD937X_ANA_MICB_VOUT,
>> +			wcd937x->common.micb_vout[1]);
>> +	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB3, WCD937X_ANA_MICB_VOUT,
>> +			wcd937x->common.micb_vout[2]);
>>   }
>>   
>>   static irqreturn_t wcd937x_wd_handle_irq(int irq, void *data)
>> @@ -2630,31 +2612,6 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
>>   	.endianness = 1,
>>   };
>>   
>> -static void wcd937x_dt_parse_micbias_info(struct device *dev, struct wcd937x_priv *wcd)
>> -{
>> -	struct device_node *np = dev->of_node;
>> -	u32 prop_val = 0;
>> -	int ret = 0;
>> -
>> -	ret = of_property_read_u32(np, "qcom,micbias1-microvolt", &prop_val);
>> -	if (!ret)
>> -		wcd->micb1_mv = prop_val / 1000;
>> -	else
>> -		dev_warn(dev, "Micbias1 DT property not found\n");
>> -
>> -	ret = of_property_read_u32(np, "qcom,micbias2-microvolt", &prop_val);
>> -	if (!ret)
>> -		wcd->micb2_mv = prop_val / 1000;
>> -	else
>> -		dev_warn(dev, "Micbias2 DT property not found\n");
>> -
>> -	ret = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
>> -	if (!ret)
>> -		wcd->micb3_mv = prop_val / 1000;
>> -	else
>> -		dev_warn(dev, "Micbias3 DT property not found\n");
>> -}
>> -
>>   static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component)
>>   {
>>   	int value;
>> @@ -2848,11 +2805,7 @@ static int wcd937x_bind(struct device *dev)
>>   	wcd937x->sdw_priv[AIF1_PB]->slave_irq = wcd937x->virq;
>>   	wcd937x->sdw_priv[AIF1_CAP]->slave_irq = wcd937x->virq;
>>   
>> -	ret = wcd937x_set_micbias_data(wcd937x);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Bad micbias pdata\n");
>> -		return ret;
>> -	}
>> +	wcd937x_set_micbias_data(dev, wcd937x);
>>   
>>   	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd937x,
>>   					 wcd937x_dais, ARRAY_SIZE(wcd937x_dais));
>> @@ -2920,6 +2873,8 @@ static int wcd937x_probe(struct platform_device *pdev)
>>   
>>   	dev_set_drvdata(dev, wcd937x);
>>   	mutex_init(&wcd937x->micb_lock);
>> +	wcd937x->common.dev = dev;
>> +	wcd937x->common.max_bias = 3;
>>   
>>   	wcd937x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>>   	if (IS_ERR(wcd937x->reset_gpio))
>> @@ -2939,13 +2894,15 @@ static int wcd937x_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
>>   
>> -	wcd937x_dt_parse_micbias_info(dev, wcd937x);
>> +	ret = wcd_dt_parse_micbias_info(&wcd937x->common);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get micbias\n");
>>   
>>   	cfg->mbhc_micbias = MIC_BIAS_2;
>>   	cfg->anc_micbias = MIC_BIAS_2;
>>   	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
>>   	cfg->num_btn = WCD937X_MBHC_MAX_BUTTONS;
>> -	cfg->micb_mv = wcd937x->micb2_mv;
>> +	cfg->micb_mv = wcd937x->common.micb_mv[2];
>>   	cfg->linein_th = 5000;
>>   	cfg->hs_thr = 1700;
>>   	cfg->hph_thr = 50;
>> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
>> index f8d7bf27a6ed..c8b6e543986d 100644
>> --- a/sound/soc/codecs/wcd938x.c
>> +++ b/sound/soc/codecs/wcd938x.c
>> @@ -22,6 +22,7 @@
>>   #include <linux/regulator/consumer.h>
>>   
>>   #include "wcd-clsh-v2.h"
>> +#include "wcd-common.h"
>>   #include "wcd-mbhc-v2.h"
>>   #include "wcd938x.h"
>>   
>> @@ -155,6 +156,7 @@ struct wcd938x_priv {
>>   	struct wcd_mbhc_config mbhc_cfg;
>>   	struct wcd_mbhc_intr intr_ids;
>>   	struct wcd_clsh_ctrl *clsh_info;
>> +	struct wcd_common common;
>>   	struct irq_domain *virq;
>>   	struct regmap_irq_chip_data *irq_chip;
>>   	struct snd_soc_jack *jack;
>> @@ -169,10 +171,6 @@ struct wcd938x_priv {
>>   	struct gpio_desc *us_euro_gpio;
>>   	struct mux_control *us_euro_mux;
>>   	unsigned int mux_state;
>> -	u32 micb1_mv;
>> -	u32 micb2_mv;
>> -	u32 micb3_mv;
>> -	u32 micb4_mv;
>>   	int hphr_pdm_wd_int;
>>   	int hphl_pdm_wd_int;
>>   	int aux_pdm_wd_int;
>> @@ -1974,15 +1972,6 @@ static void wcd938x_mbhc_micb_ramp_control(struct snd_soc_component *component,
>>   	}
>>   }
>>   
>> -static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
>> -{
>> -	/* min micbias voltage is 1V and maximum is 2.85V */
>> -	if (micb_mv < 1000 || micb_mv > 2850)
>> -		return -EINVAL;
>> -
>> -	return (micb_mv - 1000) / 50;
>> -}
>> -
>>   static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
>>   					    int req_volt, int micb_num)
>>   {
>> @@ -2019,7 +2008,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
>>   	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
>>   						    WCD938X_MICB_VOUT_MASK);
>>   
>> -	req_vout_ctl = wcd938x_get_micb_vout_ctl_val(req_volt);
>> +	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
>>   	if (req_vout_ctl < 0) {
>>   		ret = -EINVAL;
>>   		goto exit;
>> @@ -2067,10 +2056,10 @@ static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
>>   	 * voltage needed to detect threshold microphone, then do
>>   	 * not change the micbias, just return.
>>   	 */
>> -	if (wcd938x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
>> +	if (wcd938x->common.micb_mv[2] >= WCD_MBHC_THR_HS_MICB_MV)
>>   		return 0;
>>   
>> -	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd938x->micb2_mv;
>> +	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd938x->common.micb_mv[2];
>>   
>>   	return wcd938x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
>>   }
>> @@ -2975,28 +2964,16 @@ static const struct snd_soc_dapm_route wcd938x_audio_map[] = {
>>   	{"EAR", NULL, "EAR PGA"},
>>   };
>>   
>> -static int wcd938x_set_micbias_data(struct wcd938x_priv *wcd938x)
>> +static void wcd938x_set_micbias_data(struct device *dev, struct wcd938x_priv *wcd938x)
>>   {
>> -	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
>> -
>> -	/* set micbias voltage */
>> -	vout_ctl_1 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb1_mv);
>> -	vout_ctl_2 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb2_mv);
>> -	vout_ctl_3 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb3_mv);
>> -	vout_ctl_4 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb4_mv);
>> -	if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || vout_ctl_4 < 0)
>> -		return -EINVAL;
>> -
>>   	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB1,
>> -			   WCD938X_MICB_VOUT_MASK, vout_ctl_1);
>> +			   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[0]);
>>   	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB2,
>> -			   WCD938X_MICB_VOUT_MASK, vout_ctl_2);
>> +			   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[1]);
>>   	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB3,
>> -			   WCD938X_MICB_VOUT_MASK, vout_ctl_3);
>> +			   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[2]);
>>   	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB4,
>> -			   WCD938X_MICB_VOUT_MASK, vout_ctl_4);
>> -
>> -	return 0;
>> +			   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[3]);
>>   }
>>   
>>   static irqreturn_t wcd938x_wd_handle_irq(int irq, void *data)
>> @@ -3200,37 +3177,6 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x = {
>>   	.endianness = 1,
>>   };
>>   
>> -static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
>> -{
>> -	struct device_node *np = dev->of_node;
>> -	u32 prop_val = 0;
>> -	int rc = 0;
>> -
>> -	rc = of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val);
>> -	if (!rc)
>> -		wcd->micb1_mv = prop_val/1000;
>> -	else
>> -		dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
>> -
>> -	rc = of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val);
>> -	if (!rc)
>> -		wcd->micb2_mv = prop_val/1000;
>> -	else
>> -		dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
>> -
>> -	rc = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
>> -	if (!rc)
>> -		wcd->micb3_mv = prop_val/1000;
>> -	else
>> -		dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
>> -
>> -	rc = of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val);
>> -	if (!rc)
>> -		wcd->micb4_mv = prop_val/1000;
>> -	else
>> -		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
>> -}
>> -
>>   static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
>>   {
>>   	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
>> @@ -3295,13 +3241,15 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
>>   
>> -	wcd938x_dt_parse_micbias_info(dev, wcd938x);
>> +	ret = wcd_dt_parse_micbias_info(&wcd938x->common);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
>>   
>>   	cfg->mbhc_micbias = MIC_BIAS_2;
>>   	cfg->anc_micbias = MIC_BIAS_2;
>>   	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
>>   	cfg->num_btn = WCD938X_MBHC_MAX_BUTTONS;
>> -	cfg->micb_mv = wcd938x->micb2_mv;
>> +	cfg->micb_mv = wcd938x->common.micb_mv[2];
>>   	cfg->linein_th = 5000;
>>   	cfg->hs_thr = 1700;
>>   	cfg->hph_thr = 50;
>> @@ -3457,11 +3405,7 @@ static int wcd938x_bind(struct device *dev)
>>   	wcd938x->sdw_priv[AIF1_PB]->slave_irq = wcd938x->virq;
>>   	wcd938x->sdw_priv[AIF1_CAP]->slave_irq = wcd938x->virq;
>>   
>> -	ret = wcd938x_set_micbias_data(wcd938x);
>> -	if (ret < 0) {
>> -		dev_err(dev, "%s: bad micbias pdata\n", __func__);
>> -		goto err_remove_rx_link;
>> -	}
>> +	wcd938x_set_micbias_data(dev, wcd938x);
>>   
>>   	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd938x,
>>   					 wcd938x_dais, ARRAY_SIZE(wcd938x_dais));
>> @@ -3550,6 +3494,8 @@ static int wcd938x_probe(struct platform_device *pdev)
>>   
>>   	dev_set_drvdata(dev, wcd938x);
>>   	mutex_init(&wcd938x->micb_lock);
>> +	wcd938x->common.dev = dev;
>> +	wcd938x->common.max_bias = 4;
>>   
>>   	ret = wcd938x_populate_dt_data(wcd938x, dev);
>>   	if (ret)
>> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
>> index 85730ae40c2c..59c920c50c00 100644
>> --- a/sound/soc/codecs/wcd939x.c
>> +++ b/sound/soc/codecs/wcd939x.c
>> @@ -28,6 +28,7 @@
>>   #include <linux/usb/typec_altmode.h>
>>   
>>   #include "wcd-clsh-v2.h"
>> +#include "wcd-common.h"
>>   #include "wcd-mbhc-v2.h"
>>   #include "wcd939x.h"
>>   
>> @@ -191,6 +192,7 @@ struct wcd939x_priv {
>>   	struct wcd_mbhc_config mbhc_cfg;
>>   	struct wcd_mbhc_intr intr_ids;
>>   	struct wcd_clsh_ctrl *clsh_info;
>> +	struct wcd_common common;
>>   	struct irq_domain *virq;
>>   	struct regmap_irq_chip_data *irq_chip;
>>   	struct snd_soc_jack *jack;
>> @@ -201,10 +203,6 @@ struct wcd939x_priv {
>>   	u32 tx_mode[TX_ADC_MAX];
>>   	int variant;
>>   	struct gpio_desc *reset_gpio;
>> -	u32 micb1_mv;
>> -	u32 micb2_mv;
>> -	u32 micb3_mv;
>> -	u32 micb4_mv;
>>   	int hphr_pdm_wd_int;
>>   	int hphl_pdm_wd_int;
>>   	int ear_pdm_wd_int;
>> @@ -1919,17 +1917,6 @@ static void wcd939x_mbhc_micb_ramp_control(struct snd_soc_component *component,
>>   	}
>>   }
>>   
>> -static int wcd939x_get_micb_vout_ctl_val(u32 micb_mv)
>> -{
>> -	/* min micbias voltage is 1V and maximum is 2.85V */
>> -	if (micb_mv < 1000 || micb_mv > 2850) {
>> -		pr_err("%s: unsupported micbias voltage\n", __func__);
>> -		return -EINVAL;
>> -	}
>> -
>> -	return (micb_mv - 1000) / 50;
>> -}
>> -
>>   static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
>>   					    int req_volt, int micb_num)
>>   {
>> @@ -1969,7 +1956,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
>>   	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
>>   						    WCD939X_MICB_VOUT_CTL);
>>   
>> -	req_vout_ctl = wcd939x_get_micb_vout_ctl_val(req_volt);
>> +	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
>>   	if (req_vout_ctl < 0) {
>>   		ret = req_vout_ctl;
>>   		goto exit;
>> @@ -2021,10 +2008,10 @@ static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
>>   	 * voltage needed to detect threshold microphone, then do
>>   	 * not change the micbias, just return.
>>   	 */
>> -	if (wcd939x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
>> +	if (wcd939x->common.micb_mv[1] >= WCD_MBHC_THR_HS_MICB_MV)
>>   		return 0;
>>   
>> -	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd939x->micb2_mv;
>> +	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd939x->common.micb_mv[1];
>>   
>>   	return wcd939x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
>>   }
>> @@ -2895,28 +2882,16 @@ static const struct snd_soc_dapm_route wcd939x_audio_map[] = {
>>   	{"EAR", NULL, "EAR PGA"},
>>   };
>>   
>> -static int wcd939x_set_micbias_data(struct wcd939x_priv *wcd939x)
>> +static void wcd939x_set_micbias_data(struct device *dev, struct wcd939x_priv *wcd939x)
>>   {
>> -	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
>> -
>> -	/* set micbias voltage */
>> -	vout_ctl_1 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb1_mv);
>> -	vout_ctl_2 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb2_mv);
>> -	vout_ctl_3 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb3_mv);
>> -	vout_ctl_4 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb4_mv);
>> -	if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || vout_ctl_4 < 0)
>> -		return -EINVAL;
>> -
>>   	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB1,
>> -			   WCD939X_MICB_VOUT_CTL, vout_ctl_1);
>> +			   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[0]);
>>   	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB2,
>> -			   WCD939X_MICB_VOUT_CTL, vout_ctl_2);
>> +			   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[1]);
>>   	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB3,
>> -			   WCD939X_MICB_VOUT_CTL, vout_ctl_3);
>> +			   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[2]);
>>   	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB4,
>> -			   WCD939X_MICB_VOUT_CTL, vout_ctl_4);
>> -
>> -	return 0;
>> +			   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[3]);
>>   }
>>   
>>   static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
>> @@ -3186,37 +3161,6 @@ static int wcd939x_typec_mux_set(struct typec_mux_dev *mux,
>>   }
>>   #endif /* CONFIG_TYPEC */
>>   
>> -static void wcd939x_dt_parse_micbias_info(struct device *dev, struct wcd939x_priv *wcd)
>> -{
>> -	struct device_node *np = dev->of_node;
>> -	u32 prop_val = 0;
>> -	int rc = 0;
>> -
>> -	rc = of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val);
>> -	if (!rc)
>> -		wcd->micb1_mv = prop_val / 1000;
>> -	else
>> -		dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
>> -
>> -	rc = of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val);
>> -	if (!rc)
>> -		wcd->micb2_mv = prop_val / 1000;
>> -	else
>> -		dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
>> -
>> -	rc = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
>> -	if (!rc)
>> -		wcd->micb3_mv = prop_val / 1000;
>> -	else
>> -		dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
>> -
>> -	rc = of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val);
>> -	if (!rc)
>> -		wcd->micb4_mv = prop_val / 1000;
>> -	else
>> -		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
>> -}
>> -
>>   #if IS_ENABLED(CONFIG_TYPEC)
>>   static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component)
>>   {
>> @@ -3252,13 +3196,15 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
>>   
>> -	wcd939x_dt_parse_micbias_info(dev, wcd939x);
>> +	ret = wcd_dt_parse_micbias_info(&wcd939x->common);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get micbias\n");
>>   
>>   	cfg->mbhc_micbias = MIC_BIAS_2;
>>   	cfg->anc_micbias = MIC_BIAS_2;
>>   	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
>>   	cfg->num_btn = WCD939X_MBHC_MAX_BUTTONS;
>> -	cfg->micb_mv = wcd939x->micb2_mv;
>> +	cfg->micb_mv = wcd939x->common.micb_mv[1];
>>   	cfg->linein_th = 5000;
>>   	cfg->hs_thr = 1700;
>>   	cfg->hph_thr = 50;
>> @@ -3444,11 +3390,7 @@ static int wcd939x_bind(struct device *dev)
>>   	wcd939x->sdw_priv[AIF1_PB]->slave_irq = wcd939x->virq;
>>   	wcd939x->sdw_priv[AIF1_CAP]->slave_irq = wcd939x->virq;
>>   
>> -	ret = wcd939x_set_micbias_data(wcd939x);
>> -	if (ret < 0) {
>> -		dev_err(dev, "%s: bad micbias pdata\n", __func__);
>> -		goto err_remove_rx_link;
>> -	}
>> +	wcd939x_set_micbias_data(dev, wcd939x);
>>   
>>   	/* Check WCD9395 version */
>>   	regmap_read(wcd939x->regmap, WCD939X_DIGITAL_CHIP_ID1, &id1);
>> @@ -3613,6 +3555,8 @@ static int wcd939x_probe(struct platform_device *pdev)
>>   
>>   	dev_set_drvdata(dev, wcd939x);
>>   	mutex_init(&wcd939x->micb_lock);
>> +	wcd939x->common.dev = dev;
>> +	wcd939x->common.max_bias = 4;
>>   
>>   	ret = wcd939x_populate_dt_data(wcd939x, dev);
>>   	if (ret) {
> 
> 


