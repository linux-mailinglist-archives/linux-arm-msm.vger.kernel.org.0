Return-Path: <linux-arm-msm+bounces-61616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A368ADD53A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 18:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5D91407416
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 16:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491CF2DFF3B;
	Tue, 17 Jun 2025 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oi+9kPcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF52F235C;
	Tue, 17 Jun 2025 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176444; cv=none; b=UwPYtv9FG6yhnwlsSOASMxSKxAV+APS7P/7DEyJQgKH0aXO03k1f8Rugqaaa8sspE0p5iMa24ECRM+h2r025kVfDuhoIGkA9c72/gy04wnCAZJkIVU2J7TEmrsbtA7wwiy5ptDe2WUaszcWXKb4//xvlzpE1hspPn158KYH6XQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176444; c=relaxed/simple;
	bh=w7c5sspFtctPMfyLN00XvSGg8kejm34U4237Aihy8+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tODqQjPe1dDnQ62mSeyaD08JmPQp3MDcYSaOSf6Q3sUFqNuB7LgmVDfKp4q5xdXlwVyM9qGv/3PIVkp4nleNLb4H2cjnz/ZL7ocMwCMlWl7JFQ7m39yeMByWNoYmwF5L9Z9dHz2K5N6VgtD31qahSpdcQSqEIH69zPT+G9HKAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oi+9kPcI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886BCC4CEE3;
	Tue, 17 Jun 2025 16:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750176443;
	bh=w7c5sspFtctPMfyLN00XvSGg8kejm34U4237Aihy8+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oi+9kPcIDt+CsGFZaus4RVrN4N1AuS2nFdQvN0Azw0RQ7TzbmJ0B4U4EH9udx0/JO
	 e/plr8336D2WAv+s/o5C2roEnulpZybOJyx3v4r+s6aOBHNTYC398DxBUL5HiCgdGD
	 TeNLWJsw5KCdrbrmLkIsMZzVa7FRUh673MBvV6FDCuYgLrwt7NPyHIERLCMQlwUQn4
	 2iqmpFoO17xUzV/L2Jnpfh3fQYepAAlAXSrKXf+VtTl5zwWr4xziDRhI3JDAzCNpkq
	 vD9rCGdtcgWViNPTQJeNUpM0HO95Fd2kcS17vPizv1wu2xBafOzP0WTLasAX33S8DJ
	 cS3egmIbI4Zug==
Date: Tue, 17 Jun 2025 11:07:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, psodagud@quicinc.com, djaggi@quicinc.com, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, quic_arandive@quicinc.com, 
	quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v6 6/8] serial: qcom-geni: move clock-rate logic to
 separate function
Message-ID: <mtdi5hpkrthohdvhtbojhhp6saip2uohv5343vpqwz2jssvskp@lpebfyxhqcjt>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-7-quic_ptalari@quicinc.com>
 <509c94bb-cf31-43bb-a92d-db006efd43aa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509c94bb-cf31-43bb-a92d-db006efd43aa@quicinc.com>

On Mon, Jun 16, 2025 at 09:34:27PM +0530, Praveen Talari wrote:
> Hi Bryan,
> 
> Gentle reminder!!
> 

As I've told you all countless times, if you want attention to your
patchset review each others patches! For some reason you're the only one
showing interest in getting this series merged.

> Thanks,
> Praveen Talari
> 
> On 6/6/2025 10:51 PM, Praveen Talari wrote:
> > Facilitates future modifications within the new function,
> > leading to better readability and maintainability of the code.
> > 
> > Move the code that handles the actual logic of clock-rate
> > calculations to a separate function geni_serial_set_rate()
> > which enhances code readability.
> > 
> > Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> > ---
> > v5 -> v6
> > - used "unsigned int" instead of "unsigned long" in newly
> >    added API function params to avoid the format specifier
> >    warnings.
> > 
> > v3 -> v4
> > - added version log after ---
> > 
> > v1 -> v2
> > - resolved build warnings for datatype format specifiers
> > - removed double spaces in log
> > ---
> >   drivers/tty/serial/qcom_geni_serial.c | 56 +++++++++++++++++----------
> >   1 file changed, 36 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 715db35bab2f..b6fa7dc9b1fb 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -1283,27 +1283,14 @@ static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
> >   	return ser_clk;
> >   }
> > -static void qcom_geni_serial_set_termios(struct uart_port *uport,
> > -					 struct ktermios *termios,
> > -					 const struct ktermios *old)
> > +static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
> >   {
> > -	unsigned int baud;
> > -	u32 bits_per_char;
> > -	u32 tx_trans_cfg;
> > -	u32 tx_parity_cfg;
> > -	u32 rx_trans_cfg;
> > -	u32 rx_parity_cfg;
> > -	u32 stop_bit_len;
> > -	unsigned int clk_div;
> > -	u32 ser_clk_cfg;
> >   	struct qcom_geni_serial_port *port = to_dev_port(uport);
> >   	unsigned long clk_rate;
> > -	u32 ver, sampling_rate;
> >   	unsigned int avg_bw_core;
> > -	unsigned long timeout;
> > -
> > -	/* baud rate */
> > -	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
> > +	unsigned int clk_div;
> > +	u32 ver, sampling_rate;
> > +	u32 ser_clk_cfg;
> >   	sampling_rate = UART_OVERSAMPLING;
> >   	/* Sampling rate is halved for IP versions >= 2.5 */
> > @@ -1317,7 +1304,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
> >   		dev_err(port->se.dev,
> >   			"Couldn't find suitable clock rate for %u\n",
> >   			baud * sampling_rate);
> > -		return;
> > +		return -EINVAL;
> >   	}
> >   	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
> > @@ -1339,6 +1326,37 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
> >   	port->se.icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(baud);
> >   	geni_icc_set_bw(&port->se);
> > +	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
> > +	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
> > +	return 0;
> > +}
> > +
> > +static void qcom_geni_serial_set_termios(struct uart_port *uport,
> > +					 struct ktermios *termios,
> > +					 const struct ktermios *old)
> > +{
> > +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> > +	unsigned int baud;
> > +	unsigned long timeout;
> > +	u32 bits_per_char;
> > +	u32 tx_trans_cfg;
> > +	u32 tx_parity_cfg;
> > +	u32 rx_trans_cfg;
> > +	u32 rx_parity_cfg;
> > +	u32 stop_bit_len;
> > +	int ret = 0;
> > +
> > +	/* baud rate */
> > +	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
> > +
> > +	ret = geni_serial_set_rate(uport, baud);
> > +	if (ret) {
> > +		dev_err(port->se.dev,
> > +			"%s: Failed to set baud:%u ret:%d\n",
> > +			__func__, baud, ret);

As far as I can tell there's one error path in geni_serial_set_rate()
and there you already printed a more specific error message, as such
this doesn't add any value.

PS. In general, please don't use __func__, write helpful error messages
instead.

Regards,
Bjorn

> > +		return;
> > +	}
> > +
> >   	/* parity */
> >   	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
> >   	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
> > @@ -1406,8 +1424,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
> >   	writel(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
> >   	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
> >   	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
> > -	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
> > -	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
> >   }
> >   #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE

