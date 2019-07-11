Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB34665E2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 19:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbfGKRHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 13:07:13 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36844 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728559AbfGKRHN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 13:07:13 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so6539742ljj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kfBRiimj25YsoO7nzYueeiO+Hpjn+NuB2lsdFOn8ASY=;
        b=MnIXCj5RYWPm7eMWoapgUjGxVvFXMmywFQ2kQMOnRLX3V+487ibLxbLv78ywuQq+ZQ
         Bb0TFNwAZbH9dHpkdU/nMzrzRm7xDa9RvnJ0I8bALa3JJ5OTqxluOmph+56gJift2hpb
         9gKUCFcOglW5bTH4n5VpxnMh2uET1mnARQRcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kfBRiimj25YsoO7nzYueeiO+Hpjn+NuB2lsdFOn8ASY=;
        b=HKlLd9nJceqKtU0m/hn6JpljKZ0wjVXjVuGKNqLgf5EKc3wiopacyDEnZvBHPdjQi1
         6obiQynfVHDlfFkucD7M34pEr+rmYXQe7F1kTVBvRBREPrX/sMvqB5y+8Xg9l7UrKAuh
         a/AtL/jEwe61KfC33+o0MsM9b09QcNgqpY8QIotq09TT0nOVKbVdwpRadutk8aoMc5zO
         D5cP+bnUwt+4R2OdRZcRrPx0W6x8znz1BfyaIfaCFYSGnmCoUpE0kY0jr5YExXzy8eF4
         ArzDOF/SDLgUmW6VySvBbcjaBwBeo4SNBixtF9bhoQt2rO2bE/A2nZ4U5ruQpo5m6itx
         tVmw==
X-Gm-Message-State: APjAAAXTIFkD5LO8AoebvBXQx4yPqs6jdxs8fZOGqXwGGjHYO58IvCpR
        e2eiI9Ctjahi9yQ+s26zAN8rrx51R9o=
X-Google-Smtp-Source: APXvYqy8s6bdw8iJDSZNGD4li4IuHdv9KKioG5g8nFLmd+DLVK9mJHAdIRUygP6sdHd9QzMcYIHLNQ==
X-Received: by 2002:a2e:5b94:: with SMTP id m20mr3158128lje.7.1562864830485;
        Thu, 11 Jul 2019 10:07:10 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id u13sm809001lfi.4.2019.07.11.10.07.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 10:07:09 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id t28so6534979lje.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 10:07:09 -0700 (PDT)
X-Received: by 2002:a2e:970d:: with SMTP id r13mr3220679lji.126.1562864828672;
 Thu, 11 Jul 2019 10:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190618091724.28232-1-georgi.djakov@linaro.org> <20190618091724.28232-3-georgi.djakov@linaro.org>
In-Reply-To: <20190618091724.28232-3-georgi.djakov@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 11 Jul 2019 10:06:32 -0700
X-Gmail-Original-Message-ID: <CAE=gft7=ZbK3ARtWyv8n_hWJ4kuXRs0UA0QsE420pqL8R1quUQ@mail.gmail.com>
Message-ID: <CAE=gft7=ZbK3ARtWyv8n_hWJ4kuXRs0UA0QsE420pqL8R1quUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] interconnect: qcom: Add tagging and wake/sleep
 support for sdm845
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, David Dai <daidavid1@codeaurora.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        amit.kucheria@linaro.org, Doug Anderson <dianders@chromium.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Georgi and David,

On Tue, Jun 18, 2019 at 2:17 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> From: David Dai <daidavid1@codeaurora.org>
>
> Add support for wake and sleep commands by using a tag to indicate
> whether or not the aggregate and set requests fall into execution
> state specific bucket.
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  drivers/interconnect/qcom/sdm845.c | 129 ++++++++++++++++++++++-------
>  1 file changed, 98 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
> index fb526004c82e..c100aab39415 100644
> --- a/drivers/interconnect/qcom/sdm845.c
> +++ b/drivers/interconnect/qcom/sdm845.c
> @@ -66,6 +66,17 @@ struct bcm_db {
>  #define SDM845_MAX_BCM_PER_NODE        2
>  #define SDM845_MAX_VCD         10
>
> +#define QCOM_ICC_BUCKET_AMC            0

What is AMC again? Is it the "right now" bucket? Maybe a comment on
the meaning of this bucket would be helpful.

> +#define QCOM_ICC_BUCKET_WAKE           1
> +#define QCOM_ICC_BUCKET_SLEEP          2
> +#define QCOM_ICC_NUM_BUCKETS           3
> +#define QCOM_ICC_TAG_AMC               BIT(QCOM_ICC_BUCKET_AMC)
> +#define QCOM_ICC_TAG_WAKE              BIT(QCOM_ICC_BUCKET_WAKE)
> +#define QCOM_ICC_TAG_SLEEP             BIT(QCOM_ICC_BUCKET_SLEEP)
> +#define QCOM_ICC_TAG_ACTIVE_ONLY       (QCOM_ICC_TAG_AMC | QCOM_ICC_TAG_WAKE)
> +#define QCOM_ICC_TAG_ALWAYS            (QCOM_ICC_TAG_AMC | QCOM_ICC_TAG_WAKE |\
> +                                        QCOM_ICC_TAG_SLEEP)
> +
>  /**
>   * struct qcom_icc_node - Qualcomm specific interconnect nodes
>   * @name: the node name used in debugfs
> @@ -75,7 +86,9 @@ struct bcm_db {
>   * @channels: num of channels at this node
>   * @buswidth: width of the interconnect between a node and the bus
>   * @sum_avg: current sum aggregate value of all avg bw requests
> + * @sum_avg_cached: previous sum aggregate value of all avg bw requests
>   * @max_peak: current max aggregate value of all peak bw requests
> + * @max_peak_cached: previous max aggregate value of all peak bw requests
>   * @bcms: list of bcms associated with this logical node
>   * @num_bcms: num of @bcms
>   */
> @@ -86,8 +99,10 @@ struct qcom_icc_node {
>         u16 num_links;
>         u16 channels;
>         u16 buswidth;
> -       u64 sum_avg;
> -       u64 max_peak;
> +       u64 sum_avg[QCOM_ICC_NUM_BUCKETS];
> +       u64 sum_avg_cached[QCOM_ICC_NUM_BUCKETS];
> +       u64 max_peak[QCOM_ICC_NUM_BUCKETS];
> +       u64 max_peak_cached[QCOM_ICC_NUM_BUCKETS];
>         struct qcom_icc_bcm *bcms[SDM845_MAX_BCM_PER_NODE];
>         size_t num_bcms;
>  };
> @@ -112,8 +127,8 @@ struct qcom_icc_bcm {
>         const char *name;
>         u32 type;
>         u32 addr;
> -       u64 vote_x;
> -       u64 vote_y;
> +       u64 vote_x[QCOM_ICC_NUM_BUCKETS];
> +       u64 vote_y[QCOM_ICC_NUM_BUCKETS];
>         bool dirty;
>         bool keepalive;
>         struct bcm_db aux_data;
> @@ -555,7 +570,7 @@ inline void tcs_cmd_gen(struct tcs_cmd *cmd, u64 vote_x, u64 vote_y,
>                 cmd->wait = true;
>  }
>
> -static void tcs_list_gen(struct list_head *bcm_list,
> +static void tcs_list_gen(struct list_head *bcm_list, int bucket,
>                          struct tcs_cmd tcs_list[SDM845_MAX_VCD],
>                          int n[SDM845_MAX_VCD])
>  {
> @@ -573,8 +588,8 @@ static void tcs_list_gen(struct list_head *bcm_list,
>                         commit = true;
>                         cur_vcd_size = 0;
>                 }
> -               tcs_cmd_gen(&tcs_list[idx], bcm->vote_x, bcm->vote_y,
> -                           bcm->addr, commit);
> +               tcs_cmd_gen(&tcs_list[idx], bcm->vote_x[bucket],
> +                           bcm->vote_y[bucket], bcm->addr, commit);
>                 idx++;
>                 n[batch]++;
>                 /*
> @@ -595,32 +610,39 @@ static void tcs_list_gen(struct list_head *bcm_list,
>
>  static void bcm_aggregate(struct qcom_icc_bcm *bcm)
>  {
> -       size_t i;
> -       u64 agg_avg = 0;
> -       u64 agg_peak = 0;
> +       size_t i, bucket;
> +       u64 agg_avg[QCOM_ICC_NUM_BUCKETS] = {0};
> +       u64 agg_peak[QCOM_ICC_NUM_BUCKETS] = {0};
>         u64 temp;
>
> -       for (i = 0; i < bcm->num_nodes; i++) {
> -               temp = bcm->nodes[i]->sum_avg * bcm->aux_data.width;
> -               do_div(temp, bcm->nodes[i]->buswidth * bcm->nodes[i]->channels);
> -               agg_avg = max(agg_avg, temp);
> +       for (bucket = 0; bucket < QCOM_ICC_NUM_BUCKETS; bucket++) {
> +               for (i = 0; i < bcm->num_nodes; i++) {
> +                       temp = bcm->nodes[i]->sum_avg_cached[bucket] * bcm->aux_data.width;
> +                       do_div(temp, bcm->nodes[i]->buswidth * bcm->nodes[i]->channels);
> +                       agg_avg[bucket] = max(agg_avg[bucket], temp);
>
> -               temp = bcm->nodes[i]->max_peak * bcm->aux_data.width;
> -               do_div(temp, bcm->nodes[i]->buswidth);

Why is it that this one doesn't have the multiply by
bcm->nodes[i]->channels again? I can't recall if there was a reason.
If it's correct maybe it deserves a comment.

> -               agg_peak = max(agg_peak, temp);
> -       }
> +                       temp = bcm->nodes[i]->max_peak_cached[bucket] * bcm->aux_data.width;
> +                       do_div(temp, bcm->nodes[i]->buswidth);
> +                       agg_peak[bucket] = max(agg_peak[bucket], temp);
>
> -       temp = agg_avg * 1000ULL;
> -       do_div(temp, bcm->aux_data.unit);
> -       bcm->vote_x = temp;
> +                       bcm->nodes[i]->sum_avg[bucket] = 0;
> +                       bcm->nodes[i]->max_peak[bucket] = 0;

I don't understand the sum_avg vs sum_avg_cached. Here's what I understand:
1. qcom_icc_aggregate() does the math from the incoming values on
sum_avg, and then clobbers sum_avg_cached with those values.
2. bcm_aggregate() uses sum_avg_cached in its calculations, then clears sum_avg.

But I don't get why that's needed. Why not just have sum_avg? Wouldn't
it work the same? Ok, it wouldn't if you ended up calling
bcm_aggregate() multiple times on the same bcm. But you have a dirty
flag that prevents this from happening. So I think it's safe to remove
the cached arrays, and just clear out the sum_avg when you aggregate.

> +               }
>
> -       temp = agg_peak * 1000ULL;
> -       do_div(temp, bcm->aux_data.unit);
> -       bcm->vote_y = temp;
> +               temp = agg_avg[bucket] * 1000ULL;
> +               do_div(temp, bcm->aux_data.unit);
> +               bcm->vote_x[bucket] = temp;
>
> -       if (bcm->keepalive && bcm->vote_x == 0 && bcm->vote_y == 0) {
> -               bcm->vote_x = 1;
> -               bcm->vote_y = 1;
> +               temp = agg_peak[bucket] * 1000ULL;
> +               do_div(temp, bcm->aux_data.unit);
> +               bcm->vote_y[bucket] = temp;
> +       }
> +
> +       if (bcm->keepalive && bcm->vote_x[0] == 0 && bcm->vote_y[0] == 0) {
> +               bcm->vote_x[QCOM_ICC_BUCKET_AMC] = 1;
> +               bcm->vote_x[QCOM_ICC_BUCKET_WAKE] = 1;
> +               bcm->vote_y[QCOM_ICC_BUCKET_AMC] = 1;
> +               bcm->vote_y[QCOM_ICC_BUCKET_WAKE] = 1;
>         }
>
>         bcm->dirty = false;
> @@ -631,15 +653,25 @@ static int qcom_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
>  {
>         size_t i;
>         struct qcom_icc_node *qn;
> +       unsigned long tag_word = (unsigned long)tag;
>
>         qn = node->data;
>
> +       if (!tag)
> +               tag_word = QCOM_ICC_TAG_ALWAYS;
> +
> +       for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
> +               if (test_bit(i, &tag_word)) {

I guess all this extra business with tag_word and casting is so that
you can use test_bit, which is presumably a tiny bit faster? Does this
actually make a measurable difference? Maybe in the name of simplicity
we just do if (tag & BIT(i)), and then optimize if we find that
conditional to be a hotspot?

> +                       qn->sum_avg[i] += avg_bw;
> +                       qn->max_peak[i] = max_t(u32, qn->max_peak[i], peak_bw);
> +                       qn->sum_avg_cached[i] = qn->sum_avg[i];
> +                       qn->max_peak_cached[i] = qn->max_peak[i];
> +               }
> +       }
> +
>         *agg_avg += avg_bw;
>         *agg_peak = max_t(u32, *agg_peak, peak_bw);
>
> -       qn->sum_avg = *agg_avg;
> -       qn->max_peak = *agg_peak;
> -
>         for (i = 0; i < qn->num_bcms; i++)
>                 qn->bcms[i]->dirty = true;
>
> @@ -675,7 +707,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>          * Construct the command list based on a pre ordered list of BCMs
>          * based on VCD.
>          */
> -       tcs_list_gen(&commit_list, cmds, commit_idx);
> +       tcs_list_gen(&commit_list, QCOM_ICC_BUCKET_AMC, cmds, commit_idx);
>
>         if (!commit_idx[0])
>                 return ret;
> @@ -693,6 +725,41 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>                 return ret;
>         }
>
> +       INIT_LIST_HEAD(&commit_list);
> +
> +       for (i = 0; i < qp->num_bcms; i++) {
> +               /*
> +                * Only generate WAKE and SLEEP commands if a resource's
> +                * requirements change as the execution environment transitions
> +                * between different power states.
> +                */
> +               if (qp->bcms[i]->vote_x[QCOM_ICC_BUCKET_WAKE] !=
> +                   qp->bcms[i]->vote_x[QCOM_ICC_BUCKET_SLEEP] ||
> +                   qp->bcms[i]->vote_y[QCOM_ICC_BUCKET_WAKE] !=
> +                   qp->bcms[i]->vote_y[QCOM_ICC_BUCKET_SLEEP]) {
> +                       list_add_tail(&qp->bcms[i]->list, &commit_list);
> +               }
> +       }
> +
> +       if (list_empty(&commit_list))
> +               return ret;
> +
> +       tcs_list_gen(&commit_list, QCOM_ICC_BUCKET_WAKE, cmds, commit_idx);
> +
> +       ret = rpmh_write_batch(qp->dev, RPMH_WAKE_ONLY_STATE, cmds, commit_idx);
> +       if (ret) {
> +               pr_err("Error sending WAKE RPMH requests (%d)\n", ret);
> +               return ret;
> +       }
> +
> +       tcs_list_gen(&commit_list, QCOM_ICC_BUCKET_SLEEP, cmds, commit_idx);
> +
> +       ret = rpmh_write_batch(qp->dev, RPMH_SLEEP_STATE, cmds, commit_idx);
> +       if (ret) {
> +               pr_err("Error sending SLEEP RPMH requests (%d)\n", ret);
> +               return ret;
> +       }
> +
>         return ret;
>  }
>
