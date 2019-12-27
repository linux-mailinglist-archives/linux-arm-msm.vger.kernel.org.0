Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E543112B065
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 02:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfL0Bze (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 20:55:34 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53179 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfL0Bzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 20:55:33 -0500
Received: by mail-pj1-f65.google.com with SMTP id a6so4087774pjh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 17:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=5hsCrMTZYHk6MZK3STHgWH1aI8W/dnxMU12UtCy4EVI=;
        b=HJ7t+jrUrzqkbtF50iIlE/RGsLn7QER95oyue5dvejXCMPv1ejAmHnjK7q66/5XEh8
         7WDJGF2Q6oaIesFGP1m06emOxwnQ9v9YqkhqyR/YHRFQ2AheVEAssUoBU7iWm8WEJXrh
         mWDVfGjZox2cqt/m3Zos6GDs+nZ1c+tATWiCbLgW+J2aWiUinDoqrhZFTtx6dtTjCvmN
         e3hn14Sb+VClYv29uNXGK6JgrD78y3wkDvg6BvCHfYQdUUJXdT3n4hogQgTekiCO1J4n
         Slw1y9rLorv8p632IyV0uOVsnYE4S2EFMRZ7Ra3ks1fHCwAesoM24yRi5F3ihpIz6ZhM
         5I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=5hsCrMTZYHk6MZK3STHgWH1aI8W/dnxMU12UtCy4EVI=;
        b=A1TyAazvdOG16zCGTjbmnrfxru5TwLF/sVpmr/ONPVkPKozKdEBsLdyvfhOlEYC5Eg
         HnLcel1GEf5V1AJ9Z9/9+NnCk8DTWBEbrErFoFkTrsbLoNqBqJJMi0STjUFPgFB3UPjc
         VyKgDPKoTeYLanVoCxKY7bNLip6FS7XPsIVQmykNSnomPtQyjGBSMlLU8Q+ndurDejh8
         qYLB7z2NhjG6XTXQBX2z8odWy15JsUtzEz+FHviZ/5MJGOeSq6vN3alz14MtMa9QBulx
         B14MRhvDDEHRYS/y8exatgrpGTmehSj7WJVGFNLYv+mQfAzcPBEi8Cov9ux3QB2s/W1J
         5Mww==
X-Gm-Message-State: APjAAAWl+E/rL3IfHL87oQDElVwDv7i3Ya/uHQmgcIDIlK6fI4ogEw8f
        rFro/ky+pW8whWwNG7rJQV5Ckg==
X-Google-Smtp-Source: APXvYqyZCWPmO4YkLcDUQR/rmO7fCNIJU0RT1xe60uOqjcozXfjUcZgYA3nHgad6UytxJ3jrUhneBQ==
X-Received: by 2002:a17:902:503:: with SMTP id 3mr46173960plf.77.1577411733185;
        Thu, 26 Dec 2019 17:55:33 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g22sm35037739pgk.85.2019.12.26.17.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 17:55:32 -0800 (PST)
Date:   Thu, 26 Dec 2019 17:55:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-firmware@kernel.org
Cc:     Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        linux-arm-msm@vger.kernel.org, kvalo@codeaurora.org
Subject: qcom: Switch SDM845 WLAN firmware
Message-ID: <20191227015530.GA3828441@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

The recently committed wlan firmware found under ath10k/WCN3990 shows
better stability under load than the one present for SDM845. So this
replaces the current firmware with a symlink to the newly contributed
one.

Regards,
Bjorn

The following changes since commit 6871bffa79ed240696986837cfb17b272ff57466:

  Merge branch 'ath10k-20191220' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware (2019-12-20 08:41:19 -0500)

are available in the Git repository at:

  https://github.com/andersson/linux-firmware.git RB3-wlan-firmware-1387

for you to fetch changes up to 4570585aad1009b84fe0d4d0677dd8d4c9956b42:

  qcom: Switch SDM845 WLAN firmware (2019-12-26 17:47:56 -0800)

----------------------------------------------------------------
Bjorn Andersson (1):
      qcom: Switch SDM845 WLAN firmware

 WHENCE                   |   1 -
 qcom/sdm845/wlanmdsp.mbn | Bin 3311964 -> 39 bytes
 2 files changed, 1 deletion(-)
 mode change 100644 => 120000 qcom/sdm845/wlanmdsp.mbn
