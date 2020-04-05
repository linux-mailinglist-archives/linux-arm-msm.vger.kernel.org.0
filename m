Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46BB19EC82
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 18:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbgDEQMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Apr 2020 12:12:33 -0400
Received: from mout.web.de ([212.227.17.11]:51917 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726909AbgDEQMc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Apr 2020 12:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586103135;
        bh=vSeyjKaG/fKVCjCROHOr96NvZleJyDqBvTnh2s4chtc=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=dN9ttVVahdLRvOb5gsJhEykEvX4Pq+Vscua7qWoZ2FiVZWyNuib6FvQBktGzJzesM
         KpSi2CY5lpCoNdXsgHB79NXRvofzLGF7XnbR9meW0YAoo7yPnbxiU4CZUaUGTbJExl
         fC/uw5Qn7oS3NhM8eO2JL0mdmdDfceQDO1t6xPpg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LbrZ2-1iw0LL2mf6-00jK6l; Sun, 05
 Apr 2020 18:12:15 +0200
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] soc: qcom: smp2p: Delete an error message in
 qcom_smp2p_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <eb92fcfb-6181-1f9d-2601-61e5231bd892@web.de>
Date:   Sun, 5 Apr 2020 18:12:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gI8Ey2IDq140zqcfjpYaX4b1omLSKuRKfL/uzZTEKRW4wn+FnwO
 GQfg3NS8HVhmVIc7KL2DoI7jyR9D7SFXL2SWr3S9apPujA8eYhAI2MGZ5gBHyyjzfR0esk3
 6zyPOHhyNZDAss6IvSe/XH48h0FPMgJQPp3JHmjhPCzLptVUMrEH8jIKWGAMR0VXlV0WqM7
 OsZ0mk6ksuaPZO0L/Yx2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ysiE22kY/Yk=:+KRZtLFnD2IGbqaQthXkOP
 texO0GfHHp4VpDb8ygBuRO+7l8bFcoXNZbcULfnDerki21voxeb+PAwI8650Q3uel3Ql7VpPe
 f8UPKxvmEcYICorSejCp4tiiPmwc/E5rsO/7AadmsMot5uRxmlVq2thqI8qGl+K09fFCsBK/K
 Sh6QFCtG8pJcwxbpBuuf7X8pntkkc+DHb+Vakf1MBjeC+FmXQPgG1WiI8CJ29DUyENZzCQJUr
 l3+PI+BJSl3HOrkFuYTPkgAcBkq6+PLJH7Qvq3Anw6NhULTso3QHRDRq5OmxrVz42OYNEtaN/
 AhswGq9Koef5lZaQq6TC9xC9qlgie3c2jc7n8OVhTNxsH6bSYHOxZW9Y0CttRYmTO5CyWjLfL
 SlWOooyX0YX6iexRzOngukqCPhC6Qk9EqVH2cSBhLTE939WHH39PBeYK1vA3mOcr9xoH+KQ0x
 Cndv6vOHlDTocl60YZLNbN6XsOUj6hOR9NF+0LiUEQSwG+xsAwNkU+qRg9hO/ghg8HqEGnfZW
 zHaCZLzm527khzb48so6/TZufv58lH/EndMKMYfvVfPBzfhluU+BYlwlLw61PqCvuoiKSyxJr
 pXhqUbyOyhNuSVt1VwMMVMuxBGXVNUiZ0kwV28JU9BXXN2k+/rIzbun65sJfqTvCiUcI/eYng
 +gybAGMJTgV3Dga6pukkmNdHQnztCCFFakR7tb6GmHZmBE6VGE87wXvRxHV7aq4sQh8sH/0Fw
 uWHQpfGqOPbuSabe89pCCqkOZxugtaAxWSKEzdlWDBwvEYJ5JTnh+vB1yI39gSHrAGR6CkjP3
 Iln5Q56OXk5gHas+frAQo8M90BLI527iwx5fvxDcxhNZvClGXg+4XqctLAkC4IZipKMNmzA11
 f8PcYmFZb7dzNa55yt4tmp47FfV4XLsRbxPd7+ZfW1nQabdJ4ysiwdxdgcN9WUt99fDR2qbxA
 jxPHZdh+U/QBU20cH8YN00U3+8sPYfBwjOCfjdfXFkTkCOG3NwpDepy/n+pFNt8qsa1ee4U+g
 qCxJwtG4+OA5zzeTEYXe2Xq/1A4R+DEmVLMYYDOUvPkpH9FFapd5keJ8yEnDYFOUVQzYcSPB5
 0oSvWlnYxZhHc77cnbGHh4Zo23Mehrc55G36YZEaOMJ3CJi/Jz51rwA7PzFMOanv+sztOOZo6
 mb+JJzaRjTAQ1KnUKzPL+NoGLQxAmCyd8Bwfc9vN+r0j8TNNnQfW8pBZYcHmXLVJD5XEhaqk4
 qIixYKXLD3ov/P/Id
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Apr 2020 18:08:13 +0200

The function =E2=80=9Cplatform_get_irq=E2=80=9D can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/soc/qcom/smp2p.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index c7300d54e444..07183d731d74 100644
=2D-- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -474,10 +474,8 @@ static int qcom_smp2p_probe(struct platform_device *p=
dev)
 		goto report_read_failure;

 	irq =3D platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "unable to acquire smp2p interrupt\n");
+	if (irq < 0)
 		return irq;
-	}

 	smp2p->mbox_client.dev =3D &pdev->dev;
 	smp2p->mbox_client.knows_txdone =3D true;
=2D-
2.26.0

