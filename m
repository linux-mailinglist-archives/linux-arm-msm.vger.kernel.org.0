Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E4A269520
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 20:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgINSnu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 14:43:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58848 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbgINSns (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 14:43:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600109028; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IBd2kyb8hWOOqIOXc0Or7ejrYcX2YVrlRG3QUaCL7C8=;
 b=rdovm9iSTo99/GLoJ8Cy3QtBc7eFVZmgbFgEhiH6bC3MT6VutBhXbkhZ8qJ1yqsdvB3fe4iW
 PLotzPd60Cm8MrTLlDB+A6MbuGZ7F51ykMoiyIbrAQUk3Gc/DO+imHCgeZ672ziKXPozCB9g
 7YvaLG2cwa2ktHJYrQNm9P53kVE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f5fb9c2238e1efa376f0c6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 18:43:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4CBEBC43387; Mon, 14 Sep 2020 18:43:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4935DC433CA;
        Mon, 14 Sep 2020 18:43:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 14 Sep 2020 11:43:12 -0700
From:   nguyenb@codeaurora.org
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Bean Huo <beanhuo@micron.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] scsi: ufs: Support reading UFS's Vcc voltage from
 device tree
In-Reply-To: <BY5PR04MB67051C08A73119B554E4F352FC220@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <69db325a09d5c3fa7fc260db031b1e498b601c25.1598939393.git.nguyenb@codeaurora.org>
 <BY5PR04MB67051C08A73119B554E4F352FC220@BY5PR04MB6705.namprd04.prod.outlook.com>
Message-ID: <170592eceb26da041f276cf4ca33aaf2@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-13 02:37, Avri Altman wrote:
>> 
>> The UFS specifications supports a range of Vcc operating voltage
>> from 2.4-3.6V depending on the device and manufacturers.
>> Allows selecting the UFS Vcc voltage level by setting the
>> UFS's entry vcc-voltage-level in the device tree. If UFS's
>> vcc-voltage-level setting is not found in the device tree,
>> use default values provided by the driver.
>> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>> ---
>>  drivers/scsi/ufs/ufshcd-pltfrm.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c 
>> b/drivers/scsi/ufs/ufshcd-pltfrm.c
>> index 3db0af6..48f429c 100644
>> --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
>> +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
>> @@ -104,10 +104,11 @@ static int ufshcd_parse_clock_info(struct 
>> ufs_hba
>> *hba)
>>  static int ufshcd_populate_vreg(struct device *dev, const char *name,
>>                 struct ufs_vreg **out_vreg)
>>  {
>> -       int ret = 0;
>> +       int len, ret = 0;
>>         char prop_name[MAX_PROP_SIZE];
>>         struct ufs_vreg *vreg = NULL;
>>         struct device_node *np = dev->of_node;
>> +       const __be32 *prop;
>> 
>>         if (!np) {
>>                 dev_err(dev, "%s: non DT initialization\n", __func__);
>> @@ -138,8 +139,16 @@ static int ufshcd_populate_vreg(struct device 
>> *dev,
>> const char *name,
>>                         vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
>>                         vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
>>                 } else {
>> -                       vreg->min_uV = UFS_VREG_VCC_MIN_UV;
>> -                       vreg->max_uV = UFS_VREG_VCC_MAX_UV;
>> +                       prop = of_get_property(np, 
>> "vcc-voltage-level", &len);
>> +                       if (!prop || (len != (2 * sizeof(__be32)))) {
>> +                               dev_warn(dev, "%s vcc-voltage-level 
>> property.\n",
>> +                                       prop ? "invalid format" : 
>> "no");
>> +                               vreg->min_uV = UFS_VREG_VCC_MIN_UV;
>> +                               vreg->max_uV = UFS_VREG_VCC_MAX_UV;
>> +                       } else {
>> +                               vreg->min_uV = be32_to_cpup(&prop[0]);
>> +                               vreg->max_uV = be32_to_cpup(&prop[1]);
>> +                       }
>>                 }
>>         } else if (!strcmp(name, "vccq")) {
>>                 vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
>> --
> Maybe instead call ufshcd_populate_vreg with the new name,
> To not break the function flow, and just add another else if ?
Could you please clarify your comments? Are you suggesting to create a 
new function?
Thank you.
