Return-Path: <linux-arm-msm+bounces-86526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BC5CDBCE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A56C23009FE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340773321D3;
	Wed, 24 Dec 2025 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr7sUGrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1+icLID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9CF3321DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766568712; cv=none; b=jf2koTDaIzla609NfIQjZDCKx5j3yjTVsEiMwGa1S4gRKblv32GLVnco00ohB0zVNB7HkgUTdjh6/mf15aGJLCUfQdnmZUyQsrQqmnVGK6vhJGbI4Z5ix32PHlhJGcrTHYeABXJWoXU3m3NCa53ruQCmpHklHNclLbq6CCj9ufo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766568712; c=relaxed/simple;
	bh=zvXaJ6+/+UwICxdI9c37a7HX7xFrLmdzWbivSVbo1wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOWdeC9QzVzGwCVbsV4zUeK7+TAMcvUbFPNfHjHWUDb3je/6hZj+3c0QViXEDW+iEtGadiLqbIxc07cAkD10qSC3AH1DTXj0hD3SEIe6GZUN+20qZS3FZNunfaUWwAnPS8HOkQF/8I+LqtNbqHtzlYuiyDlJ+qkxIrAZQrkyXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr7sUGrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1+icLID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17Zif1597861
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzSEzqdun1mjV0uIVhhioBCdLWTpP7aEZ+Td0LigZZ0=; b=nr7sUGrIw7GFz1Y1
	/Oud1k99b5OOkTXmmK0diZ64lBva7YXagiYSiOhr0eo4k/6gCWkz2mAYgspQRcAY
	N9XoZF1/lDsLX37FOlpDtQeCy+jo3sQ8I5l4bWs+/8Z3/Bwptt/p86YuKDJdCeV5
	Hy355MHAXAlbJgByxdAI2IfpLI6+SloiQJ6oEJydZ7dIwyetgrxMBRZbGaMsGjLe
	/XHL4Vq+raYj2+boDz+F7PcYlToI+q2DxVEA/xgdpjqbbXY5rkO9KUuz7CN2azh4
	MJ6/Wkw4raZfzBZmNGWTstIQfy9MCboN56tIdPbu7TCsB816NMTMJQcPjpvjBHBd
	inN4qQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h645-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:31:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed79dd4a47so122724011cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766568708; x=1767173508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EzSEzqdun1mjV0uIVhhioBCdLWTpP7aEZ+Td0LigZZ0=;
        b=V1+icLIDCcc7Pm88zLeEh8mrvZi/oBKRIL5Rjt+dtou6L9f4OUcH7+x+06JOc6or+W
         y4vB8L1R8PqkF/rBe8H3SKcTiLcfxSCKLHYvZLloyGYRw/9p9RFC1vgEGs9vTwdnNWpW
         pTsoL4BommtEEYOPa7Q/BvYfCCcmvYMvnzPjNNQAESVC1ES1X4kxKOL+tVdUGBpZp40n
         klw5VIZbphlZdK79+7e0hX/+RziYHyRhNMgTwRwY01naz3BUsoqqG+BHiqOhhBZrjOhk
         GrmE2VS9CiC76Fhx6/BtETU2fYmK0E/F+yJSUWOaKELi9QKJLWXRFglS3Mr/tkjKtDgt
         L/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766568708; x=1767173508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzSEzqdun1mjV0uIVhhioBCdLWTpP7aEZ+Td0LigZZ0=;
        b=ZPFemMpqkqUdGhKfkkwbT2p5RyTd/lhetLgcUdOTlqDXEv+Iszvm3wFZ58SJ+zcCXF
         in4tKsdmT4cJZ7CWYT/KcNlv78SldJxXNr5wi/R+ru1fpjvfQpbaK3KHRFtRkwqRhO8D
         eY+Su5+npVjwwedwrhXrx8taEY0x7lcLoyBZ9eOVdTdOVPUiiLPhrGlwLD8jKU7W4sH2
         aJIOAfEGaE9eQWw9ybtlu+pjeeobqQwsU6nYyonoCp/iz2DNp+oGXQXKH+lpowzyPJUD
         Otx2ypd4/IhZyLNMyF9v4ftetUOqDdqWvGsNxPNf2b2iCAEbPbbXujfQjRiJLF3oMYOA
         dNhA==
X-Forwarded-Encrypted: i=1; AJvYcCX8qaxNOAEA6bJXqo+UUTXcn9YpGWRo3maBSMq7363BjQeyIQXFmhjVoKyqOHWIwtYhq2L6EyyQDzm6GpKX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1GIcaPouDRjXnmsN1xipYLWRSC4qPcRo6RE1R9QueSEA64F/y
	ePftcEPeajX1b9t5iQKH3mHBr0x9W6qDYB+s/LNM9bpELKX5mUXs0lbV2J9xTDfTxBT2qLCjqkU
	KI5IHvprFLXapFgOArGSNMRo/2ZScKWV1WLW6w+/QA9Y/qIb5ItRbG11lnXAIIR0T2QdR
X-Gm-Gg: AY/fxX5NueBUyokFwGKcX9okGmg0MFYni0e3Xuj/SY8lh6tVWm36ZI0v8RXCkLfTPtp
	paYU0rVSO/na6qtqOdx4K627Xk8Sh7Laz+ZCE9NgP2Lj2KTLy3weVLhhK9Z6f5txxDlVB1mkjRI
	aXhM6riahrsuxTRqEhvzlFOylSEx6Va4ZjvvqtrikFefCOZwdXlt3P9KcctA+wZmerhGV7eBvNl
	1fwFCFfCzFb49wKrkUPZZGBVqyOU5MMdD8H+OgsYkRsj6vLic0HdXjt+v5Tm0vba1jOzF3/L8Zh
	YVzY6qHAbdOoEa+ewA/bS23XErxtAMZ5kgnxOP2Kjai+sUl2sFZoC99HWOuex/YNH+k2/o6m1oG
	hAny+WsYRxNRLZQONy5r7UUtvpDJeS521WJf0AF427DIK0TnEi/0gqDJ3f1Zhx7PPYgUbNxzLcD
	sOJ4aAv0fimWhE3C5CWAE6RcE=
X-Received: by 2002:a05:622a:110e:b0:4ed:66bd:95ea with SMTP id d75a77b69052e-4f4abcf525emr298466091cf.29.1766568707973;
        Wed, 24 Dec 2025 01:31:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2qkqY+hdKlKic6DxHWu0OFloypYkzoaOPFgzqGWlzDkY1vj/gUKwiZFPPsffiMMKo84MJ8w==
X-Received: by 2002:a05:622a:110e:b0:4ed:66bd:95ea with SMTP id d75a77b69052e-4f4abcf525emr298465841cf.29.1766568707546;
        Wed, 24 Dec 2025 01:31:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5f12sm4777418e87.3.2025.12.24.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:31:46 -0800 (PST)
Date: Wed, 24 Dec 2025 11:31:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 3/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
Message-ID: <cdmhdgwzrp2bmuqwjjn66gnvi3zu4p5fnbdkuzvrknu37asaq4@waf3az3hkk4o>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-4-gaurav.kohli@oss.qualcomm.com>
 <fu7rhvpo7t2fjx4l7nvzd2cec7loyjeqyvwgochghyyax4nqof@6bat54r3qgov>
 <7e946103-06cc-4e44-be00-fd0ab9a8f55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e946103-06cc-4e44-be00-fd0ab9a8f55c@oss.qualcomm.com>
X-Proofpoint-GUID: Ka5ZP8fYKVkv5tvrpRzgNwxuoc_d9xo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MSBTYWx0ZWRfX5odKOmnomY3s
 NtsyssSMtANBFy9+wS0F5UV6N+rtdt+3Td4o9KcoAhmAwe0APOzFnh4A7PPxhLdxiNbV0irOgLL
 3BQ6Jtw+j74mA67vvdXSGA/OIxvnlR1RJ7gVBjJww6YXXJvrfxyhY1iJ5uiepHYR80IuJ96WcCk
 1yhOJytu84wuBEasZzM3TcNBV55hTNFUEgZ08TWkxMCzWC0DNERRnHYJEEY7sISWXNfIm6CdlA9
 Rj8r93pqNLHJwU5Npee/vBWMRsPrDvQdSy75erqzWLqpThO2SYk+8aLnrIOSy6BngHQ5X/bxekR
 +uHeSfVKX1hvOZyL5Mc07xmlJiXPyw8tt40VAYW4ROSdCsNalnPkXZV1LNIiXK1CDt2K2EfIhYu
 OXXHIe8jK5cvuB4SEBY884BoAwgAOpm+oS6MrNE0aeFHlfygYy8iARnIX1zbisbfsrdSdxagHaH
 UF8K3PbBnSdHAIgNolQ==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bb305 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5zzmveTRI80yMoMAEPwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ka5ZP8fYKVkv5tvrpRzgNwxuoc_d9xo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240081

On Wed, Dec 24, 2025 at 01:54:04PM +0530, Gaurav Kohli wrote:
> 
> On 12/24/2025 1:00 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 23, 2025 at 06:02:22PM +0530, Gaurav Kohli wrote:
> > > The cooling subnode of a remoteproc represents a client of the Thermal
> > > Mitigation Device QMI service running on it. Each subnode of the cooling
> > > node represents a single control exposed by the service.
> > > 
> > > Add maintainer name also and update this binding for cdsp substem.
> > > 
> > > Co-developed-by: Casey Connolly <casey.connolly@linaro.org>
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> > > ---
> > >   .../bindings/remoteproc/qcom,pas-common.yaml  |  6 ++
> > >   .../bindings/thermal/qcom,qmi-cooling.yaml    | 99 +++++++++++++++++++
> > >   2 files changed, 105 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
> > > 
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - qcom,qmi-cooling-modem
> > > +      - qcom,qmi-cooling-cdsp
> > > +
> > > +  vdd:
> > > +    $ref: "#/definitions/tmd"
> > > +    description:
> > > +      Modem processor temperature TMD
> > > +    properties:
> > > +      label:
> > > +        const: modem
> > Why it being called vdd?
> > 
> > Why do you define modem-specific node here, while the CDSP-specific is
> > defined under the if block?
> 
> will remove modem in next post,  earlier we were developing for all
> subsystem.
> right now wanted to post for cdsp subsystem first, will fix in next post.

Why? If there is no significant difference, merge support for all DSPs.
It would allow us to better understand the requirements for all DSP
kinds.


-- 
With best wishes
Dmitry

