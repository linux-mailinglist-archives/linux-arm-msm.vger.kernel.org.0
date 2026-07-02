Return-Path: <linux-arm-msm+bounces-115981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rDfqBrNWRmpqRAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:16:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1896F76E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:16:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OgOePJyo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i+PBQ0o8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115981-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115981-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63227308AF94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACF747AF71;
	Thu,  2 Jul 2026 11:52:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D965442980A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:52:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993130; cv=none; b=RRnxf/8XpMgsOfKAyA+zuZ2Ei0nH9BEOztLLUZ04wHmzL4VZAMkN0bbryrgFGAYsPSoIJGOZLk90t2cPkyWX20QWdSGTcMmLbQk1pu9LT6jtnbhi2y2kkFYEwybcDBelSPcX9hlZ0KpnaVfocXas/A7/7S9BdoXWgUf7M0Ik+GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993130; c=relaxed/simple;
	bh=7pAg0jHYHuUcvs3UsZmIL/gUh1l1YnY4i3xBryoUv7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+BEc9xr/bpTLKLhhC1GQ8d6lpyIQ4ixxEuGIy/Km8BcCyIOaoou/5NQ+PP3ekqf/uq9Dkv8SiTugjp/dn0QfKjXreexwdXjePIpFYalO69kC9BsbXuwoU4nHtWWAzTRWIzcnDM9tq6btDbUyk3v+VpejzeWmR679BfON3gA0To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgOePJyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+PBQ0o8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629Kowt4116930
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 11:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tjHvOWDz75WdWM4Imt7TzKxF
	FuS5SqBe2+zuwdMJriE=; b=OgOePJyoMIZ/VDua4SiojQF2imHp7LP6Xtx8e6wl
	Ra+cKAhe3DSNmj5jNcaACAQWAmbu0QbnljDOh7bP++YTzl2I4jiirPcB4cyqBU7o
	Slg10JMNPBjPR7uA4F8AtedL1Ttbdgjf9YfzpQT3SBkK+9q/B6d6gSqBZR+FxnL6
	2hK2hXhRDJmQxbm1ogX9Ux7ayd5EKnuwi2wc7Qw1D5g2m9cY6THV8BbMDOnJHKJh
	CA53ewPkycYB1ukaMqfvYRzewGW4x5qKUKAV7Vm3mQAjo/1mQqFj9TXgAxwQZJv1
	sVMNwVjaf8GJks9hYqcQoyGBy9i1FHxoeaQgvn9oRFI7AQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bghvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:52:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd6f09f03aso1686091e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782993124; x=1783597924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjHvOWDz75WdWM4Imt7TzKxFFuS5SqBe2+zuwdMJriE=;
        b=i+PBQ0o8ea9yXSthi4iRTg/KQGQ5JsVptqlF2qSyMVb3AaeLkimWmzQRZypes9zUVn
         UDa9lYLlAYlDRhbJAtWt10uGr2GP8tDhQkAUejP21NDJAV09jP/B0O8FX3jmJg2IF+8j
         G93jugrx1BusDpQKhXILPxul9OF/cKT8MrDhYuOSRbmuagmLcKlhq1sOHxufUjmQAi8T
         4CnGL8RBNfreaO4Yg/BFhTx+K1MWYizCB9j+PByoR+AXs55+HQjdGi/v4d2Zuw4sgAHy
         w6MWD0roUEfExp6bgY/E+mg9mLUwSYCbtl/y67CpYtVn084v9xqIy7xrWgk1zWdv0hIv
         qafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993124; x=1783597924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjHvOWDz75WdWM4Imt7TzKxFFuS5SqBe2+zuwdMJriE=;
        b=OXwuFvqq8mRbQlva6kJjfbC86yLwi2hMXZXOKC6CTKF3F3R1L8gdB2oNowxtrZXSM6
         0OwZUMzvkUSOIHRQepOo/kDAY+2qAt4maf6+zbG566tlAZ2BOdS52j79H1AjYlsv1MJ8
         deYPBMCpjiExbu4U0uFgcSzknN2mHL3LDl69gt4zQZYTQEWX7HLVR8SCYWrAupdLHMjB
         9o07ydyRqsVGwY6qBb1unIrPSUjDQYVVw1zmjmbpxvq7dga8/CNOxvqGO5ZBjwyBRXNm
         4Nkl+lYEDY9i9+zQVIds1ZUHy4cqDv+vBPsiRyf8oocvbqrXugbLARO1d4NJUcHnNtMP
         OhmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXjFWDrFDrKmdZXNCgMHaL7U089G08J7qIDgY4Y/i1+Q75b+KfwWKuJ1JaVbuT0wh1nymd1M6cg64dSswB@vger.kernel.org
X-Gm-Message-State: AOJu0YxcbnMQH5B/ku/7rKrLCAeG/jakA67PNxtcI4VeEeNWOpD2H/vE
	vI0UK0IlT6zFVU4wLqX9YUi+fmZzQT5umlRteSUxWEMbvIhTYTcN11CtarRnnqfm5z0GGql3rM3
	YGkudctXz/7dBHpOALS8jJLMvRQPi1x4VUgFJSafxWbdP4Wr+u9F/0K7b8c4JP4WD/BOn
X-Gm-Gg: AfdE7clam0G2HbEKk7dv+HuOL/66l6crA6BXjjPklzTtTg9sp9HpMzvpN0PlsbVhiWt
	avNGq6121vRhhbQGA9fmTWgwniQqyrxA49/Zpv+KPX/xMt8yXGySRsOFRvahrZlyHMQNU26BslJ
	SjxMQogTr7Wwf93vHfyE3tckx46xv/aJCtyGsX4H4kQOIOAAoITH4t9oK11ugGi8EH0yzdfHfrc
	cOXXTlaXzYxBwgF+pYyIKIYD+4puLqIUxf/XivwWCRGhcfIX8XgZkJpwwSo3ZM1W6hDjstlAmCx
	SVL8aZAyOiHxFMdcKFxKz9ZQIYH5qeci9GH8OzEJ23X5FhvkvF9mh0HfnsMYl8ucUPVnuKT6Evs
	KItRGhIJCtkixKY1NMXpgZpvISZCfo0OBcQt2nqv5GdWIGnT0ib7MAWh1kkSpycMD/VYmHbkcDC
	o2JI2X/OjTqnPgtkScCw48qJmR
X-Received: by 2002:a05:6122:3786:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5bddf516321mr2558848e0c.2.1782993123750;
        Thu, 02 Jul 2026 04:52:03 -0700 (PDT)
X-Received: by 2002:a05:6122:3786:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5bddf516321mr2558835e0c.2.1782993123315;
        Thu, 02 Jul 2026 04:52:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89a1732sm628676e87.36.2026.07.02.04.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:52:02 -0700 (PDT)
Date: Thu, 2 Jul 2026 14:51:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Message-ID: <3jlopmdj36kj4vi2dbokclo2fhteydz7fa6isap5i753nnn2no@bvsklelcpogv>
References: <2qlpabzpyvjwd2siwkpcdcjq7geyzj5egu732dg775asn2wtbq@tcbj6r5ti2o5>
 <20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LHuS0kzMcJXiUXkTcQquzL6Af3yzFRkP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX6fhGXmwXXwua
 csPtsVE8aaCKNbUS4odSWz2yUrSDfdWlbb8qzvt6LLqTfW7Q4ISEsYyfzxNgNa/VVHzZpWl72s7
 aIq+uLhucA/IfNLkLSTgXJqTc+/BD9E=
X-Proofpoint-GUID: LHuS0kzMcJXiUXkTcQquzL6Af3yzFRkP
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a4650e4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cWqEqOhgNhVGA34jic0A:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfXxETebj1bF7gM
 hJRLoI5Z28kQpxZ/o7XWEt3yO8jyfyni++3o0IHNKbPHvDMqI6yNAlp0d0HGLUJs1PIdPkwJ4W1
 eaq6dsR59/TsrDb3/1bBbKgzd3A+Z7KcmSV1wcDXzlDW8uvz04EwdBiF6fr7H/RK4mhzPLPmV/x
 XhGtVCH+QgeY8YJ4fsgvVVh8kzU08RM0G1LQM0PnOjx7cfKr7oBJQDCOdNij4vg27CVcI3k95xN
 vxtnDcL3RCdueLcKc5NQm4WHQBudKExJGkzIzvqxyvCeyZtiQu3VB2QvucBUcQa4KBNHg5c7VqG
 8kHTHKbFA28EroYNqG7IybCJVofqesSZRxQCkae1O85o1MF9T9F4wi+KCr9XnkNroyx3zYzeT3o
 VxHHaWUeaUlwZxbkngqwxNPWPGaYu87eRNhY5zTSMfxxOVI+Wh0slU21gFdB0FVb2H/DE7fcyBV
 f3VLb5ursLDa0yWWl8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115981-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:sarat.addepalli@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C1896F76E4

On Thu, Jul 02, 2026 at 04:25:09PM +0530, Sarat Addepalli wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> The qcom,gsi-loader and memory-region properties are provided by
> kodiak.dtsi as part of the IPA property consolidation work, so only
> the board-specific firmware-name and status properties need to be set.
> 
> Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/
> 
> Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>

No empty lines between tags. Also please don't post new revisions of the
patches as replies to earlier series. Always start a new thread. It's
documented under Documentation/process/

> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
>  1 file changed, 5 insertions(+)

Missing changelog between patch iterations. Please fix it for the next
revision.

> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index bdc02260f902..d4f96bdd3a90 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -619,6 +619,11 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>  };
>  
> +&ipa {
> +	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
> +	status = "okay";

Empty line before the status property, please.

> +};
> +
>  &lpass_rx_macro {
>  	status = "okay";
>  };

-- 
With best wishes
Dmitry

