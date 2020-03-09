Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF3F17ECC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 00:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgCIXoo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 19:44:44 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:43656 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbgCIXon (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 19:44:43 -0400
Received: by mail-vs1-f67.google.com with SMTP id 7so7242366vsr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 16:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xs7n6p/5EOR908vUlGJCRK4XfcfhF6iASL+/f9fqBa4=;
        b=ge1B4hGATR9s3Ng2NYfxGB5RxmZBNi0v8NQmaecDV77poEgjv5+h7zBVxFdwf7XK5H
         Nez68YCXSUynjff11ajiGPs5JC8wLuO8aBCzjqybcTIEB50rWF6OPV7RTNS246DWz7bI
         BeXdcQmVdU4sYy4V5QzKLaUqjVMItoqG0StPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xs7n6p/5EOR908vUlGJCRK4XfcfhF6iASL+/f9fqBa4=;
        b=KuvsY9OYfVpMc8jKMgl5OQu8nTBWjG8LYN9DvlmCECy/NIHt0tCHpRxooVVE9ntZLJ
         SHNkVbPsoa8y94c9F3u+DXjeZrsWsSqDhI5oZ7OLLTvbMg3O6kJQy0M6jq5fhSuaj6BD
         SLP+1jZP33BWwBN9ObNNLtviqUlrMUTEYlxdsBmT9sY5orjR4q66V+KAVvWWD06NNzAs
         krnHwqlXlfchQ0jdL2o767xP8pkl8P3oeJEnluDd2/B8TVI3U+na4NdYeuaSSY8YVVsA
         E+gW6sTj3CI6xO88AdHiq5DrclHG7VwsBigDsd/pu6H0TXzNy7ti7e0uyL1kPg/l2RQA
         o1yg==
X-Gm-Message-State: ANhLgQ0koijZAlfT5kh5NRQ6IgtKgLEwlLJWbFD385AIW8gG1BLZuJUC
        07w2EYsTck6QIQeT8XGS0PnWeIFeGa8=
X-Google-Smtp-Source: ADFU+vsOwd1z7Sm0ahunMC7Dt9+LpaWntGUJdHGQE++9iXD6m9nhN16r4tuehVuIsGuv9hw1nathRw==
X-Received: by 2002:a05:6102:124b:: with SMTP id p11mr11851996vsg.38.1583797479978;
        Mon, 09 Mar 2020 16:44:39 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id h139sm12897059vke.34.2020.03.09.16.44.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 16:44:39 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id z125so3360801vsb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 16:44:39 -0700 (PDT)
X-Received: by 2002:a05:6102:2dc:: with SMTP id h28mr11670096vsh.169.1583797478587;
 Mon, 09 Mar 2020 16:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org> <1583746236-13325-6-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1583746236-13325-6-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 9 Mar 2020 16:44:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UugityQX+TG2c41dyaaCrhYe534UgXxm0G0igLz-9LSw@mail.gmail.com>
Message-ID: <CAD=FV=UugityQX+TG2c41dyaaCrhYe534UgXxm0G0igLz-9LSw@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] drivers: qcom: Update rpmh clients to use start
 and end transactions
To:     Maulik Shah <mkshah@codeaurora.org>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Update all rpmh clients to start using rpmh_start_transaction() and
> rpmh_end_transaction().
>
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: Odelu Kukatla <okukatla@codeaurora.org>
> Cc: Kiran Gunda <kgunda@codeaurora.org>
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c             | 21 ++++++++++++++-------
>  drivers/interconnect/qcom/bcm-voter.c   | 13 +++++++++----
>  drivers/regulator/qcom-rpmh-regulator.c |  4 ++++
>  drivers/soc/qcom/rpmhpd.c               | 11 +++++++++--

This needs to be 4 separate patches since the change to each subsystem
will go through a different maintainer.

Also: it'll be a lot easier to land this if you make the new
rpmh_start_transaction() and rpmh_end_transaction() calls _optional_
for now, especially since they are just a speed optimization and not
for correctness.  That is, if a driver makes a call to rpmh_write(),
rpmh_write_async(), rpmh_write_batch(), or rpmh_invalidate() without
doing rpmh_start_transaction() then it should still work--just flush
right away.  Since you have rpmh_start_transaction() refcounted that's
as simple as making a call to rpmh_start_transaction() at the
beginning of all public calls and rpmh_end_transaction() at the end.
If there was already a refcount then no harm done.  If there wasn't
you'll get a flush at the end.

Once you make the call optional, you can actually leave changing the
callers until after your series lands.  Then you don't end up
bothering all the other maintainers with the back-and-forth.

Once all callers are updated you can make the call required.  ...or
(as noted below) maybe we should just keep it optional...

One last note here: you have a regulator change here but aren't
sending it to the regulator maintainer.  That won't work.  You also
have an interconnect change without sending it to the interconnect
maintainer.


>  4 files changed, 36 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 12bd871..16f68d4 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -154,22 +154,27 @@ static int clk_rpmh_send_aggregate_command(struct clk_rpmh *c)
>         cmd_state = c->aggr_state;
>         on_val = c->res_on_val;
>
> +       rpmh_start_transaction(c->dev);
> +
>         for (; state <= RPMH_ACTIVE_ONLY_STATE; state++) {
>                 if (has_state_changed(c, state)) {
>                         if (cmd_state & BIT(state))
>                                 cmd.data = on_val;
>
>                         ret = rpmh_write_async(c->dev, state, &cmd, 1);
> -                       if (ret) {
> -                               dev_err(c->dev, "set %s state of %s failed: (%d)\n",
> -                                       !state ? "sleep" :
> -                                       state == RPMH_WAKE_ONLY_STATE   ?
> -                                       "wake" : "active", c->res_name, ret);
> -                               return ret;
> -                       }
> +                       if (ret)
> +                               break;
>                 }
>         }
>
> +       ret |= rpmh_end_transaction(c->dev);

You can't do this.  "ret" is an integer and you're munging two error
codes into one int.  I don't think there is any clever way to do this,
but probably this would be fine (the compiler should optimize):

if (ret)
  rpmh_end_transaction(c->dev);
else
  ret = rpmh_end_transaction(c->dev);

...or just leave the "dev_err" and "return ret" where they were and
call rpmh_end_transaction() above without looking at the return value.


> +       if (ret) {
> +               dev_err(c->dev, "set %s state of %s failed: (%d)\n",
> +                       !state ? "sleep" : state == RPMH_WAKE_ONLY_STATE ?
> +                       "wake" : "active", c->res_name, ret);
> +               return ret;
> +       }

Technically the error message above is now misleading if the
"end_transaction" failed.  Namely it will blame things on the active
only state whereas that wasn't the problem.


> +
>         c->last_sent_aggr_state = c->aggr_state;
>         c->peer->last_sent_aggr_state =  c->last_sent_aggr_state;
>
> @@ -267,7 +272,9 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
>         cmd.addr = c->res_addr;
>         cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
>
> +       rpmh_start_transaction(c->dev);
>         ret = rpmh_write_async(c->dev, RPMH_ACTIVE_ONLY_STATE, &cmd, 1);
> +       ret |= rpmh_end_transaction(c->dev);

Again, no |=

Also: one argument for keeping start_transaction and end_transaction
optional long term is that you could completely eliminate this change.


>         if (ret) {
>                 dev_err(c->dev, "set active state of %s failed: (%d)\n",
>                         c->res_name, ret);
> diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
> index 2adfde8..fbe18b2 100644
> --- a/drivers/interconnect/qcom/bcm-voter.c
> +++ b/drivers/interconnect/qcom/bcm-voter.c
> @@ -263,7 +263,9 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
>         tcs_list_gen(&voter->commit_list, QCOM_ICC_BUCKET_AMC, cmds, commit_idx);
>
>         if (!commit_idx[0])
> -               goto out;
> +               goto end;
> +
> +       rpmh_start_transaction(voter-dev);
>
>         ret = rpmh_invalidate(voter->dev);
>         if (ret) {
> @@ -312,12 +314,15 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
>         tcs_list_gen(&voter->commit_list, QCOM_ICC_BUCKET_SLEEP, cmds, commit_idx);
>
>         ret = rpmh_write_batch(voter->dev, RPMH_SLEEP_STATE, cmds, commit_idx);
> -       if (ret) {
> +       if (ret)
>                 pr_err("Error sending SLEEP RPMH requests (%d)\n", ret);
> -               goto out;
> -       }
>
>  out:
> +       ret = rpmh_end_transaction(voter-dev);
> +       if (ret)
> +               pr_err("Error ending rpmh transaction (%d)\n", ret);
> +
> +end:

Personally I don't think "out" and "end" are very descriptive.  My own
favorite is to name these types of labels based on what has been done
so far.  So:

exit_started_rpmh_transaction:
exit_constructed_list:


>         list_for_each_entry_safe(bcm, bcm_tmp, &voter->commit_list, list)
>                 list_del_init(&bcm->list);
>
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index c86ad40..f4b9176 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -163,12 +163,16 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
>  {
>         int ret;
>
> +       rpmh_start_transaction(vreg->dev);
> +
>         if (wait_for_ack || vreg->always_wait_for_ack)
>                 ret = rpmh_write(vreg->dev, RPMH_ACTIVE_ONLY_STATE, cmd, 1);
>         else
>                 ret = rpmh_write_async(vreg->dev, RPMH_ACTIVE_ONLY_STATE, cmd,
>                                         1);
>
> +       ret |= rpmh_end_transaction(vreg->dev);

Again, no |=.

...and again, if starting/ending was optional you wouldn't need this change.


> +
>         return ret;
>  }
>
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 4d264d0..0e9d204 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -193,19 +193,26 @@ static const struct of_device_id rpmhpd_match_table[] = {
>  static int rpmhpd_send_corner(struct rpmhpd *pd, int state,
>                               unsigned int corner, bool sync)
>  {
> +       int ret;
>         struct tcs_cmd cmd = {
>                 .addr = pd->addr,
>                 .data = corner,
>         };
>
> +       rpmh_start_transaction(pd->dev);
> +
>         /*
>          * Wait for an ack only when we are increasing the
>          * perf state of the power domain
>          */
>         if (sync)
> -               return rpmh_write(pd->dev, state, &cmd, 1);
> +               ret = rpmh_write(pd->dev, state, &cmd, 1);
>         else
> -               return rpmh_write_async(pd->dev, state, &cmd, 1);
> +               ret = rpmh_write_async(pd->dev, state, &cmd, 1);
> +
> +       ret |= rpmh_end_transaction(pd->dev);

Again, no |=.

...and again, if starting/ending was optional you wouldn't need this change.



-Doug
