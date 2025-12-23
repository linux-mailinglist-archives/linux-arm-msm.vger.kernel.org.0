Return-Path: <linux-arm-msm+bounces-86412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2661CDA540
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBBBE301E144
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F4E3043BE;
	Tue, 23 Dec 2025 19:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="btUdi/Sg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHfq+4db"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C002EC0A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517421; cv=none; b=nk3a/TICEujl2CxPfJPlaWB3cLCtlGrgGffLPaedlg9RktAJGfhklvMAwexOnsC5kh3SwBYR2vJubaWXJ4pSxaGQEwLVqEDVX5BCN/8F4b3B3vJckWUBCVbt73kOBFaZ1/48uTKvVMbz1He8NHdMCXAr5LDB2gIkSQqpfsbyIIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517421; c=relaxed/simple;
	bh=yg6uIPUQCarF9bSzkO9l7dLLEnHE/H/nSinAUrp1uQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwW5kzsS8jIyXf8PjCe1YuDAsx/frxZAq9Iq2qmuRwOXMtlrQjHJTPjX8fKZFUfLMajwl0FE95F4HL5X1pbQCBtxfJbQOmVE2OYfrwecxMXjdEQP4f/HqCW7jwdW2YUkzlZxIhQ8CbyGCDvZIYNSdjddFQU0zFqxOxWsRrTLc0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btUdi/Sg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHfq+4db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFUgqJ4044111
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xTixOBb4voaBZsTeY+qluGug
	zBnI3Ov8LTQ+nfSvVp0=; b=btUdi/Sg77AlM0Z/cCXN8LqTLkZ0voMuftQIV5nY
	TrHxc0+/zHlFDuLN84XxmXTOySY5q0PdcUotO2yb7SZbQXin5kXZwts3Mefirmgb
	Xz/DFVw8SUQhyIiunSCeqw5YzLGOGuV0IZgp/tEyL+BTZpjFLLsj+B//c47/EC4v
	90CTKskEpYU2uw95Z2Zc2vJfkFdNgjmV499LcvB/InplxKBspxhOFdGiSDOHR430
	JjvRSGMO1dfOLL4V33nBYkAiuHyNCTeifXlKwdknSk26h9J/3oJuFgmNaRqBKpQf
	n7KdFqUkLJzrCnR/Dl7HcJ8X6T/ECC4pi2fRKtRxT8661Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhbspe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:16:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8086so124201726d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766517418; x=1767122218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xTixOBb4voaBZsTeY+qluGugzBnI3Ov8LTQ+nfSvVp0=;
        b=iHfq+4dbFmN+ahlR5rokMd4RWT6F1aKCj5iB23JHuBrnti0/c7pcsPhAR9kSF578Dt
         Cc7m52D9LzJJOUxJnr1VDbahLFPrTuvMmsyahxCHTin3TLMkUQ6xvhZACckwCdmbK606
         TzzYNrYzvSfVKjG1n6GrIBfOUoauAYx3jowKJ6oFDL1MhvsxaCeKQ94vjx033LhRCSZI
         +wSS+g4ZBVu8isHnqncC02XvukMR2W55bDlYxbO7pc9K1I73KkBvCJ6AIDUFJa+jflcc
         ixMklUPLnSkSAmrTqWpeFtka/hNJzBmcHA8waQobFKg+QBWxuphxIlJhb4v833T+U7uJ
         lKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517418; x=1767122218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTixOBb4voaBZsTeY+qluGugzBnI3Ov8LTQ+nfSvVp0=;
        b=wJAG79nKFqhrBt3y15dLVC6TjnYz8JL3mtwIZ4WA5D64IyO+QJQv5nH43qBXxMj+1v
         ND8aWrGY4SvQGJt4tKulvzuL69dNfdD1ieoe9WgispdCvyjA1PtylhIODOErSWzijsne
         EWjzs93PuzHlPE2Ak+LgWK5+5tgs+Lm+bOz71IPQzg1uNvLfsZ0A0se8JExm7THECHHs
         L1ywbtsrYmIast9YfFAXExTEI4bLwzWprSYs7BQR4RzfGVBbNskeX56YEcDgCuikSeQr
         3Qblnc3blfDjhcr6ml/nkTZ7WQM6V24Dr2f9sXqRG3N9uE0wtX+Bs88MNHUc0igyU8qx
         t/sg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Q+iEtwFtcjvay3ND8cpNxDT4nwLa74MHXBM4+sdccuqoAEBZetdn7Rx/aTAG0tOdyEDLGSzizcwFsUcS@vger.kernel.org
X-Gm-Message-State: AOJu0YwiOlwLMesh7DDHGfVb6NXztvgePVQ9PZ+Z5NVlIuOo7IbXMs4Y
	Y3sLVtvDDBTnyfj1NxAF93FO0qxMuIw5M7A8e819nJ3jfhIVYl2nO3XHgzSLjlodukisgUqPgr0
	PZenXaNcqejYVvGDWDSqeAG/M1dGq1RFw7Oo3XKIKvalfEEVVQZRfsn8Q7/pqVZMGkU2K
X-Gm-Gg: AY/fxX5rLJdibjZYtRp3POIDvhGDiHQuwhVdBA0bmp0CJ/LjlX/qSIsXQfpdYzHTx/b
	0ISZWQmxBVyvy7n4/U+6jIsiHg5CslACDuA0n2R6B25Oz5wpPCTnzqb0RSw2q0QUvn4vd6sP2K1
	xI/3d5PdJgQg1ElBQ7zTbIEHo+KY2p6G/bVuankekTt2m43AWY/iqbMpozd4S1fMBQmIEcsJA0z
	brXrUKiduxwLxBb6vJ5ReBcHFWsIsZMgN/l+mws7i3F2GXywna7etIqugy+6RuDQCOANAiCUufe
	luu7bmaKHjt6R05OH6RbZYLY5Gx9EEk/+d7jbmDZQxQvO4J6JvnemcTOiz7LLCGX/ygUcA9DIMg
	e38DdFwB2opiNFvIJQr/Ba6qOn65nCEC5I34CFyYvfXEiAwG95S/Bfmz1tmJFu5jVbC5AvT0ZYb
	HNGxZU4inI7VM+Sg9xeYfLXis=
X-Received: by 2002:ad4:5ba8:0:b0:880:224e:aab1 with SMTP id 6a1803df08f44-88d84528a09mr244147796d6.66.1766517418500;
        Tue, 23 Dec 2025 11:16:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvQmzeC4BQeSyXzH5XF4TCOT/b5LKKvDBffg3bYRMwHzp1bwr9H95CVDHYVVaX7m6jEalwJw==
X-Received: by 2002:ad4:5ba8:0:b0:880:224e:aab1 with SMTP id 6a1803df08f44-88d84528a09mr244147286d6.66.1766517417907;
        Tue, 23 Dec 2025 11:16:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262ccfasm36207351fa.26.2025.12.23.11.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:16:57 -0800 (PST)
Date: Tue, 23 Dec 2025 21:16:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
Message-ID: <niverh5ydbah6axshbtop56wjsoluen64anojp3nvizcn4bthr@h4yickq6gtea>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
 <20251219173108.2119296-2-krishna.kurapati@oss.qualcomm.com>
 <aUqjG4pVXWN3H88N@vaman>
 <bb775051-8635-4e2d-a1f9-46d6f0e6bc15@kernel.org>
 <aUq51TxXwiJE2DWb@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUq51TxXwiJE2DWb@vaman>
X-Proofpoint-ORIG-GUID: 0kjC6-tZLx4y6FPs9bPkseYLT7UIpHgi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2MSBTYWx0ZWRfX37Jm4+DdzkBF
 /OmuaIjreFOLx7o9DT6dWvlF3ng54toWpvVeMoBqvk+6qQvWs680UBVUCNUA4EkoSSkfDj683VA
 DLWfz41F/hug2n5Gz0n/6hA0iKbbm/nEvXO/lZA/JdgBzN8zmwJLO/bi4zy7KxM0idbngFEXAPt
 AoeDIxEtQva7JjWp+zdtgWeslU151KwrT0hQPGeC9KLeajYwNmVhownfc+LFIxD1IKvbfXFM2NL
 m9J4Bm0l+aZ8+bEGRs0NnXqZS9S7gQ3vFe1FsnaI+RTFzdTHFzlgHrTJKS6+eJu+ScdrVvNa1cT
 HLAOEsJ99SJhbBezszxti7jbEEeYt2gj0QFzxETsGkDWBiA+t7FLwNAQ5X6oP0T0xbmiljRRW/m
 +Zu7Q4FCDFdcC8bn0V1N2AwHqj22tcxH5asWPAHByjkOxmOSF3q6ntRic0AAdDV8zAkLFERtdZi
 2dbpPjZgFf9ZlPjTcnw==
X-Proofpoint-GUID: 0kjC6-tZLx4y6FPs9bPkseYLT7UIpHgi
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694aeaab cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=htvIOx8lbTYegf9zheoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230161

On Tue, Dec 23, 2025 at 09:18:37PM +0530, Vinod Koul wrote:
> On 23-12-25, 15:16, Krzysztof Kozlowski wrote:
> > On 23/12/2025 15:11, Vinod Koul wrote:
> > > On 19-12-25, 23:01, Krishna Kurapati wrote:
> > >> Add squelch detect parameter update for synopsys eusb2 repeater. The
> > >> values (indicated in basis-points) depict a percentage change with
> > >> respect to the nominal value.
> > >>
> > >> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > >> ---
> > >>  .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
> > >>  1 file changed, 8 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > >> index 5bf0d6c9c025..f2afcf0e986a 100644
> > >> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > >> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > >> @@ -59,6 +59,14 @@ properties:
> > >>      minimum: 0
> > >>      maximum: 7
> > >>  
> > >> +  qcom,squelch-detector-bp:
> > >> +    description:
> > >> +      This adjusts the voltage level for the threshold used to detect valid
> > >> +      high-speed data.
> > >> +    minimum: -6000
> > > 
> > > 6000Volts, mV, can you please document the units?
> > 
> > 
> > Code is correct, the '-bp' is the unit here. Unless the suffix was
> > chosen incorrectly?
> 
> I was hoping it will be commented in the description here.
> For my reference, what is bp and where is it documented ?

Base points, 0.01%

-- 
With best wishes
Dmitry

