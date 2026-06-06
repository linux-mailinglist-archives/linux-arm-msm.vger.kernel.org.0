Return-Path: <linux-arm-msm+bounces-111519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5QQ8GycgJGq/3QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 15:27:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC93F64D9F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 15:27:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o8oSnspX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bQ50NSd4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111519-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111519-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6E11301FA54
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 13:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471C33AFB12;
	Sat,  6 Jun 2026 13:23:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DD9378D8D
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 13:23:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780752229; cv=none; b=CD99fTQlYrZe5T45OLOZtrD2j8PgM9BbtI6QfrsLp/Aoz1NKuQY2EhGGbwv/ePL9uGbdimV9EBlfnH3rtqEUKBBEdgxV+Ouc50ekKSiF3p95nZPrf6/lAbMuVoda4R/oZ/TrKRfgt6Si3htRgcRQot3PTekh35Kg8vX9MgIza7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780752229; c=relaxed/simple;
	bh=ascq50Gto/BYzlD/1Iw9YsYIZvHWXVQK4s3uDyj5Nb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZMOVptTD33vIwH355gep5TZ6/w9Br7Tabg1pigFRTKgzxTmMO2kP/OWXg/1Bx0Rgb5bhhw+Au7vF01S/UI3yxHCrVij6XDAzVJPAiGnDU1TtlavfrDOJDmfRt2poxYCfuFjqNXpKvSYHTEEu8i86Ey945wubRNLkMhbViq6vDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8oSnspX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQ50NSd4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656Br6aj1412882
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 13:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ksjiIivO5NlJD1LbbhDu0ri6
	r1Xvc7dbP55abanCnT8=; b=o8oSnspXna5nsUXSC+KfBSoGEJdK61nyM4vg9ygr
	3vgG4eO/s4iyr0+c/KuFA5I3N0rUSokBV4wuQaWUDtWyuhJQbYKzdOQNmwI73XP8
	rDJRx36feN3QhdKmFvX4BiV6OTZmUZ2ggr6QWIg2fo9cdCNvVjNARPkyE9wA0g8h
	LyP05vrvHNDwArQg1OX7pvzGV6bhSGkXh0yf7BtbiakWieBxVm7rs3mTnPcfnqJD
	YhM97MEmoXvIL4izG9iO+4I2fIwzX2T0lKfB58Eh3uRvfnnJTqbLzRw+DbUyMJpT
	200WcqPOPdgyc6b1994FbuJeJhdAe0iemgfsovZtwOIoTA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98csp1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 13:23:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ab02fb4f39so1779537e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780752226; x=1781357026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ksjiIivO5NlJD1LbbhDu0ri6r1Xvc7dbP55abanCnT8=;
        b=bQ50NSd4q/B+GfNKHjPInDqJgHq0GIPHHkBwoMGUEpq/QJuhFPn3VXw4+ST25UkHOL
         PewJS0WtgIDRoPUm7hzVIK8+hZ9HmqDfoLeyJrZwbWHZEpRXGari2W7V4RcTOcmlA+Vg
         SLJ5WFekRYvQAyGLhn7RNIZ7izj2C6i4NdGd+z+tU23OiVvj3YtxpTb91ib9fLtd6HAU
         gEV7v4O/cyXomnIHx6mUwAAXYTYfJjvOWyAkT1t3oem2xX99DCykARpeUndUmrh6R6zG
         2rvvB3Amt9pWuAM1hBapaPL2VReiodu/DHVdTCikZPsVjfxoF/1Mcr413wWoc/fr4PTv
         MSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780752226; x=1781357026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksjiIivO5NlJD1LbbhDu0ri6r1Xvc7dbP55abanCnT8=;
        b=XG1eb4cRNAYLvfi3827jMYL8MM2zNtI/d6ltXy99GzUpUujW9EaVcA2sEwsnKvb/Dh
         gPN31kWEpc+mTS5nl15n5+TVvqj4Q2oMKyxpzOuoVRtO/y4S3KsGpiql0fTd6MbCI3OW
         mHpAhU87oYvaxBqefF7IWwYd1nu3AJwegk3vcDgJxbOxvGytMRhPfLMi2r8eY5Rd38tQ
         ZieAL68VylxUkq3VuFseqwThs2QTWhLUKK6J8VrLIW7tci0htYBM9Jl7vxfFd/E9TM3o
         LEiE/bsvfW2LD/MjREJkCXeOIUObWBOCnrssmDOiTxCxkZSBlEhiuI4+EhcqGANmNiC6
         58ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/EhE3qmLOzWtwyEaZbypyXACESldB2zY7rH7XmsxaqP5p/PrQhHzY4SNbHZrzkr+6fxXipOeFhLxii+Mr@vger.kernel.org
X-Gm-Message-State: AOJu0YxKN0FBX7xCV5ztRosJrNCEpc/m+1DTdQ600Og60WgZYdhGvywt
	ygJ2AGmQnzwZhVQ1ZUZpZxqy8K6XwJTlMOELjxs40fe0ruSNsIEPSGXVbyL06mI0f50qwhAjj//
	fYKN0mkZMaxGve5v3Zy89tUgiKK0dtAr/rCMpNzytlpxub6gsTsCaZ2frl7w0qnJk6moyWZ51+c
	B4
X-Gm-Gg: Acq92OFNfYCFuUx3jrXdwVoq+K2ScmZsSjBf57IIuC/LLjfbQd0+4zuCSSzLiiD7RZD
	lLioSIaOZAlzY4eQYUjvMWHds02FTeKaAj5dxFodpc7K7pf06sEBrTkO6atT/VChhUcGAzkDb7Q
	hyFkDIPtIC8Poy/UG1sNA/+v0eR5gngkx+QJzmyuCZ9yrFuoQxhGVWdUUufZMB3rL8jlHf79P/k
	RcQod8CGf1AG8a26nD+d53mLO+Jf38rjLl8Xd2MXxOLYunK/wm/2NixHJJuNI4yNt2GTXuqxvDX
	JBA5oEnJmrBhfmFmmLcNxFWQ6YV7RiGcCuTkS9NNaD8zhIuBf/b2iS+jpjtzm5bAgUUnFY97WKN
	7zY9QROGoS42T+fL8VsACXkKYxdmcBWB7TJGn/j3sDBZdhQovr45o6VUkm+m19mT11NG/ZBv6gq
	kq5/nqtbtIdNI66rJO+XbxsaE3HxocMtJDC5o7CXdRM3CAxg==
X-Received: by 2002:a05:6102:4410:b0:631:44bc:c0fd with SMTP id ada2fe7eead31-6ff051aa733mr3964429137.8.1780752225836;
        Sat, 06 Jun 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:6102:4410:b0:631:44bc:c0fd with SMTP id ada2fe7eead31-6ff051aa733mr3964422137.8.1780752225368;
        Sat, 06 Jun 2026 06:23:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d6282sm31177541fa.30.2026.06.06.06.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 06:23:44 -0700 (PDT)
Date: Sat, 6 Jun 2026 16:23:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: qcom: add msm8660 NoC
Message-ID: <wypnu53w5pesj52zyrj3pydqzf2rbfrxa72uplz3mq64u447wf@gypyaug7iwkd>
References: <20260606-submit-interconnect-msm8660-v3-0-f9da0158cdf8@herrie.org>
 <20260606-submit-interconnect-msm8660-v3-1-f9da0158cdf8@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606-submit-interconnect-msm8660-v3-1-f9da0158cdf8@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEzNSBTYWx0ZWRfX4ktRTUGl9QO3
 1CEtM4/BtY7Ij1+cbxHNB/NZGyMu0zR+ONtQ7EyI4eIjh8P7vv6hQHlk3Lesi8yszByun2VLuUa
 kRSvvTC7YALA9Qfem1bkX/WYlOS6h42ELemcYgE+TaMi744fSek6h27OI5+lwOb0imL2000jwwS
 QJ2jg/cn9v0luw6c6Ecpkd8ojnzwn+prZhl65U2aKtwPtHxZsPADHUPVdBuDcKX7tiZpXuGREB3
 LDPZzFtUSWROLBBQXAP+9PNzWNPF2VyKtY0uWkarVU2mBVjhRqMdIMyTz5YTWzCaEbnDpjbpRG4
 3ggDpkGjEshcB2FQFrYf+NRWqcRlf7u3ks6/dKVU5OeB0bEbeOKryaW6QPGOIkGhZtBufJuUPmG
 vECcQ2MKDWsz1kBo3w8r6ZUecQoczFQySecmIfpPs44Mb9KhJzGvTCpko/zR7aPcQHBNMNYEZzX
 70+Uo96m8EcG773PNIw==
X-Proofpoint-ORIG-GUID: GKBQPh8Dfy4-Du0zMQCZWbVQ_TpKKgvZ
X-Proofpoint-GUID: GKBQPh8Dfy4-Du0zMQCZWbVQ_TpKKgvZ
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a241f62 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=cTwmTnRGAAAA:8 a=KCr-RzwM3x1iQMyl6jsA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=sptkURWiP4Gy88Gu7hUp:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111519-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,vger.kernel.org:from_smtp,herrie.org:email,gypyaug7iwkd:mid];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC93F64D9F5

On Sat, Jun 06, 2026 at 02:34:50PM +0200, Herman van Hazendonk wrote:
> Add a dt-binding schema and an interconnect master/slave ID header for
> the MSM8x60 family (MSM8260/MSM8660/APQ8060) Network-on-Chip.  The
> chip exposes four NoC fabrics that the qnoc-msm8660 driver models:
> 
>   AFAB  - Applications fabric (Scorpion CPU + L2)
>   SFAB  - System fabric (DMA, SPS, security)
>   MMFAB - Multimedia fabric (MDP, GPU, camera, video, rotator)
>   DFAB  - Daytona fabric (SDC, ADM master/slave)
> 
> The schema covers all four compatible strings, per-fabric clock-name
> lists (bus / bus_a / ebi1 / ebi1_a for AFAB; bus / bus_a / smi /
> smi_a for MMFAB; bus / bus_a for SFAB and DFAB), the required
> qcom,rpm phandle through which the provider hands the arbitration
> buffer to RPM firmware, and #interconnect-cells = <1>.
> 
> The ID header lists per-fabric master / slave / gateway indices
> derived from the legacy vendor msm_bus_board_8660.c enums,
> normalised to the upstream interconnect-framework naming convention.
> 
> Assisted-by: Claude:claude-opus-4-7 Sashiko:claude-haiku-4-5
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../bindings/interconnect/qcom,msm8660.yaml        | 166 +++++++++++++++++++++
>  include/dt-bindings/interconnect/qcom,msm8660.h    | 156 +++++++++++++++++++
>  2 files changed, 322 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml
> new file mode 100644
> index 000000000000..ff28c7d46c32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,msm8660.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8x60 family Network-On-Chip interconnect
> +
> +maintainers:
> +  - Herman van Hazendonk <github.com@herrie.org>
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +
> +    interconnect-afab {
> +        compatible = "qcom,msm8660-apps-fabric";
> +        clocks = <&rpmcc RPM_APPS_FABRIC_CLK>,
> +                 <&rpmcc RPM_APPS_FABRIC_A_CLK>,
> +                 <&rpmcc RPM_EBI1_CLK>,
> +                 <&rpmcc RPM_EBI1_A_CLK>;
> +        clock-names = "bus", "bus_a", "ebi1", "ebi1_a";
> +        qcom,rpm = <&rpm>;
> +        #interconnect-cells = <1>;
> +    };
> +
> +    interconnect-sfab {
> +        compatible = "qcom,msm8660-system-fabric";
> +        clocks = <&rpmcc RPM_SYS_FABRIC_CLK>,
> +                 <&rpmcc RPM_SYS_FABRIC_A_CLK>;
> +        clock-names = "bus", "bus_a";
> +        qcom,rpm = <&rpm>;
> +        #interconnect-cells = <1>;
> +    };
> +
> +    interconnect-mmfab {
> +        compatible = "qcom,msm8660-mmss-fabric";
> +        clocks = <&rpmcc RPM_MM_FABRIC_CLK>,
> +                 <&rpmcc RPM_MM_FABRIC_A_CLK>,
> +                 <&rpmcc RPM_SMI_CLK>,
> +                 <&rpmcc RPM_SMI_A_CLK>;
> +        clock-names = "bus", "bus_a", "smi", "smi_a";
> +        qcom,rpm = <&rpm>;
> +        #interconnect-cells = <1>;
> +    };
> +
> +    interconnect-dfab {
> +        compatible = "qcom,msm8660-daytona-fabric";
> +        clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> +                 <&rpmcc RPM_DAYTONA_FABRIC_A_CLK>;

Looking at it, I don't think those clocks sould be exposed here. Please
follow what Konrad did some time ago for smd-rpm interconnects: add
direct voting to the interconnect driver, them drop them from the clocks
driver. Ping me if you need help finding corresponding patch series (as
there were few more tricks.

> +        clock-names = "bus", "bus_a";
> +        qcom,rpm = <&rpm>;
> +        #interconnect-cells = <1>;
> +    };
> +...

-- 
With best wishes
Dmitry

