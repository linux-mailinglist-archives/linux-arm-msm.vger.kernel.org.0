Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC5C76F405
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 22:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbjHCU3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 16:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjHCU3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 16:29:13 -0400
X-Greylist: delayed 1259 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 03 Aug 2023 13:29:10 PDT
Received: from fallback23.i.mail.ru (fallback23.i.mail.ru [79.137.243.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACD82D5A;
        Thu,  3 Aug 2023 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
        h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=iTra02Ediikpqje5A6Bp6qJxv4AcXgJrNuCR+ibsPzA=;
        t=1691094550;x=1691184550; 
        b=xoaLLbRf9GdDi/TQ7/cXkeZpqcbn/2kHWCjdM5ONr3+QKCIJu+xJo3jwmFcI+k5K5NgewBb0lToo8vk4cIiInWoW9Iqj0+sAdPKhd8ugBKlEgRl/RDv7N6EjSDVGHQSnPwWWfEh7ofsSnj0hq0yWTpd0bAsoJsNfCnCMxkjSwb4=;
Received: from [10.12.4.30] (port=43586 helo=smtp55.i.mail.ru)
        by fallback23.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
        id 1qReIW-001rTu-AY; Thu, 03 Aug 2023 22:47:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
        ; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
        Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
        X-Cloud-Ids:Disposition-Notification-To;
        bh=iTra02Ediikpqje5A6Bp6qJxv4AcXgJrNuCR+ibsPzA=; t=1691092068; x=1691182068; 
        b=LtJ1Zwfzp1O0mmZNPC/2GtDgssRfheh+seNTqcmSQP4DCM3xmp8TsYzp3D1ijLJVWjRK3SNTNxV
        ogfABAUYvg72couU/PhlBD6oJfI1DlZYOcTE1/twqaXCBiy7YIfjWZzX8FaI1SSQM5cMiSh5l5kho
        +keuEiPYfFOAuhDy8dg=;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
        id 1qReIF-000Y8b-1D; Thu, 03 Aug 2023 22:47:32 +0300
From:   Danila Tikhonov <danila@jiaxyga.com>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, konrad.dybcio@linaro.org,
        neil.armstrong@linaro.org, rfoss@kernel.org, andersson@kernel.org,
        quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com,
        quic_rmccann@quicinc.com, quic_jesszhan@quicinc.com,
        liushixin2@huawei.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, danila@jiaxyga.com,
        davidwronek@gmail.com
Subject: [PATCH 0/2] drm/msm/dpu: Add support for SM7150
Date:   Thu,  3 Aug 2023 22:47:22 +0300
Message-ID: <20230803194724.154591-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD969E04B5EED670DC804E38A5F9341E5D89B81E0241E25E490182A05F5380850404956DBABBA104F5FC0371154B7EC49AB4725CEA1E008296B39AA2D5375D91353
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE792C68BF9CD4C0E9EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063702DFA59B3C994360EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BE5CCB53A13BC8DBAFE95369BFF9F28ACBE51E9D3B700B82ACC7F00164DA146DAFE8445B8C89999728AA50765F790063741F7343E26298569389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8B4B51A2BAB7FBE05117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF09122B91796FF21F76E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8BC493A577044FAF45D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3E478A468B35FE767089D37D7C0E48F6C8AA50765F79006378869069EDD29A933EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A559534B36F856F636C6B9CF6467323EFF3FE6D546EE1A1C12F87CCE6106E1FC07E67D4AC08A07B9B02A336C65186350919C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1C9BDDA6ADD3F3559C0B754327D96BA611C6B588A75B544C32CBB7507AF2458966401EE05C14F77D8553022043D0BC9A573643C06B71491413B3302F2BCC8771D8EBEDE01CE1B1DA4C41F94D744909CE4BCAC77546666B612CC0CD5AA9A1B9887EE09F5AAA95A50543082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXjcAvAxsrA9Nc61Ffb2ik/x
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981B7B6FBA8BC574666C2C88AB10BE24B30A02093AA449391CF643683D8C0F3ED1CA3C71A376745D86BBE86167304C7680C3980CE5AAA35C7CD60F22E8815EDE5EAEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4C2CC63398298511D1E4750FD930E01DF28F9632845AEBDC5049FFFDB7839CE9E588CC25E272B312A963AD72AB2970178919A6105FB5EA3FE856E214AADB1F5AE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFd3RriuhA+6EbCfILZkkgHmg==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds DPU support for Qualcomm SM7150 SoC.

Danila Tikhonov (2):
  dt-bindings: display/msm: document DPU on SM7150
  drm/msm/dpu: Add SM7150 support

 .../bindings/display/msm/qcom,sm7150-dpu.yaml | 116 ++++++++
 .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 277 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 5 files changed, 396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

--
2.41.0

