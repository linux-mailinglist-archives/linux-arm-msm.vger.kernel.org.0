Return-Path: <linux-arm-msm+bounces-117636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0WVuJptOTmoWKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:20:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F874726BD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:20:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VtljhVoY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YEPgXHTB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117636-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117636-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94C5130090BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C0030E0E9;
	Wed,  8 Jul 2026 13:20:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE14309F08
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:20:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516823; cv=none; b=P+MjJ1rwstM5kaCfhOw9MZUBJ74a0uH8wARu8KgQ9h9sYuAxVqhB+TVwf9d+rqbpi6wP2108eJVDw9tDRROVBs509FcKG2BkbGTaRkQXKlTqq8NwNRz79ptW0tByfIZRYrEuclC3Brkx1qH008+LFLYrgJVU2bT7liQR29ca0BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516823; c=relaxed/simple;
	bh=9YUnHE9Qgj/siIoXR4rr52kZJ3GD6CuoGt+K4X0HR+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1zwiOkoDqumNC5yrHDXfLJPTQpSKvCLQZf7bNAc2BVMCHkUh4Bn3KOH/xqiTjNwkRuVi8MFyaprhhqxcj4RB5GPNCLPhx6HXZc55Sw/oDgPpMKF3cOYs1Caa3Nrcs81UWwPNwHXowXUV0HZnrZcmKE96BT6utQQ0RVmouqg//U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtljhVoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEPgXHTB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668D7uPQ2678347
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bfBaTt2vbCjk1B2Jo6sg0jpl
	Sh7IN4ok/ouN5deZkV8=; b=VtljhVoYNJyAFd3V6Eqpoa6CMYoOG6kmfYLd4xHv
	wKKaF1ghwNY2r39KUgeONcJYawGn8OUMqZoWbjGUJ2EBeuNS/YoFNEpMpjDMZffA
	eNxyp1xz2MzcY1IJ3WxaGLXfEO36NZLgqW7Y3PuW6tVo7+mYS0v4B+kRZWSgv+eJ
	fA3r1bR6IJCElAzg8OIXQqHAL4DvLwCbceFVbqTkuKcj5coD5CKSiBQiZm1tYK2E
	sUs+R4aOOMMdnE/XEUB2Ky0xCAL6hbCceGGTOcJlYeBXnCB2WYkazk+dKb/4TguB
	bzjx08bbd8edQ0PpcapPSzuF6aCxpqb9fMQ/5JeBi1uMjA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s81hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:20:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eac2620cb0so11031976d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516820; x=1784121620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfBaTt2vbCjk1B2Jo6sg0jplSh7IN4ok/ouN5deZkV8=;
        b=YEPgXHTBtXm+BRKQggGFLbJCJvP1TXj21n5kk8IuY4p6fCySWhGdafa2494cECohQC
         TrQPev6EIP+s7RaLFsLhDL8b1U4YYUC3eI9M1mYC3c3JYcI2QWk6nF86ZGgMTX0Y5rrz
         VQPM3luOI7ioTIjnE6yIM9jxq97hC+Zl+LIPFlaIYIZMC2HAVjy2ZMEvBBPVSbOuU7DU
         ByAFD0vSV+M6P5UEMtotQeIg7CtYV/jRQsGw+VfWrkyZReDRW/GXjsr3b6hO5W/KKJsa
         aS17hUvL2Pkb8nEmB/f8C8DDAcx5GqQpzm2gW9ZpBnBI1yGinJSnQ4g7toL6UNRTiaGQ
         LTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516820; x=1784121620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfBaTt2vbCjk1B2Jo6sg0jplSh7IN4ok/ouN5deZkV8=;
        b=hATNlUXG5Yu7FUvP8ERqVPVsuxnyH164HEI39iI4j1mxWyFp0QyD8SJ0ifTGmUmGIz
         O2V8Qr83HK25lLGy3aaAgdb4ppnyr16bsW5spXdHBYa4oHKTt30w+kMR8SCiRv4NqWZG
         2pSvlo4AJFFeQYnKgw/4V1U5Mp+dzpPHxjeyvOfKQUakWOK3q5ZLFL7GGJhpaY0Gi0be
         3g16eJX8Lce8bLVguGc2bJqzm8Yr/G5/0Rz0X8U+ca/cLc0khlG202MiXaCCkciF66Jz
         R5QNaIC56vyzLghhJyo32ZM1XIbWN7JE+UBf2/QcSYP00ZKi2r8pkRAtYtzETRqC1A38
         Qi3g==
X-Forwarded-Encrypted: i=1; AHgh+RoXS9sNztQuYKWHIwB7VRGTIjxmcHe3ruLnuozQYg6+RctmnW9fy+x9PJ/QNix81H/nHKFCfgUuTXRh14Wq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9OxZ4taFAK+KIpJEgfIyw3PBjH726/kWG5B1UYQXpXibeGThd
	ohJzzehDt6RGjUE7wfprQ4wt34JB/t133VDT1VKYowz3LsEtvSw6eXuRujYZHVPi/E9gQBrKHon
	hKKGp/h+ubBy7brPthWTC00LlQi6ayTH9wfN56I+pAji4DboRflGe8Nz4ES9zpA/jTYVl
X-Gm-Gg: AfdE7cn7VkMoscUZksgFCxv2RGOGbBjLUCiA+axeRynbG+vyEKtyBDKbsxiWKUBH9L3
	Vr76UDsXnpvS+YRH/zFPtEHeKieqgeYPHihosHNah9YxgXNRRoot8hFZd7XYTC5hJVZ/k1g+03H
	7XlrKZ/T9gAEtTIBfLq7x7NqUChGqGh9pmbxXAVd9HNgZ565yuOpG7Ppz4R2msulXheJN4Nsw1K
	ThzYRNdVGwcP0A8jOe19L0mQH6Ro6ZrA5tij5OQ8n0juRsk2ebs6zfr6hCfdFpS3FEhtOjZ0B2f
	4xtlDnIY3pMdnuYhnV2roxo0guhAUK9H5ZDCSQXY0bckWew/rA0qPlAmnhew67p3Kvg0kCHmv45
	JqBD/Id8SGpwBtiBN7nW53fVuO9r5+j6uQMc3dRDvDjhnjvAxtggkQQrugQExe+2SpKzcBta6vu
	pROFCQuCqLjgdUz6sGl0pWbqS0
X-Received: by 2002:a05:622a:191c:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-51c8b40e801mr26371261cf.69.1783516820252;
        Wed, 08 Jul 2026 06:20:20 -0700 (PDT)
X-Received: by 2002:a05:622a:191c:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-51c8b40e801mr26370771cf.69.1783516819685;
        Wed, 08 Jul 2026 06:20:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb868sm4462264e87.47.2026.07.08.06.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:20:18 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sriram Dash <quic_sriramd@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH 2/2] phy: qcom: qmp-usb: Add support for SA8255P
Message-ID: <5ucpcgiwlhbhn4m63gydrioyznpxnfq7rgdxf637qubikt3gqp@kivbak76lvtp>
References: <20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org>
 <20260708-phy-qcom-qmp-usb-8255-v1-2-8d852a9535db@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-phy-qcom-qmp-usb-8255-v1-2-8d852a9535db@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMCBTYWx0ZWRfX3/oPnnaC8Y0L
 XAXJ21VvI9IKULAw9zrekJ5kTxgOKv3OZrN7uxJb0s8hxe3SiLmI1cyXpz1WSkPqJjBksK5XOD4
 w4fOLyQmZa+FOBTg/mfwNVZgWUbzML8AqLrdPnNLjsdGfRKCnQAbcDlT0aqnucOsts8LJ7hHcBG
 b2Il+10B1Dj7OBJPzvbfzsIeMMX4FvhR2BgHTNBmuDSIUXXimU+D+HF0PHcKLetzoaOBzXaQoc+
 JP8n2p8HA/cUM5ErLe7zdf+6+RuKyJXo41QNLLt5nOCr4La2YbOfsJDkIJomO4YK/a01kwTQhr8
 fb1WIXg2nDUagb4M0d8BjcuXQc/xXCsoIsIos/lfZMqq25rn9Yt7fsm0/oUXSAw5IdEJKd7dWev
 67fyc0NHXkcwha9sNi26Ba431wtI4U9tIdtOHSOG+HJfm4yhQeP4dTNlhzt137CRz2bu5cmoXlp
 EpwElZkK+s7qTZ6EwGA==
X-Proofpoint-ORIG-GUID: klncNpGy7b56bbdWRiXd3ROkblMxvLa9
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e4e95 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=_PjiPlVerWLE5qlwrMEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMCBTYWx0ZWRfX5ON5MW4W8ELQ
 J9Nz1K6fFyPVgL6ALXMQsVGD59d4XA8P1s9+y3HgPPnPtaHCzi4ZXnisD6X77+iS0aBxd0REuJ6
 dAMYpCJQpKOs4G2pSTRCzcp9HOXInIU=
X-Proofpoint-GUID: klncNpGy7b56bbdWRiXd3ROkblMxvLa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117636-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:mkorpershoek@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_sriramd@quicinc.com,m:quic_shazhuss@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F874726BD8

On Wed, Jul 08, 2026 at 02:54:21PM +0200, Mattijs Korpershoek wrote:
> From: Sriram Dash <quic_sriramd@quicinc.com>
> 
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
> 
> Power domain "usb_core" controls the GDSC, resets, and TLMM (GPIOs)
> whereas power domain "usb_transfer" controls clocks and interconnects.
> 
> In this variant, two disjoint sets of resources are modeled against
> the power domain suppliers which can be turned on/off to achieve modeled
> device states. Two modeled low power states d1 and d3 are supported.
> 
> transition: d0 <--> d3  :: both core and transfer suppliers
> transition: d0 <--> d1  :: only transfer supplier

Sashiko warns about PM resource leaks and those warnings seems legit.

> 
> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 175 ++++++++++++++++++++++++++++----
>  1 file changed, 155 insertions(+), 20 deletions(-)
> 

-- 
With best wishes
Dmitry

