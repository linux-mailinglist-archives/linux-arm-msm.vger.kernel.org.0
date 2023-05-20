Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C05770AABD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 21:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjETTh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 15:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjETThZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 15:37:25 -0400
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5AF10F
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 12:37:21 -0700 (PDT)
Received: (qmail 22232 invoked by uid 990); 20 May 2023 19:37:19 -0000
Authentication-Results: devico.uberspace.de;
        auth=pass (plain)
MIME-Version: 1.0
Date:   Sat, 20 May 2023 19:37:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From:   "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <776024ddf6bcf0b8774253964678fe2f16c8c6bd@lausen.nl>
TLS-Required: No
Subject: Hexagon 692 DSP & FastRPC declarations in sc7180 Device Tree Files
To:     "Bjorn Andersson" <andersson@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org,
        srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.317062) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.417062
Received: from unknown (HELO unkown) (::1)
        by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 20 May 2023 21:37:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=lausen.nl; s=uberspace;
        h=from;
        bh=KAN0KsjOE0JQNRluGzQKMt7qUIyIYtQacjFB2T1gHnc=;
        b=rOIixYwUf4e/MAv6BFkjEQKDzsH8tOhpURYrsox3i7A7BGZPD4rLVYyGp9O/QmFyxRqw8Tuuhh
        50K5YCwVU2HcXP6FpRvFCDeSAkeqbBoF2pVNwdOgjhkkVRo7NEEO6G4Cw1cotTTNuaZMljBncU3b
        oQ2T0HwyuZ2VcCovC9csjy5f4PETJIJYx6IJz0Uw13KNatAK53DyIb1Y9hqD132r6gOHnLsrRW2R
        pndPTWDjvghZDZIS+OlmxzlqJNoiiMW4cKiJmEJlL7uUQacHkeoXo9xBd2TfB6EPul35EuGK4h4j
        yCAtJPMeJNEMeNyvNazYn0Mn4VwvoUGHEkKgNs+fps/ig6JOFrs4gYfWbpQd6ytHJE6tGvveKN5Q
        Wh4N5+3EDw+gN+3YQRdJMPXNxPAUOQNaV/1R25LvuCk3pQ6qYk45158lZ6N7pDKrajTA98FsEYsw
        TBFJxHtkyd5jT/oJCiduszZ44EoT5IV9Pzf9If16wrXGQH1vM71jNANl7/YAITCy0CjPsT8gyLkd
        7RAvadj8OWIq5F7HLWt52xQmUNjJU08unVh0sI6Odxa8OCcOups1JY2poOJS9YUGr4zqxsGLZOZL
        5N1aD8yruc69DB7K/jg7FFqsLluMFB34Nrowa68nGO6tZIY1uI2Q/BdceSNnDR6vfDF4Q4HvsYux
        U=
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,MSGID_FROM_MTA_HEADER,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dear Arm64 Linux Community,

the sc7180 device tree files are missing the declaration of the Hexagon
692 DSP that's providing the Qualcomm AI Engine on this SoC [1] based on
the FastRPC driver. In contrast, the sc8280xp device tree files do
include the corresponding declarations [2] and the cDSP does show up as
/dev/fastrpc-cdsp{,-secure} on sc8280xp based devices.

Is there anyone in the community, perhaps folks at Linaro or QuIC that
might have access to the hardware documentation and could help provide
the information required to declare the DSP in the device tree? This
should require the cDSP base address, the number of compute-cb nodes
as well as their correct iommu and reg values.

Hexagon 692 DSP supports 5 TOPS, so declaring support in the device tree
can unlock simple, but non-trivial and interactive use-cases with, for
example, GPT-2-Large style models compiled for Hexagon with Apache TVM.

Best regards,
Leonard Lausen

[1]: https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documen=
ts/prod_brief_qcom_sd7c_2.pdf
[2]: https://github.com/torvalds/linux/blob/v6.3/arch/arm64/boot/dts/qcom=
/sc8280xp.dtsi#L4045-L4174
