Return-Path: <linux-arm-msm+bounces-79306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 043ECC1731C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 23:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 56A1B356015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E010A2E0926;
	Tue, 28 Oct 2025 22:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/HWLmng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR65mSza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC091A0BD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761690651; cv=none; b=ExiPPQueCjB8H/glxMwwx9miecmek3e4RP4m3IpxKiPuZg3V8OatdbK66ttUmgPgiFMc0y+2iGRLP6hh6lR6OTDaRn4PRotLfuKyBjfQsrbEzgeOhxMy/1UP0/t6o1AwPEKFyfTwqlQPK6MQy1ShTfbhqKyCxT9ZbJrUQrKxQhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761690651; c=relaxed/simple;
	bh=g/jLnh/7iFrLwCu53TKTki/oR/nR2o4L/1aeNsa9ZB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owkDBmAVPG7r8b9isXswDCs+GSggZuHLYQJYUxD/r2CXs4cv4zDsvsnummhmttwo2Bh+NIGdDVQwx6BUO4/Rh+KIviWy2SgJjn/yfn2SClDbo0DmdFphxvX8249XG+Hc+8Co9IbtlWelngJBd5YCDllPuGu4PS/nHzJI7qxXLV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/HWLmng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR65mSza; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlZDK2575817
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fwav1IUxYKqs4VwQSpfLoAKs
	uvsEteeWs9ZalDF4WYA=; b=H/HWLmngQ0Mibyh7Vxg8EQQn92J5jap8NQh69SY6
	f9H8OVSzoShKsUUQTNL5Ia3qJD7/d/b+qkICC0WkZCdusRW9gkNAsJgNECozSfqr
	jXVQtEBURopU4LvcCkqebD+byK4lnxajipYlN9smkyY7pF22rvK1HMsRaWjpLWwI
	MYsrbDg/3PS6HdiTPp+/b9N4M5FK1iEt0sQDNr/WzEUhz25U4278TfO+NiWIPvIO
	n/WjUIjJrOumIOCCdD9Wu2CjAPcpounzpJIkdSeTsp93eBVBSSoVOAjweAtM6jpc
	6grz5Y2OgpDxD+Qb0svklx/jBouWnFRLyXplHOH0sOQwIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a20bxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:30:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e884663b25so167845601cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761690648; x=1762295448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fwav1IUxYKqs4VwQSpfLoAKsuvsEteeWs9ZalDF4WYA=;
        b=JR65mSzaJVH0zxCvW5tQ2Q6kOJCqy+h9NjpmFGgzWAe4342q8S00TB3XKzzQeDK30g
         0uCdoEnjfiD2kdR/3cykh5eIzve5Yuj13oFJSXz7tR4xqDA2BmIZAwfJLW84cdSTy89/
         YjCbnwKeXbay7j3cCT6C9I5VAqidxpkim3p7ua94LW1R52Tb3ulyuM6OFw4GGYdIXpd5
         0s8VYbeSr8YX6V2ls4u3Wmjv51jB94LM70T+eXIJlGhzH8pE2mjxLGoOiO8k07ijeqQe
         7CAeEpvHPJRFhote6SUAfonHEmxW4VOBspvHOj8GrSZqSRZkS71euxDSfiir5nZKY4OY
         DB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761690648; x=1762295448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwav1IUxYKqs4VwQSpfLoAKsuvsEteeWs9ZalDF4WYA=;
        b=cESnR5kvBtrgUtGGBPxCWk02KbBlWaC11N5PH16YLC+4iaME11xfrsJN6olsEEyfDD
         1TjnftNp5Ttvwk/oHwgoVmBWkVGpt6v0KChZTw3seGrbQrOBvFeNlpA1RmTGvbpQ8BQY
         uHbuGNCysDogjmuFj4X++YkpO54DeEdoWhkSEoqVmsSMFCh7lERvux9eltOnqSNDXBJk
         1GGQmDpQNnWwc2O6cIW77E5zb3K45CXXi/LkfynwyOLN28HBuyMivtdAV6jVmLhrMGil
         NsJFKfe0lPma3UUH3h5A32Rte5Lyc5PfpgynDXZt8rGm4RBSor1srpADyBTeTtg0Rofp
         sE0A==
X-Forwarded-Encrypted: i=1; AJvYcCWSr+uI6cYC63s7uzqcrrByWo+4LTJo9XC458lYORUrav00F9hbV/SpIceuJX7/ZVISQF9x3g3v4ai80Mxf@vger.kernel.org
X-Gm-Message-State: AOJu0YwMU5VMh2TONXoQYpDXjdg7wkzl0zp5IsVt2VhxSM2wutvQgOmk
	5USLYJU0KcEBdp3KTZdfMD06JoMRkvpQpUdout6cZkBDXcOUkZ+WiFq3aG+aCiW+D6NG508CuXz
	EH7Mkbfb6h636oZr+08RshRr8ywhTaqIloX3KKSuY2rQHnsoSyqYlZs+qsDLTSPE77Mjd
X-Gm-Gg: ASbGncsh0XwHzZObFs+JN006G0QppMPg1YQP8qhT8uw++7+JjwHn3sca/CzSL24jevQ
	+/nuAwKisu6wbAsB/KX57YAaeAdm7DqhRsWq8W7mpTwp4k7DOiTVFjjejFbVN27L0crXtUMTvae
	YzWDtVDkrmWsKxSm9t0pQXape3dJ8wsuPzMX1O12MXSDzhVE+4dTlUu8qTE0wHZhjdTIWMdeolU
	KT2nfQSOu6N5RqAlKoo6ZgK7xU1sgWEIDCI7NdjXt9fFEqmq3HVkOhi1nmee6LWb2SvsqLbQ5u1
	j5V6uE49FPxs5p6HwlGXk2EkRdQm/TT71AD2O8bHFR8IzxOaTAQVjhgJNYOGi2iF7BJXec+mENg
	2taLjX0K5185FYmbyMlP80et0nD4HP0zNyXX6Vnppi2Yjp6VAFeDIhC2GHUBevLjfAs89XJLVwT
	gqsCgjtnap7Wij
X-Received: by 2002:a05:622a:17c6:b0:4e8:9f46:402e with SMTP id d75a77b69052e-4ed15c7bf1cmr13100461cf.40.1761690648114;
        Tue, 28 Oct 2025 15:30:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/d7lNS9futW4CsSn+fTGrGsWFDbeBBpVaN8gUsAhRPKt76RRIf2y8i7yGHEXORdu2OicfJw==
X-Received: by 2002:a05:622a:17c6:b0:4e8:9f46:402e with SMTP id d75a77b69052e-4ed15c7bf1cmr13099981cf.40.1761690647629;
        Tue, 28 Oct 2025 15:30:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0c61a7sm28518321fa.28.2025.10.28.15.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 15:30:45 -0700 (PDT)
Date: Wed, 29 Oct 2025 00:30:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/8] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <ysekkn5mxwq47bnra5ocwfeacfa2gujhmgvivorupn73npsrnl@2cig7cjdvhuy>
References: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
 <20251024-glymur_usb-v6-6-471fa39ff857@oss.qualcomm.com>
 <ktjmbmfd37tm6ij3pqbrbhfounizz4znmqvearvh4spvuky6i6@pw5czztggbjm>
 <7ae01221-868e-d5dc-4297-8006a69e7a7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae01221-868e-d5dc-4297-8006a69e7a7c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE5MCBTYWx0ZWRfX0BZHw0Cwzcno
 yZxyVLOWOS+YdRN+r9sxGo+js7TVQieKfAvERyKmQpe6hnyb4Dou4kMAnSWDEzlZWCqfIHXcqzQ
 kO1I2w1GGKNXeengqzpI/qFoXKIViyZ6z9S4zCHmQfblZ/7t/vq19vM4L7KHot1ExSHuqDjxMu0
 Y/xqp1vZ7LjFOGTZNK68z75X5uloY0WoLHJ7fhzfhJsl1gTDAR1sw1mDrFcgnrJjPB0RXPPZpU4
 x8cO6xQ95KJexQBQy0Vn6k98PWD+U3jfJioCm9Su2BMaKU9gQJthdvCaPbm92ttoOF1sRzB7lsG
 drstaInd4Z3ftbelova5Ak4zEFPuGsWYZ905IAFbsPs1mZmFAAXKBB0OoYvPmskf3VhCb4+e4/l
 B6V6Ie2xFgDqS9FRE3LcHtIErrbRrA==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=69014419 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jibdWOiqirJgiXNZ0pYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: dmK4-GEu9TxzNkfGJLjL-6PLCB3h5eBu
X-Proofpoint-ORIG-GUID: dmK4-GEu9TxzNkfGJLjL-6PLCB3h5eBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280190

On Tue, Oct 28, 2025 at 03:15:33PM -0700, Wesley Cheng wrote:
> 
> 
> On 10/27/2025 7:21 AM, Dmitry Baryshkov wrote:
> > On Fri, Oct 24, 2025 at 05:47:44PM -0700, Wesley Cheng wrote:
> > > For SuperSpeed USB to work properly, there is a set of HW settings that
> > > need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> > > these settings follow the latest settings mentioned in the HW programming
> > > guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> > > new ways to define certain registers, such as the replacement of TXA/RXA
> > > and TXB/RXB register sets.  This was replaced with the LALB register set.
> > > 
> > > There are also some PHY init updates to modify the PCS MISC register space.
> > > Without these, the QMP PHY PLL locking fails.
> > > 
> > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 288 ++++++++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h     |  17 +
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h    |  12 +
> > >   .../phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h    | 639 +++++++++++++++++++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h   |  33 ++
> > >   .../qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h   | 224 ++++++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp.h                |   2 +
> > >   7 files changed, 1215 insertions(+)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > index 1caa1fb6a8c7..d1534ed7200b 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > @@ -30,9 +30,11 @@
> > >   #include "phy-qcom-qmp.h"
> > >   #include "phy-qcom-qmp-pcs-aon-v6.h"
> > > +#include "phy-qcom-qmp-pcs-aon-v8.h"
> > >   #include "phy-qcom-qmp-pcs-misc-v3.h"
> > >   #include "phy-qcom-qmp-pcs-misc-v4.h"
> > >   #include "phy-qcom-qmp-pcs-misc-v5.h"
> > > +#include "phy-qcom-qmp-pcs-misc-v8.h"
> > >   #include "phy-qcom-qmp-pcs-usb-v4.h"
> > >   #include "phy-qcom-qmp-pcs-usb-v5.h"
> > >   #include "phy-qcom-qmp-pcs-usb-v6.h"
> > > @@ -46,6 +48,8 @@
> > >   #include "phy-qcom-qmp-dp-phy-v5.h"
> > >   #include "phy-qcom-qmp-dp-phy-v6.h"
> > > +#include "phy-qcom-qmp-usb43-pcs-v8.h"
> > > +
> > >   /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
> > >   /* DP PHY soft reset */
> > >   #define SW_DPPHY_RESET				BIT(0)
> > > @@ -97,6 +101,7 @@ enum qphy_reg_layout {
> > >   	QPHY_TX_HIGHZ_DRVR_EN,
> > >   	QPHY_TX_TRANSCEIVER_BIAS_EN,
> > > +	QPHY_AON_TOGGLE_ENABLE,
> > >   	/* Keep last to ensure regs_layout arrays are properly initialized */
> > >   	QPHY_LAYOUT_SIZE
> > >   };
> > > @@ -259,6 +264,236 @@ static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
> > >   	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V8_TX_TRANSCEIVER_BIAS_EN,
> > >   };
> > > +static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
> > > +	[QPHY_SW_RESET]			= QPHY_V6_N4_PCS_SW_RESET,
> > > +	[QPHY_START_CTRL]			= QPHY_V6_N4_PCS_START_CONTROL,
> > > +	[QPHY_PCS_STATUS]			= QPHY_V6_N4_PCS_PCS_STATUS1,
> > > +	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_N4_PCS_POWER_DOWN_CONTROL,
> > 
> > V8 PHY should not be using V6 register offsets.
> > 
> > > +
> > > +	/* In PCS_USB */
> > > +	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
> > > +	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]	= QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
> > > +
> > > +	[QPHY_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_USB3_AON_TOGGLE_ENABLE,
> > > +
> > > +	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V6_COM_RESETSM_CNTRL,
> > > +	[QPHY_COM_C_READY_STATUS]		= QSERDES_V6_COM_C_READY_STATUS,
> > > +	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
> > > +	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN,
> > > +
> > > +	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
> > > +	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V6_DP_PHY_VCO_DIV,
> > > +
> > > +	[QPHY_TX_TX_POL_INV]		= QSERDES_V6_N4_TX_TX_POL_INV,
> > > +	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V6_N4_TX_TX_DRV_LVL,
> > > +	[QPHY_TX_TX_EMP_POST1_LVL]		= QSERDES_V6_N4_TX_TX_EMP_POST1_LVL,
> > > +	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V6_N4_TX_HIGHZ_DRVR_EN,
> > > +	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V6_N4_TX_TRANSCEIVER_BIAS_EN,
> > > +};
> > > +
> > > @@ -2528,6 +2784,27 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
> > >   	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > >   };
> > > +static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
> > > +	.offsets		= &qmp_combo_usb43dp_offsets_v8,
> > > +
> > > +	.serdes_tbl		= glymur_usb43dp_serdes_tbl,
> > > +	.serdes_tbl_num		= ARRAY_SIZE(glymur_usb43dp_serdes_tbl),
> > > +	.tx_tbl			= glymur_usb43dp_lalb_tbl,
> > > +	.tx_tbl_num		= ARRAY_SIZE(glymur_usb43dp_lalb_tbl),
> > > +	.pcs_tbl		= glymur_usb43dp_pcs_tbl,
> > > +	.pcs_tbl_num		= ARRAY_SIZE(glymur_usb43dp_pcs_tbl),
> > > +	.pcs_usb_tbl		= glymur_usb43dp_pcs_usb_tbl,
> > > +	.pcs_usb_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_usb_tbl),
> > > +	.pcs_misc_tbl		= glymur_usb43dp_pcs_misc_tbl,
> > > +	.pcs_misc_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_misc_tbl),
> > 
> > DP tables are missing.
> > 
> 
> Hi Dmitry,
> 
> I think I discussed this with Abel on the previous patch revision.  At the
> moment I did not add support for DP, so we shouldn't add the tables, unless
> you think we should still have placeholder?

Please add DP support.

-- 
With best wishes
Dmitry

