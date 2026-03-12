Return-Path: <linux-arm-msm+bounces-97130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNWjIGRJsmn8LAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:04:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E526D444
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88C1F301BDFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 05:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D38938911A;
	Thu, 12 Mar 2026 05:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kzSyt4rJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B991B4F1F;
	Thu, 12 Mar 2026 05:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773291872; cv=none; b=aflPOGka6o9Us8PyMzFUoVhp2VZdZIlEFHISznPvexkW+jZvzkG77ZFQJ/6RZpBPYAeGOG3AoxN2hQ7z0o9nUgHK0LGVRJg2iYBehht/HMBfEVg093C3V51CTGPn8r/OUoS9mWRXL87/RvZ3NbPV6kjk8/t1WKtZQg6DBr+SXOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773291872; c=relaxed/simple;
	bh=9OttEFIgnKrp7crAFSRLdWk9QtE4LYt5xnxA5mq86ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0qnUMFYXd0iBXiMZpFDEBSvWrmbwPuaRkjrVEQLDdIiDpevFPBpRYU0WgyD9/eJcaXzvTLmV/Ru6uy9ziNEaILYLuhyZF06a70mGAKowogKyn2B5aBJoBSZ2CGCP9IiK2TQop1SloL+OnT8iHbq5y/EX4HYzi5UU8sHndjFgL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kzSyt4rJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFA5C4CEF7;
	Thu, 12 Mar 2026 05:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773291871;
	bh=9OttEFIgnKrp7crAFSRLdWk9QtE4LYt5xnxA5mq86ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzSyt4rJbPrhs+nnLJTR9rqNeQ91GkVh8hp4ylWjtAjCMFWyu8YawwvgYOiFNebHP
	 GgwhOyH+IEch3uckISgFkK2ygximwNCHBDoeXeIGciDYLrLwM+k7HaTml/2I+wmojj
	 DekVDOxnRGLPLJ+obtkw0mb0HxghtIVCchf/+lfQ=
Date: Thu, 12 Mar 2026 06:04:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: simplify allocation
Message-ID: <2026031252-slather-upscale-636e@gregkh>
References: <20260306222148.8200-1-rosenp@gmail.com>
 <2026031127-siding-caress-7ed9@gregkh>
 <CAKxU2N_dJY60Tp4UgLMZ97ZJywNEktmA1At3z6VOPhhSCRx-1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_dJY60Tp4UgLMZ97ZJywNEktmA1At3z6VOPhhSCRx-1w@mail.gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97130-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 253E526D444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 11:54:55AM -0700, Rosen Penev wrote:
> On Wed, Mar 11, 2026 at 7:47 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Mar 06, 2026 at 02:21:48PM -0800, Rosen Penev wrote:
> > > Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> > >
> > > Add __counted_by for extra runtime analysis when requested.
> > >
> > > Shuffle some code in probe to provide a clearer picture.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.c   | 27 ++++++++-----------
> > >  .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 26 ++++++++----------
> > >  2 files changed, 22 insertions(+), 31 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> > > index c8b1463e6e8b..4b3915c6894a 100644
> > > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> > > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> > > @@ -95,13 +95,13 @@ struct pmic_typec_pdphy {
> > >       struct regmap                   *regmap;
> > >       u32                             base;
> > >
> > > -     unsigned int                    nr_irqs;
> > > -     struct pmic_typec_pdphy_irq_data        *irq_data;
> > > -
> > >       struct work_struct              reset_work;
> > >       struct work_struct              receive_work;
> > >       struct regulator                *vdd_pdphy;
> > >       spinlock_t                      lock;           /* Register atomicity */
> > > +
> > > +     unsigned int                    nr_irqs;
> > > +     struct pmic_typec_pdphy_irq_data        irq_data[] __counted_by(nr_irqs);
> > >  };
> > >
> > >  static void qcom_pmic_typec_pdphy_reset_on(struct pmic_typec_pdphy *pmic_typec_pdphy)
> > > @@ -560,31 +560,26 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
> > >       struct pmic_typec_pdphy_irq_data *irq_data;
> > >       int i, ret, irq;
> > >
> > > -     pmic_typec_pdphy = devm_kzalloc(dev, sizeof(*pmic_typec_pdphy), GFP_KERNEL);
> > > -     if (!pmic_typec_pdphy)
> > > -             return -ENOMEM;
> > > -
> > >       if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
> > >               return -EINVAL;
> > >
> > > -     irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
> > > -                             GFP_KERNEL);
> > > -     if (!irq_data)
> > > +     pmic_typec_pdphy = devm_kzalloc(dev, struct_size(pmic_typec_pdphy, irq_data, res->nr_irqs), GFP_KERNEL);
> >
> > extra long line, checkpatch.pl didn't complain about this?
> >
> > > +     if (!pmic_typec_pdphy)
> > >               return -ENOMEM;
> > >
> > > +     pmic_typec_pdphy->nr_irqs = res->nr_irqs;
> > > +     pmic_typec_pdphy->dev = dev;
> > > +     pmic_typec_pdphy->base = base;
> > > +     pmic_typec_pdphy->regmap = regmap;
> > >       pmic_typec_pdphy->vdd_pdphy = devm_regulator_get(dev, "vdd-pdphy");
> > >       if (IS_ERR(pmic_typec_pdphy->vdd_pdphy))
> > >               return PTR_ERR(pmic_typec_pdphy->vdd_pdphy);
> > >
> > > -     pmic_typec_pdphy->dev = dev;
> > > -     pmic_typec_pdphy->base = base;
> > > -     pmic_typec_pdphy->regmap = regmap;
> > > -     pmic_typec_pdphy->nr_irqs = res->nr_irqs;
> > > -     pmic_typec_pdphy->irq_data = irq_data;
> > >       spin_lock_init(&pmic_typec_pdphy->lock);
> > >       INIT_WORK(&pmic_typec_pdphy->reset_work, qcom_pmic_typec_pdphy_sig_reset_work);
> > >
> > > -     for (i = 0; i < res->nr_irqs; i++, irq_data++) {
> > > +     for (i = 0; i < res->nr_irqs; i++) {
> > > +             irq_data = &pmic_typec_pdphy->irq_data[i];
> > >               irq = platform_get_irq_byname(pdev, res->irq_params[i].irq_name);
> > >               if (irq < 0)
> > >                       return irq;
> > > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > > index 8051eaa46991..7c5cf8061f04 100644
> > > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> >
> > Can you just convert one driver at a time please?  This should be a
> > patch series.
> This is not the same driver?

It's two different files, with two different structure allocations, so I
assumed it was two different ones.  Either way, it should be two
different patches :)

thanks,

greg k-h

