Return-Path: <linux-arm-msm+bounces-101295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMZwCpzyzGknYAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:25:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6FB37870F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F24B300F109
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5813E277B;
	Wed,  1 Apr 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWOBsNYw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2fK4gxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998303E1D15
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038654; cv=none; b=iEP9Fe+ItS3+lL0Shf4SH3u0LOAJldbuNA2Gmh2U5rwOcnkYKR9ihiBehPo+hFSq/fqd0LTrlWkKumujEtB6tpkb8ET52FmcbqmDhcXHwMJscQfcD3+nKtK6CvQVqnqQWUxXUIoyaibh8V0LXxXrdynzuuYZ5JZXZ5m9xPbUtGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038654; c=relaxed/simple;
	bh=DEYocxncDAcATk2w+s2H2eB3AWq4kyjXnOqtkGx12Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qY7oTG3AOJ1mf+eERs0Dpyau3mnDOjXkN0Ss9CoWk63CWjbb+FzAkFj2kH/L1ENAPBNMkULLmzXw0fmFlMNzjMQfK+NnXYaMSU6i+8dDDRk7dnRi6D1jxW+eehgwfBVMWwP93SjgutBRmX2EyHMAvqOt4AJadqt+rT79Jx96h9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWOBsNYw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2fK4gxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317EqUi4106747
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZrEHXpdsAUJdgyqXUpeWecTZRtz5/SYnsoDlrdt2yg=; b=OWOBsNYwyqFutoD3
	Z9ArQxqvuc13m5ebGZFvxBQm6Un4zNBzE2JpD1RY/6S+EIviMQUcJU1r6deUkjkh
	kLBZs8VyIQ5QIEs/fLWfSrs4s7HJRFHmtrczmCN8l5gMMLIDW9JdHbxuCgTLwJcA
	VVP9ReZyKLf2RW9unAIY1Ci1byA/vFJKZJdehD33tSJd53zgagMVBuTuDPJ9z5y+
	UM1JFTOSVtD+FrMkzBDk1CZh+kRHOMup+Lm/7qrzjTEJrncItJ2oTbndAl/lRBuf
	K9y6ZNnhDTht/b3egW57zm0vmRESwWxbvTWSjRMxtxhuiI/nk/A2b+Auinyagds5
	3LRB8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt90s92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:17:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d1d81dad37so13511285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038649; x=1775643449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZrEHXpdsAUJdgyqXUpeWecTZRtz5/SYnsoDlrdt2yg=;
        b=I2fK4gxIdoC6VT13WDpD/DpInjOjJ+1v0L1kKKW6S1uTL9m0Z7cWCHjAZz3suT1De2
         gdIVp7Wvs+d1jDOk4vXi8RE1zbmIs6opsojp35YC4Ps78M3BrJTFs9OsDHi4DV4JQNmB
         GU8aBtwycr0L0crWZPZlYc4ADN2ta+50rBupUl8A7vcZdRIrWjFsuQBI426fXKDmBOzB
         a3hSUXVm1X3x212hh1YyhCriKaKyfEQPpg+bDsRwNne3kyV1uONDTivGdrScDNCsKKLk
         wFLRKR5ou9g+Wdc5FdBaC5/2f15hncdkG1HW3wyVpGdB0IkGjjCI1E7vNWKzfETv3xbz
         /RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038649; x=1775643449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZrEHXpdsAUJdgyqXUpeWecTZRtz5/SYnsoDlrdt2yg=;
        b=mg7MjA+zMPdN49+rR4X+qhrlT5stsTBBPC9quBoVesQhIltQR0c7v/w/mhpmuxfwQK
         IgzLE2lxF+DG8esmcbvLCvrmX4ksTSh8vo7mRH4QKBoQt0v1LXZSAFIID+I/+7U0+gJ6
         VZztChftlDhqXZ+ZGAxILHZZPT+rxFiUceY8BV9R06iR1NfHnwEsIgraOENALAuY0k3M
         GifXdkqZYiHK6mBzZVArFvx4GX5x7HA/80yH3sCddyadFSLXhjGNSwwRIsdgvML9ohvg
         w4z5xdFco7Ms3Dy8fvRo8i6VO2Xr/w4Fm5XFq4zYRmjzoHhCAIcSo97MF3yjEjS6VqDF
         KGAg==
X-Gm-Message-State: AOJu0YzjrbQuvdTROdGNiSizQt8u6KTVcYU7PiQuST0kFYTi5rBZEJbI
	CE7dhsVSoWQEia/zE9BPBNHKny7xW53Nr4b14p1BhfN96OQt+DkdpSTXThMknH0W6TcrC7ELvS8
	eOJQi3Y01dCZ+xFcBTJVVkhCqmVtz+8Kq9hM6BJCtqVTwp7Y3tb8SOclbmdPdc18Tc3w4
X-Gm-Gg: ATEYQzzbriLiYsAMVss9mQ0bDLzr79rDKzC3HzCldPiTa1VtZt4H1rXozZ36v+4dO1E
	RzwSlgcGXhflI5fRUCBHCCvsCQhgLimxJd/UfFsZePkIttbIdMFxcHLOqPWoffHUipRzq+JIHpm
	Sh2gTNXq3VmStxNY74eHt1fY7SS0Lks0hqpEQSzw9hearD3/jhwbaFXwBx6bDie7/pWXc0bzGlU
	jdSmWU4/Zj8zJgecYcOBsHX4BZEbBhSj0stJ+SN/524eIuDlm3nOuvkOlJrVm6irM/GH3peJRpf
	AVJH99WMDqlb45REqezKafhvwzipCQ5DBN7Z3vAx6uRvL/MBZeHnAt8jQ8R02aQ+6e6GD0UJURS
	NUv8kUpBHOzqWAMb4ArtQnbrVOrsnLBPthxzYy81gdyl5HK0274MR/Of70mKXZGajAT/jUihU26
	lXu28=
X-Received: by 2002:a05:620a:44c4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8d1b5b8cf33mr323796785a.3.1775038649598;
        Wed, 01 Apr 2026 03:17:29 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8d1b5b8cf33mr323793685a.3.1775038649096;
        Wed, 01 Apr 2026 03:17:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c5b0f5c6dsm1303774a12.15.2026.04.01.03.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:17:28 -0700 (PDT)
Message-ID: <18ea1ce8-8d55-4fd9-bf13-28f59c1f43e8@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:17:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}:
 Reference memory region in fb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
 <20260331-judyln-dts-v7-15-fbbc4b7cc557@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-judyln-dts-v7-15-fbbc4b7cc557@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hRMvnu11EDObZNmuZWCwm14lXjI2zPxd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MyBTYWx0ZWRfX9jdKtWNTvMZw
 h5idQHbXA7/x8tVlp1rIE0gbN5+3evMTvdmrGOYEyKTn/ZhZTQt7cJfKBo0GotkFmeUpUQJa9JR
 GLePFQWjsv1Mv+f+dGbjCsl4XL/rhUqxkvnV/CnOQTg6JQubCEPVtXstg0V9vb+OqMbl9uxzVsT
 ekBcDgVw8Df67x9s2u9dQlnGeV4AFnkuHy5q96fhkJX7YIKSDSdODR4dJgnR3aA5/guLCywldsD
 40gLshiM/1YhHH/yA1Qc6r6M6SBb2e66fT6lC1k9nMu/s4V2Qo/v2qI6MkgEsC9mbEfHto+UJXJ
 kRh+nceGX+vgf2pLGBj58yB9xEGB+/9I2c62MiJzCXOyP33FZU7LfUkCgahQji//DE1PlyyAx+9
 dtwxuoHClS3Y4QHVIib3squmZv4HMHsTPw1IOO9nTHDRGQ5by49hkejIng2jdoGy14K17rAz6og
 XqjUCxYhdOMqZI0rwJQ==
X-Proofpoint-ORIG-GUID: hRMvnu11EDObZNmuZWCwm14lXjI2zPxd
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccf0ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Gbw9aFdXAAAA:8 a=fzFPyQH34aG_WpUDus4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101295-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:email,9d400000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[5.230.158.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D6FB37870F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 5:23 AM, Paul Sajna wrote:
> To prevent duplicating the framebuffer address and size point out the
> existing framebuffer memory region instead of specifying the address
> manually.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 85dc4468b6c4..86cf4eb44084 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -98,8 +98,7 @@ spss_mem: memory@99000000 {
>  			no-map;
>  		};
>  
> -		/* Framebuffer region */
> -		memory@9d400000 {
> +		framebuffer_mem: memory@9d400000 {
>  			reg = <0x0 0x9d400000 0x0 0x2400000>;
>  			no-map;
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index adf41aa0146a..83e392907244 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -16,7 +16,7 @@ / {
>  	chosen {
>  		framebuffer@9d400000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
> +			memory-region = <&framebuffer_mem>;

Because the node no longer has a 'reg' property, it must also be stripped
of its unit address

Konrad

