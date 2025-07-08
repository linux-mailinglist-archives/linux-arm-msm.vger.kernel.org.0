Return-Path: <linux-arm-msm+bounces-64030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705DAFCAA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56DB64A0952
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D202DCBF4;
	Tue,  8 Jul 2025 12:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dWXqJbYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2002DCBE0
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978544; cv=none; b=pxdPNHeHmZk8k4SMi88JdzTy4fsmeYMNLZ/39lveHjm0/owjAhlfKk2Gun3mIaU9HQtLIwhewHwdKjrKFrtp4qwJquW75ZDpbdIPujTharKIxZB18Ui1LXD9IdVrj6D9D7z2qk3/cq+KygnopYn/FE7/XODH4BKOaTfwZIbajfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978544; c=relaxed/simple;
	bh=OMUTx42+lxnfbmDa4w9KRyTNqE2cIBR6M9QVHF4w1fI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pD2QgAx7dKWIExwkBbutixeMCJFcvwOCddzV9qU4m1Y8uaCQCdUFxgbuFjgazlpuBAaJ/kd/pPbwY8pGHnZ7kCQPzhPk7ok+DDqwShpgxXy4mh8rTn1XrRsYW1Hz/w0VZP2DKT4lgR51eCkQ3nKvbmv072zYx1b18eSWp3tEzCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dWXqJbYT; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so11723478a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751978541; x=1752583341; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krWI5dKupRfQc3/61VnzeAoMeO2jYhgWh27WUPDNkkI=;
        b=dWXqJbYT4l0gvL7r8Bk7j3OlqbHVe7abqQS/crSvNpbKx0hQJa7XCbzm9vh1a6ouoN
         65coz8Ejmlkd9cB/NUD6Oh6zz0aMNJ3NBFpTlgfWL2WG4RIZIX4w8e2GHfIX8+Dc9b9g
         ZWzc+Vgi6AEn2o5N0LAFDJf3NtjRKjqUhcKdQt/pJNT3vfNeGrPo4yO7lguh0UGxPV/9
         kXags8eDsrnf07OBD4OG008qKpk29DcGjytFo6HJLeVycrbINXC1a6X/jHxxTyGsRzpG
         x57ln0NusPENSiDS5ElopQv6s5pNRZMw3Mea0PUA27J69fDkFMGkSXroci04BU2JUUXq
         53pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751978541; x=1752583341;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=krWI5dKupRfQc3/61VnzeAoMeO2jYhgWh27WUPDNkkI=;
        b=bix8Dmwg54Ni6hgPSGT8AncrcT0d1cwfvIzsO2DMWtZHObNIKOLBxkMR3hkQBT7Dpy
         x1IiESmGL1cb8zwx4A51ZP9JuurBGzrSQzeKqAl++Pq8ycFhgsgQjHw+E5wPoY5dUhJ9
         4t9c/FYZyBQ10Eb5fAWvqS+liQ2Kup0h0O3wRJ3UZYvshArsP1bgKDOUjD5aMBKD4SMF
         XPGkwUpjo7nobldNfLvVv7qxUHtq1klf9sUP+1v3WFoDeXxq+SeMLDyetaIdMAInXtHj
         BGkZuWRcSaE1onopdIVZyfR09YnUNkDfDsGiFruR7bE4wzewIxSz5JXe6/RIsGS9qb43
         H0+w==
X-Forwarded-Encrypted: i=1; AJvYcCWtsn0O0Kc8mDqBr5T9WetLLVJPXGyjdtLUpd+/sCy4fBQ3sHsqENEYxPw2bLmUtRUDzZuspVPkKMjxx4FE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/yc4e8xSezhooTJFxGIwdCtxE/lztg9UYRP8RFsrCrkDF+i7W
	ndWfAVxKe1A9sqzBmCHLQyHjkQxD0yVHpAYvHVlSnlUOYkkmmzatg2RzEQG4hSWuH24=
X-Gm-Gg: ASbGncue4J8c3GiMwhc6no9/JoQH5fIkXHdWowQ2/Jma2BVjR3/pzg+kn3J9UbtqEkM
	W+VGvKtkftMj4Ij95cL1EzTxYPHsO18fe/SE9UOcNU1FB9HHW/wz5Nnm/iggdcg+kgEMfr8Npbp
	bejU8dIbAUxaBCU+TtBtmhu2Vvzt794oA4lZhp2A7mAT63PSsjsjFvfRcSTgtJalDJgHfkJSbML
	rSPscMBPyuHAm2RcUDoApwdbDjgiwAX1UflxHt/OCqsWM9iT0cAmY/Q136WJpTJQsOTfbzENw5H
	1QdKN3yrahr+LV/bSFaQlpTDMFkpaGlMvvT4PDw8Zd4JDUqPSyHeUEEolklPtM5MF6xpVv2M2nd
	EOxgKREUJKjg/Zvc92ujqn7WenjruHdA=
X-Google-Smtp-Source: AGHT+IF8+quXXledQG534WGGLgZTN7F2C1w8IIy/x0D8Dajv4m6QB5Hjruw4R2tZAmvqG+s4Kctcmg==
X-Received: by 2002:a17:907:3f0a:b0:ad8:91e4:a931 with SMTP id a640c23a62f3a-ae6b2b34160mr265150966b.26.1751978540601;
        Tue, 08 Jul 2025 05:42:20 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6949cb2sm889858666b.67.2025.07.08.05.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 05:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 14:42:19 +0200
Message-Id: <DB6OK61BL9ZS.31XB5TN5YTX62@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] interconnect: qcom: Add Milos interconnect
 provider driver
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Georgi Djakov"
 <djakov@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250708-sm7635-icc-v2-0-e158dbadb29c@fairphone.com>
 <20250708-sm7635-icc-v2-2-e158dbadb29c@fairphone.com>
 <0a09fbc8-8835-4e94-862b-0baaea5ee251@oss.qualcomm.com>
In-Reply-To: <0a09fbc8-8835-4e94-862b-0baaea5ee251@oss.qualcomm.com>

On Tue Jul 8, 2025 at 1:30 PM CEST, Konrad Dybcio wrote:
> On 7/8/25 12:20 PM, Luca Weiss wrote:
>> Add driver for the Qualcomm interconnect buses found in Milos based
>> platforms. The topology consists of several NoCs that are controlled by
>> a remote processor that collects the aggregated bandwidth for each
>> master-slave pairs.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> [...]
>
>> +static struct qcom_icc_bcm * const aggre1_noc_bcms[] =3D {
>> +};
>
> You can remove the empty bcm arrays and .(num_)bcms assignments
> for them

Sure!

>
> [...]
>
>> +static const struct of_device_id qnoc_of_match[] =3D {
>> +	{ .compatible =3D "qcom,milos-aggre1-noc", .data =3D &milos_aggre1_noc=
},
>> +	{ .compatible =3D "qcom,milos-aggre2-noc", .data =3D &milos_aggre2_noc=
},
>> +	{ .compatible =3D "qcom,milos-clk-virt", .data =3D &milos_clk_virt},
>> +	{ .compatible =3D "qcom,milos-cnoc-cfg", .data =3D &milos_cnoc_cfg},
>> +	{ .compatible =3D "qcom,milos-cnoc-main", .data =3D &milos_cnoc_main},
>> +	{ .compatible =3D "qcom,milos-gem-noc", .data =3D &milos_gem_noc},
>> +	{ .compatible =3D "qcom,milos-lpass-ag-noc", .data =3D &milos_lpass_ag=
_noc},
>> +	{ .compatible =3D "qcom,milos-mc-virt", .data =3D &milos_mc_virt},
>> +	{ .compatible =3D "qcom,milos-mmss-noc", .data =3D &milos_mmss_noc},
>> +	{ .compatible =3D "qcom,milos-nsp-noc", .data =3D &milos_nsp_noc},
>> +	{ .compatible =3D "qcom,milos-pcie-anoc", .data =3D &milos_pcie_anoc},
>> +	{ .compatible =3D "qcom,milos-system-noc", .data =3D &milos_system_noc=
},
>> +	{ }
>
> a space before '}' would be neat

There is a space :)

>
> Konrad
>
>> +};
>> +MODULE_DEVICE_TABLE(of, qnoc_of_match);
>> +
>> +static struct platform_driver qnoc_driver =3D {
>> +	.probe =3D qcom_icc_rpmh_probe,
>> +	.remove =3D qcom_icc_rpmh_remove,
>> +	.driver =3D {
>> +		.name =3D "qnoc-milos",
>> +		.of_match_table =3D qnoc_of_match,
>> +		.sync_state =3D icc_sync_state,
>
> Are there any issues with sync_state? (hopefully not)

Don't think so, I don't see any sync_state pending warnings in dmesg so
I assume it's 'synced'? Anything I should look out for in particular?

Also since it looks like I'll anyways send a v3, I've already ported the
QoS settings, and don't think I'm seeing any issues booting up with
that. So I'll include it with v3.

Regards
Luca

>
> Konrad


