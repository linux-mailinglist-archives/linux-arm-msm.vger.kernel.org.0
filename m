Return-Path: <linux-arm-msm+bounces-112879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nWICGp28K2ouEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:00:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44067793C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:00:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bBJcZXNR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ErZzBF+j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112879-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112879-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A499E30584BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082B7366DB5;
	Fri, 12 Jun 2026 07:56:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DCB175A8B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:56:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251003; cv=none; b=GVh/mH8rDKTlYstbB/UsJxD7PBEzjovBFa+4ok0ejvXWM/V0y1b8Y5rm/5CWf7nCaHa3vqx/qRxBVMhKrXhxzNX11Qly/aOon4seg76CTC1XD7REqsx0rWXjUW5E0iCzzC/VgqfOdELqdyadsakFU1uvcwMloZOlCB+rWa6lN+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251003; c=relaxed/simple;
	bh=TVkagD7lCcxYoUKNVn3e5LpPvaYuNy8MGGpeMfIGRQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHyPPX1q4c+DJefGLZgtQai6MKq8HfxLnpgKN6xmG2sz8fYMis/9poxuGqOZv+imwVbuJ/5VQiabrFqO+THbjWfJ8gVzoj45x4m3NjTpFG3L+q6UETL4VAwzGe1j3kVArNs6id8kme2ApbnXpIs6jOQwtBurDHgnNbsDscDPpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBJcZXNR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErZzBF+j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39mdM2516646
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=23qh1IfVo3G/YiV2/ivZAMF4
	usExeox7x59Igf9gmgM=; b=bBJcZXNRgciDrMvAataJQydstj15Z4pUdlIupOly
	2Q+SpUygEVWn5CoMeRilzszNTDCbh8ZXm1vbm4g12e/U/CAG8dvlUKntW7ZRTcc0
	34Ih++tfG4q96I9/DPFQrnjCSnzeQKEmGHQwVrZ1Mdw4p5i3M+Togdq5P5tzW7vn
	ZZjvz7LCWmf+xfotIffrpFefIEn5TAyeFnPAK29ndS7BlgdoHddjQ/aSC+7oZNF/
	BRyXh0nkmK6zWllG0vWH8Mn/KANlr1fet5zY9vCc962bUP8wZVE8iu1EsgczYH17
	JnZCKr9W0PDZlOB465QkDy+51E+G5JFLBU6SsaJA4+6cJw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72599-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:56:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176cc5bf2aso8381931cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251001; x=1781855801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=23qh1IfVo3G/YiV2/ivZAMF4usExeox7x59Igf9gmgM=;
        b=ErZzBF+jT3lj8EMebMIkZyB8vS38wRmKJfpL3gZTFCtwNPbe/l1RtaumFAMsb335yC
         EIxB82fVpiCJTHZz/hOqJlLYAXF0/n4uFvUpK104AeP0JQK3yT2bqaHzClbEPwGCxIxk
         G7fhHcQno/2m+EmymrMRMNWlwT8qHFP0w1XsrESO0rAF9lvXe7NTtKSa8URTsSxzmrMc
         z04jIjCcFNLF/r45a0IUBL0I+H5cgg8vkKNhS7M+na0STA+Y7GiVj4Bc/ZEeCY9TC68R
         4qM/7wrOe9bZonCOQgLYyd7U2iz69O7Z2ghdi3llCjn02yN5Yb5/2NJhSFqSli2Ud4Ar
         IbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251001; x=1781855801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23qh1IfVo3G/YiV2/ivZAMF4usExeox7x59Igf9gmgM=;
        b=N0dGg6+vWHIqQfQGxWx1GsN8W6ctyFGp+RjaV7GK6RgYO6HpLgpqE2lvg8RDW/zOlT
         Dil2ubQSfD8CxKMVbj3+QxTn5glow27to+1viKy0vcOHqDjZFyzzn93II0XjsJTHlI3Z
         f5ywQ0eWQvB34tla/kE/gt7i0krByUp8vWoZDppFlZp1568wEpUHu6ytB8pQzAfPdkgN
         upMYKWRIYV6aPomHcFg1OYyb7d1haaogmIFcKA6TFNqqyokmLHDVvYBWbdOSDyIPfjKT
         JxXWTq/Nb9nANDSjgh+eZ0mxDr0WtSjqqWtTwa1QImy5K2jpcQirk73VgkqmOo2mntPe
         +9Wg==
X-Forwarded-Encrypted: i=1; AFNElJ+bZwZNQ5zM3vJb+1l3M0MSDzB7H5NsTIOd+OciRbLmxeOQ8Vtnpx4YWAlimI1ozaVuhlmZ4nK+whxl7jI1@vger.kernel.org
X-Gm-Message-State: AOJu0YxF6QPMjNpbK+9tDUEcuphETIlOO1+0GaOjtylkDgffEcG49Y3V
	d2I6woATKtt9TZiXHlmlLfsGd3ZbM+KvGvG9p5zUwn9dPMuhhbQOaZJnM8fxED5InudMBba0iwJ
	24lYQsKITxSDkueiex/2cuf1je9Hjf8zs+w34l5qvz4IBGzkh9qUKyj9qEeTo/8UBWCKz
X-Gm-Gg: Acq92OEd7kdGKxTnBVH62uWqOlItG7VqAzGLO4tZtvynb69au2rWuN/Jn5MonLsO02S
	zxD8sLdUKZMA4KHBQaVZiwGjMgyj48yJUcjHm6XNSuWNwq8KDJKf8+2NujIsrSDBgGXxCA/ovY3
	cdfWv2cWjyRezXjnohAC/AIKgg4YhcS4RFL2c4lUH68LfqQgtfQaEmgVaRyvMRBe0lZPX+pECE3
	1n67TjAATEakTHksjOXNCbgBP5o2xxvxuc7PTVnZifvibW5idvxJ6+rER41VvdUal7AToJOVHV7
	ZOfqSGvINYXd7VHOLHA2CmMhAmCqufySsUqqI3HntS2i1gXbT4AqdKd6j6O790ql0gg69zcj7hh
	alKpYoxRYCPixEElsanE76DCBWrGbXaBgzLX7hZCeFrlICmZEA0OBsOn+b+CwZhXLof8t7sy+Cd
	YFuDa4EC5REQjDTN1cRwfpCRk+hGSYIifWPn0=
X-Received: by 2002:a05:622a:d12:b0:517:89d0:b8cf with SMTP id d75a77b69052e-517fe18fe25mr18621641cf.8.1781251001107;
        Fri, 12 Jun 2026 00:56:41 -0700 (PDT)
X-Received: by 2002:a05:622a:d12:b0:517:89d0:b8cf with SMTP id d75a77b69052e-517fe18fe25mr18621461cf.8.1781251000734;
        Fri, 12 Jun 2026 00:56:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm311542e87.50.2026.06.12.00.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:56:39 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:56:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <a3f4pqg2sa3drubpcbdhm2xt5nlqdmuxtlrtaqfkuh3vgpimwy@wji6puysk3hc>
References: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
 <20260612-ipq9650_pcie_phy-v2-2-b938cc2fc267@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-ipq9650_pcie_phy-v2-2-b938cc2fc267@qti.qualcomm.com>
X-Proofpoint-ORIG-GUID: Qxli57bpdgp9HDRgyZo6SDOlUFjNhDjh
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bbbba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TUoPzBygFmjHwfOE1pgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Qxli57bpdgp9HDRgyZo6SDOlUFjNhDjh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX3whVi+2bKpFO
 fDD5AdrEwXXU3nLlXN6qOaG5ZZcWwid6OEu0vW8m5U9C3PO1xzX+urutehVuu9vPSRIddcUcQci
 5Mp1Zc86sk8Tq5O93hMcEUZWwN3PwmX+MEN63OR8RnAmtrpLJBVWjCagJnS1ybOYX7Du8D4vGfV
 MQTGoCafirHbi5eYHyE1szhUCbOqiJuHongPPdyxWNwfx7SZr+QMrT4B8ZDC3pn+S5d8SsuCklD
 Xvv4+GHjZgRe4ZBDmmZLoD8pg49kuR4b+lzS5SNDWj01tzZvLGRPS9TB2X7inpiMfxkM6diPyFq
 IldNvvkovBPG2gQ8EiSp/rGWKNP+/x8u75R1i4g9Bwp5fCTaPRQNC/ZQWXGtmxU1cXd8TCQXbFB
 43xsZZOUiZmqg0iTHnTlncpUjqawpTAPRSRtd9SKOYjJDko7kq/xKgYz+VrIR8ZfrjQtH2Jpxtn
 77S4LaZFId7Iftyv/Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX7PitF5HLy5wF
 ktgM2rYgFFmvxY5cJ3HGelcOL/Y/nrDQx/n+KLgER5rBgdmEDkUnUaNtrupQB4Z2tRk2wIB1MWb
 faDUE8Gv1tL2eq1MBf421/DtrGOWIG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112879-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD44067793C

On Fri, Jun 12, 2026 at 01:21:02PM +0530, Kathiravan Thirumoorthy wrote:
> From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 
> Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe
> controllers and two Gen3 x1 PCIe controllers. The PHY instances require
> the on-chip refgen supply.
> 
> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with
> the refgen regulator supply. Note that an on-chip LDO, driven by the SoC
> CX, supplies the PHY voltages without requiring software control. Note
> that IPQ9650 does not support CX power collapse or rail scaling.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>  1 file changed, 220 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

