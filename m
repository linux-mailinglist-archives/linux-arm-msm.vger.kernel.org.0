Return-Path: <linux-arm-msm+bounces-54920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEDDA966C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610EA1887508
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C0D238C39;
	Tue, 22 Apr 2025 11:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lv9deyP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B312749E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319771; cv=none; b=X1L5qoll4Xp8/t6rJGDsRT6Tt4IhYxdjFzED+mkRkMYNPNdnWLy6WeCaxKgJ0fZ3kD4c+PVT8vnWezmAxz1vmAa2alb7MdZMUTlvqhv9UnDrHO9YBuFa01Tn5TeU6k61Z6bVJ2dbXslcwyIFeWPNw2Ga9cWegf5zROsIGBxVp1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319771; c=relaxed/simple;
	bh=X1Q1xjwPG2pD1HclX9JEf+yJ3b/ehvuIOj9c3epR+XY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibngsaL+ARqKjOicX0jNVabJUxMspGiD1C+w1H9xDxovwXY6VE/NonpfkohHGvO1MGCFtznk0nYSJmNNAeHRXNm2vrLaQEu+on4BStUKBo/HlgsIMUJ78jMJb5L87MVCqe2djhtwfYEHm2I0kfZAy6y4AOT7G8EPkKXcIsxPYRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lv9deyP0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OZA5025905
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sJhtSdw5nK1pkgx2a60KWDZ+
	+Ku84pOdAteitB7NlXw=; b=lv9deyP0hg7JX5LqUsV8SP8lgKAQfS9cGDSlrN24
	KXiAQzT1X5p2TU4H1meirbYwqPraKBqT/HgqEY3tdBjxMT9OplOHv75wdVVztgA+
	VBahFk6NYoR4/K+nE4FCPJhzvEJjqBzG0UI71PIY1HUcMSCdSa5OPuG9W7PoPCw2
	Gqe7bO8lrdeUBwgOhnlu0iN/U7Yh1GSK69iXvRYhKiUmxtExDc6GKJxiVS9u7BV6
	ggAV74OWgBSFEZVKcCm5sgLfpmsHnvrOvE1lQF9AKYEyts6L8Nht6TyU1wulKVDr
	l4movz6vzHEFwGInOy1QKvEgQlIbjid3tGGSHb6rJzkzpg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644kjf1pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:02:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c549ea7166so739772785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319768; x=1745924568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJhtSdw5nK1pkgx2a60KWDZ++Ku84pOdAteitB7NlXw=;
        b=qLbqrIjZLdVDtzX3fUKN5yObakXSmWK8aO1gw5MnhQaWarSMXDGLmVh74WogIUGNp9
         sVZP5u75K1RLjx14fcxjLwKJTuYzWMgBPe6tzX4uG6/+j0e9b3waLEA/6APEPC5is16B
         XEyKW2jbQYARhVzUIHdib4//bF6hA0snlJMNp1IFvlMceSEtL2KoJHRmd4gMdJGb1Fjv
         rsNgXA8zbFWwNYdfef7Y0ccIp1wnImF56KIamphMGd1vh+mxWAYQ1FB8FYYITxWPCFHF
         IiHBz9OKAkCHzqJrSgKjhsJV0HrNjA9i5qSSvFDxvfYH126+3YxLqxQMwwGdN9C5Jw7Z
         5CAg==
X-Forwarded-Encrypted: i=1; AJvYcCUL2YJMF8+F71faIr14jCIXckJy+46ZbN2C4n2VmAIAreClBCtjS/gvHKcgdxJPj4CDCWR96I+VpdDH1KpN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+j9SX5jmVa1iIhPLKBGU6DxKNLg6i+dxDtXosXChegsdyYjnA
	gKVDSQPLnSLGdukwsfH9TEv4jFsayIQB+qo2TvIiiCTyLhmUP+wk8bLC3nDmaId2PQFjHrnXz62
	sRxF4K0qgjWQyAHwsj9hM8Z9F3CXKlU9b/9IMsKDMXuRNTIgSgSuRTr3zbNkPXTjM
X-Gm-Gg: ASbGncvGTnNk2gPoWgGWKrYDiRvz7Dpd29MFv35/ibzWZgihDNFS9K5MZgp8Earjalk
	TES9sBnYe1/1Cww/ahQ2huRNZAb5gdU7Fx6D0t2BiZm107oE7Z9U7FWh1P/vcH1xPChTZSJUeB+
	1tT1nwQbslJC809VZJ0rCF5xsJF5xOzxvEVkwzbYygo4RCRCbn/iwuAtQqyMLMLR9MZKEqc7kF8
	2OI9CyIWmoV6s9MOfePG04Mag3i40N1Ry7Usa69aSZfiLJKW27yF343YG8EJRXRpZvWEYoZj4oy
	5zhfF2bejk3xc5+GqBi2vggx0cPen6iXxThwRzxt8Aim5VsTZEMNS/rki7AKSTpItK2ttMxvWpg
	=
X-Received: by 2002:a05:620a:17aa:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7c927f6b4e5mr2210332985a.10.1745319767863;
        Tue, 22 Apr 2025 04:02:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN4wwPzrrHx8nsqrV5sbJ9OQl73YTYbgT962Arex3Cx5QfII5Wsr6EMD6ZHVslJXEdDC01pg==
X-Received: by 2002:a05:620a:17aa:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7c927f6b4e5mr2210328785a.10.1745319767506;
        Tue, 22 Apr 2025 04:02:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5251f5sm1189258e87.51.2025.04.22.04.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:02:46 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:02:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Ayushi Makhija <amakhija@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <2qpcmniww7uaemu5tvgbjpnijqqzlrcvf2dkewvumffnsdpsib@fl3tvbldtjds>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-8-amakhija@qti.qualcomm.com>
 <qnhfnxvdsgnw5jh4xxaqz3p2x67qcrr7kn3vwdnyz5huchdtzy@aagflznjrvly>
 <d77353b0-94e6-4461-bd34-44c8cb80eb07@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d77353b0-94e6-4461-bd34-44c8cb80eb07@quicinc.com>
X-Proofpoint-GUID: 1xIu0YtNJpdRe_BJizylEbKuCrIcU43v
X-Authority-Analysis: v=2.4 cv=f5pIBPyM c=1 sm=1 tr=0 ts=68077759 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Ofgg3MdZYWJxeOF5shIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1xIu0YtNJpdRe_BJizylEbKuCrIcU43v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220083

On Tue, Apr 22, 2025 at 12:28:20PM +0530, Ayushi Makhija wrote:
> On 4/17/2025 4:10 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 17, 2025 at 11:09:05AM +0530, Ayushi Makhija wrote:
> >> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>
> >> Add anx7625 DSI to DP bridge device nodes.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 180 +++++++++++++++++++++
> >>  1 file changed, 180 insertions(+)
> >>
> >> @@ -519,7 +550,107 @@ &i2c18 {
> >>  	clock-frequency = <400000>;
> >>  	pinctrl-0 = <&qup_i2c18_default>;
> >>  	pinctrl-names = "default";
> >> +
> >>  	status = "okay";
> >> +
> >> +	io_expander: gpio@74 {
> >> +		compatible = "ti,tca9539";
> >> +		reg = <0x74>;
> >> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> >> +		gpio-controller;
> >> +		#gpio-cells = <2>;
> >> +		interrupt-controller;
> >> +		#interrupt-cells = <2>;
> > 
> > No reset-gpios? Is the expander being used by something else so that we
> > don't want it to be reset during the bootup?
> > 
> Hi Dmitry,
> 
> Please, ignore the previous reply.
> 
> This io_expander is used by anx7625 bridge only. I have defined the gpio in pinctrl setting and so far it was helping out indirectly to bring io_expander out
> of the reset. The reset-gpios is optional for tca9539, because of which the io_expander driver didn't throw an error and I never realize that I should add this property.
> 
> I tested by adding the reset-gpios entry and it's working fine. I will update in the next patchset.
> 
> + reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>; 
> 
> Thanks again, for pointing it out.

SGTM

> 
> Thanks,
> Ayushi
> 
> >> +
> >> +		pinctrl-0 = <&io_expander_intr_active>,
> >> +			    <&io_expander_reset_active>;
> >> +		pinctrl-names = "default";
> >> +	};
> >> +
> > 
> > The rest LGTM
> > 
> 

-- 
With best wishes
Dmitry

