Return-Path: <linux-arm-msm+bounces-75940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF4BB7FCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 21:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9FFE19C6B76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 19:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E732226863;
	Fri,  3 Oct 2025 19:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4xBIHQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE23221269
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 19:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759520215; cv=none; b=Iz4HmXbDaLIeouvcLszOkjLmsTX+oXNSsE3mBYYVzfP8KNTZuO7T02IRyg+zeNhQBWmtbC9pa4jS3iey/mp3y5EwMH1KcY7u0sqdbgM9pTvu/2IPGN6/su6SZFEr5uQ8YHFA8Q6XTmFKTIUQsyPZOR1Tb/B+wxEW3p0+mNn6Bic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759520215; c=relaxed/simple;
	bh=2xkx+Gqn++j+/JEZH+TJfIUQdtEldaU/S5mCCrdtJU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/UPtw5aLpRIoft1rRoOQDUGmNFmMafUhtakH2WgbfCW7uDrSYFsV01OF797rT8WKdN6w98Jwrik6mudquqLLe6yPZD7A0GKJBDjD+2TYBsvS8gYYW0aOLrlgO830fVOUfORRoSiu0DvH67WsqgAm3MRacD0p8JZxfLQ3yt8Pqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4xBIHQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593A9MK9024148
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 19:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hW5BPFSrgags4e9rk980QW7r
	yzTUgv64kGyaZ19aEoM=; b=F4xBIHQOo3P4jhJ66VWyHrnk7jnCiyGDv9Uy3Ne6
	XK/f8CFGbS4iwbBZnfnTo6JXq/Q4ukfsGcNBGG94TjsRrhJlr/XiJoDGS5brlf+j
	cN3Ff6Dlxnbmay8rrJW4JJ4YiZdp4p0kZarQEfHeU9tFEmTYYRtJo9MLw8SO1SvF
	Zgf/5NXE1us+wPNn+qfIeF4OeEPuUxFZJUN2Pe8z/wkXIvQ4hqta2NpNgVSkLDHK
	LfxL8u5V6bbF0srxCb49ti91RNjtaFMghLMhEK7hOd5fLlUGuktdqjraNtruRQRK
	tTA7PC42FIeT6jfXNfhtbkMq1dAQkoPAfGro2qOxYUcZSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a6bu75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 19:36:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e57359997aso26864641cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 12:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759520212; x=1760125012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW5BPFSrgags4e9rk980QW7ryzTUgv64kGyaZ19aEoM=;
        b=g1ssbXjNQHcm1JlkNLqcDCu2Ny3tlfcHo0u7XY26pJAfBUlTJQfaBjjSZBQVR5s0Qz
         hQLl9pw4KH7lGaFtZA2F/5PiZkLGDDCm18qpEvwCNSQNBeTz8x3gPBnkxG2KRGI5Jwdl
         lFpy3SjKIrGTc2/nM5Jzy3+VWQpgRJ5muJap+2M5TYJTQNwNZvuu9ENVOUMZ9O6I1dVY
         Hw57t4KBUADAhjlxKkTiv5XUwdvn6AYnMKeugxdBcBO/xnHdu7POMdVcAGUA3mBsO7dV
         J5WyzAGDFzXtW1rJOiuShWLaZ3/CbUnhgGctGYTRZHLdVnKPGnBwpmrxJ4hIgblmbmLs
         QD/g==
X-Forwarded-Encrypted: i=1; AJvYcCVCtIYtIpC0on7ofy7oBql3+l5Cid0Ntho8cfphsJ5xzy5sFqAdUaICXzzBynEofpTYLFwo16rQV3sdwUAV@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPz1wdoklyVHwEh0T+Eaj8QbTjl2FwZojVW7EELgtglJKDeGe
	Kohm1rWTQaBS+P41+6+9Qml4ULVuswPTteylNIwdt45Sxk22YAgeeF6HRGjI80rZLmINJwFBWkI
	1QKsQNRywwr2BN4nDELoRWhyrKL1Z9Q1DBNbtv1O4CYnYLrmnhy6wgU2uVSXGklTv3iqQ
X-Gm-Gg: ASbGncvqJeY+BRUV42Wi7Ar2rvLi8spN2GU8BxZFPAaauIm2crAqqVGJA6wo86zHnRA
	xz801xWz7JSQZb4oaQaJ+8WxQosOTK6/At04so1KOkoptj529gbIf1KoFz/1nmrQG+cICNy5zXv
	pN/S7cwHhcEGvhv7B9TOaLomkMmJL/rky/gOx6NY2zYHi3cmgqlUwP3TLr6eSUaWnlDqUzGSM0T
	4gk8VzfHQZRUh0diR1gzisJWHeytTbs3nyJBYRxMS9EZsaljJasJKFicSn98fwRpKEhQhbfhig0
	0dkg3Db6z2bmdWrP2AKN9aSuwxquZwVSqvTgvsHHoVU2aL0hghyrVS37EeM/EE3DTD6v7aYI1Ha
	NkWQulN7TPkvCvn+8d7/sWb7J5thDf/CT8na8FZQRvqC4D3e94KRaRP6OFw==
X-Received: by 2002:a05:622a:411b:b0:4b7:9c98:aed6 with SMTP id d75a77b69052e-4e576ada47bmr63472551cf.41.1759520211834;
        Fri, 03 Oct 2025 12:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHzYqAtz79UldeuWXluxUDIsWKIiRIS16dQs1C6L6K3uum8zW0I06HKp+YKgRVXueXdfeNRQ==
X-Received: by 2002:a05:622a:411b:b0:4b7:9c98:aed6 with SMTP id d75a77b69052e-4e576ada47bmr63470831cf.41.1759520209476;
        Fri, 03 Oct 2025 12:36:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113b437sm2110367e87.43.2025.10.03.12.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:36:48 -0700 (PDT)
Date: Fri, 3 Oct 2025 22:36:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
Message-ID: <budxy3xza3ieykmrp2anpiz3gktq6mc3pqohkf6ew23jun3po3@jv2em5mmhjts>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
 <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
 <ad721948b83a54eaa34f367e12564fe6acc222a1@postmarketos.org>
 <gfbvgsen75w5h7afyo454pvdfslkeprqyuycuok6syinbza7vx@crapzdo33re7>
 <b9285a2e81ca992b9fc560c78ae03921000e388e@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9285a2e81ca992b9fc560c78ae03921000e388e@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68e025d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=RrlILGEu0WOW5ijQb6sA:9 a=lqcHg5cX4UMA:10
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: eRLC8K9sWRsu1g3HQb5TIyCP5GaVQS94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX6VBOSTNlHlis
 x+qehDKEJd3jIqEInQaEM4XaKXIU0BX7AoeuFf4ebaAt32N4SOhPGH/bzY1iM9YJYeQ88toricu
 15C4q5bridjcY4DIp8uqKgB6Fe+paS8gOsy0I7nOXfj/pzT6OkLfkhccwf/xpAz8Ja62EQ4DNsZ
 SAgdN6I/Pe9WYqZd5m3vlduj/EezZZXyUG2eoLZ8GjAdg8QySeVknzCZpYwnq413fUnGjzqU6Cx
 11bDPrjj3FaMbqVAAv5u9svoosLwPSHPzHSlM0G7+EepHNCXLezasUYw6y14FDlBsAdK+E3yozo
 RO/32cFmbn/NNDYYvglvOzaBgCorLCZCbQgK63dEmJZs/9IpnxzrZnZItneOhsgnYEY384QMVQ1
 4niFrr7Ezc1xzRc3oEHGaO1RPRq1XA==
X-Proofpoint-ORIG-GUID: eRLC8K9sWRsu1g3HQb5TIyCP5GaVQS94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Fri, Oct 03, 2025 at 06:52:03PM +0000, Paul Sajna wrote:
> October 3, 2025 at 5:13 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> 
> > Regarding the MDSS. Is it being solved by adding reset to the MDSS node?
> > Or are there any other issues?
> 
> Yes I'm referring to the reset / pmdomain issue. Joel Selvaraj is looking into it in the sdm845 tree. He said he tried doing what other SOCs did and it just got stuck in a reboot loop. More investigation required. Currently he's reverted the pmdomain commits in our tree.

Which pmdomain commits?

-- 
With best wishes
Dmitry

