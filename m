Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB8B3F372D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Aug 2021 01:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237700AbhHTXGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 19:06:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62558 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238262AbhHTXGI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 19:06:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629500730; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4ZKMCQcexjJwxhWd6BqVU1CcnFVQEgDifWbQuHUjp1Y=;
 b=li944x05cLWckVFuiOAEOGcuzYj/vlLPkZbCTu49zxU4rgawZWmWcQwXetv4fIjnijNTsdaM
 zU9xTqBilPDRWPkEhiPeWlnRWcpsnZNAtkIOlMvQSTvfjY12K8v9OdSAtKTFD65EHNK70G1P
 UaUc/x6ZQhjb5q/PryUgKheX63U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6120352f0f9b337f1140d78f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 23:05:19
 GMT
Sender: amartora=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 51239C43617; Fri, 20 Aug 2021 23:05:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: amartora)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2337C4338F;
        Fri, 20 Aug 2021 23:05:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 20 Aug 2021 16:05:16 -0700
From:   amartora@codeaurora.org
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Wei Liu <wei.liu@kernel.org>
Subject: Re: [RFC v2] soc: qcom: socinfo.rs: Add Rust Socinfo Driver
 implementation
In-Reply-To: <CANiq72=QzrN=Mo5M377ijeTy0ZV-7r33UCRXB1JyQLx0Z9KdWQ@mail.gmail.com>
References: <1629163412-157074-1-git-send-email-amartora@codeaurora.org>
 <1629488333-305361-1-git-send-email-amartora@codeaurora.org>
 <CANiq72=QzrN=Mo5M377ijeTy0ZV-7r33UCRXB1JyQLx0Z9KdWQ@mail.gmail.com>
Message-ID: <ae9f0f52aab5f746a31fa1c232cea41a@codeaurora.org>
X-Sender: amartora@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Just CC'ing the recipients who were missed, and thank you for all the 
feedback
  its much appreciated.

Cheers,
Antonio Martorana

On 2021-08-20 15:18, Miguel Ojeda wrote:
> Hi Antonio,
> 
> Thanks again for working on this.
> 
> On Fri, Aug 20, 2021 at 9:39 PM Antonio Martorana
> <amartora@codeaurora.org> wrote:
>> 
>> V2: Addressed formating issues, added conditional compilation to 
>> debug_fs
>> variables, fixed Kconfig, and still working on removing references to 
>> bindings::
>> by abstracting FFI functions through rust/ .
> 
> Normally the changelog goes outside the commit message, i.e. after 
> `---`.
> 
>> +/// SoC version type with major number in the upper 16 bits and minor
>> +/// number in the lower 16 bits.
>> +
>> +const fn socinfo_major(ver: u32) -> u32 {
> 
> Doc comments should "touch" the function they document. But using
> `///` like shown here would document only `socinfo_major`, and what
> the comment says is not really the function documentation. What I
> meant in v1 is that perhaps you can find a better way to document all
> of them, or none.
> 
> Given `socinfo_version` is not used, I would remove that one, and put
> "// The upper 16 bits are the major." and "// The lower 16 bits are
> the minor." as normal comments inside the function body. Even better,
> you could create a `SocInfoVersion` type.
> 
>> +    ///
>> +    /// SMEM Image table indices
>> +    ///
> 
> No empty comment lines before/after, please. In addition, `///` is a
> doc comment, not a normal comment. You are trying to give a heading
> for a set of `const`s, not document the first one.
> 
> We should add a lint for the former, and probably we could also try
> one for the latter, too...
> 
>> +#[cfg(CONFIG_DEBUG_FS)]
>> +const PMIC_MODELS: [&str; 37] = [
> 
> This is fine, but since you have created a `config_debug_fs` module,
> perhaps you could move everything inside it.
> 
> Related: perhaps the name for that module could be something simpler,
> like `debugfs`.
> 
>> +    unsafe {
>> +        let ref_mut_seq_priv = seq_private.as_mut().unwrap();
>> +    }
> 
> The `// SAFETY: ` comments in several places are missing.
> 
>> +fn qcom_show_pmic_model(seq: &mut bindings::seq_file, p: &mut 
>> c_types::c_void) -> Result {
> 
> Several of these functions cannot fail -- so why `Result`?
> 
> ...ah, I see, you are panicking now -- but then you don't need the
> `Result`. If this was userspace and you were not expecting a failure,
> then yes, panic might have been a good idea. However, here we are
> supposed to return the error like you did in v1. When I mentioned you
> should use `Result`, it means you should return the `EINVAL` as such
> (using the pre-defined error constants we have in
> `rust/kernel/error.rs`, which are in the prelude for ease-of-use, see
> e.g. 
> https://rust-for-linux.github.io/docs/kernel/prelude/struct.Error.html).
> 
>> +    // SAFETY: `socinfo` is guaranteed to be:
>> +    // - A valid (and instalized), non-null pointer
>> +    // - Is properly aligned
>> +    // - Adheres to aliasing rules
> 
> The `// SAFETY: ` comment should explain why the callee's
> preconditions hold, not just state them (which does not help much a
> future reader searching for UB).
> 
>> +    unsafe {
>> +        let mut_socinfo = socinfo.as_mut().unwrap();
> 
> As mentioned in v1, `unsafe` blocks should be split and reduced as
> much as possible.
> 
>> +        let test_model = socinfo_minor((*socinfo).pmic_model);
>> +        model = test_model;
> 
> Why is `test_model` there?
> 
>> +    let mut check_valid_model: bool = false;
>> +    if !PMIC_MODELS[model as usize].is_empty() {
>> +        check_valid_model = true;
>> +    }
> 
> Try to avoid mutability where possible, e.g.:
> 
>     let valid_model = !PMIC_MODELS[model as usize].is_empty();
> 
>> +    if model < PMIC_MODELS.len() as u32 && check_valid_model {
> 
> Something looks odd -- we are checking whether the model is within
> `PMIC_MODELS`, but you already used it to index (which is safe, but
> because it will panic if wrong -- which we do not want!).
> 
>> +#[cfg(CONFIG_DEBUG_FS)]
>> +fn qcom_show_pmic_model_array(seq: &mut bindings::seq_file, p: &mut 
>> c_types::c_void) -> Result {
>> +    Ok(())
>> +}
>> +
>> +#[cfg(CONFIG_DEBUG_FS)]
>> +fn qcom_show_pmic_die_revision(seq: &mut bindings::seq_file, p: &mut 
>> c_types::c_void) -> Result {
>> +    Ok(())
>> +}
>> +
>> +#[cfg(CONFIG_DEBUG_FS)]
>> +fn qcom_show_chip_id(seq: &mut bindings::seq_file, p: &mut 
>> c_types::c_void) -> Result {
>> +    Ok(())
>> +}
> 
> Even if not commented out, this is still dead code -- it is best to
> remove it until you implement them.
> 
>> +    fmt: bindings::__le32,
> 
> Same thing about `bindings::` from v1 etc. -- if this were not a proof
> of concept, it should be properly abstracted.
> 
>> +const SOC_ID: [SocId; 105] = [
> 
> For lots of data, it is usually better to use `static` to have a
> single instance somewhere in memory (vs. e.g. inlining).
> 
>> +    SocId {
>> +        id: 87,
>> +        name: c_str!("MSM8960"),
>> +    },
> 
> For repetitive things like this (and especially if the automatic
> formatting makes it look bad!), a local "macro by example" is usually
> a good approach, e.g.:
> 
>     soc_ids!(3,
>          87 "MSM8960"
>         109 "APQ8064"
>         122 "MSM8660A etc etc"
>     );
> 
> or any other syntax you like for the particular case. It looks much
> better, and separates the details of the type from the data table.
> 
> The macro can be something like:
> 
>     macro_rules! soc_ids(
>         ($length:literal, $($id:literal $name:literal)*) => {
>             static SOC_ID: [SocID; $length] = [
>                 $(SocID { id: $id, name: $name },)*
>             ];
>         }
>     );
> 
> https://godbolt.org/z/dWofxYn19 to play with it.
> 
>> +struct SocId {
>> +    id: u32,
>> +    name: &'static str::CStr,
>> +}
> 
> Even if Rust allows otherwise, I would still try to put declarations
> before they are used.
> 
>> +fn socinfo_machine(id: &u32) -> Option<&'static str::CStr> {
> 
> It is simpler to pass an integer as-is, rather than a pointer to it.
> 
>> +    for idx in SOC_ID {
> 
> You probably want `&SOC_ID` here (see the `static` vs. `const`
> discussion above).
> 
>> +        if idx.id == *id {
>> +            return Some(idx.name);
>> +        }
>> +    }
>> +    None
> 
> Loops like this are good candidates for a functional style -- something 
> like:
> 
>     SOC_ID.iter().find(|x| x.id == id).map(|x| x.name)
> 
> Whether this looks better or not, of course, is up for debate ;)
> 
>> +        Ok(drv_data)
>> +    }
>> +    fn remove(device_id: i32, _drv_data: Self::DrvData) -> Result {
> 
> Newline between functions, please.
> 
> Normally we only prefix by underscore if unused.
> 
> Cheers,
> Miguel
