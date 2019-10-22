Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5D56E0A48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2019 19:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfJVRPN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Oct 2019 13:15:13 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41185 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732629AbfJVRPN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Oct 2019 13:15:13 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so11038349pfh.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2019 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h50Pi9XwOsR13aFlSA2CGe6nBusqUaN9N1zc7oNb4PM=;
        b=UvzBGgeTgfAtcXP1FB0br1DsNDcrRyYR4jkC+DfnlzDHvFSyW1tI7nCx2yNZmcj2WN
         OczJvcdDtpV9pZ8kzRoh3ch4+4iF/jJPOST+cLCokov/O1jMpoGeVFWgAYYLKWKJL8Tp
         KGYXAAITmrRH1HflOWy1TsC5SzYI26+Io0QS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h50Pi9XwOsR13aFlSA2CGe6nBusqUaN9N1zc7oNb4PM=;
        b=MxH/5ZJwREh15IuWWupWr02KRmHALI6xixh0tNQJ/L18uU/tMz2Ow7ula57ertFvvW
         HseA0TxSEUdAbuXyEAjkjzvL9ZzmqbEByMot2X2RRVLmyXglI8SSXZl1O4qftK7NYL2E
         p5/chCxnSLZVB5rMtp6Z0sZRXRAI5OrtsoUrdXswZQoUjrQp3l3yZCdPaiANRkdOu8fi
         cFBwMxSorMb73BS4KqUquLQsJTrJEZYK1O6XdlcMOTOrwn3isXBuyeViyqId89yq2tb4
         KF7XEQtxIPxQtud21Bm3y5DGJpK/U5Bj4yS66OclqYCrdZDacRy6+ZWNl6kxtHe9qGdy
         j2Dw==
X-Gm-Message-State: APjAAAWWcys7Bgucrly4VJt6uc33PZCncyaoydV0sPyp89FAJ26yysGI
        imyLKHHNicidxb1FVtPqkK7Ncg==
X-Google-Smtp-Source: APXvYqyG0OfMRoG7uYhrblw+12GhEr/VYU+Opf8UClqR725yP7qojPu+4B2BRZRrLrdfm2E1KeELFw==
X-Received: by 2002:a17:90a:3706:: with SMTP id u6mr6040268pjb.107.1571764510860;
        Tue, 22 Oct 2019 10:15:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 69sm19915996pgh.47.2019.10.22.10.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2019 10:15:07 -0700 (PDT)
Date:   Tue, 22 Oct 2019 10:15:05 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org, hemantg@codeaurora.org,
        Harish Bandi <c-hbandi@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/4] Bluetooth: hci_qca: Don't vote for specific voltage
Message-ID: <20191022171505.GK20212@google.com>
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
 <20191018052405.3693555-3-bjorn.andersson@linaro.org>
 <20191018182205.GA20212@google.com>
 <7f9a4de91f364a5f8ce707c8d8a2344d@codeaurora.org>
 <5bbd8e5bbd832ecdafc7c2d603f10c6c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5bbd8e5bbd832ecdafc7c2d603f10c6c@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 22, 2019 at 11:35:43AM +0530, Balakrishna Godavarthi wrote:
> Hi Matthias, Bjorn andresson,
> 
> On 2019-10-21 12:07, Harish Bandi wrote:
> > + Bala
> > 
> > On 2019-10-18 23:52, Matthias Kaehlcke wrote:
> > > On Thu, Oct 17, 2019 at 10:24:02PM -0700, Bjorn Andersson wrote:
> > > > Devices with specific voltage requirements should not request voltage
> > > > from the driver, but instead rely on the system configuration to
> > > > define
> > > > appropriate voltages for each rail.
> > > > 
> > > > This ensures that PMIC and board variations are accounted for,
> > > > something
> > > > that the 0.1V range in the hci_qca driver currently tries to address.
> > > > But on the Lenovo Yoga C630 (with wcn3990) vddch0 is 3.1V, which
> > > > means
> > > > the driver will fail to set the voltage.
> > > > 
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > ---
> > > >  drivers/bluetooth/hci_qca.c | 26 ++++++++------------------
> > > >  1 file changed, 8 insertions(+), 18 deletions(-)
> > > > 
> > > > diff --git a/drivers/bluetooth/hci_qca.c
> > > > b/drivers/bluetooth/hci_qca.c
> > > > index c07c529b0d81..54aafcc69d06 100644
> > > > --- a/drivers/bluetooth/hci_qca.c
> > > > +++ b/drivers/bluetooth/hci_qca.c
> > > > @@ -130,8 +130,6 @@ enum qca_speed_type {
> > > >   */
> > > >  struct qca_vreg {
> > > >  	const char *name;
> > > > -	unsigned int min_uV;
> > > > -	unsigned int max_uV;
> > > >  	unsigned int load_uA;
> > > >  };
> > > > 
> > > > @@ -1332,10 +1330,10 @@ static const struct hci_uart_proto
> > > > qca_proto = {
> > > >  static const struct qca_vreg_data qca_soc_data_wcn3990 = {
> > > >  	.soc_type = QCA_WCN3990,
> > > >  	.vregs = (struct qca_vreg []) {
> > > > -		{ "vddio",   1800000, 1900000,  15000  },
> > > > -		{ "vddxo",   1800000, 1900000,  80000  },
> > > > -		{ "vddrf",   1300000, 1350000,  300000 },
> > > > -		{ "vddch0",  3300000, 3400000,  450000 },
> > > > +		{ "vddio", 15000  },
> > > > +		{ "vddxo", 80000  },
> > > > +		{ "vddrf", 300000 },
> > > > +		{ "vddch0", 450000 },
> > > >  	},
> > > >  	.num_vregs = 4,
> > > >  };
> > > > @@ -1343,10 +1341,10 @@ static const struct qca_vreg_data
> > > > qca_soc_data_wcn3990 = {
> > > >  static const struct qca_vreg_data qca_soc_data_wcn3998 = {
> > > >  	.soc_type = QCA_WCN3998,
> > > >  	.vregs = (struct qca_vreg []) {
> > > > -		{ "vddio",   1800000, 1900000,  10000  },
> > > > -		{ "vddxo",   1800000, 1900000,  80000  },
> > > > -		{ "vddrf",   1300000, 1352000,  300000 },
> > > > -		{ "vddch0",  3300000, 3300000,  450000 },
> > > > +		{ "vddio", 10000  },
> > > > +		{ "vddxo", 80000  },
> > > > +		{ "vddrf", 300000 },
> > > > +		{ "vddch0", 450000 },
> > > >  	},
> > > >  	.num_vregs = 4,
> > > >  };
> > > > @@ -1386,13 +1384,6 @@ static int qca_power_off(struct hci_dev *hdev)
> > > >  static int qca_enable_regulator(struct qca_vreg vregs,
> > > >  				struct regulator *regulator)
> > > >  {
> > > > -	int ret;
> > > > -
> > > > -	ret = regulator_set_voltage(regulator, vregs.min_uV,
> > > > -				    vregs.max_uV);
> > > > -	if (ret)
> > > > -		return ret;
> > > > -
> > > >  	return regulator_enable(regulator);
> > > > 
> > > >  }
> > > > @@ -1401,7 +1392,6 @@ static void qca_disable_regulator(struct
> > > > qca_vreg vregs,
> > > >  				  struct regulator *regulator)
> > > >  {
> > > >  	regulator_disable(regulator);
> > > > -	regulator_set_voltage(regulator, 0, vregs.max_uV);
> > > > 
> > > >  }
> > > 
> > > This was brought up multiple times during the initial review, but
> > > wasn't addressed.
> > > 
> > > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> 
> 
> yes true PMIC dts regulator should do this.
> But we have some real time issues observed.
> 
> Issue 1:
> 
> In PMIC dts node, ASAIK we have three levels of voltages.
> 
> 1. Default voltage.
> 2. Minimum voltage. (mandatory entry)
> 3. Maximum voltage. (mandatory entry)
> 
> Let us assume that the if PMIC regulator dts node supports  defaults voltage
> to 3.2 Volts and Min  as 3.1 V and max as 3.3V
> So default operating voltage is 3.1V  when we turn on BT (but according to
> spec SoC requires min of 3.3V to operate,
> Might have some functionality failures on end to end testing

The PMIC regulator shouldn't be configured with the entire range of voltages
it can generate, but with a range of voltages that is suitable for all its
consumers.

In other words if BT requires a minimum voltage of 3.3V the minimum voltage
of the regulator should be at least 3.3V.

> Issue 2:
> 
> WCN3990 RF is shared with WiFi, so it also try to turn on the regulators.
> Wifi driver uses the same approach of restricting to min and max voltages in
> driver.
> Let us assume we turned ON BT and CH0 is set to 3.1v (as in your case), Wifi
> is tuned on now, as its request the CH0 to operate at 3.3 Volts, regulator
> will fail to set this voltage as BT is operating
> at CH0 3.1v (assuming max voltage is 3.2v)
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/tree/drivers/net/wireless/ath/ath10k/snoc.c#n39

see above

> Issue 3:
> 
> By mistake PMIC has low min or default voltage and high max voltages, that
> is harm for WNC3990.
> 
> I would suggest to restrict the min and max voltages in driver, instead of
> relaying on PMIC to do this.
> BTW pmic will do this and doing it in our driver is safer.

What if another device switches the regulator on before BT?

Again, what you describe is a misconfiguration of the regulator and should
be fixed at its root, instead of implementing unreliable 'safeguards' in each
and every driver using regulators.
