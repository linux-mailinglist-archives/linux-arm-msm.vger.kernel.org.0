Return-Path: <linux-arm-msm+bounces-80789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C44FAC407D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 16:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81C52188EF01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 15:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CFE30DED5;
	Fri,  7 Nov 2025 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCs7Smwk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AqGX4FYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E052DC76B
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762527585; cv=none; b=UFczEYlq2U+B2ej0tY+QEd5mZNkWSPG9ZkKVwsR+8WfVkhy4NEhGFa5Y6HuRqMb79Z1WzjGgLRVEO1A6u+m2O9Zr4G+Krep3xk50GZSeCv5bmjufDw7v52k6exkfZGvQvsKk8bveBTa2ff2l5YURPBAlPgmboJ6Ui9Y18lhQjGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762527585; c=relaxed/simple;
	bh=XW2WsK4tbOuDqKSzsP+EOlzjzp/zdbDi5NbTGf9Q75Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUMZCO0yEHu03b6bRxVfUs++2XLoZr1E67ELx6fLOxTZLyWa4byq0IpwX16MthV3rBE6UXD9mpnshtQBMO6UJljlCGY8Z911nm085uStEwMYb18t+d0hSHTeZTbHkvprEICVls1DyvSeAIxqjyt6LIAR0xMa0gKm1jZ/JT1U8dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCs7Smwk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AqGX4FYv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7B0QwR2878531
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 14:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kG+MpwnlBm2VR7G7EiP5F7Ba
	9tPifIOHW5fciMWZ5o4=; b=bCs7SmwkLRadTRSv+43hdycNxZDuy8kgNet0SQAQ
	yeWDhrf8tflaH9+40pq+jdp6zZwCl0C4Qv43jdOw6o+glmLA8SyMpWk29SPxrVkX
	ShutR6tdVVTuP1zLOcyZBR5+ybLh60JV3EpqgE3GIaswICYdV5QT6U4yuW4F9IwL
	MdjQdeMO06Rc9o+qmYdlvODYja9HGWAhrUb2Ve+WVw2LDukEUBfwPcFJq15AYjGE
	QS7y/t6qd7ci7LcDj4UmtqVzb8woalNzUs+eLdeMsNQ+HKY3a/W00YaPmW3+VbaK
	TJX0/yb5S73wCTMOU1TM2BCAGm8Lq54So27bBc+ccbTa8w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fh1rkb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 14:59:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7aee84f1defso1291810b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 06:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762527582; x=1763132382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kG+MpwnlBm2VR7G7EiP5F7Ba9tPifIOHW5fciMWZ5o4=;
        b=AqGX4FYvXUjGyfNy1kLIm2adDlZuaTenyG1ozPwS1CJ98BiJAEDX+u9WCIr5298xc3
         gzFpttXRc2IH4qJArbExx+nf3PaVpNypUzqe78Qe5DSK8WSgRW19w7QzhH6MIjdwns/v
         bVnlyYWniop04qmviLuA/aVcH6x8QJUi5aDMKTujqgqXa1+2qJQ7klgOONAjMnPHjbLH
         ss2HEPbCY8Qt31QIu55489MQhL2NlDfeqvHqGLWVcZa+agvKUpykfqXapH5yrFzP6K9I
         X7EPeHh6KjUcBdsJMZozkVLnNbk+KAgUJdmt83jgpIXcCIATM168iHblfWRI4gWBjhww
         VoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762527582; x=1763132382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG+MpwnlBm2VR7G7EiP5F7Ba9tPifIOHW5fciMWZ5o4=;
        b=bgfQj/9i7chIoJ3jkLuzQCLtFDBuE3jYfMnMr1Y81AP6xnrLvmMYWn2IXCpyS9kE5C
         YRWFCsDLExyn7G+LK0h8A1EAOBiuDXeSG91/lNO6kRQZ0JtHIA3JLA+rfoXeTiZRWpye
         GHKxErJC7URqH/m4KOxCoexc2W6xJNZ6l+kL+G27COmfVmvHKQ6Qeka+Uc02+gV4RsBx
         Y0tQHy337VtyKNNRq/EzAK5WlJhUkn0/Xq31kRgz578oUsB3ohBGVIBZUREtl7jDXSTc
         wN0xak1MTqi30biLtiMa6BT4VPuXxbFUaL+9dUj+lVujJLbmgppMAIhRCSd2VBDc8viC
         XaWw==
X-Forwarded-Encrypted: i=1; AJvYcCUDID5ZgNH1FTdH1IMWr1fiYCDwB5KH+pnfyDI5z0WzGC03Xw79zyy7OHYzH0WZPntooYVdbYpmzEg9I+y+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7llemvi6wvV7tFdJUj3ZgP6MvHyNMvYJMAO17EZ1tkU+4GIpR
	Gaw4qnJsWempdJhO9kKyDL1B6EbwqshGHq0WsPB7qrAVfC651PxJGhKbx8oeHE7+HJRgmm+iyi5
	9fGU/6zN2nE882A4WYCoGgjKuUfPYV969/YZLRIvL4sSJV+BAePb+hui9ivA0XTCu1f4t
X-Gm-Gg: ASbGnctej6U3QOU9EpD6k5PVndZZKrXnFW1uU17gM5Zk3AFlk89bNP1Ik7R9F8wS0AO
	bmkmjnQ1Zg6jDB1auLlQLuDBe04sap5jAfgkXcaKij+0dy033VSsllpOXvxZoQXlp2ZIW6JY4zi
	TZBMuff94/7e3IvsT6M1Dr5ZAVld0fFtTdLmQ2Xc5PxwKKIL3ksjn+lk+7a0Y24hKPtSwKuBl06
	pJrws+ZulUi85HdqLr3Skic5eMYYFhBAyzSI1XSqnG90MiT2peqyG6Etackk+ZHimByNPG8w70K
	BbbWXBx6mRXs6+E3DdQKhHBrSzhyAiJNtk7JWF2CQ4165fy7r/N5rSaFv8vAshwZTqtZDfxhUIx
	oVgnCuoJj52+/L3dJLnh0dcQhAbbTyHxVp6exPyllcjV39DcU8dxc7Bp5ynnp
X-Received: by 2002:a05:6a00:9514:b0:781:c54:4d12 with SMTP id d2e1a72fcca58-7b0bb8257d3mr4488557b3a.13.1762527582217;
        Fri, 07 Nov 2025 06:59:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEijwhGdtSLvjuzQCbq8nRtcyVDGaNCFdRFX9mqZa3EE6+Loh9F/Fn/1ylIENdoxGKo0e7Row==
X-Received: by 2002:a05:6a00:9514:b0:781:c54:4d12 with SMTP id d2e1a72fcca58-7b0bb8257d3mr4488515b3a.13.1762527581590;
        Fri, 07 Nov 2025 06:59:41 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cd05d17asm3257418b3a.72.2025.11.07.06.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:59:40 -0800 (PST)
Date: Fri, 7 Nov 2025 20:29:36 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] regulator: qcom-rpmh: Add support to read
 regulator settings
Message-ID: <20251107145936.rtbuonpslvixttr4@hu-kamalw-hyd.qualcomm.com>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-3-5c7a8e4df601@oss.qualcomm.com>
 <4w77t2j65453arqgrtqyuv3bmgelgmecvf26yj7idfwqfumizj@q3dhohaiyaes>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4w77t2j65453arqgrtqyuv3bmgelgmecvf26yj7idfwqfumizj@q3dhohaiyaes>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEyMyBTYWx0ZWRfX+4AY3JDBTsqH
 wPGkPJXPlYsq4VzorpUpBHTxK+YFklywHk/ocuO4N+FwnhVOZsddRJIuvosbtrqEUMR01pgH7m/
 3N3uYkkKqzFU90qhUAEe0JAgw3klkztJDvcYiTJ1tmIxF4bmyCR47kwAZmDYKWW3pb5MPUCGBcp
 RMrEOjmTUbVjdNZheG629JYE9Rb3kfH5uKer3HGT8/tHEaI/VGKnZe8dwJH1PBIAsDECHGgg6L1
 Df2SuDeAeMOldz3NHKmVNpBzwoc1jUvrL5UWRXkVVMFvHbBc2H99/qQmRqMWsAZqHl45qTEYnvi
 rdfreUuVwcZu2kbZPlaumlhE/KAUcGkKBPd1V2ZQypovWW5/A1Kfk9eZt32gfB7mEAlZcvxx0/O
 Ji2Aq+YVusBEuv75KhsTjppahywRyw==
X-Proofpoint-GUID: mXBDkHkWKjKBu1lROql1SrPI20BZoOkX
X-Proofpoint-ORIG-GUID: mXBDkHkWKjKBu1lROql1SrPI20BZoOkX
X-Authority-Analysis: v=2.4 cv=IcuKmGqa c=1 sm=1 tr=0 ts=690e095f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Hw75zu5s8paMv5UTKY8A:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070123

On Wed, Oct 22, 2025 at 11:43:44AM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 22, 2025 at 02:38:55AM +0530, Kamal Wadhwa wrote:
> > Currently, the RPMH regulator's `get_voltage_sel()` function only
> > returns cached values from the last `set_voltage_sel()` operation.
> > This limitation prevents the regulator framework from accurately
> > reflecting the regulator configurations set during the bootloader
> > stage. As a result, the regulator framework may trigger an
> > unnecessary `set_voltage_sel()` call with the `min_uV` value
> 
> unnecessary or incorrect?

Well for most part its unnecessary and for some cases incorrect.

Its `unnecessary` because most drivers dont have a requirement to keep their
rails ON (as specific voltage) before their driver probe happens. So a drop
in voltage should mostly not impact them.

Only for clients which need continuous voltage can have a possible impact.
(explained in subsequent para)

let me know if you still think the commit needs modifications/improvement.

> 
> > specified in the regulator's device tree settings, which can
> > cause issues for consumers like the display and UFS that require
> > a consistent voltage setting from the bootloader state until
> > their drivers are probed.
> 
> It sounds like this should be handled through the .sync_state rather
> than just reading the voltage. Please correct me if I'm wrong, even with
> the .get_voltage_sel() in place the regulator framework still can lower
> the vote.

I think i understand, what problem you are alluding to.. for which .sync_state
is needed. We have a different series(with sync_state() logic) under testing
for that. We will be posting that out soon.

(Why sending it in 2 series?)

To elaborate,
there are 3 possible cases for a rail that is ON during boot:-

Case#1 (no client probe() voting for voltage) 
------
Don't care - regulator framework will turn OFF unused rails in late_cleanup()


case#2 (1 client needs rail ON during boot and votes for it )
------
We have real use case for UFS2.0/3.0 where a (dedicated/unshared) rail is
turned ON by bootloader with voltage that is good for UFS2.0 but gets lowered
to `min-microvolt` voltage (OK for UFS3.0, but NOK for UFS2.0) by the regulator
framework because it can't read the voltage set in boot, leading to UFS2.0 to
malfunction or get damaged.

NOTE - This is `what` we are handling in this series. Avoiding the unnecessary
overwriting of the voltage to min, by regulator framework by providing it a
way to read voltage set in boot.


case#3 (2 or more clients case) 
------
Voltage/ON/OFF state can be different based on the order of client probe().

To avoid issues due to a possible race, it needs `.sync_state()`to hold the
voltage to a value >= boot voltage.

But this we have planned to handle in next series, as that would probably
make this series more complicated.

(do you think we should merge this together?)

> 
> > 
> > To address this issue, enhance the `get_voltage_sel()`, and also
> > add new `get_status()` callbacks to read the regulator settings
> > directly from the RPMH hardware using the `rpmh_read()`function.
> > This change ensures that the regulator framework accurately
> > reflects the actual state of the regulators, avoiding unnecessary
> > voltage adjustments and maintaining consistent power settings
> > across the transition from bootloader to kernel.
> > 
> > Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Link: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-2-ae583d260195@oss.qualcomm.com
> > ---
> >  drivers/regulator/qcom-rpmh-regulator.c | 164 ++++++++++++++++++++++++++++++++
> >  1 file changed, 164 insertions(+)
> > 
> > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> > index 947fb5241233c92eaeda974b1b64d227d5946a59..9f693043cb87aa77a7a529b5b973323450db80be 100644
> > --- a/drivers/regulator/qcom-rpmh-regulator.c
> > +++ b/drivers/regulator/qcom-rpmh-regulator.c
> > @@ -61,8 +61,13 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
> >  };
> >  
> >  #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
> > +#define RPMH_REGULATOR_VOLTAGE_MASK		0x1FFF
> > +
> >  #define RPMH_REGULATOR_REG_ENABLE		0x4
> > +#define RPMH_REGULATOR_ENABLE_MASK		0x1
> > +
> >  #define RPMH_REGULATOR_REG_VRM_MODE		0x8
> > +#define RPMH_REGULATOR_MODE_MASK		0x7
> >  
> >  #define PMIC4_LDO_MODE_RETENTION		4
> >  #define PMIC4_LDO_MODE_LPM			5
> > @@ -169,6 +174,7 @@ struct rpmh_vreg {
> >  	bool				bypassed;
> >  	int				voltage_selector;
> >  	unsigned int			mode;
> > +	unsigned int			status;
> >  };
> >  
> >  /**
> > @@ -213,6 +219,36 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
> >  	return ret;
> >  }
> >  
> > +static int rpmh_regulator_read_data(struct rpmh_vreg *vreg, struct tcs_cmd *cmd)
> > +{
> > +	return rpmh_read(vreg->dev, cmd);
> > +}
> > +
> > +static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
> > +{
> > +	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> > +	struct tcs_cmd cmd = {
> > +		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
> > +	};
> > +	int min_uV = rdev->constraints->min_uV;
> > +	int max_uV = rdev->constraints->max_uV;
> > +	int ret, _uV = 0;
> > +
> > +	ret = rpmh_regulator_read_data(vreg, &cmd);
> > +	if (!ret)
> > +		_uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
> > +	else
> > +		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
> > +
> > +	if (!_uV || (_uV >= min_uV && _uV <= max_uV))
> > +		*uV = _uV;
> > +	else
> > +		dev_dbg(vreg->dev, "read voltage %d is out-of-range[%d:%d]\n",
> > +						_uV, min_uV, max_uV);
> > +
> > +	return ret;
> > +}
> > +
> >  static int _rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
> >  				unsigned int selector, bool wait_for_ack)
> >  {
> > @@ -254,10 +290,36 @@ static int rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
> >  static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
> >  {
> >  	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> > +	int ret, uV = 0;
> > +
> > +	if (vreg->voltage_selector < 0) {
> 
> Why do we return the cached value instead of always reading it from the
> hardware?

The rpmh register that we are reading here is dedicated to APPS, it will not
show the `actual` voltage on the rail, but the voltage that is voted from APPS.

So its only needed when the device boots and we have no cached value for the
voltage. However, once the value is set once, the cache value will be always
a shadow copy of what is written in the rpmh register.

side note - Mark had initially (in v1) suggested to bootstrape mode & status
and keep get_voltage_sel() as is, so i did not bootstrape voltage.

> 
> > +		ret = _rpmh_regulator_vrm_get_voltage(rdev, &uV);
> > +		if (!ret && uV != 0)
> > +			vreg->voltage_selector = regulator_map_voltage_linear_range(rdev,
> > +							uV, INT_MAX);
> > +	}
> >  
> >  	return vreg->voltage_selector;
> >  }
> >  
> > +static enum regulator_status convert_mode_to_status(int mode)
> > +{
> > +	switch (mode) {
> > +	case REGULATOR_MODE_FAST:
> > +		return REGULATOR_STATUS_FAST;
> > +	case REGULATOR_MODE_NORMAL:
> > +		return REGULATOR_STATUS_NORMAL;
> > +	case REGULATOR_MODE_IDLE:
> > +		return REGULATOR_STATUS_IDLE;
> > +	case REGULATOR_MODE_STANDBY:
> > +		return REGULATOR_STATUS_STANDBY;
> > +	case REGULATOR_MODE_INVALID:
> > +		return REGULATOR_STATUS_ERROR;
> > +	default:
> > +		return REGULATOR_STATUS_UNDEFINED;
> > +	};
> > +}
> > +
> >  static int rpmh_regulator_is_enabled(struct regulator_dev *rdev)
> >  {
> >  	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> > @@ -287,6 +349,15 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
> >  	if (!ret)
> >  		vreg->enabled = enable;
> >  
> > +	if (vreg->enabled) {
> > +		if (vreg->bypassed)
> > +			vreg->status = REGULATOR_STATUS_BYPASS;
> > +		else
> > +			vreg->status = convert_mode_to_status(vreg->mode);
> > +	} else {
> > +		vreg->status = REGULATOR_STATUS_OFF;
> > +	}
> > +
> >  	return ret;
> >  }
> >  
> > @@ -323,6 +394,15 @@ static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
> >  		cmd.data = pmic_mode;
> >  	}
> >  
> > +	if (vreg->enabled) {
> > +		if (bypassed)
> > +			vreg->status = REGULATOR_STATUS_BYPASS;
> > +		else
> > +			vreg->status = convert_mode_to_status(mode);
> > +	} else {
> > +		vreg->status = REGULATOR_STATUS_OFF;
> > +	}
> > +
> >  	return rpmh_regulator_send_request(vreg, &cmd, true);
> >  }
> >  
> > @@ -342,6 +422,22 @@ static int rpmh_regulator_vrm_set_mode(struct regulator_dev *rdev,
> >  	return ret;
> >  }
> >  
> > +static int rpmh_regulator_vrm_get_pmic_mode(struct rpmh_vreg *vreg, int *pmic_mode)
> > +{
> > +	struct tcs_cmd cmd = {
> > +		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_MODE,
> > +	};
> > +	int ret;
> > +
> > +	ret = rpmh_regulator_read_data(vreg, &cmd);
> > +	if (!ret)
> > +		*pmic_mode = cmd.data & RPMH_REGULATOR_MODE_MASK;
> > +	else
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> >  static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
> >  {
> >  	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> > @@ -349,6 +445,13 @@ static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
> >  	return vreg->mode;
> >  }
> >  
> > +static int rpmh_regulator_vrm_get_status(struct regulator_dev *rdev)
> > +{
> > +	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> > +
> > +	return vreg->status;
> > +}
> > +
> >  /**
> >   * rpmh_regulator_vrm_get_optimum_mode() - get the mode based on the  load
> >   * @rdev:		Regulator device pointer for the rpmh-regulator
> > @@ -407,6 +510,7 @@ static const struct regulator_ops rpmh_regulator_vrm_ops = {
> >  	.list_voltage		= regulator_list_voltage_linear_range,
> >  	.set_mode		= rpmh_regulator_vrm_set_mode,
> >  	.get_mode		= rpmh_regulator_vrm_get_mode,
> > +	.get_status		= rpmh_regulator_vrm_get_status,
> >  };
> >  
> >  static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
> > @@ -418,6 +522,7 @@ static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
> >  	.list_voltage		= regulator_list_voltage_linear_range,
> >  	.set_mode		= rpmh_regulator_vrm_set_mode,
> >  	.get_mode		= rpmh_regulator_vrm_get_mode,
> > +	.get_status		= rpmh_regulator_vrm_get_status,
> >  	.get_optimum_mode	= rpmh_regulator_vrm_get_optimum_mode,
> >  };
> >  
> > @@ -430,6 +535,7 @@ static const struct regulator_ops rpmh_regulator_vrm_bypass_ops = {
> >  	.list_voltage		= regulator_list_voltage_linear_range,
> >  	.set_mode		= rpmh_regulator_vrm_set_mode,
> >  	.get_mode		= rpmh_regulator_vrm_get_mode,
> > +	.get_status		= rpmh_regulator_vrm_get_status,
> >  	.set_bypass		= rpmh_regulator_vrm_set_bypass,
> >  	.get_bypass		= rpmh_regulator_vrm_get_bypass,
> >  };
> > @@ -438,6 +544,7 @@ static const struct regulator_ops rpmh_regulator_xob_ops = {
> >  	.enable			= rpmh_regulator_enable,
> >  	.disable		= rpmh_regulator_disable,
> >  	.is_enabled		= rpmh_regulator_is_enabled,
> > +	.get_status		= rpmh_regulator_vrm_get_status,
> >  };
> >  
> >  /**
> > @@ -546,6 +653,58 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
> >  	return 0;
> >  }
> >  
> > +static int rpmh_regulator_determine_initial_status(struct rpmh_vreg *vreg)
> > +{
> > +	struct tcs_cmd cmd = {
> > +		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
> > +	};
> > +	int ret, pmic_mode, mode;
> > +	int sts = 0;
> > +
> > +	ret = rpmh_regulator_read_data(vreg, &cmd);
> > +	if (ret) {
> > +		dev_dbg(vreg->dev, "failed to read ENABLE status ret = %d\n", ret);
> > +		vreg->status = REGULATOR_STATUS_UNDEFINED;
> > +		return ret;
> > +	}
> > +
> > +	sts = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
> > +	if (!sts) {
> > +		vreg->status = REGULATOR_STATUS_OFF;
> > +		return 0;
> > +	}
> > +
> > +	if (vreg->hw_data->regulator_type == XOB) {
> > +		vreg->status = sts ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
> > +		return 0;
> > +	}
> > +
> > +	ret = rpmh_regulator_vrm_get_pmic_mode(vreg, &pmic_mode);
> > +	if (ret < 0) {
> > +		dev_dbg(vreg->dev, "failed to read pmic_mode ret = %d\n", ret);
> > +		vreg->mode = REGULATOR_MODE_INVALID;
> > +		vreg->status = REGULATOR_STATUS_UNDEFINED;
> > +		return ret;
> > +	}
> > +
> > +	if (vreg->hw_data->bypass_supported &&
> > +			vreg->hw_data->pmic_bypass_mode == pmic_mode) {
> 
> Wrong indentation

sorry will fix this.

> 
> > +		vreg->bypassed = true;
> > +		vreg->status = REGULATOR_STATUS_BYPASS;
> > +		return 0;
> > +	}
> > +
> > +	for (mode = 0; mode <= REGULATOR_MODE_STANDBY; mode++) {
> > +		if (pmic_mode == vreg->hw_data->pmic_mode_map[mode]) {
> > +			vreg->mode = mode;
> > +			break;
> > +		}
> > +	}
> > +
> > +	vreg->status = convert_mode_to_status(vreg->mode);
> > +	return 0;
> > +}
> > +
> >  static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] = {
> >  	[REGULATOR_MODE_INVALID] = -EINVAL,
> >  	[REGULATOR_MODE_STANDBY] = PMIC4_LDO_MODE_RETENTION,
> > @@ -1820,6 +1979,11 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
> >  						vreg_data);
> >  		if (ret < 0)
> >  			return ret;
> > +
> > +		ret = rpmh_regulator_determine_initial_status(vreg);
> > +		if (ret < 0)
> > +			dev_err(dev, "failed to read initial status for %s\n",
> > +					vreg->rdesc.name);
> >  	}
> >  
> >  	return 0;
> > 
> > -- 
> > 2.25.1
> > 
> 
> -- 
> With best wishes
> Dmitry


Regards,
Kamal

