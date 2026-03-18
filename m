Return-Path: <linux-arm-msm+bounces-98325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAoqN0lOumlUUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:03:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A72B6A7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7AFF30584B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 07:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2BC369201;
	Wed, 18 Mar 2026 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQ6J8wIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKEMNR5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FE1366DC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817366; cv=none; b=FLv9x2q3iI4XlF5uMYswvLOxus5rysmFIyBq9H8F9wRmrm7a2rnDh6Hv5Gdkqudw3sCpZi47md8VjY9EvyskAdkb+ap6KdegHISr8DgFue5i5HsVe56IJXjUBP+bFkxbo2MjUqsgjFbowaGj9o8U/fYH3+xPlWmHieVvyHPKMP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817366; c=relaxed/simple;
	bh=i+AwOXTtWkfrSMKjirAmr1vwwWv0pMTyVChyb6WH33Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEPeNRQaJmu3+LbFD1uom6RSh4fTNhSP87roFe+6msPijr77Mzk6UZvEugLGm3jLiXUyd54nOUBO/sBTsSvgpjArBP4qDSX6o+V1HVcDXWyrCIOtloSfF9ibTW7Pm2ZSzRSeaz5ZslM9x0PcHIVUoEjbX6vuUATbq+JYLTqDk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQ6J8wIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKEMNR5B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I394Og932158
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KdScftqO3c9m/7sOsNC2bhRy
	GM2+w6SbAEvCY63rSQo=; b=MQ6J8wIAMy6QUUhQ5Ief6ZxQSba+3nRU4fb3Xyl5
	1Ocd4DZaqHE8IFNSzKQHHZlF3xGQkP6BEoBPtR7gEMPVTljZtKdyZvVdzwt71TKr
	1MRNLhN7bbNFGRtpTtV9k/a8HjH5+J3z2y0UAyc8xS/sm+6ngEZhKMg7K0HViezq
	EKU0SWRGFH3EKP0syMfVVLqS1pANYoADxd6qYdTi6qgxKv7n4rWpGTr9Hv8qcCRs
	rpUxc9599w0R66wPx20/t1ihB5EV5rqlNHXmxZ3/nFMupCsZiM7wgMDvVhd/9psT
	Ixn8bsFAIuYOERc8c81GHyidDIlmmimyiXPZ2/B/J4N3nw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy9jr37gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:02:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8b37d4b2so415845285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 00:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773817362; x=1774422162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KdScftqO3c9m/7sOsNC2bhRyGM2+w6SbAEvCY63rSQo=;
        b=YKEMNR5BakKy0qycx1Liv6FEDkROLr8wMSVQ5fNYCMvaIIhAgFBEbtLvoZjKFaZByr
         peIRInDGXBZri2qkN1IxuHysZYj37sMAyr23/vCTa4Y5Q0/VMp7WF8pe5/v9neVf7qyQ
         2iy/u+n9MHrQyfs42RGT797r/sibeny+V8f001dOLZgCbph/1Znge/TMtTlenDrBzfpU
         7aDjE9cth02npvGAOqqS2JZRl9t2RopcRY1GyQZTCQU3IhkDBuOoxXGf+Zx2fhRvPDBJ
         efQBB0mRTtrkQcgniDlCqpTOuelL5cMdFaPfqNTObk+yFx/eUcrbDyYrkHm02KUbydhL
         eRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773817362; x=1774422162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdScftqO3c9m/7sOsNC2bhRyGM2+w6SbAEvCY63rSQo=;
        b=I5Ii/TX1PQgKleKGcbUlxub0gXe/DKD+EYk4k5BQKgPmaxXkfE1TeJCe7jcUFyPsyu
         4pnWxkT1p+a3oXQeO8N7Lu10fATMpfUoVksx6+B/Ix14LAI3XFz6W0ShC0ZNLR49FQv/
         0SlXt3LMLYzulPs0u7MV+NcC8Phz9DAn3RbTAYnlGUDY0NzU1KTRucvomEqytRdx4mU3
         P4XZXcwn/Qylm8PT5eLg9JZxFJmPwvtDUt9xQ+GxtbSPrMl1iXo4S9LTyMiu4iQ7kAd8
         U4Zm85YbeHRZV06kt8njMC7xc0llK79rpxDTj77eYh4N08Q6x1rbjdBqv1A2UyZlrtsB
         pXnw==
X-Forwarded-Encrypted: i=1; AJvYcCULeqfTqSsOqGooIQW7c+mQkj/MpG3Dmq7RjhL50DwKRpx2CEDR671QwrfPkLWthsNk3COGjG3vQxM3VBlm@vger.kernel.org
X-Gm-Message-State: AOJu0YyYCn/SMfPy2n/6Q+SYRUOhTMa1qCslEDgtt8BeVJwmChWWLbiT
	IyjnuQ3RGwkvvoJJvjE/wVtPST4lZG4y65uodiTGNIEpNKXlu/ZOgfV4iKxwhzi2kf2D0hsDazL
	155Bw8S2D/k5L/7b3M6K3QkU9i9EjIgfpq5c3wW27KySjU7mCbTVEb6BO6jWYZZSFHe4i
X-Gm-Gg: ATEYQzz/JhvIeE29Mk2/5WY5Q0aXaotORJWKWs23wf61BEi61DjrqQJBr/8ugc9pkVD
	K2UuVoJgL7wPP2YdO2e2eQjreJenjjT8zl8qWmNrhvwt2QEJDv1XoNAoQRW4f2cdypJLwdWkTV8
	TqMvJulzCg7yAWztm6eNpO4hru7dj5Ya9IDkqFI78R54aNszo/dyQKDu7I3e7ph0s+jy5eB1txi
	HG9eTAMHfbJ8pzzS7RL33WvrFdsFbNv689U3Hu9b43CpLt6EEYf7GQD1kc6s6rzBFAdo5lDCUdL
	4J2M7ji0gxBVld0hw9By4Mzj1c9eWOUlb+msmV4biA4W1QL3+svBvreA3iOCirgFx6+xSAcD4Mz
	aY/60JcgaQ13OQSRc9olf8BzroBOPiXbwGZtqiqEO1AcoJNmdEgyRcAd5fPo2DgRZTpCp4lmNsJ
	GM2MlkGsKwujw+f7WHCnXd07mW3l0VbH5YmCw=
X-Received: by 2002:a05:620a:17ac:b0:8cd:b342:14ef with SMTP id af79cd13be357-8cfad2305f0mr320450585a.7.1773817362123;
        Wed, 18 Mar 2026 00:02:42 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:8cd:b342:14ef with SMTP id af79cd13be357-8cfad2305f0mr320447185a.7.1773817361606;
        Wed, 18 Mar 2026 00:02:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54dbf75sm3764491fa.37.2026.03.18.00.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:02:40 -0700 (PDT)
Date: Wed, 18 Mar 2026 09:02:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8650: correct Iris corners for
 the MXC rail
Message-ID: <scsvyc7vb3lnk6mktwltdac5bkynvrzd4jrx7dwceeesbqnhrh@clz7d5e3igkk>
References: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
 <20260313-iris-fix-corners-v1-5-32a393c25dda@oss.qualcomm.com>
 <8dd814c0-039e-c8aa-2588-9c1edbadaf47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dd814c0-039e-c8aa-2588-9c1edbadaf47@oss.qualcomm.com>
X-Proofpoint-GUID: _SXE-htXzF179J87PGg6jRnGlSg6-Avz
X-Proofpoint-ORIG-GUID: _SXE-htXzF179J87PGg6jRnGlSg6-Avz
X-Authority-Analysis: v=2.4 cv=NdjrFmD4 c=1 sm=1 tr=0 ts=69ba4e12 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5EybdfDisuMDc0MB74oA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA1OCBTYWx0ZWRfX9Z8ekf3mfuWb
 eBk1huCYSbKaEp3YKSpeWmEj5Ihs2hWX6f6aam5YjmN+cQF3eYWIod/Pw2lXGEQ5hP3SB3xhMzP
 mhEitxqLfPchdKmH3vUHKL47qF1PTzmgKz8hWcCm9cla4znBQgKH1SiiXwxsSPXHJefBjR0gkhG
 A0exRvfVoqkf+EUYrbsfP101w7NNyH2DTxVLWGicvPbEb0QQeEXYUrCxkqyKgOv2NGhBlNaino2
 Ha8LlKxSvXdWgXQ/+Zs0kOc/m+HbWO1OAih1pAvg+8YBF7Dh98XztBQfb6GiqsqL9NMFIbCNReu
 07c3fqOpCicDp/tdpBRmegFeLWLl0ue+qPeRCQHCp6IJ1f9I/G4cyWvKdbU5KK16hjhdqkvYmoS
 6wefK1kp+AeSZlV6yubp66mIaiXYhQ74jR1ntNMAN83nudAOrLYsA+ltnrykUQHJID/9rOfJtW6
 yFJHGzKoIF6JocPNKsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180058
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98325-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 7C5A72B6A7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:54:07AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/13/2026 8:57 PM, Dmitry Baryshkov wrote:
> > The corners of the MVS0 / MVS0C clocks on the MMCX rail don't always
> > match the PLL corners on the MXC rail. Correct the performance corners
> > for the MXC rail following the PLL documentation.
> > 
> > Fixes: 56cf5ad39a55 ("arm64: dts: qcom: sm8650: add iris DT node")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8650.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > index 357e43b90740..9437360ea215 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > @@ -5236,13 +5236,13 @@ opp-196000000 {
> >  
> >  				opp-300000000 {
> >  					opp-hz = /bits/ 64 <300000000>;
> 
> I see in the document that this level value should be 280000000, could you
> pls check and update accordingly.

I cross-checked, the table for SM8650 lists 300 MHz here.

> 
> > -					required-opps = <&rpmhpd_opp_low_svs>,
> > +					required-opps = <&rpmhpd_opp_svs>,
> >  							<&rpmhpd_opp_low_svs>;
> >  				};
> >  
> >  				opp-380000000 {
> >  					opp-hz = /bits/ 64 <380000000>;
> > -					required-opps = <&rpmhpd_opp_svs>,
> > +					required-opps = <&rpmhpd_opp_svs_l1>,
> >  							<&rpmhpd_opp_svs>;
> >  				};
> >  
> > @@ -5254,13 +5254,13 @@ opp-435000000 {
> >  
> >  				opp-480000000 {
> >  					opp-hz = /bits/ 64 <480000000>;
> > -					required-opps = <&rpmhpd_opp_nom>,
> > +					required-opps = <&rpmhpd_opp_svs_l1>,
> >  							<&rpmhpd_opp_nom>;
> >  				};
> >  
> >  				opp-533333334 {
> >  					opp-hz = /bits/ 64 <533333334>;
> > -					required-opps = <&rpmhpd_opp_turbo>,
> > +					required-opps = <&rpmhpd_opp_svs_l1>,
> >  							<&rpmhpd_opp_turbo>;
> >  				};
> >  			};
> > 
> 
> with above comment addressed.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry

