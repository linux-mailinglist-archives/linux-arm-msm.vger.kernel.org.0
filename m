Return-Path: <linux-arm-msm+bounces-103206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCPhIgiE3mmcFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:14:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D80503FD8CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C8913077E1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4A0313E38;
	Tue, 14 Apr 2026 18:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/wX7mNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfpRw3Yo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC44D313298
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190177; cv=none; b=nVZq3U3DD+PEjhJ/sko2P4HvkXrgfv+glVM21j9Oe7ro/opFxtERtomDa2lthIqb9jNFsrbD4iJdSbcE4ntSla8eszOtsuaEPeqEgVnY8cXuxdJL+SauTTTZB+KqcIKHBKPeBSRxVvnyAIhFJOVtYWuocti+UV58OHEg6dr37+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190177; c=relaxed/simple;
	bh=5w82pKv2WXWufedJS7qwaq74wFIN3FEp4pAdIB3xyIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+xmqQWlN9uXJs24HPwwUYxu49aumnvLbTaV3NyVDMBpEsblDlWoA0VeNnVsgp8e3HS3tv1KI3F3WIky4Y7yXWkazSAks60oSWpDzceHq692AP4H47+T4fbSo0Dh7zdMMWwCHeQDx1iDCTZiSzLfTbFrmcHJa/ZdjOgEQqUsr10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/wX7mNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfpRw3Yo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EI0ZUT3759266
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tQW4iwUWFCyZ/sLRwcLBhiq2
	cIYCo+JQjo0/ZUZNJxc=; b=T/wX7mNbSFD/lS7IypR04Pg08Xt+/elmHObc+CtY
	PV8d0sfcC+HkfoV1oELHC4DI32KYL+taLtuDfa1nVXFCV34i9GxnGDSmnNqSx4Q7
	laJfDIjOdppBYk1O0bFqMB0ugtgTVaFmRrLoGv+yNoRaaRY2l27TwtMEaoenDjt+
	THZisUhsKGRq9AJUvOsLl5DSM1WHL4qsd9x49fbKR6bU3E7Xm60e7CPGD8YQbAm+
	x1NVLn8VNwRrLZd26wdwH/9NtNlArxKEWKoEg5hNcefN6QvDud4GRHvFdoIQcRQ6
	fZrFy3SAaFYZNBfgbmd2JOa5flbM32JXvQGNWICvoms38A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtg0818n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:09:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6056898a01dso4564026137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776190174; x=1776794974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQW4iwUWFCyZ/sLRwcLBhiq2cIYCo+JQjo0/ZUZNJxc=;
        b=KfpRw3Yo0Vags5xa3gbIE9L5AigsyQaRbuNgUokLqqKGWp1ZhSwEZwuMXf0PddOljb
         6ktBDt9cbinongzYnbKePF7ot0me9N2mLvQ7LP+CNKVUUraLpJiQTR11sHXLFGuKBnbR
         kizbU2QIwnDeBrOnefVnWMKkOgF+TIKFqf4zCOS85QckUlhqlknq4yAo3xVJB+tg8CA3
         1VZGMGfOy2irE3B4l8uDmnlGoPtyjOSh0/H3zaw7KWfRv8aw1uosSfBZ6Usa8+sqeso+
         uYU810HL7hALaSzhmcjpTvmJBoTFy8m1X3W64UcDoX2vGFsKRExnPSa6A4cwwKUHDAXa
         lWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776190174; x=1776794974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQW4iwUWFCyZ/sLRwcLBhiq2cIYCo+JQjo0/ZUZNJxc=;
        b=m508ERA6/Zle/Ecrcr8j/DSjZXOFUqMdbyG9mfLLS8PipOSr3rijGxox6AvlP+Sw/n
         eqtR1Tviopt42BcU+f1KBGulkSCQFr5VTkZlfiqFgGkPyoIwfBcWeyYKrvgvIABiVVOn
         KmKoesy1nr7JXUwVUm/5BT5NVIFX/XZDzCntPIOlQ0E+XnA9rvpcd0f6k1Z1gLbgaxqN
         udgzVnGpv5aWY+GwkYfOwGgFvKdsCG/pr+tIkaI0zCEVUfT2pGF5lJZbegzpBt7mO824
         8ic/T8LxJxfLtRC6AjaxihEpOlglA0YIPHKy/4zFJJIcBtSmj+oquHMVVGorm1SuO+ud
         E35A==
X-Forwarded-Encrypted: i=1; AFNElJ8e6S5G2UkohIRAbclJDsxMQGispp6A4cU1v8GahsdLgBkEzuFoGWGrelePSTILBNscTxggGMJeSuoH1b4r@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZNr2AFJ4nSdqi2TKs4In1MlYFYd7PmSKFHHnP1mOD+YZ9/l+
	FF8pe9pH/0P+q6/bcREeIWZpFDcS3JgonDEBJw1Suw8qBxYxaU1p0SnynN8KRfsXxWsU3PsiM6x
	m0EMgYFdO/u7UyiJXiaJPkTskI/kxtX9U00uZfTwYN0kGWi4icor5bdVcuYfcix1Mlfc6
X-Gm-Gg: AeBDiesd/rknHmmd+xBakRhC+WMgWdyoqr5VWBURVr/Ykyk8wcgVxv+ju4jjkzf07Kn
	wsL54jbngIFaWIRq+LjWUbden/E+dHdjUJpVIaGxO1M7+30AUeFZ0tQOLBLk7HOtA7nZv2f+aGS
	p35m5Llhe9jLUslLmT3Vtr7Fw6u/w60N3L9PnplUxrIs4ZlspkS2GD1ru4lT/GEyLa2+GWaC4ZU
	U1qAZ5Rqw0LGrBVwy3sdz0HXQ8327YfI/pO9gnpWu2G8Pl86qWfsqr3JV958A0XtsQH3O2wD4kd
	gpnSKErDd91JkaEMX+cWUvEspV0sZ3OsyzedweOwlmyXElNJroUh0SNXuXiebK5NOog2K6xkpyu
	jT0VJOmN6Af/UdaQiSTB54kwQPg1PcrkvXOeSlW/O3MuZfjieDP6uiwrund6F5ffCcmleA3GYJW
	bZF0uF88kXbvzGJCLlhBmOgENtCidN1vkijhP4TCc4VAF8Zw==
X-Received: by 2002:a05:6102:6a94:b0:605:2ab5:5c1d with SMTP id ada2fe7eead31-60a00840e84mr9198638137.22.1776190174110;
        Tue, 14 Apr 2026 11:09:34 -0700 (PDT)
X-Received: by 2002:a05:6102:6a94:b0:605:2ab5:5c1d with SMTP id ada2fe7eead31-60a00840e84mr9198625137.22.1776190173741;
        Tue, 14 Apr 2026 11:09:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86641sm3393244e87.3.2026.04.14.11.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:09:32 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:09:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
Message-ID: <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
 <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
 <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AszeGu9P c=1 sm=1 tr=0 ts=69de82de cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=fqqIX7z1rOFd2Gj4uCoA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: aYw1Nzjbt8Bt68w1b2Qx5AEK4hT9emm4
X-Proofpoint-ORIG-GUID: aYw1Nzjbt8Bt68w1b2Qx5AEK4hT9emm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OSBTYWx0ZWRfX6EHayDkLToPb
 sOWpKdtkQtndohoXAsMhWRKGz6OTR1DtdNAKZ//RFWRHEUVmyC1+9WGwo7rJu8W8wxjXglLwQmo
 l8AW48vt54AeO0x/w1ftXh9h8j4s757AfN4hxIviNOWMcrNNX/BeD+gb8tnYIP95rbpUVBvvKjB
 +fUhJQGN7bzlstH/Q0O+SvEpPecObamSSpjHweJnuGaaT8r79KQHQWZd1XLYR6jQC5my+z5SdKO
 6isqYubwBO+kETEQ5dc6TAc8jSVLzmBuGIrHKomQYv1T/KFEluKRES7ZY2/xK6r4uChca80mahj
 b5sjHqRUtmEZxbKaLPlzJH/PdeCb2cX593j6VFtdjJWGJNZU/Wz9XvLWr7TK8gob1qPIz5FVBQK
 yDWtEn3cXvlPjX0+zWym2YycXUo6OLQyVvLfc1jmBj2fOXNglSPHlEktzGf+a0Iea3nbVaIKeeb
 F210GhwHGl6fkkZTzoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140169
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
	TAGGED_FROM(0.00)[bounces-103206-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,3b:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
X-Rspamd-Queue-Id: D80503FD8CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 06:20:14PM +0200, Konrad Dybcio wrote:
> On 4/14/26 6:08 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 02, 2026 at 04:22:53PM +0530, Anup Kulkarni wrote:
> >> Few CAN controllers, part of RTSS sub-system on LeMans, route
> >> their RX signal through a I2C GPIO expander at address 0x3b.
> >> RTSS subsystem is an MCU like sub-system on LeMans with independent
> >> booting capability through OSPI interface and supports peripherals like
> >> RGMII, CAN-FD, UART, I2C, SPI etc.
> >>
> >> Describe this hardware wiring by configuring the expander GPIO 4 pin as
> >> hog with output-high, asserting the selected line during boot.
> > 
> > Missing platform name in the subject.
> > 
> >>
> >> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> >> index a1ef4eba2a20..b8371bdf9933 100644
> >> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> >> @@ -615,6 +615,13 @@ expander3: gpio@3b {
> >>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
> >>  		pinctrl-0 = <&expander3_int>;
> >>  		pinctrl-names = "default";
> >> +
> >> +		rtss-can-sel-hog {
> > 
> > Why is it being described as a hog rather than a pinctrl used by the
> > CAN device?
> 
> My understanding is that the CAN bus is managed by SAIL ("RTSS")

So, Linux can affect what is being required for the safety island?

-- 
With best wishes
Dmitry

