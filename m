Return-Path: <linux-arm-msm+bounces-111556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9pFPAeFFJWqRFgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 12:20:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7030564F8AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 12:20:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kOtWLESm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RX7A1VDR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111556-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111556-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B4CC30680DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 10:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DB01E98EF;
	Sun,  7 Jun 2026 10:13:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD25A303CAE
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 10:13:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780827237; cv=none; b=Ijvnpx8EUEDJqaA3uTe/6voOimOzB0PbPI0in1cRwNdWHxue3zBExZrgO6Vhg8UUWehFNZk3dNR6bijO6MZ8+fepqwjtnkQlphAji//PS3PlmB0KKuD8HjXWtKRVQDzMttmGIs7AggFKAU7W5XNqLW85EQJqKruzfGjLNVsWJ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780827237; c=relaxed/simple;
	bh=8b8noawsfw61MgEwfkdxf4YgtoSVitAEIplliythSQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbMxvFvfw1ephFa/eTKtY/eipQ38HHlaElTy+ym/Wo4zXXMrnreKq0MG9ahFuzsdLE2U4+XYyi/9aZLMtiancSxtm9tobil5YxY42e2cB6D7u/mdTFoKXrJKsMgyapV0mWj3AqVZmpXLQ1hgT9cajg1qG3rYOK7kyyzBzD2gZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOtWLESm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RX7A1VDR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6577C8vl4124932
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 10:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cC0O2A1C2rKd2LMRwWo0UDbf
	PSQQh6LFCm650/y8+MY=; b=kOtWLESmVDiMAJkiNBNjbvHb9DVqbW3eioOTZc/k
	pnCGFhbWK/Q8adEZVetXDMrSpEQfmez2FWvAkKzYQsavAAz82l3MQpKOJIWgNpOm
	6Q6YgDOteVL6k9qHMa3ACV3VunCxkOwfLJAMMYLdH/JpiYblVaWEdoC1g42NjXWE
	M6VUrvmYEkh/FqCKQuHj6Rltj3zY2gxEhMuyvxj7QRrGAbmjvURDdYq92FxfjMd+
	cSdARZtu0swZcZdol5EKEV9bnT1qGLOeY+uP/cH40L3a41d3nyqFQ4zfW2I8MGaL
	LSlFCMBK5RLnRXBpSXJLtm3QC9qjTleg5qtoqqBDBzedog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3ky56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 10:13:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51774fd6d51so68370141cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 03:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780827233; x=1781432033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cC0O2A1C2rKd2LMRwWo0UDbfPSQQh6LFCm650/y8+MY=;
        b=RX7A1VDREqViNJa8GL9UbzfivziUHqujiAo1OEQcScUZxrggu0RAeFQZahRSqHU046
         odPVkNiMwqSuNJeCzAnOGGXqobOVSaPpBtD5om7beC+0k+o4OAm/U0dkcOLKWZaysjIu
         D6DD6lPTWSyqRddUVANdCW6iWbP3zCF/aKZLiiKRbyqpGQ3pexSU4EgAL2dDOXkfGsqg
         szRHOx2fhAeJ5Cynhg3gLhJGQ1LiggiNvD4YkzztQ1v76tXmiR6N6CbfESQRRlLAS6HE
         MWcDR/VCSuhd1mktKgLOERVaSztzvcoYJjD9hWWtcwCial7cJWnomeCCkyx3UyodPUyL
         jkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780827233; x=1781432033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cC0O2A1C2rKd2LMRwWo0UDbfPSQQh6LFCm650/y8+MY=;
        b=PvGC+WFiID5QeterwmrB2fGK8tmqB5TeJ66wGfrwASJglQq+zvmYVn7BgI/tODPWVu
         ztQ4t72QMKZGL/9QVd46TOENb2adp5oZIDiOSS9DSBh7+MdmzK4+olkJyXt7N4SeNcst
         OjOSIwNsKLnAER4e5QPLKPevYXxkalWrOgqJQqkhKij5X4TBmDAIyQa+OXGrCdNYxi99
         yoxk2f9I+m1E1kwixhZQvfx9J+nxZlo5Fb8uWMv3Ry1Lq2XPuMnoOBpn+DQ+KzVpHRuQ
         1FQjxErHLtwd75LqxJcL6NgR0bIruBOtJA+SROAo+grVpLx0awc3vHzAtQowqx8px2tc
         weyw==
X-Forwarded-Encrypted: i=1; AFNElJ8XWlXb/ejvGkJBC+nHjuoe4WSFTTtn7bCUaU3549fBzxRij/bC2xoy7TKAun+OUqD0qYYQgC4Ly0OgYoHN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjb/6V4pSqKkoMwTNf1W+Ix3ftMw7PQtBG5Tm9IHUyJgy+HoVY
	PrUXf8eDawzMttPOwqe8ZjLtrVnL9vrjsEJGkPIZpFUeaUbzCIJUdY5Q+GFM7WcJJZGE4FGGmQ3
	Wz+8nLNZ3ZNE6vcGJ7xTv/6y204H+xyD4nOf3oDXmmvQht7fLye8Wf2xjS63gciYaWvMP
X-Gm-Gg: Acq92OGZN1l6RfCw5xFV6dQWVcJyl8cMLP1Sn83uBIbGt7rzjQtEGGYE5oDvMoWltnR
	vQzuVNKoGBAAkQV8Jd+OqJtXWdYMXaq9mIMl7ADvSInJlyo8Y8WqbxCZ0sLFAqVksAnrH6WvRmI
	K+Dnek1/l91xzzZcz9fQ70uiRq7CqrFzf2wyPJxsj6LHwmgvDLwN2NLHNIWSVH9SKcWYWzHg/S/
	4oDNvK309HqSQELcrkuzx7vDA7yp207wnGoWhSgHQXKoXRSO5CLa1kHzGn+0pagKnbFf6z262ZZ
	CphS4pzd5GiA7WZE3OCLpGUIl0rPIR0FB8XibJu+y3yqb65bOTIzFHm/0AqEZ/9P14Xg+Us2D1A
	LSGSmo4JA/B5m1bSTe6JvNV4tZSDZXRPuR1igj7OhspmA6h87umS9ltx6tRyC9PWjD/nqW9GIzO
	7xAuPuUUQDvyFwFZfxf6bLB2rTblZKnuimFfz5wPGoXNJbAQ==
X-Received: by 2002:ac8:4a0d:0:b0:517:b58e:a1e3 with SMTP id d75a77b69052e-517b58ea331mr2351191cf.50.1780827233219;
        Sun, 07 Jun 2026 03:13:53 -0700 (PDT)
X-Received: by 2002:ac8:4a0d:0:b0:517:b58e:a1e3 with SMTP id d75a77b69052e-517b58ea331mr2351011cf.50.1780827232751;
        Sun, 07 Jun 2026 03:13:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac092dfcsm36963331fa.16.2026.06.07.03.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:13:51 -0700 (PDT)
Date: Sun, 7 Jun 2026 13:13:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
Message-ID: <enovafjkiuzr4bciu6bu6hh7h56wvnaq5fh7f46m4h7browyrd@7huwa5egaqaq>
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-5-0154cc9cc0de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-shikra_crypto_changse-v1-5-0154cc9cc0de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwMCBTYWx0ZWRfX6ay8etV17esr
 oSBgp1JzLDykg9Ry420y81z69GdjqsAv3srSUcgt5nD1d/H72PuyrkP4Is2BabSv6xwiWuAPiqx
 zntgSrU706xF8tpqLwHwBnmY/+tmN/Tji2JYnTrmfSOaopUaikxV1X0CGSl2NmyKBWQ58ADSfhW
 icgZMTdiUIgIpH/Du8+MOi1QBPcxnNrBiR9qZdPRPJoTCPKdbGMrC9qF0G/tcyVM0KhMaQZNMVc
 dMEgTMyzhzbPYHv0kPGylhTuFeI0SsIqAhFnnFqF3LDt3weyTVvmXg+L3Se8RnwCIWe8QN8Ba6T
 1ICe6WV764LHBjWkKbT0gIYcBb2/jKkioFxocMiVqbHW1IaMhe1prpg+QOpU2vqvIsJjjX/0oiv
 haFfBKcZZFuOPV4YZ2PeU7FWiJ3TXt0hVk2R4XISZwwYHwLSPT4WBDDJ8fs2BT9VITA9iEMoUPh
 9QyiVTmsM3Mguq4ptjQ==
X-Proofpoint-ORIG-GUID: HbIzn7OfYHb29ryNXKrukCzK_lV3d8Wf
X-Proofpoint-GUID: HbIzn7OfYHb29ryNXKrukCzK_lV3d8Wf
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a254461 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7nZNmzxVylfKdAgXsYAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111556-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:thara.gopinath@gmail.com,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,7huwa5egaqaq:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7030564F8AC

On Thu, May 21, 2026 at 06:47:12PM +0530, Kuldeep Singh wrote:
> Add device tree nodes describing the crypto hardware blocks present
> on the Qualcomm Shikra platform:
> 
> - BAM DMA controller used by the Qualcomm crypto engine
> - QCE (crypto) engine with DMA support
> - TRNG hardware random number generator
> - Inline crypto engine (ICE)
> 
> Also connect the SDHC controller to ICE via "qcom,ice" property to
> support inline encryption.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 31d0126e5b3e..b617735650ac 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -546,6 +546,41 @@ config_noc: interconnect@1900000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		cryptobam: dma-controller@1b04000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01b04000 0x0 0x24000>;
> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x84 0x0011>,
> +				 <&apps_smmu 0x86 0x0011>,
> +				 <&apps_smmu 0x92 0x0>,
> +				 <&apps_smmu 0x94 0x0011>,

0x84 / 0x0011 is exactly the same as 0x94 / 0x0011. Likewise 0x96
duplicates 0x86. Drop the duplicate IOMMU specifiers or explain in the
commit message why they are required.

> +				 <&apps_smmu 0x96 0x0011>,
> +				 <&apps_smmu 0x98 0x0001>,
> +				 <&apps_smmu 0x9f 0x0>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <16>;
> +			qcom,num-ees = <4>;
> +		};
> +

-- 
With best wishes
Dmitry

