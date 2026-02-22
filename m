Return-Path: <linux-arm-msm+bounces-93566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDoAF4V4m2mzzwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 22:43:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CEC170809
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 22:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 251293001455
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 21:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F410135B64B;
	Sun, 22 Feb 2026 21:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvBvo79K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXcw1h6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D9035B62B
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771796608; cv=none; b=D/EtHgOeUVslvqrTZ6OYWm4tOy5dtSMRdyKp8GnxXYOJyXPVO5eXNo+eBFvRMUGvUpYGzQybQaWk4uRyWUyn7MuTLHvi7xtohZIC6+GhYEh5i4NCcQNkFioTqulAhWyPmNpHBjrM8DONc7rGcr4PnT4GZ0TGgRVZKRKlKECIW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771796608; c=relaxed/simple;
	bh=y+0PzllYowefgrq4bX6z1bci+YOmxTxMI1RMx/4ji3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyqhz9XKIBLoVhg88xoTQhJYuHd6DTqtY+ZpvmQbo5LQN1MTzba3xGaZw7GTmbWKCNivbSkTGHl2NLtnEBeawlyDkQYBJ6taEN6tXBZ7uawKmN9zu4eE6qK414LzG9VPBclJLJo5rXlqbWBzQxCQM4525h/NDMf5+kpo7qVa3R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvBvo79K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXcw1h6W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MFe9Ub1425174
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YZaj7KLhvb1aDwkuQxwNAbWp
	rsQ0MS9Gl2DYNTFLP7s=; b=pvBvo79KeZAg3qYEG623DFHnTgIKR5/8MTMPqWc7
	Bs+UvSgpnH5mMotjSLfo0R4k31tg4sDp8Doskw7rv5TPOOYh2/TyrA2IAMXPCs58
	SzNUe76xh+Y1IJ7ko6avg91I0jdLyvykyzh3dDClkufZcjiOoXqDSr24NvPmz6L5
	9iFQQhCzIblVBLR77DIQGL7yixcEGIZl44d5DPTskf1ersKbOv3gMNgAjQoccGnh
	uMH2StD3Uxi4s5DC1qENkHzmZ0VzfqiJbfKb7sG0oH1vIoljhEz25s11DjswTFOl
	T4wvw5ychIEmCrPiZ02W5JHUhtTSAB6jsOuzhcuuIOF1kA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3tr6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:43:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b0d938dso4005824385a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 13:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771796606; x=1772401406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZaj7KLhvb1aDwkuQxwNAbWprsQ0MS9Gl2DYNTFLP7s=;
        b=cXcw1h6WxbuA4OnVcg0eAQF1B425qwwONrZmmFIZ1iy0WOk7QcENUst2cjQVvmUex3
         vCG4laOzNmqK637K2edNfjiPWSdFB+eOi1zFsol2vCtYMIZZI80Jx18Lk1vILi9d7Lf1
         w+fyjLIuFK61s+yclzYw+GhdOQZnFXul3o8MEOq/L5KbhKzN7kYbMsj3LADynLxpaikv
         nARxmqXTW4UwyFPaB5+9R4YSmh4KvW8HfhGfJ8t/JOUygLrtF0Htb2NXeQqj47JHBTSb
         i+RV5SQFBp5YUYauVXZDZ4OfUh7T+qRkvB0JFmVBzyxSBaY9V5dwA7ZZ/U8khlbHQx8b
         tEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771796606; x=1772401406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZaj7KLhvb1aDwkuQxwNAbWprsQ0MS9Gl2DYNTFLP7s=;
        b=OcI6yixyF0w3HojCNOs7JhCrN4hRUeLeFW7Jwce/s8oh0/yLGGZPmklJG09lTktZ7l
         ae2PuBp1uTiPCbA5pKXEjGydxd7KzmxIqiVsKeZeiNfjfeMvMRF3MmaJMCfY8xs4rP1g
         G6QFZzbnEvRfOtlnvm5nIxA4HsbROBajltN6UosNJ865n1CrCnw3TxschKl6/c0rsSIZ
         zr5CAJpg0o+oYHYWyWwSOggMFEwhPKfoPrqks/tT/vdzuCV8aeex3XXDhd4hwhsOBJqG
         2OyYfrD85/qQL0OVn5G/OE7BDFGStXBNYT/1BJWHeTw3qUMqmUwgY6cN2cJvP6fkuXVZ
         RsVA==
X-Forwarded-Encrypted: i=1; AJvYcCVSMgxDFp8HFQv4Cng1jFcHOMMZLw8VhndWr+OD632h7Nzdzj6yMu+GLj9D3n2F5+z0/LJSjBpfIW5oWfcF@vger.kernel.org
X-Gm-Message-State: AOJu0YzNpQ3ZS4yW1xuJvvZZW91n2iOQKyMbhKbevrKGLzD1oN7eD6nV
	Ugr1sgAH8VMbAQ9m5xno7Xi6S8+WMHvIqHfgab4uDajSusVke/REzVgK2WOux2SWGJw2LSTe7aj
	G5Z3EDGNOyz8Tl/07ihPu9Q4fJjLUcjXRMPkeD0o4Fuu0lxEO/i6w+AorRfPF8pOoX7jO
X-Gm-Gg: AZuq6aIbya1pWUuqM8MsEVP16ZlDBpswGSP95+iKZglJJdFj9kji84SUaubUycv4AZ4
	ubamUMPCufKBDg8/6cX44D9nOLslGeWdHUDaEYW1xb/mZk6G9igKc3rXVsT1TKXlgDAFVHj3jrN
	dOr6ffBTS11qr/tnU+9uizIRvQqTLRJyqeYRUIw3t18rkSfZkiqeg1O+0Dq8P1thUJgmx0sbJPx
	1m9oVgJVtSO0qhkeh6mJH4Htkp3lPIgfNwOku/r4B/lhQx82KKS4D1dX0Thv78yuX/0TfWCLukN
	LvTFRhwAbTs9wLDS1v7xRJjofM+TxU2eyhGIJYBEQMjyHOJfmQmHIwR9R+B23Y+ZtyrbAURe7Hh
	30U0E1mrguTekAJtxUatkhOS4sXC+AzraOA1emWJ4tIbfHthMFw5/5A82id0Ow303gijw/6snhH
	O4vUl1EyWCmwGt4E5iY75Ia9qUmAmsXMsbinY=
X-Received: by 2002:a05:620a:4542:b0:8ca:d5cb:6841 with SMTP id af79cd13be357-8cb8ca6751emr754971385a.49.1771796605962;
        Sun, 22 Feb 2026 13:43:25 -0800 (PST)
X-Received: by 2002:a05:620a:4542:b0:8ca:d5cb:6841 with SMTP id af79cd13be357-8cb8ca6751emr754969485a.49.1771796605555;
        Sun, 22 Feb 2026 13:43:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7878be0sm11421441fa.4.2026.02.22.13.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 13:43:23 -0800 (PST)
Date: Sun, 22 Feb 2026 23:43:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for
 monaco-evk Mezzanine
Message-ID: <dmp6vh2ehf5wi5kglpts7p2kshawkwezilz3dykgi7cwj6uw2z@rpvmltn5yg4d>
References: <20260220-enable_rb4_lvds-v1-1-c6296ef9ccdb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-enable_rb4_lvds-v1-1-c6296ef9ccdb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699b787e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=IyjTvOAsDvkwUc6yvZAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6TovTEcoLWmzcrU4raq0LBcsF3bTVum_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDIwOCBTYWx0ZWRfX2B/GI/Ay9itw
 k8TEY5oyrzfoduudoMsynYgi6YSjdPiekwWBYYO3ggFxoErXjvzKg/eDOPnDP4eRSa59AHTMElg
 HP7u7Z16T/OyrefwS1Cr/bNKVthAcDuaU+cGkeU9LwrcWS1dY8KAHRRoz/1ehOejvnpSj9RR5cf
 a02AvzJjeEQ9VP2cJTHLb0jaekA6GQhtJ5eJmvyTQAn6VhTR6fDrw4FbX7CvdHhwxTorMexmtO/
 FIU/jGcL4zQ47/49/NXNDwQnNW1Ybf1CdZH+LV4tfqrjdx1PGaWWOPNrLZCqHxpa6ZwFCSlhR6Q
 yd1lwh29OEYVLI6xo2TETCDJJMhv+jGg9wx3jFm7fnTgO52SjC7seGzFvj4fBTHrm4/FtOEMhRe
 8shKQ5h255j4jHMaHtJ4IwejWQQlqzE/jcUNZmCavxnPPt2C0LicmQkfkYJTCKp1YKLpx8Er5tk
 c/lSBKCqsB+c/xK/kLA==
X-Proofpoint-GUID: 6TovTEcoLWmzcrU4raq0LBcsF3bTVum_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220208
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93566-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8CEC170809
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 12:05:26PM +0530, Gopi Botlagunta wrote:
> LT9211c bridge and lvds panel node.
> LT9211c is powered by default with reset gpio connected to 66.
> 
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso | 117 +++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
> index 701494d4dd7f..2512bdfbadbf 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
> @@ -11,6 +11,58 @@
>  &{/} {
>  	model = "Qualcomm Technologies, Inc. Monaco-EVK Mezzanine";
>  
> +	panel_lvds: panel-lvds@0 {
> +		compatible = "panel-lvds";

You still don't match the LVDS panel bindings. Also, this patch is being
sent for the third time, but you didn't version it. Please stop. Either
actually read the guildelines and follow them or find somebody else who
can send patches for you.

> +		data-mapping = "vesa-24";
> +		width-mm = <476>;
> +		height-mm = <268>;
> +
> +		status = "okay";
> +

Yes, all the feedback was ignored.

-- 
With best wishes
Dmitry

