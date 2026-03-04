Return-Path: <linux-arm-msm+bounces-95348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ3AMmZFqGlOrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:44:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18009201D91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0D963081A90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA7A38236D;
	Wed,  4 Mar 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMXNnvYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkTMQIXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90473AEF41
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634468; cv=none; b=UPTWRNPlh//U4j1BMeqwbe7JDGP3QH4Q6PGgVXkHvoXB6npD6Y/afXmVsn3M/wjaNw072dBEHapbTvYsXa9IeqaHFWG2Lwa7yTTotqaVilCLLfZ7/65FtzLZ6h9nQWP0EzzHcUbGysgY4sppSugDbkJ5qv9wcEqqTnKtA8I8dh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634468; c=relaxed/simple;
	bh=EAaeeeuLqWxAdkX8p08SqqenhwTH4EaJoMZvMiEdjfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V36+aNr39+6AS9H1+EF5CmkD6HFkwMKjHobBqXuTuvCdoM2ZePzCkPtek0yfqstWCk2sMJzNVRGAA/cNYjFIJoz93ORWRYRe1xy/7PrO+rtnnjMZubeIx8bcIHqyU1QHqsZbaly/uWXggT/H9rX61wVia5TCkd2PSyhipXaB7tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMXNnvYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkTMQIXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249spJD1213639
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HI2CznMZd7AvUHtcmq6rQ9pHxHXF2yzXsVkL31LNbHE=; b=VMXNnvYgnb/5zc5v
	ZY4eviIxBmB1WAnblWikr3InqQWk8Lu5dHdfOL9Ln/WSTst+GR9/aquZzTkIUngY
	B1Wg8xmMEqz/V4gcPRosKNnmtClrbyjcZVu5UJcj8zCUzSqrOrNsT+27ojG11gsq
	eyHCA30d6JPJFV13SBdMReU+6nwt/ohMVx8xK6WGCRaEWilIEq8n50nFgs/JETCT
	uOZsEisXxeob+nYI6ygLBYUrDNGxsNVmAkVRgRWQlLAGdgTmgEydPUug6bma4cdz
	CCowlN88G7FamF2V8hz0w7jN4CAqmUbVQPyVOg/n7+Bi+w2qWQ//m9AeRvYl7TE5
	kt+rfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rrra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:27:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b0d938dso4890120685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634465; x=1773239265; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HI2CznMZd7AvUHtcmq6rQ9pHxHXF2yzXsVkL31LNbHE=;
        b=PkTMQIXtQEkbREmZzy1dvk+sNFrGkKi0ai6SnexSZb5FoCR+SU+MPdYeMXRCZbEbWy
         AlgiUtUZ7wjIKxvC21txmlWpKyh1vhzbNyiIUf0JJXVNGonl02wEYABp48QYZXddqv8c
         oscnnTgAUFFv1Fmrbe8I9qq8PLqV05ux8c+pWPHlG515CaBPK/XexG/LiVv94qR95ucm
         kdXARWV4UtZgrsRyaXn64aAbwwmrU37EJNnqfl0+0nOD7CGnhA7P5NYOgSsobLasqNGS
         NKqEP9xmAXlabtahXz4yle6csXwyT8jIeli84e8ISLNQ9RaBIMglBW/qsgegOjm79tVz
         II3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634465; x=1773239265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HI2CznMZd7AvUHtcmq6rQ9pHxHXF2yzXsVkL31LNbHE=;
        b=wDiGmPeVqElUI/hjlo90JotiRrUhDv/u0t2XVu7Vg95sqhA0pP8ZvJvplYKw27b79G
         sxKie5miIpIUH0WkQgtKJm2hcNdiSZSLWRoi2mrnQZK8v+kmrbtkcthyaB0II8yiFnyj
         hGzLu6ymqFFp+9mGcm15IdFr9fl79YR5ft97+sjdEJsabGMYag55lsSuR9RmKxRCisMu
         SuvfNLRV+5vU5t7JDL4quxUKeXUXfvzH62gmM3Y6QX1UwXxc5lYDC6Cyd54pA4zrBp90
         30JXo9z0fvLHWRQ2hmtecIhPoHlxsqJnflkAC04VNUNzRoXBKHDb0hZc+Ui+OX4SUc28
         wJEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTxDsmrdZ3VH1W+sPwu3Jb8KcMt0cBw3qR+JVAQB05KJFgHo1cNGUY0t6JjEYQl0QV7P1d0wbXMySt0IXA@vger.kernel.org
X-Gm-Message-State: AOJu0YzMD1RY6U+/8zjPuLP+RKULw77zYTRTWjjPgf9TKqgKJwnsT8Yp
	smvO6S94brNBZinVSZ6rta7LP2GfPym9fbnDVxTv0+6P0h+CFgsbElRmMvIXCSwE7eI7rbqZs5J
	Dp59f7RsdK6O7guBvBuRRwH/U8YwQgOe7jTt2H5j09by79IUBQp5ouDJb6TR/th5tqD39
X-Gm-Gg: ATEYQzwnpipFW7/t9zevztFxejxg0vZRcD5W/epiUy18+qHIJ5KKNjrLdnzBhzsj99A
	dVTeEjbKrf3fG3IOIon1S3weWvVT0dvt4rbu2ZiqUk6ywq9l6bBPQKrcmXsFOJVskYrKmANJljs
	b1J+QGuXWUOOzr/B1m4tAChuK7xv/CFXqzrO/z1RGdGB+PBaogiLVDIoVSGMDOXGC4SY9FtlKJU
	pWIXe/aRgQ6aOVvElwDMFNGU27E96DYu/jSc5W2rm7lHoyjYZxsc3ruFf9Pl08Pwq0fUWv4KVjf
	g9/KV8GzvAMYoMncQ0sGAAwGw4dbw0HnTKEVEpfhcul59Pg3RJNPScl5OO/XIVRHBnI/eV3XTy3
	B6/1rgePxZu24LdDfO72sUVVe0k1nbEFM/ivNqcYawz0in3uY50UxjKzaceAsrp4izhXPl8qyf2
	1eDPgaepv+rYQ/NgCysAjYFWlRTXNpH22S5B8=
X-Received: by 2002:a05:620a:1991:b0:8cb:3870:5c1f with SMTP id af79cd13be357-8cd5af0bc4dmr245808185a.27.1772634465147;
        Wed, 04 Mar 2026 06:27:45 -0800 (PST)
X-Received: by 2002:a05:620a:1991:b0:8cb:3870:5c1f with SMTP id af79cd13be357-8cd5af0bc4dmr245803285a.27.1772634464670;
        Wed, 04 Mar 2026 06:27:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6e4c01sm568239e87.1.2026.03.04.06.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:27:43 -0800 (PST)
Date: Wed, 4 Mar 2026 16:27:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] clk: qcom: dispcc-kaanapali: Fix DSI byte clock rate
 setting
Message-ID: <dme6vmuzij7moq2qsuez27exxdgdmikaoskjy3vytaiu3j2ixd@hdd2j655mfol>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-2-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-2-b79b29f83176@oss.qualcomm.com>
X-Proofpoint-GUID: DkXzl4nWgUOukNHDD47NlxG2oVdFBtGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNiBTYWx0ZWRfXwiNP0D0nyqrM
 wQbytjufjAbtvlH8ecO5PDl279in1PSwho6VFzmtFST1lPo+jHf1OSOy8boNoD5R8HowucMemn3
 Wn3vIl6Y5m13M9USESQTec8qq1GujMijpKDVFS1DzO2QDXIZpYHWEHgAVNcJUg0f9P94L4PXe93
 QbhksTEOdhB3b0lun3fK7aTlfMrhyBqACcZUAkN1I/xEWpw2xZL2ZdVVxLMNleGkEPuRqI3O5p7
 23IFoRPY1yodERjWI++9dAJBI3U3Zik3Q9SMl3LL5MfUGXreqqxVCBvLJOYZ+DyJHMSEQdXYkK2
 58ypsEVH41EXKy6Qik71RjHo7jogGi8h+b0dJA+sR1+LgHgDvyPZsrVkW5Sho5x1JFXUUhbNDUE
 /aEcjsB9fxL/TT0lrJqShesyWsg0BRYzjIF3sTAcpOkJ2kAAyoaMRg/K224lqXZHfPakalgoL3o
 Yy48J8JfzeEnB1rrR7w==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a84161 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=P6JgDz5pW-ke-mV79CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: DkXzl4nWgUOukNHDD47NlxG2oVdFBtGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040116
X-Rspamd-Queue-Id: 18009201D91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95348-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:48:28PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: 6c6750b7061c ("clk: qcom: dispcc: Add support for display clock controller Kaanapali")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-kaanapali.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

