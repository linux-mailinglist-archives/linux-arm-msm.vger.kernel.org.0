Return-Path: <linux-arm-msm+bounces-71018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB0EB383B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 15:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9CE46283D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 13:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803A22F3631;
	Wed, 27 Aug 2025 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgrrppWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E9A2BCF41
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756301295; cv=none; b=PIjYDJuCf9mVsBoR3ZlKupuDwKL8jRGpVqtNYHP86e1zqZvpvXTu9tOMHstC5IGcYcpziAvzupv4qKte13NbypcUA/HaAlI1RKI8HabP7yYoWHG21918D1M9tBCuvau+Ij4XQtZNuQEG4UrePSx2JMifOnlPIUTvx0ux5gTTQXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756301295; c=relaxed/simple;
	bh=NDCxKDQql+H+s4XkAlY00C8kLGs1OE0xl7zRLx5uJcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lf5eLf4hHUvS5XMaYRaW5Jvv/Q3h7USh/ArB/Sn8/naWft9Hw26XtbaCbxZwAuctfzY7ys0MofIBlO8Mq4gkZ8EMEaYKd+1lnFsc4h3yZxVE/2bfSYT/UvSwwKHq5DNtqye/mFCQe/zV7Hquc28PT7y5bEm20mzA2/KtDk6fuBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgrrppWR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kXha027627
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6quTpF8lR620w9+wcbq204uyppZxMXlERbN+86W1g4=; b=TgrrppWRbNdt4yIr
	PXxE70i+ZxYtPJOJn0k7NJseMjEcTHHnvG4VFYfYb8MJhenupHgGqcItJRNqDHP2
	1B90YawHW2BEetJAEIF148Ws2qx3CllLpYFMhb/gcX+wGnosSSE0nhCecZgaTBZm
	ORCVOAac64Cw7hC6SHURHvTANJeSDiRDW4nyFZfhiVyPBi7ObQk+484eGD7vqWzW
	hMk74uVXrfAQ4z5HB0s1dWNVKv8Plp56NDz9Mp1ctEIlRKK9eS9/Fv6AjHoi45bQ
	m4pFkFIbxOK1nIruG9yDZAoI1rtuvcv2/u/B84xrNrDIYQxHVqY+cZr9FPqTS+6S
	iWQsTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16usbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:28:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244582e9d17so18943555ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 06:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756301292; x=1756906092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b6quTpF8lR620w9+wcbq204uyppZxMXlERbN+86W1g4=;
        b=AGjSyCbgu7sug2/06L6ImL+bsD58TPp1rG8mEPWnTXwnWRyTteQLYj0t12jRNyK3Z3
         3RUCpKP9q8q+/PpSJlpHuvXg73EXq9MdUWA5CrrAxjvsV6NBHxNPSJ8UXE7g6PUehmcJ
         VdAnVLqJa9T1kJ6C8I8daRFWm4gVxM7GMYWPoUfkDFRODNYB+POAV5InHLFbKeC9VpTa
         MJ78i55+kc9esUDstmwgzj8RSENsHDBgF4w3EQ5Uc78TOgFncNwZ27dc/srLcS2N8SRL
         Ur1pvFBk8OjlaDP0F/ufoJy3/KNxMXRYfd/M1D5QDm9HSzemAS3LLc/O4Yp/CyNIqlcS
         Dhrg==
X-Forwarded-Encrypted: i=1; AJvYcCU5M3/UZfJzMKxJ9yrbbQuAtV42HIrzFUNbQCTxtKQnfWOud7E3t5tuZVcrrPAOh+/zcwI2YeWDkz7RqBgL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CpfY1FXMxWMY78r7+2wTvpMk4R7GubO8z1ylIpNMV6A4oV2s
	pqtbwnn6HM5raTGR8s76hn//rvvEXKsbzof8UESR/qBzRJRz0zKNf1tasQwbMLE2X/UUwNgbjhl
	+3r3U5hjlNRk8FKBKxU4LEYONszLPGh5M/3W2niOFiRUjpkC+bXhZ0vaGSCQYt9HPwL9J
X-Gm-Gg: ASbGncvyJ18/LBMnL1kQbBvGmu/M1mZUOI5u4PlgMT0Iy3RYVo7PgrVk+AojlhyWvyj
	G1Itcl0Afk88jHu0hXdNClbbRRS36f3KqEg6cYWQfE0k02I0Jjd5evzsY68Insp1DIFY+ehWBDl
	8lOvilNxcvZmtGW+OmUu12LBpeDBPXf414fBF2jFhtCz6No6xjGmwFRE2AFbzq5NvtIj4w+oCU9
	AfuCF0dq7PZvfwIPOYcuGGu8O2FVjD0srsDzxxN11RXHL0GzjqQEXgKQbWoaHKCTGsAwBjfD4s6
	LsSQ1Wta6sTNVn6OC9RnKv+rpwlpNbIjTj8r+bCZhTBEv2efDslkXPuD7oErKX2CqIBs3hcUvJh
	r44ZdrRf4rl3RJc3s5zhpnCDWtt14DQ==
X-Received: by 2002:a17:902:da8b:b0:246:b41d:252e with SMTP id d9443c01a7336-246b42c6bbamr98937255ad.2.1756301291545;
        Wed, 27 Aug 2025 06:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGA6gBgzbMmU5Z3ZUIL62xQWLNNWghkywPFsB5di/g623cSVN2BoKy0/7fsAZ0g2TCIv6pig==
X-Received: by 2002:a17:902:da8b:b0:246:b41d:252e with SMTP id d9443c01a7336-246b42c6bbamr98936845ad.2.1756301290930;
        Wed, 27 Aug 2025 06:28:10 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248a2677f81sm14018735ad.149.2025.08.27.06.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 06:28:10 -0700 (PDT)
Message-ID: <f3cc06c1-25d2-40f4-bd77-8a9c51b40efa@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 21:28:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] phy: qcom: qmp-usbc: Move reset and regulator
 config into PHY cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
 <ofvzduf5xyip7w6yde2xwsrvv3tdh7ew3yyzeya2qzpqty3j7p@bnetyjowhdn5>
 <6f7c3962-ccfc-4400-a77f-399b06da93e1@oss.qualcomm.com>
 <llrt3xnd5gagovnmyzqebp2da5v67bkxjntfcgc5r5auamspyj@7v5taph3i3c4>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <llrt3xnd5gagovnmyzqebp2da5v67bkxjntfcgc5r5auamspyj@7v5taph3i3c4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m7nQtx7gpKT4DDatq3kpGpr3k1JrZkPg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX0I7aZ/i+L/HX
 WJU8OUXtHswUcFUPJV0JqNPQLrxGmtMDE4QavzqGmELaeoKFAeXJudY9+BM6vVNIEXvkCvfY8+Q
 vSIQgYyqslVQY9wZqZOP8kUUhzlJVB0pggpuEVCVZsENZ3NJFb4F3uXIl2zMiuvVTEtnBsV5omB
 3aV2k9cd4HNydMMA+M9c8FrkEJZb3kOeV8iDhwHdAETfMvv2wG1XGAaHkfMYhnWTAf9Nmed+7Lw
 x0xXHU1HH/ofEIK/qRmTN4uLUoYvZi+cETKxMs18j1fzr1msj1KapngUxRB9gnkI7MWQr8vnZ8i
 QaC70mxcDFuuipzgp9myfWY5VXvWZg6xD8T1OsaOMlxlXRkGD8rWYGuh22eAWsBnlaN4gByPd7y
 NN3F61+W
X-Proofpoint-ORIG-GUID: m7nQtx7gpKT4DDatq3kpGpr3k1JrZkPg
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68af07ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=snPlLZzmUMwuVAg1AH4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120


On 8/22/2025 6:08 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 22, 2025 at 04:29:28PM +0800, Xiangxu Yin wrote:
>> On 8/20/2025 7:30 PM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 05:34:49PM +0800, Xiangxu Yin wrote:
>>>> Refactor reset and regulator configuration to be managed via qmp_phy_cfg
>>>> instead of hardcoded lists. This enables per-PHY customization and
>>>> simplifies initialization logic for USB-only and USB/DP switchable PHYs.
>>> Please split into two patches in order to simplify reviewing.
>>
>> Ok, will split reset and regulator part.
>>
>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
>>>>  1 file changed, 53 insertions(+), 55 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> @@ -421,8 +421,9 @@ struct qmp_phy_cfg {
>>>>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
>>>>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
>>>>  
>>>> -	/* regulators to be requested */
>>>> -	const char * const *vreg_list;
>>>> +	const char * const *reset_list;
>>>> +	int num_resets;
>>>> +	const struct regulator_bulk_data *vreg_list;
>>>>  	int num_vregs;
>>>>  
>>>>  	/* array of registers with different offsets */
>>>> @@ -453,7 +454,6 @@ struct qmp_usbc {
>>>>  	struct clk_hw dp_pixel_hw;
>>>>  	struct clk_bulk_data *clks;
>>>>  	int num_clks;
>>>> -	int num_resets;
>>>>  	struct reset_control_bulk_data *resets;
>>>>  	struct regulator_bulk_data *vregs;
>>>>  
>>>> @@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
>>>>  	"phy_phy", "phy",
>>>>  };
>>>>  
>>>> -/* list of regulators */
>>>> -static const char * const qmp_phy_vreg_l[] = {
>>>> -	"vdda-phy", "vdda-pll",
>>>> +static const char * const usb3dpphy_reset_l[] = {
>>>> +	"phy_phy", "dp_phy",
>>>> +};
>>>> +
>>>> +static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
>>>> +	{ .supply = "vdda-phy" },
>>>> +	{ .supply = "vdda-pll" },
>>> Please fill in the values for all platforms. It well might be that they
>>> all share the same current requirements.
>>
>> I checked previous DP projects and found all platforms configured vdda-phy with 21.8mA and vdda-pll with 36mA.
> No. On SDM660 and MSM8998 DP defines 73.4 mA for 0.9V supply and
> 12.560 mA for 1.8 V supply.
>
>> However, I didn’t find USB load configs in downstream and from SoC related power grids:
> Please check the actual HW documentation for those platforms.
>
>> QCS615
>> L12A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
>> L5A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
>>
>> sm6150
>> L11A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
>> L4A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
>>
>> SM6115
>> L12A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
>> L4A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
>>
>> QCM2290
>> L13A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
>> L12A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
>>
>> sdm660
>> LDO10A: VDDA_USB_SS_1P8 Ipk:14mA
>> LDO1B: VDDA_USB_SS_CORE Ipk:68.6mA
>>
>> msm8998
>> L2A: VDDA_USB_SS_1P2 Ipk:14.2mA
>> L1A: VDDA_USB_SS_CORE Ipk:68.6mA
>>
>> It seems the USB power requirements vary across platforms, and the
>> 21800 µA load for vdda-phy exceeds the Ipk range in most cases.
> Ipk being ?


IPK: Instantaneous Peak Current


>> I also tested removing the load settings for USB+DP PHY, and DP still works fine.
> It mostly works either because we don't allow mode switching on older
> platforms (yet) or because somebody else has already voted and that vote
> keeps the required mode.
>
> As you've started looking on specifying proper current load, please
> finish the work.


Discussed with chip validation and power SW teams.

The power grid tables are primarily used to ensure each module receives 
the correct voltage, and they define the Ipk for each submodule. 

While they don’t specify recommended regulator load values, the Ipk values
reflect the expected power domain strength and can help estimate the voting
strength needed for each supply.

Since regulator load is mainly used for voting, I’ll define init_load_uA in
the next patch based on each SoC’s Ipk values to better align with hardware expectations.


>> So, can we keep the regulator config as original qmp_phy_vreg_l?
>> static const char * const qmp_phy_vreg_l[] = { "vdda-phy", "vdda-pll"} 
>>
>>
>>>> +};
>>>> +
>>>> +static const struct regulator_bulk_data qmp_phy_usbdp_vreg_l[] = {
>>>> +	{ .supply = "vdda-phy", .init_load_uA = 21800 },
>>>> +	{ .supply = "vdda-phy", .init_load_uA = 36000 },
>>> Typo
>>
>> Sorry for Typo, will fix in next patch.
>>
>>
>>>>  };
>>>>  
>>>>  static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
>>>> @@ -569,8 +578,10 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>>>>  	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
>>>>  	.pcs_tbl                = msm8998_usb3_pcs_tbl,
>>>>  	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
>>>> -	.vreg_list              = qmp_phy_vreg_l,
>>>> -	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>>>> +	.reset_list		= usb3phy_reset_l,
>>>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>>> +	.vreg_list              = qmp_phy_usb_vreg_l,
>>>> +	.num_vregs              = ARRAY_SIZE(qmp_phy_usb_vreg_l),
>>>>  	.regs                   = qmp_v3_usb3phy_regs_layout,
>>>>  };
>>>>  
>>>> @@ -586,8 +597,10 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
>>>>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>>>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>>>> -	.vreg_list		= qmp_phy_vreg_l,
>>>> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
>>>> +	.reset_list		= usb3phy_reset_l,
>>>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>>> +	.vreg_list		= qmp_phy_usb_vreg_l,
>>>> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
>>>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>>>>  };
>>>>  
>>>> @@ -603,8 +616,10 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>>>>  	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
>>>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>>>> -	.vreg_list		= qmp_phy_vreg_l,
>>>> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
>>>> +	.reset_list		= usb3phy_reset_l,
>>>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>>> +	.vreg_list		= qmp_phy_usb_vreg_l,
>>>> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
>>>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>>>>  };
>>>>  
>>>> @@ -637,6 +652,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>>>>  
>>>>  	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
>>>>  	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
>>>> +
>>>> +	.reset_list		= usb3dpphy_reset_l,
>>>> +	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
>>>> +	.vreg_list		= qmp_phy_usbdp_vreg_l,
>>>> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
>>>>  };
>>>>  
>>>>  static int qmp_usbc_com_init(struct phy *phy)
>>>> @@ -653,13 +673,13 @@ static int qmp_usbc_com_init(struct phy *phy)
>>>>  		return ret;
>>>>  	}
>>>>  
>>>> -	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>>>> +	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>>>  	if (ret) {
>>>>  		dev_err(qmp->dev, "reset assert failed\n");
>>>>  		goto err_disable_regulators;
>>>>  	}
>>>>  
>>>> -	ret = reset_control_bulk_deassert(qmp->num_resets, qmp->resets);
>>>> +	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
>>>>  	if (ret) {
>>>>  		dev_err(qmp->dev, "reset deassert failed\n");
>>>>  		goto err_disable_regulators;
>>>> @@ -682,7 +702,7 @@ static int qmp_usbc_com_init(struct phy *phy)
>>>>  	return 0;
>>>>  
>>>>  err_assert_reset:
>>>> -	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>>>> +	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>>>  err_disable_regulators:
>>>>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>>>  
>>>> @@ -694,7 +714,7 @@ static int qmp_usbc_com_exit(struct phy *phy)
>>>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>>>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>>  
>>>> -	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>>>> +	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>>>  
>>>>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>>>>  
>>>> @@ -921,42 +941,22 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
>>>>  			   qmp_usbc_runtime_resume, NULL)
>>>>  };
>>>>  
>>>> -static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
>>>> +static int qmp_usbc_reset_init(struct qmp_usbc *qmp)
>>>>  {
>>>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>> -	struct device *dev = qmp->dev;
>>>> -	int num = cfg->num_vregs;
>>>> -	int i;
>>>> -
>>>> -	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
>>>> -	if (!qmp->vregs)
>>>> -		return -ENOMEM;
>>>> -
>>>> -	for (i = 0; i < num; i++)
>>>> -		qmp->vregs[i].supply = cfg->vreg_list[i];
>>>> -
>>>> -	return devm_regulator_bulk_get(dev, num, qmp->vregs);
>>>> -}
>>>> -
>>>> -static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
>>>> -			      const char *const *reset_list,
>>>> -			      int num_resets)
>>>> -{
>>>>  	struct device *dev = qmp->dev;
>>>>  	int i;
>>>>  	int ret;
>>>>  
>>>> -	qmp->resets = devm_kcalloc(dev, num_resets,
>>>> +	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
>>>>  				   sizeof(*qmp->resets), GFP_KERNEL);
>>>>  	if (!qmp->resets)
>>>>  		return -ENOMEM;
>>>>  
>>>> -	for (i = 0; i < num_resets; i++)
>>>> -		qmp->resets[i].id = reset_list[i];
>>>> +	for (i = 0; i < cfg->num_resets; i++)
>>>> +		qmp->resets[i].id = cfg->reset_list[i];
>>>>  
>>>> -	qmp->num_resets = num_resets;
>>>> -
>>>> -	ret = devm_reset_control_bulk_get_exclusive(dev, num_resets, qmp->resets);
>>>> +	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
>>>>  	if (ret)
>>>>  		return dev_err_probe(dev, ret, "failed to get resets\n");
>>>>  
>>>> @@ -1146,11 +1146,6 @@ static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct device_node
>>>>  
>>>>  	qmp->num_clks = ret;
>>>>  
>>>> -	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
>>>> -				 ARRAY_SIZE(usb3phy_legacy_reset_l));
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>>  	return 0;
>>>>  }
>>>>  
>>>> @@ -1187,14 +1182,9 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
>>>>  	qmp->pipe_clk = devm_clk_get(dev, "pipe");
>>>>  	if (IS_ERR(qmp->pipe_clk)) {
>>>>  		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
>>>> -				     "failed to get pipe clock\n");
>>>> +					"failed to get pipe clock\n");
>>> unrelated
>>
>> Ack.
>>
>>
>>>>  	}
>>>>  
>>>> -	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
>>>> -				 ARRAY_SIZE(usb3phy_reset_l));
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>>  	return 0;
>>>>  }
>>>>  
>>>> @@ -1228,6 +1218,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>>>  	struct phy_provider *phy_provider;
>>>>  	struct device_node *np;
>>>>  	struct qmp_usbc *qmp;
>>>> +	const struct qmp_phy_cfg *cfg;
>>>>  	int ret;
>>>>  
>>>>  	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
>>>> @@ -1239,13 +1230,20 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>>>  
>>>>  	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
>>>>  
>>>> -	qmp->cfg = of_device_get_match_data(dev);
>>>> -	if (!qmp->cfg)
>>>> +	cfg = of_device_get_match_data(dev);
>>>> +	if (!cfg)
>>>>  		return -EINVAL;
>>>>  
>>>> +	qmp->cfg = cfg;
>>> Why? This doesn't seem related at all.
>>
>> I added the |cfg| variable to simplify access to |num_vregs| and |vreg_list| in the following lines, 
>>
>> avoiding repeated |qmp->cfg->...| usage. 
>>
>> If this is considered unrelated, I’ll remove it in the next version.
> This all gets clogged in a mixture of regulator and reset changes.
> Hopefully it will be more obvious with the patches being split.
>
>>
>>>> +
>>>>  	mutex_init(&qmp->phy_mutex);
>>>>  
>>>> -	ret = qmp_usbc_vreg_init(qmp);
>>>> +	ret = qmp_usbc_reset_init(qmp);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = devm_regulator_bulk_get_const(qmp->dev, cfg->num_vregs,
>>>> +					 cfg->vreg_list, &qmp->vregs);
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>>
>>>> -- 
>>>> 2.34.1
>>>>

