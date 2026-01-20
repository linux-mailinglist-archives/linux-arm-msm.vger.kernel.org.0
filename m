Return-Path: <linux-arm-msm+bounces-89910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAUTCxEOcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:21:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A17874DB6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21C5BB4CBC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00053E8C57;
	Tue, 20 Jan 2026 23:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoVhoj4p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7dTltIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F323ACA6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950119; cv=none; b=YDSIumV1QqdMaAvakQTLgnpcBOahGz6/phfi0OLRXnMX/8c86UukNfjZMKGBTc65DoVLnnuBIGZqLECd5qxBj7OPOe5ftNkSWpgpONhDjDskC4wICgj3zQSBVL9lelBsv3Osue8LF8VtTuVbR6qYpTChPhvzOnAQEWrtQItkyD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950119; c=relaxed/simple;
	bh=t+/M7AMxsNKyld1HAtAZFbOAFuxlgGyqxZN4bkv8jUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjhUV2FT7o/Q6tCHCAqFVCFG4iKqA6S43gF03FL5KDzxJtl3it98/EadB0ln0GEKn9hJ/NqYzmk+t7R3gmNrLGYhgeqSgb+GXFZVdPpT5fG9XVHjt0tiG8xcHRkVxTXI9emerJFDsdx4nUBON8uuIpVAo14vY9gcDPFCYQRCZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoVhoj4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7dTltIl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHIErL668654
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oE4PaYGzYaXhy8w8vjo5VGVx
	HqpQZf2BpqUA1vqR024=; b=YoVhoj4pcWBhDQSoJ9y54qnZ2oagcEaEQBRJ8+I/
	X9YZGMMI5cUt0E3KZuooc3Kml+lErIHZAPVv8xAlIKKYMCUs45dbooa1aWc38vtb
	PWaEioLICIbGlZzq1rgagUIqAaYYsD/WQoDVvxjrlP/aD5xuNFDWNZlKatfIZ1yk
	IBVrh3t1JApYOq4YrfK0knFv8jtToRl1HaCcUiNSddWXM6+UPHnd8sCmSiYDLR+7
	tkCfQE/vYth83uSD2GMLEi1HQtpClypGb6XksvPCru/YxNd3qj9fEQ9BiboO1Gqh
	PgioXehUA6KZgPXwiCYbP6xxhVv/aSN8QLmcT+U6SPKC4A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte04s3nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:01:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5eeadb7940fso4898425137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 15:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768950116; x=1769554916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oE4PaYGzYaXhy8w8vjo5VGVxHqpQZf2BpqUA1vqR024=;
        b=i7dTltIlDIpC+15HQyHaoW4wYwh0N1Cm7mvK+UlblsveqLO79izI7iQVYpLE1Crcu6
         VdnYcq7w/3yvff6TmtX27IDkdfoMxtFxwgS+OYeUQiRHNMJGrZhb7b4OOyFjfJrTPGDZ
         UiFrIz0dH+S5KzJgU7DW2T/OAIMaAISUu7DsAvsr4/vdG8RW8Ew6k/MrebwcmVE462ct
         /Ak7uiDhb7g49m0b8vrgJxI8S1ARMhiPb3OGtXSQtzE8ItCbK7goLDrkurgImelcmx32
         pwx27gDUDdBUyzVwKp98h11TH2nTALPT+45qGrKhQJVXAjecX6Tk/tzzLTjeM8gKmJuB
         /83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768950116; x=1769554916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE4PaYGzYaXhy8w8vjo5VGVxHqpQZf2BpqUA1vqR024=;
        b=IJOa7Rx+gB+RnZ9pKVXmeB2XRuU2PSCLmyMMMO6gWR7sIccN24x0j2TEJBHvvhCCZy
         GZ1taiyFcHJ433WeT736cb/tt7qm6NV9DSRfgUWNkviYejOeA7fRmfgF3WFCLyPa+MbL
         gTIzFQq3fFtRC+H455shkTGW0nWChMisyhk3YE+7hAB1RTEd5Y8+Pgkr+yGd5bTTTLKm
         qkYDepL/0XYBTkQRK2PLbVqk8sKFx7llQHfiFtjVJTIjKpa3PS+5F6eHOEy/BFdLvJmo
         ThxyK98xcGQeBx9Mevvn8JHBAFid76ZeiprylNRkc1725O4O4Ug9mLG2VnkT7kcdmCtW
         m2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+qcR0a8AEaqPEJIR6UjFlDn9etqKXOUgaxKWu/uhzkIzV4jLfUR9mBo7oqF2JiRkrnunhtMtPsV4UlNLN@vger.kernel.org
X-Gm-Message-State: AOJu0YyhePs8XSrbXHUXYEf6LPq6MPEbobHpWaXd1j6Gznl+IE7DtARI
	SkZbD5RsrdP6OwJ0iX89wptUyiWnWCal+4Lh2WP8D+Lzy7gxnYoUzr582Ok/2L7MsPc8d/a6UTj
	JiJfI9B6GqyZwHCo82ttX8wq9LFFKOndvX3FuCNBcqs7cWyH6GHZUN7qyWWAtSIxvwtxp
X-Gm-Gg: AZuq6aLHemYcZVyD4sNVCm2mmmZrSG9STZlbrvfDfW1kp+BSXnRn2EHmTSWrwZzsjNe
	bGOMmFZHXAXKovm3FHRuNcxQRsfcf34AUcpBVgIex0OkZ036JcdEYkJhc8ZDVMqpbMAgi/g8zgp
	gCa7RCwxGl40BFDTKQwZh8mT4zjcvVvyvbZOvSK2KjigT0PqCII2mzcngRE0AGJCrFryLuhTgfD
	h6Q1bartBbLN8QrOkfzMRwEX98AOrU1WYcv/3rBg4UrXCFFBx20w3d0EiPaBaBHCliV1AsKvhu2
	5isA8s/zXSPv8RXYXlWU3bfbNSbIHMJLJIQG2chKR4pWb9SrK50Yymuu7nu4pVviyT3kBoioXRZ
	smc8Lp0UozfG0ZtZGASm/A5qZkYychoiRhf/KPL7NlpWvLqQazXHs/ndIjCHQxLwMX97qQ6Nvxt
	EyXrkhJY+2/pODaTEG4d8H2ZA=
X-Received: by 2002:a05:6102:f13:b0:5f1:bdcb:f1b2 with SMTP id ada2fe7eead31-5f50ab55266mr1230893137.19.1768950116411;
        Tue, 20 Jan 2026 15:01:56 -0800 (PST)
X-Received: by 2002:a05:6102:f13:b0:5f1:bdcb:f1b2 with SMTP id ada2fe7eead31-5f50ab55266mr1230834137.19.1768950115913;
        Tue, 20 Jan 2026 15:01:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf352846sm4418101e87.38.2026.01.20.15.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 15:01:55 -0800 (PST)
Date: Wed, 21 Jan 2026 01:01:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: petr.hodina@protonmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add
 bluetooth
Message-ID: <b2as6rclyqawtwuhyp3zv42f2zvbgzsbpamr2znpok6fvrqz3z@i35o5vhbm5g3>
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
 <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
 <865f145b-2170-48c3-a412-a4f22fbcba8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865f145b-2170-48c3-a412-a4f22fbcba8e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5MSBTYWx0ZWRfX4+C9WuH0fdot
 VzVTHROK+ZGbAcg/33IMO0aqO26YdTnPAqeoF7BLNnPRCZLvRU9SR/DtKOq3t09opNm1MxrY3Zg
 19C/C37VsyyU4XcGrOJWTgIoiEBDDAj9zqYQsiei9db01uj+VpOQCVUYzT3pTFpdmAegg9Zjwyj
 z5vTiQOlOdkyA/v7nVFjyeK0cfffvq3cqxr8+ghZHIRq3gyqyb3re8tD1QC4HQmrJLU+cZtg3U+
 dMQYfYykrfpyje4Xsp6lKqupco8Wi76+LU7tWUXvTx5CW8c7niuauhtJH2EWccxvZi3aLfzL/s9
 +VRTwdgbVEntRQJPGrbcm6EhshxUXJNA4fUcg4Nh1zOoIzjbRHyJNeLE4u/xGlM9WykQN3b4Qg+
 p2ScrvDYJSqaLS6wvYiizSoNLX5ML1PLRDKNXdbzVJDA0HUuBqh6Qv87SkORHsnvCQgV3FewuNZ
 HDq+8sfhBbEMu3Ro48w==
X-Authority-Analysis: v=2.4 cv=bZ5mkePB c=1 sm=1 tr=0 ts=69700965 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=XR8P7VQPE8jAVp-dJUYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: pDGUwX0qOCvVLcfdpq6-f0DHHwvEsBET
X-Proofpoint-ORIG-GUID: pDGUwX0qOCvVLcfdpq6-f0DHHwvEsBET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200191
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89910-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[protonmail.com,kernel.org,ixit.cz,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A17874DB6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:22:51AM +0100, Konrad Dybcio wrote:
> On 1/19/26 12:58 PM, Petr Hodina via B4 Relay wrote:
> > From: Petr Hodina <petr.hodina@protonmail.com>
> > 
> > Enable the bluetooth interface on the uart6
> > 
> > Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> > index 68841e036c20..f23f9757a08b 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> > @@ -755,6 +755,23 @@ int-pins {
> >  
> >  &uart6 {
> >  	status = "okay";
> > +
> > +	bluetooth {
> > +		compatible = "qcom,wcn3990-bt";
> > +
> > +		/*
> > +		 * This path is relative to the qca/
> > +		 * subdir under lib/firmware.
> > +		 */
> > +		firmware-name = "akatsuki/crnv21.bin";
> 
> 'akatsuki' is the codename of the Xperia XZ3 specifically, whereas
> you declare this in the common file.
> 
> If they all should/can use the same binary, let's rename the path and
> if they have to be separate, let's declare that
> 
> You can probably grab the firmware images for all three (four actually
> but I don't know if anyone has the XZ2P) devices, dump it from the
> bluetooth/vendor/firmware partition (can't recall where specifically)
> and diff the files

I think it's usually bluetooth_<ab>. Corresponding image name is
BTFM.bin (if you have binary images).

-- 
With best wishes
Dmitry

