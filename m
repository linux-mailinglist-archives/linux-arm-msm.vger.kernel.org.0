Return-Path: <linux-arm-msm+bounces-94959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hP1iO3ifpWl7CwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:32:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF31DADF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB1CF300CA2B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACB8377021;
	Mon,  2 Mar 2026 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVodOTIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgzB2rU1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA93EDABD
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461464; cv=none; b=sgQHqnHTd/NGJJyG4nif62xOZMsl3jf8zVD2IRwfhmzUM32ArTzXzwGWy54qpE/Bv4J7V/Rc2o+gI07ZzMmI7GG+cBybQfZpcXlRtdGUIo+Wevp0DGL436Th8nnZvjTI+8g0Y9Isaz5qYLavnEl1DdK5IVcjVA6x2TKV1hKG9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461464; c=relaxed/simple;
	bh=4jfQvlciuMjy/CGMW0lPybxsFeoSnX+mXDnzu6Hwbo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctCn++Mmd3K3frlc0avNM7asHwQw8Ef7efsCMQWQ/kM+fhrggAA/cpTc9DuvEK5vVK6c0xN6KYzl8A6CDelww6xo0duo+q+nhv76NTVscFwAZl5UqnV7JgnKWxZG1b3IMNXdk6JwjxAsnroyeb256cG0C9WrzJH4b6awNKjG5dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVodOTIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgzB2rU1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622CiemC2504642
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PwqDGUZPNmd33w7jgDewuxkJ
	lTOdaUeW/d4uXiakUEc=; b=mVodOTIXEWD90WlEVZOWOk3uljMCs6H3BvJat6HV
	fOeljIwFQBsMIVOypR4WB90zODsSotFDnFtcxt370fiau9jb2+3Yyy2tHzJsLYao
	13sYkwM3piWjg2PGH4j0SG1op17+6Kc/EraRumhzsl9OHOudJ4ZYxEkI2oNWkAay
	RP3hd6FgaEVo3MWfS8xG5uVbwk0wA7f1i61qJ7tU53uDEmkzBUFuXbrQm75N3K/e
	bDi74S9Pi9/17Ix6D2zQ1qiaFRWBDeyXDz2KxY2MmULSxqvNQW0hlfpVdORuend8
	nhI37zvHYzRAHKDa4zbm6W35PhUmJpf5zZdnhSZiW+XdiQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5heskbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:24:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae53ec06b0so32364875ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772461462; x=1773066262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PwqDGUZPNmd33w7jgDewuxkJlTOdaUeW/d4uXiakUEc=;
        b=FgzB2rU1GJzSYqJEYihTHJrNP4dI0WrN/Kj7bVjdCBi36nbppggfawCZH93YpvjnzC
         UioHnrnDEE0LEQtXGkf/jsJeQoHeJnkuwiJ8GG2b2XfqeZr4TCgPwcnQhyaqoG1B7lPW
         p/P+789oDIiZePJChtI1cG0wRCafM5BNvKmvJHhMXu/ZcDWJxSUGzXcoKo7dPHcGXluW
         /rKXQFqi0sZzsxDrt+NFInh9QhPz0dRjYNLh6iKhV8mAlnb+0MZevixtGkMozFM+gT/z
         /R6fyNdjon0rzF80MXRsGotRyBu3mNlMtwbZ4bNhqedQT5HTskN54aG6I+CqMowAsXVm
         GPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461462; x=1773066262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwqDGUZPNmd33w7jgDewuxkJlTOdaUeW/d4uXiakUEc=;
        b=B7EwGu2C7MyMVEOw9nrsX+G6N/VJ6F0l3S+ThkGRY8mwaK+7gCKngLsrIJypmgwzot
         iFZbhSp+DOp4MAVbw6tw1qRFnZwyc4lyXyCWtJceGg5f6c641ctgQXOTnpBcYCO6aPJj
         HODsY9P6sKmKFqYJEG1QH9fQVz6fRXz8V2hYLAR6k7AJeH/f89ZuLtWOs3Viujsgw6nm
         GO6WkspL/sGAyC8nSu8J0+I1PsmuXsAVTE4fvWt0n7+GRI9b8JUH3eKCxiSh7rMqV+w2
         zI4ubFxoTxG2ZjXsWzEqn/LM2DMoYS+yrkLhz2IFl2KnD9c7z0V5AzIHD/Mo3G6o+uJQ
         362w==
X-Forwarded-Encrypted: i=1; AJvYcCXje/btPG3jYJOkWPjHiiACbs5oK9VO3O77f/gLukhliP9KWGQcFriWfI5UIszfbnJHnyPeTy2SbTr8zFlU@vger.kernel.org
X-Gm-Message-State: AOJu0YysB7q8nZYKtlhptSEozXlcG3HB7lwWOdhVCsznsw/+gVK2mkgM
	W4/5lGEnLqHPEaQwJ4nF5I0F5h6Xy963B8qhgI1AMGfFUK+oKIm0KWpO5iNSrFNjH6Vdryo2Tsk
	cnBT2iwttHOUCY/yUgrWDe6bcw8B6UNzBT49FzdfKpgbHU4UnZP05PDxtqBwC6Kk/bPu7
X-Gm-Gg: ATEYQzwlqQ/5EvmsRdHfs0F0+YXkAuMYfHeSqvSx4SaGDvseWgaqbs4P8tZ+wNSUq7D
	yYcYQHwMVcHAL7MaPuHU+6D93l10YX2Y4SKESH5KKZmGkU41Vda6etkyAeEi8QZNE3PWzIad/mT
	PmiRHF4K9U9v9LW1xX6LRfv1yb4RzS/tTfW/d46N5uKfmaHvr7pY6t9kj0eXXj0Z8bomQ7ymCfb
	gP9D+Q/dd818pL4sYWD7fp1OzB4IUdx0zCx+5TNJ9jgWonVWcVmUA07o76lPA0MRGA+wYMqwWjY
	hlfs47Ql48J1vPBxAnUykfdfdWqNj2TNJQB8VoFrcxFzHcZ1bWiPpqkGd1WfQJXK5xwcyOskU7W
	JPxq+ae4r+LdkyhEcYzvwQ3qATE3CvC+Ztn1oJ8QS3Bjuni+t6booXrPE
X-Received: by 2002:a17:903:1a30:b0:2ae:5104:5721 with SMTP id d9443c01a7336-2ae510458bemr28735495ad.6.1772461461562;
        Mon, 02 Mar 2026 06:24:21 -0800 (PST)
X-Received: by 2002:a17:903:1a30:b0:2ae:5104:5721 with SMTP id d9443c01a7336-2ae510458bemr28735175ad.6.1772461461050;
        Mon, 02 Mar 2026 06:24:21 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c20d3sm201423135ad.25.2026.03.02.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:24:20 -0800 (PST)
Date: Mon, 2 Mar 2026 19:54:14 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
Message-ID: <aaWdjuqvhpJb1oSX@hu-mchunara-hyd.qualcomm.com>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <20260227105055.2364348-3-monish.chunara@oss.qualcomm.com>
 <2ra2apfephjl2au6wel25gbxoxyvohf2ysq4yzaufp3xb7mtoi@g5p6asbk2fqe>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ra2apfephjl2au6wel25gbxoxyvohf2ysq4yzaufp3xb7mtoi@g5p6asbk2fqe>
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a59d96 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=37xXzHZQKsG2Q0yfkbAA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: szdvIYaLMTb-81qR3nYgyrO4L0ydg3UC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMSBTYWx0ZWRfX0mC/bJekghbg
 74RaGgNbPGSyM38e8aI+mpKPmBTOFWtNZH9QoUFH/S+QZ5495DZ1JdA/lLhnCWeHP1gvjp0W1vC
 qu3Zy0LdkzH9uGLhaJxrdHYEnYLpfZsoM2z+kYMfPNd7d6aboYDZKjbVIb8xUw5y3vYavZfclK5
 6yFJXDq/QV7tNOIlSwbtsGFb7gfeWphN7FZQDBDd+hckoraAJG/pfmwTlOQIIuRLfkGBPpH8tUa
 mVvDYIB8PHSsuXtn1aieSLCzRglSwFJgrRyM6JhX7ombXp2dEhv7nDQnqb4THs9F4LVSKTnoT1X
 UJ0n4XmKy5J9DBFaeJeWV6pitYTXlydoBW3d6kz6s2FF3tRmRw0dgT3L7Qe1lud8TX5wilHnowQ
 295yrH6HwgUOCU3SprovR2nJ6P6IJ0KADLGpwcicPPmPOcunlzjxvdvPwhZ0qA+/HN6Q458rb5N
 CpzyEIyk5t3hUxuXjIA==
X-Proofpoint-ORIG-GUID: szdvIYaLMTb-81qR3nYgyrO4L0ydg3UC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020121
X-Rspamd-Queue-Id: CDFF31DADF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:03:10PM +0200, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 04:20:54PM +0530, Monish Chunara wrote:
> > The monaco EVK board supports either eMMC or SD-card, but only one
> > can be active at a time.
> > 
> > Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
> > to support SD Card for storage via a device tree overlay. This allows
> > eMMC support to be enabled through a separate overlay when required.
> > 
> > Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |  4 ++
> >  .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
> >  2 files changed, 76 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 317af937d038..c86242a1631d 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -46,6 +46,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> > +
> > +monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
> > +
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> > new file mode 100644
> > index 000000000000..a0bc5c47d40b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> > @@ -0,0 +1,72 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +        vmmc_sdc: regulator-dummy {
> 
> No dummy regulators, please.

ACK, these will be renamed as per the schematic. Since these are direct supplies
on hardware, used fixed-regulator configuration.

> 
> > +                compatible = "regulator-fixed";
> > +
> > +                regulator-name = "vmmc_sdc";
> > +                regulator-min-microvolt = <2950000>;
> > +                regulator-max-microvolt = <2950000>;
> > +        };
> > +
> > +        vreg_sdc: regulator-sdc {
> > +		compatible = "regulator-gpio";
> > +
> > +		regulator-name = "vreg_sdc";
> > +		regulator-type = "voltage";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <2950000>;
> > +
> > +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
> > +		states = <1800000 1>, <2950000 0>;
> > +
> > +		startup-delay-us = <100>;
> > +        };
> > +};
> > +
> > +&sdhc_1 {
> > +	vmmc-supply = <&vmmc_sdc>;
> > +	vqmmc-supply = <&vreg_sdc>;
> > +
> > +	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
> > +	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
> > +	pinctrl-names = "default", "sleep";
> > +
> > +	cap-sd-highspeed;
> > +	no-1-8-v;
> > +
> > +	bus-width = <4>;
> > +	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
> > +	no-mmc;
> > +	no-sdio;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&sdhc1_opp_table {
> 
> Why? Is it specific to the device or to the chip? In the latter case,
> please define a separate table in the monaco.dtsi and switch to it here.
> 

As per the previous review, it was suggested to use an existing table. But yes,
this is specific to the Host controller and the corresponding voltage corners on
the chip and can be defined as a separate entity for SD card use-case.

> > +	opp-100000000 {
> > +		opp-hz = /bits/ 64 <100000000>;
> > +		required-opps = <&rpmhpd_opp_low_svs>;
> > +	};
> > +
> > +	opp-202000000 {
> > +		opp-hz = /bits/ 64 <202000000>;
> > +		required-opps = <&rpmhpd_opp_svs_l1>;
> > +	};
> > +};
> > +
> > +&tlmm {
> > +        sd_cd: sd-cd-state {
> > +                pins = "gpio11";
> > +                function = "gpio";
> > +                bias-pull-up;
> > +        };
> > +};
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

Regards,
Monish

