Return-Path: <linux-arm-msm+bounces-96344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGH1GzQmr2kTOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:57:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6D240772
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22DCD303AA8E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 19:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B22F345745;
	Mon,  9 Mar 2026 19:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKJzM0+p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ll78BIes"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CD8410D1F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 19:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085928; cv=none; b=neiylS/mwGhL3aSciQQ8cNSnKI7MtagD8QMtv8FjF07zSnHv/xdvIL/lWw+kAIQ6twHVNvseWAfHk65YxQHvfbGbSrireV+bU2aeAXnFgZjPHNnbKmLE2/TUpdm/se5pOohV89SgmFZQWK+IjYuSNCuGbBmpPoqLVoBkdc+q1nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085928; c=relaxed/simple;
	bh=CSMH3GL08F/Gkm+WxEjZvu69ACUcFz2jZCL1xXNSTYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1FQPuz+ZHYw3YOgkyYLruOYpTmCEAvvBQP5FQgY16gX3XpWd3Xkb1vJ+kHnvFxIawfdUu3/OZGOjlwZ0OujY+mUSO0qL1yoFZ/pvzT02xwqTWw695X+4vTv7FOkr7i1iUYjDgxVCrn/hoYD3rTUjVA81OTgF4m6hRX9EA6fG4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKJzM0+p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ll78BIes; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBrmB3148279
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 19:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IMagtpBiZrH/wMiGhDlnrnUK
	e1QX+fCXLXzkqyMeav0=; b=kKJzM0+pB5tywyXdyYl6D3J6OdPQvzXOnfrDvYC+
	9SjBYg6i6yVtQa+K1MW865il1nRCBMB7Od2Nr4+hVSYLricKHPDosD2eLOYN3Fh8
	sNwnrt+aHXus3Cs6Kpg6QEqhOywUDidrMGAuSABmZoOyqMNXxR/ZIxkyZ0sMTj5W
	l766Bbz5GGabuuWO7JlsHtRbfQ5B+d5OZuKh0FOQRIIWI5gsrJa33eTcvKSGI3WB
	qJUd6bdd5sV+JxMlYKtDIKvxByLCMeLzYecXvLMGM2PB0QmB/B7sGDY42ESWuYvV
	vvuwkjetXxCqhZfIyusgiEKgpQjsso7KJaMykmlEaRkUcQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u9wv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 19:52:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89502dfd7b4so708625876d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773085925; x=1773690725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IMagtpBiZrH/wMiGhDlnrnUKe1QX+fCXLXzkqyMeav0=;
        b=Ll78BIes2v1nRxsZ87/g7aazQlnETe8zElf/byCps2c0mxUaUCz9g3+L9WFoaKsmuM
         mhA0zrleAjstLXa2uUzURv+rzXtYI65EMFTp+GIKGrceynTYKQCyVK+VhTfgrzWJ0Sf0
         PYUkN4KSOlLEResD6wl1cs+f5lDAUjwo1MBBzL5+EmnyhFDFmts7TeoAgmlUlB91AQZ+
         3ASeHwajB/PaKZ1d0gtHfFHTa/UERl1ABnSgvIb3KYC82NcMgnLkcBxrt9U4kdV8ttMh
         BJdIQw5vfdN+q+sONT0uavseF/xfkWm27YzWEldJzMQu/RWgt/G2YvP7BmNramE3I3f0
         q/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773085925; x=1773690725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMagtpBiZrH/wMiGhDlnrnUKe1QX+fCXLXzkqyMeav0=;
        b=tk8kHv+SEoGRHTEUxmqU7b6jYAeGlhW5ACZYmnN6sjR1zur63NekUNt6vhu7tlv41w
         wm5ptOOpNHDV8QA1cSa4DVu8+kNO2f3eKZmmNxgfLVGnDAn97g/fLJCV7kwYrniFDojK
         k0JTV1tQsKNa2t8IpBt+QvBdJ3Q1/NGWzqS7Cf7JCwjSCKFaN6AAxiQcWTRzpl2oTn/r
         pH9TCRe1OTeDGdbHX63uobLe95K5fTKFrZfnBio4ghAZ9so6Dr3669/zksCfy2YLQ4oP
         +hyX+5g+6Z5pmxE6mG+R1hsGBgW5pLxcbZcNFU7BJeoQnP53h9ZL9wuSD3GYxTlkANJl
         roxg==
X-Forwarded-Encrypted: i=1; AJvYcCUCLHsSPcvrLfjKLqCn7UeOm8GcZvTc57uXNf9S8bYtLjfNEzC9FNl3mQpReFEYvQdYmaUSuAmmAsHZhkP1@vger.kernel.org
X-Gm-Message-State: AOJu0YzpMMlH2q4smr9W0jsNLS30POL1V+m+sPYNLOAvr7R/kAB+wN0C
	1xGYP1bdlzWhKC+iKK52l4crLihvQEDAt5ODq8QEbm1wE/QHtL76ViV4cvpD2LBY/KKfKRsJMup
	r556X2RHf+HDu0PfsYr0v22j5a82NebpwACR3nj5MDCtatRGSuU+D/IhUkDOi+5wc4VXI
X-Gm-Gg: ATEYQzxARoJ+R7cSt2yzUGDg1Z3J0zbo6BMgqv7J658lRSAu12C+rDJjRVgG8tI9M/1
	HmqU9S/CKiiVqdicbgNRyPlB7xOoQVdnyXH9PusnBLSf4LNGJBhTS5G/kPZjZ0/UJhHi/82DFqa
	R1wvQa8LMTna4Z+RODb6IiLots50XkujWTY0hK6p7YWLaH8RjhdCGCRTf3RUEGfJwynSxPFMwt/
	WaNocj6AsEy9tCh39SaG44cbIUTX73jcnsxFgX84RDmeoUM2adJkA2GApUkzSaHDqkkasi4Q3iB
	bDq0At4UiBSK9vOpveDI9Pqb2jArQxK2P5hBsR8uDU+4ihYVGdQYX47yuYRvKerBqOdHrt7l2dA
	UkXrW3fwI/tirGhiDpSkSx0fSWDa8ec0IbRMNWWRy5Mr+MhZP0XKtxiPjU/NfMwSWfs/8ZIQ6Qt
	t1+A0LAk2yz1s3Fyy0FYV113R7pb7UgoGS/Jk=
X-Received: by 2002:a05:620a:461f:b0:8cd:9468:691c with SMTP id af79cd13be357-8cd94686d66mr42379685a.14.1773085925298;
        Mon, 09 Mar 2026 12:52:05 -0700 (PDT)
X-Received: by 2002:a05:620a:461f:b0:8cd:9468:691c with SMTP id af79cd13be357-8cd94686d66mr42375285a.14.1773085924752;
        Mon, 09 Mar 2026 12:52:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d057711sm892551fa.31.2026.03.09.12.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:52:03 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:52:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
Message-ID: <taqh3ipe54cgjwcvyqnysg7dx56mweo7zld3jvmv6goq2vo4b4@ea7ksdyyn3dh>
References: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
X-Proofpoint-GUID: UPOGBBIygKNJq76FS_WEJhqMUBLZzKr8
X-Proofpoint-ORIG-GUID: UPOGBBIygKNJq76FS_WEJhqMUBLZzKr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3NiBTYWx0ZWRfXxcGsDryfJWQw
 1QCbv3bhJwfKw2x3Yclqxf651Ir2A07haj2ZGshoAKpY8AfWzZ60QbHNhIl8EEH2CTNxDPlOeMt
 y/evh8UfJZeNMQDjNUdkbkcz9HrvQX04FqyTr9WigzhgLmD4SgEiRJdybAI5QSgm7AnnPvWQ9tO
 B3t/gj7zfzDFGaZRfeUJfKHEVS4Gf9X3yExZeTgsIkXCyszdSFV89SCvntQ3w5XbxWaKigQ4RR1
 TqRpt8XOtQc6TGPwI0IDMkhJCAqJyfv2UxQ0N3qhJwaB8DqtpQxHLofYqSpff6sV2Odq/bStnHn
 C8nkIQEcDh6S+Y/v2J8DeEOR426w5QDy4gdJmomyMANW+M6LixrYnDCrwSf6blv5c5Yspcg9Bij
 Mwav1uIGbxXd+kw3LbPGf4OZwammBRSuybbv6Uw/sM9PMOC3J9nTAEjWWoT12HPv69WT3MOcgVh
 rgJfTfaStgaJ9I7GWCg==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af24e6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JFmwBri28pQwXZ3GTlIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090176
X-Rspamd-Queue-Id: C7F6D240772
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96344-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 04:44:45PM +0200, Abel Vesa wrote:
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
> documentation.
> 
> The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
> for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
> in that case.

The list of issues isn't limited to Hamoa. As we started to look at it,
could you please also fix Lemans (drop 160, 270, use 594 instead of
540, use single OPP table), Monaco (the same), SAR2130P (leave just 270
and 810), sc7180 (270 at low_svs, drop 160), etc.

> 
> Cc: stable@vger.kernel.org # v6.9+
> Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 49 +++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 4b0784af4bd3..645bc412b0aa 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -5658,18 +5658,18 @@ mdss_dp0_out: endpoint {
>  				mdss_dp0_opp_table: opp-table {
>  					compatible = "operating-points-v2";
>  
> -					opp-160000000 {
> -						opp-hz = /bits/ 64 <160000000>;
> -						required-opps = <&rpmhpd_opp_low_svs>;
> -					};
> -
>  					opp-270000000 {
>  						opp-hz = /bits/ 64 <270000000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
>  					};
>  
>  					opp-540000000 {
>  						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-594000000 {
> +						opp-hz = /bits/ 64 <594000000>;
>  						required-opps = <&rpmhpd_opp_svs_l1>;
>  					};
>  
> @@ -5747,18 +5747,18 @@ mdss_dp1_out: endpoint {
>  				mdss_dp1_opp_table: opp-table {
>  					compatible = "operating-points-v2";
>  
> -					opp-160000000 {
> -						opp-hz = /bits/ 64 <160000000>;
> -						required-opps = <&rpmhpd_opp_low_svs>;
> -					};
> -
>  					opp-270000000 {
>  						opp-hz = /bits/ 64 <270000000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
>  					};
>  
>  					opp-540000000 {
>  						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-594000000 {
> +						opp-hz = /bits/ 64 <594000000>;
>  						required-opps = <&rpmhpd_opp_svs_l1>;
>  					};
>  
> @@ -5835,18 +5835,18 @@ mdss_dp2_out: endpoint {
>  				mdss_dp2_opp_table: opp-table {
>  					compatible = "operating-points-v2";
>  
> -					opp-160000000 {
> -						opp-hz = /bits/ 64 <160000000>;
> -						required-opps = <&rpmhpd_opp_low_svs>;
> -					};
> -
>  					opp-270000000 {
>  						opp-hz = /bits/ 64 <270000000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
>  					};
>  
>  					opp-540000000 {
>  						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-594000000 {
> +						opp-hz = /bits/ 64 <594000000>;
>  						required-opps = <&rpmhpd_opp_svs_l1>;
>  					};
>  
> @@ -5918,19 +5918,14 @@ mdss_dp3_out: endpoint {
>  				mdss_dp3_opp_table: opp-table {
>  					compatible = "operating-points-v2";
>  
> -					opp-160000000 {
> -						opp-hz = /bits/ 64 <160000000>;
> -						required-opps = <&rpmhpd_opp_low_svs>;
> -					};
> -
>  					opp-270000000 {
>  						opp-hz = /bits/ 64 <270000000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
>  					};
>  
> -					opp-540000000 {
> -						opp-hz = /bits/ 64 <540000000>;
> -						required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-594000000 {
> +						opp-hz = /bits/ 64 <594000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
>  					};
>  
>  					opp-810000000 {
> 
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260309-hamoa-fix-dp3-opp-table-453b8a5e3bc0
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

