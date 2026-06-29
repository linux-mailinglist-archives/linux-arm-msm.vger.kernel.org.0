Return-Path: <linux-arm-msm+bounces-115032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wu9zJKtkQmrO6AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:27:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A13D6DA286
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:27:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mGoh1VNU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g4cLbmqI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115032-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115032-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4653F3093618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C3E3FF882;
	Mon, 29 Jun 2026 12:22:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DDB3FE66F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:22:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735779; cv=none; b=MLpKGAd2nG75bFNU613ZycwtGoB5Nb+oB+/JQELvTWD7tHbG1nulIPCFqQ0ABNhNaphZgT5m4LcRK0eAzHNRQ9fu+iL6a0Uw0dkmwna4648Zqh0uY4UuIeY8q9kScrIGVsM2yQS9bKIhRtgrQgUSXxeGNy/9qvhqBGoljDjAiPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735779; c=relaxed/simple;
	bh=d3kPTL/o27f36RL21IlbpjGa5HabCtkaGY34Tq9vSME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG0QPBTmc7evTbqqSYnsp9albvNJ36MKIKE5P00PIvoBfBcHE4Hxg02oL08E+0+7fXmOhOU0/COJYkrC7bNWybpKAGxcMtWkvAWStrHs9NuiLydl2R7gGKv6FCYSr22LBTC8Bvblb2PlpZXJJuOqkkDvAr80HhlFswh+UG611H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGoh1VNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4cLbmqI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATB3U2647650
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhAIrontoHtX+mCgbAveeunVaI9Z5rtDTYLhj5w3S00=; b=mGoh1VNUjtunSpcq
	aupOluZVCgr4BMkiDhf9UpZfGr2UDY3sGaTFquzTtcWOTADh0izwOjaPB965Wzj4
	Lth05W5zPkDK5Io8zldPkBpQEF6GaHEfUeD3q4GTHL7M0W1MvVNES8Hiwe56z8Zx
	VPpBytw5lOZtFlNjn1X7edka/pTzyhGGszhdxTgJZNd8m/oi5gsrFmhfh092EeC6
	JWtDvZ0CI+9eAuG4pKdYIo8xrVwIVtm+iLB3IhrebCJSzxnjPbTJg0NM8CoWFbGV
	eZermrH+fLyhXCyouby5DItMabRrIInMBE63EUiTyS+f04nTDGX9XZFwAlh0YYv4
	uDdO1A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjh7vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:22:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30cb2bcbf7cso2831511eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735776; x=1783340576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhAIrontoHtX+mCgbAveeunVaI9Z5rtDTYLhj5w3S00=;
        b=g4cLbmqIuj/qoXPrUyukt7qGyvIlm4teMLlDxe5g+fOTtBwS21An4HyQQlGupxaEU7
         PlMBMkTzSrdR0DpejhG132sDI6mahNykXOiUIvKxz57z6WZ8936aPaA2pl2BBGJ0mxjf
         JStKRem6jnpTRYmJNbgm3yIA+V1xFulwE9jCdRhFefP9YJvoW7aVvodESFjscMApm/YY
         Ieue6bpRIKsNi4yAJhAUu4JK+OxlRMclX06as+lJfErZPyYyWcrL5RsgwnIbC8u/u8KO
         x9yKnYuKXxG1VMqL1JA1/iPrxB4cGtUgIs3/p2QfT5Gmvbg05MavzAL1nGC6iPuwhwS3
         7WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735776; x=1783340576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DhAIrontoHtX+mCgbAveeunVaI9Z5rtDTYLhj5w3S00=;
        b=B5wwz9NvmqRu0m17PJD2286OTL7cEMIPc7dlAZ47vmjOCwVGHeuELeiLnQC3ssUMPd
         i2Aak6U50LEN+/poSUBLhzqZMjdAyB7f0uZPKRW7NJOir7XpfxsOVVgEqr0fquMO7tRq
         sAIeacQlB7TnnCO2jaUlk8PNeqaV4d98FPFwEZcAOqYCYsYcb7WDhfd5bfdEkjTp4FBx
         Fh1OEbbBfyGukAyPHLNYbOAkAbzRsDNxZ5Wt/ZxnyFzy4wFeEa5yPRQu7H+Rmsq8I8F1
         3VmEyQ+aFZ+CJBSicWA6ArRYdpGpwm23zEdLLc15HiDpzgrKY8HtTPzhy0XexykxNPrd
         BLAw==
X-Forwarded-Encrypted: i=1; AHgh+Rqufen8fQjdiDdeJcoQUnQgsBxUWaNrm0awMQGmHyb04Xsaz1O4IAzc1+EsTf0yBHEr8JQe0/FdCD4vz0z7@vger.kernel.org
X-Gm-Message-State: AOJu0YwEbiG09oHHW+sNTkmsSp/OFVaI7IDa8z2tu5WLQN/+ZesDptuJ
	yZNDlbuzTcnm48KWmseVz4339F+XCRC2jhaSxfsPwPvJoCiIW3Qeo/Smmi5/A2aMiVGvFawjp2T
	Fn3Zh1kzm/rsgaUpxyvgsdsuz3RY2b1X35wHB+z2S3H4ZU/B5o8Es9nd400H7sfevJjrc
X-Gm-Gg: AfdE7cnA3mgViZGUU8iqq4yqenFhVPs+wBLJMQVuDGVpDHVPr305Q+RQ5oPfJG0PoBy
	BVJ1CgmpZjLMnrOZsFzvK8t3V/9l2TUHObedXYKPWVOEv1DQynCgSaPjwax1e2s5lJvB8brm/dm
	62rzHsaU6NK4yXMpe2SNGwJU+NnFp/I60IqzWTf6q2rumB870EotECmUARloSdins4CMie/kLL2
	h2vAtSaG5xQvMINYi8yEjZRSV+jcYbYXX0OeR7zPJpn/F8EWnZ6CcFzLVv9CYo5NkDLjpgF5byw
	+9INFCHzUR6qktNknkbgBklVOBsMwf961KKAcMrcBBi+DvJPPtKUCUSrpTRBcvYb+qa1Lo0sj33
	TokqJaB4hc+O8qP/VZi2dxB+rsh9rBIxdl0l2IA==
X-Received: by 2002:a05:7300:818d:b0:304:e587:5063 with SMTP id 5a478bee46e88-30edd1f0caemr273083eec.12.1782735775638;
        Mon, 29 Jun 2026 05:22:55 -0700 (PDT)
X-Received: by 2002:a05:7300:818d:b0:304:e587:5063 with SMTP id 5a478bee46e88-30edd1f0caemr273068eec.12.1782735774959;
        Mon, 29 Jun 2026 05:22:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52eed6sm43647598eec.9.2026.06.29.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:22:54 -0700 (PDT)
Date: Mon, 29 Jun 2026 17:52:48 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260629122248.yb5fe7rifdoowpfl@hu-mojha-hyd.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
 <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
X-Proofpoint-GUID: rqN5XNsWZZpDCB9p8JwWEkQlPHMxXZVM
X-Proofpoint-ORIG-GUID: rqN5XNsWZZpDCB9p8JwWEkQlPHMxXZVM
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4263a0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=enEazo_1d4iZabAa-cIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX492uTSJwQ/f4
 xnYJKxaV1DZ0CN7l9eaIZcjHSnoKLS4oikkG9a5Rekax+vgnESWvHGYLpcV12GZYk3/6kxPsEn4
 SVRTyWsJo2i61f/mcA7clMsA4hfLHnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX5SElrjbSOU1d
 TjJXCQnNMIPgxCuKZIB/VtVJmuzMZP64squiGzuDsML9zuPNCEtkcQkzMZqfVDaoZ4I1xVkTVuL
 vojeyvgmJaiE3m0n7IAbbWkHtIZqvgV6zUemXBn6lEgPtEnKfznH+Df9SJrDweVshsxJBQrvbXD
 LNiGmisc2Dls7Sb0O2v3PxRXlYA8dMPd/860tsUjWg4zcF/L+asI5jI7gNJHrH8TfuIGGwOvwic
 Kz+y+4nufc+5rMzrFE4l9XCD8B6grSIxIEJGvHqIBRuyO9Elii7LNPmcD6e7Gd0zig6NbMJDdKG
 E3Yft+0tq4Dek0i0AvO5vNZMDc1ivdoYoADHUSMLTFr0b0FQWC1IHXrEIQ+Vx/LVPj9f4G6qDDy
 dwumhsjX+jM/g3hpAU/Qm5wygo3Yrb4cAmSZHWm6wOxENcTtP7cxEopcF33XI5iex2DjsyoKVDu
 NI8AWMcz7AEmEusG8VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115032-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A13D6DA286

On Mon, Jun 29, 2026 at 01:36:34PM +0200, Konrad Dybcio wrote:
> On 6/25/26 3:14 AM, Miaoqing Pan wrote:
> > 
> > 
> > On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
> >> All the existing variants Kodiak boards are using Gunyah hypervisor
> >> which means that, so far, Linux-based OS could only boot in EL1 on those
> >> devices.  However, it is possible for us to boot Linux at EL2 on these
> >> devices [1].
> 
> [...]
> 
> > Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
> > I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.
> 
> Is there a good reason non-chrome devices never defined that region in
> the first place?

This region is needed by WPSS and non-Chrome (Gunyah) has IOMMU
control, maps it for WPSS during boot up while Linux at EL2 needs
to map it for WPSS in Gunyah's absence.

> 
> My guess-understanding is that UEFI allocates a region for it on
> Qualcomm platforms already, and if unspecified, we reserve memory
> again, wherever the allocator decides to
> 
> is that roughly right?
> 
> Konrad

-- 
-Mukesh Ojha

