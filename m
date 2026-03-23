Return-Path: <linux-arm-msm+bounces-99172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBlUFeYNwWngQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:54:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D06472EF6C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6542301D542
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EED438838D;
	Mon, 23 Mar 2026 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRGYH6vM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIAhnSf+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B919995E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259525; cv=none; b=VuwElbgyVH53B1kRdYzYiBZrR/0PsOdFffKADncKzDRUc7abHQ8V4ZG5oZwTc1uXZjiKN3S/Mpn2sNPW/+p/BYcZPeA07PTTlf/4dZU04SeZaGLYTt8wXJe4YaOv0VgTSc0HMj4SIkIzcPYXqV+lDTP3YEsiTNiwDatfcfSmBng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259525; c=relaxed/simple;
	bh=u+fiRKSs7mydM8yN930ej8ZzTpTSshn5Wz9CK1mO/8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Im3a8b59b4C3IjuLxiRrCU28J1FANWvg5bN9yU89OFefIrJxNiQlnAUUTZj5gxJQmjPbbEPC6B+hQ8WVXOUdoMkGmrNJdUjpa99VMnKb12X6Ss7r5rMLtDiEHtLDXNdYuKLOF2tz/S/V7JRGF0bh7UCqRo5qFyAukKK4VzEHWMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRGYH6vM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIAhnSf+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tO0D2292005
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czqGELlgNYAFwz5UdyFPRfpwCWUsQK3FF2zUTXrhlPA=; b=fRGYH6vMgYbd/JqS
	N/kZtHL6RmiBpp5MF6kx407bXA9UKyq6NHc/kUtIGuyoQF2Y/rK/zV+p/3e/8KjQ
	lcOVMWqb+WFHkrZVpa9HxYxWIQrjcr+9suSONmFDVyV6ommV2LlvHhD6MJsFTl+u
	LOJZe54ac4D8mxcqPV7/SdTBRtMBh3f4OUJVpPxSBsLeGr+QVc68cEB3kyhxN/KJ
	8fjEzT6Q08onSoQGZ9pk5L4Ua9NoVBNrbqaHbcSZdXJ9Hw66rgFAuiqAdiY1JxLK
	mM411WXf/iGCRTxEolQgaRxuIQmvJrZCHtn3lHldSr+NY4t/CwS3fA92RHJ7A5TT
	mt7tmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70d9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:52:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8ea43d4eso232102085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259520; x=1774864320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czqGELlgNYAFwz5UdyFPRfpwCWUsQK3FF2zUTXrhlPA=;
        b=VIAhnSf+yb0PXuVnV6EfiGHApxSxiJqJG6kGtFgtFxtqMyJ+Kc6zYatPItOmp0kRJM
         wLbm4m4ZT2eZ3r+dJsvaGoy0GyzcjbN9KFhzTIDcCof8Bd0vH81Jti9RF42lwdHQiGXh
         lSlAmFEMpDvrXp7lApoWk7E5G8isKmh+3oVwYCDEbXAnLK61jvkQd01vVZc/wRD0QEI3
         LYIHnmXlHM74y3fBxLOH103bw92VcgOCLGu09KYkUk/6TVDnZPz0xocEhORPQLuFjzFP
         X6Ys7j/cB3rg34htzR3WfWf999exU2O4XItWWOFulvOgzWpb5Yk55aLAtmjJZLPsfkiG
         JbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259520; x=1774864320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czqGELlgNYAFwz5UdyFPRfpwCWUsQK3FF2zUTXrhlPA=;
        b=BL8iNW7RLpErloFL3060OFM9abKnYukckcmetZRQuYXtCxHmDErgJFuFcm6DbniiXd
         O6BCaD2cxvjiCA3+up7ggaJEsNaOteemMxG2/iMjtvou2AYTKfmj00KssLAbpUOs57SW
         mtjUYCXrkv87j79K+sSZ5UwjWJSUWBP/ykkjomTqOc3DADT3OIwmvlPbsLTMbGTmKZe8
         6AzStVe7TIf6ZZVty8Y1zquKpSmGFtJRgIfzc49GPD4OLzOf1XYZskSm3VuJUFWpF6rd
         wfLI8LSJytb1uHL9r7flY9Ygqa/z8Z3Lqcc5K5t23dFZTMD77VMy5uNt9o2E61iJje0m
         wRGw==
X-Gm-Message-State: AOJu0YzfNO/wETzXjZX4Sq7wEgLH6mCHnNHqsnu+bockgRP78Yr64EvQ
	8ey/fczAL4L8i+7mccodk96lN0IRm7IYdLObjpenNuW0ki0ddI8PPSpWU1scTrtRhy830fB5Mo8
	mUKRbTk1DxbNi/UMhsDWa18JpS8GrXwTIhVGYtm2eeiufndlIVvXXCOGRx/a/VG4lcKNL
X-Gm-Gg: ATEYQzybkZszTinIsEZJ8Gru5CoTKDGfjxgh9XzuYoJNVpO6ZmjD1D1rrsnbozQQ8ED
	G1c6m6Wm3QWgf0ADgRlpCSEyKx41LDm59ujvBvYTbAKsXZCCSj3uR1fKp0GR7oG9zDHUL4J5SJo
	fyGZU9AM56XPKTZIlvopbCcPIXXEpWeZiW/xq1pYsWFlbsKYg2IzyqqBsTgTQ6Az7SvNcULYmRO
	2gGaVcad8fkfQtdJNHR1IPvkFo71j+/KV9BGyp5CIitITYA4d84/crDJvzvik+/4YJIymHBUJ3X
	vnR0EQ8bbf34t1dGK+L7FtjBaVy7wQzO4TXZWf0O13cX+UCboG+VMPky0G1FkEu232/lMcTMbiq
	jT7So7bFGrCf3HjENzlKfOkKnTmqO27mRbVoUPgtMWRvpZNvjVYbCkxKPzM/pV44VTMw4ktPLUj
	GuljU=
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr139954831cf.3.1774259520540;
        Mon, 23 Mar 2026 02:52:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr139954671cf.3.1774259520101;
        Mon, 23 Mar 2026 02:52:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dff5sm468904766b.24.2026.03.23.02.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:51:59 -0700 (PDT)
Message-ID: <bd33bd53-2539-42ee-ba3c-4a544a61b621@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:51:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to
 2.5MiB
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
 <20260321-asteroids-v1-1-4b902901cb49@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321-asteroids-v1-1-4b902901cb49@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c10d41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=99d7ovULxnTXCptroH4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 4WERIDWPUUSYWJBF_qnrW2nEvdSbDVEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX3W/o1VvnHAcw
 De/l7n+A0/prp5FIuURsb66qfEMefCeJPCVO0gjmKpIV5NueKcsU14g1sLLpKEak0lUiXdeBVrv
 m8xsLGObfK7tyZmOw8yZKYRY92iKVRl2wMOG/Su6n9p0pc/0t1sOFLeihv9tQM0wy4MGnZkAsHf
 uQsOtNB667ScWjr3o2kjUe2ly8dqbPU86vMYfPq5LTswf+rw6CBSbP9jTmnCSb98dWHcyIiGsHv
 53zQyX28inqJRGl6fzkjYkHUgPU8gISKwknfqEoA2UrfBLYyXc4PPK8qzg0C1WF9b2x27tsISFC
 qM+G+LrCla/BLHRfa+LLewWgck/UHNyFTQZYah1Ty9HMOv36MN1M0SgUFpIM6oY561fUHvCv4en
 ZUPNibK6CA6oN+38HRFtnc+xk0JW6kXJQ9aGp9CJVdOwTH9vCKeg0C0gpXhSR89/45uVotCbPHg
 c5hg1m0DZA8m9muo8Rw==
X-Proofpoint-GUID: 4WERIDWPUUSYWJBF_qnrW2nEvdSbDVEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99172-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D06472EF6C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 6:00 PM, Alexander Koskovich wrote:
> The rmtfs_mem region is currently sized at 6MiB but the default for
> milos downstream is 2.5MiB. This causes remoteproc crashes on devices
> that expect the smaller size:
> 
> modem_ac.c:281:Access Control Error: Could not protect the region specified:Start:e1f00000 End:e2180000, PID:1
> 
> Reduce the default to 2.5MiB to match the QCOM downstream config, and
> override the size for FP6.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
>  arch/arm64/boot/dts/qcom/milos.dtsi              | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 52895dd9e4fa..c0981ab731c4 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -724,6 +724,10 @@ &remoteproc_wpss {
>  	status = "okay";
>  };
>  
> +&rmtfs_mem {
> +	reg = <0x0 0xe1f00000 0x0 0x600000>;

+Luca

Could you please confirm that this was intentional in the first place?

FWIW I see that volcano.dtsi indeed only requests 0x280_000 on a "clean"
Qualcomm tree

Konrad

