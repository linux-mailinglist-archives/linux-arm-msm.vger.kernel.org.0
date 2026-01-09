Return-Path: <linux-arm-msm+bounces-88237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAD9D08377
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CC30302EF4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE23D3590CF;
	Fri,  9 Jan 2026 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIiNC1mZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGzE5uRR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720CA3590DD
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950858; cv=none; b=X1DzaKRNS7Wqqr6dXqrnSvlV5RoFRUe+9PAfp3eDULh7XaddXDGdB8VtrTe180RvcEhF3V3Lhr21QCpT5NnyAGhCR4dkIWMsxFLFBUYKChqpPcm+yMJ4deVSgAGvz+HfxJHudqjkgx1Gsk7nKdMDNEwtWNXVkPTXQVbgTAxiaNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950858; c=relaxed/simple;
	bh=yLu7EYpeKvHo7pml+kAIUVcBYLrTjHnGlwW3WrsK/Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuORF6jxskUliB5ro3BuPowy6aii22yy+gUUkHY0qsFmAXmWUIlr56AIvJtlBqMtCobcj6LXMDGRYL3onF6YKzog3/VdtL6O67WcNmQ1jkpu4bTshW+wAD7+law2uupvhfHlo+Z6QyMM9crUyotRmByCvClj92mxb18rUTf0MoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIiNC1mZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGzE5uRR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096022B3142710
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H1ktSs/uwrTpDiJM0t5HeMJ+
	7p16aJIrmxg7OHwwy74=; b=gIiNC1mZ6d4PpBBZn0DBr9Sxeo6LV03u813oyIRN
	CWguTpgzAQ44GC8zTU35W9CYOv734H3zKH5yWwA7LbmqnZ6iwC/0xjlwaHdNCgs8
	auRC+f7jiZehM8B8pIlI2oApB2pDs5t/is6pUg5r5Mycxt81WStkQPT3DJQhy7dI
	9ggmtMdZVLw+bryBMVdJNn2aO4DchAPc45Rp2Un0bXIPP5hcumMymFi4eDsNSx0v
	tDNPBzXSr/XDIeEZSbZtnKFGIkyWy66sZd4xzVmk2zPpQcnpDFC7j3kDJ3vCehwU
	NJW655fZa/niq4r86ZHJWFbjtiXi2PB6ub4buNVzoH+fhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j23v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:27:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so510067985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950856; x=1768555656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1ktSs/uwrTpDiJM0t5HeMJ+7p16aJIrmxg7OHwwy74=;
        b=hGzE5uRRxkjiAXKm0lVZBMNfDmZ5zoyCWW+pEwE1Bu5DgqbMejLjxR0qYzCzMQ+eY4
         JPg7vYrI4j3Nrb5wiF7S9Ua55pIgelbthAjBsFWOMbK/Ttp0h/IjnJzrS6uG/qyGhAEU
         HAzy3/8VOrV4zSmFVUsbuYLipYiRpI0mmDFnvvCXIPnySbDTQxNq+OiXIlIfPhkXxzHD
         H9m+/iu+f0KyMuEXWxXqXKnBdwrrQamUYKqzCWHd9SgIx9MHNxAjpl80P3+u8M0nKOoU
         BdTcCOPfCKrN1I5qlBigPpTvIKpnw4cdgjbdd2pCVMvZ1RJjxWSOe2SVNJocbAbVzaaR
         QxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950856; x=1768555656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1ktSs/uwrTpDiJM0t5HeMJ+7p16aJIrmxg7OHwwy74=;
        b=dbwoTku5d+VGIRqbYp4leyyuLDKql3CXsCL/EqW5y9ujGKUsBVavlLASavFPz+uCeq
         wFThtCrmzf/uPg6pIqWVgwWjqedLZJMo2jNN7p7x66VgB9vp2n3z9ZVc2dXq3bTm7hbw
         Foai4FufMZcvkqhMtIxPZeEfKmA8EbAk3b1LPkhoqnn8OMW9ikrUivIoe4s5RWoDV9/A
         CZMASvOuIXQiCbgvRtswGBOFo8rcgqCixSGeu1mgsHGNKdip6uV+Emd7EfQVmE7Mry1f
         PFZvBeK5DK24v+9XmvK7l4vE4KBtph2iA4v8cUVSPoqXC/BaONd1SZLtg14+TJIAz3Ra
         OMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxg+IDsrMqFjCk9RjQwvKAy8GZAEwkzrcKMCdzwY9xJRYhGWfa61DMgFH6+wJ5RkEy95B7CjfHB/KipA3T@vger.kernel.org
X-Gm-Message-State: AOJu0YwHNy2pCmb8vlvbFAGdTmbY0rxn9nKSVBZC47e6xJmNBaLLkySc
	jQeEyfb+y6OhJRIdzo98vSFKIazzJP/q9f/2Rh8OQHSH0+QmzmXlNAswkJ7SNKrwUSME0ncUnee
	xlFh5O7vxunBWbemI96VRRtLFb9ch8NAaV3eXSB7vHI8kQuVjSo38b2Kak0j8dVt0ssy0
X-Gm-Gg: AY/fxX6yjqZd9ld5wngXpYPWUBeDh8fpYzHOnntyAJBlu/dSPe9X+ZEm83tfacyVegT
	/6dq/GXblprABbDib1VhqiKT/dvmmBcKWh1yBv/dr0u8BnDSHSgCJThIKW2Hn2XFpRG2gQtaWYK
	Elb80az2JhjqJdSXGdvxUGt2dWXn8aF4I8Gno6dOE1zlNe555OnFngQ9rGfOzB+hw5voNC6ju9Z
	IBUUF7qz6mdxGBC4mAwVMIjsx7lhMAZnYD5V3fWMw5DpxK+EPRsXMIZ5JRMg4MnQNiva7a45Dqr
	EiCFwCRBmNDsqDgvwN6Z5FI92xGRrsZIUALrmXR7hDTgkurLZAwV8xZOvcHYWNQyNY/00ZGtas1
	BM6UtD2Oz9GcApxHLeomt
X-Received: by 2002:a05:620a:4041:b0:850:b7ad:c978 with SMTP id af79cd13be357-8c3893cda61mr1141214385a.49.1767950855572;
        Fri, 09 Jan 2026 01:27:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi0EY92vyW6vCCW3AV0ALdS0omt6piQMEeU34h8SSn0JLIoz3rOfb1xZJmZ8E8QOhe4oHmUw==
X-Received: by 2002:a05:620a:4041:b0:850:b7ad:c978 with SMTP id af79cd13be357-8c3893cda61mr1141212785a.49.1767950855045;
        Fri, 09 Jan 2026 01:27:35 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c86sm201154705e9.3.2026.01.09.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:27:34 -0800 (PST)
Date: Fri, 9 Jan 2026 11:27:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
Message-ID: <43zigp42bvt5tgamkhu6bxcegdy7m5dxuyc2dtsw2n5zbrdgzm@nl7anaoogkkd>
References: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX99zzgE+xGJzI
 RUnKbyxq7fb6KEwGdwdCDW2gaxfBhDvABjHMf4uxxBAYeSaUboVI9BTARfk+pJ+zaOAI1yvGavs
 uhnBQWIkJkBhXFH82vHNAMVC3kYKRpOYaucYG6ABdbsAzVPk5Z/a2WpVRIPG0rt4XrfV5h8NTTf
 OsNzo0rnPYF8EWye0IjyRVzuet7zWCcYljqvFnW48lwHcpRHdO1lIxx5MsGaSYcDaBY5k+vygzb
 jENLDOIv5gaJp0R844ciKDd8eLv5XHYgvH+ry443l/5EOqlWoRegy6W0XBeC5RJUZG3Nl3x9vJa
 K/nPh4k+Y5Z6nq02d7VYaLUTZAvKvRAzPwfbXXsJDIpBRVB9wUaiBGPF94u69gHJBwgxlnbuvsj
 FQqWLtOO6Swv7T3b6kJX/Y/DGPEltfwDc/NJGPfH7S2tQOui2on37RNbIAJkbgURZttxQ90kFUM
 aHVIKadft/Ida7ycnOA==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960ca08 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ePONTUrQY_oyHk2hGNkA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 9dLhp6612k6ppXwGmTUB6pkLvLAsarkF
X-Proofpoint-ORIG-GUID: 9dLhp6612k6ppXwGmTUB6pkLvLAsarkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 26-01-09 16:30:21, Yongxing Mou wrote:
> Currently, the LeMans/Monaco DP PHY operates in DP mode rather than eDP
> mode. Per the PHY HPG, the Swing and Emphasis settings have been corrected
> to the appropriate DP-mode values.
> 
> Additionally, the HPG specifies that the LDO value should be set to 0 when
> in DP mode. These misconfigurations can lead to link training failures on
> certain dongles.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

