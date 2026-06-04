Return-Path: <linux-arm-msm+bounces-111214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /rhsDHR9IWpsHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:28:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6A64055A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:28:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bee+46aT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OWteJB5o;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111214-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111214-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7011730D40A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 13:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B467C477E4B;
	Thu,  4 Jun 2026 13:22:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799AB43DA4E
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 13:22:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579369; cv=none; b=Li8iD6VjQHWqt/hVInocMo+PKHbha2ZMEns4+3FXHQBus2IZg/9FSclAHSfjr6QakgqFh5ldJpnWwrWPJkAAzwLY0cO1iCxZZ0T8RllfSqIuxtlkLGpLYSt4TcetCn6Um0Jn5gNlIHB1InIoVTCqKjTAR+NJFw29QBr8Ie3Divk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579369; c=relaxed/simple;
	bh=mp4oqZktG8oHiXvxH1MbdJWP3s3UM3SrKCUR2gW7c5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hb19jxE+LayLTteNVd6SPUPJGHVYLB+SpBB3eZZfMI6TiXPCaz5GDCo5P0nx0fSI5HNLPVPDbSALCidEOYxdjcFHcLaFONjQto0jB7Xh9F0vmQuNH6ckmd+XPMclyDtqwgINeN3oljlKX70Qn1GDpoqnacMqhZ+KnfzwQgYgmmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bee+46aT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWteJB5o; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654CDWPr3222779
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 13:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0cPUcR58dasqpgjZO0SJrb2/
	PQ3ohFO4F+BZI7umGqk=; b=bee+46aT0YVD4x+qzKCAYR1nBxRsxzLy3WQh67pn
	3jYsalLdWPhzPD3AN4z81PN19CZwrSvl+ya96FIj1GW1LhZTwO5Dize8/DVmRc+f
	iqtPraj5sk8aPV3TpKnzER4fG2QEZqktWIt2k08yV91OPOiReZqZ0Shc5wEiqE3e
	nFnPlmlyNLUWRKM2519nv1zWNBX4dGClSRfxcb/7J/9GhDdWxXiLxcYZPzO8RIYp
	1NhKElqXBCm8PQ3kIZtcIvZheww66CgYLdq+QflrZ0a2PMxHX/kUP6Cso771IjnK
	fkzYEDzUj+WTFOP5r1LydlYPUic0EBLk1vmKhfFzlh4Wqg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek95u89cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:22:47 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59f0ad4461eso1126838e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780579366; x=1781184166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0cPUcR58dasqpgjZO0SJrb2/PQ3ohFO4F+BZI7umGqk=;
        b=OWteJB5o1p4gV85lkZZXFbKojB5CgjNL2D1MpElyy6Ro2VwY0rBlDMYBqcl8NXZJgK
         SFlZxbMkTWGSXu1FYamHlBlcLr0ImFQ+nCvxV0pCXl7s8UL+MwLhbgI3u14IS1P1gn1F
         Gs6WGA3rfZ1OJGRhoVsoCuu7nxg8yBiZbuzCmrNHOFB6sMdL/U+p1p9eYF3IP3nDyOcV
         FG1wk4k5u7HPRToiuaDxvtiBn/zmi1RdqNzg2M5p5HTp9aA+ot5QX/U71d9HLgFuPj1N
         RD3fvYMSlzp5ZXG2wbdohOxf1thv62Gz4pXPdyrVgEmS+dKiXAww1H4tlDOjZgRDZVQy
         TN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579366; x=1781184166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cPUcR58dasqpgjZO0SJrb2/PQ3ohFO4F+BZI7umGqk=;
        b=LI4LCEwmJMFhs83xUjgvBbK2jRtHt7+RqtNwBvN4B5OgfbyxyNU1Gk/WWlubKJBvPp
         PE9IZt/uGW6iLc/MyAruWa+Jh5E4TwjmekRaXs4oEFD0lHcH5oibERPrKavTn1Mr4sj+
         b4xtxtsC3LC+Zc+kg9SU8GBjJe5PXuVSoK8boEwoJuuqCk5cyPFKnrFtHQD94yEHFJ7i
         IcikuFGqpOPaOMuuOcVScu86Ch4FtonTMPHT1/D6ksrLafpQybWiABSazWlp3z0v2SYT
         1UHgYCqeIZYVnSJXuatNMMRN0xiKCqEFMWcDiNGn7amL5tYy8pl6NCapRI4e9X0OI3XK
         2chw==
X-Forwarded-Encrypted: i=1; AFNElJ9jBhKhkf7KKXl7LZcW2eD4ojP36BqZqSJ9MRARk0fJaEU+wtKxDRcBmENw9a9yod/pMUCXFjuRTYnG8cRd@vger.kernel.org
X-Gm-Message-State: AOJu0YwIoTmTCUyQ4wqjCkC6HXfYZ6KZnto83CKUrpw5s6PcNYFMmpje
	xRKKQKP1BpzhuzLShPAfiSodIQFcw62yfAftzUY1m46Dgqsb0/Wc0Dp3vbhiTkzpDAX7cOSH88J
	rI+mNfeF+8tN3cSUw7eDBDFGPbCHlF10JN+P3rgDTAhMkOZUIWjmUgb1/pLODIMnG0k5x
X-Gm-Gg: Acq92OFWrtvtk/kNxVMCNLXbqwaTEKg2W+TN43qSXWS9eXMEzVYCts1xqUTVJCkN7/Y
	W3iu/9+Al7H8fNdeMPZqW7kvtx8BulaEhqsk5RYej3CbrtMyvBfxakyOHhfjsVlY3pvLT8Nka2p
	XIbFGdsRwo4IykmZZVKalGbJSJS7CYsBrN3uKnMJuhpK/2C13zx/LgY1wQYlRcGhwyCYoZ3U8Cw
	ilBireNjNjbKJd8gtg1bIJDLe58JXlrH4eXyWKRBoqrNnVKM/4iSlaSr/6WUaabUk9dXTddgVQ4
	a79UIrsrtYX8sNV9/ahNIZ5MjNjPZoWCb2CFpyHE02ybxBvH5g/fwT0CBV+4sBkeyRIDTtSKoMG
	EzvAqr5EsudWJJG8peReYdwvNCXD+mzUZofcSAgV7vdEbtK781YgBlc6G77S3l3ISavOIwUbNp2
	ZnCaOcFri0HWKmHs31Fy712/yZ6Ip29X3NfTGedsND1nAD+g==
X-Received: by 2002:a05:6122:1d87:b0:56f:a329:6859 with SMTP id 71dfb90a1353d-5a6e61be6fcmr4683041e0c.7.1780579366437;
        Thu, 04 Jun 2026 06:22:46 -0700 (PDT)
X-Received: by 2002:a05:6122:1d87:b0:56f:a329:6859 with SMTP id 71dfb90a1353d-5a6e61be6fcmr4682973e0c.7.1780579365955;
        Thu, 04 Jun 2026 06:22:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac1esm1200902e87.54.2026.06.04.06.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:22:44 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:22:42 +0300
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
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: Shikra SD Card support
Message-ID: <hpvnpq2rx2axmtxmk2y6tddeo42ohvd4ae3z37lynzm5nug4vf@sg5ndaqfdlvh>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=at2CzyZV c=1 sm=1 tr=0 ts=6a217c27 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ymJGE50u7P9sh_QXW2EA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEzMCBTYWx0ZWRfX8WnL1VMlnd1D
 9SHzMFMeMQV95q9ofFuZ1OJPAtbXRMWJIxs41J/+aN3MoZHqwxkRFOLE/O/JrsRimb9mq34Jjye
 8/0FMsq/VWqxMhLpjPQrg3NhQP0CU7hWNZMcJn/OR/hmfhro3lGbqAYFBIb6lNxOiC2dlpJO+S0
 sCpV6YxVjd2wJJowZzrpFugnnKDF/JhzZ2o5Q4P7DdOx9XM41zUtpMO1/LBOV8pVVy1Z+Eri4O6
 aCQu+JuD0RCKMHLQELI2WT6J9OG4zbjAW15/BorudoBfi1Ay1aelzhv3HUf1ar5iEu+CN0W4ssw
 ln2AklUOvS31DdNomAaNDf+mq1rfHjKs8y75fiN6/6EPo4FOcmt7bAwSPjNXELWcctQaeuT9aTj
 57HVlE9WpzrSkl8uaMGTSfFw3SL9n6fs3Hf049C/usynQR/yyCNzvFwT2frnT6hwUjAOwCFvYR7
 oasggxP0LaxKTbUk6mA==
X-Proofpoint-GUID: Pc_0k_AH3IKoqIeXZ9DTfu_XHbZOiAKW
X-Proofpoint-ORIG-GUID: Pc_0k_AH3IKoqIeXZ9DTfu_XHbZOiAKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111214-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sg5ndaqfdlvh:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7ED6A64055A

On Thu, Jun 04, 2026 at 05:50:43PM +0530, Monish Chunara wrote:
> This series adds SD card support for the Shikra platform.
> 
> The first patch adds the SDHC2 controller node and the necessary pinctrl
> configurations to the base Shikra SoC dtsi. The second patch enables 
> this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
> the regulator supplies and the card detection GPIO.
> 
> Testing:
> - Validated on Shikra EVK variants.
> 
> This series depends on:
> - https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
> - https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/

And how does SDCC depend on TSENS or remote proc?

> - https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com/
> 
> Monish Chunara (2):
>   arm64: dts: qcom: Add SD Card support for Shikra SoC
>   arm64: dts: qcom: Enable SD card for Shikra EVK
> 
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 93 +++++++++++++++++++++
>  4 files changed, 147 insertions(+)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

