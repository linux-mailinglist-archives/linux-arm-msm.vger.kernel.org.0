Return-Path: <linux-arm-msm+bounces-108135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN7NHf3PCmru8QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:38:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B50568F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A12D3019BB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4D13E315F;
	Mon, 18 May 2026 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQZ2pfUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSydI8QG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2033E2AC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093373; cv=none; b=rsbmEoQRYxbdEJMdjjKZ+i2N808iu87Y+N86s9cHuKtbZoR0Z6hot5Oel93zb0kJsZAbA4vNM+eML6C0LZksYDOAqaT4nlU/ceX1nYgHnOIQeFLuInhywBV/5pwhfs38fMTMpABj8YZ80KydzIYHX9zMVihZljyOJY4qWVPKXXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093373; c=relaxed/simple;
	bh=IcXVmpo4hfZIJ8gVfBw+weIh6aOVHZQDkKMMjT2AUR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrnF2ztHPm14WAY4f0MJ406q9N09izuT0JVOwAtMh048GKi2oLzbeuKJdjZftJkFHmiDv0XikKSc3Yk5MUubb++8wpfIP2ibvk+um07JH1NN+Ry7x45vHKYM29Hh0RfTKQlYdR39Jxrbur80phb4xLuH9JEyXE2pAVyEQynQv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQZ2pfUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSydI8QG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I3G17o4083010
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0zXoBu1LpOx86nIZzValSPiILnbaCbI2gD6Z76zc/Q=; b=SQZ2pfUzNAq9jdLS
	UBkHmUpFWYaPMEVkkRwTneoigxV9AVg2SlNgNJ/PwwuppMFgTXPfnEvop/ddFIK1
	u4gvC9dhZWTpfep8InIcpMU4S5RiHHZCpF6F9qD/ENf/SKaG03ZO3EBz/mSCSKbS
	da1W9Tf5MsdEBDayViVe9dD2EoqBQFwFSYEx0adG7vwSsX160sKpulw53XRnqVDf
	DcIMTdEVL3vt4BFydtxmtgby+v2fxYjUry7hDAUQMeBfD/O2nID2zUk11rn2dpNh
	JEyUkCskW2S81JByXkvYzLKmPjrunoOjbyH665A63u3XhIugo7JcZRDG45lXHVsI
	8A0Y0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qdh3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:36:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso1797555a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779093370; x=1779698170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0zXoBu1LpOx86nIZzValSPiILnbaCbI2gD6Z76zc/Q=;
        b=fSydI8QGU8igqhQHzexmsHMrPeUKo/lYV/pGIIbLhJMKbwgNsi4PkuC5+pYlPN6y2b
         R1TKAWYvpKFxLs7Tr3oLpTzWeUJwo6oHOqviJND7IkNDh3YGiLNjmQfgugTeE2dqX4BX
         1Bb31xL3Q2WAkjDePJTedlGgAIlRLGU570rQoLZmSEPDxoU2x2oQBUNIvi8oM38m3tdM
         zhAJ/czmCzjlQERQTb+n9jh7ihjQOP5XgBA1BublwDxWHIkETTjawzc44zEj5ho1FbhH
         2jPG6qsBlS0l/6v/SfCp5Fd2bJMat5hXU1GjfloKWpb52libXv24WxP8Q2CbdhJJ1lMW
         7NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093370; x=1779698170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0zXoBu1LpOx86nIZzValSPiILnbaCbI2gD6Z76zc/Q=;
        b=CyED+yBuAwQKtMX4H1asAO6RTs9quYyiHYoPdJokXYf5HaJXMlL1mjswv+YSkb61tz
         uWh0oW1Q7GJqa5SGIC8KBVcqEUEScjwSrOOejTKmCRb4xeKeHwNGfib8Mze3r7ydyFxr
         c8aRQHvkHRNxo74Mee6MjhYWWh17E+E+rpVC8jejHE22mtqnz4P/8WfOQ6De7GELEVK6
         Ah+hw8hMlWpAWKbZNP7kQyzcRrXFQ5naorf0mIxKIDeYIyUnoZcQpFY47zdbd7dm4bbB
         2bLt+UtUhLtRbEOoXD/SnnmoY1jTEWF8+QlhqJCn5mLFfdJh19matMHTOQ80LD9BoRCh
         q60Q==
X-Forwarded-Encrypted: i=1; AFNElJ/oLbzC04upsVlTf7NNSXSc4lbH1vuAIG9NuTeA+A8J7JXIdL2C6PWcxQt0llfORJDuEdasZvLU9bAD64ru@vger.kernel.org
X-Gm-Message-State: AOJu0YzlpzDVZ5ZLEphKy+sC9S6VxnweTSzEVWrcD1PE3yxR7kvkPTiZ
	7qzo8J0Q65rSSHyZAZPJi/+I5UL/IUoog0Tk6X5RA46r5iCx+JD1kvmR/iUpP3XS1AM1U2qSXHv
	Dr2RHa60Jz+9nZnrkAnPZ/DtPAh1DNvw488YSg0IwIIW3W8VwVY2c7XLuYSbp0GmhM0TI
X-Gm-Gg: Acq92OGp0hmD1E0CEVvPLc7Nuag4E+FgCLUZlkFWEz7lLDVYf5ej45gr+dzT/yZDqhv
	KwMalXM1dN0dLBfNpfp3WrF7CXGMBENijjXwbLiBJqEOiAbZWGSLs3tOcVPEUb+ZwWuUE8nLIAV
	3wg/hNWy3bJXUhxtZo8q3JUSyclwK5yao8CZe86eKVLafb2lqkfyhyzQd7hi9mSOS+JQGYT0eSL
	DK/GgXOvLE7cted3fUR2brGyP2iy8n9vTZ83kz4a2wmK3nsKuVKYXB8mo+nLupWuidvy157Qu2y
	uNdPOmVakvPkYhJmBNIzNdE4IRf5QXKFCuDDiUTpy/y2UEakFj/Rnt7s+L/0cShleTfnWbdbwVv
	uFcOlDt6DcuYQbVgK6UHcioaO4ZEkZgztA9M7HsFSuZ+R0AXhgV4=
X-Received: by 2002:a17:90b:5604:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36923318fd0mr15265710a91.3.1779093370319;
        Mon, 18 May 2026 01:36:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5604:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36923318fd0mr15265690a91.3.1779093369815;
        Mon, 18 May 2026 01:36:09 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369598fa445sm5241125a91.1.2026.05.18.01.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:36:09 -0700 (PDT)
Message-ID: <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
Date: Mon, 18 May 2026 14:06:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DHX6olYtIjQzqDe6vxMjjU216bIhtUUp
X-Proofpoint-GUID: DHX6olYtIjQzqDe6vxMjjU216bIhtUUp
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0acf7b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UgU4OR3TJw7-EWqsPCAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4MCBTYWx0ZWRfX3hs3ShX9k/Lh
 7JiycZze/iQtyRVfra+Wk3SMriHZk0NAcviDi+G2eLo6IeS9gpYnDHFSq0hLm+gEX5zg4aMe0iO
 LVgpPC3y5ODi2XuH6/OmWsvvzl1W88XWiOFoMYcIg8ZjEOHSD2HG6EA8X928dz6XvEcHlfnorw0
 OVP2GK1b0lA9YdMyGTsPMCfbNHu+fDnjV6/OtO8GQa/iwJOkO5HMUXNjDc/ZeNYn2c4lef+5moL
 BgkhFIq8LK4s/l66NzZU49oL0cSx/hjv1FNgfEfC9bfrjBnjiUXCUdp5e78Pa7MfNknAGd03cWD
 5YoHCe8zdgDlm3/EYAVQPjxpX+qeWnw8RwE5ThtUZ6sU8esmJ+pOeBPSo9C4KUKcSO2OFPcNoN4
 X20COjS1s2+EZCh2WuoauAkuwKJEvaByzYCBTydrLW6gfN3P9H1UjMsTwghMxZNQnhJHyWe8Wq/
 RyQnIedpv/CwAS8yyyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180080
X-Rspamd-Queue-Id: C8B50568F7F
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108135-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,1f40000:email,f10000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Bjorn,

On 4/24/2026 2:05 PM, Harshal Dev wrote:
> Glymur has a True Random Number Generator, add the node with the correct
> compatible set.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..64bbd5691229 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>  			status = "disabled";
>  		};
>  
> +		rng: rng@10c3000 {
> +			compatible = "qcom,glymur-trng", "qcom,trng";
> +			reg = <0x0 0x010c3000 0x0 0x1000>;
> +		};
> +
>  		tcsr_mutex: hwlock@1f40000 {
>  			compatible = "qcom,tcsr-mutex";
>  			reg = <0x0 0x01f40000 0x0 0x20000>;
> 

A gentle reminder to pick this patch for the 7.2 merge window.

Regards,
Harshal

