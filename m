Return-Path: <linux-arm-msm+bounces-39702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB1C9DEFE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 11:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C5B9B20C60
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 10:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B78D14AD17;
	Sat, 30 Nov 2024 10:26:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62812B93
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732962391; cv=none; b=j7Mva/v+sSGyIpua8fj3YWk6A8nD1+5h7TqOjHZ65II7jAQ4Tc0w1dyzFQiDheZ8g6XZdtGHHcTU/OJfIqaYki7t9wQFPaWMwpcduFU+G3yvG/JhtbBuYtLuSjCD3r6keXnrhbg1AclEqhRVEa6doV/COCs3cjrHxwq/sjFd910=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732962391; c=relaxed/simple;
	bh=a/YecwsqB+3UR08us3GbLJJp6tKt+SE3pDxGSB54og4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXDngNi3jTpnOYoWwmcvLI+kZ+C6uunLjADbpeGIdVP9t4eKbK8xxOVQ2fPo94B1kxXOJgHSZhNt3xnTQXei8NN4ErFXOaRs9hZajXAu3XgbPEyb9H2HNJbWYoQRRzA+BAUy/CcdtUMFGWzFOxF/Hf5JABQ5/hQ6ZBCj6QgfKdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C84643F02A;
	Sat, 30 Nov 2024 11:18:17 +0100 (CET)
Date: Sat, 30 Nov 2024 11:18:16 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Joseph Gates <jgates@squareup.com>, Georgi Djakov <djakov@kernel.org>, 
	Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
	Zac Crosby <zac@squareup.com>, Bastian =?utf-8?Q?K=C3=B6cher?= <git@kchr.de>, 
	Andy Gross <andy.gross@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>, 
	Rohit Agarwal <quic_rohiagar@quicinc.com>, Melody Olvera <quic_molvera@quicinc.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, cros-qcom-dts-watchers@chromium.org, 
	Stephen Boyd <swboyd@chromium.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Martin Botka <martin.botka@somainline.org>, Jonathan Marek <jonathan@marek.ca>, 
	Vinod Koul <vkoul@kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
	James Willcox <jwillcox@squareup.com>, Max Chen <mchen@squareup.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Benjamin Li <benl@squareup.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/31] arm64: dts: qcom: move board clocks to SoC DTSI
 files
Message-ID: <tiwwoasuecfv2ifyoceqhkw6rvgrr4ibfzfrahsx5dkinw4k4m@kwzgxy3cdpr6>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>

On 2024-11-30 03:44:12, Dmitry Baryshkov wrote:
> Multiple Qualcomm platforms play strange tricks with board-level clocks
> (XO, sleep) definitions. On some (older) platforms such clocks are
> completely defined within SoC.dtsi file (although these clocks are not a
> part of the SoC). On other platforms definitions of such clocks are
> split between the SoC dtsi file and the board file. Several obscure
> platforms define those clocks completely in the board files. Unify the
> design and move complete description of those clocks to the SoC DTSI
> file.
> 
> The XO clock is (usually) an external crystal used by the external PMIC,
> which then provides RF CLK and LN BB CLK to the main SoC. However for
> technical reasons this part of the PMIC is modelled as a part of the SoC
> as RPM or RPMh clock controllers. It makes it impractical to describe XO
> clock as being used or being connected to the PMIC.
> 
> Sleep clock is a 32.764 kHz RC oscillator provided by one of
> PMICs. However pushing it into the PMIC might interact badly with fw
> devlink, causing unnecessary probe delays and/or devlink loops. One of
> the possible solutions might be to move it to the corresponding
> PMIC.dtsi, but model the clock outside of the PMIC node, providing
> /clocks/sleep-clk node from that file.
> 
> Note, the series includes a set of fixes for the sleep clocks
> frequencies. For several platforms I wasn't able to find corresponding
> document and as such I didn't change defined clocks. These platforms
> are: IPQ5018, IPQ5332, IPQ5424, IPQ6018, IPQ8074, IPQ9574, MSM8953.
> 
> Also several MSM8996 / MSM8994 devices define divisor clocks at
> 32.768 kHz. Most likely these clocks are also generated by dividing the
> 19.2 MHz clock and should have the frequency 32.764 kHz, but being not
> 100% sure I decided to leave those as is for now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Move clocks to SoC DTSI (offline discussion with Bjorn)
> - Link to v1: https://lore.kernel.org/r/20241115-fix-board-clocks-v1-0-8cb00a4f57c2@linaro.org
> 
> ---
> Dmitry Baryshkov (31):
>       arm64: dts: qcom: msm8916: correct sleep clock frequency
>       arm64: dts: qcom: msm8939: correct sleep clock frequency
>       arm64: dts: qcom: msm8994: correct sleep clock frequency
>       arm64: dts: qcom: qcs404: correct sleep clock frequency
>       arm64: dts: qcom: q[dr]u1000: correct sleep clock frequency
>       arm64: dts: qcom: qrb4210-rb2: correct sleep clock frequency
>       arm64: dts: qcom: sar2130p: correct sleep clock frequency
>       arm64: dts: qcom: sc7280: correct sleep clock frequency
>       arm64: dts: qcom: sdx75: correct sleep clock frequency
>       arm64: dts: qcom: sm4450: correct sleep clock frequency
>       arm64: dts: qcom: sm6125: correct sleep clock frequency
>       arm64: dts: qcom: sm6375: correct sleep clock frequency
>       arm64: dts: qcom: sm8250: correct sleep clock frequency
>       arm64: dts: qcom: sm8350: correct sleep clock frequency
>       arm64: dts: qcom: sm8450: correct sleep clock frequency
>       arm64: dts: qcom: sm8550: correct sleep clock frequency
>       arm64: dts: qcom: sm8650: correct sleep clock frequency
>       arm64: dts: qcom: x1e80100: correct sleep clock frequency
>       arm64: dts: qcom: sc8180x: drop extra XO clock frequencies
>       arm64: dts: qcom: ipq5018: move board clocks to ipq5018.dtsi file
>       arm64: dts: qcom: ipq5332: move board clocks to ipq5332.dtsi file
>       arm64: dts: qcom: ipq5424: move board clocks to ipq5424.dtsi file
>       arm64: dts: qcom: ipq9574: move board clocks to ipq9574.dtsi file
>       arm64: dts: qcom: qcm2290: move board clocks to qcm2290.dtsi file
>       arm64: dts: qcom: sc8280xp: move board clocks to sc8280xp.dtsi file
>       arm64: dts: qcom: sm6115: move board clocks to sm6115.dtsi file
>       arm64: dts: qcom: sm6375: move board clocks to sm6375.dtsi file
>       arm64: dts: qcom: sm8550: move board clocks to sm8550.dtsi file
>       arm64: dts: qcom: sm8650: move board clocks to sm8650.dtsi file
>       arm64: dts: qcom: sdm670: move board clocks to sdm670.dtsi file
>       arm64: dts: qcom: q[dr]u1000: move board clocks to qdu1000.dtsi file
> 
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts             |  8 --------
>  arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts |  8 --------
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi                      |  2 ++
>  arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi           |  8 --------
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi                      |  2 ++
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts                |  9 ---------
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi                      |  2 ++
>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi           |  8 --------
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi                      |  2 ++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi                      |  2 +-
>  arch/arm64/boot/dts/qcom/msm8939.dtsi                      |  2 +-
>  arch/arm64/boot/dts/qcom/msm8994.dtsi                      |  2 +-
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi                      |  1 +
>  arch/arm64/boot/dts/qcom/qcs404.dtsi                       |  2 +-
>  arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi               |  8 --------
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts                   | 14 --------------
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi                      | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                   |  4 ----
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   |  8 --------
>  arch/arm64/boot/dts/qcom/qru1000-idp.dts                   | 14 --------------
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts                   |  4 ----
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts                  |  4 ----
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi                     |  2 +-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi                       |  2 +-
>  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        |  4 ----
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts                |  4 ----
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  |  4 ----
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts |  4 ----
>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     |  4 ----
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     |  1 +
>  arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts           | 14 --------------
>  arch/arm64/boot/dts/qcom/sdm670.dtsi                       | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sdx75.dtsi                        |  2 +-
>  arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts        |  8 --------
>  arch/arm64/boot/dts/qcom/sm4450.dtsi                       |  2 +-
>  arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts            |  8 --------
>  arch/arm64/boot/dts/qcom/sm6115.dtsi                       |  2 ++
>  arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts          |  8 --------
>  arch/arm64/boot/dts/qcom/sm6125.dtsi                       |  2 +-
>  .../boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts     |  4 ----
>  arch/arm64/boot/dts/qcom/sm6375.dtsi                       |  3 ++-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi                       |  2 +-
>  arch/arm64/boot/dts/qcom/sm8350.dtsi                       |  2 +-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi                       |  2 +-
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts                    |  8 --------
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts                    |  8 --------
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts                    |  8 --------
>  arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts            |  8 --------
>  .../arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts |  8 --------
>  arch/arm64/boot/dts/qcom/sm8550.dtsi                       |  2 ++
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts                    |  8 --------
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts                    |  8 --------
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts                    |  8 --------
>  arch/arm64/boot/dts/qcom/sm8650.dtsi                       |  2 ++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi                     |  2 +-
>  55 files changed, 59 insertions(+), 237 deletions(-)

It looks like MSM8956/MSM8976 is missing from this list, which most recently
had the its frequency moved out to the loire board in 4a2c9b9e1215 ("arm64: dts:
qcom: msm8976: Add and provide xo clk to rpmcc").

Searching for the `^&sleep_clk` and `^&xo_board` patterns shows
`sa8775p-ride.dtsi` is still overriding these clocks as well, noting that the
label is named `xo_board_clk` on sa8775p and a few platforms but `xo_board` on
everything else...

- Marijn

> ---
> base-commit: cfba9f07a1d6aeca38f47f1f472cfb0ba133d341
> change-id: 20241115-fix-board-clocks-e3afe520627c
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

