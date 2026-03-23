Return-Path: <linux-arm-msm+bounces-99163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKg8KNkLwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:46:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1972EF490
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8411C30022E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982F81E49F;
	Mon, 23 Mar 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhdreK3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9slu9IL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4022229BDBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259159; cv=none; b=WHUAmjOGAFESAxxZnhbmi5I5QNaawID4CiK9Q2mRNCfCvaHhLOGjRMh8+YeK7R28oADzqVfqVDnhY7PEa0lYU72xnCy6xHscaonL5/pM+272ot1OJ/2Z/nVeP9S0BS623BRShU6jcEbcusnL0I+LF8dDeWwKSlN7XnqlCodRFvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259159; c=relaxed/simple;
	bh=hnr/zGfBlDQ+t/Q1Jtnn6xBMVq4ALtH3NXuCQu/kv48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tq51wJoVWlL1+cKd1l2vHtkV9UlPNPuwCdqNEnxiArXjhSYaKIOGL+9aaZnIiXTqlSbDS/gLO7Z4qvBR++mJn7HzpxDQvKN9bu2CvW3ikUJZPZRecKMjRSgFVC0I4iAJkphMqSin4fPi0rQvSsxh5QJqFBEvTRXns21B3hNZ4rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhdreK3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9slu9IL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4lgTZ416066
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	46HxWfNCSbL8n26uvRBfBjsiOvI5fKCbdjwVVOuS2Y8=; b=XhdreK3hY7hRs6wP
	G+KloGnxyy5ZmDtKb/sBUd1OjwVY83F0tsSQSniydcE5SZlcOZ34G3gZ9Lm5Yfep
	akMjg8OVgVUODnwCFIUry0SMa9IsYHrwwm2bHlkXSbuPWRegg2v6IDA2gKTaLGdd
	SIH0iKThKop4ly6OQcrpEpJtzVueecKMuYg8tPNsoZp4IFm9gOaAERLzL3bUUBkx
	ZIA3XtyAIdB2L23ukz4gufasd9nv4xPYerQJTStGmk68VMORx6fS08et2RUgFqws
	wjmnsiQ9PJuGQiQeBkuIwG5YvcBR4nbSPiHTA1QKCNVn4kBq+O7sqkhBf64acgHa
	U8fWTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kducrar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:45:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31f391b8so25160621cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259156; x=1774863956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46HxWfNCSbL8n26uvRBfBjsiOvI5fKCbdjwVVOuS2Y8=;
        b=J9slu9ILvx8qGrTKD6yut15nbqo5zS+tkMRCRLaXagBwpDQp8LJJO2hDHxUW2oZ/Z6
         AX8T1qV2WRjKeCGoKvPA+LB3TRt0Uh7bQVg9YUrjvOZf5VupoAT33qAKCet07Gm9OlrC
         Jb514cg0MKnnWaP6oPUfPToeBtSKF4SdZopoHCZsQ5DUNcbXTnOPhW5bqhw8N7gISTTz
         Lh2yb6FHHwPka94jPw9pwkronGVEOn/c8tLyv3mb6niodDLFD0ZwbVoeHtjKFlZdaVrI
         pWhQGCxpsZfoQYsCLiNoCzIIKbNTydWLM4cZ0cNqt/QINkgudvkPRsw+F+kh9Pd3P/5C
         WsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259156; x=1774863956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46HxWfNCSbL8n26uvRBfBjsiOvI5fKCbdjwVVOuS2Y8=;
        b=eGm1qy3KitSF4Suy6SdikcXSaFIAXtTEJpAZ6ukOulaI4xCZMU3gWGSTVnZqhC394i
         nn5Yixhr74o8c+qp+a1JuJm4mJfBQYXY9ONzfo8DUEtypMrXYK4iEne6ywGvFRLfll5a
         iN9U4cc7PIZGb7mUJ6C5DUJeLq0NYU2fNBzkqFBxsQbMPgFYssJRBo9ZFBr7tMJdvG/o
         nHhEXLs5uemRVUyuPMjFQo+aXtQdAqYDS6N2xgBkWLKPR8sNiGRtvjA2rLqZeMLLnmOM
         sZfsftsq6fLE4gjIMXtaJeClFJijX7p3qTGAFz/vZ/jOmAMQKtaihEB4u38nBGq2mEs6
         m0iw==
X-Forwarded-Encrypted: i=1; AJvYcCW1LD3cobRASvP0vJm9XNN3lZ/M8gFaaCpnBUC//gk/m/730uh7bJKiHcfFZbSHbUes3euE9MXcZttuDQRF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1udA/EDOPMqbmuztpCrr1lhJCDOkD7eMIM+/pKfHUQoU+9K07
	NHnDjQrwWH1V2oYIC95PiMdJGDXaLfix4BD1TvgkOAdjw6mwGvdlZec2w10PXJhPcMN0jAJdjo8
	kWN12bCfgGyPSo7z8D57tx703XBJI1cH9CQ80aHh9/Ap2jSNXD9qiazoSp3EGaSn7to58
X-Gm-Gg: ATEYQzzdR2PaSCLdeKx9c9a/75hBezi6Z/b2TQQUOdcia3fdsdLa/4D6vhyD94Syzmk
	Qtu7h++SnbgqNls/v8n+6ny1qYhOveklqx2U9z4lHkH5CnuWaPfPI/6ZVY/bTEAkVRq6SNjCHZP
	1iMv7b6mDFAvvGh8/+mI3Uj0r5R+otAcG1fCJ1ff4j4KE/0e2nTU1U2vH2VqfNpM5FCW8E0oPYo
	F4GglAS0G/hkDlGb8skpkak9H4WZ6CvBzTl/qSqMtlHc+Lzrx5ZT/k8+vRcD6QAFG2zI3EKq0W6
	YDsHClrot22StDIACqGImKz/Uat1zoJhJTNmZe2u0oqXnPYg93z4kv7eFyzyc8xCW2RVgc1C7UU
	fU9euP1ZNL3khzs1+ualfkVzzswTQRjQjcYQzZ26WZAYD5k59yBGdyxYuerAZpZbfgRgpyaJK/l
	dY9mI=
X-Received: by 2002:a05:622a:4cd:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b37425671mr125428601cf.1.1774259156546;
        Mon, 23 Mar 2026 02:45:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4cd:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b37425671mr125428501cf.1.1774259156171;
        Mon, 23 Mar 2026 02:45:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335f1747sm471452666b.33.2026.03.23.02.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:45:55 -0700 (PDT)
Message-ID: <922abf55-7d19-4acb-9b8b-498bfc6e8336@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:45:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260318-hamoa-fix-dp3-opp-table-v2-1-3663767e22b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-hamoa-fix-dp3-opp-table-v2-1-3663767e22b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX3NUIU6LX2LZW
 fBf1bm5nCkn4Rh6v3TikJHNJ2/CYAl1t2QQr6dXzTyBYAgjs5PdViI2I6+j1LDgP3pr1w8qrAO1
 VbHd3ofKRKPGW/yltrDu2g9pMFPW4jRcfF0yV3yG3jDClfp1f9Znzpp6tczEn9KAWn3dPPx0JnI
 Mwf4VBwI4XQTAnTUBiaxb6ez/Fl4vI6kO3ZdnMyW3K/PN6FwntLQ3F/9e+Ojw9Pw1I+VSc/pEex
 QBdlboJnpl02Z92fJ+yshphtuF6ec8GWpk3aRtfrGkj1QBm5ldmT3ZJIzR1pW8ynXQFQMe7+EUx
 ZHeZwJ2LRQssKSoIQhpBljAfe1MpxNRR/LHVJHjT35zgym12R9hv7j1RV56b0eLDjVsAlyPKNn7
 OsduUijEq3upUOVblqJ/RuiLjBym4zUDt6VK7QtVQ/qMgpNrGqEC88bdWNZ7XQAsxs/AeMJYcTI
 4Cy9AiY5PlFNDIQjb5A==
X-Proofpoint-ORIG-GUID: Be9BhH9dlwy2VnDXGynkcifnjl7ZO06T
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c10bd5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JCVw8PmOVHFGJkcgEd8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Be9BhH9dlwy2VnDXGynkcifnjl7ZO06T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-99163-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F1972EF490
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 3:42 PM, Abel Vesa wrote:
> According to internal documentation, the corners specific for each rate
> from the DP link clock are:
>  - LOWSVS_D1 -> 19.2 MHz
>  - LOWSVS    -> 270 MHz
>  - SVS       -> 540 MHz (594 MHz in case of DP3)
>  - SVS_L1    -> 594 MHz
>  - NOM       -> 810 MHz
>  - NOM_L1    -> 810 MHz
>  - TURBO     -> 810 MHz
> 
> So fix all tables for each of the four controllers according to the
> documentation, but since DP0 through DP2 have the same entries in their
> tables, lets drop the DP1 and DP2 and have all of them share the DP0
> table instead. However keep a separate table for the DP3 as it is
> different for the SVS, compared to the rest of the controllers.
> 
> The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
> for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
> in that case.
> 
> Cc: stable@vger.kernel.org # v6.9+
> Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

