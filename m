Return-Path: <linux-arm-msm+bounces-99484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCiMI9vmwWkYXwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:20:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B223300725
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE244301D269
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC080366074;
	Tue, 24 Mar 2026 01:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zjm8gTIU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuqREtLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A75277017
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315222; cv=none; b=gcNksffZ+Bdq6MpeHe8oEw98xmfE4x0JjDVBLcq0jn0bpnFJrLA2vTkQSlziNmLe8K+iIuA6Nji4Sgr1ZCtYSutRh0Q3C2yrz4y/q/jlTjONfpNQ91ew3vQjouWbAkx4iJpW6ekfSKZmyHXTGbYl19t2D//a461IA7IPJkd6Kf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315222; c=relaxed/simple;
	bh=7AcDloYlbqh5oVY63/MUJbPKuyPcKQ0KypBfk6uLxV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzC62bXMrtRYiDdsopW2grcI3s5XXUGpLLLwcilPwiUvGCK3cIutXFgHnDzx+7wywcqGa2BCHhs7FQJkvw/SRCptRdHFZDFqpy9KrRjS2gSgFiZtvP3XZbDkLsgINsd6xnqI++IQw14OVk99anpNTvPRS/f67lyUb3dKLXIIltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zjm8gTIU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuqREtLH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWVl3817405
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JyrOfxSQchyqJ1Obc3zJ2UKA
	7v+UsW8UYvgtSqzGnKY=; b=Zjm8gTIUDhNp+ppYUAa+v7LQp+s773ygf4Hcd9Qy
	vDUhfhVUoNyPDkjbIsAH6krW2nQ/4VWj5IEHPQX38zOU7mLJz+fnYLgVaPxv8A5I
	3X1H8dd3/wSV3NzjApritSs8OMH5qIA0Xsxsu/u+tCF4Yjkm8CGvMTZxhUE+SI1V
	+2qqjUgv3Y0/WHbKMYnG6KZRT9wbnInFCgn7EPNpiQ2BTMx6zsCx+MsPnjfI0Rc+
	B15VlcbjHEKscPs+fxceJ6vJ8VeyU3bQJqiww5BNM9DEUYRA6UvFdCIgn4P1u5SU
	IUEk1WKro7qSoUfSbjgva0i+heHVdKc6BZ0/E2PvzFl4Jg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w2heu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:20:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so296097201cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774315220; x=1774920020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JyrOfxSQchyqJ1Obc3zJ2UKA7v+UsW8UYvgtSqzGnKY=;
        b=IuqREtLHI2YqF3QMaLGnneIsGmRMGWyO51o7gdFHG/Zi7mx70OhyiFvgSevt7Q8kiD
         f75hKyLaQ293dHWWwUi9+Uo6dycbSpj7487VF+Uf2zxYOa7BqpGKOX5jLj5Sz2f3BaPe
         KHmqbDxtpsEQ45SU+hbDMZhCyklfCC2mPa+O52PwTcB/ZEmqRvKxV2rLCfi9d5xSO6si
         b+AVkq73Fvzy5EKKONkdzzlpCLSvII99qu+IppKZb7OJdW7AnqJyZHQv1edSOs6dhbl2
         j3ap2fpAuhybpVhn5byZzdp294Odob3VUBYgObh1a7jyOYWvEQgS04nS6X6HzCW5e7wW
         Iggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774315220; x=1774920020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyrOfxSQchyqJ1Obc3zJ2UKA7v+UsW8UYvgtSqzGnKY=;
        b=DU4A7FiqTiz3zwEiIca32b24Vpwk/i2neNh527KSr1we8MQi6cigKdz7GTrRAuSHn/
         fJ5b+S7HnHGSXQy+qYblEjt2AtMgN3/axhzrLYVWoG0sXN++FCBkz4+fm2PiIw3HFV4Y
         WUCYlnTGhudhO95I4ZGUWlg9uBjjfCWLkKeL8W2KfZRS3a2JEfHjzh32uMIxdjoKNXhb
         zTe0AqdvTK8R7rv+zC4vw6IJOELURk/MVW5i0qFzzHIcnDtM3wJsKwhjVyivDg41uQCu
         KVeFLgH8Vidvp3iHXP4PgcchJZa/b+ujexkIC1DaiCgrBLygu7MbmQgkMDDvQ25H35+G
         6UJg==
X-Forwarded-Encrypted: i=1; AJvYcCXcEW8Nqiu2yDWtFBic3pBLZuALDUe3x4FHO3E1rrRwb+4Hoz8mGPuqCVnpJEIblnLJHQrzyX9oDBH1a1Gy@vger.kernel.org
X-Gm-Message-State: AOJu0YwgiUFE51GnpTAhNPIRKD/mI6lOnvITVx/aIWQfZ9sIUdTK+wXg
	ntWJag7FxQ6kn14gjC9ix1Zryr2tIS+XvGZ8nXSPtjcneGXduEUiYD1cYyuBdpSE7TrumCYPDk/
	gQG1jMKg34OpMgMVU005k7Np8noKAHUPV1uSsZuIBjWXPZKxnKV/63zqeHgIZ/47xk3RC8hVNHr
	CD
X-Gm-Gg: ATEYQzyGA31ogq5WAGwG5v/192HF4q5VtykE+sxFG6pVulsdSaR7J/CWNE3Mkpd+VkM
	3azKPgqSP5TlvUP4UGngn6gl+DuyhQ/wSNjWMa6btjpwE9vtTxAR3TvH4c8Ep5n/YqkGPEIeWnn
	v5SW7s4Y4I7gkjBkClr/yxfHq4UN2I3/5ZzDVhOKzvY1d0RlKvkumG9oRli0Pma+k/r7MpKdMrq
	8l0fGNdISr69wzc0BtiQoxxTVMsbCbUXLCZ8x40A/QsFF2UsBsBrXgbve1BSHwmR9kvOgxYVz+j
	ir7dswimM27WjcI8YLrUZHycaJ2878doLuHChJBI5xlS9O/dzeaIbqjzL+gK+TOlCLtTm7pgCCQ
	4XSelcjVtVeao1ih9ADMzMKU8mB7hM7PubY651IWqrll+t9on480KrD2gtSWLoSajUEWdGtvNG8
	OA2OQHgKRfCEtyc8ku7ihl3JQJkktGUR+IPUI=
X-Received: by 2002:a05:622a:4c86:b0:50b:4d27:bebb with SMTP id d75a77b69052e-50b4d27c6afmr132824671cf.14.1774315219668;
        Mon, 23 Mar 2026 18:20:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4c86:b0:50b:4d27:bebb with SMTP id d75a77b69052e-50b4d27c6afmr132824421cf.14.1774315219241;
        Mon, 23 Mar 2026 18:20:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192ac4sm2937732e87.15.2026.03.23.18.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:20:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:20:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kaanapali: add display hardware
 devices
Message-ID: <vqj2pvtjs7dgkr65e4mzt6ezoxgq5gl5kyxbbol3tbtvw6bltx@yhf2x7oix2ss>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-5-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-5-70bc40ea4428@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1e6d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=LbeyiLmEbei7xv_c5ycA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: k-vGWptwhxsKhVck47y9zfaquznrExpw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwOSBTYWx0ZWRfXwxHekDgbB8Mj
 xkUN1dB4Itq4H4wTWakArvlXD+wv0jm7UxByTJTphjLLLdCN1bpf8/g7pIbwNJzNXljjPA9TqrG
 sT5dmkz29l3cieIqpQMECSZjsYj7ltaxIXFOwoilmpKrIWbBEFLq4aLCVD6ZMy4no/m8h2joGDq
 bqh5wkvK1uvqIzcJfzTZGVmYJ5dTi5qEdRDSBh/PmRW3xTQLTKvDi3IZetIu9hgsDSlh2IzokAU
 mZg3loIDzfTiHv7+S2jp+5CIea+QA2Re+mep6qFJKKnwcYqt291inXxMMvOIJpOjiaSw/wPTKj5
 IRqRJdyVHo8vaosJ+Y9K0IyzTrtRosNYXYQi88swt27EQMhiEGHoCyszQry38zCjpN7/jvEkhq8
 M++foPIA1uJU8d7NvIjRgNvKlUoixKPtPFxcIfWT98sC569NcZc6qvfFLn4M5TFIlWnFogu5u+4
 oHUt2NUdxHX9ir4tqtg==
X-Proofpoint-GUID: k-vGWptwhxsKhVck47y9zfaquznrExpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240009
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99484-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,0.0.0.1:email,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B223300725
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 11:19:45PM -0700, Jingyi Wang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add MDSS/MDP/DSI controllers and DSI PHYs for Kaanapali. DP controllers
> are not included.

Why?

> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 242 +++++++++++++++++++++++++++++++-
>  1 file changed, 240 insertions(+), 2 deletions(-)
> 
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss_dsi0_in>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dpu_intf2_out: endpoint {

Missing DSI1. Please add it back.

> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						dpu_intf0_out: endpoint {
> +						};
> +					};
> +				};
> +

-- 
With best wishes
Dmitry

