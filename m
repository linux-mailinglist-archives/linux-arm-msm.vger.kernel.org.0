Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D610E2EBC5D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 11:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbhAFKao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 05:30:44 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:36418 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbhAFKao (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 05:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609928871;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=qTU4DWdSadiHTdrr7jalD2KvjWtAXAlSvru2TZMjebg=;
        b=Bzq9gX9N/+d35gjdff2WECvXnNXUSxKbk3MRv2zqY2cr7HZUg+yUp5imSLT+4noMp4
        FX0Dy9Tv6auAnCuAOYiS8kjAaZKdpkg0R4e50azDdqNhL4xnGdNdMi+0DNor1D1XwxrV
        EdoNG9y1EXC8T1hFsieijLZRTcHyeShxKEaHPVOs0liUbaJxDfndg4EM9sxHCr39rLlX
        NWxm7CZLrxngZ5VvViAqhL/ZnIC3ixsmGkBBc13zqFhAY2I3i+nCLeAhHLOhk66oUVt1
        oYE6XOK7chBTlzt1Q0Un2EkaVn3ma/63DiI76k75OlUP+55twJlNK0x3DG5cZIh4Usgd
        Xxuw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5G6JlrU="
X-RZG-CLASS-ID: mo00
Received: from droid..
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id e09c6dx06ALj5DX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 6 Jan 2021 11:21:45 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom,wcnss-pil: Add qcom,wcn3660b compatible
Date:   Wed,  6 Jan 2021 11:21:32 +0100
Message-Id: <20210106102134.59801-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106102134.59801-1-stephan@gerhold.net>
References: <20210106102134.59801-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

WCN3660B is a variant of WCN3660, but with the same regulator
requirements as WCN3620/WCN3680. Add a new qcom,wcn3660b compatible
to describe it from device trees.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index cc0b7fc1c29b..da09c0d79ac0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -80,6 +80,7 @@ and its resource dependencies. It is described by the following properties:
 	Definition: must be one of:
 		    "qcom,wcn3620",
 		    "qcom,wcn3660",
+		    "qcom,wcn3660b",
 		    "qcom,wcn3680"
 
 - clocks:
-- 
2.30.0

