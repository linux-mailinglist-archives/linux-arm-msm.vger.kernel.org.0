Return-Path: <linux-arm-msm+bounces-89618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7373D3A637
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E483C3003FAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4143590BC;
	Mon, 19 Jan 2026 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mru5XJnv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kb6Pdx03"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DE92D29B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820774; cv=none; b=PmHMPaN4chRrQrNXgBi4LsGotE51oJjO82k3Y60iNpJBFuEKjgbdCW6srBylE3/+g1fKXePiQe+fq8OlDyFtDghioh64X9O9MZC25a1sSldoo40JB/LVpbgJncxcDEdoskY70kNknW/4qgahHNWcZKjerPl9rcLv3ME8s+gv54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820774; c=relaxed/simple;
	bh=elY4oQIOKlfTb0ZU02BR1L+VR/a8AxqpbQpoBdamc38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+UInefZMHtgagAlteXAyZF9E2EpxGnNBhtJ1Tu2rfgI00iZY8E9bnWPPDiCdsGbLAyI0zBz6E2ZMlWFM1REUe7ubt5wmpEBaLKYw2QoQNMzEikcG1NYf3WHTdqLailPvh2s39L/EX/+WAgZAa04B6yKEee92wv9904FL1FBfXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mru5XJnv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kb6Pdx03; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9ngwG2966460
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pMmSR3h0zRY82QaIDVYb0RWT
	fU7J/2LftOD27trKy+M=; b=mru5XJnvZLIEsyvlZfN+zkT1AQlt74REJPOn9fUq
	YLDkKW5GfzAyYQMhUohul9IKvuH/HfT2z1l2OpAGch57jMCeVC+QoeYw3SL5wdrA
	uGr7SiuUgKlmEDx8ya9ut57iTmIFSNRK4M1WCu+c4xPUkJwbxjv4EIMv5hmLXi05
	HkfgTgk5an4M4HnobFUzPxfVme+dzAvWOf++scTju0Y/KjuPIN7xtzIf4Sw1vE0c
	4rl+5wF0L1TmWbsYTdcRd6ASbBKuKZcBKSSXW859gT/BrV954+NKQsZOHx4rKBqJ
	01+PMw7C60nDl5U3wgTZdMwMpS3DYUXzvUVRcwiK8Cv6rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa885r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:06:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a7fb4421so668407685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768820771; x=1769425571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMmSR3h0zRY82QaIDVYb0RWTfU7J/2LftOD27trKy+M=;
        b=Kb6Pdx03e5SBVBxO8z2x8JeQ92GOmtc2/PKVf28jwpikFhzbMQfFXCPvRxB/FQ7mZe
         Cka5kwbftkMU5Lb68uJYqH9R9cQ3GfQ3kgfu6MY5nY+2s4nhaLGEMWpFnEJOLegiQ+QB
         PW0Xg+SSp31frXhFFkvFPwCOBoAg7TYT+ekca6+7C9xqsddMkuDgZoBBthfsTtnTgdls
         BGWTfxxixeditpi00njOYpZUdo93ym0D6DBJPpoevNaUAjab0syU7gaHb24PjmtMWBPg
         es9LedXuXf5RgcGrWSNgAfxwQoue8saqW5cT7GzRZAs8C5W47G/vgbEVv1x2qoh5G/4y
         JGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820771; x=1769425571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMmSR3h0zRY82QaIDVYb0RWTfU7J/2LftOD27trKy+M=;
        b=S9XA+pCCM+ob62mjlSWY/NydPMCPF7OpXqSSVBO3ArRsblw4fRR/3poTnLL6M5ty7p
         SazSTlw45pdp3yG0Ce+K3fNDBXOZeyeRkYSqOL1FYp3i31bcVh1pU6fUyE1Gw19UJwy6
         wUapczbRikbQDiiLXJX1NawSWP41Qo5ztYwXcIsaHK/ANVemT4RpKcS28bJybjlFyNLR
         NFRoVWjK4WgyotnArL3YPHXlmGtY/6MBK8nCrkXDPesI1KpKyCrBPgeIhFH4oGQM7dOL
         Obdy9lwwFhzjiTvoVjv6NRHAbO9/iI+LSFk8oAt0OSmMLYr0R6Sg3HkQaWd9PEIDQ2DK
         fmTw==
X-Forwarded-Encrypted: i=1; AJvYcCWPMsWZ/Hhkwc68N8Oq7ErEV0sa0ACnv60a7B4TIpIOgBUejxlCGvdAJMccmHBTiFxKWlrvjMjTZj8fKQIo@vger.kernel.org
X-Gm-Message-State: AOJu0YxB9YEr/uwIhK0o6so8gckDjntM6mcrlkIKSQJ39ne2GSPuRV/o
	9ujaaku+D3Z8vcOAi/pldCtbMNsM5DdQ1T7qZOtUq9BoF7dhOsmdAJOH9snKGgRWktIw0dVbZsh
	e+M89FZNYtCOCRmq53ihDJIXGapSTTe4jYukRI4+WEqPRaX4kdblT7MYN6N2nug/WXsWn
X-Gm-Gg: AY/fxX59d4+Yz+AFJr+v9mRMb805zOe4y+ppBykX7xWkNM3pecmxPsSm5IRnYeum/jm
	1AH4mOK93054FhGYzGiig4LRcoYWDlnSicEnEfyQE79o9M+e84rgpPXTt+DzGMPB9nNrp4qdmCB
	kRAW+bEHSMPaiaUK6By5W6O33++SByCXrBISykRaNfQfjpybxbchws8hdtA55SzBp4GLA6KMmKZ
	8QLcg7MduAB95XkX2fFW3iyS0H3Fv6jvJGaoStcs6zXUxDZqYE0V4jrA9hY3/1D74kLFiE1Deyb
	LegjWs5P2rJsqI5bHOYPNVAIcR7Np53wfTPOqHtEcG0NRFUyRG7V9y4UI3JovNt0izSmdA3wCzC
	nwAxPjWDa3wdJK6dQmxwRY9rbWDbZlAgqX6tWHnR4OuOEFte9HTLR2nZ9fhOkCfinIww89kJObW
	E4IW/ZiRJ57oJl4G90H6vJFvY=
X-Received: by 2002:a05:620a:2993:b0:89f:5057:974d with SMTP id af79cd13be357-8c6a66c825fmr1494233085a.10.1768820771506;
        Mon, 19 Jan 2026 03:06:11 -0800 (PST)
X-Received: by 2002:a05:620a:2993:b0:89f:5057:974d with SMTP id af79cd13be357-8c6a66c825fmr1494229685a.10.1768820771018;
        Mon, 19 Jan 2026 03:06:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d36dsm3184496e87.25.2026.01.19.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:06:10 -0800 (PST)
Date: Mon, 19 Jan 2026 13:06:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, ulf.hansson@linaro.org,
        ebiggers@kernel.org, abel.vesa@linaro.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4] mmc: host: sdhci-msm: Add support for wrapped keys
Message-ID: <yrvjt3eczzgqe2qukcqgxfpyw3te3a7v4gdvpx42hmlrxmacuz@lc4nsrybj7lu>
References: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>
 <3a93822a-6ca1-4cc1-be12-38b2b04704da@intel.com>
 <23c9f3b9-f575-5bc6-e7f0-46238c26a7e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23c9f3b9-f575-5bc6-e7f0-46238c26a7e5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MiBTYWx0ZWRfX9kd6ej7bSD7f
 uQPZw19DuC2SqEhvN8wQgQmMHq5beu53BEuFpwIJzDFsKbga1/i8X85wQ1ZW+u7TRJviMTH2/Kp
 RRrs+D0w3ktgyIbrkv2oVrr4hxFKkzG3sTYDkSFUYshKV2Klk2IF8XRDttRSXeVKQiXyhiA14bR
 ELZDIdXfnfasEYYA111gABVzilsZrlYV56M67g6jRus82bEZKTzXBwb34eApypy3Da5MREI+OHW
 Mb5lQoV0loAAFa4mpFrA6KJtYdbXdkyEChVzeSuWD7SL8RVZdZmnRqriwyxXZQ7jbuxrvKbFrco
 TCcxQ2ALQboz2e/iY2kFALIWjAtlImD0KX6g+kMFJ34egtO2K2Hkkx/Xz8PKztOFJ1X5kX1j1dV
 TzKxx5I3C5iejzRSakXn0HfAYOsLGjPa4Ge1vvaOJ+fhqH/7DPb4lsMs92coSmQmHPOyIc4C2Qq
 L0crneZ+ddj//JXPkJA==
X-Proofpoint-ORIG-GUID: yoxnqIk-cW4Ph6p1InRs3xx9aS7Ak4V7
X-Proofpoint-GUID: yoxnqIk-cW4Ph6p1InRs3xx9aS7Ak4V7
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e1024 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=34prnIKLCCa2sR58KicA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190092

On Mon, Jan 19, 2026 at 03:49:19PM +0530, Neeraj Soni wrote:
> Hi,
> 
> On 1/12/2026 12:35 PM, Adrian Hunter wrote:
> > On 02/01/2026 14:40, Neeraj Soni wrote:
> >> Add the wrapped key support for sdhci-msm by implementing the needed
> >> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
> >> blk_crypto_profile::key_types_supported.
> >>
> >> Tested on SC7280 eMMC variant.
> >>
> >> How to test:
> >>
> >> Use the "v1.3.0" tag from https://github.com/google/fscryptctl and build
> >> fscryptctl that supports generating wrapped keys.
> >>
> >> Enable the following config options:
> >> CONFIG_BLK_INLINE_ENCRYPTION=y
> >> CONFIG_QCOM_INLINE_CRYPTO_ENGINE=y
> >> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
> >> CONFIG_MMC_CRYPTO=y
> >>
> >> Enable "qcom_ice.use_wrapped_keys" via kernel command line.
> >>
> >> $ mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/vm-data
> >> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> >> $ fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/vm-data > /mnt/key.longterm
> >> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> >> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> >> $ rm -rf /mnt/dir
> >> $ mkdir /mnt/dir
> >> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> >> $ dmesg > /mnt/dir/test.txt
> >> $ sync
> >>
> >> Reboot the board
> >>
> >> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> >> $ ls /mnt/dir # File should be encrypted
> >> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> >> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> >> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> >> $ cat /mnt/dir/test.txt # File should now be decrypted
> >>
> >> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> >> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> > 
> > Doesn't apply cleanly to mmc next.  Otherwise:
> > 
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > 
> Is this a blocker for the patch to get merged? I will anyway see why it is not applying cleanly on mmc next
> but wanted to know if this is necessary to resolve for these chagnes to get merged in Linux-next?

Please read the internal documentation on the patch flow. The patches
are not merged into linux-next. They are picked up by maintainers (e.g.
Ulf) into their trees (e.g. mmc).


-- 
With best wishes
Dmitry

