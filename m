Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0128F425A60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 20:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbhJGSKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 14:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243281AbhJGSKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 14:10:13 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B44EC061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 11:08:19 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id c33so4867160uae.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=e0GlWMYbLlSs51H/1CmfnGWYUQ7y8tN5RFueql5kGZQ=;
        b=Ae824ZeJKc51BOLdteAAZVqUUrojt0BhTYRJNtX1Ha4DcVhWKIrEeY3ZGDFEAi9u58
         u7ZUgDyLr9ND54eWegOogIuod8zlP1HCDH28lorUIee4da881sv2wMllbdiXoHngsiEh
         tS5P5Jha+uCvZHuJ5VVHT0+qndFFGkt5Mj6MLz/LYtfDqZNi7VpMBt7DihFInYpuB0Ju
         UjF9Sh0k3uA/0Hd9MxUhFiGGbg0LJUNwns9reCuc8tsk4Oq2Uj5TB67aSAaZHtdQ3laX
         b82wnsj90dIN451u6q+q2PwX8kbwLG9fslG0f8nLfgGkcFfimLLSF+meHe9hgYMEeykg
         GaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=e0GlWMYbLlSs51H/1CmfnGWYUQ7y8tN5RFueql5kGZQ=;
        b=U290AjSTizTrgNqekWcnj9/hqYMtXJFVDPq4nG8KGQ6E1QUsW5Cu59pUsc+euuRwEt
         prawJIlhu2HhYrgdrqFRwqjvUtcTH3pxBgyx8VgP/5X1oqv3LnFuccEGnsEwhsUUMf2U
         s7wmdpcsEhFY3Oytr65AmovfAhs1CXPsxe/KC0qmtGPavrl+Ta4sasIswkfW0kYKvDnp
         IxZlp6vX5V+OmsP3nVcFhIIjxVx7v5VdDEV4bd+ekNTo5e3CdfFrcQ7LspobsmEiAJcC
         9VdTfqBdAeggHREwybWS4FIKTcSO71nGEZ+If2mH7me1ITUHWYC5rTFIciIqh9yrUwrt
         AIWA==
X-Gm-Message-State: AOAM533D0DVIDC0QsnC/Aks7Vu778I6gx+x30AeSfKna9ebKeYBKE6ex
        UY8kbVW49WWlOtSmrTk0zohRAs1tp3jt0fcLGNE=
X-Google-Smtp-Source: ABdhPJwKnI9q5rv/I5YM5UeyvVwpifo0CLyKGt4nIVfYDzcYOmJEFg0E8k0lRaF2A+hHqA1rdY1jE41AoegVOiRPYu0=
X-Received: by 2002:ab0:8c1:: with SMTP id o1mr6304156uaf.113.1633630098608;
 Thu, 07 Oct 2021 11:08:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:c088:0:0:0:0:0 with HTTP; Thu, 7 Oct 2021 11:08:18 -0700 (PDT)
Reply-To: tonyelumelu5501@gmail.com
From:   POST OFFICE <morenagnellab55@gmail.com>
Date:   Thu, 7 Oct 2021 18:08:18 +0000
Message-ID: <CAMpi6QMrLLrkK4rkQMJTgPK0rsffoM2eFdTM3g68TX2rr5=RrA@mail.gmail.com>
Subject: =?UTF-8?B?Q2llbsSramFtYWlzIGZvbmRhIMSrcGHFoW5pZWsh?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Q2llbsSramFtYWlzIGZvbmRhIMSrcGHFoW5pZWshDQoNCkVzIG5vc8WrdMSranUganVtcyDFoW8g
dsSTc3R1bGkgcGlybXMgbcSTbmXFoWEsIGJldCBlcyBuZWR6aXJkxJNqdSBubyBqdW1zLA0KZXMg
bmVlc211IHDEgXJsaWVjaW7EgXRzLCB2YWkgasWrcyB0byBzYcWGxJNtxIF0LiBVbiB0xIFwxJNj
IGVzIHRvIHNha3UNCnbEk2xyZWl6OiBwaXJta8SBcnQsIGVzIGVzbXUgS3Jpc3RhbGluYSBHZW9y
Z2lldmEga3VuZHplLCBTdGFycHRhdXRpc2vEgQ0KVmFsxat0YXMgZm9uZGEgcsSra290xIFqZGly
ZWt0b3JlIHVuIHByZXppZGVudGUuDQoNClBhdGllc8SrYsSBIG3Ek3MgZXNhbSBwxIFyc2thdMSr
anXFoWkgdmlzdXMgxaHEt8STcsWhxLx1cyB1biBwcm9ibMSTbWFzLCBrYXMNCnNhaXN0xKt0YXMg
YXIgasWrc3UgbmVwYWJlaWd0byBkYXLEq2p1bXUgdW4gasWrc3UgbmVzcMSTanUgaXpwaWxkxKt0
DQpwxIFyc2thaXTEq2p1bWEgbWFrc3UsIGthcyBubyBqdW1zIGlla2FzxJN0YSBubyBpZXByaWVr
xaHEk2rEgW0NCnDEgXJza2FpdMSranVtYSBpZXNwxJNqxIFtLiBBcHN0aXByaW7EgWp1bXUgc2th
dGlldCBtxatzdSB2aWV0bsSTIDM4IMKwIDUz4oCyNTYNCuKAsyBOIDc3IMKwIDIg4oCyIDM5IOKA
syBXDQoNCk3Ek3MsIERpcmVrdG9ydSBwYWRvbWUsIFBhc2F1bGVzIEJhbmthIHVuIFN0YXJwdGF1
dGlza2FpcyBWYWzFq3RhcyBmb25kcw0KKFNWRikgVmHFoWluZ3RvbmEsIHNhZGFyYsSrYsSBIGFy
IEFTViBWYWxzdHMga2FzaSB1biBkYcW+xIFtIGNpdMSBbQ0KYXRiaWxzdG/FocSBbSBwxJN0xKtq
dW11IGHEo2VudMWrcsSBbSDFoWVpdCwgQVNWLiBpciBwYXbEk2zEk2ppcyBtxatzdSDEgHJ2YWxz
dHUNCm1ha3PEgWp1bXUgcMSBcnZlZHVtdSBub2RhxLxhaSwgxIBmcmlrYXMgQXB2aWVub3RhamFp
IGJhbmthaSBMb21lIFRvZ28sDQppenNuaWVndCBqdW1zIFZJU0Ega2FydGksIHV6IGt1cnUgdGlr
cyBub3PFq3TEq3RzIGrFq3N1IGZvbmRzIChVU0QgMSwyDQptaWxqb25pKSwgbGFpIHbEk2zEgWsg
aXrFhmVtdHUgbm8gasWrc3UgZm9uZGEuDQoNCkl6bWVrbMSTxaFhbmFzIGxhaWvEgSBtxJNzIGJp
asSBbSBwxIFyc3RlaWd0aSwga2Ega29ydW1wxJN0xIFzIGJhbmthcw0KYW1hdHBlcnNvbmFzIG5l
dmFqYWR6xKtnaSBrYXbEk2phIG3Fq3N1IG1ha3PEgWp1bXUsIGNlbsWhb3RpZXMgbm92aXJ6xKt0
DQpzYXZ1cyBsxKtkemVrxLx1cyB1eiBzYXZpZW0gcHJpdsSBdGFqaWVtIGtvbnRpZW0uDQoNClVu
IMWhb2RpZW4gbcSTcyBqxatzIGluZm9ybcSTamFtLCBrYSBqxatzdSBmb25kcyBpciBpZXNrYWl0
xKt0cyBVQkEgYmFua2FzDQpWSVNBIGthcnTEkyB1biBpciBnYXRhdnMgYXLEqyBwaWVnxIFkZWku
IFRhZ2FkIHNhemluaWV0aWVzIGFyIFVCQSBiYW5rYXMNCnNla3JldMSBcnUuIFZpxYZ1IHNhdWMg
VG9uaWpzIEVsdW1lbHUga3VuZ3MsDQoNCktvbnRha3RwZXJzb25hcyBlIC1wYXN0czogKHRvbnll
bHVtZWx1NTUwMUBnbWFpbC5jb20pDQoNCkzFq2R6dSwgbm9zxat0aWV0IHZpxYZhbSDFocSBZHUg
aW5mb3JtxIFjaWp1IHBhciBqxatzdSBha3JlZGl0xJN0xIFzIEFUTSBWSVNBDQprYXJ0ZXMgcGll
Z8SBZGkgdXogasWrc3UgYWRyZXNpLg0KDQpKxatzdSBwaWxucyB2xIFyZHM6ID09PT09PT09PT09
PT09PT09PT09DQoNCkrFq3N1IG3Eq3RuZXMgdmFsc3RzOiA9PT09PT09PT09PT09PT09PT09PQ0K
DQpKxatzdSBtxIFqYXMgYWRyZXNlOiA9PT09PT09PT09PT09PT09DQoNCkrFq3N1IHTEgWxydcWG
YSBudW11cnM6ID09PT09PT09PT09PT09PT09PT0NCg0KV2hhdHNBcHAgdMSBbHJ1xYZhIG51bXVy
cyArMjI4OTE4ODk3NzMNCg0KU3ZlaWNpZW5pLA0KS3Jpc3RhbGluYSBHZW9yZ2lldmEga3VuZHpl
Lg0K
