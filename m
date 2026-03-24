Return-Path: <linux-arm-msm+bounces-99567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AnhEok3wml+aQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:04:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F96D303A90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09330318971C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C033E8686;
	Tue, 24 Mar 2026 06:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVV/KMQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJV6F2tp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F563E6DF6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334805; cv=none; b=tAthQ6nXk9w723+HgM1RvDeDzQmMcwYojrQW4a2y7VtuywkbnDBGFA5Gfp+C5M/G5EdHucSV4NaSfFXGwAtPA6+CjK7J3bD7yZXCB/pYgA/f6T51CH+464urWuaHqoZlLUlHavbARQrOBVb2nYLDQjWcX2kBaRhpE4EoBWtjYTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334805; c=relaxed/simple;
	bh=fGCpUkoKe978LSwf7t4/v0KFGU2faQE7KMH2bq/ZRGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkOBEdJrCWblna85sNlimLcTgI1WbEfHHR/HQ7vrUAyoHcqld39tW1+ouK88zctM2QNAK6CLVu8TYR12T0AEbhs5bnzAq8Ij9OctJ4NBQKphvTALkN5hK9N7b9j4rAhdZfQY0iyixJpw5Mhk1H8k4K7dcrndeVIOzZr9Y2rrn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVV/KMQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJV6F2tp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3e48v3634275
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NYuTseJFBUPqV9MEIUKhKhNN
	lm0Ex0p1HsOBprRiReE=; b=AVV/KMQDJnKFF5KVNFnoVjFeVHROhH3S4sc/NnJ0
	6knmGD1U5d094hnnMmq3oRQoq6KLXM0QnGuTLSZt/eV7FNeLrvb/381VTUMzsNNw
	N2kEYcDnCVOonF7irXFFZ+ZGsI+bYlHooI7L50NRFCjycfGy2HvN4MlsWjeMRRnP
	SGROw1y2i00Xy0A3CqoZcDPjbzCizRzh96a1brtDJlCWQ0vvwsWZcohNNMnaUaI3
	QTmhS4MBfyiCV6zWWelymswgbeyWQcWaJ10ULuT48zlush+awXzs3w5lKdhXK4+G
	v5jvAzm61OThRUoDxnJrZ/TV+aA0UdohUBtdEgB6RyXTvg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4ks3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:46:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354490889b6so23154310a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774334796; x=1774939596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYuTseJFBUPqV9MEIUKhKhNNlm0Ex0p1HsOBprRiReE=;
        b=KJV6F2tppoMYpbXqM296bUqHd+HHAvWZIuPBmJpxrAiTOS4JHrrsPdlgeOEQXL4ZCX
         28MQ9pf8926Cn02V0Bdy+ZmY/vPSEIRs89sljy29MLfAmWMtzoyzW2/Ul+z3PcH03R7F
         fV/4JVAKvYv90ZyQDTcchtvmpcy+J6JFtpkiRMuMuuxucQF1g3z0JKXpQk+Akkk008gF
         sT/n/iZHI9SY5FmX1k382yllpdpCRAPFvShZzLLNHOiyxVQq9TIUBM/p3FgQJQYg6tFA
         524fJ6TA7OK8E/mWadhUzVn38AYvUu9TeBAjMqFnqVB+2XtPQMiA4BOEsT7676wJOB1e
         Z6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334796; x=1774939596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYuTseJFBUPqV9MEIUKhKhNNlm0Ex0p1HsOBprRiReE=;
        b=YxjBHc9750lIrjJY8eK5kt8q6PeL5UHAt5CFAXTuj2iEUbctQX93jzG8PXlcTxdRPe
         denh3d+THeoZRaWi/jR7j8mK1RBPfydW1DGl1Yn4G2CQk90aGbflERBmaas8EMpye8kb
         NfwvvLsV9s7nnrkC9BkQ/v8P+9zQE6d/Rpr0X19bKjMTA0mImELTEKb+M37zqpdPukkP
         S6Oyms+UJejK8Y3TKuaoH0rhhs0p884Rv/957KVIi8Nj/Uz9dNE9fBOPTk7HpiFx3ZfW
         dZ0JWrr2SiONDo4Ypolb62wdx6rLENNVQ42C3mpQ/ZC8uitzILDU8ZlN0oo2k2foOwmI
         gdfw==
X-Forwarded-Encrypted: i=1; AJvYcCX69fsbQllQvQXtGvdzQRv1E8K/5Ev4MVfjqOUnQVm8PI4qdI2iz9Jk5+sOFyv7W8atMy9BSrFUR1WuATtD@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQ6uqQyJEIEVW5fuwOJTohAdhKZDLOQOyQ0heuauFHzb6Bl2C
	LoomGlvoa90/l1hI2X9FAWMBPPFD8zxi28Hg+eo/jYUNC5/GRWK3BzS6WrjydSrdlGq7f7fRojH
	5pk2RG3pch9age4wYRa8Y0on6PaRNjeJm1iKfZGmf48UVJ8dgP/T2UxF2yauqmCr5YX5P
X-Gm-Gg: ATEYQzzgqsdYwiztR7wKXgTAsoacKCrnsB3l40ufFL+bPXyWL4Y86Jq69J67TZL647K
	pdPRZO8MqWidC1UYJJWAoHdd6/2oq3HsS6umpbCzIyj3FFOWIXerKyrd2+060xe4TaiZXR/tzj7
	J1f7Gf9mnzuFk+UmIYqCcG5NFZ8KyxqgyIo9dx43fxusQZ85dloqFb7Ye7oWjvbKqAQb++lrWEc
	s/rXsz9Kuxxc55/n4MKRyaNsGzxlzYVM//tcxeSiyAr6tfnWGjpVWG4ed2cud3uZAWfCReKX+je
	yvdj40LquIQCUtmpE0ot1x4juirH7H+w6/HzUrQ8xJaGxkBlDuRXtLMCq6sMgNy5GRMqurPgmxa
	lN7iFlx8na0wHXNbq/D0xaPqtsLFA8Dec0SvepndBI6f3N9ah
X-Received: by 2002:a17:90a:d406:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35bd2d1f007mr12356202a91.23.1774334795694;
        Mon, 23 Mar 2026 23:46:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35bd2d1f007mr12356175a91.23.1774334795134;
        Mon, 23 Mar 2026 23:46:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0314a191sm1437792a91.10.2026.03.23.23.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:46:34 -0700 (PDT)
Date: Tue, 24 Mar 2026 12:16:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: Add EL2 overlay support
Message-ID: <20260324064629.ftmc5uc2463eeefu@hu-mojha-hyd.qualcomm.com>
References: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
 <177311073315.23763.2004308327563144008.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177311073315.23763.2004308327563144008.b4-ty@kernel.org>
X-Proofpoint-GUID: 3HXsfEt6OxdEgic7HN247SKIioLXAhZ3
X-Proofpoint-ORIG-GUID: 3HXsfEt6OxdEgic7HN247SKIioLXAhZ3
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c2334c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BaCGQVPK2KNeOlgyhCAA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA1MyBTYWx0ZWRfX5irfowmgYwUr
 ompD80Zchzgv1SsXnLcnBg+NwR1TgQU0s6AaFe/KJNMFvw3QLnkdncFYXfcKqPrJ7ikc2S7vIRt
 gO6vyCkD70cTzq285IpTRNwx10n5Vtf24Xu482dRIyXZhm5vL8WvHvfZUahpa+w7mABTKGPDlG+
 ATG6sqRkh3hbYXw1ccSBm4DeBR66QDGd107IzbTlhPl7itOXvVOfGfGE2J9N/NvrWXmssfNkeSj
 F+PbXas1MTt88ctlko84S8FXQpG7c9EFtf98rDJwsvEJJmQzozewzVHjmEiuKeSkb4uK4DP72th
 NZt/ubLhO+4zh68wGKwMds0KdlRd16hEt8oSZ0Sol6MBP3QfflvIw8oXM4gqG2YKfu+4OSgRRnC
 l8FXclyBUmdChf3aFJvEh1rs/NbFuijRMPdEzWOvnQnEgeQaNC22cdBJGlK+oBNgfMeZ/N/wBQQ
 ZF2+gsYxa9L/46MZDxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240053
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99567-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F96D303A90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 09:45:41PM -0500, Bjorn Andersson wrote:
> 
> On Tue, 27 Jan 2026 17:13:47 +0530, Mukesh Ojha wrote:
> > We have recently added initial EL2 overlay support for Lemans and there
> > it was not disabling zap-shader as GPU changes were not available. Lets
> > disables the zap-shader there. And in the similar lines add support for
> > Monaco and Talos SoC variants as well which support EL2 configuration.
> > 
> > Talos GPU changes are not merged so its overlay file has dependency
> > on https://lore.kernel.org/lkml/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com/#t
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] arm64: dts: qcom: lemans: disable zap-shader for EL2 configuration
>       commit: b3e0db9d8ec0fbb7367313d888b1bc3cc32cdffc
> [2/3] arm64: dts: qcom: monaco: Add EL2 overlay
>       commit: a3e3203d04e6d25bbd2ee678d82b833af53461a8
> [3/3] arm64: dts: qcom: talos: Add EL2 overlay
>       (no commit info)

Looks like Talos one did not get picked, will you picking below for 7.1 ?

https://lore.kernel.org/lkml/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com/#t

-Mukesh

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
-Mukesh Ojha

