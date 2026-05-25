Return-Path: <linux-arm-msm+bounces-109594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNH0DJ8MFGr6JAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:47:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D40515C7FED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434E43006B16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988473E1CEB;
	Mon, 25 May 2026 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqvbC2Zt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UH3L8lDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328453A6B68
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698843; cv=none; b=QjRhr8tVK6CU2XareWUw0Rbj5YwoPU4qKNE1N+dxsZxxKA15k29P9OIomH7pMNNGnjTWO4JAE+VsJGS/Hf2iPsboceV4z+4dva02aozzJQjCTiEZ5/xkWdTIb0lVOvwyEw5koRBv0NyZ2jnWruP4rlVY7Ls9XoPV68V5cpufiAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698843; c=relaxed/simple;
	bh=mqWAyYzTeltqWLp895g+IfBXkNn7FhOKUuWOA2N2Tos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUPriMHUIeFl0z1s82fXfo1ZSoD1UtX/TcLNjAu0H79C/KcDnOwJz6BhOpUiTR2/2nDsAMftFX//c/FcNFuI1Y1+HLAFsQRJaPZjJH43GrRctWrxBY+i2Vx7zSl3LsRS0FM8psJjOiFfMBT0RmA8swSRhBxuvCdmmg4F7ioeO5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqvbC2Zt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UH3L8lDm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7FskQ419389
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Py2ZcyFPpkOLHS6KnXYGCXDC
	p49nDJlbDOBEgzr1gzU=; b=WqvbC2ZtdZQJuLvdYPPdfxrZgJDoZrQS+2h0LIEe
	guw46OFkQbV8zMTPR89uZbGM7nMmrGLPT9uEctg1Al48xinpd6MatA387X8Bb+q/
	LiHJTP35H47hty0zUSb0qJRcRckpsUrcgD/MExDAaGBScCiPyFIy3keAtuDidWC0
	NqPJxO0EkbFdJHiqHa+JmPKyLJoETKYyvWWDWBkAhwII8/RR2CkHfY3rZzD6yscB
	4QNSQwxovf5+ajSS4Fqg6jqgHErnQZaHG3Jpb/GgYE+gRc/to0ZgteGChRxmpn52
	NG/gjZXXisyfB4ongtJOsSIYbQVi5us2UQKCKLqazkHRgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386p2gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:47:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5165d10e036so161112361cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698840; x=1780303640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Py2ZcyFPpkOLHS6KnXYGCXDCp49nDJlbDOBEgzr1gzU=;
        b=UH3L8lDmBT/EbhKqLFgXTFxZyf1lOiH3NBEXixU1RqvcQa3MaVSPkuCHy+VeKQYD9J
         /xYpvlWlvJpUDaukclNDvBYVIXwGEBksV7li3T3xV7qSS71baHhMw9knuk0iYIHzMxu0
         6HxqsWJ4L+fB4V0RxJEWpubW/K3M0Ky7AihdlP2q4yXMI0bf9Zzc2lLYops16lmT94JE
         XozAXF/hGBJOQAew22Wy2JOExCj4b5a8rpHbdYdw6FGozmg+49cEC6ikJmCesR0Nc+3p
         5M1zFgdGfHD0WHjcPfuklDZwbEmIDu/3mK7cYbtPIwSwhXZm9kAkgW7Afok9LImiFsVH
         LU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698840; x=1780303640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Py2ZcyFPpkOLHS6KnXYGCXDCp49nDJlbDOBEgzr1gzU=;
        b=FyymJZGkvXNAc5Sq4QhPeoSWpu6QUln3f1+fFnOW5gTQP7aGn6kpVzSBTJtPmG59cr
         6unK1zf/+MJUbh4qP2VjeFRqJ7FXpSFT8IskmPzupU0vKQGhQk0pSDKoMpKL0jOrdYRw
         o8186DpSlEgt/VDVMUz/LzcjzPJP/d+D4PrsK9BP+bjG9nfUUkn6gD5DKs3OAlXnYlDC
         RoOr9zbHTcexRbB6Ia07y9qaF6exH6Eykvqt3RgceZza21lP8srhJB2EPwHKZQ1E8bWL
         FCPzjBYKzn0/EOdOw+jYBis/B8aiNCsNvnmj9YuW6k2TOVCMtzlABvw1ejOdhNdTUuZs
         r1wQ==
X-Forwarded-Encrypted: i=1; AFNElJ8N8EO/8GDmYi7HnX962KgfdlnXQXcqQtsPuCvtu3bm9dOvGGOUWwjQ4xLDmlitJ3Su941sEZ0mxodieAWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwA0gTq3AnsNpxcsD5uhZXMBUv+U8BhvehVCWCgJpWArIBHoCdc
	Bm7wFLV+TFEACTjYfnWd7+ypPb+M6RpyOtxgEm2OcI1y7PKhH+Inb6+EWdL7FSlAr3uYhkInGkZ
	tMMe2T914b21mXaNbWG0ZncjYchsKO2FF7vZKkssQx1vzuxqhVSZMI3g+I5D+0KF9kP6U
X-Gm-Gg: Acq92OEXKO74tHt09QagqL2itddeG4Gdx9teqkDannLChw3wePB1GidslYJRvK6fJyq
	v5ZDct8wjO4cegdiC3pN9qauz+Uf+u9iaPzAxNqSHtlhcVskzBE3QA8ziQvZlUmcOnZKDdHNTvI
	/QWLBMPdQB2kSruLs59WZb6tOCAA1swR0gJ0nm7q3rMvNYCdlU4Wzyp70KqyyanNFwLoz07rzAT
	WsHlznQ4LJH20CVHCMJcJOtdCPNPw3nJXbGu9yAc9BPnilM7xCbRGSpEXUqq3d78JBq3GoPkrsv
	+wQYin2HXPG4JbO1dbEgJHZBuv61xaX/Kjri151TPAbMVBhuoXLu3HNYTvijg979WS2nPvPHqLx
	gbEnbvw+7HwUwO79zulGriTP+60NsbuRTUtYdRlc9qzCmvGvMOTJGLT6n2FbMs4JgPddLMNHFp6
	SJ6Hs0nVRxn6x7WnAiM8odnJ2VOVX2w16hue8=
X-Received: by 2002:ac8:7f8a:0:b0:516:889b:ac9b with SMTP id d75a77b69052e-516d4368673mr177873181cf.39.1779698840303;
        Mon, 25 May 2026 01:47:20 -0700 (PDT)
X-Received: by 2002:ac8:7f8a:0:b0:516:889b:ac9b with SMTP id d75a77b69052e-516d4368673mr177872931cf.39.1779698839834;
        Mon, 25 May 2026 01:47:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2ee1asm22206721fa.34.2026.05.25.01.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:47:18 -0700 (PDT)
Date: Mon, 25 May 2026 11:47:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add qcrypto node support
Message-ID: <algvollvttjlu4qpawi3gnhwponwml6pts47ebmcvrjvlryl3a@qjq5ildo4qsm>
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
 <8dfa0670-7605-497b-9d53-db9b4a8a3d8d@oss.qualcomm.com>
 <57c26520-42dd-4159-bd2a-69874945cbbe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57c26520-42dd-4159-bd2a-69874945cbbe@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TFLjQY0LxsghusivEUlc_RIgbtWqEBS3
X-Proofpoint-GUID: TFLjQY0LxsghusivEUlc_RIgbtWqEBS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4OSBTYWx0ZWRfXz8vVby+1mYAM
 OzUXXieHvk1bXoRoB9eyB8vAMY43QJtMAtgKneN/S378zg/2W3+nCLtdTK1AOmrdofM4WlMBR53
 Si4mNwOIKIxIZ6TnhMbWd5OVHvTNHTLD/Ib6RRfnmpic1xRtgsPUCS0ZGkIW5rTXB31YxQzhTug
 exyzGRPxC8uH++UORm9o+Ka1RnKPjgVHtKMwW/aggjtK1NVJfexTCYJQ8+zF3UGpzDWMzJ8v/ru
 +k+cLrFbfGtZQWoXS53zHBBzkdaL5e6mN5OTMWjlCmIrqvu073DX4lYonPjK9sfpIoPdI0hGRmw
 dRc/wN8TZtCZo0rh4eK+mds0JxLrxCYYQdyhvyCxoB9FVCuiCFoaWFsmOZmzy2U2i0k3HqXQtqO
 g0Dv3u3UVjKvsmC03PmgRkHQ+ysqQVkBupXSLMWUrum598W2b3Jl9gLKaHV4hRTF8vnhAiz5bJ9
 sP4dW95hDsIdDhv+wCw==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a140c98 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=icl0gEoJmf2k9FGJNiIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250089
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-109594-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D40515C7FED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 02:15:45PM +0530, Kuldeep Singh wrote:
> On 15-05-2026 15:58, Konrad Dybcio wrote:
> > On 5/14/26 9:23 PM, Kuldeep Singh wrote:
> >> Add qcrypto and cryptobam support for shikra target.
> >>
> >> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> >> index 262c488add1e..dbac0e901d6e 100644
> >> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> >> @@ -541,6 +541,41 @@ config_noc: interconnect@1900000 {
> >>  			#interconnect-cells = <2>;
> >>  		};
> >>  
> >> +		cryptobam: dma-controller@1b04000 {
> >> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> >> +			reg = <0x0 0x01b04000 0x0 0x24000>;
> >> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> >> +			#dma-cells = <1>;
> >> +			iommus = <&apps_smmu 0x84 0x0011>,
> >> +				 <&apps_smmu 0x86 0x0011>,
> >> +				 <&apps_smmu 0x92 0x0>,
> > 
> >> +				 <&apps_smmu 0x94 0x0011>,
> >> +				 <&apps_smmu 0x96 0x0011>,
> > 
> > These two entries are logically the same (SID & ~mask) as the first two,
> > does it still work if you remove them?
> 
> Yes, resulting sid is same for 84/94 and 86/92.
> Basically, the resulting sid could be same, it's an optimization which
> smmu is doing which can result in same SMR(Stream matching register)
> routing 2 different sid to same context bank.
> So, 2 sid can be used even though resulting sid remains same.
> 
> Also, DT usually dictates what hw capabilities are supported and hence,
> captured all apps entries here to match the hardware description.
> 
> I hope this answers your query.

It doesn't. Can we drop them?

> > 
> > 
> >> +				 <&apps_smmu 0x98 0x0001>,
> >> +				 <&apps_smmu 0x9F 0x0>;
> > 
> > Let's keep lowercase hex
> Sure, will update in next rev.
> Please note, I'll be clubbing patches together in one series as
> suggested by krzysztof and fix this too that time.
> 
> -- 
> Regards
> Kuldeep
> 

-- 
With best wishes
Dmitry

