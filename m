Return-Path: <linux-arm-msm+bounces-109576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FQ9MYcDFGquIQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:08:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8DA5C7756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6866F30315D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460123D890D;
	Mon, 25 May 2026 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+6BSSJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZMngo3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5E3D9033
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696380; cv=none; b=dPizdzmyz6FIvYJuYevmMdRSquLUvs/kZX8m5I84Dd0thUT7xdYvrfZb6pju7oR71sZ6nCMtVXedAroH6VBjmUtYPDjAdl2bblus9FxFuZKA8Pckaxg8KUfQg0UGyQ5O0gk1gUeawc5qCP37onn9ypLi5KJO5juFO5x+5gVNnZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696380; c=relaxed/simple;
	bh=X7t/Axf9cHQJp6AMY8nqILl5bYsQ0O/Ol61RW4HOG2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5nr72GDzD5U8E20oun3GJ+H2w9xHnnCBNvEX7NAgO2alvDrIYa0bQBUtzY5l2ZDLuco9Lg6DWaRfOQBp1u+/blkZ4tX3soWjd4pLuMGhMmMjRYLOivhWKkt5f/uKdzzq41BFnQoJo+rnNe/vmXjl5vKt+Eu9JU1Z5UHJEsvnTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+6BSSJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZMngo3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6gPaZ1223139
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oq64VY4uQXXnYQvsYgZPH3FXxuDer23njmmwxW+la3s=; b=H+6BSSJMDvyyOYbi
	Khhvq/eTLttnMzE9009Q+SnyJMFUWuDt12jlmMrp/hLmxcOWwH2TXJsfecc/xbpk
	rrE/XfqL3VXGOAYu7PrcgQlKHyquL0I2RXXABti3UfyB5GGLpT/aR2Lmo/kpIy1Z
	Rr3U1Ktzho5ZlNE4Ry9I0UXeqT2a2NUVmpsx3HfNMtJ2kIFh8XRALnbqCsBSZTpR
	EQ5RksiXpjx0kVwi5QtKtXwVLmYzgM+wXjDTDNWOikGtkxjNcVbTmOO0E6MvfWRE
	D/khs1w7ik5yaGwI9xKKmyne7kBHDDtKK0jcAP3NBwdYvMVJzE552g67jo7PHR2o
	rcTfJg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txnptp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:06:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83836443305so4523377b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779696375; x=1780301175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oq64VY4uQXXnYQvsYgZPH3FXxuDer23njmmwxW+la3s=;
        b=fZMngo3AXe25TfyQMP8VnOkxCp0rnnw+EmHoHpJCEXDEzFK/SeFcbGyMrGmCHJbPYZ
         JVwdpGFauYiirw/Ta4TlGeTqhEaazqYQxWoVtBR4xR3axDR4Kc4BYirk2+yyXMNI/n0A
         XOV4D4DwTzpsGniHVOVzzzHzpJ5YYcykxdITQiW/CVBRUJftTGmpxySrAPPOW5Gsb7W/
         1nRkrml+l+mAiW320dZIwK5lybrX31OVkpf5epTD6/Uy4IEJ5woW1Y/QQgoxRYZ8+AN3
         T0BKy/LEzjxjnEWPJm1dLPSE1tUZluZAW+LNtSUGqMwU+N6ZRPJ+MozNkpUU2JU9E5AB
         Oohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779696375; x=1780301175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oq64VY4uQXXnYQvsYgZPH3FXxuDer23njmmwxW+la3s=;
        b=eBGYGBNIMe4FLugEtpOwMXnnKzqWjmlOixhlHOiDVtpHqTKUgbOotKv2Mp1+W7kkvS
         B2nT5S7tlsazXtLI4DObUzveCtwPS0s3e9qqDOOBProXo+KyhN1fp1eJ5C3KKnE64JRG
         VsFLvIE+tXS7NL4xeBI+BdTn01z6h52xDNPba+gjnRiKoPgINg+d9R4/KJE5vROb1X1i
         we1iHKkPF/FFax+LzxkPLKqvUFUwzSvmzxyuIk2VcV1i5cfsf5mC7fC7BmZmbvZKkzB+
         8jeNoQpBvFokr+EEbDrPbUCHGhNRTAh+7fN+4pGWEPYPOINrr5HgIjvNvCC+pCzi/GvO
         FLvw==
X-Forwarded-Encrypted: i=1; AFNElJ9m1NzP/FAIgdfbFTTgaOzKrmNFXxkdWk3KWEh0/auoe4QGLgg9LS2qTQoPEDZ0m2qPXGExFIBPbPTOS9iJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzWckglJ5ereggsLsiDu6tY4urKXIwzQ3AQr9HCc/WsZpJvlFhc
	PDA6/ZKBLrQAtKbXi7yhwtx1pOeJ7VfcqY6A0O0nYsOpEhjK1MzGvnaM1YJoqYpW8JclabmldTB
	rkvsKa+Kbyi/GPg/Bz852TVoRRG5qqD1hZMVMolhfiZKnS1gB6M+ma3LX8WXPeADsCjNJ
X-Gm-Gg: Acq92OGRzmuRmCxRHxNTx2FG/BIkC6/eKpk+58T49JWYEQP5zgVa4GNy9YG2jliymqm
	/+lqf8h9sHhbGc7DoTUvUpZZZgLtoFUUkBj2Zl0WxUJppezEDNMo4WTmib0wFfatlv2T9ZA2QaZ
	vEjUZcYFp0y3TeYbGXXJZMAbB+wFWa3pBlRxCBaovn2FGyu4u78AevqlLEXvIM0NX2MSHDnKstz
	Msj5CqgLF3l1j9A2DKYlH6Qr3ZPZijcO9vg0+VDYrZSCwa4AlgWL5MP3pMe9uXOR7LQx4EEQ+pb
	FwJZuUVi1e8v9XqdUw1owBZlPxGlkDQIYEI65w15ZgTbqmm6pq4D0ohzgWhHKKX2bGKiz4EhLa3
	bOtfOSYQMnOmGKh3atCpvTiVpdKioD1tD4t7kmd0oATa+1TTfk8uYq9p2Qk6Lidm2tG0Uo8uclo
	UQCBkui7ZrDjDGEFnkUw==
X-Received: by 2002:a05:6a00:18a0:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-8415f0e4390mr13204105b3a.8.1779696375422;
        Mon, 25 May 2026 01:06:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-8415f0e4390mr13204071b3a.8.1779696374835;
        Mon, 25 May 2026 01:06:14 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm8347373b3a.15.2026.05.25.01.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 01:06:14 -0700 (PDT)
Message-ID: <753dde5f-9032-40ed-832b-0ecba7228d1a@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:06:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/39] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-16-b20518dea8de@oss.qualcomm.com>
 <exhugtt2cf2zjvbing6p5q4ubyiealzj5ijcdrmmp2s45liz5q@7ccvl4euerkq>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <exhugtt2cf2zjvbing6p5q4ubyiealzj5ijcdrmmp2s45liz5q@7ccvl4euerkq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4MCBTYWx0ZWRfX4VLOCH85oJ9D
 Y5gFZ+bBY7VldciHoJFrm4UhZDV1kzV9m6bRoQVVNC82ENSNswPdMwDt5mrcr0ABOBK5nubyc5H
 zMbdaPBPRg64RqA+Q02XEkqEz4cAGi+ZfiAc1dFbZuxHqxP7Sqi23lRK3dY4P3eevWsXtLKtX5U
 mGzrYpB7M+DNhd/4dAMYDtIuzx/X6GNQxmIA1RzaAhMatp5cukecqUJ/7aI5Tr0VmJz+TXhp6Jv
 MgXO3/CA8Y0VdEUQDNPVn0hion3io5jpObUu4D98zXtVEHOao6O5YVviTFp8t1boAox8S4jXuXr
 5JNxkx0JDOBhT17bFFbfO2iuSHjbqnZDyDk3z6lZh+8u+R4eS+VKj3yx+ZNi9A5850ZsubjlAIO
 QdxKXDKpwcTvAJgCpJjjTRaUY6QsDswFQ5VST+/jAU3Y7HJJnINsFHel3KWwSeY92ethvN++9MF
 /SiBB5xCHfpCb+tISog==
X-Proofpoint-GUID: mqwm-8PR7MzT8ElJGFdlaNs28OaRPtHw
X-Proofpoint-ORIG-GUID: mqwm-8PR7MzT8ElJGFdlaNs28OaRPtHw
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a1402f8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XHoAMprOVi_k0GTp580A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109576-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D8DA5C7756
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 2:12 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:51PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Use the dp_panel's stream_id to adjust the offsets for stream 1 which will
>> be used for MST in the dp_catalog.
> 
> Please start by describing the problem.
>
Got it, thanks.
>> Stream 1 share the same link clk with
>> stream 0 with different reg offset. Also add additional register defines
>> for stream 1.
>>
>> Streams 2 and 3 are not covered here, as they use separate link clocks and
>> require separate handling.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c  | 24 ++++++++++---
>>   drivers/gpu/drm/msm/dp/dp_panel.c | 72 +++++++++++++++++++++++++++------------
>>   drivers/gpu/drm/msm/dp/dp_reg.h   | 11 ++++++
>>   3 files changed, 81 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 1e80d6fc7bda..a52bcd9ea2a3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -393,6 +393,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>>   					    struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	u32 config = 0, tbd;
>> +	u32 reg_offset = 0;
>>   
>>   	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>>   
>> @@ -409,7 +410,8 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>>   
>> -	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
>> +		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
> 
> Where is the actual write?
> 
Sorry, here is a mistake. will fix it next version.
>>   }
>>   
>>   static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>> @@ -460,12 +462,16 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>>   					   struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	u32 colorimetry_cfg, test_bits_depth, misc_val;
>> +	u32 reg_offset = 0;
>>   
>>   	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
>>   							  msm_dp_panel->msm_dp_mode.bpp);
>>   	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
>>   
>> -	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
>> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
>> +		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>> +
>> +	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset);
> 
> This quickly becomes unreadable. I'd rather have something like:
> 
> reg_addr = (stream == DP_STREAM_1) ? REG_DP1_MISC1_MISC0 : REG_DP_MISC1_MISC0;
> misc_val = msm_dp_read_link(ctrl, reg_addr);
> 
Will discuss next patch.
> 
>>   
>>   	/* clear bpp bits */
>>   	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
>> @@ -475,7 +481,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>>   	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
>> -	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
>> +	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
>>   }
>>   
>>   static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
>> @@ -2446,6 +2452,7 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>>   }
>>   
>>   static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>> +			       struct msm_dp_panel *msm_dp_panel,
>>   			       u32 rate, u32 stream_rate_khz,
>>   			       bool is_ycbcr_420)
>>   {
>> @@ -2455,6 +2462,12 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>   	u32 const link_rate_hbr2 = 540000;
>>   	u32 const link_rate_hbr3 = 810000;
>>   	unsigned long den, num;
>> +	u32 mvid_reg_off = 0, nvid_reg_off = 0;
>> +
>> +	if (msm_dp_panel->stream_id == DP_STREAM_1) {
>> +		mvid_reg_off = REG_DP1_SOFTWARE_MVID - REG_DP_SOFTWARE_MVID;
>> +		nvid_reg_off = REG_DP1_SOFTWARE_NVID - REG_DP_SOFTWARE_NVID;
>> +	}
>>   
>>   	switch (rate) {
>>   	case link_rate_hbr3:
>> @@ -2509,8 +2522,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>   		nvid *= 3;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
>> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
>> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
>> +	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
>> +	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
>>   }
>>   
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
>> @@ -2585,6 +2598,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>>   
>>   	msm_dp_ctrl_config_msa(ctrl,
>> +		msm_dp_panel,
>>   		ctrl->link->link_params.rate,
>>   		pixel_rate_orig,
>>   		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index c17b87353d1a..6c88cc7e3037 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -447,27 +447,35 @@ static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct
>>   	u32 header[2];
>>   	u32 val;
>>   	int i;
>> +	u32 offset = 0;
>> +
>> +	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
>> +		offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
>>   
>>   	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
>>   
>> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0, header[0]);
>> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1, header[1]);
>> +	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0 + offset, header[0]);
>> +	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1 + offset, header[1]);
>>   
>>   	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
>>   		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
>>   		       (vsc_sdp->db[i + 3] << 24));
>> -		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i, val);
>> +		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i + offset, val);
>>   	}
>>   }
>>   
>>   static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
>>   {
>>   	u32 hw_revision = panel->msm_dp_panel.hw_revision;
>> +	u32 offset = 0;
>> +
>> +	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
>> +		offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
>>   
>>   	if (hw_revision >= DP_HW_VERSION_1_0 &&
>>   	    hw_revision < DP_HW_VERSION_1_2) {
>> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, UPDATE_SDP);
>> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, 0x0);
>> +		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, UPDATE_SDP);
>> +		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, 0x0);
>>   	}
>>   }
>>   
>> @@ -476,16 +484,25 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>>   	struct msm_dp_panel_private *panel =
>>   		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>   	u32 cfg, cfg2, misc;
>> +	u32 misc_reg_offset = 0;
>> +	u32 sdp_cfg_offset = 0;
>> +	u32 sdp_cfg2_offset = 0;
>> +
>> +	if (msm_dp_panel->stream_id == DP_STREAM_1) {
>> +		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>> +		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
>> +		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
>> +	}
>>   
>> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
>> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
>> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
>> +	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
>> +	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
>> +	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
>>   
>>   	cfg |= GEN0_SDP_EN;
>> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
>> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>>   
>>   	cfg2 |= GENERIC0_SDPSIZE_VALID;
>> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
>> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>>   
>>   	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
>>   
>> @@ -495,7 +512,7 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>>   	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
>>   
>>   	pr_debug("misc settings = 0x%x\n", misc);
>> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
>> +	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>>   
>>   	msm_dp_panel_update_sdp(panel);
>>   }
>> @@ -505,16 +522,25 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>>   	struct msm_dp_panel_private *panel =
>>   		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>   	u32 cfg, cfg2, misc;
>> +	u32 misc_reg_offset = 0;
>> +	u32 sdp_cfg_offset = 0;
>> +	u32 sdp_cfg2_offset = 0;
>> +
>> +	if (msm_dp_panel->stream_id == DP_STREAM_1) {
>> +		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>> +		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
>> +		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
>> +	}
>>   
>> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
>> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
>> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
>> +	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
>> +	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
>> +	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
>>   
>>   	cfg &= ~GEN0_SDP_EN;
>> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
>> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>>   
>>   	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
>> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
>> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>>   
>>   	/* switch back to MSA */
>>   	misc &= ~DP_MISC1_VSC_SDP;
>> @@ -522,7 +548,7 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>>   	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
>>   
>>   	pr_debug("misc settings = 0x%x\n", misc);
>> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
>> +	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>>   
>>   	msm_dp_panel_update_sdp(panel);
>>   }
>> @@ -580,6 +606,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>>   	u32 msm_dp_active;
>>   	u32 total;
>>   	u32 reg;
>> +	u32 offset = 0;
>>   
>>   	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>   	drm_mode = &panel->msm_dp_panel.msm_dp_mode.drm_mode;
>> @@ -594,6 +621,9 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>>   		drm_mode->vsync_start - drm_mode->vdisplay,
>>   		drm_mode->vsync_end - drm_mode->vsync_start);
>>   
>> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
>> +		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
>> +
>>   	total_hor = drm_mode->htotal;
>>   
>>   	total_ver = drm_mode->vtotal;
>> @@ -624,10 +654,10 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>>   
>>   	msm_dp_active = data;
>>   
>> -	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER, total);
>> -	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
>> -	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
>> -	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
>> +	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER + offset, total);
>> +	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC  + offset, sync_start);
>> +	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
>> +	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER  + offset, msm_dp_active);
>>   
>>   	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
>>   	if (wide_bus_en)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 3689642b7fc0..295c1161e6b7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -332,6 +332,17 @@
>>   #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
>>   #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
>>   
>> +/* DP MST registers */
> 
> Which register spaces are they from?
> 
Here also from DPTX_*, what about this? /* DP_TX MST registers */
>> +#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
>> +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
>> +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
>> +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
>> +#define REG_DP1_MISC1_MISC0			(0x0000042C)
>> +#define MMSS_DP1_GENERIC0_0			(0x00000490)
>> +#define MMSS_DP1_SDP_CFG			(0x000004E0)
>> +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
>> +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
>> +
>>   #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
>>   
>>   #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
>>
>> -- 
>> 2.43.0
>>
> 


