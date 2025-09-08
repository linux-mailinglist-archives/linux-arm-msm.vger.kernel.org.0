Return-Path: <linux-arm-msm+bounces-72481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96EB48540
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7790C7A57F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328662E2DDD;
	Mon,  8 Sep 2025 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFFQD70t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134C219A86
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316661; cv=none; b=mqYsp/AxUn2ylG7Jdh+FsNhQ2EdqTnJjU+sjBG+gcWIe/F14UmQ/mnqI7BQI2Sp8ldhnCnNFlClZhSm2nDQCFxM5Gz+Kb8O/qZyWi0wPMnxFj1kKh1OiUx5TcJY3l3XcpO11Wnd+W/lWz0H95r/BXg7Wh+Q/qoMH+2N6KkHlJOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316661; c=relaxed/simple;
	bh=Tyh1zDni5S8jgRqwErLsylux7AxcdyPvaTtJMcfwc54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyCMj0rPmPgaask8v5rmalMNWwDhZWAKqam/LwCVxkMT6HJ4JjXyT4Tu+bwc9ktJgdPbp6OueFaEroPa5HgS+686dSzzhOJFTM4FKyElHUcMxT9OSW9wNGfr+1ivTveReMNU5mNr8x5qSInvyaRdnVFaAavvdyo6f6Lb1P6ZGv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFFQD70t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NOo6D018353
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 07:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0epY6YU9RGxckWtia0nPq1VOjyxmvPEuFA73sxSG2qw=; b=JFFQD70tlTc8jlEg
	Sp3k5BpgkCOlNEhcmzs1rMqNUgkU7gFyRJ8Qpc+hTkcHgR/s8aPJ5ALWtAnM8I1g
	Tm+o+itQedHkFdBZwRgyzfWXkOSYVV4G0ucrKG+ef/c4VM8l6c2QDguOGLcN7vd9
	gQmrmQikeTelRsrG4kx223zNtQTuiSF23r60nrFwMyKeNLEtF3nuVdLoq+ikYZ8f
	/uGnKw8F8SFoZbHAdqfsYfG6VFU74mkYwY3pagXRbGWDiJZn6UWeGYM2U+QlEGMF
	OZzF2Uxn/5cqwnULEl3lnPOqEoKkiOure5N36MSQVvUt/g+za4UB+4v6J8IITCY+
	xTWX/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8bn61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 07:30:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f818eea9so44690421cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 00:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316658; x=1757921458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0epY6YU9RGxckWtia0nPq1VOjyxmvPEuFA73sxSG2qw=;
        b=aONUMgvgGQimOUHfeKeYFflBIqWd9Rexm8E2YOzV/ODzJ3FqBKmrxfH6pukCTIl0yC
         QFep8L8yZf7G8poJWC1jLmlNlLGCz8Bib8lj/coe5JIYyLneWyGdhz3hKdKqgFPHrCZY
         pweWeSX/wrQOqr9ZIVLzS5xepFQ2GVTLNJXB8UT9WAQCxl/uORcr0OP/XNohGGLzJELr
         iyT2vQGtrG4tIY1Z/LZG/2suAnm/iBgl+RO8Pr5KtSqhkUZSmIdxtz9Wxf7+Zc83sPbm
         OJhSe5B71rPlUrD7XHeul++Wd/G45kGFsrrfjs+l4Y9oSKjvAgNRg4qjkfBXWsd+Sj6m
         O+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUQc9aiQTssAbiyDuagP+igHSG2QwezZIjHZRza6j0unXPITHOAHtXO6kIgZbexKpIm0hBfZ3els1WPHbtP@vger.kernel.org
X-Gm-Message-State: AOJu0YxaL2knpRdDQhyXbsiqzoKF9MPQpBinGkRNyTtZjt/LP3eaP0XP
	9KNisXsBZwaqMAtlSavkNgoRVv6PXzX/C9U7gQEnQgoIokOfh47hqA8mohp8Z4kXi9qyaofiP1g
	PDLCOTQO3uxo1dSEFPh13TWCH6viaNoqMiWSYh+6WnbEuvzad8QWmvZCuXlmjMX8NnOPz
X-Gm-Gg: ASbGncsaSyptKhaS8ekYS7bEbnhXNkRza8tmr9G2q3dhDnH33WLi0tDckq5KsWbeEs6
	eTzee4g4Om+kQHmc7taaPfsmhSqIVFWQdqq79rpBIRvgE2N6kypujEwbUf7yYQLqkZdCDy6MK53
	nd3uNVMzXEWSiRVb4iWxsiJ4fHAB+QEYeeIqKqHhp7B9a1crWaSf4yqGHCG93z1RAKslbzO6vOu
	23C8i8BdQR6X+pxGvswRJKSPfmyEh/lIhTAFNWJdafI++syt1ntEM9mUOaNoeLIr60wr9fdoEju
	3OGATMBW7wHww6u1326q26ylYbUtc4c13uuMAejuZU5vbYbJ3+L2bslNf2YjPVL7Zjc=
X-Received: by 2002:ac8:5a8b:0:b0:4b5:d739:6077 with SMTP id d75a77b69052e-4b5f8445b09mr83194111cf.41.1757316657529;
        Mon, 08 Sep 2025 00:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1JPR4PfJ/rf6grklM9vccNdBWfJgn6bV4FHqQByIM1t9B/i99IyFfm4pPOqnq+ZTAa+vitg==
X-Received: by 2002:ac8:5a8b:0:b0:4b5:d739:6077 with SMTP id d75a77b69052e-4b5f8445b09mr83193511cf.41.1757316656824;
        Mon, 08 Sep 2025 00:30:56 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e748b38be9sm3039508f8f.47.2025.09.08.00.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:30:56 -0700 (PDT)
Message-ID: <deebd6d5-0c59-45e7-a2da-4c2c1ff6ab48@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 08:30:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ALSA: compress_offload: Add 64-bit safe timestamp
 infrastructure
To: Joris Verhaegen <verhaegen@google.com>, Vinod Koul <vkoul@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Baluta
 <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc: kernel-team@android.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org,
        linux-arm-kernel@lists.infradead.org,
        Miller Liang <millerliang@google.com>
References: <20250905091301.2711705-1-verhaegen@google.com>
 <20250905091301.2711705-2-verhaegen@google.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905091301.2711705-2-verhaegen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX9fIENW+azgoE
 /FaViWzJytK/+6IcTCnVrq88JOY/OUPYrgdJXaosSPkLqRBtbcXPdOu1OQFTGOx21oW5RbJv7UE
 hxoDifqyXxBxBvfshUItZZoCiFBbhVWibYg7AImUVeM5k4d4X2lkmw6b6bN+wZF8OWs+odw/A1z
 Sk61vZAfVL3y4B5PkEuCZlLIMjy8V9YWcY+NhtWdCEuKzf7L0lZF27/S8TOrQfmiVB2rUlVl1cD
 QI3AaXXN81E1tkQZM1xfpx2nnROfv97/+Qzi/uVRTqdApS94nxoZyeiBO4rw9Qhkg1rhKluLhgb
 9wIwfStjnyP3KWvRfL3D2GC3GvdZ6Vo+db82DsC8Ra0LRHDFCje2Pq5c8CGs4UXsyycGwVm5fgZ
 pzAwARX4
X-Proofpoint-ORIG-GUID: vLky3GZW2UqwVN_0fSaEMsBdD8oBgaX0
X-Proofpoint-GUID: vLky3GZW2UqwVN_0fSaEMsBdD8oBgaX0
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68be8632 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8
 a=4O46WkZMOCDH73qdsaoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031



On 9/5/25 10:12 AM, Joris Verhaegen wrote:
> The copied_total field in struct snd_compr_tstamp is a 32-bit
> value that can overflow on long-running high-bitrate streams,
> leading to incorrect calculations for buffer availablility.
> 
> This patch adds a 64-bit safe timestamping mechanism.
> A new UAPI struct, snd_compr_tstamp64, is added which uses 64-bit
> types for byte counters. The relevant ops structures across the
> ASoC and core compress code are updated to use this new struct.
> ASoC drivers are updated to use u64 counters.
> 
> Internal timestamps being u64 now, a compatibility function is added
> to convert the 64-bit timestamp back to the 32-bit format for legacy
> ioctl callers.
> 
> Reviewed-by: Miller Liang <millerliang@google.com>
> Tested-by: Joris Verhaegen <verhaegen@google.com>
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> ---
>  include/sound/compress_driver.h               |  2 +-
>  include/sound/soc-component.h                 |  4 +-
>  include/sound/soc-dai.h                       |  7 +--
>  include/uapi/sound/compress_offload.h         | 19 +++++++
>  sound/core/compress_offload.c                 | 52 +++++++++++++------
>  sound/soc/codecs/wm_adsp.c                    |  4 +-
>  sound/soc/codecs/wm_adsp.h                    |  2 +-
>  .../intel/atom/sst-mfld-platform-compress.c   | 12 +++--
>  sound/soc/intel/atom/sst-mfld-platform.h      |  2 +-
>  sound/soc/intel/atom/sst/sst_drv_interface.c  |  9 ++--
>  sound/soc/intel/avs/probes.c                  |  2 +-
>  sound/soc/qcom/qdsp6/q6apm-dai.c              | 26 ++++++----
>  sound/soc/qcom/qdsp6/q6asm-dai.c              | 26 ++++++----for qcom parts

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

