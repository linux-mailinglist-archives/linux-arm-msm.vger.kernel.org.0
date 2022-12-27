Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF7A656D87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 18:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbiL0RmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 12:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbiL0RmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 12:42:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97818FC9;
        Tue, 27 Dec 2022 09:42:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 598BDB80E8B;
        Tue, 27 Dec 2022 17:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30586C43392;
        Tue, 27 Dec 2022 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672162941;
        bh=RWFdEDGiVVH5Zrk9szcOUJD4PkhACqIEThY3u6Slsos=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZqoM6Ci/QsebDnsYLKHiYtFJfAV+Lyhxfb6CGAj65ecPlZFBAP9egD+IkTsv++pUM
         7wnEiYCUtAZVQlmy8h4klVteFpVoIRgbufJMnZGXzaEH6AaNhDv9NU3B+8X0Mo4gxM
         YV72o1P3IJSvig/M8oNUFrHVPs+PBRYvy17GjopReIrM/0TCoShVjPJsC+7czakgV1
         6zPaa27RCJN1Cow35yhLY+X2SPo9dc7vrosdKFc4ccdIgIz7vFMIUCrf2cswDg0awD
         pjODdhJStFUUqQ7BX2zr49u7miHpKeAZ7rJHADcla03ps4mY/TZ9e7uw+8uZoZIKlX
         ovPsRS6EFzhsg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     stephan.gerhold@kernkonzept.com
Cc:     krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        stephan@gerhold.net, robh+dt@kernel.org,
        konrad.dybcio@somainline.org, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, luca@z3ntu.xyz,
        sireeshkodali1@gmail.com
Subject: Re: (subset) [PATCH v4 0/7] remoteproc: qcom_q6v5_mss: Add MSM8909 and MSM8953
Date:   Tue, 27 Dec 2022 11:42:17 -0600
Message-Id: <167216232800.738877.17567287056128563074.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
References: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Sep 2022 20:24:26 +0200, Stephan Gerhold wrote:
> Convert parts of the qcom,q6v5.txt binding documentation to a DT schema
> (together with some DT fixes) in preparation of adding new compatibles
> for MSM8909 and MSM8953. The schema can be easily shared between
> MSM8916, MSM8974, MSM8909 and MSM8953 because they have almost the same
> requirements. The other SoCs are quite different and are likely more
> clearly described in separate DT schema(s) to avoid a lot of complicated
> if statements.
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to schema
      commit: b9880532d0cdf54dc6cc0e028afe47d829873b20
[3/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8974
      commit: ac686cbc6f8bb7810058955e3bb5b5635ca9331a
[4/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8909
      commit: f8fb0b3d453e8a0a3b94c18001ce8f1e86d95036
[5/7] remoteproc: qcom: q6v5-mss: Add support for MSM8909
      commit: ed71c47f0000ec17b4ce167bce0d44dff8e144e1
[6/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8953
      commit: 43baa1a2215998ecb2ba64bb6d435d07541c7184
[7/7] remoteproc: qcom: q6v5-mss: Add modem support on MSM8953
      commit: 0201f759594b1248635185a92a5e39f47441ad6a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
