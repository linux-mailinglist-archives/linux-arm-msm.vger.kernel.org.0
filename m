Return-Path: <linux-arm-msm+bounces-101801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1sHlEGB80WlmKQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:02:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F139C762
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FB593003732
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6581306B0A;
	Sat,  4 Apr 2026 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb6lh1Wb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBIgZvN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D43427E1A1
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336538; cv=none; b=h2LK2R9QdOUSq4CyXyPciiqFdE9blLxR3dx52pGxRvyjA/Pxcbxf3a5PIxXGECPiZEt60Qgm760dqtzzdIVuA5ZvvsJea5fLA40VcwZwDpb3H27onbtrTZKMx/HsBibRmxD0S9zMVOk5oCyR+Ny0zfessj2xbU4irLequhDajx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336538; c=relaxed/simple;
	bh=M+11Bqne1ZEbBP552q16E4pebXsWAs4LLI08kLq/vLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuMmpgp1WSU33Suy2aSYuOY32UgDBUiVgzb8AWkzwVd25k+F52Uc0uFis2vssokQ0PNLq5SJr9C/NYjomaMvIlgmHGSkain2MvN2JCfQX9Uu82xYtTrWtXKbUl2ejAlq1LzGvA7BOA9zWpSGNVQuWUjxNCulXYCi6fdS9FI1vdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb6lh1Wb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBIgZvN6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344BjRA3884043
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fPHbHTmrz5b69W2HbX81pMl0
	Mb3P+N1Jkbf+3Ti3CC4=; b=Cb6lh1WbqZF67viqKoBgkYUQW/wTrwHq3kSFBBW1
	fLrfpE5IJIPXqYdcrnR2/Z/Mb2+iGyq1zUtmwVWr4LMegpAfW/FgB5tEOZlPlPWq
	9roAlVL3QAFwv9ZSWgRCoakovk0mDIhY+yf/HLZBpy1C3JhQ4igu6ONHtueBo5de
	SBYNL8lvfg1/SmNiiBrGPRQx4PUsJ3kfEBwcikMArm1KG3P52ZKBzqnkbO4BCKzt
	AO/k9Zyt4iw/Y3cj/qKbA5Yi5KzP6UqQo4e9Z1t8xRKxubcffTt6C0ZW9XScq6IR
	w7kJVOO7BDaUodxyEXMcZnUK0kfVVl0pDvUsyi8ncAY3Ew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd1ddw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:02:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b6f869676so69732121cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336536; x=1775941336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPHbHTmrz5b69W2HbX81pMl0Mb3P+N1Jkbf+3Ti3CC4=;
        b=EBIgZvN6k3Ewz20qlNCkNiRkMc26RzSYvB0FTzlrK75f8o4rEOP29oxwMWh4+GEw+t
         Sw1/X8BYQP79AKL0dX/hQej6pKS4YiJ3LsmXG0gg4bjZa1xvWP8Plh3+KS1O4pKRed9F
         eu4AQLSmZ1/UgOivGmWhL43i6Henz3EGIv5zF0m+1pcvhW53MvJU6WF+1sG4wpdEAst/
         c4s9GwMhPit/+3yx26zovUiyAuasAfV3/Dt/Fvrta2dgghBVXlpTW1s0x0lLnV2XCaIo
         XTjZTIAwO7Jyb3yPW+o16W1TDQWFb5uluT/VjZtpbqHX1+KzuuZBiX+DZYSNatenEOMK
         7eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336536; x=1775941336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPHbHTmrz5b69W2HbX81pMl0Mb3P+N1Jkbf+3Ti3CC4=;
        b=Yfc8I0io9khlZMar6UoXvTkvUMyAx2Y3KnmtVqQbkZ2yGi6NdBXwIZ/u4GHaFhjjPR
         YJ9/ZnWPmFglP1zr3AFNylzee9730z1DTK676ZT+8MdJrZgoEcohiPh/wJLPEQxiQNyt
         4YJzgvDzL16cWOnL4GPIaIklIQ/DHIzTD8vRO5rRCm8xEFQ5zhnMT6esmfEmB2z1iV9R
         WlSge7FPnhQtojcplF8xPyTejH4hgGOmVE4HWSPzWcf0d1zvqpzvYCDSuTk3wUEOJJwC
         L1cwriDVk56c+7l6k9oJ8IfMj5YZDnttRq45hKnzEdUG0tD+hfzm/rM7Z2kA/zqckSgI
         Q/yg==
X-Forwarded-Encrypted: i=1; AJvYcCXm+w0tL5Be8rU7w8wNr+EtcQiFLKc3xwIjtotFc9l2GiUzT17lW082DTGwY+wfUkoB9/H5VHbFrSlkr6H+@vger.kernel.org
X-Gm-Message-State: AOJu0YyioMGEHOf3BTd2HGsN2RMO3c5qi3P8uJ2QYswTn+lNvdm+Y76w
	G1r3Ux82UWHsjhlDGDzyrCeju14aShoEHQhGarysrBGVZRrVWrxs3oXyfD12ALUfZ+uKVdq+tNi
	8fb0RsyXXCeSUAOVjw/fSQHGQUTEisbfRdgDK7ajMvdL83R5CDgQ1O7Kzi9zsaDXvuo2A
X-Gm-Gg: AeBDieu7bNq6w3GIYG0UlGyhHN1zu0jGn9G/w/7TF5E3F65e2ZaDrGEFtMMsOq4uWtl
	Xb2BgmYCWhU6BBXEy7E5YBQI71V4xjzxaI7VCmu+ez0qTvg4hmykXIH293g/cgjza/q2l1rVZ0c
	VxpfB8DLEJVDHaKoVVD2nYWrgWPA9A8llTBEJPJhnuyVUHP40qJPQNzl+9scK1tQTGkleVz8xTb
	5oKPAMXAcXMotiZwZJcmMPUEzgZbG5UAEGjsHLQk9kuCxhefIM4rT94zYITBQw7C4CZuSHdkDfp
	ueRgYmQdQmT5eFvTJSsVHQmQaz5bPhMdbjlpN3bL750KS9NHV1XjZHm7etVyp3L9zyppB0Hpkcs
	8IgLSHM2VwnFTiP67Cz9Vpuv7wJ7bbv5dYGRrp4WN1rZNJj1U70izOdWLry/ULrFMu9mXUG9YLU
	6AzPaXolWUNM+5lzh+FcqJEQGC/MNLnYJCjZw=
X-Received: by 2002:a05:622a:4246:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50d62b0a6d9mr116276281cf.52.1775336535670;
        Sat, 04 Apr 2026 14:02:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4246:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50d62b0a6d9mr116275831cf.52.1775336535152;
        Sat, 04 Apr 2026 14:02:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95149sm2319838e87.5.2026.04.04.14.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:02:12 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:02:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sdm845-shift-axolotl: Correct
 touchscreen sleep state
Message-ID: <ehzmqowdrvzafwahiakegphhvdoewq7eag3obpozxr6xf336rr@skgsull5vtd6>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-3-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-3-fbdce57d63c1@ixit.cz>
X-Proofpoint-ORIG-GUID: o9N8kCRQClYbN_GFZVwYtpt9LPa_8ItJ
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d17c58 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_gdz5gggCwxQTVruBwIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX4tMfN0t2tICU
 wMte9OKYYr04gM5at8rIxClHooBeJbZf5qnAiVYq7nTVbiqOnLthm2cfQ+r2/9yt4cV/nsTxP5S
 ooyIoCpWh6uWWTJt94AYZgYe8M3pEOW+1LCNTsz2CNvnZbCx0XLrr+WbPRUbprAR7WlatWICCrw
 sxpTERrzX0L/BIk+CiorfYC5rx/pk8gJ/Q0yhBuvBYvC2vV0eYr0I3Y+HKJEO8ikZWVmiHsw6DS
 XGzojigTtuAabwwIB9yfX0unFwpdDz0mhLCRP2GPyMoho3ZRxkfDSPx/TTtaWy+Md3rwI6JO8Ny
 UbQLB3VMPFoGyS1hzElEmWwXqkQI2jK9cx0Wa7CDdJsDu+kiMH06aXq6o8yIsuafjp3Zc3eDK4I
 3Mq/5Sk/GTFXrXhOsX+XLFys1TptjunOWYygZYL0ViZJv8sWEXSVfMG4itzjb0dqBtwSJMmmvrz
 STjtTCLIjEGenkJI0og==
X-Proofpoint-GUID: o9N8kCRQClYbN_GFZVwYtpt9LPa_8ItJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101801-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,shift.eco,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,shiftphones.com,protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E7F139C762
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:58:48PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> There is no suspend state in the mainline kernel, use the sleep state
> intended for this purpose.
> 
> Fixes: 45882459159d ("arm64: dts: qcom: sdm845: add device tree for SHIFT6mq")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

