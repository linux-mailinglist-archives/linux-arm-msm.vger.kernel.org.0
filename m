Return-Path: <linux-arm-msm+bounces-19611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD8E8C15B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16A572840C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5354984A27;
	Thu,  9 May 2024 19:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eid0+pze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9154082871;
	Thu,  9 May 2024 19:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715284582; cv=none; b=u/NOMLsEAZnaDAmMzrAl3/KqA1yLwAl4G3PGYV8osW512prt9REHd5T6H6LSj6PTsYeD4iz9qmL8UgF3Fzy3dGgRuTMt22WtASQRhZZVqWTqGH5Hatvve9bfPEGHaPAUldlw4o5e7aXHlVCgUtYmQ2R1gflkK6wtzm5yYxPUi7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715284582; c=relaxed/simple;
	bh=4Wcd+39Om11s8ru8Ou6OGHhyXSOIxsxL2t8MT1U07lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZP+y459BgmAG4Mde/ZwT85GQEkvJT8xbSedE14+8zihuFLOeoZ8FVUbBS6fEQihiXIUG7tXtvFr9B8H9QHoJMiN+n8bE1yh+zZIM8046gR2Obifg5oElygtMHVZC5xorFHbASnrnCioMLzjt/zStuOUlrO6L4ZZq34RCJ1irTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eid0+pze; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284581; x=1746820581;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4Wcd+39Om11s8ru8Ou6OGHhyXSOIxsxL2t8MT1U07lI=;
  b=Eid0+pze0Zu5zRp9jZHKNwtid5y40x/nf0FRLPr6p51RuW45bKYaYa4m
   ajxHKW6M1CLAFCE0q47cIMxh+GR9kY/TYBk6agAI2MxQNN4FJ37HA1Vgk
   4AwbZbrnifbU4p4I4LfaOv8J8mEfZYOPF+O2CuaQTC5YKF3srgzalf5Ua
   QcTqob8tZ0KjyAVTwKSsyGzrP/3CpW8A2N2RazwTNLJA8zXBHI7AkK+tv
   jfKj7UJVr7NDjXKqGdyIctN9HAdIb5FBGplohLee4+gFLu8VtoZS18I3M
   gLdQel++7Y2zjo39jVsSNK1D+MhxzZ5+PSACjIkgZ8J/EIk93w6bPTbrU
   g==;
X-CSE-ConnectionGUID: kF31CffVR1myW6TjvPQEUg==
X-CSE-MsgGUID: O0ms8CfRRUWF2hx81nP79Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454265"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11454265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:20 -0700
X-CSE-ConnectionGUID: ChKJjrjNSG29a/wMJpwFcw==
X-CSE-MsgGUID: 2HJ/8Hz+TV+tf3jMAIWI6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="34213097"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85]) ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:17 -0700
Message-ID: <76a943f7-d839-4378-aa12-7fb32e3077e6@linux.intel.com>
Date: Thu, 9 May 2024 08:02:49 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 26/39] ASoC: qcom: qdsp6: Add support to track
 available USB PCM devices
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 bagasdotme@gmail.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-27-quic_wcheng@quicinc.com>
 <875b643f-af2c-4a1b-87e8-80cd6f236dea@linux.intel.com>
 <b1f8b531-6041-ec11-5932-13bf17b69d0b@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b1f8b531-6041-ec11-5932-13bf17b69d0b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/8/24 18:57, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 5/7/2024 2:23 PM, Pierre-Louis Bossart wrote:
>>
>>> @@ -113,6 +120,12 @@ static int q6usb_alsa_connection_cb(struct
>>> snd_soc_usb *usb,
>>>       if (connected) {
>>>           /* We only track the latest USB headset plugged in */
>>>           data->active_usb_chip_idx = sdev->card_idx;
>>> +
>>> +        set_bit(sdev->card_idx, &data->available_card_slot);
>>> +        data->status[sdev->card_idx].sdev = sdev;
>>
>> Not following the 'only track the latest USB headset plugged in', I
>> don't see anything that discard the previously latest headset...
>>
>> If you plug headset1, then headset2, how is headset1 marked as not
>> available for USB offload?
>>
> 
> It won't mark headset1 as not available for offload, because offload
> could happen on either depending on what is selected (from the kcontrol
> as well).

Right, so the wording 'only track the latest USB headset plugged in' is
incorrect or obsolete, isn't it?

