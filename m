Return-Path: <linux-arm-msm+bounces-95505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNlCDmwfqWmg2QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:15:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D920B4BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C012301DF51
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 06:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0813A29827E;
	Thu,  5 Mar 2026 06:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpd+fmlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClYk9hZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E028850D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 06:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691236; cv=none; b=YqyII+r+iy8ngjb9X+KW2aLbcvdADf2kop0upVrH/+LcJdSi02A3Ij+KJBp6Gq4Pcw6L5s2wd/fflaA2Q9IfJa3/awUjzPMNSKVgu6ItTbWgncoWMbe5CpyMUkPIV/zBwGoeCrQ7b7hLWzYN+KJ8e/80zPYWtpTbANQOj/ZLV74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691236; c=relaxed/simple;
	bh=eyvMjbHsGjnT/xse2pYrDoq280R24SjuX0EZw+F7UUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+4E4/nSxNHaYKI+Ocf79Y+kcayXt0EZvGtqUZvou+3TGxH2Mhk6iZBIOCXnr2/eqahdaIX+/cYiX6aeBEqQjlLvV2ov3CO/6gSr7pGDY16beb+t6Ehd63xYEyaFiiJs36zSKRcKlfwzssrjQCyYQUFm7vTmfkWhmpbofW6bJc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpd+fmlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClYk9hZf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254taZr218456
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 06:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wv0u387cuNJreDwIWoHu3RhCC2+/1XNzjBUKD6GXCsE=; b=mpd+fmlME3UVTm4b
	pK+RyCU85x1woQbJSYRZalvbsLrQMLgxLxg6fHKp71ADXVY8CM7q2I8n4Ay+P/vk
	AvgSLd48oZd4u3O1vJz4hHZpSQpnN6tmoAuzvQPsYLuWGILGTJ3N6jfd3ky+9Eoq
	h5Jcqb9BssioKG20INEvmpmEurCbC16fUivqueKh1FQiyHpaGF02/UP9DLvmVav0
	4yu6goECzOHME/bpQcOa0riGCNdzfkO8N5Jpi8nISus6So3H7Je7HynK7EOye5bu
	ZzKTH0O8ucBlJacxbxkbsuhjOXeNzDBENuMcYQh+H1cw5GvWmzwx4WAJJMaYBOUR
	MXslUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380r71u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:13:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae49120e74so40976185ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 22:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691233; x=1773296033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wv0u387cuNJreDwIWoHu3RhCC2+/1XNzjBUKD6GXCsE=;
        b=ClYk9hZffJBlkB3wLMPbXk2imSbvjcQbZLs/MSTkfxy2PqOiqIU3bAeBYuGOwcGtuD
         6idXJmXkJYBxsIcJ4lMRj5l78rumIMTG/+ODNQ3NCGFHd9O+3FLrKyDtJ5WshT9CRjhy
         SGv7/z5ic9bUIh0kyPvXV6z16opEx5tojdlcACMCZbIVe/zRGI8NDUgVsHf8QRzTc8hC
         rcKxheZR9MhUyPsLES+9wVAAE4SmJEF1XhIf5qrXjX2z65Q3hknSkYzkTKECgqiQ7o5N
         u9Qcs0DCstMgeGI09tVGHe1ZdVNUpF4nJFmW95iVkl4WywZDH1Py2yeJ4CQZ26GHdA9r
         UpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691233; x=1773296033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wv0u387cuNJreDwIWoHu3RhCC2+/1XNzjBUKD6GXCsE=;
        b=qJ1H7uT9E+T7nQLomC9K42a6VnKUG2BWfONU+dAtelPMgzqjUXWzS7z2tNZB1MHgMO
         lVaB2P0CFoyz0pqnAiryktHOi74uKehMaKwYFzyVvj7H3vAhQ0gl36kKHtVEnY4Ux4qM
         JaszwCP2LQRcNFbEjeFbmXv9NPNx3DklIvj/V5jsNyq8mW7PGfzuU0uKQamFPl0SdmDe
         /LHsAZtQLkTJQ46TI9PAVGew9v1NvZvkNKvgDPFDs520qi1XYnkGaN+rvxHG4DpcCUl9
         gIgQqhpXWUaW8nD4bMoe3rbcqtPswvxw506E+XkTtou2nxuh20qZZLR+txQPwZtFmyxk
         05xg==
X-Gm-Message-State: AOJu0Yy6JpHxO50pAmwdM6mG8/T1J25+2Y/GZOhLSpAwvsYnuB0GZXZU
	lu74dkfsjSZBwQO3D/2K63FG+azLYRnhZIg0tAZ/gPfWgKyGSxwHWMxLbm5bCWsQTJNAMYi95JE
	k3N/Snkj5GX7k8s+dzxr/bghD3fRgpwWEO3rS1zi98zSuApauTHY3qSoF9DR6BlDmAVNqacOKS/
	rV
X-Gm-Gg: ATEYQzxFZVVf0F++r5TDcBH5DedYkwomCxBjeqDFlfobK5bXTWn6+rYqlpTwc/1s85o
	Z0gOcowuzz5af0DmgPmaunPRtB3WHBJPFNI/iUPei7q8ijopXCnjNy7+F23rFQ0smVQ4ooIhJIJ
	S59w3zoseLsgEmKK4/92z6hrQCnkEX2ggNVo+TLwKOOMD080Y+nW9VLFrI+GUmBQPVJFndRzT95
	VNfRKlaGpEBHJBwoze+70XgGH0ny8McPdgfLrfZsKEkINXdD7sNfIoL62LEeQWcBHOoKFWinD5t
	gvPnbeRqZji7gdoEAWcCoRZSue5nljjmaksEJdo0aZZ+7azdZC1CReGL3ffyqvApcDAxy3lce9e
	1+TXPZ9DAZe2Rhdpd2ITp/u03CulqzQlZT7BsL37wFq3I3xdkDw==
X-Received: by 2002:a17:902:ea08:b0:2ae:44db:56ed with SMTP id d9443c01a7336-2ae6aa20d76mr46975655ad.15.1772691233569;
        Wed, 04 Mar 2026 22:13:53 -0800 (PST)
X-Received: by 2002:a17:902:ea08:b0:2ae:44db:56ed with SMTP id d9443c01a7336-2ae6aa20d76mr46975515ad.15.1772691233086;
        Wed, 04 Mar 2026 22:13:53 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5e1699c9sm68679885ad.10.2026.03.04.22.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:13:52 -0800 (PST)
Message-ID: <38302cbf-d832-49de-8e8e-06ca3dd1ce6f@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:43:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock
 rate setting
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-5-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-5-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a91f22 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0TM1Jmez4aZXe2oQUkEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: UwKwGfjXlymTKkcbG4zTft6SOfqljh5w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NiBTYWx0ZWRfX4VWRbvqx29HO
 tX4XNAHhc1oaxE/ZRPHKBLMQsttP5qdvgqbzWF9Bl6sWkyyYSbgUoBeLTJWijkhAANkmmJ1WZrM
 O0Hw7M4YUJHjbBhGHJIW5A2BaV7AQu3WG4bR8ivtl6Ck5AwrKWd4uYDrLvCL7COOQhK4+ZLN3RR
 cKZ5E37T52+t5O2SlbQ5FeWzQlvclr3Of2fBnOYy77WpsWlAraTbYiyufyoYVjLpnf0IfdTC6g1
 fkROedaoyRBTNnpvXv0uL1DHRvWt/SsZwI8eTY4qU5Pt1Sb53GvZDFz/b2gdHXY/zFFRKe0rQgE
 allJ3su0O9+ABc4v4UJkHT+sHeLHwlcClW8VFahfcYgLTpG9ZeNZxYcl+ERU7+GspijxPLah0cz
 tp0def4R/1lvYw5Oc/xX4Fb/8IIQFVcHdBQuAM+TG4fNOtG9TwZDZ/wWST9jDARWnOlN/gGZrca
 O7evNPej9G9MBLsX0lg==
X-Proofpoint-GUID: UwKwGfjXlymTKkcbG4zTft6SOfqljh5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050046
X-Rspamd-Queue-Id: A66D920B4BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95505-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/4/2026 7:18 PM, Konrad Dybcio wrote:
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
> Fixes: e700bfd2f976 ("clk: qcom: Add support for Display clock Controllers on SA8775P")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc0-sa8775p.c | 2 --
>  drivers/clk/qcom/dispcc1-sa8775p.c | 2 --
>  2 files changed, 4 deletions(-)


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


