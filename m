Return-Path: <linux-arm-msm+bounces-99729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICloCNX5wmlDngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:53:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2FC31C8D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCDC9306C504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B7335A384;
	Tue, 24 Mar 2026 20:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byJTW9Fj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWkw73et"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B839F78F26
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385485; cv=none; b=ZFaRND6MVGrA1tAOApN6/cZFGGhK+Udqu93m4BMcZ30m+HDKcOSosZgQ0emKuVXKYz+YNJKidp4V8pf+fSG7r7q1hCSTPO+ORZC4RHubdW2uK7dOYkU/6cjtb/vwLa1XG1CeheuoHyR5pY1DS2Ua6uG0En2Pz29umr6eoLDJICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385485; c=relaxed/simple;
	bh=MTU+U57pNpsq/dzOmftTdumIq1xKapp8p1N6d4QSp3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjL7gYRqlGGKHAtqRE5M+M2ybUT7m6OM4TFtezh7rWLREMgEe4Ebt1oVhXw6bun5O2RQlLM0cW0zgAM6QWpTAmoCruxmm+dQw8r/zehiLKjaYO+ib14agFmv0akmF4m+26BbknbC83eWqvxiI//v5vab3zHH0H3t8ZT0vsOZZN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byJTW9Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWkw73et; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD7603731423
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LasjIgiDMjJB9GBC9e0xgSJv
	HR934FQ4A1U1HCWpijY=; b=byJTW9FjRi1+CaqmpriT6yB/g+DufB/jf9emRqJt
	09A11AnuYulJOltfc1ITWNfwCPG2cohwMiESWI+prRGedmRYcpRtyQHVrlEo1tSj
	4XPPj6DIhcrn8alJV0Zo1+K7yiz5HVZ4ATmwpxyBVcW5JLCqcWRjwOMgnxWwZ1tP
	VeIMERU5bNZn6Qt/JtNsano+Mb3TInnHeRgEMJVYstahmxwKKrb1FqKSGb5tAK2M
	tOncyh5/GlZcnDBm6ERgRtAxsmFrkcvy9KiHsXKBD1ounbb2VJmf+yz1J4FWSFEX
	2vAh0vEV05Nm9TtdcwY+p/7rfyaTG4mVtYU1VFWY5Pm35w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qketrwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:51:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso297886941cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385482; x=1774990282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LasjIgiDMjJB9GBC9e0xgSJvHR934FQ4A1U1HCWpijY=;
        b=bWkw73etfHIBRxPMhssFrE4TmkSSdXS0/k9dOUxGioYy2RBfkEX7odS2SgKjz4hdyr
         7KeTSvs6mPKFt1GYHxIcDCSznX8zVpdM6EjWnME6ZTWjhLssGfzI112aQdxLwl0pBttQ
         fYTF9jJTg55bV7/66puAr4uqbszz4tdKH75CgR66EvsJmQeW9+shrQD+DyKf1+Ac2mGJ
         +OHJcHpYB7yTdGVbPGvYV5ImRAa3S2RuvR6OjL93rN8+PjvF8990qE9MeQez1RkQ75gm
         LoOfm96WPmqaHrpCf7hLXleIgK+9Tr65FOKKCeXa6gaNcRB8iMpASBREMlaUlCVP55wr
         UZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385482; x=1774990282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LasjIgiDMjJB9GBC9e0xgSJvHR934FQ4A1U1HCWpijY=;
        b=Q+epLXBTrbbIeyBe3DGOl3lWH0UGkoQN3dD3XOGgKJAEQ1u6MGe5pYMe8aBSpViMo6
         oMs41ZHQ2Iul35uJmqA8E6+4cYTJ4udryHEbCrD6dDm5cPMglK+NwzJHEkoqtb2zr7j2
         Oy2Pnu2nr9eFdfwS7hdm8ByqeW/za4HxGpRv9nSUxCNwbwNZqRMsPP8DlJH2nDJlqAFk
         DvQc0kzzP6UsD5KCtxdNBMqSHWTrC3p9ROxshwDw3tbSvOTls0UweT6+xvfmxIvbc92g
         SPQHP2MIFuW4Cr60h6Y/NZJ2Qj3dRsW0UTYy4Yq1rHJEimOyhjBe3RbDNTI0eEPC498Z
         9lXg==
X-Forwarded-Encrypted: i=1; AJvYcCUtMmNFo5N/phbEeJu1NiFQ2cXwzzd+4QMFH5mQH4tSCQS9TDrpYEuGWAwlwlEQHDjCtHJttHMilFv7ZHvn@vger.kernel.org
X-Gm-Message-State: AOJu0YzNpEEjsvOSeXxH/2irnmR0dvcT2M/FIo7+beWMhzsHVj4btzi1
	5X99olfJ0NRrfutaAK/Mhp60dhOXUVM3nm4uHgZZ80wxUQtviYDV7VfVeoz52i+iEWKxmfbv3j3
	NtTx1tIhG5JUEFdxigJjA7hNcQmwAvjjp4YAu+DQlXSBEjubrmlEHQu2KeLFDll0XF509
X-Gm-Gg: ATEYQzxKr1RjZyvcGgI+NuJnPASlxNI6h/eLqB+YBzr8ieBbQtRXd3fgqoGKx144jrG
	CpMjMNrviUWO8z5Cz2oPnQsCbjnX/u4sI3i8EofzdejFWgjtAb/PnieSOqbms8cneejXDZV2TIO
	3n6ZsK8IwWxkPNdKPYVZ1LaGcK48j8Wp9kZ+lMXi7yZvMtDbI6x6mVikQKCeyWvqIpKZUg1LWf8
	FwoVosJlKDLEJBoI9h/DO8zkI4R9B3q3DvgmYnwXR+Lcyx6AmphoeI9z9rlEYpk/pLMasap2sIC
	XKKJ3/PWLCVCHL/XohzPysjBKeBKZQ36/TsgaWcS0/Quxm5g8x9wZhStrI1pvFyhjcTiRfmOCpM
	lHBFVh0Yt6F6TYuoQtqm9VhtQ3/+JbI1Ki204DrmwVPt4An6WPazEaMg4VstB/aIPahht8nv1GT
	wflnms+ms/XKF4C0s908JhFS3B8QLEY40mAzE=
X-Received: by 2002:a05:622a:6684:b0:50b:1932:c9e with SMTP id d75a77b69052e-50b80ddf966mr11475031cf.39.1774385482010;
        Tue, 24 Mar 2026 13:51:22 -0700 (PDT)
X-Received: by 2002:a05:622a:6684:b0:50b:1932:c9e with SMTP id d75a77b69052e-50b80ddf966mr11474741cf.39.1774385481534;
        Tue, 24 Mar 2026 13:51:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9982a6csm33495351fa.25.2026.03.24.13.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:51:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:51:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
Message-ID: <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
X-Proofpoint-GUID: YrkWkQb_2gJkTgPN48RIYHGz9mdWleAj
X-Proofpoint-ORIG-GUID: YrkWkQb_2gJkTgPN48RIYHGz9mdWleAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfX9SgaXGzLfFN7
 3Ptmyv+vTOv2Ioz8w1GPesCcyn61cAXwMSEpMNCPzdZKJpLtVrc5Pxt5Ij8B+SIod6MewkODNcL
 KNDiqNN/4lOn/p3ARsioqUzX31zIg+V7to0PsjUEeNhIs6anu6br0B8sLa9TZLfY5kDj8A8nOfY
 UjG+xp8M6Tg75eZP3PfBgMb8HCx6WyK1/lJIVhJYQIbA1gUQHBpgXKu7UVe0OCuBDmx7//m1uz/
 FBVTKtpfo+5dF5ZqCSZsGYRKsncSPqCjlTFspj0JpmUABvnWLIHVL6N9zwHXUaiEwsxFM1vg94w
 ifbTbKHI2Kjw1DsNSmltlLVIcYwV539ucc264/xuZm0NQ9RsJ1qA9q4ISgcfDbQMR1nk7uHpxjk
 WavCc0PVFcCbKMZG/lMrYCLls1jv/jMU9HaQMiSemD75+44URZQdKWhvbS40uZjSRHXMIRTyaho
 QPXRV48dPVq99lKmDww==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c2f94a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LxJgUt3ayfaw469zrgcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240161
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99729-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B2FC31C8D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 75716b4a58d6..fd727924b8ca 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>  
>  	};
>  
> +	qspi_opp_table: opp-table-qspi {

Why is it not defined inside the QSPI device itself?

> +		compatible = "operating-points-v2";
> +
> +		opp-60000000 {
> +			opp-hz = /bits/ 64 <60000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-133250000 {
> +			opp-hz = /bits/ 64 <133250000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-266500000 {
> +			opp-hz = /bits/ 64 <266500000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +
>  	qup_opp_table: opp-table-qup {
>  		compatible = "operating-points-v2";
>  

-- 
With best wishes
Dmitry

