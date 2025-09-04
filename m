Return-Path: <linux-arm-msm+bounces-72110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E7DB44380
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7A53AEB06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A91830F528;
	Thu,  4 Sep 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OodcnVPr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311CE2C3768
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004214; cv=none; b=HkYUW1voL3Ysa9fFGhh5Ntq2pSnVGe2TmkFHt3eCCPRaICToJ+HZIYIQX0Chd8yVLTUFsIjQT6szzhnjno6L9X7NJvJzkvVWpJUrrR8dgjcsaiZXE4luyZvK1ZgwFzouROqlX6Kd3AI5MII6Eop/KQdouRuDf03N7ujrhcCLHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004214; c=relaxed/simple;
	bh=w2dejdkgkOfnR6ZZTToOeg39YeTLEfhrSvr2kuE6Luk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4SLhyPBO2Ol9YsYJz8uuEPkcau2ZOn2vDOr5uPkRydWPaAH2hb0eS5nU0QpMfLYCgsLogX/7VtdSEjInUBHcP6GLH3m+2lIqjfCrd7iyxZW9V8GWJ0HPFjoTEIb11mB2i/b5FJZ0X9jShK69AB3OG5qS0kEguOab0Qp3xW4TVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OodcnVPr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7UB003768
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 16:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=194cO1GmvVxOIcn8RfAnyM1k
	UF1gEHExRQSWfZpXVr8=; b=OodcnVPrmCsLxy2Ifo65URS3b/n7rJGtjCtQrPr5
	W0/TwIJsPKYuipsemCHLWxwqDYvck4Q65+3QQ3Nu59kBnc+YuocNLB7DqX54Z7k7
	5PPbczjGmEifemYZq/NRv2bV7ySZG/bNC79Ftn13pmGDQCzolsfjT9CFjFFnmMqe
	b6Va5R3e1WqqbePZYivyGv728YorPdGIWJQOxfuTezpM0gO6ZWtdUJL6eTL527T0
	A8wC9B6xhzsxwnJDnb4cuVC+b7FeKUyz8LuKD3LK1vXkcka4grf9Mae0Doo+UtmK
	4z1dnxQfgzGfHWIBRhWArTqtx1X1rnQoEedB1BbWcpHk6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s8929-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:43:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b30d6ed3a4so25105211cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004210; x=1757609010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=194cO1GmvVxOIcn8RfAnyM1kUF1gEHExRQSWfZpXVr8=;
        b=EtXPxrMwuW058F0OXJ1yROIPfMk6D3Guj7vNzS32ktprvFBAT5Dqo8MJIZbTrhrIHh
         HWX7v4VSB4+DawK4AgLyc0q8xOzNk7NARwbjG24FB7fYtOMzhzcm6Lkeqn9AF70R/C8V
         kv4L7KWfSGff8QnFSr7ebg13SlPB16TtZQpdHWI6xlLQLu/0+6Bgk60CkDQ25t4B9ANj
         cKlw4zMOj4JJxtQW2KVW2oSwCmH31cNRBkL4wBEt6psp53SOmiw355n5B3hI6fVtxD9Y
         q+NCv03whud2AKKMvtmgkkArwM8eiZJdJDMV9aYie7rV/dgwUsoS/bh4NHgzvH89Fg52
         R9aw==
X-Forwarded-Encrypted: i=1; AJvYcCVXFGnFuyJ51B9OEmvQmDZI480gjmDs0+1iUSocJnJzGVqnJnSrIxHvQdRTkGo9pd5afty39xNhF6Qk65fj@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLs1z6v59tCcORsIlU/zctOo9ob9yxQtfcOKtPv0XRsTejsz2
	ZOYqb52/K3kCRExNFdmVhKWuTnV1X13itRwQYebhZKthDwhVALV4QKhDQIAW4JZbWm7SRUaANjR
	N/BReFn7rQvKVDvEABDUQGHvPMAuucFjimgKYWNxAOEw3i5btNeTVyHRaUwcXQadnScCV
X-Gm-Gg: ASbGnctu8xnldtrh1qvlWiHwG1jeqsT3pxpnK72b/UdSuuzGg5+K4ynPt32lPLvVdEZ
	cFqwJ4TFtrSHffaOGtA1FpVRtT5W4d+Va6Sv7AGome2invZcq1VYFdx+an1jkXuglSmeVLyyYAV
	GPG6V5Jk8ynALV5f26blUqp0ACHa+/fXF9IDQRNGY+iDu++OiZ8YEzX62IKY8Ob83nZYdIsufXq
	avtNWh6KWE5+J51i8nOjLRer0wqsGWuAxiKX6RyWwVuAzAuWFxol+kLux5RKLBuWTgRb20/tPFd
	rwkpfLyMxWaGIiVvC7u7PaGkTprNVFtlOpawg6QG1C1luhfdHVaJfMXfDR9INpS4tueAI6S0fqg
	HhezpP+3V3Q40m417hTIptJ94lvI0ZBGb6ABufmxk9+G2jR3VlAmt
X-Received: by 2002:a05:622a:1350:b0:4b5:8c8:11a3 with SMTP id d75a77b69052e-4b508c814f3mr64210931cf.50.1757004210507;
        Thu, 04 Sep 2025 09:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoXhcaDoqYlrzIzgBJXwbTTQZl4p3OH3mRMEaeJAudeMwawR3Sn0KzCcUZMEdXKJuLkxKt0g==
X-Received: by 2002:a05:622a:1350:b0:4b5:8c8:11a3 with SMTP id d75a77b69052e-4b508c814f3mr64210331cf.50.1757004209938;
        Thu, 04 Sep 2025 09:43:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5e28csm1307921e87.17.2025.09.04.09.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:43:29 -0700 (PDT)
Date: Thu, 4 Sep 2025 19:43:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
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
Message-ID: <qya226icirpzue4k2nh6rwcdoalipdtvrxw6esdz4wdyzwhcur@c2bmdwnekmlv>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX1RvqmgWso36c
 fkUgMz1mqhDhww70kBVoSLpqTEVd3B3ze9555Fnf0e2AqzqdLurLci0uHBnoKGVYjcvPhLsUGto
 W+bM867DnfAyK6pBM7dwX/gCK1+bmgTtZ3Vg2SfoW7raWeNS+VUVJushjG/Ia+kJzIwlT3BeDcD
 9Un7ix/z3BesQnMKR8hUOuKzJA/CdfszDFk31ehYWx/XQ8V3UEFE3rYmNthCS3hV9H7N7ytBXp7
 WPI+QKLvD/FWfhWYKDnCZzeaGJeHQAUzVY+ODBGiw/1iMraBewBpp2rOqjIQsyXfTUUoyb86FVi
 G5xKV/3hGxTSYf5wYqsvjMiBzCu67VkDsyAAzIW7fCITqk1d2UTQqU+jL5OlPbQf/dtC3lc+O8o
 UVlbnw0e
X-Proofpoint-GUID: xrjaGrr80gGk-SCq9JXuoRLeDYehLQqQ
X-Proofpoint-ORIG-GUID: xrjaGrr80gGk-SCq9JXuoRLeDYehLQqQ
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b9c1b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E0jHSIb16-xZ11K09xUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Thu, Sep 04, 2025 at 10:09:01PM +0530, Wasim Nazir wrote:
> Add the compatible for 256Kb EEPROM from Giantec.

Why? Don't describe the change, describe the reason for the change.

> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 0ac68646c077..50af7ccf6e21 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -143,6 +143,7 @@ properties:
>            - const: atmel,24c128
>        - items:
>            - enum:
> +              - giantec,gt24c256c
>                - puya,p24c256c
>            - const: atmel,24c256
>        - items:
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

