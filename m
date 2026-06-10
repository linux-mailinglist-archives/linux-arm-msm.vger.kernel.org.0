Return-Path: <linux-arm-msm+bounces-112466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mJpcEdFhKWonWAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:08:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C966997B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:08:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RwA4RDxe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iZx0x5nr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112466-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112466-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 120933008D3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67101A23A6;
	Wed, 10 Jun 2026 13:03:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C2F370AF0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:03:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096594; cv=none; b=ElMfTHv0cGJ4MTpbZkF5resZBsaWu98OCPgv1Q27bkYoj0FGryyqWPLEydGIxV9X1wMU3N5bITqvVMExv4N1MYQrOe31pP0BBjSYPzrSuHArIWYY6fzybOnLPv8RiFE1js0115QkGuUhr0dPhE2ahzX8VZ6K/b2EBsnwr/Qga5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096594; c=relaxed/simple;
	bh=B43OnpCrwYb/9Y8e7HSur6l7xbP6AiJRLg9q1JiD3gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMuCVTBy6mzlAPLc901wV15tz8RWMUyyKPNCKmwbXttxBuM4rbSGQY7zu86nJQi8AZv37W4fNV8D5h5A7hDrKVnunIo8GaL/j8QySOUs8gwD4FkbRzJ97T+yLUiaMqbPWFgZ1Irwf72Y+aI33Cn76uPGYLXNx6hmjNWbL3hZr1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwA4RDxe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZx0x5nr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCI0f1137080
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jwn/wa90BPOcIqKLN5Sq1R2L
	JRfJe6BD4fgYbgN+wq4=; b=RwA4RDxe8USf5AbERFO6GipNWIo6GIdpPvSKgULV
	imCOzEEMGKH/5smQHlyJfR4KHXRLqMvEJ1C01Y6Be1xwPku2ObvyfsUSSqu4dP5D
	b2pHiA9J31rpyB4P89U3mtBvC24KpjPBVYVk2crNuGMVoyfsEo4s8ZKU6eakr6l+
	gGLHcq531ED5oZ5Unwqxw15jOwFzUFboIH9+buE/c1a+levSFyoPfvm4h71kztOO
	S75HbQbH1KXiTGciQucWUuJ486Pnd6tg8yEwKhol9XcTF42BscA9ulEwAUTMZiqh
	wZqjZ3MSvftDvPZ+7IwUOxR6Foe55cNPoPihWGGyiRDVIA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1svva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:03:13 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6fa8bba1dso11513463a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096592; x=1781701392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwn/wa90BPOcIqKLN5Sq1R2LJRfJe6BD4fgYbgN+wq4=;
        b=iZx0x5nrv6OAPI3CJWbdXaVviSEGJR7UHafS/rHumVuMLFgRa78L2ShDFYsS2bQGkm
         PCwCHogFmP2aX+ZoKKY7I+7zJMWy+Q3/pIoIzFjDt3huJzS6BB4OddSQH2vQmGY8He3b
         RPoXcW/tI8RTIvgsUDhbnYoOA0MFOtIbb+FJFYeaI1uhSU/Phup1cVG9LBucq6dQQX87
         /vd7szmXukQPunXFANQRUHN8MEk8pfhd1OIFULV/c6+s4Rnr8/IGBo1H5ugsruDLAfY/
         lI1vYxQUwJZPHa1VldGcukUNP9g8EK5dgiTHyGzgrc6wk4sdITdQDWxF8az5ktfZa+31
         Hu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096592; x=1781701392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jwn/wa90BPOcIqKLN5Sq1R2LJRfJe6BD4fgYbgN+wq4=;
        b=VcAfhEuCYnlb4TA7oEF0x5C2JbyAR/KS8rSh6sQV2jbLK8tu7mzRRaxJxJ84ydttST
         XQdyKNIsLtxiiKgRLhhRjuZhuJdOCVRwNI/1xUMvDNqCovna58xQsMJO/B7K5ZF0sSqH
         SrQc2afn84+vHjtseWahMhc7UjQApWthFoLz7Ks1tJS9/LXzSbUMjRVIFDolaOUexgZL
         1u3l400OeJ5JT57prDCE9K/HKhQ8rv1/zeUsvf/WN98fNWpkVkD+cE15vbM3GbOox/P1
         7VRtQMIZG8bjfd1WupnbiEvQCUOWQwJ0ANlhOUK3nmAcZHz2X8Gh1Bo3aqBS45dCLifO
         vgtQ==
X-Forwarded-Encrypted: i=1; AFNElJ82tAdPbLqziiHzzL5uw8A1yy8xV9gyYwexgDPp8jnUB7DlVNpraRJY89YJQCwzHM+ZN4l3sceQbtWbtyws@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/1+p6uc2oPj7qIfZT9Auj9KfVneTnaQEe1phbFVmnF1H2aFb
	OGslkvD8nQbGYGCB9MzyqpFUpigTZkA/X+uByYP5l9A3IFjaieIbd1Hi3V87gWPcRt3AY0YFE12
	fYELMbuHv6iLG6NmOkAk/wdj91daPNbRuVSFCzboUCRQxA+eDJxNlpFisN7z2fXMqksFx
X-Gm-Gg: Acq92OHobahIhT+Xm2964CgakLn5DgFKzh74drWjOKAxnc/hym/3iR6opXwhNw9Vizm
	ILRdKjsdYO6gUDZFDR4QZmaSON3FvSApl9jkfo/V5Fdxu4ibg+WLHr6LcMV8TkpcMkikq4cv5aE
	Hc8HR/e2ZhAv5hia7VMspBylqCtx7g2DPvfJhOYnqnwv3GmDtH+wsHWDdFi3qqrN3Ug7udH8nVf
	7idzDG1iDL0Bei8EZkjpSgguWanMhx0+iAdofDyQdDZRcY/wLsxPFssXYYUhE0yJKZ78jBH8WZv
	ThgpfFaDV6geyEnhfwHSM8Ktlo3Ibua8x+zc/PxgrOlX2e6zwd1gckqOF7afUcak3T7gEFQZUjL
	t7Dd4bBcfIVDCdf4/OIfHUlYn39kGs8zY8YVKhb4KoNywIFAFd4skuzcpGgJS7WhNyWgwZHA6O5
	vnAdomB/PMNERKN5Vx+D1UHUTEJDCtYczljRmERu/TRYTSPg==
X-Received: by 2002:a05:6830:6d2d:b0:7e7:623:80d5 with SMTP id 46e09a7af769-7e70ca0beafmr15853451a34.19.1781096592176;
        Wed, 10 Jun 2026 06:03:12 -0700 (PDT)
X-Received: by 2002:a05:6830:6d2d:b0:7e7:623:80d5 with SMTP id 46e09a7af769-7e70ca0beafmr15853395a34.19.1781096591635;
        Wed, 10 Jun 2026 06:03:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed684sm5372422e87.8.2026.06.10.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:03:10 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:03:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
Message-ID: <cnyhnyoce6v4d5roijrceuzd3ujvvw7ozklulaxkibptvjancm@cqbqu2aa7bz6>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNSBTYWx0ZWRfXxnu4N0b+GznO
 fH9sGJPgct3HxblQ4CF7LRuSAYQXFTL/1aSRJnKbO23NG8qnUV1t46Dfnhkno6bPpqshTkdmfn9
 mxqwCI/Tre6j1Yey3jfJBavefVLpzUjEeG80ug+61ztrRet2oF6jQkizVJn5wGrsDU8uHvKqP0I
 +ifLRz21rV+57TDR42PR0K+X4rFhWxirfCpswBPHlhEuuEiCngwZEIdUFRrV5xBvMZLj8sHa4Hh
 txSWW4cw19RZLNQ9WFW64fY3DCKTLmym5ehrhmZ2AUy5R/XTfkgh5c/iWVypZL46R7S5QSzXLuk
 KqX2gKiuQ4z5q5QIT5mMh6ZCQGYbRQZWmbmjeMfB+e8Ug+jxXec5e2sAODku+8Ly77S5xWrRaz8
 hl5FSZ4riE++fLFSsmoe5anjFOyuGRna/LAuXKyix9b4NMUD5c3N4a69Y0Q6G6hqmzns1ispgOM
 UqE7+O+1K7ChbHwnXXQ==
X-Proofpoint-GUID: Pet4atDVYkPLjvytctGsb-zneei0IAFX
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a296091 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=eJTdUu5jCtrkvInlvksA:9 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: Pet4atDVYkPLjvytctGsb-zneei0IAFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112466-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 585C966997B

On Wed, Jun 10, 2026 at 02:49:31PM +0200, Konrad Dybcio wrote:
> On 6/10/26 2:04 PM, Konrad Dybcio wrote:
> > The MSM8996 QUSB2PHY was not being guaranteed a power source.
> > The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
> > wasn't. This series tackles that, freeing us of some dt checker
> > errors about vdd-supply not found on MSM8996 boards.
> > 
> > Compile-tested only, but docs confirm my findings..
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Konrad Dybcio (4):
> >       dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
> >       phy: qcom-qusb2: Fix SM6115 init sequence
> >       arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
> >       arm64: dts: qcom: sm6125: Fix QUSB2 compatible
> > 
> >  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 +++++++
> >  arch/arm64/boot/dts/qcom/sm6125.dtsi               |  3 ++-
> >  drivers/phy/qualcomm/phy-qcom-qusb2.c              |  4 +--
> >  4 files changed, 43 insertions(+), 5 deletions(-)
> > ---
> 
> Note that msm8996pro may need even more looking into, but that's a
> story for another day

JFYI, MSM8996 Pro is being used in the DRM / Mesa CI. If there is an
important difference, it would be nice to get it sorted out too.

-- 
With best wishes
Dmitry

