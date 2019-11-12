Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7BD2F9CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 23:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKLWDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 17:03:33 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56968 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfKLWDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 17:03:33 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 60BB160A08; Tue, 12 Nov 2019 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573596212;
        bh=HgE6dE8D3kQ7mjaevEzutll6wPhfKbAN1M2heEEGzjg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mcQ2Dv2jOWfsM+TT/AB74ZMN8Id5BqifK4eLwOFB5H+PCYsnGwojFUxnM1yHxuZ9h
         i3RtKrQJ6WewTIWbS7LxUOpqhyr+/z/vZ0xJCxRqGmmtQH7Hqi3HusINa46wzvqG5a
         Zujbp1wKZ85UktSNc74v7sE4411NxMrh6/oF4eHY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F206760736;
        Tue, 12 Nov 2019 22:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573596209;
        bh=HgE6dE8D3kQ7mjaevEzutll6wPhfKbAN1M2heEEGzjg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZTPsYiV2+kZ8rohdBhvDvLBRE6rQBQLaOJy//iwe9Ovbksc+cksF5rdC6clNpK/uO
         2xinBUd+jzG3GCIvBK04A5GWSgYuGot8N/6oXzVwpMuesASKzqeX7C2RwkmKWuKm2c
         VnfEzDiL6FDY/w3EnXz9jFm9F+3mbz5/J4EbD7ug=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F206760736
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v8 1/4] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255036-10302-1-git-send-email-jhugo@codeaurora.org>
 <20191112004417.GA16664@bogus>
 <3e4b1342-7965-2d80-e28d-0cb728037abd@codeaurora.org>
 <CAL_JsqJ3R0Y-KPKaknVT=+RTAskGhqmarb=i9ZDyX5-LzoFOjg@mail.gmail.com>
 <fb73ec1e-e5b9-239b-737b-a687f65283d3@codeaurora.org>
 <CAL_JsqK3uMatLbOeGH=Nm9zMz85FrEN85rPKQBu48x8rEN4C4Q@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <4ed37ec1-a3b3-28cb-c36e-196a9ef38400@codeaurora.org>
Date:   Tue, 12 Nov 2019 15:03:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK3uMatLbOeGH=Nm9zMz85FrEN85rPKQBu48x8rEN4C4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/12/2019 2:18 PM, Rob Herring wrote:
> On Tue, Nov 12, 2019 at 1:38 PM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 11/12/2019 11:37 AM, Rob Herring wrote:
>>> On Tue, Nov 12, 2019 at 10:25 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>>>
>>>> On 11/11/2019 5:44 PM, Rob Herring wrote:
>>>>> On Fri, Nov 08, 2019 at 04:17:16PM -0700, Jeffrey Hugo wrote:
>>>>>> The global clock controller on MSM8998 can consume a number of external
>>>>>> clocks.  Document them.
>>>>>>
>>>>>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>>>>> ---
>>>>>>     .../devicetree/bindings/clock/qcom,gcc.yaml        | 47 +++++++++++++++-------
>>>>>>     1 file changed, 33 insertions(+), 14 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>>>>>> index e73a56f..2f3512b 100644
>>>>>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>>>>>> @@ -40,20 +40,38 @@ properties:
>>>>>>            - qcom,gcc-sm8150
>>>>>>
>>>>>>       clocks:
>>>>>> -    minItems: 1
>>>>>
>>>>> 1 or 2 clocks are no longer allowed?
>>>>
>>>> Correct.
>>>>
>>>> The primary reason is that Stephen indicated in previous discussions
>>>> that if the hardware exists, it should be indicated in DT, regardless if
>>>> the driver uses it.  In the 7180 and 8150 case, the hardware exists, so
>>>> these should not be optional.
>>>
>>> Agreed. The commit message should mention this though.
>>
>> Fair enough, will do.
>>
>>>
>>>>
>>>> The secondary reason is I found that the schema was broken anyways.  In
>>>> the way it was written, if you implemented sleep, you could not skip
>>>> xo_ao, however there is a dts that did exactly that.
>>>
>>> If a dts can be updated in a compatible way, we should do that rather
>>> than carry inconsistencies into the schema.
>>>
>>>> The third reason was that I couldn't find a way to write valid yaml to
>>>> preserve the original meaning.  when you have an "items" as a subnode of
>>>> "oneOf", you no longer have control over the minItems/maxItems, so all 3
>>>> became required anyways.
>>>
>>> That would be a bug. You're saying something like this doesn't work?:
>>>
>>> oneOf:
>>>     - minItems: 1
>>>       maxItems: 3
>>>       items:
>>>         - const: a
>>>         - const: b
>>>         - const: c
>>
>> Yes.  That specifically won't work.  "items" would need to have the dash
>> preceding it, otherwise it won't compile if you have more than one.  But
>> ignoring that, yes, when it compiled, and I saw the output from the
>> check failing (after adding verbose mode), min and max for the items
>> list would be 3, and the check would fail.
> 
> A '-' before items would make oneOf have 2 separate schemas. That
> would pass with any values for 1-3 items except it would fail for 3
> items with [a, b, c] because 2 oneOf clauses pass.

What I was trying to do was something like:

oneOf:
     -minItems: 1
     -maxItems: 3
     -items:
       -const: a
       -const: b
       -const: c
     -items:
       -const: x
       -const: y
       -const: z

Where you have to have either [x, y, z] xor a set from [a, b, c].  One 
of the two items lists, where min/max is applied to the first one.  "-" 
on both of the items is needed since you can't seem to have the same tag 
more than one at the same scope level.

Probably this was a flawed idea from the start.

> 
>>>>    I find it disappointing that the "version" of
>>>> Yaml used for DT bindings is not documented,
>>>
>>> Not sure which part you mean? json-schema is the vocabulary which has
>>> a spec. The meta-schema then constrains what the json-schema structure
>>> should look like. That's still evolving a bit as I try to improve it
>>> based on mistakes people make. Then there's the intermediate .dt.yaml
>>> format used internally. That's supposed to stay internal and may go
>>> away when/if we integrate the validation into dtc.
>>
>> So, this is probably off-topic, but hopefully you'll find this useful.
> 
> I'm interested in knowing the pain points.
> 
>> I'm probably in the minority, but I really haven't used json-schema nor
>> yaml before.  I have experience with other "schema" languages, so I
>> figured I could pick what I need from the documentation.
> 
> Well, json-schema was new to me before this. There's definitely some
> things I really don't love about it, but it's better than trying to
> define our own language. It's generally been able to handle some of
> the more complex cases.
> 
>> The only documentation I see is writing-schema.md and example-schema.yaml
>>
>> To me, writing-schema.md is insufficient.  Its better than nothing, so
>> I'm still glad it exists, but I don't have any confidence I can really
>> write a binding yaml from scratch based on it.  It does a good thing by
>> telling you what are important properties of a binding, so based on that
>> you can kind of start to understand how existing bindings actually work.
>>    Its great in telling you how to run the validation checks (the Running
>> checks) section.  The dependencies section is awesome from my
>> perspective - most projects seem to assume you just know what their
>> dependencies are, and its painful to try to figure them out when you get
>> cryptic errors during make.
>>
>> Where it really fails is that I get no sense of the language.  As a
>> minimum a lexigraphic specification that would allow me to write a
>> compiler (I've done this before).  Then I would understand what are the
>> keywords, and where they are valid.  I wouldn't understand what they
>> mean, but at-least I can look at some implemented examples and
>> extrapolate from there.
>>
>> Have you by chance ever looked at the ACPI spec?  Maybe not the best
>> example, but its the one that comes to my mind first.  ACPI has ACPI
>> Source Language (ASL).  Its an interpreted hardware description language
>> that doesn't match yaml, but I think the ACPI spec does a reasonable job
>> of describing it.  You have a lexographic definition which seems to be
>> really helpful to ACPICA in implementing the intrepreter.  It lists all
>> of the valid operators, types, etc.  It provides detailed references of
>> each keyword - how they are used, what they do, etc.  Its not the
>> greatest at "how to write ASL 101" or "these are common problems that
>> people face, and how they can be solved", but atleast with what there
>> is, I could read every keyword that seems to be possibly related to what
>> I want to do, and hazard a guess if it would work for my problem.
> 
> I have not read the ACPI spec.
> 
>> Perhaps that is outside the scope of the writing-schema.md document,
>> that is fair.  However, I argue that the document does not provide
>> sufficient references.  The document provides a reference to the
>> json-schema spec, but the spec is kinda useless (atleast I feel that it
>> is).  "minItems" is not defined anywhere in the spec.  What does it
>> mean?  How can I use it?  Specific to minItems/maxItems, I'll I've
>> gathered about it is from example-schema.yaml which indicates its a way
>> to identify mandatory and optional values for a property, but it doesn't
>> describe the fact that order matters, and you cannot mix/match things -
>> IE it looks like you need atleast min items, and at most max items, but
>> even if you have enough items to satisfy min, there cannot be gaps (you
>> can't pick items 1, 5, 10 from the list).  I only found that out from
>> running the validation checks with trial/error.
> 
> I think you looked at the 'Core' spec rather than the 'Validation' spec:
> http://json-schema.org/draft/2019-09/json-schema-validation.html
> 
> Though that has moved on to a newer version and we're still on draft7
> which is here:
> https://tools.ietf.org/html/draft-handrews-json-schema-validation-01

Yes, that looks completely different than what I read.  Thanks for the 
direct link.  I'm going to go read it.

> 
> I guess a direct link to this with 'Details on json-schema keywords is
> here' would be helpful.

Yes please.  Or atleast a "Hey, there are actually two specs, 'core' and 
'validation'. The 'validation' one is the relevant one.  Hopefully that 
clarifies any confusion"

> 
> minItems/maxItems is the one area we deviate from json-schema
> defaults. That's what the 'Property Schema' section calls out.
> 
> Order matters for DT too, so that aspect matches up well with
> json-schema. That's been a common issue in dts files, so schema
> starting to enforce that will be good for new bindings, but somewhat
> painful for existing ones.

You are right, order does matter in DT.  I think I've gotten used to 
just having -names, and assuming if a, b, c, and d are all listed as 
optional, that means you could have a and c.  However that kind of 
breaks the index mapping, so if you have c, you really need a and b as 
well.  I was attempting to apply that concept to schema, and it wasn't 
working.  I suspect that concept shouldn't be valid normally.

> 
>> There is no reference to the yaml spec, despite the document stating
>> that the bindings are written in yaml.
>>
>> However, having found the yaml spec, its really not much better than the
>> json-schema spec, and it doesn't line up because as the document states,
>> the bindings are not really written in yaml - its a subset of yaml where
>> a ton of the boilerplate "code" is skipped.
> 
> Yeah, there's a lot to YAML that no one uses and I too find the spec
> pretty useless (hence why no reference). Like most other uses I've
> encountered, we're using a JSON compatible subset which is just lists
> and dicts of key/value pairs. The main thing folks need to know and
> trip up on are: indentation is important (including no tabs) and pay
> attention to '-' or lack of.
> 
>> What is boilerplate that is skipped?  IMO, if you are not strictly
>> adhering to yaml, then you need to clearly document your own derivative
>> language so that someone like me whom is being introduced to all of this
>> for the first time can start to figure out some of it.  It would be
>> helpful to look at other yaml examples, and understand what is
>> considered to be boilerplate so I can translate that to a DT binding.
> 
> We're not skipping any boilerplate. We're not using advanced features
> like tags or anchors. You can use any YAML parser including online
> ones to read the files.

Ok, so I feel like I've misunderstood this except from writing-schema.md:

"The Devicetree schemas don't exactly match the YAML encoded DT data 
produced by dtc. They are simplified to make them more compact and avoid 
a bunch of boilerplate."

I thought this meant the bindings were simplified to be more readable, 
by skipping boilerplate text.  What does it actually mean?

> 
>> I understand, the majority of the above is complaints and demands which
>> is really not fair to you, since you are spending what I presume to be
>> your "non-dayjob" time to make the community better.
> 
> It's my day job or part of it, just not enough hours in the day...
> 
>> However, I don't
>> really know how to contribute to make the documentation better.  I don't
>> understand enough.  As far as this topic is concerned, I'm a dumb monkey
>> banging on a keyboard hoping to get close enough to Shakespeare to pass
>> mustard by accident, and maybe learn something along the way so that
>> next time, I might have an idea of how to do something of what I need.
> 
> The challenge is providing enough information to write bindings
> without being json-schema experts. My hope is really to build up
> enough examples and make the meta-schema good enough to keep folks
> within the lines. Maybe that's a flawed approach, but even getting
> folks to follow writing-schema.rst and run 'make dt_binding_check' has
> been a challenge.
> 
>> Hopefully you've made it this far - that ended up being a lot more text
>> that I thought it would be.  I really hope this is useful feedback to
>> you, but let me know if I am still not clear on something.  I will try
>> my best to clarify more.  If you feel like I can contribute somehow,
>> just let me know.
>>
>>>
>>>> so after several hours of
>>>> trial and error, I just gave up since I found this to work (failed cases
>>>> just gave me an error with no indication of what was wrong, not even a
>>>> line number).
>>>
>>> Schema failures or dts failures? It is possible to get line numbers
>>> for either, but that makes validation much slower. In the latter case,
>>> the line numbers aren't too useful either given they are for the
>>> .dt.yaml file and not the .dts source file (dtc integration would
>>> solve that). Adding '-n' to dt-doc-validate or dt-validate will turn
>>> them on though.
>>
>> Schema compilation failures.  I don't recall the exact error message,
>> but it was something like "no valid schema found, continuing".
>> Essentially running "dt_binding_check".  I tried with -v but wasn't
>> getting much more in this case.  I didn't try -n.
> 
> That's before we even validate the schema, so something has gone wrong
> pretty early. You may get farther with 'make -k'. I'll have to look
> into it. The schemas are actually built twice. They are all built into
> processed-schema.yaml. That's supposed to skip any with errors and is
> what's used to validate dts files. If that's failing for some reason,
> then it's going to be pretty vague. The dt_binding_check rule also
> fully validates each binding schema and builds and validates the
> examples. It should print more detailed errors (though still sometimes
> vague).
> 
> Rob
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
