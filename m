Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD9DD0473
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 01:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfJHXvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 19:51:43 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38281 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfJHXvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 19:51:42 -0400
Received: by mail-pl1-f196.google.com with SMTP id w8so129072plq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2019 16:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HymENB8AG8ufizSe/L4b4bXByTy1SdlqegKFgCo0vbY=;
        b=t+BlNhct5Z9xKtuP7jrgnvdFPiJnuE7rJZvIaBxfsU+Ma3OuVmYqxxywPBpDSp/4O7
         n8ZBdmZU1fP5/qV2t9eikExcNLCxNplW6F7OO5sGm95uBsYAOzzPLWAL+qujkahv+J7Q
         z1mP2wwUPOxYzrf0fX19WzFVX5ETIqteKMCtmnfHmM/P0/h+RrHITLskgxzDHs2J1srX
         qv2TKT7a5XlawzqsY/hkDTb0g/0CJW/fXdxAC4l7/nNBzjp/ggYwdw407BN3uI8UFBTF
         X/IzEvbtFSimvZxWKq1IFUCtAWwrQWjN9OsyJmTz3Qpz2m4JN+7Rn2ztiacltEWZijPs
         HY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HymENB8AG8ufizSe/L4b4bXByTy1SdlqegKFgCo0vbY=;
        b=k0q5iWE7xKKMih7Ud7nZmlKM9IF8k33qgNGFyXUQLd03KSQXSWXcaIhw7JrruOluDi
         NWd/PGvRGzOCkAMLw0mghpd1xfHQIQHMP9vd3ARgmYtGz1D70sdZT6Xn10Rt22gvGLjf
         pn/IzigwLKsn0TeroLiS/RI2JXPJEC4s3VusAVdZAOR1Hm/grPNSponNUx1TXtfyHt3Q
         pJZ1e/3zR8FaraTM1wisVwIr2q/SW+Nv/e/BE9cLhOik+udHcsYm2TMuXnue1HRLROfE
         ROXlavhdEX9aVHNqOUaxnZWRfH9X3HWxNQaE30PiH1E0XixmhoIlHcZvFhGVRJMWbx0N
         qwQw==
X-Gm-Message-State: APjAAAWcPLL7h39aDEBAbmYwcB054xNx8rb1SHaGu6Jp3gTJewnobg3i
        kfRzz6QvxHGl6s/+yOJbR/HE4Q==
X-Google-Smtp-Source: APXvYqw+pEeNGzD0nY+968srFsTK3zQ/UJgiBALiDL8faTpcDCC1upPAqXvaAFAk2A9U/3ZspPPGWg==
X-Received: by 2002:a17:902:b713:: with SMTP id d19mr175890pls.245.1570578701839;
        Tue, 08 Oct 2019 16:51:41 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s3sm259517pjq.32.2019.10.08.16.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 16:51:41 -0700 (PDT)
Date:   Tue, 8 Oct 2019 16:51:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp: Add SM8150 QMP UFS PHY support
Message-ID: <20191008235137.GM63675@minitux>
References: <20190906051017.26846-1-vkoul@kernel.org>
 <20190906051017.26846-4-vkoul@kernel.org>
 <20191008074619.GA20801@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008074619.GA20801@jackp-linux.qualcomm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Oct 00:46 PDT 2019, Jack Pham wrote:
> On Fri, Sep 06, 2019 at 10:40:17AM +0530, Vinod Koul wrote:
[..]
> I was thinking of taking a stab at USB if I get time, not sure if that's
> already on your or somebody's (Bjorn?) radar.
> 

We only have remote access to the hardware, making it rather tedious to
do USB. So it's all yours! :)

Regards,
Bjorn
