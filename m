Return-Path: <linux-arm-msm+bounces-103893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL7/EaEy52k65QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:17:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D71438029
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70B1D3018AD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76493876C7;
	Tue, 21 Apr 2026 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gecQMdlp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hAxrjcrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06593563D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759447; cv=none; b=H6ajUUOfKWamP8qP5ZeQRhSj1Cf8nDQxEgXZ8uU32v/SB5mnDrg6/foghH0g+jTd9qSfQVE3okiCHFyA7mRpBVLkKnGNyzFnRrcqi2wDlTcQfrkkHhluJcWTYrIPm2S2Cc7CiVtKliGwnSJ/k29ot7k2LFI2xasTuU9f632B+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759447; c=relaxed/simple;
	bh=B+IlyedEhZNODOK1mSnA/Zegncl/8PN6pid22WrPik0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbltjjPQ70M3aoyFCRNeFixWl0E0Yr2BjUCzHrVAgpyXgFQiMsFZ1tkemYRDJ26hJst6S4j1wK5OTYhKRJ+nexxWMUOMGV4bQ+yDSIEaZ75Ls+bk2mrrpPCYzW0TFZVeB1qrpWJuhwfR+YKfVcNGYFT6gVqDcdRWlKQ2RgZffNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gecQMdlp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hAxrjcrG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L4XpsA1511295
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pW4RvJ1J0WjZeebgyc1hyYHI
	FUKi/UttC0Wl6Mb4bxo=; b=gecQMdlpFY0k7uTpdGCoOknDM23BJE4rmHMxiFKO
	+iIjg9/Rn31epo6HUwOr/GlNEJCZ3Bh1SA+VULyJaNyNy950ff+YSwZnvZVowz54
	JbNzY6Ynw70e7MXSBLgxLxnm77dAe0Psiw25NQfyfzhCrEJaHP/F3qa8ke8MK/BY
	vxmTCs4d2lHMvPVnnoFRpt/gr62VkOIwc56S5ZO6xY0pyjwTxmYJiCTXgVtXGcL0
	MupbnYJD+g2aUoeO4he5HXv9PU9pTIVYufekgRyH81uNwaV5v52RAO/UDdd2K4qV
	ijXdCGI20rpTAs7x949sB9tvi8PMKuxi1PQ0h+1Tk0kUQA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak0tv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:17:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5125697eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 01:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776759444; x=1777364244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pW4RvJ1J0WjZeebgyc1hyYHIFUKi/UttC0Wl6Mb4bxo=;
        b=hAxrjcrGPXaUak1/g1jHREEs9NAYbR2xKxMi0gYwZnPRUGpxfpVOLTR4an71RGudi3
         HIcvoAeIswqD7mZ6Gg4LT48MmfVIfSV0xP8wYcmi7q5c18xG2SmUBJjH4PfESYZNcIME
         J3vmMfB1NFXkW+ha2O+ZBXwONq9EsH/yctOgm6VN6IZjQ5+cHb9Zu9vOqx3nS1FXboA7
         AajfNcspl/bl7IAhgNnHJLbcg9pP4s5TLcWaEG0WUMy/csNS3EnMMMNwPJ/Wl7SNaFhA
         XA358B9yuwMNa9NdtR8ixcB36Sr7Utj42T8rZ2wX7JIbydTrWPkmgWxTmOYrBzXaM9ey
         rsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759444; x=1777364244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pW4RvJ1J0WjZeebgyc1hyYHIFUKi/UttC0Wl6Mb4bxo=;
        b=oSfRFBS9DvHupCZJEc0kU7JkyaRuIXT5Z9+LDPKRIvv0ejDc+/xNUHbDMQaEyJotvo
         VA+gdKFmeEPyBjbYmzZrFljtVFJQjIeuSqYBB9mpi3e/XBzPP/Bt6Pa6Wz9oyfZ/QqXy
         V9PRv+O4knsRITf7RdmW34Jo20GHXCHu2fYc9JbAN4QbWErHkf+7Ltt0G3mW0uigRUcX
         HwdcMjNfwZEeIu7IZjTbmWjqupihLE+ixZUVO0IiJBT0KEbd3dxhqbtPQ7ULV2exa2zG
         Qlp0QB797YC/sbCAjql7dlQN7/U+v17eJmQnzcWG+bsbqm/D0GOjlxKG1oGNgd1OoP9d
         aN4A==
X-Forwarded-Encrypted: i=1; AFNElJ94ImLkjgdKlTliFfJL25whHGl95plUwY81XBzDnH1hwXY5o93yqjPCAyHWFM+aBw5/wA4z0aJN8yFtft/U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FoY0z8Z9R+U9R4g6Ut9uTMeClVEtbMv7YwsWEtsPhTsIx/1C
	b5U2xMDWF0Tllha+tO5TKBoQqp+vwU9ajht2EhqkwGZNxIpGDewzQ3u5qF+p5MDx2PZi1a+l3dq
	UgLA69kAOWMPt1hisvah93XJe6l2ceOXKl4fNoKJ4kw6sw28SaFqdLphr/ZpFbQ9J3G4IdI6tUY
	hZpKw=
X-Gm-Gg: AeBDieuEZRoyCppdlke3MXErdpNRmeO7ig4GR3BI0pKGX3QyTjK3FLFo+xPBRmlzwhS
	6F+W6turGmTQsenK6aLhGq8CpUaGeCuGGS4x/iI6fPO9zReB1qMibWISNL4e5++IS+HAYZ7j6ER
	0mxtV+RbXKmk+6s/16z5S3T/j8MY3AMiNFvL+7JS+BfaePPH6uqcRQP3YvwUo8B6ft6lcVRxbxw
	UpfjAC+p4pozHY9OxDRooCrTTTRFhf3h7zJ/UQDGCpxFBGvPCpjJVuYEDgb0PrBY3B20N/e5gw+
	lykwXNIogXh9HoGeVi/Ve+Wt7YcH+FIThW9BNoz/X4gqce8VOcbpzXQ//bbqAV2je/A6HcWRmcn
	IMppgMZf8jXoNgXYwfC2wRntKA1VKFVeBI1lclY9Ex3I2ifyYX6Jj73/zNthCA3oPAYPW7DsJoI
	k=
X-Received: by 2002:a05:693c:3007:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-2e46538fd04mr8455846eec.11.1776759443512;
        Tue, 21 Apr 2026 01:17:23 -0700 (PDT)
X-Received: by 2002:a05:693c:3007:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-2e46538fd04mr8455826eec.11.1776759442926;
        Tue, 21 Apr 2026 01:17:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c38sm17625182eec.5.2026.04.21.01.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:17:22 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:17:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Nord
 SoC
Message-ID: <aecyjAkRes7hC1_G@QCOM-aGQu4IUr3Y>
References: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
 <177667402766.1199205.7736172019278854390.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177667402766.1199205.7736172019278854390.robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e73294 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: mw9ikz3wQXUYF4xUEgLHyoIjZY-vI2pc
X-Proofpoint-ORIG-GUID: mw9ikz3wQXUYF4xUEgLHyoIjZY-vI2pc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3OSBTYWx0ZWRfX5q47Kiok9T/0
 ZuhG38aUvfCMMxXZQj9qTn1mrFw7TNJVOPKJXJDkRa5OzDT/+o6MrNFJ4NykF+M5pElx4QFW1v8
 X6aCPF9olc5gLCqSTQzVo5wJRiXn5xn1IZOcvkSZ1ag/+qG3pkujrqy4auXX3pU8OqSrW1mimfw
 Auno13ka3xFtuDx/4nfjOM+P+JgSFCE1Hl1m2eEB4lYzpoB00+8c8xULj3h/rK+QDOCpF3jgMDC
 1EgncU/+axs8hIU4c38nkdw6MIvq55xtNOhU2XDBgkwB6HG4hO+4ROflqZarM/0VG9D08dzEekC
 bf2qj3GCrv4qufHuDOlE6vLjhea7vMaHBZJtKdbfQ0xHrvOBCXeKiwMvZT2Fa4FwipevXgjds5H
 vSxUjKJY9RWzx/oAeI4T/GFwbSvVJ8MB/02VVG8+4Izh4Nz48tQDaPKwK+5zNyIwDNP0+LCbucl
 07QNgcuBqncNnxvpI4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210079
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103893-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76D71438029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:33:47AM -0500, Rob Herring (Arm) wrote:
> 
> On Mon, 20 Apr 2026 14:44:01 +0800, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord SoC
> > with fallback on SA8255P compatibles.
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:77:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
> ./Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:80:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
> ./Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:83:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

Will get them fixed.

> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade

I wonder why my dt_binding_check doesn't report the warnings, as I have
yamllint installed and dt-schema upgraded.

Shawn

