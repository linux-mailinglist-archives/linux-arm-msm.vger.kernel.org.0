Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C66914785F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 06:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbgAXF52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 00:57:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:54918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726725AbgAXF52 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 00:57:28 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 178352075D;
        Fri, 24 Jan 2020 05:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579845447;
        bh=d13N34bVaaygDttZHRsAhaFsR+ujxdgNFmF4x8KTHug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JstUQYOqFRos8+s1IX9HFtocD6tJQ7/gYMDtqqLKzFJiiG6luPj54X2TgFX1b7r4Q
         7r5G96zquz+mfrPF2Vq/2GqhiqZ0BfbJ9ibTIAcNPupJroTq4DgitgGs5K8XSLpd/v
         u1t4bforHQl0s9lVIyUbg1QXDxLbOWrIe1884+4E=
Date:   Fri, 24 Jan 2020 06:57:24 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc:     Prakruthi Deepak Heragu <pheragu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org,
        Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
Subject: Re: [PATCH v3 2/2] Embedded USB Debugger (EUD) driver
Message-ID: <20200124055724.GA2906795@kroah.com>
References: <1542310374-18474-1-git-send-email-pheragu@codeaurora.org>
 <1542310374-18474-3-git-send-email-pheragu@codeaurora.org>
 <20181115230618.GB26568@kroah.com>
 <2c599a3f-ee1c-63d9-5f88-d2a610e6d357@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c599a3f-ee1c-63d9-5f88-d2a610e6d357@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 24, 2020 at 03:11:29AM +0530, Dwivedi, Avaneesh Kumar (avani) wrote:
> 
> On 11/16/2018 4:36 AM, Greg KH wrote:
> > On Thu, Nov 15, 2018 at 11:32:54AM -0800, Prakruthi Deepak Heragu wrote:
> > > Add support for control peripheral of EUD (Embedded USB Debugger) to
> > > listen to events such as USB attach/detach, charger enable/disable, pet
> > > EUD to indicate software is functional. Reusing the platform device kobj,
> > > sysfs entry 'enable' is created to enable or disable EUD.
> > If you add/remove/change a sysfs file, you need to also have a
> > Documentation/ABI/ file update as well.  Please do that here.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Thank you very much Greg for your time to review, Shall i go ahead posting
> next patch set v4 addressing your comments?

Why wouldn't you?  :)

