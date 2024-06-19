Return-Path: <linux-arm-msm+bounces-23200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8779190E8E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 13:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7610C1C2122E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 11:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D810C135A6D;
	Wed, 19 Jun 2024 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CkpJ/kIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604EF33CC2;
	Wed, 19 Jun 2024 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718795005; cv=none; b=T5Hi5qXBxgMhGMvJ8J4h9LUZPLhvIBjHAordV344kVDq4Qcxgw3Mx24Ng6uNmA9b7meI0Kna1D+7EdIYDWwHhWB6QyhrGN9eMPAVrMIjfVvNruQ/Q3K+pwY9L4h9/H9Q04bbpY5xGmQRpPUBaiXVlZDuH9lFvK1HQ9b+RqnDpxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718795005; c=relaxed/simple;
	bh=2Xrb73U1zba3Fgu5svgTN4Vx0aQufpvOLdecJqqxgoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DRocbFjt282Ok55Uqlfs7NlDGM5gjLGi7weGcXqLJO0vb/2L0bRXMpPsJS4OjgDOq/D/xqna9neTUBs+fTYOOil5nlPtlHXsb7WQJ09o29DTrLwZBDyyExfrJyQGxeDrvzcAEEiEpP8H+UUkW+j4R49gNVWN2eAhV8zcp/Jt6mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CkpJ/kIy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J94w7b001114;
	Wed, 19 Jun 2024 11:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhYWVPbQ12M8wEmqpPGMe0i1Au4oSfVFExiSS27fBB8=; b=CkpJ/kIyRviCGgGj
	BQokUJv+k4IG0hONHQzxUgjHl4yXyITp7wWIBYYLo62Bf6Jzw7LLUCrn4oY6Nex8
	afDCvqxlUljgM+ala97FVX2bGzFhAfXOnkD55EozXmjF6GT/0upgXBBp2q2O0VCl
	dTOPGayr4E5fI4xq/3qCP9BxA9aJFZEYa1HOTrplIUZxSpTXna0kgf3/H8+Wi8SN
	N4PLWBQ3zAqV7qMIU3RtxbU7FtUj25d6r6yzTAnnAGqHiynNAr+8zguTIBqmLfJM
	TgENdvLIzuBpM7N/Vyask6BktcqAv6VDlWQiEUSPiNaQM7Pv/nikELJUSCZlVv5W
	VYaSKg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja29ex3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 11:02:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JB2qvd014918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 11:02:52 GMT
Received: from [10.216.22.230] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 04:02:47 -0700
Message-ID: <288156b9-2f72-6929-3422-c3aecb9c2c07@quicinc.com>
Date: Wed, 19 Jun 2024 16:32:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
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
        <quic_rohkumar@quicinc.com>, <quic_pkumpatl@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
References: <20240611074557.604250-1-quic_mohs@quicinc.com>
 <20240611074557.604250-4-quic_mohs@quicinc.com>
 <2b92c0f9-2595-4b73-8015-1abb825a61a1@wanadoo.fr>
 <f741630e-f9e8-45e1-b3e2-4866f0baeac2@sirena.org.uk>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <f741630e-f9e8-45e1-b3e2-4866f0baeac2@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MD7A4DgbhCLTSgvMXTzyLOwO2RuJvSqQ
X-Proofpoint-ORIG-GUID: MD7A4DgbhCLTSgvMXTzyLOwO2RuJvSqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190082

On 6/17/2024 5:25 PM, Mark Brown wrote:
> On Sun, Jun 16, 2024 at 04:54:58PM +0200, Christophe JAILLET wrote:
>> Le 11/06/2024 à 09:45, Mohammad Rafi Shaik a écrit :
> 
>>> +static void wcd937x_soc_codec_remove(struct snd_soc_component *component)
>>> +{
>>> +	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
>>> +
>>> +	wcd937x_mbhc_deinit(component);
>>> +	free_irq(wcd937x->aux_pdm_wd_int, wcd937x);
>>> +	free_irq(wcd937x->hphl_pdm_wd_int, wcd937x);
>>> +	free_irq(wcd937x->hphr_pdm_wd_int, wcd937x);
> 
>> These irq have been requested wth devm_request_threaded_irq(), so either
>> this free_irq should be removed, or devm_free_irq() should be used if the
>> order is important.
> 
> Yes, this should be fixed.

okay, will check and provide the fix.


Thanks & Regards,
Rafi.

