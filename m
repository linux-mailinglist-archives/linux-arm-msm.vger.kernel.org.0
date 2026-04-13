Return-Path: <linux-arm-msm+bounces-102903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLHeEUKu3GnfVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:50:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACF3E9580
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79AC1302D975
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5921E3ACF1A;
	Mon, 13 Apr 2026 08:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XX9GWbI3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNkWFeoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34213ACF19
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070094; cv=none; b=sZHme4aSsw8vDRrSCPvhgxZ5ueVW6q2Mj+mPCev9h2VTrUa912yNe7YkyZ+Y0i1s2vTwLKFHknWxl4eu9/ml6UkH6UiT36+y3lcXgkXAGSl5f/463m3PNqS2xq5j70SWri4yJbnFiek97MoRY4gOSPIJOkPrnGlvhdtKlpnB/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070094; c=relaxed/simple;
	bh=evRO0PQwMkxKIu649eD/iqI+4CsDeCsGaBZiEEguRB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VReItGyN3FL4/ufRnRzGNeTy8Ab8Phl34m+cNTbdElYSrSz48R50ipbLJRtMWHpH6zE0hoR+nITE1geQYCuoJLLV6v784t0NU97p/axx9bTjig1zl0cK44BGYw3OyycKxQjEWTAsQN0Scc1XjRTDHcy/A1/JOs51qKJCLY0XtWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XX9GWbI3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNkWFeoi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7jtCl775181
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOH7c8WdaSQxakxnVC67pQDyVDyLKRgH4/csJfymxE0=; b=XX9GWbI3pcPEMwpz
	0v5SAxbIi2V8OVpOdQTpzM4MyYw2sgOpLRSV0RPJmFWDcWEybgb94sOQphK3vDe6
	iO42Q+tTGO3drt+SPwnPgR5YG5z6g9GM0B/IG+RwHgCUd3CUyMOZoH7+vesl2vuD
	xbOTPucktEXO8D6jD4tn3ousq5/S3g3q6SizreER/Ctyd2ctLGjC+40JsoZerCmp
	aXUbL/6sPMmMNl52HUMYGwsrj88B0xM0nbtdFjt5qmPOm0evRTc8cRH0fC+Tqv33
	uRotn0iVDGoAjN+O21FV5aUA563pdPNEE2Da+bYUSgWzyck++EaMSFv6CyDhuzWy
	yevyiw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew04h8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:48:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d7128e038so10244921cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776070091; x=1776674891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOH7c8WdaSQxakxnVC67pQDyVDyLKRgH4/csJfymxE0=;
        b=dNkWFeoich0LqQ5q/DEXa10nq5JSR5gayOBXNDcYKq8uWiiMevRR0Mu0J7BnQ7Xf8F
         pblmx45sEex+y3pEMkSl9af9/tovgu2CmcpmkuFr6SWRbwydLNJlmXaiHTHaOBD2+Y9k
         ZcwfrTLCzN3Y+OOwM2Nr8Mt5uim5ljFOIg1tmP/532vwxYoJW3L15VLmzH5XNt+AgVmf
         Mk8dZTjYv3sBRUJspGDMjkoFN2Jd8J3KqtIoHk8Gp6agl4UVWG8NijT3Wsf2Riyw5U42
         rj/iLVf1fUC6w1hfONZdYqN4kVM4E597gFnwWUdAkROL7dBmlF8hRsSkHpTC71HF67Gh
         uDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070091; x=1776674891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOH7c8WdaSQxakxnVC67pQDyVDyLKRgH4/csJfymxE0=;
        b=pfahS6TBYkW8i3x1wMI9rNp7A4QmSokklI8wdHoYsO1WDqqsMaRV9aKqmt6nC3HwUR
         6tfMVaNk+hWVVlZodgYa162RPXBE0Jcbv5zKOF5xiVHx/xjr1mKSWJYlvBugPMZjFZLi
         YHBa4Hld54Fi7Y2yx/4zjXH4l4OSpuJfIlomrV99ItSkFTVbNUgFlWh7v19ri+ohE1G2
         VqfNIKamJHiO5J9oh4YlOCXEVyZQv+qqbXJz1HU5y0H65Xcz1xsyVtPHfGOpbAFZJyRo
         F7I7xTmLCuCvEogXqnP98sOPPmfljtYF2mxjBpcj6ga1TWaEquBirqlqpFUUVjZB9CGB
         7cFg==
X-Gm-Message-State: AOJu0YxrBB7SVW/Ju6JRYG9RIpC5O1ZQ8xz4ZEU1i0ji3GBUdiy/y/Zs
	wCAlQzw9rlVK3aZtKkWs7Nm7a0YP6iPUpAUFLNDV+DPPsU5GWVn5R6y63X8jfQwG8zi4I0ZBU9D
	sezBfiAhxdFtOh25141eG0kG130IcIUNbZtEA6INHrsRw0TGH3rcvl0zESGgQ9AYjJ/MF
X-Gm-Gg: AeBDieuIXfPAUDWVVi4h15Ai5sya8O/9fHO1KOG45k0tONMLxofVsP0hOxkVY8uBM07
	If3kaxmiEzz6K8rxQHyOEnok2bX5x9k6EBUAI5D1+aZjdN/MpgsPAVe1BkzKoTiqBrd3t57/gAh
	BhxCGn0zegIWXOeFNoU8+l09z0CaJlRmfA9+PVnr8rqJmCWzfEFHs1ZlikHYt12n86dA8optwS4
	iaDUaaeh+2tHmmw0+8yaePbNeqp11jjqE4VwOd5WtoufVpepCyK2WQkdwDKriteQqUTUBaDAcuI
	3M7hQ0AsbcSw9/xygHWQEEPrzkdLvO3ZFTbRs/V2Busa7BDqxCiVB/gLTQht9L9rhRZR2kOlSuu
	TXe86Wy3YlS7294jw5O8ZT/wzCGrMu0Np1+GDqJjZiN6cNl3HkRpd6s3PQ8bAZx9Omt1dGauwUn
	n/hmU=
X-Received: by 2002:a05:622a:34f:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50dd5bf0dabmr134540531cf.4.1776070091017;
        Mon, 13 Apr 2026 01:48:11 -0700 (PDT)
X-Received: by 2002:a05:622a:34f:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50dd5bf0dabmr134540341cf.4.1776070090595;
        Mon, 13 Apr 2026 01:48:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec4fsm2328099a12.6.2026.04.13.01.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:48:09 -0700 (PDT)
Message-ID: <4dafae66-1ef1-404c-854c-b72d3313f5af@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:48:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Make all VRMs optional by
 default
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
 <20260412-clk-rpmh-vrm-opt-v1-2-37c890c420ff@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260412-clk-rpmh-vrm-opt-v1-2-37c890c420ff@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4NSBTYWx0ZWRfX2thjZHQ7CMfN
 VEGYCheOyMvJjx9PuznInFObZhFirgN+JkIHKJEYRxMcnVCPXwfTlMl/VCyoLgj6bTjegiTiHx2
 98AJbl8EB5v4GlA9zBnOD5KldXla+h+unNr5vRaLp9NVJVUi4waPnrx7oPV26uUKOXcjFY7sK4l
 0NjuuSEbxXKkiXVfL+LkNFEK2mXg5eD1ilD4XPKfjN40wMPhrb02ttSZvUjh6I1fmq7bDkFFnLi
 q9dc1UG+MO861XnZ6UYutwKspuNS0yBo57N9Xg8gu5roTuioF637UoqOJGhQA+EY46VEUVVuO1N
 etucV9SCFxVAeUZlnf6aU1hf3HIoGnPKQSra3XwB5/pq9FPemnpieo3jk6wNwYDbYq219XZR4Zo
 WkpFmHrt2NT0CN1GNcUC2+PR2TUHSavdwivc5sorkucaloANusOiuAfZ8QOUcWiinzsROFGs2MN
 293gqrl1EL4KkSZxX6g==
X-Proofpoint-GUID: GRXM0D_zauJgCB00B16HoyUYHTamEOpE
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dcadcb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=U7PIyejKuas9lMDveZEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: GRXM0D_zauJgCB00B16HoyUYHTamEOpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,pm.me:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102903-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BACF3E9580
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/12/26 5:30 PM, Alexander Koskovich wrote:
> Some VRMs aren't present on all boards, so mark them as optional. This
> prevents probe failures on boards where not all VRMs are present.
> 
> This mirrors the downstream approach for this issue.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> @@ -976,6 +982,11 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  		rpmh_clk = to_clk_rpmh(hw_clks[i]);
>  		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
>  		if (!res_addr) {
> +			hw_clks[i] = NULL;
> +
> +			if (rpmh_clk->optional)
> +				continue;

if (rpmh_clk->offset == CLK_RPMH_VRM_EN_OFFSET)?

That would let you drop the rest of the patch.

This also needs some additional background.. I would assume this comes from
a slightly different HW (PMIC) configuration

Could you please do `grep ^ /sys/kernel/debug/qcom_socinfo/*`, (perhaps
censoring your serial number)?

Konrad

