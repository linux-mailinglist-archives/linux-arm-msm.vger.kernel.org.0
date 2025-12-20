Return-Path: <linux-arm-msm+bounces-86032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28649CD3328
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ABCC301C910
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1420213E6A;
	Sat, 20 Dec 2025 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="powBxEOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etd7Mzw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E005A2F0C70
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246720; cv=none; b=feOBfyDrxcU0QpM2h+RJvsNumm2DpmDq3NAYETq/232McHhWkekCeaHlLaj1vMulA6R77sB5CM22QpqpUTN1hKIoEvHVQ4bW/dYqt6AfjwNbGnUAaZ/DXm/yMQOoTI8dhnFmuk33te8ny8h899EPmCUgjxQJbeUboAS0tb7nOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246720; c=relaxed/simple;
	bh=ZzqG0IHbB778OMxQFRTVwAK7+J5xT4Xdltluh9XydQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RevtUaraL/nknF/QZYfdJZHhViXgZaGGyBjSF6m3o+QU9lGEQWSqi+saWwacpk/eQVZd6b+Kz8neV945CPcRviQPU8BPvB+T40JcRnWC9DhTDnshUcgPZ+AvUFNE5sLDaGTQPqp2sziSsBX/Qvc6NeaxxqxdAtAr1snpOYb17Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=powBxEOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etd7Mzw6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBP24f087755
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=; b=powBxEObFMXZnvDe
	IOxY9M46hWsA2j+MXBX7CCNLZXhH+CxQ6crVA/TRVfWE7DBdKkng1Q0xDA/48xsE
	wCa1fy9WghsTIUP+SHdiqjFy8+wozN+HJ7xj6AtXWISF83ftIWuKUgxTQbbIP/P7
	r2r+u54/Rz69LuwCsXaSpahTDyGjxgGm+HTOzeFfV2y6Quwrvpht43l8q+CLoosX
	x5Dr0M98ObA/btre7vc6S+ASc/HXBikuyXMPM4v3qyLTgZKwzplEMsBYa3LoTqqN
	q6gzi8NIFY/RZnh2NS8gkxGX3KDKUd2v+N2JixHuaI0U2KslttK/tVr5q05J/40U
	JvTX9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mra8wdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:05:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2cc5b548so87008246d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766246716; x=1766851516; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=;
        b=etd7Mzw6XYLpeqQYeTkmdJ5l2HDubfXuh7rI4hpGgbMcogVyrjQDJ2E58W9J2uEeRa
         R6KzL1vgdGTVnrvSm/a/ZBOpy3TXaVWVAITYvd/W70GzqtLRTIVm2M+jldw9XeFoMqE3
         n8dj0AUzwlhDkgI2Z5YCGjPr5jXEDRqnFrTLHz29HRKac2vXEOVpw+PEm/1d6+Fi1JJl
         iKhF3boy+JGlRHuWMRGk7qCiiEm4CFsZa6Tk4GE/kwV4E1qGtjG2HIbPD8ulQv7Dk2zY
         VU9Dtmht70lqCPKOys0qBGwswvHNy2QGkq9w/PrSF4iBdnN5nHg9QULeM5XMkhjV3Iqo
         U4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766246716; x=1766851516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=;
        b=QYiJphoEO+dxijpWzmK95o+WV/k+bl0bDpq1L2DuubnZrawT0sJszAJ5+AY6HwIQjG
         9+6+qu0E2F6Kp50AQ3+nUKJ9ryY9ct+ZeD0EK9Jqno6nI5E7HIlBwhm9LDOfooDo5exM
         k/iYxFtJ7MjpTinwZD8+TdYy88Uhi+vZ/YwDjF173ITZScR6TkoQn+jBC/ZpA5L5V+jV
         sFw//fAFRTjcmqL86Y04sXRvYHPUDP03VlBn7YOyZjE9QyhEdJvEZh+vm1VAwk2iq247
         aq0uW5CAsnvInIEvnP6FdBaXERESYjebKeUUoXH0ddo9B9DmrtLqVwNzRra7x5HaTbLi
         KKKA==
X-Forwarded-Encrypted: i=1; AJvYcCWt8mft9rW60A9O20BEvzhB4GoQnx/9h5bojjj/pZNAsbm9U4NHST53TicmbcgC7dNCt43exs/e/5qW5DTS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gU3Uaeah/WPiAqrKqxppOM1fDlVABUuoLaPjBTuiIgLtkl93
	ZBrUd0Fg/MehW5zJ+PRJ95cnHSGM0KmYSpZSThrMNjrDS2BiXLRmkHXqimw8LOV7J26QL2d9lMO
	OFh0/0zISL2RRIQPpO7r3Px3/fohJkRs53O1BALI8Yc8D2GpV+WFayEZ9HSwCOqmEvsGG
X-Gm-Gg: AY/fxX4I6J30nL3xjdRvZYrPopWjRPCBan1DM7O4Fcd7YzMg/2wu0RG3JqAxtt/K3Ae
	evlp+SS9gjA10nn7H36RFfJgp6VENUg94eXYX++rWp+TF3sQg6agV26sp51pPkPuHgP5LjKZSjI
	B3/CSs/sjFJz8mFiLf4odlWzJGbuFLaV6vjFjSxQ8b9EtVlSko7PMdrlfHx6NQE0ZHstGNu5z6D
	i2yX4ZcTanMSLBtzEFEmRt4pMiyRUc5ps9UqWS8jsgK8uqJEl0SjY+7J2NTDQcpLcOBgBaiCb9S
	LR7qYq6g6HMmMg0FugmZB7adGO0ErmFjUhsq3wPNwhHM4q3A+3KqqYkzjeiJ/sD7iMq5SyT2gEs
	uzykv/7ycf9T2fFYwc+nkNy/mJI08MnrhwdtkP9g9QA6fQg2bLHb0TxYxWl0SGgk1evZvmCc0Ka
	8/s8enD0MAzoQQRex5m7hEvs0=
X-Received: by 2002:a05:6214:4983:b0:888:7dec:11ff with SMTP id 6a1803df08f44-88d7f5b4884mr104916366d6.0.1766246715838;
        Sat, 20 Dec 2025 08:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9Whl4rMKWU7yncCxutDz2fSapgwvmZZq0Bmc+w/O5q1n+gdugc2XguNuuCW4HIlwTrQY/WQ==
X-Received: by 2002:a05:6214:4983:b0:888:7dec:11ff with SMTP id 6a1803df08f44-88d7f5b4884mr104915726d6.0.1766246715402;
        Sat, 20 Dec 2025 08:05:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d07sm1613067e87.62.2025.12.20.08.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:05:14 -0800 (PST)
Date: Sat, 20 Dec 2025 18:05:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>, jerome.debretagne@gmail.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dale Whinham <daleyo@gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
Message-ID: <elgdbinyzunhgxaqy432qzxb65qb6yuheiimwutxdtf6q6jjpc@dgcnk3bgwqij>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
X-Proofpoint-ORIG-GUID: CjxELAuqU9fhFovaMqrJ9IZJ7kjHY_w8
X-Proofpoint-GUID: CjxELAuqU9fhFovaMqrJ9IZJ7kjHY_w8
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6946c93c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=QPAgtUUt1aV8ZuakPV0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEzOSBTYWx0ZWRfX3wyUe5hCwKCQ
 hRKYgrer4LA4DwgCylAzKkZ587j0RFWCtNhHDizCVKmmyUayqh4jFFP3Fiqo5lnpIGZ+OAWuxz6
 849Sikq6e2YeSSPywHEV9JcS2pgl1hVTpb/HBq/UdKjVY2kAM6RN6YF4dgLPJNTLlt/BHq7UvAO
 dxVE1ESaDgys4qpTnLtcrh7kYps49YktV1FQjJ71UnA45eCB44poStDy3T5Fy4g5zai9vX57j1A
 LqFW+ntDGOJZG8Ssi2bX2odq+w8MWgk+1rQ5ukp4oQQa4Vrm6DDtYikb++U5aftRooN43mFEF6K
 Ad/3aV4470IBiF9OB8nGjVK38jc/6tYedv45zL6vU49F9ibngnImlb5bqSm35p2k7rXEWfKoypK
 Q80kCLO0tyhVY2OAfAWEUC9nY5GcNBBUfOvOYEohHydTSnP5nN0MAuop87B41tyDCQFUxrWnTgS
 PGZ8+vGT1/Z9xcdqd4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200139

On Sat, Dec 20, 2025 at 10:12:14AM +0100, Krzysztof Kozlowski wrote:
> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
> > On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
> > > From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > > 
> > > For some devices, Wi-Fi is entirely hard blocked by default making
> > > the Wi-Fi radio unusable, except if rfkill is disabled as expected
> > > on those models.
> > > 
> > > Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
> > > disabling specific features based on ACPI bitflag") added a way to
> > > support features set via ACPI, including the DISABLE_RFKILL bit.
> > > 
> > > Add a disable-rfkill property to expose the DISABLE_RFKILL bit
> > > equivalent for devices described by a Devicetree instead of ACPI.
> > > 
> > > Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > > ---
> > >   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
> > > --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > @@ -29,6 +29,12 @@ properties:
> > >         different 5 GHz subbands. Using them incorrectly could not work or
> > >         decrease performance noticeably
> > > 
> > > +  disable-rfkill:
> > > +    type: boolean
> > > +    description:
> > > +      Disable rfkill for some devices on which Wi-Fi would be entirely hard
> > > +      blocked by default otherwise
> > > +
> > >   additionalProperties: true
> > > 
> > >   examples:
> > > 
> > > --
> > > 2.47.3
> > > 
> > > 
> > > 
> > 
> > Is this really a hardware description though ?
> > 
> > Its really more of a logical/functional description. It tells the runtime
> > what todo, not what the hardware is.
> > 
> > You could also have a list of quirks in ath12k for this or have a user-space
> > utility look for the appropriate platform device string name and disable
> > rfkill.
> > 
> > I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on
> > a compat string.
> 
> This is good point. Either this could be deducible from the compatible
> or this should actually describe the hardware and whatever is there
> wired/configured, not what OS should do.

One of the examples _might_ be broken-rfkill, e.g. if the chip expects
to have the actual rfkill control from the EC, but the board doesn't
provide one.

-- 
With best wishes
Dmitry

