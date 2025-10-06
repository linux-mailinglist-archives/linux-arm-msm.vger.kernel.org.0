Return-Path: <linux-arm-msm+bounces-76046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA8BBDB3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D47D01896E70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E3123D7E4;
	Mon,  6 Oct 2025 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZo+kfQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573C323D294
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759746923; cv=none; b=D6LoEoALkLXslNdT+XzTH81s5B+OmI3gcrIGMHFn5u1YmzOZs3iCiIhviQne1gqXWayS2OHJ5SkMEnr0AD45ulWMYm+1wvMyF0UAL3zlxctzpm2VpLGaJcLT5RnWuvxfahijundKkez/6eI+hxDzw28iDRMVidZBLiMfs9/T+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759746923; c=relaxed/simple;
	bh=KOEfItLpTHHUF2NjaTltq4XrtKm97oaO8gQyfhxK6zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9vawhifSui1dhbQ/Vcwl8fwlgIVlzyiJ5yyt9Nhjp4My6pnTI7dt3P9Vu9EGQA5dOJJtWUlLKGD+8XjCXCzo1B52HPVIdFQIjPHMgr1dMz0D8T2CbgOEyVxcogi2ElQnoNpw9G087ppVuHZO54rrCf8d9be2kac+IyXiZTqs2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZo+kfQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961DHj6014386
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/GVt1K9Lflbj12O6/RaG4Mti
	+z7CPLMv3q3Zlvsed98=; b=bZo+kfQzbY2w14g+9jjoaiorc2gFKSmmjrAZdx4v
	2cTdYL8jmknRf+PryJo564MYnyPaNeyff33SJYOHctCuZbgQIoZwrEl0SmWJGkVh
	6viz29fRyKqYPn4J4iKz5gqjfogUTuUiqz3XpuQ5UJfogW65pgeNJoZ1SmBVdEQ2
	yU5TUiXE6uutxE5wzfXe87XMc2PbRfyQCYS0mdQ0aUGiaYrL8R6fpBLCfLUeiq/8
	SbwZJ4pk1mhoUbpAlvd7msAajxhVP/Yfmsct/++485ZjMmGJcjcsRO8twyJnWGXz
	3ARxoE8FARPiRMCxOgkoU4ZQZoWoKOlP4HwKVuIEnXfW1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3tu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:35:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d905ce4749so96971701cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759746912; x=1760351712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GVt1K9Lflbj12O6/RaG4Mti+z7CPLMv3q3Zlvsed98=;
        b=SkQKKU/qlYr6NP0qso1sdcsU47W+Sg84RRUd1U5QZWRIAW5ldrqOgdoATYkR05P044
         d1RN0KOY/MajKLJMVXXKtbISYQExfD5IvbCd5p4cSdB0/Gy0eg49beK++WumSjy6LOwa
         WNDyQ7WBi0BiZfl1z4dZcXfzLCfeoKLlLOD6VbCElTHgO08JjcxzSrA9PfNXxQlj+S56
         1ui7/gLOnY5MlGxEt6yLMvXtSwNitl5AF9NbKCmLnDjEQZNHXegJRaayxBRvUgFUjiae
         vv9BQ+w2z3u+gN5S7FTPFbkyLOLhQJrTIrPF1YllB79Yxlek3wZNQBps8uZea0BkoVha
         u9zA==
X-Forwarded-Encrypted: i=1; AJvYcCVMFVSjr0POHKaXSG7hDYHW18BlN6fqxBQt7bHtdkrJjrDItr71FGdpVwSITo1Axrqfe1zPJRkqut7vPouO@vger.kernel.org
X-Gm-Message-State: AOJu0YxVCIb1W00sTdb/8yLbiG4dKRzujQCuatXPOMSID5Yz6BdRPzFT
	ZrZDE/D5aSwk6zeKW31Y0SD8WYYpGGlUb+HY45SmRP80vpsjoG/OJPdk2HLldw2jZn2TET2S3H8
	NRKDKymvKdAKT5Mt6V9l1K2uedKXsd24/bsgFBE2cX+XW04hPEzXCf6M8vbQbqzaUORNY
X-Gm-Gg: ASbGncvzePcSd9o405lFV2wADQGtMoBqXx7S9AHrBitRCdvJHIiiioPbFjbdMC/mrOc
	86ExNZVejscYy9nolmJ9DX+IuD465UBjj82+XQ1Z+wlVNjq607R+f3FUs9eR6uUK9oDHEyLP+A9
	KDXyDZmyjRnnlHkQz2jYdKZJdt6D8Fdj0icgQU/sTn4SlkvHEs9uea4bgn2HnfR4esi+3buEG06
	Cd+gJ07qeeWowdO3fLBQ1IsWqHbo/e0Ekofzf60qdedUo3WCuzDv/fvWXTrvQujLloWNKSdy5AO
	4+LXffKBqVT/x3BfOMegXW1hnbaBZLWnk6W4yDasNowXTuxP8QiZqGZh0TF2ISGZJxLnPllFys7
	B0rpaeIucwgMqqdwVrzt2q8NGt2xLgaPQohc4YEJlGI0lI2cvfO6HxfIVug==
X-Received: by 2002:a05:622a:4a8b:b0:4b6:2be2:e816 with SMTP id d75a77b69052e-4e576a45338mr152170511cf.8.1759746911830;
        Mon, 06 Oct 2025 03:35:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD7NGFTQ7j7kDpuOlH2JVm1Bio02PxWYP8W51tf9aEfgOxa//y48qL1owpgFsKldjyFIyTGA==
X-Received: by 2002:a05:622a:4a8b:b0:4b6:2be2:e816 with SMTP id d75a77b69052e-4e576a45338mr152170291cf.8.1759746911251;
        Mon, 06 Oct 2025 03:35:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4cdf47sm43332131fa.52.2025.10.06.03.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:35:10 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:35:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Xilin Wu <sophon@radxa.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
Message-ID: <v4oxbjc4jho5uuz2k2ou4rvycdwifu2wuvbhldgfrm7ord4yqu@7ktz3a4233ff>
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-2-86a14e8a34ac@linaro.org>
 <74446713-15a1-4706-b3c7-801724467575@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74446713-15a1-4706-b3c7-801724467575@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX/dMlz8yNtqgP
 wTEX5B/2OUTAaDq+ieFmYgNqisczM+M89PE2aOygfAk2TTLqxFk0tHL6LOgylT6Mq/Qp8HHRHJc
 IrIq2UVL/iyW2c8g2uNqNQL0q3if7d9Z8tcPD0oIa0lm73ZG+O3IN1hLrqjZqUgWTGci7SHdd+3
 eRnmPJyqQQSTNNCLlzAEMUApfHKFSHTUgYR+R/uySVhrYC27y0Q2v/FDnEiLnMYd6yp71VzlyB4
 JHN3ALpPoomuKh+L0fzzZCB+sOIYETnxTrrCUEsiIOa3kLSan3CCQ/XU4gXiSHrtZUKrzOFY7Oj
 pWqYaja7IYQM4hrsgKSFO4Q9lOsCyEJ/wX+ik2QEotyU+dl8f+hHXZj0TgYmxrG+pk/rWOla9wo
 NoJoVeJK12D4Yw+r2qdmv1jzzU3jQw==
X-Proofpoint-GUID: JEI2syeNmeE4rWqYG74KVVQ9SEgghysF
X-Proofpoint-ORIG-GUID: JEI2syeNmeE4rWqYG74KVVQ9SEgghysF
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e39b69 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=LC5ovIGdoV6AwfhOO1gA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On Mon, Oct 06, 2025 at 12:08:22PM +0200, Konrad Dybcio wrote:
> On 9/30/25 9:39 AM, Neil Armstrong wrote:
> > The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> > of a combo glue to route either lanes to the 4 shared physical lanes.
> > 
> > The routing of the lanes can be:
> > - 2 DP + 2 USB3
> > - 4 DP
> > - 2 USB3
> > 
> > Get the lanes mapping from DT and stop registering the USB-C
> > muxes in favor of a static mode and orientation detemined
> > by the lanes mapping.
> > 
> > This allows supporting boards with direct connection of USB3 and
> > DisplayPort lanes to the QMP Combo PHY lanes, not using the
> > USB-C Altmode feature.
> > 
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> 
> [...]
> 
> > +struct qmp_combo_lane_mapping {
> > +	unsigned int lanes_count;
> 
> "num_lanes"?
> 
> > +	enum typec_orientation orientation;
> > +	u32 lanes[4];
> > +};
> > +
> > +static const struct qmp_combo_lane_mapping usb3_data_lanes[] = {
> > +	{ 2, TYPEC_ORIENTATION_NORMAL, { 1, 0 }},
> > +	{ 2, TYPEC_ORIENTATION_REVERSE, { 2, 3 }},
> > +};
> > +
> > +static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
> > +	{ 1, TYPEC_ORIENTATION_NORMAL, { 0 }},
> > +	{ 1, TYPEC_ORIENTATION_REVERSE, { 3 }},
> 
> This is not corroborated by your bindings change ^
> 
> I'm also frankly not sure whether it's pin 2 or 3 that 1-lane-DP
> would be TXd on

If we follow the standard, it should be 3 (RX2, TX2, TX1, RX1)

> 
> > +	{ 2, TYPEC_ORIENTATION_NORMAL, { 3, 2 }},
> > +	{ 2, TYPEC_ORIENTATION_REVERSE, { 0, 1 }},
> > +	{ 4, TYPEC_ORIENTATION_NORMAL, { 3, 2, 1, 0 }},
> > +	{ 4, TYPEC_ORIENTATION_REVERSE, { 0, 1, 2, 3 }},
> 
> Would it be too cheesy to check orientation based like:

That won't catch weird errors like {0, 2, 1, 3}.

> 
> static bool qmpphy_mapping_orient_flipped(u32 *data_lanes)
> {
> 	return data_lanes[0] == 0;
> }
> 
> ?
> 
> > -	ret = qmp_combo_typec_register(qmp);
> > -	if (ret)
> > -		goto err_node_put;
> > +	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> > +
> > +	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
> > +	    of_find_property(dev->of_node, "orientation-switch", NULL)) {
> 
> of_property_present()
> 
> Konrad

-- 
With best wishes
Dmitry

