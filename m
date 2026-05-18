Return-Path: <linux-arm-msm+bounces-108187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBTjM03+Cmp8/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:55:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF2F56C0C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 664DA302A7D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31253D3D16;
	Mon, 18 May 2026 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXlVxNh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1Td28E+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A4313E3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104977; cv=none; b=P+RuilD2rvwwN174XSbvFTpGcr3I3bG80K1IMyrB+4AtEQLTkLCaKktWNvq19hl2dgQlYXEfbDUj/ne9V6wm/C9hQ8F8vAYOtyzKsBDJx+j1ZTMW7G9rDzyyLfvhigF5ksKaHTcVm4c+JEZlTXa0n5PLIwn1Y13Y93Ta8Ea2jPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104977; c=relaxed/simple;
	bh=ggMEHcs5HFtDlO0Y7BOPL05ocsgDej3md/z6l1tZZTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lm2c2C+qEcKwbKyEKduevXp/P6puAbkwk6BONyiTZKjdolVjukpUlWy4rjPp6BCesqnwhQKfpCpp2Ju7FGtzRKc5FFB8JI2tTuUiOuwNfKyTBHpHnCRUOBdAalsBCuEzfrJa4ubG+d6jY/ABoRKGIlS46c8rrzkIZmYxbhEfZ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXlVxNh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1Td28E+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I77ipg756636
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZQaHAH77x0UG4O6dV4fD7MS0
	JvjE3rw7N/l4jr5UMT8=; b=HXlVxNh/Q+dNp8wB16Qx23FRFj0Aw++Ou/LkEs3a
	CIThIg69eKJs6wBCPu7eB+eSXvp1A0E5OLSsTraso3AWCJa21eLjQrCdcFOjKU3F
	NFdZCPF3pSaXl6zsAm9KOwGhKHKSdwS6ipfViW+gz0GVuPzSyaAFLpvXyD8aag6l
	2CHX0aRkG/YeXNyEBKSz0tn37PcgCPXaMVDGosnn6ikAWC/f/Jhvbraw6p2Psz/h
	SH36LhANVIglbpMzx67cft/dNyJKEjTNJEsRK5zZ8zHuDmLQ1TTHQYUi4zWNzaN5
	bShTzGUc9lQFzMLjOcJXcmFWM0Ed7URw8m2AzZGgFNgn7w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcn4ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:49:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa860e71eso1078185b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779104975; x=1779709775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQaHAH77x0UG4O6dV4fD7MS0JvjE3rw7N/l4jr5UMT8=;
        b=A1Td28E+x+CSFQnF0TLBGRiw6yM1xLsXgb9PsHp0wEFLbdxYxB2tzUf2H6807h46hG
         FwxywAmvKNLEClwC5KOfk7fCtF8vROz00dseu4ZR5tR2Kk3BgYHDI7VbHV23DWXgOYON
         rEPFT4KYhP9kCmDWDxQgY/wfhvZ5TQGJooDfIsQ3QRVpa2Jc2Sj3ZdW2n6d8W26aemYb
         o0MJp68aNudw70rulswMeFRRXFS4u0YPY2GYw0qLScZAFXPd/xQDR8Yi2y2/Ol2v/h8f
         5L7nyrU8dV1nUURdglCrVTDLmiWTrAEnYm62JgyflwnlOcv1C3QlW/yCk60k2JtUCWPd
         0iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104975; x=1779709775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQaHAH77x0UG4O6dV4fD7MS0JvjE3rw7N/l4jr5UMT8=;
        b=c74hSL0KFZx2UlOl/efTDqzZLi6h0G67GEd+Z1ZBPec/9X52KdiBaBnuFKs5OkvQWD
         HSkONY8BsRQRpicWoivtpiu/ZZsr7w56TTcjhuq7zkIIAXbumBMiElRU8UgrclKS/lmw
         LP+gcEDxfqoP4SYkb+q3sYnVqc861EoT5yCmJRuB2AQMMqSSKRqw2vEAmFC//TcEwSWq
         4Jvz4B+4habAK0c9qwdSTdf8/gP2GxMg/20fJfZIAmVEApKXEGtwND//iFkQQrlAFRZM
         CiNgIeRxN6owZ9zUd1w7Oc5trrAjpuSxCscTyRGoDdXtoXbdbeetgO4Dcj4vRSZtT4ph
         NQEg==
X-Forwarded-Encrypted: i=1; AFNElJ+CvG53MYb0YB5kKvfdyddkdbZfAoqbMHf6lRgyGV9OZBaK6ynJRx/gprZfopuDEIcEI4JZMhW/mALIRx6U@vger.kernel.org
X-Gm-Message-State: AOJu0YwJl3Mjs0vPT0obdL8Zl7sfco0xd+bwHLXs9WdU7iVlBCyjm7k8
	2sO3AdPN+lP/HKranDmhYMb7NWQ+aUY4dj91PoryYE5TpI8CSs2bEBDlVM39j2I+EkjRf5aIXLy
	VZn/RD3ObIy1NSXqj2B3WLwIEMyYkIN1gE7Zr9M4pc5B9koYAjdIEO/H9IEF8jWSUIR+U
X-Gm-Gg: Acq92OHVAmT+/QRnS3iSSvJuASeyirLv6pEmBm3QlxqAQthIC31VBwtT3yImyrtC6fj
	KL7sfnhDbbsOe8aaaH/SBbm5Ery2T7Lm9noZfVP4f5weMlN5DqF5SPZ+HK8AU6IEc2/mhZXHWj8
	GHTD099BsuEH17j7KETMh+DZevbtRTgLmdjcn+z88rkKwqnYNJlc8Rjon0XM1jCe/FUKWOGExLE
	poYTKicDUrgngCoNZCgdgVOG/Avt+yAtp8Fh/bOxl456GqqZEvFSjZ9FVGtA7EIvNrf9edKieLz
	Mv98IQQ1gPd4AHQajkzRFYyhk4JsHlU7Wn91z9efbwSkpnZvb+CY/08/vZfOS+5E3NhwekHY4HP
	xleq2IK0rYyZ5bn2hhciWWVh8vylo+ZcLFNI0zFWhfi5hD4irwn8=
X-Received: by 2002:a05:6a00:3005:b0:839:3ccb:7038 with SMTP id d2e1a72fcca58-83f33d336fcmr15496736b3a.48.1779104974855;
        Mon, 18 May 2026 04:49:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:3005:b0:839:3ccb:7038 with SMTP id d2e1a72fcca58-83f33d336fcmr15496694b3a.48.1779104974195;
        Mon, 18 May 2026 04:49:34 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c3a9sm14436791b3a.38.2026.05.18.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:49:33 -0700 (PDT)
Date: Mon, 18 May 2026 17:19:27 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
X-Proofpoint-ORIG-GUID: V4k7PbrCyh_XMnERkk06H3cPiZvo79o7
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0afccf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=22Q9nnmWW0f7vvM8ERgA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: V4k7PbrCyh_XMnERkk06H3cPiZvo79o7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExNCBTYWx0ZWRfXx/y7HZ3YSgtL
 pfYWTHVutFXU41S1m2dIAxc34kREIlaqSGjBFpwlp/jImHah2uTqM3dcF/+B1cz7SAnDoOkPMIc
 Sks+JOVL/RgBu75kvZcKYymVhwI4uSszoB3I6WnY6fbo3K/sW9r/gEiG0l+ErBdE+8krCgIXzfG
 G1aJsYcZxRZ8zZg1kBMv7c3JGkZU09jWvtvTUk1W/PGPkiLP/7hCDG028sRdrAaAuP2RiReLMLo
 v22SDA7jAWomGTg2/UpZfpsTyhvfCUCNuFd8agwl133oU0go1aUGU/OPC4DiNg3HxNu2zLvxvPD
 lC3BTTn81WfI9yG8BYeMlreXNpguvxrbJzGTn/FiM2f3wTTZpoATgT1qOSg0j4WRtMqlmilphnw
 cKZxGbdp9+ger6JnlMNoyfJvSzkceZaaCB1iJngNJG8fuMGMQjB56q1xvn1yJk+SBXWhIACwyys
 nGDegA/WSsdfxudLMCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180114
X-Rspamd-Queue-Id: 9CF2F56C0C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-108187-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,hu-kamalw-hyd.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > --
> > > > > > 
> > > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > > 
> > > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > > 
> > > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > new file mode 100644
> > > > > > > index 0000000000000..401e71720519d
> > > > > > > --- /dev/null
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > [ ... ]
> > > > > > > +&rpm_requests {
> > > > > > > +	regulators {
> > > > > > > +		compatible = "qcom,rpm-pm2250-regulators";
> > > > > > 
> > > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > > compatible string include a specific identifier for the actual hardware?
> > > > > > 
> > > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > > are discovered later.
> > > > > 
> > > > > This can be ignored. The compat is a leftover from the historically
> > > > > incorrect naming.
> > > > > 
> > > > > > 
> > > > > > > +
> > > > > > > +		pm4125_s2: s2 {
> > > > > > > +			regulator-min-microvolt = <1000000>;
> > > > > > > +			regulator-max-microvolt = <1200000>;
> > > > > > > +		};
> > > > > > 
> > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > such as vdd_s2-supply?
> > > > > > 
> > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > 
> > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > downstream components?
> > > > > 
> > > > > And this is a correct comment. Please provide missing supplies.
> > > > > 
> > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > votes are cleared.
> > > 
> > > How is this different from other, previous platforms?
> > 
> > This is not different. In the previous platforms too this is taken care from the
> > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > may have a RPM/RPMH regulator as a parent.
> > 
> > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > calculated based on the active child rails. This was done for all the
> > subsystems (including APPS) regulators.
> > 
> > So no explicit handling from the APPS is required for parent supply.
> 
> You are explaining the driver behaviour. But the question is about the
> hardware description. If there is no difference, please add necessary
> supplies back.

I understand your concern about descibing the parent-child relation in the
devicetree, and given that we have been almost always followed this for all
the previous targets, it will expected of us to add them.

However, we want to avoid the unnecessary access to the parent from APPS.
At the moment, I do not see a way to avoid that, if we add the parent
regulators.

@Bjorn, @Konrad - can you please also share your suggestion, how we can add
parent-child desciption, but avoid accessing parent supply from APPS, as its
Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
recall we had a verbal/offline discussion about same concern in context of
RPMH regulators earlier).

Regards,
Kamal

> 
> -- 
> With best wishes
> Dmitry

