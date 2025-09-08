Return-Path: <linux-arm-msm+bounces-72571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92411B48E05
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 14:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2DB1C20A35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32532304BB5;
	Mon,  8 Sep 2025 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nILe2uh6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC87305043
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757335692; cv=none; b=cH4KjdgYk2z2KMphWQ4HQxCyjqyQE0oRNA/IqB/Wmhp2sP3ByGFSZocnO+i1cNsmucIfgKPNR0wrafvDW44yFSR5Q/OBDgRWt9FnppuJDfTNUr2h+Xixa35l6JETm+4o8QEBrqPI6U0/1eRs+jpEPg7yosaDfgGy4SRwdOyvzUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757335692; c=relaxed/simple;
	bh=K2/YBguJd5+rFvNMPdDfR5o96Jh6aEU7iCnUaQFSBXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNVLF3O8U6gpa6bVN4KXos7zrUTUrgOGxzqABPXzeb8dx29b2b+7Kp5Qg0giO2TYozz6O/EtiBp6t0Hzt8ajWwG7853hghH7wdPSaKLo2CqNKO+1YmnMoXT1adysKxrDHJst6z2Y0ojXFeFkpX1U4PdltsYRkv6XKcSc2Ak/kPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nILe2uh6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888vTjR015718
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 12:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kGOV2gIZ8/LZzeSdtfajpCAt/ShEWupLlnbeU/zE74Q=; b=nILe2uh629sd5hrh
	pJzmI2VhURz2gYm3SUJNLN4v/eoBUpsWxGui22awgo/dUeJb4syD9DE8ffPE1BMG
	/gyAfaZKgSfrUYJVDznyjROnpkhmcfi9Vb7kbmnx+y7vZBzEOQZxMMepPXJmIK4s
	/1+SxV2SEfYJPjR4YYq+mobf+dUFV9ITb0cLerN+9UP1tU1sENqE+kOiGkNg4sE5
	592CNMjM8hQsKMBGMiBVAbUnxIV+UQm0kvg5MIG33wvMmdKgn29LvOVzJkjm9Lza
	/9YEkIDHiLkHt3RcyB8nKxE8HA4WR9J3L1ZYssq4pm2m1n6GbObqB3CpuoOJ2IeP
	Ig8+4w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8ckp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:48:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-720408622e2so93672756d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757335687; x=1757940487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGOV2gIZ8/LZzeSdtfajpCAt/ShEWupLlnbeU/zE74Q=;
        b=CL5+5GZgHy3pv9WukJuPD58wnfHRZ7+EiTUrMCRzP07MfnD1g+xFjlQsxi+Sy8HN/3
         2e+IJCuEdYeZIle0mV9rM6aOkkREvGcOmTApfWIyngNfWrfxiVLEKGxpNizVNMZEGvR2
         3ih/0hTlfJlRqaOnajHv+R9ttBbfAksZlzyP4Japyb0J2b1wK60V5nhiKI21o5aixJKr
         KEzV0P8FCXSG0aKYYB/OxgP6lJ4CZjJA9c5fawfO0WDhfKNCIEnAjbdVM7zx1R1duav8
         yG8acymv0f2uZn0rdYtZCV6Dz73zohsKZ/o1cbsrIvmEzsHtLKrxexPKjs+Wbdb7i5aj
         Pwrg==
X-Forwarded-Encrypted: i=1; AJvYcCXQcnIQ3BkNZzlr56pKcb4AKpHv6wRweclk1PO8euPWmGljtacfuZ/SEfvye5l4zHgUub/xbg7reyZnyuOg@vger.kernel.org
X-Gm-Message-State: AOJu0YyRhy+rRkzW2oCl/FwlWSn3WHHWsURP6ERaG4CgWO1o1W0L6gWR
	czm9vYvjbL0idXlop6aHbdo3kMwfdIX4ho6I+rykaoTPUutSq9k2ZmHw/Q9SmMkdJgKL2xuwAdf
	W61ncQaodNeOjPCK673dvzogM+zuJsXq2K1oSlFuliYRWGvQ7df3j0rbN3KoirIFNik6Q
X-Gm-Gg: ASbGncsa0BxDmSaHAnMEppwNjWJ1+0Y2nWm6PfaA6TUjbYbRCseI9vlzSlqCf7Tfalp
	tPuwrS2LQy+guQY1+jBVT9jw2Kl8Mekhg2ty5Rz1sDl7iQF4nVSIq9GXLsUoFUAoconZg96ATmJ
	K7OtQoYCcet4/7oDlGzMW3VDKnjqG9cd+5HSyadfTHA0hTb9h7123muN1YV8SwiSr/3nCfmfxTX
	QS+DwDzeQXwBf3410hfyqrcgRrrvZkhTBUm/T5kdHEpfeihs5hDgryWjoqnZUWp/1kguJ2qED3j
	WFRD0MQRq6XOMA1VdnLZG0Z+Vz+bcOCDkBPre+hsur0O//b+LpZvseF6njCTf7omTCrGeqx36qd
	Usfl3nx2XuI4l79s38KGS5kQwgkp+i4ynT1camqp62an1sEMh2AbH
X-Received: by 2002:ad4:5965:0:b0:72c:3873:2e43 with SMTP id 6a1803df08f44-739322fe85dmr103270656d6.25.1757335686990;
        Mon, 08 Sep 2025 05:48:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg9PYvI2ZzljUif+Cb6iwuKs++XEvfJYXlwnEIgsLnk5PM2U1MDib/KVyVesyQhvdkI0ZL4g==
X-Received: by 2002:ad4:5965:0:b0:72c:3873:2e43 with SMTP id 6a1803df08f44-739322fe85dmr103270296d6.25.1757335686430;
        Mon, 08 Sep 2025 05:48:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm3569403e87.85.2025.09.08.05.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:48:05 -0700 (PDT)
Date: Mon, 8 Sep 2025 15:48:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Message-ID: <2iazalkbsl2vrukgzt7ba7jd5hhok76f7j5tlfbe6d4c2ezxks@25sol47tyt72>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
 <a38df652-54c0-4216-9aa5-c8d32599c8f7@oldschoolsolutions.biz>
 <c66fe361-74c9-4471-b371-353ca582bb3b@oss.qualcomm.com>
 <xzw26v6aqutgau3zwm3njblf2qw2em53n45ju2yhhfh7uhyxbz@6kqvink2chld>
 <365b984c-a5e0-4fa3-a011-b897107e2b92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <365b984c-a5e0-4fa3-a011-b897107e2b92@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX4v56JQlyvee+
 u5OVoNt/I5SsbLMXFEq+2u/BB8+UtS7ldXtF5jytYS6HopnXAuKY7w+NS9nq/aHJrYsMxjILJj8
 mEmnmE3K4IhTI3Bn75zH9hRzS0NZi+CTfqr3cieFnQP+LqLVDk4v+HJ7LDJzIkDDCleYpZVMSbW
 TTFj8iYlk1zyX64WmAu8TFQxHyWwAljNQatTWq81AfrIcNZce9O65beWN90y5MeybecMqBVoTnC
 onkjaeGoxdJ8Bm1xf24XTe1A8Fy2JrWAMLsY4GTmCwHCopUput93pM3YkdbzvWXgZ7O59v9qcoT
 0z11f+uktoMjQttX1as3/5srsauZ2M/tC+L72Xyz4wBDBJ5G8zcPz1BEGaJEGufxeHKEF6Jx05f
 UFG4Ss/2
X-Proofpoint-ORIG-GUID: rhBOfKkTs-lgkVyuQmoEiyqyRIl13eMp
X-Proofpoint-GUID: rhBOfKkTs-lgkVyuQmoEiyqyRIl13eMp
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bed089 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=uA7_YokYup9Xwil_snIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Mon, Sep 08, 2025 at 01:40:06PM +0200, Konrad Dybcio wrote:
> On 9/8/25 11:39 AM, Dmitry Baryshkov wrote:
> > On Mon, Sep 08, 2025 at 09:16:29AM +0200, Konrad Dybcio wrote:
> >> On 9/6/25 10:41 AM, Jens Glathe wrote:
> >>> On 21.08.25 15:53, Neil Armstrong wrote:
> >>>> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> >>>> connected to the third QMP Combo PHY 4 lanes.
> >>>>
> >>> [...]
> >>>>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
> >>>>   1 file changed, 44 insertions(+)
> >>> [...]
> >>>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >>>> index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >>> [...]
> >>>> +&mdss_dp2 {
> >>>> +    status = "okay";
> >>>> +};
> >>>> +
> >>>> +&mdss_dp2_out {
> >>>> +    data-lanes = <0 1 2 3>;
> >>>> +};
> >>>> +
> >>>
> >>> Hi Neil,
> >>>
> >>> shouldn't mdss_dp2_out also have the link-frequencies property?
> >>>
> >>> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> >>>
> >>> Or is it something the bridge already negotiates?
> >>
> >> No, it seems like our driver falls back to HBR2 (54xx) ever since the
> >> driver has been made aware of this property:
> >>
> >> commit 381518a1677c49742a85f51e8f0e89f4b9b7d297
> >> Author: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> Date:   Tue Dec 27 09:45:02 2022 -0800
> >>
> >>     drm/msm/dp: Add capability to parser and retrieve max DP link supported rate from link-frequencies property of dp_out endpoint
> >>
> >> Dmitry, is there any reason not to allow HBR3 by default? Is our dp
> >> controller/driver not smart enough not to advertise rates it can't
> >> support, during negotiation?
> > 
> > I don't remember the exact details. If I remmber correctly, there were
> > cases where using HBR3 resulted in a less stable signal than falling
> > back to HBR2.
> 
> A very early revision of that series has a commit message that reads:
> 
> """
> Since it is not every platform supports HBR3 link rate, this patch
> limit the DP link rate at max link rate if it is specified at DTS file.
> Otherwise, the max dp link rate will be limited at HBR2 as before.

Yep. And the platform here means the whole device, not just the SoC /
SKU.

> """
> 
> Konrad

-- 
With best wishes
Dmitry

