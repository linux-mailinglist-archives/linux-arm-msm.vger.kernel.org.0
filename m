Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D94A1583FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 21:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgBJUBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 15:01:02 -0500
Received: from mail.serbinski.com ([162.218.126.2]:36266 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgBJUBB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 15:01:01 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 74951D006F9;
        Mon, 10 Feb 2020 20:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vPrZs-h4-A_j; Mon, 10 Feb 2020 15:00:55 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 322B0D00693;
        Mon, 10 Feb 2020 15:00:55 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 322B0D00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581364855;
        bh=FC0suK3LacpLEIkSR/LMi90MqKyqvjqaemkIxiuQnsQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eQXczSjBjgUAdnSoYpeMqwFZ++51LDVybQH+o0mOVj6TcppiRNma7GYgngajWpLRy
         N6apQTaUgSnSEihCmL0eSKt2yLk+lUhE28D5bW1nv/0dJy98An3AE25X7JUaLGvfLK
         GtTjy77x+JbNHujwNXTMNPs6FAJNhsD0x7FHRaIM=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 10 Feb 2020 15:00:55 -0500
From:   Adam Serbinski <adam@serbinski.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols to set PCM rate
In-Reply-To: <20200210182609.GA14166@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
 <18057b47c76d350f8380f277713e0936@serbinski.com>
 <20200210182609.GA14166@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <f88d21773f47f5a543a17ad07d66f9b7@serbinski.com>
X-Sender: adam@serbinski.com
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-10 13:26, Mark Brown wrote:
> On Mon, Feb 10, 2020 at 10:45:16AM -0500, Adam Serbinski wrote:
>> On 2020-02-10 08:36, Mark Brown wrote:
> 
>> > This would seem like an excellent thing to put in the driver for the
>> > baseband or bluetooth.
> 
>> The value that must be set to this control is not available to the 
>> bluetooth
>> driver. It originates from the bluetooth stack in userspace, typically
>> either blueZ or fluoride, as a result of a negotiation between the two
>> devices participating in the HFP call.
> 
> To repeat my comment on another patch in the series there should still
> be some representation of the DAI for this device in the kernel.

Respectfully, I'm not sure I understand what it is that you are 
suggesting.

Is it your intention to suggest that instead of adding controls to the 
machine driver, I should instead write a codec driver to contain those 
controls?

Or is it your intention to suggest that something within the kernel is 
already aware of the rate to be set, and it is that which should set the 
rate rather than a control?
