Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65CE46F891C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 20:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbjEES5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 14:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbjEES5x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 14:57:53 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36704729B;
        Fri,  5 May 2023 11:57:52 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345IWdoD010789;
        Fri, 5 May 2023 18:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HoWrg+Srm4AJV5RQTVV2zJW0OqqWslYb+Qe3zFQzxso=;
 b=Gzv8Z6ynuMA0/LyBgAWF19dE/C1rQtgd2vp7xi/MRepjrf7QRgjCC79DfuU+BNQOjP1e
 5W+C4DooQMcOQgJpTqiwnP0H7QWaZO2LdKYkLOgchSdnQ/zlNH4rnGA0D0tUF924cTPi
 105n7nlRqUNUSsqu8IBZFX3H5RnP56bS8ms+zhTh7iyMabJV8u8nTPGXRDKORF3KbVkK
 D7wl0KtG87H6sHVXUO62ry50eOdXWkThoQEvbCCXTcAZMZ14V6ZoKJRTChMhdFRdj8cY
 NrCa+7zoKuif2QdJ7ZH2N3ry0nyhYdRZ855l20UIE8CeyZW91pwu/EiHxHlrKRHu67LP rg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qcmm3acc6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 18:57:45 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345Iviv8008448
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 5 May 2023 18:57:44 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 11:57:43 -0700
Message-ID: <449d9785-02be-f950-9708-ea5c649470ad@quicinc.com>
Date:   Fri, 5 May 2023 11:57:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] drm/msm/dsi: Adjust pclk rate for compression
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-1-6bc6f03ae735@quicinc.com>
 <lq6le3pxya3op2nke53uniusr3chtkmqdfrc7wkv4tylqb2fio@esjoh4f63g5q>
 <hetttr6ug6sbt3g3fwmuqkx5f7betgxtzyuaovo62h5ams3th7@7xbztyqgyrz5>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <hetttr6ug6sbt3g3fwmuqkx5f7betgxtzyuaovo62h5ams3th7@7xbztyqgyrz5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O3tIiheF9HZn5pO1unAQUZUajJsZ2AGs
X-Proofpoint-GUID: O3tIiheF9HZn5pO1unAQUZUajJsZ2AGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_25,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050155
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/4/2023 2:17 PM, Marijn Suijten wrote:
> On 2023-05-04 22:33:17, Marijn Suijten wrote:
>> Title suggestion: use the wording "reduce pclk rate" :)
>>
>> (Eventually "when DSC is enabled", instead of "for compression")
>>
>> On 2023-05-02 18:19:12, Jessica Zhang wrote:
>>> Divide the pclk rate by the compression ratio when DSC is enabled
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>
>> Thank you so much for sending this.   The compression ratio was applied
>> to hdisplay
> 
> In hindsight, on the note of hdisplay, dsi_timing_setup() actually only
> divides the visual portion - that is hdisplay out of htotal - without
> affecting the back and front porch.
> 
> Since this clock inside the mode is based on the full htotal * vtotal *
> ..., should we compensate for that and only divide the visual portion of
> the clock signal by 3?  Otherwise we might not have enough clockticks to
> perform the front and back porch (even though CMD mode doesn't really
> have porches, I have yet to properly understand that part of the
> signal).

Hi Marijn,

That's a fair point. Will change the pclk math accordingly.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> , but not the clocks yet, and with this patch I get a massive
>> reduction in clock speeds on the Xperia XZ3, without regressions nor
>> affecting performance/fps:
>>
>>            gcc_sys_noc_cpuss_ahb_clk       1        1        0    19200000          0     0  50000         Y
>>            gcc_cpuss_ahb_clk           1        1        0    19200000          0     0  50000         Y
>>      bi_tcxo                           6        6        0    19200000          0     0  50000         Y
>>         dsi0vco_clk                    1        1        0  [-1873793994-]{+1249195898+}          0     0  50000         Y
>>            dsi0_pll_out_div_clk        1        1        0   [-1873793994-]{+624597949+}          0     0  50000         Y
>>               dsi0_pll_post_out_div_clk       0        0        0   [-468448498-]{+156149487+}          0     0  50000         Y
>>               dsi0_pll_bit_clk         2        2        0   [-1873793994-]{+624597949+}          0     0  50000         Y
>>                  dsi0_pclk_mux         1        1        0   [-1873793994-]{+624597949+}          0     0  50000         Y
>>                     dsi0_phy_pll_out_dsiclk       1        1        0   [-312298999-]{+104099659+}          0     0  50000         Y
>>                        disp_cc_mdss_pclk0_clk_src       1        1        0   [-312298999-]{+104099659+}          0     0  50000         Y
>>                           disp_cc_mdss_pclk0_clk       1        1        0   [-312298999-]{+104099659+}          0     0  50000         Y
>>                  dsi0_pll_by_2_bit_clk       0        0        0   [-936896997-]{+312298974+}          0     0  50000         Y
>>                  dsi0_phy_pll_out_byteclk       1        1        0    [-234224249-]{+78074743+}          0     0  50000         Y
>>                     disp_cc_mdss_byte0_clk_src       2        2        0    [-234224249-]{+78074743+}          0     0  50000         Y
>>                        disp_cc_mdss_byte0_div_clk_src       1        1        0    [-117112125-]{+39037372+}          0     0  50000         Y
>>                           disp_cc_mdss_byte0_intf_clk       1        1        0    [-117112125-]{+39037372+}          0     0  50000         Y
>>                        disp_cc_mdss_byte0_clk       1        1        0    [-234224249-]{+78074743+}          0     0  50000         Y
>>         gpu_cc_pll1                    0        0        0   500000097          0     0  50000         N
>>         disp_cc_mdss_dp_pixel_clk_src       0        0        0    19200000          0     0  50000         N
>>            disp_cc_mdss_dp_pixel_clk       0        0        0    19200000          0     0  50000         N
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++++----
>>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 43a5ec33eee8..35c69dbe5f6f 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -561,7 +561,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>>>   	clk_disable_unprepare(msm_host->byte_clk);
>>>   }
>>>   
>>> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
>>> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
>>
>> It is a bit unfortunate that this function is called so often with the
>> same parameters, doing the same calculation over and over.
>>
>>> +		struct drm_dsc_config *dsc, bool is_bonded_dsi)
>>>   {
>>>   	unsigned long pclk_rate;
>>>   
>>> @@ -576,6 +577,11 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
>>>   	if (is_bonded_dsi)
>>>   		pclk_rate /= 2;
>>>   
>>> +	/* If DSC is enabled, divide pclk by compression ratio */
>>> +	if (dsc)
>>> +		pclk_rate = DIV_ROUND_UP(pclk_rate,
>>> +				dsc->bits_per_component * 3 / msm_dsc_get_bpp_int(dsc));
>>
>> Don't forget to mention that this series depends on the DSC helpers.  I
>> don't think the linked DSC 1.2 series depends on it (at least it doesn't
>> mention it):
>>
>> https://lore.kernel.org/linux-arm-msm/20230329-rfc-msm-dsc-helper-v6-2-cb7f59f0f7fb@quicinc.com/
>>
>> - Marijn
>>
>>> +
>>>   	return pclk_rate;
>>>   }
>>>   
>>> @@ -585,7 +591,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>>>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>>   	u8 lanes = msm_host->lanes;
>>>   	u32 bpp = dsi_get_bpp(msm_host->format);
>>> -	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>>> +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
>>>   	u64 pclk_bpp = (u64)pclk_rate * bpp;
>>>   
>>>   	if (lanes == 0) {
>>> @@ -604,7 +610,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>>>   
>>>   static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>   {
>>> -	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
>>> +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
>>>   	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
>>>   							msm_host->mode);
>>>   
>>> @@ -634,7 +640,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>   
>>>   	dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>   
>>> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
>>> +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi) * bpp;
>>>   	do_div(pclk_bpp, 8);
>>>   	msm_host->src_clk_rate = pclk_bpp;
>>>   
>>>
>>> -- 
>>> 2.40.1
>>>
