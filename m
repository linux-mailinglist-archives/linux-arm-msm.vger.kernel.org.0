Return-Path: <linux-arm-msm+bounces-104183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOzSOviR6WmOdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 05:28:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F33444C825
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 05:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF884300611A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 03:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAE83C6A41;
	Thu, 23 Apr 2026 03:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAncwQT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="belAdOZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F492DB7BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776914933; cv=none; b=o9g/Bg1eKYAyOs9sS0UnzoX/0q7xq5LzWX2vEbnezzWZZSUqi6JIfp6LqAs5GHhjzSrCCt8yxR8NwwpzHRNP0mNjJlhZYu/87K8/oDTc+07lt4/r5Z4Udmr7vKPLMNsD0HfqB644541TiG28/dRK20N7qr5YcqZqtgqhXALWQNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776914933; c=relaxed/simple;
	bh=Sk17jgQn0p+IPpeLlf+nKkBcgZNBQmPMRfThpI8Ovu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcQvci+12ffgjzB6tdFN5mxXN+PaxWjZIgnS26mIeJC/24wCY5AveCyWPH3X5zQd2nUa121DGEOwRlrLu+Ep6VnmUIOkzUAXAwDz8kJdBaueGn/8QTj4PRF8o5/Mv8/NnZYypG1GxDgmMHGu2wabo23DXAm1YUlHdtwz1z7GkDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAncwQT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=belAdOZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3eEi1230142
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kb3paQVuF8IH5wHvAH6d5Sw/eLOL+1qrUzUoZXFmmuY=; b=HAncwQT1ulJYY4Hh
	1gRECaxEMrC07fwqQfR9/rgjdI5ys/e5/XoR2qEUjI7XndBIcXuPBi2V6IwuW4ra
	8KvSmQnIi0p349ZpUIipq229EiR/6w0hyYUcjn5SmpkXQscFr0P9//F3t+8dS2LA
	zIxJsohxewGgPDiVUF5UvCCqth3NgQAWVtOmtXqfXjRSZzESHJ3hJEzjbfdWCuNY
	JnE4MP1Cs0OSYbjpG3beIshwe5a6WnlJN69yl7T2YAEfcx5y1HDnAGN5QLF7FDGP
	2EG4xhc6VPd/IvLXWs+xRBGlbH5TIHzokYzK7Kq4pvWBw0DfGEkeP4OiOgpc+Wgb
	qZ8IcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h69ynb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:28:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76c6280732so6810439a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776914930; x=1777519730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kb3paQVuF8IH5wHvAH6d5Sw/eLOL+1qrUzUoZXFmmuY=;
        b=belAdOZny2tH0O/4v7p8aeBWjBHAwM2tDoz2QXBpnnlESa5k9KxSaK+F05sQ1axlQc
         MyK1s/xxmi7SxC2XkGhYjgTdO6f6ahbkhCCeI+frpVBdMmUnfMHl9VJkaAlMO3QMCKw6
         g1pqiYBQ4DmCVH384hsBR1Zz0dryLtsrUxPpTo9b5r6HNPutVjUHbVoLQNYjpVgUYykR
         i04crVFyFWIQSriMKRa2psNOpYE6mXq3CWm2cnp/VKeTXqsWoGzwx+4c5bwnFHTzcewo
         dRf6JkhVGjdKPv0AZBi/r7c/xW17S526FTwfqXX3WHrcLFPwkgE1aEvw8dhUf3X8O3Vh
         kUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776914930; x=1777519730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kb3paQVuF8IH5wHvAH6d5Sw/eLOL+1qrUzUoZXFmmuY=;
        b=XYVjfiVVCC/8Xlm0OkxnrKKi7+QHn9I8N1DdfbRLMooV0yQT24fqP/t9IiXXMuIBLp
         Xjz7/hkJTPu5QP3YMpPlivnYM9QQKGnQ2D3a3vrITumdwQjqB/9mIapwTnEKBhDQC3ZD
         vb/Tfldk/TagRsBlWN1iNmXZ0dP3+J88D5X/EvlOqWgRsSA1WXiEAG8RDDwHMrnskBMj
         2usHwYzDbBgfIS3bnnLZGlx3/i1jShlH2SBuR5LN2PBBwJfsN1iiD9iFxm9cGqSQ6teT
         js7Qf3bjArJuTJ+u7BlLQnd1z31g38Uzg05wDbOx6Q/mair+8U6kFW+XmkMhIltx3t1y
         XcZQ==
X-Gm-Message-State: AOJu0Yz7QTbCLEepDrb9WyiNX3pFrmEIN/1PMAPvpwKVJQVsoAMuniGA
	P4Q2pN6vlT6fjWlxOWFX92licogwfLfBkB7p75N/o1EjmqG2Z5AYUkw8g1gxQgSAu+Vaneb8a1d
	/rOMu3BswidqYMNh1uxW7PF0sTQ6aX5AsXOomkiAetFtO9grVPQa6yn0KPmIWfGwA2PfzUD1lrQ
	+rhl0=
X-Gm-Gg: AeBDieuUyCsRPJWm3+eAH+DAMEIIwflQ7uMIrhd5rc3P5C2WuQT4Q4t52TXxoZDWNHk
	XtYgXnZ6V4KnEK7GWsmCC00zkbfXglheBupmRWM2pKqa50YmxYqabbt9Ff5MBW5/LX9BeIZuQG/
	UuEEQmWUZB6OHtja6BrADlX+GfRKPgjREM8R276fLfoxbXWUNhhwYXLoeATUqhnBBaesku6ZN81
	KuHAfLmsCG1IqrUraRHjQFe5KYRKKimISeeamB/B5oZKD//ctvWjoYVODrfXQM15KJ9ktjY3/4g
	cSi/LUVI8LHNloWIcWU9kmPL2JTL7GlTS+w9Q2qTotO6PRy88gkuR68FdSRZEIQbkeWproaJ2ep
	GPkWBHvzIqvtmQ3xWtuDfu4Xs/N4ZyCKfwuKOwXCuEFFN1j0flZQYe8IH1uyHVsCvHx0UO3mYzb
	JfsyQnsX1DZN8pN1okPzQhIHWvrqLR
X-Received: by 2002:a05:6a20:94cb:b0:39f:8aaa:face with SMTP id adf61e73a8af0-3a08d67bd3bmr28758311637.1.1776914930239;
        Wed, 22 Apr 2026 20:28:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:94cb:b0:39f:8aaa:face with SMTP id adf61e73a8af0-3a08d67bd3bmr28758290637.1.1776914929704;
        Wed, 22 Apr 2026 20:28:49 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701f622sm13895523a12.21.2026.04.22.20.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 20:28:49 -0700 (PDT)
Message-ID: <cbfa3db8-e500-42ce-8302-16af7b19afe1@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:28:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
 <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69e991f3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Yx4QOS3gQyyNq8E9byYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAzMCBTYWx0ZWRfXwMtN+ElF03S2
 evaq6JV44IUB/jfZyrUSgU2OQciCXKFT3e3ffCUdo5kpv5Du38ckajGg10qFsymIfUil0QcYHI0
 ch2Yj9D1nwsa5YdQ4J3c6umN2E2pQp3kqN/xVqdnuddFd5c5QdLvDDW/1gqR9nw1tPogOWWSznY
 9g9hnzVGrusE+KkKoJ+TqttsO1IhHDkQIq+CtA/eG7BU2F6kC/qy9BJXUYgO+u1TUt7+L3BxNdT
 zZXhOY2SBSutBq9qi7lZDOa7WXDumd2zxb9R2MFHMJGBypA5sZeWuwM7bSOFNuFEjWhepNs6+L/
 dkKbXeZv+XBphouZIk8pf4mLJ+2kZmvqK3/Bp65f3iwOu+MFufMDdCyccpjiBuSr5UlrQGO6c9L
 bNWqXnYLhgetqLQk4UjM9aocQZmA72BkEYaDGSlkkqUokmUtJiV4lwbcz7aoeyjYkgUr3CJMPgm
 zpITdsmVDdZyn3Fnw0w==
X-Proofpoint-GUID: M_y8zn6k7bpq8dZPHBi2ZHBXsWl1tUdr
X-Proofpoint-ORIG-GUID: M_y8zn6k7bpq8dZPHBi2ZHBXsWl1tUdr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230030
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-104183-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F33444C825
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/2026 6:42 PM, Konrad Dybcio wrote:
> On 4/22/26 8:01 AM, Yongxing Mou wrote:
>> SC7280 and SC8180X previously shared the same cfg because they did not use
>> swing/pre-emphasis tables. Add the corresponding tables for these
>> platforms. Since they have different PHY sub-versions, their eDP/DP mode
>> tables also differ, so move SC8180X to its own cfg instead of reusing the
>> SC7280 one.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
> 
> 
> 
>> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v2 = {
>> +	.swing_hbr_rbr = &edp_swing_hbr_rbr,
> 
> For eDP / low-Vdiff:
> 
> I believe the RBR swing settings for 8180 should
> instead be:
> 
> 0x07 0x0f 0x17 0x1f (matches)
Emm i see from ipcat eDP Low vdiff(Lower HBR)  swing settings is
0x07 0x0f 0x16 0x1f
> (the rest differs)
> 0x0d 0x16 0x1e
> 0x11 0x1b
> 0x16
> 


> The preem RBR almost matches, one byte is off
> (arr[0][1] = 0x12 on poipu, 0x11 on kodiak)
> 
Thanks,, here need to be fixed.

> The swing and preem settings for HBR3 look OK
> 
> For DP / low-Vdiff:
> 
> .swing_hbr3_hbr2 OK
> .swing_hbr_rbr - I don't know. The docs are unclear whether the same
> settings should be used for RBR and HBR3, but maybe? There's a
> separate table for mini-DP but I doubt there's any poipu boards with
> such a connector (maybe some obscure ones)
> 
> .pre_emphasis_hbr3_hbr2 OK
> .pre_emphasis_hbr_rbr same as above
> 
Thanks for point this, so pre_emphasis_hbr_rbr same with 
pre_emphasis_hbr3_hbr2?  I also don't get it's RBR or HBR3 from phy HPG. 
But now i think only eDP will be used in upstreamed poipu boards. i 
check the dts and not find any poipu boards will use DP mode(or mini DP)..
> Konrad


