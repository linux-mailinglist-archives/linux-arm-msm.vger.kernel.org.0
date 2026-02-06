Return-Path: <linux-arm-msm+bounces-92021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLfqMRTJhWnAGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:57:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A41AFCE31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A7C4303CA6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B5A38F937;
	Fri,  6 Feb 2026 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZOxhGmn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZnZsAIc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512EF32ED57
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375184; cv=none; b=EMs/d2MVYW24NilSAPnLCWOPLqmwV4EA0X31QaAX83MFmsNEcgLEX5UgWo/2znFzxhvQZ/XC4DaxERTnAlRbJMdNODp38+bN04t9jg7Jm/ulsFXcwBiDCGliACkSpYU9WuvcDf4auwNPzQ9Q3dsqVbKT+3zmlPalhzjDDgvIXd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375184; c=relaxed/simple;
	bh=uxm14t0B6nm9R1dm/Th4VVVwCqQPzmPMt7T8m8GJ1WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4oCgtxSbaWodEEky7sYPrT3LSz4Fpt+oY+ZJHCZPfq8FPinVSJUruxnJFoXlDn9gW0KSVWDi/qVgI9ne9hqZD2h80S1qgKGuKBKziAkkOx5sG9jNjZywKxmD+tGySmdR0iu10i3GEgvWzMgIYNOSVI8PAtTjaua8sKhI0aoyFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZOxhGmn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZnZsAIc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168NZvS2314668
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 10:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l3AHMbFXpk+dKoC4YLpaH+pl/OddhSfAMGUwFFGZjyI=; b=PZOxhGmnhjfXx6s7
	yWW31Wy1ZyWnJNJa6u4hqaYk509KHn79ZSfhmPNPvjBvbgO5CoiAJhmo0IW9SLVz
	i+9kBFKHJDdmDVIvrbs8SJdkyu+fdnCrT+YXj1Pio506AVlQUlftlcO4+PHqZnna
	BjhP1NXZX5pQVZs9tWd4lzW4DSwSOpRrKAFBkOj6AUcj7yFEK8Loz/aswkjt0RAY
	MhBCFDerGWKThqCTpmhHZMSv20WgFMICYoiMuOHyAvttMn+lp26dPGaHoKUAatUc
	l0rhW2sYIIa83Q3WCvqr0eG278ph0Hff7le0dV0rtB7njiYb+I9fcuB5thQh+pIs
	tp0hhg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrjjbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 10:53:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946c23cf90so6669256d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770375182; x=1770979982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3AHMbFXpk+dKoC4YLpaH+pl/OddhSfAMGUwFFGZjyI=;
        b=iZnZsAIcjQNbeMBz7gI8/F+hPwOrNMNZ8k6XUe6ZJiKGdSH6LRcqtJoXGf2kAMgrfW
         YRAu8sTBrB1tSbu05h9MFEVoNHGWHCneGGX2Nq9d4AJwvgaeIGJ9xWeLXHaFSI3j3BIs
         TufeftvUVxKgliYSQSWmgjrjbbCW4pAf47dI27BtAt4tfPGJuw5YWiEvaUX7HKENinLs
         0zTRBNb3Y1AO0DI+H9ecFcTojxZkEcLO4LwUrJQvJf5JN+AtSplO3d/l17nBnXR8haNp
         yxflTW8NROeCCoqceoiaQGJ/0RMX+rvotpq0x2tveg6d7fbkW4mDBs6ZU3vc3Uuz6gRZ
         7log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375182; x=1770979982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3AHMbFXpk+dKoC4YLpaH+pl/OddhSfAMGUwFFGZjyI=;
        b=feci0J6PGqiyjVfmN0Rr8it4hZYw5908YUNmnD45I19egB1UZhg+PcLnNTfBiCI5Pr
         H7m2BOQKakzO7L2pfc5aqNTP7JvS3OXNnVPN9dfVJrorJfE8b2TSRqPA86T2AGOEqeOS
         FO8/V7tCyuQ/3APeFvljL+GaxY+t7fqxlUCH1C9FZ411yPaJJe39/IMrlrA6cGDB6Rxk
         IR3/26I3CM7Vvgu64IhL5zbLneq8YemqVRuyMW+XNQlOH63wX33GO0HeHi2CebBkFpP2
         XLnltVebCONTCBTVSAFUeZP/Wm9KavCHmezHb4kFBHrQgzM7ZD0WSBy1jrMWvd4k4+vz
         hPPg==
X-Gm-Message-State: AOJu0Yxm2I+lp5cQz0N87UxdyK4B9MK5ArD+WZ9d5XBFvk+99WqxZzBV
	CM+flf/WwWbXqtI9CW71uttpd7k81CiTXJs8FXuMaP3BHn5I9jte5WH6w8IHDBvx5wyAwT9yrJ4
	Hoo6oq2q+tftHUBAheQqr0qO1+/bLGsffTlLJChNB8Jabuk2llAdxlAV4AVv4T+lFFbdM
X-Gm-Gg: AZuq6aLxf4yIKrrW0ZperDs6xQNB3ZaLDI3sB+0K8ESDAacbDp5uDA0/0u69qe3cb2n
	VbV0DSTUAmGh/ePONAaLYtYmYnlWPDA8RDyD1+0s6t/iFcCBHl69oyeqsKJV+5F9k85GSFjYk3B
	Zmb6LNSzB8/tCv9zqXwhFAsAKVAgwfOC3Fcl/eVNh1rdc/Re47vczkuwFSXEz1r2R7nuwAekhRE
	gtK9M4vFAJdt92GsC7TtZiYDbRv5PWwa/hxhhofOT0h/H8r/CQP/sqnfR27Eb6bJYN1BqYxM8MT
	e+sNP8AQr03ErV9KUk63PV9HI6JE+hqPaORYKuBm8Dryqdwo95b5eUtA8XYpGTm0Z1kRO+9pnk0
	HFPBQkmlaSrsytX6YPp0xdZTqpgQ+oY47ZhVui7qRPEhmu/5K9O5n5o27O92e/SZNgR4=
X-Received: by 2002:a05:6214:4e04:b0:894:ae65:5ba5 with SMTP id 6a1803df08f44-8953c7aa00cmr23503306d6.2.1770375182528;
        Fri, 06 Feb 2026 02:53:02 -0800 (PST)
X-Received: by 2002:a05:6214:4e04:b0:894:ae65:5ba5 with SMTP id 6a1803df08f44-8953c7aa00cmr23503136d6.2.1770375182153;
        Fri, 06 Feb 2026 02:53:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6598400f3eesm421672a12.19.2026.02.06.02.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 02:53:01 -0800 (PST)
Message-ID: <200b055b-7221-45b5-aea1-2462e07a3c1c@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 11:52:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom: edp: Add per-version LDO configuration
 callback
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA3NCBTYWx0ZWRfX0/pJSjRDE0xb
 FJCEtP0bAOGdKPVdAPI8xZW6WsjgH8IhstF8G2amsIzp8kC3rfGBAHyXiMMgLQu8u8eN5ztYGxg
 wfV+HYnz+dFA3gkeHn0Fda3KBTl+QM9jZtuCodbrcJ51tTUKuFVBz1kDedOZjlTBZQK+svy8Ueq
 NHxMRU9VdPhjY46zjj4yQQQRUShSs25UQ7RoH/Uizx44s/6V7KskYV2K6lwwVOjBjNTvkVqtZQ9
 iEC4TtdFghw82CLJbub/YF4vux9TYGsSLeb607hztsKH2Nt7S7B/PtF/1gv71271OKTKhddmudl
 9cQhiu/pIQo8Y1AW0HSHJSv1nQ0eX1MU1czeFxhTK3DlHi5KtnFt6qA6cS+HvV3KX8PXoBgtuBm
 qSgRlrS8QFGMV8q6Z78tiqgpPiHdaXGXUP+rhNPos/otMnEi7ZEzX0f2FZAGJB2VOqKFgZ8AVAj
 2f2RSOcp9oVvRRmtM3g==
X-Proofpoint-GUID: DOX6DMKNrANJfhYXpWuJbWlnUEbElAkc
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=6985c80f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=pDKpTZyYLimyg1k4smoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: DOX6DMKNrANJfhYXpWuJbWlnUEbElAkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060074
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92021-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 2A41AFCE31
X-Rspamd-Action: no action

On 2/5/26 10:20 AM, Yongxing Mou wrote:
> Introduce the com_ldo_config callback to support per‑PHY LDO
> configuration.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

[...]

> +static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +	u32 ldo_config;
> +
> +	if (!edp->is_edp)
> +		ldo_config = 0x0;
> +	else if (dp_opts->link_rate <= 2700)
> +		ldo_config = 0xC1;

lowercase hex, please

> +	else
> +		ldo_config = 0x81;
> +
> +	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
> +	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);

tx1 should be dp_ops->lanes ? 2 : ldo_config : 0x00, in all cases,
I believe

Konrad

