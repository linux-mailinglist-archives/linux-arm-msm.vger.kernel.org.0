Return-Path: <linux-arm-msm+bounces-99095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ex9OQvBwGmfKgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 05:26:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 429502EC750
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 05:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBAE2300C580
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 04:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700CD29DB9A;
	Mon, 23 Mar 2026 04:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xy7vkUTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XH8BB2Hx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD0285CAE
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774240009; cv=none; b=p9w3v3VhMSjkF2ladZtMCkumEJDHUTPVLgUA6rDiB1L7XvUyf3PeKhdH5mLAe16NfnhKkKDnM8WTgTTw3b4bpshI6cdH4kUvEtv/K9n/8sQzN9/hbVBr3/6uZ2WcB7eCHYDvDlE1BZnHWIP0q9w1JB56Hu8emSpcvkuVH3PeUak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774240009; c=relaxed/simple;
	bh=sStt4KH26WfiPlJ8xKUxjjO/or5H8BrxBwHyGMcoceU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRTign0kF0ju6vQWz/ZxT+1r7pIGBEd83iGcbDLTZiqUYBfHTpLH9rDgMd+fZfa4kH9jCpVvT25FeUCXq0Cvw+jjV55kYJUapN43RtDRHcJkzbRemisn/KK/RrpEo7mGNS4e4Q9AW7nIcuW+o9CHpOxkqcJRz71DCjZYbfxWMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xy7vkUTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XH8BB2Hx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLxlp13393285
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=; b=Xy7vkUTOShls9XW8
	L1ZA3TO9rsyNsHvN8iryOxzBxC1KqwkTQXV6DtQ7LUG2ApK8UIUOtzHjev4PJ9Wv
	62t9pCg3THF809qUkdZCR7lyXe/IBGTNMkexmNgrXBIzUGV/tR3rFKDi+V14fdOn
	AdAAhS7wdHXq4v6UAyrAjt+m6fTw8wERruuRejV7pJ7+BM8Ecb5OUKOiWqiptkLr
	xwF9Sn1aLXIFpOItNlSvM+NFvx8CLKtedn8svCncFgQR3vD2mU39NPbP/o93om1r
	5blgXgfFOtbv8ZI2npp3f1kdGr/W7ChlKxP+3jGKr5Wbfx8qdhDr8nA+znijnc81
	L8fDZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8hmx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:26:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b07bd30b5eso41435665ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 21:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774240007; x=1774844807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=;
        b=XH8BB2Hxt6RcYHKFcTozC9T0K1cObqQXwV70AoY8aYBp7F0+WQ6FYeFFuoi8OMKd/e
         BQFSMNi/jkplzuSCpcBI0HJvlLPg474dHCnQ3fCfLpfjCHmPF4QWTu80PndgJAlVu3FW
         RvgyBHqmXstmt1zlZZBex23w38EuuZWziy71+FEoDYNowUkk5IlAjGft8UHcHjJ2qY91
         nI2CbUSi4x8P/e9sWCBoJ9MDCGFrtqohCPdMFqDQrKYZaYDlTlJ47YqIn3VclXMsxvBW
         E7+BP62o4ebD54Hbb2ONNCXJ37s6ifnELn5A1YOpIaXCny6C0SpTHwvg7odzrryScgdx
         lqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774240007; x=1774844807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=;
        b=qNbrMPGXVMyn+ZdPeO3skq9udp7PCKTL/RrB+yGWm21PTCfQ1GhbHY29J/Dya1hcdi
         jnHnaaCngsVSGg2Wo4D9FZPs2Y0yjqqktQe8ATD3Amoc/pNwm0pWBwKajP2JPCTXDHcT
         H7TyB/b3W/zfSDxckGz0EctVQENMZS9V8XV75rR0Id2f/NzIf/0vRM0/LO8Dtewje8fd
         tpMTIvflf9lXIELVLIEYi4L0leeQBGryzNA7H9/4udw9+3GiURcivlkGbvOCxS9dDQwK
         +XjMSKF7Z7M7mptF50Y6WUJuwRvkCLSnLahGV9gbDLFcO0F/eCjfdwc1P1CgWPl/+yS0
         N2lg==
X-Gm-Message-State: AOJu0YxymhIVO6pQKPw5B29fYnsQw9xFp4k5llN5oVI2wd2wRbBK2g+G
	Uo1KoxJtB5oM/2zdC6M5bqVZZFwrS8a+POvzxBsMURcpp/QD+5DQWnznJ9aGb1aDhqw7Kpg8LjU
	6PI5Knq4squUkIhIp8/5p86+BnM7xZcLPyaZFwHmuIMPdA8uj3FT9DoKFWzhgBzPV/gNJ
X-Gm-Gg: ATEYQzyz7QdwKXRSYT6fYKVDhPI0DCZTynw2Db3orAsx3YpfZdRdIPVUNekaUwSByx5
	4HNYFzijjoLhAsADFKddAMEDy8lDeqHJY0W4T7mKY/0kh7azjj6Gw+JmWOjkB+78KfzUEMohDDk
	Xlof3oJmodm6k1Uie8+wc2Gidye3USjo9++wD1jv42sDIRya1r8aF2lznaiJuSk4d82SnpgUlA6
	2G10aY5Xqn6KsRinWPxwyaw6fNqpMS3cSZwu2ClM7uYpFmodE61nbl6K2N2rFuxLvzzFtF1QBRo
	u4lDXuxzHGfylSKvY9fMZWtKzGHydxpf6uj/JTC88fxJPcHZ00OmvJ+sM0RQT/ZpYdLiTpCpZ9d
	4twQIE+MNcJGp2pPOjURyaAMoSvOzb3l21jRfdSjXsLrWIEIDDg==
X-Received: by 2002:a17:902:e5c5:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2b07717fbc5mr121752275ad.13.1774240006882;
        Sun, 22 Mar 2026 21:26:46 -0700 (PDT)
X-Received: by 2002:a17:902:e5c5:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2b07717fbc5mr121752085ad.13.1774240006435;
        Sun, 22 Mar 2026 21:26:46 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516908sm117191885ad.1.2026.03.22.21.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:26:46 -0700 (PDT)
Message-ID: <32c8c28f-83ef-4019-b87c-162f09ab6de5@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:56:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAzMSBTYWx0ZWRfXz8fnq8evuTpN
 7R6s756qTIu05LXLV/mz6GH8jp+76cRCbrpjAIPv5SY/jBudzSvYEvaihcQexTgsO0B9qplcAVQ
 Xyj65S4PZiIgVga+HlWi0iBEcTVC60mf8FyNIougqzinWYmJx4M6fnjqiL2ZEkz+R+gP2U4FRjO
 mxEBBXH0HDddjeXKmQOd2xSlIMSoBJOFOqN9j5fXD99ZrlJ9aL/Ex9KO1vq6kVNXfC5PGhfz7va
 YPWUFq/3CDRqXsu1a2WWQ8HxVKappEMCdrbapfbNMJ/qm4TTPBM0Mfgebuj2IWyWdBTp0ZaqCXP
 v79MFN3lZ0+LX50mzi6kbhHCyBIkuhu8QBxK8Kkw6p5dpt4J6P5eshAiazeji3D/YhkfX1u7Vg6
 jCDDdMTlCsav1ngYq3pYyw89HM7De3aqIbXiIrUT5w71O2zbJJkn22Gryes4j657V83JZRNHnQZ
 9qyiP2806h7rkyaLAIA==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0c107 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XrWBrngNrbSfp6LsIOQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0RnmSjJ4c2KmbTHGPaFdqkUQBPt9D7Sl
X-Proofpoint-GUID: 0RnmSjJ4c2KmbTHGPaFdqkUQBPt9D7Sl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230031
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99095-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 429502EC750
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/21/2026 3:20 PM, Pengyu Luo wrote:
> Downstream clk_summary shows the mdss_pixel_clk_src support the
> ratio(35:16)
> 
>  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
>      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
>  dsi0_phy_pll_out_byteclk            2       2        0        108120000
>      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
> 
> After checking downstream source, 15:4 also seems to be supported,
> add them two.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index fc696b66cc..6064a0e17d 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1117,6 +1117,8 @@ static const struct frac_entry frac_table_pixel[] = {
>  	{ 4, 9 },
>  	{ 1, 1 },
>  	{ 2, 3 },
> +	{ 16, 35},
> +	{ 4, 15},
>  	{ }
>  };
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das


