Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE5EE17F69D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 12:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgCJLrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 07:47:01 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:53824 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726283AbgCJLrB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 07:47:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583840820; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7nIIhZEQW8Cf+kxg4RaUpR2Lx7FYWbZzGIC2PRZwGKg=; b=LRdntMvvPJuAJSAW09j2bmbJRhqDq3GhvutJRrHFJ+RidXtKNOLhO2v5pG+dlH5W76SbMix1
 gskX+/eOUeDDtXPsw5KeSUDlrG4ZxNa+jxGDksgUsWdQyFXLo2Ji0nzd8IaNhyWjWLpogCwF
 XtGW0l/SuqDCYzpjfj05iKa02pw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e677e33.7fcc07cfd3e8-smtp-out-n04;
 Tue, 10 Mar 2020 11:46:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 796A6C433BA; Tue, 10 Mar 2020 11:46:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.2] (unknown [183.83.137.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57058C433D2;
        Tue, 10 Mar 2020 11:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57058C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v13 5/5] drivers: qcom: Update rpmh clients to use start
 and end transactions
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        Taniya Das <tdas@codeaurora.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
 <1583746236-13325-6-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=UugityQX+TG2c41dyaaCrhYe534UgXxm0G0igLz-9LSw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <9bf2c0d6-29cf-47f1-3f98-e4bc9703b7b7@codeaurora.org>
Date:   Tue, 10 Mar 2020 17:16:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UugityQX+TG2c41dyaaCrhYe534UgXxm0G0igLz-9LSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/10/2020 5:14 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Update all rpmh clients to start using rpmh_start_transaction() and
>> rpmh_end_transaction().
>>
>> Cc: Taniya Das <tdas@codeaurora.org>
>> Cc: Odelu Kukatla <okukatla@codeaurora.org>
>> Cc: Kiran Gunda <kgunda@codeaurora.org>
>> Cc: Sibi Sankar <sibis@codeaurora.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>  drivers/clk/qcom/clk-rpmh.c             | 21 ++++++++++++++-------
>>  drivers/interconnect/qcom/bcm-voter.c   | 13 +++++++++----
>>  drivers/regulator/qcom-rpmh-regulator.c |  4 ++++
>>  drivers/soc/qcom/rpmhpd.c               | 11 +++++++++--
> This needs to be 4 separate patches since the change to each subsystem
> will go through a different maintainer.
I will split to 4 changes, and send each one to its respective mailing lists and maintainer/reviewer.
>
> Also: it'll be a lot easier to land this if you make the new
> rpmh_start_transaction() and rpmh_end_transaction() calls _optional_
> for now, especially since they are just a speed optimization and not
> for correctness.  That is, if a driver makes a call to rpmh_write(),
> rpmh_write_async(), rpmh_write_batch(), or rpmh_invalidate() without
> doing rpmh_start_transaction() then it should still work

yes, this is already taken care.

All the calls from driver will go through as it is and won't fail even without calling new APIs.
So they are already optional.

The comment in rpmh_start_transaction() is already saying if client "choose" to invoke this
then this must be ended by calling rpmh_end_transaction(). if client don't invoke
rpmh_start_transaction() in the first place then everything is expected work as if no change.


> --just flush
> right away.  

No, currently also in driver no one is calling rpmh_flush().

so nothing breaks with series and no point in adding changes to flush right away and then remove them in same series.

when the clients starts invoking new APIs, rpmh_flush() will start getting invoked for the first time in driver.

> Since you have rpmh_start_transaction() refcounted that's
> as simple as making a call to rpmh_start_transaction() at the
> beginning of all public calls and rpmh_end_transaction() at the end.
> If there was already a refcount then no harm done.  If there wasn't
> you'll get a flush at the end.
>
> Once you make the call optional, you can actually leave changing the
> callers until after your series lands.  Then you don't end up
> bothering all the other maintainers with the back-and-forth.

We don't need to end up syncing up with all other maintainers. the calls are already optional.

These new changes (as they be split in to 4) can go in any order in various maintainer's trees,
once this series goes in rpmh driver.

>
> Once all callers are updated you can make the call required.  ...or
> (as noted below) maybe we should just keep it optional...
>
> One last note here: you have a regulator change here but aren't
> sending it to the regulator maintainer.  That won't work.  You also
> have an interconnect change without sending it to the interconnect
> maintainer.
Done.
>
>
>>  4 files changed, 36 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index 12bd871..16f68d4 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -154,22 +154,27 @@ static int clk_rpmh_send_aggregate_command(struct clk_rpmh *c)
>>         cmd_state = c->aggr_state;
>>         on_val = c->res_on_val;
>>
>> +       rpmh_start_transaction(c->dev);
>> +
>>         for (; state <= RPMH_ACTIVE_ONLY_STATE; state++) {
>>                 if (has_state_changed(c, state)) {
>>                         if (cmd_state & BIT(state))
>>                                 cmd.data = on_val;
>>
>>                         ret = rpmh_write_async(c->dev, state, &cmd, 1);
>> -                       if (ret) {
>> -                               dev_err(c->dev, "set %s state of %s failed: (%d)\n",
>> -                                       !state ? "sleep" :
>> -                                       state == RPMH_WAKE_ONLY_STATE   ?
>> -                                       "wake" : "active", c->res_name, ret);
>> -                               return ret;
>> -                       }
>> +                       if (ret)
>> +                               break;
>>                 }
>>         }
>>
>> +       ret |= rpmh_end_transaction(c->dev);
> You can't do this.  "ret" is an integer and you're munging two error
> codes into one int.  I don't think there is any clever way to do this,
> but probably this would be fine (the compiler should optimize):
>
> if (ret)
>   rpmh_end_transaction(c->dev);
> else
>   ret = rpmh_end_transaction(c->dev);
>
> ...or just leave the "dev_err" and "return ret" where they were and
> call rpmh_end_transaction() above without looking at the return value.
Done.
>
>
>> +       if (ret) {
>> +               dev_err(c->dev, "set %s state of %s failed: (%d)\n",
>> +                       !state ? "sleep" : state == RPMH_WAKE_ONLY_STATE ?
>> +                       "wake" : "active", c->res_name, ret);
>> +               return ret;
>> +       }
> Technically the error message above is now misleading if the
> "end_transaction" failed.  Namely it will blame things on the active
> only state whereas that wasn't the problem.
>
Done.
>> +
>>         c->last_sent_aggr_state = c->aggr_state;
>>         c->peer->last_sent_aggr_state =  c->last_sent_aggr_state;
>>
>> @@ -267,7 +272,9 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
>>         cmd.addr = c->res_addr;
>>         cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
>>
>> +       rpmh_start_transaction(c->dev);
>>         ret = rpmh_write_async(c->dev, RPMH_ACTIVE_ONLY_STATE, &cmd, 1);
>> +       ret |= rpmh_end_transaction(c->dev);
> Again, no |=
Done.
>
> Also: one argument for keeping start_transaction and end_transaction
> optional long term is that you could completely eliminate this change.
its already optional as described above.
>
>>         if (ret) {
>>                 dev_err(c->dev, "set active state of %s failed: (%d)\n",
>>                         c->res_name, ret);
>> diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
>> index 2adfde8..fbe18b2 100644
>> --- a/drivers/interconnect/qcom/bcm-voter.c
>> +++ b/drivers/interconnect/qcom/bcm-voter.c
>> @@ -263,7 +263,9 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
>>         tcs_list_gen(&voter->commit_list, QCOM_ICC_BUCKET_AMC, cmds, commit_idx);
>>
>>         if (!commit_idx[0])
>> -               goto out;
>> +               goto end;
>> +
>> +       rpmh_start_transaction(voter-dev);
>>
>>         ret = rpmh_invalidate(voter->dev);
>>         if (ret) {
>> @@ -312,12 +314,15 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
>>         tcs_list_gen(&voter->commit_list, QCOM_ICC_BUCKET_SLEEP, cmds, commit_idx);
>>
>>         ret = rpmh_write_batch(voter->dev, RPMH_SLEEP_STATE, cmds, commit_idx);
>> -       if (ret) {
>> +       if (ret)
>>                 pr_err("Error sending SLEEP RPMH requests (%d)\n", ret);
>> -               goto out;
>> -       }
>>
>>  out:
>> +       ret = rpmh_end_transaction(voter-dev);
>> +       if (ret)
>> +               pr_err("Error ending rpmh transaction (%d)\n", ret);
>> +
>> +end:
> Personally I don't think "out" and "end" are very descriptive.  My own
> favorite is to name these types of labels based on what has been done
> so far.  So:
>
> exit_started_rpmh_transaction:
> exit_constructed_list:
>
Done.
>>         list_for_each_entry_safe(bcm, bcm_tmp, &voter->commit_list, list)
>>                 list_del_init(&bcm->list);
>>
>> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
>> index c86ad40..f4b9176 100644
>> --- a/drivers/regulator/qcom-rpmh-regulator.c
>> +++ b/drivers/regulator/qcom-rpmh-regulator.c
>> @@ -163,12 +163,16 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
>>  {
>>         int ret;
>>
>> +       rpmh_start_transaction(vreg->dev);
>> +
>>         if (wait_for_ack || vreg->always_wait_for_ack)
>>                 ret = rpmh_write(vreg->dev, RPMH_ACTIVE_ONLY_STATE, cmd, 1);
>>         else
>>                 ret = rpmh_write_async(vreg->dev, RPMH_ACTIVE_ONLY_STATE, cmd,
>>                                         1);
>>
>> +       ret |= rpmh_end_transaction(vreg->dev);
> Again, no |=.
Done.
> ...and again, if starting/ending was optional you wouldn't need this change.
>
its already optional as described above.
>> +
>>         return ret;
>>  }
>>
>> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
>> index 4d264d0..0e9d204 100644
>> --- a/drivers/soc/qcom/rpmhpd.c
>> +++ b/drivers/soc/qcom/rpmhpd.c
>> @@ -193,19 +193,26 @@ static const struct of_device_id rpmhpd_match_table[] = {
>>  static int rpmhpd_send_corner(struct rpmhpd *pd, int state,
>>                               unsigned int corner, bool sync)
>>  {
>> +       int ret;
>>         struct tcs_cmd cmd = {
>>                 .addr = pd->addr,
>>                 .data = corner,
>>         };
>>
>> +       rpmh_start_transaction(pd->dev);
>> +
>>         /*
>>          * Wait for an ack only when we are increasing the
>>          * perf state of the power domain
>>          */
>>         if (sync)
>> -               return rpmh_write(pd->dev, state, &cmd, 1);
>> +               ret = rpmh_write(pd->dev, state, &cmd, 1);
>>         else
>> -               return rpmh_write_async(pd->dev, state, &cmd, 1);
>> +               ret = rpmh_write_async(pd->dev, state, &cmd, 1);
>> +
>> +       ret |= rpmh_end_transaction(pd->dev);
> Again, no |=.
Done.
>
> ...and again, if starting/ending was optional you wouldn't need this change.

its already optional as described above.

Thanks,
Maulik

>
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
