Return-Path: <linux-arm-msm+bounces-101823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANB4Ai6L0WmFLAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 00:05:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 793A339CB8A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 00:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D4D1300B742
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 22:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AB136606C;
	Sat,  4 Apr 2026 22:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghbameVe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fx7XvV/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125042EF67A
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775340330; cv=none; b=pnakSzmhyhViDPkej4TjgVo1rFcR2q6xPWTCgMTDJj+E2z2ENA2A9ljE/Xmnvsm89v4q4bqs49+BX82EhuRT1WyW0pjAGaVhfzxzxZffaf+rl65aJhzFfpFBlienQQ/y5WTGJj9BGMjSsyUZPif7bkLR4qyNe9HTWFJHnVwJwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775340330; c=relaxed/simple;
	bh=yy99E4UQJ6aHM4tucnCgmHUeXZeq7RdsCaXFg7S4nGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I81xsU/0+s07susZxjGtna1m9FsqRn00IBTabspUCjInvp6Bsi65hl0+wcxVu1go7BKdQvuZDkNYFKcfJoigQfvwkS3LcW6+jteRWub8rktLLm0taQqJ66HVz+kS5FCxnT+NsqwZ9HZT2cjLIloinjxMhAsa/PEHl25btJlF8gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghbameVe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx7XvV/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634HJ6V43361680
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 22:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ho+efGTCBcefvlOHxlNZpncU
	78YecnuQWH4t/w2YXXk=; b=ghbameVeekWiDtlLQCrNk7VEAh/QIbYXysFUki/4
	QLHXeO8x78ubTqaX0OdBgoTGfJNjPoTXLYbtQWxC82gW4wuUUlsd1KcnERQj92ng
	LdPs/l91Xi1fo//YO+M7YEznTUWYNxdh8ZVOrTuWu3bqbrlnyuAQO9l6kKcwp2Um
	Ws8EV7hpdrHWPFf3IytJmtB+Y4QD05iZa08VyDiGljFdDKYRQkbb8InpCHGorhE5
	EbHn58nRth3ia47qOf+KRuEsJtDvrZd5TngBbSvQeP3EYUshkYKLJMLBLRfhYQeO
	nK6v7iDLEAWnWaZWx2INZ4iZ9JOu8Sf7tsKhq1UIOWkCgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mhs91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 22:05:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d68dbb77bso6909121cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 15:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775340327; x=1775945127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ho+efGTCBcefvlOHxlNZpncU78YecnuQWH4t/w2YXXk=;
        b=fx7XvV/GBJP0PHCHs82kzNGiatIjGwRJ2I4gRjdhwaqtNxp10OezAVXChaLhIFXsX1
         UTUOoY8M6vwbrjGhX9t5EpfyS+AzHAeoHLp/o9+lhACw0ERSJA7jZmQWy9Mg/SCZ4q1N
         ENVd+i3wjvGxKR+6x6YM4xmxSLnhZKavVpT0X8MDEbsGE7i18Kx6Q+/ixgeamJn5b1zA
         kxohKI9w1vayOgdMpCLrdFOO9B6BK2fF1tro4E/K1tE5umJoeIbfbbC+148lGT3S9cHN
         aUznMypxTS5LcN0/gNX8QqLYoPLmfgb/IhGS951Fw4Xwm7Pv0rLBTLQmKR6RZ8Rfzqpo
         GxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775340327; x=1775945127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ho+efGTCBcefvlOHxlNZpncU78YecnuQWH4t/w2YXXk=;
        b=GU8+xVHIXI0C8BqSRsnHllbzvY1B6OJblvdBQzltrNNMvXaor9qDV2dGX1F8TCWN0m
         15W0XYFi2G0xjiE/ApmfT5OI3mmz60FW9+EtEK87V2Bm9c52imu7PsuXJyivaWs/7dkU
         afU4Jpvy/VF34y2ZSZPhDNJ7E93doWfQO0UbWdvgkceOwibRUT9vVXi1LfY6NAkD4YWA
         Up21YESUS9SAz5h/yE9yG6zZZOWjHA+uzujhEO7Pgfz+ck8UhJbidlhEXbQ7UkysJwRW
         8/ik/MC07cxILHdyg8a/W/ds7nMItcCy+f1VNsQb3dmzPIqGt/38cVfpi/rFWz9MK4cg
         mICw==
X-Forwarded-Encrypted: i=1; AJvYcCVfXVOwZHUZi+YPFpII71Ffdaj9eiWt9Bquejn8f7ICoDaUbcVg7uTIM82ZClKoVFTiqW5sK/jI9BG2o44c@vger.kernel.org
X-Gm-Message-State: AOJu0YwPCb70wFqcrYnDWHmwUnlcx9BVNUMratrZ+HImNHgbiDWI8ihs
	K4eJ3bX+3nRBt3N9aQD6bBw9+Qecl/CWOuosxWI4w+eeTxTWig7HsKzVjkGvvuYL/g4CEohNPhk
	ntByl081rpJiZJXiT7zxMLlEURSSCNtkfTFU6DwnaesaLKPdTSSpFDKe+TPUC1B+fWstS
X-Gm-Gg: AeBDiesG4EY0YD9dCywv2lORXYE1ku4wdMWT76Lgori30JMKF9lGX4X9dM0Fnxkqeje
	/6gD2v3Dd4bBxVXQT3mlwFDnYxUBtTnwTZeZ28W+5Kl6b/eR5Mlxx/5XON6/0csZKLJDXQMDfCQ
	/JN1783WGf6FQXKp7hpPqE/7lVi8jFVIO4JnqV+TWq2Qrsd457FF5DueBJgfGFd4R+va4VeYIxP
	rfY9FXdfE7cbzKjs5qjjDspuSD8RDT4A+E1CohnPCyIDIwpYcHA+Kqzz2hf9HkTTZzn+JEqEd3q
	1mFDIYlk1HL7z21O7qmjmn7qX4XppINxL0J1F8fimRL2F8tjjSjcx0FwpM5zEvlZlpFcuqYgGcX
	w5kyRCy40DxGPTnZI7k0ZWLoaCUAOpl9EQDT11JI12UAAH4h1JwYIuGnBeFIHbr0TST/eoZhiuc
	TO3D7t1TMdJ7z4hHYpXtVdIylTMpfFne/edA0=
X-Received: by 2002:ac8:5a47:0:b0:50b:6e5a:27b4 with SMTP id d75a77b69052e-50d62d1ad07mr123389881cf.53.1775340327633;
        Sat, 04 Apr 2026 15:05:27 -0700 (PDT)
X-Received: by 2002:ac8:5a47:0:b0:50b:6e5a:27b4 with SMTP id d75a77b69052e-50d62d1ad07mr123389461cf.53.1775340327206;
        Sat, 04 Apr 2026 15:05:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd212d248sm21487491fa.34.2026.04.04.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 15:05:25 -0700 (PDT)
Date: Sun, 5 Apr 2026 01:05:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: display/msm: qcom,sm8750-mdss: Correct
 DPU and DP ranges in example
Message-ID: <w2om3ztsdcvehsqquynmqkpenfj2zyiz6mmqf7ptfyawgzx6cs@3qkix7ae3rxk>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-4-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-4-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SKbL19-YtZgy3lIbYWY3vpXHrk42ydgi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMCBTYWx0ZWRfX9yGrVKo9nlOW
 N06DOgjN4ikknCWxtFGrs7a5ymzgylIBLlbeB6HRR1XXzWV691wnq/lSq/Si5K8hz9cT2lgLdS6
 N+gS3duchVQTk3dYpYjAXyN1FNJRi8s9EEYN7jwrQvFz+ouPhxDNQkiz8nptTxxue57GfSOGhKm
 29dkLMEGGk06TLdS54syvCRb9HpE16uRs0CvTqCwb5sB3WdBDnOAwhkjTiPAfWN3PkZwaDXttF5
 +8tP0tqQJ+xcUKdmtQf6s4VL5EXp/+k67GSBUKtf/NvMp8clzc6jbXn6nRQxCXd+3mkxwsPmZQA
 DZ+fKZrejPZ5UoLfVqv/HEU6UypdMdK7pvspiLydEItvqg4NCwbgXFfidXR0AJNWox3Eij5gBFm
 TKvtZgJAiXSCzMQ/dFhdh54YY+E6J/bOmrhK3mU8DQP+tsMcoYT+HcVvUKBAdJy8qStNu6xq73s
 pP8owBxEUvrxYkKr89w==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d18b28 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=bHnmLuETDjlIWUPFTNkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SKbL19-YtZgy3lIbYWY3vpXHrk42ydgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040210
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101823-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 793A339CB8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 01:45:15PM +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long. DisplayPort block has few too short
> ranges and misses four more address spaces.
> 
> No practical impact, except when existing code is being re-used in new
> contributions.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml           | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 

Nit: the subject differs in the style from the previous commit. With
that small issue fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

