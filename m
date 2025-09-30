Return-Path: <linux-arm-msm+bounces-75618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A03BAE676
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 21:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7092B1C3B31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 19:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECDC2857C7;
	Tue, 30 Sep 2025 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJ3EwsB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2712848A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259433; cv=none; b=ZpEfEqdKI6AEAh2AhVYuCvypCug/ZMLcMSNMrPLJSr6buqZ6D1VtPYA6hOyE/SMHdhf8V7bJdll9arEpoxxfBj+wvu1ocZU5hk5x2Do0OKK0Ju5jnqy8F7+nj1OBeTleShU3rUkgua6SLlHqUnTMTkKMmkc6jPs/8jHbda9OXNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259433; c=relaxed/simple;
	bh=pa6R9xQgA+IOf+9S+rBtBTuRG8cHJTaaKLNtl4UpGL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZWlW+04NCIULz1Kd+YF4dxlqmITfX0jgtPYnFnh7grFTNQOt5cWC89rnwfF4DlHLdRbxUcCd2oJb5qZ/rei+i0pz57sFlewGH2Tuqk0yFFqGOHWteFNP95WlNj/Bo70cQCM5F6N66k3htt44o8uoFiGcP7QeGW/hkdxEwVQXyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJ3EwsB1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBbuIQ027381
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KaP73elixzl4ZUoebFDxy0mN
	/aCsbQY22jycZNAiNhA=; b=LJ3EwsB1TbVDW6WIi6kQpRsBewLotwSs5Y+pi60L
	fgQ/3S86ppNcIFGKzGAFuzwtw+yjTI3e6Uwvg9/DpB47+wU+GN6UFpUsgxH970Ni
	eo4Z9UgCbm1KPj81wTGeSOpQNgTzzTDX+j5OOmIgdgc5NsD/LatDIYuoPuHh+mOv
	xU1EsJywoPKlNgDSlz/5/RD9xNgT7/dR6ZSwUpJS2p/IXnHrh7f+qvPSwz8ZAy7u
	1AvsFqG1404eSe09VUcFtuEVf2D9oE1PXyyAbA9Ja/7kTvR6vepsswmh2E9m946Y
	Y/bXWc8dcFn9yWdY/OTS4FJs07XJtT8PYB4w1ZgRjYszTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851j4sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:10:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e002f413e4so38224111cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259429; x=1759864229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaP73elixzl4ZUoebFDxy0mN/aCsbQY22jycZNAiNhA=;
        b=HkyQ9JiCuH+TwgccxJAuqi+KQek5Mc7yWzN3ftmth6Kb7AHMhnt63LF3ZqBSV6SiD8
         GvHHM0Hc9/IQVdxdyGPYvokVmRYuJTgyTLSWCdrZ36ixDeL/2TJRbBz8Y/mIJEG6ixFR
         sZp2pDga4Y3a3ZmW3jeP1OE85D5HxOAzZu8qcn/tNPTARdpEpGGYc7Ean1RWnYdNA482
         LJyaz/KcIRi2+4uiuhXC2kuUot0nLi2WtTvMbpAK6CnYbDdwyf9xedwOVAAre7ur0mU/
         lzOYHWCkBe/q0T6Hl9Y+SaIPE9gERRF7szw3v6uIVX/SuYOfFm2maQQrUPYOgr6EwjH6
         BUxA==
X-Forwarded-Encrypted: i=1; AJvYcCXP+NXEOK0UkMN4Zkck0inI9uRIWEFWVNSxG80qQ262gU0I0A6Vo4amGCgSJDECAxWtDg3bR9D3yEhvEx8z@vger.kernel.org
X-Gm-Message-State: AOJu0YwmMg7btDe+EYDvrBCsDLEVU2rbV9tUX7Q16npgff+F5bnEzJU+
	D5tEy4n7aTkQSgAqSMo7TdHpeXb/kLjasRtVd4Hl4zMioIeXCZQIaGTW3kvn9BdieUkryc/TiXI
	FHDXUGnhvBbeeOuPsXBsDoniEqEzkup3vLTXqIwNR6BAKmxxoArCw9oFCJuxMBbpFuJGA
X-Gm-Gg: ASbGncvD2arKuBYsyD4vxr4/PmuVnwG4dOZaDMiUKf1ecKiYQXBOnvQkG4PgxThz21m
	fiJScN9eSa+2NcFICqwBUR32AQrLh1GUOROnS3rCcHV32bTVg18l3rCgU1pDOs2+S6qJoHrIRZo
	CvgBejrUA6ny5pMaTQKdTWYjDQ5kiX5ItkVLb0NvPSUXQGxoKNdYiszMGdisu01AWXPSW2kxstf
	rTwv80PvF+Sa84nNuFebFtmRyLNyoNs39nJxmE645lPLLDUVrkVBkc8CKzxmxS+PUWXI2YRsNXC
	SW3PPBh/wbV5hfysovTsxEWumkaNnM7DJLHQoQ3X0nd7YpJ6ZDp1NryFQhiCXhnDn+6fzAwOXBH
	GXnGBH0gycEa9+9ULAA/og2osdyO7O+YPbGrWNTWtrn7RcXuBTC6waCBBBw==
X-Received: by 2002:ac8:590b:0:b0:4e3:2347:e09d with SMTP id d75a77b69052e-4e41de72003mr9045941cf.48.1759259428792;
        Tue, 30 Sep 2025 12:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzV2iLngdinAfpYz6LMemQN0HNVnTxKUNLX9DKPaa9tp4J7rq08PEz47QNaOv/YjDZWGvTXQ==
X-Received: by 2002:ac8:590b:0:b0:4e3:2347:e09d with SMTP id d75a77b69052e-4e41de72003mr9045591cf.48.1759259428340;
        Tue, 30 Sep 2025 12:10:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58749849177sm2220124e87.103.2025.09.30.12.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:10:27 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:10:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: do not
 reference whole usb-switch.yaml
Message-ID: <nwtt76n4t7tlf26ex47wrot7g7nldtmavbzgwmluls3egamjsi@mkomopb6fjh6>
References: <20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org>
 <20250905175533.GA1000951-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905175533.GA1000951-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dc2b26 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=SzPxuEgdeXQIFyuOAFQA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX/i6zDiou5+Kq
 zlLnh5a1K2jtz+xflmWNxLFm43oiqNch93U9Pu8ifh3NiOH76nWJwtEYGPDP+/+vJt9kjQD4nf0
 xuxIK3rf6FXyz1R3btaQ/XtKkrZNNCSo9dzYhTzo28Zn/kZoLTPyBmOc4bygWaxZ3nXctqA9XzW
 NtGwBiPUZ0nLV15zu/cIaaOUaD+iVXbDRiT3KFHk8Bg6jep5w5xqEQWmHDTaIsJ6rMDtqB15CMb
 fU22km9BLZQgJHSUb+jx929sHqY+6khfapfGoo2neOcUf90CWJtme+ErSUhHUSByFKBB0JeT2uN
 huVniEuUaZJnm3CTmrTN58uNWgYMKrniTUxqva1KED5DvBf8NNrQdyscYD1uLh7zQ/RTwQwc81D
 HL/wCfTyob6y5MZJPIUvRzCTBJvXDQ==
X-Proofpoint-ORIG-GUID: a293-D_gG0GhPpkJLWofVNO9OOCR53tx
X-Proofpoint-GUID: a293-D_gG0GhPpkJLWofVNO9OOCR53tx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Fri, Sep 05, 2025 at 12:55:33PM -0500, Rob Herring wrote:
> On Tue, Sep 02, 2025 at 06:10:05PM +0200, Neil Armstrong wrote:
> > Both bindings describe a different layout of the ports properties,
> > leading to errors when validating DT using this PHY bindings as
> > reported by Rob Herring.
> > 
> > Reported-by: Rob Herring <robh@kernel.org>
> > Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
> > Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > index c8bc512df08b5694c8599f475de78679a4438449..5005514d7c3a1e4a8893883497fd204bc04e12be 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > @@ -73,8 +73,11 @@ properties:
> >      description:
> >        See include/dt-bindings/phy/phy-qcom-qmp.h
> >  
> > -  mode-switch: true
> > -  orientation-switch: true
> > +  mode-switch:
> > +    $ref: /schemas/usb/usb-switch.yaml#properties/mode-switch
> > +
> > +  orientation-switch:
> > +    $ref: /schemas/usb/usb-switch.yaml#properties/orientation-switch
> 
> This is a pattern we try to avoid with references at a property level. I 
> prefer you make port and ports not required in usb-switch.yaml.

But this solution is also not perfect. E.g.
Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml should
only allow the orienttion-switch property, while using
allOf:$ref:usb-switch.yaml allows all three (orientation-switch,
mode-switch, retimer-switch).

-- 
With best wishes
Dmitry

