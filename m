Return-Path: <linux-arm-msm+bounces-63899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537BAFAF3C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C0921AA0142
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B60128C2DC;
	Mon,  7 Jul 2025 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjulOvaN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D723220F2D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879380; cv=none; b=juePV/grcOrSHsx4Rpg4U0hvLNr/0PEuqopXhpD0GrHqWC2YqQS/d7nNuqwkiUfYj4K0+L7i5kfSBrEBH3WpmolP/h5SOkOUPq8zRD4F5z3bXTYYdkMvbiau/rx00PDosz0Xd7uJYSvCkL+DpmXBvmBlJtkpZ0AtzQ5vFKG690Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879380; c=relaxed/simple;
	bh=peFKZhFwedKK68dIFIi4REQ/qFa/6M/SrX4nzwboeGs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBY6SfR1GHo4xWhmnMSNCZNiSrhKx5cxUH2gyK6rSYQQNh8oHvIZfCSB9hTQoVxaWeYilrKp+U3/zlEt3K0yItuniP6inxjR6r5wQb6Py5HkhbxeXdgL1bvxqi8+O/7eg2WYzVptJ9uIx3eKsVCiYMz1qWkEPD3UfTEq563eBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjulOvaN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56798hF1023655
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 09:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VeHPkLQlAJtFoDvPLLCaGfKY
	61RilrGEq+YmYIpz8WQ=; b=KjulOvaNTNDb76cComAJ5M8Hwz+y49/Vt/Y+5bGE
	uW9kg+NHEzRYFUhg2cBUpwCMjzrN9nLcMQnxVuvki9fgncllv3TNufZsxOoL1V0M
	GivYPOK8qQ3L41JPSVj+9BEQJd9kvA+LtodIVkbo5MX938g40+HTJ15QPwic8ONJ
	nJcAlERhsIReY8sYI3XFQAh2IEL6ANPkMRJjZ65bfUP2wT5/0q3+W2JkO4hbPXNH
	WWPHF4aeirQ2H6EFO3dFohpte6nolFy2QeGbktq7sHAA0M/TOxI4XsYb2BVpzczH
	C7j0icpUUdAOV3bzfNpyXq1ByAALs8EjXjClIJQ8yh3R2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0w3g36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 09:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09ed509aaso354561785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879376; x=1752484176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeHPkLQlAJtFoDvPLLCaGfKY61RilrGEq+YmYIpz8WQ=;
        b=s6VAdT/TUt+dBFx87eM/Ci+aQ/tu/G6pQbTCpzq1HI+vm3g/SwewxiR12JlCq75iMh
         B+XqWG1DS13kqcUMmYB0ZJl6VI6Tq7+dnAY3L2X/JuJb2O9T8w4ntN86czU5O/2AeLK1
         cHHvfWAMUTbziQRfSqbREmirmeOAhiwj2fzpuHRMiO5EUMrUG0O/jJ/05UmQLIfSXiZC
         gBFcNAjokjlnqiQj0n4MmlOpRDh8qOxgkF2FC1F1BpVYQUYPS0EpyPruQ4NQqhs46FGC
         UCp5eSMeVnXqrMhqVPeisjglDGGe+yBHbb8z+Dmw/vISBPDutJU/p8R2RJSaJRRm8I60
         ujcA==
X-Forwarded-Encrypted: i=1; AJvYcCV4d78ynCjuRYgC8KXNThrquiJWt6MZxqe8gZvyzHtuUyc1cLWIFRut+8c5SZKAwEYR03UX0YLpkVzkiLMb@vger.kernel.org
X-Gm-Message-State: AOJu0YwgfxRvSzfq+AZtM42sQThBzH2TPdmuIwEO5x19Vo8m10gJ56OH
	xckJLw8FhodsGo09qvChZOJttVy5LfEdNol7RRA+r2I6Z1W3d1C5Y8lJsCbaWvFNZyRG1XZ5WvY
	zJ2eu63+vGkiiNVgIqMfEe2bkgaUJo7SqU+RfirJYZ5fALr9tKaSi3aToOSTyjvsolss/
X-Gm-Gg: ASbGncunOcdqGeWNLtaSn07WJa23VCznpCvBizhD5kBWGJDhaHfS9RY0u39gXffiQU8
	Rbfjqw9Ge55hCnEzsuDX9UCaYHspsVx2rtbRB+8SA+GsJ2eIs+iLgQIL0H5KjRgQBhP3rz16UCZ
	zcQMGo359pyc75GwBIkHGemIPCd7KagVDM94X2sg5pYAy9O0Motd/7gwuPehxJHZh61oCaleeCX
	MjSWrGZo2DAACdOZby8233J6H8bnuHZTiAq4QRgaCqaOxl2CtBbm6DIxNgablLL0JS5GT1vbwXj
	nNZfEiz/41utZGYsGXwEgB9k+cW4Kj391DERfr3IUXCVpX0rl5W5PYE=
X-Received: by 2002:a05:620a:199f:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d5ef0fe66dmr992952185a.10.1751879375870;
        Mon, 07 Jul 2025 02:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkFAscEaQYMChKaP818khtKeWZorHRhJFez5DUN7e7xcaSYzI61t7Vo/NC+j8GjNSpIQbQbA==
X-Received: by 2002:a05:620a:199f:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d5ef0fe66dmr992948085a.10.1751879375228;
        Mon, 07 Jul 2025 02:09:35 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a755sm9625686f8f.78.2025.07.07.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:09:34 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:09:33 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aGuOzdCu5UmKDF94@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
 <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com>
X-Proofpoint-ORIG-GUID: 0KT6M0rO9Es5cGeRVOcSX1mdphKz-mCM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MSBTYWx0ZWRfX9d9xKuLr0xO0
 zIg3wso+IGJUyqRUeSytoZOwLNJiKlmgXkTf5s73bN5YERwWdaEXKsQjfsSbjauOC9CVwuZ8Oig
 mjnGShWZFF6GfnB2HnSwe352HzKWAKcihXEcg3uyoaZ5CSLcMxuK5LTizgI7j5KvaiaLMTI1kSi
 foy0ie06nE6x8uG2Kb8gDN/GPZ+jJw6rtaE617WjiR81hWWjBNMWqXIE66bfTv4g0ZJkaLP4wkB
 NZoA1Nrej1Gkn4KwCOZI1GHWTy6H46OyJDxmC15xNsH+PhUvA/eia8Q/31XyehA37GRrgI7fx0l
 ZJ4XwegYV6dzRU5cxxyd3Kl6lVZdQaQL30TIC2azN/0+yLRf0i7slhETc8tRYUyMC+0Q8rtiRIV
 YkLHMg8JqAjn1zNpVXF3V0iPh2obLev6rfCeEEH0uGY/aSBPkDDS/H3e3bCIlFHFsytU5hjc
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686b8ed1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JosbUmaTz5S-ISoLy78A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0KT6M0rO9Es5cGeRVOcSX1mdphKz-mCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070051

On 27/06/25 18:46:10, Dikshita Agarwal wrote:
> 
> 
> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > Add a qcm2290 compatible binding to the venus core.
> > 
> > Video encoding support is not exposed until the relevant hardware
> > capabilities are enabled.
> > 
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index 736ef53d988d..f1f211ca1ce2 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
> >  	.enc_nodename = "video-encoder",
> >  };
> >  
> > +static const struct freq_tbl qcm2290_freq_table[] = {
> > +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
> > +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
> > +};
> > +
> fix this corner.

ok, will wait for Vikash to confirm the other ones.

> > +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> > +	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
> > +};
> > +
> what is the reference for this?
> > +static const struct venus_resources qcm2290_res = {
> > +	.freq_tbl = qcm2290_freq_table,
> > +	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
> > +	.bw_tbl_dec = qcm2290_bw_table_dec,
> > +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> > +	.clks = { "core", "iface", "bus", "throttle" },
> > +	.clks_num = 4,
> > +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> > +	.vcodec_clks_num = 2,
> > +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> > +	.vcodec_pmdomains_num = 2,
> > +	.opp_pmdomain = (const char *[]) { "cx" },
> > +	.vcodec_num = 1,
> > +	.hfi_version = HFI_VERSION_6XX_LITE,
> s/HFI_VERSION_6XX_LITE/HFI_VERSION_4XX_LITE

um right, going to rewrite this whole bit and get rid of
6XX_LITE/4XX_LITE (will post 4XX with a lite option instead, which is
closer to the intended abstraction - even though the 6XX/4XX
abstractions are kind of dubious...)

> 
> Thanks,
> Dikshita
> > +	.vpu_version = VPU_VERSION_AR50_LITE,
> > +	.max_load = 352800,
> > +	.num_vpp_pipes = 1,
> > +	.vmem_id = VIDC_RESOURCE_NONE,
> > +	.vmem_size = 0,
> > +	.vmem_addr = 0,
> > +	.cp_start = 0,
> > +	.cp_size = 0x70800000,
> > +	.cp_nonpixel_start = 0x1000000,
> > +	.cp_nonpixel_size = 0x24800000,
> > +	.dma_mask = 0xe0000000 - 1,
> > +	.fwname = "qcom/venus-6.0/venus.mbn",
> > +	.dec_nodename = "video-decoder",
> > +};
> > +
> >  static const struct of_device_id venus_dt_match[] = {
> >  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
> >  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> > @@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
> >  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> >  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
> >  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> > +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, venus_dt_match);

