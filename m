Return-Path: <linux-arm-msm+bounces-94916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBoBA8yGpWkeDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:47:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BEC1D9011
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 496033061466
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC169376491;
	Mon,  2 Mar 2026 12:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKfUUMmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EflegyH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74222375AAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455355; cv=none; b=YqBOlUqWF6VEn/QW2Rjpw25KwNav3sU0f7FjRANkj4BgK9DHE9jL3I7T50wYgLWe2qt5g10dwEqR7+D4RZ9swXOBbIxq3ENCrg+qZek/2tDS1ZjzleB9q0+H6NePOXQW1FVVnGq7wevIQTbJJ4ckO7bxna9krR+BJfhc91fb8xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455355; c=relaxed/simple;
	bh=nkSwMzTgwqcxdxodHGNBMGr6i2wNfkdD46FSys1eLLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAWg3CXFystpCGJI6r9Db0WbO3A1rQUQkmH3QHqtNlx7TFSRexx924MyVOLqt4XJS0kTPmoPdbR7FGIzfU2017EJDaHE/TtaxI3A5gwdK3mS1M/FJgaQF1b/cgjAZpAd6LBHXauRoZ8FpbTXZg3Wn6hx4dIQI/cKKH3628yAmMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKfUUMmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EflegyH7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229Ervr3630818
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIKO5P6PmTvp8kuGDeHMIKG3uzkbrKKydli4TZkIbn8=; b=DKfUUMmSziS2BGL6
	xQKGtQDJ4BZgoC9mtoVksPB8R1C8a+kZmSosISUyr03TYtD1H6TR+jDUCi5D6+St
	FZyQkuUe4pENsKrtPKr/ISJYJGxlFuCFdPRuoUSneyGTSWwC+BXnDWnDRVCJFRKN
	LSE22BCWj/P3IuFoB+pp9MXOepk5IjVvbBsXPF+p+dG9JcQkCaXGeCcZ8LyKs7ek
	kj6rl74Q4AWg0CbGH67miBC9nI87Q9A2QIP72LA1cHnSXoA7g2Etjs9i5hzQ9w78
	hyxDGk9nvCFjEJgvGbM7vBsty1ZDvxHfc9YYHXW6EMekIiXefcs5MGvW4zfUvrhN
	QTz+mA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrnuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:42:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899c35447f9so38436766d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455353; x=1773060153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIKO5P6PmTvp8kuGDeHMIKG3uzkbrKKydli4TZkIbn8=;
        b=EflegyH7et4+VaYOtjeb+TnOZJvrPsAyLgIxcBX6BOa3hxlTMPdS2bG7GQ9y4nqqcA
         lXyP1CZoU+FnLmRQ1BzGtwpUgF8qwCNTDjB725vKFKUnJlITcB+NIR2vBn7OVdFe8Ty7
         PZXd+Y6UUeGxoe0/UTCKDaiDJtprvAZZdGiZxJjW2tYSjesb2QJid4livcCMqFC9q77f
         RfgvpY1YqWXoj/X8CmzDVnLlYN5ao25dHFmiwTXlmhJIXQ1JFM4PhBkexxoTfOhCmXNj
         L00IfhKSEcX0b4c+dGeWWDhRDkSSMDphz2z9wUYVs3aris/UJejdfdcKlrd50K4FHYa5
         4Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455353; x=1773060153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIKO5P6PmTvp8kuGDeHMIKG3uzkbrKKydli4TZkIbn8=;
        b=uuV+C8Z4t3QB8E9PtFJoFmvpY0b84dNSQ0ZQnVvDuhEoLwAney2prwvAbLPEUWfvEg
         8nfNh33E7qfZh8WfUTxNw/WlnCqKRBx2uvnFCTq5ukUtW4rZzUAaUPj05cl1e/9GAQ6Y
         QPXUQ4quxV7/9Ww0g9qkbt3Al8VIqdEOn5CC832B8CNafYZVLAvwQs9YEcOb+apHh080
         k5GQAaNSJQoJE7zdwIO3RhDt1QprDmSgswdzKP6ryHqDGpEp2d0aFEJg3IXh15/WmWW4
         Dq5ain4UPG5C1ZwSYn4nw4I22/g/FZnCL+jzzgw9u2i0rcLIeHe5ERWBRrpNARkx4waV
         pakA==
X-Gm-Message-State: AOJu0YwEhtHo+VXVO8DAikY+m0/a2wLIHOoN8Bv46fV2n2dPkQ4AODrY
	vCKjsQeu3XF/uTmLfoElXOqe3PR9RoKAbR/95zXZ9bAW6YUZAby2MSRJWaKFdVr9N0EL3pZbj/c
	i6z8aqeI223pD3KALPPoYikQGgGQhqoJEVmjRXBVqaWY/aflqpUBauLcuG6D3/2ck8MWG
X-Gm-Gg: ATEYQzwIeojlusqdBuANNAHE5uDMdCGTcap71g6jme8DwZnr5iKPGvmTq12Ts5QpoRN
	x7zeL6DEHyVRrISdAHKewX1ZDN6pDP9jcIt2G+NIA70MrPeJ5NOZHyuvfcQoeq//Lzx3XW3gTXt
	tMZ6yWBRX7wnFm4Ts7HPNM9nbPsNx4WE+Uw47SZPwCQqLZo/0AXQOhgxyP0SdgTrCIBCurKVwgc
	T1eBIC3SQR5TO+mNWSWM2wVyKc8LvXloyJPywZY3PHaRQK1lruXkhLM6UeJfQKTCXpE3T+FDTMg
	FSbzXIG07sj8tN8SPiMtonmfHYWJ9nq6pFOB+RT0eo+97dkRUV+AoLIJbPqhM61+OZI+cgU3hzP
	j27f+homXoVfPH0juI+vEbZk4T0Jj+ywD043G6cnoCSqEn8a88Ud/Nd1vS2Z7tA6/OuynOgNkPa
	u6dVs=
X-Received: by 2002:a05:6214:5e10:b0:899:555c:cb2a with SMTP id 6a1803df08f44-899d1e5bb1dmr127337396d6.3.1772455352598;
        Mon, 02 Mar 2026 04:42:32 -0800 (PST)
X-Received: by 2002:a05:6214:5e10:b0:899:555c:cb2a with SMTP id 6a1803df08f44-899d1e5bb1dmr127337106d6.3.1772455352166;
        Mon, 02 Mar 2026 04:42:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae93357sm460111566b.48.2026.03.02.04.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:42:31 -0800 (PST)
Message-ID: <b1ce41c9-2532-45ac-a883-2de442188d3d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:42:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/msm/dpu: drop vbif_idx from WB configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-5-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-5-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MIXujAn1IgJ3j0xm0JWD6i18GXybF8xu
X-Proofpoint-GUID: MIXujAn1IgJ3j0xm0JWD6i18GXybF8xu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX1mij0dQCyIH1
 bse79rkilKFVRCuQTTwrjZ5tq3xAEu9F5biAdwdChH2nvypiRZ6kotKPLG84p/9EukMCqr7Fisy
 VZZrRtjP+tafmP0tapWq6v8EBrVvBA2MGZrOH4zHR6OWHpENwqGn8W0j84C8LIvHa0X4E7bRkKA
 a9dure3+HdKGqWrFNLHMmH5uDPVCwhSv8yZxwbICnVAuOLHnH1XFTvqhy5N9dSGdHpdpHqH4muj
 B+QbiT4YMjBx0xmCmCB8LpC8EADmhX3nNEZ28eVYHFstlEY1/USzxj6wjkT1RwlJhIe5kN9BgEq
 sLxRCgF/CwgUycSU3SuaXV5Ulg/2k750IXpKfkxMdyBZ+DGjUen2n39ZZQYbAxmqxvTOwDxUaQk
 9A4ytlKJCeUNL2WaBRvBUovL3+yd4SUIYMDl5DR7VCHkOrMEne9CV7+yOebNcIkkYF5Z4P6zjNV
 6cfssa3fADmqIuG+9pg==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a585b9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TNk1r7c1s_7MY2k-MSMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94916-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8BEC1D9011
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> All MDP / DPU implementations except for MSM8996 use VBIF_RT (or the
> only VBIF) for WB2. Writeback on MSM8996 is not supported (nor planned
> to be supported). In order to simplify the driver, drop the field form
> the struct dpu_wb_cfg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

