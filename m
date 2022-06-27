Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5164B55CB30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240967AbiF0UEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240949AbiF0UDs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:48 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93B61CB09
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:47 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id n11-20020a4ad12b000000b00425b01c3326so267306oor.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LGnZblasPJMZg6/JNpQsvyqp9LN9SUuVtya5U0kSw+8=;
        b=VSRPVrcICYS2BS1eCHZ9q+J4DnQwKLwIWzJUiS67PRmUMh56gomcQ3BDYx16eozC0b
         +tboi2va7rNkKUjAFkS9B5u1/0DZbnzW28GcuucSHQHHr381+7goHOMWu1MqOc6ahQNi
         8mHk/2UihkomeC/Ky+imcVYzjPDMBPcPtM8f4G6/I2N64reweuUqwoM++SPuLH+3muTU
         uTWmugPVVVapNgKC5uDJXy9eWpTO3W01UUGfWbl3efuXzs/pkaBDvnmka3sfm4SSnXB1
         m1FONVwSHMCUOsTSiz82qN5Lmt6H0w5+5Vm0eTxtyOQu+c3oMhkOJPCpHJlBxtAe/WyH
         73pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LGnZblasPJMZg6/JNpQsvyqp9LN9SUuVtya5U0kSw+8=;
        b=73jkUAfWo7cSmHCLA32pgFYpHTEqgTGU6go6YRs9FZTTyadkD9d69wPE44EHqyXOp2
         D4eQ0tAsVIhupPeX2lrdjHwSAysSCthykkx6Tbv+irg8U1lmA7K+uelrnMQgOHkqfIdc
         iXEP1xjCPamVkcTFUyqCHOdFqyB5ZTzcmo9b5ct1tKTbKAtzUJ1b9nOSnmKyzm7CskPj
         BHUQ02Yrar/nXxvW6F6cNT1vz2jAhIM9grK8W9+K9ewpIRFdqO44FwKy8ll79O0Bj6yb
         wbvhzFH4d9yapcKUA6HNTb7WBfqxmpi4kLLkddCZxwkfqdnDiAXSnFBjN3rKlluyiAJK
         OwaA==
X-Gm-Message-State: AJIora+PWcXU9SlqU9k9UHD4voh8L4JGXXaw3bK7s0dbqWjD9BEico1Z
        BMxBiVwQmRCufImVA8ayiEOuDg==
X-Google-Smtp-Source: AGRyM1sWcO/2gxyrz2AsRRM4slEsfIlAkVqHFEXchQYvprMxvwwexefgHGNtrnV0gfoQH3K7hFBuIw==
X-Received: by 2002:a4a:2a0e:0:b0:425:8739:7a7b with SMTP id k14-20020a4a2a0e000000b0042587397a7bmr6548301oof.81.1656360227454;
        Mon, 27 Jun 2022 13:03:47 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:46 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_rohkumar@quicinc.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, swboyd@chromium.org,
        devicetree@vger.kernel.org,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        judyhsiao@chromium.org, agross@kernel.org, dianders@chromium.org
Subject: Re: [PATCH v15 0/4] Add lpass pin control support for audio on sc7280 based targets
Date:   Mon, 27 Jun 2022 15:03:02 -0500
Message-Id: <165636016347.3080661.12244851783136095286.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1655108645-1517-1-git-send-email-quic_srivasam@quicinc.com>
References: <1655108645-1517-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Jun 2022 13:54:01 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add lpass pin control support for Audio over I2S,
> wcd codec and digital mics.
> 
> Changes Since V14:
>     -- Move secondary MI2S pinmux specifications to new file.
>     -- Add qcom,adsp-bypass-mode boolean property in lpass_tlmm Node.
> Changes Since V13:
>     -- Remove redundant properties in lpass lpi pin control nodes.
>     -- Sort lpass lpi pin control nodes.
> Changes Since V12:
>     -- Split common lpass lpi pin control nodes to functionality specific nodes.
>     -- Move common pin control properties to corresponding default nodes.
> Changes Since V11:
>     -- Move CRD specific pinmux nodes to crd specific file.
> Changes Since V10:
>     -- Add lpass lpi pinmux and MI2S pinmux support for rev5+ boards.
>     -- Remove dependency patches link in the cover-letter as it is merged.
> Changes Since V9:
>     -- Remove redundant prefix in node name.
> Changes Since V8:
>     -- Modify label and node names to lpass specific.
>     -- Sort nodes as per node names and kind of nodes like pinctrl and device nodes.
> Changes Since V7:
>     -- Sort mi2s pincontrol nodes as per node name.
>     -- Fix typo errors.
> Changes Since V6:
>     -- Move amp_en node to corresponding consumer patch.
>     -- Update label and node names.
>     -- Remove redundant drive-strengths.
>     -- Remove herobrine crd specific mi2s configuration.
> Changes Since V5:
>     -- Remove redundant function property in amp_en node.
>     -- Move board specific properties of lpass pin control node to board specific file.
>     -- Remove redundant properties in pin control nodes.
>     -- Move wcd938x codec reset and CTIA/OMTP pin control patches to other series.
> Changes Since V4:
>     -- Add primary and secondary I2S pinmux nodes for herobrine specific targets.
> Changes Since V3:
>     -- Add pinctrl nodes for wcd codec reset and CTIA/OMTP headset selection.
> Changes Since V2:
>     -- Move lpass pin control node to main dtsi file.
>     -- Sort nodes alphabetically.
>     -- Remove redundant wcd reset gpio nodes.
>     -- Remove redundant input-enable field in dmic pin control nodes.
>     -- Update amp_en node.
>     -- Fix typo errors.
>     -- Modify node names.
>     -- Create patches on latest kernel.
> Changes Since V1:
>     -- Merge pinmux and pinconf properties in amp_en and wcd pin reset node.
>     -- Split common i2s pin control nodes to functionality specific nodes.
>     -- Move board specific properties to board specific dtsi file.
>     -- Update dmic pin control node name.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sc7280: Add pinmux for I2S speaker and Headset
      commit: b9e3f65ecf85854c9717467c3cffaca194edd19f
[2/4] arm64: dts: qcom: sc7280: Add secondary MI2S pinmux specifications for CRD 3.0/3.1
      commit: 06c73a39c38b9321e638002450dcb22aa592ae99
[3/4] arm64: dts: qcom: sc7280: add lpass lpi pin controller node
      commit: 32d4541abe0f981cbcc45e142543d5811fd07692
[4/4] arm64: dts: qcom: sc7280-herobrine: Add lpi pinmux properties for CRD 3.0/3.1
      commit: a4c1fc8cff056461b9bd0e07e775f93073b4d527

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
