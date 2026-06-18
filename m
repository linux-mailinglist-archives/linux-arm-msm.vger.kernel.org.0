Return-Path: <linux-arm-msm+bounces-113773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DCf1C27tM2q5IwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:06:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9846A0528
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:06:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bJFgVlQX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QifFtmim;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113773-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113773-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71430312E571
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877D33BBA1E;
	Thu, 18 Jun 2026 13:00:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE293EFFC9
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:00:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787602; cv=none; b=HQoWFf7a2ZSboEanhnZt5EXVQubHJ+v0D5Jt0NEcV403+9Rtypr52UNrETwDNQ24btU92CJUsixkf5FI+2BBanT2c0Ymrp2rwTrETAuV9fn/bhSFGtYOD0Jo/fMVJkOgWwRvNn2WAq0jD7iOICqXQVf+iLEpi9Gkku6XctFhNUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787602; c=relaxed/simple;
	bh=OaCsWVjeRKhtSIjTib1hDCycgwux+YYlVcMe1W6BPKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNkHCsNfE6LLTlkxbUQWpfsygbsWGKwl3pefoP7eTTAgrxJSPFrQAJAZGGLgCye/QcT8WcEnDL/D5Ki9qeAo26FHxey06q/jmpSM1f2rUtq89kVt93B/U0kUodfR+rtwSqos+8mUOQ9ZSEtmZdlo6kw+yaipOndxH828xNfgVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJFgVlQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QifFtmim; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICsDQh1201137
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HXykU2dPfmxOISS3+zUF8uA0
	j3FskgVTiZO2+nvoP9Y=; b=bJFgVlQXgZRa8K/6lxi+GPG1T3MzqTdcWPVA7XzL
	etQvChXHyJKyKL0GNUnPBBfUuz2QQ8PN+07X8qddPlP+3j3jUJr3MbsKMgeFF0oD
	844TQIm9S0yO8Ln33jOJeM0SRANw1PRvkXMSM/fouAtQAI92ypZeLlqWj6kqSDXl
	LnYOHZ2zn1Vp8nrlBXSOkuCcDF+5/Do154COEXoqp2mh2+Mgwcpg8UxJNFN2i7Lq
	GrR0tQy06M8PZU+VrnWNN5rm4Ef/CwV+GHnI27CJXE9F97Np3QE9MLS2Wsq4abUW
	0bjtzHi4/G+Z3aiKTdTrMBHsD3ZLMkxjBiyj5rupMbMHgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt5495m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:59:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9158f2c4b55so182908185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787599; x=1782392399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXykU2dPfmxOISS3+zUF8uA0j3FskgVTiZO2+nvoP9Y=;
        b=QifFtmimfZuYkKFvdzcAMTdEDoNozh0/UpyDL9Q+5CrMHiSR9BmAVBwIJDAxUaFSac
         tl33/ZL3PUa3iQuxaaB8sm1eZCmzp0XxVtM1IARlt41qacqIPe0vUfblXlaFtoPelObl
         xnrmcCfS3Wt/m07B30cCNpwEMSSbtOd4vUrRh4YbuR6THw70QeON88YxvwsJSbEL6kDD
         YsDXQbcFc1yMs+2SrIe+5kDli9hBJfaXYQlCxOBoHCkyCzN6AKzrplWlqwOP1Q5Z7Boo
         JL9037XfWDCxLxP+RUM0g9Na2rv5FgUbjltE+xWT/2Tp/8zf8jRHwvYabtBb03qOupWc
         0maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787599; x=1782392399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXykU2dPfmxOISS3+zUF8uA0j3FskgVTiZO2+nvoP9Y=;
        b=O6uTZlp9bxh/IwWe9ashDIafE+dcj7j2fMEmGUUC+gckaTw6HRUYOsfJqPgTJIlhHW
         b+YCS9xbLFDNFn6+4ee2eW2I1/e4///9Abu0xK5UIjUCHKM+oWOlwp/+U2de9Lfi9MX6
         IUjvPYudrLCpjOgzGqMaUiDXo28O04CCrle6COFJgNb7TsKkH2PxmjerRMfbPnMQVBa8
         alksOPTOKaXG0vxHz+nr7yW1dISGZ/SFj7jnF8c2MOK5J3+xfuWyLlAdrDCDnlgO9h1b
         VaELjrykobMC55uJkV4xXb43gqzg9JOS7RdyMhSbaDA8fdm0tI+geSlEi8VtHg/0QCG6
         yOjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EGLxN/N2W+EdVF2pzv6iFMBwUmYVX7j86Ni9p/FcDBUHZ4FcYPqDGELh+aiNmX9LW6+222p8Ym2oynxQU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dooGIAkBbIhzaZj8VyVRAX9cjahaujq8biVBbCAxSiUnMIw2
	S5iezcVJgSjrfZgYzPxdllOlf9tMKgnwr9+chmvTQ8Mq43E2pA1BenYLRrZu3+bg76X5bSLaycb
	CLwQAiTXDfTGhbTcHUI+HAphTLnuPkXUGXejiySMmZHx0udMTlasRV/u20N59CiCZ8OJb
X-Gm-Gg: AfdE7cl5eidXETzWpq9uRaQOQzcjesPbbV7y/dKQ4YoVft237LSCO1UbbkwjeWjEXKe
	Bw9UIroIY2eI3je+kPCbA3f465BTnBTpsnyjkZDJPFju0vQZF/cv9NK7KjYxx6oSxkWAuYSluKp
	07GOuZkUZbg2qUMYvRdU9z0BMaOw+ADnIXPkqtxkYci/u5g8hzq6eRkWl6TTyvQHKKCBrIbh7DO
	Z0oIpSMMK5Yb+Wif2r/p+WhGyfli/wLYdX+qlmawTxufv3DItNmmkQKt519NY+Wcuh6owVnEu//
	kXNOITKzwd1aeXkm0xUx6uTHS6XGQURYo8hD+cg/No8dW10lcfAzGGXfnaQO+Lp+1xih8mHZeNR
	9usM+xVHUJL0GIZPo5QVfHv+LPxH6OHxkj0TRo/2sHu6gUqashVyPNoGyXHHh8Kb8vzmXVT8tRk
	dsaTVC46g4ro2Vrqh6Pa5HG5oP
X-Received: by 2002:a05:620a:1b92:b0:915:40ff:4e10 with SMTP id af79cd13be357-91f8ba807f4mr313683785a.4.1781787598829;
        Thu, 18 Jun 2026 05:59:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1b92:b0:915:40ff:4e10 with SMTP id af79cd13be357-91f8ba807f4mr313678785a.4.1781787598296;
        Thu, 18 Jun 2026 05:59:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05abe3sm23104051fa.15.2026.06.18.05.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:59:57 -0700 (PDT)
Date: Thu, 18 Jun 2026 15:59:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavan.m@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Message-ID: <2qlpabzpyvjwd2siwkpcdcjq7geyzj5egu732dg775asn2wtbq@tcbj6r5ti2o5>
References: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
X-Proofpoint-GUID: TKD5juzuKMHDUsIih2IjCVkToLs8taF8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfXwUeyxruVZDDy
 44MThBl+NGLRoBpTNoyBaTYbGVd4NERVJyF2ixXpRAx0jUjg9y0pq1CFjTxZfhmmEe3A9e1WedV
 Xtbsr3aaj+m6nOAGSURhf/nd4J4fsqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfXz6kU30t2b5x/
 fyrpy8sHbdCQLSODY0YQvYHEQ2PkX1XKjp5kIgWAkx4VWefGXd584GEjzUThLSS36UFEPxNUdry
 IOzShwQfenHpiTx0mV9WtfKb//13EDF2mj2PUpLq9SHtCtNJZApi+ypP0eDbnQIuAVcgIClsUDS
 gxWpKRmuPMxtS8CGU15Q1XZamrFm7D9H6X4k3VBJEyNZfsDuK4zRAfp3+MMG7907zbXEjyIVi1r
 hBUftrniFSWQ8jcuEMKxE/PDMH8JT5MWuxOTnZB/dK8vqq2ixk2BfzkliMJxEb04vl2P3ooA+IL
 RJ3vqm/Bxm1vbU8EcqW8ulQIRjbI2djsQdByIknRzVLkVczUIvOB4vX3sLxuJtS71Q3nHxqB6iq
 NrfBMmnSeaTajH03Y0dI4QCw4yADoBNMCCUZ6Xj8d4jaK8a9by+jy9TlL8rg3QQt+JFzm6/YKsv
 N6m1Bu6sBloMkR78/0Q==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33ebcf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Es2dbmlq2MXA_sE65LsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TKD5juzuKMHDUsIih2IjCVkToLs8taF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113773-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:sarat.addepalli@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pavan.m@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA9846A0528

On Thu, Jun 18, 2026 at 06:17:00PM +0530, Sarat Addepalli wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
>  1 file changed, 7 insertions(+)

Please rebase on top of https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index bdc02260f902..fd1aa26e20f1 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -619,6 +619,13 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>  };
>  
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
> +	status = "okay";
> +};
> +
>  &lpass_rx_macro {
>  	status = "okay";
>  };

-- 
With best wishes
Dmitry

