Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F87344FB53
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 20:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbhKNTxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Nov 2021 14:53:37 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:57382 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236510AbhKNTuL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Nov 2021 14:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636919238; x=1668455238;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=4C0I4YERPpT7n947dVQeZpCOPyoTOARzQaqepHDnkYg=;
  b=YjXEuOTw1x8Ug7tpQirsfNWPFF1E8wHnR2T1vl9Q04YRzgtmduq0qzNh
   p45i4mS6ctD9aYi7+5KXc38Dr4Za0OjCJdk9AVCxSHOpLmZHFX4/h0Ecx
   wWRUeEwhFTLy6gfTZXKVeY1bi5zvFbzL5+DnPiGIfaWAHEsffv8bY9yZ1
   Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Nov 2021 11:47:13 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2021 11:47:11 -0800
Received: from [10.110.80.240] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Sun, 14 Nov
 2021 11:47:12 -0800
Subject: Re: [PATCH 13/16] arm64: dts: qcom: Add support for Xperia 1 III / 5
 III
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
CC:     <martin.botka@somainline.org>,
        <angelogioacchino.delregno@somainline.org>,
        <marijn.suijten@somainline.org>, <jamipkettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
 <20211114012755.112226-13-konrad.dybcio@somainline.org>
From:   Trilok Soni <quic_tsoni@quicinc.com>
Message-ID: <51341a10-c0a5-079e-b7f1-159d42211bf3@quicinc.com>
Date:   Sun, 14 Nov 2021 11:47:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211114012755.112226-13-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

On 11/13/2021 5:27 PM, Konrad Dybcio wrote:
> 
> Then, you need to flash it on the device and get rid of all the
> vendor_boot/dtbo mess:
> 
> fastboot flash boot boot.img-sony-xperia-pdx215
> fastboot erase vendor_boot
> fastboot flash dtbo emptydtbo.img
> fastboot reboot
> 
> Where emptydtbo.img is a tiny file that consists of 2 bytes (all zeroes), doing
> a "fastboot erase" won't cut it, the bootloader will go crazy and things will
> fall apart when it tries to overlay random bytes from an empty partition onto a
> perfectly good appended DTB.


I will check on this part and see if we can make simpler support 
fastboot erase dtbo without the extra emptydtbo.

---Trilok Soni


