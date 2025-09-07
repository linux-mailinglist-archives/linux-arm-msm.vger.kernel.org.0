Return-Path: <linux-arm-msm+bounces-72416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C929B47A39
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 11:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D99E3A37F6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 09:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7722940D;
	Sun,  7 Sep 2025 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDOQdZ4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E2C2222BA
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757238304; cv=none; b=LEwhhfzIHzDokKn4NbFPm5pkw0jYc5rmCv+DeY+Fw5SFyBdQ7N3V4l6VLZmh3uW6uDs77idO1+sBj7zdjCeM+Nix1n/9Elm9QVWQaBIn53ftzbtQnundBzquJYv8RmqcpKwNotZ4HzRE0BzPDHm0yLw0gjWeVLW1/PGNX80VihM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757238304; c=relaxed/simple;
	bh=ZG1Wd+YbO7ZFwoyTjQyoxkUYa4J5VZz7XZ6x6O4evtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbcxYyX7sI4p3QGpa4POdRPM/huJ/6PcEPKleIWtB3O7tLRuD2ozK3j1kAffFMuNMS7Vdwq6REBtqS3QQtkzYQigafbgM2nrrANp2yZOxBh7SElQe9yP2uBoiXJLrMZVXXDISTNElTgCDY3J2EbI+JiyTczaKUmqukD8hCGo2AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDOQdZ4D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878kdTq021378
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 09:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oyZIr900A7As+J59YVgKLoRi1wJ9eu9B7vYZpViBB+g=; b=QDOQdZ4DKXpwnsQn
	lMwDAdm3Kz18Ve26uwiQlOtzN+7c2sS5lvZAA+Qkwa2OiRwah2CVljEOXLj86tey
	L22XBfMDU2l47nqvp2Fy5SZxt1EZnDnZOuiWzmKgaI2J3dOuDjz99XH7+B6qzEBw
	k1EmfxCCBJo4TDS4kCAVNu5kmB8PTN14VQ3odI+J/OX4Def0g7aTps5NvUCkZpvw
	M7odYgFFLz8a3OUK4faIM7AxLchVsqGTg6ofEcXPlqKNNeOhVtT1AOKMGX6g+ghD
	8j8AU3MaZGWyjB1A/M8RxmZ7X9dlG39HBBb0W2SSt49nJh4Ncus9onWdt9ppypvA
	MyyhsA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490anfa3rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 09:45:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72048b6e865so72036846d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 02:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757238300; x=1757843100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyZIr900A7As+J59YVgKLoRi1wJ9eu9B7vYZpViBB+g=;
        b=vr2YoRo9VR2h4KVCON65fOd5YuC5Kh/I54Vl7iEz3L2jdR1tt2xbrn2ggZOMNItrPv
         bqHgOZ/5F0DOGyNA4qwItQ8pM+8Zn/rKH8SoDA+cFx4pvPIr0Eho76PYcBq1xlxBvDfD
         L+EZ8TN/K8fn5+kBFfetVrVgPJQ57mYfVSShtPezhAubh+xv3uhb2GSRSR3mSuUd0Wt4
         sLL60wRqpd1/rDyYzE+GgRumYxOuROSFYbe8zX6gxPjFr1W8oOSd7PxD08fdUtd1Bazf
         naTrahDn2Kg1DLWYBIbmsVlzGDc+Dy5u1YXryKFF3oxvJ+dhVUDKdnFxvOLLWDXjyEtt
         elQw==
X-Forwarded-Encrypted: i=1; AJvYcCVQy5BZy+/aaknP3e00fkhynIlM7kCAzdDlbYHZ5GN16s7RGW6fAfX0vpaF9V3ga3bnZG6y/DF+DztFBruI@vger.kernel.org
X-Gm-Message-State: AOJu0YwdcgZlgCIRSP6Yj0eG3FliCri51MmgUjU/vH3Zp98ai40rVwd5
	nMOOc+cNqjRaKGdaHhTMu0ccrmD4MHgNqZARKztIZf+SpjpmNcsh9XtRztizLd9PsWdQrCq5PrB
	6keGI8JgY7gCmrpWwU8YAwQsGLlylvn1F2Ki+n3Y8PtRhyX5zHBHX+HgAqRicBbCIea+x
X-Gm-Gg: ASbGnctczb15Zb9W4YB7n4jVQT/PTLUPBaS6ka6C7Ah3NBwasJ/aAFg175tAv7pt2vb
	WwUMxYpyaBgYrpCSVA4+mMb5CJdgAAg0u5nLiRLuDCPpNQTooR2Jwxh36f1ImEiOkSamNvH5yUn
	fS6ZoNMOs2qa8bxnWW8aJrfBn0Rhxv/9Y3GrCPgrVLxF/e3B/dXFpH0xiLMCfHOtt76K0B+9Caa
	jY74fRIjr7IQHHwkf1swzy/MuFVwFJI5qlLZQWWxnp6kF5iGroIO1xQjA+DU21EwJub4+enSbi8
	8KlctyL8xoFoS7bZsOJF/PvX1jSGBEbqLZQKXnXUrkbLq1TVnrBvwRHuf9YpAcQXnW8=
X-Received: by 2002:a05:6214:2a4e:b0:72b:1221:fdc8 with SMTP id 6a1803df08f44-7393ca9ae9amr46966816d6.46.1757238300088;
        Sun, 07 Sep 2025 02:45:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv752JqWdu3Msbh92JO52ZP/kps3mtp/BqZuEag3qhT6I9q0o1F4xXhgqj68K+5kEyIYbyRQ==
X-Received: by 2002:a05:6214:2a4e:b0:72b:1221:fdc8 with SMTP id 6a1803df08f44-7393ca9ae9amr46966436d6.46.1757238299539;
        Sun, 07 Sep 2025 02:44:59 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3db72983560sm19277641f8f.1.2025.09.07.02.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 02:44:58 -0700 (PDT)
Message-ID: <6eebcd0a-810e-4aa5-a16f-523aedf9e50c@oss.qualcomm.com>
Date: Sun, 7 Sep 2025 10:44:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] ASoC: codecs: wcd: add common helper for wcd
 codecs
To: kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com, tiwai@suse.com,
        vkoul@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        linux-sound@vger.kernel.org
References: <20250905154430.12268-7-srinivas.kandagatla@oss.qualcomm.com>
 <202509070437.ko5lmTb9-lkp@intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <202509070437.ko5lmTb9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LgGTxmrgfEG5CW6isxZj9FFxEWahVC5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwNCBTYWx0ZWRfXwqL8NXa0m1oM
 SFN/f7RXkrt1+e6UjKe8FjHRoNQbA4y6C0qux8zCyNFzm1F5FXrP30DUFFCEBaYh/qtI2QEWPLF
 RbUfAnCCaPJX8m5mjj3L8eBDf2I/EmPonqV6pbvvQnH3SL8RpHCYpS8CIRGm+62o/BarSkuAQyO
 7QNo3q9kvV1bguJms4QBxNiEj0VWBqXDSeOfL2G9JFwwt5HT/ReJ6epMsuM2BParv6Zp/qTBvzk
 eZhOe0OnTUzJPR5iul7hQJ2NmROM3zZiZ8g14S44WzBtnfPzB2hK8veh65Iavb4HRglXoWb5aAC
 +n88sUj5qMsw83D5OWVJD/sWpS8dNlVtMFVZB+tnFDxtpcuYu+sN9H5c0ZbB07/aP9WzQBeisNM
 pjI/+RyA
X-Proofpoint-GUID: LgGTxmrgfEG5CW6isxZj9FFxEWahVC5u
X-Authority-Analysis: v=2.4 cv=CaoI5Krl c=1 sm=1 tr=0 ts=68bd541d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=wfQ5NbLlidWtoCwthVsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060004



On 9/6/25 9:23 PM, kernel test robot wrote:
> Hi Srinivas,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on broonie-sound/for-next]
> [also build test ERROR on linus/master v6.17-rc4 next-20250905]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-wcd937x-set-the-comp-soundwire-port-correctly/20250905-234841
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20250905154430.12268-7-srinivas.kandagatla%40oss.qualcomm.com
> patch subject: [PATCH v3 06/12] ASoC: codecs: wcd: add common helper for wcd codecs
> config: x86_64-buildonly-randconfig-001-20250907 (https://download.01.org/0day-ci/archive/20250907/202509070437.ko5lmTb9-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070437.ko5lmTb9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509070437.ko5lmTb9-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    sound/soc/codecs/wcd937x.c: In function 'wcd937x_mbhc_micb_ctrl_threshold_mic':
>>> sound/soc/codecs/wcd937x.c:1522:20: error: 'struct wcd937x_priv' has no member named 'micb2_mv'
>     1522 |         if (wcd937x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
>          |                    ^~

Thanks for the report,

Sorry about this, I was blindly assuming that wcd937x was part of arm64
defconfig. And there was a typo in the header too,
This is now fixed in v4.

--srini

>    sound/soc/codecs/wcd937x.c:1525:61: error: 'struct wcd937x_priv' has no member named 'micb2_mv'
>     1525 |         micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->micb2_mv;
>          |                                                             ^~
>    sound/soc/codecs/wcd937x.c: In function 'wcd937x_set_micbias_data':
>>> sound/soc/codecs/wcd937x.c:2432:34: error: 'struct wcd937x_priv' has no member named 'commmon'; did you mean 'common'?
>     2432 |                         wcd937x->commmon.micb_vout[0]);
>          |                                  ^~~~~~~
>          |                                  common
>    sound/soc/codecs/wcd937x.c:2434:34: error: 'struct wcd937x_priv' has no member named 'commmon'; did you mean 'common'?
>     2434 |                         wcd937x->commmon.micb_vout[1]);
>          |                                  ^~~~~~~
>          |                                  common
>    sound/soc/codecs/wcd937x.c:2436:34: error: 'struct wcd937x_priv' has no member named 'commmon'; did you mean 'common'?
>     2436 |                         wcd937x->commmon.micb_vout[2]);
>          |                                  ^~~~~~~
>          |                                  common
>    sound/soc/codecs/wcd937x.c: In function 'wcd937x_probe':
>>> sound/soc/codecs/wcd937x.c:2897:41: error: passing argument 1 of 'wcd_dt_parse_micbias_info' from incompatible pointer type [-Werror=incompatible-pointer-types]
>     2897 |         ret = wcd_dt_parse_micbias_info(dev, &wcd937x->common);
>          |                                         ^~~
>          |                                         |
>          |                                         struct device *
>    In file included from sound/soc/codecs/wcd937x.c:24:
>    sound/soc/codecs/wcd-common.h:25:50: note: expected 'struct wcd_common *' but argument is of type 'struct device *'
>       25 | int wcd_dt_parse_micbias_info(struct wcd_common *common);
>          |                               ~~~~~~~~~~~~~~~~~~~^~~~~~
>>> sound/soc/codecs/wcd937x.c:2897:15: error: too many arguments to function 'wcd_dt_parse_micbias_info'
>     2897 |         ret = wcd_dt_parse_micbias_info(dev, &wcd937x->common);
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>    sound/soc/codecs/wcd-common.h:25:5: note: declared here
>       25 | int wcd_dt_parse_micbias_info(struct wcd_common *common);
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>    sound/soc/codecs/wcd937x.c:2905:31: error: 'struct wcd937x_priv' has no member named 'micb2_mv'
>     2905 |         cfg->micb_mv = wcd937x->micb2_mv;
>          |                               ^~
>    cc1: some warnings being treated as errors
> --
>    sound/soc/codecs/wcd-common.c: In function 'wcd_dt_parse_micbias_info':
>>> sound/soc/codecs/wcd-common.c:34:41: warning: '-microvolt' directive writing 10 bytes into a region of size between 9 and 19 [-Wformat-overflow=]
>       34 |         sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
>          |                                         ^~~~~~~~~~
>    In function 'wcd_get_micbias_val',
>        inlined from 'wcd_dt_parse_micbias_info' at sound/soc/codecs/wcd-common.c:61:26:
>    sound/soc/codecs/wcd-common.c:34:9: note: 'sprintf' output between 24 and 34 bytes into a destination of size 32
>       34 |         sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +1522 sound/soc/codecs/wcd937x.c
> 
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1508  
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1509  static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1510  						int micb_num, bool req_en)
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1511  {
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1512  	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1513  	int micb_mv;
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1514  
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1515  	if (micb_num != MIC_BIAS_2)
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1516  		return -EINVAL;
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1517  	/*
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1518  	 * If device tree micbias level is already above the minimum
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1519  	 * voltage needed to detect threshold microphone, then do
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1520  	 * not change the micbias, just return.
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1521  	 */
> 9be3ec196da41b Prasad Kumpatla 2024-05-24 @1522  	if (wcd937x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1523  		return 0;
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1524  
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1525  	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->micb2_mv;
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1526  
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1527  	return wcd937x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1528  }
> 9be3ec196da41b Prasad Kumpatla 2024-05-24  1529  
> 


