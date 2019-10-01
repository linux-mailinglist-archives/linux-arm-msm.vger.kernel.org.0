Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A31C3A1E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 18:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbfJAQOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 12:14:00 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40500 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfJAQOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 12:14:00 -0400
Received: by mail-io1-f67.google.com with SMTP id h144so49347003iof.7;
        Tue, 01 Oct 2019 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RQBf46agUgTnW8PYnwm3xoRrOXb5piikgXFBHNbVikc=;
        b=QnOYD3djDxO8fg6yb4B52P4HwdD+HJkKlYJVZwEmSqsgwwqEoZN+O9b+rew9dYRfDb
         ASd8fnG5FTD6VYQMeeCnT+S/OFv2VFOQNjQERRVIAMs8CTxwd8bMpUbRaP7Jz/PAgDXw
         SGyAu9X67C4Nj0ZlwKBG3pOFchluO1xAt4QdzHroo11o1PLwAB3/aP7jBWqtE14iSP3r
         Bxj2ENGkSfBgH4sRPQYmaCHi+7W3t3obzDKpB83JA5KncZTg8IGKuAidr37mjk7q7+Xa
         O6hI4rAtQ2HZZB9gzX0iBHLGuyJAT4lNKYtXfP7DY8PQK6or9pr3azMsCIoXlIronAoK
         7F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RQBf46agUgTnW8PYnwm3xoRrOXb5piikgXFBHNbVikc=;
        b=Oe49VpMQfa0vniwxQGV1Al4vXI5MfJBRj+jiUp8ROtBUIulDCeoXjJXtHxyHvTo1MA
         ddG8Pf5cotn9OuOdt+1sMNvwOIRh+6h+HPAU0vYOzDcQHMZcX8IHlXXT5Pmv0LLg3lqv
         fg1XGVzOYqHdqwju/5paHXsjp1sF9Tr2AAdZV8HL184aYxKLT2LrvZbPbT7NimlJ7+Mb
         jv5KS3qn7SQ+wYnupHnALWid0w/Rh6h1QPtI0K6WqIko0m/GD8Hz/SzsREAIuLfPGfll
         jytSjwNm26ivR8endjt/w+6CwEiBnNAs+CRE0bg5J51mRU8i1lrVkVfJajpZWD3dxK/+
         fJ1g==
X-Gm-Message-State: APjAAAUR3uRzlCiw36IrsQtVBVOBDLvkhYoYEQIxXOd8uJ82KQEys6LZ
        ls6D92zz4Ih7QNlqJgrzD6kR5LvGkSiOLAYstnI=
X-Google-Smtp-Source: APXvYqxVpMHysfbhK1Ax6DTvXrK2vO3Bsu/QNe+hST+Ro1DdMQ1hCtntdSwY95p8PW3HukLh5wPnI+YXsOCKIdPdr4U=
X-Received: by 2002:a05:6e02:6cb:: with SMTP id p11mr25365344ils.33.1569946439000;
 Tue, 01 Oct 2019 09:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org> <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 1 Oct 2019 10:13:47 -0600
Message-ID: <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sai,

This patch breaks boot on the 835 laptops.  However, I haven't seen
the same issue on the MTP.  I wonder, is coresight expected to work
with production fused devices?  I wonder if thats the difference
between the laptop and MTP that is causing the issue.

Let me know what I can do to help debug.

On Tue, Jul 30, 2019 at 11:59 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Enable coresight support by adding device nodes for the
> available source, sinks and channel blocks on MSM8998.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 435 ++++++++++++++++++++++++++
>  1 file changed, 435 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index c13ed7aeb1e0..ad661fcc9e1b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -822,6 +822,441 @@
>                         #interrupt-cells = <0x2>;
>                 };
>
> +               stm@6002000 {
> +                       compatible = "arm,coresight-stm", "arm,primecell";
> +                       reg = <0x06002000 0x1000>,
> +                             <0x16280000 0x180000>;
> +                       reg-names = "stm-base", "stm-data-base";
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       out-ports {
> +                               port {
> +                                       stm_out: endpoint {
> +                                               remote-endpoint = <&funnel0_in7>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@6041000 {
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +                       reg = <0x06041000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       out-ports {
> +                               port {
> +                                       funnel0_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&merge_funnel_in0>;
> +                                       };
> +                               };
> +                       };
> +
> +                       in-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@7 {
> +                                       reg = <7>;
> +                                       funnel0_in7: endpoint {
> +                                               remote-endpoint = <&stm_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@6042000 {
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +                       reg = <0x06042000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       out-ports {
> +                               port {
> +                                       funnel1_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&merge_funnel_in1>;
> +                                       };
> +                               };
> +                       };
> +
> +                       in-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@6 {
> +                                       reg = <6>;
> +                                       funnel1_in6: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_merge_funnel_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@6045000 {
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +                       reg = <0x06045000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       out-ports {
> +                               port {
> +                                       merge_funnel_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etf_in>;
> +                                       };
> +                               };
> +                       };
> +
> +                       in-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       merge_funnel_in0: endpoint {
> +                                               remote-endpoint =
> +                                                 <&funnel0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       merge_funnel_in1: endpoint {
> +                                               remote-endpoint =
> +                                                 <&funnel1_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               replicator@6046000 {
> +                       compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +                       reg = <0x06046000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       out-ports {
> +                               port {
> +                                       replicator_out: endpoint {
> +                                               remote-endpoint = <&etr_in>;
> +                                       };
> +                               };
> +                       };
> +
> +                       in-ports {
> +                               port {
> +                                       replicator_in: endpoint {
> +                                               remote-endpoint = <&etf_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etf@6047000 {
> +                       compatible = "arm,coresight-tmc", "arm,primecell";
> +                       reg = <0x06047000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       out-ports {
> +                               port {
> +                                       etf_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&replicator_in>;
> +                                       };
> +                               };
> +                       };
> +
> +                       in-ports {
> +                               port {
> +                                       etf_in: endpoint {
> +                                               remote-endpoint =
> +                                                 <&merge_funnel_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etr@6048000 {
> +                       compatible = "arm,coresight-tmc", "arm,primecell";
> +                       reg = <0x06048000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +                       arm,scatter-gather;
> +
> +                       in-ports {
> +                               port {
> +                                       etr_in: endpoint {
> +                                               remote-endpoint =
> +                                                 <&replicator_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etm@7840000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x07840000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU0>;
> +
> +                       out-ports {
> +                               port {
> +                                       etm0_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel_in0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etm@7940000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x07940000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU1>;
> +
> +                       out-ports {
> +                               port {
> +                                       etm1_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel_in1>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etm@7a40000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x07a40000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU2>;
> +
> +                       out-ports {
> +                               port {
> +                                       etm2_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel_in2>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etm@7b40000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x07b40000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU3>;
> +
> +                       out-ports {
> +                               port {
> +                                       etm3_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel_in3>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@7b60000 { /* APSS Funnel */
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x07b60000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       out-ports {
> +                               port {
> +                                       apss_funnel_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_merge_funnel_in>;
> +                                       };
> +                               };
> +                       };
> +
> +                       in-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       apss_funnel_in0: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etm0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       apss_funnel_in1: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etm1_out>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +                                       apss_funnel_in2: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etm2_out>;
> +                                       };
> +                               };
> +
> +                               port@3 {
> +                                       reg = <3>;
> +                                       apss_funnel_in3: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etm3_out>;
> +                                       };
> +                               };
> +
> +                               port@4 {
> +                                       reg = <4>;
> +                                       apss_funnel_in4: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etm4_out>;
> +                                       };
> +                               };
> +
> +                               port@5 {
> +                                       reg = <5>;
> +                                       apss_funnel_in5: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etm5_out>;
> +                                       };
> +                               };
> +
> +                               port@6 {
> +                                       reg = <6>;
> +                                       apss_funnel_in6: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etm6_out>;
> +                                       };
> +                               };
> +
> +                               port@7 {
> +                                       reg = <7>;
> +                                       apss_funnel_in7: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etm7_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@7b70000 {
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +                       reg = <0x07b70000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       out-ports {
> +                               port {
> +                                       apss_merge_funnel_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&funnel1_in6>;
> +                                       };
> +                               };
> +                       };
> +
> +                       in-ports {
> +                               port {
> +                                       apss_merge_funnel_in: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etm@7c40000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x07c40000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU4>;
> +
> +                       port{
> +                               etm4_out: endpoint {
> +                                       remote-endpoint = <&apss_funnel_in4>;
> +                               };
> +                       };
> +               };
> +
> +               etm@7d40000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x07d40000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU5>;
> +
> +                       port{
> +                               etm5_out: endpoint {
> +                                       remote-endpoint = <&apss_funnel_in5>;
> +                               };
> +                       };
> +               };
> +
> +               etm@7e40000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x07e40000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU6>;
> +
> +                       port{
> +                               etm6_out: endpoint {
> +                                       remote-endpoint = <&apss_funnel_in6>;
> +                               };
> +                       };
> +               };
> +
> +               etm@7f40000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x07f40000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU7>;
> +
> +                       port{
> +                               etm7_out: endpoint {
> +                                       remote-endpoint = <&apss_funnel_in7>;
> +                               };
> +                       };
> +               };
> +
>                 spmi_bus: spmi@800f000 {
>                         compatible = "qcom,spmi-pmic-arb";
>                         reg =   <0x800f000 0x1000>,
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
