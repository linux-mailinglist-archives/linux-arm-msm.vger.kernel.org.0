Return-Path: <linux-arm-msm+bounces-81063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2DC480C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322083A6F9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79202797AC;
	Mon, 10 Nov 2025 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF+YyA4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9ooI2u4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EA62727FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762791606; cv=none; b=b8ggMmQYrSjiMrF0foUMs4wfP78wFg8ICkL9JgxKxb4rTuW1SwxtVu9qqFlv2Z4NMJm2tgQsjEhbZJNn3AOiP5c5VXyq0uMEpwrcsAqu9IQ3R9+0rwzpDA3y2zXVsXsSUKMJDaDehDbD1jsl69XNsq9KGedFpJSpznI5BxOftmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762791606; c=relaxed/simple;
	bh=Okmp1V1aP0M/1b97PdUZmHEmWA+b86cEEei/tDkcrA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myg5Bk13xDvUFsykDc3DwDarYEz/0iHUDduu1FTdChFy/fqmyvVpjhOOzqUspHHy12YjDC7l9b5MufQ0umXA9vSSW+ZgEtpkHFLb4eGM990G9tZ3UMgQhb5lbcpusXpb1hfFZi/SDrEse4LivLUqdxt+opwmnx3Y/5LBZbJ8rog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YF+YyA4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9ooI2u4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAG8FRU2867914
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0sM2q8RKz6zYFpfMlWBDzUvl
	P9VxO7a2GrQ9E0VMcW4=; b=YF+YyA4BrpzqXVsURzP1xOfVNfFfRdevhCYfkeGC
	9TxAQLAXC8PXVwtEKnGk0vx2HOdELRa6JKoxEGWRt4yqw2yq7+XZG2SeeDRYMNAa
	l9V+MHcIWSJO19hqKRNNm7Fcv5393LU5lBQM2fraV9vXCqBZvWKhJwZFEgMqh2Kd
	SS8r68QHOftnRmhw8JAh4lOPmCDI2nKBNCItTKxzjgA0XBpvahvlgxb5Jx5dcHEX
	CZDoOD6Lf2WXbano/Dbk4jqq2Q0nFQ/Ig52xe5qv5NEnGrdTUXqWRptvoPhhm9X0
	clW8tNEwWUTXthPCVjiw5J76p/7ZT2Eeg8Zkc0W2TcBHdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd7619g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:20:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3438744f11bso1994822a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762791604; x=1763396404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0sM2q8RKz6zYFpfMlWBDzUvlP9VxO7a2GrQ9E0VMcW4=;
        b=C9ooI2u4fAoJwzoIcXGXgP6fVRgpmh4gznjVCHtqtJ3wvyDe46FomfGLDzpRSmAua2
         FrqumDgsXqhi7n3U4O8sRRh8PWZ6m59XolkKmikPP9NeLvUciQem9+cB7va7TDUq39ct
         MJm26ayEKpT8PbutBuoEEabRaZRMkU6HxruTjBHwi7H1WQKbyolP7I0gelRLFw+Wq2xp
         UIfclKnDVLb0c6bWtRogfLPwA8katBCmaIyWSpT1441Ch3HZcufNXp+mV0smmpcx3tdt
         f+PiXkA6bSQFEpWFwRIW4zr0mve9TqVmZXL1BtC9NtTT2xCwzZkOOpQ1p55qMFxeV93W
         ErPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762791604; x=1763396404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sM2q8RKz6zYFpfMlWBDzUvlP9VxO7a2GrQ9E0VMcW4=;
        b=ld7fPQtHTG5hWE3wRviN6alVJrVQ80/m5f+1nY9eCLM69G63AvnXVg/WGSld4Q1pZ5
         4ie1sjRZvfTf9oZzQYzaIlh2NtxibJWPxNfh0UwbnwohxqMythEUSDdToEzJZeSfRDbq
         eKpVgyy3UAOW1OhJ6cwUw77Y+5LVTn4CfCAVetlgl3K6rlDr7ITmIIqOUZ+cFTnnZ5BQ
         W7LsPp5VwG3EhNjHm0M4DmxRPrZ+qorrNJCTr1pMXOWDjCYxw0JxxDld8xg4dFi7JD8Y
         M4mivBAah0RrfSC/93O/JyAkYwYf8cjes0I3IC2R3WPWnz+VSwtF5XbEBK94qqEUWcOd
         9iNg==
X-Forwarded-Encrypted: i=1; AJvYcCX6c6hWBCvHNA6p33Tj59YF3Ntfbkm11hXkPmxLhR1I7TVhY6TmAWYwK9ZVCf/gDL173RTRY0LuVrEUv+7g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81SogJVpmQToMBbtnJLHa0KFSGiFgpl5FN7ceIWcWS3Zww+iu
	tcnSwHZui8VJ8vqnWHRH5dx0Lti0X5jElz22Apzii/I0pY7RVb3+S3ksoS0DHXTTfjMXe/UOsLE
	v6cNhAx23Y5KhwzJdf2Hpw2+FhvsT5VOwj3WlmR6c2t1VzCFUL9t+2MYe2k0H+jdqmsSs
X-Gm-Gg: ASbGncvFY5IfEZ2Ck9Ixgdwh7XUYoof07IfA65GTJZQm/JAAI9QtAW6amHzQlQeP6d9
	1NAcIiP2s6KEe9wQ61XWI+rE0DEdAh/nfirHQ0ZCCuXyYqenSYBYj/zf+72M8U0zzeqkCAu/30Q
	Nx11H0LZWP9clZsi7SuBtA2baniw0TGu8rHnFI7jb1IDqFj44/Zo41Qe0Cwf9se3xIPgOqFhVF2
	ogw5DudJBKhBVLuF+IiNojtdy99ew0bJ/rLjZthiMPGK37LPynYC5opG13UqClpXr+lpof2oQgy
	aFoPjP5RO0ug6FgSL/9GM93GyyDvuxicWeO4RUX3sVoVcImdh1dAwXkHCQUbNhshZ5S4EbbZ4x2
	BCIoVrCy3nHHS4RW+h2t7vEU8Eg==
X-Received: by 2002:a17:902:f790:b0:295:9a46:a1d0 with SMTP id d9443c01a7336-297e56df960mr117467455ad.45.1762791603556;
        Mon, 10 Nov 2025 08:20:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7/8Fhqh9sYUBGXPksH62bwsPiXbsk446L8P97AUqBc08psSx9mBm95lEOUykYcVj8OBSpvA==
X-Received: by 2002:a17:902:f790:b0:295:9a46:a1d0 with SMTP id d9443c01a7336-297e56df960mr117466835ad.45.1762791602913;
        Mon, 10 Nov 2025 08:20:02 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29833c8a159sm22346285ad.69.2025.11.10.08.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:20:02 -0800 (PST)
Date: Mon, 10 Nov 2025 21:49:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Message-ID: <20251110161950.ngs4ihn3asijoqks@hu-mojha-hyd.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
 <20251110122824.5je5jfoanivl6xrh@hu-mojha-hyd.qualcomm.com>
 <btvknf3tcqhgxzf7ckyvfwix6hxle2bs4whyayan5haaejo3sm@gnbszdys32lm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <btvknf3tcqhgxzf7ckyvfwix6hxle2bs4whyayan5haaejo3sm@gnbszdys32lm>
X-Proofpoint-ORIG-GUID: qpCh3qE05qVLBkWCr0ExEm0uJRAh7RlA
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=691210b4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kPHPC4wJSQ4ZMXu5alUA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzNyBTYWx0ZWRfX3XnduUDTXQuL
 49qSns+XbRq4+p4l4ZLaH2G96lXB1g+DfncS/K9aLcY5ppoGpxWSnpvnijDFEVVDdMX0ZxnCEZY
 glkcN9Yek467YZryFmIyNqWlNgySATfd2fhB7/rTmK30NnQp6MUBAXiLEsKwY9eRegCAz7o/g8L
 GQFPhXXY6xmWGRUOitgkJxbDVBwcd/TZl+KoRt7jp9bsmZl/+RLQ36J4aesRwbXMAFx5EH4EVmS
 r4gUFen6zH1X9awTGWlSuzCbdLxi+vfxMwdoPJ8UeCAasBRlRNaQhUc7XZHsvJk+EZ9MDZxfvTi
 VMOl85GB+Io5krcxop7IYyOuFTGULqyezLgq7R07uhgGkIXznXDeXAjxkj4D+3hNWSQ1pCXKi2A
 8pMcTN2LcUVYr/AR/0hT666CeP1cgg==
X-Proofpoint-GUID: qpCh3qE05qVLBkWCr0ExEm0uJRAh7RlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100137

On Mon, Nov 10, 2025 at 09:30:26AM -0600, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 05:58:24PM +0530, Mukesh Ojha wrote:
> > On Sun, Nov 09, 2025 at 08:07:22PM +0530, Shivendra Pratap wrote:
> > > From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > > 
> > > Add support for SYSTEM_RESET2 vendor-specific resets in
> > > qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
> > > "bootloader" will cause device to reboot and stop in the
> > > bootloader's fastboot mode. "edl" will cause device to reboot
> > > into "emergency download mode", which permits loading images via
> > > the Firehose protocol.
> > > 
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > @@ -935,6 +935,13 @@ &pon_resin {
> > >  	status = "okay";
> > >  };
> > >  
> > > +&psci {
> > > +	reboot-mode {
> > > +		mode-bootloader = <0x10001 0x2>;
> > > +		mode-edl = <0 0x1>;
> > > +	};
> > > +};
> > > +
> > 
> > Make sense for this as it leverages sc7280 and adding it there would not
> > have made sense.
> > 
> 
> Why wouldn't it make sense?

It is better to add for platforms we know their firmware support this
from day1 and not add for something like chrome or any other variant of
sc7280 where this support would never come or not tested.
> 
> > Acked-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> 
> Please read submitting-patches.rst about Acked-by, and use Reviewed-by
> going forward.

I was acking the idea of this particular change in platform file compared to
other patches, if above reason looks fine, can be converted to R-by.

> 
> Regards,
> Bjorn
> 
> > >  &qup_uart7_cts {
> > >  	/*
> > >  	 * Configure a bias-bus-hold on CTS to lower power
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > -Mukesh Ojha
> > 

-- 
-Mukesh Ojha

