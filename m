Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 337F9F10C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 09:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbfKFIIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 03:08:36 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:32918 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729986AbfKFIIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 03:08:36 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0A4E7611FA; Wed,  6 Nov 2019 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573027715;
        bh=Yo8SjkHYjtVRfPkp1PCsQaZra8UH8YIzC2IL8wAokAQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VMB2FIKpdyZBdj/Gzgg0EPW60ktlEchBic4EaMJey34K57PbxkBAqpzVCppzsgqed
         5yj5n03ZLKZRzXEvUyIqAP2W6ElvRfKcluz88VLPT+b5x5njoLRKhuTlpZnw61QVCd
         W3g/pA8A6ChQYV0Ng/wgNRmFQNLMHT+t5x6y1jaM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 0F17A611FA;
        Wed,  6 Nov 2019 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573027714;
        bh=Yo8SjkHYjtVRfPkp1PCsQaZra8UH8YIzC2IL8wAokAQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Kjd7AuVic0Qh7zYpZM8+B10ufNxRXRFu1YkVYV1UH4ckWBzt1b2HedvixzIeG4wIk
         4gX5fnjwTQ1CKTZZKPs6gaQev5qPNR9TKNqqqiZCLjfz+5s1jKoUk/NIVzuu6byMnk
         ZcFHv6z/PC7j1xE+547iGggtVbr3c2G/jsQsaGp8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 06 Nov 2019 13:38:34 +0530
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        tientzu@chromium.org, seanpaul@chromium.org
Subject: Re: [PATCH v1 2/2] Bluetooth: hci_qca: Add support for Qualcomm
 Bluetooth SoC WCN3991
In-Reply-To: <20191105184407.GA1852@minitux>
References: <20191105144508.22989-1-bgodavar@codeaurora.org>
 <20191105144508.22989-3-bgodavar@codeaurora.org>
 <20191105184407.GA1852@minitux>
Message-ID: <739a8cadc6e01971a523d5a0b6fae057@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jorn,

On 2019-11-06 00:14, Bjorn Andersson wrote:
> On Tue 05 Nov 06:45 PST 2019, Balakrishna Godavarthi wrote:
> 
>> This patch add support for WCN3991 i.e. current values and fw download
>> support.
>> 
>> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>> ---
>>  drivers/bluetooth/btqca.c   | 68 
>> +++++++++++++++++++++++++++++--------
>>  drivers/bluetooth/btqca.h   | 10 ++++--
>>  drivers/bluetooth/hci_qca.c | 16 +++++++--
>>  3 files changed, 74 insertions(+), 20 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> [..]
>> @@ -48,13 +62,16 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 
>> *soc_version)
>>  	}
>> 
>>  	if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
>> -	    edl->rtype != EDL_APP_VER_RES_EVT) {
>> +	    edl->rtype != rtype) {
>>  		bt_dev_err(hdev, "QCA Wrong packet received %d %d", edl->cresp,
>>  			   edl->rtype);
>>  		err = -EIO;
>>  		goto out;
>>  	}
>> 
>> +	if (soc_type == QCA_WCN3991)
>> +		memcpy(&edl->data, &edl->data[1], sizeof(*ver));
> 
> memcpy() shouldn't be used when the two memory regions are overlapping,
> use memmove() for this.
> 

[Bala]: will update

> [..]
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index 7f7a2b2c0df6..309a720ff216 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -126,6 +126,7 @@ enum qca_btsoc_type {
>>  	QCA_ROME,
>>  	QCA_WCN3990,
>>  	QCA_WCN3998,
>> +	QCA_WCN3991,
> 
> Please maintain sort order.
> 

[Bala]: will update

> [..]
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> [..]
>> @@ -1663,6 +1674,7 @@ static const struct of_device_id 
>> qca_bluetooth_of_match[] = {
>>  	{ .compatible = "qcom,qca6174-bt" },
>>  	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
>>  	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
>> +	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
> 
> Ditto
> 

[Bala]: will update

> Regards,
> Bjorn

-- 
Regards
Balakrishna.
