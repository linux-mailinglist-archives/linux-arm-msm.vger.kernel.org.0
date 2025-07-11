Return-Path: <linux-arm-msm+bounces-64603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC53CB01E07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AB75B43AAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB512DBF45;
	Fri, 11 Jul 2025 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYcAmEvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC372DA74D
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240762; cv=none; b=bxWQ4y/BXSThWO1YHxOJuGOPga0JLVuaSontOuFjA0VD+wehPLr96AV3eykioF4U1EkwznDOMNgs7V2Cfz1S0AOTRPjtLx6i0lh7mXL3WRhfjk7M3qzuZ3WjlWVcNQSarv439qbJSH0N/IdQrYOkH7QwFAmY+sgdJ+218QDsGZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240762; c=relaxed/simple;
	bh=cxDui2279G2iAL74DhrviEb73ULq4vNmJowaeDNo81A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tiieFRbhFd7+lF4EIPm7aEVMeArspU71h+GdaDOiVvjYd3E8xmdsRorfmiLb4CjGSfY3f/8Ld+ciqPt/shL2V5q5xA2VG51SO6HQ0DkRVBs2JBPSr+J+mZOkxxiwM1xERk/Ey1jOkxr1U3SwaQXR5ILQCeOLOkdHtSBtf5OZOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYcAmEvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAuxJ6026080
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thUDUj4ntHriDBH6aejx31sCgkmryjUnapSdrJV27l8=; b=WYcAmEvwUJwE79dC
	HVZ0lfFYKopE7AVSdGXDFKlgxdwkhRa9f3DJhLW3Y6Z2kJoBzCEoCUk6TMk0uzuC
	vnxn05FggV77BChCoDVXqnATAKfgFoJ0unvjryrb3Ng6VZNsZ9cnWytRdxUgkblC
	7K0bsY7O5S7dC1/Et6cD9QO1puROUmRyw9FLDYeI+bLBxVI+002nsoiEK3VkjZJC
	mtci1YVd8nbs6p1Z4Ggq/HTzGhOAYl3+LQ07cKtumE0Lxju/UfuzkEt3iwp6yLCE
	qhdqbBWuQsyOHSCyzjROgZZ6nr0YDxPPCOOCOduMIg/0h8tNe+LhzBs3OgnKOssV
	Wk5CUw==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1a2gd5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:32:39 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df2d0b7c7eso20224815ab.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 06:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240759; x=1752845559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thUDUj4ntHriDBH6aejx31sCgkmryjUnapSdrJV27l8=;
        b=iIOOfYDvFdW5RuCBcay4507ZDVeowYsNANgvynuF2VCxS+D+2LLfRiEh6gMg7ZaEq2
         F/C0Sx33ycbxitdMePPoThdU+jwJovmLawPziKW4Qt64BsPOdOriXZP9Nnmu2XD2oFEH
         nClbskl0IxXt4kQkUzzlMn0XFvcolIqNaPwBsgESZuXmkbLme9DkCC8+nhYyjxJV8l6l
         4szXnCCyR2aV1PrRqrE90++Sz2HEpz9NN3ReO/vFpp22/I38H7TTeNKYhlQk9KcYIaHu
         9W9OKB/XHgsS2zHynUYROa9E83CfaKoG/Usv4eN4s1lSZtVwsx6plTDteyIOh5RsqgIJ
         0U5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUT77zlTvFobwiqxstOwtfZdhLWhAiMcWiu2cWo7BPLnc5SHt3ZEBP23penVoMoSzujvga8bMgvkI9sPWVW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyjzazm/pqLYYZAzwz2LwYxwoWg9EULfa2QYNIqu6BqoH8+goO
	ToWrlmDhAETTyCAEjOT49D9v84E6Bv563rz8HhPK2JCZUr+I5+9IOSeI06Y7QtP9Tg34eTLYbA5
	Ge8YLPXcIzS7PUTufv2KOJYmQ5PdoA1qvUSfH+NFf99R9kw/bGVd5KJ5U6QBxtYwXXrQn
X-Gm-Gg: ASbGncucGanas2DKxrV+cXNh8WGonQL9So2rc1Tq27xYa2sdY7Rjtg3bIQ24aI0nMjn
	x4cubXMuH2bji94FmTezoxi2BThN93Co+2IQ+fLuPM0gaZyODqNHxtjxZjz2SYT8GBOMCmu3Exs
	jLqkLPxi1IKWcmsG1eEy8pb/g3nM9p/QoLp96AzJzS8ieR2LORZI1tPp4TDt9I0jMyosEHb76Km
	a8P7ZJa5sjY3uw+Twqgp7ZEOCL2BAkhnOUVUY5Kat5nMyELunaJUqq+oljzaFPNTPfiA2b831BX
	gzu7k8IIG0s9t4USqlmh/qIQpukS5pgPfToYA5/f4cUDAezqD/LLciEkEX3L9ffBPFY=
X-Received: by 2002:a05:6e02:398e:b0:3df:3598:7688 with SMTP id e9e14a558f8ab-3e25434f9bemr37217855ab.21.1752240758560;
        Fri, 11 Jul 2025 06:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIF0igNgHju9Rl8GNa7JzdKd+TODV4gvdmsYawmICuzsGWGTS3QwLPPSzsDZlNmOF3ncQ7iQ==
X-Received: by 2002:a05:6e02:398e:b0:3df:3598:7688 with SMTP id e9e14a558f8ab-3e25434f9bemr37217215ab.21.1752240758111;
        Fri, 11 Jul 2025 06:32:38 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454d511bd78sm87860525e9.35.2025.07.11.06.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 06:32:37 -0700 (PDT)
Message-ID: <87a56d1e-2bbd-4abf-91c8-5129835d8d87@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:32:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: codecs: add new pm4125 audio codec driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MKJgmNZl c=1 sm=1 tr=0 ts=68711277 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=kjzoyE47cCA4-HZi2KEA:9 a=QEXdDO2ut3YA:10 a=HaQ4K6lYObfyUnnIi04v:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5NiBTYWx0ZWRfX9AfDKDRjynxX
 IRnhfByzpQE+Y3UHglhhouM1JiN8LMyHAUYXqjlYVG1GmZD/iNNvMG5bocSlnkp5ByzVa7aKSPC
 qH6ymoLf+2TxziMwX5hw8TdFZhJ2RH7RwSnhFTE/zCKfCTisJmFee2QSjYnHb0vgdZ3FddTsF0I
 enF1FRqNTNx3DfeCiByYovdyElwmk1kkO0hetYu6d0jbGWFKqayRc8V7BU4GNj+qrbDmrqeZb5i
 Wij/dzKK+EJEy6kds4JdWztJD7lVK4PKCGnz0NeK0k9zhSoK9NhXO9rwEgXseglf3RFXaIZXdwt
 MM7bdMTBFH9O2ILg1S0w7HUMO0WnSeiU9GMMbp5V6viCWStECPEw6dnor6bCdiD86Gs6hzRReAq
 zLlusz2yVXVNEZc5kiNPKKuLGFEDXOYWjkLFcVt1Dj+vZFNioJfxEvlRgmMFq69YUkvHlFis
X-Proofpoint-ORIG-GUID: RBVsSwcVQFGwzZldGcP8nQvhcIIe8mO4
X-Proofpoint-GUID: RBVsSwcVQFGwzZldGcP8nQvhcIIe8mO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110096

On 7/11/25 4:00 AM, Alexey Klimov wrote:
> The audio codec is found in Qualcomm PM2250/PM4125 PMICs and is used on
> platforms like Qualcomm QCM2290. It has soundwire interface and
> corresponding RX and TX slave devices.
> 
> It has only two input channels: HPH left and right. The line output (LO)
> is linked to HPHL so the hardware has some limitations regarding concurrent
> playback via HPH and LO for instance.
> 
> The codec driver also uses WCD MBCH framework. The MBHC functionality is
> implemented in a minimalistic way to enable IRQs and avoid different
> issues with IRQs.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Thanks for doing this Alexey,

I have tested Headset playback, headset recording and Lineout.

While testing I have noticed one issue with the places where enable_irq
is being used, there is a possiblity of things going wrong in some cases.


> ---
>  sound/soc/codecs/Kconfig      |   18 +
>  sound/soc/codecs/Makefile     |    8 +
>  sound/soc/codecs/pm4125-sdw.c |  546 +++++++++++++
>  sound/soc/codecs/pm4125.c     | 1767 +++++++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/pm4125.h     |  314 ++++++++
>  5 files changed, 2653 insertions(+)
> 

...
> +static int pm4125_codec_enable_lo_pa(struct snd_soc_dapm_widget *w,
> +				     struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component, PM4125_ANA_COMBOPA_CTL_5, 0x04, 0x00);
> +		usleep_range(1000, 1010);
> +		snd_soc_component_update_bits(component, PM4125_ANA_COMBOPA_CTL_4, 0x0F, 0x0F);
> +		usleep_range(1000, 1010);
> +		snd_soc_component_write_field(component, PM4125_ANA_COMBOPA_CTL,
> +					      PM4125_ANA_COMBO_PA_SELECT_MASK,
> +					      PM4125_ANA_COMBO_PA_SELECT_LO);
> +		snd_soc_component_write_field(component, PM4125_DIG_SWR_PDM_WD_CTL0,
> +					      PM4125_WDT_ENABLE_MASK,
> +					      (PM4125_WDT_ENABLE_RX0_M | PM4125_WDT_ENABLE_RX0_L));
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(5000, 5010);
> +		snd_soc_component_update_bits(component, PM4125_ANA_COMBOPA_CTL_4, 0x0F, 0x04);
> +		enable_irq(pm4125->hphl_pdm_wd_int);

if headset playback dapm widgets are powered up or active and you try to
play on lineout you would get below splat:

[ 1181.352762] ------------[ cut here ]------------
[ 1181.357435] Unbalanced enable for IRQ 156
[ 1181.361489] WARNING: CPU: 1 PID: 877 at kernel/irq/manage.c:753
__enable_irq+0x4c/0x7c
...

[ 1181.483541] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS
BTYPE=--)
[ 1181.490534] pc : __enable_irq+0x4c/0x7c
[ 1181.494405] lr : __enable_irq+0x4c/0x7c
[ 1181.498278] sp : ffff8000840ab8a0
[ 1181.501618] x29: ffff8000840ab8a0 x28: ffffd79b9725d588 x27:
ffff8000840ab948
[ 1181.508796] x26: 000000000000309b x25: 0000000000000080 x24:
0000000000000080
[ 1181.515980] x23: ffffd79b9698f250 x22: 0000000000000000 x21:
0000000000000000
[ 1181.523153] x20: 000000000000009c x19: ffff23c347fd9400 x18:
0000000000000006
[ 1181.530335] x17: 0000000000000001 x16: ffffd79b94dbcce8 x15:
ffff8000840ab46f
[ 1181.537508] x14: 0000000000000000 x13: 3635312051524920 x12:
ffffd79b96d96768
[ 1181.544691] x11: 0000000000000058 x10: 0000000000000018 x9 :
ffffd79b96d96768
[ 1181.551862] x8 : 000000000000024f x7 : ffffd79b96dee768 x6 :
ffffd79b96dee768
[ 1181.559044] x5 : ffff23c3bbbb8508 x4 : 0000000000000000 x3 :
0000000000000027
[ 1181.566217] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
ffff23c35a0a4600
[ 1181.573392] Call trace:
[ 1181.575871]  __enable_irq+0x4c/0x7c (P)
[ 1181.579748]  enable_irq+0x60/0xd8
[ 1181.583098]  pm4125_codec_enable_lo_pa+0x6c/0x1a0 [snd_soc_pm4125]
[ 1181.589319]  dapm_seq_check_event+0x11c/0x144
[ 1181.593720]  dapm_seq_run_coalesced+0x130/0x1d0
[ 1181.598286]  dapm_seq_run+0x264/0x374
[ 1181.601991]  dapm_power_widgets+0x664/0x900
[ 1181.606212]  snd_soc_dapm_stream_event+0xf4/0x178
[ 1181.610957]  __soc_pcm_prepare+0x64/0x120
[ 1181.614998]  dpcm_be_dai_prepare+0x120/0x168
[ 1181.619299]  dpcm_fe_dai_prepare+0x94/0x178
[ 1181.623517]  snd_pcm_do_prepare+0x30/0x50
[ 1181.627567]  snd_pcm_action_single+0x48/0xa4
[ 1181.631872]  snd_pcm_action_nonatomic+0x94/0xb0
[ 1181.636435]  snd_pcm_prepare+0x7c/0xe0
[ 1181.640222]  snd_pcm_common_ioctl+0xca4/0x16e0
[ 1181.644705]  snd_pcm_ioctl+0x34/0x4c
[ 1181.648315]  __arm64_sys_ioctl+0xac/0x104
[ 1181.652355]  invoke_syscall+0x48/0x104
[ 1181.656147]  el0_svc_common.constprop.0+0x40/0xe0
[ 1181.660892]  do_el0_svc+0x1c/0x28
[ 1181.664242]  el0_svc+0x30/0xcc
[ 1181.667340]  el0t_64_sync_handler+0x10c/0x138
[ 1181.671737]  el0t_64_sync+0x198/0x19c
[ 1181.675430] ---[ end trace 0000000000000000 ]---
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		disable_irq_nosync(pm4125->hphl_pdm_wd_int);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		usleep_range(2000, 2010);
> +		snd_soc_component_write_field(component, PM4125_ANA_COMBOPA_CTL,
> +					      PM4125_ANA_COMBO_PA_SELECT_MASK,
> +					      PM4125_ANA_COMBO_PA_SELECT_EAR);
> +		usleep_range(5000, 5100);
> +		snd_soc_component_write_field(component, PM4125_DIG_SWR_PDM_WD_CTL0,
> +					      PM4125_WDT_ENABLE_MASK, 0x00);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +thanks,
Srini

