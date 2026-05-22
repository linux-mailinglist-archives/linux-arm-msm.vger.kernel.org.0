Return-Path: <linux-arm-msm+bounces-109270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEgbIPA9EGrzVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:28:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 799285B3011
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18E533078FDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF62C3D47DE;
	Fri, 22 May 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm2akx2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLhpnOqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69F3A6B6E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448399; cv=none; b=dA/6b0Vr9XFibMKQOOeXdIaKz/TXPJncFUkbV3Jxjvp1dtQZ8qGBZF6CNnW8vBdFDubHTREXcLCzscediFjJ8pex88k/aTGXfadJ4E6X5ir5TrviyIS0gk6H4VwjEFHC28tmRG8DDvaYW1Ebc9WEiWRBkHYxBZVSKWMazK1HQeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448399; c=relaxed/simple;
	bh=qqkzKz9aumxskViF/d3UgNpUMzUAq30H6/+d3NdJaw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEQUjbKQ/3D/sxjC/db7gJ5HUXPAeiNCQ616EhCsNMrX9+U76McXtac4F85u2IkFPbUtkKm/6MhEbNZ8o3TvP1ZBvlYdKDNmy1HPGAUo9bMsXdyApivrupE6uDQWXiu9GnqBcmvj2L0sUBExsG8aQ4gHzFsieKQ6I9yYIGmfHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm2akx2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLhpnOqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIjYJ1800770
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0n+tw6q3MR13TyJnhZFE+1mC3GQu1m49GgsGGRo5bP4=; b=Zm2akx2DVKO2e7fL
	5dM0Im6PFcR4m1TZMBbittFgKh7XGFpC+z18djKhD/Wg0Vno8jOurI7hEf/TdsNb
	i3occPY3mUPil1iChFJvWECiRQh4JnjzRQ2la8WHz1M1S5yzq6ZiSNt9o6cINa1d
	tCl3aNveuIOrtTJF+3uZ/0Ep+MzTeeLcy9cbCoJT2a66En+QzmMqknRhGhhOCpyN
	GriWgMBciI1AEI8hv9hj9zwTJ8WIMs9lMT112UyFnYyWo0V0BL4CO3zC08kTqYSb
	QwXzrci+UKjXk23rNIF6Cbd44ILmvWQoh7ozHaqsI7YStrRhwh5ulPHalDshMkR7
	txvsEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g05j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:13:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914aa01cc21so35295685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448396; x=1780053196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0n+tw6q3MR13TyJnhZFE+1mC3GQu1m49GgsGGRo5bP4=;
        b=VLhpnOqWeIWCL9I9Ry9Aa9L2cFnQQfum6zm3gzYrWhOAMo3L9DRjKkUwfmm7Wkg5ln
         hgOzHYHQ6Jcpz8IW66zWlZAFqrS/xlFnifI5Tk7gQelZLOPUZ+HlI/CPv71nPUlJWNfh
         6vOjFuc0+DSlm3kkurLYAxtk7RuOuvOW5vs4WxWitRzB6uWzUItfkQjhvU6aBjSGlusZ
         aVrSou6Ikv78AQ+ko4S6u9XZLMwXHth7fhpnrpDypnaWrRUMtplsTEWgAyAYTxR/UCob
         QWd4OQSkW1Xsayd0LEVZ9H7Gd2sUT2b7IaeZL/KiXBvMVoOtOy0WjMtyJ42fR1O1xAfx
         Mnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448396; x=1780053196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0n+tw6q3MR13TyJnhZFE+1mC3GQu1m49GgsGGRo5bP4=;
        b=bazG+9UM5GW1JtDTuJvhIkAioL4pxTis8dhd9ox43VxVEXMhZDvzmhf//xWIFODMwl
         omaZxnAWS3XUk8tH3IH6azqeNM06rhCUTx5FA+Un24apFEdaRid3eNTi8PgKE0OLwp5X
         egcontOXiuDp2PPdCHiOzmZgxRgCDqT1ybDVMVxbaHr7xERWPB3Stf2KHnq2lnSHM2Pn
         zUdCoB+6ttoEgeuKVEATMHPoNK3BYDEUNjHMs57AKgbWURuJfrxmsAxwdPiN9kny9h1V
         aEDA/IV+2SEWPGgpNByXOQcLv/0aQu+0ZN0ScZwn8C4h9XKGwbfhW5gLu7zdw3HGrvRy
         tTGQ==
X-Gm-Message-State: AOJu0YxwKqCL+sipTH93qYLZUz9U1lMEJnl9nxtSyy0seWgAW7jvDVg9
	ea0W/5+Amj+GfhvBOhrDdXs1QtuYmTYe0DJCR2C3GjsgQVd8mzp72IcZ2U7xHmgmUmuNb5sHjdG
	4mhE5pkPYaQomsBIlw/1RLFR6+S1sDj/dp0nTV40WtCFKlkP0tjU47eqJNG8FpGfAeMOs
X-Gm-Gg: Acq92OH/mSaH3j4t6DOYycTQx7OyLbsbLm0+JuI+OdY35uAEgaDysqElxb9CUrjxIyy
	WNH4Os7lhXeEZlgeQAC9u5Cfywk+IB7lmty+OYub2k2Ye3qmqdtA4qg9S9qQX4tuJ+D1DyuU1E5
	B+203+Z2b6kXiLumhiPerYXQFa7ySTVLXVE9VcBNV/FEMH9I8VxGSvQLweMoKwgrFpKLbIdOgsB
	3FdDUwNhkYkrsz04/mXFOoqcL52PQKJS0J3ULOsybKxbtNeBdA3jfuQD3Ve36LFk9aHTeJQA8bt
	Em8eS9kMRnu/zqTfo+nBIga50JB30y9wnE/6K2p824dj0AgbFBxHS/gPUNgMzf0cnrxYpmPuNXW
	gMqwW8C4rkc091nRQURW8zTXXsFSL2v6sbi3ylOgRR3bakT4uAwzNolSF
X-Received: by 2002:a05:620a:4109:b0:911:295d:59a1 with SMTP id af79cd13be357-914b49d8733mr300185585a.8.1779448396439;
        Fri, 22 May 2026 04:13:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:911:295d:59a1 with SMTP id af79cd13be357-914b49d8733mr300180685a.8.1779448395872;
        Fri, 22 May 2026 04:13:15 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ecec50sm42891266b.31.2026.05.22.04.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:13:15 -0700 (PDT)
Message-ID: <d0259627-bdda-4533-9051-a40546241e89@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:13:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on LPASS LPI SoCs
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
 <20260513140009.3841770-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513140009.3841770-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jrOJTdFZAuOc78z7QBX5CxmN8BA0klp9
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a103a4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4BbeL_lAFTVXvkP5OvYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: jrOJTdFZAuOc78z7QBX5CxmN8BA0klp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMiBTYWx0ZWRfXxlN58Lg/+Hiy
 m+yOfv5e2/3ztFjLFJQHCgZyPNXrLZlKi6y9w3pdN5Eb9dph3/LGBcRqxi2Pe/7lPHLKeLIpkv8
 E9Aj0pL+jUfRf4wParao4r1KUQUFmm7kiQzxCocZz4ojdShCFgKDMx9j0h6wWhbuvu0BikegoXj
 cQiM2d6Kq+FJD8O1mDTH0aVrLO2GNsdVA4HyfBsLeBpnQDXjUTZz+3AvpY2k5pdFgw9AdKtwjXl
 LpBDZM0RSCKUF5C/7lBrxRQIsW0c1FF7AF666mzT4GgkPDeilE/qvv3vcoaIIyzKNV0X1ygk/YH
 vDvB+xNLNT8SM3wf2CyjYCStCLGy6VsCX27mFXDE/XBI1UUoYAUtlSnQm/wjFy7fkPaAa+R97o5
 pzphOkylRr7rLVkOTkoyJd6K8hqlrMAokWwUJ6ZOGrbGTOk91+2Yqkly/XNVL7itfs8hkv+rnym
 PlMVVCB08euzlxhOPgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-109270-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 799285B3011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/13/26 4:00 PM, Ajay Kumar Nandam wrote:
> The LPASS LPI core conversion to PM clock framework relies on variant
> drivers wiring runtime PM callbacks.
> 
> Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
> in this patch so they are prepared for the shared core conversion.
> sc7280 wiring is completed in the following patch.
> 
> This commit is a preparatory NOP on its own, as runtime PM is still
> disabled on these devices until the following core conversion patch.
> 
> This is a mechanical per-variant driver update that relies on the
> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
> pm_clk_resume()) and DT-provided clocks.
> 
> Runtime behavior was validated on Kodiak (sc7280).
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 15 +++++++++++----
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 +++++++++++----
>  drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 15 +++++++++++----
>  drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 15 +++++++++++----
>  drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 15 +++++++++++----

I don't understand why the 7280 change is in patch 2, please move
it here too

and you still need to adjust

drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c

Konrad

