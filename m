Return-Path: <linux-arm-msm+bounces-73221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 012A9B54267
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A95933AD585
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEA723A9A8;
	Fri, 12 Sep 2025 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ss4kApD1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52997221710
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657073; cv=none; b=pE1PZ3+vX9zyr+44909nR7241f1f51CoraDcLRjUDCO8o2GcLfnJLPkadmif4+uuW+wBa+MAVaBTqewhxDLX6ouPTyX/G3zIrELp1Z+cF5UXnf6VAD/KoAtZsh+ztqvAKv1JF2zNIpoAXK7ReTW+RDzCoe6uuBjqHjLwP1Z8ya8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657073; c=relaxed/simple;
	bh=H+RU3ZpZ8JE6vnvoBeHrWfO+WMqcoDe1/PcuQn5zuq4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qaXId1xq6Zp8z06ppXfNVgdjkuNzJME6t4Qvg+trt2vjFwf1UvbFfqxB9ddCOYvHBA754neWuXLvkfsazMZ9/wEF2uVPIsvjCLXJ+wAwxt5+GjvbxvmbxQbilpy7Tlti7dLWUCWKp8+EAF61n00bj4a50eJgTyjybWibMKzYXiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ss4kApD1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so12983365e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 23:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757657070; x=1758261870; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMSrpAntLDN0J/x7YsZShEjIcXiiRe6na509xuS9GSU=;
        b=Ss4kApD1rVBIvzbrjJmAnorfcWwCD0A2Ya0B3ZvPZhssYDkD1YjqLjksD21nPAfpcC
         O8UnoELF3gtS2FPpAvW5ydyqwpWhMODIFbGkuIwv668aYA9KR9e3molBjqm6LR14dYw4
         j6dPqM7wToZAni6U/zfTajM/+0v4ITxB4p1s1BNQCb/1U0LuXtrvUvoS5NvSWvnb0htm
         Yb028LQdf//nrubqJzxh2b5H9SabOkLkJqe6IGZaCqhNnEe5rLFsTDLNoVlSYEuIXXtG
         Iw8L3q3SY1BvQPpNumIa22KhRZDUOnaNiEzV8q8ppZOMcMweZ7rAH8WXM7hUlyj7KwsO
         J/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757657070; x=1758261870;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZMSrpAntLDN0J/x7YsZShEjIcXiiRe6na509xuS9GSU=;
        b=JEUZgVldNIDYh178dferlD4oHirTcsGuvFMzM6NzkEWQMa7zlr1z9DzpPJMR/mRhUe
         BCJtcJfTZRfMw11KClLp+vBPWexMHGQE15tiJbemSVIC6yvN7OrpmgTcIMkugmVK+d7h
         FYobe0b8AVd5zRxmNsuAVLkvoqLVQEMgJwJeirCevDSIVm1HD65WcFtN+lJNmlOpNK3b
         I9vzZGTBtGJA6UKGxXoId2XTqm+7jqkocZXmOy5lyis0tBNZdH7cJB4syEpK94gZzC0P
         /S8iMQpaw4N2ZT78EnCcHPnwRusC3OytMVW2GUcDdFSsScOryde7D/QXsunk5qNaRxQ2
         iMiA==
X-Forwarded-Encrypted: i=1; AJvYcCWrLzn71CfuC9EZalnb4Ax/A+ofQclC41vXOcSnL+xsRZ/7oiCa0RpGL131QBnw4EG55Dl9snS9O6pK6KiK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8EBAgT3QOWLvzrdElc81QWftLQSjDEztChaC1hNTsF5Dwu+tx
	WR8fmdQjbMse16977t8kpChMR+4Ir8Qzh3Qxo32qD4PCjmMKevQORAsGrNnUm/Bj3+A=
X-Gm-Gg: ASbGncvkDSUU7aR0FW8zqPVY6qfRCvgZMXIjV1nmGvExG0jy3ixLgpd6c0JPEEPDlQp
	CKdcp/TRRUfZodwBGQWIGyQPSXXRoMMISbZAF4sbQvtAK2SlbsoqXWN7kqBIT6Rzbo0OPSGTU8L
	EpsDWkv7O0o5fGvqtahx/sdPXjav2BNvY6BBU9Y//7E+Glvp8T1KwIy/pq8Cb1lpEp1auCyt15N
	zA8C3jJxyRZObH33A2QnyIfXovtF9Ix8J3AgWFIHPrDOxjEygnJU58Uve1+lEeZBaO/5NUL7/rg
	Rc/7eD+3/S64C78HQ/Bkz5zLEGg4q3WxbCoYfWHQ/peVKjmpOAVNerHa8V3PPy9YWZMX3K+W48v
	vNfN29JcmiiM5xlIueOMLsPzPfloQH8NzW6PYxw==
X-Google-Smtp-Source: AGHT+IE31yVvyDzbJ7EarCQENdlqCBuPzVEk6j9xu/i/DAWm+fQyejmawmcytqLXbFpTGy+DBQDCMg==
X-Received: by 2002:a05:600c:1f13:b0:45d:d79c:7503 with SMTP id 5b1f17b1804b1-45f2128cc58mr14815135e9.12.1757657069498;
        Thu, 11 Sep 2025 23:04:29 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7fc8:312e:f611:930d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1455sm51921785e9.24.2025.09.11.23.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 23:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 07:04:28 +0100
Message-Id: <DCQLFI5WVIPR.192CD0VMBLD8Q@linaro.org>
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
 <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
 <b7a637d1-8868-40f3-8f82-8f5ab0684d52@oss.qualcomm.com>
In-Reply-To: <b7a637d1-8868-40f3-8f82-8f5ab0684d52@oss.qualcomm.com>

On Thu Sep 11, 2025 at 7:16 AM BST, Srinivas Kandagatla wrote:
> Thanks Alexey,
>
> On 9/11/25 1:52 AM, Alexey Klimov wrote:
>> On Thu Sep 4, 2025 at 11:56 AM BST, Srinivas Kandagatla wrote:
>>> This patch series adds support for Qualcomm Soundwire Controller
>>> version v3.1.0.
>>> As part for adding this support, a new macro of_property_read_u8_index(=
)
>>> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
>>> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
>>> the register offsets, new entries are added to the variant data.
>>>
>>> Tested this patchset on X14s and Glymur reference platform.
>>=20
>> Well, I don't have any Glymur devices and no idea what is
>> x14s (I guess some laptop), but I picked the series locally to test
>> on sm8550, it seems there are some generic changes, and
>> qcom-soundwire probe failed:
>>=20
>>  remoteproc remoteproc1: powering up adsp
>>  remoteproc remoteproc1: Booting fw image qcom/sm8550/adsp.mbn, size 836=
4
>>  remoteproc remoteproc1: remote processor adsp is now up
>>  qcom,fastrpc 6800000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1:=
 no reserved DMA memory for FASTRPC
>>  PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, tra=
ns-id: 1
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to =
iommu group 12
>>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR =
dev: gprsvc:service:2:1
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to =
iommu group 13
>>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR =
dev: gprsvc:service:2:2
>>  PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, t=
rans-id: 1
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to =
iommu group 14
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to =
iommu group 15
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to =
iommu group 16
>>  qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>>  platform 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to io=
mmu group 17
>>  va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry missing
>>  qcom-soundwire 6d30000.soundwire: probe with driver qcom-soundwire fail=
ed with error -75
>>  sched: DL replenish lagged too much
>>  platform sound: deferred probe pending: snd-sc8280xp: WCD Playback: cod=
ec dai not found
>>=20
>> Are there any dependencies I am missing?
>
> Can you pl try this change an see if it helps,
>
> ---------------------->cut<----------------------------------
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a7b6d9ecc3ba..622cc6c31264 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1426,6 +1426,26 @@ static int qcom_swrm_get_port_config(struct
> qcom_swrm_ctrl *ctrl)
>         ctrl->num_dout_ports =3D
> FIELD_GET(SWRM_COMP_PARAMS_DOUT_PORTS_MASK, val);
>         ctrl->num_din_ports =3D FIELD_GET(SWRM_COMP_PARAMS_DIN_PORTS_MASK=
,
> val);
>
> +       ret =3D of_property_read_u32(np, "qcom,din-ports", &val);
> +       if (!ret) { /* only if present */
> +               if (val !=3D ctrl->num_din_ports) {
> +                       dev_err(ctrl->dev, "din-ports (%d) miss match
> with controller (%d)",
> +                               val, ctrl->num_din_ports);
> +               }
> +
> +               ctrl->num_din_ports =3D val;
> +       }
> +
> +       ret =3D of_property_read_u32(np, "qcom,dout-ports", &val);
> +       if (!ret) { /* only if present */
> +               if (val !=3D ctrl->num_dout_ports) {
> +                       dev_err(ctrl->dev, "dout-ports (%d) miss match
> with controller (%d)",
> +                               val, ctrl->num_dout_ports);
> +               }
> +
> +               ctrl->num_dout_ports =3D val;
> +       }
> +
>         ctrl->nports =3D ctrl->num_dout_ports + ctrl->num_din_ports;
>
>         ctrl->pconfig =3D devm_kcalloc(ctrl->dev, ctrl->nports + 1,
>
>
> ---------------------->cut<----------------------------------

Thanks. Yep, with that change it works/inits:

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
 qcom-soundwire 6d30000.soundwire: dout-ports (0) miss match with controlle=
r (1)
 wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4 (ops wcd938x_sdw_c=
omponent_ops [snd_soc_wcd938x_sdw])
 wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3 (ops wcd938x_sdw_c=
omponent_ops [snd_soc_wcd938x_sdw])
 snd-sc8280xp sound: ASoC: Parent card not yet available, widget card bindi=
ng deferred
 va_macro 6d44000.codec: supply vdd-micb not found, using dummy regulator
 ALSA: Control name 'stream0.vol_ctrl0 MultiMedia1 Playback Volume' truncat=
ed to 'stream0.vol_ctrl0 MultiMedia1 Playback Volu'
 ALSA: Control name 'stream1.vol_ctrl1 MultiMedia2 Playback Volume' truncat=
ed to 'stream1.vol_ctrl1 MultiMedia2 Playback Volu'
 ALSA: Control name 'stream4.vol_ctrl4 MultiMedia5 Playback Volume' truncat=
ed to 'stream4.vol_ctrl4 MultiMedia5 Playback Volu'
 input: SM8550-QRD Headset Jack as /devices/platform/sound/sound/card0/inpu=
t4

Playback works. Note the ports mismatch message ^^^

Thanks,
Alexey



