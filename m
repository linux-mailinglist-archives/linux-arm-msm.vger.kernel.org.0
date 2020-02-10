Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA3D158109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 18:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbgBJRNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 12:13:52 -0500
Received: from mail.serbinski.com ([162.218.126.2]:38510 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgBJRNw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 12:13:52 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 4B3FFD006F9;
        Mon, 10 Feb 2020 17:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Y9dGI62t9Mvd; Mon, 10 Feb 2020 12:13:45 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 948F0D00693;
        Mon, 10 Feb 2020 12:13:45 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 948F0D00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581354825;
        bh=eF+04ZGVf2fJiXEo3RLvJAFtKWhdL+MG4jKGtRigICU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hVuMwRTgIWnWwKzt6Cz31jCiTwi7QV7Rk7KLz2N5ck5Ukj7WM5pb+LUqtXFJZg7fD
         8bdluM5+H0bY0iXDyaNj9AZQUQyPyvOiK/au/Y10dtGmAn0schtMFxCmjoVr+l6Yo4
         s3HCE95Fl8eNYhKKBNIlPQOFheoC5u4KKPwFgZcw=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 10 Feb 2020 12:13:45 -0500
From:   Adam Serbinski <adam@serbinski.com>
To:     Jaroslav Kysela <perex@perex.cz>
Cc:     Mark Brown <broonie@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols to set PCM rate
In-Reply-To: <317edce5-a982-549b-84c2-84cdc1d92c9a@perex.cz>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <317edce5-a982-549b-84c2-84cdc1d92c9a@perex.cz>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <16297aae0c0c330b7b48150eae512e32@serbinski.com>
X-Sender: adam@serbinski.com
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-10 11:18, Jaroslav Kysela wrote:
> Dne 09. 02. 20 v 16:47 Adam Serbinski napsal(a):
>> This makes it possible for the backend sample rate to be
>> set to 8000 or 16000 Hz, depending on the needs of the HFP
>> call being set up.
> 
> Two points:
> 
> Why enum? It adds just more code than the integer value handlers.

Because enum allows the potential values to be restricted to a set of 
distinct values rather than a range. And while yes, I understand that 
the value can be validated, or the step can in this case be set to 
correspond to the difference between the current 2 values, this approach 
would neither make it clear to the user what the permitted values are, 
nor would it scale well once additional values are required.


> Also, this belongs to the PCM interface, so it should be handled with
> SNDRV_CTL_ELEM_IFACE_PCM not mixer.
> 
> The name should be probably "Rate" and assigned to the corresponding 
> PCM device.
> 
> Add this to Documentation/sound/designs/control-names.rst .

Above 3 lines are noted, I will make these changed.
