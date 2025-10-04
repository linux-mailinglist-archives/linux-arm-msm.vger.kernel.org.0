Return-Path: <linux-arm-msm+bounces-75963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA75BB8A20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 08:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4BA83C7445
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 06:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE851DE4CA;
	Sat,  4 Oct 2025 06:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRDARAtj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408617C21E
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Oct 2025 06:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759560401; cv=none; b=qRRKNtpNFVl+5sjQUDruHYQ18AgvdJiMbqy6gyVKJnqud2YUVSjGndptFC09WbOyZ1kQarmsGuXe4tHlL9KmbUtu6IhEcyqGzmDZJL/aefrwvKa6rJXzi77Shz65T6dXiOMZSt0loYdbTkm7WKEPjNQfm9icjggvPqRpN66MGkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759560401; c=relaxed/simple;
	bh=5++0P7uz052KSdAfnQftmsr2lS2tYCz4teFtQ5Joy7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ohieu8w9IrTBafwFVSewuNrey2YXhcqn87fsjPcGxtMs0uCAz/1bGyX/Eis+p7/pxTur5EuL+tJeFxDwdG1Cbzfd+7YAdHgfqQ97Sco0Jnj4PlkKesLj7Z++79tYJDtH6533DByS5OMWEcQfUeWzhbvkOG2v2Qn9OnpX1OToU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRDARAtj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5940gjNl001216
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Oct 2025 06:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SxgQPHjjkx8c1JmVgGvAmy4X
	988IpWVIdlbWqL8CFH0=; b=jRDARAtjbq1gFjlUyxD12R0QuUfkOgrk6+KqdLVf
	+fWmZWHod+zsco+B/5ABnyRJ/ITSHHBm7Zk7yrJiD81xjkkNd8ls5vT5DOQcxdWc
	uu0f+iDA94oeWUjj+2fRV+ht4luJSUjrN/7n9zM8vlDeYr3G9S2H1BcnWHtx9XC+
	l5sOEEoKO8c4CeCjPblMezVV1CPAsX1MaDv6GDIfP6I8JjdUSeKlXK8LYM/qeuIn
	73HJ/VlSyT3sPX5kbmSuR5ALzJ+YVwI+xcicBd/AwHts8p7Voo3oZEJCzD64PjYr
	tGTdnEef4yFfu9YJObPWZSuurQUdXZb1ZkDDVxMvBX//pw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9drf7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Oct 2025 06:46:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dbd8484abbso39955291cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 23:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759560398; x=1760165198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxgQPHjjkx8c1JmVgGvAmy4X988IpWVIdlbWqL8CFH0=;
        b=I6lATXPAUJOwbmc7ha42czVG+4Qcg537fOfYfLkfNQBoe3f9q4mjJ/pAsDOKhjMh3X
         6DJ5kW5ibVvFGlDYti4pyrByJ1xhG92UQ9LjUw6gwABdb0qToHGdq8JlrbdUbBov26oU
         JvzBNeSrOi+pFm/xCP9/lYs/fHpPh0EnrBeBn9LTigwPFJUgEOfDkGXbmC3I+AE0CEkI
         dDRUy7V4pFcSUl8kiTwvOo/AtcCCHm5B6urrsncCZSlnTIUche127+DEbsY1Ksf/1ir9
         ENzE/W8/EXvkV5XdqTpnQADF/POcqgkoHqZUSFq6h7YcxckXWqlrz8/3bQqCAyX7YTfp
         1wGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqvJcY1p8Wu9Z0SSj0lIW0AVt67g5oztYnGxgHFfDeRHKn7QJXPAk1uKgkZvYAjvn7ylafeVsYGV3+BqZY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz162+4Ts63hLpQIEUjqor2MeNRE13s8s2gPhRxwpviPz8xHgkG
	FWtOe/MoyCqpP95gDEcOl63QCPDk80tHTDJslSiuFLoFeOlqJe07eNUmc3ngmVqypZDwGJlgZhs
	74YkaGxO+1V4Bw6r0RWOgFMEKNIc3PZ0rjVyMVS+7xbbrmNjR7bYBz0NJIIaMiJBcbxcu
X-Gm-Gg: ASbGncv/vtBqAbs6eGGNOhnsFMfhlzwfXG0QgKf615j1pVM+2kT8POvB18crc9GxS0K
	f1YPwwncxlSd0GBWYkNc37+Jbov/YU6wdosJBOSYm5hFgb+q4kk1V1/dXJg597mmXoAIJ8/jum0
	5pjMs/vo4h3kG7RCZIXNIZeTBDsoBxZ1FDiqc7rMvj+K02oM53ZK/41oqe80I/7YEAJjRRPFD3u
	RwdI3t2elhX48p5vUEw1DLw45OPG9EQX7hbRjAH7eT3gCxTzpgfg+b0U7cHBGbyaSuQ4NQJQ00f
	1fsC6zWwiJEP0UchSiPf+nrRZr67lizOOija/Y2938lLmNj1JnXEmdCh+DxX28RzzYq0wgXF4Kp
	+g9j2ZJrPw4jyyYRhxQ4y2+kAsHWcWR1fXF/JVbnfolxf6ptC5xmJR3RPlw==
X-Received: by 2002:a05:622a:1445:b0:4d0:7158:b18f with SMTP id d75a77b69052e-4e576b1372dmr72499311cf.63.1759560398163;
        Fri, 03 Oct 2025 23:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQvslGGL2S9yvJwcUTY/EvgxyUZIovyV0WIRAR6wT5X3G5XXzp9YE1BKwE2cINLOH+uPi89w==
X-Received: by 2002:a05:622a:1445:b0:4d0:7158:b18f with SMTP id d75a77b69052e-4e576b1372dmr72499151cf.63.1759560397681;
        Fri, 03 Oct 2025 23:46:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01134eeasm2555271e87.34.2025.10.03.23.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 23:46:36 -0700 (PDT)
Date: Sat, 4 Oct 2025 09:46:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Xilin Wu <sophon@radxa.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
Message-ID: <3i3euwqqvtqgyqgxbylbrj3dk2cyyavinb5v7ocevi4x6o25y5@66fodqy736kq>
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-2-86a14e8a34ac@linaro.org>
 <uozgwot7yuwmaiwmqoo6ickblpqe52tnj44tnxcorygqxwou52@hksvktgq5zp7>
 <9d020a8e-22d8-4f1f-803c-d00bb912f699@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d020a8e-22d8-4f1f-803c-d00bb912f699@linaro.org>
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e0c2cf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=P-s5V6jcMkwkI3aNiSkA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WMcWu1dT90n9-2OE-GtrUzR4zNm8ok08
X-Proofpoint-ORIG-GUID: WMcWu1dT90n9-2OE-GtrUzR4zNm8ok08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX7eqfUu5J2icB
 5h608SkVlIVogPn5k8e6n3ullAOSQfZmLi15KIlSmPMPSBad7zZjvi2C2ZpZt44t+vDs9keCSJH
 yCtLiv9vd0f20NJI0TOKf+u+PEzjbIEw8Nm0arD9dzvhC7br47G/CirNJ+JUScpunDkDAc2YVa6
 CXV7MFLNLK2Ng0lmqmsE0aIiyJLKV3d7RFjDHQPqW7Pw9Wh/D5QloxBtbw/IPREgNlDTZTYbhl7
 +igqd9HhcD0FZcSpz/obmk7RjaPn4r35MeVTtTAXNhAeY4bs98c0RRfZtT2t9tCcB8hfBQw3nKq
 HqhduJCSP0MOFbviCdWoGXsF8McO/HUaCOG7bnpdTMunyTkHuWmIherZ3Ychxrzg5trLSFrlhR2
 vgT61mvMGadmwv3KYn1akSr9Z66vXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On Wed, Oct 01, 2025 at 09:06:10AM +0200, Neil Armstrong wrote:
> On 9/30/25 20:56, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 09:39:48AM +0200, Neil Armstrong wrote:
> > > The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> > > of a combo glue to route either lanes to the 4 shared physical lanes.
> > > 
> > > The routing of the lanes can be:
> > > - 2 DP + 2 USB3
> > > - 4 DP
> > > - 2 USB3
> > > 
> > > Get the lanes mapping from DT and stop registering the USB-C
> > > muxes in favor of a static mode and orientation detemined
> > > by the lanes mapping.
> > > 
> > > This allows supporting boards with direct connection of USB3 and
> > > DisplayPort lanes to the QMP Combo PHY lanes, not using the
> > > USB-C Altmode feature.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 145 ++++++++++++++++++++++++++++--
> > >   1 file changed, 137 insertions(+), 8 deletions(-)
> > > 
> > > @@ -4167,9 +4269,41 @@ static int qmp_combo_probe(struct platform_device *pdev)
> > >   	if (ret)
> > >   		goto err_node_put;
> > > -	ret = qmp_combo_typec_register(qmp);
> > > -	if (ret)
> > > -		goto err_node_put;
> > > +	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> > > +
> > > +	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
> > > +	    of_find_property(dev->of_node, "orientation-switch", NULL)) {
> > > +		ret = qmp_combo_typec_register(qmp);
> > > +		if (ret)
> > > +			goto err_node_put;
> > > +	} else {
> > > +		enum typec_orientation dp_orientation = TYPEC_ORIENTATION_NONE;
> > > +		enum typec_orientation usb3_orientation = TYPEC_ORIENTATION_NONE;
> > > +
> > > +		ret = qmp_combo_get_dt_dp_orientation(dev, &dp_orientation);
> > > +		if (ret)
> > > +			goto err_node_put;
> > > +
> > > +		ret = qmp_combo_get_dt_usb3_orientation(dev, &usb3_orientation);
> > > +		if (ret)
> > > +			goto err_node_put;
> > > +
> > > +		if (dp_orientation == TYPEC_ORIENTATION_NONE &&
> > > +		    usb3_orientation != TYPEC_ORIENTATION_NONE) {
> > > +			qmp->qmpphy_mode = QMPPHY_MODE_USB3_ONLY;
> > > +			qmp->orientation = usb3_orientation;
> > > +		} else if (usb3_orientation == TYPEC_ORIENTATION_NONE &&
> > > +			 dp_orientation != TYPEC_ORIENTATION_NONE) {
> > > +			qmp->qmpphy_mode = QMPPHY_MODE_DP_ONLY;
> > > +			qmp->orientation = dp_orientation;
> > > +		} else if (dp_orientation != TYPEC_ORIENTATION_NONE &&
> > > +			 dp_orientation == usb3_orientation) {
> > > +			qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> > > +			qmp->orientation = dp_orientation;
> > > +		} else {
> > > +			dev_warn(dev, "unable to determine orientation & mode from data-lanes");
> > > +		}
> > > +	}
> > >   	ret = drm_aux_bridge_register(dev);
> > >   	if (ret)
> > > @@ -4189,11 +4323,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
> > >   	if (ret)
> > >   		goto err_node_put;
> > > -	/*
> > > -	 * The hw default is USB3_ONLY, but USB3+DP mode lets us more easily
> > > -	 * check both sub-blocks' init tables for blunders at probe time.
> > > -	 */
> > > -	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> > 
> > SHouldn't this still be a default in the 'normal' USB-C case?
> 
> It is, I just moved it before the added logic, but the comment doesn't really
> apply anymore

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

