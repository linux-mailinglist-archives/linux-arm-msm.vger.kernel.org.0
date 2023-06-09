Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC10F729D32
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 16:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241473AbjFIOp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 10:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241573AbjFIOpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 10:45:23 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A5FF43A82;
        Fri,  9 Jun 2023 07:45:20 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 704FFAB6;
        Fri,  9 Jun 2023 07:46:05 -0700 (PDT)
Received: from [10.57.85.120] (unknown [10.57.85.120])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30E6D3F663;
        Fri,  9 Jun 2023 07:45:17 -0700 (PDT)
Message-ID: <2881f374-70e2-0057-f43e-7be12d32ae22@arm.com>
Date:   Fri, 9 Jun 2023 15:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sa8775p: Add interconnect to SMMU
Content-Language: en-GB
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
 <79206b05-674b-1f6c-6eb1-ed45e6bd5637@linaro.org>
 <20230609125631.GA29252@hu-ppareek-blr.qualcomm.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230609125631.GA29252@hu-ppareek-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-09 13:56, Parikshit Pareek wrote:
> On Fri, Jun 09, 2023 at 10:52:26AM +0200, Konrad Dybcio wrote:
>>
>>
>> On 9.06.2023 07:41, Parikshit Pareek wrote:
>>> Some qcom SoCs have SMMUs, which need the interconnect bandwidth to be
>>> This series introduce the due support for associated interconnect, and
>>> setting of the due interconnect-bandwidth. Setting due interconnect
>>> bandwidth is needed to avoid the issues like [1], caused by not having
>>> due clock votes(indirectly dependent upon interconnect bandwidth).
>>
>> [1] ???
> 
> My bad. Intended to mention following:
> https://lore.kernel.org/linux-arm-msm/20230418165224.vmok75fwcjqdxspe@echanude/

This sounds super-dodgy - do you really have to rely on configuration of 
the interconnect path from the SMMU's pagetable walker to RAM to keep a 
completely different interconnect path clocked for the CPU to access 
SMMU registers? You can't just request the programming interface clock 
directly like on other SoCs?

Thanks,
Robin.
