Return-Path: <linux-arm-msm+bounces-69521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AD3B29F30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A714E3BA1C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D41021B9E7;
	Mon, 18 Aug 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdMFnioy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E30A2C2343
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513232; cv=none; b=fnlDWVC0NJeau3Jxnwm+yoS5OEp3x99WHqXSCe73hxhRffv0NwlovnUm/7Og24VAL4cXV49yEwQHgN91oeZDoeOZgU5+/RnmpnXY51lsoRs5+PxbeaejRPa+0qwaf4DuP3KnS5M+vKsgMSKeiL5jZ647yrH+MOlPRrWCyhpMy08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513232; c=relaxed/simple;
	bh=kp5VnNcbs+9/ErL8zE8XvSZqvp7my5Lsakn8f4ZZTOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqpDVCmBQYWSyN+VRYtmm5H/vhd6Yi/SRl1f8Izb+lcWYeppL0CdS54H9yw4hfUF633tp0LNq8QHAAF+n7mzDP/xN7XkQ0p64zgz3wi+KCNL3QvN5jfgpZDMSWcO2LcdT4wSwLOD1vLlu/3uPugyg4SiBRmScyTKeUTp7Ced1Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdMFnioy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8J9tF032159
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 10:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A7ynXFPAdDr93bbf3NbCgD8j
	ygp0goJYJwT/DBfR7E0=; b=OdMFnioyG0X1y6dW2Lq6fKB/IyxOCBIiQ9TQ8iTJ
	KLoSIDasmi+ltdOJ/C9MTSKl7e5M7zSEXhwwcMlFxUxMEGx4dUkwmSvJea/U7467
	VgGJMod+C9m8cnxmmiigaSCYORPDMDpWxUtSezUXfOKqNmuidxMLeMf6xTUAwode
	gwLcyBuy6JOk+V4qod2x2Ri6Z11gDCsR36TJ3oel1nNQOIVA/lpdcLFU/Y40w3Sz
	gJ5KQq/4XRVdabpnis8ePfZCai9vShmehQ5eh6XDCT0VyNZ6b2JstJOYV+6SSeI2
	hE8AfUUzEh3+jjfFhsxr8QTItYxlkR5UfQCs9Us7gEISZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtcfaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 10:33:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109bc5ecaso115590501cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 03:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755513227; x=1756118027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7ynXFPAdDr93bbf3NbCgD8jygp0goJYJwT/DBfR7E0=;
        b=EU7cfWN2MNX0WMFdcozRIPfxMLAI2YXznhEoBEsa/J1PE7a5mUCwQChpnMPyVxNSry
         M8yI1rg6LyHF3UQh5RSYGEXnLfIADO3HmAIumdW9GrxZXsXAOORCn4A9Hsf74ljg9Zmd
         D+mwy+qFbOUnz8HX+MyjYZH3Hft5CXGIfM0JFOg8PE2bMZdngR3XwRxSGfSIHJivsq2E
         xnIlCCi9vG8xNvFpUZhCZ+VvfhRXhwQ+sY+OZ3ql04A/+Oo8WibRvqw9sjeIvhCVI338
         2uJmApiZkr6pMDEX/nkFT6yUkdfRZMtOZHYLpxC0vVnSvImlQs8hMKn83AURZuBpAYLG
         Hshw==
X-Forwarded-Encrypted: i=1; AJvYcCXED9twwR8KKlZH3LtvIkhNdR3XhzksQnrpcKAj0f0QCeYWhQoiJGhLopYYjkABZE4UKeUPLGTspXLfh3ub@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8D8NF3Z1oHLXM85UFCU6SEmEnNjIZQDUl6QWPx7CVM53XdAt
	n8xbEcLqbTmN3sla2J37UutRQdVk9WQjEdk7YgGm0rYXXrr76CHRFPz/JTChjb7Uh1Om1aCRMcO
	lK9iiI23ukOfosxU8Wziss0EnlOKURWXphEnxFaax2jFbt0iDkAmv650nT89mtGhFvUOv
X-Gm-Gg: ASbGncu2dQb0uIVOAAO2TxPnu2QukDNfdwFjcmdXCoW5ORLKc/Fo7ZOljooDwDo/ADf
	DGfNBGwatc4/6x/5iTnyUU4i8EevkL/GHDjDoUgxOzj0j2i58Xj7bIYR0E8oTdqnEeqckUB9NJX
	Be9DWjVEXmO0c/SqI63Ct4jyzTpNXgIlvwfrMM49zYfisLhwBXzxpBb/5jp1HDigvFa/8i6AFCy
	DRvH9iJCX7cYwTvsiSl30NJg5lTN5oQ3e4sOqskjvgz/5mcFFI9aDA9nDHP7dntGYlourh0QF14
	A8oTt32COi7TE+NeCY8T/wvHLytu0hDBMpKZQ6ZsRXXXI7+ULnsAUGTnnsg6E5IHmY/4Gl+Ac4e
	6XusZzc3805KwgrK6bhczcTQE/KenJaARmIsSbF5WHvgMHMrOsAya
X-Received: by 2002:a05:622a:24e:b0:4ab:9586:386b with SMTP id d75a77b69052e-4b11e27d4f3mr156692031cf.53.1755513226741;
        Mon, 18 Aug 2025 03:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmsjNW1ZeHTRfqJuRiDYJxZ1Opx0gN6XfkaTOXUZxgte6+tNjsiZmaOhN2niJbZ9NaHk0qng==
X-Received: by 2002:a05:622a:24e:b0:4ab:9586:386b with SMTP id d75a77b69052e-4b11e27d4f3mr156691421cf.53.1755513226026;
        Mon, 18 Aug 2025 03:33:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369843sm1592070e87.60.2025.08.18.03.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 03:33:45 -0700 (PDT)
Date: Mon, 18 Aug 2025 13:33:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH 1/9] arm64: dts: qcom: x1-asus-zenbook-a14: Add missing
 pinctrl for eDP HPD
Message-ID: <ubagrwewqqyvdgjmibhqp57x7ttqukqtv6ziftwsayuomlght6@j2k7i63rldsd>
References: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
 <20250814-x1e80100-add-edp-hpd-v1-1-a52804db53f6@linaro.org>
 <pmhy2ogyorelllgandehtzlen64tzegp5pc6fkg7al7xzjcb2h@lq4lpaaavr6j>
 <aKLZ5M12Q-qTuB4n@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKLZ5M12Q-qTuB4n@linaro.org>
X-Proofpoint-ORIG-GUID: -5TSDm07LYIq0fC9-k8p11Pr-bJCHasf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX1JXG6n0Q913T
 pNnA97ykKCek0F/qfT6ThO83NhNWPgKD+4MWP9Prtojq/izvJqcytjJEzuhCnuRSz9i1MpZaP57
 78No0RuSgYSdRpsLM/cQkjvZ9Au6Jz3p0nBRzebPikKLR+Y7MHjsBXmLlrzQiVmsxkP6qNc3UJ2
 QzHKF99iqJVXF3iHQStjNU6V+8bKPMU/izJ0C5pOHDVnnbELaZzu24PIJL+4Yg42ksBztpQuLOt
 6cR1XU21S63LWBOHgaPEVT1xY62raRLZKiW5RrIbz+NHxzirrlpu+3fVioHAOm+pW+BZNHWmEKE
 aZEeNx2EmjPAceXSGfZ2tuRp3PG9U66sNSuqx5v9k8mSrhyvmhdbxW466eB7MWBtfX9j0sEnjQ3
 h/OzpNRo
X-Proofpoint-GUID: -5TSDm07LYIq0fC9-k8p11Pr-bJCHasf
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a3018d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=thYETgxLN2gimk122HMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

On Mon, Aug 18, 2025 at 09:44:36AM +0200, Stephan Gerhold wrote:
> On Sat, Aug 16, 2025 at 01:06:50AM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 14, 2025 at 03:30:28PM +0200, Stephan Gerhold wrote:
> > > At the moment, we indirectly rely on the boot firmware to set up the
> > > pinctrl for the eDP HPD line coming from the internal display. If the boot
> > > firmware does not configure the display (e.g. because a different display
> > > is selected for output in the UEFI settings), then the display fails to
> > > come up and there are several errors in the kernel log:
> > > 
> > >  [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
> > >  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
> > >  [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
> > >  ...
> > > 
> > > Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
> > > bias-disable according to the ACPI DSDT).
> > > 
> > > Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
> > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> > > index 16d045cf64c08c02c420787e000f4f45cfc2c6ff..613c675aac296f931293a1ba3d8506c6663bad21 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> > > @@ -1001,6 +1001,9 @@ &mdss_dp1_out {
> > >  &mdss_dp3 {
> > >  	/delete-property/ #sound-dai-cells;
> > >  
> > > +	pinctrl-0 = <&edp_hpd_default>;
> > > +	pinctrl-names = "default";
> > > +
> > >  	status = "okay";
> > >  
> > >  	aux-bus {
> > > @@ -1236,6 +1239,12 @@ cam_indicator_en: cam-indicator-en-state {
> > >  		bias-disable;
> > >  	};
> > >  
> > > +	edp_hpd_default: edp-hpd-default-state {
> > > +		pins = "gpio119";
> > > +		function = "edp0_hot";
> > > +		bias-disable;
> > > +	};
> > 
> > I think this is common enough. Let's maybe push this into the SoC dtsi
> > instead of copying it to all devices?
> > 
> 
> I had it there before, but Johan commented on the patch set from Chris
> that he would prefer to keep the potentially board-specific pinctrl out
> of the SoC dtsi [1]. So I can either address his feedback or yours. :-)
> 
> There isn't really a convention for X1E either - we have a wild mix
> where some pinctrl is defined in the SoC dtsi (UART, I2C, SDHCI, ...)
> and others is copied for each board (e.g. PCIe).

PCIe pinctrl is a part of SoC DTSI for SM8[4567]0.

> The reason I chose this approach is that I didn't feel it is guaranteed
> that the HPD pin has external pull down. It seems to be the case on most
> devices, but in theory a device could maybe rely on the internal pull
> down. Might be better to have it explicitly defined, the 5 additional
> lines are not that much at the end.

I don't think anybody will use internal pull-down for this, it would be
too risky in case the eDP cable is bad. I have checked several laptops,
they use external pull-down or two MOSFETs.

> I'm also fine with moving it. Perhaps Bjorn or Konrad could comment if
> they would prefer to have the pinctrl template defined in the SoC dtsi?

-- 
With best wishes
Dmitry

