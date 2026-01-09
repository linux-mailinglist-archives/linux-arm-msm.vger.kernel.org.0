Return-Path: <linux-arm-msm+bounces-88288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB7D0A8A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 15:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07F903015E13
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 14:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81C533C1A5;
	Fri,  9 Jan 2026 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OP7K5wzY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxoGpER6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5624F21C9EA
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967424; cv=none; b=fU6hpXc21GCsxBSLK8W9Suw6TjeLm3eV+vX4Q56meSsv/gCMxhbMrQ/kks00TKTokQ5WK93Yym9ZIEdu1lS2CZDsSDEr/vaGrDQUClxcn/WitqlT5iTczQkajHIs5xDSLjMfsNiIIrSp6BTGVvh+I+v+Yvc4eW/nmYRiB2AuBlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967424; c=relaxed/simple;
	bh=RdtMykOjmEtDG9g2kE/0xnXGya/GK8cV0nOc7GKalLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HM+zS82GiwmeflmholU/lBRyy1s4r4vmUyGOq7YWOfJpfaBgu+XrgWVHbV32n9X2nYCGy7b3NqZ9BUwVvFqx9LftqnGZibEzLWZH8ij7z6x3riDCdpwqSqHTKSzKb0iBC5mYGKrvSW/05eIpjQsLHQ0Zcj2cpnSFDUVwqjQJFMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OP7K5wzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxoGpER6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099S1ZN3325292
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 14:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GQs+SI3tCjQDH71MvlNczL4V
	y/mRHLL8bORmki3/saY=; b=OP7K5wzYi6pRQjj/xiJ6j0JPK4OapKnfj/H+miEd
	RgoNbXsUBJsDoIvX4uPBSrl7lU4l7rsnDQa/jYwWlY5LAUbe9yNn/x/lcucOPc4T
	CYWZJo0sVX8FDQ2lessV3P9uUoZjkuphYkZimk2zPO5Wt1F+1KZ68KMsTzU9SO3k
	Y5UJXL86UQIj571/qQ72weDV9LDBQqFwFONwPSJCebUwGw7/onuw9AXKYqsx0alN
	p257LKp64ycY2BFwIXg5i1m4AhIcmYw7kqjvaOGjC/PeYSD4+Fw67AGCzmCMteTZ
	v91N2XRnc+vEj8Qkfx/f1FxDEpl2egWmZUj11WFfeEr+xg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6j15p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 14:03:42 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-45a5531f3f1so8319341b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 06:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767967422; x=1768572222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQs+SI3tCjQDH71MvlNczL4Vy/mRHLL8bORmki3/saY=;
        b=DxoGpER6lHD82/3h9eR50Jmspi7zsgRzzBIzHcDlhlPRlCFkIluzQSOs9CvjukcZpT
         TvXXjHAz09HnUtOjjbMQNINE50/OFu/4rAdCCaMdTHKrUYLzySb3vgh1TflGf9fwGlDN
         rJYuyXbCvS41WhXL1vxiOSvve484XjaYKd4c1gTzw1NApDHC5Fo0tdjahA/km7DRimho
         2sdJxJD1ib12D7NNbAEQpeaJ8f0eYL2Z5cJSAQUa9sPF1gT97VXWwz10OIkWs3Fs2lWB
         LoSEoEgNEtE8ICOIgCHAtAP5sJqJZS3Z4Sf8d2K18PsXPKOdBjmHt68B9xY7YLaIFTPZ
         f4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767967422; x=1768572222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQs+SI3tCjQDH71MvlNczL4Vy/mRHLL8bORmki3/saY=;
        b=kkkIlnoF50Osl1f0k971sUct7Qa3IdrJv6Tbr/Z/JHhbjS0Dlc1KCEyvJlq/Hvp7xr
         3xS+53DZfLIkvR3U3x7hPb+PSILNrrRQ8UnpEaEvjWospQRnwDfEEYfVlLTqSqn6kvJ3
         ctb6nnobGPGYh2294GPOFD75LEifJEIP8/bsS3Tea8GoUHO5nyewGvlE7LwGpCpR10Jg
         9ZAjxjXz403Sn6lSE90tAJwLhh0MUoFgtPqmzuOQyeIr5fayY1KcArIWSpd90X3RB9Vl
         I1WB8yDYqCYkD/9QPmEJTubSUAhRoJQV23+2KaYh9Ce2u91NeKzMvvQB/G3fd5UJAKWY
         QPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTsjVPLkLBZa0fdnEfuC8KGpo7TTLmazz5mgcX4CPHukOuiIO8IVrv09H3p+IXGan0ZYUh+r3KlY8B7Vj9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78oMDsEwdHRFoRgWgGd/RRaOIkUlQwUgR8pcpGEEJF0ob9crc
	tESLDl4QyfHMPrzBhw6WKHea53HThMZYvf8XNY4yQA8t+5FXK4h9MVVYvR+NvjI4CtIgAKAMXdh
	umTfNBq8VuCl6cV2mv9qX2+uetxnQv6IUi8i0GT8uwbD74Lr5b59cH+t9ZbBPzs/gJBru
X-Gm-Gg: AY/fxX4E8FHosdpmtaAcbxVML0YptS8Bd480YX6I5mBsRuPxrNAdpL12ZqyMaSYjT8j
	fQaGkRCb7ngSlEIfhidT75eldkqmxapRpAj1GP9Hj56xZkOTjsbjhtv2vN2wrbbwweHrytjCAzo
	rAFvm+bkm0wluAzV+q3udgkL8nywJjrvc8CE/NUHeoAZ4iCfYQQJ0m5vwGo8O0SHq+JTjxcIn2O
	JQakVy+3D55YaCyFv28O4Tu0ABy7jIm5GdM5IDFXKHygMBBJ+fJkW8vJiGb6hisnJiPdAZP6ybp
	QdgDglhhgO2rJKyJpZijRx565UQAVSmJiTLNW8EX48cEhDTjl8BmqXYQzY70KHhQoIIG6BKTnVS
	dFDtl1Qkf7lEy9YlMwv6TEwuo0rwtmdyNHdTLsYGSDg6nJUkFifqh+zCTJbCnVrc6YIW39IC7xJ
	YNZaGhAK0RjjPdwwUwaGNV72k=
X-Received: by 2002:a05:6808:528e:b0:450:a9d0:b790 with SMTP id 5614622812f47-45a6beb59efmr5451135b6e.46.1767967421572;
        Fri, 09 Jan 2026 06:03:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhed6/gC1XQdYPnbtJvfwFpetbHTMNUPdnIOYHCqjQqJOeAFrw62c6frHz86sCY1b039DemA==
X-Received: by 2002:a05:6808:528e:b0:450:a9d0:b790 with SMTP id 5614622812f47-45a6beb59efmr5451093b6e.46.1767967420959;
        Fri, 09 Jan 2026 06:03:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38302bd92fbsm14199561fa.3.2026.01.09.06.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:03:39 -0800 (PST)
Date: Fri, 9 Jan 2026 16:03:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/5] phy: qcom: qmp-pcie: Skip PHY reset if already up
Message-ID: <cvxvq7f2ku6aq5gbbqav42ckqk2raesbxq2bx46mxvapcza5v4@5zuyjdtn5us2>
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
 <20260109-link_retain-v1-1-7e6782230f4b@oss.qualcomm.com>
 <nmle3y6nb4kjcwstzqxkqzaokeyjoegg6lxtmji57kxwh5snxa@p76v6dr7rgsg>
 <53f0c45f-7f5c-4abd-af84-cbb82d509872@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53f0c45f-7f5c-4abd-af84-cbb82d509872@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEwNCBTYWx0ZWRfX9Sww8NUznPqk
 FkXeEU1/xlHGB3RWE5HrHUtCyVlANBrPi9KD1pOVOwMOa0EK6hj5rcGjXjWRtUU12zS7xdqejw8
 Xntl0rgBHj4Vtb5rI4B2Og8tyVVjQ44Y5fLI8reZPSMABIJIMrtK1d2Ah6LwUXBtyXavEtTuNrb
 EwNo+9/1gC9Yvo1oAOOWJFWU9R7bdScZqundDlMzATRGhZA3H8I/hQesxDG5hKYi8hXwNNw4He5
 Tu/1UaXoRP/a/DaHjSZ5VSWYSt/gxYFXsM/paVd8HQ/TQETzdMPPToOYt845mn6aGDfwfieJOU2
 IICR5HxynonGr47Tx6wdoIeR8iC9irW2ACrT+9SO9qZakpuZ4170dmU2pahm6Ad5Bcuhw042V/u
 nH7zpX8OQ3RH7pkC3/DkWoFRiEhgMB1JYa+Yt685MtiU8OnloKcH4jc2JVH4d5SScbYJ5fFw61n
 EALEdmIcV+EkoMnvu5Q==
X-Proofpoint-GUID: netUPzLF0Me37BF5l9s4u2z3nipfQe5r
X-Proofpoint-ORIG-GUID: netUPzLF0Me37BF5l9s4u2z3nipfQe5r
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=69610abe cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lHV2lZlUvwFcl_mAknkA:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090104

On Fri, Jan 09, 2026 at 02:10:49PM +0100, Neil Armstrong wrote:
> On 1/9/26 14:08, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 12:51:06PM +0530, Krishna Chaitanya Chundru wrote:
> > > If the bootloader has already powered up the PCIe PHY, doing a full
> > > reset and waiting for it to come up again slows down boot time.
> > 
> > How big is the delay caused by it?
> > 
> > > 
> > > Add a check for PHY status and skip the reset steps when the PHY is
> > > already active. In this case, only enable the required resources during
> > > power-on. This works alongside the existing logic that skips the init
> > > sequence.
> > 
> > Can we end up in a state where the bootloader has mis-setup the link? Or
> > the link going bad because of any glitch during the bootup?
> 
> Good question, can we add a module parameter to force a full reset of the PHY in case
> the bootloader is buggy ?

I'd suggest a simpler thing: if the reset was skipped, reset the PHY in
case of an error and retry. That's also one of the reasons why I asked
for skip_reset not to be the persistent value.

> 
> > 
> > > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 28 ++++++++++++++++++----------
> > >   1 file changed, 18 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > index 86b1b7e2da86a8675e3e48e90b782afb21cafd77..c93e613cf80b2612f0f225fa2125f78dbec1a33f 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > @@ -3153,6 +3153,7 @@ struct qmp_pcie {
> > >   	const struct qmp_phy_cfg *cfg;
> > >   	bool tcsr_4ln_config;
> > >   	bool skip_init;
> > > +	bool skip_reset;
> > >   	void __iomem *serdes;
> > >   	void __iomem *pcs;
> > > @@ -4537,6 +4538,9 @@ static int qmp_pcie_init(struct phy *phy)
> > >   		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
> > >   		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);
> > > +	qmp->skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
> > 
> > It is definitely not a long-term state, there is no need to store it in
> > qmp_pcie struct.
> > 
> > > +							    cfg->phy_status);
> > > +
> > >   	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
> > >   		dev_err(qmp->dev, "Init sequence not available\n");
> > >   		return -ENODATA;
> > > @@ -4560,13 +4564,15 @@ static int qmp_pcie_init(struct phy *phy)
> > >   		}
> > >   	}
> > > -	ret = reset_control_assert(qmp->nocsr_reset);
> > > -	if (ret) {
> > > -		dev_err(qmp->dev, "no-csr reset assert failed\n");
> > > -		goto err_assert_reset;
> > > -	}
> > > +	if (!qmp->skip_reset) {
> > > +		ret = reset_control_assert(qmp->nocsr_reset);
> > > +		if (ret) {
> > > +			dev_err(qmp->dev, "no-csr reset assert failed\n");
> > > +			goto err_assert_reset;
> > > +		}
> > > -	usleep_range(200, 300);
> > > +		usleep_range(200, 300);
> > > +	}
> > >   	if (!qmp->skip_init) {
> > >   		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
> > > @@ -4641,10 +4647,12 @@ static int qmp_pcie_power_on(struct phy *phy)
> > >   	if (ret)
> > >   		return ret;
> > > -	ret = reset_control_deassert(qmp->nocsr_reset);
> > > -	if (ret) {
> > > -		dev_err(qmp->dev, "no-csr reset deassert failed\n");
> > > -		goto err_disable_pipe_clk;
> > > +	if (!qmp->skip_reset) {
> > > +		ret = reset_control_deassert(qmp->nocsr_reset);
> > > +		if (ret) {
> > > +			dev_err(qmp->dev, "no-csr reset deassert failed\n");
> > > +			goto err_disable_pipe_clk;
> > > +		}
> > >   	}
> > >   	if (qmp->skip_init)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

