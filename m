Return-Path: <linux-arm-msm+bounces-116899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aJ7CHUfPS2q/agEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:52:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C6712D74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:52:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NEa4xGkT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Az03moNA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116899-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116899-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF5A836E4AFA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BF43A75A3;
	Mon,  6 Jul 2026 14:31:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57FC38238A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348260; cv=none; b=G1vRkyW3FSqRt0IHjwouPXaHi/cmd3iJZz+EyG4A1inSV7EaM44bM+DMg4Ak9gnzb74oCup1gbSLnkaVzY1yHrymRTkrMtrtEhEGemz6YYgZOtENE8p6lr2/YNCl/ztqlUgNhl6Us2GsQE0TQPXWI/FqoB/3mT4dPdEraA0cOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348260; c=relaxed/simple;
	bh=fGRZgfyktIZa6nrYdXwMCIRk9/GC2qvnAOqfTU1xNHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAiIPWTpFH+52Ee0zW1rnNEp/t6xmshy7uVNAY5IzjggQziq+x8YjJKrgpesZj+nAn29iu33cjjhEP+qbu0cQztOSBrzmVoyiF+8SuVXHP9cIO8nfTvS70HxDPcpv5p9MiGCSIQ1TbxkL3tiXMzxo2ZouPfC/T5iaYFXfuwrdTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEa4xGkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Az03moNA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEEpW828294
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JpepJLkzvQaByyLi6MquWEF5
	0NdS/L+HXTIG51Tw96U=; b=NEa4xGkT6mSsqJwhQ9wLqgGYqP1vW16YD8GPj3pO
	h3iNRSc9B99d6b3jwLn14x0Gqd0gLGskcr5CJCP0JREJtH+SNEk4yLny8OhTNZES
	jo9FHROizhB55urhSGEoBgdFBLyTNw+EWJUY9XLOFQ0Ddbf0qqXF812RXTOtgWT5
	TkBbfwoNBBWM1tWDqfq9KHaMs8ATVg8/yCK+/4Qr08fE07CGp8ORscUuq8P3fIbx
	cAO+W00EbmCFSPku4oOZGVxrq+f0zBZf4lDkrmRy1hxUhVLbWfkeOu4QaI27Xblt
	qU6MQzQtdaBBw/fiHetv/eKW/fGYw9vefKag1gSFXKqhzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r151e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:30:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e663c29f2so320875385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348256; x=1783953056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpepJLkzvQaByyLi6MquWEF50NdS/L+HXTIG51Tw96U=;
        b=Az03moNAmwWIHXmUQhWPYxkjU8jAvNLC63hiv6noQrfeGrNBd//wfkvNnC58QykEzO
         BW4+tuRLvWE/V2xOVs8HFkAK6aXvgDuMlVlISaRAGEkd+oqjNTU41+mxcL0f86tYr73l
         Ry0CQM7q88av/Htune+dxhbuEku6d2xORn8PlEoqQG6cYR6cL75xkpuafM/I9qzM/T1g
         Dp2/FSUZH8ZrN2do6VryxLzfct9G3JyDekFYRqV4j10aH9RdA2plFBlJWNXhKryxgoZx
         1MOvO74Wsxt4vyDLzkatgF5FvbJNolcf2EEFRmz4waxrPoo0CKyUuapfiazfT1S9trYv
         XvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348256; x=1783953056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpepJLkzvQaByyLi6MquWEF50NdS/L+HXTIG51Tw96U=;
        b=g/94u8eQoslXo3yWmsQF2djWEaE/GKb1I2L7R1lIIyWj4hAdlqHDgKs9OVtnKG30gD
         uA35rQr3Jofq2WgCWh/2jBvamErPQ5wou8xGlM5eIbmyuW0AR2O9Q7Psb0maH5muT9Bo
         fMykBawgBiPUV0nPMUo9jzQgkUI327m81LpLM17pzjKe+lrfWcOr8qyGSF4ovJViHux9
         awfeYh+CWwu/p/xYtPlVRf64XC7pqv6q4S0qcNrbad743/RbF0CSgvwZZipwR2PfDwgK
         0NCRq/n06hpIYrdbXsIx5pI6fyG+0LsNb1cdJGz2ds3xj+4DeHVS0LMKA83Xe0fDX8or
         9Etg==
X-Forwarded-Encrypted: i=1; AHgh+RqYdO+7jkt9LQQVMIRXCHOqMtB9ILS1hXbvT1PCahZ6MOIqMMneuO1ak+DsC/YlKoROBQjzP1UhnCyX6Y6v@vger.kernel.org
X-Gm-Message-State: AOJu0YzH5RSOB8+UeydNtWjmp/q1r+NfpdMi7LpO8ZbCXMWSrhruOzG5
	YVxhJgWuFfKtzMZtrTiedaL8d204OKdupzSacLMC2y9NJiauMzjp/FsIDvTcjk7l7zk1CN6jDVI
	iFizafi1zmMSuUMNzbKthnEMsdik0TOHa8evoYG4T2US+PXoLrYvZODcpofzBrUfM6n1c
X-Gm-Gg: AfdE7ckffqIMIQK/iaALh3MXdqOzVhNlqjZgWlQjCdPss8teXDljmYGeK6gKKglkp79
	ST0zOaSK5RdJ7MK7Rb2sjV91Ma7gOocWiWgxBuGGG01AXLOcR1UJl3MPsn60hMxR/YOPt5euvUp
	SjgindhouJd6ROXwhfEELrI3Ka09gVT/yk3QNk1k22t5TIoOkgGVsppqkZXbkX3GJtcwnBr536C
	q3L+IGaWn1ejeV4tDDL091TFwAJh9r7uXYpQul35B2xzUo0U8hUYJ5SCARhhQ9sxVM096qYeKUv
	yxXkOaZDvL5LX5m2oESgUtT1+hKGKhW46N2FBYpa2R0FROjbolb+kIcYX/36yH1aZ6MhuVpoPNO
	xJOSad7m7kfKORJ5b8F2yZlXUMpAJtA/bfhbbSDdhpakLgs8V3+7l/J8RmI6hxPkaSdBcYcz5/V
	BaSUTvXkOKsOfLFjyvE3tCAC4s
X-Received: by 2002:a05:620a:6082:b0:92e:61f7:5687 with SMTP id af79cd13be357-92e8b539407mr1781231085a.29.1783348256045;
        Mon, 06 Jul 2026 07:30:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6082:b0:92e:61f7:5687 with SMTP id af79cd13be357-92e8b539407mr1781219485a.29.1783348255265;
        Mon, 06 Jul 2026 07:30:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae640cbsm21084991fa.36.2026.07.06.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:30:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Message-ID: <vruo2ekiffrvxhx663fryuvdot3gnixacjrw3gxt3pviqobzqc@llnjkakx65gw>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfX5kcVK0XU8Y9R
 QMC8dCVkRSKL3kYMiacCt9ajFukNHWrsZkt5RdpXVHFl0G3H6ujWfN11jdldqI1oYy0T2Cz3Fzw
 fQ2jTKu/D9YEA2u5rjz9+KGZtHuMmjxtzXMHDWEmTaXz/LAFGhx545FAnQfbbx23tli6KepTb/p
 4ZVaSNyptBs4MVArtz99tHVM2NPUNktzaxNLQkLAKSF2iQCwixioTHhMFGUNaHmlWsjFyEI2JsD
 phkLJqJnYh4SfUeIE2yr9Rv+1HVr7catBfvLOvfwinj7Q4ZEooMEDCUGb/GkMdR2O1AcMHl19ZV
 7k2ddUBWmdX19gzG9yFWg1/toZ4bSj1i7i8HtQouCUxidE7Jnn/jfKtjUcnK3OM4pLVsOUAucXo
 /GKbstt21Ytwen/0ZgebDkehDlVm7Sa9ghWyqlp3NP9o1SUliX7J4DT21Au7w14tMFTvFuEGpGj
 Dg8N4OXCKpPXUMulJtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfX9m2m5FTToc+7
 Zg4uZWlyPrmZMwVNfV8geK7N4kdVw5wfVbDXXjAtKCNtOCCRqdI2Ikqt/h56b7J1vQpd2Kwj3qo
 7Xz+00atWjqtBulFEBHteNnB//3fjJg=
X-Proofpoint-GUID: cKpNU4GEfusSVkyYzl93N_iFVXSSJKeV
X-Proofpoint-ORIG-GUID: cKpNU4GEfusSVkyYzl93N_iFVXSSJKeV
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bbc20 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5eIueRZCLR0BMlXBp3gA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060147
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-116899-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[llnjkakx65gw:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C36C6712D74

On Mon, Jul 06, 2026 at 06:01:08PM +0530, Rakesh Kota wrote:
> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> constraints in qrb2210 DTS files to use microvolt instead of
> microamp.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
With or without the break:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

