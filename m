Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEE7189490
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 04:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgCRDms (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 23:42:48 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:42635 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgCRDms (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 23:42:48 -0400
Received: by mail-pf1-f177.google.com with SMTP id x2so12761286pfn.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 20:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YT2L3T5m7F3H6k+5v6e5VkakCu+V5Gz4Jv1OOLQ4kEM=;
        b=P/5g06c1DpJ7LAKi/lYSU6MGHOE5um6MEnr2MdvYL53DbXL2tXxAhOcmQyVxEkxYsT
         i9ENJr145lFqrSLIiM68xjYHZwZDTMzJPbvVtMvTNIgtDH+lvT5qdChY0+4mPcVm3vcp
         0M1P+cbZKp/IkINM5a7lAkbSzUQp3H+KEqWHKqe5k6hmhrKIEd+dNDrxptBXU1xzZ4A1
         Rypzk9aQreoYKFrS5zwTGyLa8Bicr2Q38TCvi/cVQqKSXR28aVwiyxEIZ53EVIklHKNg
         tSL+KN7OFCkxmNS+vjG/iicl9+gSwI638vzpAvxwoICylfsIzZejCl4r1iMElLdABJSK
         5k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YT2L3T5m7F3H6k+5v6e5VkakCu+V5Gz4Jv1OOLQ4kEM=;
        b=jRSJ+aF443FMRmpm1mqhxltq/CRWUalG9ka9x8FFtD+4UIQIddDRFnHKuhqC/eWMH7
         0CAd6flIoszsS0M9exKPxGcVUVCH5pHilCTpwf1VIDPkPEGRRUWDfbsJvVVO5Fl1MLd2
         ld6nbUBAsUYLYb8lZwyMZtEIsTRJXEAIGzmtH/E11tgn6SjvM2R3rzWBFVZh0avIqjL4
         p7+YUFMNTrhGqb2f6I3YX1qu3ajayPoftGGkAbXI4NEqZkuOUt216OxuUn/kGtXGrK/L
         ajcmT222/n7Vq1myueC+Q0ISuZP5aoGby++hQTcuVi4lSTxlVhn+eghEQ0YiFpXomrO1
         uLBQ==
X-Gm-Message-State: ANhLgQ2I52opN4YvZgAxxNVy8qjte7JJBA7VXqMhxOL39GGFtGKjMKRQ
        8hBsg0F77tIgVMy91k9powHAHw==
X-Google-Smtp-Source: ADFU+vvs80IxXmo0j7B4QexYEgl7/6zmcoA+fvJJBNRIUGhey7+3vtFC5iWY5s+rJOBy2o6U5QEkYQ==
X-Received: by 2002:a62:3854:: with SMTP id f81mr2180721pfa.81.1584502966741;
        Tue, 17 Mar 2020 20:42:46 -0700 (PDT)
Received: from localhost ([122.171.122.128])
        by smtp.gmail.com with ESMTPSA id q26sm4626903pff.63.2020.03.17.20.42.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 20:42:45 -0700 (PDT)
Date:   Wed, 18 Mar 2020 09:12:43 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     sboyd@kernel.org, georgi.djakov@linaro.org, saravanak@google.com,
        nm@ti.com, bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org, mka@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        ulf.hansson@linaro.org
Subject: Re: [RFC v3 00/10] DDR/L3 Scaling support on SDM845 and SC7180 SoCs
Message-ID: <20200318034243.o2metmggzuah6cqw@vireshk-i7>
References: <20200127200350.24465-1-sibis@codeaurora.org>
 <19cf027ba87ade1b895ea90ac0fedbe2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19cf027ba87ade1b895ea90ac0fedbe2@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-03-20, 02:13, Sibi Sankar wrote:
> On 2020-01-28 01:33, Sibi Sankar wrote:
> > This RFC series aims to extend cpu based scaling support to L3/DDR on
> > SDM845 and SC7180 SoCs.
> > 
> 
> Hey Viresh/Saravana,
> 
> Ping! Can you take a stab at reviewing
> the series, it has been on the list for
> a while now.

I believe this depends on Saravana's series on which I have raised
some doubts few weeks back ? I am still waiting for them to get
clarified by him.

-- 
viresh
