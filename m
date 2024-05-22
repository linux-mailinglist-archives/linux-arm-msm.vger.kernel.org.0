Return-Path: <linux-arm-msm+bounces-20207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E628CC016
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 13:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616671C20B70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 11:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2C382483;
	Wed, 22 May 2024 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nV3WECET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D667BB17;
	Wed, 22 May 2024 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716376822; cv=none; b=ExgNfTOFoAG7+QzCY/sxhZmLd8KePpMmJk/0uL5XRV0lgRfQmWuHMfAH6AN/hivXVZx+yUgK3Qxl+iy0q7uHm7xb4TzeCOV3Po4+QcqggIAkOasXiQNI9VnqNlio2N3raa3inH1bcQtAVX6B0bORNEfsUmEMg6shkwuW2AkjFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716376822; c=relaxed/simple;
	bh=WirqgetsoR4n/WQriyyt8btxqeQL9vaUHNfpqDiMX/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s5W2UT6cdzK/zzFCSXTvNvIubc+sYZ6cbw3dXE4bZk7/xzsbbNXvuHDPZf0rKh3XTBp+jTpQSfs8emI2HrBlCDBrk/f3r6jxW3e7A6J+1ghxfcdXAfwSV7MJ1D+9JdLbQ6aE/B1ctnPCmL26fjl85rq4m+/TQDlFtN4IegFNoIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nV3WECET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M8YgfA021174;
	Wed, 22 May 2024 11:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=exxJeGk/nfZF5ppc30Iss5x2jvpzqkOD4lkZzfqmX0s=; b=nV
	3WECETLPBT+cHuiQzQ1iEazKYhtNLDYHmKA93LxCJF3uC1jkeOLJA1ssFo7xNxcW
	/QcCitbsfcwynUZ/4GMVns/o7yl99KxxeZNXqD5aeqiWilZHqEt3ct0BqkW3B8kh
	dvnE18DkgYlmonld7iFnTHTDfDrpLQx4cucCto/H+cIlUXidhulpVbziTU/zZUfb
	+7bAvfitAn8ZLcP81ztjwRcQiVWUSdVeuizXTpgbUEkLCEhgERb9yxLuQ3vq+nG5
	sGy4ffp6qXfXNia1oF+guAj/tJrYkO1mXj/9KaE4NvtpCtc9LgU6SsvdXjMchfrZ
	RBxKBUdLn7uRGNQYjVvQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n45rtq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 11:19:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MBJjF3015006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 11:19:45 GMT
Received: from [10.216.17.165] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 04:19:40 -0700
Message-ID: <c2eb1eb0-2555-6293-999e-ed394e84c946@quicinc.com>
Date: Wed, 22 May 2024 16:49:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 4/7] ASoC: codecs: wcd937x: add basic controls
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai
	<tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <quic_pkumpatl@quicinc.com>
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
 <20240516044801.1061838-5-quic_mohs@quicinc.com>
 <f766e8fc-64e7-4579-ac5a-4afcdae067cc@sirena.org.uk>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <f766e8fc-64e7-4579-ac5a-4afcdae067cc@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QVV2ad75SP7I7KCJj9NKhqbJ0SSs4oSi
X-Proofpoint-ORIG-GUID: QVV2ad75SP7I7KCJj9NKhqbJ0SSs4oSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_05,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220075

On 5/16/2024 5:28 PM, Mark Brown wrote:
> On Thu, May 16, 2024 at 10:17:58AM +0530, Mohammad Rafi Shaik wrote:
> 
>> +static int wcd937x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
>> +				   struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component =
>> +				snd_soc_kcontrol_component(kcontrol);
>> +	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
>> +	u32 mode_val;
>> +

Thanks for the review.

>> +	mode_val = ucontrol->value.enumerated.item[0];
>> +	if (!mode_val) {
>> +		dev_warn(component->dev, "Invalid HPH Mode, default to class_AB\n");
>> +		mode_val = CLS_AB;
> 
> This should be silent (or return an error) otherwise people can DoS the
> logs by just spamming in invalid values.
> 

okay,

I will remove logs.

>> +	}
>> +
>> +	wcd937x->hph_mode = mode_val;
> 
> I would expect there's more validation needed here, this will blindly
> assign any non-zero mode.  Please run the mixer-test selftests on a card
> with this device in it and show the results on future submissions, this
> will detect this and other issues for you.
> 
> Several of the other controls look like they're also missing validation.
> 

I'll add missing validations for all controls.

>> +static int wcd937x_set_swr_port(struct snd_kcontrol *kcontrol,
>> +				struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
>> +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
>> +	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(comp);
>> +	struct wcd937x_sdw_priv *wcd;
>> +	int dai_id = mixer->shift;
>> +	int ch_idx = mixer->reg;
>> +	int portidx;
>> +	bool enable;
>> +
>> +	wcd = wcd937x->sdw_priv[dai_id];
>> +
>> +	portidx = wcd->ch_info[ch_idx].port_num;
>> +
>> +	enable = !!ucontrol->value.integer.value[0];
>> +
>> +	wcd->port_enable[portidx] = enable;
>> +	wcd937x_connect_port(wcd, portidx, ch_idx, enable);
>> +
>> +	return 1;
>> +}
> 
> This unconditionally reports that the value changed so will generate
> spurious events.
>> +
>> +static const char * const rx_hph_mode_mux_text[] = {
>> +	"CLS_H_INVALID", "CLS_H_HIFI", "CLS_H_LP", "CLS_AB", "CLS_H_LOHIFI",
>> +	"CLS_H_ULP", "CLS_AB_HIFI",
>> +};
> 
> It would be more idiomatic to write these in a more human readable form.

i guess this change is fine.

I took the reference from wcd938x and wcd939x.

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/codecs/wcd938x.c#n1693

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/codecs/wcd939x.c#n1635

> 
>> +static const char * const wcd937x_ear_pa_gain_text[] = {
>> +	"G_6_DB", "G_4P5_DB", "G_3_DB", "G_1P5_DB", "G_0_DB",
>> +	"G_M1P5_DB", "G_M3_DB", "G_M4P5_DB",
>> +	"G_M6_DB", "G_7P5_DB", "G_M9_DB",
>> +	"G_M10P5_DB", "G_M12_DB", "G_M13P5_DB",
>> +	"G_M15_DB", "G_M16P5_DB", "G_M18_DB",
>> +};
> 
> Why is this an enum and not TLV information?

I'll check and add TLV instead enum.

Thanks & Regards,
Rafi




