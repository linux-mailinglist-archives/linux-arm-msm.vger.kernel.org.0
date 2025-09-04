Return-Path: <linux-arm-msm+bounces-72132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD5FB44684
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 21:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE66CA4245C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 19:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F210273D60;
	Thu,  4 Sep 2025 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlg3M5QX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EBF2701C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 19:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014641; cv=none; b=Jr3pY7LTUJSe8vfyC1lMKz7uuCItPxjxiDxraeRob8V+mIxQISZPOlXl/V2fpJnrOMM7VWTpAIfAFH0FBb9k7O8+EIlZpTd2KuZxR1MEr6I7Y69YTSOogYXxllXIysKZzQ4oAGa9pUJGmtJz0SoZJyvBuGALEgyqbe52mw8VgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014641; c=relaxed/simple;
	bh=1zQV/s94K5+h1YGZQMxFS9OiOGoj2u4JLZMij034Jf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyzR8jJSvxTFZu7CIAlZlR/ZaeKlqxNF1GBoCDWz97WZ5gc4x/a6rnx8IEMy8ePrwBLxmlLCJMph3jcIVL0/eBSbeoyZM6Nps+vKa6XrPulAe9WH9q4YhluoCmpJ7TRf8jLTvw30lada/Vb7gWuIMyE6C73z/xhxVzfW1rnpknw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlg3M5QX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584JAUWl012111
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 19:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=McF2iXJTB0tw0p4n9n5WkRjm
	CGCLSHcRJu0PgH1a76w=; b=jlg3M5QXeLWp6cVDKBdqs6MOn5pkhdF00WH6DkWT
	hHmjLm8bkq10x6uamdNnRlTgwxF+viCZ3Huv5/2qTt82Fr2AiOWVDnLdSWD0U20d
	l3N2s6AQvK0U7i2ayG5jxamGjaqqKzRxxAX1V77hhS1lGpy8kB2vOm7+u2nwKdLP
	dY3nZYSxG5/aI9ghuT81Nr5pTiGdhcmFVTM3Ltiq/3Sn6K7tQLWpMN3gxhhoE7Fu
	rxt8nm/FQTVy00djexljCwo3be0iqspg+bn0c/7WhVei4VDHAT+c0UzAy6jwBKB6
	B4NkLGp/mR4Hcg+7Gg2CQZaEeYKyZejXI61LeW81UoHwKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj550g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 19:37:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24cc19f830fso21642245ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 12:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014638; x=1757619438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McF2iXJTB0tw0p4n9n5WkRjmCGCLSHcRJu0PgH1a76w=;
        b=PeXFKlAGQRMoPxi8S9tdJKy3QBJXNBJ3FfFQeXWJGPrIRtWcGvpHLtNj+xgIp3/P7r
         5MUju6s8HWfpESOcrOdG1jwwbSj7XKLEeVNAOQ1uFGL6qpvFqe7OwfhXyQ7T48vX40zt
         6mwlknTf1urp1D4j/E3AI5i0SV/tGOwsxWoBqsupuP+nLLIFSw0+aI1WqPnV9s+lNOdw
         XppUvCmdHAZBgFcUa4B0cwAe7zuZBfwykLmUzsv4xX4Ph5JDbmWZRx6rjdQ+Bln9nG5/
         BJhKwslr6pndO4GUQhJsjeQKC5wRA9ElFu8pN3nyFZLf87Rr4z5t4PLYiIQ8lTlwk0Cg
         v0GA==
X-Forwarded-Encrypted: i=1; AJvYcCXB7MLGcOlYM/ggri2I8UDhR2cGqXUrOkNRhQlOIuVKokzsSK/wVorOGYaPRrXD0MxDfNDrh+fVon4nwrCr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn1/lomtBUifE1+kudmC6ZMv5Mf9WiD1IE/CMvL81C6v3rohE4
	TD6q4VSSpVlC367JPqj9NiXpIKtguzBRb/tGA5oZigqeYMZrxw62dWqrky0/9H+RUomCxuJ+UeH
	TePDnejQ6AzpOjnw3QQDBsULhH/iOqIAQCuFivE4JJeIzuTY66Xi1n5+GuaOSARIn223Y
X-Gm-Gg: ASbGncsl8qKE1LD8XY4KMwUauL1A+LSKklKTFnktZe3rcFSVzchLww83L4umn5G4THo
	1R7zcpvwk5p9z1572nqU54TSzUxI+HTf12FFyQE7Tyw8HhMreyvTS35SwCPz937D76oyBFA+0/e
	WIhKxvNEQKBQU1EJcNJgxzAXQG5sTgNZ/OyW/wEisu8pNGOUFSUYRHQQEK5R787V8GsMIZ7qvwX
	6x1OZ4Uij0sA62emS7hADAukg2pMMAbFrTIOG2j6yHbEv7H/bXnzAaZJXW0Gme+ysxK0/pxbOYy
	EVr56WGS71BGawss4j7WH2z2UBem9X1eoE9YDd34sQUpE3CC4P6375nu2VHz7vxUrj6x
X-Received: by 2002:a17:903:ac3:b0:24c:a269:b6d7 with SMTP id d9443c01a7336-24ce9b57ba6mr14192385ad.50.1757014637694;
        Thu, 04 Sep 2025 12:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8wfQGHYpfVwabKJx2d0rjdTjkyrNxzu2OZBEviz2cswh6mp15XKTFFB6XMS1SDaXgiS2CFg==
X-Received: by 2002:a17:903:ac3:b0:24c:a269:b6d7 with SMTP id d9443c01a7336-24ce9b57ba6mr14192115ad.50.1757014637195;
        Thu, 04 Sep 2025 12:37:17 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccd655823sm20856515ad.114.2025.09.04.12.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 12:37:16 -0700 (PDT)
Date: Fri, 5 Sep 2025 01:07:10 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 05/14] dt-bindings: eeprom: at24: Add compatible for
 Giantec GT24C256C
Message-ID: <aLnqZktduc/aT05R@hu-wasimn-hyd.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>
 <qya226icirpzue4k2nh6rwcdoalipdtvrxw6esdz4wdyzwhcur@c2bmdwnekmlv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qya226icirpzue4k2nh6rwcdoalipdtvrxw6esdz4wdyzwhcur@c2bmdwnekmlv>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfXyj9tEW/LTceb
 ESfIgCfJHK/TT7QW3qUO1GR/FMcUeAqSqPAWrwiGO7JOV5kuqurYV3ua6cx83mYSn21M/Np08DE
 cMYX4ZE/Bu9TrNhvgYNc1ww/Bc72wg3Si/dwtcHENifgRIp2Fc85jRgIU9M0rpdv/9Cvw5HIbPQ
 4LqIB5QlxpxKXbPaf8nkha/4+JTYvz4hyAQj5UQ3nn7v0X1o1rZGQHZxB/tLGTs31U6smW+A6mt
 9X2KUwQqtrvBHAVSMiEO4792kPFf+iweRkq9FoJKvw2qf2ZQzyO489JrQUGook15j5rSLWdM5Lg
 ZvlNj4B8tzDZB/MO7GYbIlfOz05yKVz28h6dWIs1XUoaJ1lD+GR/kjLAcsk84SsldbZGWMlnTgv
 z6MVrAZv
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b9ea6e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IAxE5SYkeMM4qmkgMe8A:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: bWuOkWp-mF6dd4T5DD9R4YGnoOxApLoX
X-Proofpoint-ORIG-GUID: bWuOkWp-mF6dd4T5DD9R4YGnoOxApLoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On Thu, Sep 04, 2025 at 07:43:27PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 04, 2025 at 10:09:01PM +0530, Wasim Nazir wrote:
> > Add the compatible for 256Kb EEPROM from Giantec.
> 
> Why? Don't describe the change, describe the reason for the change.
> 

Let me know if this properly describe the reason:

---
dt-bindings: eeprom: at24: Add compatible for Giantec GT24C256C

The gt24c256c is another 24c256 compatible EEPROM, and does not
follow the generic name matching, so add a separate compatible for it.
This ensures accurate device-tree representation and enables proper
kernel support for systems using this part.
---

> > 
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > index 0ac68646c077..50af7ccf6e21 100644
> > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > @@ -143,6 +143,7 @@ properties:
> >            - const: atmel,24c128
> >        - items:
> >            - enum:
> > +              - giantec,gt24c256c
> >                - puya,p24c256c
> >            - const: atmel,24c256
> >        - items:
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
Regards,
Wasim

