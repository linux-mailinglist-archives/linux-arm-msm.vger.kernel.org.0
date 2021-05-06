Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF30375CBE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 23:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhEFVTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 17:19:37 -0400
Received: from mail-40140.protonmail.ch ([185.70.40.140]:47986 "EHLO
        mail-40140.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbhEFVTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 17:19:36 -0400
Date:   Thu, 06 May 2021 21:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1620335916;
        bh=JmIfeZqgnVk4S62XKaHhoZ6ZAhL2NhbjmNUWTGH2gr0=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=gKuLcjEJZNSXY3ZN8OcOxUeUr9qMoBLyOH5Xs4Jyq0puK7vL9ZzHweysBWxt2CZMA
         dVmkQ2scZJ/tA78rzgcQSQuUW4wDMLP3eTxVe5Ir4b5GVMPSGFOpUGFOHkLz3w70zU
         mj3/IndMR6r/K1xQmm8S5OAE/jxo9VSs23otgf48=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 2/3] dt-bindings: remoteproc: qcom: pas: Add power domains for MSM8996
Message-ID: <lRf8M7F6Qo9s7tlx6vuAWHThg26ls3u6SvQn1PLrAdI@cp4-web-038.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8996 compatible strings to CX and SSC-CX power domains.

This depends on: "dt-bindings: remoteproc: qcom: pas: Convert binding to YA=
ML"
https://lore.kernel.org/linux-arm-msm/20210505082200.32635-1-manivannan.sad=
hasivam@linaro.org/T/#u

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/=
Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 9c07cfce0383..6c11812385ca 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -320,6 +320,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
     then:
       properties:
@@ -335,6 +336,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8996-slpi-pil
               - qcom,msm8998-slpi-pas
     then:
       properties:
--=20
2.31.1


