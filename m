Return-Path: <linux-arm-msm+bounces-113407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F9cCKSxCMWpifgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:31:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1168F591
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:31:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TmhlvSa1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EZriYYX1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113407-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113407-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 436F8302C86E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B91332EC8;
	Tue, 16 Jun 2026 12:30:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3914715B998
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:30:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613049; cv=none; b=UFK6X37P+2OaRdxHZlDqbpuTfITjreXQTcBo3rOdrknQxkrTeD3n3M1W1sfym6cQVgWNlgXvJiD4AjbiLqpUrBaXZuvhXtISSSUbMZnYFCXWRKlTkQh4Q301C+r3SFIe+HSGUJjbRAu7jjBzNHDlyfdf47uOCdjEfDUvEkwaKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613049; c=relaxed/simple;
	bh=4C4mx4yhK/9O8g9uOz1/BcR20UST1jOXccEF0NCmjD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLSFGZ+eQKXXjtOrtl89WDXbabznK1GUEkSRZagOlVxi97xdSr1CRF5I+b49CJdEdoABxxavPKi4wd+JqixKThtC7AuX2Nqi9PMUWGtpl0JidVaJZoe3X1WI5zp1a4+w+3XHMn9iy3+UCR471oSdSlykuw+NqlhOAnJcre1ua8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmhlvSa1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZriYYX1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1RA3256272
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f19SLqAgEJbQFZmj9Orm3CkK
	Ctys9ra3vEbJzX5dQTs=; b=TmhlvSa11GRSLpJhI8UDm3kB6awbqzfruwyUPsL6
	8SAj5G8ABY6cYxvSvFrY9Nf+duQc8TQDMu+ksIba/F91gnQrjZOSKM1AtyCvxoeJ
	VVkJpJZL5WBM9/qN8pBF61qKgoVorsHYKMPX8afFTUQqSSYI3u+JRQf7Yfd/mKTF
	PsGZXx+3TsDGGYHOSPG/Ndhl8rV7aFF9LyOaR6yvWJRce82qgidl2Dz44qAS5Dzr
	4sQ773OGoh03kCz3TTSskyzGqdyx92gmEPDzkc68m2v/ocSs3e9esI7GuMBwDW92
	tfF4PI5qps/RuXC2NOQ4zkfvDeyNs/nxa59n7xjplB40jQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9qec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:30:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842211d6e48so5432194b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781613046; x=1782217846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f19SLqAgEJbQFZmj9Orm3CkKCtys9ra3vEbJzX5dQTs=;
        b=EZriYYX1BTx3nPjz9PWB6o8siQZbATUawy3or7UkW5fTC7rMxE8IzOnl7muqbSsQg2
         LfcXbNyTSNxnpy1vmtktQGjQI5IqpF3XrFc8b0oDV0V/BB4BI98HocUBiATTpmCZkv+y
         V34UCunXPjVQL/kP3xaSiREQmkExThkRfEecSZ1kVvLrBgBTRqLZm0ecrNimF1jnBMUL
         iiy/Oq6NemG6zrfsrJlNJUpriyXYUPUyNGe8aBpUe0VZH8eSfGqTLWa/jJKwJHPDcBts
         y1+3/2+nF+yvv4LnzCn9DCIJzAZ4zz91rqyd6XUJIhEeTrTCCaMlGs3uQCRgj+KP+RtX
         hUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613046; x=1782217846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f19SLqAgEJbQFZmj9Orm3CkKCtys9ra3vEbJzX5dQTs=;
        b=D09S5YxZvg6GUmA3SglwQ25ohyNVtTNaATIRTypmcR8T0PRUaS5PsokVCQVtsood46
         Hig1sryY14/msI0oOA+q6xdlWswEgpmZSd8/3bKJ10Y28dJN/Sl0VlJW6GLBS3uHF9ti
         yuMZKgQWslQYHYAA3wfs8Z7Us1sGiletjAOy/5fJExSolqrNMaTANFxCeFP5PUB0M0Ag
         jRLf0PwghlgJAKS89zdq1Z96T+azmd1WyhH0oK2gcf25nWKobdF1Vgmgc2RW3fSoQCIm
         Z1cE+ybOF7PCJvqz0eX8ie1p1nMZIO5lc/e9q/0YawA+C0G+KcLOrkSa/Yq+6HPZ0mS6
         HTLA==
X-Forwarded-Encrypted: i=1; AFNElJ8BX0p3BKuWkECL31X5b4vRajMwJH2K6vXd29B2lRCVv2g73QXQ+4MjCOBQNjTZNDTOdObHBtvMCJ0ND6mJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgC19ICnnkkqj4BQ0IqYDsIIlf2iynII1qm3cbM9lYvNg3nX5w
	h6/6AEeIHXI5AxFiQQXNDKyxx7n/AL368ATERRuUrz1DlboN4FbQndjaYeR/RW8aCD/ddwR4kZv
	4U6/BQ3U8nKrLUQd67lWZYmxWwZsk6MZN74hBPI2Epc/tPyuEn1qafiTp1CACHpACPdZo
X-Gm-Gg: Acq92OEnhBUR970vxOSDgorkCeOFHRTDeTrauKVScKh6l/Kd5f4CKYfSPocD+rLVGmL
	TZsOJZGrDg0yqlrtWnNcWKphOAT8pMNpBZh7zMAsGKXmB2tIKxX2dDQVbRRirFV9BTnI/YqROLW
	hOfg9p+EA6WK9fr2Md/aQ2JqQM6aFLrKN2RwlYgwUMxd+PV6x29ScfGc8qCHezI5D6WKuHLZXI6
	bPuGrybf4GN+fKI0m4GuTjuM9qi60eVbXkJWurMBjODpruHjFKElEZq8+2qJRMHpf5vnP5nl0/Y
	mb7kRT9qHzVgt7RhGaTN5gMWVE4w2nXta98j1bxUt9h1KhSBnMHNu364HmNLlD5gES7MX/HDjRo
	J2cDsYg938ILD+Fg9fg1CKyRMxHsnFbX3gb8cMVP2g/e9ytxpTEDnkN2I
X-Received: by 2002:a05:6a00:3981:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-845153db80bmr3338422b3a.2.1781613045635;
        Tue, 16 Jun 2026 05:30:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:3981:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-845153db80bmr3338356b3a.2.1781613044983;
        Tue, 16 Jun 2026 05:30:44 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm11767563b3a.45.2026.06.16.05.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:30:43 -0700 (PDT)
Date: Tue, 16 Jun 2026 18:00:36 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sarthak.garg@oss.qualcomm.com, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
Message-ID: <ajFB7FVlqp3qCA0i@hu-mchunara-hyd.qualcomm.com>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <20260227105055.2364348-3-monish.chunara@oss.qualcomm.com>
 <2ra2apfephjl2au6wel25gbxoxyvohf2ysq4yzaufp3xb7mtoi@g5p6asbk2fqe>
 <aaWdjuqvhpJb1oSX@hu-mchunara-hyd.qualcomm.com>
 <3aaf273a-c7da-4740-a68a-49f5d2f5309f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aaf273a-c7da-4740-a68a-49f5d2f5309f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX36d1WeassTag
 9R6s0LzH+5tzCJ5iGa3k5097KHQVV+KRCPwXOaqH10/yLXzr47kSuDvcUBK6l1FELUkU7HiBb2U
 o1q4oCFfuTuUO4zZnklS1JiEMsg1K1Q=
X-Proofpoint-GUID: nDVRxEK_GTaqjdQzEH3BiIFZ4EA3PbjW
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a3141f7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=M70xRs4N6LTtd3t2Oi4A:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: nDVRxEK_GTaqjdQzEH3BiIFZ4EA3PbjW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX1N9i590gOanD
 3IyNiAAvlA/FD7URh+cEfz5N6dMX9fkHaE9H5PdA2IkJxdqdsTJ1kcrR9sCsMh4RzWFGU6oZ611
 oby3Aa7++N9W58TfPWbk3SbqBianHzK9RGrJcvAWcivC3LTm/+gqMpRZheeE8y+NpA0ESLe25EF
 MUaMXMB4zoYeSW2D3C4OxQ7AFQo/MP9TdeNKez4xaeYhPuOtDDKrxoLpOvSwBhpE88hXs5Vlt/r
 CHyATilItXnuIZd19Ykr7gWJYCkLBKub4Bc1h6dx2tPKRCnqSNw1O9WzigaPzFfRy185TtLueTs
 woKGAsJd2WXiJDT45vUSw/qhs4PqnNS5Z85v9dvYsDGo6CRVBtY0QeIf+oWfJTgigA7qmrA0DTJ
 7O+K/RX6Kkov/44khWmEJA7V2DfFZQQomEA45w8G8qwoqJDZfoF/fmvpqQiCjt+3E4D7tLVNglu
 30G1CsuiJ08mRAi7p3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113407-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mchunara-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFC1168F591

On Mon, Mar 23, 2026 at 03:15:09PM +0100, Konrad Dybcio wrote:
> On 3/2/26 3:24 PM, Monish Chunara wrote:
> > On Fri, Feb 27, 2026 at 10:03:10PM +0200, Dmitry Baryshkov wrote:
> >> On Fri, Feb 27, 2026 at 04:20:54PM +0530, Monish Chunara wrote:
> >>> The monaco EVK board supports either eMMC or SD-card, but only one
> >>> can be active at a time.
> >>>
> >>> Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
> >>> to support SD Card for storage via a device tree overlay. This allows
> >>> eMMC support to be enabled through a separate overlay when required.
> >>>
> >>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/Makefile             |  4 ++
> >>>  .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
> >>>  2 files changed, 76 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >>> index 317af937d038..c86242a1631d 100644
> >>> --- a/arch/arm64/boot/dts/qcom/Makefile
> >>> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >>> @@ -46,6 +46,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> >>> +
> >>> +monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
> >>> +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
> >>> +
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> >>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> >>> new file mode 100644
> >>> index 000000000000..a0bc5c47d40b
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> >>> @@ -0,0 +1,72 @@
> >>> +// SPDX-License-Identifier: BSD-3-Clause
> >>> +/*
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +/plugin/;
> >>> +
> >>> +#include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +/ {
> >>> +        vmmc_sdc: regulator-dummy {
> >>
> >> No dummy regulators, please.
> > 
> > ACK, these will be renamed as per the schematic. Since these are direct supplies
> > on hardware, used fixed-regulator configuration.
> > 
> >>
> >>> +                compatible = "regulator-fixed";
> >>> +
> >>> +                regulator-name = "vmmc_sdc";
> >>> +                regulator-min-microvolt = <2950000>;
> >>> +                regulator-max-microvolt = <2950000>;
> >>> +        };
> >>> +
> >>> +        vreg_sdc: regulator-sdc {
> >>> +		compatible = "regulator-gpio";
> >>> +
> >>> +		regulator-name = "vreg_sdc";
> >>> +		regulator-type = "voltage";
> >>> +		regulator-min-microvolt = <1800000>;
> >>> +		regulator-max-microvolt = <2950000>;
> >>> +
> >>> +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
> >>> +		states = <1800000 1>, <2950000 0>;
> >>> +
> >>> +		startup-delay-us = <100>;
> >>> +        };
> >>> +};
> >>> +
> >>> +&sdhc_1 {
> >>> +	vmmc-supply = <&vmmc_sdc>;
> >>> +	vqmmc-supply = <&vreg_sdc>;
> >>> +
> >>> +	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
> >>> +	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
> >>> +	pinctrl-names = "default", "sleep";
> >>> +
> >>> +	cap-sd-highspeed;
> >>> +	no-1-8-v;
> >>> +
> >>> +	bus-width = <4>;
> >>> +	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
> >>> +	no-mmc;
> >>> +	no-sdio;
> >>> +
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> +&sdhc1_opp_table {
> >>
> >> Why? Is it specific to the device or to the chip? In the latter case,
> >> please define a separate table in the monaco.dtsi and switch to it here.
> >>
> > 
> > As per the previous review, it was suggested to use an existing table. But yes,
> > this is specific to the Host controller and the corresponding voltage corners on
> > the chip and can be defined as a separate entity for SD card use-case.
> 
> The SDC programming guide I have access to does not seem to have bene
> updated for any recent chips. Are you sure these different corners are
> *actually* valid? The clock-side documentation doesn't mention that
> 

There seems a gap in the clock documentation. This is being communicated to the
corresponding stakeholders. However, the corners mentioned are as per the
reference platform and will be updated in the subsequent series based on the
updates from the clock-plan PoC as required.

Regards,
Monish

