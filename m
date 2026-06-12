Return-Path: <linux-arm-msm+bounces-112845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0h6RCz2iK2qZAwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:07:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB2676DE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:07:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TjHt8Aw/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DwKuZbBc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112845-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112845-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B07283019332
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551673AB5B8;
	Fri, 12 Jun 2026 06:07:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380BA3C343D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:07:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781244462; cv=none; b=Ul58bRJf5pCT2dGtL5xnxk0kQryPhpjipcAom1i/iyW/Fjl619OOz+Q5oLKVb2EMHeBJH/ABMAVhqlGa5bsvnHvpKA8sqpr9T0I1I26vgmT/aDSsT4dvvRPGUjrpsozD8bU2EDbgBUpUxLhkcYaKe1Gl44YYR9EaLjXnNYUPDkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781244462; c=relaxed/simple;
	bh=dza5qCkk/msk6DZ3J+3f1O2/0bE8hbDUayonOYL4zYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWfou3EVfdCYd3+IIcglkhFxn+44oPllMBUsaUdzPOlW2ihp8vphLrJJ9ONftCtygEhlVYf+YXrqOoJ0yyJrkS8Y1FZeZNDqWL6kx+7nEd6xGEsiUeNH1avnTGgS8Ino0lyFjp7qXp/weLmKwJC3o7JZFwoVVO2IGFiWojc/Gx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjHt8Aw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwKuZbBc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Cx1g2404415
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CEzOi38S1SZVQat1sn12gumC
	9IiUdpGFHjK+9WYrH60=; b=TjHt8Aw/wih7AtOkGGQR0Yp+FSvC+IFvMWMbCOwO
	7PrYzGfjamimGYUg8p+ivqviX7tISRJbpPgfVWB9lz63dwrvYx9ol5x98MESmhDZ
	JY4mBqhPgcFgn0Ms2LVFkMVtyQuu6ScN84YbcPAM0KTFU7AgNyDCiz20JdAS2Viu
	wjA8rpTRDrxTZ9hc2ln4n5DVAROiXWCkVeb055Bxp/u5ejyY/5R3ycpAsYMmJ9Oi
	JaXSt6DC/9B+agWDf0rgKhVGF06LQ8TCdqMUOylBmJXAp/8FdL41vmGVDGasQYaI
	lRbKnNCYr6H7llc+R+XjMAjdjVTj6qbpGELVm+nxrxRUOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30g9t25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:07:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517dadd84f8so11705851cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781244457; x=1781849257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEzOi38S1SZVQat1sn12gumC9IiUdpGFHjK+9WYrH60=;
        b=DwKuZbBcjfIlL2LqXgLBjRzIv8/RJXCUf0LKhRPll083EXCUAxvjPj0CDzcegJkFXN
         4vWqzIgNC9y9c2FtXeNuz14DijNKGS7xCaDbqzEq59gayCSvgmSFfXFCyBHtTIMYvftL
         peLYKQAXY2bl4nLRrV6FRrxyO4a0Ab7CJzKLnpguduaAgMz3MhJpLKulZ2uplJ2b2tcj
         YzsHajquL+M96vVoen82DxGW8WTNd7tUmDwAlOFNUv9XwTDn0hX2p2shG0pLKx32YmS7
         CfloByrWFZRHpkhOiVpR00lawHoOq84UEVH7tjMoZ8Vgmpm8447bS+GJcJtC0ePEYxiP
         7LLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781244457; x=1781849257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEzOi38S1SZVQat1sn12gumC9IiUdpGFHjK+9WYrH60=;
        b=aRuV921SFGKCFCmhgf7MSvhCdpnCk1MFqzmFIgr7LkWMFEXkIv/Ruqe0/Bsnr2VcHt
         yO+ItdBTjWJkSevps37zA8cuBhQqO9Nef2XgLI2D8r46+DD/IEyC+chUb/XchPd1eIeS
         DQQLaOwSoRraMoSiS9naritKWv3N00dDTzpbVJwceBGSO0RI1t6gA0TVLWh7nixVWS1G
         YkHyxFx9A/A7vHBaFQqalRphoy3cwLEeHdH9Rjc0g7rj/wpXKpOJTQZBa9ZeqvRCa+Ef
         0ZvJkvh9VPxzYtnA8slZwnt5JP4vc0lscmNW6tEfR4uwfWhWzUqrvg8SJakn/tpMeUTl
         AkrA==
X-Forwarded-Encrypted: i=1; AFNElJ/zr7SWTPcGc1zze4mkteLyG20B2bB8iDZ015DPDBiei6b5J9E9A+WhcMMqhtSOFFqjXYuEqkHy4lrSjz02@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwa7L+ly6vJhbwBNBLVXugW0XcLJ2UbEXMxTi10trF9qQea5uh
	TN7YoAXMZdCItYNhfZXsA2JDAdXbwVLKTwRis0kIBJMNU9/vrY1G1iTpTo4+sY2vRSpuVcFrYgd
	FLQ6ZiVe/fg7RMpwuax9Qp+7+aaEO1lE/maUQJiXYJ6TZBD/y0r+kSp7POAewxMvYjxCD
X-Gm-Gg: Acq92OFG9SzIcpI1B8qZswzutNSAXQpX9iw+2h8B1056JkJvt+gjnFLGbfsbD0Ue+28
	eyZqh8r/pGQ3BcNMTupb1RTGyOe1Ythi0qohDTeuuovZIFnS+9oowmQNJju8qor+HFK604NRt8r
	yIAVucinvzzeLaOcNHBwL4hwA+MY4btJsV59YuFwB2cwbdYZmd9XBXvtV/pfCHrqD5ppOmEmutt
	2Bfru4ZLPEf9wMrdf8S0tRsHHxXk3gsPIHvLOFMhAIkDfZJKkyJmY8asnMqEn2ChyECGlwOdE7S
	LiLVs+Va4LMDBqqAhGsC04boXuTKhbQ2SpTu9PruGGY19acNBRsqfqDbX8mCHEaVOROz/DZuEvX
	QcOUOSPUTKLZs2ylBKcpd3lcs/658T9MkJX23zkVfZWNh+foc/4BmakRBaE60rTI6ui68aLk9op
	EwP3FJI2qPsEm3R269wltRA2gIEtlRNXvVfv0=
X-Received: by 2002:ac8:7dd4:0:b0:517:8011:3a4b with SMTP id d75a77b69052e-517fe245abcmr18048481cf.21.1781244457271;
        Thu, 11 Jun 2026 23:07:37 -0700 (PDT)
X-Received: by 2002:ac8:7dd4:0:b0:517:8011:3a4b with SMTP id d75a77b69052e-517fe245abcmr18048211cf.21.1781244456832;
        Thu, 11 Jun 2026 23:07:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b421bsm244255e87.73.2026.06.11.23.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:07:35 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:07:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Message-ID: <logxz4exkcj2k6ocqhbl352u3kmnpi26wgm3mh46cmsa5336ux@6w4uq2wori75>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-5-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610111508.3941207-5-mchunara@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1MyBTYWx0ZWRfX31vc0jN+3vWQ
 0LN/Jin+DOJWHQVPd3rEa+8CBHjgZqh3djAx16y2Dez6LLMVClR+dWGsQIEepvtrRnXHGiP1pha
 SU1GtodOK0WpwttlQOaQHTo7EIQPJL4=
X-Proofpoint-GUID: o47oN9sCkEjfNt7O-LRgByQDN5adVu7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1MyBTYWx0ZWRfX9BmWNHvUDaB5
 yxdJbjuwgw9BHUdQKnA6iHHf0O7nQssoKDgrLZO54LD2n/IlP01OH16UnE65lzSV2xcsKodH7IG
 QTFsNpCgjO9nVU7mAX2EX29Agsl2bSfNV9HwdqPgSwygP2SS8ZZTmbl5tLBd/KP/0s80+rAZD+q
 ru7h6742s94TSMM+AnwexBD1uersgYleL9bkRxFeHulRx64Pp3MD/zmh8db+/Ja9/+h/cozVeRL
 pKYHmx5Pm0mJmIEDi6n3b+QQE3UENlueshAn98aQIoTwIm/1hPm1KCR/u0IRpb+X/vPpH6sTl3J
 XE23Otdcj9cbUCtBIcwgZCJ2oXhZr+ZtFo2WibJfUzFzsJOOu1UzY2daw0XV2FEqEa5JcR5qL0B
 rbX8UADvD3iFnXDiuOxPrRIVj7NLAjvPVXJ3+10QrKWesdm+U6aecPJdcer17YseoJ+ILgR6kVe
 bU0RP5nBW6L6SXbPpUA==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2ba229 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5U2oNk2jDa2XcSTJXtMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: o47oN9sCkEjfNt7O-LRgByQDN5adVu7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112845-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,6w4uq2wori75:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FFB2676DE6

On Wed, Jun 10, 2026 at 04:45:08PM +0530, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
> Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index c98dfb3941fa..f68d27429440 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -427,3 +427,28 @@ &usb_mp_qmpphy1 {
>  
>  	status = "okay";
>  };
> +
> +&sdhc_2 {

The board file should be sorted by the name. So these two entries are
wrongly placed. sdhc_2 < usb_mp_qmpphy1.

> +	vmmc-supply = <&vreg_l9b_e0_2p9>;
> +	vqmmc-supply = <&vreg_l2b_e0_2p9>;
> +

-- 
With best wishes
Dmitry

