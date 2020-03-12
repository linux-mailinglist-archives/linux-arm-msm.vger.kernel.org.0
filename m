Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F52182C62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 10:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgCLJZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 05:25:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36776 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgCLJZd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 05:25:33 -0400
Received: by mail-wm1-f67.google.com with SMTP id g62so5402136wme.1;
        Thu, 12 Mar 2020 02:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=tZo5ZZ4tIC41ljTxXlaCIM/Fz/u40m/fyXeMfkYNLyw=;
        b=YhZ1FUP/rMwvBvnBw7Izh4PEz309HMRj4HUaKJAaQJNqzBUUnWueYQAbcBOGuvTGj9
         CIADtmBrZ/bMAUR+zgAVRIKZWZZofPH2M3ndSRGQKnKj4BWD5KJD/lHrYhnUGH2gIqMd
         hxoX9o4W5PeSCzXqMh2LZGcjj41UgVIXOvE2yB1SfNgtb4NAO3YaMKT5nxRl/rm+gg2m
         Xu8DYlMPSCehGN7WxWrIIcNpuzX91j4CsjDPOS91xuYfYVHoAMeg8WgXwMpND7VCmrc+
         PtLPC/xF4cV7Xrda/NbQS3nbUQmitKHjN+UdEggfajHLV8VNKWiSnUZ8ps0EpG14KmQn
         kJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=tZo5ZZ4tIC41ljTxXlaCIM/Fz/u40m/fyXeMfkYNLyw=;
        b=XJAIEaK9HbJagzpzB3KnH3BBdbdyYWsub0qS1VNtvwsVghg0VwRqeSHrDrV0KmGN4b
         wI16F6PmRmBA+nvdmE2Wi9q/wPX1IFwQBu4DBSjAeMbFMeO63csLzE8+OBG46vq5Igye
         RBhU28UYfAzgh8F3mpBG76Yzv6fDIsdv/oiG9og+tx3w1udOvsWwjHmkHc+0SxXtQRBu
         wFl/7M/RAdWTUKfMQX2m4VvkQmjByqe2exDvBT1xNSdKcfYTl+7iz+cQ+Yavh9AynXPF
         MCD3bBo5nAztMHHBaZfXmm404WGBJ79b7FlLgivC9egqiB4MqFsMXx/uYOETvj6aGoFU
         VUrg==
X-Gm-Message-State: ANhLgQ3P7mXbP8uSOMELuuZ+/Fsrmixh9NpkiQx+5Ysy/iuwdTh8hvyo
        W+3VKHVBbdrjzACZNp9waRU=
X-Google-Smtp-Source: ADFU+vsdOlYqq4H+9zCS3gDmdlLhT3AWt61eJ62oAqQOXttc+gmok2ZjHu1svwnWTs7TkHdvI8Tc/A==
X-Received: by 2002:a1c:9d41:: with SMTP id g62mr3995118wme.131.1584005130211;
        Thu, 12 Mar 2020 02:25:30 -0700 (PDT)
Received: from AnsuelXPS ([2001:470:b467:1:598e:6e04:3a30:76a6])
        by smtp.gmail.com with ESMTPSA id c23sm12093081wme.39.2020.03.12.02.25.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Mar 2020 02:25:29 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Bjorn Andersson'" <bjorn.andersson@linaro.org>
Cc:     <agross@kernel.org>, "'Rob Herring'" <robh+dt@kernel.org>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200311130918.753-1-ansuelsmth@gmail.com> <20200312054649.GG1098305@builder>
In-Reply-To: <20200312054649.GG1098305@builder>
Subject: R: [PATCH 1/2] firmware: qcom_scm: add ipq806x with no clock
Date:   Thu, 12 Mar 2020 10:25:26 +0100
Message-ID: <00aa01d5f850$2b6ddcb0$82499610$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQLDpUr6d+Ge4N83XEGEcKjyX1zZ/AG5FpfzpluLgMA=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Wed 11 Mar 06:09 PDT 2020, Ansuel Smith wrote:
> 
> > ipq806x rpm definition was missing for a long time.
> > Add this to make this soc support rpm.
> >
> 
> I merged the dt-binding patch, but please update dts to use:
> 	compatible = "qcom,scm-ipq806x", "qcom,scm";
> 
> instead of adding the platform specific compatible in the driver.
> 
> Regards,
> Bjorn
> 

Should I drop the added compatible in qcom_scm.c or just
keep it and add the definition in the ipq806x dts?

> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  drivers/firmware/qcom_scm.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/firmware/qcom_scm.c
> b/drivers/firmware/qcom_scm.c
> > index 059bb0fbae9e..d13ef3cd8cf5 100644
> > --- a/drivers/firmware/qcom_scm.c
> > +++ b/drivers/firmware/qcom_scm.c
> > @@ -1144,6 +1144,7 @@ static const struct of_device_id
> qcom_scm_dt_match[] = {
> >
> SCM_HAS_BUS_CLK)
> >  	},
> >  	{ .compatible = "qcom,scm-ipq4019" },
> > +	{ .compatible = "qcom,scm-ipq806x" },
> >  	{ .compatible = "qcom,scm-msm8660", .data = (void *)
> SCM_HAS_CORE_CLK },
> >  	{ .compatible = "qcom,scm-msm8960", .data = (void *)
> SCM_HAS_CORE_CLK },
> >  	{ .compatible = "qcom,scm-msm8916", .data = (void
> *)(SCM_HAS_CORE_CLK |
> > --
> > 2.25.0
> >

