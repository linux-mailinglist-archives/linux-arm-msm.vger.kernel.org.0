Return-Path: <linux-arm-msm+bounces-2865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6E08007F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 11:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECEA4B210D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D546A20330;
	Fri,  1 Dec 2023 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vzxTFGcZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58849F1
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 02:09:49 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b4a8db331so18234465e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 02:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701425388; x=1702030188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKEaUiZTxlPwx3QPN7jIyXfy5Uw4NLWZUGDodKGb1pE=;
        b=vzxTFGcZ5eHxP4mZxAvtZxY18WSBWLIgSnCp+HQTkBKNq7lCrpdTyoCL4dMSkqU9f8
         uhcikQIAup6Gyc92VXI45IHO7ag9AmTO9U4ObjdesnO5TS+azqm3RL7xKDWNr52Yu5JU
         mSDpnw3rbAg+rYwd3PoH7EU1ppKZ2/K1Q1aaP+JYPfMymFipAhTgRk3ogLsu/HHRaCzZ
         PgFEZbItj8S6EZaulFzpUNJuGSKMzR+84JvMxJzu0MZA+28w/SjVByqm6DxeFRT0uvPA
         hG00NtXqIvt03eK6NJZg6IIYXrMJL1Sjp85dpARlOH2u/MPWgGQ0iuzjDUqv/TvNJhGf
         bI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701425388; x=1702030188;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zKEaUiZTxlPwx3QPN7jIyXfy5Uw4NLWZUGDodKGb1pE=;
        b=PBhtezS51edOl26D0bVsq1CrRdfOt98qALnuvmwRUZNhy+I0PSTx7xHfhtOcwvSPqv
         drhyAjjaUumFnP3fPq3s+9CN76XFn5F24dw6TaNn5omW0tWydejrYb5OryPhREeB5mwN
         +ewTFlEmy0AkdEKqLmKyPRJ7UgeJXzwsHi21hLgeFFysu8Lzq5SSz5bZ8gO9zSc+8u+m
         T5OYIJLouSRT8y4OOtZVXopOQkqvEjtp8/ksgOozhj3YOkYchJrpQVZF3TNH7FNAfLz6
         h+TKXcOXg1Sl1T6MzcNaqd/mTOqg3Lc9dnQEa1Rmrw+6AQZ4aCgDuYa76YeGzfJsqosy
         dDTA==
X-Gm-Message-State: AOJu0Ywp/BChQ1mYj5+4dEJsXKD4OWiypEyt4KsT1MqCQxI2QJMBAs9Z
	TthoJrhfN8mcrdZZmmt2P0My+w==
X-Google-Smtp-Source: AGHT+IENK1vb/UdBtKtDFUa1ipTkO6wrV04e1mWEkYa/5zZ5tqtZqhUqsoK8aEleU+NVAlPqjr8ZMg==
X-Received: by 2002:a1c:4b14:0:b0:40b:5e59:c56d with SMTP id y20-20020a1c4b14000000b0040b5e59c56dmr298559wma.151.1701425386905;
        Fri, 01 Dec 2023 02:09:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:46dc:1c67:6d66:e21? ([2a01:e0a:982:cbb0:46dc:1c67:6d66:e21])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d534a000000b0033326a5b01csm3125805wrv.59.2023.12.01.02.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 02:09:46 -0800 (PST)
Message-ID: <a6651f9f-b060-4195-b83a-b23aa2091a98@linaro.org>
Date: Fri, 1 Dec 2023 11:09:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v7 00/10] Enable HS-G5 support on SM8550
Content-Language: en-US, fr
To: Can Guo <quic_cang@quicinc.com>, bvanassche@acm.org, mani@kernel.org,
 adrian.hunter@intel.com, vkoul@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <1701407001-471-1-git-send-email-quic_cang@quicinc.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <1701407001-471-1-git-send-email-quic_cang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2023 06:03, Can Guo wrote:
> This series enables HS-G5 support on SM8550.
> 
> This series is rebased on below changes from Mani -
> https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-1-manivannan.sadhasivam@linaro.org/
> https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-2-manivannan.sadhasivam@linaro.org/
> 
> This series is tested on below HW combinations -
> SM8550 MTP + UFS4.0
> SM8550 QRD + UFS3.1
> SM8450 MTP + UFS3.1 (for regression test)
> SM8350 MTP + UFS3.1 (for regression test)
> 
> Note that during reboot test on above platforms, I occasinally hit PA (PHY)
> error during the 2nd init, this is not related with this series. A fix for
> this is mentioned in below patchwork -
> 
> https://patchwork.kernel.org/project/linux-scsi/patch/1698145815-17396-1-git-send-email-quic_ziqichen@quicinc.com/
> 
> Also note that on platforms, which have two sets of UFS PHY settings are
> provided (say G4 and no-G4, G5 and no-G5). The two sets of PHY settings are
> basically programming different values to different registers, mixing the
> two sets and/or overwriting one set with another set is definitely not
> blessed by UFS PHY designers. For SM8550, this series will make sure we
> honor the rule. However, for old targets Mani and I will fix them in
> another series in future.
> 
> v6 -> v7:
> 1. Rebased on linux-next, based SM8650 PHY settings are merged there, no changes to patches for UFS driver
> 2. Addressed comments from Mani
> 
> v5 -> v6:
> 1. Rebased on scsi-queue-6.8
> 2. Addressed comments from Dmitry and Mani in patches to phy-qcom-qmp-ufs.c
> 
> v4 -> v5:
> Removed two useless debug prints in patch #9
> 
> v3 -> v4:
> Used .tbls_hs_overlay array instead of adding more tables with different names like .tbls_hs_g5
> 
> v2 -> v3:
> 1. Addressed comments from Andrew, Mani and Bart in patch #1
> 2. Added patch #2 as per request from Andrew and Mani
> 3. Added patch #4 to fix a common issue on old targets, it is not necessary
>     for this series, but put in this series only because it would be easier
>     to maintain and no need to rebase
> 4. Addressed comments from Dmitry and Mani in patches to phy-qcom-qmp-ufs.c
> 
> v1 -> v2:
> 1. Removed 2 changes which were exposing power info in sysfs
> 2. Removed 1 change which was moving data structs to phy-qcom-qmp-ufs.h
> 3. Added one new change (the 1st one) to clean up usage of ufs_dev_params based on comments from Mani
> 4. Adjusted the logic of UFS device version detection according to comments from Mani:
> 	4.1 For HW version < 0x5, go through dual init
>   	4.2 For HW version >= 0x5
> 		a. If UFS device version is populated, one init is required
> 		b. If UFS device version is not populated, go through dual init
> 
> Bao D. Nguyen (1):
>    scsi: ufs: ufs-qcom: Add support for UFS device version detection
> 
> Can Guo (9):
>    scsi: ufs: host: Rename structure ufs_dev_params to ufs_host_params
>    scsi: ufs: ufs-qcom: No need to set hs_rate after
>      ufshcd_init_host_param()
>    scsi: ufs: ufs-qcom: Setup host power mode during init
>    scsi: ufs: ufs-qcom: Allow the first init start with the maximum
>      supported gear
>    scsi: ufs: ufs-qcom: Limit HS-G5 Rate-A to hosts with HW version 5
>    scsi: ufs: ufs-qcom: Set initial PHY gear to max HS gear for HW ver 4
>      and newer
>    scsi: ufs: ufs-qcom: Check return value of phy_set_mode_ext()
>    phy: qualcomm: phy-qcom-qmp-ufs: Rectify SM8550 UFS HS-G4 PHY Settings
>    phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed Gear 5 support for
>      SM8550
> 
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h     |   2 +
>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   2 +
>   .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |   9 +
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 191 ++++++++++++++++++---
>   drivers/ufs/host/ufs-exynos.c                      |   7 +-
>   drivers/ufs/host/ufs-hisi.c                        |  11 +-
>   drivers/ufs/host/ufs-mediatek.c                    |  12 +-
>   drivers/ufs/host/ufs-qcom.c                        |  97 ++++++++---
>   drivers/ufs/host/ufs-qcom.h                        |   7 +-
>   drivers/ufs/host/ufshcd-pltfrm.c                   |  69 ++++----
>   drivers/ufs/host/ufshcd-pltfrm.h                   |  10 +-
>   11 files changed, 309 insertions(+), 108 deletions(-)
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

Thanks,
Neil

