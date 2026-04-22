Return-Path: <linux-arm-msm+bounces-104062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELUXFO6d6GlNNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:07:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F1B4446D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75FF6300159B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3581B3AB282;
	Wed, 22 Apr 2026 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxzASiXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFg7fqQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDACE346FA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852395; cv=none; b=POKRMHjPVK8slFJPhLgGjYa8fzoznliuSabG9mwox1e18mFkjM8xOtnBoh4IPvApUnslmyahHkk2x2cluqWQ++YdVw5d5V1k9XN6RQivVW7I7W5fO1OEWHKja7KW4efQzN3WQDcyxs5zdEdqG3kSLInxDPd6g3ezkWepst0dO14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852395; c=relaxed/simple;
	bh=F2miv3VN1E5bBVzs28VciCLl3pdFG9c3gR1nAApTKMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WP5jazTInpB8X1d0kU+pQWJ05JIrB2MLDIJwt6/3LTD5oQLiDLBViYUCy7qbEapc98AgRubP+TkZ7Plun/C2xEHgpwPDGXuGhSzPItHf8HcDzjlMFLUdKjY1O704N5cZY2j13oHfowbBjyQynpOQFXWzSW76DfZJH33F/HeQyVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxzASiXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFg7fqQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M52aBP2209073
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7dhqIXNT+osSd+4CR+kMtKfRz1bj+2wyCzp2NKZcx8=; b=ZxzASiXLj94Eh0NF
	7y43PtYpG3BWFT24Fcer0gOJBkXiwhm28xGzc98EM4f/oOMScyR/C7BJEHlROYLv
	E/PiJK8uoZnNxrNlfiB0nAUttIQfsZPyPLlH05fMviMgk/Lwtd4WW1ORlzxAvAjl
	S8VXA/PgIXI0UBuyXiM94+h6FT9grpMpzdurfNddqyOBnhrTe6J8MXeszuAyBWSe
	c4oCInioFy+SbMUzCGNuqh9tY3ommcSBJ+KNvw/TPuPVuvo2HTr4gr4SzuTQwAKt
	AlgF1ZbUtAr5n2Kx2SBkwC+mckyEZQNpmm2DiklX4Dc776qx9/qS1dMbieF+xuDh
	TvLotg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengaub6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:06:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b207ec027aso98076d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776852392; x=1777457192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E7dhqIXNT+osSd+4CR+kMtKfRz1bj+2wyCzp2NKZcx8=;
        b=jFg7fqQdhendR8EkJKDymreAWf6KrVyQYTa6g2SvPyiiifimNJngdTFZC7qIDJs6O6
         rp6nF7AfnNQOqVHSFZI5pjFOmEaUlIk9AUwrMv9tVAu/9ZZUgMhYZlyBmJYvkrVzaN57
         LYxcCaNr7i+LlWabWYnW0QX4s5bUXQsZWYt4xGbH9Utcx0qgFbBZdTzBTbBnOWi3aUYV
         J1FQG1lPLvzz3gte0jQ2Uu+KX413tQ9Utn/JMCko3p3Dp9AAmnmhPrLJAf/+lI75x9oq
         MnzIBDwOkb4YACDmCJLJ4NoV2j4uHuSZduCIAVo09EYi3ee+4blnrdVf6ZHHa7JDpD1u
         DnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776852392; x=1777457192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7dhqIXNT+osSd+4CR+kMtKfRz1bj+2wyCzp2NKZcx8=;
        b=cu/9k09B3h2CbwIjm0RJRiJ4aQWiQsBd0x9qnj/uJyFEsTheXp1vS7+jc2gHrp4pq4
         xvPfvIF/yIxkuTEEQGlqM1ypt45Pqq7VR+W6URlaCwupePFr52bl5wBGmx+hadXOBEae
         qtZNA5Gbp5AQcROl5FqoGrRA2oiB0rcigpo30/DcsW3yN39bFS5xWiYos3Lto8ijBdrV
         s6LALKSNT4k6ubat/r/qq0UDiGiKAnKlXHTdwFeOZM77dopi5muFSdwSnWbJF/mTtxWS
         ZPHv0xaVSfe8lbwJVnKXWE8HN1B31XELm5FrMcxSpiU03zSj+t9hWSDuA2VGQWUavdRY
         f9Lw==
X-Gm-Message-State: AOJu0YyAYsPfQ3CvSYReotPhjTb+S8paUSvHkL6zFZtcSfFPvswvWLG7
	wIy+8ZrLL0CXitDgwy5BAw3dhaSeseRNBhiFSY9SPH9UWuB5ec7zPe6HKQmHepLvsqmYXJyYinN
	vHMN1aROEWNNwvhoMJOqOmEN+I+DnP2tlgCsc/kZJ34/KOhOu7Ud14frnnk/4Ua3rH/Wj
X-Gm-Gg: AeBDiesqid7zl+OqBFVAexJSgzLBmthuqqpZTOBG44J+r3TOQJQQW3s8AWNy9UheB6Z
	97JHpiRuaS9FHsMzhKNx++++c8WT/80lqLVBx42z1M331ymyTrcHmFErrEmrFfEbpFJ+kcYT9Oc
	ru8pse8DSGo/v57HeIobkHjeD/Iu8BV2XRwzfNaULjy/+XSp89Ti8aIn0CgDJOvV8itulD91A4c
	xwjTJvbW35Ydrl+PtWrzv40AUFYIlxj6T0QYhOT+vigG3JlJxJBUKe5s+ut6+l4yzKp5xKMHYnN
	ZtpfTK6MxeiouJXIRG1iG8eCD60Cr7i9grUVjfVbm8Wa0pXNJy5YhEsDVJ508ytw+u4QTkZqwDU
	/ELFMPXtPgW2k9pCrlySg4fcFHCoDMQXKb0tPn0aF/2rW0Rr9ZFMdtQ4ubo1flUKHBEZHKAu3dQ
	eA6TK2ydQryIV5Iw==
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr227504226d6.8.1776852391818;
        Wed, 22 Apr 2026 03:06:31 -0700 (PDT)
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr227503966d6.8.1776852391406;
        Wed, 22 Apr 2026 03:06:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ee077sm538493266b.18.2026.04.22.03.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:06:30 -0700 (PDT)
Message-ID: <3526a6ec-20ab-41d0-9130-8dd6d5b76f49@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:06:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
References: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5NiBTYWx0ZWRfXyaMJ/hX98EjC
 U3OCHt2QWEFvXIZScvxNGLsxMq1LwwqrWjlkvoSGX3YVsi37TY6/v7PvVAWThCZokKcJc32RVVf
 VJwmGWt3PJHW6zUfH1njFsel251i4wnstVlTJ03mt+uZYFk3YhcE4GnoLZyT9LbRPAUibyQXDeB
 wcSnvUAyHzCuJPGuXK4KL7jKCyCuGrU8l4qq+xHhM11MtBvR711mvbZUY3jW6KQZcKjITOGnltT
 xTRrLk8YW4e7AmRl0fDDKvRxfbD5yJDZlIZI+xdqkESMJD4C0LdsB1ygodpjbdcrce37ncqa8q9
 XhRY+eKB5pndnuZJsqvrg2sbYaj1KbNY2gZfTpSW9JDP5rK65w8/MHGaI+WuvQ1IkbSiQWqZPOL
 I+UTPXZB/37oRQCAJQAnZHgDNDU/69w8xez+2GF85K7wU+lxJdeWgnH2yO8VrRnkYWli2/gIf+H
 po/tL+c6NQt2uReexng==
X-Proofpoint-ORIG-GUID: GKX3ypoav5qcB9Eu220aHBu8XxHW77hj
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e89da8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=PVKFNgOZ47auAR9NjogA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: GKX3ypoav5qcB9Eu220aHBu8XxHW77hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104062-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46F1B4446D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/19/26 12:15 PM, Mahadevan P wrote:
> The existing DP PHY PLL and AUX configuration for the Glymur platform
> does not fully follow the Hardware Programming Guide requirements for
> DP over Type-C, which results in DP link bring-up failures.

[...]

> @@ -283,8 +283,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
>  
>  	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
> -	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
> -	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
> +	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS_N3,

This register is in the DP_QSERDES region, not in COM.

The updates to the reg addreses themselves seem to match the hw description.

[...]
> +static bool qmp_v8_combo_configure_dp_mode(struct qmp_combo *qmp)
> +{
> +	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
> +	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> +	u32 val;
> +
> +	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +		DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +		DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;

The Hamoa (v6) HSR suggests we can use this broader value there too.
And same for e.g. Makena (v4), but not sdm845 (v3) (perhaps we could
use do it either way?).

With my response to Dmitry's comment in mind, the diff in this function
against qmp_combo_configure_dp_mode() should either be broadened to
other platforms, or the function should just be the same for all targets

[...]

>  
> +static int qmp_v8_helper_configure_dp_phy(struct qmp_combo *qmp)

This function would then be the same (except your v8 impl returns earlier
than the existing one, skipping a 0x19 write to QSERDES_DP_PHY_CFG and
QPHY_DP_PHY_STATUS reads)

Konrad

