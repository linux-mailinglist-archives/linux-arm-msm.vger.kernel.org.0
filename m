Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D307810C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 18:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378721AbjHRQpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Aug 2023 12:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378803AbjHRQop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Aug 2023 12:44:45 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E154226
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 09:44:26 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-565ea1088fbso912895a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692377065; x=1692981865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bm/E+SJzoVJQyupcZ9vb90tLKWS4dMFOwnurf1FkF50=;
        b=ZG3jplTuy/rotaOt/pEXoYex4UmWntqtoYK8z0IlNuWxWREpzkV1WsmcQZA1jW5WB0
         qqQkYQc6BfL8oAmNNub4tAeaQvAmpy1ozNgNHX/ug6DcM7PQXnv4XzIYIRSt2gAmhNsO
         6rinLa88aWs8KtKgJ+Z5MrGvDWPLWoIkCZf0CQOMfj2YPEe/PeTNmm0Mad0VgmRCJJ5C
         aqtouJAqbpvcxU6WMyNnOQo2TMq1wnPIFRcEYSEgwQXOmcBHg+dbhkMPxNlqxJYxFtx7
         dNLb3WsQyDvtwWpEFFA3g6yr+6AJ7oS5BiwXk9OoQiqrpWRdXhYgPDG98cP1tR2n2uWp
         ZSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692377065; x=1692981865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bm/E+SJzoVJQyupcZ9vb90tLKWS4dMFOwnurf1FkF50=;
        b=a9PBcicTGoABLJf+5Qu94HYKvxzHXLY2owT1gZ2OmXyDa+SABAdky/0gSJOlIKFDsc
         82bY6nBohDySJhtgAHcIyRqQax3QwXbJCyvn2ZtxVo6ZVxAaeDVSJWyGTqEnu+kOPLjo
         Ioh8KzZr6IKRr75liv6zkcks1F+DogmRBrH3jn2XUj8IyNg9GnL5LcEHoX6GWjsbfMoD
         3aEG9vO+D4Aez4SWQol51kBKbqeoOGNMktMIFHivCDUkwdgoPpZB1L2UDZquIjY4gWRx
         rpW2OIFEfEP2pYY2Nwqteit+B7L6+JEDq1vTW16kD3Fj9HhPxijf4DftJHGT298qc6ly
         Smbg==
X-Gm-Message-State: AOJu0YzYL/0Dfj0P6CrY4BOQF2ia7K5J4ZqaGrmdw+pz5FihYYYOH4XG
        gii13gO0R/8ITnzevrVIs6Cy0dYcpRgBxZ4GgQ==
X-Google-Smtp-Source: AGHT+IHQjMTLxK8JUaDRU7YS94Zyf9+WY8/kpAekeB9JNTb4rkThqh3LfaTLb/+TQKbLHSZnTovjrA==
X-Received: by 2002:a17:90a:4ec2:b0:268:34b1:a5a9 with SMTP id v2-20020a17090a4ec200b0026834b1a5a9mr3180699pjl.8.1692377065482;
        Fri, 18 Aug 2023 09:44:25 -0700 (PDT)
Received: from thinkpad ([117.206.119.32])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a19c100b00267ae12b80bsm3736116pjj.34.2023.08.18.09.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 09:44:24 -0700 (PDT)
Date:   Fri, 18 Aug 2023 22:14:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     Radu Rendec <rrendec@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: sa8540p-ride crash when all PCI buses are disabled
Message-ID: <20230818164418.GA81989@thinkpad>
References: <92de74746a624c2ece615a6286301db7647b5590.camel@redhat.com>
 <80b73fa9-cebe-e058-6ef8-f039064cdd34@linaro.org>
 <3e0de46efe32e2e4c75fa3af9dabd0477e144823.camel@redhat.com>
 <20230816171601.GB23057@thinkpad>
 <liyxirdfxcxrnji2o6p63cocgl7qllyih7q47zdft7tc5jni2j@h6akjddfu6o3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <liyxirdfxcxrnji2o6p63cocgl7qllyih7q47zdft7tc5jni2j@h6akjddfu6o3>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 16, 2023 at 12:56:58PM -0500, Andrew Halaney wrote:
> On Wed, Aug 16, 2023 at 10:46:01PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Aug 16, 2023 at 12:25:50PM -0400, Radu Rendec wrote:
> > > On Tue, 2023-08-15 at 11:54 +0100, Bryan O'Donoghue wrote:
> > > > On 14/08/2023 23:36, Radu Rendec wrote:
> > > > > I'm consistently getting a system crash followed by a ramdump on
> > > > > sa8540p-ride (sc8280xp) when icc_sync_state() goes all the way through
> > > > > (count == providers_count).
> > > > > 
> > > > > Context: all PCIe buses are disabled due to [1]. Previously, due to
> > > > > some local kernel misconfiguration, icc_sync_state() never really did
> > > > > anything (because count was always less than providers_count).
> > > > > 
> > > > > I was able to isolate the problem to the qns_pcie_gem_noc icc node.
> > > > > What happens is that both avg_bw and peak_bw for this node end up as 0
> > > > > after aggregate_requests() gets called. The request list associated
> > > > > with the node is empty.
> > > > 
> > > > If all PCIe buses are disabled, then of course the bandwidth requests
> > > > should say zero, the clocks should be disabled and any associated 
> > > > regulators should be off.
> > > > 
> > > > > For testing purposes, I modified icc_sync_state() to skip calling
> > > > > aggregate_requests() and subsequently p->set(n, n) for that particular
> > > > > node only. With that change in place, the system no longer crashes.
> > > > 
> > > > So what's happening is that a bus master in the system - perhaps not the 
> > > > application processor is issuing a transaction to a register most likely 
> > > > that is not clocked/powered.
> > > 
> > > Yes, that was my assumption as well. But I didn't think it could be
> > > something other than the AP. That is an interesting perspective.
> > > 
> > > My first thought was to analyze the ramdump and hopefully find some
> > > clues there. But unfortunately that doesn't seem to be an option with
> > > the tools that I have.
> > > 
> > > > Have you considered that one of the downstream devices might be causing 
> > > > a PCIe bus transaction ?
> > > 
> > > No, I haven't considered that. If that's the case, it will probably be
> > > even harder to debug.
> > > 
> > 
> > If the PCIe controller node is disabled in devicetree, then none of the devices
> > would be enumerated. In that case, they cannot initiate any transactions on
> > their own.
> > 
> > Qcom observed a similar crash with PCIe SMMU when the PCIe controllers were not
> > enabled in devicetree [1]. Since Qcom was going to enable PCIe controllers
> > eventually, I concluded that the issue will be gone once they do it.
> > 
> > But looking at your issue, I think the transaction is triggered by PCIe SMMU as
> > observed earlier. Since there are no active votes on the path after
> > icc_sync_state(), it ends up in a crash.
> > 
> > But did you disable all PCIe instances or just pcie2a? The revert patch you
> > pointed only applies to pcie2a. But if you are disabling all PCIe instances,
> > then I do not see a point in enabling PCIe SMMU as well. Could you try disabling
> > the pcie_smmu node and check?
> 
> I think this is a good hunch, but do note that this is discussing
> sa8540p-ride, not sa8775p-ride. The former has no PCIe SMMU described
> (although I believe there maybe one on the sc8280xp family, just in
> "bypass mode" (excuse my SMMU ignorance!) by firmware, and not described
> to Linux for any variant of that platform).
> 

Ah... I was answering from sa8775p-ride perspective, sorry! Yes, on
sa8540p-ride, PCIe SMMU is configured in bypass mode by bootloader.

In that case I think you need to parse the ramdump to see who is causing the
crash. Qcom folks should be able to help you with that.

- Mani

> > 
> > - Mani
> > 
> > [1] https://lore.kernel.org/linux-arm-msm/20230609054141.18938-3-quic_ppareek@quicinc.com/
> > 
> > > > If you physically remove - can you physically remove - devices from the 
> > > > PCIe bus does this error still occur ?
> > > 
> > > This is a standard QDrive 3 reference board, so I think this is not an
> > > option. Taking those things apart is very difficult, and I think all
> > > peripherals are soldered onto the board anyway.
> > > 
> > > > > Surprisingly, none of the icc nodes that link to qns_pcie_gem_noc (e.g.
> > > > > xm_pcie3_0, xm_pcie3_1, etc.) has any associated request and so they
> > > > > all have 0 bandwidth after aggregate_requests() gets called, but that
> > > > > doesn't seem to be a problem and the system is stable. This makes me
> > > > > think there is a missing link somewhere, and something doesn't claim
> > > > > any bandwidth on qns_pcie_gem_noc when it should. And it's probably
> > > > > none of the xm_pcie3_* nodes, since setting their bandwidth to 0 seems
> > > > > to be fine.
> > > > 
> > > > Yes so if you assume that the AP/kernel side has the right references, 
> > > > counts, votes then consider another bus master - a thing that can 
> > > > initiate a read or a write might be misbehaving.
> > > 
> > > There is one thing I wasn't aware of when I wrote the previous email.
> > > As it turns out, bandwidth/clock control is done at the bcm level, not
> > > at the icc node level. It looks like there is a single bcm called PCI0,
> > > and it's linked to the qns_pcie_gem_noc node. The xm_pcie3_* icc nodes
> > > are not linked to any bcm.
> > > 
> > > This means that *all* PCIe buses are shut down when qns_pcie_gem_noc is
> > > disabled due to zero bandwidth. I was under the (wrong) impression
> > > that, since all xm_pcie3_* nodes had no requests, each corresponding
> > > PCIe bus would be shut down separately, leaving only qns_pcie_gem_noc
> > > active (with my test change in place).
> > > 
> > > > Assuming there is no misbehaving arm core - say a cDSP or aDSP piece of 
> > > > code that wants to do something on the PCIe bus, might the culprit be
> > > > whatever you have connected to the bus ?
> > > > 
> > > > Could something be driving the #WAKE signal and then transacting ?
> > > > 
> > > > But also keep in mind depending on what you are doing with this system 
> > > > if you have a bit of firmware in one of the DSP cores - does that 
> > > > firmware have scope to talk to any devices on the PCIe bus ?
> > > 
> > > As I mentioned above, this is a standard QDrive 3 reference board.
> > > Furthermore, I don't explicitly do anything with the DSPs. I just boot
> > > a fairly recent upstream kernel (6.5-rc1) with a standard rootfs. The
> > > boot firmware is whatever Qualcomm provides by default for these
> > > systems. So, unless the boot firmware loads anything into the DSPs
> > > behind my back (which I doubt), the DSPs should not even be running.
> > > 
> > > What is more likely though is that the boot firmware initializes a
> > > bunch of PCIe devices and leaves them on.
> > > 
> > > > I'd guess another firmware is unlikely but, a downstream device doing a 
> > > > #WAKE when you have the PCIe nodes disabled would presumably be bad..
> > > > 
> > > > Try looking for an upstream transaction from a device..
> > > 
> > > Yes, that makes sense. Do you have any suggestion on how to do that
> > > without using any specialized hardware (such as JTAG pod or PCIe bus
> > > analyzer)?
> > > 
> > > Thanks for all the input and suggestions!
> > > 
> > > --
> > > Radu
> > > 
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்
> > 
> 

-- 
மணிவண்ணன் சதாசிவம்
