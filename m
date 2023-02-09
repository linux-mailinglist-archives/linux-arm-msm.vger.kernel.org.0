Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA8168FE93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 05:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjBIEZN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 23:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjBIEZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 23:25:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C5038B41;
        Wed,  8 Feb 2023 20:24:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9EE0A61896;
        Thu,  9 Feb 2023 04:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EFDC433EF;
        Thu,  9 Feb 2023 04:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916487;
        bh=YnA4JzywydS5vTU1LQkz3Nd0kLu0uDfLJksKGK4AiXs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hCPGS9i3Hvv4hvKZnXPpgWpIzYsVOJmqK7jECOrw7ryND54osytqqxsCJOakO0nsb
         ccAGGeLUjpYFQTEJ3AG3jRPpdHGtu0N/mg4Vsv0MdqTBXkn0WCJZ9x7UjbjysFszr4
         nT+YyVnxcoWONtXi+Rh6N2k0HrhqkZIsFAlEN0j+EfxYDf3osG+DnZNtHLw8wbrzkg
         vVqifVtvZ3UkdHbJyJeRNxyYwc5si2612rk2LC1ZGL+z4q8BM60lIq6oocsWMtp9Zp
         VHDpaA6nUkcZ+r4qpgTbBdc82H6/Ne48oHnqCbdVl/rd7+R+A3J2cOpvLc7atvQqPj
         S/PiwPTiURYbw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-oneplus-*: add audio devices
Date:   Wed,  8 Feb 2023 20:22:45 -0800
Message-Id: <167591660367.1230100.13454943135132530008.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125231829.2621768-1-caleb.connolly@linaro.org>
References: <20230125231829.2621768-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Jan 2023 23:18:28 +0000, Caleb Connolly wrote:
> Populate the audio devices found on the OnePlus 6 and 6T using the
> sdm845-sndcard driver.
> 
> Both devices have the earpiece and headphone jack connected to the
> WCD9341 codec. The OnePlus 6 uses the MAX98927 speaker codec which is
> already supported upstream. The OnePlus 6T uses a currently unsupported
> TFA9894 codec.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-oneplus-*: add audio devices
      commit: b7b7342868560bb2be158075b4a4218997fb1c75

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
