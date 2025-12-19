Return-Path: <linux-arm-msm+bounces-85843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D799BCCF8E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A02FB30625AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B4830FF25;
	Fri, 19 Dec 2025 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpL84bIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAFUrSDD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE730F80A
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766143215; cv=none; b=m1wrHh1T6y1aTn+jxScmQgCmBuiYitQzfOklyfZEJceJWfNjOvP29ngGR9yLTZW9Rhtfy2g5sCTM/0kDqUSsqel0R4FINwjbaTFA85J+m76u/7wyioVRhKnVAlg1Dv3XgP4a4SFcakr3DByRr/n3GO5QzimHzByLjJ52LHb7b6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766143215; c=relaxed/simple;
	bh=yzv0Wujr1TJ1hy7yewWQyhUc+5w3dyd4j4Vf3b/LXZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4ngvG1NMxaLr6NrNg788MSOd2N5uGuGlqlhf+6QDnaXxW7KR8AN22F7ThaJ1PzsJxAC1+imxZopCmDjdeQmvt/pVcCibjNDJfFWF9C+MxX9QjfP4VqYG5zFy1A9NNVgoYKRVpfm6wa3Fx+ELEZPrWyeHXtbNDkRevK2m3KCIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpL84bIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAFUrSDD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c2vo3939215
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cVTEv+iMTNFqtmux2UVs/QLP
	9GxFzATRQPiubj6Qs7E=; b=KpL84bIRY9ucjS16t3Rr6pivvxw5Xv8CtBfoCjRC
	8HWI0qHk8XApfBHtv9HFyYLcsGuFZUvhRZEsUKpWw1R7Q54FWgcjzNS63YSKSqzA
	oOknYuoubevLB6k34J9aIlEdHHEV7IPpbqEXQlxMxORMVUOUI7iZi1+eOzvlpxao
	xB3ufLXmrMM4vXeZPknqOXerr3V68WqM26X3RcEbuLvg54ORGoefI7YaYsh7jPh0
	67nIEis3myR9mupiBHZfua8sya4nnO+VspTtG13JPc5VxkZwZhBZtBbKYBDy65px
	veQYj6ETg8WV1OgewwOTiMCbCvK4ecD4Ciz7zF8Mw87Z+Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2f94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:20:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7bf693d5f0dso382655b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766143213; x=1766748013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cVTEv+iMTNFqtmux2UVs/QLP9GxFzATRQPiubj6Qs7E=;
        b=jAFUrSDDqOy3CWWaKBjViBHNhvnnQtTYwRHitkDgmBjTFSqUajW4kqv8xY1W+RzMy3
         JJwNEhUiwGX5UiDy035tK/KFAOHzslc2rWSfc7SMgoWezQ1deP9IQX269fx6yYCa1Frj
         r+uBR4lxDFET0lktOwG+9tZK5hyttFUXMeiD+D8hYAdawpqRfZlZBrxOShpP4buE5biQ
         YBqeRZs/qxgvONBwbv0T7h/IQngVCPXTXVvHoTPYUDw+YIgH8JaLRSfEb+VklXSaN5HZ
         exy+NAgToxAgNva0GZJi55Qbq58ucDbB2XSGIcof4ieohgXHMdjcdGwoV5NDUsjv7/Uq
         9uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766143213; x=1766748013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVTEv+iMTNFqtmux2UVs/QLP9GxFzATRQPiubj6Qs7E=;
        b=SH0Wgtdv0JifUaQBrgeSTBM47B8oI7vohH44+CZtc+a7BdnGB5+qB2uxvIQDntoUXY
         kx2wzK4CKcOrMpElzStkwY7V/k1MSgRYCP2Xhs04VkKilpVT3vm9n0bkk2lLvzpZc04r
         0QoH7S6gf2yHkL1p+UteuUaY0qT5/m2Rc5f+80KinvItnn86lVHb1ldSg3l9z7gvJFFH
         gt6S1FjkzV5Axjh9+uR4sh0nn4LdPb97Iz9nUDe+7Z2VvNzMbICKf3/N2DYOOyKp7B7h
         YiK5Pv1CGBrnPYlXgAeEguqpzhp4whLLPEvPtp4/SYH8s6MMi5fZHS/rWsCB/UWtXfwo
         HV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1J54d6KaFnubBnC6L/0ubrKpUcqfIETn33eyn/kQeMYzK4SB+FakOj7gB4p84CU4KjrSaau+0NwqSZCYu@vger.kernel.org
X-Gm-Message-State: AOJu0YzlAfau2zuHPDPJSjiZHxPFBhRATqUhJf5UENRsoRyDWhmSpwkE
	si4iKM+do8rE5osXEDP0ZYnvbL7j3p+Gy7FzfQqfAO5qFrJohR+wGB+vwRMvI35TpwGsmNeImYp
	NA400NeB40JfSBhBv6rKo7Mx59kW6iz/cZHh8FfBlQuuV52kLxS3B9JWzotrsk3lRy/UD
X-Gm-Gg: AY/fxX7JApSqDSN5+HyvtBQbPN1F7KXtkShE2Q9zVbnHuKL3DAWlna9GUySY3wddYOX
	gFjb5XB4lfF1QF767HUNbAOPzu9aSdkdYFCPjztFL3C7cEBR5DKIm0C4hm6czgFhp4GKvkRrlWL
	s3uqpvXBqrWv1+0//W+iQkVErAJ6wW2a0Wfegv85YxVP8Die71FDA07n4e47O0buf2neuqbiIO+
	LFV8AWJAil6++90oPFs+FMvx+MgfJ0D04R56E+J3oBy5+2rDLjgqTZPUZLf9rwAMvUzoSUfd8IE
	DMS3iDV7ibrfIjSSCkJPBb9LYdHuQ2aT+rcO7SYUPHPtrr4TsDA7EAKOl2EQAnaJHjRHznAekyy
	bLscKPOfUFDfxtjmtn+mhi/yycuG/odd8VYM6+TwvVTUOTIVxDhG5O1uE/PZoi8aOhkxwsR6pXR
	/Di/6upqtRJ3Hiy4YI/KHqfX+MjZp1Zw==
X-Received: by 2002:a05:6a00:17a1:b0:7b2:b20:e8d9 with SMTP id d2e1a72fcca58-7ff682460c9mr1538956b3a.6.1766143210752;
        Fri, 19 Dec 2025 03:20:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRxvid2ITdK77A2kwcgTAQXHFgITJ8109yZtJKNM+oMZak8qL757acshzF7BUhVnpVU+1zmA==
X-Received: by 2002:a05:6a00:17a1:b0:7b2:b20:e8d9 with SMTP id d2e1a72fcca58-7ff682460c9mr1538939b3a.6.1766143209815;
        Fri, 19 Dec 2025 03:20:09 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19besm2119547b3a.40.2025.12.19.03.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:20:09 -0800 (PST)
Date: Fri, 19 Dec 2025 16:50:04 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Message-ID: <aUU05P+xP1XdwihO@hu-vishsain-blr.qualcomm.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
 <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
 <7d31f45b-1062-4118-8769-49209908f2ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d31f45b-1062-4118-8769-49209908f2ef@oss.qualcomm.com>
X-Proofpoint-GUID: RCg2Aqgb-A7m6StEbgBIxkeW2CIT0dSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5MyBTYWx0ZWRfX1gQLgtrPrMia
 2zsoYQ5ZAuDxIvaAogHEWpU86F0B24+x6vjsQW12r3CRqhSPWXNGrdIpS1BSXUiPy+4m6j54FpK
 8FPV0wNARES1nPM5D0K8OuJ3hzWiyne/K1If4kyLJDFDP1POLZvwMS1R3NZIy6t6SD9lW9RrgTl
 z9ecFCsuMSzBIB2IQFAIjYl0GO8EzAEXgmtDSrEjwSyPbz1bRpc4F8lEjFMs8UUGzik1brWgx2Q
 sloWF+iuFU7G9ExO5cr0owAmJHuJz2/PB/rslr6R+9imYbQcKhdk5m9pvDUZkaglnpSvLlcXq/5
 mU7la7zMAskCqc8KmVixBKtiFjWloVcWALn7ZPP/9zCOMpZyqzjB8/X9bt7BEMMFJ8oVJWJiNE4
 eVwaVESbezwm+er+dyn+oIf+DNlON/KL7DjZ/nudZFrKEcd3F1ZIbWZr0O5XvQiYbjojCeisK3E
 k8CmrwXkYmOgXo5IlUA==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=694534ed cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iL0Xn0DY59onnIyBFO0A:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: RCg2Aqgb-A7m6StEbgBIxkeW2CIT0dSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190093

On Thu, Nov 20, 2025 at 01:11:00PM +0100, Konrad Dybcio wrote:
> On 11/20/25 11:58 AM, Vishnu Saini wrote:
> > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > converter. Edp PHY from monaco soc is connected to lt8713sx
> > as input and output of lt8713sx is connected to 3 mini DP ports.
> > Two of these ports are available in mainboard and one port
> > is available on Mezz board. lt8713sx is connected to soc over
> > i2c0 and with reset gpio connected to pin6 or ioexpander5.
> > 
> > Enable the edp nodes from monaco and enable lontium lt8713sx
> > bridge node.
> > 
> > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&i2c0 {
> > +	pinctrl-0 = <&qup_i2c0_default>;
> > +	pinctrl-names = "default";
> > +
> > +	status = "okay";
> > +
> > +	lt8713sx: lt8713sx@4f {
> 
> Node names should be generic, so bridge@4f
Yes, done in V2.
 
> > +		/*Display bridge chip, DP1.4/HDMI2.0/DP++ hub*/
> 
> Comment start/stop markers should have a space after/before them
> respectively, however I'm not sure this comment is useful given the
> dt-bindings already describe what it is
>
Removed this comment in V2. 
> [...]
> 
> >  &tlmm {
> > +	dp_hot_plug_det: dp-hot-plug-det-state {
> > +		pins = "gpio94";
> > +		function = "edp0_hot";
> > +		bias-disable;
> 
> This is an SoC-mandated function on the pin, so please move it to
> monaco.dtsi
Yes, done in V2.

> 
> > +	};
> > +
> >  	ethernet0_default: ethernet0-default-state {
> >  		ethernet0_mdc: ethernet0-mdc-pins {
> >  			pins = "gpio5";
> > @@ -451,6 +488,13 @@ ethernet0_mdio: ethernet0-mdio-pins {
> >  		};
> >  	};
> >  
> > +	qup_i2c0_default: qup-i2c0-state {
> > +		pins = "gpio17", "gpio18";
> > +		function = "qup0_se0";
> > +		drive-strength = <2>;
> > +		bias-pull-up;
> 
> Similarly, you can move these settings to monaco.dtsi and keep them as
> defaults since 99.99% of I2C users will share them
Is it ok if i update this in a different series, similar other nodes like qup_i2c1_default
added in monaco-evk.dts?
> Konrad

