Return-Path: <linux-arm-msm+bounces-54213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D3A87D3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16BE07AA012
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEA726770A;
	Mon, 14 Apr 2025 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WS4iXlHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629682676D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625606; cv=none; b=VFVMgRPJ2S7+fLrtazoqBbdFHW5t8Ah4jNeITW7GeOpLnZE6Oyvj922MKfxU0qNuywhW8v5PhrFdtTjYA5o99Em0MAoglVA/hdy7hN4yTBIGf+rxMnaVe+ECsWciZFyDFd5RhDYAQCM+6mHZ1OSXZ4hounq6taCpWGljyrWvQ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625606; c=relaxed/simple;
	bh=JyWeZEpKoFJ2MTnGd7zb0bEz198j7FjVbkRh4IEcWZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Erb3Nrk6Q8zDycQHfVTSzWCt12Y/0gXvCQaGlpDfkl0ropRXA6m0op4DGcZuy1hUiwA3TJp9O4c8icCAdSYj1cHoIgjkZjzMb9bZYLuW2Sk3oBkALEtufSLgUiBhX814sNH5LAIB8v5X1dakoviJkESVCqPBZfORBYrcPC5+PB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WS4iXlHb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qOQ030635
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KOk2FJOKln1h9f40tHitRpBq
	43JW0qQMBy6iSTVf1/0=; b=WS4iXlHbTYtaJSM3MUAtdKvZ5Zx+1FCSrjlluP2c
	OCI68f2HbGwYmmUwhQ16MY4Vj/4zF0Q8NCYx24E/PJZec9ydkyBLEUaOJYNsOpCV
	Pp4rdFhaKR4J9EAaeGUDOhC46Wi4iIa32uz72YIq56xj9iDEISc46Ln8GrpXNzRC
	BB6n8Tjzph+ivmmVM02+Uws113tFhW9tm+2PPoS0sUqRmH0YuSJcaW10sKwEITz8
	BX1vmX5bai0K51JeB6DY3+etvqQJ0F2EJAHeBldQ4CBFgZAssAQYJE9VCLZKf8RN
	/zJtQ20MxWGPur6l3FQSE/MLdfZ3L6/CQfv2zY/ToA+Mww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj4bag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:13:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so473194685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 03:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625602; x=1745230402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOk2FJOKln1h9f40tHitRpBq43JW0qQMBy6iSTVf1/0=;
        b=NLd6OcoCay2BKeS7LcIqOLSm4Npy4jIHUS3miuqnaRiuR0Kew4bHfWVxQ3lmgUSPDP
         uT5AECEvd0/okJC90aymD4RJM6Ypc9oZNEEgU5WJK+ZQzZQSqOpxkDFKXqUWoh7AhPZ9
         M5koSAhe6sf4lTI8k2jQWrG05KTJgOcxlqeWzJ0SEwFdV8k39W9XNiGpucdaD8mP1bJI
         +vtbHdKjc5NKG9uCPW88taM9JpL5ytjZ+dVBRptfjUb/cewe/olVv6mHCbTWmItVXrq5
         S70Zb72GTP/F/WweU+noF0PcEE3sJx/pY+EO/8RDLXG8WQT4wfv2C3P5e2Il8nMKGHc7
         9U/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyvHuBk2/sn/O8uNfckSKI57QVWSKpeeiJnBIKYGOBXHJkzDnnGjvjHSvmo26OMOm//5aQQK72tYXc9u8A@vger.kernel.org
X-Gm-Message-State: AOJu0YytoPF7PKfSC0CEHhkJI1ZM9VeUN/n+QmoCWjukPkyTDpLWZ6MR
	wxrKR4bhLjGkLm1S22iHYM8n52/ISkJxylJJgvwyrmhGIckh3DlYwO5XaXZ+v9aspw47V2zJKt2
	c+UUAEHU/jqmNMjUAkGcHqiEANVLATnzRfvLHKmx5mMiYvDFJt12uZTSOYGANxYUB
X-Gm-Gg: ASbGnctb5jT7BJB25l+9KrTVrso5aTIXHBSMaJhxtd4c7RmQj+IT4aq5R8SlA4zR98u
	1QPXGHKt0HNJxI2HU3FkGhw0QMUPSQZG+zsuOGJDUvIHYNIrF9RZHoEyiULuwpLPhZ85mjP3PIr
	RA8A3b4FtCK07etVb9AlyRkWoqIDzdcD9Tbft9l5vIfgOSsiKmCv3wlg4BdePhFJ0pfNL12fUiC
	aCRJQMmixehIlMxbx55mbsYFR2w3O3Mf1xXOaUEDr5ogDL132oN1my+xSmv+pQzeSddhQyhzAvR
	anes/UWPTO4dnPjQzTbpfCf6ps7yKIz4SqkroDKhv/UWxQ3tg6Ei1a2aj0XvUV3HDYmejAczgAA
	=
X-Received: by 2002:a05:620a:424b:b0:7c5:49ee:86aa with SMTP id af79cd13be357-7c7af0b97b6mr1407519885a.4.1744625602347;
        Mon, 14 Apr 2025 03:13:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzDsIFNCfCc1ZoeycTbDTNBesY22eIKmB83BOMthLAJTRiIc4E97bghFBGk6bi4e5QAPBjNQ==
X-Received: by 2002:a05:620a:424b:b0:7c5:49ee:86aa with SMTP id af79cd13be357-7c7af0b97b6mr1407516585a.4.1744625601749;
        Mon, 14 Apr 2025 03:13:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d604sm16122111fa.19.2025.04.14.03.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:13:20 -0700 (PDT)
Date: Mon, 14 Apr 2025 13:13:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
Message-ID: <r5okekuiv4jdocho47ytmf3aiprdby6mqvdeg63fr2uzs4edwa@rk3mhscdhc2p>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-6-895fafd62627@quicinc.com>
 <aidlp3iq6pxym52tp63w35tpcctw4443yihvcwsdszk62xbwfp@esqpmsc4e6qd>
 <f1125370-c16a-4c20-a01d-2221fb12fdcb@quicinc.com>
 <CAO9ioeWmuPhBPivthidXTFfnXRBx9rd=iX5aqjB4bMcCKueXeg@mail.gmail.com>
 <efe91d3f-a2e3-4bee-a7e5-36ea4fc0968a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efe91d3f-a2e3-4bee-a7e5-36ea4fc0968a@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fcdfc4 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=rqxffTeNWxrA2CmQLHoA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: X67Kaoso2RCCn9-eTltcxjDBfEnHci3O
X-Proofpoint-ORIG-GUID: X67Kaoso2RCCn9-eTltcxjDBfEnHci3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140074

On Mon, Apr 14, 2025 at 03:39:04PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 4/11/2025 2:21 PM, Dmitry Baryshkov wrote:
> > On Fri, 11 Apr 2025 at 10:14, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/27/2025 6:20 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Mar 27, 2025 at 03:22:26PM +0530, Jagadeesh Kona wrote:
> >>>> Add support to configure PLLS and clk registers in qcom_cc_really_probe().
> >>>> This ensures all required power domains are enabled and kept ON by runtime
> >>>> PM code in qcom_cc_really_probe() before configuring the PLLS or clock
> >>>> registers.
> >>>>
> >>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> >>>> ---
> >>>>  drivers/clk/qcom/common.c | 28 ++++++++++++++++++++++++++++
> >>>>  drivers/clk/qcom/common.h | 19 +++++++++++++++++++
> >>>>  2 files changed, 47 insertions(+)
> >>>>
> >>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> >>>> index 9cbf1c5296dad3ee5477a2f5a445488707663b9d..c4d980c6145834969fada14863360ee81c9aa251 100644
> >>>> --- a/drivers/clk/qcom/common.c
> >>>> +++ b/drivers/clk/qcom/common.c
> >>>> @@ -14,6 +14,8 @@
> >>>>  #include <linux/of.h>
> >>>>
> >>>>  #include "common.h"
> >>>> +#include "clk-alpha-pll.h"
> >>>> +#include "clk-branch.h"
> >>>>  #include "clk-rcg.h"
> >>>>  #include "clk-regmap.h"
> >>>>  #include "reset.h"
> >>>> @@ -285,6 +287,29 @@ static int qcom_cc_icc_register(struct device *dev,
> >>>>                                                   desc->num_icc_hws, icd);
> >>>>  }
> >>>>
> >>>> +static void qcom_cc_clk_pll_configure(const struct qcom_cc_desc *desc,
> >>>> +                                  struct regmap *regmap)
> >>>> +{
> >>>> +    int i;
> >>>> +
> >>>> +    for (i = 0; i < desc->num_alpha_plls; i++)
> >>>> +            qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);
> >>>> +}
> >>>> +
> >>>> +static void qcom_cc_clk_regs_configure(const struct qcom_cc_desc *desc,
> >>>> +                                   struct regmap *regmap)
> >>>> +{
> >>>> +    struct qcom_clk_reg_setting *clk_regs = desc->clk_regs;
> >>>> +    int i;
> >>>> +
> >>>> +    for (i = 0; i < desc->num_clk_cbcrs; i++)
> >>>> +            qcom_branch_set_clk_en(regmap, desc->clk_cbcrs[i]);
> >>>> +
> >>>> +    for (i = 0 ; i < desc->num_clk_regs; i++)
> >>>> +            regmap_update_bits(regmap, clk_regs[i].offset,
> >>>> +                               clk_regs[i].mask, clk_regs[i].val);
> >>>
> >>> I think there are other semantic functions which we don't want to
> >>> convert to offset-mask-val tuples. See drivers/clk/qcom/clk-branch.h.
> >>> I'd suggest to move setup steps to a driver callback. We can improve it
> >>> later on if it is found to make sense, but it won't block this series
> >>> from being merged.
> >>>
> >>
> >> Yes, there are other wrapper functions as well but they are unused in most
> >> clock controllers. We will check more on how we can improve this in a separate
> >> series.
> > 
> > Please do it the other way around. Implement a generic callback, then
> > we can check how to sort things out.
> > 
> 
> Yeah, but since this series doesn't require any misc register settings update, I
> will remove the above regmap_update_bits() code for now. I will check further on
> this and post a separate series for it.

This way we end up with a non-generic solution with no proposed path.
I'd really suggest using a callback for now to configure all
platform-specific and then post a separte series adding clk_cbcrs and
related functionality.

> 
> Thanks,
> Jagadeesh
> 
> >>
> >> Thanks,
> >> Jagadeesh
> >>
> >>>> +}
> >>>> +
> >>>>  int qcom_cc_really_probe(struct device *dev,
> >>>>                       const struct qcom_cc_desc *desc, struct regmap *regmap)
> >>>>  {
> >>>> @@ -315,6 +340,9 @@ int qcom_cc_really_probe(struct device *dev,
> >>>>                      return ret;
> >>>>      }
> >>>>
> >>>> +    qcom_cc_clk_pll_configure(desc, regmap);
> >>>> +    qcom_cc_clk_regs_configure(desc, regmap);
> >>>> +
> >>>>      reset = &cc->reset;
> >>>>      reset->rcdev.of_node = dev->of_node;
> >>>>      reset->rcdev.ops = &qcom_reset_ops;
> >>>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> >>>> index 9c10bc8c197cd7dfa25ccd245763ad6acb081523..01b1ae52f2dc580350409d6244578944cce571f0 100644
> >>>> --- a/drivers/clk/qcom/common.h
> >>>> +++ b/drivers/clk/qcom/common.h
> >>>> @@ -25,6 +25,19 @@ struct qcom_icc_hws_data {
> >>>>      int clk_id;
> >>>>  };
> >>>>
> >>>> +/**
> >>>> + * struct qcom_clk_reg_setting - Represents miscellaneous clock register settings
> >>>> + * @offset: address offset for the clock register
> >>>> + * @mask: bit mask indicating the bits to be updated
> >>>> + * @val: Encoded value to be set within the specified bit mask
> >>>> + *       (e.g., if writing 7 to bits 4-7, mask = 0xF0 and val = 0x70)
> >>>> + */
> >>>> +struct qcom_clk_reg_setting {
> >>>> +    u32 offset;
> >>>> +    u32 mask;
> >>>> +    u32 val;
> >>>> +};
> >>>> +
> >>>>  struct qcom_cc_desc {
> >>>>      const struct regmap_config *config;
> >>>>      struct clk_regmap **clks;
> >>>> @@ -38,6 +51,12 @@ struct qcom_cc_desc {
> >>>>      const struct qcom_icc_hws_data *icc_hws;
> >>>>      size_t num_icc_hws;
> >>>>      unsigned int icc_first_node_id;
> >>>> +    u32 *clk_cbcrs;
> >>>> +    size_t num_clk_cbcrs;
> >>>> +    struct clk_alpha_pll **alpha_plls;
> >>>> +    size_t num_alpha_plls;
> >>>> +    struct qcom_clk_reg_setting *clk_regs;
> >>>> +    size_t num_clk_regs;
> >>>>      bool use_rpm;
> >>>>  };
> >>>>
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> > 
> > 
> > 

-- 
With best wishes
Dmitry

