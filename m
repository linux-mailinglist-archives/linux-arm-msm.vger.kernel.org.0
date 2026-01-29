Return-Path: <linux-arm-msm+bounces-91092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EzHmASGoemkX9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:21:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6EAA373
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB7783006B6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4823221FB6;
	Thu, 29 Jan 2026 00:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lbv/QN/k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjD3uZMv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD3719D071
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769646108; cv=none; b=qyEY1UdUe5S/2CXy3m98faJYkEn8SIlnyZVc5SyZ191T6RdANC6YQmN/JKbGozyKWRjpufr2YfdTUPpgKG3BVcAypFhq+fMZVp83PTWsLEgNNY9f2X7u/j/ls23M6daMoSy413PmYWQnDontxsvfknD2dZsdP6LThgnz2aAP/Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769646108; c=relaxed/simple;
	bh=0OxoJT9bhsZ+QFhuxCU9SVp30WRFEHPWXqOP7g92OMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0w4wrcLAlvYyGb4K7+kuQHcJMDYdFR58eU2JOEHldK5eQUmAfA+8CYnFCuzTV/ess+9mjQ2cYrvdYSZgiMUgAmZ0ccQBGxnovPo0Qc0yKTF9h60mc9hqE7dBaEg54rucDGfeI/8uZ4EunnRgUB5OqIZz0g34kl8kKEn98Tuazg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lbv/QN/k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjD3uZMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH44C81407436
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vANwNZlqR88iqJQWRz+GFi4R
	UT5agX7PK7RHYkyb3p8=; b=Lbv/QN/k02/CER1TMi8q2mdmFWwDsjFN5BNb3I4v
	8fSeX5p8Qj3jmpLfdJPMFnhozaZTV9NNhrUDFSFNS4liHMd4/9zEPlSYwsVaRaV2
	+N6NCtpQMlxU45OZXjMfBn+bdh9wkEZ6HpvWGAIICq0Mug6buqQW6eX6K8HLRMpz
	Y8b5QlLXNRtEBgWMmYAyyC3eS9uuUZYjthwK0vlJiFPPN6nYkx7p27uHjm25/8UR
	IhMofzxHVsi0cwQ4AaibbSnpc467H2T/yvteXr9pHgfmk34Mw3vYuB4s+xUfH+aH
	Gf+lqXXRWBVAbKM+M5+QlqvLbWOaM2cvQAioUojnfSs+fg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphgh5mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:21:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f167c4ab16so1169845137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769646105; x=1770250905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vANwNZlqR88iqJQWRz+GFi4RUT5agX7PK7RHYkyb3p8=;
        b=AjD3uZMv/RSdQ81bi1r/g7Cz5/Aq/Q8tnHTBluIiBXXKQL8YzP1ofZBsWBfeuMx75u
         i4C7vRift57ghCHc44EjDGYyfxS3tQ+veU72X0/lnjTMjKFdQnyzgOq6e14Wl2bLlm8B
         1gv4bSo3dOzummBk36+x/cQHVLsH2HxSNxkOZo9344A3mmAiKh35vrvgnZ9ItGzh34d9
         3wQ9L5mdI/QG9xXwj6LmaGtspuc4Nh7a7LZa5sAC/R9vFOZOBz7MgJ2hk1lCwNMp6CWu
         nuAj6UUUO3f7RhUrgIBFN0k5666oeayJNaA40MHIgAQlJ7KywXuiD988uTUMBj5w7Rst
         G01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769646105; x=1770250905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vANwNZlqR88iqJQWRz+GFi4RUT5agX7PK7RHYkyb3p8=;
        b=JZjLzoHNXDmySwRftlcLFn8VyLT+ezyP7iqy8mZd0xE8ghtV1DOgOiFH14yXBLDGmI
         LDYKQ0+lq7h8kXUi18sZmgtaoBUXbElqBp0ZZsT8bAE5WQE2gkDorzUrPOKE8V1CgVDV
         VHNNt835rlHNQYCnfreCvsOtvtDMmEsc2kUGMetNTHUD0cXX0x3vZcrkyO3Zp0uSqj9R
         Np1xqrgivhdwkwg9OWOwsiXawJMP6K/jEZbFuCNUllAwsy9Idr1xez2g/UxxubXbK0eM
         NOdQTjioKSJdCybrO2QIHnox72KcayyGLXA3uHsL5c4toEgc9DSG5nxQ0AW1LdSkqbm+
         CnUg==
X-Forwarded-Encrypted: i=1; AJvYcCWpa0q7wRY0fWVztZfo9jaI2eyMjAN4h5qIosMna8AqsNM5WF13GlMpztKxS5LkIV2jfbSW/kYo/NrR5OG6@vger.kernel.org
X-Gm-Message-State: AOJu0YzgU7FR/An4BtJlhNYefM6xD2q15+qtvNsq1usZE+dhUBIeJnwX
	UCHQYMqgcozoQNb2w/zcuvJDZYolZiCqTKnYZSymYMLVvtdrjNijxJAEE+LYVFAbgYxPEj1Y6dj
	A4TTltWEqkUIGJdlK8PAn10wmQQYjPB+OaIzaGlFMTV5Ny1bXCwz9pFjBR8Tv6e+t2K4g
X-Gm-Gg: AZuq6aJNgFXHk1ImBN5DenDyo44MJjxYiKwHGgGxiituQqsClLZSRdWiqhzy1ljEqRy
	7nJxaq8+t7qFYBGwDe74ySXDiXoTY0PEyFMK8hpo2TC/rpBh4VGsNCGMLUkZBCwABfVg/xnxTbO
	EQy9YWnkQQzV6yGkXosI1lVDke0/zxCNUmJSdLiVj6FvmxBvoQqs43lnvgIT7N4un4UoQ7HeQ/r
	7ZJJlugmFBSPA2/sndQrY0aJl7TgQb7yRlA7ydm31d8eORr6Pk15Ypk0xIy2UCTJ5yldCGEz7St
	UdaIJkYD0KCQ54MkmmHEPdispXwigDVb1QcFOGZh91aPCxfVpzCmSp+oRzm0VieEBxmdnrOR6xX
	b4aVrEy6PaUjFkC2YShXHNuu5UaG2YDiVQBc1XegPpYpzru+013sm89i1f0txyhxMFVyGfs5wsT
	MSrkY6Z2civfjsc5B6SudfcX0=
X-Received: by 2002:a05:6102:32d2:b0:5f1:50d0:3797 with SMTP id ada2fe7eead31-5f723937ba5mr2644383137.43.1769646105371;
        Wed, 28 Jan 2026 16:21:45 -0800 (PST)
X-Received: by 2002:a05:6102:32d2:b0:5f1:50d0:3797 with SMTP id ada2fe7eead31-5f723937ba5mr2644376137.43.1769646104906;
        Wed, 28 Jan 2026 16:21:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07488f30sm831408e87.35.2026.01.28.16.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:21:44 -0800 (PST)
Date: Thu, 29 Jan 2026 02:21:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
Message-ID: <xyhl36bcpmjhav73ujlvbtwqixngr5vko75t335mlcebxrs7lc@t43mxhknuqtj>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <22583dde-caaa-4d64-bcb6-ac7f09916a8d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22583dde-caaa-4d64-bcb6-ac7f09916a8d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GgqOgDRetABO6RJysSKagZNxexX8qIaO
X-Proofpoint-GUID: GgqOgDRetABO6RJysSKagZNxexX8qIaO
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697aa81a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=k4h0JZVNFiT43Iq2XkEA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMCBTYWx0ZWRfX7/lPVzC6ompA
 BIML61u3evE72wtbG+LaFBm8IMtoMbPPurgMe3Mb8Mmzqz2ALSzHpJi6kGZ6CLg9qEVCOsVUxLg
 qRQyHxp97ObV2eTcbULoEZnMHXLuuiwDMkjLuejplc9lT517Kn5D0Q9hn17XJdBbLq7tpmmp+t7
 9Juy/1GyO5ebCvnHLnVLdwWa7IOzJvxzZP3ET9CumEU21nbcDicHfl7bZYbBCuRsTwcvY1XMLko
 amRiwtOIq9ULAxfjoSTEF3ePGHom5vtWoyQeuTmlDrIJ7Fyy17DFzJ2N10hqTm0zIgIxJwPXoYl
 KQcwDlqEDoz1yo15mTxE/0wpaGStSKBPpjZL8qNKGWbPyna2wyNTgcaj3yNGBcjLnkv2ORsrU1W
 iSetk8K+oqYn4S9zn4YoDZoWTYOq5gst1vFrIRXLPk1RMLDIb2U5pwaqXpNqTsUFZqlA5FYTXk6
 WSjo2yoNESp0O8rfN3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290000
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-91092-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 96A6EAA373
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 06:35:01PM +0530, Vikash Garodia wrote:
> 
> On 1/27/2026 5:52 PM, Dmitry Baryshkov wrote:
> > As the Venus and Iris drivers are close to the "feature parity" for the
> > common platforms (SC7280, SM8250), in order to get more attention to
> > squashing bugs from the Iris driver, flip the switch and default to the
> > Iris driver if both are enabled. The Iris driver has several
> > regressions, but hopefully they can be fixed through the development
> > cycle by the respective team. Also it is better to fail the test than
> > crash the device (which Venus driver does a lot).
> > 
> > Note: then intention is to land this in 6.21, which might let us to
> > drop those platforms from the Venus driver in 6.22+.
> > 
> > Testing methodology: fluster test-suite, single-threaded mode, SM8250
> > device (RB5).
> 
> Could you run fluster on SC7280 as well ? Also please share the v4l2
> compliance results.

Okay, the SC7280 is a bit more interesting. For H.264 and VP9 the
results are the same. For H.265 Iris errors out for all tests except for
the one, WPP_E_ericsson_MAIN_2.

The kernel prints the following message:

[   82.573112] qcom-iris aa00000.video-codec: session error for command: d0000000, event id:1009, session id:52ef2000


Compliance tests:

v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 18 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

-- 
With best wishes
Dmitry

