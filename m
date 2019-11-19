Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEEF910221A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 11:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfKSK3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 05:29:46 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:47416
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725798AbfKSK3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 05:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574159385;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=95fs3y0jwLr+Ki/sJzS6q7a+Po6VEYGetLlCriQxmJk=;
        b=ElvkP1lNXr2zBEHRZFWNE7fz/zChvA1hoLPys/dxt+KGIMXj1GFl/ZPh+xJAf7Pr
        550MeUV8L5iTfE9HC3HTWl3cmu4HmSdF+GKWq3ksO639DPCp1k7SIWRuIV9e0oSgXnb
        v3W4YhDDyeyc6OawtpGZXVhNViHwxYt5K7/u6/Wo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574159385;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=95fs3y0jwLr+Ki/sJzS6q7a+Po6VEYGetLlCriQxmJk=;
        b=DecOMo1uRIQ01nf7vrwW5+wKEoCORL9Q1KSDUeqzdfSVyODF64N274tdvxM2Wmpm
        xYwVER3sEpXunRsNErHcjHkopp8cFqr6aEvbh8eWnm5ciRti9qtVUstHTQttfjN0+DC
        +nzY8LghEylOpMd6hHwrwE+21t1ZEnuiHrgzFiSY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 Nov 2019 10:29:45 +0000
From:   sibis@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     georgi.djakov@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        saravanak@google.com, viresh.kumar@linaro.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add OSM L3 DT bindings
In-Reply-To: <20191119003115.CDEC32230B@mail.kernel.org>
References: <20191118154435.20357-1-sibis@codeaurora.org>
 <0101016e7f30995e-3b0444eb-598a-4af3-9ea2-6ae0e4cbdf0f-000000@us-west-2.amazonses.com>
 <20191119003115.CDEC32230B@mail.kernel.org>
Message-ID: <0101016e83360189-588bff57-180a-400e-8b5f-e9517992feb4-000000@us-west-2.amazonses.com>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.19-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Stephen,

Thanks for taking time to
review the series.

On 2019-11-19 06:01, Stephen Boyd wrote:
> Quoting Sibi Sankar (2019-11-18 07:45:21)
>> diff --git 
>> a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml 
>> b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>> new file mode 100644
>> index 0000000000000..fec8289ceeeed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>> @@ -0,0 +1,56 @@
>> +examples:
>> +  - |
>> +    osm_l3: interconnect@17d41000 {
>> +      compatible = "qcom,sdm845-osm-l3";
>> +      reg = <0x17d41000 0x1400>;
>> +
>> +      clocks = <&rpmhcc 0>, <&gcc 165>;
> 
> Can you use #define names here? That would make it clearer what sort of
> clk is expected here.

yes will do that.

> 
>> +      clock-names = "xo", "alternate";
>> +
>> +      #interconnect-cells = <1>;
>> +    };
