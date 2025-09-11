Return-Path: <linux-arm-msm+bounces-73029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFFAB5252F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 02:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EAC046796D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 00:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7F71EE02F;
	Thu, 11 Sep 2025 00:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IdtYEfRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBDC17AE1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 00:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757551964; cv=none; b=FG35JqKZCQdpD6cMpxsUywFZlEACjx9GA0gPduv0JS/cJs3khzgw2Wps77+CYaPg+E2esYCJH9l2Ag1+k8JLc2JjB36fUErM/DalGesKxJJiyhTnM/70L6EPEYII5QGdGmfR1lSEL5hkto3T2KBIJfbKPGZ57/38AMPKZhiTdIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757551964; c=relaxed/simple;
	bh=n9ik6TUUZwljOCIrO/RYqlpUkEHDUTilfPvJTnkLFjo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lhPKEcRYFBdpndFzHEcDC/UOP5LyKLL1mm3jkhYFs3z7WpcSfnYAZoCFPP6hsemu3OXIk6r/IA3+lJpTr9M0oRJlAJ7cGViGVrXZY584Tjw2cmLboyBCaHnDYm+CoGswNGghhVNvsS0SrylBnM3C+96h2IZoowxMbn3rAfytQvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IdtYEfRC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso1490305e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 17:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757551960; x=1758156760; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9ik6TUUZwljOCIrO/RYqlpUkEHDUTilfPvJTnkLFjo=;
        b=IdtYEfRCg8EZY5FfRpiCNvqLrvFwT/LIIncN2dm6ZFCKS+zrNfakMzufhQRltK5hsA
         ykKDRj6dMGnRgN49Xq8CnOhdMKbJ6oPen+IyWhL5PRliHu/0Nfkq2JdfDVbx217frmuR
         SVMAS14PK5vnCLxEXlVB6WNvyP8UOC3N8vJkHIRJKsn23Dx2EoeW0A0w92qryJrJeIhC
         cQB/ercNCjV2ttkHknqgGRGq2EFL1cRXjlnkP0IHbQogyX76XC+FLWA0fdDl76nlesX9
         rIdwJM6IaJWz9m3kRKB4n0IhieA1z35KTVm5axIMgnrRUub0/bQ7EIvUnMC8A8B9m5EX
         Nxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757551960; x=1758156760;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9ik6TUUZwljOCIrO/RYqlpUkEHDUTilfPvJTnkLFjo=;
        b=ACAKp7nAqyRM4qGxDaZMPE3oBbN/TEzABFkq6RDJGAYkHv8DNXKbXX4ReJPzNUJXvI
         PELO65U9gbUAWP34GxU/AN4hDtSgqi1euq78pzKb3xjQ/j6xZDo9bKqP9O7f5jljg+nl
         MpzaaV3w1EQqGjc8f9UlK3HJbnszCO7dNSX9UVJyEGz8Se22GkVsH0HKacHXX3XBs+Y8
         zC3+C5CSeh7hzw7Ugd+bisrFHXSDDAGNWWRaCJmsttA7wQC2mDQkKpnsTHyJN4zT0gA4
         260EUMqM/1Lxpo4P+vbpm/wHVqPFDYmr1OFWKk9wdk8fMkU8D+qM6L5h2sbwXeJdu7ZM
         zQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJHgTajg/9KsvEg8wjuz1bH9+sEAIVtg4XnaetVYstvS4gZxcW0lp1CUFK74JUSQFpw8SccLkTd2+FpMaz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzy4fCizKW1U5r89bqfUg8UtH4a9j8qXe4+T/UJ/KSednnhcK8
	u6jtNiWRSdtse2OYmsVwXuD1zLhI0ahX+hcW8G9u8as6HQQBIX0vbVVbm1me/yaL72s=
X-Gm-Gg: ASbGncvFAB1s0qYsTwyymTIIluK3CXp/ItIneq/TBF993XBlGnzoLMSao3c4WRyUaDk
	lfMxpwCBa4C/c8LHgI+gflQ9mo39a9xID3HaUEBNT/Pfzt2Z8u/sBy8dct5L9iUp9/24ZqoJHcq
	jX/r4S7tWcylHXkEs0RhwBIftXbABjBBxCkioPW1sk2QeJDFdzzLOGQKekZ0O0FwsXDTzUSuLMC
	byt0FoH9VLJTlixl74JwKsdG1sH0rbJ8EGLqirVtkEZ+tO7I2Xr8uEd+0Rm9/LuCDc8E7dpxzZr
	ZxdByGQMQwyEg5/MfSWOgBPi7OJ4J1N3msVZDRB41hxSfeiBL0q0StlPmHUO/jEVfsfn6S5hSDh
	MKZzqCic4WIczEkbaJtArM4GHtV26cLbjhAjFjA==
X-Google-Smtp-Source: AGHT+IENdiQzRqD0ilOksClnHzZl9EP7+Iq2b/6pNdScPtqokFRIwU5MWit31uB/hgllOsIIQBjxTQ==
X-Received: by 2002:a05:600c:3b8e:b0:45b:8039:6196 with SMTP id 5b1f17b1804b1-45def8828d5mr85496425e9.4.1757551960624;
        Wed, 10 Sep 2025 17:52:40 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:a727:6a46:52e3:cac2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017bfd14sm6363865e9.21.2025.09.10.17.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 17:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 01:52:39 +0100
Message-Id: <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.dev>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] soundwire: qcom: add support for v3.1.0
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <vkoul@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>

On Thu Sep 4, 2025 at 11:56 AM BST, Srinivas Kandagatla wrote:
> This patch series adds support for Qualcomm Soundwire Controller
> version v3.1.0.
> As part for adding this support, a new macro of_property_read_u8_index()
> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
> the register offsets, new entries are added to the variant data.
>
> Tested this patchset on X14s and Glymur reference platform.

Well, I don't have any Glymur devices and no idea what is
x14s (I guess some laptop), but I picked the series locally to test
on sm8550, it seems there are some generic changes, and
qcom-soundwire probe failed:

 remoteproc remoteproc1: powering up adsp
 remoteproc remoteproc1: Booting fw image qcom/sm8550/adsp.mbn, size 8364
 remoteproc remoteproc1: remote processor adsp is now up
 qcom,fastrpc 6800000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no=
 reserved DMA memory for FASTRPC
 PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-=
id: 1
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iom=
mu group 12
 qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev=
: gprsvc:service:2:1
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iom=
mu group 13
 qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev=
: gprsvc:service:2:2
 PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, tran=
s-id: 1
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iom=
mu group 14
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iom=
mu group 15
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iom=
mu group 16
 qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
 platform 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu=
 group 17
 va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry missing
 qcom-soundwire 6d30000.soundwire: probe with driver qcom-soundwire failed =
with error -75
 sched: DL replenish lagged too much
 platform sound: deferred probe pending: snd-sc8280xp: WCD Playback: codec =
dai not found

Are there any dependencies I am missing?

When I reverted the series the audio started to work again.

Best regards,
Alexey

