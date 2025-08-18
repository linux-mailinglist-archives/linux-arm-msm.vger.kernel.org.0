Return-Path: <linux-arm-msm+bounces-69523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 967FAB29F40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCE795E6E0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42052765C8;
	Mon, 18 Aug 2025 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+4WJsdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CEE2C236C
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513583; cv=none; b=mSaQnBR4VYQB3mLD/clF+OfhOgcqXfdTQ4qmPBcu7K6xdgiB7v0iX08p4xZiGCjvIidbTkrIRQj861NmvCJ+KIVQRHmXsnlMUAqRDuqps4eY9I2RdeJxJ1xibNrUxyX8oss+YGw2qVXI19R+QImao5XxqEryIMJQAaJa1oh0zSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513583; c=relaxed/simple;
	bh=wxFiqofRnaNDpW/xtKn163O+QZ+nnDNV98i5gnAsyKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fII5hWmhrGgPJAOEOHoRs7ixWftHxSqjpXQ5IyY/N8JAJfqDtccIK6VLilNE1/jQKiEmsYeSDSOxCVvkJK7zAGuP/NPoiHYSsVqRqqxMVAH0e6IjeFki+T82v8kFh7S8NEXLulQi0EfY8yFlHUVm5MljqtJh3B8xeBC/sWbVceI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+4WJsdR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I82qwe023991
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 10:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yeNe6eth2dAkJ/cZO+bbJK7D
	iChjr4KrV6qgrujy2KY=; b=j+4WJsdRAhMlg+pVQygdG89v3WcJBoArZ4W04LsH
	7H7f9Xglbb95WD976MFCp0oGdiYDY/T2XXdmjunsafj7JYbkLsI4IqBWI5QV0pDs
	+Z43KmPmvED+bFh6ofiMniQ8dirtxQf/pzD2iFmruffb/JwH05APMLMkXA1iIuxH
	LlkMM179jlkEntIe21QNFqTuFm4/fvk4R+8Awy4VuHyaK9Nh35e4poSgDKUjhhhD
	VYztfXKWo2gXNYOLC1keotoAh4xkry4d75+ftiVcBiZU3OIx+n1Xo7i6efkRClXM
	w7H6YuKnOQJXOCBY5e6NS0AMzkyRrCBVuotCDJ+eEIgHbA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjycbbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 10:39:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-323266ce853so7575901a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 03:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755513578; x=1756118378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeNe6eth2dAkJ/cZO+bbJK7DiChjr4KrV6qgrujy2KY=;
        b=km287LZYd10QznJopaq6u/sLtWVK0jrToeGc2jM1g6ECto0HqkjwG6sIuWh99MqR+T
         T9yDktTWwyrAdBQsq1v85dpBGyMsDHzQhewLTuL3gmOX56ryr6t2TmH0oDi8tl4iVSgN
         I8HWAcWiA8slBmdXCvNtxZotYF9B51qs4lTyhV72yvHr7ICFJd3UbzlQAXVcCaqeRNU8
         dem0TvuOUI5dhnrr4k4cOkrvgE49M82R5UTy/QXBxlxIb4ULPn3x5iCb+uuwJ9XsENdk
         2PE8KI+SMzDix2STNz8g8RpjFjdbHVpgWKCdFL3xNd0+cS6O48jStQbVhEsAdz647iFr
         MaVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmaFCvg0PJdOlxc+/JZOqFVwuVnkDJLqTuI9u+6LIH0ZtBkFLFNSSSY3h0cY1GbEM/cqDgrrxmx5WLllSw@vger.kernel.org
X-Gm-Message-State: AOJu0YwqIUFOcELPlnUTjYHH27Fwv+zlVhm8SaIy5ydJcR/ETVkxAL9T
	iEe8xqFymMFH6kefTd6RK4PbSrnd6RG0LqhL9OSVobrT0uyEiZNIhBgUnnh8AzKU0nNfxbzTnJJ
	n2L1l9ADKgyB30APtAha6cy4lDOtsMZFN6ZOWDlegqqUKjD/z4rCqUcxJimJhiWlrshn7DOUzj8
	3tgfdJs3+DE42b5yRMvRilXG1KSGKjMEAKiHD38AXzxZU=
X-Gm-Gg: ASbGncsLRzFapo6xMfs2z3oVawuePatT+tEyX1yN95FZ9C+e0bqSY6V2QmAbmCnfSby
	AETcSfMX7MzLejZb59hBs/1bmkUcf3z7F1j23O0iQlpR2BVmHjs08hVM5lFyOsZ5qwm2ZxAzpEJ
	P6wluM5Ba2aSRDfhuqPpqW
X-Received: by 2002:a17:903:1904:b0:240:b075:577f with SMTP id d9443c01a7336-2446d88a228mr161159675ad.37.1755513578202;
        Mon, 18 Aug 2025 03:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUM2A0hdX9FsBJLEPJbp3KSguYOCXdOebXbrwsf8ik37oWFFlR4LOTxGgWWRteP6dq+6jq5ehC6dDWnd+1oLM=
X-Received: by 2002:a17:903:1904:b0:240:b075:577f with SMTP id
 d9443c01a7336-2446d88a228mr161159285ad.37.1755513577778; Mon, 18 Aug 2025
 03:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
 <20250814-x1e80100-add-edp-hpd-v1-1-a52804db53f6@linaro.org>
 <pmhy2ogyorelllgandehtzlen64tzegp5pc6fkg7al7xzjcb2h@lq4lpaaavr6j>
 <aKLZ5M12Q-qTuB4n@linaro.org> <ubagrwewqqyvdgjmibhqp57x7ttqukqtv6ziftwsayuomlght6@j2k7i63rldsd>
 <aKMCfJW-Qv4Z-gnz@linaro.org>
In-Reply-To: <aKMCfJW-Qv4Z-gnz@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:39:26 +0300
X-Gm-Features: Ac12FXw9-48k1mfCCr7bd_NPB5vnYv4AGrWYDnXzJRQ9v-s8MaalFg_Q-oShxVM
Message-ID: <CAO9ioeXhBH_=+KMMBzxZXsQu_y57tdMQW5dwHV_dhwG3gUxytA@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: qcom: x1-asus-zenbook-a14: Add missing
 pinctrl for eDP HPD
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: PllMznmPyGCzOQgTZ5YPadoWNpbWyRpS
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a302ec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=KKAkSRfTAAAA:8 a=q_Zo2jFP8hCPp6grwmUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PllMznmPyGCzOQgTZ5YPadoWNpbWyRpS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfXwUgLtNvpRcc1
 Ov2eoolima8Hu0UppWra4YR1bbo6EYvhMVCjoVmNM4gi4QLFdsEzmSOz9gRfwdV18yI7zg7pSrM
 OQUwLjJynnwAAcbXUM8GKBqN8y4dFQBW9BFAHI2vQQ9PDTb2wnPqeLlCXIB/luKS0rdyZRySxAC
 7WBNE63J8QXraR3+ke5R3VoZNkWHONi9rOQyyni7BcssXKlD/YjRfeRF0ODIqce8Dx52Ig0WOuK
 Nq3tBwKxQW6S1uJmYZLhHkGBgfdXbgHZ22NyiFYzEvPi2fPyjQYwZoCXzwjSohaBgkCv8Q8tCTZ
 BogbwP2qXWlly3thpS9OzdkHmpY7ttotcu/krXuz8O89oZ0P8BXjxUXqmikRJWq/Ce8iaQlJHut
 i5Nt1BRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

On Mon, 18 Aug 2025 at 13:37, Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Mon, Aug 18, 2025 at 01:33:43PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Aug 18, 2025 at 09:44:36AM +0200, Stephan Gerhold wrote:
> > > On Sat, Aug 16, 2025 at 01:06:50AM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 14, 2025 at 03:30:28PM +0200, Stephan Gerhold wrote:
> > > > > At the moment, we indirectly rely on the boot firmware to set up the
> > > > > pinctrl for the eDP HPD line coming from the internal display. If the boot
> > > > > firmware does not configure the display (e.g. because a different display
> > > > > is selected for output in the UEFI settings), then the display fails to
> > > > > come up and there are several errors in the kernel log:
> > > > >
> > > > >  [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
> > > > >  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
> > > > >  [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
> > > > >  ...
> > > > >
> > > > > Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
> > > > > bias-disable according to the ACPI DSDT).
> > > > >
> > > > > Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
> > > > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> > > > > index 16d045cf64c08c02c420787e000f4f45cfc2c6ff..613c675aac296f931293a1ba3d8506c6663bad21 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> > > > > @@ -1001,6 +1001,9 @@ &mdss_dp1_out {
> > > > >  &mdss_dp3 {
> > > > >         /delete-property/ #sound-dai-cells;
> > > > >
> > > > > +       pinctrl-0 = <&edp_hpd_default>;
> > > > > +       pinctrl-names = "default";
> > > > > +
> > > > >         status = "okay";
> > > > >
> > > > >         aux-bus {
> > > > > @@ -1236,6 +1239,12 @@ cam_indicator_en: cam-indicator-en-state {
> > > > >                 bias-disable;
> > > > >         };
> > > > >
> > > > > +       edp_hpd_default: edp-hpd-default-state {
> > > > > +               pins = "gpio119";
> > > > > +               function = "edp0_hot";
> > > > > +               bias-disable;
> > > > > +       };
> > > >
> > > > I think this is common enough. Let's maybe push this into the SoC dtsi
> > > > instead of copying it to all devices?
> > > >
> > >
> > > I had it there before, but Johan commented on the patch set from Chris
> > > that he would prefer to keep the potentially board-specific pinctrl out
> > > of the SoC dtsi [1]. So I can either address his feedback or yours. :-)
> > >
> > > There isn't really a convention for X1E either - we have a wild mix
> > > where some pinctrl is defined in the SoC dtsi (UART, I2C, SDHCI, ...)
> > > and others is copied for each board (e.g. PCIe).
> >
> > PCIe pinctrl is a part of SoC DTSI for SM8[4567]0.
> >
>
> For some reason it's not on X1E.
>
> > > The reason I chose this approach is that I didn't feel it is guaranteed
> > > that the HPD pin has external pull down. It seems to be the case on most
> > > devices, but in theory a device could maybe rely on the internal pull
> > > down. Might be better to have it explicitly defined, the 5 additional
> > > lines are not that much at the end.
> >
> > I don't think anybody will use internal pull-down for this, it would be
> > too risky in case the eDP cable is bad. I have checked several laptops,
> > they use external pull-down or two MOSFETs.
> >
>
> So are you suggesting to put just the "template" (the
> edp-hpd-default-state node) into the SoC dtsi and keep the
> pinctrl-0/pinctrl-names reference in the board DT,

Yes.

> or to put everything
> into the SoC dtsi? I'm not sure if there is a use case where there
> wouldn't be any HPD connected to GPIO119.

Still it's a board configuration (pretty much like PCIe config is).


-- 
With best wishes
Dmitry

