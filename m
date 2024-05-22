Return-Path: <linux-arm-msm+bounces-20206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CE8CBFC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21DB2B22097
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D6C82495;
	Wed, 22 May 2024 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eqDl9zPY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6238248D;
	Wed, 22 May 2024 10:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375441; cv=none; b=qPCtyYuvcL0keZEYDH0rFczz/Gt1GxTS3JIYXzVrdbPyN6LQeLMAmDBRJJ+Ex6fh4Nb/5b3u0QAgm4reEMjZKO6FzvVALMUE0xcrrotG3/TLBWiZ6ecC44PCop/MpnSkwbX49Wop8Oky3r1CCuymmoRAPKvnCRDs5JW/LmUy2Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375441; c=relaxed/simple;
	bh=SylLlKY5CBoxLppHNyLoIhvEyhdTimOFUf/M84mucLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G3PN2U3M+8WGfOu+0RRF2SRrwRo3AvINXO9XxTMqfMs3F+vNT/c3e9S2PD0wisfCN2AfjKX7luOXWa4Gy6ryHEkvJ/vkqF+AJ0yRRf7bYz17Ig/+7+DI9gM4vYvmWAkbQLosiNQ3LKL8Y4jCUzm5seZXfAByVDJwfBEvIbK36ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eqDl9zPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M2YgKA031245;
	Wed, 22 May 2024 10:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=HPyJZ+IQWOZKRRpHGYSzS507Ci7ZQ9SHHNkKp70iD0A=; b=eq
	Dl9zPYMhkKVBMLcM5+Sxn7XDoMlwFv4Yr0pgD3VMFxx4MUnXqSGRludUaxOsREvV
	n/AIPeN9yIDQzZBFiBKOdOT4fcdTsFwsqVVr8SwXzHS0d85CjpHrCiKP4Nn7nS2P
	gIFGWA0DHhsx8QTSKkzAjGuWEfuxFw7otgrp1Rl7IPMywDd9Ym2AdRSpsTuSS5Sb
	fEdb9DmkLX48ukfuGAqsWUe86mxn6RBXaeSZt6D7d7U38cUZuT64Qvyn0mOGHQJi
	GhW1AoB54qYL+VESORRaz1lSSofc5QtKbxN9bejSkTjaOtB+aPaRk/4qiVFM6Ou/
	kXhMPmJPGNArSecYuWoQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pr2rn0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 10:56:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MAunkF002918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 10:56:49 GMT
Received: from [10.216.17.165] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 03:56:45 -0700
Message-ID: <40594542-ac60-0ff7-8474-a93f678a99be@quicinc.com>
Date: Wed, 22 May 2024 16:26:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
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
 <20240516044801.1061838-3-quic_mohs@quicinc.com>
 <91f581ef-58ea-4b98-80e2-dd9b14a61c60@sirena.org.uk>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <91f581ef-58ea-4b98-80e2-dd9b14a61c60@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oEa4VcuMEe6-HxUvq2uT8Hl8_qXlruDv
X-Proofpoint-GUID: oEa4VcuMEe6-HxUvq2uT8Hl8_qXlruDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_05,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220074

On 5/16/2024 5:17 PM, Mark Brown wrote:
> On Thu, May 16, 2024 at 10:17:56AM +0530, Mohammad Rafi Shaik wrote:
> 
>> +static const struct reg_default wcd937x_defaults[] = {
> 
>> +	{ WCD937X_DIGITAL_EFUSE_REG_0,				0x00 },
>> +	{ WCD937X_DIGITAL_EFUSE_REG_1,				0xff },
>> +	{ WCD937X_DIGITAL_EFUSE_REG_2,				0xff },
>> +	{ WCD937X_DIGITAL_EFUSE_REG_3,				0xff },
> 
> Given the name I'd expect these to vary per device so not have default
> values.  In general ID, status or volatile registers probably shouldn't
> have defaults since they should be read from the device.
> 

Thanks for the review,

Will cleanup those.
>> +static bool wcd937x_readonly_register(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
> 
>> +	case WCD937X_DIGITAL_CHIP_ID0:
>> +	case WCD937X_DIGITAL_CHIP_ID1:
>> +	case WCD937X_DIGITAL_CHIP_ID2:
>> +	case WCD937X_DIGITAL_CHIP_ID3:
> 
>> +	case WCD937X_DIGITAL_EFUSE_REG_0:
>> +	case WCD937X_DIGITAL_EFUSE_REG_1:
>> +	case WCD937X_DIGITAL_EFUSE_REG_2:
> 
>> +	.readable_reg = wcd937x_readable_register,
>> +	.writeable_reg = wcd937x_rdwr_register,
>> +	.volatile_reg = wcd937x_readonly_register,
> 
> It's not a bug per se since things will work but you should probably
> have separate volatile and read only checks, things like the ID and
> efuse registers are read only but they shouldn't vary at runtime so
> could be cached and not volatile.

ACK,

Will cleanup and improve.

Thanks & Regards,
Rafi.

