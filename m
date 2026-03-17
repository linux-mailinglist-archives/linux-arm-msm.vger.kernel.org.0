Return-Path: <linux-arm-msm+bounces-98076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8s7aN1nwuGlRmAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:10:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 376142A4378
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 715FB300D6A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59F937DEAA;
	Tue, 17 Mar 2026 06:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4znwnem";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KW3rkkcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1A298CC7
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773727830; cv=none; b=rcmZbh425HumEvgp3zI7vFK6OEleG5vmzPf83Dt036YN8cxRXN23XDjnOmqK11uwqz5lKU+ZNFz/lX/8LktU1sEfvwg632OTHzPAz/v56KTuHoSUReE1afsbViN7hO2r3RqqJHcNl9BESYlmow6qcllDwj0kxljkpKLZnOEHMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773727830; c=relaxed/simple;
	bh=XFqmoR2gUVq9WBvXpiedXJkpjERZxFoq3R1MlFLzEkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAVIJWYIeXQVkmeNAc8iOgdxvYkFLaVtGqzcQ13QvGyXxf9dsVYNpUgPS5Jo3FuV3yaJoZaSGmIdJpNlP2440fBNUwBEUsw3lQuhYnWT7DL32JdTZ5lvAZvp5maL3oRpl1ookJ0uSqPo7l5hWXlwJgVvVaonRpN/qkXlySX0rJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4znwnem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KW3rkkcv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H1rMsC2315159
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bict1s1O3xCc01qBf1qRQsPrD0ibioJZwa6Uvi5aquE=; b=n4znwnemtre+XWR3
	aBayLglB3yVMu5SS2byctv8QoRhFDN9epFRScSHOXBE8OwGt35ciYjk1qb1TbYHQ
	upmCnAvsDtAwJFKusmjyQD9XLZRlpyM+gkX5EvCwdk8SzzpmQslpduiVdgTTeCCF
	38DgLiUOeAh77AF6vwA1z/ywfTQJMgTcksA9O2qeIa00q7awywn9SvpVTskS5X51
	8yNx4HZxeqlQebEyxglkgc2EDw0BCxx4hGDRmB/dohlRtkaXbtNddfZB++/fgrmH
	PJ9xrK8ELknls1/3d3vvFfU3nWQUJYLtbBdD3f+623Kj+j9ahnydimdef9gARfsc
	1LKTqw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2age6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:10:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so4586185ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 23:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773727827; x=1774332627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bict1s1O3xCc01qBf1qRQsPrD0ibioJZwa6Uvi5aquE=;
        b=KW3rkkcv3GEPCv+OlbEVXREJ7Avcr3+pBcsm8lSN4ls1auRXWN6klZJbtJBTY5QLcZ
         I27a+MpCFrqpHSRvDLZpSKWccbgJzb1j3uXg2e/p1KGi/QUew0B8pvyMHU3Tm2gMjrFY
         3TMuGJiIYQhItMUy8DZzrJkV9kZPibZDclY9rY/3BznE/hyDze5jW/M19FUt35xX0KlI
         6jxBfRK3hYHsuW2NA0uywBi1hLp9ZSfMvYgBQ2MQZ8n89317VT1LB2Wf9Dm2Ba1oeJZO
         YywxnF792pfaxQUXsturb5Y7WBKZXJ3zYyvQHvnovIhxwxXGfntlMES3+BPlBgpQiqF+
         juRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773727827; x=1774332627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bict1s1O3xCc01qBf1qRQsPrD0ibioJZwa6Uvi5aquE=;
        b=FdXJCYukZ1meaqvZ0InfwG4gNtjDCbiLJAx0rWzsVIV+40xdEpl7ryH8XBVh2ob+wD
         4qmGmY5RJlDT8dKkjUTPDnUqEO/l3B4AmxLq5OjKkD+Fy5YvMOVgF6c4vOX37c3Cge5e
         ksehXHFvuwn4PkvL9Dq5QUM9E91WAjLN68uSEE/JgMay6HoPJuZogz/nyVBKRvjWz+zd
         r0qCcl4+4hi3AL/FqYfSj4o+8B7s7KF6BpCwwkkTxyyeVjNB4oE3uv43hRbSd3S0O2mB
         PGFpdiDBVBt4quxhzkz8YqKs9fNEkgVa0tIbM/w9S7Fba/33YcsF3NVRrHdjVr+vGDHX
         TS9A==
X-Gm-Message-State: AOJu0YwXRt+JEtfjalUQI5esQsN0dTdFoi9RHHn0ZQfWRSBj3VQKBRyR
	7stkRZcFPZoQpu8blsyoaFA8kLbBTqlh1yqLgRezHnbh67RhGKih3RQTNqhy8dOUQQ9irud/I2N
	MrgGJ2OiuH2TlBGMvUEGC8yc7Ycbq2YWA46ceZv8La7LiiuNMH4mfdIyz9wxXYHrra6vA
X-Gm-Gg: ATEYQzzoLjIWzOvN6uVLZY9cECTvQ3nYpKYVVLTDULGQ1WXEs4soYd5yHQVNdA06Mg4
	Y2lOL1JwFl4+KHbAHEdPA4cEzTyU1fpuZBZw1g01fCgLsF9vGOleTqYu2AR7ldkY9DVhBjgnBPW
	VfYqBBFwYmChSUX3FLa8wgdkZlDHEpVD6Z0SIwjmEq22vpeVbkLb8IQ7CzM5SVUVLCmgaodyugh
	EcaUj0AXKJ2HlDtPgif+kPPchS+qNyq4Ur5lHputJav4uEoohZpMF6Yngs+9ACN9+tW78ibLPpC
	TRsEFPF28guUA/gWNjosFsEA9WdfndxPxVIv50MkP35ZB0+p6fg6eZ1v4c2NQYZi6jH6dXhRmPQ
	i/9l5J4/AX34419Sb/HbNJZSF9jCKzUxobrhHg9tXrBnK1OLIXORxQKUd0/gi/+aTqFvdwC/Bq5
	iqsb422tSvvpm7n8I=
X-Received: by 2002:a17:902:ffd0:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b0635966e0mr19900685ad.8.1773727827081;
        Mon, 16 Mar 2026 23:10:27 -0700 (PDT)
X-Received: by 2002:a17:902:ffd0:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b0635966e0mr19900435ad.8.1773727826479;
        Mon, 16 Mar 2026 23:10:26 -0700 (PDT)
Received: from [10.133.33.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b054dee693sm60611935ad.40.2026.03.16.23.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 23:10:26 -0700 (PDT)
Message-ID: <c956c536-9f70-458f-a346-3a207d51b145@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:10:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MZD5u-VGmGWImEgtH0Rs_SAYu8qthaR1
X-Proofpoint-GUID: MZD5u-VGmGWImEgtH0Rs_SAYu8qthaR1
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b8f054 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lzaHtpuxqINclaYr2a0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA1MiBTYWx0ZWRfX9mwYvtiJ2n50
 A6C4eGUyJbHFNwniMttQst/RUUCbOPTuLSxkbZsvMadYCWzvlaVZhXvmaRHGZyDsEo0WWhRnGIE
 gUOhFVxSIF700/yVIFBtQAKuS1hqW2G2kplzqsf1R/uPWPjN4t2VnLA1Uz54rKVOzm2qFMvSCV4
 x0bFla/C+B9sv4sh6gyBIu9fHtcQGvud3TYldz7cugZPYvgpxJiUIdGPYGfTaNDeXRAYxcAN/L+
 GbceXa72xmvEyHHyM5uZ/UNOKlTq287hTAFJoqmD7Oho8Kge/keFgCO99oek/XesjPezhuJ/uYA
 JOQ5PYTub+9yyDOo0olhnwi+I+H6jme5WWcNgDhlT0vaLJW++TPU7r1LxKrW51s3ET+eE4zuvKQ
 X6uyFEQjHvmVuIz7+Cz0PYwqjZM3jlaQpwQ2luQPKlOxnAR17H7o45dYDC9+vMCC07mLQya/06W
 gGJPW8+TzthBhV9+fZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170052
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98076-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 376142A4378
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/2/2026 4:28 PM, Yongxing Mou wrote:
> The eDP PHY supports both eDP&DP modes, each requires a different table.
> The current driver doesn't fully support every combo PHY mode and use
> either the eDP or DP table when enable the platform. In addition, some
> platforms mismatch between the mode and the table where DP mode uses
> the eDP table or eDP mode use the DP table.
> 
> Clean up and correct the tables for currently supported platforms based on
> the HPG specification.
> 
> Here lists the tables can be reused across current platforms.
> DP mode：
> 	-sa8775p/sc7280/sc8280xp/x1e80100
> 	-glymur
> eDP mode(low vdiff):
> 	-glymur/sa8775p/sc8280xp/x1e80100
> 	-sc7280
> 
> Cc: stable@vger.kernel.org
> Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-edp.c | 90 ++++++++++++++++++++++---------------
>   1 file changed, 53 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 7372de05a0b8..36998326bae6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,7 +87,8 @@ struct qcom_edp_phy_cfg {
>   	bool is_edp;
>   	const u8 *aux_cfg;
>   	const u8 *vco_div_cfg;
> -	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
> +	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
> +	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
>   	const struct phy_ver_ops *ver_ops;
>   };
>   
> @@ -116,17 +117,17 @@ struct qcom_edp {
>   };
>   
>   static const u8 dp_swing_hbr_rbr[4][4] = {
> -	{ 0x08, 0x0f, 0x16, 0x1f },
> +	{ 0x07, 0x0f, 0x16, 0x1f },
>   	{ 0x11, 0x1e, 0x1f, 0xff },
>   	{ 0x16, 0x1f, 0xff, 0xff },
>   	{ 0x1f, 0xff, 0xff, 0xff }
>   };
>   
>   static const u8 dp_pre_emp_hbr_rbr[4][4] = {
> -	{ 0x00, 0x0d, 0x14, 0x1a },
> +	{ 0x00, 0x0e, 0x15, 0x1a },
>   	{ 0x00, 0x0e, 0x15, 0xff },
>   	{ 0x00, 0x0e, 0xff, 0xff },
> -	{ 0x03, 0xff, 0xff, 0xff }
> +	{ 0x04, 0xff, 0xff, 0xff }
>   };
>   
>   static const u8 dp_swing_hbr2_hbr3[4][4] = {
> @@ -150,6 +151,20 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
>   	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
>   };
>   
> +static const u8 dp_pre_emp_hbr_rbr_v8[4][4] = {
> +	{ 0x00, 0x0e, 0x15, 0x1a },
> +	{ 0x00, 0x0e, 0x15, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
> +	{ 0x00, 0xff, 0xff, 0xff }
> +};
> +
> +static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v8 = {
> +	.swing_hbr_rbr = &dp_swing_hbr_rbr,
> +	.swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3,
> +	.pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr_v8,
> +	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
> +};
> +
>   static const u8 edp_swing_hbr_rbr[4][4] = {
>   	{ 0x07, 0x0f, 0x16, 0x1f },
>   	{ 0x0d, 0x16, 0x1e, 0xff },
> @@ -158,7 +173,7 @@ static const u8 edp_swing_hbr_rbr[4][4] = {
>   };
>   
>   static const u8 edp_pre_emp_hbr_rbr[4][4] = {
> -	{ 0x05, 0x12, 0x17, 0x1d },
> +	{ 0x05, 0x11, 0x17, 0x1d },
>   	{ 0x05, 0x11, 0x18, 0xff },
>   	{ 0x06, 0x11, 0xff, 0xff },
>   	{ 0x00, 0xff, 0xff, 0xff }
> @@ -172,10 +187,10 @@ static const u8 edp_swing_hbr2_hbr3[4][4] = {
>   };
>   
>   static const u8 edp_pre_emp_hbr2_hbr3[4][4] = {
> -	{ 0x08, 0x11, 0x17, 0x1b },
> -	{ 0x00, 0x0c, 0x13, 0xff },
> -	{ 0x05, 0x10, 0xff, 0xff },
> -	{ 0x00, 0xff, 0xff, 0xff }
> +	{ 0x0c, 0x15, 0x19, 0x1e },
> +	{ 0x0b, 0x15, 0x19, 0xff },
> +	{ 0x0e, 0x14, 0xff, 0xff },
> +	{ 0x0d, 0xff, 0xff, 0xff }
>   };
>   
>   static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
> @@ -193,25 +208,25 @@ static const u8 edp_phy_vco_div_cfg_v4[4] = {
>   	0x01, 0x01, 0x02, 0x00,
>   };
>   
> -static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
> -	{ 0x05, 0x11, 0x17, 0x1d },
> -	{ 0x05, 0x11, 0x18, 0xff },
> -	{ 0x06, 0x11, 0xff, 0xff },
> -	{ 0x00, 0xff, 0xff, 0xff }
> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
> +	{ 0x06, 0x11, 0x16, 0x1b },
> +	{ 0x0b, 0x19, 0x1f, 0xff },
> +	{ 0x18, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
>   };
>   
> -static const u8 edp_pre_emp_hbr2_hbr3_v5[4][4] = {
> +static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
>   	{ 0x0c, 0x15, 0x19, 0x1e },
> -	{ 0x0b, 0x15, 0x19, 0xff },
> -	{ 0x0e, 0x14, 0xff, 0xff },
> +	{ 0x09, 0x14, 0x19, 0xff },
> +	{ 0x0f, 0x14, 0xff, 0xff },
>   	{ 0x0d, 0xff, 0xff, 0xff }
>   };
>   
> -static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 = {
> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v3 = {
>   	.swing_hbr_rbr = &edp_swing_hbr_rbr,
> -	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
> -	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v5,
> -	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
> +	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v3,
> +	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
> +	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v3,
>   };
>   
>   static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
> @@ -262,12 +277,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>   	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>   	       edp->edp + DP_PHY_PD_CTL);
>   
> -	/*
> -	 * TODO: Re-work the conditions around setting the cfg8 value
> -	 * when more information becomes available about why this is
> -	 * even needed.
> -	 */
> -	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
> +	if (!edp->is_edp)
>   		aux_cfg[8] = 0xb7;
>   
>   	writel(0xfc, edp->edp + DP_PHY_MODE);
> @@ -291,7 +301,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>   
>   static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
>   {
> -	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
> +	const struct qcom_edp_swing_pre_emph_cfg *cfg;
>   	unsigned int v_level = 0;
>   	unsigned int p_level = 0;
>   	u8 ldo_config;
> @@ -299,11 +309,10 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
>   	u8 emph;
>   	int i;
>   
> -	if (!cfg)
> -		return 0;
> -
>   	if (edp->is_edp)
> -		cfg = &edp_phy_swing_pre_emph_cfg;
> +		cfg = edp->cfg->edp_swing_pre_emph_cfg;
> +	else
> +		cfg = edp->cfg->dp_swing_pre_emph_cfg;
>   
>   	for (i = 0; i < dp_opts->lanes; i++) {
>   		v_level = max(v_level, dp_opts->voltage[i]);
> @@ -564,20 +573,24 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>   	.is_edp = false,
>   	.aux_cfg = edp_phy_aux_cfg_v5,
>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>   	.ver_ops = &qcom_edp_phy_ops_v4,
>   };
>   
>   static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>   	.aux_cfg = edp_phy_aux_cfg_v4,
>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
>   	.ver_ops = &qcom_edp_phy_ops_v4,
>   };
>   
>   static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
>   	.aux_cfg = edp_phy_aux_cfg_v4,
>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>   	.ver_ops = &qcom_edp_phy_ops_v4,
>   };
>   
> @@ -585,7 +598,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>   	.is_edp = true,
>   	.aux_cfg = edp_phy_aux_cfg_v4,
>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>   	.ver_ops = &qcom_edp_phy_ops_v4,
>   };
>   
> @@ -766,7 +780,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>   static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>   	.aux_cfg = edp_phy_aux_cfg_v4,
>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
> -	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>   	.ver_ops = &qcom_edp_phy_ops_v6,
>   };
>   
> @@ -945,7 +960,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
>   static struct qcom_edp_phy_cfg glymur_phy_cfg = {
>   	.aux_cfg = edp_phy_aux_cfg_v8,
>   	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>   	.ver_ops = &qcom_edp_phy_ops_v8,
>   };
>   
> 
Hi, maintanier, just a gentle ping on this patch in case it slipped 
through. Thanks!


