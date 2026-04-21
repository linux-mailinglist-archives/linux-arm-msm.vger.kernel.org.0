Return-Path: <linux-arm-msm+bounces-103956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E/rMbV852nC9QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:33:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1244243B67A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 043183035D59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 13:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8376826FD97;
	Tue, 21 Apr 2026 13:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diAQQVAP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggjCAJ/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E65D223DFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776778231; cv=none; b=XujsqzDSPauaZlRtGUkSRrH7r2aIbWT5YNtZ3j2tusBNXeqIC5W4qCTr33DBw8W6bkHsAXXuJGdcrY9WBmlAYbeB9fRsbD4waFzcWIYrDUofDmTJUoQcVt4M3UGIlxpLkA44WqqCSvf2c0SXT2+qPnm1SIvmE1qx5VFT/U9MRQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776778231; c=relaxed/simple;
	bh=3MeReQVKB6Bo6lr9R9esFaHNT1S60+0cvnst9My6N+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWvMYYY4/nTTYi26SaZ7D3HqxBWp8jJ7q3xN1roT3bzOtGAWnAyGsM7/Hyy0BDVDXagUEzVYgCc951tXxCpfKbj73AwNY37qczD/4gT4WXMQISO4/WnzAM3OEV/V76Hw9Vn+r66Hq1avfbrKtoIyAb1XAUhouIUBQLm30iUNwUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diAQQVAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggjCAJ/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LDSrBO1538414
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YIhCcv01X0hJw39QIV6zhnXw
	a3BDMNZiyBozWH7UvxY=; b=diAQQVAPQOWr6HLVeekonwTybCTA8ysbUFeCDgbR
	yfhmHOOG1x52PMnGPD5wDSxvCRFm9YhS0tlI2INK0y/PBoHVfTslaf1PZB9qMCXJ
	y8FIqJSXGaywJT2obYsCuzIZJt+s9bxnQoePVcGD4Kb5A2n6kvib5pWd2IBq6F6q
	J0fh4aRac6i0ZdbwsxHouVMBtfzspCtqRRkFgcsKgNAn/FnhkMU8tMoU7Eip250x
	tu1jdziFWRJui1oi+/nnqt8+bLKF1c5wNjQsS5q+oi88HTR450XcbqyyPEycUTF9
	LV+DwdhfeASo3uqw88YerBFHzx2/3Yq2gG8Ij9W/pDpH2Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hahcj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:30:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so5691704eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776778229; x=1777383029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIhCcv01X0hJw39QIV6zhnXwa3BDMNZiyBozWH7UvxY=;
        b=ggjCAJ/6E88w1+Ke7ve/JHmTVLLUv86j74VzGmxUZlBvFl5XJAj0QN5PwuEJnYqlJQ
         yMNiQQc4v/8SYz3XLVeiVzwjqbDBTB6PvuI3cXsem/GinBLpDRmM2W8VhIKO1bo6ygW6
         MWI2ekumfKUXMMeNXKpJhhNunnkjj+BykO8z5yY2GuztXlqy/g8cogXmaG+y6YNp6ydp
         0bYwhOTBeJh6HzFKah8pTZS1KWgiUdPR8pbLmQrcfUkJzXfavxXNcYcfwSvTG6qNhARb
         tJlMnq54wSK4MbsRNl+D9y2K8+FRuYDy4l2PkReT+24OW7dBNNAZWxNKooc32Bvh2Xj3
         FHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776778229; x=1777383029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIhCcv01X0hJw39QIV6zhnXwa3BDMNZiyBozWH7UvxY=;
        b=A+M56uI+BRYvg+UGayW+hO7IwLBnM/SP4lCIWNEELVWe9vjH1svVM7TmJw8H2jr0tP
         5HY3jVljzME7uEzXZ6zLF4yRpvKruZa40R9DJvEL7Rts8xG1JXnqFljWul90aBrOD46N
         Xnn+zvv/Duj/OCTlhrunr2H7lzEAldHEd/JaxrqYmWmqtbB4hO2cAi5HJOkWexsyzFi6
         jI5QWUiudkDkciXjPt1g0oQIn2biKfQ9LtQpRxPoT/EVr63f0dr8YLcMhQXuGmOUYkOM
         DOV4xIjZ8tzBiMdeYzExK9o58zOsqB1JesEoL8sTdcXSaLppPzAeFKk1O/4Fze+gtnBr
         V4Dw==
X-Forwarded-Encrypted: i=1; AFNElJ98pjJJilR97SDpK5F2Fmww/xnLTmHHZj3YGXWUcNWBrVamGhBEVUFoeoYuqIOKNyADu58jh8ba6nbjIHFk@vger.kernel.org
X-Gm-Message-State: AOJu0YzUGaovleT1UWKYkgyQflIWV0NusQ1+2QeZV/DjMQbCpZhp2dbf
	BMCZYLCruWylJhEkowonr3TpQZ8EvnWNFhmOBslQRI+epEPaIhGL5TnteKgI8JxiW7hgxLmbGNA
	gsRvyiPgPHZARwBraRd99S0Gv6uh5JPPY7lmT0ncPZ1TkV8VSFkO9gNH+OD7agIfvqZn8
X-Gm-Gg: AeBDiesdLj3qiiJGkz1v2TXQ/U4W7e/rXE0TcHXk2pcbpbB61Il7J/SynE/NkFWJqU/
	Btms+FrQmB0CPMK7rFe1c9TBaQPbSENz/GIX1CGC+5N5lD43Zi8UPUbNPojJTExqq9GyzS6V09E
	ay3+26oQvUxWdY5NNnhM1EDuKycbgE/N6p9ViWmqpEANuj7SF4znZKoEebUAYkeVUCJzc+WqXFL
	gmyoq6CcCrHOK/OG2jqgHfLrN6x9NIBGaV+hZDxNrvWxyu7HLAjmuOkZNhLvPfmS2LXeUGQtT+l
	75u/1SDXO+SMRYNUVQyRS6eAG/JSBgkQWPdkvFOFzMULbj6NWsJ3yD8yIKkNuQeToH3I2Wtg4c0
	NC98U/4aTULSa2ZcBL3mNVz3pc4amad66gtYUKGsXsfFpCg8NVHzg73K+7GjbZTFrNygTwYZ53q
	s=
X-Received: by 2002:a05:7301:168a:b0:2d6:78af:ef5f with SMTP id 5a478bee46e88-2e464ea6ee1mr8498921eec.3.1776778228412;
        Tue, 21 Apr 2026 06:30:28 -0700 (PDT)
X-Received: by 2002:a05:7301:168a:b0:2d6:78af:ef5f with SMTP id 5a478bee46e88-2e464ea6ee1mr8498884eec.3.1776778227597;
        Tue, 21 Apr 2026 06:30:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b3dd9sm18840783eec.27.2026.04.21.06.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:30:27 -0700 (PDT)
Date: Tue, 21 Apr 2026 21:30:21 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document
 Nord QMP UFS PHY
Message-ID: <aed77cSNTF87y8IX@QCOM-aGQu4IUr3Y>
References: <20260420074942.1250414-1-shengchao.guo@oss.qualcomm.com>
 <faa58e87-fb6f-4598-bfc4-b48b93bd0400@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faa58e87-fb6f-4598-bfc4-b48b93bd0400@kernel.org>
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e77bf5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=upPKRX-Ir4GeM2YDT2AA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: PQV-VL9MhusGo-ap89VQ20lrPByu6ggQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzNSBTYWx0ZWRfX8e6xCZKLC6T9
 Qonp6y4EsDGQFgrUZGQSdg5wmIlQBNlA2YOZQg/lawVLsEFUpRxWJogyCDypva3cGAJ/SlxuL1p
 Sh6v5/bZCLWt1Pko7E8PYfsSUeKz0pQMbAEH+Bh7/AN2NQpBBmZ9NyuJiGZUXRfWrimV5Kk0XF6
 OM/wxT72tekc7pJKqMl4/pybqmFLDD/bYTTlz9mq57pNk8thSYDTYPVKGou8EMA3W6KuFWl043K
 33VJTvpXIdvBfnx0+YLcuv0mV4hp9N1J6vHvdR9Iq4+8dDbDMD+hYW6VijnzdF7qMpNW0RRVef4
 0/kJZRyaRTEWKYdXAdgy1yfXL46QLz65DhWm2Blngb9Q2GV/TTqnRnWwSQCj47LiHftGBheA+wQ
 gGF1VbPATGU8iREzpM/IWDKrtw7hlEODDawIFheDJVwWDzqpnU0dO3D+KyJz3K+ac3mscU5Z+aH
 YvR8K8X9uzMy+yuYQhw==
X-Proofpoint-ORIG-GUID: PQV-VL9MhusGo-ap89VQ20lrPByu6ggQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210135
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103956-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1244243B67A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:21:39AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 09:49, Shawn Guo wrote:
> > Add compatible for QMP UFS PHY on Qualcomm Nord SoC with a fallback
> > on qcom,sm8650-qmp-ufs-phy.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> > index 9616c736b6d4..cc3457d6aa3b 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> > @@ -36,6 +36,10 @@ properties:
> >            - enum:
> >                - qcom,kaanapali-qmp-ufs-phy
> >            - const: qcom,sm8750-qmp-ufs-phy
> > +      - items:
> > +          - enum:
> > +              - qcom,nord-qmp-ufs-phy
> > +          - const: qcom,sm8650-qmp-ufs-phy
> 
> You do not need new entry, especially placed in incorrect order. Sort it
> and then you will see that you just duplicated it.

Indeed!  I missed that.  Thanks Krzysztof!

Shawn

