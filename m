Return-Path: <linux-arm-msm+bounces-111217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EKaxCmWDIWoPHwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:53:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B07D46408EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:53:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZJCO89+j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BiSwjyhG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111217-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111217-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49A0130D605E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 13:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3268147DF89;
	Thu,  4 Jun 2026 13:50:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D75D47DD56
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 13:50:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581006; cv=none; b=cRpV17Yn3YK9bslEh6xsG4xM0ETfgbUjf/DTw8SYul5z6wUubLU8LaD1NW2Y3a3PFKGWWa5H8R+29IuzG3Q9uIvfS/CKwFZRRfcufm1y6ul7r+k1uep5ubf7rPXOPTRNp5asVyCroiRjKiX/NL8Vxm9TKh1jOBEqe/WzXBOrmqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581006; c=relaxed/simple;
	bh=ps/xJcr3jXf5AMzvO+G9tT3W2UqJl0/zoHc06lrzgsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rftYUiYKkxvJsf7lk6xKueWQ2X5c5XzDNrLoQnhsGy6goabtDJlMaUJDrHxfXytpbF4qOg40ej9n2v7pJ6Q9t/FLJzyEHLNqEm5M8HjXoYfrtsfPFv7AIbg8UGTaj4KlXnYs+rr1l5gsE9JT5BLu8G7amJ3zMasalwW1KU1uuA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJCO89+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiSwjyhG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548UXKK1132208
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 13:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pNZYhuT8aP8yjUE8ts6a4+Zb
	HuHx6SQBsmF68wpFsBM=; b=ZJCO89+jHh6MNbWGmkV5dEEs5s3lM9jadMQaLPZW
	7VuttPfqDB3Oo8hcN3C/ctDbFdKJ3mGrs/N3FOYzqBWWZ4zRERVPO3Y8TKiFth6l
	Nq5Hrs8OQu2r3Jv6KAUYytPUALjbNfW4TcfPs+i8tqE2kMBlt34Am79ihU/Y5NEq
	apWkOPJjQ8krMW/r6xg+IVwE7kTtXgS7qTWwwPltVMBoQzggnG0YvOy3Sa4PeAmj
	8SUz0M7+QynNRuKucV9xS67PDdppdTbGhgf0zkW5Ew7D9TpkLttUDT9XItB72yQK
	dMLp958QWaCNl97S9WftCYT7rX+trqIi7dmtcVQihd36LA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsh6x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:50:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7670e38so948364241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780581003; x=1781185803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNZYhuT8aP8yjUE8ts6a4+ZbHuHx6SQBsmF68wpFsBM=;
        b=BiSwjyhGF2RxjNI5Dvp5nzxYtRYRjBMm9+lYukWRHXNsK3IH3MFXGF7cW8kNIMYbVm
         6hnss5X4SX1rp2FOZqeoRL0DpakqK9L/TLYvX6v+ByS9v/S/AjqyZZNazU5v5fKyKYRE
         8YmQQvdWmYAw1DGJ5HsAOV74zudzueDZWPQ81z/G1Yl2E+cLc+SjFF5aRg87kUvGK695
         b1HBxJTLh/UirtwwiXi+L8Nr06JEapGBR6xwFqsfHwie5wBfQPxKn+MavEwIq9L+Fdze
         QlZ2HTB1ovLiZL3eVMRHMDaaL+duzg6eyStuA9xviHbm8YanFIQyM900e4/Qv+GJT9L+
         Rwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581003; x=1781185803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNZYhuT8aP8yjUE8ts6a4+ZbHuHx6SQBsmF68wpFsBM=;
        b=PHPUzV+k2pwhq6/vKP5CQ+KJbFCQRcP25NaLvg8rzCK9Xrz8x07mVzHaAKZMb8FExB
         y4Y7ztNGqgc5BygltdMfCaoQsa0M/EPOtaEDa3ClxpTuXQOEb4AEI9g68+TX0u/ZYWj7
         SzMhXRKWCIUqQNXoPa44CqgYeKIfqTwXXPQ2go4umCXeSK261tV1qEPWtZG8Sg8Ej7Mm
         DbpXvbI/rRoJHbJDs8k1muG3ARHh5JRbsKeJW6S/AXOxxepsa1G4VjcDfeDB+olT02Lj
         04aNL09O4MWhav5lrDpczGyBgAFqxq3Q/G+HRk/ZoG7ZsG/FHc6uaQujYCG8zOd6TsE7
         qh+w==
X-Forwarded-Encrypted: i=1; AFNElJ80tasbIXsG+m6m9uDGz1xmhEuFc83YYe7JTQ/v7UvSvCUIKm/gE9V1viBWzu9T8ehCrFJHSe4K/bI0GVCX@vger.kernel.org
X-Gm-Message-State: AOJu0YxSNImaYEJ6svJFSI5ps8xLb1jIMVdTpkk4Syd9r0lCwMLyEd2G
	FqXiC+yp08CdYitT8tJfijKP/BAsanejbGNo3KdfNNX0xf24W1ZMSem2IkAHGDj3rROf9CSlDIT
	OdNy0s/soKB8JEtZ78tRgcgt6AVnACSjCHpc5eExOSDizgoqWfToG1Q0bRD/DqUMLq9H6
X-Gm-Gg: Acq92OGqJL9lN02E8Xe7j6hl7Mu06DSFyWS79h3/3J6uCj2YWyOXlSXwwwR+s0logyv
	Oy7BkLCnbWTQzpubQKaSqK9bdKBV4AGPJzDRMgzFhjdyv3fgHYYPEJZKwmp6JpIlZCf3L++jH9H
	KikHt1SEPJC0BCI7yD494LG67KDnRAMP4PxP8Q6veu3jAylPZvTnvWvRZbL+XEQEDkxyXS/wGfS
	a2LWPF81DxBieh5NVxUwUWmte7sbxfd7tJlHM24HhOG95dQgMNkeCOoY2YfylD4aYTwSVwcMCNd
	mdDJlwZmqFCDwLf909acGF6CCU/9eSC7pH584TIpYFUfhhhpK0+NhTATpaswTXMFakDnmMvhB8+
	bLlb6G2HflwFA3c8Fo8l57cP1LK3jS5l8XOX2HSB08XxeV5AJEKLo1MFQadFC79mXDExG4z0iAC
	aFHRnQ+nuUwpX7HDWCbvS4/akZP3EXzFD7fTMLfIAaGCfHaw==
X-Received: by 2002:a05:6102:26c2:b0:6c5:3cad:68bb with SMTP id ada2fe7eead31-6f53f84fb55mr1743869137.2.1780581002906;
        Thu, 04 Jun 2026 06:50:02 -0700 (PDT)
X-Received: by 2002:a05:6102:26c2:b0:6c5:3cad:68bb with SMTP id ada2fe7eead31-6f53f84fb55mr1743843137.2.1780581002320;
        Thu, 04 Jun 2026 06:50:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fdc6bsm1211693e87.29.2026.06.04.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:50:01 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:49:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V1 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
Message-ID: <gq54nr2bzvvqkocphvkji7g7rhbsrngsno7gvsfl4nsfvakj2a@wsfsnohrnscm>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
 <20260604122045.494712-2-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604122045.494712-2-monish.chunara@oss.qualcomm.com>
X-Proofpoint-GUID: -tkk_Qj6vm7gbYaSPU5siUUZVC5jV4vy
X-Proofpoint-ORIG-GUID: -tkk_Qj6vm7gbYaSPU5siUUZVC5jV4vy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEzNCBTYWx0ZWRfX5cpX7l1NX1mI
 4En5KTAE/cC3s8vJ3CTWZlkVh26OmqTptmDpzfIsem6rry2P9ga665eizHmJ6h8NQD+GQEd0H2h
 zSGcnCCYS7y6xKmEfhu+vKLn3jSfZpr9Uyuon3NgggCw9rqGLRUTjdzJ3cRWVVVIdrqRv8RJ1Z/
 5K7OxR1o/YjxojPZvIh5J3SOBpyg2bUhDgKy+CVheSSF6nIPuvV/Mo2JfP9/4G1S83+V7AvDvHu
 cokg0jG5121onuSrOeaZfWSvOEXnr4WNjAQy+mMETIX7Eab5D8oLS6ADo6LFWiJ3cdOk4fTwNOE
 ETPQlZ4pu0JkSF/Mzl95OiKrAN7ao0fn4KYcWM9Fz6nOk8hc29tnUyOFr1/DDBNRJ7ZJq8t9HV+
 Uj0fXjlCM7sU5nH8m6meU8N8KEBvFHN+loHqM5wscxVUA3k2JdHgqvwTM59rqWZ1K4mvMHl3wlj
 wtyxYrDC3Q850xXYqYQ==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a21828b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6ET1qOE6ZwCBE8PxlAYA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111217-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,wsfsnohrnscm:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B07D46408EF

On Thu, Jun 04, 2026 at 05:50:44PM +0530, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 93 ++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +					 <&gcc GCC_SDCC2_APPS_CLK>,
> +					 <&rpmcc RPM_SMD_XO_CLK_SRC>;

Misaligned

> +			clock-names = "iface", "core", "xo";

One perline

> +
> +			qcom,dll-config = <0x0007442c>;
> +			qcom,ddr-config = <0x80040868>;
> +
> +			iommus = <&apps_smmu 0x0a0 0x0>;
> +
> +			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
> +					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,

Misaligned, make sure that ampersands are at the same column.

> +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					&config_noc SLAVE_SDCC_2 RPM_ACTIVE_TAG>;
> +			interconnect-names = "sdhc-ddr","cpu-sdhc";
> +
> +			power-domains = <&rpmpd RPMPD_VDDCX>;
> +			operating-points-v2 = <&sdhc2_opp_table>;
> +
> +			status = "disabled";
> +

-- 
With best wishes
Dmitry

