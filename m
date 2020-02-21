Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B5316878A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 20:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgBUTkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 14:40:16 -0500
Received: from mail-pf1-f179.google.com ([209.85.210.179]:37331 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgBUTkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 14:40:16 -0500
Received: by mail-pf1-f179.google.com with SMTP id p14so1770619pfn.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2020 11:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=727EAsMQRz3BzcKFq+yjaGZ0smZaJ6wq5lYL4hCxQBw=;
        b=eCmldwwmaGs6a9choQrTabZ5muMpoPYd8pgAxRa2sPm9ihylVfr8YYvavuA8os4vI5
         lJ3Yvnf196RWlWv5F8A28esZrv737PYuvntY+Ld1Yk/K50DesbseV60ri7BfqTQ93LsS
         y9j6cc4e3NrOsQ3mCtn3QVwYGVV07mts18kio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=727EAsMQRz3BzcKFq+yjaGZ0smZaJ6wq5lYL4hCxQBw=;
        b=kzUkiQ7KO7JFoKKV032lvTD2IhYWTn8bf5PlAMrSW6y6e0BjowmUf2+raPG5JR9gDV
         vNc2hwra6UwmaxVRqHpVGp4qROcHzVTFsScQpkJ2UBuBRxv/72D9U47ko7EEH3y2b/CD
         tIKzVChNKXujveK9sfezXkGBAgq/oeuhHxEFVqUn0WaaME+QTAMrvNg8YJvdV3ioapEz
         Q+0cCOMAb9k7a/sdKryPYgh8zaf7EzmhHgO7hIDynVf5sb5mD2HvHukREK92bYk5Ayck
         XOlg4mvT1+6zFpz5nj0UqVI6mgQK9alOuXXGJW6ewqOcs8SY7uE/Avi0SNFRlK9vMk1n
         eaSQ==
X-Gm-Message-State: APjAAAXbp/FgHcahlf0WEAtS1CkCMb12ZwWwl9hruJX+m6dLEeNE94JD
        bV389gbLderFlo88VYIvNwOh6g==
X-Google-Smtp-Source: APXvYqzbFTpLuLBYG3azYe9VcGVTO7fozeU4ULbuEPbtS0mD0Bzq7RD4RTc+o/ZXgvYmXYycUD12+w==
X-Received: by 2002:aa7:8699:: with SMTP id d25mr38752067pfo.139.1582314014078;
        Fri, 21 Feb 2020 11:40:14 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q8sm3289342pgt.57.2020.02.21.11.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2020 11:40:13 -0800 (PST)
Date:   Fri, 21 Feb 2020 11:40:12 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Odelu Kukatla <okukatla@codeaurora.org>
Cc:     georgi.djakov@linaro.org, daidavid1@codeaurora.org,
        bjorn.andersson@linaro.org, evgreen@google.com,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [V3, 3/3] dt-bindings: interconnect: Add Qualcomm SC7180 DT
 bindings
Message-ID: <20200221194012.GF24720@google.com>
References: <1582277450-27382-1-git-send-email-okukatla@codeaurora.org>
 <1582277450-27382-4-git-send-email-okukatla@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1582277450-27382-4-git-send-email-okukatla@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Odelu,

> Subject: dt-bindings: interconnect: Add Qualcomm SC7180 DT bindings

This patch doesn't add a binding, but DT entries for SC7180.

The subject of v2 was "arm64: dts: sc7180: Add interconnect provider
DT nodes", please go back to that or something similar.
