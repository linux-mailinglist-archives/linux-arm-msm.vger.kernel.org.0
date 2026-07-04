Return-Path: <linux-arm-msm+bounces-116449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7qsgK3BcSGq4pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 03:05:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C268370652F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 03:05:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WgueMXTG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J63GSWbr;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116449-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116449-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11A10301C5E7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 01:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C1123C516;
	Sat,  4 Jul 2026 01:05:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F388238171
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 01:05:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783127130; cv=none; b=LAcSyShZchjjVckz5ydya2ZSjD9kuMfNyVbFKe+ef4OwPxobWOtR3AnANIN+mcab4Dc12i8FAjpmt3kCfQifB5gzooy30yv5GLs17sgwVc6YDNbGLC1l2TlBcwM96/uQCh0cL1kl2qYWHlkoGpqakm/NOuXpS0tJTickzUG2sSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783127130; c=relaxed/simple;
	bh=WJyxaBpX2zjY6RaLrRpXx2JiEGOGIv2hCrEYJa39Alo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAMkoDy4pl9l/rDb9x585W5zDig5Z2L97wNkP35RmhC5cffhk8ihk2RAwlEZ1rn84W5s6+ATJG5DcS5V8yTJcn9bvDa/VMgQuo0jFTrX/ySMdppG1pt9/N85h2cDCm8oPYgbQa47x82jeuVJRTVy16dwAJ336FErxgfSK1SN80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgueMXTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J63GSWbr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZY31029409
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 01:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HQHqm5tNyCbaHoWcsSBdNY/1
	TDQXlOjTSmbwpQfiP7k=; b=WgueMXTGozvpU7v94KWuVEQ2Kku0e/rzvmzX6EJU
	G8qnGNnww5ghh1yqsrEdqyzWSmLdZhlX/qVEUCIb4HHUezM7+M920T/vfTxnYC3x
	bEdglf4aDdYmuKMIttWRPWU1Am+wp8EXVG9RkZmWNPr3N0e0Hy92pitW8sUQABj2
	apDIJZTOieq8frbUb7aHoswxLhvufHvSn4KB+lrmSXhNgSuPi1IOzIJdtpQQzRbR
	D/4nfABKthVXbv96NOq4kyzJvQEUiBGYVTUXEd2UDoUP18lBCPvQ96cYwnWaldPg
	ILC+IA4fS06EVFPNB05LMLO0rjQddGtTVQmH3B0YvxZ+yQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcm4yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 01:05:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso742741a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 18:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783127126; x=1783731926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HQHqm5tNyCbaHoWcsSBdNY/1TDQXlOjTSmbwpQfiP7k=;
        b=J63GSWbrMx4PtIINOn1VmkSyIbfoiXzis4Dq5se1ZcME0JbrKD+OIB+k5G5IqVAs9R
         CcerFHEGyDG4a3RbxQPjUkGXJtDkcl6ZokMYbvfIZMhgc0ouAfHC0zfBoBhSL+nIx2E0
         hgO6AZBuiTjTPahSuubB6URI8uSptG9LxBbHryZJC/tTZ9ZhMKcszZ7atDPInVj3infp
         rWUyYpMApq05achJTnh2OzLY7sn2A+RrFyG8uar6qe2vJZzdqJdy3X5TUQesgecrKO8C
         125E2H+FBzLQwj2wWFd2QIRTKo4uQdBsc/Wsm0JM2v+12LuEy8qMzLbSdk/IR/6veHPZ
         311g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783127126; x=1783731926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQHqm5tNyCbaHoWcsSBdNY/1TDQXlOjTSmbwpQfiP7k=;
        b=fnRjJ6r/C7we29t+Fn9/uKAunxit2sOFEH5nh4aX3ypjDvO6+0yN28j4T8wdhTmWEb
         0NTnbPNJCu3Rva2ucXL4xAcGR7JleGa3Z4QUrqNm5MG4kLj609toR3ZXaOc4rF7K5pWk
         8g/Y1KasOYwQphzV5jkpxrp1r0rH2Ptvp8mLeJWpPRKuZr0ZSMV+vOlRd3zprELbSe7D
         5Szydz9t3l/zft/6MjjBUzpPEr+BzUQ1pocc7w0fbJDEJu815+a5w8b9Y3yy7G/dFEVD
         Szol34k9UxTqX8WdNwf78EAlrilxmOwvC1Ab4Ju7FRmjqmW1oUxqRCgfduUrdY89pOHJ
         6vYA==
X-Forwarded-Encrypted: i=1; AFNElJ+2/FI9RlzFMvwpFS+9XKKGFfqtfgl73ZIY88drpfC/Cmqb+52jH0N/5GKI5xMSE61AX2bjwAh1Wy9wj6Pl@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5IPoKsNQSaChTkE8BfTlKRBksrZxYjp5toMvstCBYszAtwcA
	NfNL2bf2UMkSlyAELevG73Mci7f051tTCUTmvODFWvUNvzLM2S9O/H1MXkTkfBCmWER1cJ3xZab
	DYxBtrZlQWx2m2JdR2UauTlA2MyCGIzRdmFJDNiRUCa8+/rZdrjv+Z4COJfEGly2bKYSI
X-Gm-Gg: AfdE7ck1jDtwZ9YI/2iVJB/uq1kfvFtZjzF1WUyDwk2ijzgh65NoslWQ3zWHtFJZTB2
	iDioNABOgHaHbmMOB1vghKv4hhmT7xTld60OFPjatfjeTbszkUQqSpk76W3qbiaHb17daG1S4bj
	brs2hzwUb9t+ve0GnZM1d7wJR0B+4uG0ca0sCaexRGPArp4R+27X/ZjKzkRdLEtRVZz8MQ3y8vr
	QAEHNKDBm1LvzcnRmPt2TCYSTlzwwOe/GtugO7aKEmfJB+/LPwY/GtrMpI54kzUaZgNmOIOT4eL
	2afBlmhPTq0ul6R9vf8MAoGmI01Hlv3qJEFzpsqdXwYPuP1tXjPlmHLPkLUBFkNRMJfSRALKPfS
	PCsqke7fizcRo/rgQXRHm4bfbAW0grPV5SqJZ9+aNupbL+2Tc2GLkkg==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr1734709637.15.1783127125959;
        Fri, 03 Jul 2026 18:05:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr1734676637.15.1783127125513;
        Fri, 03 Jul 2026 18:05:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm40190952c88.9.2026.07.03.18.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 18:05:25 -0700 (PDT)
Date: Sat, 4 Jul 2026 09:05:18 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for Nord
 SoC series
Message-ID: <akhcTp1MyjGnhXav@QCOM-aGQu4IUr3Y>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
 <65467777-27eb-4b8e-bb36-ace91ad27e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65467777-27eb-4b8e-bb36-ace91ad27e0a@oss.qualcomm.com>
X-Proofpoint-GUID: CtDFxQtzmJYjCXs6IoCZtE1HL1E3dW_Y
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a485c57 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=C5FfMpQ73vxss7MKwB8A:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: CtDFxQtzmJYjCXs6IoCZtE1HL1E3dW_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwNyBTYWx0ZWRfX3R9VVhT2OY3a
 VuSTO147kBpMEGIySWnyJkIrA6cyPVRRIohG6iTS6biLqGT5NZK4dDkDaaHR4qN345tpWLQU0Wy
 6CuTGcDqSkaWwQ0X8qjyaoegC3SmbqWcWPE+pFpo0i9lbgJvc9YwQ+MNMz2bxM+ISBnfN3oMp66
 CQvmoDLI15zN4GTI+r705dNugCZFllmuE9eJU2XJNQme/3+rKLMjzvCg8J0ubCgdPA+DZx59e9z
 +5NudXCZAM3wjPln5CuI49PuYu9k0UToFI/s/JQ4Tx/t4Q7Eo8hyHQKcwH3s0EI4zvSBx9wszKh
 46gA0tlPZbQRhSGBUvpyBzsqmCcZwxJNAGVLxkjmQ2aTTHSYArE7PEtWgqbFvMK0bleYI7mdN0F
 uGWEuOcC9AAbMi0S8tX4QFCUhpnghG8luvFzsBmabzHP46/2SnOUm6TP+X0FgLpMUX2nS/ZMmWA
 V7naYBchbBR8N1VEB7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwNyBTYWx0ZWRfX19ISOmQf6vlE
 VjLp++R3GK9Hkw/UbReXU1R8XN+oN3XgRKCYMnZq6s81BKUQCwC0ACgVWE0hJuaCkAAgIn51E+F
 OBlqb5oeA11zh9yefNAtyBW9UlRxK70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040007
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116449-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C268370652F

On Tue, Jun 16, 2026 at 12:57:42PM +0200, Konrad Dybcio wrote:
> On 5/26/26 7:12 AM, Shawn Guo wrote:
> > Add base device tree include (nord.dtsi) for the Nord SoC series
> > describing the core hardware components:
> > 
> >  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
> >    power management and CPU/cluster idle states
> >  - ARM GICv3 interrupt controller with ITS
> >  - TLMM GPIO/pinctrl controller
> >  - 8 TSENS thermal sensors with thermal zones
> >  - 3 APPS SMMU-500 instances
> >  - 3 QUPv3 GENI SE QUP blocks
> >  - PDP SCMI channel and mailbox
> >  - Watchdog, TRNG and TCSR
> >  - Reserved memory, CMD-DB and firmware SCM
> >  - PSCI and architected timers
> 
> [...]
> 
> > +		dump_mem: mem-dump-region {
> > +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> 
> off-by-1?

Yes. We have the same thing in sdm845.dtsi and sm8750.dtsi. Unless you
think that missing the last byte is functionally problematic, I would
rather be consistent with the established pattern in the tree.

> 
> [...]
> 
> > +		intc: interrupt-controller@17000000 {
> > +			compatible = "arm,gic-v3";
> > +			reg = <0x0 0x17000000 0x0 0x10000>,     /* GICD */
> > +			      <0x0 0x17080000 0x0 0x480000>;    /* GICR * 18 */
> 
> Please drop these comments

Sure!

> Otherwise looks alright
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thank you for the review, Konrad!

Shawn

